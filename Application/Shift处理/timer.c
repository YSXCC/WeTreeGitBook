#include "timer.h"

static TimeControl timer_control;
extern TIMER* task_timer;

#define  TIMER_FLAGS_NO_USED  0     //未被使用
#define  TIMER_FLAGS_ALLOC    1     //分配了地址的
#define  TIMER_FLAGS_USING    2     //正在使用

#define PIC_MAIN_OCW2_PORT    0x20 //8259A主片端口
#define PIC_SECOND_OCW2_PORT  0xA0 //8259A从片端口

//初始化时钟中断端口
void init_time_port(){
    io_out8(PIT_CTRL, 0x34);
    io_out8(PIT_CNT0, 0x9c);
    io_out8(PIT_CNT0, 0x2e);

    timer_control.count = 0;

    int i;
    for(i = 0; i < MAX_TIMER;i++){
        timer_control.timer[i].flags = TIMER_FLAGS_NO_USED;
        timer_control.timer[i].fifo  = 0;
    }
}

//获取定时器的控制器
TimeControl* get_timer_control(){
    return &timer_control;
}

//分配定时器空间
TIMER* timer_alloc(){
    int i;
    for(i = 0 ;i < MAX_TIMER ; i++){
        if(timer_control.timer[i].flags == TIMER_FLAGS_NO_USED){
            timer_control.timer[i].flags == TIMER_FLAGS_ALLOC;
            return &timer_control.timer[i];
        }
    }
}

//释放定时器空间
void timer_free(TIMER* timer){
    timer->flags = TIMER_FLAGS_NO_USED;
}

//定时器初始化
void timer_init(TIMER* timer,FIFO8* fifo,unsigned char data){
    timer->fifo = fifo;
    timer->data = data;
}

//设置定时器超时
void timer_settime(TIMER* timer, unsigned int timeout){
    timer->timeout = timeout;
    timer->flags   = TIMER_FLAGS_USING;
}

//处理中断的函数
void intHandlerTimer(char* esp){
    io_out8(PIC_MAIN_OCW2_PORT, 0x20);   //允许下一次中断   0110 0000

    timer_control.count++;
    
    char ts = 0;

    int i;
    for(i = 0; i < MAX_TIMER ; i++){
        if(timer_control.timer[i].flags == TIMER_FLAGS_USING){
            timer_control.timer[i].timeout--;
            if(timer_control.timer[i].timeout == 0){
                timer_control.timer[i].flags = TIMER_FLAGS_ALLOC;
                fifo8_put(timer_control.timer[i].fifo,timer_control.timer[i].data);
                if(&timer_control.timer[i] == task_timer){
                    ts = 1;
                }
            }
        }
        if(ts != 0){
            task_switch();
        }
    }

}