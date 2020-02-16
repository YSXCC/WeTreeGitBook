#include "windows_init.h"
#include "interrupt.h"
#include "fifo.h"
#include "to_hex_str.h"
#include "memory_util.h"
#include "windows_init.h"
#include "windows_sheet.h"

extern ScreenInfo screen_info;
extern char  mouse_cursor_buf[256];
extern char* back_buf;
extern unsigned int VRAM_ADDRESS;

extern FIFO8 keyinfo;       //键盘队列
extern FIFO8 mouseinfo;     //鼠标队列

extern int mouse_x;
extern int mouse_y;


void CMain(void){
    init_screeninfo(&screen_info);
    char* vram = screen_info.vram_address;
    int screen_lenth  = screen_info.screen_lenth;
    int screen_height = screen_info.screen_height;

    MemoryManage* memman = (MemoryManage*)0x100000;
    memman_init(memman);
    memman_free(memman, 0x001080000, 0x3FEE8000);

    SheetControl* sheet_control;
    SHEET* back_sheet  = 0;
    SHEET* mouse_sheet = 0;

    sheet_control = sheet_control_init(memman,vram,screen_lenth,screen_height);
    back_sheet  = sheet_alloc(sheet_control);
    mouse_sheet = sheet_alloc(sheet_control);

    back_buf = (char* )memman_alloc_4k(memman,screen_lenth*screen_height);

    sheet_setbuf(back_sheet,back_buf,screen_lenth,screen_height,COL8_INVISIBLE);
    sheet_setbuf(mouse_sheet,mouse_cursor_buf,16,16,COL8_INVISIBLE);

    init_mouse_position();
    init_palette();
    init_fifo_buf();
    init_keyboard();

    io_sti();

    init_desktop(back_buf,screen_lenth,screen_height);
    init_mouse_cursor(mouse_cursor_buf,COL8_INVISIBLE);

    sheet_slide(sheet_control,back_sheet,0,0);
    sheet_slide(sheet_control,mouse_sheet,mouse_x,mouse_y);

    sheet_updown(sheet_control,back_sheet,0);
    sheet_updown(sheet_control,mouse_sheet,1);

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

                // show_memory_info(memoryAddr+count,count);
                // count += 1;
                // if(count > memCnt){
                //     count=0;
                // }
            }
        }else if(fifo8_status(&mouseinfo) != 0){
            show_mouse_info(sheet_control,mouse_sheet);
        }
    }
}