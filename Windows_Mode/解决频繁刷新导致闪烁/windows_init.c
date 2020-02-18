#include "windows_init.h"
#include "fifo.h"
#include "to_hex_str.h"
#include "interrupt.h"

static ScreenInfo screen_info;       //屏幕的信息，包括长宽和显存地址
static char  mouse_cursor_buf[256];  //鼠标颜色信息，其中存放的是颜色索引
static char* back_buf;               //屏幕颜色信息

static int mouse_x = 0;     //鼠标横坐标
static int mouse_y = 0;     //鼠标纵坐标

extern FIFO8 keyinfo;       //键盘队列
extern char  keybuf[32];

extern FIFO8 mouseinfo;     //鼠标队列
extern char  mousebuf[128]; 

extern unsigned int VRAM_ADDRESS;   //定义在kernel.asm的变量

extern MOUSE_SEND_INFO mouse_send_info;

extern MemoryManage* memman;

//初始化屏幕信息
void init_screeninfo(ScreenInfo* screeninfo){
    screeninfo->vram_address  = (unsigned char*)VRAM_ADDRESS;
    screeninfo->screen_lenth  = 320;
    screeninfo->screen_height = 200;
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
    fifo8_init(&mouseinfo,128,mousebuf);
    fifo8_init(&keyinfo,32,keybuf);
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
    paint_string(stl,sheet,0,0,"improve string showing",COL8_FFFFFF);
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

    make_windows(stl,sheet_win,title);

    paint_string(stl,sheet_win,24,28,"Welcome to",COL8_000000);
    paint_string(stl,sheet_win,24,44,"WeTreeOS",COL8_000000);

    sheet_slide(stl,sheet_win,80,72);
    sheet_updown(stl,sheet_win,2);
    return sheet_win;
}

//画一个窗口
void make_windows(SheetControl* stl,SHEET* sheet,char* title){
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

    paint_string(stl, sheet, 24, 4, title,COL8_FFFFFF);
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