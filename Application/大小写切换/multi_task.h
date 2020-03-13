#ifndef _MULTI_TASK_
#define _MULTI_TASK_

#include "memory_util.h"
#include "task_and_fifo.h"


// typedef struct tss32 {
// 	int backlink, esp0, ss0, esp1, ss1, esp2, ss2, cr3;
// 	int eip, eflags, eax, ecx, edx, ebx, esp, ebp, esi, edi;
// 	int es, cs, ss, ds, fs, gs;
// 	int ldtr, iomap;
// } TSS32;      //104字节

// typedef struct segment_descriptor {
// 	short limit_low, base_low;
// 	char base_mid, access_right;
// 	char limit_high, base_high;
// }SegmentDescriptor;

// typedef struct task{
// 	int select;		//段描述符下标
// 	int flags;		//当前任务状态，（空闲，占用）
// 	int priority;	//进程优先级
// 	int level;		//也不知道是个啥玩意
// 	FIFO8 fifo;     //用来装键盘data
// 	TSS32 tss;		//tss段
// }TASK;


#define MAX_TASKS 5
#define MAX_TASKS_LV   3
#define MAX_TASKLEVELS 3

#define TASK_GDT0 8
#define SIZE_OF_TASK 120	//120字节

typedef struct task_level{
	int running;		//队列中的Task
	int now;			//队列中正在运行的Task的下标
	TASK* taskPtr[MAX_TASKS_LV];
}TaskLevel;

#define SIZE_OF_TASKLEVEL  (8+ 4*MAX_TASKS_LV)

typedef struct task_control{
    int  now_lv;			//当前特权级
    int  lv_change;			//是否允许通过这个修改特权级，0可以，1不可以
	TaskLevel level[MAX_TASKLEVELS];	//???特权级请求
	TASK  tasks[MAX_TASKS];				//进程队列
}TaskControl;

#define SIZE_OF_TASKCTL	(4 + 4 + SIZE_OF_TASKLEVEL*MAX_TASKLEVELS + SIZE_OF_TASK*MAX_TASKS)

void segment_descriptor(SegmentDescriptor * sd, unsigned int limit, int base, int ar);

#define AR_TSS32	0x0089  //特殊值

//多任务初始化
// void multi_task_init();

//进程切换
// void multi_task_switch();

//任务初始化
TASK* task_init(MemoryManage* memory_manage);

//?初始化特权级任务
void init_task_level(int level);

//任务分配
TASK* task_alloc();

// //任务运行
// void task_run(TASK* task,int priority);
//任务运行
void task_run(TASK* task,int level,int priority);

//任务切换
void task_switch();

//任务挂起
int task_sleep(TASK* task);

//当前进程
TASK* task_now();

//任务添加
void task_add(TASK* task);

//任务移除
void task_remove(TASK* task);

//新任务切换
void task_switch_sub();

#endif  