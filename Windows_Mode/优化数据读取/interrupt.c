#include "interrupt.h"
#include "windows_init.h"
#include "fifo.h"

extern ScreenInfo screen_info;
extern FIFO8 keyinfo;
extern FIFO8 mouseinfo;

//因为buffer使用频繁，所以每次使用要查询状态
void wait_KBC_sendready(){
    for(;;){
        if(( io_in8(PORT_KEYSTA) & KEYSTA_SEND_NOT_READY) == 0){
            break;
        }
    }
}

void init_keyboard(){
    wait_KBC_sendready();
    io_out8(PORT_KEYCMD,KEYCMD_WRITE_MODE);     //写命令寄存器，通过60H端口进一步写入
    wait_KBC_sendready();
    io_out8(PORT_KEYDAT,KBC_MODE);
}

void enable_mouse(){
    wait_KBC_sendready();
    io_out8(PORT_KEYCMD,KEYCMD_SEND_TO_MOUSE);  //写鼠标设备命令。把紧随该命令的参数发给鼠标
    wait_KBC_sendready();
    io_out8(PORT_KEYDAT,MOUSECMD_ENABLE);       //规定，激活鼠标的命令
}

void intHandlerKeyboard(char* esp){
    unsigned char data;
    io_out8(PIC_MAIN_OCW2_PORT, 0x20);      // 0010 0000    固定优先级 一般EOI
    io_out8(PIC_SECOND_OCW2_PORT, 0x20);    // 0010 0000    固定优先级 一般EOI

    data = io_in8(PORT_KEYDAT);
    fifo8_put(&keyinfo,data);
}

void intHandlerMouse(char* esp){
    unsigned char data;
    io_out8(PIC_MAIN_OCW2_PORT, 0x20);      // 0010 0000    固定优先级 一般EOI
    io_out8(PIC_SECOND_OCW2_PORT, 0x20);    // 0010 0000    固定优先级 一般EOI

    data = io_in8(PORT_KEYDAT);
    fifo8_put(&mouseinfo,data);
}