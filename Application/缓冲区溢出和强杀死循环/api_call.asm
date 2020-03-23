[map symbols api_call.map]
[SECTION .s32]
BITS 32
call main
mov edx, 4  ;返回内核
int 02DH

api_putchar:
    mov edx, 1
    mov al, [esp + 4]
    int 02DH
    ret

io_sti:
    STI
    RET

%include "app.asm"