#ifndef _FILE_SYSTEM_
#define _FILE_SYSTEM_

#define ADDRESS_DISK_IMG    0x11200

typedef struct file_info{
    unsigned char name[8], ext[3], type;
    char reserve[10];   //微软保留字节
    unsigned short time, data, clustno;
    unsigned int size;
}FileInfo;

#endif