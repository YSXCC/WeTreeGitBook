#include "memory_util.h"
#include "windows_init.h"
#include "to_hex_str.h"

extern ScreenInfo screen_info;

//展示内存信息
void show_memory_info(AddrRangeDesc * addr_range_desc,int page){
    int x = 0, y = 0, gap = 13*8;
    char* vram = screen_info.vram_address;
    int screen_lenth  = screen_info.screen_lenth;
    int screen_height = screen_info.screen_height;
    init_desktop(vram,screen_lenth,screen_height);

    paint_string(vram,screen_lenth,x,y,"page is: ",COL8_FFFFFF);
    char* pPageCnt = (char*)intToHexStr(page);
    paint_string(vram, screen_lenth, gap, y,pPageCnt, COL8_FFFFFF);
    y += 16;

    paint_string(vram,screen_lenth,x,y,"BaseAddrL: ",COL8_FFFFFF);
    char* pBaseAddrL = (char*)intToHexStr(addr_range_desc->baseAddrLow);
    paint_string(vram, screen_lenth, gap, y,pBaseAddrL, COL8_FFFFFF);
    y += 16;

    paint_string(vram,screen_lenth,x,y,"BaseAddrH: ",COL8_FFFFFF);
    char* BaseAddrH = (char*)intToHexStr(addr_range_desc->baseAddrHigh);
    paint_string(vram, screen_lenth, gap, y,BaseAddrH, COL8_FFFFFF);
    y += 16;

    paint_string(vram,screen_lenth,x,y,"lengthLow: ",COL8_FFFFFF);
    char* pLengthLow = (char*)intToHexStr(addr_range_desc->lengthLow);
    paint_string(vram, screen_lenth, gap, y,pLengthLow, COL8_FFFFFF);
    y += 16;

    paint_string(vram,screen_lenth,x,y,"lengthHigh: ",COL8_FFFFFF);
    char* lengthHigh = (char*)intToHexStr(addr_range_desc->lengthHigh);
    paint_string(vram, screen_lenth, gap, y,lengthHigh, COL8_FFFFFF);
    y += 16;

    paint_string(vram,screen_lenth,x,y,"type: ",COL8_FFFFFF);
    char* type = (char*)intToHexStr(addr_range_desc->type);
    paint_string(vram, screen_lenth, gap, y,type, COL8_FFFFFF);
    y += 16;
}