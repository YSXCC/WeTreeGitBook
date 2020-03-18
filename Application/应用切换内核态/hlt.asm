[map symbols hlt.map]
[SECTION .s32]
BITS 32
mov  ax, again
push ax
mov  ax, 'C'
push ax
jmp dword 1*8:0x7691

again:
    mov  ax, fin
    push ax
    mov  ax, 'D'
    push ax
    jmp dword 1*8:0x7691
fin:
    push 1 * 8
    mov  eax, [0x6000]
    push eax
    retf