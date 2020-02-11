#ifndef _WINDOWS_INIT_
#define _WINDOWS_INIT_

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

typedef struct screeninfo{
    unsigned char* vram_address;
    short screen_lenth;
    short screen_height;
}ScreenInfo;

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

void paint_rectangle(unsigned char* vram, int screen_lenth, unsigned char color, //画一个矩形
                    int left_up_x, int left_up_y,                         //varm是需要填充的区域
                    int right_down_x, int right_down_y);                  //screen_lenth是屏幕的长度

void init_desktop(unsigned char* vram,int screen_lenth,int screen_height);    //画桌面背景

#endif