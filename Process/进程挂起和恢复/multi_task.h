#ifndef _MULTI_TASK_
#define _MULTI_TASK_

#include "memory_util.h"

typedef struct tss32 {
	int backlink, esp0, ss0, esp1, ss1, esp2, ss2, cr3;
	int eip, eflags, eax, ecx, edx, ebx, esp, ebp, esi, edi;
	int es, cs, ss, ds, fs, gs;
	int ldtr, iomap;
} TSS32;      //104字节

typedef struct segment_descriptor {
	short limit_low, base_low;
	char base_mid, access_right;
	char limit_high, base_high;
}SegmentDescriptor;


#define SIZE_OF_TASK 112	//112字节

typedef struct task{
	int select;		//段描述符下标
	int flags;		//当前任务状态，（空闲，占用）
	TSS32 tss;
}TASK;

#define MAX_TASKS 2
#define TASK_GDT0 8
#define SIZE_OF_TaskControl		1168

typedef struct task_control{
	int running;
	int now;
	TASK* taskPtr[MAX_TASKS];
	TASK  tasks[MAX_TASKS];
}TaskControl;

void segment_descriptor(SegmentDescriptor * sd, unsigned int limit, int base, int ar);

#define AR_TSS32	0x0089  //特殊值

//多任务初始化
// void multi_task_init();

//进程切换
// void multi_task_switch();

//任务初始化
TASK* task_init(MemoryManage* memory_manage);

//任务分配
TASK* task_alloc();

//任务运行
void task_run(TASK* task);

//任务切换
void task_switch();

//任务挂起
void task_sleep(TASK* task);

#endif  