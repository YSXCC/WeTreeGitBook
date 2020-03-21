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

static TASK* task_console_g = 0; //全局的console任务
static TASK* task_main      = 0; //主进程任务
static TASK* task_a;

static int test = 100;

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

    // int address = &task_global_console;
    // paint_string(sheet_control, back_sheet, 0, 180,intToHexStr(address),COL8_FFFFFF);

    sheet_updown(sheet_control,back_sheet,0);
    sheet_updown(sheet_control,mouse_sheet,100);

    enable_mouse();

    int addr_code32 = get_code32_addr();
    SegmentDescriptor* gdt = (SegmentDescriptor* )get_addr_gdt();

    // static TSS32 tss_a,tss_b;


    task_a = task_init(memman);
    keyinfo.task = task_a;
    task_main = task_a;

    task_run(task_a,0,0);
    SHEET* sheet_console =  launch_console();


    int data=0;
    int count=0;
    int counter = 0;
    int text_cursor_x = 8;
    int text_cursor_color = COL8_FFFFFF;
    int pos = 0;

    int key_to = 0;     //表示是哪个窗口

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
            // if(data == 0x1C){
            //     show_memory_info(memoryAddr+count,count);
            //     count += 1;
            //     if(count > memCnt){
            //         count=0;
            //     }
            // }
            if(data == 0x0F){ //按下Tab键
                int msg = -1;

                if(key_to == 0){
                    key_to = 1;
                    make_window_title(sheet_control,sheet_win,"window",0);
                    make_window_title(sheet_control,sheet_console,"console",1);
                    set_cursor(sheet_control,sheet_win,text_cursor_x,28,COL8_FFFFFF);
                    msg = PROC_RESUME;

                }else{
                    key_to = 0;
                    make_window_title(sheet_control,sheet_win,"window",1);
                    make_window_title(sheet_control,sheet_console,"console",0);
                    fifo8_put(&task_console_g->fifo,0x58);
                    msg = PROC_PAUSE;
                }

                sheet_refresh(sheet_control,sheet_win,0,0,sheet_win->sheet_length,sheet_win->sheet_height);
                sheet_refresh(sheet_control,sheet_console,0,0,sheet_console->sheet_length,sheet_console->sheet_height);
                task_send_message(task_a,task_console_g,msg);

            }else if(key_to == 0){  //message进程的
                if(transfer_scancode(data) != 0 && text_cursor_x < 144){
                    paint_rectangle(sheet_win->buf,sheet_win->sheet_length,COL8_FFFFFF,text_cursor_x,28,text_cursor_x+7,43);
                    sheet_refresh(sheet_control,sheet_win,text_cursor_x,28,text_cursor_x+8,44);

                    char c = transfer_scancode(data);    
                    char buf[2] = {c,0};

                    paint_string(sheet_control,sheet_win,text_cursor_x,28,buf,COL8_000000);
                    text_cursor_x += 8;
                    stop_task_a = 1;

                    paint_rectangle(sheet_win->buf,sheet_win->sheet_length,text_cursor_color,text_cursor_x,28,text_cursor_x+7,43);
                    sheet_refresh(sheet_control,sheet_win,text_cursor_x,28,text_cursor_x+8,44);

                }
            }else if(is_special_key(data) == 0){    //不是特殊键
                fifo8_put(&task_console_g->fifo,data);
                if(fifo8_status(&keyinfo) == 0){
                    task_sleep(task_a);
                }
            }
        }else if(fifo8_status(&mouseinfo) != 0){
            show_mouse_info(sheet_control,back_sheet,mouse_sheet);
        }else if(fifo8_status(&timerinfo1) != 0){
            io_sti();
            fifo8_get(&timerinfo1);
            // paint_string(sheet_control,back_sheet,0,0,"[5 sec]",COL8_FFFFFF);
            // paint_string(sheet_control,back_sheet, 0, 176, "switch to task b", COL8_FFFFFF);
            // taskswitch10();
            // paint_string(sheet_control, back_sheet, pos, 144, "A",COL8_FFFFFF);
            // int x = task_global_console->flags;
            // char* sss = intToHexStr(x);
            // paint_string(sheet_control, back_sheet, pos, 180,sss,COL8_FFFFFF);
            // paint_string(sheet_control, back_sheet, pos, 200,intToHexStr(test),COL8_FFFFFF);
            // int address = &task_global_console;
            // paint_string(sheet_control, back_sheet, 0, 220,intToHexStr(address),COL8_FFFFFF);
            // timer_settime(timer1,100);
            // pos += 8;
            // if (stop_task_a == 0) {
            //     io_cli();
            //     task_sleep(task_a);
            // }
        }else if(fifo8_status(&timerinfo2) != 0){
            io_sti();
            fifo8_get(&timerinfo2);
            // paint_string(sheet_control,back_sheet,0,32,"[3 sec]",COL8_FFFFFF);
        }

        if(fifo8_status(&timerinfo3) != 0){
            int i = fifo8_get(&timerinfo3);
            io_sti();
            if(i != 0){
                timer_init(timer3,&timerinfo3,0);
                text_cursor_color = COL8_000000;
            }else{
                timer_init(timer3,&timerinfo3,1);
                text_cursor_color = COL8_FFFFFF;
            }
            timer_settime(timer3,50);
            if(key_to == 0){
                set_cursor(sheet_control,sheet_win,text_cursor_x,28,text_cursor_color);
            }else{
                set_cursor(sheet_control,sheet_win,text_cursor_x,28,COL8_FFFFFF);
            }
            
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

                // paint_rectangle(sht_win_b->buf, 144, COL8_C6C6C6, 24, 28, 104, 44);
                // sheet_refresh(sheet_control, sht_win_b, 24, 28, 104, 44);

                // char *p = intToHexStr(count);
                // paint_string(sheet_control, sht_win_b, 24, 28, p,COL8_FFFFFF);
            }
           
        }
     
    }
}