#ifndef _WINDOWS_SHEET_
#define _WINDOWS_SHEET_

#include "memory_util.h"

#define SHEET_USE   1

typedef struct sheet{
    unsigned char* buf;     //图层像素颜色数组
    int sheet_length;       //图层长度
    int sheet_height;       //图层高度
    int left_up_x;          //图层的左上角x轴坐标
    int left_up_y;          //图层的左上角y轴坐标
    int color_invisible;    //不显示的颜色，比如鼠标数组的部分颜色
    int height;             //图层高度，桌面永远是0
    int flags;              //图层状态
}SHEET;

#define MAX_SHEETS  256

typedef struct sheet_control{
    unsigned char* vram;            //显存地址
    int screen_length;              //屏幕分辨率长
    int screen_height;              //屏幕分辨率高
    int top;                        //要显示的图层数量
    SHEET* sheetsPtr[MAX_SHEETS];   //图层指针数组，指向相应的图层
    SHEET  sheets[MAX_SHEETS];      //图层数组，存储图层
}SheetControl;

#define SIZE_OF_SHEET  32           //SHEET结构体字节数
#define SIZE_OF_SHTCTL 9232         //SheetControl结构体字节数

//图层控制器初始化
SheetControl* sheet_control_init(MemoryManage* memory_manage,unsigned char *vram,
  int screen_length, int screen_height);

//图层空间内存分配
SHEET* sheet_alloc(SheetControl* stl);

//图层大小各个属性初始化
void sheet_setbuf(SHEET* sheet,unsigned char* buf,int sheet_length,int sheet_height,int color_invisible);

//调整图片的层次高度
void sheet_updown(SheetControl* stl,SHEET* sheet,int height);

//图层绘制函数,相对于图层的坐标位置
int sheet_refresh(SheetControl* stl,SHEET* sheet,int in_sheet_left_up_x, int in_sheet_left_up_y,
    int in_sheet_right_down_x, int in_sheet_right_down_y);

//图层移动
void sheet_slide(SheetControl* stl,SHEET* sheet,int new_x,int new_y);

//局部刷新的图层绘制函数
void sheet_refresh_local(SheetControl* stl,int left_up_x,int left_up_y,int right_down_x,int right_down_y);

#endif