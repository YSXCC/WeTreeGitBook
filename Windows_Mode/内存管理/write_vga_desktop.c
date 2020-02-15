#include "windows_init.h"
#include "interrupt.h"
#include "fifo.h"
#include "to_hex_str.h"
#include "memory_util.h"

extern ScreenInfo screen_info;
extern char mouse_cursor_buf[256];
extern unsigned int VRAM_ADDRESS;

extern FIFO8 keyinfo;       //键盘队列
extern FIFO8 mouseinfo;     //鼠标队列

extern int mouse_x;
extern int mouse_y;

struct demo
{
    int x;
    int y;
};


void CMain(void){
    init_screeninfo(&screen_info);
    char* vram = screen_info.vram_address;
    int screen_lenth  = screen_info.screen_lenth;
    int screen_height = screen_info.screen_height;

    init_mouse_position();

    init_palette();
    init_fifo_buf();
    init_keyboard();

    int memCnt = get_memory_block_count();
    AddrRangeDesc* memoryAddr = (AddrRangeDesc*)get_memory_address();
    io_sti();

    init_desktop(vram,screen_lenth,screen_height);
    init_mouse_cursor(mouse_cursor_buf,COL8_448CBB);
    paint_block(vram,screen_lenth,mouse_x,mouse_y,16,16,mouse_cursor_buf);

    MemoryManage* memman = (MemoryManage*)0x100000;
    memman_init(memman);
    memman_free(memman, 0x001080000, 0x3FEE8000);
    int memtotal = memman_total(memman) / (1024*1024);
    char* pMemTotal = intToHexStr(memtotal); 
    paint_string(vram, screen_lenth, 0,    0, "total mem is: ",COL8_FFFFFF);
    paint_string(vram, screen_lenth, 17*8, 0, pMemTotal,COL8_FFFFFF);
    paint_string(vram, screen_lenth, 28*8, 0,  " MB",COL8_FFFFFF);



    enable_mouse();
    int data=0;
    int count=0;
    for(;;){
        io_cli();
        if(fifo8_status(&keyinfo) + fifo8_status(&mouseinfo) == 0){
            io_stihlt();
        }else if(fifo8_status(&keyinfo) != 0){
            io_sti();
            data = fifo8_get(&keyinfo);
            if(data == 0x1C){
                show_memory_info(memoryAddr+count,count);
                count += 1;
                if(count > memCnt){
                    count=0;
                }
            }
        }else if(fifo8_status(&mouseinfo) != 0){
            show_mouse_info();
        }
    }
}