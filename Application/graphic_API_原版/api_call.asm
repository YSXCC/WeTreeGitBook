[map symbols app_c.map]
[SECTION .s32]
BITS 32

call main


mov  edx, 4             ; 返回内核
int  02Dh

; kernel_api的编号为 1   打印字符
api_putchar:
  mov edx, 1
  mov al, [esp + 4]
  int 02Dh
  ret

  ; kernel_api的编号为 2   打印字符串
api_putstr:             ; void api_putstr(char* s)
  push ebx
  mov  edx, 2
  mov  ebx, [esp + 8]
  int  02Dh
  pop  ebx
  ret

  ; kernel_api的编号为 5   窗口相关属性
api_openwin:            ; int api_openwin(char*buf, int xsiz, int ysiz, int col_inv, char*title)
  push edi
  push esi
  push ebx
  mov  edx, 5
  mov  ebx, [esp+16]    ; buf       缓冲区地址
  mov  esi, [esp+20]    ; xsiz      长
  mov  edi, [esp+24]    ; ysiz      高
  mov  eax, [esp+28]    ; col_inv   透明色
  mov  ecx, [esp+32]    ; title     标题
  int  02Dh
  pop  ebx
  pop  esi
  pop  edi
  ret

  ; kernel_api的编号为 6   窗口字符串相关属性
 api_putstrwin:         ; void api_putstrwin(int win, int x, int y, int col, int len, char* str)
  push edi
  push esi
  push ebp
  push ebx
  mov  edx, 6
  mov  ebx, [esp+20]    ; win 窗口句柄
  mov  esi, [esp+24]    ; x   字符串在窗口中的起始x坐标
  mov  edi, [esp+28]    ; y   字符串在窗口中的起始y坐标
  mov  eax, [esp+32]    ; col 字符的颜色
  mov  ecx, [esp+36]    ; len 字符的个数
  mov  ebp, [esp+40]    ; str 字符串的地址
  int  02Dh
  pop  ebx
  pop  ebp
  pop  esi
  pop  edi
  ret

  ; kernel_api的编号为 7   窗口颜色绘制
 api_boxfilwin:         ; void api_boxfilwin(int win, int x0, int y0,int x1, int y1, int col)
  push edi
  push esi
  push ebp
  push ebx
  mov  edx, 7
  mov  ebx, [esp+20]    ; win   窗口句柄
  mov  eax, [esp+24]    ; x0    色块的起始x坐标
  mov  ecx, [esp+28]    ; y0    色块的起始y坐标
  mov  esi, [esp+32]    ; x1    色块的结束x坐标
  mov  edi, [esp+36]    ; y1    色块的结束y坐标
  mov  ebp, [esp+40]    ; col   色块的颜色

  int 02DH
  pop  ebx
  pop  ebp
  pop  esi
  pop  edi
  ret

  ; kernel_api的编号为 11   窗口画一个点
api_point:              ; void api_point(int win, int x, int y, int col)
  push edi
  push esi
  push ebx
  mov  edx, 11
  mov  ebx, [esp+16]    ; win   窗口句柄
  mov  esi, [esp+20]    ; x     点的X坐标
  mov  edi, [esp+24]    ; y     点的Y坐标
  mov  eax, [esp+28]    ; col   点的颜色
  int  02Dh
  pop  ebx
  pop  esi
  pop  edi
  ret

  ; kernel_api的编号为 12   刷新图层
api_refreshwin:         ; void api_refreshwin(int win, int x0, int y0, int x1, int y1)
  push  edi
  push  esi
  push  ebx
  mov   edx, 12
  mov   ebx, [esp+16]   ; win   窗口句柄
  mov   eax, [esp+20]   ; x0    起始x
  mov   ecx, [esp+24]   ; y0    起始y
  mov   esi, [esp+28]   ; x1    结束x
  mov   edi, [esp+32]   ; y1    结束y
  int   02Dh
  pop   ebx
  pop   esi
  pop   edi
  ret

  ; kernel_api的编号为 13   画直线
api_linewin:            ; void api_linewin(int win, int x0, int y0, int x1, int y1, int col)
  push edi
  push esi
  push ebp
  push ebx
  mov  edx, 13
  mov  ebx, [esp+20]    ; win   窗口句柄
  mov  eax, [esp+24]    ; x0    起始x
  mov  ecx, [esp+28]    ; y0    起始y
  mov  esi, [esp+32]    ; x1    结束x
  mov  edi, [esp+36]    ; y1    结束y
  mov  ebp, [esp+40]    ; col   直线颜色
  int  02Dh

  pop  ebx
  pop  ebp
  pop  esi
  pop  edi
  ret

%include "app.asm"