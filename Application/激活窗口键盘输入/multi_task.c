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

//?初始化特权级任务
void init_task_level(int level){
	task_control->level[level].running = 0;
	task_control->level[level].now = 0;
	int i;
	for(i = 0;i < MAX_TASKS_LV;i++){
		task_control->level[i].taskPtr[i] = 0;
	}
}

//任务初始化
TASK* task_init(MemoryManage* memory_manage){
	int i;
	TASK* task;
    SegmentDescriptor* gdt = (SegmentDescriptor* )get_addr_gdt();
	task_control = (TaskControl* )memman_alloc_4k(memory_manage,SIZE_OF_TASKCTL);
	for(i = 0; i < MAX_TASKS; i++){
		task_control->tasks[i].flags = TASK_NOT_USED;
		task_control->tasks[i].select = (TASK_GDT0 + i) * 8;
		segment_descriptor(gdt + TASK_GDT0 + i, 103,(int)&task_control->tasks[i].tss,AR_TSS32);
	}

    for (i = 0; i < MAX_TASKLEVELS; i++) {
        init_task_level(i);
    }

	task = task_alloc();
	task->flags = TASK_USING;
	task->priority = 100;

	task->level = 0; //?内核级
	task_add(task);
	task_switch_sub();

	load_tr(task->select);
	task_timer = timer_alloc();
	timer_settime(task_timer, task->priority);
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
void task_run(TASK* task,int level,int priority){
	if(level < 0){
		level = task->level;
	}

	if(priority > 0){
		task->priority = priority;
	}

	if(task->flags == TASK_USING && task->level != level){
		task_remove(task);	//change task flags
	}

	if(task->flags != TASK_USING){
		task->level = level;
		task_add(task);
	}

	task_control->lv_change = 1;

}

//任务切换
void task_switch(){	//当前特权级找
	TaskLevel* task_level = &task_control->level[task_control->now_lv];
	TASK *new_task, *now_task = task_level->taskPtr[task_level->now];
	task_level->now++;

	if(task_level->now == task_level->running){
		task_level->now = 0;
	}

	if(task_control->lv_change != 0){
		task_switch_sub();
		task_level = &task_control->level[task_control->now_lv];
	}

	new_task = task_level->taskPtr[task_level->now];
	timer_settime(task_timer,new_task->priority);
	
	if(new_task != now_task && new_task != 0){
		farjmp(0,new_task->select);
	}
}

//任务挂起
int task_sleep(TASK* task){	//挂起后从内核态找
	TASK *cur_task = 0;

    int rtask = 0;

	if(task->flags == TASK_USING){
		cur_task = task_now();
		task_remove(task);

		rtask = 1;

		if(task == cur_task){
			task_switch_sub();
			cur_task = task_now();
			rtask = 2;

			if(cur_task != 0){
				farjmp(0,cur_task->select);
			}
		}
	}
	return rtask;
}

//当前进程
TASK* task_now(){
	TaskLevel* tl = &task_control->level[task_control->now_lv];
	return tl->taskPtr[tl->now];
}

//任务添加
void task_add(TASK* task){
	TaskLevel* tl = &task_control->level[task->level];
	tl->taskPtr[tl->running] = task;
	tl->running++;
	task->flags = TASK_USING;
}

//任务移除
void task_remove(TASK* task){
	int i;
	TaskLevel* tl = &task_control->level[task->level];

    for (i = 0; i< tl->running; i++) {
        if (tl->taskPtr[i] == task) {
            tl->taskPtr[i] = 0;
            break;
        }
    }

    tl->running--;
    if (i < tl->now) {
        tl->now--;
    }

    if (tl->now >= tl->running) {
        tl->now = 0;
    } 

    task->flags = TASK_ALLOC;

    for (; i < tl->running; i++) {
        tl->taskPtr[i] = tl->taskPtr[i+1];
    }
}

//?新任务切换,还是特权级切换?
void task_switch_sub(){	//从下往上找，有进程的特权级
	int i;
    for (i = 0; i < MAX_TASKLEVELS; i++) {
        if (task_control->level[i].running > 0) {
           break;
        }
    }

    task_control->now_lv = i;
    task_control->lv_change = 0;
}