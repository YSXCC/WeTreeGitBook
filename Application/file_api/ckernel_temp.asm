; Disassembly of file: ckernel.o
; Tue Mar 24 16:28:15 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro


global CMain: function
global set_cursor: function
global isSpecialKey: function
global transferScanCode: function
global launch_console: function
global kill_process: function
global cmd_dir: function
global cmd_type: function
global cmd_mem: function
global cmd_cls: function
global cmd_execute_program: function
global cmd_start: function
global cmd_ncst: function
global console_task: function
global cons_putstr: function
global api_linewin: function
global handle_keyboard: function
global close_constask: function
global close_console: function
global cmd_exit: function
global kernel_api: function
global cons_putchar: function
global cons_newline: function
global init_screen8: function
global computeMousePosition: function
global showString: function
global show_mouse_info: function
global initBootInfo: function
global init_palette: function
global set_palette: function
global boxfill8: function
global showFont8: function
global init_mouse_cursor: function
global putblock: function
global intHandlerFromC: function
global charToHexVal: function
global charToHexStr: function
global intToHexStr: function
global wait_KBC_sendready: function
global init_keyboard: function
global enable_mouse: function
global intHandlerForMouse: function
global mouse_decode: function
global showMemoryInfo: function
global message_box: function
global make_window8: function
global make_wtitle8: function
global make_textbox8: function
global file_loadfile: function
global intHandlerForStackOverFlow: function
global intHandlerForException: function
global memman_init: function
global memman_total: function
global memman_alloc: function
global memman_free: function
global memman_alloc_4k: function
global memman_free_4k: function
global shtctl_init: function
global sheet_alloc: function
global sheet_setbuf: function
global sheet_updown: function
global sheet_refresh: function
global sheet_slide: function
global sheet_refreshsub: function
global sheet_refreshmap: function
global sheet_free: function
global init_pit: function
global timer_alloc: function
global timer_free: function
global timer_init: function
global timer_settime: function
global intHandlerForTimer: function
global getTimerController: function
global fifo8_init: function
global fifo8_put: function
global fifo8_get: function
global fifo8_status: function
global strcmp: function
global set_segmdesc: function
global get_taskctl: function
global init_task_level: function
global task_init: function
global task_alloc: function
global task_run: function
global task_switch: function
global task_sleep: function
global task_now: function
global task_add: function
global task_remove: function
global task_switchsub: function
global send_message: function
global memman
global KEY_CONTROL
global show_console_window
global console_pos
global key_shift
global caps_lock
global first_task_cons_selector
global current_console
global console_count

extern task_timer                                       ; dword
extern get_memory_block_count                           ; near
extern io_out8                                          ; near
extern start_app                                        ; near
extern io_sti                                           ; near
extern load_tr                                          ; near
extern farjmp                                           ; near
extern get_code32_addr                                  ; near
extern asm_end_app                                      ; near
extern io_store_eflags                                  ; near
extern get_addr_gdt                                     ; near
extern get_adr_buffer                                   ; near
extern io_cli                                           ; near
extern io_in8                                           ; near
extern systemFont                                       ; byte
extern io_load_eflags                                   ; near


SECTION .text   align=1 execute                         ; section number 1, code

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 132                                ; 0004 _ 81. EC, 00000084
        mov     dword [esp], bootInfo                   ; 000A _ C7. 04 24, 00000014(d)
        call    initBootInfo                            ; 0011 _ E8, FFFFFFFC(rel)
        mov     eax, dword [bootInfo]                   ; 0016 _ A1, 00000014(d)
        mov     dword [ebp-18H], eax                    ; 001B _ 89. 45, E8
        movzx   eax, word [?_448]                       ; 001E _ 0F B7. 05, 00000018(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 0000013C(d)
        movzx   eax, word [?_449]                       ; 002B _ 0F B7. 05, 0000001A(d)
        cwde                                            ; 0032 _ 98
        mov     dword [ysize], eax                      ; 0033 _ A3, 00000140(d)
        call    init_pit                                ; 0038 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 003D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf                ; 0045 _ C7. 44 24, 08, 0000012C(d)
        mov     dword [esp+4H], 8                       ; 004D _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo                  ; 0055 _ C7. 04 24, 00000110(d)
        call    fifo8_init                              ; 005C _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0061 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0066 _ 89. 45, E4
        mov     dword [esp+8H], 10                      ; 0069 _ C7. 44 24, 08, 0000000A
        mov     dword [esp+4H], timerinfo               ; 0071 _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-1CH]                    ; 0079 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 007C _ 89. 04 24
        call    timer_init                              ; 007F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0084 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-1CH]                    ; 008C _ 8B. 45, E4
        mov     dword [esp], eax                        ; 008F _ 89. 04 24
        call    timer_settime                           ; 0092 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0097 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 009C _ 89. 45, E0
        mov     dword [esp+8H], 2                       ; 009F _ C7. 44 24, 08, 00000002
        mov     dword [esp+4H], timerinfo               ; 00A7 _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-20H]                    ; 00AF _ 8B. 45, E0
        mov     dword [esp], eax                        ; 00B2 _ 89. 04 24
        call    timer_init                              ; 00B5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 00BA _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-20H]                    ; 00C2 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 00C5 _ 89. 04 24
        call    timer_settime                           ; 00C8 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 00CD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 00D2 _ 89. 45, DC
        mov     dword [esp+8H], 1                       ; 00D5 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo               ; 00DD _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-24H]                    ; 00E5 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 00E8 _ 89. 04 24
        call    timer_init                              ; 00EB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 00F0 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 00F8 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 00FB _ 89. 04 24
        call    timer_settime                           ; 00FE _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0103 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], keybuf                  ; 010B _ C7. 44 24, 08, 00000060(d)
        mov     dword [esp+4H], 32                      ; 0113 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 011B _ C7. 04 24, 0000001C(d)
        call    fifo8_init                              ; 0122 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0127 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 012F _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 128                     ; 0137 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 013F _ C7. 04 24, 00000038(d)
        call    fifo8_init                              ; 0146 _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 014B _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0150 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 0155 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 015A _ 89. 45, D8
        call    get_adr_buffer                          ; 015D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 0162 _ 89. 45, D4
        mov     eax, dword [memman]                     ; 0165 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 016A _ 89. 04 24
        call    memman_init                             ; 016D _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 0172 _ A1, 00000000(d)
        mov     dword [esp+8H], 1072594944              ; 0177 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 16809984                ; 017F _ C7. 44 24, 04, 01008000
        mov     dword [esp], eax                        ; 0187 _ 89. 04 24
        call    memman_free                             ; 018A _ E8, FFFFFFFC(rel)
        mov     ecx, dword [ysize]                      ; 018F _ 8B. 0D, 00000140(d)
        mov     edx, dword [xsize]                      ; 0195 _ 8B. 15, 0000013C(d)
        mov     eax, dword [memman]                     ; 019B _ A1, 00000000(d)
        mov     dword [esp+0CH], ecx                    ; 01A0 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 01A4 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 01A8 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 01AB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 01AF _ 89. 04 24
        call    shtctl_init                             ; 01B2 _ E8, FFFFFFFC(rel)
        mov     dword [shtctl], eax                     ; 01B7 _ A3, 00000264(d)
        mov     eax, dword [shtctl]                     ; 01BC _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 01C1 _ 89. 04 24
        call    sheet_alloc                             ; 01C4 _ E8, FFFFFFFC(rel)
        mov     dword [sht_back], eax                   ; 01C9 _ A3, 00000268(d)
        mov     eax, dword [shtctl]                     ; 01CE _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 01D3 _ 89. 04 24
        call    sheet_alloc                             ; 01D6 _ E8, FFFFFFFC(rel)
        mov     dword [sht_mouse], eax                  ; 01DB _ A3, 0000026C(d)
        mov     edx, dword [xsize]                      ; 01E0 _ 8B. 15, 0000013C(d)
        mov     eax, dword [ysize]                      ; 01E6 _ A1, 00000140(d)
        imul    edx, eax                                ; 01EB _ 0F AF. D0
        mov     eax, dword [memman]                     ; 01EE _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 01F3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 01F7 _ 89. 04 24
        call    memman_alloc_4k                         ; 01FA _ E8, FFFFFFFC(rel)
        mov     dword [buf_back], eax                   ; 01FF _ A3, 00000144(d)
        mov     ebx, dword [ysize]                      ; 0204 _ 8B. 1D, 00000140(d)
        mov     ecx, dword [xsize]                      ; 020A _ 8B. 0D, 0000013C(d)
        mov     edx, dword [buf_back]                   ; 0210 _ 8B. 15, 00000144(d)
        mov     eax, dword [sht_back]                   ; 0216 _ A1, 00000268(d)
        mov     dword [esp+10H], 99                     ; 021B _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], ebx                    ; 0223 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 0227 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 022B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 022F _ 89. 04 24
        call    sheet_setbuf                            ; 0232 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sht_mouse]                  ; 0237 _ A1, 0000026C(d)
        mov     dword [esp+10H], 99                     ; 023C _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 16                     ; 0244 _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 16                      ; 024C _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], buf_mouse               ; 0254 _ C7. 44 24, 04, 00000160(d)
        mov     dword [esp], eax                        ; 025C _ 89. 04 24
        call    sheet_setbuf                            ; 025F _ E8, FFFFFFFC(rel)
        mov     ecx, dword [ysize]                      ; 0264 _ 8B. 0D, 00000140(d)
        mov     edx, dword [xsize]                      ; 026A _ 8B. 15, 0000013C(d)
        mov     eax, dword [buf_back]                   ; 0270 _ A1, 00000144(d)
        mov     dword [esp+8H], ecx                     ; 0275 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0279 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 027D _ 89. 04 24
        call    init_screen8                            ; 0280 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 99                      ; 0285 _ C7. 44 24, 04, 00000063
        mov     dword [esp], buf_mouse                  ; 028D _ C7. 04 24, 00000160(d)
        call    init_mouse_cursor                       ; 0294 _ E8, FFFFFFFC(rel)
        mov     edx, dword [sht_back]                   ; 0299 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 029F _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 02A4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 02AC _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 02B4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 02B8 _ 89. 04 24
        call    sheet_slide                             ; 02BB _ E8, FFFFFFFC(rel)
        mov     eax, dword [xsize]                      ; 02C0 _ A1, 0000013C(d)
        sub     eax, 16                                 ; 02C5 _ 83. E8, 10
        mov     edx, eax                                ; 02C8 _ 89. C2
        shr     edx, 31                                 ; 02CA _ C1. EA, 1F
        add     eax, edx                                ; 02CD _ 01. D0
        sar     eax, 1                                  ; 02CF _ D1. F8
        mov     dword [mx], eax                         ; 02D1 _ A3, 00000134(d)
        mov     eax, dword [ysize]                      ; 02D6 _ A1, 00000140(d)
        sub     eax, 44                                 ; 02DB _ 83. E8, 2C
        mov     edx, eax                                ; 02DE _ 89. C2
        shr     edx, 31                                 ; 02E0 _ C1. EA, 1F
        add     eax, edx                                ; 02E3 _ 01. D0
        sar     eax, 1                                  ; 02E5 _ D1. F8
        mov     dword [my], eax                         ; 02E7 _ A3, 00000138(d)
        mov     ebx, dword [my]                         ; 02EC _ 8B. 1D, 00000138(d)
        mov     ecx, dword [mx]                         ; 02F2 _ 8B. 0D, 00000134(d)
        mov     edx, dword [sht_mouse]                  ; 02F8 _ 8B. 15, 0000026C(d)
        mov     eax, dword [shtctl]                     ; 02FE _ A1, 00000264(d)
        mov     dword [esp+0CH], ebx                    ; 0303 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 0307 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 030B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 030F _ 89. 04 24
        call    sheet_slide                             ; 0312 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 8                      ; 0317 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 7                      ; 031E _ C7. 45, F0, 00000007
        mov     eax, dword [shtctl]                     ; 0325 _ A1, 00000264(d)
        mov     dword [esp+4H], ?_418                   ; 032A _ C7. 44 24, 04, 00000000(d)
        mov     dword [esp], eax                        ; 0332 _ 89. 04 24
        call    message_box                             ; 0335 _ E8, FFFFFFFC(rel)
        mov     dword [shtMsgBox], eax                  ; 033A _ A3, 00000260(d)
        mov     edx, dword [sht_back]                   ; 033F _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 0345 _ A1, 00000264(d)
        mov     dword [esp+8H], 0                       ; 034A _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0352 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0356 _ 89. 04 24
        call    sheet_updown                            ; 0359 _ E8, FFFFFFFC(rel)
        mov     edx, dword [sht_mouse]                  ; 035E _ 8B. 15, 0000026C(d)
        mov     eax, dword [shtctl]                     ; 0364 _ A1, 00000264(d)
        mov     dword [esp+8H], 4                       ; 0369 _ C7. 44 24, 08, 00000004
        mov     dword [esp+4H], edx                     ; 0371 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0375 _ 89. 04 24
        call    sheet_updown                            ; 0378 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 037D _ E8, FFFFFFFC(rel)
        mov     dword [esp], mdec                       ; 0382 _ C7. 04 24, 00000100(d)
        call    enable_mouse                            ; 0389 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 038E _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0393 _ 89. 04 24
        call    task_init                               ; 0396 _ E8, FFFFFFFC(rel)
        mov     dword [task_a.1827], eax                ; 039B _ A3, 0000027C(d)
        mov     eax, dword [task_a.1827]                ; 03A0 _ A1, 0000027C(d)
        mov     dword [?_450], eax                      ; 03A5 _ A3, 00000034(d)
        mov     eax, dword [task_a.1827]                ; 03AA _ A1, 0000027C(d)
        mov     dword [task_main], eax                  ; 03AF _ A3, 00000274(d)
        mov     eax, dword [task_a.1827]                ; 03B4 _ A1, 0000027C(d)
        mov     dword [esp+8H], 0                       ; 03B9 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], 0                       ; 03C1 _ C7. 44 24, 04, 00000000
        mov     dword [esp], eax                        ; 03C9 _ 89. 04 24
        call    task_run                                ; 03CC _ E8, FFFFFFFC(rel)
        mov     dword [esp], 0                          ; 03D1 _ C7. 04 24, 00000000
        call    launch_console                          ; 03D8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 03DD _ 89. 45, D0
        mov     eax, dword [console_count]              ; 03E0 _ A1, 00000000(d)
        add     eax, 1                                  ; 03E5 _ 83. C0, 01
        mov     dword [console_count], eax              ; 03E8 _ A3, 00000000(d)
        mov     eax, dword [shtctl]                     ; 03ED _ A1, 00000264(d)
        mov     dword [esp+0CH], 2                      ; 03F2 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 03FA _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-30H]                    ; 0402 _ 8B. 55, D0
        mov     dword [esp+4H], edx                     ; 0405 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0409 _ 89. 04 24
        call    sheet_slide                             ; 040C _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0411 _ A1, 00000264(d)
        mov     dword [esp+8H], 2                       ; 0416 _ C7. 44 24, 08, 00000002
        mov     edx, dword [ebp-30H]                    ; 041E _ 8B. 55, D0
        mov     dword [esp+4H], edx                     ; 0421 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0425 _ 89. 04 24
        call    sheet_updown                            ; 0428 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], 0                      ; 042D _ C7. 45, CC, 00000000
        mov     dword [ebp-38H], 0                      ; 0434 _ C7. 45, C8, 00000000
        mov     dword [ebp-3CH], 0                      ; 043B _ C7. 45, C4, 00000000
        mov     dword [ebp-40H], 0                      ; 0442 _ C7. 45, C0, 00000000
        mov     dword [ebp-44H], 0                      ; 0449 _ C7. 45, BC, 00000000
        mov     dword [ebp-14H], 0                      ; 0450 _ C7. 45, EC, 00000000
        mov     dword [ebp-48H], 0                      ; 0457 _ C7. 45, B8, 00000000
        mov     dword [ebp-4CH], 0                      ; 045E _ C7. 45, B4, 00000000
?_001:  mov     dword [esp], keyinfo                    ; 0465 _ C7. 04 24, 0000001C(d)
        call    fifo8_status                            ; 046C _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 0471 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 0473 _ C7. 04 24, 00000038(d)
        call    fifo8_status                            ; 047A _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 047F _ 01. C3
        mov     dword [esp], timerinfo                  ; 0481 _ C7. 04 24, 00000110(d)
        call    fifo8_status                            ; 0488 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 048D _ 01. D8
        test    eax, eax                                ; 048F _ 85. C0
        jnz     ?_002                                   ; 0491 _ 75, 0A
        call    io_sti                                  ; 0493 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 0498 _ E9, 00000412

?_002:  mov     dword [esp], keyinfo                    ; 049D _ C7. 04 24, 0000001C(d)
        call    fifo8_status                            ; 04A4 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 04A9 _ 85. C0
        je      ?_013                                   ; 04AB _ 0F 84, 000003CD
        call    io_sti                                  ; 04B1 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 04B6 _ C7. 04 24, 0000001C(d)
        call    fifo8_get                               ; 04BD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 04C2 _ 89. 45, CC
        mov     eax, dword [key_shift]                  ; 04C5 _ A1, 00000000(d)
        test    eax, eax                                ; 04CA _ 85. C0
        jz      ?_003                                   ; 04CC _ 74, 63
        cmp     dword [ebp-34H], 17                     ; 04CE _ 83. 7D, CC, 11
        jnz     ?_003                                   ; 04D2 _ 75, 5D
        mov     eax, dword [console_count]              ; 04D4 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 04D9 _ 89. 04 24
        call    launch_console                          ; 04DC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 04E1 _ 89. 45, D0
        mov     eax, dword [shtctl]                     ; 04E4 _ A1, 00000264(d)
        mov     dword [esp+0CH], 176                    ; 04E9 _ C7. 44 24, 0C, 000000B0
        mov     dword [esp+8H], 156                     ; 04F1 _ C7. 44 24, 08, 0000009C
        mov     edx, dword [ebp-30H]                    ; 04F9 _ 8B. 55, D0
        mov     dword [esp+4H], edx                     ; 04FC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0500 _ 89. 04 24
        call    sheet_slide                             ; 0503 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0508 _ A1, 00000264(d)
        mov     dword [esp+8H], 1                       ; 050D _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-30H]                    ; 0515 _ 8B. 55, D0
        mov     dword [esp+4H], edx                     ; 0518 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 051C _ 89. 04 24
        call    sheet_updown                            ; 051F _ E8, FFFFFFFC(rel)
        mov     eax, dword [console_count]              ; 0524 _ A1, 00000000(d)
        add     eax, 1                                  ; 0529 _ 83. C0, 01
        mov     dword [console_count], eax              ; 052C _ A3, 00000000(d)
?_003:  cmp     dword [ebp-34H], 255                    ; 0531 _ 81. 7D, CC, 000000FF
        jnz     ?_004                                   ; 0538 _ 75, 1B
        mov     eax, dword [current_console_task]       ; 053A _ A1, 00000278(d)
        test    eax, eax                                ; 053F _ 85. C0
        jz      ?_004                                   ; 0541 _ 74, 12
        mov     eax, dword [current_console_task]       ; 0543 _ A1, 00000278(d)
        mov     dword [esp], eax                        ; 0548 _ 89. 04 24
        call    close_console                           ; 054B _ E8, FFFFFFFC(rel)
        jmp     ?_018                                   ; 0550 _ E9, 00000449

?_004:  mov     eax, dword [ebp-34H]                    ; 0555 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0558 _ 89. 04 24
        call    transferScanCode                        ; 055B _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-34H], 16                     ; 0560 _ 83. 7D, CC, 10
        jnz     ?_005                                   ; 0564 _ 75, 28
        mov     eax, dword [shtctl]                     ; 0566 _ A1, 00000264(d)
        mov     eax, dword [eax+10H]                    ; 056B _ 8B. 40, 10
        lea     ecx, [eax-1H]                           ; 056E _ 8D. 48, FF
        mov     eax, dword [shtctl]                     ; 0571 _ A1, 00000264(d)
        mov     edx, dword [eax+18H]                    ; 0576 _ 8B. 50, 18
        mov     eax, dword [shtctl]                     ; 0579 _ A1, 00000264(d)
        mov     dword [esp+8H], ecx                     ; 057E _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0582 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0586 _ 89. 04 24
        call    sheet_updown                            ; 0589 _ E8, FFFFFFFC(rel)
?_005:  cmp     dword [ebp-34H], 15                     ; 058E _ 83. 7D, CC, 0F
        jne     ?_011                                   ; 0592 _ 0F 85, 000001B1
        mov     dword [ebp-50H], -1                     ; 0598 _ C7. 45, B0, FFFFFFFF
        cmp     dword [ebp-14H], 0                      ; 059F _ 83. 7D, EC, 00
        jne     ?_009                                   ; 05A3 _ 0F 85, 000000B3
        mov     dword [ebp-14H], 1                      ; 05A9 _ C7. 45, EC, 00000001
        mov     eax, dword [current_console]            ; 05B0 _ A1, 00000000(d)
        cmp     eax, 1                                  ; 05B5 _ 83. F8, 01
        jnz     ?_006                                   ; 05B8 _ 75, 0C
        mov     dword [current_console], 0              ; 05BA _ C7. 05, 00000000(d), 00000000
        jmp     ?_007                                   ; 05C4 _ EB, 0A

?_006:  mov     dword [current_console], 1              ; 05C6 _ C7. 05, 00000000(d), 00000001
?_007:  mov     edx, dword [shtMsgBox]                  ; 05D0 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 05D6 _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 05DB _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_419                   ; 05E3 _ C7. 44 24, 08, 00000008(d)
        mov     dword [esp+4H], edx                     ; 05EB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05EF _ 89. 04 24
        call    make_wtitle8                            ; 05F2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [current_console_task]       ; 05F7 _ A1, 00000278(d)
        test    eax, eax                                ; 05FC _ 85. C0
        jz      ?_008                                   ; 05FE _ 74, 2C
        mov     eax, dword [current_console_task]       ; 0600 _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 0605 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 060B _ A1, 00000264(d)
        mov     dword [esp+0CH], 1                      ; 0610 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_420                   ; 0618 _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], edx                     ; 0620 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0624 _ 89. 04 24
        call    make_wtitle8                            ; 0627 _ E8, FFFFFFFC(rel)
?_008:  mov     edx, dword [shtMsgBox]                  ; 062C _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0632 _ A1, 00000264(d)
        mov     dword [esp+10H], 7                      ; 0637 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 063F _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0647 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 064A _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 064E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0652 _ 89. 04 24
        call    set_cursor                              ; 0655 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 065A _ EB, 63

?_009:  mov     dword [ebp-14H], 0                      ; 065C _ C7. 45, EC, 00000000
        mov     edx, dword [shtMsgBox]                  ; 0663 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0669 _ A1, 00000264(d)
        mov     dword [esp+0CH], 1                      ; 066E _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_419                   ; 0676 _ C7. 44 24, 08, 00000008(d)
        mov     dword [esp+4H], edx                     ; 067E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0682 _ 89. 04 24
        call    make_wtitle8                            ; 0685 _ E8, FFFFFFFC(rel)
        mov     eax, dword [current_console_task]       ; 068A _ A1, 00000278(d)
        test    eax, eax                                ; 068F _ 85. C0
        jz      ?_010                                   ; 0691 _ 74, 2C
        mov     eax, dword [current_console_task]       ; 0693 _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 0698 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 069E _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 06A3 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_420                   ; 06AB _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], edx                     ; 06B3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06B7 _ 89. 04 24
        call    make_wtitle8                            ; 06BA _ E8, FFFFFFFC(rel)
?_010:  mov     eax, dword [shtMsgBox]                  ; 06BF _ A1, 00000260(d)
        mov     ecx, dword [eax+4H]                     ; 06C4 _ 8B. 48, 04
        mov     edx, dword [shtMsgBox]                  ; 06C7 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 06CD _ A1, 00000264(d)
        mov     dword [esp+14H], 21                     ; 06D2 _ C7. 44 24, 14, 00000015
        mov     dword [esp+10H], ecx                    ; 06DA _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 06DE _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 06E6 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 06EE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06F2 _ 89. 04 24
        call    sheet_refresh                           ; 06F5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [current_console_task]       ; 06FA _ A1, 00000278(d)
        test    eax, eax                                ; 06FF _ 85. C0
        jz      ?_011                                   ; 0701 _ 74, 46
        mov     eax, dword [current_console_task]       ; 0703 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 0708 _ 8B. 80, 000000B4
        mov     ecx, dword [eax+4H]                     ; 070E _ 8B. 48, 04
        mov     eax, dword [current_console_task]       ; 0711 _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 0716 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 071C _ A1, 00000264(d)
        mov     dword [esp+14H], 21                     ; 0721 _ C7. 44 24, 14, 00000015
        mov     dword [esp+10H], ecx                    ; 0729 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 072D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0735 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 073D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0741 _ 89. 04 24
        call    sheet_refresh                           ; 0744 _ E8, FFFFFFFC(rel)
?_011:  cmp     dword [ebp-14H], 0                      ; 0749 _ 83. 7D, EC, 00
        jne     ?_012                                   ; 074D _ 0F 85, 000000D9
        mov     eax, dword [ebp-34H]                    ; 0753 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0756 _ 89. 04 24
        call    transferScanCode                        ; 0759 _ E8, FFFFFFFC(rel)
        test    al, al                                  ; 075E _ 84. C0
        je      ?_014                                   ; 0760 _ 0F 84, 00000149
        cmp     dword [ebp-0CH], 143                    ; 0766 _ 81. 7D, F4, 0000008F
        jg      ?_014                                   ; 076D _ 0F 8F, 0000013C
        mov     edx, dword [shtMsgBox]                  ; 0773 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0779 _ A1, 00000264(d)
        mov     dword [esp+10H], 7                      ; 077E _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 0786 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 078E _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0791 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0795 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0799 _ 89. 04 24
        call    set_cursor                              ; 079C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-34H]                    ; 07A1 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 07A4 _ 89. 04 24
        call    transferScanCode                        ; 07A7 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-51H], al                      ; 07AC _ 88. 45, AF
        movzx   eax, byte [ebp-51H]                     ; 07AF _ 0F B6. 45, AF
        mov     byte [ebp-66H], al                      ; 07B3 _ 88. 45, 9A
        mov     byte [ebp-65H], 0                       ; 07B6 _ C6. 45, 9B, 00
        mov     edx, dword [shtMsgBox]                  ; 07BA _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 07C0 _ A1, 00000264(d)
        lea     ecx, [ebp-66H]                          ; 07C5 _ 8D. 4D, 9A
        mov     dword [esp+14H], ecx                    ; 07C8 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 07CC _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 28                     ; 07D4 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 07DC _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 07DF _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 07E3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07E7 _ 89. 04 24
        call    showString                              ; 07EA _ E8, FFFFFFFC(rel)
        add     dword [ebp-0CH], 8                      ; 07EF _ 83. 45, F4, 08
        mov     dword [ebp-44H], 1                      ; 07F3 _ C7. 45, BC, 00000001
        mov     edx, dword [shtMsgBox]                  ; 07FA _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0800 _ A1, 00000264(d)
        mov     ecx, dword [ebp-10H]                    ; 0805 _ 8B. 4D, F0
        mov     dword [esp+10H], ecx                    ; 0808 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 080C _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0814 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0817 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 081B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 081F _ 89. 04 24
        call    set_cursor                              ; 0822 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 0827 _ E9, 00000083

?_012:  mov     eax, dword [ebp-34H]                    ; 082C _ 8B. 45, CC
        mov     dword [esp], eax                        ; 082F _ 89. 04 24
        call    isSpecialKey                            ; 0832 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0837 _ 85. C0
        jnz     ?_014                                   ; 0839 _ 75, 74
        mov     eax, dword [current_console_task]       ; 083B _ A1, 00000278(d)
        test    eax, eax                                ; 0840 _ 85. C0
        jz      ?_014                                   ; 0842 _ 74, 6B
        mov     eax, dword [ebp-34H]                    ; 0844 _ 8B. 45, CC
        movzx   eax, al                                 ; 0847 _ 0F B6. C0
        mov     edx, dword [current_console_task]       ; 084A _ 8B. 15, 00000278(d)
        add     edx, 16                                 ; 0850 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 0853 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 0857 _ 89. 14 24
        call    fifo8_put                               ; 085A _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 085F _ C7. 04 24, 0000001C(d)
        call    fifo8_status                            ; 0866 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 086B _ 85. C0
        jnz     ?_014                                   ; 086D _ 75, 40
        mov     eax, dword [task_a.1827]                ; 086F _ A1, 0000027C(d)
        mov     dword [esp], eax                        ; 0874 _ 89. 04 24
        call    task_sleep                              ; 0877 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 087C _ EB, 31

?_013:  mov     dword [esp], mouseinfo                  ; 087E _ C7. 04 24, 00000038(d)
        call    fifo8_status                            ; 0885 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 088A _ 85. C0
        jz      ?_014                                   ; 088C _ 74, 21
        mov     ecx, dword [sht_mouse]                  ; 088E _ 8B. 0D, 0000026C(d)
        mov     edx, dword [sht_back]                   ; 0894 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 089A _ A1, 00000264(d)
        mov     dword [esp+8H], ecx                     ; 089F _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08A3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08A7 _ 89. 04 24
        call    show_mouse_info                         ; 08AA _ E8, FFFFFFFC(rel)
?_014:  mov     dword [esp], timerinfo                  ; 08AF _ C7. 04 24, 00000110(d)
        call    fifo8_status                            ; 08B6 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 08BB _ 85. C0
        je      ?_018                                   ; 08BD _ 0F 84, 000000DB
        call    io_sti                                  ; 08C3 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo                  ; 08C8 _ C7. 04 24, 00000110(d)
        call    fifo8_get                               ; 08CF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-58H], eax                    ; 08D4 _ 89. 45, A8
        cmp     dword [ebp-58H], 0                      ; 08D7 _ 83. 7D, A8, 00
        jz      ?_015                                   ; 08DB _ 74, 24
        mov     dword [esp+8H], 0                       ; 08DD _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo               ; 08E5 _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-24H]                    ; 08ED _ 8B. 45, DC
        mov     dword [esp], eax                        ; 08F0 _ 89. 04 24
        call    timer_init                              ; 08F3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 08F8 _ C7. 45, F0, 00000000
        jmp     ?_016                                   ; 08FF _ EB, 22

?_015:  mov     dword [esp+8H], 1                       ; 0901 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo               ; 0909 _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-24H]                    ; 0911 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0914 _ 89. 04 24
        call    timer_init                              ; 0917 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 7                      ; 091C _ C7. 45, F0, 00000007
?_016:  mov     dword [esp+4H], 50                      ; 0923 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 092B _ 8B. 45, DC
        mov     dword [esp], eax                        ; 092E _ 89. 04 24
        call    timer_settime                           ; 0931 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-14H], 0                      ; 0936 _ 83. 7D, EC, 00
        jnz     ?_017                                   ; 093A _ 75, 2F
        mov     edx, dword [shtMsgBox]                  ; 093C _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0942 _ A1, 00000264(d)
        mov     ecx, dword [ebp-10H]                    ; 0947 _ 8B. 4D, F0
        mov     dword [esp+10H], ecx                    ; 094A _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 094E _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0956 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0959 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 095D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0961 _ 89. 04 24
        call    set_cursor                              ; 0964 _ E8, FFFFFFFC(rel)
        jmp     ?_018                                   ; 0969 _ EB, 33

?_017:  mov     edx, dword [shtMsgBox]                  ; 096B _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0971 _ A1, 00000264(d)
        mov     dword [esp+10H], 7                      ; 0976 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 097E _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0986 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0989 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 098D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0991 _ 89. 04 24
        call    set_cursor                              ; 0994 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0999 _ E9, FFFFFAC7

?_018:  jmp     ?_001                                   ; 099E _ E9, FFFFFAC2
; CMain End of function

set_cursor:; Function begin
        push    ebp                                     ; 09A3 _ 55
        mov     ebp, esp                                ; 09A4 _ 89. E5
        push    esi                                     ; 09A6 _ 56
        push    ebx                                     ; 09A7 _ 53
        sub     esp, 32                                 ; 09A8 _ 83. EC, 20
        cmp     dword [ebp+0CH], 0                      ; 09AB _ 83. 7D, 0C, 00
        jnz     ?_019                                   ; 09AF _ 75, 02
        jmp     ?_020                                   ; 09B1 _ EB, 77

?_019:  mov     eax, dword [ebp+14H]                    ; 09B3 _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 09B6 _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 09B9 _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 09BC _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 09BF _ 8B. 45, 18
        movzx   ecx, al                                 ; 09C2 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 09C5 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 09C8 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 09CB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 09CE _ 8B. 00
        mov     dword [esp+18H], esi                    ; 09D0 _ 89. 74 24, 18
        mov     dword [esp+14H], ebx                    ; 09D4 _ 89. 5C 24, 14
        mov     ebx, dword [ebp+14H]                    ; 09D8 _ 8B. 5D, 14
        mov     dword [esp+10H], ebx                    ; 09DB _ 89. 5C 24, 10
        mov     ebx, dword [ebp+10H]                    ; 09DF _ 8B. 5D, 10
        mov     dword [esp+0CH], ebx                    ; 09E2 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 09E6 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 09EA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 09EE _ 89. 04 24
        call    boxfill8                                ; 09F1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 09F6 _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 09F9 _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 09FC _ 8B. 45, 10
        add     eax, 8                                  ; 09FF _ 83. C0, 08
        mov     dword [esp+14H], edx                    ; 0A02 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0A06 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 0A0A _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 0A0D _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 0A11 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 0A14 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0A18 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A1B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A1F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A22 _ 89. 04 24
        call    sheet_refresh                           ; 0A25 _ E8, FFFFFFFC(rel)
?_020:  add     esp, 32                                 ; 0A2A _ 83. C4, 20
        pop     ebx                                     ; 0A2D _ 5B
        pop     esi                                     ; 0A2E _ 5E
        pop     ebp                                     ; 0A2F _ 5D
        ret                                             ; 0A30 _ C3
; set_cursor End of function

isSpecialKey:; Function begin
        push    ebp                                     ; 0A31 _ 55
        mov     ebp, esp                                ; 0A32 _ 89. E5
        sub     esp, 24                                 ; 0A34 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 0A37 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A3A _ 89. 04 24
        call    transferScanCode                        ; 0A3D _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 58                      ; 0A42 _ 83. 7D, 08, 3A
        jz      ?_021                                   ; 0A46 _ 74, 2D
        cmp     dword [ebp+8H], 29                      ; 0A48 _ 83. 7D, 08, 1D
        jz      ?_021                                   ; 0A4C _ 74, 27
        cmp     dword [ebp+8H], 186                     ; 0A4E _ 81. 7D, 08, 000000BA
        jz      ?_021                                   ; 0A55 _ 74, 1E
        cmp     dword [ebp+8H], 42                      ; 0A57 _ 83. 7D, 08, 2A
        jz      ?_021                                   ; 0A5B _ 74, 18
        cmp     dword [ebp+8H], 54                      ; 0A5D _ 83. 7D, 08, 36
        jz      ?_021                                   ; 0A61 _ 74, 12
        cmp     dword [ebp+8H], 170                     ; 0A63 _ 81. 7D, 08, 000000AA
        jz      ?_021                                   ; 0A6A _ 74, 09
        cmp     dword [ebp+8H], 182                     ; 0A6C _ 81. 7D, 08, 000000B6
        jnz     ?_022                                   ; 0A73 _ 75, 07
?_021:  mov     eax, 1                                  ; 0A75 _ B8, 00000001
        jmp     ?_023                                   ; 0A7A _ EB, 05

?_022:  mov     eax, 0                                  ; 0A7C _ B8, 00000000
?_023:  leave                                           ; 0A81 _ C9
        ret                                             ; 0A82 _ C3
; isSpecialKey End of function

transferScanCode:; Function begin
        push    ebp                                     ; 0A83 _ 55
        mov     ebp, esp                                ; 0A84 _ 89. E5
        sub     esp, 16                                 ; 0A86 _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 0A89 _ 83. 7D, 08, 2A
        jnz     ?_024                                   ; 0A8D _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0A8F _ A1, 00000000(d)
        or      eax, 01H                                ; 0A94 _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 0A97 _ A3, 00000000(d)
?_024:  cmp     dword [ebp+8H], 54                      ; 0A9C _ 83. 7D, 08, 36
        jnz     ?_025                                   ; 0AA0 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0AA2 _ A1, 00000000(d)
        or      eax, 02H                                ; 0AA7 _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 0AAA _ A3, 00000000(d)
?_025:  cmp     dword [ebp+8H], 170                     ; 0AAF _ 81. 7D, 08, 000000AA
        jnz     ?_026                                   ; 0AB6 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0AB8 _ A1, 00000000(d)
        and     eax, 0FFFFFFFEH                         ; 0ABD _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 0AC0 _ A3, 00000000(d)
?_026:  cmp     dword [ebp+8H], 182                     ; 0AC5 _ 81. 7D, 08, 000000B6
        jnz     ?_027                                   ; 0ACC _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0ACE _ A1, 00000000(d)
        and     eax, 0FFFFFFFDH                         ; 0AD3 _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 0AD6 _ A3, 00000000(d)
?_027:  cmp     dword [ebp+8H], 58                      ; 0ADB _ 83. 7D, 08, 3A
        jnz     ?_029                                   ; 0ADF _ 75, 1F
        mov     eax, dword [caps_lock]                  ; 0AE1 _ A1, 00000000(d)
        test    eax, eax                                ; 0AE6 _ 85. C0
        jnz     ?_028                                   ; 0AE8 _ 75, 0C
        mov     dword [caps_lock], 1                    ; 0AEA _ C7. 05, 00000000(d), 00000001
        jmp     ?_029                                   ; 0AF4 _ EB, 0A

?_028:  mov     dword [caps_lock], 0                    ; 0AF6 _ C7. 05, 00000000(d), 00000000
?_029:  cmp     dword [ebp+8H], 42                      ; 0B00 _ 83. 7D, 08, 2A
        jz      ?_030                                   ; 0B04 _ 74, 24
        cmp     dword [ebp+8H], 54                      ; 0B06 _ 83. 7D, 08, 36
        jz      ?_030                                   ; 0B0A _ 74, 1E
        cmp     dword [ebp+8H], 170                     ; 0B0C _ 81. 7D, 08, 000000AA
        jz      ?_030                                   ; 0B13 _ 74, 15
        cmp     dword [ebp+8H], 182                     ; 0B15 _ 81. 7D, 08, 000000B6
        jz      ?_030                                   ; 0B1C _ 74, 0C
        cmp     dword [ebp+8H], 83                      ; 0B1E _ 83. 7D, 08, 53
        jg      ?_030                                   ; 0B22 _ 7F, 06
        cmp     dword [ebp+8H], 58                      ; 0B24 _ 83. 7D, 08, 3A
        jnz     ?_031                                   ; 0B28 _ 75, 0A
?_030:  mov     eax, 0                                  ; 0B2A _ B8, 00000000
        jmp     ?_036                                   ; 0B2F _ E9, 00000089

?_031:  mov     byte [ebp-1H], 0                        ; 0B34 _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 0B38 _ A1, 00000000(d)
        test    eax, eax                                ; 0B3D _ 85. C0
        jnz     ?_033                                   ; 0B3F _ 75, 46
        cmp     dword [ebp+8H], 83                      ; 0B41 _ 83. 7D, 08, 53
        jg      ?_033                                   ; 0B45 _ 7F, 40
        mov     eax, dword [ebp+8H]                     ; 0B47 _ 8B. 45, 08
        add     eax, keytable                           ; 0B4A _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0B4F _ 0F B6. 00
        test    al, al                                  ; 0B52 _ 84. C0
        jz      ?_033                                   ; 0B54 _ 74, 31
        mov     eax, dword [ebp+8H]                     ; 0B56 _ 8B. 45, 08
        add     eax, keytable                           ; 0B59 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0B5E _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0B61 _ 88. 45, FF
        cmp     byte [ebp-1H], 64                       ; 0B64 _ 80. 7D, FF, 40
        jle     ?_032                                   ; 0B68 _ 7E, 1B
        cmp     byte [ebp-1H], 90                       ; 0B6A _ 80. 7D, FF, 5A
        jg      ?_032                                   ; 0B6E _ 7F, 15
        mov     eax, dword [caps_lock]                  ; 0B70 _ A1, 00000000(d)
        test    eax, eax                                ; 0B75 _ 85. C0
        jnz     ?_032                                   ; 0B77 _ 75, 0C
        movzx   eax, byte [ebp-1H]                      ; 0B79 _ 0F B6. 45, FF
        add     eax, 32                                 ; 0B7D _ 83. C0, 20
        mov     byte [ebp-1H], al                       ; 0B80 _ 88. 45, FF
        jmp     ?_035                                   ; 0B83 _ EB, 34

?_032:  jmp     ?_035                                   ; 0B85 _ EB, 32

?_033:  mov     eax, dword [key_shift]                  ; 0B87 _ A1, 00000000(d)
        test    eax, eax                                ; 0B8C _ 85. C0
        jz      ?_034                                   ; 0B8E _ 74, 25
        cmp     dword [ebp+8H], 127                     ; 0B90 _ 83. 7D, 08, 7F
        jg      ?_034                                   ; 0B94 _ 7F, 1F
        mov     eax, dword [ebp+8H]                     ; 0B96 _ 8B. 45, 08
        add     eax, keytable1                          ; 0B99 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0B9E _ 0F B6. 00
        test    al, al                                  ; 0BA1 _ 84. C0
        jz      ?_034                                   ; 0BA3 _ 74, 10
        mov     eax, dword [ebp+8H]                     ; 0BA5 _ 8B. 45, 08
        add     eax, keytable1                          ; 0BA8 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0BAD _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0BB0 _ 88. 45, FF
        jmp     ?_035                                   ; 0BB3 _ EB, 04

?_034:  mov     byte [ebp-1H], 0                        ; 0BB5 _ C6. 45, FF, 00
?_035:  movzx   eax, byte [ebp-1H]                      ; 0BB9 _ 0F B6. 45, FF
?_036:  leave                                           ; 0BBD _ C9
        ret                                             ; 0BBE _ C3
; transferScanCode End of function

launch_console:; Function begin
        push    ebp                                     ; 0BBF _ 55
        mov     ebp, esp                                ; 0BC0 _ 89. E5
        push    esi                                     ; 0BC2 _ 56
        push    ebx                                     ; 0BC3 _ 53
        sub     esp, 160                                ; 0BC4 _ 81. EC, 000000A0
        mov     dword [ebp-0CH], 0                      ; 0BCA _ C7. 45, F4, 00000000
        mov     eax, dword [shtctl]                     ; 0BD1 _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 0BD6 _ 89. 04 24
        call    sheet_alloc                             ; 0BD9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0BDE _ 89. 45, F4
        mov     eax, dword [memman]                     ; 0BE1 _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 0BE6 _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 0BEE _ 89. 04 24
        call    memman_alloc_4k                         ; 0BF1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0BF6 _ 89. 45, F0
        mov     dword [esp+10H], 99                     ; 0BF9 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 0C01 _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 0C09 _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-10H]                    ; 0C11 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 0C14 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 0C18 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0C1B _ 89. 04 24
        call    sheet_setbuf                            ; 0C1E _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 0                       ; 0C23 _ 83. 7D, 08, 00
        jle     ?_037                                   ; 0C27 _ 7E, 26
        mov     eax, dword [shtctl]                     ; 0C29 _ A1, 00000264(d)
        mov     dword [esp+0CH], 1                      ; 0C2E _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_420                   ; 0C36 _ C7. 44 24, 08, 0000000F(d)
        mov     edx, dword [ebp-0CH]                    ; 0C3E _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C41 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C45 _ 89. 04 24
        call    make_window8                            ; 0C48 _ E8, FFFFFFFC(rel)
        jmp     ?_038                                   ; 0C4D _ EB, 24

?_037:  mov     eax, dword [shtctl]                     ; 0C4F _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 0C54 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_420                   ; 0C5C _ C7. 44 24, 08, 0000000F(d)
        mov     edx, dword [ebp-0CH]                    ; 0C64 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C67 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C6B _ 89. 04 24
        call    make_window8                            ; 0C6E _ E8, FFFFFFFC(rel)
?_038:  mov     eax, dword [ebp-0CH]                    ; 0C73 _ 8B. 45, F4
        mov     ecx, dword [eax+8H]                     ; 0C76 _ 8B. 48, 08
        mov     eax, dword [ebp-0CH]                    ; 0C79 _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 0C7C _ 8B. 50, 04
        mov     eax, dword [shtctl]                     ; 0C7F _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 0C84 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0C88 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 0C8C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0C94 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 0C9C _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C9F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0CA3 _ 89. 04 24
        call    sheet_refresh                           ; 0CA6 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 0CAB _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 0CB3 _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 0CBB _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 0CC3 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 0CCB _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 0CD3 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0CD6 _ 89. 04 24
        call    make_textbox8                           ; 0CD9 _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 0CDE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0CE3 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 0CE6 _ 8B. 45, EC
        mov     edx, dword [ebp-0CH]                    ; 0CE9 _ 8B. 55, F4
        mov     dword [eax+0B4H], edx                   ; 0CEC _ 89. 90, 000000B4
        mov     eax, dword [ebp-0CH]                    ; 0CF2 _ 8B. 45, F4
        mov     edx, dword [ebp-14H]                    ; 0CF5 _ 8B. 55, EC
        mov     dword [eax+20H], edx                    ; 0CF8 _ 89. 50, 20
        mov     eax, dword [current_console_task]       ; 0CFB _ A1, 00000278(d)
        test    eax, eax                                ; 0D00 _ 85. C0
        jz      ?_039                                   ; 0D02 _ 74, 7C
        mov     eax, dword [current_console_task]       ; 0D04 _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 0D09 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 0D0F _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 0D14 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_420                   ; 0D1C _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], edx                     ; 0D24 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0D28 _ 89. 04 24
        call    make_wtitle8                            ; 0D2B _ E8, FFFFFFFC(rel)
        mov     eax, dword [current_console_task]       ; 0D30 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 0D35 _ 8B. 80, 000000B4
        mov     ebx, dword [eax+8H]                     ; 0D3B _ 8B. 58, 08
        mov     eax, dword [current_console_task]       ; 0D3E _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 0D43 _ 8B. 80, 000000B4
        mov     ecx, dword [eax+4H]                     ; 0D49 _ 8B. 48, 04
        mov     eax, dword [current_console_task]       ; 0D4C _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 0D51 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 0D57 _ A1, 00000264(d)
        mov     dword [esp+14H], ebx                    ; 0D5C _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 0D60 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 0D64 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0D6C _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0D74 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0D78 _ 89. 04 24
        call    sheet_refresh                           ; 0D7B _ E8, FFFFFFFC(rel)
?_039:  mov     eax, dword [ebp-14H]                    ; 0D80 _ 8B. 45, EC
        mov     dword [current_console_task], eax       ; 0D83 _ A3, 00000278(d)
        call    get_code32_addr                         ; 0D88 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0D8D _ 89. 45, E8
        mov     eax, console_task                       ; 0D90 _ B8, 00000000(d)
        sub     eax, dword [ebp-18H]                    ; 0D95 _ 2B. 45, E8
        mov     edx, eax                                ; 0D98 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 0D9A _ 8B. 45, EC
        mov     dword [eax+4CH], edx                    ; 0D9D _ 89. 50, 4C
        mov     eax, dword [ebp-14H]                    ; 0DA0 _ 8B. 45, EC
        mov     dword [eax+74H], 0                      ; 0DA3 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-14H]                    ; 0DAA _ 8B. 45, EC
        mov     dword [eax+78H], 8                      ; 0DAD _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-14H]                    ; 0DB4 _ 8B. 45, EC
        mov     dword [eax+7CH], 32                     ; 0DB7 _ C7. 40, 7C, 00000020
        mov     eax, dword [ebp-14H]                    ; 0DBE _ 8B. 45, EC
        mov     dword [eax+80H], 24                     ; 0DC1 _ C7. 80, 00000080, 00000018
        mov     eax, dword [ebp-14H]                    ; 0DCB _ 8B. 45, EC
        mov     dword [eax+84H], 0                      ; 0DCE _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-14H]                    ; 0DD8 _ 8B. 45, EC
        mov     dword [eax+88H], 16                     ; 0DDB _ C7. 80, 00000088, 00000010
        mov     eax, dword [memman]                     ; 0DE5 _ A1, 00000000(d)
        mov     dword [esp+4H], 65536                   ; 0DEA _ C7. 44 24, 04, 00010000
        mov     dword [esp], eax                        ; 0DF2 _ 89. 04 24
        call    memman_alloc_4k                         ; 0DF5 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-14H]                    ; 0DFA _ 8B. 55, EC
        mov     dword [edx+0B8H], eax                   ; 0DFD _ 89. 82, 000000B8
        mov     eax, dword [ebp-14H]                    ; 0E03 _ 8B. 45, EC
        mov     eax, dword [eax+0B8H]                   ; 0E06 _ 8B. 80, 000000B8
        lea     edx, [eax+3F4H]                         ; 0E0C _ 8D. 90, 000003F4
        mov     eax, dword [ebp-14H]                    ; 0E12 _ 8B. 45, EC
        mov     dword [eax+64H], edx                    ; 0E15 _ 89. 50, 64
        mov     eax, dword [ebp-14H]                    ; 0E18 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0E1B _ 8B. 40, 64
        add     eax, 4                                  ; 0E1E _ 83. C0, 04
        mov     edx, dword [ebp-0CH]                    ; 0E21 _ 8B. 55, F4
        mov     dword [eax], edx                        ; 0E24 _ 89. 10
        mov     eax, dword [ebp-14H]                    ; 0E26 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0E29 _ 8B. 40, 64
        add     eax, 8                                  ; 0E2C _ 83. C0, 08
        mov     ebx, eax                                ; 0E2F _ 89. C3
        mov     eax, dword [memman]                     ; 0E31 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0E36 _ 89. 04 24
        call    memman_total                            ; 0E39 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 0E3E _ 89. 03
        mov     eax, dword [memman]                     ; 0E40 _ A1, 00000000(d)
        mov     dword [esp+4H], 128                     ; 0E45 _ C7. 44 24, 04, 00000080
        mov     dword [esp], eax                        ; 0E4D _ 89. 04 24
        call    memman_alloc                            ; 0E50 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0E55 _ 89. 45, E4
        mov     eax, dword [ebp-14H]                    ; 0E58 _ 8B. 45, EC
        lea     edx, [eax+10H]                          ; 0E5B _ 8D. 50, 10
        mov     eax, dword [ebp-14H]                    ; 0E5E _ 8B. 45, EC
        mov     dword [esp+0CH], eax                    ; 0E61 _ 89. 44 24, 0C
        mov     eax, dword [ebp-1CH]                    ; 0E65 _ 8B. 45, E4
        mov     dword [esp+8H], eax                     ; 0E68 _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 0E6C _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 0E74 _ 89. 14 24
        call    fifo8_init                              ; 0E77 _ E8, FFFFFFFC(rel)
        mov     dword [ebp+8H], 0                       ; 0E7C _ C7. 45, 08, 00000000
        jmp     ?_041                                   ; 0E83 _ EB, 1E

?_040:  mov     edx, dword [ebp+8H]                     ; 0E85 _ 8B. 55, 08
        mov     eax, edx                                ; 0E88 _ 89. D0
        add     eax, eax                                ; 0E8A _ 01. C0
        add     eax, edx                                ; 0E8C _ 01. D0
        shl     eax, 2                                  ; 0E8E _ C1. E0, 02
        lea     esi, [ebp-8H]                           ; 0E91 _ 8D. 75, F8
        add     eax, esi                                ; 0E94 _ 01. F0
        sub     eax, 116                                ; 0E96 _ 83. E8, 74
        mov     dword [eax], 0                          ; 0E99 _ C7. 00, 00000000
        add     dword [ebp+8H], 1                       ; 0E9F _ 83. 45, 08, 01
?_041:  cmp     dword [ebp+8H], 7                       ; 0EA3 _ 83. 7D, 08, 07
        jle     ?_040                                   ; 0EA7 _ 7E, DC
        mov     eax, dword [ebp-14H]                    ; 0EA9 _ 8B. 45, EC
        lea     edx, [ebp-7CH]                          ; 0EAC _ 8D. 55, 84
        mov     dword [eax+0CCH], edx                   ; 0EAF _ 89. 90, 000000CC
        mov     dword [esp+8H], 5                       ; 0EB5 _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 0EBD _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-14H]                    ; 0EC5 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0EC8 _ 89. 04 24
        call    task_run                                ; 0ECB _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 0                       ; 0ED0 _ 83. 7D, 08, 00
        jnz     ?_042                                   ; 0ED4 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 0ED6 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 0ED9 _ 8B. 00
        mov     dword [first_task_cons_selector], eax   ; 0EDB _ A3, 00000000(d)
?_042:  mov     eax, dword [ebp-0CH]                    ; 0EE0 _ 8B. 45, F4
        add     esp, 160                                ; 0EE3 _ 81. C4, 000000A0
        pop     ebx                                     ; 0EE9 _ 5B
        pop     esi                                     ; 0EEA _ 5E
        pop     ebp                                     ; 0EEB _ 5D
        ret                                             ; 0EEC _ C3
; launch_console End of function

kill_process:; Function begin
        push    ebp                                     ; 0EED _ 55
        mov     ebp, esp                                ; 0EEE _ 89. E5
        sub     esp, 40                                 ; 0EF0 _ 83. EC, 28
        call    task_now                                ; 0EF3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0EF8 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 0EFB _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 0EFE _ 8B. 90, 00000094
        mov     eax, dword [ebp-0CH]                    ; 0F04 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 0F07 _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 0F0D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0F11 _ 89. 04 24
        call    cons_newline                            ; 0F14 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 0F19 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 0F1C _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 0F22 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 0F25 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 0F28 _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 0F2E _ 8B. 45, F4
        add     eax, 48                                 ; 0F31 _ 83. C0, 30
        mov     dword [esp], eax                        ; 0F34 _ 89. 04 24
        call    asm_end_app                             ; 0F37 _ E8, FFFFFFFC(rel)
        leave                                           ; 0F3C _ C9
        ret                                             ; 0F3D _ C3
; kill_process End of function

cmd_dir:; Function begin
        push    ebp                                     ; 0F3E _ 55
        mov     ebp, esp                                ; 0F3F _ 89. E5
        push    ebx                                     ; 0F41 _ 53
        sub     esp, 68                                 ; 0F42 _ 83. EC, 44
        call    task_now                                ; 0F45 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0F4A _ 89. 45, E8
        mov     dword [ebp-0CH], 88064                  ; 0F4D _ C7. 45, F4, 00015800
        mov     eax, dword [memman]                     ; 0F54 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 0F59 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 0F61 _ 89. 04 24
        call    memman_alloc                            ; 0F64 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0F69 _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 0F6C _ 8B. 45, E4
        add     eax, 12                                 ; 0F6F _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0F72 _ C6. 00, 00
        jmp     ?_050                                   ; 0F75 _ E9, 0000013C

?_043:  mov     dword [ebp-10H], 0                      ; 0F7A _ C7. 45, F0, 00000000
        jmp     ?_046                                   ; 0F81 _ EB, 2C

?_044:  mov     edx, dword [ebp-0CH]                    ; 0F83 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 0F86 _ 8B. 45, F0
        add     eax, edx                                ; 0F89 _ 01. D0
        movzx   eax, byte [eax]                         ; 0F8B _ 0F B6. 00
        test    al, al                                  ; 0F8E _ 84. C0
        jz      ?_045                                   ; 0F90 _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 0F92 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0F95 _ 8B. 45, E4
        add     edx, eax                                ; 0F98 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 0F9A _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 0F9D _ 8B. 45, F0
        add     eax, ecx                                ; 0FA0 _ 01. C8
        movzx   eax, byte [eax]                         ; 0FA2 _ 0F B6. 00
        mov     byte [edx], al                          ; 0FA5 _ 88. 02
        add     dword [ebp-10H], 1                      ; 0FA7 _ 83. 45, F0, 01
        jmp     ?_046                                   ; 0FAB _ EB, 02

?_045:  jmp     ?_047                                   ; 0FAD _ EB, 06

?_046:  cmp     dword [ebp-10H], 7                      ; 0FAF _ 83. 7D, F0, 07
        jle     ?_044                                   ; 0FB3 _ 7E, CE
?_047:  mov     dword [ebp-14H], 0                      ; 0FB5 _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 0FBC _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0FBF _ 8B. 45, E4
        add     eax, edx                                ; 0FC2 _ 01. D0
        mov     byte [eax], 46                          ; 0FC4 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 0FC7 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 0FCB _ C7. 45, EC, 00000000
        jmp     ?_049                                   ; 0FD2 _ EB, 1E

?_048:  mov     edx, dword [ebp-10H]                    ; 0FD4 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0FD7 _ 8B. 45, E4
        add     edx, eax                                ; 0FDA _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 0FDC _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 0FDF _ 8B. 45, EC
        add     eax, ecx                                ; 0FE2 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 0FE4 _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 0FE8 _ 88. 02
        add     dword [ebp-10H], 1                      ; 0FEA _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 0FEE _ 83. 45, EC, 01
?_049:  cmp     dword [ebp-14H], 2                      ; 0FF2 _ 83. 7D, EC, 02
        jle     ?_048                                   ; 0FF6 _ 7E, DC
        mov     eax, dword [ebp-18H]                    ; 0FF8 _ 8B. 45, E8
        mov     ecx, dword [eax+9CH]                    ; 0FFB _ 8B. 88, 0000009C
        mov     eax, dword [ebp-18H]                    ; 1001 _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 1004 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 100A _ A1, 00000264(d)
        mov     ebx, dword [ebp-1CH]                    ; 100F _ 8B. 5D, E4
        mov     dword [esp+14H], ebx                    ; 1012 _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 1016 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 101E _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 1022 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 102A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 102E _ 89. 04 24
        call    showString                              ; 1031 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], 136                    ; 1036 _ C7. 45, E0, 00000088
        mov     eax, dword [ebp-0CH]                    ; 103D _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 1040 _ 8B. 40, 1C
        mov     dword [esp], eax                        ; 1043 _ 89. 04 24
        call    intToHexStr                             ; 1046 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 104B _ 89. 45, DC
        mov     eax, dword [ebp-18H]                    ; 104E _ 8B. 45, E8
        mov     ecx, dword [eax+9CH]                    ; 1051 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-18H]                    ; 1057 _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 105A _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1060 _ A1, 00000264(d)
        mov     ebx, dword [ebp-24H]                    ; 1065 _ 8B. 5D, DC
        mov     dword [esp+14H], ebx                    ; 1068 _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 106C _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 1074 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-20H]                    ; 1078 _ 8B. 4D, E0
        mov     dword [esp+8H], ecx                     ; 107B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 107F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1083 _ 89. 04 24
        call    showString                              ; 1086 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 108B _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 108E _ 8B. 90, 00000094
        mov     eax, dword [ebp-18H]                    ; 1094 _ 8B. 45, E8
        mov     eax, dword [eax+9CH]                    ; 1097 _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 109D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 10A1 _ 89. 04 24
        call    cons_newline                            ; 10A4 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-18H]                    ; 10A9 _ 8B. 55, E8
        mov     dword [edx+9CH], eax                    ; 10AC _ 89. 82, 0000009C
        add     dword [ebp-0CH], 32                     ; 10B2 _ 83. 45, F4, 20
?_050:  mov     eax, dword [ebp-0CH]                    ; 10B6 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 10B9 _ 0F B6. 00
        test    al, al                                  ; 10BC _ 84. C0
        jne     ?_043                                   ; 10BE _ 0F 85, FFFFFEB6
        mov     edx, dword [ebp-1CH]                    ; 10C4 _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 10C7 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 10CC _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 10D4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 10D8 _ 89. 04 24
        call    memman_free                             ; 10DB _ E8, FFFFFFFC(rel)
        add     esp, 68                                 ; 10E0 _ 83. C4, 44
        pop     ebx                                     ; 10E3 _ 5B
        pop     ebp                                     ; 10E4 _ 5D
        ret                                             ; 10E5 _ C3
; cmd_dir End of function

cmd_type:; Function begin
        push    ebp                                     ; 10E6 _ 55
        mov     ebp, esp                                ; 10E7 _ 89. E5
        push    esi                                     ; 10E9 _ 56
        push    ebx                                     ; 10EA _ 53
        sub     esp, 96                                 ; 10EB _ 83. EC, 60
        call    task_now                                ; 10EE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 10F3 _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 10F6 _ 8B. 45, DC
        mov     eax, dword [eax+94H]                    ; 10F9 _ 8B. 80, 00000094
        test    eax, eax                                ; 10FF _ 85. C0
        jnz     ?_051                                   ; 1101 _ 75, 05
        jmp     ?_073                                   ; 1103 _ E9, 00000385

?_051:  mov     eax, dword [memman]                     ; 1108 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 110D _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 1115 _ 89. 04 24
        call    memman_alloc                            ; 1118 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 111D _ 89. 45, D8
        mov     eax, dword [ebp-28H]                    ; 1120 _ 8B. 45, D8
        add     eax, 12                                 ; 1123 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 1126 _ C6. 00, 00
        mov     dword [ebp-0CH], 0                      ; 1129 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 5                      ; 1130 _ C7. 45, F0, 00000005
        mov     dword [ebp-10H], 5                      ; 1137 _ C7. 45, F0, 00000005
        jmp     ?_054                                   ; 113E _ EB, 30

?_052:  mov     edx, dword [ebp-10H]                    ; 1140 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 1143 _ 8B. 45, 08
        add     eax, edx                                ; 1146 _ 01. D0
        movzx   eax, byte [eax]                         ; 1148 _ 0F B6. 00
        test    al, al                                  ; 114B _ 84. C0
        jz      ?_053                                   ; 114D _ 74, 1F
        mov     edx, dword [ebp-0CH]                    ; 114F _ 8B. 55, F4
        mov     eax, dword [ebp-28H]                    ; 1152 _ 8B. 45, D8
        add     edx, eax                                ; 1155 _ 01. C2
        mov     ecx, dword [ebp-10H]                    ; 1157 _ 8B. 4D, F0
        mov     eax, dword [ebp+8H]                     ; 115A _ 8B. 45, 08
        add     eax, ecx                                ; 115D _ 01. C8
        movzx   eax, byte [eax]                         ; 115F _ 0F B6. 00
        mov     byte [edx], al                          ; 1162 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 1164 _ 83. 45, F4, 01
        add     dword [ebp-10H], 1                      ; 1168 _ 83. 45, F0, 01
        jmp     ?_054                                   ; 116C _ EB, 02

?_053:  jmp     ?_055                                   ; 116E _ EB, 06

?_054:  cmp     dword [ebp-10H], 16                     ; 1170 _ 83. 7D, F0, 10
        jle     ?_052                                   ; 1174 _ 7E, CA
?_055:  mov     edx, dword [ebp-0CH]                    ; 1176 _ 8B. 55, F4
        mov     eax, dword [ebp-28H]                    ; 1179 _ 8B. 45, D8
        add     eax, edx                                ; 117C _ 01. D0
        mov     byte [eax], 0                           ; 117E _ C6. 00, 00
        mov     dword [ebp-14H], 88064                  ; 1181 _ C7. 45, EC, 00015800
        jmp     ?_071                                   ; 1188 _ E9, 000002A2

?_056:  mov     byte [ebp-31H], 0                       ; 118D _ C6. 45, CF, 00
        mov     dword [ebp-18H], 0                      ; 1191 _ C7. 45, E8, 00000000
        jmp     ?_059                                   ; 1198 _ EB, 2C

?_057:  mov     edx, dword [ebp-14H]                    ; 119A _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 119D _ 8B. 45, E8
        add     eax, edx                                ; 11A0 _ 01. D0
        movzx   eax, byte [eax]                         ; 11A2 _ 0F B6. 00
        test    al, al                                  ; 11A5 _ 84. C0
        jz      ?_058                                   ; 11A7 _ 74, 1B
        mov     edx, dword [ebp-14H]                    ; 11A9 _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 11AC _ 8B. 45, E8
        add     eax, edx                                ; 11AF _ 01. D0
        movzx   eax, byte [eax]                         ; 11B1 _ 0F B6. 00
        lea     ecx, [ebp-3DH]                          ; 11B4 _ 8D. 4D, C3
        mov     edx, dword [ebp-18H]                    ; 11B7 _ 8B. 55, E8
        add     edx, ecx                                ; 11BA _ 01. CA
        mov     byte [edx], al                          ; 11BC _ 88. 02
        add     dword [ebp-18H], 1                      ; 11BE _ 83. 45, E8, 01
        jmp     ?_059                                   ; 11C2 _ EB, 02

?_058:  jmp     ?_060                                   ; 11C4 _ EB, 06

?_059:  cmp     dword [ebp-18H], 7                      ; 11C6 _ 83. 7D, E8, 07
        jle     ?_057                                   ; 11CA _ 7E, CE
?_060:  mov     dword [ebp-1CH], 0                      ; 11CC _ C7. 45, E4, 00000000
        lea     edx, [ebp-3DH]                          ; 11D3 _ 8D. 55, C3
        mov     eax, dword [ebp-18H]                    ; 11D6 _ 8B. 45, E8
        add     eax, edx                                ; 11D9 _ 01. D0
        mov     byte [eax], 46                          ; 11DB _ C6. 00, 2E
        add     dword [ebp-18H], 1                      ; 11DE _ 83. 45, E8, 01
        mov     dword [ebp-1CH], 0                      ; 11E2 _ C7. 45, E4, 00000000
        jmp     ?_062                                   ; 11E9 _ EB, 1E

?_061:  mov     edx, dword [ebp-14H]                    ; 11EB _ 8B. 55, EC
        mov     eax, dword [ebp-1CH]                    ; 11EE _ 8B. 45, E4
        add     eax, edx                                ; 11F1 _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 11F3 _ 0F B6. 40, 08
        lea     ecx, [ebp-3DH]                          ; 11F7 _ 8D. 4D, C3
        mov     edx, dword [ebp-18H]                    ; 11FA _ 8B. 55, E8
        add     edx, ecx                                ; 11FD _ 01. CA
        mov     byte [edx], al                          ; 11FF _ 88. 02
        add     dword [ebp-18H], 1                      ; 1201 _ 83. 45, E8, 01
        add     dword [ebp-1CH], 1                      ; 1205 _ 83. 45, E4, 01
?_062:  cmp     dword [ebp-1CH], 2                      ; 1209 _ 83. 7D, E4, 02
        jle     ?_061                                   ; 120D _ 7E, DC
        lea     eax, [ebp-3DH]                          ; 120F _ 8D. 45, C3
        mov     dword [esp+4H], eax                     ; 1212 _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 1216 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1219 _ 89. 04 24
        call    strcmp                                  ; 121C _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1221 _ 83. F8, 01
        jne     ?_070                                   ; 1224 _ 0F 85, 00000201
        mov     dword [ebp-2CH], 97280                  ; 122A _ C7. 45, D4, 00017C00
        mov     eax, dword [ebp-14H]                    ; 1231 _ 8B. 45, EC
        movzx   eax, word [eax+1AH]                     ; 1234 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 1238 _ 0F B7. C0
        shl     eax, 9                                  ; 123B _ C1. E0, 09
        add     dword [ebp-2CH], eax                    ; 123E _ 01. 45, D4
        mov     eax, dword [ebp-14H]                    ; 1241 _ 8B. 45, EC
        mov     eax, dword [eax+1CH]                    ; 1244 _ 8B. 40, 1C
        mov     dword [ebp-30H], eax                    ; 1247 _ 89. 45, D0
        mov     dword [ebp-20H], 0                      ; 124A _ C7. 45, E0, 00000000
        mov     eax, dword [ebp-24H]                    ; 1251 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 1254 _ C7. 80, 00000098, 00000010
        mov     dword [ebp-20H], 0                      ; 125E _ C7. 45, E0, 00000000
        jmp     ?_069                                   ; 1265 _ E9, 000001B2

?_063:  mov     edx, dword [ebp-20H]                    ; 126A _ 8B. 55, E0
        mov     eax, dword [ebp-2CH]                    ; 126D _ 8B. 45, D4
        add     eax, edx                                ; 1270 _ 01. D0
        movzx   eax, byte [eax]                         ; 1272 _ 0F B6. 00
        mov     byte [ebp-3FH], al                      ; 1275 _ 88. 45, C1
        mov     byte [ebp-3EH], 0                       ; 1278 _ C6. 45, C2, 00
        movzx   eax, byte [ebp-3FH]                     ; 127C _ 0F B6. 45, C1
        cmp     al, 9                                   ; 1280 _ 3C, 09
        jne     ?_066                                   ; 1282 _ 0F 85, 000000A7
?_064:  mov     eax, dword [ebp-24H]                    ; 1288 _ 8B. 45, DC
        mov     ebx, dword [eax+9CH]                    ; 128B _ 8B. 98, 0000009C
        mov     eax, dword [ebp-24H]                    ; 1291 _ 8B. 45, DC
        mov     ecx, dword [eax+98H]                    ; 1294 _ 8B. 88, 00000098
        mov     eax, dword [ebp-24H]                    ; 129A _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 129D _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 12A3 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_421                  ; 12A8 _ C7. 44 24, 14, 00000017(d)
        mov     dword [esp+10H], 7                      ; 12B0 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 12B8 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 12BC _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 12C0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 12C4 _ 89. 04 24
        call    showString                              ; 12C7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 12CC _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 12CF _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 12D5 _ 8D. 50, 08
        mov     eax, dword [ebp-24H]                    ; 12D8 _ 8B. 45, DC
        mov     dword [eax+98H], edx                    ; 12DB _ 89. 90, 00000098
        mov     eax, dword [ebp-24H]                    ; 12E1 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 12E4 _ 8B. 80, 00000098
        cmp     eax, 248                                ; 12EA _ 3D, 000000F8
        jnz     ?_065                                   ; 12EF _ 75, 39
        mov     eax, dword [ebp-24H]                    ; 12F1 _ 8B. 45, DC
        mov     dword [eax+98H], 8                      ; 12F4 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-24H]                    ; 12FE _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1301 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 1307 _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 130A _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 1310 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1314 _ 89. 04 24
        call    cons_newline                            ; 1317 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 131C _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 131F _ 89. 82, 0000009C
        jmp     ?_064                                   ; 1325 _ E9, FFFFFF5E

?_065:  jmp     ?_064                                   ; 132A _ E9, FFFFFF59

?_066:  movzx   eax, byte [ebp-3FH]                     ; 132F _ 0F B6. 45, C1
        cmp     al, 10                                  ; 1333 _ 3C, 0A
        jnz     ?_067                                   ; 1335 _ 75, 39
        mov     eax, dword [ebp-24H]                    ; 1337 _ 8B. 45, DC
        mov     dword [eax+98H], 8                      ; 133A _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-24H]                    ; 1344 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1347 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 134D _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 1350 _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 1356 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 135A _ 89. 04 24
        call    cons_newline                            ; 135D _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 1362 _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 1365 _ 89. 82, 0000009C
        jmp     ?_068                                   ; 136B _ E9, 000000A8

?_067:  movzx   eax, byte [ebp-3FH]                     ; 1370 _ 0F B6. 45, C1
        cmp     al, 13                                  ; 1374 _ 3C, 0D
        je      ?_068                                   ; 1376 _ 0F 84, 0000009C
        mov     eax, dword [ebp-24H]                    ; 137C _ 8B. 45, DC
        mov     ebx, dword [eax+9CH]                    ; 137F _ 8B. 98, 0000009C
        mov     eax, dword [ebp-24H]                    ; 1385 _ 8B. 45, DC
        mov     ecx, dword [eax+98H]                    ; 1388 _ 8B. 88, 00000098
        mov     eax, dword [ebp-24H]                    ; 138E _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1391 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1397 _ A1, 00000264(d)
        lea     esi, [ebp-3FH]                          ; 139C _ 8D. 75, C1
        mov     dword [esp+14H], esi                    ; 139F _ 89. 74 24, 14
        mov     dword [esp+10H], 7                      ; 13A3 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 13AB _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 13AF _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 13B3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 13B7 _ 89. 04 24
        call    showString                              ; 13BA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 13BF _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 13C2 _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 13C8 _ 8D. 50, 08
        mov     eax, dword [ebp-24H]                    ; 13CB _ 8B. 45, DC
        mov     dword [eax+98H], edx                    ; 13CE _ 89. 90, 00000098
        mov     eax, dword [ebp-24H]                    ; 13D4 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 13D7 _ 8B. 80, 00000098
        cmp     eax, 248                                ; 13DD _ 3D, 000000F8
        jnz     ?_068                                   ; 13E2 _ 75, 34
        mov     eax, dword [ebp-24H]                    ; 13E4 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 13E7 _ C7. 80, 00000098, 00000010
        mov     eax, dword [ebp-24H]                    ; 13F1 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 13F4 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 13FA _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 13FD _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 1403 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1407 _ 89. 04 24
        call    cons_newline                            ; 140A _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 140F _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 1412 _ 89. 82, 0000009C
?_068:  add     dword [ebp-20H], 1                      ; 1418 _ 83. 45, E0, 01
?_069:  mov     eax, dword [ebp-20H]                    ; 141C _ 8B. 45, E0
        cmp     eax, dword [ebp-30H]                    ; 141F _ 3B. 45, D0
        jl      ?_063                                   ; 1422 _ 0F 8C, FFFFFE42
        nop                                             ; 1428 _ 90
        jmp     ?_072                                   ; 1429 _ EB, 12

?_070:  add     dword [ebp-14H], 32                     ; 142B _ 83. 45, EC, 20
?_071:  mov     eax, dword [ebp-14H]                    ; 142F _ 8B. 45, EC
        movzx   eax, byte [eax]                         ; 1432 _ 0F B6. 00
        test    al, al                                  ; 1435 _ 84. C0
        jne     ?_056                                   ; 1437 _ 0F 85, FFFFFD50
?_072:  mov     eax, dword [ebp-24H]                    ; 143D _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1440 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 1446 _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 1449 _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 144F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1453 _ 89. 04 24
        call    cons_newline                            ; 1456 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 145B _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 145E _ 89. 82, 0000009C
        mov     edx, dword [ebp-28H]                    ; 1464 _ 8B. 55, D8
        mov     eax, dword [memman]                     ; 1467 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 146C _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 1474 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1478 _ 89. 04 24
        call    memman_free                             ; 147B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 1480 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 1483 _ C7. 80, 00000098, 00000010
?_073:  add     esp, 96                                 ; 148D _ 83. C4, 60
        pop     ebx                                     ; 1490 _ 5B
        pop     esi                                     ; 1491 _ 5E
        pop     ebp                                     ; 1492 _ 5D
        ret                                             ; 1493 _ C3
; cmd_type End of function

cmd_mem:; Function begin
        push    ebp                                     ; 1494 _ 55
        mov     ebp, esp                                ; 1495 _ 89. E5
        push    ebx                                     ; 1497 _ 53
        sub     esp, 52                                 ; 1498 _ 83. EC, 34
        call    task_now                                ; 149B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 14A0 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 14A3 _ 8B. 45, F4
        mov     eax, dword [eax+94H]                    ; 14A6 _ 8B. 80, 00000094
        test    eax, eax                                ; 14AC _ 85. C0
        jnz     ?_074                                   ; 14AE _ 75, 05
        jmp     ?_075                                   ; 14B0 _ E9, 000000FF

?_074:  mov     eax, dword [ebp+8H]                     ; 14B5 _ 8B. 45, 08
        lea     edx, [eax+3FFH]                         ; 14B8 _ 8D. 90, 000003FF
        test    eax, eax                                ; 14BE _ 85. C0
        cmovs   eax, edx                                ; 14C0 _ 0F 48. C2
        sar     eax, 10                                 ; 14C3 _ C1. F8, 0A
        mov     dword [esp], eax                        ; 14C6 _ 89. 04 24
        call    intToHexStr                             ; 14C9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 14CE _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 14D1 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 14D4 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 14DA _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 14DD _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 14E3 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_422                  ; 14E8 _ C7. 44 24, 14, 00000019(d)
        mov     dword [esp+10H], 7                      ; 14F0 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 14F8 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 14FC _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 1504 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1508 _ 89. 04 24
        call    showString                              ; 150B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1510 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 1513 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 1519 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 151C _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1522 _ A1, 00000264(d)
        mov     ebx, dword [ebp-10H]                    ; 1527 _ 8B. 5D, F0
        mov     dword [esp+14H], ebx                    ; 152A _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 152E _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 1536 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 52                      ; 153A _ C7. 44 24, 08, 00000034
        mov     dword [esp+4H], edx                     ; 1542 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1546 _ 89. 04 24
        call    showString                              ; 1549 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 154E _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 1551 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 1557 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 155A _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1560 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_423                  ; 1565 _ C7. 44 24, 14, 0000001F(d)
        mov     dword [esp+10H], 7                      ; 156D _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 1575 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 126                     ; 1579 _ C7. 44 24, 08, 0000007E
        mov     dword [esp+4H], edx                     ; 1581 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1585 _ 89. 04 24
        call    showString                              ; 1588 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 158D _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 1590 _ 8B. 90, 00000094
        mov     eax, dword [ebp-0CH]                    ; 1596 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 1599 _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 159F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 15A3 _ 89. 04 24
        call    cons_newline                            ; 15A6 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-0CH]                    ; 15AB _ 8B. 55, F4
        mov     dword [edx+9CH], eax                    ; 15AE _ 89. 82, 0000009C
?_075:  add     esp, 52                                 ; 15B4 _ 83. C4, 34
        pop     ebx                                     ; 15B7 _ 5B
        pop     ebp                                     ; 15B8 _ 5D
        ret                                             ; 15B9 _ C3
; cmd_mem End of function

cmd_cls:; Function begin
        push    ebp                                     ; 15BA _ 55
        mov     ebp, esp                                ; 15BB _ 89. E5
        sub     esp, 56                                 ; 15BD _ 83. EC, 38
        call    task_now                                ; 15C0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 15C5 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 15C8 _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 15CB _ 8B. 80, 00000094
        test    eax, eax                                ; 15D1 _ 85. C0
        jnz     ?_076                                   ; 15D3 _ 75, 05
        jmp     ?_081                                   ; 15D5 _ E9, 000000E2

?_076:  mov     dword [ebp-0CH], 8                      ; 15DA _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 28                     ; 15E1 _ C7. 45, F0, 0000001C
        mov     dword [ebp-10H], 28                     ; 15E8 _ C7. 45, F0, 0000001C
        jmp     ?_080                                   ; 15EF _ EB, 41

?_077:  mov     dword [ebp-0CH], 8                      ; 15F1 _ C7. 45, F4, 00000008
        jmp     ?_079                                   ; 15F8 _ EB, 2B

?_078:  mov     eax, dword [ebp-14H]                    ; 15FA _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 15FD _ 8B. 80, 00000094
        mov     edx, dword [eax]                        ; 1603 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 1605 _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 1608 _ 8B. 80, 00000094
        mov     eax, dword [eax+4H]                     ; 160E _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 1611 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 1615 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 1617 _ 8B. 45, F4
        add     eax, ecx                                ; 161A _ 01. C8
        add     eax, edx                                ; 161C _ 01. D0
        mov     byte [eax], 0                           ; 161E _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 1621 _ 83. 45, F4, 01
?_079:  cmp     dword [ebp-0CH], 247                    ; 1625 _ 81. 7D, F4, 000000F7
        jle     ?_078                                   ; 162C _ 7E, CC
        add     dword [ebp-10H], 1                      ; 162E _ 83. 45, F0, 01
?_080:  cmp     dword [ebp-10H], 155                    ; 1632 _ 81. 7D, F0, 0000009B
        jle     ?_077                                   ; 1639 _ 7E, B6
        mov     eax, dword [ebp-14H]                    ; 163B _ 8B. 45, EC
        mov     edx, dword [eax+94H]                    ; 163E _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1644 _ A1, 00000264(d)
        mov     dword [esp+14H], 156                    ; 1649 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 1651 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 1659 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1661 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1669 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 166D _ 89. 04 24
        call    sheet_refresh                           ; 1670 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 1675 _ 8B. 45, EC
        mov     dword [eax+9CH], 28                     ; 1678 _ C7. 80, 0000009C, 0000001C
        mov     eax, dword [ebp-14H]                    ; 1682 _ 8B. 45, EC
        mov     edx, dword [eax+94H]                    ; 1685 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 168B _ A1, 00000264(d)
        mov     dword [esp+14H], ?_424                  ; 1690 _ C7. 44 24, 14, 00000023(d)
        mov     dword [esp+10H], 7                      ; 1698 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 16A0 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 16A8 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 16B0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 16B4 _ 89. 04 24
        call    showString                              ; 16B7 _ E8, FFFFFFFC(rel)
?_081:  leave                                           ; 16BC _ C9
        ret                                             ; 16BD _ C3
; cmd_cls End of function

cmd_execute_program:; Function begin
        push    ebp                                     ; 16BE _ 55
        mov     ebp, esp                                ; 16BF _ 89. E5
        push    ebx                                     ; 16C1 _ 53
        sub     esp, 68                                 ; 16C2 _ 83. EC, 44
        call    io_cli                                  ; 16C5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 16CA _ A1, 00000000(d)
        mov     dword [esp+4H], 16                      ; 16CF _ C7. 44 24, 04, 00000010
        mov     dword [esp], eax                        ; 16D7 _ 89. 04 24
        call    memman_alloc                            ; 16DA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 16DF _ 89. 45, F0
        call    task_now                                ; 16E2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 16E7 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 16EA _ 8B. 45, EC
        mov     edx, dword [ebp-10H]                    ; 16ED _ 8B. 55, F0
        mov     dword [eax+0B0H], edx                   ; 16F0 _ 89. 90, 000000B0
        mov     eax, dword [ebp-10H]                    ; 16F6 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 16F9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16FD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1700 _ 89. 04 24
        call    file_loadfile                           ; 1703 _ E8, FFFFFFFC(rel)
        call    get_addr_gdt                            ; 1708 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 170D _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 1710 _ 8B. 45, EC
        mov     edx, dword [eax]                        ; 1713 _ 8B. 10
        mov     eax, dword [first_task_cons_selector]   ; 1715 _ A1, 00000000(d)
        sub     edx, eax                                ; 171A _ 29. C2
        mov     eax, edx                                ; 171C _ 89. D0
        lea     edx, [eax+7H]                           ; 171E _ 8D. 50, 07
        test    eax, eax                                ; 1721 _ 85. C0
        cmovs   eax, edx                                ; 1723 _ 0F 48. C2
        sar     eax, 3                                  ; 1726 _ C1. F8, 03
        add     eax, 21                                 ; 1729 _ 83. C0, 15
        mov     dword [ebp-1CH], eax                    ; 172C _ 89. 45, E4
        mov     eax, dword [ebp-14H]                    ; 172F _ 8B. 45, EC
        mov     edx, dword [eax]                        ; 1732 _ 8B. 10
        mov     eax, dword [first_task_cons_selector]   ; 1734 _ A1, 00000000(d)
        sub     edx, eax                                ; 1739 _ 29. C2
        mov     eax, edx                                ; 173B _ 89. D0
        lea     edx, [eax+7H]                           ; 173D _ 8D. 50, 07
        test    eax, eax                                ; 1740 _ 85. C0
        cmovs   eax, edx                                ; 1742 _ 0F 48. C2
        sar     eax, 3                                  ; 1745 _ C1. F8, 03
        add     eax, 30                                 ; 1748 _ 83. C0, 1E
        mov     dword [ebp-20H], eax                    ; 174B _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 174E _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 1751 _ 8B. 00
        mov     edx, dword [ebp-14H]                    ; 1753 _ 8B. 55, EC
        add     edx, 188                                ; 1756 _ 81. C2, 000000BC
        mov     dword [esp+0CH], 16634                  ; 175C _ C7. 44 24, 0C, 000040FA
        mov     dword [esp+8H], eax                     ; 1764 _ 89. 44 24, 08
        mov     dword [esp+4H], 1048575                 ; 1768 _ C7. 44 24, 04, 000FFFFF
        mov     dword [esp], edx                        ; 1770 _ 89. 14 24
        call    set_segmdesc                            ; 1773 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 1778 _ A1, 00000000(d)
        mov     dword [esp+4H], 65536                   ; 177D _ C7. 44 24, 04, 00010000
        mov     dword [esp], eax                        ; 1785 _ 89. 04 24
        call    memman_alloc_4k                         ; 1788 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 178D _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 1790 _ 8B. 45, F0
        mov     edx, dword [ebp-24H]                    ; 1793 _ 8B. 55, DC
        mov     dword [eax+4H], edx                     ; 1796 _ 89. 50, 04
        mov     eax, dword [ebp-24H]                    ; 1799 _ 8B. 45, DC
        mov     edx, dword [ebp-14H]                    ; 179C _ 8B. 55, EC
        add     edx, 196                                ; 179F _ 81. C2, 000000C4
        mov     dword [esp+0CH], 16626                  ; 17A5 _ C7. 44 24, 0C, 000040F2
        mov     dword [esp+8H], eax                     ; 17AD _ 89. 44 24, 08
        mov     dword [esp+4H], 77055                   ; 17B1 _ C7. 44 24, 04, 00012CFF
        mov     dword [esp], edx                        ; 17B9 _ 89. 14 24
        call    set_segmdesc                            ; 17BC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 17C1 _ 8B. 45, EC
        mov     dword [eax+30H], 0                      ; 17C4 _ C7. 40, 30, 00000000
        call    io_sti                                  ; 17CB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 17D0 _ 8B. 45, EC
        add     eax, 48                                 ; 17D3 _ 83. C0, 30
        mov     dword [esp+10H], eax                    ; 17D6 _ 89. 44 24, 10
        mov     dword [esp+0CH], 12                     ; 17DA _ C7. 44 24, 0C, 0000000C
        mov     dword [esp+8H], 65536                   ; 17E2 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], 4                       ; 17EA _ C7. 44 24, 04, 00000004
        mov     dword [esp], 0                          ; 17F2 _ C7. 04 24, 00000000
        call    start_app                               ; 17F9 _ E8, FFFFFFFC(rel)
        call    io_cli                                  ; 17FE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 1803 _ C7. 45, F4, 00000000
        mov     dword [ebp-0CH], 0                      ; 180A _ C7. 45, F4, 00000000
        jmp     ?_084                                   ; 1811 _ E9, 0000008A

?_082:  mov     eax, dword [ebp-14H]                    ; 1816 _ 8B. 45, EC
        mov     ecx, dword [eax+0CCH]                   ; 1819 _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 181F _ 8B. 55, F4
        mov     eax, edx                                ; 1822 _ 89. D0
        add     eax, eax                                ; 1824 _ 01. C0
        add     eax, edx                                ; 1826 _ 01. D0
        shl     eax, 2                                  ; 1828 _ C1. E0, 02
        add     eax, ecx                                ; 182B _ 01. C8
        mov     eax, dword [eax]                        ; 182D _ 8B. 00
        test    eax, eax                                ; 182F _ 85. C0
        jz      ?_083                                   ; 1831 _ 74, 69
        mov     eax, dword [ebp-14H]                    ; 1833 _ 8B. 45, EC
        mov     ecx, dword [eax+0CCH]                   ; 1836 _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 183C _ 8B. 55, F4
        mov     eax, edx                                ; 183F _ 89. D0
        add     eax, eax                                ; 1841 _ 01. C0
        add     eax, edx                                ; 1843 _ 01. D0
        shl     eax, 2                                  ; 1845 _ C1. E0, 02
        add     eax, ecx                                ; 1848 _ 01. C8
        mov     eax, dword [eax+4H]                     ; 184A _ 8B. 40, 04
        mov     ecx, eax                                ; 184D _ 89. C1
        mov     eax, dword [ebp-14H]                    ; 184F _ 8B. 45, EC
        mov     ebx, dword [eax+0CCH]                   ; 1852 _ 8B. 98, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 1858 _ 8B. 55, F4
        mov     eax, edx                                ; 185B _ 89. D0
        add     eax, eax                                ; 185D _ 01. C0
        add     eax, edx                                ; 185F _ 01. D0
        shl     eax, 2                                  ; 1861 _ C1. E0, 02
        add     eax, ebx                                ; 1864 _ 01. D8
        mov     eax, dword [eax]                        ; 1866 _ 8B. 00
        mov     edx, eax                                ; 1868 _ 89. C2
        mov     eax, dword [memman]                     ; 186A _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 186F _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1873 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1877 _ 89. 04 24
        call    memman_free_4k                          ; 187A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 187F _ 8B. 45, EC
        mov     ecx, dword [eax+0CCH]                   ; 1882 _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 1888 _ 8B. 55, F4
        mov     eax, edx                                ; 188B _ 89. D0
        add     eax, eax                                ; 188D _ 01. C0
        add     eax, edx                                ; 188F _ 01. D0
        shl     eax, 2                                  ; 1891 _ C1. E0, 02
        add     eax, ecx                                ; 1894 _ 01. C8
        mov     dword [eax], 0                          ; 1896 _ C7. 00, 00000000
?_083:  add     dword [ebp-0CH], 1                      ; 189C _ 83. 45, F4, 01
?_084:  cmp     dword [ebp-0CH], 7                      ; 18A0 _ 83. 7D, F4, 07
        jle     ?_082                                   ; 18A4 _ 0F 8E, FFFFFF6C
        mov     eax, dword [ebp-10H]                    ; 18AA _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 18AD _ 8B. 40, 08
        mov     ecx, eax                                ; 18B0 _ 89. C1
        mov     eax, dword [ebp-10H]                    ; 18B2 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 18B5 _ 8B. 00
        mov     edx, eax                                ; 18B7 _ 89. C2
        mov     eax, dword [memman]                     ; 18B9 _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 18BE _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 18C2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18C6 _ 89. 04 24
        call    memman_free_4k                          ; 18C9 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 18CE _ 8B. 55, DC
        mov     eax, dword [memman]                     ; 18D1 _ A1, 00000000(d)
        mov     dword [esp+8H], 65536                   ; 18D6 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], edx                     ; 18DE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18E2 _ 89. 04 24
        call    memman_free_4k                          ; 18E5 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-10H]                    ; 18EA _ 8B. 55, F0
        mov     eax, dword [memman]                     ; 18ED _ A1, 00000000(d)
        mov     dword [esp+8H], 16                      ; 18F2 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 18FA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18FE _ 89. 04 24
        call    memman_free                             ; 1901 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 1906 _ 8B. 45, EC
        mov     dword [eax+0B0H], 0                     ; 1909 _ C7. 80, 000000B0, 00000000
        call    io_sti                                  ; 1913 _ E8, FFFFFFFC(rel)
        add     esp, 68                                 ; 1918 _ 83. C4, 44
        pop     ebx                                     ; 191B _ 5B
        pop     ebp                                     ; 191C _ 5D
        ret                                             ; 191D _ C3
; cmd_execute_program End of function

cmd_start:; Function begin
        push    ebp                                     ; 191E _ 55
        mov     ebp, esp                                ; 191F _ 89. E5
        sub     esp, 40                                 ; 1921 _ 83. EC, 28
        mov     eax, dword [console_count]              ; 1924 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 1929 _ 89. 04 24
        call    launch_console                          ; 192C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1931 _ 89. 45, F0
        mov     eax, dword [shtctl]                     ; 1934 _ A1, 00000264(d)
        mov     dword [esp+0CH], 176                    ; 1939 _ C7. 44 24, 0C, 000000B0
        mov     dword [esp+8H], 156                     ; 1941 _ C7. 44 24, 08, 0000009C
        mov     edx, dword [ebp-10H]                    ; 1949 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 194C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1950 _ 89. 04 24
        call    sheet_slide                             ; 1953 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 1958 _ A1, 00000264(d)
        mov     dword [esp+8H], 1                       ; 195D _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-10H]                    ; 1965 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1968 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 196C _ 89. 04 24
        call    sheet_updown                            ; 196F _ E8, FFFFFFFC(rel)
        mov     eax, dword [console_count]              ; 1974 _ A1, 00000000(d)
        add     eax, 1                                  ; 1979 _ 83. C0, 01
        mov     dword [console_count], eax              ; 197C _ A3, 00000000(d)
        mov     eax, dword [ebp-10H]                    ; 1981 _ 8B. 45, F0
        mov     eax, dword [eax+20H]                    ; 1984 _ 8B. 40, 20
        mov     dword [ebp-14H], eax                    ; 1987 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 198A _ 8B. 45, EC
        mov     dword [eax+28H], 0                      ; 198D _ C7. 40, 28, 00000000
        mov     dword [ebp-0CH], 6                      ; 1994 _ C7. 45, F4, 00000006
        jmp     ?_086                                   ; 199B _ EB, 24

?_085:  mov     edx, dword [ebp-0CH]                    ; 199D _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 19A0 _ 8B. 45, 08
        add     eax, edx                                ; 19A3 _ 01. D0
        movzx   eax, byte [eax]                         ; 19A5 _ 0F B6. 00
        movzx   eax, al                                 ; 19A8 _ 0F B6. C0
        mov     edx, dword [ebp-14H]                    ; 19AB _ 8B. 55, EC
        add     edx, 16                                 ; 19AE _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 19B1 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 19B5 _ 89. 14 24
        call    fifo8_put                               ; 19B8 _ E8, FFFFFFFC(rel)
        add     dword [ebp-0CH], 1                      ; 19BD _ 83. 45, F4, 01
?_086:  mov     edx, dword [ebp-0CH]                    ; 19C1 _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 19C4 _ 8B. 45, 08
        add     eax, edx                                ; 19C7 _ 01. D0
        movzx   eax, byte [eax]                         ; 19C9 _ 0F B6. 00
        test    al, al                                  ; 19CC _ 84. C0
        jnz     ?_085                                   ; 19CE _ 75, CD
        mov     eax, dword [ebp-14H]                    ; 19D0 _ 8B. 45, EC
        mov     edx, dword [ebp-14H]                    ; 19D3 _ 8B. 55, EC
        mov     dword [eax+28H], edx                    ; 19D6 _ 89. 50, 28
        mov     eax, dword [ebp-14H]                    ; 19D9 _ 8B. 45, EC
        add     eax, 16                                 ; 19DC _ 83. C0, 10
        mov     dword [esp+4H], 28                      ; 19DF _ C7. 44 24, 04, 0000001C
        mov     dword [esp], eax                        ; 19E7 _ 89. 04 24
        call    fifo8_put                               ; 19EA _ E8, FFFFFFFC(rel)
        leave                                           ; 19EF _ C9
        ret                                             ; 19F0 _ C3
; cmd_start End of function

cmd_ncst:; Function begin
        push    ebp                                     ; 19F1 _ 55
        mov     ebp, esp                                ; 19F2 _ 89. E5
        sub     esp, 40                                 ; 19F4 _ 83. EC, 28
        mov     eax, dword [console_count]              ; 19F7 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 19FC _ 89. 04 24
        call    launch_console                          ; 19FF _ E8, FFFFFFFC(rel)
        mov     eax, dword [console_count]              ; 1A04 _ A1, 00000000(d)
        add     eax, 1                                  ; 1A09 _ 83. C0, 01
        mov     dword [console_count], eax              ; 1A0C _ A3, 00000000(d)
        mov     eax, dword [current_console_task]       ; 1A11 _ A1, 00000278(d)
        mov     dword [ebp-10H], eax                    ; 1A16 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 1A19 _ 8B. 45, F0
        mov     dword [eax+28H], 0                      ; 1A1C _ C7. 40, 28, 00000000
        mov     dword [ebp-0CH], 5                      ; 1A23 _ C7. 45, F4, 00000005
        mov     dword [ebp-14H], 0                      ; 1A2A _ C7. 45, EC, 00000000
        jmp     ?_088                                   ; 1A31 _ EB, 24

?_087:  mov     edx, dword [ebp-0CH]                    ; 1A33 _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 1A36 _ 8B. 45, 08
        add     eax, edx                                ; 1A39 _ 01. D0
        movzx   eax, byte [eax]                         ; 1A3B _ 0F B6. 00
        movzx   eax, al                                 ; 1A3E _ 0F B6. C0
        mov     edx, dword [ebp-10H]                    ; 1A41 _ 8B. 55, F0
        add     edx, 16                                 ; 1A44 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 1A47 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 1A4B _ 89. 14 24
        call    fifo8_put                               ; 1A4E _ E8, FFFFFFFC(rel)
        add     dword [ebp-0CH], 1                      ; 1A53 _ 83. 45, F4, 01
?_088:  mov     edx, dword [ebp-0CH]                    ; 1A57 _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 1A5A _ 8B. 45, 08
        add     eax, edx                                ; 1A5D _ 01. D0
        movzx   eax, byte [eax]                         ; 1A5F _ 0F B6. 00
        test    al, al                                  ; 1A62 _ 84. C0
        jnz     ?_087                                   ; 1A64 _ 75, CD
        mov     eax, dword [ebp-10H]                    ; 1A66 _ 8B. 45, F0
        mov     edx, dword [ebp-10H]                    ; 1A69 _ 8B. 55, F0
        mov     dword [eax+28H], edx                    ; 1A6C _ 89. 50, 28
        mov     eax, dword [ebp-10H]                    ; 1A6F _ 8B. 45, F0
        add     eax, 16                                 ; 1A72 _ 83. C0, 10
        mov     dword [esp+4H], 28                      ; 1A75 _ C7. 44 24, 04, 0000001C
        mov     dword [esp], eax                        ; 1A7D _ 89. 04 24
        call    fifo8_put                               ; 1A80 _ E8, FFFFFFFC(rel)
        leave                                           ; 1A85 _ C9
        ret                                             ; 1A86 _ C3
; cmd_ncst End of function

console_task:; Function begin
        push    ebp                                     ; 1A87 _ 55
        mov     ebp, esp                                ; 1A88 _ 89. E5
        push    esi                                     ; 1A8A _ 56
        push    ebx                                     ; 1A8B _ 53
        sub     esp, 112                                ; 1A8C _ 83. EC, 70
        call    task_now                                ; 1A8F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1A94 _ 89. 45, F0
        mov     dword [ebp-0CH], 0                      ; 1A97 _ C7. 45, F4, 00000000
        mov     dword [ebp-14H], 0                      ; 1A9E _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 1AA5 _ C7. 45, E8, 00000000
        mov     eax, dword [memman]                     ; 1AAC _ A1, 00000000(d)
        mov     dword [esp+4H], 30                      ; 1AB1 _ C7. 44 24, 04, 0000001E
        mov     dword [esp], eax                        ; 1AB9 _ 89. 04 24
        call    memman_alloc                            ; 1ABC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 1AC1 _ 89. 45, E4
        mov     dword [ebp-20H], 96                     ; 1AC4 _ C7. 45, E0, 00000060
        mov     dword [ebp-24H], 176                    ; 1ACB _ C7. 45, DC, 000000B0
        mov     eax, dword [ebp-10H]                    ; 1AD2 _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 1AD5 _ 8B. 55, 08
        mov     dword [eax+94H], edx                    ; 1AD8 _ 89. 90, 00000094
        mov     eax, dword [ebp-10H]                    ; 1ADE _ 8B. 45, F0
        mov     dword [eax+98H], 16                     ; 1AE1 _ C7. 80, 00000098, 00000010
        mov     eax, dword [ebp-10H]                    ; 1AEB _ 8B. 45, F0
        mov     dword [eax+9CH], 28                     ; 1AEE _ C7. 80, 0000009C, 0000001C
        mov     eax, dword [ebp-10H]                    ; 1AF8 _ 8B. 45, F0
        mov     dword [eax+0A0H], -1                    ; 1AFB _ C7. 80, 000000A0, FFFFFFFF
        call    timer_alloc                             ; 1B05 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 1B0A _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 1B0D _ 8B. 45, F0
        add     eax, 16                                 ; 1B10 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 1B13 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 1B1B _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 1B1F _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1B22 _ 89. 04 24
        call    timer_init                              ; 1B25 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 1B2A _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 1B32 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1B35 _ 89. 04 24
        call    timer_settime                           ; 1B38 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1B3D _ 8B. 45, F0
        mov     edx, dword [ebp-28H]                    ; 1B40 _ 8B. 55, D8
        mov     dword [eax+0A8H], edx                   ; 1B43 _ 89. 90, 000000A8
        mov     eax, dword [ebp-10H]                    ; 1B49 _ 8B. 45, F0
        mov     edx, dword [ebp-1CH]                    ; 1B4C _ 8B. 55, E4
        mov     dword [eax+0ACH], edx                   ; 1B4F _ 89. 90, 000000AC
        mov     eax, dword [shtctl]                     ; 1B55 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_424                  ; 1B5A _ C7. 44 24, 14, 00000023(d)
        mov     dword [esp+10H], 7                      ; 1B62 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 1B6A _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1B72 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+8H]                     ; 1B7A _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1B7D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B81 _ 89. 04 24
        call    showString                              ; 1B84 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], 88064                  ; 1B89 _ C7. 45, D4, 00015800
        mov     dword [ebp-30H], 0                      ; 1B90 _ C7. 45, D0, 00000000
?_089:  call    io_cli                                  ; 1B97 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 1B9C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1BA1 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 1BA4 _ 8B. 45, F0
        add     eax, 16                                 ; 1BA7 _ 83. C0, 10
        mov     dword [esp], eax                        ; 1BAA _ 89. 04 24
        call    fifo8_status                            ; 1BAD _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1BB2 _ 85. C0
        jnz     ?_090                                   ; 1BB4 _ 75, 0A
        call    io_sti                                  ; 1BB6 _ E8, FFFFFFFC(rel)
        jmp     ?_108                                   ; 1BBB _ E9, 000004F9

?_090:  mov     eax, dword [ebp-10H]                    ; 1BC0 _ 8B. 45, F0
        add     eax, 16                                 ; 1BC3 _ 83. C0, 10
        mov     dword [esp], eax                        ; 1BC6 _ 89. 04 24
        call    fifo8_get                               ; 1BC9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 1BCE _ 89. 45, CC
        cmp     dword [ebp-34H], 1                      ; 1BD1 _ 83. 7D, CC, 01
        jg      ?_093                                   ; 1BD5 _ 7F, 6E
        cmp     dword [ebp-0CH], 0                      ; 1BD7 _ 83. 7D, F4, 00
        js      ?_093                                   ; 1BDB _ 78, 68
        cmp     dword [ebp-34H], 0                      ; 1BDD _ 83. 7D, CC, 00
        jz      ?_091                                   ; 1BE1 _ 74, 26
        mov     eax, dword [ebp-10H]                    ; 1BE3 _ 8B. 45, F0
        add     eax, 16                                 ; 1BE6 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 1BE9 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 1BF1 _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 1BF5 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1BF8 _ 89. 04 24
        call    timer_init                              ; 1BFB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 7                      ; 1C00 _ C7. 45, F4, 00000007
        jmp     ?_092                                   ; 1C07 _ EB, 24

?_091:  mov     eax, dword [ebp-10H]                    ; 1C09 _ 8B. 45, F0
        add     eax, 16                                 ; 1C0C _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 1C0F _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 1C17 _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 1C1B _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1C1E _ 89. 04 24
        call    timer_init                              ; 1C21 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 1C26 _ C7. 45, F4, 00000000
?_092:  mov     dword [esp+4H], 50                      ; 1C2D _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 1C35 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1C38 _ 89. 04 24
        call    timer_settime                           ; 1C3B _ E8, FFFFFFFC(rel)
        jmp     ?_107                                   ; 1C40 _ E9, 00000426

?_093:  cmp     dword [ebp-34H], 87                     ; 1C45 _ 83. 7D, CC, 57
        jnz     ?_094                                   ; 1C49 _ 75, 3C
        mov     dword [ebp-0CH], 7                      ; 1C4B _ C7. 45, F4, 00000007
        mov     eax, dword [ebp-10H]                    ; 1C52 _ 8B. 45, F0
        add     eax, 16                                 ; 1C55 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 1C58 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 1C60 _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 1C64 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1C67 _ 89. 04 24
        call    timer_init                              ; 1C6A _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 1C6F _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 1C77 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1C7A _ 89. 04 24
        call    timer_settime                           ; 1C7D _ E8, FFFFFFFC(rel)
        jmp     ?_107                                   ; 1C82 _ E9, 000003E4

?_094:  cmp     dword [ebp-34H], 88                     ; 1C87 _ 83. 7D, CC, 58
        jnz     ?_095                                   ; 1C8B _ 75, 6A
        mov     eax, dword [ebp-10H]                    ; 1C8D _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1C90 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1C96 _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1C99 _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1C9F _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1CA4 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1CAC _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1CB0 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1CB4 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1CB7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CBB _ 89. 04 24
        call    set_cursor                              ; 1CBE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], -1                     ; 1CC3 _ C7. 45, F4, FFFFFFFF
        mov     eax, dword [task_main]                  ; 1CCA _ A1, 00000274(d)
        mov     dword [esp+8H], 0                       ; 1CCF _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 1CD7 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 1CDF _ 89. 04 24
        call    task_run                                ; 1CE2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1CE7 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1CEA _ 89. 04 24
        call    task_sleep                              ; 1CED _ E8, FFFFFFFC(rel)
        jmp     ?_107                                   ; 1CF2 _ E9, 00000374

?_095:  cmp     dword [ebp-34H], 28                     ; 1CF7 _ 83. 7D, CC, 1C
        jne     ?_105                                   ; 1CFB _ 0F 85, 0000020D
        mov     eax, dword [ebp-10H]                    ; 1D01 _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1D04 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1D0A _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1D0D _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1D13 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1D18 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1D20 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1D24 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1D28 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1D2B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D2F _ 89. 04 24
        call    set_cursor                              ; 1D32 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1D37 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1D3A _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1D40 _ 8D. 50, 07
        test    eax, eax                                ; 1D43 _ 85. C0
        cmovs   eax, edx                                ; 1D45 _ 0F 48. C2
        sar     eax, 3                                  ; 1D48 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1D4B _ 8D. 50, FE
        mov     eax, dword [ebp-1CH]                    ; 1D4E _ 8B. 45, E4
        add     eax, edx                                ; 1D51 _ 01. D0
        mov     byte [eax], 0                           ; 1D53 _ C6. 00, 00
        mov     eax, dword [ebp-10H]                    ; 1D56 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1D59 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1D5F _ 8D. 50, 07
        test    eax, eax                                ; 1D62 _ 85. C0
        cmovs   eax, edx                                ; 1D64 _ 0F 48. C2
        sar     eax, 3                                  ; 1D67 _ C1. F8, 03
        sub     eax, 2                                  ; 1D6A _ 83. E8, 02
        mov     byte [ebp+eax-55H], 0                   ; 1D6D _ C6. 44 05, AB, 00
        mov     eax, dword [ebp-10H]                    ; 1D72 _ 8B. 45, F0
        mov     eax, dword [eax+9CH]                    ; 1D75 _ 8B. 80, 0000009C
        mov     edx, dword [ebp+8H]                     ; 1D7B _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1D7E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D82 _ 89. 04 24
        call    cons_newline                            ; 1D85 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-10H]                    ; 1D8A _ 8B. 55, F0
        mov     dword [edx+9CH], eax                    ; 1D8D _ 89. 82, 0000009C
        mov     dword [esp+4H], ?_425                   ; 1D93 _ C7. 44 24, 04, 00000025(d)
        mov     eax, dword [ebp-1CH]                    ; 1D9B _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1D9E _ 89. 04 24
        call    strcmp                                  ; 1DA1 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1DA6 _ 83. F8, 01
        jnz     ?_096                                   ; 1DA9 _ 75, 10
        mov     eax, dword [ebp+0CH]                    ; 1DAB _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 1DAE _ 89. 04 24
        call    cmd_mem                                 ; 1DB1 _ E8, FFFFFFFC(rel)
        jmp     ?_104                                   ; 1DB6 _ E9, 00000141

?_096:  mov     dword [esp+4H], ?_426                   ; 1DBB _ C7. 44 24, 04, 00000029(d)
        mov     eax, dword [ebp-1CH]                    ; 1DC3 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1DC6 _ 89. 04 24
        call    strcmp                                  ; 1DC9 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1DCE _ 83. F8, 01
        jnz     ?_097                                   ; 1DD1 _ 75, 0A
        call    cmd_cls                                 ; 1DD3 _ E8, FFFFFFFC(rel)
        jmp     ?_104                                   ; 1DD8 _ E9, 0000011F

?_097:  mov     dword [esp+4H], ?_427                   ; 1DDD _ C7. 44 24, 04, 0000002D(d)
        mov     eax, dword [ebp-1CH]                    ; 1DE5 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1DE8 _ 89. 04 24
        call    strcmp                                  ; 1DEB _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1DF0 _ 83. F8, 01
        jnz     ?_098                                   ; 1DF3 _ 75, 11
        mov     dword [esp], ?_428                      ; 1DF5 _ C7. 04 24, 00000031(d)
        call    cmd_execute_program                     ; 1DFC _ E8, FFFFFFFC(rel)
        jmp     ?_104                                   ; 1E01 _ E9, 000000F6

?_098:  mov     dword [esp+4H], ?_429                   ; 1E06 _ C7. 44 24, 04, 00000039(d)
        mov     eax, dword [ebp-1CH]                    ; 1E0E _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1E11 _ 89. 04 24
        call    strcmp                                  ; 1E14 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1E19 _ 83. F8, 01
        jnz     ?_099                                   ; 1E1C _ 75, 0A
        call    cmd_dir                                 ; 1E1E _ E8, FFFFFFFC(rel)
        jmp     ?_104                                   ; 1E23 _ E9, 000000D4

?_099:  mov     dword [esp+4H], ?_430                   ; 1E28 _ C7. 44 24, 04, 0000003D(d)
        mov     eax, dword [ebp-1CH]                    ; 1E30 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1E33 _ 89. 04 24
        call    strcmp                                  ; 1E36 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1E3B _ 83. F8, 01
        jnz     ?_100                                   ; 1E3E _ 75, 10
        mov     eax, dword [ebp-10H]                    ; 1E40 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1E43 _ 89. 04 24
        call    cmd_exit                                ; 1E46 _ E8, FFFFFFFC(rel)
        jmp     ?_104                                   ; 1E4B _ E9, 000000AC

?_100:  mov     eax, dword [ebp-1CH]                    ; 1E50 _ 8B. 45, E4
        movzx   eax, byte [eax]                         ; 1E53 _ 0F B6. 00
        cmp     al, 116                                 ; 1E56 _ 3C, 74
        jnz     ?_101                                   ; 1E58 _ 75, 34
        mov     eax, dword [ebp-1CH]                    ; 1E5A _ 8B. 45, E4
        add     eax, 1                                  ; 1E5D _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 1E60 _ 0F B6. 00
        cmp     al, 121                                 ; 1E63 _ 3C, 79
        jnz     ?_101                                   ; 1E65 _ 75, 27
        mov     eax, dword [ebp-1CH]                    ; 1E67 _ 8B. 45, E4
        add     eax, 2                                  ; 1E6A _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 1E6D _ 0F B6. 00
        cmp     al, 112                                 ; 1E70 _ 3C, 70
        jnz     ?_101                                   ; 1E72 _ 75, 1A
        mov     eax, dword [ebp-1CH]                    ; 1E74 _ 8B. 45, E4
        add     eax, 3                                  ; 1E77 _ 83. C0, 03
        movzx   eax, byte [eax]                         ; 1E7A _ 0F B6. 00
        cmp     al, 101                                 ; 1E7D _ 3C, 65
        jnz     ?_101                                   ; 1E7F _ 75, 0D
        mov     eax, dword [ebp-1CH]                    ; 1E81 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1E84 _ 89. 04 24
        call    cmd_type                                ; 1E87 _ E8, FFFFFFFC(rel)
        jmp     ?_104                                   ; 1E8C _ EB, 6E

?_101:  mov     dword [esp+4H], ?_431                   ; 1E8E _ C7. 44 24, 04, 00000042(d)
        mov     eax, dword [ebp-1CH]                    ; 1E96 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1E99 _ 89. 04 24
        call    strcmp                                  ; 1E9C _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1EA1 _ 83. F8, 01
        jnz     ?_102                                   ; 1EA4 _ 75, 0D
        lea     eax, [ebp-55H]                          ; 1EA6 _ 8D. 45, AB
        mov     dword [esp], eax                        ; 1EA9 _ 89. 04 24
        call    cmd_start                               ; 1EAC _ E8, FFFFFFFC(rel)
        jmp     ?_104                                   ; 1EB1 _ EB, 49

?_102:  mov     dword [esp+4H], ?_432                   ; 1EB3 _ C7. 44 24, 04, 00000048(d)
        mov     eax, dword [ebp-1CH]                    ; 1EBB _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1EBE _ 89. 04 24
        call    strcmp                                  ; 1EC1 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1EC6 _ 83. F8, 01
        jnz     ?_103                                   ; 1EC9 _ 75, 0D
        lea     eax, [ebp-55H]                          ; 1ECB _ 8D. 45, AB
        mov     dword [esp], eax                        ; 1ECE _ 89. 04 24
        call    cmd_ncst                                ; 1ED1 _ E8, FFFFFFFC(rel)
        jmp     ?_104                                   ; 1ED6 _ EB, 24

?_103:  mov     dword [esp+4H], ?_433                   ; 1ED8 _ C7. 44 24, 04, 0000004D(d)
        mov     eax, dword [ebp-1CH]                    ; 1EE0 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1EE3 _ 89. 04 24
        call    strcmp                                  ; 1EE6 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1EEB _ 83. F8, 01
        jnz     ?_104                                   ; 1EEE _ 75, 0C
        mov     dword [esp], ?_434                      ; 1EF0 _ C7. 04 24, 00000053(d)
        call    cmd_execute_program                     ; 1EF7 _ E8, FFFFFFFC(rel)
?_104:  mov     eax, dword [ebp-10H]                    ; 1EFC _ 8B. 45, F0
        mov     dword [eax+98H], 16                     ; 1EFF _ C7. 80, 00000098, 00000010
        jmp     ?_107                                   ; 1F09 _ E9, 0000015D

?_105:  cmp     dword [ebp-34H], 14                     ; 1F0E _ 83. 7D, CC, 0E
        jne     ?_106                                   ; 1F12 _ 0F 85, 00000098
        mov     eax, dword [ebp-10H]                    ; 1F18 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1F1B _ 8B. 80, 00000098
        cmp     eax, 8                                  ; 1F21 _ 83. F8, 08
        jle     ?_106                                   ; 1F24 _ 0F 8E, 00000086
        mov     eax, dword [ebp-10H]                    ; 1F2A _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1F2D _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1F33 _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1F36 _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1F3C _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1F41 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1F49 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1F4D _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1F51 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1F54 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1F58 _ 89. 04 24
        call    set_cursor                              ; 1F5B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1F60 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1F63 _ 8B. 80, 00000098
        lea     edx, [eax-8H]                           ; 1F69 _ 8D. 50, F8
        mov     eax, dword [ebp-10H]                    ; 1F6C _ 8B. 45, F0
        mov     dword [eax+98H], edx                    ; 1F6F _ 89. 90, 00000098
        mov     eax, dword [ebp-10H]                    ; 1F75 _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1F78 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1F7E _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1F81 _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1F87 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1F8C _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1F94 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1F98 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1F9C _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1F9F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1FA3 _ 89. 04 24
        call    set_cursor                              ; 1FA6 _ E8, FFFFFFFC(rel)
        jmp     ?_107                                   ; 1FAB _ E9, 000000BB

?_106:  mov     eax, dword [ebp-34H]                    ; 1FB0 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 1FB3 _ 89. 04 24
        call    transferScanCode                        ; 1FB6 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-35H], al                      ; 1FBB _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 1FBE _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1FC1 _ 8B. 80, 00000098
        cmp     eax, 239                                ; 1FC7 _ 3D, 000000EF
        jg      ?_107                                   ; 1FCC _ 0F 8F, 00000099
        cmp     byte [ebp-35H], 0                       ; 1FD2 _ 80. 7D, CB, 00
        je      ?_107                                   ; 1FD6 _ 0F 84, 0000008F
        mov     eax, dword [ebp-10H]                    ; 1FDC _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1FDF _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1FE5 _ 8D. 50, 07
        test    eax, eax                                ; 1FE8 _ 85. C0
        cmovs   eax, edx                                ; 1FEA _ 0F 48. C2
        sar     eax, 3                                  ; 1FED _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1FF0 _ 8D. 50, FE
        mov     eax, dword [ebp-1CH]                    ; 1FF3 _ 8B. 45, E4
        add     edx, eax                                ; 1FF6 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 1FF8 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 1FFC _ 88. 02
        mov     eax, dword [ebp-10H]                    ; 1FFE _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 2001 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 2007 _ 8D. 50, 07
        test    eax, eax                                ; 200A _ 85. C0
        cmovs   eax, edx                                ; 200C _ 0F 48. C2
        sar     eax, 3                                  ; 200F _ C1. F8, 03
        lea     edx, [eax-1H]                           ; 2012 _ 8D. 50, FF
        mov     eax, dword [ebp-1CH]                    ; 2015 _ 8B. 45, E4
        add     eax, edx                                ; 2018 _ 01. D0
        mov     byte [eax], 0                           ; 201A _ C6. 00, 00
        mov     eax, dword [ebp-10H]                    ; 201D _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 2020 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 2026 _ 8D. 50, 07
        test    eax, eax                                ; 2029 _ 85. C0
        cmovs   eax, edx                                ; 202B _ 0F 48. C2
        sar     eax, 3                                  ; 202E _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 2031 _ 8D. 50, FE
        mov     eax, dword [ebp-34H]                    ; 2034 _ 8B. 45, CC
        mov     byte [ebp+edx-55H], al                  ; 2037 _ 88. 44 15, AB
        mov     eax, dword [ebp-10H]                    ; 203B _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 203E _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 2044 _ 8D. 50, 07
        test    eax, eax                                ; 2047 _ 85. C0
        cmovs   eax, edx                                ; 2049 _ 0F 48. C2
        sar     eax, 3                                  ; 204C _ C1. F8, 03
        sub     eax, 1                                  ; 204F _ 83. E8, 01
        mov     byte [ebp+eax-55H], 0                   ; 2052 _ C6. 44 05, AB, 00
        movsx   eax, byte [ebp-35H]                     ; 2057 _ 0F BE. 45, CB
        mov     dword [esp+4H], 1                       ; 205B _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 2063 _ 89. 04 24
        call    cons_putchar                            ; 2066 _ E8, FFFFFFFC(rel)
?_107:  cmp     dword [ebp-0CH], 0                      ; 206B _ 83. 7D, F4, 00
        js      ?_108                                   ; 206F _ 78, 48
        mov     eax, dword [ebp-10H]                    ; 2071 _ 8B. 45, F0
        mov     eax, dword [eax+94H]                    ; 2074 _ 8B. 80, 00000094
        test    eax, eax                                ; 207A _ 85. C0
        jz      ?_108                                   ; 207C _ 74, 3B
        mov     eax, dword [ebp-10H]                    ; 207E _ 8B. 45, F0
        mov     ebx, dword [eax+9CH]                    ; 2081 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-10H]                    ; 2087 _ 8B. 45, F0
        mov     ecx, dword [eax+98H]                    ; 208A _ 8B. 88, 00000098
        mov     eax, dword [ebp-10H]                    ; 2090 _ 8B. 45, F0
        mov     edx, dword [eax+94H]                    ; 2093 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 2099 _ A1, 00000264(d)
        mov     esi, dword [ebp-0CH]                    ; 209E _ 8B. 75, F4
        mov     dword [esp+10H], esi                    ; 20A1 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 20A5 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 20A9 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 20AD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 20B1 _ 89. 04 24
        call    set_cursor                              ; 20B4 _ E8, FFFFFFFC(rel)
?_108:  call    io_sti                                  ; 20B9 _ E8, FFFFFFFC(rel)
        jmp     ?_089                                   ; 20BE _ E9, FFFFFAD4
; console_task End of function

cons_putstr:; Function begin
        push    ebp                                     ; 20C3 _ 55
        mov     ebp, esp                                ; 20C4 _ 89. E5
        sub     esp, 24                                 ; 20C6 _ 83. EC, 18
        jmp     ?_110                                   ; 20C9 _ EB, 1D

?_109:  mov     eax, dword [ebp+8H]                     ; 20CB _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 20CE _ 0F B6. 00
        movsx   eax, al                                 ; 20D1 _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 20D4 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 20DC _ 89. 04 24
        call    cons_putchar                            ; 20DF _ E8, FFFFFFFC(rel)
        add     dword [ebp+8H], 1                       ; 20E4 _ 83. 45, 08, 01
?_110:  mov     eax, dword [ebp+8H]                     ; 20E8 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 20EB _ 0F B6. 00
        test    al, al                                  ; 20EE _ 84. C0
        jnz     ?_109                                   ; 20F0 _ 75, D9
        nop                                             ; 20F2 _ 90
        leave                                           ; 20F3 _ C9
        ret                                             ; 20F4 _ C3
; cons_putstr End of function

api_linewin:; Function begin
        push    ebp                                     ; 20F5 _ 55
        mov     ebp, esp                                ; 20F6 _ 89. E5
        sub     esp, 32                                 ; 20F8 _ 83. EC, 20
        mov     eax, dword [ebp+0CH]                    ; 20FB _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 20FE _ 8B. 55, 14
        sub     edx, eax                                ; 2101 _ 29. C2
        mov     eax, edx                                ; 2103 _ 89. D0
        mov     dword [ebp-14H], eax                    ; 2105 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 2108 _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 210B _ 8B. 55, 18
        sub     edx, eax                                ; 210E _ 29. C2
        mov     eax, edx                                ; 2110 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 2112 _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 2115 _ 8B. 45, 0C
        shl     eax, 10                                 ; 2118 _ C1. E0, 0A
        mov     dword [ebp-8H], eax                     ; 211B _ 89. 45, F8
        mov     eax, dword [ebp+10H]                    ; 211E _ 8B. 45, 10
        shl     eax, 10                                 ; 2121 _ C1. E0, 0A
        mov     dword [ebp-0CH], eax                    ; 2124 _ 89. 45, F4
        cmp     dword [ebp-14H], 0                      ; 2127 _ 83. 7D, EC, 00
        jns     ?_111                                   ; 212B _ 79, 03
        neg     dword [ebp-14H]                         ; 212D _ F7. 5D, EC
?_111:  cmp     dword [ebp-18H], 0                      ; 2130 _ 83. 7D, E8, 00
        jns     ?_112                                   ; 2134 _ 79, 03
        neg     dword [ebp-18H]                         ; 2136 _ F7. 5D, E8
?_112:  mov     eax, dword [ebp-14H]                    ; 2139 _ 8B. 45, EC
        cmp     eax, dword [ebp-18H]                    ; 213C _ 3B. 45, E8
        jl      ?_116                                   ; 213F _ 7C, 5B
        mov     eax, dword [ebp-14H]                    ; 2141 _ 8B. 45, EC
        add     eax, 1                                  ; 2144 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 2147 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 214A _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 214D _ 3B. 45, 14
        jle     ?_113                                   ; 2150 _ 7E, 09
        mov     dword [ebp-14H], -1024                  ; 2152 _ C7. 45, EC, FFFFFC00
        jmp     ?_114                                   ; 2159 _ EB, 07

?_113:  mov     dword [ebp-14H], 1024                   ; 215B _ C7. 45, EC, 00000400
?_114:  mov     eax, dword [ebp+10H]                    ; 2162 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 2165 _ 3B. 45, 18
        jg      ?_115                                   ; 2168 _ 7F, 19
        mov     eax, dword [ebp+10H]                    ; 216A _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 216D _ 8B. 55, 18
        sub     edx, eax                                ; 2170 _ 29. C2
        mov     eax, edx                                ; 2172 _ 89. D0
        add     eax, 1                                  ; 2174 _ 83. C0, 01
        shl     eax, 10                                 ; 2177 _ C1. E0, 0A
        cdq                                             ; 217A _ 99
        idiv    dword [ebp-10H]                         ; 217B _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 217E _ 89. 45, E8
        jmp     ?_120                                   ; 2181 _ EB, 72

?_115:  mov     eax, dword [ebp+10H]                    ; 2183 _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 2186 _ 8B. 55, 18
        sub     edx, eax                                ; 2189 _ 29. C2
        mov     eax, edx                                ; 218B _ 89. D0
        sub     eax, 1                                  ; 218D _ 83. E8, 01
        shl     eax, 10                                 ; 2190 _ C1. E0, 0A
        cdq                                             ; 2193 _ 99
        idiv    dword [ebp-10H]                         ; 2194 _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 2197 _ 89. 45, E8
        jmp     ?_120                                   ; 219A _ EB, 59

?_116:  mov     eax, dword [ebp-18H]                    ; 219C _ 8B. 45, E8
        add     eax, 1                                  ; 219F _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 21A2 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 21A5 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 21A8 _ 3B. 45, 18
        jle     ?_117                                   ; 21AB _ 7E, 09
        mov     dword [ebp-18H], -1024                  ; 21AD _ C7. 45, E8, FFFFFC00
        jmp     ?_118                                   ; 21B4 _ EB, 07

?_117:  mov     dword [ebp-18H], 1024                   ; 21B6 _ C7. 45, E8, 00000400
?_118:  mov     eax, dword [ebp+0CH]                    ; 21BD _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 21C0 _ 3B. 45, 14
        jg      ?_119                                   ; 21C3 _ 7F, 19
        mov     eax, dword [ebp+0CH]                    ; 21C5 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 21C8 _ 8B. 55, 14
        sub     edx, eax                                ; 21CB _ 29. C2
        mov     eax, edx                                ; 21CD _ 89. D0
        add     eax, 1                                  ; 21CF _ 83. C0, 01
        shl     eax, 10                                 ; 21D2 _ C1. E0, 0A
        cdq                                             ; 21D5 _ 99
        idiv    dword [ebp-10H]                         ; 21D6 _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 21D9 _ 89. 45, EC
        jmp     ?_120                                   ; 21DC _ EB, 17

?_119:  mov     eax, dword [ebp+0CH]                    ; 21DE _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 21E1 _ 8B. 55, 14
        sub     edx, eax                                ; 21E4 _ 29. C2
        mov     eax, edx                                ; 21E6 _ 89. D0
        sub     eax, 1                                  ; 21E8 _ 83. E8, 01
        shl     eax, 10                                 ; 21EB _ C1. E0, 0A
        cdq                                             ; 21EE _ 99
        idiv    dword [ebp-10H]                         ; 21EF _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 21F2 _ 89. 45, EC
?_120:  mov     dword [ebp-4H], 0                       ; 21F5 _ C7. 45, FC, 00000000
        jmp     ?_122                                   ; 21FC _ EB, 35

?_121:  mov     eax, dword [ebp+8H]                     ; 21FE _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2201 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 2203 _ 8B. 45, F4
        sar     eax, 10                                 ; 2206 _ C1. F8, 0A
        mov     ecx, eax                                ; 2209 _ 89. C1
        mov     eax, dword [ebp+8H]                     ; 220B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 220E _ 8B. 40, 04
        imul    eax, ecx                                ; 2211 _ 0F AF. C1
        mov     ecx, dword [ebp-8H]                     ; 2214 _ 8B. 4D, F8
        sar     ecx, 10                                 ; 2217 _ C1. F9, 0A
        add     eax, ecx                                ; 221A _ 01. C8
        add     edx, eax                                ; 221C _ 01. C2
        mov     eax, dword [ebp+1CH]                    ; 221E _ 8B. 45, 1C
        mov     byte [edx], al                          ; 2221 _ 88. 02
        mov     eax, dword [ebp-14H]                    ; 2223 _ 8B. 45, EC
        add     dword [ebp-8H], eax                     ; 2226 _ 01. 45, F8
        mov     eax, dword [ebp-18H]                    ; 2229 _ 8B. 45, E8
        add     dword [ebp-0CH], eax                    ; 222C _ 01. 45, F4
        add     dword [ebp-4H], 1                       ; 222F _ 83. 45, FC, 01
?_122:  mov     eax, dword [ebp-4H]                     ; 2233 _ 8B. 45, FC
        cmp     eax, dword [ebp-10H]                    ; 2236 _ 3B. 45, F0
        jl      ?_121                                   ; 2239 _ 7C, C3
        leave                                           ; 223B _ C9
        ret                                             ; 223C _ C3
; api_linewin End of function

handle_keyboard:; Function begin
        push    ebp                                     ; 223D _ 55
        mov     ebp, esp                                ; 223E _ 89. E5
        sub     esp, 56                                 ; 2240 _ 83. EC, 38
?_123:  call    io_cli                                  ; 2243 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2248 _ 8B. 45, 08
        add     eax, 16                                 ; 224B _ 83. C0, 10
        mov     dword [esp], eax                        ; 224E _ 89. 04 24
        call    fifo8_status                            ; 2251 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 2256 _ 85. C0
        jnz     ?_125                                   ; 2258 _ 75, 2B
        call    io_sti                                  ; 225A _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+0CH], 0                      ; 225F _ 83. 7D, 0C, 00
        jz      ?_124                                   ; 2263 _ 74, 05
        jmp     ?_129                                   ; 2265 _ E9, 000000DC

?_124:  call    io_sti                                  ; 226A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 226F _ 8B. 45, 10
        add     eax, 28                                 ; 2272 _ 83. C0, 1C
        mov     dword [eax], -1                         ; 2275 _ C7. 00, FFFFFFFF
        mov     eax, 0                                  ; 227B _ B8, 00000000
        jmp     ?_130                                   ; 2280 _ E9, 000000C6

?_125:  mov     eax, dword [ebp+8H]                     ; 2285 _ 8B. 45, 08
        add     eax, 16                                 ; 2288 _ 83. C0, 10
        mov     dword [esp], eax                        ; 228B _ 89. 04 24
        call    fifo8_get                               ; 228E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2293 _ 89. 45, F4
        call    io_sti                                  ; 2296 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 255                    ; 229B _ 81. 7D, F4, 000000FF
        jle     ?_126                                   ; 22A2 _ 7E, 37
        mov     edx, dword [sht_back]                   ; 22A4 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 22AA _ A1, 00000264(d)
        mov     dword [esp+14H], ?_435                  ; 22AF _ C7. 44 24, 14, 0000005D(d)
        mov     dword [esp+10H], 7                      ; 22B7 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 176                    ; 22BF _ C7. 44 24, 0C, 000000B0
        mov     dword [esp+8H], 0                       ; 22C7 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 22CF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 22D3 _ 89. 04 24
        call    showString                              ; 22D6 _ E8, FFFFFFFC(rel)
?_126:  cmp     dword [ebp-0CH], 1                      ; 22DB _ 83. 7D, F4, 01
        jg      ?_127                                   ; 22DF _ 7F, 3E
        mov     eax, dword [ebp+8H]                     ; 22E1 _ 8B. 45, 08
        lea     edx, [eax+10H]                          ; 22E4 _ 8D. 50, 10
        mov     eax, dword [ebp+8H]                     ; 22E7 _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 22EA _ 8B. 80, 000000A8
        mov     dword [esp+8H], 1                       ; 22F0 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], edx                     ; 22F8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 22FC _ 89. 04 24
        call    timer_init                              ; 22FF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2304 _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 2307 _ 8B. 80, 000000A8
        mov     dword [esp+4H], 50                      ; 230D _ C7. 44 24, 04, 00000032
        mov     dword [esp], eax                        ; 2315 _ 89. 04 24
        call    timer_settime                           ; 2318 _ E8, FFFFFFFC(rel)
        jmp     ?_129                                   ; 231D _ EB, 27

?_127:  cmp     dword [ebp-0CH], 2                      ; 231F _ 83. 7D, F4, 02
        jnz     ?_128                                   ; 2323 _ 75, 0F
        mov     eax, dword [ebp+8H]                     ; 2325 _ 8B. 45, 08
        mov     dword [eax+0A0H], 7                     ; 2328 _ C7. 80, 000000A0, 00000007
        jmp     ?_129                                   ; 2332 _ EB, 12

?_128:  mov     eax, dword [ebp+10H]                    ; 2334 _ 8B. 45, 10
        lea     edx, [eax+1CH]                          ; 2337 _ 8D. 50, 1C
        mov     eax, dword [ebp-0CH]                    ; 233A _ 8B. 45, F4
        mov     dword [edx], eax                        ; 233D _ 89. 02
        mov     eax, 0                                  ; 233F _ B8, 00000000
        jmp     ?_130                                   ; 2344 _ EB, 05

?_129:  jmp     ?_123                                   ; 2346 _ E9, FFFFFEF8

?_130:  leave                                           ; 234B _ C9
        ret                                             ; 234C _ C3
; handle_keyboard End of function

close_constask:; Function begin
        push    ebp                                     ; 234D _ 55
        mov     ebp, esp                                ; 234E _ 89. E5
        sub     esp, 24                                 ; 2350 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 2353 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2356 _ 89. 04 24
        call    task_sleep                              ; 2359 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 235E _ 8B. 45, 08
        mov     eax, dword [eax+0B8H]                   ; 2361 _ 8B. 80, 000000B8
        mov     edx, eax                                ; 2367 _ 89. C2
        mov     eax, dword [memman]                     ; 2369 _ A1, 00000000(d)
        mov     dword [esp+8H], 65536                   ; 236E _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], edx                     ; 2376 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 237A _ 89. 04 24
        call    memman_free_4k                          ; 237D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2382 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2385 _ 8B. 40, 10
        mov     edx, eax                                ; 2388 _ 89. C2
        mov     eax, dword [memman]                     ; 238A _ A1, 00000000(d)
        mov     dword [esp+8H], 128                     ; 238F _ C7. 44 24, 08, 00000080
        mov     dword [esp+4H], edx                     ; 2397 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 239B _ 89. 04 24
        call    memman_free                             ; 239E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 23A3 _ 8B. 45, 08
        mov     eax, dword [eax+0ACH]                   ; 23A6 _ 8B. 80, 000000AC
        mov     edx, eax                                ; 23AC _ 89. C2
        mov     eax, dword [memman]                     ; 23AE _ A1, 00000000(d)
        mov     dword [esp+8H], 30                      ; 23B3 _ C7. 44 24, 08, 0000001E
        mov     dword [esp+4H], edx                     ; 23BB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 23BF _ 89. 04 24
        call    memman_free                             ; 23C2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 23C7 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 23CA _ C7. 40, 04, 00000000
        mov     dword [current_console_task], 0         ; 23D1 _ C7. 05, 00000278(d), 00000000
        leave                                           ; 23DB _ C9
        ret                                             ; 23DC _ C3
; close_constask End of function

close_console:; Function begin
        push    ebp                                     ; 23DD _ 55
        mov     ebp, esp                                ; 23DE _ 89. E5
        sub     esp, 40                                 ; 23E0 _ 83. EC, 28
        mov     eax, dword [ebp+8H]                     ; 23E3 _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 23E6 _ 8B. 80, 000000A8
        mov     dword [esp], eax                        ; 23EC _ 89. 04 24
        call    timer_free                              ; 23EF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 23F4 _ 8B. 45, 08
        mov     eax, dword [eax+0B4H]                   ; 23F7 _ 8B. 80, 000000B4
        test    eax, eax                                ; 23FD _ 85. C0
        jz      ?_131                                   ; 23FF _ 74, 40
        mov     eax, dword [ebp+8H]                     ; 2401 _ 8B. 45, 08
        mov     eax, dword [eax+0B4H]                   ; 2404 _ 8B. 80, 000000B4
        mov     dword [ebp-0CH], eax                    ; 240A _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 240D _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 2410 _ 8B. 00
        mov     edx, eax                                ; 2412 _ 89. C2
        mov     eax, dword [memman]                     ; 2414 _ A1, 00000000(d)
        mov     dword [esp+8H], 42240                   ; 2419 _ C7. 44 24, 08, 0000A500
        mov     dword [esp+4H], edx                     ; 2421 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2425 _ 89. 04 24
        call    memman_free_4k                          ; 2428 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 242D _ A1, 00000264(d)
        mov     edx, dword [ebp-0CH]                    ; 2432 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2435 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2439 _ 89. 04 24
        call    sheet_free                              ; 243C _ E8, FFFFFFFC(rel)
?_131:  mov     eax, dword [ebp+8H]                     ; 2441 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2444 _ 89. 04 24
        call    close_constask                          ; 2447 _ E8, FFFFFFFC(rel)
        leave                                           ; 244C _ C9
        ret                                             ; 244D _ C3
; close_console End of function

cmd_exit:; Function begin
        push    ebp                                     ; 244E _ 55
        mov     ebp, esp                                ; 244F _ 89. E5
        sub     esp, 24                                 ; 2451 _ 83. EC, 18
        call    io_cli                                  ; 2454 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 255                     ; 2459 _ C7. 44 24, 04, 000000FF
        mov     dword [esp], keyinfo                    ; 2461 _ C7. 04 24, 0000001C(d)
        call    fifo8_put                               ; 2468 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 246D _ E8, FFFFFFFC(rel)
        leave                                           ; 2472 _ C9
        ret                                             ; 2473 _ C3
; cmd_exit End of function

kernel_api:; Function begin
        push    ebp                                     ; 2474 _ 55
        mov     ebp, esp                                ; 2475 _ 89. E5
        push    esi                                     ; 2477 _ 56
        push    ebx                                     ; 2478 _ 53
        sub     esp, 80                                 ; 2479 _ 83. EC, 50
        call    task_now                                ; 247C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2481 _ 89. 45, F0
        mov     dword [ebp-14H], 0                      ; 2484 _ C7. 45, EC, 00000000
        lea     eax, [ebp+24H]                          ; 248B _ 8D. 45, 24
        add     eax, 4                                  ; 248E _ 83. C0, 04
        mov     dword [ebp-18H], eax                    ; 2491 _ 89. 45, E8
        mov     dword [ebp-0CH], 0                      ; 2494 _ C7. 45, F4, 00000000
        mov     dword [ebp-1CH], 0                      ; 249B _ C7. 45, E4, 00000000
        cmp     dword [ebp+1CH], 1                      ; 24A2 _ 83. 7D, 1C, 01
        jnz     ?_132                                   ; 24A6 _ 75, 1B
        mov     eax, dword [ebp+24H]                    ; 24A8 _ 8B. 45, 24
        movsx   eax, al                                 ; 24AB _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 24AE _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 24B6 _ 89. 04 24
        call    cons_putchar                            ; 24B9 _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 24BE _ E9, 00000658

?_132:  cmp     dword [ebp+1CH], 2                      ; 24C3 _ 83. 7D, 1C, 02
        jnz     ?_133                                   ; 24C7 _ 75, 1D
        mov     eax, dword [ebp-10H]                    ; 24C9 _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 24CC _ 8B. 80, 000000B0
        mov     edx, dword [eax]                        ; 24D2 _ 8B. 10
        mov     eax, dword [ebp+18H]                    ; 24D4 _ 8B. 45, 18
        add     eax, edx                                ; 24D7 _ 01. D0
        mov     dword [esp], eax                        ; 24D9 _ 89. 04 24
        call    cons_putstr                             ; 24DC _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 24E1 _ E9, 00000635

?_133:  cmp     dword [ebp+1CH], 4                      ; 24E6 _ 83. 7D, 1C, 04
        jnz     ?_134                                   ; 24EA _ 75, 15
        mov     eax, dword [ebp-10H]                    ; 24EC _ 8B. 45, F0
        mov     dword [eax+34H], 0                      ; 24EF _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-10H]                    ; 24F6 _ 8B. 45, F0
        add     eax, 48                                 ; 24F9 _ 83. C0, 30
        jmp     ?_167                                   ; 24FC _ E9, 0000061F

?_134:  cmp     dword [ebp+1CH], 5                      ; 2501 _ 83. 7D, 1C, 05
        jne     ?_135                                   ; 2505 _ 0F 85, 00000107
        mov     eax, dword [shtctl]                     ; 250B _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 2510 _ 89. 04 24
        call    sheet_alloc                             ; 2513 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 2518 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 251B _ 8B. 45, EC
        mov     edx, dword [ebp-10H]                    ; 251E _ 8B. 55, F0
        mov     dword [eax+20H], edx                    ; 2521 _ 89. 50, 20
        mov     eax, dword [ebp-14H]                    ; 2524 _ 8B. 45, EC
        mov     eax, dword [eax+1CH]                    ; 2527 _ 8B. 40, 1C
        or      eax, 10H                                ; 252A _ 83. C8, 10
        mov     edx, eax                                ; 252D _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 252F _ 8B. 45, EC
        mov     dword [eax+1CH], edx                    ; 2532 _ 89. 50, 1C
        mov     eax, dword [ebp+24H]                    ; 2535 _ 8B. 45, 24
        mov     edx, dword [ebp-10H]                    ; 2538 _ 8B. 55, F0
        mov     edx, dword [edx+0B0H]                   ; 253B _ 8B. 92, 000000B0
        mov     ecx, dword [edx+4H]                     ; 2541 _ 8B. 4A, 04
        mov     edx, dword [ebp+18H]                    ; 2544 _ 8B. 55, 18
        add     edx, ecx                                ; 2547 _ 01. CA
        mov     dword [esp+10H], eax                    ; 2549 _ 89. 44 24, 10
        mov     eax, dword [ebp+8H]                     ; 254D _ 8B. 45, 08
        mov     dword [esp+0CH], eax                    ; 2550 _ 89. 44 24, 0C
        mov     eax, dword [ebp+0CH]                    ; 2554 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 2557 _ 89. 44 24, 08
        mov     dword [esp+4H], edx                     ; 255B _ 89. 54 24, 04
        mov     eax, dword [ebp-14H]                    ; 255F _ 8B. 45, EC
        mov     dword [esp], eax                        ; 2562 _ 89. 04 24
        call    sheet_setbuf                            ; 2565 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 256A _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 256D _ 8B. 80, 000000B0
        mov     edx, dword [eax]                        ; 2573 _ 8B. 10
        mov     eax, dword [ebp+20H]                    ; 2575 _ 8B. 45, 20
        add     edx, eax                                ; 2578 _ 01. C2
        mov     eax, dword [shtctl]                     ; 257A _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 257F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], edx                     ; 2587 _ 89. 54 24, 08
        mov     edx, dword [ebp-14H]                    ; 258B _ 8B. 55, EC
        mov     dword [esp+4H], edx                     ; 258E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2592 _ 89. 04 24
        call    make_window8                            ; 2595 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 259A _ A1, 00000264(d)
        mov     eax, dword [eax+0CH]                    ; 259F _ 8B. 40, 0C
        sub     eax, dword [ebp+8H]                     ; 25A2 _ 2B. 45, 08
        mov     edx, eax                                ; 25A5 _ 89. C2
        shr     edx, 31                                 ; 25A7 _ C1. EA, 1F
        add     eax, edx                                ; 25AA _ 01. D0
        sar     eax, 1                                  ; 25AC _ D1. F8
        mov     ecx, eax                                ; 25AE _ 89. C1
        mov     eax, dword [shtctl]                     ; 25B0 _ A1, 00000264(d)
        mov     eax, dword [eax+8H]                     ; 25B5 _ 8B. 40, 08
        sub     eax, dword [ebp+0CH]                    ; 25B8 _ 2B. 45, 0C
        mov     edx, eax                                ; 25BB _ 89. C2
        shr     edx, 31                                 ; 25BD _ C1. EA, 1F
        add     eax, edx                                ; 25C0 _ 01. D0
        sar     eax, 1                                  ; 25C2 _ D1. F8
        mov     edx, eax                                ; 25C4 _ 89. C2
        mov     eax, dword [shtctl]                     ; 25C6 _ A1, 00000264(d)
        mov     dword [esp+0CH], ecx                    ; 25CB _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 25CF _ 89. 54 24, 08
        mov     edx, dword [ebp-14H]                    ; 25D3 _ 8B. 55, EC
        mov     dword [esp+4H], edx                     ; 25D6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25DA _ 89. 04 24
        call    sheet_slide                             ; 25DD _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 25E2 _ A1, 00000264(d)
        mov     edx, dword [eax+10H]                    ; 25E7 _ 8B. 50, 10
        mov     eax, dword [shtctl]                     ; 25EA _ A1, 00000264(d)
        mov     dword [esp+8H], edx                     ; 25EF _ 89. 54 24, 08
        mov     edx, dword [ebp-14H]                    ; 25F3 _ 8B. 55, EC
        mov     dword [esp+4H], edx                     ; 25F6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25FA _ 89. 04 24
        call    sheet_updown                            ; 25FD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 2602 _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 2605 _ 8D. 50, 1C
        mov     eax, dword [ebp-14H]                    ; 2608 _ 8B. 45, EC
        mov     dword [edx], eax                        ; 260B _ 89. 02
        jmp     ?_166                                   ; 260D _ E9, 00000509

?_135:  cmp     dword [ebp+1CH], 6                      ; 2612 _ 83. 7D, 1C, 06
        jne     ?_136                                   ; 2616 _ 0F 85, 0000008C
        mov     eax, dword [ebp+18H]                    ; 261C _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 261F _ 89. 45, EC
        mov     eax, dword [ebp-10H]                    ; 2622 _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 2625 _ 8B. 80, 000000B0
        mov     edx, dword [eax+4H]                     ; 262B _ 8B. 50, 04
        mov     eax, dword [ebp+10H]                    ; 262E _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2631 _ 8D. 0C 02
        mov     eax, dword [ebp+24H]                    ; 2634 _ 8B. 45, 24
        movsx   edx, al                                 ; 2637 _ 0F BE. D0
        mov     eax, dword [shtctl]                     ; 263A _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 263F _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2643 _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 2647 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 264A _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 264E _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 2651 _ 89. 54 24, 08
        mov     edx, dword [ebp-14H]                    ; 2655 _ 8B. 55, EC
        mov     dword [esp+4H], edx                     ; 2658 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 265C _ 89. 04 24
        call    showString                              ; 265F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2664 _ 8B. 45, 08
        lea     ecx, [eax+10H]                          ; 2667 _ 8D. 48, 10
        mov     eax, dword [ebp+20H]                    ; 266A _ 8B. 45, 20
        lea     edx, [eax*8]                            ; 266D _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2674 _ 8B. 45, 0C
        add     edx, eax                                ; 2677 _ 01. C2
        mov     eax, dword [shtctl]                     ; 2679 _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 267E _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2682 _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 2686 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 2689 _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 268D _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 2690 _ 89. 54 24, 08
        mov     edx, dword [ebp-14H]                    ; 2694 _ 8B. 55, EC
        mov     dword [esp+4H], edx                     ; 2697 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 269B _ 89. 04 24
        call    sheet_refresh                           ; 269E _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 26A3 _ E9, 00000473

?_136:  cmp     dword [ebp+1CH], 7                      ; 26A8 _ 83. 7D, 1C, 07
        jnz     ?_137                                   ; 26AC _ 75, 7E
        mov     eax, dword [ebp+18H]                    ; 26AE _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 26B1 _ 89. 45, EC
        mov     ebx, dword [ebp+24H]                    ; 26B4 _ 8B. 5D, 24
        mov     eax, dword [ebp+10H]                    ; 26B7 _ 8B. 45, 10
        movzx   ecx, al                                 ; 26BA _ 0F B6. C8
        mov     eax, dword [ebp-14H]                    ; 26BD _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 26C0 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 26C3 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 26C6 _ 8B. 00
        mov     esi, dword [ebp+8H]                     ; 26C8 _ 8B. 75, 08
        mov     dword [esp+18H], esi                    ; 26CB _ 89. 74 24, 18
        mov     esi, dword [ebp+0CH]                    ; 26CF _ 8B. 75, 0C
        mov     dword [esp+14H], esi                    ; 26D2 _ 89. 74 24, 14
        mov     esi, dword [ebp+20H]                    ; 26D6 _ 8B. 75, 20
        mov     dword [esp+10H], esi                    ; 26D9 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 26DD _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 26E1 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 26E5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 26E9 _ 89. 04 24
        call    boxfill8                                ; 26EC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 26F1 _ 8B. 45, 08
        lea     ebx, [eax+1H]                           ; 26F4 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 26F7 _ 8B. 45, 0C
        lea     ecx, [eax+1H]                           ; 26FA _ 8D. 48, 01
        mov     edx, dword [ebp+24H]                    ; 26FD _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 2700 _ A1, 00000264(d)
        mov     dword [esp+14H], ebx                    ; 2705 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 2709 _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 270D _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 2710 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2714 _ 89. 54 24, 08
        mov     edx, dword [ebp-14H]                    ; 2718 _ 8B. 55, EC
        mov     dword [esp+4H], edx                     ; 271B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 271F _ 89. 04 24
        call    sheet_refresh                           ; 2722 _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 2727 _ E9, 000003EF

?_137:  cmp     dword [ebp+1CH], 11                     ; 272C _ 83. 7D, 1C, 0B
        jnz     ?_138                                   ; 2730 _ 75, 28
        mov     eax, dword [ebp+18H]                    ; 2732 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 2735 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 2738 _ 8B. 45, EC
        mov     edx, dword [eax]                        ; 273B _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 273D _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 2740 _ 8B. 40, 04
        imul    eax, dword [ebp+8H]                     ; 2743 _ 0F AF. 45, 08
        mov     ecx, eax                                ; 2747 _ 89. C1
        mov     eax, dword [ebp+0CH]                    ; 2749 _ 8B. 45, 0C
        add     eax, ecx                                ; 274C _ 01. C8
        add     edx, eax                                ; 274E _ 01. C2
        mov     eax, dword [ebp+24H]                    ; 2750 _ 8B. 45, 24
        mov     byte [edx], al                          ; 2753 _ 88. 02
        jmp     ?_166                                   ; 2755 _ E9, 000003C1

?_138:  cmp     dword [ebp+1CH], 12                     ; 275A _ 83. 7D, 1C, 0C
        jnz     ?_139                                   ; 275E _ 75, 3B
        mov     eax, dword [ebp+18H]                    ; 2760 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 2763 _ 89. 45, EC
        mov     edx, dword [ebp+24H]                    ; 2766 _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 2769 _ A1, 00000264(d)
        mov     ecx, dword [ebp+8H]                     ; 276E _ 8B. 4D, 08
        mov     dword [esp+14H], ecx                    ; 2771 _ 89. 4C 24, 14
        mov     ecx, dword [ebp+0CH]                    ; 2775 _ 8B. 4D, 0C
        mov     dword [esp+10H], ecx                    ; 2778 _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 277C _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 277F _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2783 _ 89. 54 24, 08
        mov     edx, dword [ebp-14H]                    ; 2787 _ 8B. 55, EC
        mov     dword [esp+4H], edx                     ; 278A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 278E _ 89. 04 24
        call    sheet_refresh                           ; 2791 _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 2796 _ E9, 00000380

?_139:  cmp     dword [ebp+1CH], 13                     ; 279B _ 83. 7D, 1C, 0D
        jnz     ?_140                                   ; 279F _ 75, 39
        mov     eax, dword [ebp+18H]                    ; 27A1 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 27A4 _ 89. 45, EC
        mov     eax, dword [ebp+24H]                    ; 27A7 _ 8B. 45, 24
        mov     edx, dword [ebp+10H]                    ; 27AA _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 27AD _ 89. 54 24, 14
        mov     edx, dword [ebp+8H]                     ; 27B1 _ 8B. 55, 08
        mov     dword [esp+10H], edx                    ; 27B4 _ 89. 54 24, 10
        mov     edx, dword [ebp+0CH]                    ; 27B8 _ 8B. 55, 0C
        mov     dword [esp+0CH], edx                    ; 27BB _ 89. 54 24, 0C
        mov     edx, dword [ebp+20H]                    ; 27BF _ 8B. 55, 20
        mov     dword [esp+8H], edx                     ; 27C2 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 27C6 _ 89. 44 24, 04
        mov     eax, dword [ebp-14H]                    ; 27CA _ 8B. 45, EC
        mov     dword [esp], eax                        ; 27CD _ 89. 04 24
        call    api_linewin                             ; 27D0 _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 27D5 _ E9, 00000341

?_140:  cmp     dword [ebp+1CH], 14                     ; 27DA _ 83. 7D, 1C, 0E
        jnz     ?_141                                   ; 27DE _ 75, 32
        mov     edx, dword [ebp+18H]                    ; 27E0 _ 8B. 55, 18
        mov     eax, dword [shtctl]                     ; 27E3 _ A1, 00000264(d)
        mov     dword [esp+4H], edx                     ; 27E8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 27EC _ 89. 04 24
        call    sheet_free                              ; 27EF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 27F4 _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 27F7 _ 8B. 80, 000000B0
        mov     eax, dword [eax+4H]                     ; 27FD _ 8B. 40, 04
        add     eax, 291                                ; 2800 _ 05, 00000123
        mov     dword [esp], eax                        ; 2805 _ 89. 04 24
        call    cons_putstr                             ; 2808 _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 280D _ E9, 00000309

?_141:  cmp     dword [ebp+1CH], 15                     ; 2812 _ 83. 7D, 1C, 0F
        jnz     ?_142                                   ; 2816 _ 75, 1E
        mov     eax, dword [ebp+24H]                    ; 2818 _ 8B. 45, 24
        mov     edx, dword [ebp-18H]                    ; 281B _ 8B. 55, E8
        mov     dword [esp+8H], edx                     ; 281E _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2822 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 2826 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 2829 _ 89. 04 24
        call    handle_keyboard                         ; 282C _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 2831 _ E9, 000002E5

?_142:  cmp     dword [ebp+1CH], 16                     ; 2836 _ 83. 7D, 1C, 10
        jnz     ?_143                                   ; 283A _ 75, 12
        mov     eax, dword [ebp-18H]                    ; 283C _ 8B. 45, E8
        lea     ebx, [eax+1CH]                          ; 283F _ 8D. 58, 1C
        call    timer_alloc                             ; 2842 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 2847 _ 89. 03
        jmp     ?_166                                   ; 2849 _ E9, 000002CD

?_143:  cmp     dword [ebp+1CH], 17                     ; 284E _ 83. 7D, 1C, 11
        jnz     ?_144                                   ; 2852 _ 75, 24
        mov     eax, dword [ebp+24H]                    ; 2854 _ 8B. 45, 24
        movzx   edx, al                                 ; 2857 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 285A _ 8B. 45, F0
        lea     ecx, [eax+10H]                          ; 285D _ 8D. 48, 10
        mov     eax, dword [ebp+18H]                    ; 2860 _ 8B. 45, 18
        mov     dword [esp+8H], edx                     ; 2863 _ 89. 54 24, 08
        mov     dword [esp+4H], ecx                     ; 2867 _ 89. 4C 24, 04
        mov     dword [esp], eax                        ; 286B _ 89. 04 24
        call    timer_init                              ; 286E _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 2873 _ E9, 000002A3

?_144:  cmp     dword [ebp+1CH], 18                     ; 2878 _ 83. 7D, 1C, 12
        jnz     ?_145                                   ; 287C _ 75, 19
        mov     eax, dword [ebp+24H]                    ; 287E _ 8B. 45, 24
        mov     edx, eax                                ; 2881 _ 89. C2
        mov     eax, dword [ebp+18H]                    ; 2883 _ 8B. 45, 18
        mov     dword [esp+4H], edx                     ; 2886 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 288A _ 89. 04 24
        call    timer_settime                           ; 288D _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 2892 _ E9, 00000284

?_145:  cmp     dword [ebp+1CH], 19                     ; 2897 _ 83. 7D, 1C, 13
        jnz     ?_146                                   ; 289B _ 75, 10
        mov     eax, dword [ebp+18H]                    ; 289D _ 8B. 45, 18
        mov     dword [esp], eax                        ; 28A0 _ 89. 04 24
        call    timer_free                              ; 28A3 _ E8, FFFFFFFC(rel)
        jmp     ?_166                                   ; 28A8 _ E9, 0000026E

?_146:  cmp     dword [ebp+1CH], 21                     ; 28AD _ 83. 7D, 1C, 15
        jne     ?_152                                   ; 28B1 _ 0F 85, 000000C5
        mov     dword [ebp-0CH], 0                      ; 28B7 _ C7. 45, F4, 00000000
        jmp     ?_149                                   ; 28BE _ EB, 23

?_147:  mov     eax, dword [ebp-10H]                    ; 28C0 _ 8B. 45, F0
        mov     ecx, dword [eax+0CCH]                   ; 28C3 _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 28C9 _ 8B. 55, F4
        mov     eax, edx                                ; 28CC _ 89. D0
        add     eax, eax                                ; 28CE _ 01. C0
        add     eax, edx                                ; 28D0 _ 01. D0
        shl     eax, 2                                  ; 28D2 _ C1. E0, 02
        add     eax, ecx                                ; 28D5 _ 01. C8
        mov     eax, dword [eax]                        ; 28D7 _ 8B. 00
        test    eax, eax                                ; 28D9 _ 85. C0
        jnz     ?_148                                   ; 28DB _ 75, 02
        jmp     ?_150                                   ; 28DD _ EB, 0A

?_148:  add     dword [ebp-0CH], 1                      ; 28DF _ 83. 45, F4, 01
?_149:  cmp     dword [ebp-0CH], 7                      ; 28E3 _ 83. 7D, F4, 07
        jle     ?_147                                   ; 28E7 _ 7E, D7
?_150:  mov     eax, dword [ebp-10H]                    ; 28E9 _ 8B. 45, F0
        mov     ecx, dword [eax+0CCH]                   ; 28EC _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 28F2 _ 8B. 55, F4
        mov     eax, edx                                ; 28F5 _ 89. D0
        add     eax, eax                                ; 28F7 _ 01. C0
        add     eax, edx                                ; 28F9 _ 01. D0
        shl     eax, 2                                  ; 28FB _ C1. E0, 02
        add     eax, ecx                                ; 28FE _ 01. C8
        mov     dword [ebp-1CH], eax                    ; 2900 _ 89. 45, E4
        mov     eax, dword [ebp-18H]                    ; 2903 _ 8B. 45, E8
        add     eax, 28                                 ; 2906 _ 83. C0, 1C
        mov     dword [eax], 0                          ; 2909 _ C7. 00, 00000000
        cmp     dword [ebp-0CH], 7                      ; 290F _ 83. 7D, F4, 07
        jg      ?_166                                   ; 2913 _ 0F 8F, 00000202
        mov     dword [ebp-2CH], 0                      ; 2919 _ C7. 45, D4, 00000000
        mov     eax, dword [ebp-10H]                    ; 2920 _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 2923 _ 8B. 80, 000000B0
        mov     edx, dword [eax]                        ; 2929 _ 8B. 10
        mov     eax, dword [ebp+18H]                    ; 292B _ 8B. 45, 18
        add     eax, edx                                ; 292E _ 01. D0
        mov     dword [ebp-20H], eax                    ; 2930 _ 89. 45, E0
        lea     eax, [ebp-2CH]                          ; 2933 _ 8D. 45, D4
        mov     dword [esp+4H], eax                     ; 2936 _ 89. 44 24, 04
        mov     eax, dword [ebp-20H]                    ; 293A _ 8B. 45, E0
        mov     dword [esp], eax                        ; 293D _ 89. 04 24
        call    file_loadfile                           ; 2940 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-2CH]                    ; 2945 _ 8B. 45, D4
        test    eax, eax                                ; 2948 _ 85. C0
        jz      ?_151                                   ; 294A _ 74, 2B
        mov     eax, dword [ebp-18H]                    ; 294C _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 294F _ 8D. 50, 1C
        mov     eax, dword [ebp-1CH]                    ; 2952 _ 8B. 45, E4
        mov     dword [edx], eax                        ; 2955 _ 89. 02
        mov     edx, dword [ebp-2CH]                    ; 2957 _ 8B. 55, D4
        mov     eax, dword [ebp-1CH]                    ; 295A _ 8B. 45, E4
        mov     dword [eax], edx                        ; 295D _ 89. 10
        mov     edx, dword [ebp-24H]                    ; 295F _ 8B. 55, DC
        mov     eax, dword [ebp-1CH]                    ; 2962 _ 8B. 45, E4
        mov     dword [eax+4H], edx                     ; 2965 _ 89. 50, 04
        mov     eax, dword [ebp-1CH]                    ; 2968 _ 8B. 45, E4
        mov     dword [eax+8H], 0                       ; 296B _ C7. 40, 08, 00000000
        jmp     ?_166                                   ; 2972 _ E9, 000001A4

?_151:  jmp     ?_166                                   ; 2977 _ E9, 0000019F

?_152:  cmp     dword [ebp+1CH], 22                     ; 297C _ 83. 7D, 1C, 16
        jnz     ?_153                                   ; 2980 _ 75, 38
        mov     eax, dword [ebp+24H]                    ; 2982 _ 8B. 45, 24
        mov     dword [ebp-1CH], eax                    ; 2985 _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 2988 _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 298B _ 8B. 40, 04
        mov     ecx, eax                                ; 298E _ 89. C1
        mov     eax, dword [ebp-1CH]                    ; 2990 _ 8B. 45, E4
        mov     eax, dword [eax]                        ; 2993 _ 8B. 00
        mov     edx, eax                                ; 2995 _ 89. C2
        mov     eax, dword [memman]                     ; 2997 _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 299C _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 29A0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 29A4 _ 89. 04 24
        call    memman_free_4k                          ; 29A7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 29AC _ 8B. 45, E4
        mov     dword [eax], 0                          ; 29AF _ C7. 00, 00000000
        jmp     ?_166                                   ; 29B5 _ E9, 00000161

?_153:  cmp     dword [ebp+1CH], 23                     ; 29BA _ 83. 7D, 1C, 17
        jne     ?_158                                   ; 29BE _ 0F 85, 00000080
        mov     eax, dword [ebp+24H]                    ; 29C4 _ 8B. 45, 24
        mov     dword [ebp-1CH], eax                    ; 29C7 _ 89. 45, E4
        cmp     dword [ebp+20H], 0                      ; 29CA _ 83. 7D, 20, 00
        jnz     ?_154                                   ; 29CE _ 75, 0B
        mov     eax, dword [ebp-1CH]                    ; 29D0 _ 8B. 45, E4
        mov     edx, dword [ebp+18H]                    ; 29D3 _ 8B. 55, 18
        mov     dword [eax+8H], edx                     ; 29D6 _ 89. 50, 08
        jmp     ?_156                                   ; 29D9 _ EB, 30

?_154:  cmp     dword [ebp+20H], 1                      ; 29DB _ 83. 7D, 20, 01
        jnz     ?_155                                   ; 29DF _ 75, 13
        mov     eax, dword [ebp-1CH]                    ; 29E1 _ 8B. 45, E4
        mov     edx, dword [eax+8H]                     ; 29E4 _ 8B. 50, 08
        mov     eax, dword [ebp+18H]                    ; 29E7 _ 8B. 45, 18
        add     edx, eax                                ; 29EA _ 01. C2
        mov     eax, dword [ebp-1CH]                    ; 29EC _ 8B. 45, E4
        mov     dword [eax+8H], edx                     ; 29EF _ 89. 50, 08
        jmp     ?_156                                   ; 29F2 _ EB, 17

?_155:  cmp     dword [ebp+20H], 2                      ; 29F4 _ 83. 7D, 20, 02
        jnz     ?_156                                   ; 29F8 _ 75, 11
        mov     eax, dword [ebp-1CH]                    ; 29FA _ 8B. 45, E4
        mov     edx, dword [eax+4H]                     ; 29FD _ 8B. 50, 04
        mov     eax, dword [ebp+18H]                    ; 2A00 _ 8B. 45, 18
        add     edx, eax                                ; 2A03 _ 01. C2
        mov     eax, dword [ebp-1CH]                    ; 2A05 _ 8B. 45, E4
        mov     dword [eax+8H], edx                     ; 2A08 _ 89. 50, 08
?_156:  mov     eax, dword [ebp-1CH]                    ; 2A0B _ 8B. 45, E4
        mov     eax, dword [eax+8H]                     ; 2A0E _ 8B. 40, 08
        test    eax, eax                                ; 2A11 _ 85. C0
        jns     ?_157                                   ; 2A13 _ 79, 0A
        mov     eax, dword [ebp-1CH]                    ; 2A15 _ 8B. 45, E4
        mov     dword [eax+8H], 0                       ; 2A18 _ C7. 40, 08, 00000000
?_157:  mov     eax, dword [ebp-1CH]                    ; 2A1F _ 8B. 45, E4
        mov     edx, dword [eax+8H]                     ; 2A22 _ 8B. 50, 08
        mov     eax, dword [ebp-1CH]                    ; 2A25 _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 2A28 _ 8B. 40, 04
        cmp     edx, eax                                ; 2A2B _ 39. C2
        jle     ?_166                                   ; 2A2D _ 0F 8E, 000000E8
        mov     eax, dword [ebp-1CH]                    ; 2A33 _ 8B. 45, E4
        mov     edx, dword [eax+4H]                     ; 2A36 _ 8B. 50, 04
        mov     eax, dword [ebp-1CH]                    ; 2A39 _ 8B. 45, E4
        mov     dword [eax+8H], edx                     ; 2A3C _ 89. 50, 08
        jmp     ?_166                                   ; 2A3F _ E9, 000000D7

?_158:  cmp     dword [ebp+1CH], 24                     ; 2A44 _ 83. 7D, 1C, 18
        jnz     ?_161                                   ; 2A48 _ 75, 5C
        mov     eax, dword [ebp+24H]                    ; 2A4A _ 8B. 45, 24
        mov     dword [ebp-1CH], eax                    ; 2A4D _ 89. 45, E4
        cmp     dword [ebp+20H], 0                      ; 2A50 _ 83. 7D, 20, 00
        jnz     ?_159                                   ; 2A54 _ 75, 13
        mov     eax, dword [ebp-18H]                    ; 2A56 _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 2A59 _ 8D. 50, 1C
        mov     eax, dword [ebp-1CH]                    ; 2A5C _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 2A5F _ 8B. 40, 04
        mov     dword [edx], eax                        ; 2A62 _ 89. 02
        jmp     ?_166                                   ; 2A64 _ E9, 000000B2

?_159:  cmp     dword [ebp+20H], 1                      ; 2A69 _ 83. 7D, 20, 01
        jnz     ?_160                                   ; 2A6D _ 75, 13
        mov     eax, dword [ebp-18H]                    ; 2A6F _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 2A72 _ 8D. 50, 1C
        mov     eax, dword [ebp-1CH]                    ; 2A75 _ 8B. 45, E4
        mov     eax, dword [eax+8H]                     ; 2A78 _ 8B. 40, 08
        mov     dword [edx], eax                        ; 2A7B _ 89. 02
        jmp     ?_166                                   ; 2A7D _ E9, 00000099

?_160:  cmp     dword [ebp+20H], 2                      ; 2A82 _ 83. 7D, 20, 02
        jne     ?_166                                   ; 2A86 _ 0F 85, 0000008F
        mov     eax, dword [ebp-18H]                    ; 2A8C _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 2A8F _ 8D. 50, 1C
        mov     eax, dword [ebp-1CH]                    ; 2A92 _ 8B. 45, E4
        mov     ecx, dword [eax+8H]                     ; 2A95 _ 8B. 48, 08
        mov     eax, dword [ebp-1CH]                    ; 2A98 _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 2A9B _ 8B. 40, 04
        sub     ecx, eax                                ; 2A9E _ 29. C1
        mov     eax, ecx                                ; 2AA0 _ 89. C8
        mov     dword [edx], eax                        ; 2AA2 _ 89. 02
        jmp     ?_166                                   ; 2AA4 _ EB, 75

?_161:  cmp     dword [ebp+1CH], 25                     ; 2AA6 _ 83. 7D, 1C, 19
        jnz     ?_166                                   ; 2AAA _ 75, 6F
        mov     eax, dword [ebp+24H]                    ; 2AAC _ 8B. 45, 24
        mov     dword [ebp-1CH], eax                    ; 2AAF _ 89. 45, E4
        mov     dword [ebp-0CH], 0                      ; 2AB2 _ C7. 45, F4, 00000000
        jmp     ?_164                                   ; 2AB9 _ EB, 4D

?_162:  mov     eax, dword [ebp-1CH]                    ; 2ABB _ 8B. 45, E4
        mov     edx, dword [eax+8H]                     ; 2ABE _ 8B. 50, 08
        mov     eax, dword [ebp-1CH]                    ; 2AC1 _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 2AC4 _ 8B. 40, 04
        cmp     edx, eax                                ; 2AC7 _ 39. C2
        jnz     ?_163                                   ; 2AC9 _ 75, 02
        jmp     ?_165                                   ; 2ACB _ EB, 43

?_163:  mov     eax, dword [ebp-10H]                    ; 2ACD _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 2AD0 _ 8B. 80, 000000B0
        mov     eax, dword [eax+4H]                     ; 2AD6 _ 8B. 40, 04
        mov     ecx, dword [ebp+18H]                    ; 2AD9 _ 8B. 4D, 18
        mov     edx, dword [ebp-0CH]                    ; 2ADC _ 8B. 55, F4
        add     edx, ecx                                ; 2ADF _ 01. CA
        add     edx, eax                                ; 2AE1 _ 01. C2
        mov     eax, dword [ebp-1CH]                    ; 2AE3 _ 8B. 45, E4
        mov     ecx, dword [eax]                        ; 2AE6 _ 8B. 08
        mov     eax, dword [ebp-1CH]                    ; 2AE8 _ 8B. 45, E4
        mov     eax, dword [eax+8H]                     ; 2AEB _ 8B. 40, 08
        add     eax, ecx                                ; 2AEE _ 01. C8
        movzx   eax, byte [eax]                         ; 2AF0 _ 0F B6. 00
        mov     byte [edx], al                          ; 2AF3 _ 88. 02
        mov     eax, dword [ebp-1CH]                    ; 2AF5 _ 8B. 45, E4
        mov     eax, dword [eax+8H]                     ; 2AF8 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2AFB _ 8D. 50, 01
        mov     eax, dword [ebp-1CH]                    ; 2AFE _ 8B. 45, E4
        mov     dword [eax+8H], edx                     ; 2B01 _ 89. 50, 08
        add     dword [ebp-0CH], 1                      ; 2B04 _ 83. 45, F4, 01
?_164:  mov     eax, dword [ebp-0CH]                    ; 2B08 _ 8B. 45, F4
        cmp     eax, dword [ebp+20H]                    ; 2B0B _ 3B. 45, 20
        jl      ?_162                                   ; 2B0E _ 7C, AB
?_165:  mov     eax, dword [ebp-18H]                    ; 2B10 _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 2B13 _ 8D. 50, 1C
        mov     eax, dword [ebp-0CH]                    ; 2B16 _ 8B. 45, F4
        mov     dword [edx], eax                        ; 2B19 _ 89. 02
?_166:  mov     eax, 0                                  ; 2B1B _ B8, 00000000
?_167:  add     esp, 80                                 ; 2B20 _ 83. C4, 50
        pop     ebx                                     ; 2B23 _ 5B
        pop     esi                                     ; 2B24 _ 5E
        pop     ebp                                     ; 2B25 _ 5D
        ret                                             ; 2B26 _ C3
; kernel_api End of function

cons_putchar:; Function begin
        push    ebp                                     ; 2B27 _ 55
        mov     ebp, esp                                ; 2B28 _ 89. E5
        push    esi                                     ; 2B2A _ 56
        push    ebx                                     ; 2B2B _ 53
        sub     esp, 48                                 ; 2B2C _ 83. EC, 30
        mov     edx, dword [ebp+8H]                     ; 2B2F _ 8B. 55, 08
        mov     eax, dword [ebp+0CH]                    ; 2B32 _ 8B. 45, 0C
        mov     byte [ebp-1CH], dl                      ; 2B35 _ 88. 55, E4
        mov     byte [ebp-20H], al                      ; 2B38 _ 88. 45, E0
        call    task_now                                ; 2B3B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2B40 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 2B43 _ 8B. 45, F4
        mov     ebx, dword [eax+9CH]                    ; 2B46 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 2B4C _ 8B. 45, F4
        mov     ecx, dword [eax+98H]                    ; 2B4F _ 8B. 88, 00000098
        mov     eax, dword [ebp-0CH]                    ; 2B55 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 2B58 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 2B5E _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 2B63 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 2B6B _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2B6F _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2B73 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2B77 _ 89. 04 24
        call    set_cursor                              ; 2B7A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 2B7F _ 8B. 45, F4
        movzx   edx, byte [ebp-1CH]                     ; 2B82 _ 0F B6. 55, E4
        mov     byte [eax+0A4H], dl                     ; 2B86 _ 88. 90, 000000A4
        mov     eax, dword [ebp-0CH]                    ; 2B8C _ 8B. 45, F4
        mov     byte [eax+0A5H], 0                      ; 2B8F _ C6. 80, 000000A5, 00
        mov     eax, dword [ebp-0CH]                    ; 2B96 _ 8B. 45, F4
        lea     esi, [eax+0A4H]                         ; 2B99 _ 8D. B0, 000000A4
        mov     eax, dword [ebp-0CH]                    ; 2B9F _ 8B. 45, F4
        mov     ebx, dword [eax+9CH]                    ; 2BA2 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 2BA8 _ 8B. 45, F4
        mov     ecx, dword [eax+98H]                    ; 2BAB _ 8B. 88, 00000098
        mov     eax, dword [ebp-0CH]                    ; 2BB1 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 2BB4 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 2BBA _ A1, 00000264(d)
        mov     dword [esp+14H], esi                    ; 2BBF _ 89. 74 24, 14
        mov     dword [esp+10H], 7                      ; 2BC3 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 2BCB _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2BCF _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2BD3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2BD7 _ 89. 04 24
        call    showString                              ; 2BDA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 2BDF _ 8B. 45, F4
        mov     eax, dword [eax+98H]                    ; 2BE2 _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 2BE8 _ 8D. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2BEB _ 8B. 45, F4
        mov     dword [eax+98H], edx                    ; 2BEE _ 89. 90, 00000098
        add     esp, 48                                 ; 2BF4 _ 83. C4, 30
        pop     ebx                                     ; 2BF7 _ 5B
        pop     esi                                     ; 2BF8 _ 5E
        pop     ebp                                     ; 2BF9 _ 5D
        ret                                             ; 2BFA _ C3
; cons_putchar End of function

cons_newline:; Function begin
        push    ebp                                     ; 2BFB _ 55
        mov     ebp, esp                                ; 2BFC _ 89. E5
        push    ebx                                     ; 2BFE _ 53
        sub     esp, 52                                 ; 2BFF _ 83. EC, 34
        cmp     dword [ebp+0CH], 0                      ; 2C02 _ 83. 7D, 0C, 00
        jnz     ?_168                                   ; 2C06 _ 75, 06
        nop                                             ; 2C08 _ 90
        jmp     ?_179                                   ; 2C09 _ E9, 00000127

?_168:  cmp     dword [ebp+8H], 139                     ; 2C0E _ 81. 7D, 08, 0000008B
        jg      ?_169                                   ; 2C15 _ 7F, 09
        add     dword [ebp+8H], 16                      ; 2C17 _ 83. 45, 08, 10
        jmp     ?_178                                   ; 2C1B _ E9, 000000DF

?_169:  mov     dword [ebp-10H], 28                     ; 2C20 _ C7. 45, F0, 0000001C
        jmp     ?_173                                   ; 2C27 _ EB, 52

?_170:  mov     dword [ebp-0CH], 8                      ; 2C29 _ C7. 45, F4, 00000008
        jmp     ?_172                                   ; 2C30 _ EB, 3C

?_171:  mov     eax, dword [ebp+0CH]                    ; 2C32 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2C35 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2C37 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2C3A _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 2C3D _ 0F AF. 45, F0
        mov     ecx, eax                                ; 2C41 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2C43 _ 8B. 45, F4
        add     eax, ecx                                ; 2C46 _ 01. C8
        add     edx, eax                                ; 2C48 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2C4A _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 2C4D _ 8B. 08
        mov     eax, dword [ebp-10H]                    ; 2C4F _ 8B. 45, F0
        lea     ebx, [eax+10H]                          ; 2C52 _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 2C55 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2C58 _ 8B. 40, 04
        imul    ebx, eax                                ; 2C5B _ 0F AF. D8
        mov     eax, dword [ebp-0CH]                    ; 2C5E _ 8B. 45, F4
        add     eax, ebx                                ; 2C61 _ 01. D8
        add     eax, ecx                                ; 2C63 _ 01. C8
        movzx   eax, byte [eax]                         ; 2C65 _ 0F B6. 00
        mov     byte [edx], al                          ; 2C68 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 2C6A _ 83. 45, F4, 01
?_172:  cmp     dword [ebp-0CH], 247                    ; 2C6E _ 81. 7D, F4, 000000F7
        jle     ?_171                                   ; 2C75 _ 7E, BB
        add     dword [ebp-10H], 1                      ; 2C77 _ 83. 45, F0, 01
?_173:  cmp     dword [ebp-10H], 139                    ; 2C7B _ 81. 7D, F0, 0000008B
        jle     ?_170                                   ; 2C82 _ 7E, A5
        mov     dword [ebp-10H], 140                    ; 2C84 _ C7. 45, F0, 0000008C
        jmp     ?_177                                   ; 2C8B _ EB, 35

?_174:  mov     dword [ebp-0CH], 8                      ; 2C8D _ C7. 45, F4, 00000008
        jmp     ?_176                                   ; 2C94 _ EB, 1F

?_175:  mov     eax, dword [ebp+0CH]                    ; 2C96 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2C99 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2C9B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2C9E _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 2CA1 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 2CA5 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2CA7 _ 8B. 45, F4
        add     eax, ecx                                ; 2CAA _ 01. C8
        add     eax, edx                                ; 2CAC _ 01. D0
        mov     byte [eax], 0                           ; 2CAE _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 2CB1 _ 83. 45, F4, 01
?_176:  cmp     dword [ebp-0CH], 247                    ; 2CB5 _ 81. 7D, F4, 000000F7
        jle     ?_175                                   ; 2CBC _ 7E, D8
        add     dword [ebp-10H], 1                      ; 2CBE _ 83. 45, F0, 01
?_177:  cmp     dword [ebp-10H], 155                    ; 2CC2 _ 81. 7D, F0, 0000009B
        jle     ?_174                                   ; 2CC9 _ 7E, C2
        mov     eax, dword [shtctl]                     ; 2CCB _ A1, 00000264(d)
        mov     dword [esp+14H], 156                    ; 2CD0 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 2CD8 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 2CE0 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2CE8 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 2CF0 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2CF3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2CF7 _ 89. 04 24
        call    sheet_refresh                           ; 2CFA _ E8, FFFFFFFC(rel)
?_178:  mov     eax, dword [shtctl]                     ; 2CFF _ A1, 00000264(d)
        mov     dword [esp+14H], ?_424                  ; 2D04 _ C7. 44 24, 14, 00000023(d)
        mov     dword [esp+10H], 7                      ; 2D0C _ C7. 44 24, 10, 00000007
        mov     edx, dword [ebp+8H]                     ; 2D14 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 2D17 _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 2D1B _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 2D23 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2D26 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2D2A _ 89. 04 24
        call    showString                              ; 2D2D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2D32 _ 8B. 45, 08
?_179:  add     esp, 52                                 ; 2D35 _ 83. C4, 34
        pop     ebx                                     ; 2D38 _ 5B
        pop     ebp                                     ; 2D39 _ 5D
        ret                                             ; 2D3A _ C3
; cons_newline End of function

init_screen8:; Function begin
        push    ebp                                     ; 2D3B _ 55
        mov     ebp, esp                                ; 2D3C _ 89. E5
        push    ebx                                     ; 2D3E _ 53
        sub     esp, 36                                 ; 2D3F _ 83. EC, 24
        mov     eax, dword [ebp+10H]                    ; 2D42 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 2D45 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 2D48 _ 8B. 45, 0C
        sub     eax, 1                                  ; 2D4B _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 2D4E _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 2D52 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 2D56 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 2D5E _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 14                      ; 2D66 _ C7. 44 24, 08, 0000000E
        mov     eax, dword [ebp+0CH]                    ; 2D6E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2D71 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2D75 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2D78 _ 89. 04 24
        call    boxfill8                                ; 2D7B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2D80 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 2D83 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 2D86 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2D89 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2D8C _ 8B. 45, 10
        sub     eax, 28                                 ; 2D8F _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 2D92 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2D96 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2D9A _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 2D9E _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 2DA6 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 2DAE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2DB1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2DB5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2DB8 _ 89. 04 24
        call    boxfill8                                ; 2DBB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2DC0 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 2DC3 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 2DC6 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2DC9 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2DCC _ 8B. 45, 10
        sub     eax, 27                                 ; 2DCF _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 2DD2 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2DD6 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2DDA _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 2DDE _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 2DE6 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2DEE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2DF1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2DF5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2DF8 _ 89. 04 24
        call    boxfill8                                ; 2DFB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2E00 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 2E03 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 2E06 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2E09 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2E0C _ 8B. 45, 10
        sub     eax, 26                                 ; 2E0F _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 2E12 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2E16 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2E1A _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 2E1E _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 2E26 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 2E2E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2E31 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E35 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E38 _ 89. 04 24
        call    boxfill8                                ; 2E3B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2E40 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2E43 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 2E46 _ 8B. 45, 10
        sub     eax, 24                                 ; 2E49 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 2E4C _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2E50 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2E58 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 2E5C _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 2E64 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2E6C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2E6F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E73 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E76 _ 89. 04 24
        call    boxfill8                                ; 2E79 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2E7E _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 2E81 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2E84 _ 8B. 45, 10
        sub     eax, 24                                 ; 2E87 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 2E8A _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 2E8E _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 2E96 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 2E9A _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 2EA2 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2EAA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2EAD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2EB1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2EB4 _ 89. 04 24
        call    boxfill8                                ; 2EB7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2EBC _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 2EBF _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2EC2 _ 8B. 45, 10
        sub     eax, 4                                  ; 2EC5 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 2EC8 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2ECC _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2ED4 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 2ED8 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 15                      ; 2EE0 _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp+0CH]                    ; 2EE8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2EEB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2EEF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2EF2 _ 89. 04 24
        call    boxfill8                                ; 2EF5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2EFA _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 2EFD _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 2F00 _ 8B. 45, 10
        sub     eax, 23                                 ; 2F03 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 2F06 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2F0A _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2F12 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 2F16 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 15                      ; 2F1E _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp+0CH]                    ; 2F26 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2F29 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F2D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F30 _ 89. 04 24
        call    boxfill8                                ; 2F33 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2F38 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2F3B _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 2F3E _ 8B. 45, 10
        sub     eax, 3                                  ; 2F41 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 2F44 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2F48 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2F50 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 2F54 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 2F5C _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2F64 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2F67 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F6B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F6E _ 89. 04 24
        call    boxfill8                                ; 2F71 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2F76 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2F79 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 2F7C _ 8B. 45, 10
        sub     eax, 24                                 ; 2F7F _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 2F82 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 2F86 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 2F8E _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 2F92 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 2F9A _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2FA2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2FA5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2FA9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2FAC _ 89. 04 24
        call    boxfill8                                ; 2FAF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2FB4 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 2FB7 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 2FBA _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 2FBD _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 2FC0 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2FC3 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 2FC6 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2FC9 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 2FCC _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2FD0 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2FD4 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2FD8 _ 89. 44 24, 0C
        mov     dword [esp+8H], 15                      ; 2FDC _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp+0CH]                    ; 2FE4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2FE7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2FEB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2FEE _ 89. 04 24
        call    boxfill8                                ; 2FF1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2FF6 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 2FF9 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 2FFC _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 2FFF _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 3002 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 3005 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 3008 _ 8B. 45, 0C
        sub     eax, 47                                 ; 300B _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 300E _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3012 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 3016 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 301A _ 89. 44 24, 0C
        mov     dword [esp+8H], 15                      ; 301E _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp+0CH]                    ; 3026 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3029 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 302D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3030 _ 89. 04 24
        call    boxfill8                                ; 3033 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3038 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 303B _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 303E _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 3041 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 3044 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 3047 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 304A _ 8B. 45, 0C
        sub     eax, 47                                 ; 304D _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 3050 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3054 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 3058 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 305C _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 3060 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 3068 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 306B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 306F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3072 _ 89. 04 24
        call    boxfill8                                ; 3075 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 307A _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 307D _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 3080 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 3083 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 3086 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 3089 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 308C _ 8B. 45, 0C
        sub     eax, 3                                  ; 308F _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 3092 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3096 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 309A _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 309E _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 30A2 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 30AA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 30AD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 30B1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 30B4 _ 89. 04 24
        call    boxfill8                                ; 30B7 _ E8, FFFFFFFC(rel)
        add     esp, 36                                 ; 30BC _ 83. C4, 24
        pop     ebx                                     ; 30BF _ 5B
        pop     ebp                                     ; 30C0 _ 5D
        ret                                             ; 30C1 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 30C2 _ 55
        mov     ebp, esp                                ; 30C3 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 30C5 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 30C8 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 30CB _ A1, 00000134(d)
        add     eax, edx                                ; 30D0 _ 01. D0
        mov     dword [mx], eax                         ; 30D2 _ A3, 00000134(d)
        mov     eax, dword [ebp+10H]                    ; 30D7 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 30DA _ 8B. 50, 08
        mov     eax, dword [my]                         ; 30DD _ A1, 00000138(d)
        add     eax, edx                                ; 30E2 _ 01. D0
        mov     dword [my], eax                         ; 30E4 _ A3, 00000138(d)
        mov     eax, dword [mx]                         ; 30E9 _ A1, 00000134(d)
        test    eax, eax                                ; 30EE _ 85. C0
        jns     ?_180                                   ; 30F0 _ 79, 0A
        mov     dword [mx], 0                           ; 30F2 _ C7. 05, 00000134(d), 00000000
?_180:  mov     eax, dword [my]                         ; 30FC _ A1, 00000138(d)
        test    eax, eax                                ; 3101 _ 85. C0
        jns     ?_181                                   ; 3103 _ 79, 0A
        mov     dword [my], 0                           ; 3105 _ C7. 05, 00000138(d), 00000000
?_181:  mov     eax, dword [xsize]                      ; 310F _ A1, 0000013C(d)
        lea     edx, [eax-1H]                           ; 3114 _ 8D. 50, FF
        mov     eax, dword [mx]                         ; 3117 _ A1, 00000134(d)
        cmp     edx, eax                                ; 311C _ 39. C2
        jge     ?_182                                   ; 311E _ 7D, 0D
        mov     eax, dword [xsize]                      ; 3120 _ A1, 0000013C(d)
        sub     eax, 1                                  ; 3125 _ 83. E8, 01
        mov     dword [mx], eax                         ; 3128 _ A3, 00000134(d)
?_182:  mov     eax, dword [ysize]                      ; 312D _ A1, 00000140(d)
        lea     edx, [eax-1H]                           ; 3132 _ 8D. 50, FF
        mov     eax, dword [my]                         ; 3135 _ A1, 00000138(d)
        cmp     edx, eax                                ; 313A _ 39. C2
        jge     ?_183                                   ; 313C _ 7D, 0D
        mov     eax, dword [ysize]                      ; 313E _ A1, 00000140(d)
        sub     eax, 1                                  ; 3143 _ 83. E8, 01
        mov     dword [my], eax                         ; 3146 _ A3, 00000138(d)
?_183:  pop     ebp                                     ; 314B _ 5D
        ret                                             ; 314C _ C3
; computeMousePosition End of function

showString:; Function begin
        push    ebp                                     ; 314D _ 55
        mov     ebp, esp                                ; 314E _ 89. E5
        push    ebx                                     ; 3150 _ 53
        sub     esp, 52                                 ; 3151 _ 83. EC, 34
        mov     eax, dword [ebp+18H]                    ; 3154 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 3157 _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 315A _ 83. 7D, 08, 00
        jz      ?_184                                   ; 315E _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 3160 _ 83. 7D, 0C, 00
        jnz     ?_185                                   ; 3164 _ 75, 05
?_184:  jmp     ?_188                                   ; 3166 _ E9, 00000095

?_185:  mov     eax, dword [ebp+10H]                    ; 316B _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 316E _ 89. 45, F4
        mov     dword [ebp-10H], 0                      ; 3171 _ C7. 45, F0, 00000000
        jmp     ?_187                                   ; 3178 _ EB, 4B

?_186:  mov     eax, dword [ebp+1CH]                    ; 317A _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 317D _ 0F B6. 00
        movzx   eax, al                                 ; 3180 _ 0F B6. C0
        shl     eax, 4                                  ; 3183 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 3186 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 318C _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 3190 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 3193 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 3196 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3199 _ 8B. 00
        mov     dword [esp+14H], ebx                    ; 319B _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 319F _ 89. 4C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 31A3 _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 31A6 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 31AA _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 31AD _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 31B1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 31B5 _ 89. 04 24
        call    showFont8                               ; 31B8 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 31BD _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 31C1 _ 83. 45, 1C, 01
?_187:  mov     eax, dword [ebp+1CH]                    ; 31C5 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 31C8 _ 0F B6. 00
        test    al, al                                  ; 31CB _ 84. C0
        jnz     ?_186                                   ; 31CD _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 31CF _ 8B. 45, 14
        add     eax, 16                                 ; 31D2 _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 31D5 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 31D9 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 31DC _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 31E0 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 31E3 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 31E7 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 31EA _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 31EE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 31F1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 31F5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 31F8 _ 89. 04 24
        call    sheet_refresh                           ; 31FB _ E8, FFFFFFFC(rel)
?_188:  add     esp, 52                                 ; 3200 _ 83. C4, 34
        pop     ebx                                     ; 3203 _ 5B
        pop     ebp                                     ; 3204 _ 5D
        ret                                             ; 3205 _ C3
; showString End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 3206 _ 55
        mov     ebp, esp                                ; 3207 _ 89. E5
        sub     esp, 72                                 ; 3209 _ 83. EC, 48
        mov     eax, dword [buf_back]                   ; 320C _ A1, 00000144(d)
        mov     dword [ebp-10H], eax                    ; 3211 _ 89. 45, F0
        mov     byte [ebp-11H], 0                       ; 3214 _ C6. 45, EF, 00
        mov     dword [ebp-18H], 0                      ; 3218 _ C7. 45, E8, 00000000
        call    io_sti                                  ; 321F _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 3224 _ C7. 04 24, 00000038(d)
        call    fifo8_get                               ; 322B _ E8, FFFFFFFC(rel)
        mov     byte [ebp-11H], al                      ; 3230 _ 88. 45, EF
        movzx   eax, byte [ebp-11H]                     ; 3233 _ 0F B6. 45, EF
        mov     dword [esp+4H], eax                     ; 3237 _ 89. 44 24, 04
        mov     dword [esp], mdec                       ; 323B _ C7. 04 24, 00000100(d)
        call    mouse_decode                            ; 3242 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 3247 _ 85. C0
        je      ?_200                                   ; 3249 _ 0F 84, 00000386
        mov     dword [esp+8H], mdec                    ; 324F _ C7. 44 24, 08, 00000100(d)
        mov     eax, dword [ebp+0CH]                    ; 3257 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 325A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 325E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3261 _ 89. 04 24
        call    computeMousePosition                    ; 3264 _ E8, FFFFFFFC(rel)
        mov     edx, dword [my]                         ; 3269 _ 8B. 15, 00000138(d)
        mov     eax, dword [mx]                         ; 326F _ A1, 00000134(d)
        mov     dword [esp+0CH], edx                    ; 3274 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 3278 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 327C _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 327F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3283 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3286 _ 89. 04 24
        call    sheet_slide                             ; 3289 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_451]                      ; 328E _ A1, 0000010C(d)
        and     eax, 01H                                ; 3293 _ 83. E0, 01
        test    eax, eax                                ; 3296 _ 85. C0
        je      ?_199                                   ; 3298 _ 0F 84, 0000032D
        mov     eax, dword [mmx]                        ; 329E _ A1, 00000118(d)
        test    eax, eax                                ; 32A3 _ 85. C0
        jns     ?_198                                   ; 32A5 _ 0F 89, 000002AF
        mov     eax, dword [ebp+8H]                     ; 32AB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 32AE _ 8B. 40, 10
        sub     eax, 1                                  ; 32B1 _ 83. E8, 01
        mov     dword [ebp-0CH], eax                    ; 32B4 _ 89. 45, F4
        jmp     ?_196                                   ; 32B7 _ E9, 00000290

?_189:  mov     eax, dword [ebp+8H]                     ; 32BC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 32BF _ 8B. 55, F4
        add     edx, 4                                  ; 32C2 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 32C5 _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 32C9 _ 89. 45, E8
        mov     edx, dword [mx]                         ; 32CC _ 8B. 15, 00000134(d)
        mov     eax, dword [ebp-18H]                    ; 32D2 _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 32D5 _ 8B. 40, 0C
        sub     edx, eax                                ; 32D8 _ 29. C2
        mov     eax, edx                                ; 32DA _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 32DC _ 89. 45, E4
        mov     edx, dword [my]                         ; 32DF _ 8B. 15, 00000138(d)
        mov     eax, dword [ebp-18H]                    ; 32E5 _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 32E8 _ 8B. 40, 10
        sub     edx, eax                                ; 32EB _ 29. C2
        mov     eax, edx                                ; 32ED _ 89. D0
        mov     dword [ebp-20H], eax                    ; 32EF _ 89. 45, E0
        cmp     dword [ebp-1CH], 0                      ; 32F2 _ 83. 7D, E4, 00
        js      ?_195                                   ; 32F6 _ 0F 88, 0000024C
        mov     eax, dword [ebp-18H]                    ; 32FC _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 32FF _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 3302 _ 3B. 45, E4
        jle     ?_195                                   ; 3305 _ 0F 8E, 0000023D
        cmp     dword [ebp-20H], 0                      ; 330B _ 83. 7D, E0, 00
        js      ?_195                                   ; 330F _ 0F 88, 00000233
        mov     eax, dword [ebp-18H]                    ; 3315 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 3318 _ 8B. 40, 08
        cmp     eax, dword [ebp-20H]                    ; 331B _ 3B. 45, E0
        jle     ?_195                                   ; 331E _ 0F 8E, 00000224
        mov     eax, dword [ebp-18H]                    ; 3324 _ 8B. 45, E8
        mov     edx, dword [eax]                        ; 3327 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 3329 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 332C _ 8B. 40, 04
        imul    eax, dword [ebp-20H]                    ; 332F _ 0F AF. 45, E0
        mov     ecx, eax                                ; 3333 _ 89. C1
        mov     eax, dword [ebp-1CH]                    ; 3335 _ 8B. 45, E4
        add     eax, ecx                                ; 3338 _ 01. C8
        add     eax, edx                                ; 333A _ 01. D0
        movzx   eax, byte [eax]                         ; 333C _ 0F B6. 00
        movzx   edx, al                                 ; 333F _ 0F B6. D0
        mov     eax, dword [ebp-18H]                    ; 3342 _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 3345 _ 8B. 40, 14
        cmp     edx, eax                                ; 3348 _ 39. C2
        je      ?_195                                   ; 334A _ 0F 84, 000001F8
        mov     eax, dword [current_console_task]       ; 3350 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 3355 _ 8B. 80, 000000B4
        test    eax, eax                                ; 335B _ 85. C0
        jz      ?_190                                   ; 335D _ 74, 68
        mov     eax, dword [current_console_task]       ; 335F _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 3364 _ 8B. 80, 000000B4
        mov     dword [esp+0CH], 0                      ; 336A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_420                   ; 3372 _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], eax                     ; 337A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 337E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3381 _ 89. 04 24
        call    make_wtitle8                            ; 3384 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 3389 _ 8B. 45, E8
        mov     ecx, dword [eax+8H]                     ; 338C _ 8B. 48, 08
        mov     eax, dword [ebp-18H]                    ; 338F _ 8B. 45, E8
        mov     edx, dword [eax+4H]                     ; 3392 _ 8B. 50, 04
        mov     eax, dword [current_console_task]       ; 3395 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 339A _ 8B. 80, 000000B4
        mov     dword [esp+14H], ecx                    ; 33A0 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 33A4 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 33A8 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 33B0 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 33B8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 33BC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 33BF _ 89. 04 24
        call    sheet_refresh                           ; 33C2 _ E8, FFFFFFFC(rel)
?_190:  mov     eax, dword [ebp-18H]                    ; 33C7 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 33CA _ 8B. 40, 20
        mov     dword [current_console_task], eax       ; 33CD _ A3, 00000278(d)
        mov     eax, dword [current_console_task]       ; 33D2 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 33D7 _ 8B. 80, 000000B4
        test    eax, eax                                ; 33DD _ 85. C0
        jnz     ?_191                                   ; 33DF _ 75, 32
        mov     dword [esp+14H], ?_436                  ; 33E1 _ C7. 44 24, 14, 00000066(d)
        mov     dword [esp+10H], 7                      ; 33E9 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 96                     ; 33F1 _ C7. 44 24, 0C, 00000060
        mov     dword [esp+8H], 0                       ; 33F9 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 3401 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3404 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3408 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 340B _ 89. 04 24
        call    showString                              ; 340E _ E8, FFFFFFFC(rel)
?_191:  mov     eax, dword [current_console_task]       ; 3413 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 3418 _ 8B. 80, 000000B4
        test    eax, eax                                ; 341E _ 85. C0
        jz      ?_192                                   ; 3420 _ 74, 60
        mov     eax, dword [current_console_task]       ; 3422 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 3427 _ 8B. 80, 000000B4
        mov     dword [esp+0CH], 1                      ; 342D _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_420                   ; 3435 _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], eax                     ; 343D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3441 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3444 _ 89. 04 24
        call    make_wtitle8                            ; 3447 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 344C _ 8B. 45, E8
        mov     edx, dword [eax+8H]                     ; 344F _ 8B. 50, 08
        mov     eax, dword [ebp-18H]                    ; 3452 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 3455 _ 8B. 40, 04
        mov     dword [esp+14H], edx                    ; 3458 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 345C _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 3460 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 3468 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-18H]                    ; 3470 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 3473 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3477 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 347A _ 89. 04 24
        call    sheet_refresh                           ; 347D _ E8, FFFFFFFC(rel)
?_192:  mov     eax, dword [ebp+8H]                     ; 3482 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3485 _ 8B. 40, 10
        sub     eax, 1                                  ; 3488 _ 83. E8, 01
        mov     dword [esp+8H], eax                     ; 348B _ 89. 44 24, 08
        mov     eax, dword [ebp-18H]                    ; 348F _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 3492 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3496 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3499 _ 89. 04 24
        call    sheet_updown                            ; 349C _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-1CH], 2                      ; 34A1 _ 83. 7D, E4, 02
        jle     ?_193                                   ; 34A5 _ 7E, 36
        mov     eax, dword [ebp-18H]                    ; 34A7 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 34AA _ 8B. 40, 04
        sub     eax, 3                                  ; 34AD _ 83. E8, 03
        cmp     eax, dword [ebp-1CH]                    ; 34B0 _ 3B. 45, E4
        jle     ?_193                                   ; 34B3 _ 7E, 28
        cmp     dword [ebp-20H], 2                      ; 34B5 _ 83. 7D, E0, 02
        jle     ?_193                                   ; 34B9 _ 7E, 22
        cmp     dword [ebp-20H], 20                     ; 34BB _ 83. 7D, E0, 14
        jg      ?_193                                   ; 34BF _ 7F, 1C
        mov     eax, dword [mx]                         ; 34C1 _ A1, 00000134(d)
        mov     dword [mmx], eax                        ; 34C6 _ A3, 00000118(d)
        mov     eax, dword [my]                         ; 34CB _ A1, 00000138(d)
        mov     dword [mmy], eax                        ; 34D0 _ A3, 0000011C(d)
        mov     eax, dword [ebp-18H]                    ; 34D5 _ 8B. 45, E8
        mov     dword [mouse_clicked_sht], eax          ; 34D8 _ A3, 00000270(d)
?_193:  mov     eax, dword [ebp-18H]                    ; 34DD _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 34E0 _ 8B. 40, 04
        sub     eax, 21                                 ; 34E3 _ 83. E8, 15
        cmp     eax, dword [ebp-1CH]                    ; 34E6 _ 3B. 45, E4
        jg      ?_194                                   ; 34E9 _ 7F, 5B
        mov     eax, dword [ebp-18H]                    ; 34EB _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 34EE _ 8B. 40, 04
        sub     eax, 5                                  ; 34F1 _ 83. E8, 05
        cmp     eax, dword [ebp-1CH]                    ; 34F4 _ 3B. 45, E4
        jle     ?_194                                   ; 34F7 _ 7E, 4D
        cmp     dword [ebp-20H], 4                      ; 34F9 _ 83. 7D, E0, 04
        jle     ?_194                                   ; 34FD _ 7E, 47
        cmp     dword [ebp-20H], 18                     ; 34FF _ 83. 7D, E0, 12
        jg      ?_194                                   ; 3503 _ 7F, 41
        mov     eax, dword [ebp-18H]                    ; 3505 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 3508 _ 8B. 40, 20
        test    eax, eax                                ; 350B _ 85. C0
        jz      ?_194                                   ; 350D _ 74, 37
        call    io_cli                                  ; 350F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 3514 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 3517 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 351B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 351E _ 89. 04 24
        call    sheet_free                              ; 3521 _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 3526 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 352B _ 89. 45, DC
        mov     eax, dword [ebp-18H]                    ; 352E _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 3531 _ 8B. 40, 20
        mov     edx, kill_process                       ; 3534 _ BA, 00000000(d)
        sub     edx, dword [ebp-24H]                    ; 3539 _ 2B. 55, DC
        mov     dword [eax+4CH], edx                    ; 353C _ 89. 50, 4C
        call    io_sti                                  ; 353F _ E8, FFFFFFFC(rel)
        jmp     ?_197                                   ; 3544 _ EB, 12

?_194:  jmp     ?_197                                   ; 3546 _ EB, 10

?_195:  sub     dword [ebp-0CH], 1                      ; 3548 _ 83. 6D, F4, 01
?_196:  cmp     dword [ebp-0CH], 0                      ; 354C _ 83. 7D, F4, 00
        jg      ?_189                                   ; 3550 _ 0F 8F, FFFFFD66
        jmp     ?_200                                   ; 3556 _ EB, 7D

?_197:  jmp     ?_200                                   ; 3558 _ EB, 7B

?_198:  mov     edx, dword [mx]                         ; 355A _ 8B. 15, 00000134(d)
        mov     eax, dword [mmx]                        ; 3560 _ A1, 00000118(d)
        sub     edx, eax                                ; 3565 _ 29. C2
        mov     eax, edx                                ; 3567 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 3569 _ 89. 45, E4
        mov     edx, dword [my]                         ; 356C _ 8B. 15, 00000138(d)
        mov     eax, dword [mmy]                        ; 3572 _ A1, 0000011C(d)
        sub     edx, eax                                ; 3577 _ 29. C2
        mov     eax, edx                                ; 3579 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 357B _ 89. 45, E0
        mov     eax, dword [mouse_clicked_sht]          ; 357E _ A1, 00000270(d)
        mov     edx, dword [eax+10H]                    ; 3583 _ 8B. 50, 10
        mov     eax, dword [ebp-20H]                    ; 3586 _ 8B. 45, E0
        lea     ecx, [edx+eax]                          ; 3589 _ 8D. 0C 02
        mov     eax, dword [mouse_clicked_sht]          ; 358C _ A1, 00000270(d)
        mov     edx, dword [eax+0CH]                    ; 3591 _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 3594 _ 8B. 45, E4
        add     edx, eax                                ; 3597 _ 01. C2
        mov     eax, dword [mouse_clicked_sht]          ; 3599 _ A1, 00000270(d)
        mov     dword [esp+0CH], ecx                    ; 359E _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 35A2 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 35A6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 35AA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 35AD _ 89. 04 24
        call    sheet_slide                             ; 35B0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mx]                         ; 35B5 _ A1, 00000134(d)
        mov     dword [mmx], eax                        ; 35BA _ A3, 00000118(d)
        mov     eax, dword [my]                         ; 35BF _ A1, 00000138(d)
        mov     dword [mmy], eax                        ; 35C4 _ A3, 0000011C(d)
        jmp     ?_200                                   ; 35C9 _ EB, 0A

?_199:  mov     dword [mmx], -1                         ; 35CB _ C7. 05, 00000118(d), FFFFFFFF
?_200:  leave                                           ; 35D5 _ C9
        ret                                             ; 35D6 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 35D7 _ 55
        mov     ebp, esp                                ; 35D8 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 35DA _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 35DD _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 35E3 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 35E6 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 35EC _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 35EF _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 35F5 _ 5D
        ret                                             ; 35F6 _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 35F7 _ 55
        mov     ebp, esp                                ; 35F8 _ 89. E5
        sub     esp, 696                                ; 35FA _ 81. EC, 000002B8
        mov     dword [esp+8H], table_rgb.2131          ; 3600 _ C7. 44 24, 08, 00000140(d)
        mov     dword [esp+4H], 15                      ; 3608 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 3610 _ C7. 04 24, 00000000
        call    set_palette                             ; 3617 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 361C _ C7. 45, EC, 00000000
        jmp     ?_206                                   ; 3623 _ E9, 000000EF

?_201:  mov     dword [ebp-10H], 0                      ; 3628 _ C7. 45, F0, 00000000
        jmp     ?_205                                   ; 362F _ E9, 000000D5

?_202:  mov     dword [ebp-0CH], 0                      ; 3634 _ C7. 45, F4, 00000000
        jmp     ?_204                                   ; 363B _ E9, 000000BB

?_203:  mov     edx, dword [ebp-10H]                    ; 3640 _ 8B. 55, F0
        mov     eax, edx                                ; 3643 _ 89. D0
        add     eax, eax                                ; 3645 _ 01. C0
        add     eax, edx                                ; 3647 _ 01. D0
        add     eax, eax                                ; 3649 _ 01. C0
        mov     edx, eax                                ; 364B _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 364D _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 3650 _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 3653 _ 8B. 55, EC
        mov     eax, edx                                ; 3656 _ 89. D0
        shl     eax, 3                                  ; 3658 _ C1. E0, 03
        add     eax, edx                                ; 365B _ 01. D0
        shl     eax, 2                                  ; 365D _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 3660 _ 8D. 14 01
        mov     eax, edx                                ; 3663 _ 89. D0
        add     eax, eax                                ; 3665 _ 01. C0
        add     edx, eax                                ; 3667 _ 01. C2
        mov     eax, dword [ebp-0CH]                    ; 3669 _ 8B. 45, F4
        mov     ecx, 51                                 ; 366C _ B9, 00000033
        imul    eax, ecx                                ; 3671 _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 3674 _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 367B _ 8B. 55, F0
        mov     eax, edx                                ; 367E _ 89. D0
        add     eax, eax                                ; 3680 _ 01. C0
        add     eax, edx                                ; 3682 _ 01. D0
        add     eax, eax                                ; 3684 _ 01. C0
        mov     edx, eax                                ; 3686 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3688 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 368B _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 368E _ 8B. 55, EC
        mov     eax, edx                                ; 3691 _ 89. D0
        shl     eax, 3                                  ; 3693 _ C1. E0, 03
        add     eax, edx                                ; 3696 _ 01. D0
        shl     eax, 2                                  ; 3698 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 369B _ 8D. 14 01
        mov     eax, edx                                ; 369E _ 89. D0
        add     eax, eax                                ; 36A0 _ 01. C0
        add     eax, edx                                ; 36A2 _ 01. D0
        lea     edx, [eax+1H]                           ; 36A4 _ 8D. 50, 01
        mov     eax, dword [ebp-10H]                    ; 36A7 _ 8B. 45, F0
        mov     ecx, 51                                 ; 36AA _ B9, 00000033
        imul    eax, ecx                                ; 36AF _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 36B2 _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 36B9 _ 8B. 55, F0
        mov     eax, edx                                ; 36BC _ 89. D0
        add     eax, eax                                ; 36BE _ 01. C0
        add     eax, edx                                ; 36C0 _ 01. D0
        add     eax, eax                                ; 36C2 _ 01. C0
        mov     edx, eax                                ; 36C4 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 36C6 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 36C9 _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 36CC _ 8B. 55, EC
        mov     eax, edx                                ; 36CF _ 89. D0
        shl     eax, 3                                  ; 36D1 _ C1. E0, 03
        add     eax, edx                                ; 36D4 _ 01. D0
        shl     eax, 2                                  ; 36D6 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 36D9 _ 8D. 14 01
        mov     eax, edx                                ; 36DC _ 89. D0
        add     eax, eax                                ; 36DE _ 01. C0
        add     eax, edx                                ; 36E0 _ 01. D0
        lea     edx, [eax+2H]                           ; 36E2 _ 8D. 50, 02
        mov     eax, dword [ebp-14H]                    ; 36E5 _ 8B. 45, EC
        mov     ecx, 51                                 ; 36E8 _ B9, 00000033
        imul    eax, ecx                                ; 36ED _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 36F0 _ 88. 84 15, FFFFFD64
        add     dword [ebp-0CH], 1                      ; 36F7 _ 83. 45, F4, 01
?_204:  cmp     dword [ebp-0CH], 5                      ; 36FB _ 83. 7D, F4, 05
        jle     ?_203                                   ; 36FF _ 0F 8E, FFFFFF3B
        add     dword [ebp-10H], 1                      ; 3705 _ 83. 45, F0, 01
?_205:  cmp     dword [ebp-10H], 5                      ; 3709 _ 83. 7D, F0, 05
        jle     ?_202                                   ; 370D _ 0F 8E, FFFFFF21
        add     dword [ebp-14H], 1                      ; 3713 _ 83. 45, EC, 01
?_206:  cmp     dword [ebp-14H], 5                      ; 3717 _ 83. 7D, EC, 05
        jle     ?_201                                   ; 371B _ 0F 8E, FFFFFF07
        lea     eax, [ebp-29CH]                         ; 3721 _ 8D. 85, FFFFFD64
        mov     dword [esp+8H], eax                     ; 3727 _ 89. 44 24, 08
        mov     dword [esp+4H], 231                     ; 372B _ C7. 44 24, 04, 000000E7
        mov     dword [esp], 16                         ; 3733 _ C7. 04 24, 00000010
        call    set_palette                             ; 373A _ E8, FFFFFFFC(rel)
        nop                                             ; 373F _ 90
        leave                                           ; 3740 _ C9
        ret                                             ; 3741 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 3742 _ 55
        mov     ebp, esp                                ; 3743 _ 89. E5
        sub     esp, 40                                 ; 3745 _ 83. EC, 28
        call    io_load_eflags                          ; 3748 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 374D _ 89. 45, F0
        call    io_cli                                  ; 3750 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 3755 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 3758 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 375C _ C7. 04 24, 000003C8
        call    io_out8                                 ; 3763 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 3768 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 376B _ 89. 45, F4
        jmp     ?_208                                   ; 376E _ EB, 62

?_207:  mov     eax, dword [ebp+10H]                    ; 3770 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 3773 _ 0F B6. 00
        shr     al, 2                                   ; 3776 _ C0. E8, 02
        movzx   eax, al                                 ; 3779 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 377C _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 3780 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 3787 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 378C _ 8B. 45, 10
        add     eax, 1                                  ; 378F _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 3792 _ 0F B6. 00
        shr     al, 2                                   ; 3795 _ C0. E8, 02
        movzx   eax, al                                 ; 3798 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 379B _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 379F _ C7. 04 24, 000003C9
        call    io_out8                                 ; 37A6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 37AB _ 8B. 45, 10
        add     eax, 2                                  ; 37AE _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 37B1 _ 0F B6. 00
        shr     al, 2                                   ; 37B4 _ C0. E8, 02
        movzx   eax, al                                 ; 37B7 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 37BA _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 37BE _ C7. 04 24, 000003C9
        call    io_out8                                 ; 37C5 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 37CA _ 83. 45, 10, 03
        add     dword [ebp-0CH], 1                      ; 37CE _ 83. 45, F4, 01
?_208:  mov     eax, dword [ebp-0CH]                    ; 37D2 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 37D5 _ 3B. 45, 0C
        jle     ?_207                                   ; 37D8 _ 7E, 96
        mov     eax, dword [ebp-10H]                    ; 37DA _ 8B. 45, F0
        mov     dword [esp], eax                        ; 37DD _ 89. 04 24
        call    io_store_eflags                         ; 37E0 _ E8, FFFFFFFC(rel)
        nop                                             ; 37E5 _ 90
        leave                                           ; 37E6 _ C9
        ret                                             ; 37E7 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 37E8 _ 55
        mov     ebp, esp                                ; 37E9 _ 89. E5
        sub     esp, 20                                 ; 37EB _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 37EE _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 37F1 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 37F4 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 37F7 _ 89. 45, F8
        jmp     ?_212                                   ; 37FA _ EB, 33

?_209:  mov     eax, dword [ebp+14H]                    ; 37FC _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 37FF _ 89. 45, FC
        jmp     ?_211                                   ; 3802 _ EB, 1F

?_210:  mov     eax, dword [ebp-8H]                     ; 3804 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 3807 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 380B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 380D _ 8B. 45, FC
        add     eax, edx                                ; 3810 _ 01. D0
        mov     edx, eax                                ; 3812 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3814 _ 8B. 45, 08
        add     edx, eax                                ; 3817 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3819 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 381D _ 88. 02
        add     dword [ebp-4H], 1                       ; 381F _ 83. 45, FC, 01
?_211:  mov     eax, dword [ebp-4H]                     ; 3823 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 3826 _ 3B. 45, 1C
        jle     ?_210                                   ; 3829 _ 7E, D9
        add     dword [ebp-8H], 1                       ; 382B _ 83. 45, F8, 01
?_212:  mov     eax, dword [ebp-8H]                     ; 382F _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 3832 _ 3B. 45, 20
        jle     ?_209                                   ; 3835 _ 7E, C5
        leave                                           ; 3837 _ C9
        ret                                             ; 3838 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 3839 _ 55
        mov     ebp, esp                                ; 383A _ 89. E5
        sub     esp, 20                                 ; 383C _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 383F _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 3842 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 3845 _ C7. 45, FC, 00000000
        jmp     ?_222                                   ; 384C _ E9, 0000016C

?_213:  mov     edx, dword [ebp-4H]                     ; 3851 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 3854 _ 8B. 45, 1C
        add     eax, edx                                ; 3857 _ 01. D0
        movzx   eax, byte [eax]                         ; 3859 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 385C _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 385F _ 80. 7D, FB, 00
        jns     ?_214                                   ; 3863 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 3865 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 3868 _ 8B. 55, 14
        add     eax, edx                                ; 386B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 386D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3871 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3873 _ 8B. 45, 10
        add     eax, edx                                ; 3876 _ 01. D0
        mov     edx, eax                                ; 3878 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 387A _ 8B. 45, 08
        add     edx, eax                                ; 387D _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 387F _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3883 _ 88. 02
?_214:  movsx   eax, byte [ebp-5H]                      ; 3885 _ 0F BE. 45, FB
        and     eax, 40H                                ; 3889 _ 83. E0, 40
        test    eax, eax                                ; 388C _ 85. C0
        jz      ?_215                                   ; 388E _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 3890 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 3893 _ 8B. 55, 14
        add     eax, edx                                ; 3896 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3898 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 389C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 389E _ 8B. 45, 10
        add     eax, edx                                ; 38A1 _ 01. D0
        lea     edx, [eax+1H]                           ; 38A3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 38A6 _ 8B. 45, 08
        add     edx, eax                                ; 38A9 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 38AB _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 38AF _ 88. 02
?_215:  movsx   eax, byte [ebp-5H]                      ; 38B1 _ 0F BE. 45, FB
        and     eax, 20H                                ; 38B5 _ 83. E0, 20
        test    eax, eax                                ; 38B8 _ 85. C0
        jz      ?_216                                   ; 38BA _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 38BC _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 38BF _ 8B. 55, 14
        add     eax, edx                                ; 38C2 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 38C4 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 38C8 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 38CA _ 8B. 45, 10
        add     eax, edx                                ; 38CD _ 01. D0
        lea     edx, [eax+2H]                           ; 38CF _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 38D2 _ 8B. 45, 08
        add     edx, eax                                ; 38D5 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 38D7 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 38DB _ 88. 02
?_216:  movsx   eax, byte [ebp-5H]                      ; 38DD _ 0F BE. 45, FB
        and     eax, 10H                                ; 38E1 _ 83. E0, 10
        test    eax, eax                                ; 38E4 _ 85. C0
        jz      ?_217                                   ; 38E6 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 38E8 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 38EB _ 8B. 55, 14
        add     eax, edx                                ; 38EE _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 38F0 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 38F4 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 38F6 _ 8B. 45, 10
        add     eax, edx                                ; 38F9 _ 01. D0
        lea     edx, [eax+3H]                           ; 38FB _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 38FE _ 8B. 45, 08
        add     edx, eax                                ; 3901 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3903 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3907 _ 88. 02
?_217:  movsx   eax, byte [ebp-5H]                      ; 3909 _ 0F BE. 45, FB
        and     eax, 08H                                ; 390D _ 83. E0, 08
        test    eax, eax                                ; 3910 _ 85. C0
        jz      ?_218                                   ; 3912 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 3914 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 3917 _ 8B. 55, 14
        add     eax, edx                                ; 391A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 391C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3920 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3922 _ 8B. 45, 10
        add     eax, edx                                ; 3925 _ 01. D0
        lea     edx, [eax+4H]                           ; 3927 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 392A _ 8B. 45, 08
        add     edx, eax                                ; 392D _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 392F _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3933 _ 88. 02
?_218:  movsx   eax, byte [ebp-5H]                      ; 3935 _ 0F BE. 45, FB
        and     eax, 04H                                ; 3939 _ 83. E0, 04
        test    eax, eax                                ; 393C _ 85. C0
        jz      ?_219                                   ; 393E _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 3940 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 3943 _ 8B. 55, 14
        add     eax, edx                                ; 3946 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3948 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 394C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 394E _ 8B. 45, 10
        add     eax, edx                                ; 3951 _ 01. D0
        lea     edx, [eax+5H]                           ; 3953 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 3956 _ 8B. 45, 08
        add     edx, eax                                ; 3959 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 395B _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 395F _ 88. 02
?_219:  movsx   eax, byte [ebp-5H]                      ; 3961 _ 0F BE. 45, FB
        and     eax, 02H                                ; 3965 _ 83. E0, 02
        test    eax, eax                                ; 3968 _ 85. C0
        jz      ?_220                                   ; 396A _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 396C _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 396F _ 8B. 55, 14
        add     eax, edx                                ; 3972 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3974 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3978 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 397A _ 8B. 45, 10
        add     eax, edx                                ; 397D _ 01. D0
        lea     edx, [eax+6H]                           ; 397F _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 3982 _ 8B. 45, 08
        add     edx, eax                                ; 3985 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3987 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 398B _ 88. 02
?_220:  movsx   eax, byte [ebp-5H]                      ; 398D _ 0F BE. 45, FB
        and     eax, 01H                                ; 3991 _ 83. E0, 01
        test    eax, eax                                ; 3994 _ 85. C0
        jz      ?_221                                   ; 3996 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 3998 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 399B _ 8B. 55, 14
        add     eax, edx                                ; 399E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 39A0 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 39A4 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 39A6 _ 8B. 45, 10
        add     eax, edx                                ; 39A9 _ 01. D0
        lea     edx, [eax+7H]                           ; 39AB _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 39AE _ 8B. 45, 08
        add     edx, eax                                ; 39B1 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 39B3 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 39B7 _ 88. 02
?_221:  add     dword [ebp-4H], 1                       ; 39B9 _ 83. 45, FC, 01
?_222:  cmp     dword [ebp-4H], 15                      ; 39BD _ 83. 7D, FC, 0F
        jle     ?_213                                   ; 39C1 _ 0F 8E, FFFFFE8A
        leave                                           ; 39C7 _ C9
        ret                                             ; 39C8 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 39C9 _ 55
        mov     ebp, esp                                ; 39CA _ 89. E5
        sub     esp, 20                                 ; 39CC _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 39CF _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 39D2 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 39D5 _ C7. 45, F8, 00000000
        jmp     ?_229                                   ; 39DC _ E9, 000000B1

?_223:  mov     dword [ebp-4H], 0                       ; 39E1 _ C7. 45, FC, 00000000
        jmp     ?_228                                   ; 39E8 _ E9, 00000097

?_224:  mov     eax, dword [ebp-8H]                     ; 39ED _ 8B. 45, F8
        shl     eax, 4                                  ; 39F0 _ C1. E0, 04
        mov     edx, eax                                ; 39F3 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 39F5 _ 8B. 45, FC
        add     eax, edx                                ; 39F8 _ 01. D0
        add     eax, cursor.2191                        ; 39FA _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 39FF _ 0F B6. 00
        cmp     al, 42                                  ; 3A02 _ 3C, 2A
        jnz     ?_225                                   ; 3A04 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 3A06 _ 8B. 45, F8
        shl     eax, 4                                  ; 3A09 _ C1. E0, 04
        mov     edx, eax                                ; 3A0C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3A0E _ 8B. 45, FC
        add     eax, edx                                ; 3A11 _ 01. D0
        mov     edx, eax                                ; 3A13 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3A15 _ 8B. 45, 08
        add     eax, edx                                ; 3A18 _ 01. D0
        mov     byte [eax], 0                           ; 3A1A _ C6. 00, 00
?_225:  mov     eax, dword [ebp-8H]                     ; 3A1D _ 8B. 45, F8
        shl     eax, 4                                  ; 3A20 _ C1. E0, 04
        mov     edx, eax                                ; 3A23 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3A25 _ 8B. 45, FC
        add     eax, edx                                ; 3A28 _ 01. D0
        add     eax, cursor.2191                        ; 3A2A _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 3A2F _ 0F B6. 00
        cmp     al, 79                                  ; 3A32 _ 3C, 4F
        jnz     ?_226                                   ; 3A34 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 3A36 _ 8B. 45, F8
        shl     eax, 4                                  ; 3A39 _ C1. E0, 04
        mov     edx, eax                                ; 3A3C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3A3E _ 8B. 45, FC
        add     eax, edx                                ; 3A41 _ 01. D0
        mov     edx, eax                                ; 3A43 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3A45 _ 8B. 45, 08
        add     eax, edx                                ; 3A48 _ 01. D0
        mov     byte [eax], 7                           ; 3A4A _ C6. 00, 07
?_226:  mov     eax, dword [ebp-8H]                     ; 3A4D _ 8B. 45, F8
        shl     eax, 4                                  ; 3A50 _ C1. E0, 04
        mov     edx, eax                                ; 3A53 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3A55 _ 8B. 45, FC
        add     eax, edx                                ; 3A58 _ 01. D0
        add     eax, cursor.2191                        ; 3A5A _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 3A5F _ 0F B6. 00
        cmp     al, 46                                  ; 3A62 _ 3C, 2E
        jnz     ?_227                                   ; 3A64 _ 75, 1A
        mov     eax, dword [ebp-8H]                     ; 3A66 _ 8B. 45, F8
        shl     eax, 4                                  ; 3A69 _ C1. E0, 04
        mov     edx, eax                                ; 3A6C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3A6E _ 8B. 45, FC
        add     eax, edx                                ; 3A71 _ 01. D0
        mov     edx, eax                                ; 3A73 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3A75 _ 8B. 45, 08
        add     edx, eax                                ; 3A78 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3A7A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3A7E _ 88. 02
?_227:  add     dword [ebp-4H], 1                       ; 3A80 _ 83. 45, FC, 01
?_228:  cmp     dword [ebp-4H], 15                      ; 3A84 _ 83. 7D, FC, 0F
        jle     ?_224                                   ; 3A88 _ 0F 8E, FFFFFF5F
        add     dword [ebp-8H], 1                       ; 3A8E _ 83. 45, F8, 01
?_229:  cmp     dword [ebp-8H], 15                      ; 3A92 _ 83. 7D, F8, 0F
        jle     ?_223                                   ; 3A96 _ 0F 8E, FFFFFF45
        leave                                           ; 3A9C _ C9
        ret                                             ; 3A9D _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 3A9E _ 55
        mov     ebp, esp                                ; 3A9F _ 89. E5
        sub     esp, 16                                 ; 3AA1 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3AA4 _ C7. 45, F8, 00000000
        jmp     ?_233                                   ; 3AAB _ EB, 50

?_230:  mov     dword [ebp-4H], 0                       ; 3AAD _ C7. 45, FC, 00000000
        jmp     ?_232                                   ; 3AB4 _ EB, 3B

?_231:  mov     eax, dword [ebp-8H]                     ; 3AB6 _ 8B. 45, F8
        mov     edx, dword [ebp+1CH]                    ; 3AB9 _ 8B. 55, 1C
        add     eax, edx                                ; 3ABC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3ABE _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 3AC2 _ 8B. 55, FC
        mov     ecx, dword [ebp+18H]                    ; 3AC5 _ 8B. 4D, 18
        add     edx, ecx                                ; 3AC8 _ 01. CA
        add     eax, edx                                ; 3ACA _ 01. D0
        mov     edx, eax                                ; 3ACC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3ACE _ 8B. 45, 08
        add     edx, eax                                ; 3AD1 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 3AD3 _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 3AD6 _ 0F AF. 45, 24
        mov     ecx, eax                                ; 3ADA _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 3ADC _ 8B. 45, FC
        add     eax, ecx                                ; 3ADF _ 01. C8
        mov     ecx, eax                                ; 3AE1 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 3AE3 _ 8B. 45, 20
        add     eax, ecx                                ; 3AE6 _ 01. C8
        movzx   eax, byte [eax]                         ; 3AE8 _ 0F B6. 00
        mov     byte [edx], al                          ; 3AEB _ 88. 02
        add     dword [ebp-4H], 1                       ; 3AED _ 83. 45, FC, 01
?_232:  mov     eax, dword [ebp-4H]                     ; 3AF1 _ 8B. 45, FC
        cmp     eax, dword [ebp+10H]                    ; 3AF4 _ 3B. 45, 10
        jl      ?_231                                   ; 3AF7 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 3AF9 _ 83. 45, F8, 01
?_233:  mov     eax, dword [ebp-8H]                     ; 3AFD _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 3B00 _ 3B. 45, 14
        jl      ?_230                                   ; 3B03 _ 7C, A8
        leave                                           ; 3B05 _ C9
        ret                                             ; 3B06 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 3B07 _ 55
        mov     ebp, esp                                ; 3B08 _ 89. E5
        sub     esp, 40                                 ; 3B0A _ 83. EC, 28
        mov     eax, dword [bootInfo]                   ; 3B0D _ A1, 00000014(d)
        mov     dword [ebp-0CH], eax                    ; 3B12 _ 89. 45, F4
        movzx   eax, word [?_448]                       ; 3B15 _ 0F B7. 05, 00000018(d)
        cwde                                            ; 3B1C _ 98
        mov     dword [ebp-10H], eax                    ; 3B1D _ 89. 45, F0
        movzx   eax, word [?_449]                       ; 3B20 _ 0F B7. 05, 0000001A(d)
        cwde                                            ; 3B27 _ 98
        mov     dword [ebp-14H], eax                    ; 3B28 _ 89. 45, EC
        mov     dword [esp+4H], 32                      ; 3B2B _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 3B33 _ C7. 04 24, 00000020
        call    io_out8                                 ; 3B3A _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], 0                       ; 3B3F _ C6. 45, EB, 00
        mov     dword [esp], 96                         ; 3B43 _ C7. 04 24, 00000060
        call    io_in8                                  ; 3B4A _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], al                      ; 3B4F _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 3B52 _ 0F B6. 45, EB
        mov     dword [esp+4H], eax                     ; 3B56 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 3B5A _ C7. 04 24, 0000001C(d)
        call    fifo8_put                               ; 3B61 _ E8, FFFFFFFC(rel)
        nop                                             ; 3B66 _ 90
        leave                                           ; 3B67 _ C9
        ret                                             ; 3B68 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 3B69 _ 55
        mov     ebp, esp                                ; 3B6A _ 89. E5
        sub     esp, 4                                  ; 3B6C _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 3B6F _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 3B72 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 3B75 _ 80. 7D, FC, 09
        jle     ?_234                                   ; 3B79 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 3B7B _ 0F B6. 45, FC
        add     eax, 55                                 ; 3B7F _ 83. C0, 37
        jmp     ?_235                                   ; 3B82 _ EB, 07

?_234:  movzx   eax, byte [ebp-4H]                      ; 3B84 _ 0F B6. 45, FC
        add     eax, 48                                 ; 3B88 _ 83. C0, 30
?_235:  leave                                           ; 3B8B _ C9
        ret                                             ; 3B8C _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 3B8D _ 55
        mov     ebp, esp                                ; 3B8E _ 89. E5
        sub     esp, 24                                 ; 3B90 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 3B93 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 3B96 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 3B99 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 3BA0 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 3BA4 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 3BA7 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 3BAA _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 3BAE _ 89. 04 24
        call    charToHexVal                            ; 3BB1 _ E8, FFFFFFFC(rel)
        mov     byte [?_447], al                        ; 3BB6 _ A2, 00000113(d)
        movzx   eax, byte [ebp-14H]                     ; 3BBB _ 0F B6. 45, EC
        shr     al, 4                                   ; 3BBF _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 3BC2 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 3BC5 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 3BC9 _ 0F BE. C0
        mov     dword [esp], eax                        ; 3BCC _ 89. 04 24
        call    charToHexVal                            ; 3BCF _ E8, FFFFFFFC(rel)
        mov     byte [?_446], al                        ; 3BD4 _ A2, 00000112(d)
        mov     eax, keyval                             ; 3BD9 _ B8, 00000110(d)
        leave                                           ; 3BDE _ C9
        ret                                             ; 3BDF _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 3BE0 _ 55
        mov     ebp, esp                                ; 3BE1 _ 89. E5
        sub     esp, 16                                 ; 3BE3 _ 83. EC, 10
        mov     byte [str.2239], 48                     ; 3BE6 _ C6. 05, 00000374(d), 30
        mov     byte [?_452], 88                        ; 3BED _ C6. 05, 00000375(d), 58
        mov     byte [?_453], 0                         ; 3BF4 _ C6. 05, 0000037E(d), 00
        mov     dword [ebp-4H], 2                       ; 3BFB _ C7. 45, FC, 00000002
        jmp     ?_237                                   ; 3C02 _ EB, 0F

?_236:  mov     eax, dword [ebp-4H]                     ; 3C04 _ 8B. 45, FC
        add     eax, str.2239                           ; 3C07 _ 05, 00000374(d)
        mov     byte [eax], 48                          ; 3C0C _ C6. 00, 30
        add     dword [ebp-4H], 1                       ; 3C0F _ 83. 45, FC, 01
?_237:  cmp     dword [ebp-4H], 9                       ; 3C13 _ 83. 7D, FC, 09
        jle     ?_236                                   ; 3C17 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 3C19 _ C7. 45, F8, 00000009
        jmp     ?_241                                   ; 3C20 _ EB, 40

?_238:  mov     eax, dword [ebp+8H]                     ; 3C22 _ 8B. 45, 08
        and     eax, 0FH                                ; 3C25 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 3C28 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3C2B _ 8B. 45, 08
        shr     eax, 4                                  ; 3C2E _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 3C31 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 3C34 _ 83. 7D, F4, 09
        jle     ?_239                                   ; 3C38 _ 7E, 13
        mov     eax, dword [ebp-0CH]                    ; 3C3A _ 8B. 45, F4
        add     eax, 55                                 ; 3C3D _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 3C40 _ 8B. 55, F8
        add     edx, str.2239                           ; 3C43 _ 81. C2, 00000374(d)
        mov     byte [edx], al                          ; 3C49 _ 88. 02
        jmp     ?_240                                   ; 3C4B _ EB, 11

?_239:  mov     eax, dword [ebp-0CH]                    ; 3C4D _ 8B. 45, F4
        add     eax, 48                                 ; 3C50 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 3C53 _ 8B. 55, F8
        add     edx, str.2239                           ; 3C56 _ 81. C2, 00000374(d)
        mov     byte [edx], al                          ; 3C5C _ 88. 02
?_240:  sub     dword [ebp-8H], 1                       ; 3C5E _ 83. 6D, F8, 01
?_241:  cmp     dword [ebp-8H], 1                       ; 3C62 _ 83. 7D, F8, 01
        jle     ?_242                                   ; 3C66 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 3C68 _ 83. 7D, 08, 00
        jnz     ?_238                                   ; 3C6C _ 75, B4
?_242:  mov     eax, str.2239                           ; 3C6E _ B8, 00000374(d)
        leave                                           ; 3C73 _ C9
        ret                                             ; 3C74 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 3C75 _ 55
        mov     ebp, esp                                ; 3C76 _ 89. E5
        sub     esp, 24                                 ; 3C78 _ 83. EC, 18
?_243:  mov     dword [esp], 100                        ; 3C7B _ C7. 04 24, 00000064
        call    io_in8                                  ; 3C82 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 3C87 _ 83. E0, 02
        test    eax, eax                                ; 3C8A _ 85. C0
        jnz     ?_244                                   ; 3C8C _ 75, 02
        jmp     ?_245                                   ; 3C8E _ EB, 02

?_244:  jmp     ?_243                                   ; 3C90 _ EB, E9

?_245:  leave                                           ; 3C92 _ C9
        ret                                             ; 3C93 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 3C94 _ 55
        mov     ebp, esp                                ; 3C95 _ 89. E5
        sub     esp, 24                                 ; 3C97 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 3C9A _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 3C9F _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 3CA7 _ C7. 04 24, 00000064
        call    io_out8                                 ; 3CAE _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 3CB3 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 3CB8 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 3CC0 _ C7. 04 24, 00000060
        call    io_out8                                 ; 3CC7 _ E8, FFFFFFFC(rel)
        nop                                             ; 3CCC _ 90
        leave                                           ; 3CCD _ C9
        ret                                             ; 3CCE _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 3CCF _ 55
        mov     ebp, esp                                ; 3CD0 _ 89. E5
        sub     esp, 24                                 ; 3CD2 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 3CD5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 3CDA _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 3CE2 _ C7. 04 24, 00000064
        call    io_out8                                 ; 3CE9 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 3CEE _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 3CF3 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 3CFB _ C7. 04 24, 00000060
        call    io_out8                                 ; 3D02 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 3D07 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 3D0A _ C6. 40, 03, 00
        nop                                             ; 3D0E _ 90
        leave                                           ; 3D0F _ C9
        ret                                             ; 3D10 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 3D11 _ 55
        mov     ebp, esp                                ; 3D12 _ 89. E5
        sub     esp, 40                                 ; 3D14 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 3D17 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 3D1F _ C7. 04 24, 000000A0
        call    io_out8                                 ; 3D26 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 3D2B _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 3D33 _ C7. 04 24, 00000020
        call    io_out8                                 ; 3D3A _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 3D3F _ C7. 04 24, 00000060
        call    io_in8                                  ; 3D46 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 3D4B _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 3D4E _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 3D52 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 3D56 _ C7. 04 24, 00000038(d)
        call    fifo8_put                               ; 3D5D _ E8, FFFFFFFC(rel)
        leave                                           ; 3D62 _ C9
        ret                                             ; 3D63 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 3D64 _ 55
        mov     ebp, esp                                ; 3D65 _ 89. E5
        sub     esp, 4                                  ; 3D67 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 3D6A _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 3D6D _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3D70 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3D73 _ 0F B6. 40, 03
        test    al, al                                  ; 3D77 _ 84. C0
        jnz     ?_247                                   ; 3D79 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 3D7B _ 80. 7D, FC, FA
        jnz     ?_246                                   ; 3D7F _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 3D81 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 3D84 _ C6. 40, 03, 01
?_246:  mov     eax, 0                                  ; 3D88 _ B8, 00000000
        jmp     ?_254                                   ; 3D8D _ E9, 0000010F

?_247:  mov     eax, dword [ebp+8H]                     ; 3D92 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3D95 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 3D99 _ 3C, 01
        jnz     ?_249                                   ; 3D9B _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 3D9D _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 3DA1 _ 25, 000000C8
        cmp     eax, 8                                  ; 3DA6 _ 83. F8, 08
        jnz     ?_248                                   ; 3DA9 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 3DAB _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3DAE _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 3DB2 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 3DB4 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 3DB7 _ C6. 40, 03, 02
?_248:  mov     eax, 0                                  ; 3DBB _ B8, 00000000
        jmp     ?_254                                   ; 3DC0 _ E9, 000000DC

?_249:  mov     eax, dword [ebp+8H]                     ; 3DC5 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3DC8 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 3DCC _ 3C, 02
        jnz     ?_250                                   ; 3DCE _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 3DD0 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3DD3 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 3DD7 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3DDA _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 3DDD _ C6. 40, 03, 03
        mov     eax, 0                                  ; 3DE1 _ B8, 00000000
        jmp     ?_254                                   ; 3DE6 _ E9, 000000B6

?_250:  mov     eax, dword [ebp+8H]                     ; 3DEB _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3DEE _ 0F B6. 40, 03
        cmp     al, 3                                   ; 3DF2 _ 3C, 03
        jne     ?_253                                   ; 3DF4 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 3DFA _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3DFD _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 3E01 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 3E04 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 3E07 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 3E0B _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3E0E _ 0F B6. 00
        movzx   eax, al                                 ; 3E11 _ 0F B6. C0
        and     eax, 07H                                ; 3E14 _ 83. E0, 07
        mov     edx, eax                                ; 3E17 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3E19 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3E1C _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3E1F _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 3E22 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 3E26 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 3E29 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3E2C _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3E2F _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 3E32 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 3E36 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 3E39 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3E3C _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3E3F _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3E42 _ 0F B6. 00
        movzx   eax, al                                 ; 3E45 _ 0F B6. C0
        and     eax, 10H                                ; 3E48 _ 83. E0, 10
        test    eax, eax                                ; 3E4B _ 85. C0
        jz      ?_251                                   ; 3E4D _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 3E4F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3E52 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 3E55 _ 0D, FFFFFF00
        mov     edx, eax                                ; 3E5A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3E5C _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3E5F _ 89. 50, 04
?_251:  mov     eax, dword [ebp+8H]                     ; 3E62 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3E65 _ 0F B6. 00
        movzx   eax, al                                 ; 3E68 _ 0F B6. C0
        and     eax, 20H                                ; 3E6B _ 83. E0, 20
        test    eax, eax                                ; 3E6E _ 85. C0
        jz      ?_252                                   ; 3E70 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 3E72 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3E75 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 3E78 _ 0D, FFFFFF00
        mov     edx, eax                                ; 3E7D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3E7F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3E82 _ 89. 50, 08
?_252:  mov     eax, dword [ebp+8H]                     ; 3E85 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3E88 _ 8B. 40, 08
        neg     eax                                     ; 3E8B _ F7. D8
        mov     edx, eax                                ; 3E8D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3E8F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3E92 _ 89. 50, 08
        mov     eax, 1                                  ; 3E95 _ B8, 00000001
        jmp     ?_254                                   ; 3E9A _ EB, 05

?_253:  mov     eax, 4294967295                         ; 3E9C _ B8, FFFFFFFF
?_254:  leave                                           ; 3EA1 _ C9
        ret                                             ; 3EA2 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 3EA3 _ 55
        mov     ebp, esp                                ; 3EA4 _ 89. E5
        sub     esp, 72                                 ; 3EA6 _ 83. EC, 48
        mov     dword [ebp-0CH], 0                      ; 3EA9 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 3EB0 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 3EB7 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 3EBE _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 3EC5 _ 8B. 15, 00000140(d)
        mov     eax, dword [ebp+0CH]                    ; 3ECB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3ECE _ 8B. 00
        mov     dword [esp+8H], edx                     ; 3ED0 _ 89. 54 24, 08
        mov     edx, dword [ebp+1CH]                    ; 3ED4 _ 8B. 55, 1C
        mov     dword [esp+4H], edx                     ; 3ED7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3EDB _ 89. 04 24
        call    init_screen8                            ; 3EDE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+20H]                    ; 3EE3 _ 8B. 45, 20
        movsx   eax, al                                 ; 3EE6 _ 0F BE. C0
        mov     dword [esp+14H], ?_437                  ; 3EE9 _ C7. 44 24, 14, 00000070(d)
        mov     dword [esp+10H], eax                    ; 3EF1 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3EF5 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3EF8 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3EFC _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3EFF _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3F03 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3F06 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3F0A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3F0D _ 89. 04 24
        call    showString                              ; 3F10 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+18H]                    ; 3F15 _ 8B. 45, 18
        mov     dword [esp], eax                        ; 3F18 _ 89. 04 24
        call    intToHexStr                             ; 3F1B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 3F20 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 3F23 _ 8B. 45, 20
        movsx   eax, al                                 ; 3F26 _ 0F BE. C0
        mov     edx, dword [ebp-1CH]                    ; 3F29 _ 8B. 55, E4
        mov     dword [esp+14H], edx                    ; 3F2C _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3F30 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3F34 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3F37 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 3F3B _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 3F3E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3F42 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3F45 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3F49 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3F4C _ 89. 04 24
        call    showString                              ; 3F4F _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 3F54 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 3F58 _ 8B. 45, 20
        movsx   eax, al                                 ; 3F5B _ 0F BE. C0
        mov     dword [esp+14H], ?_438                  ; 3F5E _ C7. 44 24, 14, 0000007A(d)
        mov     dword [esp+10H], eax                    ; 3F66 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3F6A _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3F6D _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3F71 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3F74 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3F78 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3F7B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3F7F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3F82 _ 89. 04 24
        call    showString                              ; 3F85 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3F8A _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 3F8D _ 8B. 00
        mov     dword [esp], eax                        ; 3F8F _ 89. 04 24
        call    intToHexStr                             ; 3F92 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 3F97 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 3F9A _ 8B. 45, 20
        movsx   eax, al                                 ; 3F9D _ 0F BE. C0
        mov     edx, dword [ebp-20H]                    ; 3FA0 _ 8B. 55, E0
        mov     dword [esp+14H], edx                    ; 3FA3 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3FA7 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3FAB _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3FAE _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 3FB2 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 3FB5 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3FB9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3FBC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3FC0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3FC3 _ 89. 04 24
        call    showString                              ; 3FC6 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 3FCB _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 3FCF _ 8B. 45, 20
        movsx   eax, al                                 ; 3FD2 _ 0F BE. C0
        mov     dword [esp+14H], ?_439                  ; 3FD5 _ C7. 44 24, 14, 00000086(d)
        mov     dword [esp+10H], eax                    ; 3FDD _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3FE1 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3FE4 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3FE8 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3FEB _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3FEF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3FF2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3FF6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3FF9 _ 89. 04 24
        call    showString                              ; 3FFC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 4001 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 4004 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 4007 _ 89. 04 24
        call    intToHexStr                             ; 400A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 400F _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 4012 _ 8B. 45, 20
        movsx   eax, al                                 ; 4015 _ 0F BE. C0
        mov     edx, dword [ebp-24H]                    ; 4018 _ 8B. 55, DC
        mov     dword [esp+14H], edx                    ; 401B _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 401F _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 4023 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 4026 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 402A _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 402D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 4031 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4034 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4038 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 403B _ 89. 04 24
        call    showString                              ; 403E _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 4043 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 4047 _ 8B. 45, 20
        movsx   eax, al                                 ; 404A _ 0F BE. C0
        mov     dword [esp+14H], ?_440                  ; 404D _ C7. 44 24, 14, 00000092(d)
        mov     dword [esp+10H], eax                    ; 4055 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 4059 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 405C _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 4060 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 4063 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 4067 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 406A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 406E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4071 _ 89. 04 24
        call    showString                              ; 4074 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 4079 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 407C _ 8B. 40, 08
        mov     dword [esp], eax                        ; 407F _ 89. 04 24
        call    intToHexStr                             ; 4082 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 4087 _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 408A _ 8B. 45, 20
        movsx   eax, al                                 ; 408D _ 0F BE. C0
        mov     edx, dword [ebp-28H]                    ; 4090 _ 8B. 55, D8
        mov     dword [esp+14H], edx                    ; 4093 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 4097 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 409B _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 409E _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 40A2 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 40A5 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 40A9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 40AC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 40B0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 40B3 _ 89. 04 24
        call    showString                              ; 40B6 _ E8, FFFFFFFC(rel)
        leave                                           ; 40BB _ C9
        ret                                             ; 40BC _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 40BD _ 55
        mov     ebp, esp                                ; 40BE _ 89. E5
        sub     esp, 56                                 ; 40C0 _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 40C3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 40C6 _ 89. 04 24
        call    sheet_alloc                             ; 40C9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 40CE _ 89. 45, F4
        mov     eax, dword [memman]                     ; 40D1 _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 40D6 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 40DE _ 89. 04 24
        call    memman_alloc_4k                         ; 40E1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 40E6 _ 89. 45, F0
        mov     dword [esp+10H], -1                     ; 40E9 _ C7. 44 24, 10, FFFFFFFF
        mov     dword [esp+0CH], 68                     ; 40F1 _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 40F9 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-10H]                    ; 4101 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 4104 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 4108 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 410B _ 89. 04 24
        call    sheet_setbuf                            ; 410E _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 4113 _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 411B _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 411E _ 89. 44 24, 08
        mov     eax, dword [ebp-0CH]                    ; 4122 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 4125 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4129 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 412C _ 89. 04 24
        call    make_window8                            ; 412F _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 4134 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 413C _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 4144 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 414C _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 4154 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 415C _ 8B. 45, F4
        mov     dword [esp], eax                        ; 415F _ 89. 04 24
        call    make_textbox8                           ; 4162 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 4167 _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 416F _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-0CH]                    ; 4177 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 417A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 417E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4181 _ 89. 04 24
        call    sheet_slide                             ; 4184 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 4189 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-0CH]                    ; 4191 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 4194 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4198 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 419B _ 89. 04 24
        call    sheet_updown                            ; 419E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 41A3 _ 8B. 45, F4
        leave                                           ; 41A6 _ C9
        ret                                             ; 41A7 _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 41A8 _ 55
        mov     ebp, esp                                ; 41A9 _ 89. E5
        push    ebx                                     ; 41AB _ 53
        sub     esp, 52                                 ; 41AC _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 41AF _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 41B2 _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 41B5 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 41B8 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 41BB _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 41BE _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 41C1 _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 41C4 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 41C7 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 41CA _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 41CD _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 41D0 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 41D2 _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 41DA _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 41DE _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 41E6 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 41EE _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 41F6 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 41F9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 41FD _ 89. 04 24
        call    boxfill8                                ; 4200 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4205 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 4208 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 420B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 420E _ 8B. 00
        mov     dword [esp+18H], 1                      ; 4210 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 4218 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 421C _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 4224 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 422C _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 4234 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 4237 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 423B _ 89. 04 24
        call    boxfill8                                ; 423E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 4243 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 4246 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 4249 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 424C _ 8B. 00
        mov     dword [esp+18H], edx                    ; 424E _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 4252 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 425A _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 4262 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 426A _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 4272 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 4275 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4279 _ 89. 04 24
        call    boxfill8                                ; 427C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 4281 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 4284 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 4287 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 428A _ 8B. 00
        mov     dword [esp+18H], edx                    ; 428C _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 4290 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 4298 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 42A0 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 42A8 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 42B0 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 42B3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 42B7 _ 89. 04 24
        call    boxfill8                                ; 42BA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 42BF _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 42C2 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 42C5 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 42C8 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 42CB _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 42CE _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 42D1 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 42D4 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 42D6 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 42DA _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 42DE _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 42E6 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 42EA _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 42F2 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 42F5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 42F9 _ 89. 04 24
        call    boxfill8                                ; 42FC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 4301 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 4304 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 4307 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 430A _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 430D _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 4310 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 4313 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 4316 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 4318 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 431C _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 4320 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 4328 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 432C _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 4334 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 4337 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 433B _ 89. 04 24
        call    boxfill8                                ; 433E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 4343 _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 4346 _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 4349 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 434C _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 434F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 4352 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 4354 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 4358 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 435C _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 4364 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 436C _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 4374 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 4377 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 437B _ 89. 04 24
        call    boxfill8                                ; 437E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4383 _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 4386 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 4389 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 438C _ 8B. 00
        mov     dword [esp+18H], 20                     ; 438E _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 4396 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 439A _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 43A2 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 43AA _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-0CH]                    ; 43B2 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 43B5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 43B9 _ 89. 04 24
        call    boxfill8                                ; 43BC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 43C1 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 43C4 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 43C7 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 43CA _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 43CD _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 43D0 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 43D3 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 43D6 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 43D8 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 43DC _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 43E0 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 43E4 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 43EC _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 43F4 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 43F7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 43FB _ 89. 04 24
        call    boxfill8                                ; 43FE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 4403 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 4406 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 4409 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 440C _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 440F _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 4412 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 4415 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 4418 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 441A _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 441E _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 4422 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 4426 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 442E _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 4436 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 4439 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 443D _ 89. 04 24
        call    boxfill8                                ; 4440 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-1CH]                     ; 4445 _ 0F BE. 45, E4
        mov     dword [esp+0CH], eax                    ; 4449 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 444D _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 4450 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 4454 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4457 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 445B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 445E _ 89. 04 24
        call    make_wtitle8                            ; 4461 _ E8, FFFFFFFC(rel)
        nop                                             ; 4466 _ 90
        add     esp, 52                                 ; 4467 _ 83. C4, 34
        pop     ebx                                     ; 446A _ 5B
        pop     ebp                                     ; 446B _ 5D
        ret                                             ; 446C _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 446D _ 55
        mov     ebp, esp                                ; 446E _ 89. E5
        push    ebx                                     ; 4470 _ 53
        sub     esp, 52                                 ; 4471 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 4474 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 4477 _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 447A _ 80. 7D, E4, 00
        jz      ?_255                                   ; 447E _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 4480 _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 4484 _ C6. 45, ED, 0C
        jmp     ?_256                                   ; 4488 _ EB, 08

?_255:  mov     byte [ebp-12H], 8                       ; 448A _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 448E _ C6. 45, ED, 0F
?_256:  mov     eax, dword [ebp+0CH]                    ; 4492 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4495 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 4498 _ 8D. 58, FC
        movzx   eax, byte [ebp-13H]                     ; 449B _ 0F B6. 45, ED
        movzx   ecx, al                                 ; 449F _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 44A2 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 44A5 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 44A8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 44AB _ 8B. 00
        mov     dword [esp+18H], 20                     ; 44AD _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], ebx                    ; 44B5 _ 89. 5C 24, 14
        mov     dword [esp+10H], 3                      ; 44B9 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 44C1 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], ecx                     ; 44C9 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 44CD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 44D1 _ 89. 04 24
        call    boxfill8                                ; 44D4 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-12H]                     ; 44D9 _ 0F BE. 45, EE
        mov     edx, dword [ebp+10H]                    ; 44DD _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 44E0 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 44E4 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 44E8 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 44F0 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 44F8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 44FB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 44FF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4502 _ 89. 04 24
        call    showString                              ; 4505 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 450A _ C7. 45, F0, 00000000
        jmp     ?_264                                   ; 4511 _ E9, 00000083

?_257:  mov     dword [ebp-0CH], 0                      ; 4516 _ C7. 45, F4, 00000000
        jmp     ?_263                                   ; 451D _ EB, 70

?_258:  mov     eax, dword [ebp-10H]                    ; 451F _ 8B. 45, F0
        shl     eax, 4                                  ; 4522 _ C1. E0, 04
        mov     edx, eax                                ; 4525 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 4527 _ 8B. 45, F4
        add     eax, edx                                ; 452A _ 01. D0
        add     eax, closebtn.2310                      ; 452C _ 05, 00000280(d)
        movzx   eax, byte [eax]                         ; 4531 _ 0F B6. 00
        mov     byte [ebp-11H], al                      ; 4534 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 4537 _ 80. 7D, EF, 40
        jnz     ?_259                                   ; 453B _ 75, 06
        mov     byte [ebp-11H], 0                       ; 453D _ C6. 45, EF, 00
        jmp     ?_262                                   ; 4541 _ EB, 1C

?_259:  cmp     byte [ebp-11H], 36                      ; 4543 _ 80. 7D, EF, 24
        jnz     ?_260                                   ; 4547 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 4549 _ C6. 45, EF, 0F
        jmp     ?_262                                   ; 454D _ EB, 10

?_260:  cmp     byte [ebp-11H], 81                      ; 454F _ 80. 7D, EF, 51
        jnz     ?_261                                   ; 4553 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 4555 _ C6. 45, EF, 08
        jmp     ?_262                                   ; 4559 _ EB, 04

?_261:  mov     byte [ebp-11H], 7                       ; 455B _ C6. 45, EF, 07
?_262:  mov     eax, dword [ebp+0CH]                    ; 455F _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 4562 _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 4564 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 4567 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 456A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 456D _ 8B. 40, 04
        imul    ecx, eax                                ; 4570 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 4573 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4576 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 4579 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 457C _ 8B. 45, F4
        add     eax, ebx                                ; 457F _ 01. D8
        add     eax, ecx                                ; 4581 _ 01. C8
        add     edx, eax                                ; 4583 _ 01. C2
        movzx   eax, byte [ebp-11H]                     ; 4585 _ 0F B6. 45, EF
        mov     byte [edx], al                          ; 4589 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 458B _ 83. 45, F4, 01
?_263:  cmp     dword [ebp-0CH], 15                     ; 458F _ 83. 7D, F4, 0F
        jle     ?_258                                   ; 4593 _ 7E, 8A
        add     dword [ebp-10H], 1                      ; 4595 _ 83. 45, F0, 01
?_264:  cmp     dword [ebp-10H], 13                     ; 4599 _ 83. 7D, F0, 0D
        jle     ?_257                                   ; 459D _ 0F 8E, FFFFFF73
        add     esp, 52                                 ; 45A3 _ 83. C4, 34
        pop     ebx                                     ; 45A6 _ 5B
        pop     ebp                                     ; 45A7 _ 5D
        ret                                             ; 45A8 _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 45A9 _ 55
        mov     ebp, esp                                ; 45AA _ 89. E5
        push    edi                                     ; 45AC _ 57
        push    esi                                     ; 45AD _ 56
        push    ebx                                     ; 45AE _ 53
        sub     esp, 44                                 ; 45AF _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 45B2 _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 45B5 _ 8B. 55, 0C
        add     eax, edx                                ; 45B8 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 45BA _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 45BD _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 45C0 _ 8B. 55, 10
        add     eax, edx                                ; 45C3 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 45C5 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 45C8 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 45CB _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 45CE _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 45D1 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 45D4 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 45D7 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 45DA _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 45DD _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 45E0 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 45E3 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 45E6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 45E9 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 45EB _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 45EF _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 45F3 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 45F7 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 45FB _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 4603 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4607 _ 89. 04 24
        call    boxfill8                                ; 460A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 460F _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 4612 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 4615 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 4618 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 461B _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 461E _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 4621 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 4624 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 4627 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 462A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 462D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4630 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 4632 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 4636 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 463A _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 463E _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 4642 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 464A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 464E _ 89. 04 24
        call    boxfill8                                ; 4651 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 4656 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 4659 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 465C _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 465F _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 4662 _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 4665 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 4668 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 466B _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 466E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4671 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4674 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4677 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 4679 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 467D _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 4681 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4685 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 4689 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 4691 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4695 _ 89. 04 24
        call    boxfill8                                ; 4698 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 469D _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 46A0 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 46A3 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 46A6 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 46A9 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 46AC _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 46AF _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 46B2 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 46B5 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 46B8 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 46BB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 46BE _ 8B. 00
        mov     dword [esp+18H], edi                    ; 46C0 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 46C4 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 46C8 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 46CC _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 46D0 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 46D8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 46DC _ 89. 04 24
        call    boxfill8                                ; 46DF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 46E4 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 46E7 _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 46EA _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 46ED _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 46F0 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 46F3 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 46F6 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 46F9 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 46FC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 46FF _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 4701 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 4705 _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 4708 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 470C _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 4710 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 4714 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 471C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4720 _ 89. 04 24
        call    boxfill8                                ; 4723 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4728 _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 472B _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 472E _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 4731 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 4734 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 4737 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 473A _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 473D _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4740 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4743 _ 8B. 00
        mov     ecx, dword [ebp-14H]                    ; 4745 _ 8B. 4D, EC
        mov     dword [esp+18H], ecx                    ; 4748 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 474C _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 4750 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 4754 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 4758 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 4760 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4764 _ 89. 04 24
        call    boxfill8                                ; 4767 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 476C _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 476F _ 8D. 48, 01
        mov     eax, dword [ebp-14H]                    ; 4772 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 4775 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 4778 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 477B _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 477E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4781 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4784 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4787 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 4789 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 478D _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 4790 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 4794 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 4798 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 479C _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 47A4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 47A8 _ 89. 04 24
        call    boxfill8                                ; 47AB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 47B0 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 47B3 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 47B6 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 47B9 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 47BC _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 47BF _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 47C2 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 47C5 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 47C8 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 47CB _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 47CE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 47D1 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 47D3 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 47D7 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 47DB _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 47DF _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 47E3 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 47EB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 47EF _ 89. 04 24
        call    boxfill8                                ; 47F2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 47F7 _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 47FA _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 47FD _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 4800 _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 4803 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 4806 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 4809 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 480C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 480F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4812 _ 8B. 00
        mov     ebx, dword [ebp-14H]                    ; 4814 _ 8B. 5D, EC
        mov     dword [esp+18H], ebx                    ; 4817 _ 89. 5C 24, 18
        mov     ebx, dword [ebp-10H]                    ; 481B _ 8B. 5D, F0
        mov     dword [esp+14H], ebx                    ; 481E _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 4822 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 4826 _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 482A _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 482E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4832 _ 89. 04 24
        call    boxfill8                                ; 4835 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 483A _ 83. C4, 2C
        pop     ebx                                     ; 483D _ 5B
        pop     esi                                     ; 483E _ 5E
        pop     edi                                     ; 483F _ 5F
        pop     ebp                                     ; 4840 _ 5D
        ret                                             ; 4841 _ C3
; make_textbox8 End of function

file_loadfile:; Function begin
        push    ebp                                     ; 4842 _ 55
        mov     ebp, esp                                ; 4843 _ 89. E5
        sub     esp, 56                                 ; 4845 _ 83. EC, 38
        mov     dword [ebp-0CH], 88064                  ; 4848 _ C7. 45, F4, 00015800
        mov     eax, dword [memman]                     ; 484F _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 4854 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 485C _ 89. 04 24
        call    memman_alloc                            ; 485F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 4864 _ 89. 45, E4
        jmp     ?_277                                   ; 4867 _ E9, 0000013C

?_265:  mov     dword [ebp-10H], 0                      ; 486C _ C7. 45, F0, 00000000
        jmp     ?_267                                   ; 4873 _ EB, 0F

?_266:  mov     edx, dword [ebp-10H]                    ; 4875 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 4878 _ 8B. 45, E4
        add     eax, edx                                ; 487B _ 01. D0
        mov     byte [eax], 0                           ; 487D _ C6. 00, 00
        add     dword [ebp-10H], 1                      ; 4880 _ 83. 45, F0, 01
?_267:  cmp     dword [ebp-10H], 11                     ; 4884 _ 83. 7D, F0, 0B
        jle     ?_266                                   ; 4888 _ 7E, EB
        mov     dword [ebp-10H], 0                      ; 488A _ C7. 45, F0, 00000000
        jmp     ?_270                                   ; 4891 _ EB, 2C

?_268:  mov     edx, dword [ebp-0CH]                    ; 4893 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 4896 _ 8B. 45, F0
        add     eax, edx                                ; 4899 _ 01. D0
        movzx   eax, byte [eax]                         ; 489B _ 0F B6. 00
        test    al, al                                  ; 489E _ 84. C0
        jz      ?_269                                   ; 48A0 _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 48A2 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 48A5 _ 8B. 45, E4
        add     edx, eax                                ; 48A8 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 48AA _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 48AD _ 8B. 45, F0
        add     eax, ecx                                ; 48B0 _ 01. C8
        movzx   eax, byte [eax]                         ; 48B2 _ 0F B6. 00
        mov     byte [edx], al                          ; 48B5 _ 88. 02
        add     dword [ebp-10H], 1                      ; 48B7 _ 83. 45, F0, 01
        jmp     ?_270                                   ; 48BB _ EB, 02

?_269:  jmp     ?_271                                   ; 48BD _ EB, 06

?_270:  cmp     dword [ebp-10H], 7                      ; 48BF _ 83. 7D, F0, 07
        jle     ?_268                                   ; 48C3 _ 7E, CE
?_271:  mov     dword [ebp-14H], 0                      ; 48C5 _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 48CC _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 48CF _ 8B. 45, E4
        add     eax, edx                                ; 48D2 _ 01. D0
        mov     byte [eax], 46                          ; 48D4 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 48D7 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 48DB _ C7. 45, EC, 00000000
        jmp     ?_273                                   ; 48E2 _ EB, 1E

?_272:  mov     edx, dword [ebp-10H]                    ; 48E4 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 48E7 _ 8B. 45, E4
        add     edx, eax                                ; 48EA _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 48EC _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 48EF _ 8B. 45, EC
        add     eax, ecx                                ; 48F2 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 48F4 _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 48F8 _ 88. 02
        add     dword [ebp-10H], 1                      ; 48FA _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 48FE _ 83. 45, EC, 01
?_273:  cmp     dword [ebp-14H], 2                      ; 4902 _ 83. 7D, EC, 02
        jle     ?_272                                   ; 4906 _ 7E, DC
        mov     eax, dword [ebp-1CH]                    ; 4908 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 490B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 490F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4912 _ 89. 04 24
        call    strcmp                                  ; 4915 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 491A _ 83. F8, 01
        jne     ?_276                                   ; 491D _ 0F 85, 00000081
        mov     eax, dword [ebp-0CH]                    ; 4923 _ 8B. 45, F4
        mov     edx, dword [eax+1CH]                    ; 4926 _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 4929 _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 492E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4932 _ 89. 04 24
        call    memman_alloc_4k                         ; 4935 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 493A _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 493C _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 493F _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 4941 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 4944 _ 8B. 40, 1C
        mov     edx, eax                                ; 4947 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 4949 _ 8B. 45, 0C
        mov     dword [eax+8H], edx                     ; 494C _ 89. 50, 08
        mov     dword [ebp-20H], 97280                  ; 494F _ C7. 45, E0, 00017C00
        mov     eax, dword [ebp-0CH]                    ; 4956 _ 8B. 45, F4
        movzx   eax, word [eax+1AH]                     ; 4959 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 495D _ 0F B7. C0
        shl     eax, 9                                  ; 4960 _ C1. E0, 09
        add     dword [ebp-20H], eax                    ; 4963 _ 01. 45, E0
        mov     eax, dword [ebp-0CH]                    ; 4966 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 4969 _ 8B. 40, 1C
        mov     dword [ebp-24H], eax                    ; 496C _ 89. 45, DC
        mov     dword [ebp-18H], 0                      ; 496F _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 4976 _ C7. 45, E8, 00000000
        jmp     ?_275                                   ; 497D _ EB, 1B

?_274:  mov     eax, dword [ebp+0CH]                    ; 497F _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 4982 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 4984 _ 8B. 45, E8
        add     edx, eax                                ; 4987 _ 01. C2
        mov     ecx, dword [ebp-18H]                    ; 4989 _ 8B. 4D, E8
        mov     eax, dword [ebp-20H]                    ; 498C _ 8B. 45, E0
        add     eax, ecx                                ; 498F _ 01. C8
        movzx   eax, byte [eax]                         ; 4991 _ 0F B6. 00
        mov     byte [edx], al                          ; 4994 _ 88. 02
        add     dword [ebp-18H], 1                      ; 4996 _ 83. 45, E8, 01
?_275:  mov     eax, dword [ebp-18H]                    ; 499A _ 8B. 45, E8
        cmp     eax, dword [ebp-24H]                    ; 499D _ 3B. 45, DC
        jl      ?_274                                   ; 49A0 _ 7C, DD
        jmp     ?_278                                   ; 49A2 _ EB, 12

?_276:  add     dword [ebp-0CH], 32                     ; 49A4 _ 83. 45, F4, 20
?_277:  mov     eax, dword [ebp-0CH]                    ; 49A8 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 49AB _ 0F B6. 00
        test    al, al                                  ; 49AE _ 84. C0
        jne     ?_265                                   ; 49B0 _ 0F 85, FFFFFEB6
?_278:  mov     edx, dword [ebp-1CH]                    ; 49B6 _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 49B9 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 49BE _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 49C6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 49CA _ 89. 04 24
        call    memman_free                             ; 49CD _ E8, FFFFFFFC(rel)
        leave                                           ; 49D2 _ C9
        ret                                             ; 49D3 _ C3
; file_loadfile End of function

intHandlerForStackOverFlow:; Function begin
        push    ebp                                     ; 49D4 _ 55
        mov     ebp, esp                                ; 49D5 _ 89. E5
        sub     esp, 40                                 ; 49D7 _ 83. EC, 28
        call    task_now                                ; 49DA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 49DF _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 49E2 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 49E5 _ C7. 80, 00000098, 00000008
        mov     dword [esp], ?_441                      ; 49EF _ C7. 04 24, 0000009E(d)
        call    cons_putstr                             ; 49F6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 49FB _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 49FE _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 4A08 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 4A0B _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4A11 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4A14 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 4A17 _ 89. 90, 0000009C
        mov     dword [esp], ?_442                      ; 4A1D _ C7. 04 24, 000000A5(d)
        call    cons_putstr                             ; 4A24 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4A29 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4A2C _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 4A36 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 4A39 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4A3F _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4A42 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 4A45 _ 89. 90, 0000009C
        mov     eax, dword [ebp+8H]                     ; 4A4B _ 8B. 45, 08
        add     eax, 44                                 ; 4A4E _ 83. C0, 2C
        mov     eax, dword [eax]                        ; 4A51 _ 8B. 00
        mov     dword [esp], eax                        ; 4A53 _ 89. 04 24
        call    intToHexStr                             ; 4A56 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 4A5B _ 89. 45, F0
        mov     dword [esp], ?_443                      ; 4A5E _ C7. 04 24, 000000B5(d)
        call    cons_putstr                             ; 4A65 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 4A6A _ 8B. 45, F0
        mov     dword [esp], eax                        ; 4A6D _ 89. 04 24
        call    cons_putstr                             ; 4A70 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4A75 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4A78 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 4A82 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 4A85 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4A8B _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4A8E _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 4A91 _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 4A97 _ 8B. 45, F4
        add     eax, 48                                 ; 4A9A _ 83. C0, 30
        leave                                           ; 4A9D _ C9
        ret                                             ; 4A9E _ C3
; intHandlerForStackOverFlow End of function

intHandlerForException:; Function begin
        push    ebp                                     ; 4A9F _ 55
        mov     ebp, esp                                ; 4AA0 _ 89. E5
        sub     esp, 40                                 ; 4AA2 _ 83. EC, 28
        call    task_now                                ; 4AA5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4AAA _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4AAD _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4AB0 _ C7. 80, 00000098, 00000008
        mov     dword [esp], ?_444                      ; 4ABA _ C7. 04 24, 000000BC(d)
        call    cons_putstr                             ; 4AC1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4AC6 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4AC9 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 4AD3 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 4AD6 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4ADC _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4ADF _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 4AE2 _ 89. 90, 0000009C
        mov     dword [esp], ?_445                      ; 4AE8 _ C7. 04 24, 000000C4(d)
        call    cons_putstr                             ; 4AEF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4AF4 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 4AF7 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4AFD _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4B00 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 4B03 _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 4B09 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4B0C _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 4B16 _ 8B. 45, F4
        add     eax, 48                                 ; 4B19 _ 83. C0, 30
        leave                                           ; 4B1C _ C9
        ret                                             ; 4B1D _ C3
; intHandlerForException End of function

memman_init:; Function begin
        push    ebp                                     ; 4B1E _ 55
        mov     ebp, esp                                ; 4B1F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4B21 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 4B24 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 4B2A _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4B2D _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 4B34 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 4B37 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 4B3E _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 4B41 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 4B48 _ 5D
        ret                                             ; 4B49 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 4B4A _ 55
        mov     ebp, esp                                ; 4B4B _ 89. E5
        sub     esp, 16                                 ; 4B4D _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4B50 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 4B57 _ C7. 45, F8, 00000000
        jmp     ?_280                                   ; 4B5E _ EB, 14

?_279:  mov     eax, dword [ebp+8H]                     ; 4B60 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 4B63 _ 8B. 55, F8
        add     edx, 2                                  ; 4B66 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4B69 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 4B6D _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 4B70 _ 83. 45, F8, 01
?_280:  mov     eax, dword [ebp+8H]                     ; 4B74 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4B77 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4B79 _ 3B. 45, F8
        ja      ?_279                                   ; 4B7C _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 4B7E _ 8B. 45, FC
        leave                                           ; 4B81 _ C9
        ret                                             ; 4B82 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 4B83 _ 55
        mov     ebp, esp                                ; 4B84 _ 89. E5
        push    ebx                                     ; 4B86 _ 53
        sub     esp, 16                                 ; 4B87 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 4B8A _ C7. 45, F4, 00000000
        jmp     ?_286                                   ; 4B91 _ E9, 000000BD

?_281:  mov     eax, dword [ebp+8H]                     ; 4B96 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4B99 _ 8B. 55, F4
        add     edx, 2                                  ; 4B9C _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4B9F _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 4BA3 _ 3B. 45, 0C
        jc      ?_285                                   ; 4BA6 _ 0F 82, 000000A3
        mov     eax, dword [ebp+8H]                     ; 4BAC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4BAF _ 8B. 55, F4
        add     edx, 2                                  ; 4BB2 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 4BB5 _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 4BB8 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 4BBB _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4BBE _ 8B. 55, F4
        add     edx, 2                                  ; 4BC1 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 4BC4 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 4BC7 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 4BCA _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4BCD _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4BD0 _ 8B. 55, F4
        add     edx, 2                                  ; 4BD3 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 4BD6 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 4BD9 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4BDC _ 8B. 55, F4
        add     edx, 2                                  ; 4BDF _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4BE2 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 4BE6 _ 2B. 45, 0C
        mov     edx, eax                                ; 4BE9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4BEB _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 4BEE _ 8B. 4D, F4
        add     ecx, 2                                  ; 4BF1 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 4BF4 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 4BF8 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4BFB _ 8B. 55, F4
        add     edx, 2                                  ; 4BFE _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4C01 _ 8B. 44 D0, 04
        test    eax, eax                                ; 4C05 _ 85. C0
        jnz     ?_284                                   ; 4C07 _ 75, 41
        mov     eax, dword [ebp+8H]                     ; 4C09 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4C0C _ 8B. 00
        lea     edx, [eax-1H]                           ; 4C0E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4C11 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 4C14 _ 89. 10
        jmp     ?_283                                   ; 4C16 _ EB, 28

?_282:  mov     eax, dword [ebp-0CH]                    ; 4C18 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 4C1B _ 8D. 50, 01
        mov     ecx, dword [ebp+8H]                     ; 4C1E _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 4C21 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 4C24 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 4C27 _ 8B. 45, 08
        add     edx, 2                                  ; 4C2A _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 4C2D _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 4C30 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 4C32 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 4C35 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 4C38 _ 89. 54 D9, 04
        add     dword [ebp-0CH], 1                      ; 4C3C _ 83. 45, F4, 01
?_283:  mov     eax, dword [ebp+8H]                     ; 4C40 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4C43 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4C45 _ 3B. 45, F4
        ja      ?_282                                   ; 4C48 _ 77, CE
?_284:  mov     eax, dword [ebp-8H]                     ; 4C4A _ 8B. 45, F8
        jmp     ?_287                                   ; 4C4D _ EB, 17

?_285:  add     dword [ebp-0CH], 1                      ; 4C4F _ 83. 45, F4, 01
?_286:  mov     eax, dword [ebp+8H]                     ; 4C53 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4C56 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4C58 _ 3B. 45, F4
        ja      ?_281                                   ; 4C5B _ 0F 87, FFFFFF35
        mov     eax, 0                                  ; 4C61 _ B8, 00000000
?_287:  add     esp, 16                                 ; 4C66 _ 83. C4, 10
        pop     ebx                                     ; 4C69 _ 5B
        pop     ebp                                     ; 4C6A _ 5D
        ret                                             ; 4C6B _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 4C6C _ 55
        mov     ebp, esp                                ; 4C6D _ 89. E5
        push    ebx                                     ; 4C6F _ 53
        sub     esp, 16                                 ; 4C70 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 4C73 _ C7. 45, F4, 00000000
        jmp     ?_290                                   ; 4C7A _ EB, 17

?_288:  mov     eax, dword [ebp+8H]                     ; 4C7C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4C7F _ 8B. 55, F4
        add     edx, 2                                  ; 4C82 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 4C85 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 4C88 _ 3B. 45, 0C
        jbe     ?_289                                   ; 4C8B _ 76, 02
        jmp     ?_291                                   ; 4C8D _ EB, 0E

?_289:  add     dword [ebp-0CH], 1                      ; 4C8F _ 83. 45, F4, 01
?_290:  mov     eax, dword [ebp+8H]                     ; 4C93 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4C96 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4C98 _ 3B. 45, F4
        jg      ?_288                                   ; 4C9B _ 7F, DF
?_291:  cmp     dword [ebp-0CH], 0                      ; 4C9D _ 83. 7D, F4, 00
        jle     ?_295                                   ; 4CA1 _ 0F 8E, 000000F2
        mov     eax, dword [ebp-0CH]                    ; 4CA7 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 4CAA _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4CAD _ 8B. 45, 08
        add     edx, 2                                  ; 4CB0 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 4CB3 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 4CB6 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 4CB9 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 4CBC _ 8B. 45, 08
        add     ecx, 2                                  ; 4CBF _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 4CC2 _ 8B. 44 C8, 04
        add     eax, edx                                ; 4CC6 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 4CC8 _ 3B. 45, 0C
        jne     ?_295                                   ; 4CCB _ 0F 85, 000000C8
        mov     eax, dword [ebp-0CH]                    ; 4CD1 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 4CD4 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 4CD7 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 4CDA _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4CDD _ 8B. 45, 08
        add     edx, 2                                  ; 4CE0 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 4CE3 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 4CE7 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 4CEA _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4CED _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 4CF0 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 4CF3 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 4CF7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4CFA _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4CFC _ 3B. 45, F4
        jle     ?_294                                   ; 4CFF _ 0F 8E, 0000008A
        mov     eax, dword [ebp+10H]                    ; 4D05 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 4D08 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 4D0B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4D0E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4D11 _ 8B. 55, F4
        add     edx, 2                                  ; 4D14 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 4D17 _ 8B. 04 D0
        cmp     ecx, eax                                ; 4D1A _ 39. C1
        jnz     ?_294                                   ; 4D1C _ 75, 71
        mov     eax, dword [ebp-0CH]                    ; 4D1E _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 4D21 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 4D24 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 4D27 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4D2A _ 8B. 45, 08
        add     edx, 2                                  ; 4D2D _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 4D30 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 4D34 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 4D37 _ 8B. 4D, F4
        add     ecx, 2                                  ; 4D3A _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 4D3D _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 4D41 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4D44 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 4D47 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 4D4A _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 4D4E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4D51 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4D53 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4D56 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 4D59 _ 89. 10
        jmp     ?_293                                   ; 4D5B _ EB, 28

?_292:  mov     eax, dword [ebp-0CH]                    ; 4D5D _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 4D60 _ 8D. 50, 01
        mov     ecx, dword [ebp+8H]                     ; 4D63 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 4D66 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 4D69 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 4D6C _ 8B. 45, 08
        add     edx, 2                                  ; 4D6F _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 4D72 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 4D75 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 4D77 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 4D7A _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 4D7D _ 89. 54 D9, 04
        add     dword [ebp-0CH], 1                      ; 4D81 _ 83. 45, F4, 01
?_293:  mov     eax, dword [ebp+8H]                     ; 4D85 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4D88 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4D8A _ 3B. 45, F4
        jg      ?_292                                   ; 4D8D _ 7F, CE
?_294:  mov     eax, 0                                  ; 4D8F _ B8, 00000000
        jmp     ?_301                                   ; 4D94 _ E9, 0000011C

?_295:  mov     eax, dword [ebp+8H]                     ; 4D99 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4D9C _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4D9E _ 3B. 45, F4
        jle     ?_296                                   ; 4DA1 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 4DA3 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 4DA6 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 4DA9 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4DAC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4DAF _ 8B. 55, F4
        add     edx, 2                                  ; 4DB2 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 4DB5 _ 8B. 04 D0
        cmp     ecx, eax                                ; 4DB8 _ 39. C1
        jnz     ?_296                                   ; 4DBA _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 4DBC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4DBF _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 4DC2 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 4DC5 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 4DC8 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 4DCB _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4DCE _ 8B. 55, F4
        add     edx, 2                                  ; 4DD1 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 4DD4 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 4DD8 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 4DDB _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4DDE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4DE1 _ 8B. 55, F4
        add     edx, 2                                  ; 4DE4 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 4DE7 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 4DEB _ B8, 00000000
        jmp     ?_301                                   ; 4DF0 _ E9, 000000C0

?_296:  mov     eax, dword [ebp+8H]                     ; 4DF5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4DF8 _ 8B. 00
        cmp     eax, 4095                               ; 4DFA _ 3D, 00000FFF
        jg      ?_300                                   ; 4DFF _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 4E05 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4E08 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 4E0A _ 89. 45, F8
        jmp     ?_298                                   ; 4E0D _ EB, 28

?_297:  mov     eax, dword [ebp-8H]                     ; 4E0F _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 4E12 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 4E15 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 4E18 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 4E1B _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 4E1E _ 8B. 45, 08
        add     edx, 2                                  ; 4E21 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 4E24 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 4E27 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 4E29 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 4E2C _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 4E2F _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 4E33 _ 83. 6D, F8, 01
?_298:  mov     eax, dword [ebp-8H]                     ; 4E37 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 4E3A _ 3B. 45, F4
        jg      ?_297                                   ; 4E3D _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 4E3F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4E42 _ 8B. 00
        lea     edx, [eax+1H]                           ; 4E44 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4E47 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 4E4A _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4E4C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4E4F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4E52 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4E55 _ 8B. 00
        cmp     edx, eax                                ; 4E57 _ 39. C2
        jge     ?_299                                   ; 4E59 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 4E5B _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 4E5E _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 4E60 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 4E63 _ 89. 50, 04
?_299:  mov     eax, dword [ebp+8H]                     ; 4E66 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4E69 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 4E6C _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 4E6F _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 4E72 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 4E75 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4E78 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 4E7B _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 4E7E _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 4E81 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 4E85 _ B8, 00000000
        jmp     ?_301                                   ; 4E8A _ EB, 29

?_300:  mov     eax, dword [ebp+8H]                     ; 4E8C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4E8F _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 4E92 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4E95 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 4E98 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4E9B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4E9E _ 8B. 40, 08
        mov     edx, eax                                ; 4EA1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 4EA3 _ 8B. 45, 10
        add     eax, edx                                ; 4EA6 _ 01. D0
        mov     edx, eax                                ; 4EA8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4EAA _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 4EAD _ 89. 50, 08
        mov     eax, 4294967295                         ; 4EB0 _ B8, FFFFFFFF
?_301:  add     esp, 16                                 ; 4EB5 _ 83. C4, 10
        pop     ebx                                     ; 4EB8 _ 5B
        pop     ebp                                     ; 4EB9 _ 5D
        ret                                             ; 4EBA _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 4EBB _ 55
        mov     ebp, esp                                ; 4EBC _ 89. E5
        sub     esp, 24                                 ; 4EBE _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 4EC1 _ 8B. 45, 0C
        add     eax, 4095                               ; 4EC4 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 4EC9 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 4ECE _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 4ED1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4ED4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4ED8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4EDB _ 89. 04 24
        call    memman_alloc                            ; 4EDE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 4EE3 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4EE6 _ 8B. 45, FC
        leave                                           ; 4EE9 _ C9
        ret                                             ; 4EEA _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 4EEB _ 55
        mov     ebp, esp                                ; 4EEC _ 89. E5
        sub     esp, 28                                 ; 4EEE _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 4EF1 _ 8B. 45, 10
        add     eax, 4095                               ; 4EF4 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 4EF9 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 4EFE _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 4F01 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 4F04 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 4F08 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4F0B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4F0F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4F12 _ 89. 04 24
        call    memman_free                             ; 4F15 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 4F1A _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4F1D _ 8B. 45, FC
        leave                                           ; 4F20 _ C9
        ret                                             ; 4F21 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 4F22 _ 55
        mov     ebp, esp                                ; 4F23 _ 89. E5
        sub     esp, 40                                 ; 4F25 _ 83. EC, 28
        mov     dword [esp+4H], 9232                    ; 4F28 _ C7. 44 24, 04, 00002410
        mov     eax, dword [ebp+8H]                     ; 4F30 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4F33 _ 89. 04 24
        call    memman_alloc_4k                         ; 4F36 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4F3B _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 4F3E _ 83. 7D, F4, 00
        jnz     ?_302                                   ; 4F42 _ 75, 0A
        mov     eax, 0                                  ; 4F44 _ B8, 00000000
        jmp     ?_306                                   ; 4F49 _ E9, 000000C0

?_302:  mov     eax, dword [ebp+10H]                    ; 4F4E _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 4F51 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 4F55 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4F59 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4F5C _ 89. 04 24
        call    memman_alloc_4k                         ; 4F5F _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 4F64 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 4F66 _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 4F69 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 4F6C _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 4F6F _ 8B. 40, 04
        test    eax, eax                                ; 4F72 _ 85. C0
        jnz     ?_303                                   ; 4F74 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 4F76 _ 8B. 45, F4
        mov     dword [esp+8H], 9232                    ; 4F79 _ C7. 44 24, 08, 00002410
        mov     dword [esp+4H], eax                     ; 4F81 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4F85 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4F88 _ 89. 04 24
        call    memman_free_4k                          ; 4F8B _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 4F90 _ B8, 00000000
        jmp     ?_306                                   ; 4F95 _ EB, 77

?_303:  mov     eax, dword [ebp-0CH]                    ; 4F97 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 4F9A _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4F9D _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 4F9F _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 4FA2 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 4FA5 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4FA8 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 4FAB _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 4FAE _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 4FB1 _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 4FB4 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 4FBB _ C7. 45, F0, 00000000
        jmp     ?_305                                   ; 4FC2 _ EB, 3E

?_304:  mov     ecx, dword [ebp-0CH]                    ; 4FC4 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 4FC7 _ 8B. 55, F0
        mov     eax, edx                                ; 4FCA _ 89. D0
        shl     eax, 3                                  ; 4FCC _ C1. E0, 03
        add     eax, edx                                ; 4FCF _ 01. D0
        shl     eax, 2                                  ; 4FD1 _ C1. E0, 02
        add     eax, ecx                                ; 4FD4 _ 01. C8
        add     eax, 1072                               ; 4FD6 _ 05, 00000430
        mov     dword [eax], 0                          ; 4FDB _ C7. 00, 00000000
        mov     ecx, dword [ebp-0CH]                    ; 4FE1 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 4FE4 _ 8B. 55, F0
        mov     eax, edx                                ; 4FE7 _ 89. D0
        shl     eax, 3                                  ; 4FE9 _ C1. E0, 03
        add     eax, edx                                ; 4FEC _ 01. D0
        shl     eax, 2                                  ; 4FEE _ C1. E0, 02
        add     eax, ecx                                ; 4FF1 _ 01. C8
        add     eax, 1076                               ; 4FF3 _ 05, 00000434
        mov     dword [eax], 0                          ; 4FF8 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 4FFE _ 83. 45, F0, 01
?_305:  cmp     dword [ebp-10H], 255                    ; 5002 _ 81. 7D, F0, 000000FF
        jle     ?_304                                   ; 5009 _ 7E, B9
        mov     eax, dword [ebp-0CH]                    ; 500B _ 8B. 45, F4
?_306:  leave                                           ; 500E _ C9
        ret                                             ; 500F _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 5010 _ 55
        mov     ebp, esp                                ; 5011 _ 89. E5
        sub     esp, 24                                 ; 5013 _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 5016 _ C7. 45, F0, 00000000
        jmp     ?_309                                   ; 501D _ EB, 63

?_307:  mov     ecx, dword [ebp+8H]                     ; 501F _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 5022 _ 8B. 55, F0
        mov     eax, edx                                ; 5025 _ 89. D0
        shl     eax, 3                                  ; 5027 _ C1. E0, 03
        add     eax, edx                                ; 502A _ 01. D0
        shl     eax, 2                                  ; 502C _ C1. E0, 02
        add     eax, ecx                                ; 502F _ 01. C8
        add     eax, 1072                               ; 5031 _ 05, 00000430
        mov     eax, dword [eax]                        ; 5036 _ 8B. 00
        test    eax, eax                                ; 5038 _ 85. C0
        jnz     ?_308                                   ; 503A _ 75, 42
        mov     edx, dword [ebp-10H]                    ; 503C _ 8B. 55, F0
        mov     eax, edx                                ; 503F _ 89. D0
        shl     eax, 3                                  ; 5041 _ C1. E0, 03
        add     eax, edx                                ; 5044 _ 01. D0
        shl     eax, 2                                  ; 5046 _ C1. E0, 02
        lea     edx, [eax+410H]                         ; 5049 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 504F _ 8B. 45, 08
        add     eax, edx                                ; 5052 _ 01. D0
        add     eax, 4                                  ; 5054 _ 83. C0, 04
        mov     dword [ebp-0CH], eax                    ; 5057 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 505A _ 8B. 45, F4
        mov     dword [eax+1CH], 1                      ; 505D _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-0CH]                    ; 5064 _ 8B. 45, F4
        mov     dword [eax+18H], -1                     ; 5067 _ C7. 40, 18, FFFFFFFF
        call    task_now                                ; 506E _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-0CH]                    ; 5073 _ 8B. 55, F4
        mov     dword [edx+20H], eax                    ; 5076 _ 89. 42, 20
        mov     eax, dword [ebp-0CH]                    ; 5079 _ 8B. 45, F4
        jmp     ?_310                                   ; 507C _ EB, 12

?_308:  add     dword [ebp-10H], 1                      ; 507E _ 83. 45, F0, 01
?_309:  cmp     dword [ebp-10H], 255                    ; 5082 _ 81. 7D, F0, 000000FF
        jle     ?_307                                   ; 5089 _ 7E, 94
        mov     eax, 0                                  ; 508B _ B8, 00000000
?_310:  leave                                           ; 5090 _ C9
        ret                                             ; 5091 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 5092 _ 55
        mov     ebp, esp                                ; 5093 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 5095 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5098 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 509B _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 509D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 50A0 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 50A3 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 50A6 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 50A9 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 50AC _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 50AF _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 50B2 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 50B5 _ 89. 50, 14
        nop                                             ; 50B8 _ 90
        pop     ebp                                     ; 50B9 _ 5D
        ret                                             ; 50BA _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 50BB _ 55
        mov     ebp, esp                                ; 50BC _ 89. E5
        push    edi                                     ; 50BE _ 57
        push    esi                                     ; 50BF _ 56
        push    ebx                                     ; 50C0 _ 53
        sub     esp, 60                                 ; 50C1 _ 83. EC, 3C
        mov     eax, dword [ebp+0CH]                    ; 50C4 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 50C7 _ 8B. 40, 18
        mov     dword [ebp-1CH], eax                    ; 50CA _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 50CD _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 50D0 _ 8B. 40, 10
        add     eax, 1                                  ; 50D3 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 50D6 _ 3B. 45, 10
        jge     ?_311                                   ; 50D9 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 50DB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 50DE _ 8B. 40, 10
        add     eax, 1                                  ; 50E1 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 50E4 _ 89. 45, 10
?_311:  cmp     dword [ebp+10H], -1                     ; 50E7 _ 83. 7D, 10, FF
        jge     ?_312                                   ; 50EB _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 50ED _ C7. 45, 10, FFFFFFFF
?_312:  mov     eax, dword [ebp+0CH]                    ; 50F4 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 50F7 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 50FA _ 89. 50, 18
        mov     eax, dword [ebp-1CH]                    ; 50FD _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 5100 _ 3B. 45, 10
        jle     ?_319                                   ; 5103 _ 0F 8E, 00000212
        cmp     dword [ebp+10H], 0                      ; 5109 _ 83. 7D, 10, 00
        js      ?_315                                   ; 510D _ 0F 88, 000000FE
        mov     eax, dword [ebp-1CH]                    ; 5113 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 5116 _ 89. 45, E0
        jmp     ?_314                                   ; 5119 _ EB, 34

?_313:  mov     eax, dword [ebp-20H]                    ; 511B _ 8B. 45, E0
        lea     edx, [eax-1H]                           ; 511E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 5121 _ 8B. 45, 08
        add     edx, 4                                  ; 5124 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 5127 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 512B _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 512E _ 8B. 4D, E0
        add     ecx, 4                                  ; 5131 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 5134 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 5138 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 513B _ 8B. 55, E0
        add     edx, 4                                  ; 513E _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 5141 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 5145 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 5148 _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 514B _ 83. 6D, E0, 01
?_314:  mov     eax, dword [ebp-20H]                    ; 514F _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 5152 _ 3B. 45, 10
        jg      ?_313                                   ; 5155 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 5157 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 515A _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 515D _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 5160 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 5163 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 5167 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 516A _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 516D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 5170 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5173 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 5176 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 5179 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 517C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 517F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 5182 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 5185 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 5188 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 518B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 518E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5191 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 5194 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 5197 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 519B _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 519F _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 51A3 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 51A7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 51AB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 51AE _ 89. 04 24
        call    sheet_refreshmap                        ; 51B1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 51B6 _ 8B. 45, 10
        lea     edi, [eax+1H]                           ; 51B9 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 51BC _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 51BF _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 51C2 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 51C5 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 51C8 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 51CB _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 51CE _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 51D1 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 51D4 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 51D7 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 51DA _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 51DD _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 51E0 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 51E3 _ 8B. 40, 0C
        mov     ecx, dword [ebp-1CH]                    ; 51E6 _ 8B. 4D, E4
        mov     dword [esp+18H], ecx                    ; 51E9 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 51ED _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 51F1 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 51F5 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 51F9 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 51FD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 5201 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5204 _ 89. 04 24
        call    sheet_refreshsub                        ; 5207 _ E8, FFFFFFFC(rel)
        jmp     ?_326                                   ; 520C _ E9, 0000027D

?_315:  mov     eax, dword [ebp+8H]                     ; 5211 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5214 _ 8B. 40, 10
        cmp     eax, dword [ebp-1CH]                    ; 5217 _ 3B. 45, E4
        jle     ?_318                                   ; 521A _ 7E, 47
        mov     eax, dword [ebp-1CH]                    ; 521C _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 521F _ 89. 45, E0
        jmp     ?_317                                   ; 5222 _ EB, 34

?_316:  mov     eax, dword [ebp-20H]                    ; 5224 _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 5227 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 522A _ 8B. 45, 08
        add     edx, 4                                  ; 522D _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 5230 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 5234 _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 5237 _ 8B. 4D, E0
        add     ecx, 4                                  ; 523A _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 523D _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 5241 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 5244 _ 8B. 55, E0
        add     edx, 4                                  ; 5247 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 524A _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 524E _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 5251 _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 5254 _ 83. 45, E0, 01
?_317:  mov     eax, dword [ebp+8H]                     ; 5258 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 525B _ 8B. 40, 10
        cmp     eax, dword [ebp-20H]                    ; 525E _ 3B. 45, E0
        jg      ?_316                                   ; 5261 _ 7F, C1
?_318:  mov     eax, dword [ebp+8H]                     ; 5263 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5266 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 5269 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 526C _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 526F _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5272 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 5275 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5278 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 527B _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 527E _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 5281 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 5284 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 5287 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 528A _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 528D _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 5290 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 5293 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5296 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 5299 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 529C _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 52A4 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 52A8 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 52AC _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 52B0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 52B4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 52B7 _ 89. 04 24
        call    sheet_refreshmap                        ; 52BA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 52BF _ 8B. 45, E4
        lea     esi, [eax-1H]                           ; 52C2 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 52C5 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 52C8 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 52CB _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 52CE _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 52D1 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 52D4 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 52D7 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 52DA _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 52DD _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 52E0 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 52E3 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 52E6 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 52E9 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 52EC _ 8B. 40, 0C
        mov     dword [esp+18H], esi                    ; 52EF _ 89. 74 24, 18
        mov     dword [esp+14H], 0                      ; 52F3 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 52FB _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 52FF _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 5303 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 5307 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 530B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 530E _ 89. 04 24
        call    sheet_refreshsub                        ; 5311 _ E8, FFFFFFFC(rel)
        jmp     ?_326                                   ; 5316 _ E9, 00000173

?_319:  mov     eax, dword [ebp-1CH]                    ; 531B _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 531E _ 3B. 45, 10
        jge     ?_326                                   ; 5321 _ 0F 8D, 00000167
        cmp     dword [ebp-1CH], 0                      ; 5327 _ 83. 7D, E4, 00
        js      ?_322                                   ; 532B _ 78, 56
        mov     eax, dword [ebp-1CH]                    ; 532D _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 5330 _ 89. 45, E0
        jmp     ?_321                                   ; 5333 _ EB, 34

?_320:  mov     eax, dword [ebp-20H]                    ; 5335 _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 5338 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 533B _ 8B. 45, 08
        add     edx, 4                                  ; 533E _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 5341 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 5345 _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 5348 _ 8B. 4D, E0
        add     ecx, 4                                  ; 534B _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 534E _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 5352 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 5355 _ 8B. 55, E0
        add     edx, 4                                  ; 5358 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 535B _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 535F _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 5362 _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 5365 _ 83. 45, E0, 01
?_321:  mov     eax, dword [ebp-20H]                    ; 5369 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 536C _ 3B. 45, 10
        jl      ?_320                                   ; 536F _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 5371 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 5374 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 5377 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 537A _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 537D _ 89. 54 88, 04
        jmp     ?_325                                   ; 5381 _ EB, 6C

?_322:  mov     eax, dword [ebp+8H]                     ; 5383 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5386 _ 8B. 40, 10
        mov     dword [ebp-20H], eax                    ; 5389 _ 89. 45, E0
        jmp     ?_324                                   ; 538C _ EB, 3A

?_323:  mov     eax, dword [ebp-20H]                    ; 538E _ 8B. 45, E0
        lea     ecx, [eax+1H]                           ; 5391 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 5394 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 5397 _ 8B. 55, E0
        add     edx, 4                                  ; 539A _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 539D _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 53A1 _ 8B. 45, 08
        add     ecx, 4                                  ; 53A4 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 53A7 _ 89. 54 88, 04
        mov     eax, dword [ebp-20H]                    ; 53AB _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 53AE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 53B1 _ 8B. 45, 08
        add     edx, 4                                  ; 53B4 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 53B7 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 53BB _ 8B. 55, E0
        add     edx, 1                                  ; 53BE _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 53C1 _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 53C4 _ 83. 6D, E0, 01
?_324:  mov     eax, dword [ebp-20H]                    ; 53C8 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 53CB _ 3B. 45, 10
        jge     ?_323                                   ; 53CE _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 53D0 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 53D3 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 53D6 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 53D9 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 53DC _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 53E0 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 53E3 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 53E6 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 53E9 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 53EC _ 89. 50, 10
?_325:  mov     eax, dword [ebp+0CH]                    ; 53EF _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 53F2 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 53F5 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 53F8 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 53FB _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 53FE _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 5401 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 5404 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 5407 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 540A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 540D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 5410 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5413 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 5416 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 5419 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 541C _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 5420 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 5424 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 5428 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 542C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 5430 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5433 _ 89. 04 24
        call    sheet_refreshmap                        ; 5436 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 543B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 543E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5441 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 5444 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 5447 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 544A _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 544D _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 5450 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 5453 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 5456 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 5459 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 545C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 545F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 5462 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 5465 _ 8B. 4D, 10
        mov     dword [esp+18H], ecx                    ; 5468 _ 89. 4C 24, 18
        mov     ecx, dword [ebp+10H]                    ; 546C _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 546F _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 5473 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 5477 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 547B _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 547F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 5483 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5486 _ 89. 04 24
        call    sheet_refreshsub                        ; 5489 _ E8, FFFFFFFC(rel)
?_326:  add     esp, 60                                 ; 548E _ 83. C4, 3C
        pop     ebx                                     ; 5491 _ 5B
        pop     esi                                     ; 5492 _ 5E
        pop     edi                                     ; 5493 _ 5F
        pop     ebp                                     ; 5494 _ 5D
        ret                                             ; 5495 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 5496 _ 55
        mov     ebp, esp                                ; 5497 _ 89. E5
        push    edi                                     ; 5499 _ 57
        push    esi                                     ; 549A _ 56
        push    ebx                                     ; 549B _ 53
        sub     esp, 44                                 ; 549C _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 549F _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 54A2 _ 8B. 40, 18
        test    eax, eax                                ; 54A5 _ 85. C0
        js      ?_327                                   ; 54A7 _ 78, 61
        mov     eax, dword [ebp+0CH]                    ; 54A9 _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 54AC _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 54AF _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 54B2 _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 54B5 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 54B8 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 54BB _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 54BE _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 54C1 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 54C4 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 54C7 _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 54CA _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 54CD _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 54D0 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 54D3 _ 8B. 45, 14
        add     edx, eax                                ; 54D6 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 54D8 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 54DB _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 54DE _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 54E1 _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 54E4 _ 03. 45, E4
        mov     dword [esp+18H], ebx                    ; 54E7 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 54EB _ 89. 4C 24, 14
        mov     dword [esp+10H], edi                    ; 54EF _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 54F3 _ 89. 74 24, 0C
        mov     dword [esp+8H], edx                     ; 54F7 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 54FB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 54FF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5502 _ 89. 04 24
        call    sheet_refreshsub                        ; 5505 _ E8, FFFFFFFC(rel)
?_327:  mov     eax, 0                                  ; 550A _ B8, 00000000
        add     esp, 44                                 ; 550F _ 83. C4, 2C
        pop     ebx                                     ; 5512 _ 5B
        pop     esi                                     ; 5513 _ 5E
        pop     edi                                     ; 5514 _ 5F
        pop     ebp                                     ; 5515 _ 5D
        ret                                             ; 5516 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 5517 _ 55
        mov     ebp, esp                                ; 5518 _ 89. E5
        push    esi                                     ; 551A _ 56
        push    ebx                                     ; 551B _ 53
        sub     esp, 48                                 ; 551C _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 551F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 5522 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 5525 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 5528 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 552B _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 552E _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 5531 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 5534 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 5537 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 553A _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 553D _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 5540 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 5543 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 5546 _ 8B. 40, 18
        test    eax, eax                                ; 5549 _ 85. C0
        js      ?_328                                   ; 554B _ 0F 88, 00000117
        mov     eax, dword [ebp+0CH]                    ; 5551 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 5554 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 5557 _ 8B. 45, F4
        add     edx, eax                                ; 555A _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 555C _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 555F _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 5562 _ 8B. 45, F0
        add     eax, ecx                                ; 5565 _ 01. C8
        mov     dword [esp+14H], 0                      ; 5567 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 556F _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 5573 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 5577 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 557A _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 557E _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 5581 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 5585 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5588 _ 89. 04 24
        call    sheet_refreshmap                        ; 558B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 5590 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 5593 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 5596 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 5599 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 559C _ 8B. 55, 14
        add     ecx, edx                                ; 559F _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 55A1 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 55A4 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 55A7 _ 8B. 55, 10
        add     edx, ebx                                ; 55AA _ 01. DA
        mov     dword [esp+14H], eax                    ; 55AC _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 55B0 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 55B4 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 55B8 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 55BB _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 55BF _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 55C2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 55C6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 55C9 _ 89. 04 24
        call    sheet_refreshmap                        ; 55CC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 55D1 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 55D4 _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 55D7 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 55DA _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 55DD _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 55E0 _ 8B. 45, F4
        add     edx, eax                                ; 55E3 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 55E5 _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 55E8 _ 8B. 58, 04
        mov     eax, dword [ebp-10H]                    ; 55EB _ 8B. 45, F0
        add     eax, ebx                                ; 55EE _ 01. D8
        mov     dword [esp+18H], ecx                    ; 55F0 _ 89. 4C 24, 18
        mov     dword [esp+14H], 0                      ; 55F4 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 55FC _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 5600 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 5604 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 5607 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 560B _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 560E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 5612 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5615 _ 89. 04 24
        call    sheet_refreshsub                        ; 5618 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 561D _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 5620 _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 5623 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 5626 _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 5629 _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 562C _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 562F _ 8B. 4D, 14
        add     ebx, ecx                                ; 5632 _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 5634 _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 5637 _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 563A _ 8B. 4D, 10
        add     ecx, esi                                ; 563D _ 01. F1
        mov     dword [esp+18H], edx                    ; 563F _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 5643 _ 89. 44 24, 14
        mov     dword [esp+10H], ebx                    ; 5647 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 564B _ 89. 4C 24, 0C
        mov     eax, dword [ebp+14H]                    ; 564F _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 5652 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 5656 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 5659 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 565D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5660 _ 89. 04 24
        call    sheet_refreshsub                        ; 5663 _ E8, FFFFFFFC(rel)
?_328:  add     esp, 48                                 ; 5668 _ 83. C4, 30
        pop     ebx                                     ; 566B _ 5B
        pop     esi                                     ; 566C _ 5E
        pop     ebp                                     ; 566D _ 5D
        ret                                             ; 566E _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 566F _ 55
        mov     ebp, esp                                ; 5670 _ 89. E5
        sub     esp, 64                                 ; 5672 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 5675 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 5678 _ 8B. 00
        mov     dword [ebp-20H], eax                    ; 567A _ 89. 45, E0
        mov     eax, dword [ebp+8H]                     ; 567D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5680 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 5683 _ 89. 45, E4
        cmp     dword [ebp+0CH], 0                      ; 5686 _ 83. 7D, 0C, 00
        jns     ?_329                                   ; 568A _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 568C _ C7. 45, 0C, 00000000
?_329:  cmp     dword [ebp+10H], 8                      ; 5693 _ 83. 7D, 10, 08
        jg      ?_330                                   ; 5697 _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 5699 _ C7. 45, 10, 00000000
?_330:  mov     eax, dword [ebp+8H]                     ; 56A0 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 56A3 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 56A6 _ 3B. 45, 14
        jge     ?_331                                   ; 56A9 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 56AB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 56AE _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 56B1 _ 89. 45, 14
?_331:  mov     eax, dword [ebp+8H]                     ; 56B4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 56B7 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 56BA _ 3B. 45, 18
        jge     ?_332                                   ; 56BD _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 56BF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 56C2 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 56C5 _ 89. 45, 18
?_332:  mov     eax, dword [ebp+1CH]                    ; 56C8 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 56CB _ 89. 45, CC
        jmp     ?_343                                   ; 56CE _ E9, 0000015B

?_333:  mov     eax, dword [ebp+8H]                     ; 56D3 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 56D6 _ 8B. 55, CC
        add     edx, 4                                  ; 56D9 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 56DC _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 56E0 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 56E3 _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 56E6 _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 56E8 _ 89. 45, EC
        mov     edx, dword [ebp-18H]                    ; 56EB _ 8B. 55, E8
        mov     eax, dword [ebp+8H]                     ; 56EE _ 8B. 45, 08
        add     eax, 1044                               ; 56F1 _ 05, 00000414
        sub     edx, eax                                ; 56F6 _ 29. C2
        mov     eax, edx                                ; 56F8 _ 89. D0
        sar     eax, 2                                  ; 56FA _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 56FD _ 69. C0, 38E38E39
        mov     byte [ebp-35H], al                      ; 5703 _ 88. 45, CB
        mov     eax, dword [ebp-18H]                    ; 5706 _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 5709 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 570C _ 8B. 55, 0C
        sub     edx, eax                                ; 570F _ 29. C2
        mov     eax, edx                                ; 5711 _ 89. D0
        mov     dword [ebp-10H], eax                    ; 5713 _ 89. 45, F0
        mov     eax, dword [ebp-18H]                    ; 5716 _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 5719 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 571C _ 8B. 55, 10
        sub     edx, eax                                ; 571F _ 29. C2
        mov     eax, edx                                ; 5721 _ 89. D0
        mov     dword [ebp-0CH], eax                    ; 5723 _ 89. 45, F4
        mov     eax, dword [ebp-18H]                    ; 5726 _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 5729 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 572C _ 8B. 55, 14
        sub     edx, eax                                ; 572F _ 29. C2
        mov     eax, edx                                ; 5731 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 5733 _ 89. 45, D8
        mov     eax, dword [ebp-18H]                    ; 5736 _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 5739 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 573C _ 8B. 55, 18
        sub     edx, eax                                ; 573F _ 29. C2
        mov     eax, edx                                ; 5741 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 5743 _ 89. 45, DC
        cmp     dword [ebp-10H], 0                      ; 5746 _ 83. 7D, F0, 00
        jns     ?_334                                   ; 574A _ 79, 07
        mov     dword [ebp-10H], 0                      ; 574C _ C7. 45, F0, 00000000
?_334:  cmp     dword [ebp-0CH], 0                      ; 5753 _ 83. 7D, F4, 00
        jns     ?_335                                   ; 5757 _ 79, 07
        mov     dword [ebp-0CH], 0                      ; 5759 _ C7. 45, F4, 00000000
?_335:  mov     eax, dword [ebp-18H]                    ; 5760 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 5763 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 5766 _ 3B. 45, D8
        jge     ?_336                                   ; 5769 _ 7D, 09
        mov     eax, dword [ebp-18H]                    ; 576B _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 576E _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 5771 _ 89. 45, D8
?_336:  mov     eax, dword [ebp-18H]                    ; 5774 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 5777 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 577A _ 3B. 45, DC
        jge     ?_337                                   ; 577D _ 7D, 09
        mov     eax, dword [ebp-18H]                    ; 577F _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 5782 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 5785 _ 89. 45, DC
?_337:  mov     dword [ebp-2CH], 0                      ; 5788 _ C7. 45, D4, 00000000
        jmp     ?_342                                   ; 578F _ E9, 0000008A

?_338:  mov     eax, dword [ebp-18H]                    ; 5794 _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 5797 _ 8B. 50, 10
        mov     eax, dword [ebp-2CH]                    ; 579A _ 8B. 45, D4
        add     eax, edx                                ; 579D _ 01. D0
        mov     dword [ebp-8H], eax                     ; 579F _ 89. 45, F8
        mov     dword [ebp-30H], 0                      ; 57A2 _ C7. 45, D0, 00000000
        jmp     ?_341                                   ; 57A9 _ EB, 67

?_339:  mov     eax, dword [ebp-18H]                    ; 57AB _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 57AE _ 8B. 50, 0C
        mov     eax, dword [ebp-30H]                    ; 57B1 _ 8B. 45, D0
        add     eax, edx                                ; 57B4 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 57B6 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 57B9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 57BC _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 57BF _ 0F AF. 45, F8
        mov     edx, eax                                ; 57C3 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 57C5 _ 8B. 45, FC
        add     eax, edx                                ; 57C8 _ 01. D0
        mov     edx, eax                                ; 57CA _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 57CC _ 8B. 45, E4
        add     eax, edx                                ; 57CF _ 01. D0
        movzx   eax, byte [eax]                         ; 57D1 _ 0F B6. 00
        cmp     al, byte [ebp-35H]                      ; 57D4 _ 3A. 45, CB
        jnz     ?_340                                   ; 57D7 _ 75, 35
        mov     eax, dword [ebp+8H]                     ; 57D9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 57DC _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 57DF _ 0F AF. 45, F8
        mov     edx, eax                                ; 57E3 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 57E5 _ 8B. 45, FC
        add     eax, edx                                ; 57E8 _ 01. D0
        mov     edx, eax                                ; 57EA _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 57EC _ 8B. 45, E0
        add     edx, eax                                ; 57EF _ 01. C2
        mov     eax, dword [ebp-18H]                    ; 57F1 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 57F4 _ 8B. 40, 04
        imul    eax, dword [ebp-2CH]                    ; 57F7 _ 0F AF. 45, D4
        mov     ecx, eax                                ; 57FB _ 89. C1
        mov     eax, dword [ebp-30H]                    ; 57FD _ 8B. 45, D0
        add     eax, ecx                                ; 5800 _ 01. C8
        mov     ecx, eax                                ; 5802 _ 89. C1
        mov     eax, dword [ebp-14H]                    ; 5804 _ 8B. 45, EC
        add     eax, ecx                                ; 5807 _ 01. C8
        movzx   eax, byte [eax]                         ; 5809 _ 0F B6. 00
        mov     byte [edx], al                          ; 580C _ 88. 02
?_340:  add     dword [ebp-30H], 1                      ; 580E _ 83. 45, D0, 01
?_341:  mov     eax, dword [ebp-30H]                    ; 5812 _ 8B. 45, D0
        cmp     eax, dword [ebp-28H]                    ; 5815 _ 3B. 45, D8
        jl      ?_339                                   ; 5818 _ 7C, 91
        add     dword [ebp-2CH], 1                      ; 581A _ 83. 45, D4, 01
?_342:  mov     eax, dword [ebp-2CH]                    ; 581E _ 8B. 45, D4
        cmp     eax, dword [ebp-24H]                    ; 5821 _ 3B. 45, DC
        jl      ?_338                                   ; 5824 _ 0F 8C, FFFFFF6A
        add     dword [ebp-34H], 1                      ; 582A _ 83. 45, CC, 01
?_343:  mov     eax, dword [ebp-34H]                    ; 582E _ 8B. 45, CC
        cmp     eax, dword [ebp+20H]                    ; 5831 _ 3B. 45, 20
        jle     ?_333                                   ; 5834 _ 0F 8E, FFFFFE99
        leave                                           ; 583A _ C9
        ret                                             ; 583B _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 583C _ 55
        mov     ebp, esp                                ; 583D _ 89. E5
        sub     esp, 64                                 ; 583F _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 5842 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5845 _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 5848 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 584B _ 83. 7D, 0C, 00
        jns     ?_344                                   ; 584F _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 5851 _ C7. 45, 0C, 00000000
?_344:  cmp     dword [ebp+10H], 0                      ; 5858 _ 83. 7D, 10, 00
        jns     ?_345                                   ; 585C _ 79, 07
        mov     dword [ebp+10H], 0                      ; 585E _ C7. 45, 10, 00000000
?_345:  mov     eax, dword [ebp+8H]                     ; 5865 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5868 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 586B _ 3B. 45, 14
        jge     ?_346                                   ; 586E _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 5870 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5873 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 5876 _ 89. 45, 14
?_346:  mov     eax, dword [ebp+8H]                     ; 5879 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 587C _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 587F _ 3B. 45, 18
        jge     ?_347                                   ; 5882 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 5884 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5887 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 588A _ 89. 45, 18
?_347:  mov     eax, dword [ebp+1CH]                    ; 588D _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 5890 _ 89. 45, D0
        jmp     ?_358                                   ; 5893 _ E9, 00000147

?_348:  mov     eax, dword [ebp+8H]                     ; 5898 _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 589B _ 8B. 55, D0
        add     edx, 4                                  ; 589E _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 58A1 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 58A5 _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 58A8 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 58AB _ 8B. 45, 08
        add     eax, 1044                               ; 58AE _ 05, 00000414
        sub     edx, eax                                ; 58B3 _ 29. C2
        mov     eax, edx                                ; 58B5 _ 89. D0
        sar     eax, 2                                  ; 58B7 _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 58BA _ 69. C0, 38E38E39
        mov     byte [ebp-31H], al                      ; 58C0 _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 58C3 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 58C6 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 58C8 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 58CB _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 58CE _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 58D1 _ 8B. 55, 0C
        sub     edx, eax                                ; 58D4 _ 29. C2
        mov     eax, edx                                ; 58D6 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 58D8 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 58DB _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 58DE _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 58E1 _ 8B. 55, 10
        sub     edx, eax                                ; 58E4 _ 29. C2
        mov     eax, edx                                ; 58E6 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 58E8 _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 58EB _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 58EE _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 58F1 _ 8B. 55, 14
        sub     edx, eax                                ; 58F4 _ 29. C2
        mov     eax, edx                                ; 58F6 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 58F8 _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 58FB _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 58FE _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 5901 _ 8B. 55, 18
        sub     edx, eax                                ; 5904 _ 29. C2
        mov     eax, edx                                ; 5906 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 5908 _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 590B _ 83. 7D, DC, 00
        jns     ?_349                                   ; 590F _ 79, 07
        mov     dword [ebp-24H], 0                      ; 5911 _ C7. 45, DC, 00000000
?_349:  cmp     dword [ebp-20H], 0                      ; 5918 _ 83. 7D, E0, 00
        jns     ?_350                                   ; 591C _ 79, 07
        mov     dword [ebp-20H], 0                      ; 591E _ C7. 45, E0, 00000000
?_350:  mov     eax, dword [ebp-10H]                    ; 5925 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 5928 _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 592B _ 3B. 45, E4
        jge     ?_351                                   ; 592E _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 5930 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 5933 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 5936 _ 89. 45, E4
?_351:  mov     eax, dword [ebp-10H]                    ; 5939 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 593C _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 593F _ 3B. 45, E8
        jge     ?_352                                   ; 5942 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 5944 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 5947 _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 594A _ 89. 45, E8
?_352:  mov     eax, dword [ebp-20H]                    ; 594D _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 5950 _ 89. 45, D8
        jmp     ?_357                                   ; 5953 _ EB, 7A

?_353:  mov     eax, dword [ebp-10H]                    ; 5955 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 5958 _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 595B _ 8B. 45, D8
        add     eax, edx                                ; 595E _ 01. D0
        mov     dword [ebp-8H], eax                     ; 5960 _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 5963 _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 5966 _ 89. 45, D4
        jmp     ?_356                                   ; 5969 _ EB, 58

?_354:  mov     eax, dword [ebp-10H]                    ; 596B _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 596E _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 5971 _ 8B. 45, D4
        add     eax, edx                                ; 5974 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 5976 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 5979 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 597C _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 597F _ 0F AF. 45, D8
        mov     edx, eax                                ; 5983 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 5985 _ 8B. 45, D4
        add     eax, edx                                ; 5988 _ 01. D0
        mov     edx, eax                                ; 598A _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 598C _ 8B. 45, F4
        add     eax, edx                                ; 598F _ 01. D0
        movzx   eax, byte [eax]                         ; 5991 _ 0F B6. 00
        movzx   edx, al                                 ; 5994 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 5997 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 599A _ 8B. 40, 14
        cmp     edx, eax                                ; 599D _ 39. C2
        jz      ?_355                                   ; 599F _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 59A1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 59A4 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 59A7 _ 0F AF. 45, F8
        mov     edx, eax                                ; 59AB _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 59AD _ 8B. 45, FC
        add     eax, edx                                ; 59B0 _ 01. D0
        mov     edx, eax                                ; 59B2 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 59B4 _ 8B. 45, EC
        add     edx, eax                                ; 59B7 _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 59B9 _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 59BD _ 88. 02
?_355:  add     dword [ebp-2CH], 1                      ; 59BF _ 83. 45, D4, 01
?_356:  mov     eax, dword [ebp-2CH]                    ; 59C3 _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 59C6 _ 3B. 45, E4
        jl      ?_354                                   ; 59C9 _ 7C, A0
        add     dword [ebp-28H], 1                      ; 59CB _ 83. 45, D8, 01
?_357:  mov     eax, dword [ebp-28H]                    ; 59CF _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 59D2 _ 3B. 45, E8
        jl      ?_353                                   ; 59D5 _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 59DB _ 83. 45, D0, 01
?_358:  mov     eax, dword [ebp+8H]                     ; 59DF _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 59E2 _ 8B. 40, 10
        cmp     eax, dword [ebp-30H]                    ; 59E5 _ 3B. 45, D0
        jge     ?_348                                   ; 59E8 _ 0F 8D, FFFFFEAA
        nop                                             ; 59EE _ 90
        leave                                           ; 59EF _ C9
        ret                                             ; 59F0 _ C3
; sheet_refreshmap End of function

sheet_free:; Function begin
        push    ebp                                     ; 59F1 _ 55
        mov     ebp, esp                                ; 59F2 _ 89. E5
        sub     esp, 24                                 ; 59F4 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 59F7 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 59FA _ 8B. 40, 18
        test    eax, eax                                ; 59FD _ 85. C0
        js      ?_359                                   ; 59FF _ 78, 1A
        mov     dword [esp+8H], -1                      ; 5A01 _ C7. 44 24, 08, FFFFFFFF
        mov     eax, dword [ebp+0CH]                    ; 5A09 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 5A0C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 5A10 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5A13 _ 89. 04 24
        call    sheet_updown                            ; 5A16 _ E8, FFFFFFFC(rel)
?_359:  mov     eax, dword [ebp+0CH]                    ; 5A1B _ 8B. 45, 0C
        mov     dword [eax+1CH], 0                      ; 5A1E _ C7. 40, 1C, 00000000
        nop                                             ; 5A25 _ 90
        leave                                           ; 5A26 _ C9
        ret                                             ; 5A27 _ C3
; sheet_free End of function

init_pit:; Function begin
        push    ebp                                     ; 5A28 _ 55
        mov     ebp, esp                                ; 5A29 _ 89. E5
        sub     esp, 40                                 ; 5A2B _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 5A2E _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 5A36 _ C7. 04 24, 00000043
        call    io_out8                                 ; 5A3D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 5A42 _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 5A4A _ C7. 04 24, 00000040
        call    io_out8                                 ; 5A51 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 5A56 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 5A5E _ C7. 04 24, 00000040
        call    io_out8                                 ; 5A65 _ E8, FFFFFFFC(rel)
        mov     dword [timerctl], 0                     ; 5A6A _ C7. 05, 00000380(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 5A74 _ C7. 45, F4, 00000000
        jmp     ?_361                                   ; 5A7B _ EB, 28

?_360:  mov     eax, dword [ebp-0CH]                    ; 5A7D _ 8B. 45, F4
        shl     eax, 4                                  ; 5A80 _ C1. E0, 04
        add     eax, timerctl                           ; 5A83 _ 05, 00000380(d)
        mov     dword [eax+8H], 0                       ; 5A88 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 5A8F _ 8B. 45, F4
        shl     eax, 4                                  ; 5A92 _ C1. E0, 04
        add     eax, timerctl                           ; 5A95 _ 05, 00000380(d)
        mov     dword [eax+0CH], 0                      ; 5A9A _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 5AA1 _ 83. 45, F4, 01
?_361:  cmp     dword [ebp-0CH], 499                    ; 5AA5 _ 81. 7D, F4, 000001F3
        jle     ?_360                                   ; 5AAC _ 7E, CF
        leave                                           ; 5AAE _ C9
        ret                                             ; 5AAF _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 5AB0 _ 55
        mov     ebp, esp                                ; 5AB1 _ 89. E5
        sub     esp, 16                                 ; 5AB3 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 5AB6 _ C7. 45, FC, 00000000
        jmp     ?_364                                   ; 5ABD _ EB, 38

?_362:  mov     eax, dword [ebp-4H]                     ; 5ABF _ 8B. 45, FC
        shl     eax, 4                                  ; 5AC2 _ C1. E0, 04
        add     eax, timerctl                           ; 5AC5 _ 05, 00000380(d)
        mov     eax, dword [eax+8H]                     ; 5ACA _ 8B. 40, 08
        test    eax, eax                                ; 5ACD _ 85. C0
        jnz     ?_363                                   ; 5ACF _ 75, 22
        mov     eax, dword [ebp-4H]                     ; 5AD1 _ 8B. 45, FC
        shl     eax, 4                                  ; 5AD4 _ C1. E0, 04
        add     eax, timerctl                           ; 5AD7 _ 05, 00000380(d)
        mov     dword [eax+8H], 1                       ; 5ADC _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-4H]                     ; 5AE3 _ 8B. 45, FC
        shl     eax, 4                                  ; 5AE6 _ C1. E0, 04
        add     eax, timerctl                           ; 5AE9 _ 05, 00000380(d)
        add     eax, 4                                  ; 5AEE _ 83. C0, 04
        jmp     ?_365                                   ; 5AF1 _ EB, 12

?_363:  add     dword [ebp-4H], 1                       ; 5AF3 _ 83. 45, FC, 01
?_364:  cmp     dword [ebp-4H], 499                     ; 5AF7 _ 81. 7D, FC, 000001F3
        jle     ?_362                                   ; 5AFE _ 7E, BF
        mov     eax, 0                                  ; 5B00 _ B8, 00000000
?_365:  leave                                           ; 5B05 _ C9
        ret                                             ; 5B06 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 5B07 _ 55
        mov     ebp, esp                                ; 5B08 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 5B0A _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 5B0D _ C7. 40, 04, 00000000
        nop                                             ; 5B14 _ 90
        pop     ebp                                     ; 5B15 _ 5D
        ret                                             ; 5B16 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 5B17 _ 55
        mov     ebp, esp                                ; 5B18 _ 89. E5
        sub     esp, 4                                  ; 5B1A _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 5B1D _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 5B20 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 5B23 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5B26 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 5B29 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 5B2C _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 5B2F _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 5B33 _ 88. 50, 0C
        nop                                             ; 5B36 _ 90
        leave                                           ; 5B37 _ C9
        ret                                             ; 5B38 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 5B39 _ 55
        mov     ebp, esp                                ; 5B3A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 5B3C _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5B3F _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 5B42 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 5B44 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 5B47 _ C7. 40, 04, 00000002
        nop                                             ; 5B4E _ 90
        pop     ebp                                     ; 5B4F _ 5D
        ret                                             ; 5B50 _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 5B51 _ 55
        mov     ebp, esp                                ; 5B52 _ 89. E5
        sub     esp, 40                                 ; 5B54 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 5B57 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 5B5F _ C7. 04 24, 00000020
        call    io_out8                                 ; 5B66 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timerctl]                   ; 5B6B _ A1, 00000380(d)
        add     eax, 1                                  ; 5B70 _ 83. C0, 01
        mov     dword [timerctl], eax                   ; 5B73 _ A3, 00000380(d)
        mov     byte [ebp-0DH], 0                       ; 5B78 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 5B7C _ C7. 45, F4, 00000000
        jmp     ?_369                                   ; 5B83 _ E9, 000000B0

?_366:  mov     eax, dword [ebp-0CH]                    ; 5B88 _ 8B. 45, F4
        shl     eax, 4                                  ; 5B8B _ C1. E0, 04
        add     eax, timerctl                           ; 5B8E _ 05, 00000380(d)
        mov     eax, dword [eax+8H]                     ; 5B93 _ 8B. 40, 08
        cmp     eax, 2                                  ; 5B96 _ 83. F8, 02
        jne     ?_367                                   ; 5B99 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 5B9F _ 8B. 45, F4
        shl     eax, 4                                  ; 5BA2 _ C1. E0, 04
        add     eax, timerctl                           ; 5BA5 _ 05, 00000380(d)
        mov     eax, dword [eax+4H]                     ; 5BAA _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 5BAD _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 5BB0 _ 8B. 45, F4
        shl     eax, 4                                  ; 5BB3 _ C1. E0, 04
        add     eax, timerctl                           ; 5BB6 _ 05, 00000380(d)
        mov     dword [eax+4H], edx                     ; 5BBB _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 5BBE _ 8B. 45, F4
        shl     eax, 4                                  ; 5BC1 _ C1. E0, 04
        add     eax, timerctl                           ; 5BC4 _ 05, 00000380(d)
        mov     eax, dword [eax+4H]                     ; 5BC9 _ 8B. 40, 04
        test    eax, eax                                ; 5BCC _ 85. C0
        jnz     ?_367                                   ; 5BCE _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 5BD0 _ 8B. 45, F4
        shl     eax, 4                                  ; 5BD3 _ C1. E0, 04
        add     eax, timerctl                           ; 5BD6 _ 05, 00000380(d)
        mov     dword [eax+8H], 1                       ; 5BDB _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 5BE2 _ 8B. 45, F4
        shl     eax, 4                                  ; 5BE5 _ C1. E0, 04
        add     eax, timerctl                           ; 5BE8 _ 05, 00000380(d)
        movzx   eax, byte [eax+10H]                     ; 5BED _ 0F B6. 40, 10
        movzx   edx, al                                 ; 5BF1 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 5BF4 _ 8B. 45, F4
        shl     eax, 4                                  ; 5BF7 _ C1. E0, 04
        add     eax, timerctl                           ; 5BFA _ 05, 00000380(d)
        mov     eax, dword [eax+0CH]                    ; 5BFF _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 5C02 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 5C06 _ 89. 04 24
        call    fifo8_put                               ; 5C09 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5C0E _ 8B. 45, F4
        shl     eax, 4                                  ; 5C11 _ C1. E0, 04
        add     eax, timerctl                           ; 5C14 _ 05, 00000380(d)
        lea     edx, [eax+4H]                           ; 5C19 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 5C1C _ A1, 00000000(d)
        cmp     edx, eax                                ; 5C21 _ 39. C2
        jnz     ?_367                                   ; 5C23 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 5C25 _ C6. 45, F3, 01
?_367:  cmp     byte [ebp-0DH], 0                       ; 5C29 _ 80. 7D, F3, 00
        jz      ?_368                                   ; 5C2D _ 74, 05
        call    task_switch                             ; 5C2F _ E8, FFFFFFFC(rel)
?_368:  add     dword [ebp-0CH], 1                      ; 5C34 _ 83. 45, F4, 01
?_369:  cmp     dword [ebp-0CH], 499                    ; 5C38 _ 81. 7D, F4, 000001F3
        jle     ?_366                                   ; 5C3F _ 0F 8E, FFFFFF43
        nop                                             ; 5C45 _ 90
        leave                                           ; 5C46 _ C9
        ret                                             ; 5C47 _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 5C48 _ 55
        mov     ebp, esp                                ; 5C49 _ 89. E5
        mov     eax, timerctl                           ; 5C4B _ B8, 00000380(d)
        pop     ebp                                     ; 5C50 _ 5D
        ret                                             ; 5C51 _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 5C52 _ 55
        mov     ebp, esp                                ; 5C53 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 5C55 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5C58 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 5C5B _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 5C5E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 5C61 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 5C64 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 5C66 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5C69 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 5C6C _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 5C6F _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 5C72 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 5C79 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 5C7C _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 5C83 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 5C86 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 5C8D _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 5C90 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 5C93 _ 89. 50, 18
        nop                                             ; 5C96 _ 90
        pop     ebp                                     ; 5C97 _ 5D
        ret                                             ; 5C98 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 5C99 _ 55
        mov     ebp, esp                                ; 5C9A _ 89. E5
        sub     esp, 24                                 ; 5C9C _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 5C9F _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 5CA2 _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 5CA5 _ 83. 7D, 08, 00
        jnz     ?_370                                   ; 5CA9 _ 75, 0A
        mov     eax, 4294967295                         ; 5CAB _ B8, FFFFFFFF
        jmp     ?_374                                   ; 5CB0 _ E9, 000000B2

?_370:  mov     eax, dword [ebp+8H]                     ; 5CB5 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5CB8 _ 8B. 40, 10
        test    eax, eax                                ; 5CBB _ 85. C0
        jnz     ?_371                                   ; 5CBD _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 5CBF _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 5CC2 _ 8B. 40, 14
        or      eax, 01H                                ; 5CC5 _ 83. C8, 01
        mov     edx, eax                                ; 5CC8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5CCA _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 5CCD _ 89. 50, 14
        mov     eax, 4294967294                         ; 5CD0 _ B8, FFFFFFFE
        jmp     ?_374                                   ; 5CD5 _ E9, 0000008D

?_371:  mov     eax, dword [ebp+8H]                     ; 5CDA _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 5CDD _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 5CDF _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5CE2 _ 8B. 40, 04
        add     edx, eax                                ; 5CE5 _ 01. C2
        movzx   eax, byte [ebp-0CH]                     ; 5CE7 _ 0F B6. 45, F4
        mov     byte [edx], al                          ; 5CEB _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 5CED _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5CF0 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 5CF3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 5CF6 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 5CF9 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 5CFC _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 5CFF _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 5D02 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5D05 _ 8B. 40, 0C
        cmp     edx, eax                                ; 5D08 _ 39. C2
        jnz     ?_372                                   ; 5D0A _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 5D0C _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 5D0F _ C7. 40, 04, 00000000
?_372:  mov     eax, dword [ebp+8H]                     ; 5D16 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5D19 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 5D1C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 5D1F _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 5D22 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 5D25 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 5D28 _ 8B. 40, 18
        test    eax, eax                                ; 5D2B _ 85. C0
        jz      ?_373                                   ; 5D2D _ 74, 33
        mov     eax, dword [ebp+8H]                     ; 5D2F _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 5D32 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 5D35 _ 8B. 40, 04
        cmp     eax, 2                                  ; 5D38 _ 83. F8, 02
        jz      ?_373                                   ; 5D3B _ 74, 25
        mov     eax, dword [ebp+8H]                     ; 5D3D _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 5D40 _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 5D43 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 5D4B _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 5D53 _ 89. 04 24
        call    task_run                                ; 5D56 _ E8, FFFFFFFC(rel)
        mov     eax, 1                                  ; 5D5B _ B8, 00000001
        jmp     ?_374                                   ; 5D60 _ EB, 05

?_373:  mov     eax, 0                                  ; 5D62 _ B8, 00000000
?_374:  leave                                           ; 5D67 _ C9
        ret                                             ; 5D68 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 5D69 _ 55
        mov     ebp, esp                                ; 5D6A _ 89. E5
        sub     esp, 16                                 ; 5D6C _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 5D6F _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 5D72 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 5D75 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5D78 _ 8B. 40, 0C
        cmp     edx, eax                                ; 5D7B _ 39. C2
        jnz     ?_375                                   ; 5D7D _ 75, 07
        mov     eax, 4294967295                         ; 5D7F _ B8, FFFFFFFF
        jmp     ?_377                                   ; 5D84 _ EB, 51

?_375:  mov     eax, dword [ebp+8H]                     ; 5D86 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 5D89 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 5D8B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5D8E _ 8B. 40, 08
        add     eax, edx                                ; 5D91 _ 01. D0
        movzx   eax, byte [eax]                         ; 5D93 _ 0F B6. 00
        movzx   eax, al                                 ; 5D96 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 5D99 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 5D9C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5D9F _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 5DA2 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 5DA5 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 5DA8 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 5DAB _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 5DAE _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 5DB1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5DB4 _ 8B. 40, 0C
        cmp     edx, eax                                ; 5DB7 _ 39. C2
        jnz     ?_376                                   ; 5DB9 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 5DBB _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 5DBE _ C7. 40, 08, 00000000
?_376:  mov     eax, dword [ebp+8H]                     ; 5DC5 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5DC8 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 5DCB _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 5DCE _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 5DD1 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 5DD4 _ 8B. 45, FC
?_377:  leave                                           ; 5DD7 _ C9
        ret                                             ; 5DD8 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 5DD9 _ 55
        mov     ebp, esp                                ; 5DDA _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 5DDC _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5DDF _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 5DE2 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5DE5 _ 8B. 40, 10
        sub     edx, eax                                ; 5DE8 _ 29. C2
        mov     eax, edx                                ; 5DEA _ 89. D0
        pop     ebp                                     ; 5DEC _ 5D
        ret                                             ; 5DED _ C3
; fifo8_status End of function

strcmp: ; Function begin
        push    ebp                                     ; 5DEE _ 55
        mov     ebp, esp                                ; 5DEF _ 89. E5
        sub     esp, 16                                 ; 5DF1 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 5DF4 _ 83. 7D, 08, 00
        jz      ?_378                                   ; 5DF8 _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 5DFA _ 83. 7D, 0C, 00
        jnz     ?_379                                   ; 5DFE _ 75, 0A
?_378:  mov     eax, 0                                  ; 5E00 _ B8, 00000000
        jmp     ?_386                                   ; 5E05 _ E9, 0000009B

?_379:  mov     dword [ebp-4H], 0                       ; 5E0A _ C7. 45, FC, 00000000
        jmp     ?_382                                   ; 5E11 _ EB, 25

?_380:  mov     edx, dword [ebp-4H]                     ; 5E13 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5E16 _ 8B. 45, 08
        add     eax, edx                                ; 5E19 _ 01. D0
        movzx   edx, byte [eax]                         ; 5E1B _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 5E1E _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 5E21 _ 8B. 45, 0C
        add     eax, ecx                                ; 5E24 _ 01. C8
        movzx   eax, byte [eax]                         ; 5E26 _ 0F B6. 00
        cmp     dl, al                                  ; 5E29 _ 38. C2
        jz      ?_381                                   ; 5E2B _ 74, 07
        mov     eax, 0                                  ; 5E2D _ B8, 00000000
        jmp     ?_386                                   ; 5E32 _ EB, 71

?_381:  add     dword [ebp-4H], 1                       ; 5E34 _ 83. 45, FC, 01
?_382:  mov     edx, dword [ebp-4H]                     ; 5E38 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5E3B _ 8B. 45, 08
        add     eax, edx                                ; 5E3E _ 01. D0
        movzx   eax, byte [eax]                         ; 5E40 _ 0F B6. 00
        test    al, al                                  ; 5E43 _ 84. C0
        jz      ?_383                                   ; 5E45 _ 74, 0F
        mov     edx, dword [ebp-4H]                     ; 5E47 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 5E4A _ 8B. 45, 0C
        add     eax, edx                                ; 5E4D _ 01. D0
        movzx   eax, byte [eax]                         ; 5E4F _ 0F B6. 00
        test    al, al                                  ; 5E52 _ 84. C0
        jnz     ?_380                                   ; 5E54 _ 75, BD
?_383:  mov     edx, dword [ebp-4H]                     ; 5E56 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5E59 _ 8B. 45, 08
        add     eax, edx                                ; 5E5C _ 01. D0
        movzx   eax, byte [eax]                         ; 5E5E _ 0F B6. 00
        test    al, al                                  ; 5E61 _ 84. C0
        jnz     ?_384                                   ; 5E63 _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 5E65 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 5E68 _ 8B. 45, 0C
        add     eax, edx                                ; 5E6B _ 01. D0
        movzx   eax, byte [eax]                         ; 5E6D _ 0F B6. 00
        test    al, al                                  ; 5E70 _ 84. C0
        jz      ?_384                                   ; 5E72 _ 74, 07
        mov     eax, 0                                  ; 5E74 _ B8, 00000000
        jmp     ?_386                                   ; 5E79 _ EB, 2A

?_384:  mov     edx, dword [ebp-4H]                     ; 5E7B _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5E7E _ 8B. 45, 08
        add     eax, edx                                ; 5E81 _ 01. D0
        movzx   eax, byte [eax]                         ; 5E83 _ 0F B6. 00
        test    al, al                                  ; 5E86 _ 84. C0
        jz      ?_385                                   ; 5E88 _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 5E8A _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 5E8D _ 8B. 45, 0C
        add     eax, edx                                ; 5E90 _ 01. D0
        movzx   eax, byte [eax]                         ; 5E92 _ 0F B6. 00
        test    al, al                                  ; 5E95 _ 84. C0
        jz      ?_385                                   ; 5E97 _ 74, 07
        mov     eax, 0                                  ; 5E99 _ B8, 00000000
        jmp     ?_386                                   ; 5E9E _ EB, 05

?_385:  mov     eax, 1                                  ; 5EA0 _ B8, 00000001
?_386:  leave                                           ; 5EA5 _ C9
        ret                                             ; 5EA6 _ C3
; strcmp End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 5EA7 _ 55
        mov     ebp, esp                                ; 5EA8 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 5EAA _ 81. 7D, 0C, 000FFFFF
        jbe     ?_387                                   ; 5EB1 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 5EB3 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 5EBA _ 8B. 45, 0C
        shr     eax, 12                                 ; 5EBD _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 5EC0 _ 89. 45, 0C
?_387:  mov     eax, dword [ebp+0CH]                    ; 5EC3 _ 8B. 45, 0C
        mov     edx, eax                                ; 5EC6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5EC8 _ 8B. 45, 08
        mov     word [eax], dx                          ; 5ECB _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 5ECE _ 8B. 45, 10
        mov     edx, eax                                ; 5ED1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5ED3 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 5ED6 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 5EDA _ 8B. 45, 10
        sar     eax, 16                                 ; 5EDD _ C1. F8, 10
        mov     edx, eax                                ; 5EE0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5EE2 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 5EE5 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 5EE8 _ 8B. 45, 14
        mov     edx, eax                                ; 5EEB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5EED _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 5EF0 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 5EF3 _ 8B. 45, 0C
        shr     eax, 16                                 ; 5EF6 _ C1. E8, 10
        and     eax, 0FH                                ; 5EF9 _ 83. E0, 0F
        mov     edx, eax                                ; 5EFC _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 5EFE _ 8B. 45, 14
        sar     eax, 8                                  ; 5F01 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 5F04 _ 83. E0, F0
        or      eax, edx                                ; 5F07 _ 09. D0
        mov     edx, eax                                ; 5F09 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5F0B _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 5F0E _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 5F11 _ 8B. 45, 10
        shr     eax, 24                                 ; 5F14 _ C1. E8, 18
        mov     edx, eax                                ; 5F17 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5F19 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 5F1C _ 88. 50, 07
        nop                                             ; 5F1F _ 90
        pop     ebp                                     ; 5F20 _ 5D
        ret                                             ; 5F21 _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 5F22 _ 55
        mov     ebp, esp                                ; 5F23 _ 89. E5
        mov     eax, dword [taskctl]                    ; 5F25 _ A1, 000022C8(d)
        pop     ebp                                     ; 5F2A _ 5D
        ret                                             ; 5F2B _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 5F2C _ 55
        mov     ebp, esp                                ; 5F2D _ 89. E5
        sub     esp, 16                                 ; 5F2F _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5F32 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp+8H]                     ; 5F38 _ 8B. 55, 08
        mov     eax, edx                                ; 5F3B _ 89. D0
        add     eax, eax                                ; 5F3D _ 01. C0
        add     eax, edx                                ; 5F3F _ 01. D0
        shl     eax, 4                                  ; 5F41 _ C1. E0, 04
        add     eax, ecx                                ; 5F44 _ 01. C8
        add     eax, 8                                  ; 5F46 _ 83. C0, 08
        mov     dword [eax], 0                          ; 5F49 _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 5F4F _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp+8H]                     ; 5F55 _ 8B. 55, 08
        mov     eax, edx                                ; 5F58 _ 89. D0
        add     eax, eax                                ; 5F5A _ 01. C0
        add     eax, edx                                ; 5F5C _ 01. D0
        shl     eax, 4                                  ; 5F5E _ C1. E0, 04
        add     eax, ecx                                ; 5F61 _ 01. C8
        add     eax, 12                                 ; 5F63 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 5F66 _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 5F6C _ C7. 45, FC, 00000000
        jmp     ?_389                                   ; 5F73 _ EB, 1B

?_388:  mov     edx, dword [taskctl]                    ; 5F75 _ 8B. 15, 000022C8(d)
        mov     eax, dword [ebp-4H]                     ; 5F7B _ 8B. 45, FC
        imul    eax, eax, 52                            ; 5F7E _ 6B. C0, 34
        add     eax, edx                                ; 5F81 _ 01. D0
        add     eax, 16                                 ; 5F83 _ 83. C0, 10
        mov     dword [eax], 0                          ; 5F86 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 5F8C _ 83. 45, FC, 01
?_389:  cmp     dword [ebp-4H], 9                       ; 5F90 _ 83. 7D, FC, 09
        jle     ?_388                                   ; 5F94 _ 7E, DF
        leave                                           ; 5F96 _ C9
        ret                                             ; 5F97 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 5F98 _ 55
        mov     ebp, esp                                ; 5F99 _ 89. E5
        sub     esp, 40                                 ; 5F9B _ 83. EC, 28
        call    get_addr_gdt                            ; 5F9E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 5FA3 _ 89. 45, F0
        mov     dword [esp+4H], 3128                    ; 5FA6 _ C7. 44 24, 04, 00000C38
        mov     eax, dword [ebp+8H]                     ; 5FAE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5FB1 _ 89. 04 24
        call    memman_alloc_4k                         ; 5FB4 _ E8, FFFFFFFC(rel)
        mov     dword [taskctl], eax                    ; 5FB9 _ A3, 000022C8(d)
        mov     dword [ebp-14H], 0                      ; 5FBE _ C7. 45, EC, 00000000
        jmp     ?_391                                   ; 5FC5 _ E9, 000000F8

?_390:  mov     edx, dword [taskctl]                    ; 5FCA _ 8B. 15, 000022C8(d)
        mov     eax, dword [ebp-14H]                    ; 5FD0 _ 8B. 45, EC
        imul    eax, eax, 208                           ; 5FD3 _ 69. C0, 000000D0
        add     eax, edx                                ; 5FD9 _ 01. D0
        add     eax, 492                                ; 5FDB _ 05, 000001EC
        mov     dword [eax], 0                          ; 5FE0 _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 5FE6 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp-14H]                    ; 5FEC _ 8B. 45, EC
        add     eax, 7                                  ; 5FEF _ 83. C0, 07
        lea     edx, [eax*8]                            ; 5FF2 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 5FF9 _ 8B. 45, EC
        imul    eax, eax, 208                           ; 5FFC _ 69. C0, 000000D0
        add     eax, ecx                                ; 6002 _ 01. C8
        add     eax, 488                                ; 6004 _ 05, 000001E8
        mov     dword [eax], edx                        ; 6009 _ 89. 10
        mov     ecx, dword [taskctl]                    ; 600B _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp-14H]                    ; 6011 _ 8B. 45, EC
        add     eax, 17                                 ; 6014 _ 83. C0, 11
        lea     edx, [eax*8]                            ; 6017 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 601E _ 8B. 45, EC
        imul    eax, eax, 208                           ; 6021 _ 69. C0, 000000D0
        add     eax, ecx                                ; 6027 _ 01. C8
        add     eax, 628                                ; 6029 _ 05, 00000274
        mov     dword [eax], edx                        ; 602E _ 89. 10
        mov     eax, dword [taskctl]                    ; 6030 _ A1, 000022C8(d)
        mov     edx, dword [ebp-14H]                    ; 6035 _ 8B. 55, EC
        imul    edx, edx, 208                           ; 6038 _ 69. D2, 000000D0
        add     edx, 512                                ; 603E _ 81. C2, 00000200
        add     eax, edx                                ; 6044 _ 01. D0
        add     eax, 20                                 ; 6046 _ 83. C0, 14
        mov     edx, dword [ebp-14H]                    ; 6049 _ 8B. 55, EC
        add     edx, 7                                  ; 604C _ 83. C2, 07
        lea     ecx, [edx*8]                            ; 604F _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 6056 _ 8B. 55, F0
        add     edx, ecx                                ; 6059 _ 01. CA
        mov     dword [esp+0CH], 137                    ; 605B _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 6063 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 6067 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 606F _ 89. 14 24
        call    set_segmdesc                            ; 6072 _ E8, FFFFFFFC(rel)
        mov     eax, dword [taskctl]                    ; 6077 _ A1, 000022C8(d)
        mov     edx, dword [ebp-14H]                    ; 607C _ 8B. 55, EC
        imul    edx, edx, 208                           ; 607F _ 69. D2, 000000D0
        add     edx, 656                                ; 6085 _ 81. C2, 00000290
        add     eax, edx                                ; 608B _ 01. D0
        add     eax, 20                                 ; 608D _ 83. C0, 14
        mov     edx, dword [ebp-14H]                    ; 6090 _ 8B. 55, EC
        add     edx, 17                                 ; 6093 _ 83. C2, 11
        lea     ecx, [edx*8]                            ; 6096 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 609D _ 8B. 55, F0
        add     edx, ecx                                ; 60A0 _ 01. CA
        mov     dword [esp+0CH], 130                    ; 60A2 _ C7. 44 24, 0C, 00000082
        mov     dword [esp+8H], eax                     ; 60AA _ 89. 44 24, 08
        mov     dword [esp+4H], 15                      ; 60AE _ C7. 44 24, 04, 0000000F
        mov     dword [esp], edx                        ; 60B6 _ 89. 14 24
        call    set_segmdesc                            ; 60B9 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 60BE _ 83. 45, EC, 01
?_391:  cmp     dword [ebp-14H], 9                      ; 60C2 _ 83. 7D, EC, 09
        jle     ?_390                                   ; 60C6 _ 0F 8E, FFFFFEFE
        mov     dword [ebp-14H], 0                      ; 60CC _ C7. 45, EC, 00000000
        jmp     ?_393                                   ; 60D3 _ EB, 0F

?_392:  mov     eax, dword [ebp-14H]                    ; 60D5 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 60D8 _ 89. 04 24
        call    init_task_level                         ; 60DB _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 60E0 _ 83. 45, EC, 01
?_393:  cmp     dword [ebp-14H], 9                      ; 60E4 _ 83. 7D, EC, 09
        jle     ?_392                                   ; 60E8 _ 7E, EB
        call    task_alloc                              ; 60EA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 60EF _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 60F2 _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 60F5 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 60FC _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 60FF _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 6106 _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 6109 _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 6110 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 6113 _ 89. 04 24
        call    task_add                                ; 6116 _ E8, FFFFFFFC(rel)
        call    task_switchsub                          ; 611B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 6120 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 6123 _ 8B. 00
        mov     dword [esp], eax                        ; 6125 _ 89. 04 24
        call    load_tr                                 ; 6128 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 612D _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 6132 _ A3, 000022C4(d)
        mov     eax, dword [ebp-0CH]                    ; 6137 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 613A _ 8B. 40, 08
        mov     edx, eax                                ; 613D _ 89. C2
        mov     eax, dword [task_timer]                 ; 613F _ A1, 000022C4(d)
        mov     dword [esp+4H], edx                     ; 6144 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 6148 _ 89. 04 24
        call    timer_settime                           ; 614B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 6150 _ 8B. 45, F4
        leave                                           ; 6153 _ C9
        ret                                             ; 6154 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 6155 _ 55
        mov     ebp, esp                                ; 6156 _ 89. E5
        sub     esp, 16                                 ; 6158 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 615B _ C7. 45, F8, 00000000
        jmp     ?_396                                   ; 6162 _ E9, 000000F8

?_394:  mov     edx, dword [taskctl]                    ; 6167 _ 8B. 15, 000022C8(d)
        mov     eax, dword [ebp-8H]                     ; 616D _ 8B. 45, F8
        imul    eax, eax, 208                           ; 6170 _ 69. C0, 000000D0
        add     eax, edx                                ; 6176 _ 01. D0
        add     eax, 492                                ; 6178 _ 05, 000001EC
        mov     eax, dword [eax]                        ; 617D _ 8B. 00
        test    eax, eax                                ; 617F _ 85. C0
        jne     ?_395                                   ; 6181 _ 0F 85, 000000D4
        mov     eax, dword [taskctl]                    ; 6187 _ A1, 000022C8(d)
        mov     edx, dword [ebp-8H]                     ; 618C _ 8B. 55, F8
        imul    edx, edx, 208                           ; 618F _ 69. D2, 000000D0
        add     edx, 480                                ; 6195 _ 81. C2, 000001E0
        add     eax, edx                                ; 619B _ 01. D0
        add     eax, 8                                  ; 619D _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 61A0 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 61A3 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 61A6 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 61AD _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 61B0 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 61B7 _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 61BA _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 61C1 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 61C4 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 61CB _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 61CE _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 61D5 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 61D8 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 61DF _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 61E2 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 61E9 _ 8B. 45, F8
        add     eax, 1                                  ; 61EC _ 83. C0, 01
        shl     eax, 9                                  ; 61EF _ C1. E0, 09
        mov     edx, eax                                ; 61F2 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 61F4 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 61F7 _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 61FA _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 61FD _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 6204 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 6207 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 620E _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 6211 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 6218 _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 621B _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 6225 _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 6228 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 6232 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 6235 _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 623F _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 6242 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 6249 _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 624C _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 6256 _ 8B. 45, FC
        jmp     ?_397                                   ; 6259 _ EB, 13

?_395:  add     dword [ebp-8H], 1                       ; 625B _ 83. 45, F8, 01
?_396:  cmp     dword [ebp-8H], 9                       ; 625F _ 83. 7D, F8, 09
        jle     ?_394                                   ; 6263 _ 0F 8E, FFFFFEFE
        mov     eax, 0                                  ; 6269 _ B8, 00000000
?_397:  leave                                           ; 626E _ C9
        ret                                             ; 626F _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 6270 _ 55
        mov     ebp, esp                                ; 6271 _ 89. E5
        sub     esp, 24                                 ; 6273 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 6276 _ 83. 7D, 0C, 00
        jns     ?_398                                   ; 627A _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 627C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 627F _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 6282 _ 89. 45, 0C
?_398:  cmp     dword [ebp+10H], 0                      ; 6285 _ 83. 7D, 10, 00
        jle     ?_399                                   ; 6289 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 628B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 628E _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 6291 _ 89. 50, 08
?_399:  mov     eax, dword [ebp+8H]                     ; 6294 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 6297 _ 8B. 40, 04
        cmp     eax, 2                                  ; 629A _ 83. F8, 02
        jnz     ?_400                                   ; 629D _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 629F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 62A2 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 62A5 _ 3B. 45, 0C
        jz      ?_400                                   ; 62A8 _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 62AA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 62AD _ 89. 04 24
        call    task_remove                             ; 62B0 _ E8, FFFFFFFC(rel)
?_400:  mov     eax, dword [ebp+8H]                     ; 62B5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 62B8 _ 8B. 40, 04
        cmp     eax, 2                                  ; 62BB _ 83. F8, 02
        jz      ?_401                                   ; 62BE _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 62C0 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 62C3 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 62C6 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 62C9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 62CC _ 89. 04 24
        call    task_add                                ; 62CF _ E8, FFFFFFFC(rel)
?_401:  mov     eax, dword [taskctl]                    ; 62D4 _ A1, 000022C8(d)
        mov     dword [eax+4H], 1                       ; 62D9 _ C7. 40, 04, 00000001
        nop                                             ; 62E0 _ 90
        leave                                           ; 62E1 _ C9
        ret                                             ; 62E2 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 62E3 _ 55
        mov     ebp, esp                                ; 62E4 _ 89. E5
        sub     esp, 40                                 ; 62E6 _ 83. EC, 28
        mov     ecx, dword [taskctl]                    ; 62E9 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 62EF _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 62F4 _ 8B. 10
        mov     eax, edx                                ; 62F6 _ 89. D0
        add     eax, eax                                ; 62F8 _ 01. C0
        add     eax, edx                                ; 62FA _ 01. D0
        shl     eax, 4                                  ; 62FC _ C1. E0, 04
        add     eax, ecx                                ; 62FF _ 01. C8
        add     eax, 8                                  ; 6301 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 6304 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 6307 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 630A _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 630D _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 6310 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 6314 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 6317 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 631A _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 631D _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 6320 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 6323 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 6326 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 6329 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 632C _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 632F _ 8B. 00
        cmp     edx, eax                                ; 6331 _ 39. C2
        jnz     ?_402                                   ; 6333 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 6335 _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 6338 _ C7. 40, 04, 00000000
?_402:  mov     eax, dword [taskctl]                    ; 633F _ A1, 000022C8(d)
        mov     eax, dword [eax+4H]                     ; 6344 _ 8B. 40, 04
        test    eax, eax                                ; 6347 _ 85. C0
        jz      ?_403                                   ; 6349 _ 74, 23
        call    task_switchsub                          ; 634B _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 6350 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 6356 _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 635B _ 8B. 10
        mov     eax, edx                                ; 635D _ 89. D0
        add     eax, eax                                ; 635F _ 01. C0
        add     eax, edx                                ; 6361 _ 01. D0
        shl     eax, 4                                  ; 6363 _ C1. E0, 04
        add     eax, ecx                                ; 6366 _ 01. C8
        add     eax, 8                                  ; 6368 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 636B _ 89. 45, EC
?_403:  mov     eax, dword [ebp-14H]                    ; 636E _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 6371 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 6374 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 6377 _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 637B _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 637E _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 6381 _ 8B. 40, 08
        mov     edx, eax                                ; 6384 _ 89. C2
        mov     eax, dword [task_timer]                 ; 6386 _ A1, 000022C4(d)
        mov     dword [esp+4H], edx                     ; 638B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 638F _ 89. 04 24
        call    timer_settime                           ; 6392 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 6397 _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 639A _ 3B. 45, F0
        jz      ?_404                                   ; 639D _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 639F _ 83. 7D, F4, 00
        jz      ?_404                                   ; 63A3 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 63A5 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 63A8 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 63AA _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 63AE _ C7. 04 24, 00000000
        call    farjmp                                  ; 63B5 _ E8, FFFFFFFC(rel)
?_404:  nop                                             ; 63BA _ 90
        leave                                           ; 63BB _ C9
        ret                                             ; 63BC _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 63BD _ 55
        mov     ebp, esp                                ; 63BE _ 89. E5
        sub     esp, 40                                 ; 63C0 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 63C3 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 63CA _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 63D1 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 63D4 _ 8B. 40, 04
        cmp     eax, 2                                  ; 63D7 _ 83. F8, 02
        jnz     ?_405                                   ; 63DA _ 75, 51
        call    task_now                                ; 63DC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 63E1 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 63E4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 63E7 _ 89. 04 24
        call    task_remove                             ; 63EA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 63EF _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 63F6 _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 63F9 _ 3B. 45, F4
        jnz     ?_405                                   ; 63FC _ 75, 2F
        call    task_switchsub                          ; 63FE _ E8, FFFFFFFC(rel)
        call    task_now                                ; 6403 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 6408 _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 640B _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 6412 _ 83. 7D, F4, 00
        jz      ?_405                                   ; 6416 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 6418 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 641B _ 8B. 00
        mov     dword [esp+4H], eax                     ; 641D _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 6421 _ C7. 04 24, 00000000
        call    farjmp                                  ; 6428 _ E8, FFFFFFFC(rel)
?_405:  mov     eax, dword [ebp-10H]                    ; 642D _ 8B. 45, F0
        leave                                           ; 6430 _ C9
        ret                                             ; 6431 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 6432 _ 55
        mov     ebp, esp                                ; 6433 _ 89. E5
        sub     esp, 16                                 ; 6435 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 6438 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 643E _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 6443 _ 8B. 10
        mov     eax, edx                                ; 6445 _ 89. D0
        add     eax, eax                                ; 6447 _ 01. C0
        add     eax, edx                                ; 6449 _ 01. D0
        shl     eax, 4                                  ; 644B _ C1. E0, 04
        add     eax, ecx                                ; 644E _ 01. C8
        add     eax, 8                                  ; 6450 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 6453 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 6456 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 6459 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 645C _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 645F _ 8B. 44 90, 08
        leave                                           ; 6463 _ C9
        ret                                             ; 6464 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 6465 _ 55
        mov     ebp, esp                                ; 6466 _ 89. E5
        sub     esp, 16                                 ; 6468 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 646B _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp+8H]                     ; 6471 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 6474 _ 8B. 50, 0C
        mov     eax, edx                                ; 6477 _ 89. D0
        add     eax, eax                                ; 6479 _ 01. C0
        add     eax, edx                                ; 647B _ 01. D0
        shl     eax, 4                                  ; 647D _ C1. E0, 04
        add     eax, ecx                                ; 6480 _ 01. C8
        add     eax, 8                                  ; 6482 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 6485 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 6488 _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 648B _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 648D _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 6490 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 6493 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 6497 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 649A _ 8B. 00
        lea     edx, [eax+1H]                           ; 649C _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 649F _ 8B. 45, FC
        mov     dword [eax], edx                        ; 64A2 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 64A4 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 64A7 _ C7. 40, 04, 00000002
        nop                                             ; 64AE _ 90
        leave                                           ; 64AF _ C9
        ret                                             ; 64B0 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 64B1 _ 55
        mov     ebp, esp                                ; 64B2 _ 89. E5
        sub     esp, 16                                 ; 64B4 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 64B7 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp+8H]                     ; 64BD _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 64C0 _ 8B. 50, 0C
        mov     eax, edx                                ; 64C3 _ 89. D0
        add     eax, eax                                ; 64C5 _ 01. C0
        add     eax, edx                                ; 64C7 _ 01. D0
        shl     eax, 4                                  ; 64C9 _ C1. E0, 04
        add     eax, ecx                                ; 64CC _ 01. C8
        add     eax, 8                                  ; 64CE _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 64D1 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 64D4 _ C7. 45, F8, 00000000
        jmp     ?_408                                   ; 64DB _ EB, 23

?_406:  mov     eax, dword [ebp-4H]                     ; 64DD _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 64E0 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 64E3 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 64E7 _ 3B. 45, 08
        jnz     ?_407                                   ; 64EA _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 64EC _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 64EF _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 64F2 _ C7. 44 90, 08, 00000000
        jmp     ?_409                                   ; 64FA _ EB, 0E

?_407:  add     dword [ebp-8H], 1                       ; 64FC _ 83. 45, F8, 01
?_408:  mov     eax, dword [ebp-4H]                     ; 6500 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 6503 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 6505 _ 3B. 45, F8
        jg      ?_406                                   ; 6508 _ 7F, D3
?_409:  mov     eax, dword [ebp-4H]                     ; 650A _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 650D _ 8B. 00
        lea     edx, [eax-1H]                           ; 650F _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 6512 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 6515 _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 6517 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 651A _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 651D _ 3B. 45, F8
        jle     ?_410                                   ; 6520 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 6522 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 6525 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 6528 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 652B _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 652E _ 89. 50, 04
?_410:  mov     eax, dword [ebp-4H]                     ; 6531 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 6534 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 6537 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 653A _ 8B. 00
        cmp     edx, eax                                ; 653C _ 39. C2
        jl      ?_411                                   ; 653E _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 6540 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 6543 _ C7. 40, 04, 00000000
?_411:  mov     eax, dword [ebp+8H]                     ; 654A _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 654D _ C7. 40, 04, 00000001
        jmp     ?_413                                   ; 6554 _ EB, 1B

?_412:  mov     eax, dword [ebp-8H]                     ; 6556 _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 6559 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 655C _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 655F _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 6563 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 6566 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 6569 _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 656D _ 83. 45, F8, 01
?_413:  mov     eax, dword [ebp-4H]                     ; 6571 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 6574 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 6576 _ 3B. 45, F8
        jg      ?_412                                   ; 6579 _ 7F, DB
        nop                                             ; 657B _ 90
        leave                                           ; 657C _ C9
        ret                                             ; 657D _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 657E _ 55
        mov     ebp, esp                                ; 657F _ 89. E5
        sub     esp, 16                                 ; 6581 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 6584 _ C7. 45, FC, 00000000
        jmp     ?_416                                   ; 658B _ EB, 23

?_414:  mov     ecx, dword [taskctl]                    ; 658D _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 6593 _ 8B. 55, FC
        mov     eax, edx                                ; 6596 _ 89. D0
        add     eax, eax                                ; 6598 _ 01. C0
        add     eax, edx                                ; 659A _ 01. D0
        shl     eax, 4                                  ; 659C _ C1. E0, 04
        add     eax, ecx                                ; 659F _ 01. C8
        add     eax, 8                                  ; 65A1 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 65A4 _ 8B. 00
        test    eax, eax                                ; 65A6 _ 85. C0
        jle     ?_415                                   ; 65A8 _ 7E, 02
        jmp     ?_417                                   ; 65AA _ EB, 0A

?_415:  add     dword [ebp-4H], 1                       ; 65AC _ 83. 45, FC, 01
?_416:  cmp     dword [ebp-4H], 9                       ; 65B0 _ 83. 7D, FC, 09
        jle     ?_414                                   ; 65B4 _ 7E, D7
?_417:  mov     eax, dword [taskctl]                    ; 65B6 _ A1, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 65BB _ 8B. 55, FC
        mov     dword [eax], edx                        ; 65BE _ 89. 10
        mov     eax, dword [taskctl]                    ; 65C0 _ A1, 000022C8(d)
        mov     dword [eax+4H], 0                       ; 65C5 _ C7. 40, 04, 00000000
        leave                                           ; 65CC _ C9
        ret                                             ; 65CD _ C3
; task_switchsub End of function

send_message:; Function begin
        push    ebp                                     ; 65CE _ 55
        mov     ebp, esp                                ; 65CF _ 89. E5
        sub     esp, 24                                 ; 65D1 _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 65D4 _ 8B. 45, 10
        movzx   eax, al                                 ; 65D7 _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 65DA _ 8B. 55, 0C
        add     edx, 16                                 ; 65DD _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 65E0 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 65E4 _ 89. 14 24
        call    fifo8_put                               ; 65E7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 65EC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 65EF _ 89. 04 24
        call    task_sleep                              ; 65F2 _ E8, FFFFFFFC(rel)
        leave                                           ; 65F7 _ C9
        ret                                             ; 65F8 _ C3
; send_message End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_418:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_419:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0008 _ task_a.

?_420:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 000F _ console.

?_421:                                                  ; byte
        db 20H, 00H                                     ; 0017 _  .

?_422:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0019 _ free .

?_423:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 001F _  KB.

?_424:                                                  ; byte
        db 3EH, 00H                                     ; 0023 _ >.

?_425:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 0025 _ mem.

?_426:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 0029 _ cls.

?_427:                                                  ; byte
        db 68H, 6CH, 74H, 00H                           ; 002D _ hlt.

?_428:                                                  ; byte
        db 68H, 6CH, 74H, 2EH, 65H, 78H, 65H, 00H       ; 0031 _ hlt.exe.

?_429:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 0039 _ dir.

?_430:                                                  ; byte
        db 65H, 78H, 69H, 74H, 00H                      ; 003D _ exit.

?_431:                                                  ; byte
        db 73H, 74H, 61H, 72H, 74H, 00H                 ; 0042 _ start.

?_432:                                                  ; byte
        db 6EH, 63H, 73H, 74H, 00H                      ; 0048 _ ncst.

?_433:                                                  ; byte
        db 63H, 72H, 61H, 63H, 6BH, 00H                 ; 004D _ crack.

?_434:                                                  ; byte
        db 63H, 72H, 61H, 63H, 6BH, 2EH, 65H, 78H       ; 0053 _ crack.ex
        db 65H, 00H                                     ; 005B _ e.

?_435:                                                  ; byte
        db 6BH, 65H, 79H, 62H, 6FH, 61H, 72H, 64H       ; 005D _ keyboard
        db 00H                                          ; 0065 _ .

?_436:                                                  ; byte
        db 75H, 73H, 65H, 72H, 20H, 70H, 72H, 6FH       ; 0066 _ user pro
        db 63H, 00H                                     ; 006E _ c.

?_437:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0070 _ page is:
        db 20H, 00H                                     ; 0078 _  .

?_438:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 007A _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0082 _ L: .

?_439:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0086 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 008E _ H: .

?_440:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0092 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 009A _ w: .

?_441:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 4FH, 43H, 00H            ; 009E _ INT OC.

?_442:                                                  ; byte
        db 53H, 74H, 61H, 63H, 6BH, 20H, 45H, 78H       ; 00A5 _ Stack Ex
        db 63H, 65H, 70H, 74H, 69H, 6FH, 6EH, 00H       ; 00AD _ ception.

?_443:                                                  ; byte
        db 45H, 49H, 50H, 20H, 3DH, 20H, 00H            ; 00B5 _ EIP = .

?_444:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 30H, 44H, 20H, 00H       ; 00BC _ INT 0D .

?_445:                                                  ; byte
        db 47H, 65H, 6EH, 65H, 72H, 61H, 6CH, 20H       ; 00C4 _ General 
        db 50H, 72H, 6FH, 74H, 65H, 63H, 74H, 65H       ; 00CC _ Protecte
        db 64H, 20H, 45H, 78H, 63H, 65H, 70H, 74H       ; 00D4 _ d Except
        db 69H, 6FH, 6EH, 00H                           ; 00DC _ ion.


SECTION .data   align=32 noexecute                      ; section number 3, data

memman:                                                 ; dword
        dd 00100000H, 00000000H                         ; 0000 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0008 _ 0 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 

keytable:                                               ; byte
        db 00H, 00H, 31H, 32H, 33H, 34H, 35H, 36H       ; 0020 _ ..123456
        db 37H, 38H, 39H, 30H, 2DH, 5EH, 00H, 00H       ; 0028 _ 7890-^..
        db 51H, 57H, 45H, 52H, 54H, 59H, 55H, 49H       ; 0030 _ QWERTYUI
        db 4FH, 50H, 40H, 5BH, 00H, 00H, 41H, 53H       ; 0038 _ OP@[..AS
        db 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH, 3BH       ; 0040 _ DFGHJKL;
        db 3AH, 00H, 00H, 5DH, 5AH, 58H, 43H, 56H       ; 0048 _ :..]ZXCV
        db 42H, 4EH, 4DH, 2CH, 2EH, 2FH, 00H, 2AH       ; 0050 _ BNM,./.*
        db 00H, 20H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ . ......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 37H       ; 0060 _ .......7
        db 38H, 39H, 2DH, 34H, 35H, 36H, 2BH, 31H       ; 0068 _ 89-456+1
        db 32H, 33H, 30H, 2EH, 00H, 00H, 00H, 00H       ; 0070 _ 230.....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ ........

keytable1:                                              ; byte
        db 00H, 00H, 21H, 40H, 23H, 24H, 25H, 5EH       ; 0080 _ ..!@#$%^
        db 26H, 2AH, 28H, 29H, 2DH, 3DH, 7EH, 00H       ; 0088 _ &*()-=~.
        db 00H, 51H, 57H, 45H, 52H, 54H, 59H, 55H       ; 0090 _ .QWERTYU
        db 49H, 4FH, 50H, 60H, 7BH, 00H, 00H, 41H       ; 0098 _ IOP`{..A
        db 53H, 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH       ; 00A0 _ SDFGHJKL
        db 2BH, 2AH, 00H, 00H, 7DH, 5AH, 58H, 43H       ; 00A8 _ +*..}ZXC
        db 56H, 42H, 4EH, 4DH, 3CH, 3EH, 3FH, 00H       ; 00B0 _ VBNM<>?.
        db 2AH, 00H, 20H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ *. .....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00C0 _ ........
        db 37H, 38H, 39H, 2DH, 34H, 35H, 36H, 2BH       ; 00C8 _ 789-456+
        db 31H, 32H, 33H, 30H, 2EH, 00H, 00H, 00H       ; 00D0 _ 1230....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00D8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00E0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00E8 _ ........
        db 00H, 00H, 00H, 00H, 5FH, 00H, 00H, 00H       ; 00F0 _ ...._...
        db 00H, 00H, 00H, 00H, 00H, 00H, 7CH, 00H       ; 00F8 _ ......|.
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0100 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0108 _ ........

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0110 _ 0X

?_446:  db 00H                                          ; 0112 _ .

?_447:  db 00H, 00H, 00H, 00H, 00H                      ; 0113 _ .....

mmx:    dd 0FFFFFFFFH                                   ; 0118 _ -1 

mmy:    dd 0FFFFFFFFH                                   ; 011C _ -1 

KEY_CONTROL:                                            ; dword
        dd 0000001DH                                    ; 0120 _ 29 

show_console_window:                                    ; dword
        dd 00000001H                                    ; 0124 _ 1 

console_pos:                                            ; dword
        dd 000000F0H, 00000000H                         ; 0128 _ 240 0 
        dd 00000000H, 00000000H                         ; 0130 _ 0 0 
        dd 00000000H, 00000000H                         ; 0138 _ 0 0 

table_rgb.2131:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0140 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0148 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0150 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0158 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0160 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0168 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0170 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0178 _ ........

cursor.2191:                                            ; byte
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH       ; 0180 _ ********
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2EH, 2EH       ; 0188 _ ******..
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0190 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0198 _ OOOO*...
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01A0 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 01A8 _ OOO*....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01B0 _ *OOOOOOO
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01B8 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01C0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01C8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01D0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01D8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01E0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01E8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01F0 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01F8 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 4FH       ; 0200 _ *OOOO**O
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0208 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2AH       ; 0210 _ *OOO*..*
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0218 _ OOO*....
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0220 _ *OO*....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0228 _ *OOO*...
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0230 _ *O*.....
        db 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 0238 _ .*OOO*..
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0240 _ **......
        db 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 0248 _ ..*OOO*.
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0250 _ *.......
        db 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH       ; 0258 _ ...*OOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0260 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 2AH       ; 0268 _ ....*OO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0270 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2AH, 2AH       ; 0278 _ .....***

closebtn.2310:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0280 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 0288 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0290 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0298 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 02A0 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02A8 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 02B0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 02B8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 02C0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 02C8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 02D0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02D8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 02E0 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02E8 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 02F0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02F8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 0300 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 0308 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0310 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0318 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0320 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0328 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0330 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0338 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0340 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0348 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0350 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0358 _ @@@@@@@@


SECTION .bss    align=32 noexecute                      ; section number 4, bss

key_shift:                                              ; dword
        resd    1                                       ; 0000

caps_lock:                                              ; dword
        resd    1                                       ; 0004

first_task_cons_selector:                               ; dword
        resd    1                                       ; 0008

current_console:                                        ; dword
        resd    1                                       ; 000C

console_count:                                          ; dword
        resd    1                                       ; 0010

bootInfo:                                               ; qword
        resb    4                                       ; 0014

?_448:  resw    1                                       ; 0018

?_449:  resw    1                                       ; 001A

keyinfo:                                                ; byte
        resb    24                                      ; 001C

?_450:  resd    1                                       ; 0034

mouseinfo:                                              ; byte
        resb    40                                      ; 0038

keybuf:                                                 ; yword
        resb    32                                      ; 0060

mousebuf:                                               ; byte
        resb    128                                     ; 0080

mdec:                                                   ; oword
        resb    12                                      ; 0100

?_451:  resd    1                                       ; 010C

timerinfo:                                              ; byte
        resb    28                                      ; 0110

timerbuf: resq  1                                       ; 012C

mx:     resd    1                                       ; 0134

my:     resd    1                                       ; 0138

xsize:  resd    1                                       ; 013C

ysize:  resd    1                                       ; 0140

buf_back: resd  7                                       ; 0144

buf_mouse:                                              ; byte
        resb    256                                     ; 0160

shtMsgBox:                                              ; dword
        resd    1                                       ; 0260

shtctl: resd    1                                       ; 0264

sht_back: resd  1                                       ; 0268

sht_mouse:                                              ; dword
        resd    1                                       ; 026C

mouse_clicked_sht:                                      ; dword
        resd    1                                       ; 0270

task_main:                                              ; dword
        resd    1                                       ; 0274

current_console_task:                                   ; dword
        resd    1                                       ; 0278

task_a.1827:                                            ; dword
        resd    1                                       ; 027C

tss_a.1826:                                             ; byte
        resb    128                                     ; 0280

tss_b.1825:                                             ; byte
        resb    104                                     ; 0300

task_b.1815:                                            ; byte
        resb    12                                      ; 0368

str.2239:                                               ; byte
        resb    1                                       ; 0374

?_452:  resb    9                                       ; 0375

?_453:  resb    2                                       ; 037E

timerctl:                                               ; byte
        resd    2001                                    ; 0380

task_timer:                                             ; dword
        resd    1                                       ; 22C4

taskctl: resd   1                                       ; 22C8


