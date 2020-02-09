%include "pm.inc"

org 0x7c00  ;加载程序到内存-----7c00-----处,ORG是伪指令
    jmp LABEL_BEGIN

;GDT定义
[SECTION .gdt]
;GDT属性                        段基址               段界限              段属性
LABEL_GDT:         Descriptor     0,                  0,                 0           ;空描述符
LABEL_DESC_CODE32: Descriptor     0,           SegCode32Len-1,        DA_C + DA_32   ;非一致代码段
LABEL_DESC_VIDEO:  Descriptor   0B8000h,            0ffffh,           DA_DRW         ;显存首地址
;GDT结束    

GdtLen      equ    $  -  LABEL_GDT      ;GDT长度
GdtPtr      dw     GdtLen - 1           ;GDT界限  
            dd     0                    ;GDT基地址

;GDT选择子
SelectorCode32     equ      LABEL_DESC_CODE32   -   LABEL_GDT
SelectorVideo      equ      LABEL_DESC_VIDEO    -   LABEL_GDT
;END of [SECTION .gdt]

[SECTION .s16]
[BITS 16]
LABEL_BEGIN:
    mov ax, cs  ;初始化代码段、数据段和堆栈段
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0100h

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
    mov ax, SelectorVideo
    mov gs, ax
    mov edi, (80*11+79) * 2
    mov ah, 0CH
    mov al, 'P'
    mov [gs:di], ax

;到此为止
    jmp $

SegCode32Len    equ     $ - LABEL_SEG_CODE32

;因为要保证引导扇区为512字节，所以两种方式
;1、把32位代码放置另一个地方,这就需要额外的空间，可以自己写一个写盘工具
;2、借用别人的引导扇区