;相比于另一种就很简单，不用定义软盘结构
;为什么是0x7c00,因为DOS最开始为32KB,0x000 ~ 0x7FF,
;引导系统放到最后，本身和产生的数据占了1024字节
org 0x7c00          ;加载程序到内存-----7c00-----处,ORG是伪指令

LOAD_ADDR  EQU  08000h  ;内核地址
BUF_ADDR   EQU  07E0h   ;缓冲区地址 512字节

BaseOfStack EQU 07c00h

entry:
    mov ax, 0          ;cs是代码段,ds是数据段，es是拓展数据段。
    mov ss, ax
    mov ds, ax

    mov ax, BUF_ADDR
    mov es, ax

    mov  ax, 0
    mov  ss, ax
    mov  sp, BaseOfStack
    mov  di, ax
    mov  si, ax

    mov BX, 0          ;ES:BX 数据存储缓冲区。指向的缓冲区数据地址
    mov DH, 0          ;DH 用来存储磁头号
    mov CH, 1          ;CH 用来存储柱面号
    mov CL, 0          ;CL 用来存储扇区号

;读一次就写入07E00处
readFloppy:
    cmp          byte [load_count], 0
    je           beginLoad

    inc CL

    mov AH, 0x02      ;AH = 02 表示要做的是读盘操作
    mov AL, 1         ;AL 表示要连续读取几个扇区
    mov DL, 0         ;驱动器编号，一般我们只有一个软盘驱动器，所以写死为0
    INT 0x13          ;调用BIOS中断实现磁盘读取功能

    JC      finally

;把07E00h的内容复制给08000h
copySector:
    push si
    push di
    push cx

    mov  cx, 0200h      ;512个字节
    mov  di, 0
    mov  si, 0
    mov  ax, word [load_section]
    mov  ds, ax

copy:
    cmp  cx, 0
    je   copyEnd

    mov  al, byte [es:si]
    mov  byte [ds:di], al

    inc  di
    inc  si
    dec  cx
    jmp  copy

copyEnd:
    pop cx
    pop di
    pop si

    mov bx, ds
    add bx, 020h
    mov ax, 0
    mov ds, ax
    mov word [load_section], bx
    mov bx, 0
;end of copySector

    cmp CL, 18
    jb  readFloppy

    inc          CH
    mov          CL, 0
    dec          byte [load_count]
    jmp          readFloppy

beginLoad:
    mov  ax, 0
    mov  ds, ax
    jmp          LOAD_ADDR

load_count db 10      ;连续读取几个柱面
load_section dw 0800h

finally:
    HLT               ;暂停
    jmp     finally