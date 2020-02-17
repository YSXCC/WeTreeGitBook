#include "windows_sheet.h"
#include "memory_util.h"

//图层控制器初始化
SheetControl* sheet_control_init(MemoryManage* memory_manage,unsigned char *vram,
    int screen_length, int screen_height){

    SheetControl* stl;
    int i;
    stl = (SheetControl* )memman_alloc_4k(memory_manage, SIZE_OF_SHTCTL);
    if(stl == 0){
        return 0;
    }

    stl->vram = vram;
    stl->screen_length = screen_length;
    stl->screen_height = screen_height;
    stl->top = -1;
    
    for(i = 0;i < MAX_SHEETS;i++){
        stl->sheets[i].flags = 0;
    }

    return stl;
}

//图层空间内存分配
SHEET* sheet_alloc(SheetControl* stl){
    SHEET* sheet;
    int i;
    for(i = 0;i < MAX_SHEETS;i++){
        if(stl->sheets[i].flags == 0 ){
            sheet = &stl->sheets[i];
            stl->sheetsPtr[i] = sheet;
            sheet->flags  = SHEET_USE;
            sheet->height = -1;
            return sheet;
        }
    }
    return 0;
}

//图层大小各个属性初始化
void sheet_setbuf(SHEET* sheet,unsigned char* buf,int sheet_length,int sheet_height,int color_invisible){
    sheet->buf = buf;
    sheet->sheet_length = sheet_length;
    sheet->sheet_height = sheet_height;
    sheet->color_invisible = color_invisible;
}

//调整图片的层次高度
void sheet_updown(SheetControl* stl,SHEET* sheet,int height){
    int h,old = sheet->height;
    if(height > stl->top+1){
        height = stl->top + 1;
    }

    if(height < -1){
        height = -1;
    }

    sheet->height = height;

    if(old > height){       //图层高度下降
        if(height >= 0){    //图层下降，但是不消失，就需要把之前的图层往后移
            for(h = old; h > height; h--){
                stl->sheetsPtr[h] = stl->sheetsPtr[h-1];
                stl->sheetsPtr[h]->height = h;
            }
            stl->sheetsPtr[height] = sheet;
        }else{              //图层消失，该图层之后的图层向前移动
            if(stl->top > old){
                for(h = old; h < stl->top;h++){
                    stl->sheetsPtr[h] = stl->sheetsPtr[h+1];
                    stl->sheetsPtr[h]->height = h;
                }
            }
            stl->top--;
        }
        sheet_refresh_local(stl,sheet->left_up_x,sheet->left_up_y,
                            sheet->left_up_x+sheet->sheet_length,sheet->left_up_y+sheet->sheet_height);
    }else if(old < height){ //图层高度上升
        if(old >= 0){       //图层上升，但是不超过top的位置，就需要把旧高度之后，新高度之前的图层向前移动
            for(h = old;h < height;h++){
                stl->sheetsPtr[h] = stl->sheetsPtr[h+1];
                stl->sheetsPtr[h]->height = h;
            }
            stl->sheetsPtr[height] = sheet;
        }else{              //图层上升，但是这个图层是之前是不显示的，就需要把新高度后的图层向后移动
            for(h = stl->top; h >= height; h--){
                stl->sheetsPtr[h+1] = stl->sheetsPtr[h];
                stl->sheetsPtr[h+1]->height = h+1; 
            }
            stl->sheetsPtr[height] = sheet;
            stl->top++;
        }
        sheet_refresh_local(stl,sheet->left_up_x,sheet->left_up_y,
                            sheet->left_up_x+sheet->sheet_length,sheet->left_up_y+sheet->sheet_height);
    }
}

//图层绘制函数,相对于图层的坐标位置
int sheet_refresh(SheetControl* stl,SHEET* sheet,int in_sheet_left_up_x, int in_sheet_left_up_y,
    int in_sheet_right_down_x, int in_sheet_right_down_y){

    if(sheet->height >= 0){
        sheet_refresh_local(stl,sheet->left_up_x +  in_sheet_left_up_x, sheet->left_up_y + in_sheet_left_up_y,
                                sheet->left_up_x + in_sheet_right_down_x, sheet->left_up_y + in_sheet_right_down_y);
    }
    return 0;
}

//图层移动
void sheet_slide(SheetControl* stl,SHEET* sheet,int new_x,int new_y){
    int old_x,old_y;
    old_x = sheet->left_up_x;
    old_y = sheet->left_up_y;

    sheet->left_up_x = new_x;
    sheet->left_up_y = new_y;
    if(sheet->height >= 0){
        sheet_refresh_local(stl,old_x,old_y,old_x+sheet->sheet_length,old_y+sheet->sheet_height);
        sheet_refresh_local(stl,new_x,new_x,new_x+sheet->sheet_length,new_x+sheet->sheet_height);
    }
}

//局部刷新的图层绘制函数
void sheet_refresh_local(SheetControl* stl,int left_up_x,int left_up_y,int right_down_x,int right_down_y){
    int h;
    int sheet_x,sheet_y;
    int screen_x,screen_y;
    unsigned char* buf ,color;
    unsigned char* vram = stl->vram;
    SHEET* sheet;

    for(h = 0; h <= stl->top;h++){
        sheet = stl->sheetsPtr[h];
        buf   = sheet->buf;
        for(sheet_y = 0;sheet_y < sheet->sheet_height;sheet_y++){
            screen_y = sheet->left_up_y + sheet_y;
            for(sheet_x = 0;sheet_x < sheet->sheet_length;sheet_x++){
                screen_x = sheet->left_up_x + sheet_x;
                if(left_up_x <= screen_x && screen_x < right_down_x && left_up_y <= screen_y && screen_y < right_down_y){
                    color = buf[sheet_y * sheet->sheet_length + sheet_x];
                    if(color != sheet->color_invisible){
                        vram[screen_y * stl->screen_length + screen_x] = color;
                    }
                }
            }
        }
    }
}