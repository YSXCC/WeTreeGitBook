#ifndef _FIFO_
#define _FIFO_

//自定义8位数据的队列
typedef struct fifo8{
    unsigned char* buf;     //数据缓存区域
    int current_in;         //当前准备出队列的下标
    int current_out;        //当前准备入队列的下标
    int size;               //队列大小
    int free;               //剩余空间
    int flags;              //当前队列状态，空，正在使用，满
} FIFO8;

#define FLAGS_EMPTY     0   //空
#define FLAGS_FULL      1   //满
#define FLAGS_USING     2   //存在数据


void fifo8_init(FIFO8* fifo8,int size,unsigned char* buf);          //初始化队列，设置缓冲区位置、大小

int fifo8_put(FIFO8* fifo8,unsigned char data);                    //向队列添加元素

int fifo8_get(FIFO8* fifo8);                                       //向队列获取元素

int fifo8_status(FIFO8* fifo8);                                    //获取队列已用大小

#endif