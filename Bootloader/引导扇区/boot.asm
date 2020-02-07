org 0x7c00  ;加载程序到内存-----7c00-----处,ORG是伪指令
    mov ax, cs  ;初始化代码段和数据段
    mov ds, ax
    mov es, ax
    call entry
    jmp $       ;死循环
entry:
    mov ax, PrintMsg    ;打印字符串，调用10H中断
    mov bp, ax
    mov cx, 16
    mov ax, 01301h
    mov bx, 000ch
    mov dl, 0
    int 10h
    ret
PrintMsg:       db "Hello,WeTreeOS!!"
times	510 - ($ - $$)    db 0
db  0x55    ;一定要注意高低地址，不要写反了
db  0xaa