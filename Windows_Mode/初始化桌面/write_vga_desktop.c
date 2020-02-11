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
    for(;;){
        io_hlt();
    }
}