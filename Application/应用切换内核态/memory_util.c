#include "memory_util.h"
#include "windows_init.h"
#include "to_hex_str.h"

// extern ScreenInfo screen_info;



//初始化内存管理
void memman_init(MemoryManage *man){
    man->frees = 0;
    man->maxfrees = 0;
    man->lostsize = 0;
    man->losts = 0;
}

//可用内存管理
unsigned int memman_total(MemoryManage *man){
    unsigned int i, total = 0;
    for (i = 0; i < man->frees; i++) {
        total += man->memory[i].size;
    }
    return total;
}

//分配内存
unsigned int memman_alloc(MemoryManage *man, unsigned int size){
    unsigned int i,address;
    for(i = 0; i < man->frees; i++){
        if(man->memory[i].size >= size){
            address = man->memory[i].address;
            man->memory[i].address += size;
            man->memory[i].size    -= size;
            if(man->memory[i].size == 0){
                man->frees--;
            }
            return address;
        }
    }
    return 0;
}

//内存回收
int memman_free(MemoryManage *man, unsigned int addr, unsigned int size){
    int i,j;
    //先找到要释放的地址
    for(i = 0; i < man->frees; i++){
        if(man->memory[i].address > addr){
            break;
        }
    }

    if(i > 0){
        if(man->memory[i-1].address + man->memory[i-1].size == addr){
            man->memory[i-1].size += size;
            if(i < man->frees){
                if(addr + size == man->memory[i].address){
                    man->memory[i-1].size += man->memory[i].size;
                    man->frees--;
                }
            }
            return 0;
        }
    }

    if(i < man->frees){
        if(addr + size == man->memory[i].address){
            man->memory[i].address = addr;
            man->memory[i].size += size;
            return 0;
        }
    }

    if(man->frees < MEMMAN_FREES){
        for(j = man->frees; j > i; j--){
            man->memory[j] = man->memory[j-1];
        }
        man->frees++;
        if(man->maxfrees < man->frees){
            man->maxfrees = man->frees;
        }

        man->memory[i].address = addr;
        man->memory[i].size = size;
        return 0;
    }

    //没有合并的内存块，变成碎片
    man->losts++;
    man->lostsize += size;
    return -1;

}

//分配4k内存
unsigned int memman_alloc_4k(MemoryManage *man, unsigned int size){
    unsigned int a;
    size = (size + 0xfff) & 0xfffff000;
    a = memman_alloc(man, size);
    return a;
}

//回收4k内存
int memman_free_4k(MemoryManage *man, unsigned int addr, unsigned int size){
    int i ;
    size = (size + 0xfff) & 0xfffff000;
    i = memman_free(man, addr, size);
    return i;
}