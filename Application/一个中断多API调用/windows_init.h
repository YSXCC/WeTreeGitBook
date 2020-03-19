#ifndef _WINDOWS_INIT_
#define _WINDOWS_INIT_

#include "windows_sheet.h"
#include "interrupt.h"


//自定义颜色，其实就是索引// #define  COL8_00FF00  2 //亮绿
#define  COL8_000000  0     //全黑
#define  COL8_FF0000  1     //纯红
#define  COL8_448CBB  2     //不知道什么，但是看起来很舒服
#define  COL8_FFFF00  3     //亮黄
#define  COL8_0000FF  4     //亮蓝
#define  COL8_FF00FF  5     //亮紫
#define  COL8_00FFFF  6     //青绿
#define  COL8_FFFFFF  7     //全白
#define  COL8_C6C6C6  8     //亮灰
#define  COL8_840000  9     //暗红
#define  COL8_008400  10    //暗绿
#define  COL8_848400  11    //暗黄
#define  COL8_000084  12    //暗蓝
#define  COL8_840084  13    //暗紫
#define  COL8_008484  14    //浅暗蓝
#define  COL8_848484  15    //暗灰
#define  COL8_INVISIBLE 99  //透明，不显示

#define  KEY_RETURN   0x1C  //回车键

typedef struct screeninfo{
    unsigned char* vram_address;
    short screen_lenth;
    short screen_height;
}ScreenInfo;

typedef struct console{
    SHEET* sheet;
    int cursor_x,cursor_y,cursor_c;
    char str[2];
}CONSOLE;

extern char systemFont[16];

void io_hlt(void);                  //暂停
void io_cli(void);                  //关中断
void io_sti(void);                  //开中断
void io_stihlt(void);               //开中断后暂停
void io_out(int port, int data);    //端口输出
int  io_load_eflags(void);          //堆栈压入eflags
void io_store_eflags(int eflags);   //堆栈取出eflags

void init_screeninfo();              //初始化屏幕相关信息

void init_palette(void);                                    //初始化调色板，设置自己的颜色

void set_palette(int start, int end, unsigned char *rgb);   //设置调色板，RGB输出到端口;start和end是颜色个数

void paint_rectangle(unsigned char* vram, int screen_lenth, unsigned char color, //画一个矩形,纯色
                    int left_up_x, int left_up_y,                                //varm是需要填充的区域
                    int right_down_x, int right_down_y);                         //screen_lenth是屏幕的长度

void init_desktop(unsigned char* vram,int screen_lenth,int screen_height);    //画桌面背景

void init_mouse_position();     //初始化鼠标的位置

void paint_font(unsigned char* vram, int screen_lenth, int start_x,int start_y,char* font,char color);      //画字符

void paint_string(SheetControl* stl,SHEET* sheet,int start_x,int start_y,char* str,char color);      //画字符串

void init_mouse_cursor(char* mouse,char back_color);    //初始化鼠标，把颜色的索引放到一个数组中

void paint_block(char* vram,int screen_lenth,//画一个矩形，但是颜色由buf这个数组规定
                int start_x,int start_y,
                int x_size, int y_size,      //矩形大小
                char* buf);


void init_fifo_buf();                        //初始化各种队列

void compute_mouse_position(SheetControl* stl,SHEET* sheet, MOUSE_SEND_INFO* mouse_send_info);               //计算移动后的鼠标位置

void show_mouse_info(SheetControl* sheet_control,SHEET* back_sheet,SHEET* mouse_sheet);

//展示内存相关信息
void show_memory_info(SheetControl* stl,SHEET* sheet,AddrRangeDesc * addr_range_desc,int page);

//画一个消息框
SHEET* message_box(SheetControl* stl,char* title);

//画一个窗口
void make_windows(SheetControl* stl,SHEET* sheet,char* title,char active);

//绘制文本框
void make_textbox(SHEET* sheet,int start_x,int start_y,int length,int height,int color);

//切换窗口颜色变化
void make_window_title(SheetControl* stl,SHEET* sheet,char* title,char active);

//对Shift键进行处理转码
char transfer_scancode(int data);

//判断是否开启了CAPS LOCK（大写）
int is_special_key(int data);

//控制台任务
void console_task(SHEET* sheet,int memorytotal);

//command_mem
void command_mem(int memtotal);

//command_cls
void command_cls();

//command_dir
void command_dir();

//command_type
void command_type(char* cmdline);

//command_hlt
void command_hlt();

//启动控制台
SHEET* launch_console();

//光标控制
void set_cursor(SheetControl* stl,SHEET* sheet,int cursor_x,int cursor_y,int cursor_color);

//新生成一行
int console_new_line(int cursor_y,SHEET* sheet);

//字符串匹配函数
int strcmp(char* src,char* dest);

//控制台字符打印函数
void c_console_putchar(char c, char move);

//控制台字符串打印函数
void c_console_putstr(char* str);

//内核API
void kernel_api(int edi, int esi, int ebp, int esp,
                int ebx, int edx, int ecx, int eax);

#endif