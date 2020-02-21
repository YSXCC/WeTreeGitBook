#include "multi_task.h"
#include "timer.h"

static TIMER* multi_timer;

void segment_descriptor(SegmentDescriptor * sd, unsigned int limit, int base, int ar){
    if(limit > 0xfffff){
        ar |= 0x8000;    /* G_bit = 1 */
        limit /= 0x1000;
    }
	sd->limit_low    = limit & 0xffff;
	sd->base_low     = base & 0xffff;
	sd->base_mid     = (base >> 16) & 0xff;
	sd->access_right = ar & 0xff;
	sd->limit_high   = ((limit >> 16) & 0x0f) | ((ar >> 8) & 0xf0);
	sd->base_high    = (base >> 24) & 0xff;
}

static int multi_task_address;

//多任务初始化
void multi_task_init(){
	multi_timer = timer_alloc();

	timer_settime(multi_timer,100);
	multi_task_address = 8*8;
}

//进程切换
void multi_task_switch(){
	if(multi_task_address == 8*8){
		multi_task_address = 10*8;
	}else{
		multi_task_address = 8*8;
	}

	timer_settime(multi_timer,100);
	farjmp(0,multi_task_address);
}