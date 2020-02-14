org 0x7c00  ;加载程序到内存-----7c00-----处,ORG是伪指令

LOAD_ADDR  EQU  08000h  ;内核地址

readFloppy:
    mov CH, 1         ;CH 用来存储柱面号
    mov DH, 0         ;DH 用来存储磁头号
    mov CL, 1         ;CL 用来存储扇区号

    mov BX, LOAD_ADDR ;ES:BX 数据存储缓冲区

    mov AH, 0x02      ;AH = 02 表示要做的是读盘操作
    mov AL, 25        ;AL 表示要连续读取几个扇区
    mov DL, 0         ;驱动器编号，一般我们只有一个软盘驱动器，所以写死为0
    INT 0x13          ;调用BIOS中断实现磁盘读取功能
   
    JC fin            ;CF = 1时候跳转，当CF = 0表示读盘成功

    jmp LOAD_ADDR

fin:
    HLT
    jmp fin



;因为要保证引导扇区为512字节，所以两种方式
;1、把32位代码放置另一个地方,这就需要额外的空间，可以自己写一个写盘工具
;2、借用别人的引导扇区