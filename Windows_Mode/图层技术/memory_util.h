#ifndef _MEMORY_UTIL_
#define _MEMORY_UTIL_

#define  MEMMAN_FREES  4096

typedef struct addr_range_desc {
    unsigned int baseAddrLow;
    unsigned int baseAddrHigh;
    unsigned int lengthLow;
    unsigned int lengthHigh;
    unsigned int type;
} AddrRangeDesc;

//内存块结构体
typedef struct free_memory_info{
    unsigned int address;       //起始地址
    unsigned int size;          //大小
}FreeMemoryInfo;

//内存管理器
typedef struct memory_manage{
    int frees;          //个数
    int maxfrees;       //最大个数
    int lostsize;       //丢弃的内存块记录
    int losts;          //丢弃的内存块数量
    FreeMemoryInfo memory[MEMMAN_FREES];   //多个内存块
}MemoryManage;

//展示内存相关信息
void show_memory_info(AddrRangeDesc * addr_range_desc,int page);

//初始化内存管理
void memman_init(MemoryManage *man);

//可用内存管理
unsigned int memman_total(MemoryManage *man);

//分配内存
unsigned int memman_alloc(MemoryManage *man, unsigned int size);

//内存回收
int memman_free(MemoryManage *man, unsigned int addr, unsigned int size);

//分配4k内存
unsigned int memman_alloc_4k(MemoryManage *man, unsigned int size);

//回收4k内存
int memman_free_4k(MemoryManage *man, unsigned int addr, unsigned int size);

#endif