#ifndef _INTERRUPT_
#define _INTERRUPT_

#define PIC_MAIN_OCW2_PORT     0x20//8259A主片端口
#define PIC_SECOND_OCW2_PORT   0xA0//8259A从片端口

#define PORT_KEYDAT 0x0060  //键盘数据端口
#define PORT_KEYSTA 0x0064  //键盘状态端口
#define PORT_KEYCMD 0x0064  //键盘控制端口

#define KBC_MODE    0x47    //键盘控制器模式    0100 0111

#define KEYSTA_SEND_NOT_READY  0x02     //键盘状态端口没有就绪      0000 0010
#define KEYCMD_WRITE_MODE      0x60     //键盘控制端口至写模式      0110 0000

#define KEYCMD_SEND_TO_MOUSE   0xD4     //1101 0100     写鼠标设备命令。把紧随该命令的参数发给鼠标
#define MOUSECMD_ENABLE        0xF4     //1111 0100     鼠标激活命令


void wait_KBC_sendready();              //等待KBC（键盘控制器）确定就绪端口通信会有时间

void init_keyboard();

void enable_mouse();

void intHandlerKeyboard(char* esp); //键盘中断处理函数

void intHandlerMouse(char* esp);    //鼠标中断处理函数

#endif