#include "interrupt.h"
#include "windows_init.h"

extern ScreenInfo screen_info;

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
    return;
}

void enable_mouse(){
    wait_KBC_sendready();
    io_out8(PORT_KEYCMD,KEYCMD_SEND_TO_MOUSE);  //写鼠标设备命令。把紧随该命令的参数发给鼠标
    wait_KBC_sendready();
    io_out8(PORT_KEYDAT,MOUSECMD_ENABLE);       //规定，激活鼠标的命令
    return;
}

void intHandlerKeyboard(char* esp){
    char* vram = screen_info.vram_address;
    int screen_lenth  = screen_info.screen_lenth;
    int screen_height = screen_info.screen_height;
    paint_rectangle(vram,screen_lenth,COL8_000000,0,0,32*8 - 1,15);
    paint_string(vram,screen_lenth,0,0,"PS/2 Keyboard",COL8_FFFFFF);
    for(;;){
        io_hlt();
    }
}

void intHandlerMouse(char* esp){
    char* vram = screen_info.vram_address;
    int screen_lenth  = screen_info.screen_lenth;
    int screen_height = screen_info.screen_height;
    paint_rectangle(vram,screen_lenth,COL8_000000,0,16,32*8 - 1,30);
    paint_string(vram,screen_lenth,0,16,"PS/2 Mouse",COL8_FFFFFF);
    for(;;){
        io_hlt();
    }
}