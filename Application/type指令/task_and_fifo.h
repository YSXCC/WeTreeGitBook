#ifndef _TASK_AND_FIFO_
#define _TASK_AND_FIFO_

struct task;
typedef struct task TASK;

//自定义8位数据的队列
typedef struct fifo8{
    unsigned char* buf;     //数据缓存区域
    int current_in;         //当前准备出队列的下标
    int current_out;        //当前准备入队列的下标
    int size;               //队列大小
    int free;               //剩余空间
    int flags;              //当前队列状态，空，正在使用，满
    TASK* task;             //队列中的任务
} FIFO8;

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

typedef struct task{
	int select;		//段描述符下标
	int flags;		//当前任务状态，（空闲，占用）
	int priority;	//进程优先级
	int level;		//也不知道是个啥玩意
	FIFO8 fifo;     //用来装键盘data
	TSS32 tss;		//tss段
}TASK;

#endif