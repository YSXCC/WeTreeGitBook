#ifndef _WINDOWS_INIT_
#define _WINDOWS_INIT_

#include "windows_sheet.h"

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

typedef struct screeninfo{
    unsigned char* vram_address;
    short screen_lenth;
    short screen_height;
}ScreenInfo;

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

void paint_string(unsigned char* vram, int screen_lenth,int start_x,int start_y,char* str,char color);      //画字符串

void init_mouse_cursor(char* mouse,char back_color);    //初始化鼠标，把颜色的索引放到一个数组中

void paint_block(char* vram,int screen_lenth,//画一个矩形，但是颜色由buf这个数组规定
                int start_x,int start_y,
                int x_size, int y_size,      //矩形大小
                char* buf);

void init_fifo_buf();                        //初始化各种队列

// void eraser_mouse();                         //擦去之前的鼠标

void compute_mouse_position();               //计算移动后的鼠标位置

// void draw_mouse();                           //画鼠标

void show_mouse_info(SheetControl* sheet_control,SHEET* mouse_sheet);
#endif