#ifndef _MEMORY_UTIL_
#define _MEMORY_UTIL_

typedef struct addr_range_desc {
    unsigned int baseAddrLow;
    unsigned int baseAddrHigh;
    unsigned int lengthLow;
    unsigned int lengthHigh;
    unsigned int type;
} AddrRangeDesc;

//展示内存相关信息
void show_memory_info(AddrRangeDesc * addr_range_desc,int page);

#endif