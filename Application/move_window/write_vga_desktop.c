//自定义颜色，其实就是索引// #define  COL8_00FF00  2 //亮绿
#define COL8_000000 0  //全黑
#define COL8_FF0000 1  //纯红
#define COL8_448CBB 2  //不知道什么，但是看起来很舒服
#define COL8_FFFF00 3  //亮黄
#define COL8_0000FF 4  //亮蓝
#define COL8_FF00FF 5  //亮紫
#define COL8_00FFFF 6  //青绿
#define COL8_FFFFFF 7  //全白
#define COL8_C6C6C6 8  //亮灰
#define COL8_840000 9  //暗红
#define COL8_008400 10 //暗绿
#define COL8_848400 11 //暗黄
#define COL8_000084 12 //暗蓝
#define COL8_840084 13 //暗紫
#define COL8_008484 14 //浅暗蓝
#define COL8_848484 15 //暗灰

#define PORT_KEYDAT 0x0060
#define PIC_OCW2 0x20
#define PIC1_OCW2 0xA0
#include "mem_util.h"
#include "win_sheet.h"
#include "timer.h"
#include "global_define.h"
#include "multi_task.h"
void cmd_dir();
void asm_end_app(int *);
void kill_process();
void cons_putstr(char *s);
struct MEMMAN *memman = (struct MEMMAN *)0x100000;
void asm_cons_putchar();

char get_font_data(int c, int offset);
void func_hlt();
void io_hlt(void);
void io_cli(void);
void io_sti(void);
int io_load_eflags(void);
void io_store_eflags(int eflags);
void init_palette(void);
void set_palette(int start, int end, unsigned char *rgb);
void boxfill8(unsigned char *vram, int xsize, unsigned char c, int x, int y,
              int x0, int y0);

int get_leds();
void start_app(int eip, int cs, int esp, int ds, int *esp0);

int g_hlt = 0;

struct CONSOLE
{
    struct SHEET *sht;
    int cur_x, cur_y, cur_c;
    char s[2];
    struct TIMER *timer;
};

static struct CONSOLE g_Console;

void cons_putchar(char chr, char move);

static char keytable[0x54] = {
    0, 0, '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '^', 0, 0,
    'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', '@', '[', 0, 0, 'A', 'S',
    'D', 'F', 'G', 'H', 'J', 'K', 'L', ';', ':', 0, 0, ']', 'Z', 'X', 'C', 'V',
    'B', 'N', 'M', ',', '.', '/', 0, '*', 0, ' ', 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, '7', '8', '9', '-', '4', '5', '6', '+', '1',
    '2', '3', '0', '.'};

static char keytable1[0x90] = {
    0, 0, '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '=', '~', 0, 0,
    'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', '`', '{', 0, 0, 'A', 'S',
    'D', 'F', 'G', 'H', 'J', 'K', 'L', '+', '*', 0, 0, '}', 'Z', 'X', 'C', 'V',
    'B', 'N', 'M', '<', '>', '?', 0, '*', 0, ' ', 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, '7', '8', '9', '-', '4', '5', '6', '+', '1',
    '2', '3', '0', '.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, '_', 0, 0, 0, 0, 0, 0, 0, 0, 0, '|', 0, 0};

int key_shift = 0;
int caps_lock = 0;

struct BOOTINFO
{
    char *vgaRam;
    short screenX, screenY;
};

void initBootInfo(struct BOOTINFO *pBootInfo);

extern char systemFont[16];

void showFont8(char *vram, int xsize, int x, int y, char c, char *font);

void showString(struct SHTCTL *shtctl, struct SHEET *sht, int x, int y, char color, unsigned char *s);

void putblock(char *vram, int vxsize, int pxsize,
              int pysize, int px0, int py0, char *buf, int bxsize);

void init_mouse_cursor(char *mouse, char bc);
void intHandlerFromC(char *esp);

static struct BOOTINFO bootInfo;

static char keyval[5] = {'0', 'X', 0, 0, 0};

static struct FIFO8 keyinfo;
static struct FIFO8 mouseinfo;

static char keybuf[32];
static char mousebuf[128];

struct MOUSE_DEC
{
    unsigned char buf[3], phase;
    int x, y, btn;
};

static struct MOUSE_DEC mdec;

static struct FIFO8 timerinfo;
static char timerbuf[8];

char charToHexVal(char c);
char *charToHexStr(unsigned char c);
char *intToHexStr(unsigned int d);

void init_keyboard(void);
void enable_mouse(struct MOUSE_DEC *mdec);

void show_mouse_info(struct SHTCTL *shtctl, struct SHEET *sht_back, struct SHEET *sht_mouse);
int mouse_decode(struct MOUSE_DEC *mdec, unsigned char dat);

struct AddrRangeDesc
{
    unsigned int baseAddrLow;
    unsigned int baseAddrHigh;
    unsigned int lengthLow;
    unsigned int lengthHigh;
    unsigned int type;
};

int get_memory_block_count(void);
char *get_adr_buffer(void);
void showMemoryInfo(struct SHTCTL *shtctl, struct SHEET *sht, struct AddrRangeDesc *desc, char *vram, int page, int xsize, int color);

void init_screen8(char *vram, int x, int y);

struct SHEET *message_box(struct SHTCTL *shtctl, char *title);
void make_window8(struct SHTCTL *shtctl, struct SHEET *sht, char *title, char act);

static int mx = 0, my = 0, mmx = -1, mmy = -1; //用来记录鼠标按下时的坐标
static int xsize = 0, ysize = 0;
static unsigned char *buf_back, buf_mouse[256];
#define COLOR_INVISIBLE 99
#define KEY_RETURN 0x1C

void make_textbox8(struct SHEET *sht, int x0, int y0, int sx, int sy, int c);
static struct SHEET *shtMsgBox;
static struct SHTCTL *shtctl;
static struct SHEET *sht_back, *sht_mouse;
static struct SHEET *mouse_clicked_sht;

void set_cursor(struct SHTCTL *shtctl, struct SHEET *sheet, int cur_x, int cur_y, int cursor_c);

struct SHEET *launch_console();
void console_task(struct SHEET *sheet, int memtotal);

void make_wtitle8(struct SHTCTL *shtctl, struct SHEET *sht, char *title, char act);

static struct TASK *task_cons = 0;
static struct TASK *task_main = 0;

char transferScanCode(int data);

int isSpecialKey(int data);

int cons_newline(int cursor_y, struct SHEET *sheet);

void file_loadfile(char *fileName, struct Buffer *pBuffer);

int KEY_CONTROL = 0x1D;

void CMain(void)
{

    initBootInfo(&bootInfo);

    unsigned char *buf_win_b;
    struct SHEET *sht_win_b[3];
    static struct TASK *task_b[3];

    char *vram = bootInfo.vgaRam;
    xsize = bootInfo.screenX, ysize = bootInfo.screenY;

    struct TIMER *timer, *timer2, *timer3;

    init_pit();

    fifo8_init(&timerinfo, 8, timerbuf, 0);
    timer = timer_alloc();
    timer_init(timer, &timerinfo, 10);
    timer_settime(timer, 100);

    timer2 = timer_alloc();
    timer_init(timer2, &timerinfo, 2);
    timer_settime(timer2, 300);

    timer3 = timer_alloc();
    timer_init(timer3, &timerinfo, 1);
    timer_settime(timer3, 50);

    fifo8_init(&keyinfo, 32, keybuf, 0);
    fifo8_init(&mouseinfo, 128, mousebuf, 0);

    init_palette();
    init_keyboard();

    int memCnt = get_memory_block_count();

    struct AddrRangeDesc *memDesc = (struct AddrRangeDesc *)get_adr_buffer();
    memman_init(memman);
    memman_free(memman, 0x001008000, 0x3FEE8000);

    shtctl = shtctl_init(memman, vram, xsize, ysize);
    sht_back = sheet_alloc(shtctl);
    sht_mouse = sheet_alloc(shtctl);
    buf_back = (unsigned char *)memman_alloc_4k(memman, xsize * ysize);

    sheet_setbuf(sht_back, buf_back, xsize, ysize, COLOR_INVISIBLE);
    sheet_setbuf(sht_mouse, buf_mouse, 16, 16, COLOR_INVISIBLE);

    init_screen8(buf_back, xsize, ysize);

    init_mouse_cursor(buf_mouse, COLOR_INVISIBLE);
    sheet_slide(shtctl, sht_back, 0, 0);

    mx = (xsize - 16) / 2;
    my = (ysize - 28 - 16) / 2;
    sheet_slide(shtctl, sht_mouse, mx, my);

    int cursor_x = 8, cursor_c = COL8_FFFFFF;
    shtMsgBox = message_box(shtctl, "counter");

    sheet_updown(shtctl, sht_back, 0);

    sheet_updown(shtctl, sht_mouse, 100);

    io_sti();
    enable_mouse(&mdec);

    //switch task

    static struct TSS32 tss_b, tss_a;
    static struct TASK *task_a;

    task_a = task_init(memman);
    keyinfo.task = task_a;
    task_main = task_a;
    task_run(task_a, 0, 0);

    struct SHEET *sht_cons = launch_console();
    //switch task

    int data = 0;
    int count = 0;
    int i = 0;
    int pos = 176;
    int stop_task_A = 0;
    int key_to = 0;
    int couser_c = COL8_000000;

    for (;;)
    {

        //  io_cli();
        if (fifo8_status(&keyinfo) + fifo8_status(&mouseinfo) +
                fifo8_status(&timerinfo) ==
            0)
        {

            io_sti();
        }
        else if (fifo8_status(&keyinfo) != 0)
        {
            io_sti();
            data = fifo8_get(&keyinfo);
            // char *p = intToHexStr(data);
            // showString(shtctl, sht_back, 0, pos, COL8_FFFFFF, p);
            // pos += 16;
            transferScanCode(data);
            if (data == KEY_CONTROL && key_shift != 0 && task_cons->tss.ss0 != 0)
            {
                cons_putstr("kill process");
                io_cli();
                int addr_code32 = get_code32_addr();
                task_cons->tss.eip = (int)kill_process - addr_code32;
                io_sti();
            }

            if (data == 0x10)
            {
                sheet_updown(shtctl, shtctl->sheets[1], shtctl->top - 1);
            }

            if (data == 0x0f)
            {
                int msg = -1;

                if (key_to == 0)
                {
                    key_to = 1;
                    make_wtitle8(shtctl, shtMsgBox, "task_a", 0);
                    make_wtitle8(shtctl, sht_cons, "console", 1);
                    set_cursor(shtctl, shtMsgBox, cursor_x, 28, COL8_FFFFFF);
                    msg = PROC_RESUME;
                }
                else
                {
                    key_to = 0;
                    make_wtitle8(shtctl, shtMsgBox, "task_a", 1);
                    make_wtitle8(shtctl, sht_cons, "console", 0);
                    fifo8_put(&task_cons->fifo, 0x58);
                    msg = PROC_PAUSE;
                }

                sheet_refresh(shtctl, shtMsgBox, 0, 0, shtMsgBox->bxsize, 21);
                sheet_refresh(shtctl, sht_cons, 0, 0, sht_cons->bxsize, 21);
                send_message(task_a, task_cons, msg);
            }

            if (key_to == 0)
            {
                if (transferScanCode(data) != 0 && cursor_x < 144)
                {
                    set_cursor(shtctl, shtMsgBox, cursor_x, 28, COL8_FFFFFF);
                    char c = transferScanCode(data);
                    char buf[2] = {c, 0};
                    showString(shtctl, shtMsgBox, cursor_x, 28, COL8_000000, buf);
                    cursor_x += 8;

                    stop_task_A = 1;

                    set_cursor(shtctl, shtMsgBox, cursor_x, 28, cursor_c);
                }
            }
            else if (isSpecialKey(data) == 0)
            {
                fifo8_put(&task_cons->fifo, data);
                if (fifo8_status(&keyinfo) == 0)
                {
                    task_sleep(task_a);
                }
            }
        }
        else if (fifo8_status(&mouseinfo) != 0)
        {
            show_mouse_info(shtctl, sht_back, sht_mouse);
        }

        if (fifo8_status(&timerinfo) != 0)
        {
            io_sti();
            int i = fifo8_get(&timerinfo);

            if (i != 0)
            {
                timer_init(timer3, &timerinfo, 0);
                cursor_c = COL8_000000;
            }
            else
            {
                timer_init(timer3, &timerinfo, 1);
                cursor_c = COL8_FFFFFF;
            }

            timer_settime(timer3, 50);
            if (key_to == 0)
            {
                set_cursor(shtctl, shtMsgBox, cursor_x, 28, cursor_c);
            }
            else
            {
                set_cursor(shtctl, shtMsgBox, cursor_x, 28, COL8_FFFFFF);
            }
        }
    }
}

void set_cursor(struct SHTCTL *shtctl, struct SHEET *sheet, int cursor_x, int cursor_y, int cursor_c)
{
    boxfill8(sheet->buf, sheet->bxsize, cursor_c, cursor_x,
             cursor_y, cursor_x + 7, cursor_y + 15);
    sheet_refresh(shtctl, sheet, cursor_x, cursor_y, cursor_x + 8, cursor_y + 16);
}

int isSpecialKey(int data)
{
    transferScanCode(data);

    if (data == 0x3a || data == 0x1d || data == 0xba || data == 0x2a || data == 0x36 || data == 0xaa || data == 0xb6)
    {
        return 1;
    }

    return 0;
}

char transferScanCode(int data)
{
    if (data == 0x2a)
    { //left shift key down
        key_shift |= 1;
    }

    if (data == 0x36)
    {
        //right shift key down
        key_shift |= 2;
    }

    if (data == 0xaa)
    {
        //left shift key up
        key_shift &= ~1;
    }

    if (data == 0xb6)
    {
        //right shift key up
        key_shift &= ~2;
    }

    //caps lock
    if (data == 0x3a)
    {
        if (caps_lock == 0)
        {
            caps_lock = 1;
        }
        else
        {
            caps_lock = 0;
        }
    }

    if (data == 0x2a || data == 0x36 || data == 0xaa || data == 0xb6 ||
        data >= 0x54 || data == 0x3a)
    {
        return 0;
    }

    char c = 0;

    if (key_shift == 0 && data < 0x54 && keytable[data] != 0)
    {
        c = keytable[data];
        if ('A' <= c && c <= 'Z' && caps_lock == 0)
        {
            c += 0x20;
        }
    }
    else if (key_shift != 0 && data < 0x80 && keytable1[data] != 0)
    {
        c = keytable1[data];
    }
    else
    {
        c = 0;
    }

    return c;
}

struct SHEET *launch_console()
{
    struct SHEET *sht_cons = sheet_alloc(shtctl);
    unsigned char *buf_cons = (unsigned char *)memman_alloc_4k(memman, 256 * 165);
    sheet_setbuf(sht_cons, buf_cons, 256, 165, COLOR_INVISIBLE);
    make_window8(shtctl, sht_cons, "console", 0);
    make_textbox8(sht_cons, 8, 28, 240, 128, COL8_000000);

    struct TASK *task_console = task_alloc();
    int addr_code32 = get_code32_addr();
    task_console->tss.ldtr = 0;
    task_console->tss.iomap = 0x40000000;
    task_console->tss.eip = (int)(((int)console_task) - addr_code32);

    task_console->tss.es = 0;
    task_console->tss.cs = 1 * 8; //6 * 8;
    task_console->tss.ss = 4 * 8;
    task_console->tss.ds = 3 * 8;
    task_console->tss.fs = 0;
    task_console->tss.gs = 2 * 8;
    task_console->tss.esp -= 8;
    *((int *)(task_console->tss.esp + 4)) = (int)sht_cons;
    *((int *)(task_console->tss.esp + 8)) = memman_total(memman);
    task_run(task_console, 1, 5);

    sheet_slide(shtctl, sht_cons, 32, 4);
    sheet_updown(shtctl, sht_cons, 1);

    //set global task_cons
    task_cons = task_console;

    return sht_cons;
}

void kill_process()
{
    cons_newline(g_Console.cur_y, g_Console.sht);
    g_Console.cur_y += 16;
    asm_end_app(&(task_cons->tss.esp0));
}

static struct Buffer buffer;

void cmd_dir()
{
    struct FILEINFO *finfo = (struct FILEINFO *)(ADR_DISKIMG);
    char *s = (char *)memman_alloc(memman, 13);
    s[12] = 0;
    while (finfo->name[0] != 0)
    {

        int k;
        for (k = 0; k < 8; k++)
        {
            if (finfo->name[k] != 0)
            {
                s[k] = finfo->name[k];
            }
            else
            {
                break;
            }
        }

        int t = 0;
        s[k] = '.';
        k++;
        for (t = 0; t < 3; t++)
        {
            s[k] = finfo->ext[t];
            k++;
        }

        showString(shtctl, g_Console.sht, 16, g_Console.cur_y, COL8_FFFFFF, s);
        int offset = 16 + 8 * 15;
        char *p = intToHexStr(finfo->size);
        showString(shtctl, g_Console.sht, offset, g_Console.cur_y, COL8_FFFFFF, p);
        g_Console.cur_y = cons_newline(g_Console.cur_y, g_Console.sht);
        finfo++;
    }

    memman_free(memman, (int)s, 13);
}

void cmd_type(char *cmdline)
{
    char *name = (char *)memman_alloc(memman, 13);
    name[12] = 0;
    int p = 0;
    int x = 5;
    for (x = 5; x < 17; x++)
    {
        if (cmdline[x] != 0)
        {
            name[p] = cmdline[x];
            p++;
        }
        else
        {
            break;
        }
    }

    name[p] = 0;
    struct FILEINFO *finfo = (struct FILEINFO *)(ADR_DISKIMG);
    while (finfo->name[0] != 0)
    {
        char s[13];
        s[12] = 0;
        int k;
        for (k = 0; k < 8; k++)
        {
            if (finfo->name[k] != 0)
            {
                s[k] = finfo->name[k];
            }
            else
            {
                break;
            }
        }

        int t = 0;
        s[k] = '.';
        k++;
        for (t = 0; t < 3; t++)
        {
            s[k] = finfo->ext[t];
            k++;
        }

        if (strcmp(name, s) == 1)
        {
            char *p = (char *)FILE_CONTENT_HEAD_ADDR;
            p += finfo->clustno * DISK_SECTOR_SIZE;
            int sz = finfo->size;
            char c[2];
            int t = 0;
            g_Console.cur_x = 16;
            for (t = 0; t < sz; t++)
            {
                c[0] = p[t];
                c[1] = 0;
                if (c[0] == 0x09)
                {
                    //handle tab key
                    for (;;)
                    {
                        showString(shtctl, g_Console.sht, g_Console.cur_x,
                                   g_Console.cur_y, COL8_FFFFFF, " ");
                        g_Console.cur_x += 8;

                        if (g_Console.cur_x == 8 + 240)
                        {
                            g_Console.cur_x = 8;
                            g_Console.cur_y = cons_newline(g_Console.cur_y, g_Console.sht);
                        }

                        if ((g_Console.cur_x - 8) & 0x1f == 0)
                        {
                            break;
                        }
                    }
                }
                else if (c[0] == 0x0a)
                {
                    //handle return
                    g_Console.cur_x = 8;
                    g_Console.cur_y = cons_newline(g_Console.cur_y, g_Console.sht);
                }
                else if (c[0] == 0x0d)
                {
                    //do nothing
                }
                else
                {
                    showString(shtctl, g_Console.sht, g_Console.cur_x, g_Console.cur_y, COL8_FFFFFF, c);
                    g_Console.cur_x += 8;
                    if (g_Console.cur_x == 8 + 240)
                    {
                        g_Console.cur_x = 16;
                        g_Console.cur_y = cons_newline(g_Console.cur_y, g_Console.sht);
                    }
                }
            }

            break;
        }

        finfo++;
    }

    g_Console.cur_y = cons_newline(g_Console.cur_y, g_Console.sht);
    memman_free(memman, (int)name, 13);
    g_Console.cur_x = 16;
}

void cmd_mem(int memtotal)
{
    char *s = intToHexStr(memtotal / (1024));
    showString(shtctl, g_Console.sht, 16, g_Console.cur_y, COL8_FFFFFF, "free ");
    showString(shtctl, g_Console.sht, 52, g_Console.cur_y, COL8_FFFFFF, s);
    showString(shtctl, g_Console.sht, 126, g_Console.cur_y, COL8_FFFFFF, " KB");
    g_Console.cur_y = cons_newline(g_Console.cur_y, g_Console.sht);
}

void cmd_cls()
{
    int x = 8;
    int y = 28;
    for (y = 28; y < 28 + 128; y++)
        for (x = 8; x < 8 + 240; x++)
        {
            g_Console.sht->buf[x + y * g_Console.sht->bxsize] = COL8_000000;
        }

    sheet_refresh(shtctl, g_Console.sht, 8, 28, 8 + 240, 28 + 128);
    g_Console.cur_y = 28;
    showString(shtctl, g_Console.sht, 8, 28, COL8_FFFFFF, ">");
}

void cmd_hlt()
{
    file_loadfile("hlt.exe", &buffer);
    struct SEGMENT_DESCRIPTOR *gdt = (struct SEGMENT_DESCRIPTOR *)get_addr_gdt();
    set_segmdesc(gdt + 11, 0xfffff, (int)buffer.pBuffer, 0x409a + 0x60);
    //new memory
    char *q = (char *)memman_alloc_4k(memman, 64 * 1024);
    buffer.pDataSeg = (unsigned char *)q;
    //  char *q = (char*) memman_alloc(memman, 1024);
    set_segmdesc(gdt + 12, 64 * 1024 - 1, (int)q, 0x4092 + 0x60);
    // set_segmdesc(gdt+12, 1024 - 1,(int) q ,0x4092 + 0x60);
    struct TASK *task = task_now();
    task->tss.esp0 = 0;
    start_app(0, 11 * 8, 64 * 1024, 12 * 8, &(task->tss.esp0));
    // start_app(0, 11*8, 1024, 12*8, &(task->tss.esp0));
    memman_free_4k(memman, (unsigned int)buffer.pBuffer, buffer.length);
    memman_free_4k(memman, (unsigned int)q, 64 * 1024);
    // memman_free(memman, (unsigned int)q, 1024);
}

void console_task(struct SHEET *sheet, int memtotal)
{

    struct TIMER *timer;
    struct TASK *task = task_now();
    int i, cursor_c = COL8_000000;

    int x = 0, y = 0;
    char *fifobuf = (char *)memman_alloc(memman, 128);
    char *cmdline = (char *)memman_alloc(memman, 30);

    g_Console.sht = sheet;
    g_Console.cur_x = 16;
    g_Console.cur_y = 28;
    g_Console.cur_c = -1;

    fifo8_init(&task->fifo, 128, fifobuf, task);
    timer = timer_alloc();
    timer_init(timer, &task->fifo, 1);
    timer_settime(timer, 50);
    g_Console.timer = timer;

    showString(shtctl, sheet, 8, 28, COL8_FFFFFF, ">");
    int pos = 0;

    struct FILEINFO *finfo = (struct FILEINFO *)(ADR_DISKIMG);
    int hlt = 0;

    for (;;)
    {
        io_cli();
        if (fifo8_status(&task->fifo) == 0)
        {
            //task_sleep(task_cons);
            io_sti();
        }
        else
        {
            io_sti();
            i = fifo8_get(&task->fifo);

            if (hlt == 1)
            {
                showString(shtctl, sht_back, 0, 232, COL8_000000, "keyboard receive");
            }

            if (i <= 1 && cursor_c >= 0)
            {
                if (i != 0)
                {
                    timer_init(timer, &task->fifo, 0);
                    cursor_c = COL8_FFFFFF;
                }
                else
                {
                    timer_init(timer, &task->fifo, 1);
                    cursor_c = COL8_000000;
                }

                timer_settime(timer, 50);
            }
            else if (i == PROC_RESUME)
            {
                cursor_c = COL8_FFFFFF;
                timer_init(timer, &task->fifo, 0);
                timer_settime(timer, 50);
            }
            else if (i == PROC_PAUSE)
            {
                set_cursor(shtctl, sheet, g_Console.cur_x, g_Console.cur_y, COL8_000000);
                cursor_c = -1;
                task_run(task_main, -1, 0);
            }
            else if (i == KEY_RETURN)
            {

                set_cursor(shtctl, sheet, g_Console.cur_x, g_Console.cur_y, COL8_000000);
                cmdline[g_Console.cur_x / 8 - 2] = 0;
                g_Console.cur_y = cons_newline(g_Console.cur_y, sheet);
                g_Console.cur_x = 16;
                if (strcmp(cmdline, "mem") == 1)
                {
                    cmd_mem(memtotal);
                }
                else if (strcmp(cmdline, "cls") == 1)
                {
                    cmd_cls();
                }
                else if (strcmp(cmdline, "hlt") == 1)
                {
                    g_hlt = 1;
                    cmd_hlt();
                }
                else if (strcmp(cmdline, "dir") == 1)
                {
                    cmd_dir();
                }
                else if (cmdline[0] == 't' && cmdline[1] == 'y' &&
                         cmdline[2] == 'p' && cmdline[3] == 'e')
                {
                    cmd_type(cmdline);
                }
            }
            else if (i == 0x0e && g_Console.cur_x > 8)
            {
                set_cursor(shtctl, sheet, g_Console.cur_x, g_Console.cur_y, COL8_000000);
                g_Console.cur_x -= 8;
                set_cursor(shtctl, sheet, g_Console.cur_x, g_Console.cur_y, COL8_000000);
            }
            else
            {
                char c = transferScanCode(i);
                if (g_Console.cur_x < 240 && c != 0)
                {
                    cmdline[g_Console.cur_x / 8 - 2] = c;
                    cmdline[g_Console.cur_x / 8 - 1] = 0;
                    cons_putchar(c, 1);
                }
            }

            if (cursor_c >= 0)
            {
                set_cursor(shtctl, sheet, g_Console.cur_x, g_Console.cur_y, cursor_c);
            }
        }
    }
}

void cons_putstr(char *s)
{
    for (; *s != 0; s++)
    {
        cons_putchar(*s, 1);
    }

    return;
}

int api_linewin(struct SHEET *sht, int x0, int y0, int x1, int y1, int col) //算直线方程，得到坐标
{
    int i, x, y, len, dx, dy;
    dx = x1 - x0; //水平增量，为正表示x轴正方向
    dy = y1 - y0; //垂直增量，为正表示y轴正方向
    x = x0 << 10;
    y = y0 << 10;

    if (dx < 0)
    {
        dx = -dx;
    }
    if (dy < 0)
    {
        dy = -dy;
    }
    //谁长谁就做步长参数
    if (dx >= dy)
    {
        len = dx + 1;
        if (x0 > x1) //x轴负方向
        {
            dx = -1024;
        }
        else
        {
            dx = 1024;
        }

        if (y0 <= y1)
        {
            dy = ((y1 - y0 + 1) << 10) / len;
        }
        else
        {
            dy = ((y1 - y0 - 1) << 10) / len;
        }
    }
    else
    {
        len = dy + 1;
        if (y0 > y1) //y轴负方向
        {
            dy = -1024;
        }
        else
        {
            dy = 1024;
        }

        if (x0 <= x1)
        {
            dx = ((x1 - x0 + 1) << 10) / len;
        }
        else
        {
            dx = ((x1 - x0 - 1) << 10) / len;
        }
    }
    for (i = 0; i < len; i++)
    {
        sht->buf[(y >> 10) * sht->bxsize + (x >> 10)] = col;
        x += dx;
        y += dy;
    }
}

int handle_keyboard(struct TASK *task, int eax, int *reg)
{
    int i;
    struct TIMER *timer = g_Console.timer;
    for (;;)
    {
        if (fifo8_status(&task->fifo) == 0)
        {
            if (eax != 0)
            {
                continue;
            }
            else
            {
                io_sti();
                reg[7] = -1;
                return 0;
            }
        }

        i = fifo8_get(&task->fifo);
        if (i <= 1)
        {
            timer_init(timer, &task->fifo, 1);
            timer_settime(timer, 50);
        }
        else if (i == 2)
        {
            g_Console.cur_c = COL8_FFFFFF;
        }
        else
        {
            reg[7] = i;
            return 0;
        }
    }

    return 0;
}

int *kernel_api(int edi, int esi, int ebp, int esp,
                int ebx, int edx, int ecx, int eax)
{
    struct TASK *task = task_now();
    struct SHEET *sht;

    int *reg = &eax + 1;

    if (edx == 1)
    {
        cons_putchar(eax & 0xff, 1);
    }
    else if (edx == 2)
    {
        cons_putstr((char *)(buffer.pBuffer + ebx));
    }
    else if (edx == 4)
    {
        task->tss.ss0 = 0;
        char *p = intToHexStr(task->tss.esp0);
        if (task == task_cons)
        {
            // showString(shtctl, sht_back, 0, 215, COL8_000000, p);
        }
        // return &(task->tss.esp0);
        return &task_cons->tss.esp0;
    }
    else if (edx == 5)
    {
        sht = sheet_alloc(shtctl);
        sheet_setbuf(sht, (char *)(ebx + buffer.pDataSeg), esi, edi, eax);
        make_window8(shtctl, sht, (char *)(ecx + buffer.pBuffer), 0);
        sheet_slide(shtctl, sht, 100, 50);
        sheet_updown(shtctl, sht, 3);
        reg[7] = (int)sht;
    }
    else if (edx == 6)
    {
        sht = (struct SHEET *)ebx;
        showString(shtctl, sht, esi, edi, eax, (char *)(ebp + buffer.pBuffer));
        sheet_refresh(shtctl, sht, esi, edi, esi + ecx * 8, edi + 16);
    }
    else if (edx == 7)
    {
        sht = (struct SHEET *)ebx;
        boxfill8(sht->buf, sht->bxsize, ebp, eax, ecx, esi, edi);
        sheet_refresh(shtctl, sht, eax, ecx, esi + 1, edi + 1);
    }
    else if (edx == 11) //绘制函数
    {
        sht = (struct SHEET *)ebx;
        sht->buf[sht->bxsize * edi + esi] = eax;
        // sheet_refresh(shtctl, sht, esi, edi, esi + 1, edi + 1);
    }
    else if (edx == 12) //刷新图像
    {
        sht = (struct SHEET *)ebx;
        sheet_refresh(shtctl, sht, eax, ecx, esi, edi);
    }
    else if (edx == 13) //画直线
    {
        sht = (struct SHEET *)ebx;
        api_linewin(sht, eax, ecx, esi, edi, ebp);
    }
    else if (edx == 14) //键盘关闭窗口api
    {
        sht = (struct SHEET *)ebx;
        sheet_free(shtctl, sht);
    }
    else if (edx == 15)
    {
        handle_keyboard(task, eax, reg); //监控键盘输入
    }

    return 0;
}

void cons_putchar(char c, char move)
{
    set_cursor(shtctl, g_Console.sht, g_Console.cur_x, g_Console.cur_y, COL8_000000);
    g_Console.s[0] = c;
    g_Console.s[1] = 0;
    showString(shtctl, g_Console.sht, g_Console.cur_x, g_Console.cur_y, COL8_FFFFFF, g_Console.s);
    g_Console.cur_x += 8;
}

int cons_newline(int cursor_y, struct SHEET *sheet)
{
    int x, y;

    if (cursor_y < 28 + 112)
    {
        cursor_y += 16;
    }
    else
    {
        for (y = 28; y < 28 + 112; y++)
        {
            for (x = 8; x < 8 + 240; x++)
            {
                sheet->buf[x + y * sheet->bxsize] =
                    sheet->buf[x + (y + 16) * sheet->bxsize];
            }
        }

        for (y = 28 + 112; y < 28 + 128; y++)
        {
            for (x = 8; x < 8 + 240; x++)
            {
                sheet->buf[x + y * sheet->bxsize] = COL8_000000;
            }
        }

        sheet_refresh(shtctl, sheet, 8, 28, 8 + 240, 28 + 128);
    }

    showString(shtctl, sheet, 8, cursor_y, COL8_FFFFFF, ">");
    return cursor_y;
}

void init_screen8(char *vram, int xsize, int ysize)
{
    boxfill8(vram, xsize, COL8_448CBB, 0, 0, xsize - 1, ysize - 29);
    boxfill8(vram, xsize, COL8_C6C6C6, 0, ysize - 28, xsize - 1, ysize - 28);
    boxfill8(vram, xsize, COL8_FFFFFF, 0, ysize - 27, xsize - 1, ysize - 27);
    boxfill8(vram, xsize, COL8_C6C6C6, 0, ysize - 26, xsize - 1, ysize - 1);

    boxfill8(vram, xsize, COL8_FFFFFF, 3, ysize - 24, 59, ysize - 24);
    boxfill8(vram, xsize, COL8_FFFFFF, 2, ysize - 24, 2, ysize - 4);
    boxfill8(vram, xsize, COL8_448CBB, 3, ysize - 4, 59, ysize - 4);
    boxfill8(vram, xsize, COL8_448CBB, 59, ysize - 23, 59, ysize - 5);
    boxfill8(vram, xsize, COL8_000000, 2, ysize - 3, 59, ysize - 3);
    boxfill8(vram, xsize, COL8_000000, 60, ysize - 24, 60, ysize - 3);

    boxfill8(vram, xsize, COL8_448CBB, xsize - 47, ysize - 24, xsize - 4, ysize - 24);
    boxfill8(vram, xsize, COL8_448CBB, xsize - 47, ysize - 23, xsize - 47, ysize - 4);
    boxfill8(vram, xsize, COL8_FFFFFF, xsize - 47, ysize - 3, xsize - 4, ysize - 3);
    boxfill8(vram, xsize, COL8_FFFFFF, xsize - 3, ysize - 24, xsize - 3, ysize - 3);
}

void computeMousePosition(struct SHTCTL *shtctl, struct SHEET *sht, struct MOUSE_DEC *mdec)
{
    mx += mdec->x;
    my += mdec->y;
    if (mx < 0)
    {
        mx = 0;
    }

    if (my < 0)
    {
        my = 0;
    }

    if (mx > xsize - 1)
    {
        mx = xsize - 1;
    }
    if (my > ysize - 1)
    {
        my = ysize - 1;
    }
}

void show_mouse_info(struct SHTCTL *shtctl, struct SHEET *sht_back, struct SHEET *sht_mouse)
{
    char *vram = buf_back;
    unsigned char data = 0;

    int j;
    struct SHEET *sht = 0;
    int x, y;

    io_sti();
    data = fifo8_get(&mouseinfo);
    if (mouse_decode(&mdec, data) != 0)
    {
        computeMousePosition(shtctl, sht_back, &mdec);

        sheet_slide(shtctl, sht_mouse, mx, my);
        if ((mdec.btn & 0x01) != 0)
        {
            //鼠标左键按下进入
            if (mmx < 0)
            {
                //遍历窗口，鼠标在哪
                for (j = shtctl->top - 1; j > 0; j--)
                {
                    sht = shtctl->sheets[j];
                    x = mx - sht->vx0;
                    y = my - sht->vy0;
                    if (0 <= x && x < sht->bxsize && 0 <= y && y < sht->bysize)
                    {
                        if (sht->buf[y * sht->bxsize + x] != sht->col_inv)
                        {
                            //找到包含鼠标的窗体，并且鼠标所在的窗体区域不属于窗体的透明区，那么调整窗体高度，让他显示在桌面上
                            sheet_updown(shtctl, sht, shtctl->top - 1);
                            if (3 <= x && x < sht->bxsize - 3 && 3 <= y && y < 21)
                            {
                                //如果鼠标落入窗体的标题栏，记录当前鼠标所在坐标，以及当前窗体的句柄
                                mmx = mx;
                                mmy = my;
                                mouse_clicked_sht = sht;
                            }

                            if (sht->bxsize - 21 <= x && x < sht->bxsize - 5 && 5 <= y && y < 19 && sht->task != 0)
                            {
                                //如果鼠标左键点击时，鼠标位于右上角的按钮范围内，则结束窗口对应的进程，同时将窗口从桌面上清除
                                io_cli();
                                sheet_free(shtctl, sht);
                                int addr_code32 = get_code32_addr();
                                sht->task->tss.eip = (int)kill_process - addr_code32;
                                io_sti();
                            }
                            break;
                        }
                    }
                }
            }
            else
            {
                //鼠标挪动后，计算当前位置与鼠标点击时所在位置的偏移，然后根据偏移挪动窗体
                x = mx - mmx;
                y = my - mmy;
                sheet_slide(shtctl, mouse_clicked_sht, mouse_clicked_sht->vx0 + x, mouse_clicked_sht->vy0 + y);
                mmx = mx;
                mmy = my;
            }
        }
        else
        {
            //鼠标左键松开后，把mmx重置为-1
            mmx = -1;
        }
    }
}

void initBootInfo(struct BOOTINFO *pBootInfo)
{
    pBootInfo->vgaRam = (char *)0xe0000000;
    pBootInfo->screenX = 640;
    pBootInfo->screenY = 480;
}

void showString(struct SHTCTL *shtctl, struct SHEET *sht, int x, int y, char color, unsigned char *s)
{
    int begin = x;
    int i = 0;
    for (; *s != 0x00; s++)
    {
        showFont8(sht->buf, sht->bxsize, x, y, color, systemFont + *s * 16);
        x += 8;
    }

    sheet_refresh(shtctl, sht, begin, y, x, y + 16);
}

void init_palette(void)
{
    static unsigned char table_rgb[16 * 3] = {
        0x00, 0x00, 0x00, //全黑
        0xff, 0x00, 0x00, //纯红
        //0x00,  0xff,  0x00,   //亮绿
        0x44, 0x8c, 0xbb, //不知道什么，但是看起来很舒服
        0xff, 0xff, 0x00, //亮黄
        0x00, 0x00, 0xff, //亮蓝
        0xff, 0x00, 0xff, //亮紫
        0x00, 0xff, 0xff, //浅亮
        0xff, 0xff, 0xff, //全白
        0xc6, 0xc6, 0xc6, //亮灰
        0x84, 0x00, 0x00, //暗红
        0x00, 0x84, 0x00, //暗绿
        0x84, 0x84, 0x00, //暗黄
        0x00, 0x00, 0x84, //暗蓝
        0x84, 0x00, 0x84, //暗紫
        0x00, 0x84, 0x84, //浅暗蓝
        0x84, 0x84, 0x84, //暗灰
    };

    set_palette(0, 15, table_rgb);
    return;
}

void set_palette(int start, int end, unsigned char *rgb)
{
    int i, eflags;
    eflags = io_load_eflags();
    io_cli();
    io_out8(0x03c8, start); //set  palette number
    for (i = start; i <= end; i++)
    {
        io_out8(0x03c9, rgb[0] / 4);
        io_out8(0x03c9, rgb[1] / 4);
        io_out8(0x03c9, rgb[2] / 4);

        rgb += 3;
    }

    io_store_eflags(eflags);
    return;
}

void boxfill8(unsigned char *vram, int xsize, unsigned char c,
              int x0, int y0, int x1, int y1)
{
    int x, y;
    for (y = y0; y <= y1; y++)
        for (x = x0; x <= x1; x++)
        {
            vram[y * xsize + x] = c;
        }
}

void showFont8(char *vram, int xsize, int x, int y, char c, char *font)
{
    int i;
    char d;

    for (i = 0; i < 16; i++)
    {
        d = font[i];
        if ((d & 0x80) != 0)
        {
            vram[(y + i) * xsize + x + 0] = c;
        }
        if ((d & 0x40) != 0)
        {
            vram[(y + i) * xsize + x + 1] = c;
        }
        if ((d & 0x20) != 0)
        {
            vram[(y + i) * xsize + x + 2] = c;
        }
        if ((d & 0x10) != 0)
        {
            vram[(y + i) * xsize + x + 3] = c;
        }
        if ((d & 0x08) != 0)
        {
            vram[(y + i) * xsize + x + 4] = c;
        }
        if ((d & 0x04) != 0)
        {
            vram[(y + i) * xsize + x + 5] = c;
        }
        if ((d & 0x02) != 0)
        {
            vram[(y + i) * xsize + x + 6] = c;
        }
        if ((d & 0x01) != 0)
        {
            vram[(y + i) * xsize + x + 7] = c;
        }
    }
}

void init_mouse_cursor(char *mouse, char bc)
{
    static char cursor[16][16] = {
        "*...............",
        "**..............",
        "*O*.............",
        "*OO*............",
        "*OOO*...........",
        "*OOOO*..........",
        "*OOOOO*.........",
        "*OOOOOO*........",
        "*OOOOOOO*.......",
        "*OOOO*****......",
        "*OO*O*..........",
        "*O*.*O*.........",
        "**..*O*.........",
        "*....*O*........",
        ".....*O*........",
        "......*........."};

    int x, y;
    for (y = 0; y < 16; y++)
    {
        for (x = 0; x < 16; x++)
        {
            if (cursor[y][x] == '*')
            {
                mouse[y * 16 + x] = COL8_000000;
            }
            if (cursor[y][x] == 'O')
            {
                mouse[y * 16 + x] = COL8_FFFFFF;
            }
            if (cursor[y][x] == '.')
            {
                mouse[y * 16 + x] = bc;
            }
        }
    }
}

void putblock(char *vram, int vxsize, int pxsize,
              int pysize, int px0, int py0, char *buf, int bxsize)
{
    int x, y;
    for (y = 0; y < pysize; y++)
        for (x = 0; x < pxsize; x++)
        {
            vram[(py0 + y) * vxsize + (px0 + x)] = buf[y * bxsize + x];
        }
}

void intHandlerFromC(char *esp)
{

    char *vram = bootInfo.vgaRam;
    int xsize = bootInfo.screenX, ysize = bootInfo.screenY;
    io_out8(PIC_OCW2, 0x20);
    unsigned char data = 0;
    data = io_in8(PORT_KEYDAT);
    fifo8_put(&keyinfo, data);
    return;
}

char charToHexVal(char c)
{
    if (c >= 10)
    {
        return 'A' + c - 10;
    }

    return '0' + c;
}

char *charToHexStr(unsigned char c)
{
    int i = 0;
    char mod = c % 16;
    keyval[3] = charToHexVal(mod);
    c = c / 16;
    keyval[2] = charToHexVal(c);

    return keyval;
}

char *intToHexStr(unsigned int d)
{
    static char str[11];
    str[0] = '0';
    str[1] = 'X';
    str[10] = 0;

    int i = 2;
    for (; i < 10; i++)
    {
        str[i] = '0';
    }

    int p = 9;
    while (p > 1 && d > 0)
    {
        int e = d % 16;
        d /= 16;
        if (e >= 10)
        {
            str[p] = 'A' + e - 10;
        }
        else
        {
            str[p] = '0' + e;
        }
        p--;
    }

    return str;
}

#define PORT_KEYDAT 0x0060
#define PORT_KEYSTA 0x0064
#define PORT_KEYCMD 0x0064
#define KEYSTA_SEND_NOTREADY 0x02
#define KEYCMD_WRITE_MODE 0x60
#define KBC_MODE 0x47

void wait_KBC_sendready()
{
    for (;;)
    {
        if ((io_in8(PORT_KEYSTA) & KEYSTA_SEND_NOTREADY) == 0)
        {
            break;
        }
    }
}

void init_keyboard(void)
{
    wait_KBC_sendready();
    io_out8(PORT_KEYCMD, KEYCMD_WRITE_MODE);
    wait_KBC_sendready();
    io_out8(PORT_KEYDAT, KBC_MODE);
    return;
}

#define KEYCMD_SENDTO_MOUSE 0xd4
#define MOUSECMD_ENABLE 0xf4

void enable_mouse(struct MOUSE_DEC *mdec)
{
    wait_KBC_sendready();
    io_out8(PORT_KEYCMD, KEYCMD_SENDTO_MOUSE);
    wait_KBC_sendready();
    io_out8(PORT_KEYDAT, MOUSECMD_ENABLE);

    mdec->phase = 0;
    return;
}

void intHandlerForMouse(char *esp)
{
    unsigned char data;
    io_out8(PIC1_OCW2, 0x20);
    io_out8(PIC_OCW2, 0x20);

    data = io_in8(PORT_KEYDAT);
    fifo8_put(&mouseinfo, data);
}

int mouse_decode(struct MOUSE_DEC *mdec, unsigned char dat)
{
    if (mdec->phase == 0)
    {
        if (dat == 0xfa)
        {
            mdec->phase = 1;
        }

        return 0;
    }

    if (mdec->phase == 1)
    {
        if ((dat & 0xc8) == 0x08)
        {
            mdec->buf[0] = dat;
            mdec->phase = 2;
        }

        return 0;
    }

    if (mdec->phase == 2)
    {
        mdec->buf[1] = dat;
        mdec->phase = 3;
        return 0;
    }

    if (mdec->phase == 3)
    {
        mdec->buf[2] = dat;
        mdec->phase = 1;
        mdec->btn = mdec->buf[0] & 0x07;
        mdec->x = mdec->buf[1];
        mdec->y = mdec->buf[2];
        if ((mdec->buf[0] & 0x10) != 0)
        {
            mdec->x |= 0xffffff00;
        }

        if ((mdec->buf[0] & 0x20) != 0)
        {
            mdec->y |= 0xffffff00;
        }

        mdec->y = -mdec->y;
        return 1;
    }

    return -1;
}

void showMemoryInfo(struct SHTCTL *shtctl, struct SHEET *sht, struct AddrRangeDesc *desc, char *vram, int page, int xsize, int color)
{
    int x = 0, y = 0, gap = 13 * 8, strLen = 10 * 8;

    init_screen8(sht->buf, xsize, ysize);

    showString(shtctl, sht, x, y, color, "page is: ");
    char *pPageCnt = intToHexStr(page);
    showString(shtctl, sht, gap, y, color, pPageCnt);
    y += 16;

    showString(shtctl, sht, x, y, color, "BaseAddrL: ");
    char *pBaseAddrL = intToHexStr(desc->baseAddrLow);
    showString(shtctl, sht, gap, y, color, pBaseAddrL);
    y += 16;

    showString(shtctl, sht, x, y, color, "BaseAddrH: ");
    char *pBaseAddrH = intToHexStr(desc->baseAddrHigh);
    showString(shtctl, sht, gap, y, color, pBaseAddrH);

    y += 16;
    showString(shtctl, sht, x, y, color, "lengthLow: ");
    char *pLengthLow = intToHexStr(desc->lengthLow);
    showString(shtctl, sht, gap, y, color, pLengthLow);
    /*
    y+= 16;
    showString(shtctl, sht, x, y, color, "lengthHigh: ");
    char* pLengthHigh = intToHexStr(desc->lengthHigh);
    showString(shtctl, sht, gap, y, color, pLengthHigh);

    y+= 16;
    showString(shtctl, sht, x, y, color, "type: ");
    char* pType = intToHexStr(desc->type);
    showString(shtctl, sht, gap, y, color, pType);
*/
}

struct SHEET *message_box(struct SHTCTL *shtctl, char *title)
{
    struct SHEET *sht_win;
    unsigned char *buf_win;

    sht_win = sheet_alloc(shtctl);
    buf_win = (unsigned char *)memman_alloc_4k(memman, 160 * 68);
    sheet_setbuf(sht_win, buf_win, 160, 68, -1);

    make_window8(shtctl, sht_win, title, 1);
    make_textbox8(sht_win, 8, 28, 144, 16, COL8_FFFFFF);

    sheet_slide(shtctl, sht_win, 260, 172);
    sheet_updown(shtctl, sht_win, 2);

    return sht_win;
}

void make_window8(struct SHTCTL *shtctl, struct SHEET *sht, char *title, char act)
{
    int bxsize = sht->bxsize;
    int bysize = sht->bysize;

    boxfill8(sht->buf, bxsize, COL8_C6C6C6, 0, 0, bxsize - 1, 0);
    boxfill8(sht->buf, bxsize, COL8_FFFFFF, 1, 1, bxsize - 2, 1);
    boxfill8(sht->buf, bxsize, COL8_C6C6C6, 0, 0, 0, bysize - 1);
    boxfill8(sht->buf, bxsize, COL8_FFFFFF, 1, 1, 1, bysize - 1);
    boxfill8(sht->buf, bxsize, COL8_848484, bxsize - 2, 1, bxsize - 2, bysize - 2);
    boxfill8(sht->buf, bxsize, COL8_000000, bxsize - 1, 0, bxsize - 1, bysize - 1);
    boxfill8(sht->buf, bxsize, COL8_C6C6C6, 2, 2, bxsize - 3, bysize - 3);
    boxfill8(sht->buf, bxsize, COL8_000084, 3, 3, bxsize - 4, 20);
    boxfill8(sht->buf, bxsize, COL8_848484, 1, bysize - 2, bxsize - 2, bysize - 2);
    boxfill8(sht->buf, bxsize, COL8_000000, 0, bysize - 1, bxsize - 1, bysize - 1);

    make_wtitle8(shtctl, sht, title, act);

    return;
}

void make_wtitle8(struct SHTCTL *shtctl, struct SHEET *sht, char *title, char act)
{
    static char closebtn[14][16] = {
        "OOOOOOOOOOOOOOO@",
        "OQQQQQQQQQQQQQ$@",
        "OQQQQQQQQQQQQQ$@",
        "OQQQ@@QQQQ@@QQ$@",
        "OQQQQ@@QQ@@QQQ$@",
        "OQQQQQ@@@@QQQQ$@",
        "OQQQQQQ@@QQQQQ$@",
        "OQQQQQ@@@@QQQQ$@",
        "OQQQQ@@QQ@@QQQ$@",
        "OQQQ@@QQQQ@@QQ$@",
        "OQQQQQQQQQQQQQ$@",
        "OQQQQQQQQQQQQQ$@",
        "O$$$$$$$$$$$$$$@",
        "@@@@@@@@@@@@@@@@"};

    int x, y;
    char c, tc, tbc;
    if (act != 0)
    {
        tc = COL8_FFFFFF;
        tbc = COL8_000084;
    }
    else
    {
        tc = COL8_C6C6C6;
        tbc = COL8_848484;
    }

    boxfill8(sht->buf, sht->bxsize, tbc, 3, 3, sht->bxsize - 4, 20);
    showString(shtctl, sht, 24, 4, tc, title);

    for (y = 0; y < 14; y++)
    {
        for (x = 0; x < 16; x++)
        {
            c = closebtn[y][x];
            if (c == '@')
            {
                c = COL8_000000;
            }
            else if (c == '$')
            {
                c = COL8_848484;
            }
            else if (c == 'Q')
            {
                c = COL8_C6C6C6;
            }
            else
            {
                c = COL8_FFFFFF;
            }

            sht->buf[(5 + y) * sht->bxsize + (sht->bxsize - 21 + x)] = c;
        }
    }
}

void make_textbox8(struct SHEET *sht, int x0, int y0, int sx, int sy, int c)
{
    int x1 = x0 + sx, y1 = y0 + sy;
    boxfill8(sht->buf, sht->bxsize, COL8_848484, x0 - 2, y0 - 3, x1 + 1, y0 - 3);
    boxfill8(sht->buf, sht->bxsize, COL8_848484, x0 - 3, y0 - 3, x0 - 3, y1 + 1);
    boxfill8(sht->buf, sht->bxsize, COL8_FFFFFF, x0 - 3, y1 + 2, x1 + 1, y1 + 2);
    boxfill8(sht->buf, sht->bxsize, COL8_FFFFFF, x1 + 2, y0 - 3, x1 + 2, y1 + 2);
    boxfill8(sht->buf, sht->bxsize, COL8_000000, x0 - 1, y0 - 2, x1 + 0, y0 - 2);
    boxfill8(sht->buf, sht->bxsize, COL8_000000, x0 - 2, y0 - 2, x0 - 2, y1 + 0);
    boxfill8(sht->buf, sht->bxsize, COL8_C6C6C6, x0 - 2, y1 + 1, x1 + 0, y1 + 1);
    boxfill8(sht->buf, sht->bxsize, COL8_C6C6C6, x1 + 1, y0 - 2, x1 + 1, y1 + 1);
    boxfill8(sht->buf, sht->bxsize, c, x0 - 1, y0 - 1, x1 + 0, y1 + 0);
}

void file_loadfile(char *name, struct Buffer *buffer)
{
    struct FILEINFO *finfo = (struct FILEINFO *)(ADR_DISKIMG);
    char *s = (char *)memman_alloc(memman, 13);
    s[12] = 0;

    while (finfo->name[0] != 0)
    {
        int k;
        for (k = 0; k < 8; k++)
        {
            if (finfo->name[k] != 0)
            {
                s[k] = finfo->name[k];
            }
            else
            {
                break;
            }
        }

        int t = 0;
        s[k] = '.';
        k++;
        for (t = 0; t < 3; t++)
        {

            s[k] = finfo->ext[t];
            k++;
        }

        if (strcmp(name, s) == 1)
        {
            buffer->pBuffer = (char *)memman_alloc_4k(memman, finfo->size);
            buffer->length = finfo->size;
            char *p = (char *)FILE_CONTENT_HEAD_ADDR;
            p += finfo->clustno * DISK_SECTOR_SIZE;
            int sz = finfo->size;
            int t = 0;
            for (t = 0; t < sz; t++)
            {
                buffer->pBuffer[t] = p[t];
            }
            break;
        }

        finfo++;
    }

    memman_free(memman, (unsigned int)s, 13);
}

int *intHandlerForStackOverFlow(int *esp)
{
    g_Console.cur_x = 8;
    cons_putstr("INT OC");
    g_Console.cur_x = 8;
    g_Console.cur_y += 16;
    cons_putstr("Stack Exception");
    g_Console.cur_x = 8;
    g_Console.cur_y += 16;
    char *p = intToHexStr(esp[11]);
    cons_putstr("EIP = ");
    cons_putstr(p);
    g_Console.cur_x = 8;
    g_Console.cur_y += 16;
    struct TASK *task = task_now();
    return &(task->tss.esp0);
}

int *intHandlerForException(int *esp)
{
    g_Console.cur_x = 8;
    cons_putstr("INT 0D ");
    g_Console.cur_x = 8;
    g_Console.cur_y += 16;
    cons_putstr("General Protected Exception");
    g_Console.cur_y += 16;
    g_Console.cur_x = 8;

    struct TASK *task = task_now();

    return &(task->tss.esp0);
}
