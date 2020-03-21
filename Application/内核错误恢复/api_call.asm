[SECTION .32]
BITS 32
call main
pop eax
retf

api_putchar:
    mov edx, 1
    mov eax, [esp + 4]
    int 02DH
    ret

%include "app.asm"