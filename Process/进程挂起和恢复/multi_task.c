#include "multi_task.h"
#include "timer.h"

// static TIMER* multi_timer;

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

// static int multi_task_address;

// //多任务初始化
// void multi_task_init(){
// 	multi_timer = timer_alloc();

// 	timer_settime(multi_timer,100);
// 	multi_task_address = 8*8;
// }

// //进程切换
// void multi_task_switch(){
// 	if(multi_task_address == 8*8){
// 		multi_task_address = 10*8;
// 	}else{
// 		multi_task_address = 8*8;
// 	}

// 	timer_settime(multi_timer,100);
// 	farjmp(0,multi_task_address);
// }

static TIMER* task_timer;
static TaskControl* task_control;

#define TASK_NOT_USED  0
#define TASK_ALLOC     1
#define TASK_USING     2

//任务初始化
TASK* task_init(MemoryManage* memory_manage){
	int i;
	TASK* task;
    SegmentDescriptor* gdt = (SegmentDescriptor* )get_addr_gdt();
	task_control = (TaskControl* )memman_alloc_4k(memory_manage,SIZE_OF_TaskControl);
	for(i = 0; i < MAX_TASKS; i++){
		task_control->tasks[i].flags = TASK_NOT_USED;
		task_control->tasks[i].select = (TASK_GDT0 + i) * 8;
		segment_descriptor(gdt + TASK_GDT0 + i, 103,(int)&task_control->tasks[i].tss,AR_TSS32);
	}
	task = task_alloc();
	task->flags = TASK_USING;
	task_control->running = 1;
	task_control->now = 0;
	task_control->taskPtr[0] = task;
	load_tr(task->select);
	task_timer = timer_alloc();
	timer_settime(task_timer, 100);
	return task;
}

//任务分配
TASK* task_alloc(){
	int i;
	TASK* task;
	for(i = 0;i < MAX_TASKS; i++){
		if(task_control->tasks[i].flags == TASK_NOT_USED){
			task = &task_control->tasks[i];

            task->flags = TASK_ALLOC;
            task->tss.eflags = 0x00000202;
            task->tss.eax    = 0;
            task->tss.ecx    = 0;
            task->tss.edx    = 0;
            task->tss.ebx    = 0;
            task->tss.esp    = 512*(i+1);	//画重点
            task->tss.ebp    = 0;
            task->tss.esi    = 0;
            task->tss.edi    = 0;
            task->tss.es     = 0;
            task->tss.ds     = 0;
            task->tss.fs     = 0;
            task->tss.gs     = 0;
            task->tss.ldtr   = 0;
            task->tss.iomap  = 0x40000000;
			return task;
		}
	}
	return 0;
}

//任务运行
void task_run(TASK* task){
	task->flags = TASK_USING;
	task_control->taskPtr[task_control->running] = task;
	task_control->running++;
}

//任务切换
void task_switch(){
	timer_settime(task_timer,100);
	if(task_control->running >= 2){
		task_control->now++;
		if(task_control->now == task_control->running){
			task_control->now = 0;
		}
		farjmp(0,task_control->taskPtr[task_control->now]->select);
	}
}

//任务挂起
void task_sleep(TASK* task){
	int i;
	char ts = 0;
	if(task->flags == TASK_USING){
		if(task == task_control->taskPtr[task_control->now]){
			ts = 1;
		}

		//找到要挂起的进程
		for(i = 0; i < task_control->running; i++){
			if(task_control->taskPtr[i] == task){
				break;
			}
		}

		task_control->running--;
		if(i < task_control->now){
			task_control->now--;
		}

		for(;i < task_control->running; i++){
			//后面任务向前移动
			task_control->taskPtr[i] = task_control->taskPtr[i + 1];
		}

		task->flags = TASK_ALLOC;
		if(ts != 0){
			//如果挂起的任务正在运行，就把0号位置的任务调度
			task_control->now = 0;
		}

		farjmp(0,task_control->taskPtr[task_control->now]->select);

	}
}