#include "file_system.h"
#include "memory_util.h"
#include "windows_init.h"

extern MemoryManage* memman;

//加载文件信息
void file_load_content(char* name,BUFFER* buffer){
    FileInfo* file_info = (FileInfo* )(ADDRESS_DISK_IMG);
    char* file_name = (char*)memman_alloc(memman,13);
    file_name[12] = 0;
    while(file_info->name[0] != 0){
        int name_index;
        for(name_index = 0;name_index < 8;name_index++){    //取文件名
            if(file_info->name[name_index] != 0){
                file_name[name_index] = file_info->name[name_index];
            }else{
                break;
            }
        }
        int ext_index = 0;
        file_name[name_index] = '.';
        name_index++;

        for(ext_index = 0;ext_index < 3;ext_index++){    //取拓展名
            file_name[name_index] = file_info->ext[ext_index];
            name_index++;
        }
        file_name[name_index] = 0;

        if(strcmp(name,file_name) == 1){
            buffer->pBuffer = (char*)memman_alloc_4k(memman,file_info->size);
            buffer->length  = file_info->size;
            char* p = (char*)FILE_CONTENT_HEAD_ADDRESS;
            p += file_info->clustno * DISK_SECTOR_SIZE;
            int size = file_info->size;
            int t = 0;
            for(t = 0; t < size; t++){
                buffer->pBuffer[t] = p[t];
            }
            break;
        }
        file_info++;
    }
    memman_free(memman,(unsigned int)file_name,13);
}