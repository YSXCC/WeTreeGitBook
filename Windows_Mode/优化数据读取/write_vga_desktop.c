#include "windows_init.h"
#include "interrupt.h"
#include "fifo.h"
#include "to_hex_str.h"

extern ScreenInfo screen_info;
extern char mouse_cursor_buf[256];
extern unsigned int VRAM_ADDRESS;

extern FIFO8 keyinfo;       //键盘队列
extern FIFO8 mouseinfo;     //鼠标队列


void CMain(void){
    init_screeninfo(&screen_info);
    char* vram = screen_info.vram_address;
    int screen_lenth  = screen_info.screen_lenth;
    int screen_height = screen_info.screen_height;
    init_palette();
    init_keyboard();

    io_sti();
    init_desktop(vram,screen_lenth,screen_height);
    init_fifo_buf();
    enable_mouse();
    int data=0;
    for(;;){
        io_cli();
        if(fifo8_status(&keyinfo) + fifo8_status(&mouseinfo) == 0){
            io_stihlt();
        }else if(fifo8_status(&keyinfo) != 0){
            io_sti();
            data = fifo8_get(&keyinfo);
            char* pStr = charToHexStr(data);
            static int showPos = 0;
            paint_string(vram, screen_lenth, showPos, 0, pStr, COL8_FFFFFF);
            showPos += 32; 
        }else if(fifo8_status(&mouseinfo) != 0){
            show_mouse_info(vram,screen_lenth,screen_height);
        }
    }
}