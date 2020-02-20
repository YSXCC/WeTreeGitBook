#include "windows_init.h"
#include "interrupt.h"
#include "fifo.h"
#include "to_hex_str.h"
#include "memory_util.h"
#include "windows_init.h"
#include "windows_sheet.h"
#include "timer.h"

extern ScreenInfo screen_info;
extern char  mouse_cursor_buf[256];
extern char* back_buf;
extern unsigned int VRAM_ADDRESS;

extern SHEET* sheet_win;

extern char keytable[0x54];

extern FIFO8 keyinfo;       //键盘队列
extern FIFO8 mouseinfo;     //鼠标队列

extern int mouse_x;
extern int mouse_y;


static MemoryManage* memman = (MemoryManage*)0x100000;

void CMain(void){
    init_screeninfo(&screen_info);
    char* vram = screen_info.vram_address;
    int screen_lenth  = screen_info.screen_lenth;
    int screen_height = screen_info.screen_height;

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

    TIMER* timer1,* timer2,* timer3;
    static FIFO8 timerinfo1,timerinfo2,timerinfo3;
    static char timerbuf1[8], timerbuf2[8], timerbuf3[8];
    TimeControl* timerctl = get_timer_control();

    init_time_port();
    fifo8_init(&timerinfo1,8,timerbuf1);
    timer1 = timer_alloc();
    timer_init(timer1,&timerinfo1,1);
    timer_settime(timer1,500);

    fifo8_init(&timerinfo2,8,timerbuf2);
    timer2 = timer_alloc();
    timer_init(timer2,&timerinfo2,1);
    timer_settime(timer2,300);

    fifo8_init(&timerinfo3,8,timerbuf3);
    timer3 = timer_alloc();
    timer_init(timer3,&timerinfo3,1);
    timer_settime(timer3,50);

    io_sti();

    init_desktop(back_buf,screen_lenth,screen_height);
    init_mouse_cursor(mouse_cursor_buf,COL8_INVISIBLE);

    sheet_slide(sheet_control,back_sheet,0,0);
    sheet_slide(sheet_control,mouse_sheet,mouse_x,mouse_y);

    sheet_win =  message_box(sheet_control,"window");

    sheet_updown(sheet_control,back_sheet,0);
    sheet_updown(sheet_control,mouse_sheet,100);

    enable_mouse();
    int data=0;
    int count=0;
    int counter = 0;
    int text_cursor_x = 8;
    int text_cursot_color = COL8_FFFFFF;
    for(;;){
        // char* pStr = intToHexStr(timer1->timeout); 
        // paint_rectangle(sheet_win->buf,sheet_win->sheet_length,COL8_C6C6C6,40,28,119,43);
        // paint_string(sheet_control,sheet_win,40,28,pStr,COL8_000000);

        io_cli();
        if(fifo8_status(&keyinfo) + fifo8_status(&mouseinfo) 
            + fifo8_status(&timerinfo1) + fifo8_status(&timerinfo2) 
            + fifo8_status(&timerinfo3) == 0){

            io_sti();
        }else if(fifo8_status(&keyinfo) != 0){
            io_sti();
            data = fifo8_get(&keyinfo);
            if(data > 0x80){
                continue;
            }else if(data == 0x1C){

                // show_memory_info(memoryAddr+count,count);
                // count += 1;
                // if(count > memCnt){
                //     count=0;
                // }
            }else if(keytable[data] != 0 && text_cursor_x < 144){
                paint_rectangle(sheet_win->buf,sheet_win->sheet_length,COL8_FFFFFF,text_cursor_x,28,text_cursor_x+7,43);
                sheet_refresh(sheet_control,sheet_win,text_cursor_x,28,text_cursor_x+8,44);

                char buf[2] = {keytable[data],0};
                paint_string(sheet_control,sheet_win,text_cursor_x,28,buf,COL8_000000);
                text_cursor_x += 8;

                paint_rectangle(sheet_win->buf,sheet_win->sheet_length,text_cursot_color,text_cursor_x,28,text_cursor_x+7,43);
                sheet_refresh(sheet_control,sheet_win,text_cursor_x,28,text_cursor_x+8,44);
            }
        }else if(fifo8_status(&mouseinfo) != 0){
            show_mouse_info(sheet_control,back_sheet,mouse_sheet);
        }else if(fifo8_status(&timerinfo1) != 0){
            io_sti();
            fifo8_get(&timerinfo1);
            paint_string(sheet_control,back_sheet,0,0,"[5 sec]",COL8_FFFFFF);
        }else if(fifo8_status(&timerinfo2) != 0){
            io_sti();
            fifo8_get(&timerinfo2);
            paint_string(sheet_control,back_sheet,0,32,"[3 sec]",COL8_FFFFFF);
        }else if(fifo8_status(&timerinfo3) != 0){
            int i = fifo8_get(&timerinfo3);
            io_sti();
            if(i != 0){
                timer_init(timer3,&timerinfo3,0);
                text_cursot_color = COL8_000000;
            }else{
                timer_init(timer3,&timerinfo3,1);
                text_cursot_color = COL8_FFFFFF;
            }
            timer_settime(timer3,50);
            paint_rectangle(sheet_win->buf,sheet_win->sheet_length,text_cursot_color,text_cursor_x,28,text_cursor_x+7,43);
            sheet_refresh(sheet_control,sheet_win,text_cursor_x,28,text_cursor_x+8,44);
        }
    }
}