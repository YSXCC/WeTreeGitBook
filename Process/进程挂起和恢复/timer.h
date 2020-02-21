#ifndef _TIMER_
#define _TIMER_

#include "fifo.h"

#define PIT_CTRL   0x0043
#define PIT_CNT0   0x0040

#define MAX_TIMER  500      //最多时钟个数

typedef struct timer {
    unsigned int timeout;       //超时，0的时候触发操作
    unsigned int flags;         //使用标志
    FIFO8* fifo;                //数据队列
    unsigned char data;         //用来表示采取不同动作处理超时
}TIMER;

typedef struct timer_control {
    unsigned int count;         //中断次数
    TIMER timer[MAX_TIMER];
}TimeControl;

//初始化时钟中断端口
void init_time_port();

//获取定时器的控制器
TimeControl* get_timer_control();

//分配定时器空间
TIMER* timer_alloc();

//释放定时器空间
void timer_free(TIMER* timer);

//定时器初始化
void timer_init(TIMER* timer,FIFO8* fifo,unsigned char data);

//设置定时器超时
void timer_settime(TIMER* timer, unsigned int timeout);

//处理中断的函数
void intHandlerTimer(char* esp);

#endif