[map symbols hlt.map]
[SECTION .s32]
BITS 32
mov edx, 2
mov ebx, msg
int 02DH

retf

msg: DB "HelloWorld",0