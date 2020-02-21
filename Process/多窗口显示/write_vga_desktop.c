#include "windows_init.h"
#include "interrupt.h"
#include "fifo.h"
#include "to_hex_str.h"
#include "memory_util.h"
#include "windows_init.h"
#include "windows_sheet.h"
#include "timer.h"
#include "multi_task.h"

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

static SheetControl* sheet_control;
static SHEET* back_sheet;
static SHEET* mouse_sheet;

static MemoryManage* memman = (MemoryManage*)0x100000;

void task_b_main(SHEET *sht_win_b);

void CMain(void){
    init_screeninfo(&screen_info);
    char* vram = screen_info.vram_address;
    int screen_lenth  = screen_info.screen_lenth;
    int screen_height = screen_info.screen_height;

    memman_init(memman);
    memman_free(memman, 0x001080000, 0x3FEE8000);


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
    fifo8_init(&timerinfo1,8,timerbuf1,0);
    timer1 = timer_alloc();
    timer_init(timer1,&timerinfo1,1);
    timer_settime(timer1,100);

    fifo8_init(&timerinfo2,8,timerbuf2,0);
    timer2 = timer_alloc();
    timer_init(timer2,&timerinfo2,1);
    timer_settime(timer2,300);

    fifo8_init(&timerinfo3,8,timerbuf3,0);
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

    int addr_code32 = get_code32_addr();
    SegmentDescriptor* gdt = (SegmentDescriptor* )get_addr_gdt();

    static TSS32 tss_a,tss_b;
    static TASK* task_a;

    task_a = task_init(memman);
    keyinfo.task = task_a;

    unsigned char* buf_win_b;
    SHEET* sht_win_b[3];
    TASK* task_b[3];
    char task_title[6] = {'t','a','s','k',0,0};
    
    int i;
    for(i = 0; i < 2; i++){
        sht_win_b[i] = sheet_alloc(sheet_control);
        buf_win_b = (char* )memman_alloc_4k(memman,144 * 52);
        char c = 'b' + i;
        task_title[4] = c;
        sheet_setbuf(sht_win_b[i],buf_win_b,144,52,-1);
        make_windows(sheet_control,sht_win_b[i],task_title);

        task_b[i] = task_alloc();

        task_b[i]->tss.ldtr  = 0;
        task_b[i]->tss.iomap = 0x40000000;
        task_b[i]->tss.eip   = ((int)task_b_main - addr_code32);

        task_b[i]->tss.es = 0;
        task_b[i]->tss.cs = 1*8;//6 * 8;
        task_b[i]->tss.ss = 6*8;
        task_b[i]->tss.ds = 4*8;
        task_b[i]->tss.fs = 0;
        task_b[i]->tss.gs = 2*8;
        task_b[i]->tss.esp -= 8;

        *((int*)(task_b[i]->tss.esp + 4)) = (int)sht_win_b[i];
        
        task_run(task_b[i]);
    }

    sheet_slide(sheet_control,sht_win_b[0], 16, 28);
    sheet_updown(sheet_control, sht_win_b[0], 1);

    sheet_slide(sheet_control, sht_win_b[1], 160, 28);
    sheet_updown(sheet_control, sht_win_b[1], 1);

    int data=0;
    int count=0;
    int counter = 0;
    int text_cursor_x = 8;
    int text_cursot_color = COL8_FFFFFF;
    int pos = 0;


    int stop_task_a = 0;

    for(;;){
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

                stop_task_a = 1;

                paint_rectangle(sheet_win->buf,sheet_win->sheet_length,text_cursot_color,text_cursor_x,28,text_cursor_x+7,43);
                sheet_refresh(sheet_control,sheet_win,text_cursor_x,28,text_cursor_x+8,44);
            }
        }else if(fifo8_status(&mouseinfo) != 0){
            show_mouse_info(sheet_control,back_sheet,mouse_sheet);
        }else if(fifo8_status(&timerinfo1) != 0){
            io_sti();
            fifo8_get(&timerinfo1);
            // paint_string(sheet_control,back_sheet,0,0,"[5 sec]",COL8_FFFFFF);
            // paint_string(sheet_control,back_sheet, 0, 176, "switch to task b", COL8_FFFFFF);
            // taskswitch10();
            paint_string(sheet_control, back_sheet, pos, 144, "A",COL8_FFFFFF);
            timer_settime(timer1,100);
            pos += 8;
            if(pos > 40 && stop_task_a == 0){
                io_cli();
                task_sleep(task_a);
                io_sti();
            }
        }else if(fifo8_status(&timerinfo2) != 0){
            io_sti();
            fifo8_get(&timerinfo2);
            // paint_string(sheet_control,back_sheet,0,32,"[3 sec]",COL8_FFFFFF);
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

void task_b_main(SHEET *sht_win_b){
    paint_string(sheet_control,back_sheet , 0, 160, "enter task b",COL8_FFFFFF);

    FIFO8  timerinfo_b;
    char timerbuf_b[8];
    TIMER* timer_b = 0;

    int i = 0;
 
    fifo8_init(&timerinfo_b, 8, timerbuf_b,0);
    timer_b = timer_alloc();
    timer_init(timer_b, &timerinfo_b, 123);
   
    timer_settime(timer_b, 100);

    int count = 0;

    int pos = 0;
    for(;;) {
        count++;
        io_cli();
        if (fifo8_status(&timerinfo_b) == 0) {
            io_sti();
        }else {
            i = fifo8_get(&timerinfo_b);
            io_sti();
            if (i == 123) {
                paint_string(sheet_control, back_sheet, pos, 176, "B",COL8_FFFFFF);
                timer_settime(timer_b,100);
                pos += 8;

                paint_rectangle(sht_win_b->buf, 144, COL8_C6C6C6, 24, 28, 104, 44);
                sheet_refresh(sheet_control, sht_win_b, 24, 28, 104, 44);

                char *p = intToHexStr(count);
                paint_string(sheet_control, sht_win_b, 24, 28, p,COL8_FFFFFF);
            }
           
        }
     
    }
}