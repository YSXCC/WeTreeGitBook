#include "interrupt.h"
#include "windows_init.h"

extern ScreenInfo screen_info;

void intHandlerFromC(char* esp){
    char* vram = screen_info.vram_address;
    int screen_lenth  = screen_info.screen_lenth;
    int screen_height = screen_info.screen_height;
    paint_rectangle(vram,screen_lenth,COL8_000000,0,0,32*8 - 1,15);
    paint_string(vram,screen_lenth,0,0,"PS/2 Keyboard",COL8_FFFFFF);
    for(;;){
        io_hlt();
    }
}