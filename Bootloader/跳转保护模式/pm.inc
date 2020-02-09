;定义多行宏，%macro  宏的命名  参数个数
;%1表示第一个参数   %2表示第二个参数    %3表示第三个参数
;初始化段描述寄存器
%macro Descriptor 3                             
    dw    %2  &  0FFFFh                         ;段界限1
    dw    %1  &  0FFFFh                         ;段基址1
    db   (%1 >> 16) & 0FFh                      ;段基址2
    dw   ((%2 >> 8) & 0F00h) | (%3 & 0F0FFh)    ;属性1 + 段界限2 + 属性2
    db   (%1 >> 24) & 0FFh                      ;段基址3
%endmacro


DA_32   EQU	 4000h	; 32 位段
DA_C	EQU	 98h	; 存在的只执行代码段属性值
DA_DRW	EQU	 92h	; 存在的可读写数据段属性值
DA_DRWA EQU	 93h	; 存在的已访问可读写数据段类型值
DA_386IGate EQU 8Eh ; 中断调用门
DA_LIMIT_4K	EQU	8000h	; 段界限粒度为 4K 字节

