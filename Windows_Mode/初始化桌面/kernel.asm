%include "pm.inc"

;在0x8000处指向代码
org   0x8000

VRAM_ADDRESS  dw  0      ;显存地址

jmp   LABEL_BEGIN

;GDT定义
[SECTION .gdt]
;GDT属性                        段基址       段界限       段属性
LABEL_GDT:         Descriptor     0,          0,          0            ;空描述符
LABEL_DESC_CODE32: Descriptor     0,    SegCode32Len-1, DA_C + DA_32   ;非一致代码段
LABEL_DESC_VIDEO:  Descriptor   0B8000h,    0ffffh,     DA_DRW         ;文本模式显存地址
LABEL_DESC_VRAM:   Descriptor   0A0000h,    0ffffh,     DA_DRW         ;图像模式显存地址
LABEL_DESC_DATA:   Descriptor     0,      0ffffffffh,   DA_DRW         ;数据段
;GDT结束    

GdtLen      equ    $  -  LABEL_GDT      ;GDT长度
GdtPtr      dw     GdtLen - 1           ;GDT界限  
            dd     0                    ;GDT基地址

;GDT选择子
SelectorCode32     equ      LABEL_DESC_CODE32   -   LABEL_GDT
SelectorVideo      equ      LABEL_DESC_VIDEO    -   LABEL_GDT
SelectorVram       equ      LABEL_DESC_VRAM     -   LABEL_GDT
SelectorData       equ      LABEL_DESC_DATA     -   LABEL_GDT
;END of [SECTION .gdt]

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

[SECTION .s32]
[BITS 32]
LABEL_SEG_CODE32:
    mov dword ebx,0x0A0000          ;在这里初始化显存地址,在C语言调用
    mov dword [VRAM_ADDRESS],ebx
    
    mov ax, SelectorData
    mov ds, ax
%include "ckernel.asm"

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
io_out8:
    mov edx, [esp + 4]
    mov al, [esp + 8]
    out dx, al
    ret

io_out16:
    mov edx, [esp + 4]
    mov eax, [esp + 8]
    out dx, ax
    ret

io_out32:
    mov edx, [esp + 4]
    mov eax, [esp + 8]
    out dx, eax
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