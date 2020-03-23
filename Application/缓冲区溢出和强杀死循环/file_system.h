#ifndef _FILE_SYSTEM_
#define _FILE_SYSTEM_

#define ADDRESS_DISK_IMG    0x13400
#define FILE_CONTENT_HEAD_ADDRESS    0x15800
#define DISK_SECTOR_SIZE    0x200

typedef struct file_info{
    unsigned char name[8], ext[3], type;
    char reserve[10];   //微软保留字节
    unsigned short time, data, clustno;
    unsigned int size;
}FileInfo;

//装文件内容
typedef struct buffer{
    unsigned char* pBuffer;
    int length;
}BUFFER;

//加载文件信息
void file_load_content(char* name,BUFFER* buffer);

#endif