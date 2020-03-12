#include "fifo.h"

static FIFO8 keyinfo;       //键盘队列
static char  keybuf[32];

static FIFO8 mouseinfo;     //鼠标队列
static char  mousebuf[128]; 

void fifo8_init(FIFO8* fifo8,int size,unsigned char* buf,TASK* task){
    fifo8->buf = buf;
    fifo8->current_in  = 0;
    fifo8->current_out = 0;
    fifo8->size  = size;
    fifo8->free  = size;
    fifo8->flags = FLAGS_EMPTY;
    fifo8->task  = task;
}

int fifo8_put(FIFO8* fifo8,unsigned char data){
    if(fifo8 == 0){
        return -1;
    }

    if(fifo8->free == 0){
        fifo8->flags |= FLAGS_FULL;
        return -1;
    }
    int put_index = fifo8->current_in;
    fifo8->buf[put_index] = data;
    fifo8->current_in++;

    if(fifo8->current_in == fifo8->size){   //越界处理，就直接回到队列头
        fifo8->current_in = 0;
    }
    fifo8->free--;

    if(fifo8->task != 0){
        if(fifo8->task->flags != FLAGS_USING){
            task_run(fifo8->task,-1,0);
        }
    }

    return 0;
}

int fifo8_get(FIFO8* fifo8){
    if(fifo8->free == fifo8->size){
        fifo8->flags &= FLAGS_EMPTY;
        return -1;
    }
    int get_index = fifo8->current_out;
    int data =  fifo8->buf[get_index];
    fifo8->current_out++;

    if(fifo8->current_out == fifo8->size){
        fifo8->current_out = 0;
    }
    fifo8->free++;
    return data;
}

int fifo8_status(FIFO8* fifo8){
    return fifo8->size - fifo8->free;
}