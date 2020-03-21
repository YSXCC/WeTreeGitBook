#include "windows_init.h"
#include "fifo.h"
#include "to_hex_str.h"
#include "timer.h"
#include "file_system.h"

static ScreenInfo screen_info;       //屏幕的信息，包括长宽和显存地址
static CONSOLE g_Console;            //控制台
static char  mouse_cursor_buf[256];  //鼠标颜色信息，其中存放的是颜色索引
static char* back_buf;               //屏幕颜色信息

static SHEET* sheet_win;

static int mouse_x = 0;     //鼠标横坐标
static int mouse_y = 0;     //鼠标纵坐标

static char keytable[0x80] = {
         0 ,  0 , '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' , '-', '=',   0 ,  0 ,
		'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', '[', ']' ,  0 ,  0 ,  'A', 'S',
		'D', 'F', 'G', 'H', 'J', 'K', 'L', ';', ',', '`',  0 , '\\', 'Z', 'X',  'C', 'V',
		'B', 'N', 'M', ',', '.', '/',  0 ,  0 ,  0 , ' ',  0 ,  0  ,  0 ,  0 ,   0 ,  0 ,
		 0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 , '-',  0  ,  0 , '+',   0 ,  0 ,
		 0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0  ,  0 ,  0 ,   0 ,  0 ,
         0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0  ,  0 ,  0 ,   0 ,  0 ,
         0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0  ,  0 ,  0 ,   0 ,  0 
};  //键盘通码对应字符

static char keytable_shift[0x80] = {
         0 ,  0 , '!', '@', '#', '$', '%', '^', '&', '*', '(', ')' , '_', '+',   0 ,  0 ,
		'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', '{', '}' ,  0 ,  0 ,  'A', 'S',
		'D', 'F', 'G', 'H', 'J', 'K', 'L', ':', '"', '~',  0 , '|' , 'Z', 'X',  'C', 'V',
		'B', 'N', 'M', '<', '>', '?',  0 ,  0 ,  0 ,  0 ,  0 ,  0  ,  0 ,  0 ,   0 ,  0 ,
		 0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 , '-',  0  ,  0 , '+',   0 ,  0 ,
		 0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0  ,  0 ,  0 ,   0 ,  0 ,
         0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0  ,  0 ,  0 ,   0 ,  0 ,
         0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0 ,  0  ,  0 ,  0 ,   0 ,  0  
};

static int key_shift = 0;   //0表示没有shift按下，1表示左shift按下，2表示右shift按下
static int caps_lock = 0;   //0表示没有caps_lock按下，1表示caps_lock按下

static BUFFER buffer;       //Application内容信息缓存的地方

extern FIFO8 keyinfo;       //键盘队列
extern char  keybuf[32];

extern FIFO8 mouseinfo;     //鼠标队列
extern char  mousebuf[128]; 

extern unsigned int VRAM_ADDRESS;   //定义在kernel.asm的变量

extern MOUSE_SEND_INFO mouse_send_info;

extern MemoryManage* memman;

extern TASK* task_a;
extern TASK* task_console_g; //全局的console任务
extern TASK* task_main;

extern SheetControl* sheet_control;

extern SHEET* back_sheet;

//初始化屏幕信息
void init_screeninfo(ScreenInfo* screeninfo){
    screeninfo->vram_address  = (unsigned char*)VRAM_ADDRESS;
    // screeninfo->screen_lenth  = 320;
    // screeninfo->screen_height = 200;
    screeninfo->screen_lenth  = 640;
    screeninfo->screen_height = 480;
}

//初始化调色板信息
void init_palette(void) {
    static  unsigned char table_rgb[16 *3] = {
        0x00,  0x00,  0x00,     //全黑
        0xff,  0x00,  0x00,     //纯红
        //0x00,  0xff,  0x00,   //亮绿
        0x44,  0x8c,  0xbb,     //不知道什么，但是看起来很舒服
        0xff,  0xff,  0x00,     //亮黄
        0x00,  0x00,  0xff,     //亮蓝
        0xff,  0x00,  0xff,     //亮紫
        0x00,  0xff,  0xff,     //浅亮
        0xff,  0xff,  0xff,     //全白
        0xc6,  0xc6,  0xc6,     //亮灰
        0x84,  0x00,  0x00,     //暗红
        0x00,  0x84,  0x00,     //暗绿
        0x84,  0x84,  0x00,     //暗黄
        0x00,  0x00,  0x84,     //暗蓝
        0x84,  0x00,  0x84,     //暗紫
        0x00,  0x84,  0x84,     //浅暗蓝
        0x84,  0x84,  0x84,     //暗灰
    };
    set_palette(0, 15, table_rgb);
    return ;
}

//向端口输出调色板信息
void set_palette(int start, int end, unsigned char *rgb){
    int i, eflages;
    eflages = io_load_eflags();
    io_cli();
    io_out8(0x03c8,start);              //调色板编号
    for(i = start; i <= end ; i++){
        io_out8(0x03c9, rgb[0]/4);      //VGA显卡还支持不了这么多颜色，只能4个一跳
        io_out8(0x03c9, rgb[1]/4);
        io_out8(0x03c9, rgb[2]/4);

        rgb += 3;
    }
    io_store_eflags(eflages);
    return  ;
}

//画一个纯色的矩形
void paint_rectangle(unsigned char* vram, int screen_lenth, unsigned char color, //画一个矩形
    int left_up_x, int left_up_y,                         //varm是需要填充的区域
    int right_down_x, int right_down_y){
    
    int x,y;
    for(y = left_up_y; y <= right_down_y; y++){
        for(x = left_up_x; x <= right_down_x; x++){
            vram[y * screen_lenth + x] = color;
        }
    }
}

//初始化桌面
void init_desktop(unsigned char* vram,int screen_lenth,int screen_height){
    paint_rectangle(vram, screen_lenth, COL8_448CBB, 0,  0,                screen_lenth-1, screen_height-29);
    paint_rectangle(vram, screen_lenth, COL8_C6C6C6, 0,  screen_height-28, screen_lenth-1, screen_height-28);
    paint_rectangle(vram, screen_lenth, COL8_FFFFFF, 0,  screen_height-27, screen_lenth-1, screen_height-27);
    paint_rectangle(vram, screen_lenth, COL8_C6C6C6, 0,  screen_height-26, screen_lenth-1, screen_height-1);
    
    paint_rectangle(vram, screen_lenth, COL8_FFFFFF, 3,  screen_height-24, 59, screen_height-24);
    paint_rectangle(vram, screen_lenth, COL8_FFFFFF, 2,  screen_height-24, 2,  screen_height-4);
    paint_rectangle(vram, screen_lenth, COL8_448CBB, 3,  screen_height-4,  59, screen_height-4);
    paint_rectangle(vram, screen_lenth, COL8_448CBB, 59, screen_height-23, 59, screen_height-5);
    paint_rectangle(vram, screen_lenth, COL8_000000, 2,  screen_height-3,  59, screen_height-3);
    paint_rectangle(vram, screen_lenth, COL8_000000, 60, screen_height-24, 60, screen_height-3);

    paint_rectangle(vram, screen_lenth, COL8_448CBB, screen_lenth-47, screen_height-24, screen_lenth-4,  screen_height-24);
    paint_rectangle(vram, screen_lenth, COL8_448CBB, screen_lenth-47, screen_height-23, screen_lenth-47, screen_height-4);
    paint_rectangle(vram, screen_lenth, COL8_FFFFFF, screen_lenth-47, screen_height-3,  screen_lenth-4,  screen_height-3);
    paint_rectangle(vram, screen_lenth, COL8_FFFFFF, screen_lenth-3,  screen_height-24, screen_lenth-3,  screen_height-3);
}

//初始化鼠标位置
void init_mouse_position(){
    int screen_lenth  = screen_info.screen_lenth;
    int screen_height = screen_info.screen_height;
    mouse_x = (screen_lenth - 16) / 2;
    mouse_y = (screen_height - 28 - 16) / 2;
}

//画一个字
void paint_font(unsigned char* vram, int screen_lenth, int start_x,int start_y,char* font,char color){
    //8*16大小的字体
    int i;
    unsigned char c;

    for(i = 0;i < 16;i++){  //16行
        c = font[i];
        if( (c & 0x80) != 0 ){  vram[(start_y+i) * screen_lenth + start_x + 0] = color ;}
        if( (c & 0x40) != 0 ){  vram[(start_y+i) * screen_lenth + start_x + 1] = color ;}
        if( (c & 0x20) != 0 ){  vram[(start_y+i) * screen_lenth + start_x + 2] = color ;}
        if( (c & 0x10) != 0 ){  vram[(start_y+i) * screen_lenth + start_x + 3] = color ;}
        if( (c & 0x08) != 0 ){  vram[(start_y+i) * screen_lenth + start_x + 4] = color ;}
        if( (c & 0x04) != 0 ){  vram[(start_y+i) * screen_lenth + start_x + 5] = color ;}
        if( (c & 0x02) != 0 ){  vram[(start_y+i) * screen_lenth + start_x + 6] = color ;}
        if( (c & 0x01) != 0 ){  vram[(start_y+i) * screen_lenth + start_x + 7] = color ;}
    }
}

//画字符串
void paint_string(SheetControl* stl,SHEET* sheet,int start_x,int start_y,char* str,char color){
    int begin = start_x;
    for(; *str != 0x00; str++){
        paint_font(sheet->buf,sheet->sheet_length,start_x,start_y,systemFont+ *str * 16 ,color);
        start_x += 8;
    }
    sheet_refresh(stl,sheet,begin,start_y,start_x,start_y+16);
}

//初始化鼠标的形状和大小
void init_mouse_cursor(char* mouse,char back_color){
    static char cursor[16][16] = {
    "*...............",
	"**..............",
	"*O*.............",
	"*OO*............",
	"*OOO*...........",
	"*OOOO*..........",
	"*OOOOO*.........",
	"*OOOOOO*........",
	"*OOOOOOO*.......",
	"*OOOO*****......",
	"*OO*O*..........",
	"*O*.*O*.........",
	"**..*O*.........",
	"*....*O*........",
	".....*O*........",
	"......*........."
    };
    int row;     //行
    int column;  //列
    for(row = 0; row < 16; row++){
        for(column = 0; column < 16; column++){
            if(cursor[row][column] == '*'){         //'*'是黑色的
                mouse[row*16 + column] = COL8_000000;
            }else if(cursor[row][column] == 'O'){   //'O'是白色的
                mouse[row*16 + column] = COL8_FFFFFF;
            }else{
                mouse[row*16 + column] = back_color;//其他是背景色
            }
        }
    }
}

//画一个自己规定各种颜色都可以有的矩形
void paint_block(char* vram,int screen_lenth,
    int start_x,int start_y,
    int x_size, int y_size,
    char* buf){

    int row;
    int column;
    for(row = 0 ; row < y_size; row++){
        for(column = 0; column < x_size; column++){
            vram[(screen_lenth * (start_y + row)) + (start_x + column)] = buf[(row * x_size) + column];
        }
    }
}

//初始化各个队列
void init_fifo_buf(){
    fifo8_init(&mouseinfo,128,mousebuf,0);
    fifo8_init(&keyinfo,32,keybuf,0);
}

//计算移动之后的鼠标位置
void compute_mouse_position(SheetControl* stl,SHEET* sheet, MOUSE_SEND_INFO* mouse_send_info){
    mouse_x += mouse_send_info->x;
    mouse_y += mouse_send_info->y;
    if(mouse_x < 0){
        mouse_x = 0;
    }

    if(mouse_y < 0){
        mouse_y = 0;
    }

    if(mouse_x > screen_info.screen_lenth - 16){
        mouse_x = screen_info.screen_lenth - 16;
    }

    if(mouse_y > screen_info.screen_lenth - 16){
        mouse_y = screen_info.screen_lenth - 16;
    }
    // paint_string(stl,sheet,0,0,"improve string showing",COL8_FFFFFF);
}

//根据中断不断地画鼠标
void show_mouse_info(SheetControl* sheet_control,SHEET* back_sheet,SHEET* mouse_sheet){
    unsigned char data = 0;
    io_sti();
    data = fifo8_get(&mouseinfo);

    if(mouse_decode(&mouse_send_info,data) != 0){
        // eraser_mouse();
        compute_mouse_position(sheet_control,back_sheet,&mouse_send_info);
        // draw_mouse(sheet_control,mouse_sheet);
        sheet_slide(sheet_control,mouse_sheet,mouse_x,mouse_y);
        if((mouse_send_info.button & 0x01) != 0){
            sheet_slide(sheet_control,sheet_win,mouse_x - 80,mouse_y - 8);
        }
    }
}

//展示内存信息
void show_memory_info(SheetControl* stl,SHEET* sheet,AddrRangeDesc * addr_range_desc,int page){
    int x = 0, y = 0, gap = 13*8;
    char* vram = screen_info.vram_address;
    int screen_lenth  = screen_info.screen_lenth;
    int screen_height = screen_info.screen_height;

    init_desktop(sheet->buf,screen_lenth,screen_height);

    paint_string(stl,sheet,x,y,"page is: ",COL8_FFFFFF);
    char* pPageCnt = (char*)intToHexStr(page);
    paint_string(stl,sheet, gap, y,pPageCnt, COL8_FFFFFF);
    y += 16;

    paint_string(stl,sheet,x,y,"BaseAddrL: ",COL8_FFFFFF);
    char* pBaseAddrL = (char*)intToHexStr(addr_range_desc->baseAddrLow);
    paint_string(stl,sheet, gap, y,pBaseAddrL, COL8_FFFFFF);
    y += 16;

    paint_string(stl,sheet,x,y,"BaseAddrH: ",COL8_FFFFFF);
    char* BaseAddrH = (char*)intToHexStr(addr_range_desc->baseAddrHigh);
    paint_string(stl,sheet, gap, y,BaseAddrH, COL8_FFFFFF);
    y += 16;

    paint_string(stl,sheet,x,y,"lengthLow: ",COL8_FFFFFF);
    char* pLengthLow = (char*)intToHexStr(addr_range_desc->lengthLow);
    paint_string(stl,sheet, gap, y,pLengthLow, COL8_FFFFFF);
    y += 16;

    paint_string(stl,sheet,x,y,"lengthHigh: ",COL8_FFFFFF);
    char* lengthHigh = (char*)intToHexStr(addr_range_desc->lengthHigh);
    paint_string(stl,sheet, gap, y,lengthHigh, COL8_FFFFFF);
    y += 16;

    paint_string(stl,sheet,x,y,"type: ",COL8_FFFFFF);
    char* type = (char*)intToHexStr(addr_range_desc->type);
    paint_string(stl,sheet, gap, y,type, COL8_FFFFFF);
    y += 16;
}

//画一个消息框
SHEET* message_box(SheetControl* stl,char* title){
    SHEET* sheet_win;
    unsigned char* buf_win;

    sheet_win = sheet_alloc(stl);
    buf_win = (unsigned char*)memman_alloc_4k(memman,160*68);
    sheet_setbuf(sheet_win,buf_win,160,68,COL8_INVISIBLE);

    make_windows(stl,sheet_win,title,1);
    make_textbox(sheet_win, 8, 28, 144, 16, COL8_FFFFFF);    

    // paint_string(stl,sheet_win,24,28,"Welcome to",COL8_000000);
    // paint_string(stl,sheet_win,24,44,"WeTreeOS",COL8_000000);

    sheet_slide(stl,sheet_win,260,172);
    sheet_updown(stl,sheet_win,2);
    return sheet_win;
}

//绘制文本框
void make_textbox(SHEET* sheet,int start_x,int start_y,int length,int height,int color){
    int end_x = start_x + length;
    int end_y = start_y + height;
    paint_rectangle(sheet->buf, sheet->sheet_length, COL8_848484, start_x - 2, start_y - 3, end_x + 1  , start_y - 3);
    paint_rectangle(sheet->buf, sheet->sheet_length, COL8_848484, start_x - 3, start_y - 3, start_x - 3, end_y + 1  );
    paint_rectangle(sheet->buf, sheet->sheet_length, COL8_FFFFFF, start_x - 3, end_y + 2  , end_x + 1  , end_y + 2  );
    paint_rectangle(sheet->buf, sheet->sheet_length, COL8_FFFFFF, end_x + 2,   start_y - 3, end_x + 2  , end_y + 2  );
    paint_rectangle(sheet->buf, sheet->sheet_length, COL8_000000, start_x - 1, start_y - 2, end_x + 0  , start_y - 2);
    paint_rectangle(sheet->buf, sheet->sheet_length, COL8_000000, start_x - 2, start_y - 2, start_x - 2, end_y + 0  );
    paint_rectangle(sheet->buf, sheet->sheet_length, COL8_C6C6C6, start_x - 2, end_y + 1  , end_x + 0  , end_y + 1  );
    paint_rectangle(sheet->buf, sheet->sheet_length, COL8_C6C6C6, end_x + 1  , start_y - 2, end_x + 1  , end_y + 1  );
    paint_rectangle(sheet->buf, sheet->sheet_length, color,       start_x - 1, start_y - 1, end_x + 0  , end_y + 0  ); 
}

//画一个窗口
void make_windows(SheetControl* stl,SHEET* sheet,char* title,char active){

    int sheet_length = sheet->sheet_length;
    int sheet_height = sheet->sheet_height;
    paint_rectangle(sheet->buf, sheet_length, COL8_C6C6C6, 0, 0, sheet_length - 1, 0);
    paint_rectangle(sheet->buf, sheet_length, COL8_FFFFFF, 1, 1, sheet_length - 2, 1);
    paint_rectangle(sheet->buf, sheet_length, COL8_C6C6C6, 0, 0, 0, sheet_height - 1);
    paint_rectangle(sheet->buf, sheet_length, COL8_FFFFFF, 1, 1, 1, sheet_height - 1);
    paint_rectangle(sheet->buf, sheet_length, COL8_848484, sheet_length - 2, 1, sheet_length - 2, sheet_height - 2);
    paint_rectangle(sheet->buf, sheet_length, COL8_000000, sheet_length - 1, 0, sheet_length - 1, sheet_height - 1);
    paint_rectangle(sheet->buf, sheet_length, COL8_C6C6C6, 2, 2, sheet_length - 3, sheet_height - 3);
    paint_rectangle(sheet->buf, sheet_length, COL8_000084, 3, 3, sheet_length - 4, 20);
    paint_rectangle(sheet->buf, sheet_length, COL8_848484, 1, sheet_height - 2, sheet_length - 2, sheet_height - 2);
    paint_rectangle(sheet->buf, sheet_length, COL8_000000, 0, sheet_height - 1, sheet_length - 1, sheet_height - 1);

    make_window_title(stl,sheet,title,active);

}

//切换窗口颜色变化
void make_window_title(SheetControl* stl,SHEET* sheet,char* title,char active){
    static char closebtn[14][16] = {
		"OOOOOOOOOOOOOOO@", 
		"OQQQQQQQQQQQQQ$@",
		"OQQQQQQQQQQQQQ$@",
		"OQQQ@@QQQQ@@QQ$@",
		"OQQQQ@@QQ@@QQQ$@",
		"OQQQQQ@@@@QQQQ$@",
		"OQQQQQQ@@QQQQQ$@",
		"OQQQQQ@@@@QQQQ$@",
		"OQQQQ@@QQ@@QQQ$@",
		"OQQQ@@QQQQ@@QQ$@",
		"OQQQQQQQQQQQQQ$@",
		"OQQQQQQQQQQQQQ$@",
		"O$$$$$$$$$$$$$$@",
		"@@@@@@@@@@@@@@@@"
	};
    int x,y;
    char c;
    char text_color;
    char title_back_color;
    if(active != 0){
        text_color = COL8_FFFFFF;
        title_back_color = COL8_000084;
    }else{
        text_color = COL8_C6C6C6;
        title_back_color = COL8_848484;
    }

    paint_rectangle(sheet->buf,sheet->sheet_length,title_back_color,3,3,sheet->sheet_length - 4, 20);
    paint_string(stl, sheet, 24, 4, title,text_color);
    
    for (y = 0; y < 14; y++) {
        for (x = 0; x < 16; x++) {
            c = closebtn[y][x];
            if (c == '@') {
                c = COL8_000000;
            } else if (c == '$') {
                c = COL8_848484;
            } else if (c == 'Q') {
                c = COL8_C6C6C6;
            } 
            else {
                c = COL8_FFFFFF;
            }

            sheet->buf[(5+y) * sheet->sheet_length + (sheet->sheet_length - 21 + x)] = c;
        }
 
    }
}

//对Shift键进行处理转码
char transfer_scancode(int data){
    if(data == 0x2A){   //左Shift按下
        key_shift |= 1;
    }

    if(data == 0x36){   //右Shift按下
        key_shift |= 2;
    }

    if(data == 0xAA){   //左Shift弹起
        key_shift &= ~1;
    }

    if(data == 0xB6){   //右Shift弹起
        key_shift &= ~2;
    }

    if(data == 0x3A){
        if(caps_lock == 0){
            caps_lock = 1;
        }else{
            caps_lock = 0;
        }
    }

    if(data == 0x2A || data == 0x36 || data == 0xAA || 
       data == 0xB6 || data >= 0x80 || data == 0x3A){   //顺便处理断码
        return 0;
    }

    char c = 0;
    
    if(key_shift == 0 && data < 0x80 && keytable[data] != 0){
        c = keytable[data];
        if('A' <= c && c <= 'Z' && caps_lock == 0){
            c += 0x20;
        }
    }else if(key_shift != 0 && data < 0x54 && keytable_shift[data] != 0){
        c = keytable_shift[data];
    }else{
        c = 0;
    }

    return c;
    
}   

//判断是否特殊键 ////开启了CAPS LOCK（大写）
int is_special_key(int data){
    transfer_scancode(data);

    if(data == 0x2A || data == 0x36 || data == 0xAA || 
       data == 0xB6 || data == 0x3A || data == 0xBA){
           return 1;
    }
    
    return 0;
}

//控制台任务
void console_task(SHEET* sheet,int memorytotal){

    FileInfo* file_info = (FileInfo* )(ADDRESS_DISK_IMG); 

    TIMER* time;
    TASK* task = task_now();
    int data, cursor_x = 16, cursor_y = 28,cursor_c = COL8_000000;

    int x = 0;
    int y = 0;

    g_Console.sheet = sheet;
    g_Console.cursor_x = 16;
    g_Console.cursor_y = 28;
    g_Console.cursor_c = -1;

    int* fifobuf  = (int*)memman_alloc(memman, 128);
    char* cmdline = (char*)memman_alloc(memman, 30);


    fifo8_init(&task->fifo,128,(unsigned char*)fifobuf,task);

    time = timer_alloc();
    timer_init(time,&task->fifo,1);
    timer_settime(time,50);

    paint_string(sheet_control,sheet,8,28,">",COL8_FFFFFF);

    for(;;){
        io_cli();
        if(fifo8_status(&task->fifo) == 0){
            io_sti();
        }else{
            data = fifo8_get(&task->fifo);
            io_sti();
            if(data <= 1 && cursor_c >= 0){      //取的是timer的标志码
                if(data != 0){
                    timer_init(time,&task->fifo,0);
                    cursor_c = COL8_FFFFFF;
                }else{
                    timer_init(time,&task->fifo,1);
                    cursor_c = COL8_000000;
                }
                timer_settime(time,50);
            }else if(data == PROC_RESUME){
                cursor_c = COL8_FFFFFF;
                timer_init(time,&task->fifo,0);
                timer_settime(time,50);
            }else if(data == PROC_PAUSE){
                set_cursor(sheet_control,sheet,g_Console.cursor_x,g_Console.cursor_y,COL8_000000);
                cursor_c = -1;
                task_run(task_main,-1,0);
            }else if(data == 0x0E && g_Console.cursor_x > 16){//退格键
                set_cursor(sheet_control,g_Console.sheet,g_Console.cursor_x,g_Console.cursor_y,COL8_000000);
                g_Console.cursor_x -= 8;
                set_cursor(sheet_control,g_Console.sheet,g_Console.cursor_x,g_Console.cursor_y,COL8_000000);
            }else if(data == KEY_RETURN){   //回车键
                set_cursor(sheet_control,sheet,g_Console.cursor_x,g_Console.cursor_y,COL8_000000);
                cmdline[g_Console.cursor_x / 8 - 2] = 0;
                g_Console.cursor_y = console_new_line(g_Console.cursor_y,sheet);
                g_Console.cursor_x = 16;
                //判断是否是”mem“指令
                if(strcmp(cmdline,"mem") == 1){
                    command_mem(memorytotal);
                }else if(strcmp(cmdline,"cls") == 1){
                    command_cls();
                }else if(strcmp(cmdline,"dir") == 1){
                    command_dir();
                }else if(cmdline[0] == 't' && cmdline[1] == 'y' && cmdline[2] == 'p' && cmdline[3] == 'e'){
                    command_type(cmdline);
                }else if(strcmp(cmdline,"hlt") == 1){
                    command_hlt();
                }

            }else{
                char c = transfer_scancode(data);
                if(c != 0 && g_Console.cursor_x < 240){
                    cmdline[g_Console.cursor_x / 8 - 2] = c;
                    cmdline[g_Console.cursor_x / 8 - 1] = 0;
                    c_console_putchar(c,1);
                }
            }
            
            if(cursor_c >= 0){
                set_cursor(sheet_control,sheet,g_Console.cursor_x,g_Console.cursor_y,cursor_c);
            }
        }
    }

}

//command_mem
void command_mem(int memorytotal){    
    char* s = intToHexStr(memorytotal/(1024));
    paint_string(sheet_control,g_Console.sheet,16, g_Console.cursor_y, "free ",COL8_FFFFFF);
    paint_string(sheet_control,g_Console.sheet,52, g_Console.cursor_y, s   , COL8_FFFFFF);
    paint_string(sheet_control,g_Console.sheet,126,g_Console.cursor_y, " KB",COL8_FFFFFF);
    g_Console.cursor_y = console_new_line(g_Console.cursor_y, g_Console.sheet);
}

//command_cls
void command_cls(){
    int x = 8;
    int y = 28;
    for(y = 28;y < 28 + 128; y++){
        for(x = 8; x < 8 + 240; x++){
            g_Console.sheet->buf[x + y * g_Console.sheet->sheet_length] = COL8_000000;
        }
    }
    sheet_refresh(sheet_control,g_Console.sheet,8, 28, 8+240, 28+128);
    g_Console.cursor_y = 28;
    paint_string(sheet_control,g_Console.sheet,8,28,">",COL8_FFFFFF);
}

//command_dir
void command_dir(){
    FileInfo* file_info = (FileInfo* )(ADDRESS_DISK_IMG); 
    char* file_name = (char*)memman_alloc(memman,13); //名字加拓展
    file_name[12] = 0;
    while(file_info->name[0] != 0){
        int name_index;
        for(name_index = 0;name_index < 8;name_index++){    //取文件名
            if(file_info->name[name_index] != 0){
                file_name[name_index] = file_info->name[name_index];
            }else{
                break;
            }
        }
        int ext_index;
        file_name[name_index] = '.';
        name_index++;

        for(ext_index = 0;ext_index < 3;ext_index++){    //取拓展名
        file_name[name_index] = file_info->ext[ext_index];
            name_index++;
        }
                        
        file_name[name_index] = 0;

        paint_string(sheet_control,g_Console.sheet,16,g_Console.cursor_y,file_name,COL8_FFFFFF);
        int offset = 16 + 8 * 15;
        char* file_size = intToHexStr(file_info->size);
        paint_string(sheet_control,g_Console.sheet,offset,g_Console.cursor_y,file_size,COL8_FFFFFF);
        g_Console.cursor_y = console_new_line(g_Console.cursor_y,g_Console.sheet);
        file_info++;
    }
    memman_free(memman,(unsigned int)file_name,13);
}

//command_type
void command_type(char* cmdline){   //-fno-stack-protector 在Makefile中取消栈保护
    FileInfo* file_info = (FileInfo* )(ADDRESS_DISK_IMG); 
    char* name = (char*)memman_alloc(memman,13);
    name[12] = 0;
    int p = 0;
    int x = 5;
    for(x = 5;x < 17;x++){
        if(cmdline[x] != 0){
            name[p] = cmdline[x];
            p++;
        }else{
            break;
        }
    }
    name[p] = 0;

    while(file_info->name[0] != 0){ //循环中的file_name会有栈保护机制，改为指针就ok
        char file_name[13]; //名字加拓展
        file_name[12] = 0;
        int name_index;
        for(name_index = 0;name_index < 8;name_index++){    //取文件名
            if(file_info->name[name_index] != 0){
                file_name[name_index] = file_info->name[name_index];
            }else{
                break;
            }
        }

        int ext_index;
        file_name[name_index] = '.';
        name_index++;

        for(ext_index = 0;ext_index < 3;ext_index++){    //取拓展名
            file_name[name_index] = file_info->ext[ext_index];
            name_index++;
        }
                        
        file_name[name_index] = 0;

        if(strcmp(name,file_name) == 1){
            char* p = (char*)FILE_CONTENT_HEAD_ADDRESS;
            p += file_info->clustno * DISK_SECTOR_SIZE;
            int size = file_info->size;
            char c[2];
            int t = 0;
            g_Console.cursor_x = 16;
            for(t = 0; t < size;t++){
                c[0] = p[t];
                c[1] = 0;
                if(c[0] == 0x09){   //水平制表符
                    for(;;){
                        paint_string(sheet_control,g_Console.sheet,g_Console.cursor_x,g_Console.cursor_y," ",COL8_FFFFFF);
                        g_Console.cursor_x += 8;
                        
                        if(g_Console.cursor_x == 8 + 240){
                            g_Console.cursor_x = 8;
                            g_Console.cursor_y = console_new_line(g_Console.cursor_y,g_Console.sheet);
                        }

                        if((g_Console.cursor_x - 8) & 0x1F == 0) {
                            break;
                        }
                    }
                }else if(c[0] == 0x0A){     //LF换行键
                    g_Console.cursor_x = 8;
                    g_Console.cursor_y = console_new_line(g_Console.cursor_y,g_Console.sheet); 
                }else if(c[0] == 0x0D){     //CR回车键
                    //do nothing
                }else{
                    paint_string(sheet_control,g_Console.sheet,g_Console.cursor_x,g_Console.cursor_y,c,COL8_FFFFFF);
                    g_Console.cursor_x += 8;
                    if(g_Console.cursor_x == (8 + 240)){
                        g_Console.cursor_x = 16;
                        g_Console.cursor_y = console_new_line(g_Console.cursor_y,g_Console.sheet);
                    }
                }
            }
            break;
        }
                        
        file_info++;

    }
    g_Console.cursor_y = console_new_line(g_Console.cursor_y,g_Console.sheet);
    g_Console.cursor_x = 16;
    memman_free(memman,(unsigned int)name,13);
}

//command_hlt
void command_hlt(){
    file_load_content("hlt.exe",&buffer);
    SegmentDescriptor * gdt = (SegmentDescriptor *)get_addr_gdt();
    segment_descriptor(gdt+11, 0X0FFFFF, (int)buffer.pBuffer, 0x4098);//代码段
    // segment_descriptor(gdt+19,0X0FFFFF,(int)buffer.pBuffer,0x4098);
    // farjmp(0,19*8);
    //switch to kernel

    //new memory
    char* q = (char*)memman_alloc_4k(memman,64*1024);
    segment_descriptor(gdt+12, 64 * 1024 - 1, (int)q, 0x4092);  //数据段
    start_app(0,11*8,64*1024,12*8);
    char* pApp = (char*)(q + 0x100);
    paint_string(sheet_control,back_sheet,0,179,pApp,COL8_FFFFFF);

    memman_free_4k(memman,(unsigned int)buffer.pBuffer,buffer.length);
    memman_free_4k(memman, (unsigned int)q, 64 * 1024);
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
    *((int*)(task_console->tss.esp + 8)) = memman_total(memman);

    task_run(task_console,1,5);
    
    sheet_slide(sheet_control,sht_console,32,4);
    sheet_updown(sheet_control,sht_console,1);

    task_console_g = task_console;

    return sht_console;
}

//光标控制
void set_cursor(SheetControl* stl,SHEET* sheet,int cursor_x,int cursor_y,int cursor_color){
    paint_rectangle(sheet->buf,sheet->sheet_length,
                    cursor_color,cursor_x,cursor_y,
                    cursor_x+7,cursor_y+15);
    sheet_refresh(stl,sheet,cursor_x,cursor_y,cursor_x+8,cursor_y+16);
}

//新生成一行
int console_new_line(int cursor_y,SHEET* sheet){
    int x,y;
    if(cursor_y < 28 + 112){
        cursor_y += 16;
    }else{
        for(y = 28;y < 28 + 112;y++){
            for(x = 8;x < 8 + 240;x++){
                sheet->buf[x + y * sheet->sheet_length] = sheet->buf[x + (y + 16) * sheet->sheet_length];
            }
        }

        for(y = 28 + 112;y < 28 + 128;y++){
            for(x = 8;x < 8 + 240;x++){
                sheet->buf[x + y * sheet->sheet_length] = COL8_000000;
            }
        }
        
        sheet_refresh(sheet_control,sheet,8,28,8+240,28+128);

    }
    paint_string(sheet_control,sheet,8,cursor_y,">",COL8_FFFFFF);
    return cursor_y;
}

//字符串匹配函数
int strcmp(char* src,char* dest){
    if(src == 0 || dest == 0){
        return 0;
    }

    int i = 0;
    while(src[i] != 0 && dest != 0){
        if(src[i] != dest[i]){
            return 0;
        }
        i++;
    }

    if (src[i] == 0 && dest[i] != 0) {
        return 0;
    }

    if (src[i] != 0 && dest[i] != 0) {
       return 0; 
    }

    return 1;
}

//控制台字符打印函数
void c_console_putchar(char c, char move){
    set_cursor(sheet_control,g_Console.sheet,g_Console.cursor_x,g_Console.cursor_y,COL8_000000);
    g_Console.str[0] = c;
    g_Console.str[1] = 0;
    paint_string(sheet_control,g_Console.sheet,g_Console.cursor_x,g_Console.cursor_y,g_Console.str,COL8_FFFFFF);
    g_Console.cursor_x += 8;
}

//控制台字符串打印函数
void c_console_putstr(char* str){
    while (*str != 0){
        c_console_putchar(*str,1);
        str++;
    }
    
}

//内核API
void kernel_api(int edi, int esi, int ebp, int esp,
                int ebx, int edx, int ecx, int eax){

    if(edx == 1){
        c_console_putchar(eax & 0xFF,1);
    }else if(edx == 2){
        c_console_putstr((char*)buffer.pBuffer + ebx);
    }
}

//错误中断函数
void intHandlerException(int* esp){
    g_Console.cursor_x = 8;
    c_console_putstr("INT 0D ");
    g_Console.cursor_x = 8;
    g_Console.cursor_y += 16;
    c_console_putstr("General Protected Exception");
    g_Console.cursor_y += 16;
    g_Console.cursor_x = 8;
    return ;
}