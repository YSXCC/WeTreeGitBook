#ifndef _MULTI_TASK_
#define _MULTI_TASK_

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

void segment_descriptor(SegmentDescriptor * sd, unsigned int limit, int base, int ar);

#define AR_TSS32	0x0089  //特殊值

#endif  