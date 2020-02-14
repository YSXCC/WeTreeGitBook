%include "pm.inc"

;在0x8000处指向代码
org   0x8000

VRAM_ADDRESS  dw  0      ;显存地址

jmp   LABEL_BEGIN

;GDT定义
[SECTION .gdt]
;GDT属性                        段基址       段界限         段属性
LABEL_GDT:         Descriptor     0,          0,            0                 ;空描述符
LABEL_DESC_CODE32: Descriptor     0,    SegCode32Len-1,   DA_C + DA_32        ;非一致代码段
LABEL_DESC_VIDEO:  Descriptor   0B8000h,    0ffffh,       DA_DRW              ;文本模式显存地址
LABEL_DESC_VRAM:   Descriptor   0A0000h,    0ffffh,       DA_DRW              ;图像模式显存地址
LABEL_DESC_DATA:   Descriptor     0,      0ffffffffh,     DA_DRW              ;数据段
LABEL_DESC_FONT:   Descriptor     0,  SystemFontLength-1, DA_DRW|DA_LIMIT_4K  ;字符段，256个字符，256*16B = 4KB
LABEL_DESC_STACK:  Descriptor     0,      TopOfStack,     DA_DRWA+DA_32
;GDT结束    

GdtLen      equ    $  -  LABEL_GDT      ;GDT长度
GdtPtr      dw     GdtLen - 1           ;GDT界限
            dd     0                    ;GDT基地址

;GDT选择子
SelectorCode32     equ      LABEL_DESC_CODE32   -   LABEL_GDT
SelectorVideo      equ      LABEL_DESC_VIDEO    -   LABEL_GDT
SelectorVram       equ      LABEL_DESC_VRAM     -   LABEL_GDT
SelectorData       equ      LABEL_DESC_DATA     -   LABEL_GDT
SelectorFont       equ      LABEL_DESC_FONT     -   LABEL_GDT
SelectorStack      equ      LABEL_DESC_STACK    -   LABEL_GDT
;END of [SECTION .gdt]

;IDT定义
[SECTION .idt]
;IDT属性
LABEL_IDT:

%rep  33       中断处理程序段内偏移          入口地址         0         属性值
    Gate        SelectorCode32,      SpuriousHandler,     0,     DA_386IGate
%endrep

;键盘中断，向量号0x21H（是由ICW2决定的）
.021H:
    Gate        SelectorCode32,      KeyboardHandler,     0,     DA_386IGate

;鼠标中断与键盘中断之间偏移了10个单位
%rep  10       中断处理程序段内偏移          入口地址         0         属性值
    Gate        SelectorCode32,      SpuriousHandler,     0,     DA_386IGate
%endrep

;鼠标中断，向量号0x2CH（是由ICW2决定的）
.02CH:
    Gate        SelectorCode32,        MouseHandler,      0,     DA_386IGate

IdtLen      equ     $ - LABEL_IDT       ;IDT长度
IdtPtr      dw      IdtLen - 1          ;IDT界限
            dd      0                   ;IDT基地址


[SECTION .s16]
[BITS 16]
LABEL_BEGIN:
    mov ax, cs  ;初始化代码段、数据段和堆栈段
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0100h

;切换显示器模式
    mov al, 0x13
    mov ah, 0
    int 0x10

;初始化32位代码段描述符
    xor eax, eax
    mov ax, cs
    shl eax, 4                              ;寻址方式是 16*cs+ip,所以要乘以4
    add eax, LABEL_SEG_CODE32               ;获取32位代码段的基址
    mov word [LABEL_DESC_CODE32 + 2], ax    ;段基址1放入描述符中
    shr eax, 16
    mov byte [LABEL_DESC_CODE32 + 4], al    ;段基址2放入描述符中
    mov byte [LABEL_DESC_CODE32 + 7], ah    ;段基址3放入描述符中

;初始化32位字体段描述符
    xor eax, eax
    mov ax, ds
    shl eax, 4                              ;寻址方式是 16*cs+ip,所以要乘以4
    add eax, LABEL_DESC_FONT                ;获取32位代码段的基址
    mov word [LABEL_DESC_FONT + 2], ax      ;段基址1放入描述符中
    shr eax, 16
    mov byte [LABEL_DESC_FONT + 4], al      ;段基址2放入描述符中
    mov byte [LABEL_DESC_FONT + 7], ah      ;段基址3放入描述符中

;为加载GDTR做准备
    xor eax, eax
    mov ax, ds
    shl eax, 4
    add eax, LABEL_GDT                      ;获得GDT基地址
    mov dword [GdtPtr + 2], eax             ;放在GdtPtr的GDT基地址

;加载GDTR
    lgdt    [GdtPtr]

;关中断
    cli

;初始化init8259A
    call init8259A

;为加载IDTR做准备
    xor eax, eax
    mov ax, ds
    shl eax, 4
    add eax, LABEL_IDT                      ;获得IDT基地址
    mov dword [IdtPtr + 2], eax             ;放在IdtPtr的GDT基地址

;加载IDTR
    lidt    [IdtPtr]

;打开地址线A20
    in al, 92h
    or al, 00000010b
    out 92h, al

;准备切换保护模式
    mov eax, cr0
    or eax, 1
    mov cr0,eax

;真正进入保护模式
    jmp dword SelectorCode32:0

;END of [SECTION .s16]

;Init 8259A
init8259A:          ;20h,21h为主片端口，A0h，A1h为从片端口
    mov al, 011h    ;0001 0001
    out 020h, al
    call io_delay

    out 0A0h, al    ;1010 0000
    call io_delay

    mov al, 020h    ;0010 0000
    out 021h, al
    call io_delay

    mov al, 028h    ;0010 1000
    out 0A1h, al
    call io_delay

    mov al, 004h    ;0000 0100
    out 021h, al
    call io_delay

    mov al, 002h    ;0000 0010
    out 0A1h, al
    call io_delay

    mov al, 001h    ;0000 0001
    out 021h, al
    call io_delay

    out 0A1h, al
    call io_delay

    mov  al, 11111001b      ;允许键盘中断
    out  021h, al
    call io_delay

    mov  al, 11101111b      ;允许鼠标中断
    out  0A1h, al
    call io_delay

    ret

;延时函数
io_delay:      ;写入端口需要一段时间，用这个延时
    nop
    nop
    nop
    nop
    ret

[SECTION .s32]
[BITS 32]
LABEL_SEG_CODE32:
    mov dword ebx,0x0A0000          ;在这里初始化显存地址,在C语言调用
    mov dword [VRAM_ADDRESS],ebx
    
    mov  ax, SelectorStack
    mov  ss, ax
    mov  esp, TopOfStack

    mov ax, SelectorData
    mov ds, ax

    sti

%include "ckernel.asm"
    jmp $

_SpuriousHandler:
SpuriousHandler  equ _SpuriousHandler - $$
    iretd

_KeyboardHandler:
KeyboardHandler  equ _KeyboardHandler - $$

    push es
    push ds
    pushad
    mov  eax, esp
    push eax

    call intHandlerKeyboard

    pop eax
    mov esp,eax
    popad
    pop  ds
    pop  es

    iretd

_MouseHandler:
MouseHandler     equ _MouseHandler - $$

    push es
    push ds
    pushad
    mov  eax, esp
    push eax

    call intHandlerMouse

    pop eax
    mov esp,eax
    popad
    pop  ds
    pop  es

    iretd

;汇编相关C语言函数
io_hlt:   ;void io_hlt(void);暂停
    HLT
    RET

io_cli:   ;void io_cli(void);关中断
    CLI
    RET
    
io_sti:   ;开中断
    STI
    RET

io_stihlt: ;开中断后暂停
    STI
    HLT
    RET

;端口输出
io_out8:                    ;EDX保存端口号，EAX保存数据
    mov edx, [esp + 4]      ;void io_out(int port, int data)
    mov al,  [esp + 8]      ;根据规定，从右边向左压栈，
    out dx, al              ;先进栈的是数据data，32位，之后是端口号，也是32位（int）
    ret                     ;al输出8位，ax输出16位，eax输出32位

io_out16:
    mov edx, [esp + 4]
    mov ax,  [esp + 8]
    out dx, ax
    ret

io_out32:
    mov edx, [esp + 4]
    mov eax, [esp + 8]
    out dx, eax
    ret

;端口读入
io_in8:
    mov  edx, [esp + 4]
    mov  eax, 0
    in   al, dx
    ret

io_in16:
    mov  edx, [esp + 4]
    mov  eax, 0
    in   ax, dx
    ret

io_in32:
    mov edx, [esp + 4]
    mov eax, 0
    in  eax, dx
    ret

io_load_eflags:           ;int  io_load_eflags(void);
    pushfd
    pop  eax
    ret

io_store_eflags:          ;void io_store_eflags(int eflags);
    mov eax, [esp + 4]
    push eax
    popfd
    ret

SegCode32Len    equ     $ - LABEL_SEG_CODE32

[SECTION .data]
[BITS 32]

LABEL_SYSTEM_FONT:
%include "fontData.inc"
SystemFontLength equ    $ - LABEL_SYSTEM_FONT

LABEL_STACK:
times 512  db 0
TopOfStack  equ  $ - LABEL_STACK