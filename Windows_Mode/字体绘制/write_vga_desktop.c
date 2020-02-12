#include "windows_init.h"

extern ScreenInfo screen_info;
extern unsigned int VRAM_ADDRESS;

void CMain(void){
    init_screeninfo(&screen_info);
    char* vram = screen_info.vram_address;
    int screen_lenth  = screen_info.screen_lenth;
    int screen_height = screen_info.screen_height;
    init_palette();
    init_desktop(vram,screen_lenth,screen_height);
    paint_font(vram,screen_lenth,0,0,systemFont+ 'A' * 16,COL8_000000);
    paint_string(vram,screen_lenth,0,16,"HelloWorld",COL8_000000);
    for(;;){
        io_hlt();
    }
}