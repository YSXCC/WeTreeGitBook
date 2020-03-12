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

    task_run(task_a,0,0);
    SHEET* sheet_console =  launch_console();


    int data=0;
    int count=0;
    int counter = 0;
    int text_cursor_x = 8;
    int text_cursot_color = COL8_FFFFFF;
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
            // if(data > 0x80){
            //     continue;
            // }else 
            if(data == 0x1C){

                // show_memory_info(memoryAddr+count,count);
                // count += 1;
                // if(count > memCnt){
                //     count=0;
                // }
            }else if(data == 0x0F){ //按下Tab键
                if(key_to == 0){
                    key_to = 1;
                    make_window_title(sheet_control,sheet_win,"window",0);
                    make_window_title(sheet_control,sheet_console,"console",1);
                }else{
                    key_to = 0;
                    make_window_title(sheet_control,sheet_win,"window",1);
                    make_window_title(sheet_control,sheet_console,"console",0);
                }

                sheet_refresh(sheet_control,sheet_win,0,0,sheet_win->sheet_length,sheet_win->sheet_height);
                sheet_refresh(sheet_control,sheet_console,0,0,sheet_console->sheet_length,sheet_console->sheet_height);

            }else if(key_to == 0){  //message进程的
                if(data <= 0x80 && keytable[data] != 0 && text_cursor_x < 144){
                    paint_rectangle(sheet_win->buf,sheet_win->sheet_length,COL8_FFFFFF,text_cursor_x,28,text_cursor_x+7,43);
                    sheet_refresh(sheet_control,sheet_win,text_cursor_x,28,text_cursor_x+8,44);

                    char buf[2] = {keytable[data],0};
                    paint_string(sheet_control,sheet_win,text_cursor_x,28,buf,COL8_000000);
                    text_cursor_x += 8;

                    stop_task_a = 1;

                    paint_rectangle(sheet_win->buf,sheet_win->sheet_length,text_cursot_color,text_cursor_x,28,text_cursor_x+7,43);
                    sheet_refresh(sheet_control,sheet_win,text_cursor_x,28,text_cursor_x+8,44);

                }
            }else {
                task_sleep(task_a);
                fifo8_put(&task_console_g->fifo,data);
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
            timer_settime(timer1,100);
            pos += 8;
            if (stop_task_a == 0) {
                io_cli();
                task_sleep(task_a);
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

//控制台任务
void console_task(SHEET* sheet){
    TIMER* time;
    TASK* task = task_now();
    int i, cursor_x = 16,cursor_c = COL8_000000;
    unsigned char fifobuf[128];
    fifo8_init(&task->fifo,128,fifobuf,task);
    char str[2];

    time = timer_alloc();
    timer_init(time,&task->fifo,1);
    timer_settime(time,50);

    paint_string(sheet_control,sheet,8,28,">",COL8_FFFFFF);

    for(;;){
        io_cli();
        if(fifo8_status(&task->fifo) == 0){
            io_sti();
        }else{
            i = fifo8_get(&task->fifo);
            io_sti();
            if(i <= 1){
                if(i != 0){
                    timer_init(time,&task->fifo,0);
                    cursor_c = COL8_FFFFFF;
                }else{
                    timer_init(time,&task->fifo,1);
                    cursor_c = COL8_000000;
                }
                timer_settime(time,50);
            }else{
                if(i == 0x0E && cursor_x > 8){//退格键
                    paint_rectangle(sheet->buf,sheet->sheet_length,COL8_000000,cursor_x,28,cursor_x+7,43);
                    sheet_refresh(sheet_control,sheet,cursor_x,28,cursor_x + 8,44);
                    cursor_x -= 8;
                    paint_rectangle(sheet->buf,sheet->sheet_length,COL8_000000,cursor_x,28,cursor_x+7,43);
                    sheet_refresh(sheet_control,sheet,cursor_x,28,cursor_x + 8,44);
                }else{
                    if(cursor_x < 240 && i < 0x54 && keytable[i] != 0){
                        paint_rectangle(sheet->buf,sheet->sheet_length,COL8_000000,cursor_x,28,cursor_x+7,43);
                        sheet_refresh(sheet_control,sheet,cursor_x,28,cursor_x + 8,44);
                        str[0] = keytable[i];
                        str[1] = 0;
                        paint_string(sheet_control,sheet,cursor_x,28,str,COL8_FFFFFF);
                        
                        cursor_x += 8;
                    }
                }
            }
            
            paint_rectangle(sheet->buf,sheet->sheet_length,cursor_c,cursor_x,28,cursor_x+7,43);
            sheet_refresh(sheet_control,sheet,cursor_x,28,cursor_x+8,44);
        }
    }

}

//启动控制台
SHEET* launch_console(){
    SHEET* sht_console = sheet_alloc(sheet_control);
    unsigned char *buf_console = (unsigned char *)memman_alloc_4k(memman, 256*165);
    sheet_setbuf(sht_console,buf_console,256,165,COL8_INVISIBLE);
    make_windows(sheet_control,sht_console,"console",0);
    make_textbox(sht_console,8,28,240,128,COL8_000000);

    TASK* task_console = task_alloc();
    int addr_code32 = get_code32_addr();

    task_console->tss.ldtr = 0;
    task_console->tss.iomap = 0x40000000;
    task_console->tss.eip =  (int)((int)console_task - addr_code32);

    task_console->tss.es = 0;
    task_console->tss.cs = 1*8;
    task_console->tss.ss = 6*8;
    task_console->tss.ds = 4*8;
    task_console->tss.fs = 0;
    task_console->tss.gs = 2*8;
    task_console->tss.esp -= 4;

    *((int*)(task_console->tss.esp + 4)) = (int)sht_console;
    task_run(task_console,1,5);
    
    sheet_slide(sheet_control,sht_console,32,4);
    sheet_updown(sheet_control,sht_console,1);

    task_console_g = task_console;

    return sht_console;
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