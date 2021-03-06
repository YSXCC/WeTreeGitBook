#include "windows_init.h"
#include "fifo.h"
#include "to_hex_str.h"
#include "timer.h"

static ScreenInfo screen_info;       //屏幕的信息，包括长宽和显存地址
static char  mouse_cursor_buf[256];  //鼠标颜色信息，其中存放的是颜色索引
static char* back_buf;               //屏幕颜色信息

static SHEET* sheet_win;

static int mouse_x = 0;     //鼠标横坐标
static int mouse_y = 0;     //鼠标纵坐标

static char keytable[0x80] = {
         0 ,  0 , '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' , '-', '=',   0 ,  0 ,
		'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', '[', ']' ,  0 ,  0 ,  'A', 'S',
		'D', 'F', 'G', 'H', 'J', 'K', 'L', ';', ',', '`',  0 , '\\', 'Z', 'X',  'C', 'V',
		'B', 'N', 'M', ',', '.', '/',  0 ,  0 ,  0 ,  0 ,  0 ,  0  ,  0 ,  0 ,   0 ,  0 ,
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

//擦去鼠标
// void eraser_mouse(){
//     char* vram = screen_info.vram_address;
//     int screen_lenth = screen_info.screen_lenth;
//     paint_rectangle(vram,screen_lenth,COL8_448CBB,mouse_x,mouse_y,mouse_x+15,mouse_y+15);
// }

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

//画鼠标
// void draw_mouse(){
//     char* vram = screen_info.vram_address;
//     int screen_lenth = screen_info.screen_lenth;
//     paint_block(vram,screen_lenth,mouse_x,mouse_y,16,16,mouse_cursor_buf);
// }

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
void console_task(SHEET* sheet){
    TIMER* time;
    TASK* task = task_now();
    int data, cursor_x = 16, cursor_y = 28,cursor_c = COL8_000000;
    unsigned char fifobuf[128];
    fifo8_init(&task->fifo,128,fifobuf,task);

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
                set_cursor(sheet_control,sheet,cursor_x,cursor_y,COL8_000000);
                cursor_c = -1;
                task_run(task_main,-1,0);
            }else if(data == 0x0E && cursor_x > 16){//退格键
                set_cursor(sheet_control,sheet,cursor_x,cursor_y,COL8_000000);
                cursor_x -= 8;
                set_cursor(sheet_control,sheet,cursor_x,cursor_y,COL8_000000);
            }else{
                char c = transfer_scancode(data);
                if(c != 0 && cursor_x < 240){
                    paint_rectangle(sheet->buf,sheet->sheet_length,COL8_000000,cursor_x,28,cursor_x+7,43);
                    sheet_refresh(sheet_control,sheet,cursor_x,28,cursor_x + 8,44);
                    char str[2] = {c,0};
                    paint_string(sheet_control,sheet,cursor_x,28,str,COL8_FFFFFF);
                    cursor_x += 8;
                }
            }
            
            if(cursor_c >= 0){
                set_cursor(sheet_control,sheet,cursor_x,cursor_y,cursor_c);
            }
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

//光标控制
void set_cursor(SheetControl* stl,SHEET* sheet,int cursor_x,int cursor_y,int cursor_color){
    paint_rectangle(sheet->buf,sheet->sheet_length,
                    cursor_color,cursor_x,cursor_y,
                    cursor_x+7,cursor_y+15);
    sheet_refresh(stl,sheet,cursor_x,cursor_y,cursor_x+8,cursor_y+16);
}