#include "windows_init.h"

static ScreenInfo screen_info;      //屏幕的信息，包括长宽和显存地址
extern unsigned int VRAM_ADDRESS;   //定义在kernel.asm的变量


void init_screeninfo(ScreenInfo* screeninfo){
    screeninfo->vram_address  = (unsigned char*)VRAM_ADDRESS;
    screeninfo->screen_lenth  = 320;
    screeninfo->screen_height = 200;
}

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