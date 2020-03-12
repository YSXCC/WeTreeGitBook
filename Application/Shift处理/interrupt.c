#include "interrupt.h"
#include "windows_init.h"
#include "fifo.h"

extern ScreenInfo screen_info;
extern FIFO8 keyinfo;
extern FIFO8 mouseinfo;

static MOUSE_SEND_INFO mouse_send_info;

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

int mouse_decode(MOUSE_SEND_INFO* mouse_send_info,unsigned char data){
    if(mouse_send_info->phase == 0){
        if(data == 0xFA){
            mouse_send_info->phase = 1;
        }
        return 0;
    }

    if(mouse_send_info->phase == 1){
        if((data & 0xC8) == 0x08){
            mouse_send_info->info[0] = data;
            mouse_send_info->phase = 2;
        }
        return 0;
    }

    if(mouse_send_info->phase == 2){
        mouse_send_info->info[1] = data;
        mouse_send_info->phase = 3;
        return 0;
    }

    if(mouse_send_info->phase == 3){
        mouse_send_info->info[2] = data;
        mouse_send_info->phase  = 1;
        mouse_send_info->button = mouse_send_info->info[0] & 0x07;  //0000 0111
        mouse_send_info->x = mouse_send_info->info[1];
        mouse_send_info->y = mouse_send_info->info[2];
        if((mouse_send_info->info[0] & 0x10) != 0){                 //0001 0000 向左
            mouse_send_info->x |= 0xFFFFFF00;
        }
        if((mouse_send_info->info[0] & 0x20) != 0){                 //0010 0000 向下
            mouse_send_info->y |= 0xFFFFFF00;
        }
        mouse_send_info->y = -(mouse_send_info->y);
        return 1;
    }
    return -1;
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