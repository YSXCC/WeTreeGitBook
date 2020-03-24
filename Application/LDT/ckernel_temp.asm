; Disassembly of file: ckernel.o
; Tue Mar 24 16:15:28 2020
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
global kernel_pos

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
        mov     dword [esp], bootInfo                   ; 000A _ C7. 04 24, 00000018(d)
        call    initBootInfo                            ; 0011 _ E8, FFFFFFFC(rel)
        mov     eax, dword [bootInfo]                   ; 0016 _ A1, 00000018(d)
        mov     dword [ebp-18H], eax                    ; 001B _ 89. 45, E8
        movzx   eax, word [?_421]                       ; 001E _ 0F B7. 05, 0000001C(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 0000013C(d)
        movzx   eax, word [?_422]                       ; 002B _ 0F B7. 05, 0000001E(d)
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
        mov     dword [esp], keyinfo                    ; 011B _ C7. 04 24, 00000020(d)
        call    fifo8_init                              ; 0122 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0127 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 012F _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 128                     ; 0137 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 013F _ C7. 04 24, 0000003C(d)
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
        mov     dword [esp+4H], ?_391                   ; 032A _ C7. 44 24, 04, 00000000(d)
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
        mov     dword [task_a.1822], eax                ; 039B _ A3, 0000027C(d)
        mov     eax, dword [task_a.1822]                ; 03A0 _ A1, 0000027C(d)
        mov     dword [?_423], eax                      ; 03A5 _ A3, 00000038(d)
        mov     eax, dword [task_a.1822]                ; 03AA _ A1, 0000027C(d)
        mov     dword [task_main], eax                  ; 03AF _ A3, 00000274(d)
        mov     eax, dword [task_a.1822]                ; 03B4 _ A1, 0000027C(d)
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
?_001:  mov     dword [esp], keyinfo                    ; 0465 _ C7. 04 24, 00000020(d)
        call    fifo8_status                            ; 046C _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 0471 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 0473 _ C7. 04 24, 0000003C(d)
        call    fifo8_status                            ; 047A _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 047F _ 01. C3
        mov     dword [esp], timerinfo                  ; 0481 _ C7. 04 24, 00000110(d)
        call    fifo8_status                            ; 0488 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 048D _ 01. D8
        test    eax, eax                                ; 048F _ 85. C0
        jnz     ?_002                                   ; 0491 _ 75, 0A
        call    io_sti                                  ; 0493 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 0498 _ E9, 00000412

?_002:  mov     dword [esp], keyinfo                    ; 049D _ C7. 04 24, 00000020(d)
        call    fifo8_status                            ; 04A4 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 04A9 _ 85. C0
        je      ?_013                                   ; 04AB _ 0F 84, 000003CD
        call    io_sti                                  ; 04B1 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 04B6 _ C7. 04 24, 00000020(d)
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
        mov     dword [esp+8H], ?_392                   ; 05E3 _ C7. 44 24, 08, 00000008(d)
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
        mov     dword [esp+8H], ?_393                   ; 0618 _ C7. 44 24, 08, 0000000F(d)
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
        mov     dword [esp+8H], ?_392                   ; 0676 _ C7. 44 24, 08, 00000008(d)
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
        mov     dword [esp+8H], ?_393                   ; 06AB _ C7. 44 24, 08, 0000000F(d)
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
        mov     dword [esp], keyinfo                    ; 085F _ C7. 04 24, 00000020(d)
        call    fifo8_status                            ; 0866 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 086B _ 85. C0
        jnz     ?_014                                   ; 086D _ 75, 40
        mov     eax, dword [task_a.1822]                ; 086F _ A1, 0000027C(d)
        mov     dword [esp], eax                        ; 0874 _ 89. 04 24
        call    task_sleep                              ; 0877 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 087C _ EB, 31

?_013:  mov     dword [esp], mouseinfo                  ; 087E _ C7. 04 24, 0000003C(d)
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
        push    ebx                                     ; 0BC2 _ 53
        sub     esp, 68                                 ; 0BC3 _ 83. EC, 44
        mov     dword [ebp-0CH], 0                      ; 0BC6 _ C7. 45, F4, 00000000
        mov     eax, dword [shtctl]                     ; 0BCD _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 0BD2 _ 89. 04 24
        call    sheet_alloc                             ; 0BD5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0BDA _ 89. 45, F4
        mov     eax, dword [memman]                     ; 0BDD _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 0BE2 _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 0BEA _ 89. 04 24
        call    memman_alloc_4k                         ; 0BED _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0BF2 _ 89. 45, F0
        mov     dword [esp+10H], 99                     ; 0BF5 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 0BFD _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 0C05 _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-10H]                    ; 0C0D _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 0C10 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 0C14 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0C17 _ 89. 04 24
        call    sheet_setbuf                            ; 0C1A _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 0                       ; 0C1F _ 83. 7D, 08, 00
        jle     ?_037                                   ; 0C23 _ 7E, 26
        mov     eax, dword [shtctl]                     ; 0C25 _ A1, 00000264(d)
        mov     dword [esp+0CH], 1                      ; 0C2A _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_393                   ; 0C32 _ C7. 44 24, 08, 0000000F(d)
        mov     edx, dword [ebp-0CH]                    ; 0C3A _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C3D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C41 _ 89. 04 24
        call    make_window8                            ; 0C44 _ E8, FFFFFFFC(rel)
        jmp     ?_038                                   ; 0C49 _ EB, 24

?_037:  mov     eax, dword [shtctl]                     ; 0C4B _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 0C50 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_393                   ; 0C58 _ C7. 44 24, 08, 0000000F(d)
        mov     edx, dword [ebp-0CH]                    ; 0C60 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C63 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C67 _ 89. 04 24
        call    make_window8                            ; 0C6A _ E8, FFFFFFFC(rel)
?_038:  mov     eax, dword [ebp-0CH]                    ; 0C6F _ 8B. 45, F4
        mov     ecx, dword [eax+8H]                     ; 0C72 _ 8B. 48, 08
        mov     eax, dword [ebp-0CH]                    ; 0C75 _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 0C78 _ 8B. 50, 04
        mov     eax, dword [shtctl]                     ; 0C7B _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 0C80 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0C84 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 0C88 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0C90 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 0C98 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C9B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C9F _ 89. 04 24
        call    sheet_refresh                           ; 0CA2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 0CA7 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 0CAF _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 0CB7 _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 0CBF _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 0CC7 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 0CCF _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0CD2 _ 89. 04 24
        call    make_textbox8                           ; 0CD5 _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 0CDA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0CDF _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 0CE2 _ 8B. 45, EC
        mov     edx, dword [ebp-0CH]                    ; 0CE5 _ 8B. 55, F4
        mov     dword [eax+0B4H], edx                   ; 0CE8 _ 89. 90, 000000B4
        mov     eax, dword [ebp-0CH]                    ; 0CEE _ 8B. 45, F4
        mov     edx, dword [ebp-14H]                    ; 0CF1 _ 8B. 55, EC
        mov     dword [eax+20H], edx                    ; 0CF4 _ 89. 50, 20
        mov     eax, dword [current_console_task]       ; 0CF7 _ A1, 00000278(d)
        test    eax, eax                                ; 0CFC _ 85. C0
        jz      ?_039                                   ; 0CFE _ 74, 7C
        mov     eax, dword [current_console_task]       ; 0D00 _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 0D05 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 0D0B _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 0D10 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_393                   ; 0D18 _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], edx                     ; 0D20 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0D24 _ 89. 04 24
        call    make_wtitle8                            ; 0D27 _ E8, FFFFFFFC(rel)
        mov     eax, dword [current_console_task]       ; 0D2C _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 0D31 _ 8B. 80, 000000B4
        mov     ebx, dword [eax+8H]                     ; 0D37 _ 8B. 58, 08
        mov     eax, dword [current_console_task]       ; 0D3A _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 0D3F _ 8B. 80, 000000B4
        mov     ecx, dword [eax+4H]                     ; 0D45 _ 8B. 48, 04
        mov     eax, dword [current_console_task]       ; 0D48 _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 0D4D _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 0D53 _ A1, 00000264(d)
        mov     dword [esp+14H], ebx                    ; 0D58 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 0D5C _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 0D60 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0D68 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0D70 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0D74 _ 89. 04 24
        call    sheet_refresh                           ; 0D77 _ E8, FFFFFFFC(rel)
?_039:  mov     eax, dword [ebp-14H]                    ; 0D7C _ 8B. 45, EC
        mov     dword [current_console_task], eax       ; 0D7F _ A3, 00000278(d)
        call    get_code32_addr                         ; 0D84 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0D89 _ 89. 45, E8
        mov     eax, console_task                       ; 0D8C _ B8, 00000000(d)
        sub     eax, dword [ebp-18H]                    ; 0D91 _ 2B. 45, E8
        mov     edx, eax                                ; 0D94 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 0D96 _ 8B. 45, EC
        mov     dword [eax+4CH], edx                    ; 0D99 _ 89. 50, 4C
        mov     eax, dword [ebp-14H]                    ; 0D9C _ 8B. 45, EC
        mov     dword [eax+74H], 0                      ; 0D9F _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-14H]                    ; 0DA6 _ 8B. 45, EC
        mov     dword [eax+78H], 8                      ; 0DA9 _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-14H]                    ; 0DB0 _ 8B. 45, EC
        mov     dword [eax+7CH], 32                     ; 0DB3 _ C7. 40, 7C, 00000020
        mov     eax, dword [ebp-14H]                    ; 0DBA _ 8B. 45, EC
        mov     dword [eax+80H], 24                     ; 0DBD _ C7. 80, 00000080, 00000018
        mov     eax, dword [ebp-14H]                    ; 0DC7 _ 8B. 45, EC
        mov     dword [eax+84H], 0                      ; 0DCA _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-14H]                    ; 0DD4 _ 8B. 45, EC
        mov     dword [eax+88H], 16                     ; 0DD7 _ C7. 80, 00000088, 00000010
        mov     eax, dword [memman]                     ; 0DE1 _ A1, 00000000(d)
        mov     dword [esp+4H], 65536                   ; 0DE6 _ C7. 44 24, 04, 00010000
        mov     dword [esp], eax                        ; 0DEE _ 89. 04 24
        call    memman_alloc_4k                         ; 0DF1 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-14H]                    ; 0DF6 _ 8B. 55, EC
        mov     dword [edx+0B8H], eax                   ; 0DF9 _ 89. 82, 000000B8
        mov     eax, dword [ebp-14H]                    ; 0DFF _ 8B. 45, EC
        mov     eax, dword [eax+0B8H]                   ; 0E02 _ 8B. 80, 000000B8
        lea     edx, [eax+3F4H]                         ; 0E08 _ 8D. 90, 000003F4
        mov     eax, dword [ebp-14H]                    ; 0E0E _ 8B. 45, EC
        mov     dword [eax+64H], edx                    ; 0E11 _ 89. 50, 64
        mov     eax, dword [ebp-14H]                    ; 0E14 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0E17 _ 8B. 40, 64
        add     eax, 4                                  ; 0E1A _ 83. C0, 04
        mov     edx, dword [ebp-0CH]                    ; 0E1D _ 8B. 55, F4
        mov     dword [eax], edx                        ; 0E20 _ 89. 10
        mov     eax, dword [ebp-14H]                    ; 0E22 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0E25 _ 8B. 40, 64
        add     eax, 8                                  ; 0E28 _ 83. C0, 08
        mov     ebx, eax                                ; 0E2B _ 89. C3
        mov     eax, dword [memman]                     ; 0E2D _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0E32 _ 89. 04 24
        call    memman_total                            ; 0E35 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 0E3A _ 89. 03
        mov     eax, dword [memman]                     ; 0E3C _ A1, 00000000(d)
        mov     dword [esp+4H], 128                     ; 0E41 _ C7. 44 24, 04, 00000080
        mov     dword [esp], eax                        ; 0E49 _ 89. 04 24
        call    memman_alloc                            ; 0E4C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0E51 _ 89. 45, E4
        mov     eax, dword [ebp-14H]                    ; 0E54 _ 8B. 45, EC
        lea     edx, [eax+10H]                          ; 0E57 _ 8D. 50, 10
        mov     eax, dword [ebp-14H]                    ; 0E5A _ 8B. 45, EC
        mov     dword [esp+0CH], eax                    ; 0E5D _ 89. 44 24, 0C
        mov     eax, dword [ebp-1CH]                    ; 0E61 _ 8B. 45, E4
        mov     dword [esp+8H], eax                     ; 0E64 _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 0E68 _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 0E70 _ 89. 14 24
        call    fifo8_init                              ; 0E73 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 5                       ; 0E78 _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 0E80 _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-14H]                    ; 0E88 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0E8B _ 89. 04 24
        call    task_run                                ; 0E8E _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 0                       ; 0E93 _ 83. 7D, 08, 00
        jnz     ?_040                                   ; 0E97 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 0E99 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 0E9C _ 8B. 00
        mov     dword [first_task_cons_selector], eax   ; 0E9E _ A3, 00000000(d)
?_040:  mov     eax, dword [ebp-0CH]                    ; 0EA3 _ 8B. 45, F4
        add     esp, 68                                 ; 0EA6 _ 83. C4, 44
        pop     ebx                                     ; 0EA9 _ 5B
        pop     ebp                                     ; 0EAA _ 5D
        ret                                             ; 0EAB _ C3
; launch_console End of function

kill_process:; Function begin
        push    ebp                                     ; 0EAC _ 55
        mov     ebp, esp                                ; 0EAD _ 89. E5
        sub     esp, 40                                 ; 0EAF _ 83. EC, 28
        call    task_now                                ; 0EB2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0EB7 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 0EBA _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 0EBD _ 8B. 90, 00000094
        mov     eax, dword [ebp-0CH]                    ; 0EC3 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 0EC6 _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 0ECC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0ED0 _ 89. 04 24
        call    cons_newline                            ; 0ED3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 0ED8 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 0EDB _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 0EE1 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 0EE4 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 0EE7 _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 0EED _ 8B. 45, F4
        add     eax, 48                                 ; 0EF0 _ 83. C0, 30
        mov     dword [esp], eax                        ; 0EF3 _ 89. 04 24
        call    asm_end_app                             ; 0EF6 _ E8, FFFFFFFC(rel)
        leave                                           ; 0EFB _ C9
        ret                                             ; 0EFC _ C3
; kill_process End of function

cmd_dir:; Function begin
        push    ebp                                     ; 0EFD _ 55
        mov     ebp, esp                                ; 0EFE _ 89. E5
        push    ebx                                     ; 0F00 _ 53
        sub     esp, 68                                 ; 0F01 _ 83. EC, 44
        call    task_now                                ; 0F04 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0F09 _ 89. 45, E8
        mov     dword [ebp-0CH], 88064                  ; 0F0C _ C7. 45, F4, 00015800
        mov     eax, dword [memman]                     ; 0F13 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 0F18 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 0F20 _ 89. 04 24
        call    memman_alloc                            ; 0F23 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0F28 _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 0F2B _ 8B. 45, E4
        add     eax, 12                                 ; 0F2E _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0F31 _ C6. 00, 00
        jmp     ?_048                                   ; 0F34 _ E9, 0000013C

?_041:  mov     dword [ebp-10H], 0                      ; 0F39 _ C7. 45, F0, 00000000
        jmp     ?_044                                   ; 0F40 _ EB, 2C

?_042:  mov     edx, dword [ebp-0CH]                    ; 0F42 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 0F45 _ 8B. 45, F0
        add     eax, edx                                ; 0F48 _ 01. D0
        movzx   eax, byte [eax]                         ; 0F4A _ 0F B6. 00
        test    al, al                                  ; 0F4D _ 84. C0
        jz      ?_043                                   ; 0F4F _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 0F51 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0F54 _ 8B. 45, E4
        add     edx, eax                                ; 0F57 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 0F59 _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 0F5C _ 8B. 45, F0
        add     eax, ecx                                ; 0F5F _ 01. C8
        movzx   eax, byte [eax]                         ; 0F61 _ 0F B6. 00
        mov     byte [edx], al                          ; 0F64 _ 88. 02
        add     dword [ebp-10H], 1                      ; 0F66 _ 83. 45, F0, 01
        jmp     ?_044                                   ; 0F6A _ EB, 02

?_043:  jmp     ?_045                                   ; 0F6C _ EB, 06

?_044:  cmp     dword [ebp-10H], 7                      ; 0F6E _ 83. 7D, F0, 07
        jle     ?_042                                   ; 0F72 _ 7E, CE
?_045:  mov     dword [ebp-14H], 0                      ; 0F74 _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 0F7B _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0F7E _ 8B. 45, E4
        add     eax, edx                                ; 0F81 _ 01. D0
        mov     byte [eax], 46                          ; 0F83 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 0F86 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 0F8A _ C7. 45, EC, 00000000
        jmp     ?_047                                   ; 0F91 _ EB, 1E

?_046:  mov     edx, dword [ebp-10H]                    ; 0F93 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0F96 _ 8B. 45, E4
        add     edx, eax                                ; 0F99 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 0F9B _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 0F9E _ 8B. 45, EC
        add     eax, ecx                                ; 0FA1 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 0FA3 _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 0FA7 _ 88. 02
        add     dword [ebp-10H], 1                      ; 0FA9 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 0FAD _ 83. 45, EC, 01
?_047:  cmp     dword [ebp-14H], 2                      ; 0FB1 _ 83. 7D, EC, 02
        jle     ?_046                                   ; 0FB5 _ 7E, DC
        mov     eax, dword [ebp-18H]                    ; 0FB7 _ 8B. 45, E8
        mov     ecx, dword [eax+9CH]                    ; 0FBA _ 8B. 88, 0000009C
        mov     eax, dword [ebp-18H]                    ; 0FC0 _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 0FC3 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 0FC9 _ A1, 00000264(d)
        mov     ebx, dword [ebp-1CH]                    ; 0FCE _ 8B. 5D, E4
        mov     dword [esp+14H], ebx                    ; 0FD1 _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 0FD5 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 0FDD _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 0FE1 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 0FE9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0FED _ 89. 04 24
        call    showString                              ; 0FF0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], 136                    ; 0FF5 _ C7. 45, E0, 00000088
        mov     eax, dword [ebp-0CH]                    ; 0FFC _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 0FFF _ 8B. 40, 1C
        mov     dword [esp], eax                        ; 1002 _ 89. 04 24
        call    intToHexStr                             ; 1005 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 100A _ 89. 45, DC
        mov     eax, dword [ebp-18H]                    ; 100D _ 8B. 45, E8
        mov     ecx, dword [eax+9CH]                    ; 1010 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-18H]                    ; 1016 _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 1019 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 101F _ A1, 00000264(d)
        mov     ebx, dword [ebp-24H]                    ; 1024 _ 8B. 5D, DC
        mov     dword [esp+14H], ebx                    ; 1027 _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 102B _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 1033 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-20H]                    ; 1037 _ 8B. 4D, E0
        mov     dword [esp+8H], ecx                     ; 103A _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 103E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1042 _ 89. 04 24
        call    showString                              ; 1045 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 104A _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 104D _ 8B. 90, 00000094
        mov     eax, dword [ebp-18H]                    ; 1053 _ 8B. 45, E8
        mov     eax, dword [eax+9CH]                    ; 1056 _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 105C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1060 _ 89. 04 24
        call    cons_newline                            ; 1063 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-18H]                    ; 1068 _ 8B. 55, E8
        mov     dword [edx+9CH], eax                    ; 106B _ 89. 82, 0000009C
        add     dword [ebp-0CH], 32                     ; 1071 _ 83. 45, F4, 20
?_048:  mov     eax, dword [ebp-0CH]                    ; 1075 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 1078 _ 0F B6. 00
        test    al, al                                  ; 107B _ 84. C0
        jne     ?_041                                   ; 107D _ 0F 85, FFFFFEB6
        mov     edx, dword [ebp-1CH]                    ; 1083 _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 1086 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 108B _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 1093 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1097 _ 89. 04 24
        call    memman_free                             ; 109A _ E8, FFFFFFFC(rel)
        add     esp, 68                                 ; 109F _ 83. C4, 44
        pop     ebx                                     ; 10A2 _ 5B
        pop     ebp                                     ; 10A3 _ 5D
        ret                                             ; 10A4 _ C3
; cmd_dir End of function

cmd_type:; Function begin
        push    ebp                                     ; 10A5 _ 55
        mov     ebp, esp                                ; 10A6 _ 89. E5
        push    esi                                     ; 10A8 _ 56
        push    ebx                                     ; 10A9 _ 53
        sub     esp, 96                                 ; 10AA _ 83. EC, 60
        call    task_now                                ; 10AD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 10B2 _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 10B5 _ 8B. 45, DC
        mov     eax, dword [eax+94H]                    ; 10B8 _ 8B. 80, 00000094
        test    eax, eax                                ; 10BE _ 85. C0
        jnz     ?_049                                   ; 10C0 _ 75, 05
        jmp     ?_071                                   ; 10C2 _ E9, 00000385

?_049:  mov     eax, dword [memman]                     ; 10C7 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 10CC _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 10D4 _ 89. 04 24
        call    memman_alloc                            ; 10D7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 10DC _ 89. 45, D8
        mov     eax, dword [ebp-28H]                    ; 10DF _ 8B. 45, D8
        add     eax, 12                                 ; 10E2 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 10E5 _ C6. 00, 00
        mov     dword [ebp-0CH], 0                      ; 10E8 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 5                      ; 10EF _ C7. 45, F0, 00000005
        mov     dword [ebp-10H], 5                      ; 10F6 _ C7. 45, F0, 00000005
        jmp     ?_052                                   ; 10FD _ EB, 30

?_050:  mov     edx, dword [ebp-10H]                    ; 10FF _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 1102 _ 8B. 45, 08
        add     eax, edx                                ; 1105 _ 01. D0
        movzx   eax, byte [eax]                         ; 1107 _ 0F B6. 00
        test    al, al                                  ; 110A _ 84. C0
        jz      ?_051                                   ; 110C _ 74, 1F
        mov     edx, dword [ebp-0CH]                    ; 110E _ 8B. 55, F4
        mov     eax, dword [ebp-28H]                    ; 1111 _ 8B. 45, D8
        add     edx, eax                                ; 1114 _ 01. C2
        mov     ecx, dword [ebp-10H]                    ; 1116 _ 8B. 4D, F0
        mov     eax, dword [ebp+8H]                     ; 1119 _ 8B. 45, 08
        add     eax, ecx                                ; 111C _ 01. C8
        movzx   eax, byte [eax]                         ; 111E _ 0F B6. 00
        mov     byte [edx], al                          ; 1121 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 1123 _ 83. 45, F4, 01
        add     dword [ebp-10H], 1                      ; 1127 _ 83. 45, F0, 01
        jmp     ?_052                                   ; 112B _ EB, 02

?_051:  jmp     ?_053                                   ; 112D _ EB, 06

?_052:  cmp     dword [ebp-10H], 16                     ; 112F _ 83. 7D, F0, 10
        jle     ?_050                                   ; 1133 _ 7E, CA
?_053:  mov     edx, dword [ebp-0CH]                    ; 1135 _ 8B. 55, F4
        mov     eax, dword [ebp-28H]                    ; 1138 _ 8B. 45, D8
        add     eax, edx                                ; 113B _ 01. D0
        mov     byte [eax], 0                           ; 113D _ C6. 00, 00
        mov     dword [ebp-14H], 88064                  ; 1140 _ C7. 45, EC, 00015800
        jmp     ?_069                                   ; 1147 _ E9, 000002A2

?_054:  mov     byte [ebp-31H], 0                       ; 114C _ C6. 45, CF, 00
        mov     dword [ebp-18H], 0                      ; 1150 _ C7. 45, E8, 00000000
        jmp     ?_057                                   ; 1157 _ EB, 2C

?_055:  mov     edx, dword [ebp-14H]                    ; 1159 _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 115C _ 8B. 45, E8
        add     eax, edx                                ; 115F _ 01. D0
        movzx   eax, byte [eax]                         ; 1161 _ 0F B6. 00
        test    al, al                                  ; 1164 _ 84. C0
        jz      ?_056                                   ; 1166 _ 74, 1B
        mov     edx, dword [ebp-14H]                    ; 1168 _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 116B _ 8B. 45, E8
        add     eax, edx                                ; 116E _ 01. D0
        movzx   eax, byte [eax]                         ; 1170 _ 0F B6. 00
        lea     ecx, [ebp-3DH]                          ; 1173 _ 8D. 4D, C3
        mov     edx, dword [ebp-18H]                    ; 1176 _ 8B. 55, E8
        add     edx, ecx                                ; 1179 _ 01. CA
        mov     byte [edx], al                          ; 117B _ 88. 02
        add     dword [ebp-18H], 1                      ; 117D _ 83. 45, E8, 01
        jmp     ?_057                                   ; 1181 _ EB, 02

?_056:  jmp     ?_058                                   ; 1183 _ EB, 06

?_057:  cmp     dword [ebp-18H], 7                      ; 1185 _ 83. 7D, E8, 07
        jle     ?_055                                   ; 1189 _ 7E, CE
?_058:  mov     dword [ebp-1CH], 0                      ; 118B _ C7. 45, E4, 00000000
        lea     edx, [ebp-3DH]                          ; 1192 _ 8D. 55, C3
        mov     eax, dword [ebp-18H]                    ; 1195 _ 8B. 45, E8
        add     eax, edx                                ; 1198 _ 01. D0
        mov     byte [eax], 46                          ; 119A _ C6. 00, 2E
        add     dword [ebp-18H], 1                      ; 119D _ 83. 45, E8, 01
        mov     dword [ebp-1CH], 0                      ; 11A1 _ C7. 45, E4, 00000000
        jmp     ?_060                                   ; 11A8 _ EB, 1E

?_059:  mov     edx, dword [ebp-14H]                    ; 11AA _ 8B. 55, EC
        mov     eax, dword [ebp-1CH]                    ; 11AD _ 8B. 45, E4
        add     eax, edx                                ; 11B0 _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 11B2 _ 0F B6. 40, 08
        lea     ecx, [ebp-3DH]                          ; 11B6 _ 8D. 4D, C3
        mov     edx, dword [ebp-18H]                    ; 11B9 _ 8B. 55, E8
        add     edx, ecx                                ; 11BC _ 01. CA
        mov     byte [edx], al                          ; 11BE _ 88. 02
        add     dword [ebp-18H], 1                      ; 11C0 _ 83. 45, E8, 01
        add     dword [ebp-1CH], 1                      ; 11C4 _ 83. 45, E4, 01
?_060:  cmp     dword [ebp-1CH], 2                      ; 11C8 _ 83. 7D, E4, 02
        jle     ?_059                                   ; 11CC _ 7E, DC
        lea     eax, [ebp-3DH]                          ; 11CE _ 8D. 45, C3
        mov     dword [esp+4H], eax                     ; 11D1 _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 11D5 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 11D8 _ 89. 04 24
        call    strcmp                                  ; 11DB _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 11E0 _ 83. F8, 01
        jne     ?_068                                   ; 11E3 _ 0F 85, 00000201
        mov     dword [ebp-2CH], 97280                  ; 11E9 _ C7. 45, D4, 00017C00
        mov     eax, dword [ebp-14H]                    ; 11F0 _ 8B. 45, EC
        movzx   eax, word [eax+1AH]                     ; 11F3 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 11F7 _ 0F B7. C0
        shl     eax, 9                                  ; 11FA _ C1. E0, 09
        add     dword [ebp-2CH], eax                    ; 11FD _ 01. 45, D4
        mov     eax, dword [ebp-14H]                    ; 1200 _ 8B. 45, EC
        mov     eax, dword [eax+1CH]                    ; 1203 _ 8B. 40, 1C
        mov     dword [ebp-30H], eax                    ; 1206 _ 89. 45, D0
        mov     dword [ebp-20H], 0                      ; 1209 _ C7. 45, E0, 00000000
        mov     eax, dword [ebp-24H]                    ; 1210 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 1213 _ C7. 80, 00000098, 00000010
        mov     dword [ebp-20H], 0                      ; 121D _ C7. 45, E0, 00000000
        jmp     ?_067                                   ; 1224 _ E9, 000001B2

?_061:  mov     edx, dword [ebp-20H]                    ; 1229 _ 8B. 55, E0
        mov     eax, dword [ebp-2CH]                    ; 122C _ 8B. 45, D4
        add     eax, edx                                ; 122F _ 01. D0
        movzx   eax, byte [eax]                         ; 1231 _ 0F B6. 00
        mov     byte [ebp-3FH], al                      ; 1234 _ 88. 45, C1
        mov     byte [ebp-3EH], 0                       ; 1237 _ C6. 45, C2, 00
        movzx   eax, byte [ebp-3FH]                     ; 123B _ 0F B6. 45, C1
        cmp     al, 9                                   ; 123F _ 3C, 09
        jne     ?_064                                   ; 1241 _ 0F 85, 000000A7
?_062:  mov     eax, dword [ebp-24H]                    ; 1247 _ 8B. 45, DC
        mov     ebx, dword [eax+9CH]                    ; 124A _ 8B. 98, 0000009C
        mov     eax, dword [ebp-24H]                    ; 1250 _ 8B. 45, DC
        mov     ecx, dword [eax+98H]                    ; 1253 _ 8B. 88, 00000098
        mov     eax, dword [ebp-24H]                    ; 1259 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 125C _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1262 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_394                  ; 1267 _ C7. 44 24, 14, 00000017(d)
        mov     dword [esp+10H], 7                      ; 126F _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 1277 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 127B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 127F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1283 _ 89. 04 24
        call    showString                              ; 1286 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 128B _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 128E _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 1294 _ 8D. 50, 08
        mov     eax, dword [ebp-24H]                    ; 1297 _ 8B. 45, DC
        mov     dword [eax+98H], edx                    ; 129A _ 89. 90, 00000098
        mov     eax, dword [ebp-24H]                    ; 12A0 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 12A3 _ 8B. 80, 00000098
        cmp     eax, 248                                ; 12A9 _ 3D, 000000F8
        jnz     ?_063                                   ; 12AE _ 75, 39
        mov     eax, dword [ebp-24H]                    ; 12B0 _ 8B. 45, DC
        mov     dword [eax+98H], 8                      ; 12B3 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-24H]                    ; 12BD _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 12C0 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 12C6 _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 12C9 _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 12CF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 12D3 _ 89. 04 24
        call    cons_newline                            ; 12D6 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 12DB _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 12DE _ 89. 82, 0000009C
        jmp     ?_062                                   ; 12E4 _ E9, FFFFFF5E

?_063:  jmp     ?_062                                   ; 12E9 _ E9, FFFFFF59

?_064:  movzx   eax, byte [ebp-3FH]                     ; 12EE _ 0F B6. 45, C1
        cmp     al, 10                                  ; 12F2 _ 3C, 0A
        jnz     ?_065                                   ; 12F4 _ 75, 39
        mov     eax, dword [ebp-24H]                    ; 12F6 _ 8B. 45, DC
        mov     dword [eax+98H], 8                      ; 12F9 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-24H]                    ; 1303 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1306 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 130C _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 130F _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 1315 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1319 _ 89. 04 24
        call    cons_newline                            ; 131C _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 1321 _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 1324 _ 89. 82, 0000009C
        jmp     ?_066                                   ; 132A _ E9, 000000A8

?_065:  movzx   eax, byte [ebp-3FH]                     ; 132F _ 0F B6. 45, C1
        cmp     al, 13                                  ; 1333 _ 3C, 0D
        je      ?_066                                   ; 1335 _ 0F 84, 0000009C
        mov     eax, dword [ebp-24H]                    ; 133B _ 8B. 45, DC
        mov     ebx, dword [eax+9CH]                    ; 133E _ 8B. 98, 0000009C
        mov     eax, dword [ebp-24H]                    ; 1344 _ 8B. 45, DC
        mov     ecx, dword [eax+98H]                    ; 1347 _ 8B. 88, 00000098
        mov     eax, dword [ebp-24H]                    ; 134D _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1350 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1356 _ A1, 00000264(d)
        lea     esi, [ebp-3FH]                          ; 135B _ 8D. 75, C1
        mov     dword [esp+14H], esi                    ; 135E _ 89. 74 24, 14
        mov     dword [esp+10H], 7                      ; 1362 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 136A _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 136E _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1372 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1376 _ 89. 04 24
        call    showString                              ; 1379 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 137E _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 1381 _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 1387 _ 8D. 50, 08
        mov     eax, dword [ebp-24H]                    ; 138A _ 8B. 45, DC
        mov     dword [eax+98H], edx                    ; 138D _ 89. 90, 00000098
        mov     eax, dword [ebp-24H]                    ; 1393 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 1396 _ 8B. 80, 00000098
        cmp     eax, 248                                ; 139C _ 3D, 000000F8
        jnz     ?_066                                   ; 13A1 _ 75, 34
        mov     eax, dword [ebp-24H]                    ; 13A3 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 13A6 _ C7. 80, 00000098, 00000010
        mov     eax, dword [ebp-24H]                    ; 13B0 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 13B3 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 13B9 _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 13BC _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 13C2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 13C6 _ 89. 04 24
        call    cons_newline                            ; 13C9 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 13CE _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 13D1 _ 89. 82, 0000009C
?_066:  add     dword [ebp-20H], 1                      ; 13D7 _ 83. 45, E0, 01
?_067:  mov     eax, dword [ebp-20H]                    ; 13DB _ 8B. 45, E0
        cmp     eax, dword [ebp-30H]                    ; 13DE _ 3B. 45, D0
        jl      ?_061                                   ; 13E1 _ 0F 8C, FFFFFE42
        nop                                             ; 13E7 _ 90
        jmp     ?_070                                   ; 13E8 _ EB, 12

?_068:  add     dword [ebp-14H], 32                     ; 13EA _ 83. 45, EC, 20
?_069:  mov     eax, dword [ebp-14H]                    ; 13EE _ 8B. 45, EC
        movzx   eax, byte [eax]                         ; 13F1 _ 0F B6. 00
        test    al, al                                  ; 13F4 _ 84. C0
        jne     ?_054                                   ; 13F6 _ 0F 85, FFFFFD50
?_070:  mov     eax, dword [ebp-24H]                    ; 13FC _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 13FF _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 1405 _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 1408 _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 140E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1412 _ 89. 04 24
        call    cons_newline                            ; 1415 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 141A _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 141D _ 89. 82, 0000009C
        mov     edx, dword [ebp-28H]                    ; 1423 _ 8B. 55, D8
        mov     eax, dword [memman]                     ; 1426 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 142B _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 1433 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1437 _ 89. 04 24
        call    memman_free                             ; 143A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 143F _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 1442 _ C7. 80, 00000098, 00000010
?_071:  add     esp, 96                                 ; 144C _ 83. C4, 60
        pop     ebx                                     ; 144F _ 5B
        pop     esi                                     ; 1450 _ 5E
        pop     ebp                                     ; 1451 _ 5D
        ret                                             ; 1452 _ C3
; cmd_type End of function

cmd_mem:; Function begin
        push    ebp                                     ; 1453 _ 55
        mov     ebp, esp                                ; 1454 _ 89. E5
        push    ebx                                     ; 1456 _ 53
        sub     esp, 52                                 ; 1457 _ 83. EC, 34
        call    task_now                                ; 145A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 145F _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 1462 _ 8B. 45, F4
        mov     eax, dword [eax+94H]                    ; 1465 _ 8B. 80, 00000094
        test    eax, eax                                ; 146B _ 85. C0
        jnz     ?_072                                   ; 146D _ 75, 05
        jmp     ?_073                                   ; 146F _ E9, 000000FF

?_072:  mov     eax, dword [ebp+8H]                     ; 1474 _ 8B. 45, 08
        lea     edx, [eax+3FFH]                         ; 1477 _ 8D. 90, 000003FF
        test    eax, eax                                ; 147D _ 85. C0
        cmovs   eax, edx                                ; 147F _ 0F 48. C2
        sar     eax, 10                                 ; 1482 _ C1. F8, 0A
        mov     dword [esp], eax                        ; 1485 _ 89. 04 24
        call    intToHexStr                             ; 1488 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 148D _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 1490 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 1493 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 1499 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 149C _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 14A2 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_395                  ; 14A7 _ C7. 44 24, 14, 00000019(d)
        mov     dword [esp+10H], 7                      ; 14AF _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 14B7 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 14BB _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 14C3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 14C7 _ 89. 04 24
        call    showString                              ; 14CA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 14CF _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 14D2 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 14D8 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 14DB _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 14E1 _ A1, 00000264(d)
        mov     ebx, dword [ebp-10H]                    ; 14E6 _ 8B. 5D, F0
        mov     dword [esp+14H], ebx                    ; 14E9 _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 14ED _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 14F5 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 52                      ; 14F9 _ C7. 44 24, 08, 00000034
        mov     dword [esp+4H], edx                     ; 1501 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1505 _ 89. 04 24
        call    showString                              ; 1508 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 150D _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 1510 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 1516 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 1519 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 151F _ A1, 00000264(d)
        mov     dword [esp+14H], ?_396                  ; 1524 _ C7. 44 24, 14, 0000001F(d)
        mov     dword [esp+10H], 7                      ; 152C _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 1534 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 126                     ; 1538 _ C7. 44 24, 08, 0000007E
        mov     dword [esp+4H], edx                     ; 1540 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1544 _ 89. 04 24
        call    showString                              ; 1547 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 154C _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 154F _ 8B. 90, 00000094
        mov     eax, dword [ebp-0CH]                    ; 1555 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 1558 _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 155E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1562 _ 89. 04 24
        call    cons_newline                            ; 1565 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-0CH]                    ; 156A _ 8B. 55, F4
        mov     dword [edx+9CH], eax                    ; 156D _ 89. 82, 0000009C
?_073:  add     esp, 52                                 ; 1573 _ 83. C4, 34
        pop     ebx                                     ; 1576 _ 5B
        pop     ebp                                     ; 1577 _ 5D
        ret                                             ; 1578 _ C3
; cmd_mem End of function

cmd_cls:; Function begin
        push    ebp                                     ; 1579 _ 55
        mov     ebp, esp                                ; 157A _ 89. E5
        sub     esp, 56                                 ; 157C _ 83. EC, 38
        call    task_now                                ; 157F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1584 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 1587 _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 158A _ 8B. 80, 00000094
        test    eax, eax                                ; 1590 _ 85. C0
        jnz     ?_074                                   ; 1592 _ 75, 05
        jmp     ?_079                                   ; 1594 _ E9, 000000E2

?_074:  mov     dword [ebp-0CH], 8                      ; 1599 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 28                     ; 15A0 _ C7. 45, F0, 0000001C
        mov     dword [ebp-10H], 28                     ; 15A7 _ C7. 45, F0, 0000001C
        jmp     ?_078                                   ; 15AE _ EB, 41

?_075:  mov     dword [ebp-0CH], 8                      ; 15B0 _ C7. 45, F4, 00000008
        jmp     ?_077                                   ; 15B7 _ EB, 2B

?_076:  mov     eax, dword [ebp-14H]                    ; 15B9 _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 15BC _ 8B. 80, 00000094
        mov     edx, dword [eax]                        ; 15C2 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 15C4 _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 15C7 _ 8B. 80, 00000094
        mov     eax, dword [eax+4H]                     ; 15CD _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 15D0 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 15D4 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 15D6 _ 8B. 45, F4
        add     eax, ecx                                ; 15D9 _ 01. C8
        add     eax, edx                                ; 15DB _ 01. D0
        mov     byte [eax], 0                           ; 15DD _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 15E0 _ 83. 45, F4, 01
?_077:  cmp     dword [ebp-0CH], 247                    ; 15E4 _ 81. 7D, F4, 000000F7
        jle     ?_076                                   ; 15EB _ 7E, CC
        add     dword [ebp-10H], 1                      ; 15ED _ 83. 45, F0, 01
?_078:  cmp     dword [ebp-10H], 155                    ; 15F1 _ 81. 7D, F0, 0000009B
        jle     ?_075                                   ; 15F8 _ 7E, B6
        mov     eax, dword [ebp-14H]                    ; 15FA _ 8B. 45, EC
        mov     edx, dword [eax+94H]                    ; 15FD _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1603 _ A1, 00000264(d)
        mov     dword [esp+14H], 156                    ; 1608 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 1610 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 1618 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1620 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1628 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 162C _ 89. 04 24
        call    sheet_refresh                           ; 162F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 1634 _ 8B. 45, EC
        mov     dword [eax+9CH], 28                     ; 1637 _ C7. 80, 0000009C, 0000001C
        mov     eax, dword [ebp-14H]                    ; 1641 _ 8B. 45, EC
        mov     edx, dword [eax+94H]                    ; 1644 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 164A _ A1, 00000264(d)
        mov     dword [esp+14H], ?_397                  ; 164F _ C7. 44 24, 14, 00000023(d)
        mov     dword [esp+10H], 7                      ; 1657 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 165F _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1667 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 166F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1673 _ 89. 04 24
        call    showString                              ; 1676 _ E8, FFFFFFFC(rel)
?_079:  leave                                           ; 167B _ C9
        ret                                             ; 167C _ C3
; cmd_cls End of function

cmd_execute_program:; Function begin
        push    ebp                                     ; 167D _ 55
        mov     ebp, esp                                ; 167E _ 89. E5
        sub     esp, 72                                 ; 1680 _ 83. EC, 48
        call    io_cli                                  ; 1683 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 1688 _ A1, 00000000(d)
        mov     dword [esp+4H], 16                      ; 168D _ C7. 44 24, 04, 00000010
        mov     dword [esp], eax                        ; 1695 _ 89. 04 24
        call    memman_alloc                            ; 1698 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 169D _ 89. 45, F4
        call    task_now                                ; 16A0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 16A5 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 16A8 _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 16AB _ 8B. 55, F4
        mov     dword [eax+0B0H], edx                   ; 16AE _ 89. 90, 000000B0
        mov     eax, dword [ebp-0CH]                    ; 16B4 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 16B7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16BB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16BE _ 89. 04 24
        call    file_loadfile                           ; 16C1 _ E8, FFFFFFFC(rel)
        call    get_addr_gdt                            ; 16C6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 16CB _ 89. 45, EC
        mov     eax, dword [ebp-10H]                    ; 16CE _ 8B. 45, F0
        mov     edx, dword [eax]                        ; 16D1 _ 8B. 10
        mov     eax, dword [first_task_cons_selector]   ; 16D3 _ A1, 00000000(d)
        sub     edx, eax                                ; 16D8 _ 29. C2
        mov     eax, edx                                ; 16DA _ 89. D0
        lea     edx, [eax+7H]                           ; 16DC _ 8D. 50, 07
        test    eax, eax                                ; 16DF _ 85. C0
        cmovs   eax, edx                                ; 16E1 _ 0F 48. C2
        sar     eax, 3                                  ; 16E4 _ C1. F8, 03
        add     eax, 21                                 ; 16E7 _ 83. C0, 15
        mov     dword [ebp-18H], eax                    ; 16EA _ 89. 45, E8
        mov     eax, dword [ebp-10H]                    ; 16ED _ 8B. 45, F0
        mov     edx, dword [eax]                        ; 16F0 _ 8B. 10
        mov     eax, dword [first_task_cons_selector]   ; 16F2 _ A1, 00000000(d)
        sub     edx, eax                                ; 16F7 _ 29. C2
        mov     eax, edx                                ; 16F9 _ 89. D0
        lea     edx, [eax+7H]                           ; 16FB _ 8D. 50, 07
        test    eax, eax                                ; 16FE _ 85. C0
        cmovs   eax, edx                                ; 1700 _ 0F 48. C2
        sar     eax, 3                                  ; 1703 _ C1. F8, 03
        add     eax, 30                                 ; 1706 _ 83. C0, 1E
        mov     dword [ebp-1CH], eax                    ; 1709 _ 89. 45, E4
        mov     eax, dword [ebp-0CH]                    ; 170C _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 170F _ 8B. 00
        mov     edx, dword [ebp-10H]                    ; 1711 _ 8B. 55, F0
        add     edx, 188                                ; 1714 _ 81. C2, 000000BC
        mov     dword [esp+0CH], 16634                  ; 171A _ C7. 44 24, 0C, 000040FA
        mov     dword [esp+8H], eax                     ; 1722 _ 89. 44 24, 08
        mov     dword [esp+4H], 1048575                 ; 1726 _ C7. 44 24, 04, 000FFFFF
        mov     dword [esp], edx                        ; 172E _ 89. 14 24
        call    set_segmdesc                            ; 1731 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 1736 _ A1, 00000000(d)
        mov     dword [esp+4H], 65536                   ; 173B _ C7. 44 24, 04, 00010000
        mov     dword [esp], eax                        ; 1743 _ 89. 04 24
        call    memman_alloc_4k                         ; 1746 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 174B _ 89. 45, E0
        mov     eax, dword [ebp-0CH]                    ; 174E _ 8B. 45, F4
        mov     edx, dword [ebp-20H]                    ; 1751 _ 8B. 55, E0
        mov     dword [eax+4H], edx                     ; 1754 _ 89. 50, 04
        mov     eax, dword [ebp-20H]                    ; 1757 _ 8B. 45, E0
        mov     edx, dword [ebp-10H]                    ; 175A _ 8B. 55, F0
        add     edx, 196                                ; 175D _ 81. C2, 000000C4
        mov     dword [esp+0CH], 16626                  ; 1763 _ C7. 44 24, 0C, 000040F2
        mov     dword [esp+8H], eax                     ; 176B _ 89. 44 24, 08
        mov     dword [esp+4H], 77055                   ; 176F _ C7. 44 24, 04, 00012CFF
        mov     dword [esp], edx                        ; 1777 _ 89. 14 24
        call    set_segmdesc                            ; 177A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 177F _ 8B. 45, F0
        mov     dword [eax+30H], 0                      ; 1782 _ C7. 40, 30, 00000000
        call    io_sti                                  ; 1789 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 178E _ 8B. 45, F0
        add     eax, 48                                 ; 1791 _ 83. C0, 30
        mov     dword [esp+10H], eax                    ; 1794 _ 89. 44 24, 10
        mov     dword [esp+0CH], 12                     ; 1798 _ C7. 44 24, 0C, 0000000C
        mov     dword [esp+8H], 65536                   ; 17A0 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], 4                       ; 17A8 _ C7. 44 24, 04, 00000004
        mov     dword [esp], 0                          ; 17B0 _ C7. 04 24, 00000000
        call    start_app                               ; 17B7 _ E8, FFFFFFFC(rel)
        call    io_cli                                  ; 17BC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 17C1 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 17C4 _ 8B. 40, 08
        mov     ecx, eax                                ; 17C7 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 17C9 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 17CC _ 8B. 00
        mov     edx, eax                                ; 17CE _ 89. C2
        mov     eax, dword [memman]                     ; 17D0 _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 17D5 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 17D9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 17DD _ 89. 04 24
        call    memman_free_4k                          ; 17E0 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-20H]                    ; 17E5 _ 8B. 55, E0
        mov     eax, dword [memman]                     ; 17E8 _ A1, 00000000(d)
        mov     dword [esp+8H], 65536                   ; 17ED _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], edx                     ; 17F5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 17F9 _ 89. 04 24
        call    memman_free_4k                          ; 17FC _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-0CH]                    ; 1801 _ 8B. 55, F4
        mov     eax, dword [memman]                     ; 1804 _ A1, 00000000(d)
        mov     dword [esp+8H], 16                      ; 1809 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 1811 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1815 _ 89. 04 24
        call    memman_free                             ; 1818 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 181D _ 8B. 45, F0
        mov     dword [eax+0B0H], 0                     ; 1820 _ C7. 80, 000000B0, 00000000
        call    io_sti                                  ; 182A _ E8, FFFFFFFC(rel)
        leave                                           ; 182F _ C9
        ret                                             ; 1830 _ C3
; cmd_execute_program End of function

cmd_start:; Function begin
        push    ebp                                     ; 1831 _ 55
        mov     ebp, esp                                ; 1832 _ 89. E5
        sub     esp, 40                                 ; 1834 _ 83. EC, 28
        mov     eax, dword [console_count]              ; 1837 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 183C _ 89. 04 24
        call    launch_console                          ; 183F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1844 _ 89. 45, F0
        mov     eax, dword [shtctl]                     ; 1847 _ A1, 00000264(d)
        mov     dword [esp+0CH], 176                    ; 184C _ C7. 44 24, 0C, 000000B0
        mov     dword [esp+8H], 156                     ; 1854 _ C7. 44 24, 08, 0000009C
        mov     edx, dword [ebp-10H]                    ; 185C _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 185F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1863 _ 89. 04 24
        call    sheet_slide                             ; 1866 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 186B _ A1, 00000264(d)
        mov     dword [esp+8H], 1                       ; 1870 _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-10H]                    ; 1878 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 187B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 187F _ 89. 04 24
        call    sheet_updown                            ; 1882 _ E8, FFFFFFFC(rel)
        mov     eax, dword [console_count]              ; 1887 _ A1, 00000000(d)
        add     eax, 1                                  ; 188C _ 83. C0, 01
        mov     dword [console_count], eax              ; 188F _ A3, 00000000(d)
        mov     eax, dword [ebp-10H]                    ; 1894 _ 8B. 45, F0
        mov     eax, dword [eax+20H]                    ; 1897 _ 8B. 40, 20
        mov     dword [ebp-14H], eax                    ; 189A _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 189D _ 8B. 45, EC
        mov     dword [eax+28H], 0                      ; 18A0 _ C7. 40, 28, 00000000
        mov     dword [ebp-0CH], 6                      ; 18A7 _ C7. 45, F4, 00000006
        jmp     ?_081                                   ; 18AE _ EB, 24

?_080:  mov     edx, dword [ebp-0CH]                    ; 18B0 _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 18B3 _ 8B. 45, 08
        add     eax, edx                                ; 18B6 _ 01. D0
        movzx   eax, byte [eax]                         ; 18B8 _ 0F B6. 00
        movzx   eax, al                                 ; 18BB _ 0F B6. C0
        mov     edx, dword [ebp-14H]                    ; 18BE _ 8B. 55, EC
        add     edx, 16                                 ; 18C1 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 18C4 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 18C8 _ 89. 14 24
        call    fifo8_put                               ; 18CB _ E8, FFFFFFFC(rel)
        add     dword [ebp-0CH], 1                      ; 18D0 _ 83. 45, F4, 01
?_081:  mov     edx, dword [ebp-0CH]                    ; 18D4 _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 18D7 _ 8B. 45, 08
        add     eax, edx                                ; 18DA _ 01. D0
        movzx   eax, byte [eax]                         ; 18DC _ 0F B6. 00
        test    al, al                                  ; 18DF _ 84. C0
        jnz     ?_080                                   ; 18E1 _ 75, CD
        mov     eax, dword [ebp-14H]                    ; 18E3 _ 8B. 45, EC
        mov     edx, dword [ebp-14H]                    ; 18E6 _ 8B. 55, EC
        mov     dword [eax+28H], edx                    ; 18E9 _ 89. 50, 28
        mov     eax, dword [ebp-14H]                    ; 18EC _ 8B. 45, EC
        add     eax, 16                                 ; 18EF _ 83. C0, 10
        mov     dword [esp+4H], 28                      ; 18F2 _ C7. 44 24, 04, 0000001C
        mov     dword [esp], eax                        ; 18FA _ 89. 04 24
        call    fifo8_put                               ; 18FD _ E8, FFFFFFFC(rel)
        leave                                           ; 1902 _ C9
        ret                                             ; 1903 _ C3
; cmd_start End of function

cmd_ncst:; Function begin
        push    ebp                                     ; 1904 _ 55
        mov     ebp, esp                                ; 1905 _ 89. E5
        sub     esp, 40                                 ; 1907 _ 83. EC, 28
        mov     eax, dword [console_count]              ; 190A _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 190F _ 89. 04 24
        call    launch_console                          ; 1912 _ E8, FFFFFFFC(rel)
        mov     eax, dword [console_count]              ; 1917 _ A1, 00000000(d)
        add     eax, 1                                  ; 191C _ 83. C0, 01
        mov     dword [console_count], eax              ; 191F _ A3, 00000000(d)
        mov     eax, dword [current_console_task]       ; 1924 _ A1, 00000278(d)
        mov     dword [ebp-10H], eax                    ; 1929 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 192C _ 8B. 45, F0
        mov     dword [eax+28H], 0                      ; 192F _ C7. 40, 28, 00000000
        mov     dword [ebp-0CH], 5                      ; 1936 _ C7. 45, F4, 00000005
        mov     dword [ebp-14H], 0                      ; 193D _ C7. 45, EC, 00000000
        jmp     ?_083                                   ; 1944 _ EB, 24

?_082:  mov     edx, dword [ebp-0CH]                    ; 1946 _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 1949 _ 8B. 45, 08
        add     eax, edx                                ; 194C _ 01. D0
        movzx   eax, byte [eax]                         ; 194E _ 0F B6. 00
        movzx   eax, al                                 ; 1951 _ 0F B6. C0
        mov     edx, dword [ebp-10H]                    ; 1954 _ 8B. 55, F0
        add     edx, 16                                 ; 1957 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 195A _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 195E _ 89. 14 24
        call    fifo8_put                               ; 1961 _ E8, FFFFFFFC(rel)
        add     dword [ebp-0CH], 1                      ; 1966 _ 83. 45, F4, 01
?_083:  mov     edx, dword [ebp-0CH]                    ; 196A _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 196D _ 8B. 45, 08
        add     eax, edx                                ; 1970 _ 01. D0
        movzx   eax, byte [eax]                         ; 1972 _ 0F B6. 00
        test    al, al                                  ; 1975 _ 84. C0
        jnz     ?_082                                   ; 1977 _ 75, CD
        mov     eax, dword [ebp-10H]                    ; 1979 _ 8B. 45, F0
        mov     edx, dword [ebp-10H]                    ; 197C _ 8B. 55, F0
        mov     dword [eax+28H], edx                    ; 197F _ 89. 50, 28
        mov     eax, dword [ebp-10H]                    ; 1982 _ 8B. 45, F0
        add     eax, 16                                 ; 1985 _ 83. C0, 10
        mov     dword [esp+4H], 28                      ; 1988 _ C7. 44 24, 04, 0000001C
        mov     dword [esp], eax                        ; 1990 _ 89. 04 24
        call    fifo8_put                               ; 1993 _ E8, FFFFFFFC(rel)
        leave                                           ; 1998 _ C9
        ret                                             ; 1999 _ C3
; cmd_ncst End of function

console_task:; Function begin
        push    ebp                                     ; 199A _ 55
        mov     ebp, esp                                ; 199B _ 89. E5
        push    esi                                     ; 199D _ 56
        push    ebx                                     ; 199E _ 53
        sub     esp, 112                                ; 199F _ 83. EC, 70
        call    task_now                                ; 19A2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 19A7 _ 89. 45, F0
        mov     dword [ebp-0CH], 0                      ; 19AA _ C7. 45, F4, 00000000
        mov     dword [ebp-14H], 0                      ; 19B1 _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 19B8 _ C7. 45, E8, 00000000
        mov     eax, dword [memman]                     ; 19BF _ A1, 00000000(d)
        mov     dword [esp+4H], 30                      ; 19C4 _ C7. 44 24, 04, 0000001E
        mov     dword [esp], eax                        ; 19CC _ 89. 04 24
        call    memman_alloc                            ; 19CF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 19D4 _ 89. 45, E4
        mov     dword [ebp-20H], 96                     ; 19D7 _ C7. 45, E0, 00000060
        mov     dword [ebp-24H], 176                    ; 19DE _ C7. 45, DC, 000000B0
        mov     eax, dword [ebp-10H]                    ; 19E5 _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 19E8 _ 8B. 55, 08
        mov     dword [eax+94H], edx                    ; 19EB _ 89. 90, 00000094
        mov     eax, dword [ebp-10H]                    ; 19F1 _ 8B. 45, F0
        mov     dword [eax+98H], 16                     ; 19F4 _ C7. 80, 00000098, 00000010
        mov     eax, dword [ebp-10H]                    ; 19FE _ 8B. 45, F0
        mov     dword [eax+9CH], 28                     ; 1A01 _ C7. 80, 0000009C, 0000001C
        mov     eax, dword [ebp-10H]                    ; 1A0B _ 8B. 45, F0
        mov     dword [eax+0A0H], -1                    ; 1A0E _ C7. 80, 000000A0, FFFFFFFF
        call    timer_alloc                             ; 1A18 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 1A1D _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 1A20 _ 8B. 45, F0
        add     eax, 16                                 ; 1A23 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 1A26 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 1A2E _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 1A32 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1A35 _ 89. 04 24
        call    timer_init                              ; 1A38 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 1A3D _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 1A45 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1A48 _ 89. 04 24
        call    timer_settime                           ; 1A4B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1A50 _ 8B. 45, F0
        mov     edx, dword [ebp-28H]                    ; 1A53 _ 8B. 55, D8
        mov     dword [eax+0A8H], edx                   ; 1A56 _ 89. 90, 000000A8
        mov     eax, dword [ebp-10H]                    ; 1A5C _ 8B. 45, F0
        mov     edx, dword [ebp-1CH]                    ; 1A5F _ 8B. 55, E4
        mov     dword [eax+0ACH], edx                   ; 1A62 _ 89. 90, 000000AC
        mov     eax, dword [shtctl]                     ; 1A68 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_397                  ; 1A6D _ C7. 44 24, 14, 00000023(d)
        mov     dword [esp+10H], 7                      ; 1A75 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 1A7D _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1A85 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+8H]                     ; 1A8D _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1A90 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A94 _ 89. 04 24
        call    showString                              ; 1A97 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], 88064                  ; 1A9C _ C7. 45, D4, 00015800
        mov     dword [ebp-30H], 0                      ; 1AA3 _ C7. 45, D0, 00000000
?_084:  call    io_cli                                  ; 1AAA _ E8, FFFFFFFC(rel)
        call    task_now                                ; 1AAF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1AB4 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 1AB7 _ 8B. 45, F0
        add     eax, 16                                 ; 1ABA _ 83. C0, 10
        mov     dword [esp], eax                        ; 1ABD _ 89. 04 24
        call    fifo8_status                            ; 1AC0 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1AC5 _ 85. C0
        jnz     ?_085                                   ; 1AC7 _ 75, 0A
        call    io_sti                                  ; 1AC9 _ E8, FFFFFFFC(rel)
        jmp     ?_103                                   ; 1ACE _ E9, 000004F9

?_085:  mov     eax, dword [ebp-10H]                    ; 1AD3 _ 8B. 45, F0
        add     eax, 16                                 ; 1AD6 _ 83. C0, 10
        mov     dword [esp], eax                        ; 1AD9 _ 89. 04 24
        call    fifo8_get                               ; 1ADC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 1AE1 _ 89. 45, CC
        cmp     dword [ebp-34H], 1                      ; 1AE4 _ 83. 7D, CC, 01
        jg      ?_088                                   ; 1AE8 _ 7F, 6E
        cmp     dword [ebp-0CH], 0                      ; 1AEA _ 83. 7D, F4, 00
        js      ?_088                                   ; 1AEE _ 78, 68
        cmp     dword [ebp-34H], 0                      ; 1AF0 _ 83. 7D, CC, 00
        jz      ?_086                                   ; 1AF4 _ 74, 26
        mov     eax, dword [ebp-10H]                    ; 1AF6 _ 8B. 45, F0
        add     eax, 16                                 ; 1AF9 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 1AFC _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 1B04 _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 1B08 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1B0B _ 89. 04 24
        call    timer_init                              ; 1B0E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 7                      ; 1B13 _ C7. 45, F4, 00000007
        jmp     ?_087                                   ; 1B1A _ EB, 24

?_086:  mov     eax, dword [ebp-10H]                    ; 1B1C _ 8B. 45, F0
        add     eax, 16                                 ; 1B1F _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 1B22 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 1B2A _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 1B2E _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1B31 _ 89. 04 24
        call    timer_init                              ; 1B34 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 1B39 _ C7. 45, F4, 00000000
?_087:  mov     dword [esp+4H], 50                      ; 1B40 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 1B48 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1B4B _ 89. 04 24
        call    timer_settime                           ; 1B4E _ E8, FFFFFFFC(rel)
        jmp     ?_102                                   ; 1B53 _ E9, 00000426

?_088:  cmp     dword [ebp-34H], 87                     ; 1B58 _ 83. 7D, CC, 57
        jnz     ?_089                                   ; 1B5C _ 75, 3C
        mov     dword [ebp-0CH], 7                      ; 1B5E _ C7. 45, F4, 00000007
        mov     eax, dword [ebp-10H]                    ; 1B65 _ 8B. 45, F0
        add     eax, 16                                 ; 1B68 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 1B6B _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 1B73 _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 1B77 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1B7A _ 89. 04 24
        call    timer_init                              ; 1B7D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 1B82 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 1B8A _ 8B. 45, D8
        mov     dword [esp], eax                        ; 1B8D _ 89. 04 24
        call    timer_settime                           ; 1B90 _ E8, FFFFFFFC(rel)
        jmp     ?_102                                   ; 1B95 _ E9, 000003E4

?_089:  cmp     dword [ebp-34H], 88                     ; 1B9A _ 83. 7D, CC, 58
        jnz     ?_090                                   ; 1B9E _ 75, 6A
        mov     eax, dword [ebp-10H]                    ; 1BA0 _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1BA3 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1BA9 _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1BAC _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1BB2 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1BB7 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1BBF _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1BC3 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1BC7 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1BCA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BCE _ 89. 04 24
        call    set_cursor                              ; 1BD1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], -1                     ; 1BD6 _ C7. 45, F4, FFFFFFFF
        mov     eax, dword [task_main]                  ; 1BDD _ A1, 00000274(d)
        mov     dword [esp+8H], 0                       ; 1BE2 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 1BEA _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 1BF2 _ 89. 04 24
        call    task_run                                ; 1BF5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1BFA _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1BFD _ 89. 04 24
        call    task_sleep                              ; 1C00 _ E8, FFFFFFFC(rel)
        jmp     ?_102                                   ; 1C05 _ E9, 00000374

?_090:  cmp     dword [ebp-34H], 28                     ; 1C0A _ 83. 7D, CC, 1C
        jne     ?_100                                   ; 1C0E _ 0F 85, 0000020D
        mov     eax, dword [ebp-10H]                    ; 1C14 _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1C17 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1C1D _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1C20 _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1C26 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1C2B _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1C33 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1C37 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1C3B _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1C3E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C42 _ 89. 04 24
        call    set_cursor                              ; 1C45 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1C4A _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1C4D _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1C53 _ 8D. 50, 07
        test    eax, eax                                ; 1C56 _ 85. C0
        cmovs   eax, edx                                ; 1C58 _ 0F 48. C2
        sar     eax, 3                                  ; 1C5B _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1C5E _ 8D. 50, FE
        mov     eax, dword [ebp-1CH]                    ; 1C61 _ 8B. 45, E4
        add     eax, edx                                ; 1C64 _ 01. D0
        mov     byte [eax], 0                           ; 1C66 _ C6. 00, 00
        mov     eax, dword [ebp-10H]                    ; 1C69 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1C6C _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1C72 _ 8D. 50, 07
        test    eax, eax                                ; 1C75 _ 85. C0
        cmovs   eax, edx                                ; 1C77 _ 0F 48. C2
        sar     eax, 3                                  ; 1C7A _ C1. F8, 03
        sub     eax, 2                                  ; 1C7D _ 83. E8, 02
        mov     byte [ebp+eax-55H], 0                   ; 1C80 _ C6. 44 05, AB, 00
        mov     eax, dword [ebp-10H]                    ; 1C85 _ 8B. 45, F0
        mov     eax, dword [eax+9CH]                    ; 1C88 _ 8B. 80, 0000009C
        mov     edx, dword [ebp+8H]                     ; 1C8E _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1C91 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C95 _ 89. 04 24
        call    cons_newline                            ; 1C98 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-10H]                    ; 1C9D _ 8B. 55, F0
        mov     dword [edx+9CH], eax                    ; 1CA0 _ 89. 82, 0000009C
        mov     dword [esp+4H], ?_398                   ; 1CA6 _ C7. 44 24, 04, 00000025(d)
        mov     eax, dword [ebp-1CH]                    ; 1CAE _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1CB1 _ 89. 04 24
        call    strcmp                                  ; 1CB4 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1CB9 _ 83. F8, 01
        jnz     ?_091                                   ; 1CBC _ 75, 10
        mov     eax, dword [ebp+0CH]                    ; 1CBE _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 1CC1 _ 89. 04 24
        call    cmd_mem                                 ; 1CC4 _ E8, FFFFFFFC(rel)
        jmp     ?_099                                   ; 1CC9 _ E9, 00000141

?_091:  mov     dword [esp+4H], ?_399                   ; 1CCE _ C7. 44 24, 04, 00000029(d)
        mov     eax, dword [ebp-1CH]                    ; 1CD6 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1CD9 _ 89. 04 24
        call    strcmp                                  ; 1CDC _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1CE1 _ 83. F8, 01
        jnz     ?_092                                   ; 1CE4 _ 75, 0A
        call    cmd_cls                                 ; 1CE6 _ E8, FFFFFFFC(rel)
        jmp     ?_099                                   ; 1CEB _ E9, 0000011F

?_092:  mov     dword [esp+4H], ?_400                   ; 1CF0 _ C7. 44 24, 04, 0000002D(d)
        mov     eax, dword [ebp-1CH]                    ; 1CF8 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1CFB _ 89. 04 24
        call    strcmp                                  ; 1CFE _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1D03 _ 83. F8, 01
        jnz     ?_093                                   ; 1D06 _ 75, 11
        mov     dword [esp], ?_401                      ; 1D08 _ C7. 04 24, 00000031(d)
        call    cmd_execute_program                     ; 1D0F _ E8, FFFFFFFC(rel)
        jmp     ?_099                                   ; 1D14 _ E9, 000000F6

?_093:  mov     dword [esp+4H], ?_402                   ; 1D19 _ C7. 44 24, 04, 00000039(d)
        mov     eax, dword [ebp-1CH]                    ; 1D21 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1D24 _ 89. 04 24
        call    strcmp                                  ; 1D27 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1D2C _ 83. F8, 01
        jnz     ?_094                                   ; 1D2F _ 75, 0A
        call    cmd_dir                                 ; 1D31 _ E8, FFFFFFFC(rel)
        jmp     ?_099                                   ; 1D36 _ E9, 000000D4

?_094:  mov     dword [esp+4H], ?_403                   ; 1D3B _ C7. 44 24, 04, 0000003D(d)
        mov     eax, dword [ebp-1CH]                    ; 1D43 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1D46 _ 89. 04 24
        call    strcmp                                  ; 1D49 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1D4E _ 83. F8, 01
        jnz     ?_095                                   ; 1D51 _ 75, 10
        mov     eax, dword [ebp-10H]                    ; 1D53 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1D56 _ 89. 04 24
        call    cmd_exit                                ; 1D59 _ E8, FFFFFFFC(rel)
        jmp     ?_099                                   ; 1D5E _ E9, 000000AC

?_095:  mov     eax, dword [ebp-1CH]                    ; 1D63 _ 8B. 45, E4
        movzx   eax, byte [eax]                         ; 1D66 _ 0F B6. 00
        cmp     al, 116                                 ; 1D69 _ 3C, 74
        jnz     ?_096                                   ; 1D6B _ 75, 34
        mov     eax, dword [ebp-1CH]                    ; 1D6D _ 8B. 45, E4
        add     eax, 1                                  ; 1D70 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 1D73 _ 0F B6. 00
        cmp     al, 121                                 ; 1D76 _ 3C, 79
        jnz     ?_096                                   ; 1D78 _ 75, 27
        mov     eax, dword [ebp-1CH]                    ; 1D7A _ 8B. 45, E4
        add     eax, 2                                  ; 1D7D _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 1D80 _ 0F B6. 00
        cmp     al, 112                                 ; 1D83 _ 3C, 70
        jnz     ?_096                                   ; 1D85 _ 75, 1A
        mov     eax, dword [ebp-1CH]                    ; 1D87 _ 8B. 45, E4
        add     eax, 3                                  ; 1D8A _ 83. C0, 03
        movzx   eax, byte [eax]                         ; 1D8D _ 0F B6. 00
        cmp     al, 101                                 ; 1D90 _ 3C, 65
        jnz     ?_096                                   ; 1D92 _ 75, 0D
        mov     eax, dword [ebp-1CH]                    ; 1D94 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1D97 _ 89. 04 24
        call    cmd_type                                ; 1D9A _ E8, FFFFFFFC(rel)
        jmp     ?_099                                   ; 1D9F _ EB, 6E

?_096:  mov     dword [esp+4H], ?_404                   ; 1DA1 _ C7. 44 24, 04, 00000042(d)
        mov     eax, dword [ebp-1CH]                    ; 1DA9 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1DAC _ 89. 04 24
        call    strcmp                                  ; 1DAF _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1DB4 _ 83. F8, 01
        jnz     ?_097                                   ; 1DB7 _ 75, 0D
        lea     eax, [ebp-55H]                          ; 1DB9 _ 8D. 45, AB
        mov     dword [esp], eax                        ; 1DBC _ 89. 04 24
        call    cmd_start                               ; 1DBF _ E8, FFFFFFFC(rel)
        jmp     ?_099                                   ; 1DC4 _ EB, 49

?_097:  mov     dword [esp+4H], ?_405                   ; 1DC6 _ C7. 44 24, 04, 00000048(d)
        mov     eax, dword [ebp-1CH]                    ; 1DCE _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1DD1 _ 89. 04 24
        call    strcmp                                  ; 1DD4 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1DD9 _ 83. F8, 01
        jnz     ?_098                                   ; 1DDC _ 75, 0D
        lea     eax, [ebp-55H]                          ; 1DDE _ 8D. 45, AB
        mov     dword [esp], eax                        ; 1DE1 _ 89. 04 24
        call    cmd_ncst                                ; 1DE4 _ E8, FFFFFFFC(rel)
        jmp     ?_099                                   ; 1DE9 _ EB, 24

?_098:  mov     dword [esp+4H], ?_406                   ; 1DEB _ C7. 44 24, 04, 0000004D(d)
        mov     eax, dword [ebp-1CH]                    ; 1DF3 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 1DF6 _ 89. 04 24
        call    strcmp                                  ; 1DF9 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1DFE _ 83. F8, 01
        jnz     ?_099                                   ; 1E01 _ 75, 0C
        mov     dword [esp], ?_407                      ; 1E03 _ C7. 04 24, 00000053(d)
        call    cmd_execute_program                     ; 1E0A _ E8, FFFFFFFC(rel)
?_099:  mov     eax, dword [ebp-10H]                    ; 1E0F _ 8B. 45, F0
        mov     dword [eax+98H], 16                     ; 1E12 _ C7. 80, 00000098, 00000010
        jmp     ?_102                                   ; 1E1C _ E9, 0000015D

?_100:  cmp     dword [ebp-34H], 14                     ; 1E21 _ 83. 7D, CC, 0E
        jne     ?_101                                   ; 1E25 _ 0F 85, 00000098
        mov     eax, dword [ebp-10H]                    ; 1E2B _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1E2E _ 8B. 80, 00000098
        cmp     eax, 8                                  ; 1E34 _ 83. F8, 08
        jle     ?_101                                   ; 1E37 _ 0F 8E, 00000086
        mov     eax, dword [ebp-10H]                    ; 1E3D _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1E40 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1E46 _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1E49 _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1E4F _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1E54 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1E5C _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1E60 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1E64 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1E67 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E6B _ 89. 04 24
        call    set_cursor                              ; 1E6E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1E73 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1E76 _ 8B. 80, 00000098
        lea     edx, [eax-8H]                           ; 1E7C _ 8D. 50, F8
        mov     eax, dword [ebp-10H]                    ; 1E7F _ 8B. 45, F0
        mov     dword [eax+98H], edx                    ; 1E82 _ 89. 90, 00000098
        mov     eax, dword [ebp-10H]                    ; 1E88 _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1E8B _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1E91 _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1E94 _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1E9A _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1E9F _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1EA7 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1EAB _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1EAF _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1EB2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1EB6 _ 89. 04 24
        call    set_cursor                              ; 1EB9 _ E8, FFFFFFFC(rel)
        jmp     ?_102                                   ; 1EBE _ E9, 000000BB

?_101:  mov     eax, dword [ebp-34H]                    ; 1EC3 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 1EC6 _ 89. 04 24
        call    transferScanCode                        ; 1EC9 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-35H], al                      ; 1ECE _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 1ED1 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1ED4 _ 8B. 80, 00000098
        cmp     eax, 239                                ; 1EDA _ 3D, 000000EF
        jg      ?_102                                   ; 1EDF _ 0F 8F, 00000099
        cmp     byte [ebp-35H], 0                       ; 1EE5 _ 80. 7D, CB, 00
        je      ?_102                                   ; 1EE9 _ 0F 84, 0000008F
        mov     eax, dword [ebp-10H]                    ; 1EEF _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1EF2 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1EF8 _ 8D. 50, 07
        test    eax, eax                                ; 1EFB _ 85. C0
        cmovs   eax, edx                                ; 1EFD _ 0F 48. C2
        sar     eax, 3                                  ; 1F00 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1F03 _ 8D. 50, FE
        mov     eax, dword [ebp-1CH]                    ; 1F06 _ 8B. 45, E4
        add     edx, eax                                ; 1F09 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 1F0B _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 1F0F _ 88. 02
        mov     eax, dword [ebp-10H]                    ; 1F11 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1F14 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1F1A _ 8D. 50, 07
        test    eax, eax                                ; 1F1D _ 85. C0
        cmovs   eax, edx                                ; 1F1F _ 0F 48. C2
        sar     eax, 3                                  ; 1F22 _ C1. F8, 03
        lea     edx, [eax-1H]                           ; 1F25 _ 8D. 50, FF
        mov     eax, dword [ebp-1CH]                    ; 1F28 _ 8B. 45, E4
        add     eax, edx                                ; 1F2B _ 01. D0
        mov     byte [eax], 0                           ; 1F2D _ C6. 00, 00
        mov     eax, dword [ebp-10H]                    ; 1F30 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1F33 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1F39 _ 8D. 50, 07
        test    eax, eax                                ; 1F3C _ 85. C0
        cmovs   eax, edx                                ; 1F3E _ 0F 48. C2
        sar     eax, 3                                  ; 1F41 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1F44 _ 8D. 50, FE
        mov     eax, dword [ebp-34H]                    ; 1F47 _ 8B. 45, CC
        mov     byte [ebp+edx-55H], al                  ; 1F4A _ 88. 44 15, AB
        mov     eax, dword [ebp-10H]                    ; 1F4E _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1F51 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1F57 _ 8D. 50, 07
        test    eax, eax                                ; 1F5A _ 85. C0
        cmovs   eax, edx                                ; 1F5C _ 0F 48. C2
        sar     eax, 3                                  ; 1F5F _ C1. F8, 03
        sub     eax, 1                                  ; 1F62 _ 83. E8, 01
        mov     byte [ebp+eax-55H], 0                   ; 1F65 _ C6. 44 05, AB, 00
        movsx   eax, byte [ebp-35H]                     ; 1F6A _ 0F BE. 45, CB
        mov     dword [esp+4H], 1                       ; 1F6E _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 1F76 _ 89. 04 24
        call    cons_putchar                            ; 1F79 _ E8, FFFFFFFC(rel)
?_102:  cmp     dword [ebp-0CH], 0                      ; 1F7E _ 83. 7D, F4, 00
        js      ?_103                                   ; 1F82 _ 78, 48
        mov     eax, dword [ebp-10H]                    ; 1F84 _ 8B. 45, F0
        mov     eax, dword [eax+94H]                    ; 1F87 _ 8B. 80, 00000094
        test    eax, eax                                ; 1F8D _ 85. C0
        jz      ?_103                                   ; 1F8F _ 74, 3B
        mov     eax, dword [ebp-10H]                    ; 1F91 _ 8B. 45, F0
        mov     ebx, dword [eax+9CH]                    ; 1F94 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1F9A _ 8B. 45, F0
        mov     ecx, dword [eax+98H]                    ; 1F9D _ 8B. 88, 00000098
        mov     eax, dword [ebp-10H]                    ; 1FA3 _ 8B. 45, F0
        mov     edx, dword [eax+94H]                    ; 1FA6 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1FAC _ A1, 00000264(d)
        mov     esi, dword [ebp-0CH]                    ; 1FB1 _ 8B. 75, F4
        mov     dword [esp+10H], esi                    ; 1FB4 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1FB8 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1FBC _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1FC0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1FC4 _ 89. 04 24
        call    set_cursor                              ; 1FC7 _ E8, FFFFFFFC(rel)
?_103:  call    io_sti                                  ; 1FCC _ E8, FFFFFFFC(rel)
        jmp     ?_084                                   ; 1FD1 _ E9, FFFFFAD4
; console_task End of function

cons_putstr:; Function begin
        push    ebp                                     ; 1FD6 _ 55
        mov     ebp, esp                                ; 1FD7 _ 89. E5
        sub     esp, 24                                 ; 1FD9 _ 83. EC, 18
        jmp     ?_105                                   ; 1FDC _ EB, 1D

?_104:  mov     eax, dword [ebp+8H]                     ; 1FDE _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1FE1 _ 0F B6. 00
        movsx   eax, al                                 ; 1FE4 _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 1FE7 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 1FEF _ 89. 04 24
        call    cons_putchar                            ; 1FF2 _ E8, FFFFFFFC(rel)
        add     dword [ebp+8H], 1                       ; 1FF7 _ 83. 45, 08, 01
?_105:  mov     eax, dword [ebp+8H]                     ; 1FFB _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1FFE _ 0F B6. 00
        test    al, al                                  ; 2001 _ 84. C0
        jnz     ?_104                                   ; 2003 _ 75, D9
        nop                                             ; 2005 _ 90
        leave                                           ; 2006 _ C9
        ret                                             ; 2007 _ C3
; cons_putstr End of function

api_linewin:; Function begin
        push    ebp                                     ; 2008 _ 55
        mov     ebp, esp                                ; 2009 _ 89. E5
        sub     esp, 32                                 ; 200B _ 83. EC, 20
        mov     eax, dword [ebp+0CH]                    ; 200E _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2011 _ 8B. 55, 14
        sub     edx, eax                                ; 2014 _ 29. C2
        mov     eax, edx                                ; 2016 _ 89. D0
        mov     dword [ebp-14H], eax                    ; 2018 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 201B _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 201E _ 8B. 55, 18
        sub     edx, eax                                ; 2021 _ 29. C2
        mov     eax, edx                                ; 2023 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 2025 _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 2028 _ 8B. 45, 0C
        shl     eax, 10                                 ; 202B _ C1. E0, 0A
        mov     dword [ebp-8H], eax                     ; 202E _ 89. 45, F8
        mov     eax, dword [ebp+10H]                    ; 2031 _ 8B. 45, 10
        shl     eax, 10                                 ; 2034 _ C1. E0, 0A
        mov     dword [ebp-0CH], eax                    ; 2037 _ 89. 45, F4
        cmp     dword [ebp-14H], 0                      ; 203A _ 83. 7D, EC, 00
        jns     ?_106                                   ; 203E _ 79, 03
        neg     dword [ebp-14H]                         ; 2040 _ F7. 5D, EC
?_106:  cmp     dword [ebp-18H], 0                      ; 2043 _ 83. 7D, E8, 00
        jns     ?_107                                   ; 2047 _ 79, 03
        neg     dword [ebp-18H]                         ; 2049 _ F7. 5D, E8
?_107:  mov     eax, dword [ebp-14H]                    ; 204C _ 8B. 45, EC
        cmp     eax, dword [ebp-18H]                    ; 204F _ 3B. 45, E8
        jl      ?_111                                   ; 2052 _ 7C, 5B
        mov     eax, dword [ebp-14H]                    ; 2054 _ 8B. 45, EC
        add     eax, 1                                  ; 2057 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 205A _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 205D _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 2060 _ 3B. 45, 14
        jle     ?_108                                   ; 2063 _ 7E, 09
        mov     dword [ebp-14H], -1024                  ; 2065 _ C7. 45, EC, FFFFFC00
        jmp     ?_109                                   ; 206C _ EB, 07

?_108:  mov     dword [ebp-14H], 1024                   ; 206E _ C7. 45, EC, 00000400
?_109:  mov     eax, dword [ebp+10H]                    ; 2075 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 2078 _ 3B. 45, 18
        jg      ?_110                                   ; 207B _ 7F, 19
        mov     eax, dword [ebp+10H]                    ; 207D _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 2080 _ 8B. 55, 18
        sub     edx, eax                                ; 2083 _ 29. C2
        mov     eax, edx                                ; 2085 _ 89. D0
        add     eax, 1                                  ; 2087 _ 83. C0, 01
        shl     eax, 10                                 ; 208A _ C1. E0, 0A
        cdq                                             ; 208D _ 99
        idiv    dword [ebp-10H]                         ; 208E _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 2091 _ 89. 45, E8
        jmp     ?_115                                   ; 2094 _ EB, 72

?_110:  mov     eax, dword [ebp+10H]                    ; 2096 _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 2099 _ 8B. 55, 18
        sub     edx, eax                                ; 209C _ 29. C2
        mov     eax, edx                                ; 209E _ 89. D0
        sub     eax, 1                                  ; 20A0 _ 83. E8, 01
        shl     eax, 10                                 ; 20A3 _ C1. E0, 0A
        cdq                                             ; 20A6 _ 99
        idiv    dword [ebp-10H]                         ; 20A7 _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 20AA _ 89. 45, E8
        jmp     ?_115                                   ; 20AD _ EB, 59

?_111:  mov     eax, dword [ebp-18H]                    ; 20AF _ 8B. 45, E8
        add     eax, 1                                  ; 20B2 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 20B5 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 20B8 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 20BB _ 3B. 45, 18
        jle     ?_112                                   ; 20BE _ 7E, 09
        mov     dword [ebp-18H], -1024                  ; 20C0 _ C7. 45, E8, FFFFFC00
        jmp     ?_113                                   ; 20C7 _ EB, 07

?_112:  mov     dword [ebp-18H], 1024                   ; 20C9 _ C7. 45, E8, 00000400
?_113:  mov     eax, dword [ebp+0CH]                    ; 20D0 _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 20D3 _ 3B. 45, 14
        jg      ?_114                                   ; 20D6 _ 7F, 19
        mov     eax, dword [ebp+0CH]                    ; 20D8 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 20DB _ 8B. 55, 14
        sub     edx, eax                                ; 20DE _ 29. C2
        mov     eax, edx                                ; 20E0 _ 89. D0
        add     eax, 1                                  ; 20E2 _ 83. C0, 01
        shl     eax, 10                                 ; 20E5 _ C1. E0, 0A
        cdq                                             ; 20E8 _ 99
        idiv    dword [ebp-10H]                         ; 20E9 _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 20EC _ 89. 45, EC
        jmp     ?_115                                   ; 20EF _ EB, 17

?_114:  mov     eax, dword [ebp+0CH]                    ; 20F1 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 20F4 _ 8B. 55, 14
        sub     edx, eax                                ; 20F7 _ 29. C2
        mov     eax, edx                                ; 20F9 _ 89. D0
        sub     eax, 1                                  ; 20FB _ 83. E8, 01
        shl     eax, 10                                 ; 20FE _ C1. E0, 0A
        cdq                                             ; 2101 _ 99
        idiv    dword [ebp-10H]                         ; 2102 _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 2105 _ 89. 45, EC
?_115:  mov     dword [ebp-4H], 0                       ; 2108 _ C7. 45, FC, 00000000
        jmp     ?_117                                   ; 210F _ EB, 35

?_116:  mov     eax, dword [ebp+8H]                     ; 2111 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2114 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 2116 _ 8B. 45, F4
        sar     eax, 10                                 ; 2119 _ C1. F8, 0A
        mov     ecx, eax                                ; 211C _ 89. C1
        mov     eax, dword [ebp+8H]                     ; 211E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2121 _ 8B. 40, 04
        imul    eax, ecx                                ; 2124 _ 0F AF. C1
        mov     ecx, dword [ebp-8H]                     ; 2127 _ 8B. 4D, F8
        sar     ecx, 10                                 ; 212A _ C1. F9, 0A
        add     eax, ecx                                ; 212D _ 01. C8
        add     edx, eax                                ; 212F _ 01. C2
        mov     eax, dword [ebp+1CH]                    ; 2131 _ 8B. 45, 1C
        mov     byte [edx], al                          ; 2134 _ 88. 02
        mov     eax, dword [ebp-14H]                    ; 2136 _ 8B. 45, EC
        add     dword [ebp-8H], eax                     ; 2139 _ 01. 45, F8
        mov     eax, dword [ebp-18H]                    ; 213C _ 8B. 45, E8
        add     dword [ebp-0CH], eax                    ; 213F _ 01. 45, F4
        add     dword [ebp-4H], 1                       ; 2142 _ 83. 45, FC, 01
?_117:  mov     eax, dword [ebp-4H]                     ; 2146 _ 8B. 45, FC
        cmp     eax, dword [ebp-10H]                    ; 2149 _ 3B. 45, F0
        jl      ?_116                                   ; 214C _ 7C, C3
        leave                                           ; 214E _ C9
        ret                                             ; 214F _ C3
; api_linewin End of function

handle_keyboard:; Function begin
        push    ebp                                     ; 2150 _ 55
        mov     ebp, esp                                ; 2151 _ 89. E5
        sub     esp, 56                                 ; 2153 _ 83. EC, 38
?_118:  call    io_cli                                  ; 2156 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 215B _ 8B. 45, 08
        add     eax, 16                                 ; 215E _ 83. C0, 10
        mov     dword [esp], eax                        ; 2161 _ 89. 04 24
        call    fifo8_status                            ; 2164 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 2169 _ 85. C0
        jnz     ?_120                                   ; 216B _ 75, 2B
        call    io_sti                                  ; 216D _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+0CH], 0                      ; 2172 _ 83. 7D, 0C, 00
        jz      ?_119                                   ; 2176 _ 74, 05
        jmp     ?_124                                   ; 2178 _ E9, 000000DC

?_119:  call    io_sti                                  ; 217D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2182 _ 8B. 45, 10
        add     eax, 28                                 ; 2185 _ 83. C0, 1C
        mov     dword [eax], -1                         ; 2188 _ C7. 00, FFFFFFFF
        mov     eax, 0                                  ; 218E _ B8, 00000000
        jmp     ?_125                                   ; 2193 _ E9, 000000C6

?_120:  mov     eax, dword [ebp+8H]                     ; 2198 _ 8B. 45, 08
        add     eax, 16                                 ; 219B _ 83. C0, 10
        mov     dword [esp], eax                        ; 219E _ 89. 04 24
        call    fifo8_get                               ; 21A1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 21A6 _ 89. 45, F4
        call    io_sti                                  ; 21A9 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 255                    ; 21AE _ 81. 7D, F4, 000000FF
        jle     ?_121                                   ; 21B5 _ 7E, 37
        mov     edx, dword [sht_back]                   ; 21B7 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 21BD _ A1, 00000264(d)
        mov     dword [esp+14H], ?_408                  ; 21C2 _ C7. 44 24, 14, 0000005D(d)
        mov     dword [esp+10H], 7                      ; 21CA _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 176                    ; 21D2 _ C7. 44 24, 0C, 000000B0
        mov     dword [esp+8H], 0                       ; 21DA _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 21E2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 21E6 _ 89. 04 24
        call    showString                              ; 21E9 _ E8, FFFFFFFC(rel)
?_121:  cmp     dword [ebp-0CH], 1                      ; 21EE _ 83. 7D, F4, 01
        jg      ?_122                                   ; 21F2 _ 7F, 3E
        mov     eax, dword [ebp+8H]                     ; 21F4 _ 8B. 45, 08
        lea     edx, [eax+10H]                          ; 21F7 _ 8D. 50, 10
        mov     eax, dword [ebp+8H]                     ; 21FA _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 21FD _ 8B. 80, 000000A8
        mov     dword [esp+8H], 1                       ; 2203 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], edx                     ; 220B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 220F _ 89. 04 24
        call    timer_init                              ; 2212 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2217 _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 221A _ 8B. 80, 000000A8
        mov     dword [esp+4H], 50                      ; 2220 _ C7. 44 24, 04, 00000032
        mov     dword [esp], eax                        ; 2228 _ 89. 04 24
        call    timer_settime                           ; 222B _ E8, FFFFFFFC(rel)
        jmp     ?_124                                   ; 2230 _ EB, 27

?_122:  cmp     dword [ebp-0CH], 2                      ; 2232 _ 83. 7D, F4, 02
        jnz     ?_123                                   ; 2236 _ 75, 0F
        mov     eax, dword [ebp+8H]                     ; 2238 _ 8B. 45, 08
        mov     dword [eax+0A0H], 7                     ; 223B _ C7. 80, 000000A0, 00000007
        jmp     ?_124                                   ; 2245 _ EB, 12

?_123:  mov     eax, dword [ebp+10H]                    ; 2247 _ 8B. 45, 10
        lea     edx, [eax+1CH]                          ; 224A _ 8D. 50, 1C
        mov     eax, dword [ebp-0CH]                    ; 224D _ 8B. 45, F4
        mov     dword [edx], eax                        ; 2250 _ 89. 02
        mov     eax, 0                                  ; 2252 _ B8, 00000000
        jmp     ?_125                                   ; 2257 _ EB, 05

?_124:  jmp     ?_118                                   ; 2259 _ E9, FFFFFEF8

?_125:  leave                                           ; 225E _ C9
        ret                                             ; 225F _ C3
; handle_keyboard End of function

close_constask:; Function begin
        push    ebp                                     ; 2260 _ 55
        mov     ebp, esp                                ; 2261 _ 89. E5
        sub     esp, 24                                 ; 2263 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 2266 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2269 _ 89. 04 24
        call    task_sleep                              ; 226C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2271 _ 8B. 45, 08
        mov     eax, dword [eax+0B8H]                   ; 2274 _ 8B. 80, 000000B8
        mov     edx, eax                                ; 227A _ 89. C2
        mov     eax, dword [memman]                     ; 227C _ A1, 00000000(d)
        mov     dword [esp+8H], 65536                   ; 2281 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], edx                     ; 2289 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 228D _ 89. 04 24
        call    memman_free_4k                          ; 2290 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2295 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2298 _ 8B. 40, 10
        mov     edx, eax                                ; 229B _ 89. C2
        mov     eax, dword [memman]                     ; 229D _ A1, 00000000(d)
        mov     dword [esp+8H], 128                     ; 22A2 _ C7. 44 24, 08, 00000080
        mov     dword [esp+4H], edx                     ; 22AA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 22AE _ 89. 04 24
        call    memman_free                             ; 22B1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 22B6 _ 8B. 45, 08
        mov     eax, dword [eax+0ACH]                   ; 22B9 _ 8B. 80, 000000AC
        mov     edx, eax                                ; 22BF _ 89. C2
        mov     eax, dword [memman]                     ; 22C1 _ A1, 00000000(d)
        mov     dword [esp+8H], 30                      ; 22C6 _ C7. 44 24, 08, 0000001E
        mov     dword [esp+4H], edx                     ; 22CE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 22D2 _ 89. 04 24
        call    memman_free                             ; 22D5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 22DA _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 22DD _ C7. 40, 04, 00000000
        mov     dword [current_console_task], 0         ; 22E4 _ C7. 05, 00000278(d), 00000000
        leave                                           ; 22EE _ C9
        ret                                             ; 22EF _ C3
; close_constask End of function

close_console:; Function begin
        push    ebp                                     ; 22F0 _ 55
        mov     ebp, esp                                ; 22F1 _ 89. E5
        sub     esp, 40                                 ; 22F3 _ 83. EC, 28
        mov     eax, dword [ebp+8H]                     ; 22F6 _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 22F9 _ 8B. 80, 000000A8
        mov     dword [esp], eax                        ; 22FF _ 89. 04 24
        call    timer_free                              ; 2302 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2307 _ 8B. 45, 08
        mov     eax, dword [eax+0B4H]                   ; 230A _ 8B. 80, 000000B4
        test    eax, eax                                ; 2310 _ 85. C0
        jz      ?_126                                   ; 2312 _ 74, 40
        mov     eax, dword [ebp+8H]                     ; 2314 _ 8B. 45, 08
        mov     eax, dword [eax+0B4H]                   ; 2317 _ 8B. 80, 000000B4
        mov     dword [ebp-0CH], eax                    ; 231D _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 2320 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 2323 _ 8B. 00
        mov     edx, eax                                ; 2325 _ 89. C2
        mov     eax, dword [memman]                     ; 2327 _ A1, 00000000(d)
        mov     dword [esp+8H], 42240                   ; 232C _ C7. 44 24, 08, 0000A500
        mov     dword [esp+4H], edx                     ; 2334 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2338 _ 89. 04 24
        call    memman_free_4k                          ; 233B _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 2340 _ A1, 00000264(d)
        mov     edx, dword [ebp-0CH]                    ; 2345 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2348 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 234C _ 89. 04 24
        call    sheet_free                              ; 234F _ E8, FFFFFFFC(rel)
?_126:  mov     eax, dword [ebp+8H]                     ; 2354 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2357 _ 89. 04 24
        call    close_constask                          ; 235A _ E8, FFFFFFFC(rel)
        leave                                           ; 235F _ C9
        ret                                             ; 2360 _ C3
; close_console End of function

cmd_exit:; Function begin
        push    ebp                                     ; 2361 _ 55
        mov     ebp, esp                                ; 2362 _ 89. E5
        sub     esp, 24                                 ; 2364 _ 83. EC, 18
        call    io_cli                                  ; 2367 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 255                     ; 236C _ C7. 44 24, 04, 000000FF
        mov     dword [esp], keyinfo                    ; 2374 _ C7. 04 24, 00000020(d)
        call    fifo8_put                               ; 237B _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 2380 _ E8, FFFFFFFC(rel)
        leave                                           ; 2385 _ C9
        ret                                             ; 2386 _ C3
; cmd_exit End of function

kernel_api:; Function begin
        push    ebp                                     ; 2387 _ 55
        mov     ebp, esp                                ; 2388 _ 89. E5
        push    esi                                     ; 238A _ 56
        push    ebx                                     ; 238B _ 53
        sub     esp, 48                                 ; 238C _ 83. EC, 30
        call    task_now                                ; 238F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2394 _ 89. 45, F4
        mov     dword [ebp-10H], 0                      ; 2397 _ C7. 45, F0, 00000000
        lea     eax, [ebp+24H]                          ; 239E _ 8D. 45, 24
        add     eax, 4                                  ; 23A1 _ 83. C0, 04
        mov     dword [ebp-14H], eax                    ; 23A4 _ 89. 45, EC
        mov     dword [ebp-18H], 0                      ; 23A7 _ C7. 45, E8, 00000000
        cmp     dword [ebp+1CH], 1                      ; 23AE _ 83. 7D, 1C, 01
        jnz     ?_127                                   ; 23B2 _ 75, 1B
        mov     eax, dword [ebp+24H]                    ; 23B4 _ 8B. 45, 24
        movsx   eax, al                                 ; 23B7 _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 23BA _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 23C2 _ 89. 04 24
        call    cons_putchar                            ; 23C5 _ E8, FFFFFFFC(rel)
        jmp     ?_141                                   ; 23CA _ E9, 000003D9

?_127:  cmp     dword [ebp+1CH], 2                      ; 23CF _ 83. 7D, 1C, 02
        jnz     ?_128                                   ; 23D3 _ 75, 1D
        mov     eax, dword [ebp-0CH]                    ; 23D5 _ 8B. 45, F4
        mov     eax, dword [eax+0B0H]                   ; 23D8 _ 8B. 80, 000000B0
        mov     edx, dword [eax]                        ; 23DE _ 8B. 10
        mov     eax, dword [ebp+18H]                    ; 23E0 _ 8B. 45, 18
        add     eax, edx                                ; 23E3 _ 01. D0
        mov     dword [esp], eax                        ; 23E5 _ 89. 04 24
        call    cons_putstr                             ; 23E8 _ E8, FFFFFFFC(rel)
        jmp     ?_141                                   ; 23ED _ E9, 000003B6

?_128:  cmp     dword [ebp+1CH], 4                      ; 23F2 _ 83. 7D, 1C, 04
        jnz     ?_129                                   ; 23F6 _ 75, 15
        mov     eax, dword [ebp-0CH]                    ; 23F8 _ 8B. 45, F4
        mov     dword [eax+34H], 0                      ; 23FB _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-0CH]                    ; 2402 _ 8B. 45, F4
        add     eax, 48                                 ; 2405 _ 83. C0, 30
        jmp     ?_142                                   ; 2408 _ E9, 000003A0

?_129:  cmp     dword [ebp+1CH], 5                      ; 240D _ 83. 7D, 1C, 05
        jne     ?_130                                   ; 2411 _ 0F 85, 00000107
        mov     eax, dword [shtctl]                     ; 2417 _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 241C _ 89. 04 24
        call    sheet_alloc                             ; 241F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2424 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 2427 _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 242A _ 8B. 55, F4
        mov     dword [eax+20H], edx                    ; 242D _ 89. 50, 20
        mov     eax, dword [ebp-10H]                    ; 2430 _ 8B. 45, F0
        mov     eax, dword [eax+1CH]                    ; 2433 _ 8B. 40, 1C
        or      eax, 10H                                ; 2436 _ 83. C8, 10
        mov     edx, eax                                ; 2439 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 243B _ 8B. 45, F0
        mov     dword [eax+1CH], edx                    ; 243E _ 89. 50, 1C
        mov     eax, dword [ebp+24H]                    ; 2441 _ 8B. 45, 24
        mov     edx, dword [ebp-0CH]                    ; 2444 _ 8B. 55, F4
        mov     edx, dword [edx+0B0H]                   ; 2447 _ 8B. 92, 000000B0
        mov     ecx, dword [edx+4H]                     ; 244D _ 8B. 4A, 04
        mov     edx, dword [ebp+18H]                    ; 2450 _ 8B. 55, 18
        add     edx, ecx                                ; 2453 _ 01. CA
        mov     dword [esp+10H], eax                    ; 2455 _ 89. 44 24, 10
        mov     eax, dword [ebp+8H]                     ; 2459 _ 8B. 45, 08
        mov     dword [esp+0CH], eax                    ; 245C _ 89. 44 24, 0C
        mov     eax, dword [ebp+0CH]                    ; 2460 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 2463 _ 89. 44 24, 08
        mov     dword [esp+4H], edx                     ; 2467 _ 89. 54 24, 04
        mov     eax, dword [ebp-10H]                    ; 246B _ 8B. 45, F0
        mov     dword [esp], eax                        ; 246E _ 89. 04 24
        call    sheet_setbuf                            ; 2471 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 2476 _ 8B. 45, F4
        mov     eax, dword [eax+0B0H]                   ; 2479 _ 8B. 80, 000000B0
        mov     edx, dword [eax]                        ; 247F _ 8B. 10
        mov     eax, dword [ebp+20H]                    ; 2481 _ 8B. 45, 20
        add     edx, eax                                ; 2484 _ 01. C2
        mov     eax, dword [shtctl]                     ; 2486 _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 248B _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], edx                     ; 2493 _ 89. 54 24, 08
        mov     edx, dword [ebp-10H]                    ; 2497 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 249A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 249E _ 89. 04 24
        call    make_window8                            ; 24A1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 24A6 _ A1, 00000264(d)
        mov     eax, dword [eax+0CH]                    ; 24AB _ 8B. 40, 0C
        sub     eax, dword [ebp+8H]                     ; 24AE _ 2B. 45, 08
        mov     edx, eax                                ; 24B1 _ 89. C2
        shr     edx, 31                                 ; 24B3 _ C1. EA, 1F
        add     eax, edx                                ; 24B6 _ 01. D0
        sar     eax, 1                                  ; 24B8 _ D1. F8
        mov     ecx, eax                                ; 24BA _ 89. C1
        mov     eax, dword [shtctl]                     ; 24BC _ A1, 00000264(d)
        mov     eax, dword [eax+8H]                     ; 24C1 _ 8B. 40, 08
        sub     eax, dword [ebp+0CH]                    ; 24C4 _ 2B. 45, 0C
        mov     edx, eax                                ; 24C7 _ 89. C2
        shr     edx, 31                                 ; 24C9 _ C1. EA, 1F
        add     eax, edx                                ; 24CC _ 01. D0
        sar     eax, 1                                  ; 24CE _ D1. F8
        mov     edx, eax                                ; 24D0 _ 89. C2
        mov     eax, dword [shtctl]                     ; 24D2 _ A1, 00000264(d)
        mov     dword [esp+0CH], ecx                    ; 24D7 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 24DB _ 89. 54 24, 08
        mov     edx, dword [ebp-10H]                    ; 24DF _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 24E2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 24E6 _ 89. 04 24
        call    sheet_slide                             ; 24E9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 24EE _ A1, 00000264(d)
        mov     edx, dword [eax+10H]                    ; 24F3 _ 8B. 50, 10
        mov     eax, dword [shtctl]                     ; 24F6 _ A1, 00000264(d)
        mov     dword [esp+8H], edx                     ; 24FB _ 89. 54 24, 08
        mov     edx, dword [ebp-10H]                    ; 24FF _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 2502 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2506 _ 89. 04 24
        call    sheet_updown                            ; 2509 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 250E _ 8B. 45, EC
        lea     edx, [eax+1CH]                          ; 2511 _ 8D. 50, 1C
        mov     eax, dword [ebp-10H]                    ; 2514 _ 8B. 45, F0
        mov     dword [edx], eax                        ; 2517 _ 89. 02
        jmp     ?_141                                   ; 2519 _ E9, 0000028A

?_130:  cmp     dword [ebp+1CH], 6                      ; 251E _ 83. 7D, 1C, 06
        jne     ?_131                                   ; 2522 _ 0F 85, 0000008C
        mov     eax, dword [ebp+18H]                    ; 2528 _ 8B. 45, 18
        mov     dword [ebp-10H], eax                    ; 252B _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 252E _ 8B. 45, F4
        mov     eax, dword [eax+0B0H]                   ; 2531 _ 8B. 80, 000000B0
        mov     edx, dword [eax+4H]                     ; 2537 _ 8B. 50, 04
        mov     eax, dword [ebp+10H]                    ; 253A _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 253D _ 8D. 0C 02
        mov     eax, dword [ebp+24H]                    ; 2540 _ 8B. 45, 24
        movsx   edx, al                                 ; 2543 _ 0F BE. D0
        mov     eax, dword [shtctl]                     ; 2546 _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 254B _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 254F _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 2553 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 2556 _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 255A _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 255D _ 89. 54 24, 08
        mov     edx, dword [ebp-10H]                    ; 2561 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 2564 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2568 _ 89. 04 24
        call    showString                              ; 256B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2570 _ 8B. 45, 08
        lea     ecx, [eax+10H]                          ; 2573 _ 8D. 48, 10
        mov     eax, dword [ebp+20H]                    ; 2576 _ 8B. 45, 20
        lea     edx, [eax*8]                            ; 2579 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2580 _ 8B. 45, 0C
        add     edx, eax                                ; 2583 _ 01. C2
        mov     eax, dword [shtctl]                     ; 2585 _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 258A _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 258E _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 2592 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 2595 _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 2599 _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 259C _ 89. 54 24, 08
        mov     edx, dword [ebp-10H]                    ; 25A0 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 25A3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25A7 _ 89. 04 24
        call    sheet_refresh                           ; 25AA _ E8, FFFFFFFC(rel)
        jmp     ?_141                                   ; 25AF _ E9, 000001F4

?_131:  cmp     dword [ebp+1CH], 7                      ; 25B4 _ 83. 7D, 1C, 07
        jnz     ?_132                                   ; 25B8 _ 75, 7E
        mov     eax, dword [ebp+18H]                    ; 25BA _ 8B. 45, 18
        mov     dword [ebp-10H], eax                    ; 25BD _ 89. 45, F0
        mov     ebx, dword [ebp+24H]                    ; 25C0 _ 8B. 5D, 24
        mov     eax, dword [ebp+10H]                    ; 25C3 _ 8B. 45, 10
        movzx   ecx, al                                 ; 25C6 _ 0F B6. C8
        mov     eax, dword [ebp-10H]                    ; 25C9 _ 8B. 45, F0
        mov     edx, dword [eax+4H]                     ; 25CC _ 8B. 50, 04
        mov     eax, dword [ebp-10H]                    ; 25CF _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 25D2 _ 8B. 00
        mov     esi, dword [ebp+8H]                     ; 25D4 _ 8B. 75, 08
        mov     dword [esp+18H], esi                    ; 25D7 _ 89. 74 24, 18
        mov     esi, dword [ebp+0CH]                    ; 25DB _ 8B. 75, 0C
        mov     dword [esp+14H], esi                    ; 25DE _ 89. 74 24, 14
        mov     esi, dword [ebp+20H]                    ; 25E2 _ 8B. 75, 20
        mov     dword [esp+10H], esi                    ; 25E5 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 25E9 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 25ED _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 25F1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25F5 _ 89. 04 24
        call    boxfill8                                ; 25F8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 25FD _ 8B. 45, 08
        lea     ebx, [eax+1H]                           ; 2600 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 2603 _ 8B. 45, 0C
        lea     ecx, [eax+1H]                           ; 2606 _ 8D. 48, 01
        mov     edx, dword [ebp+24H]                    ; 2609 _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 260C _ A1, 00000264(d)
        mov     dword [esp+14H], ebx                    ; 2611 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 2615 _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 2619 _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 261C _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2620 _ 89. 54 24, 08
        mov     edx, dword [ebp-10H]                    ; 2624 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 2627 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 262B _ 89. 04 24
        call    sheet_refresh                           ; 262E _ E8, FFFFFFFC(rel)
        jmp     ?_141                                   ; 2633 _ E9, 00000170

?_132:  cmp     dword [ebp+1CH], 11                     ; 2638 _ 83. 7D, 1C, 0B
        jnz     ?_133                                   ; 263C _ 75, 28
        mov     eax, dword [ebp+18H]                    ; 263E _ 8B. 45, 18
        mov     dword [ebp-10H], eax                    ; 2641 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 2644 _ 8B. 45, F0
        mov     edx, dword [eax]                        ; 2647 _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 2649 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 264C _ 8B. 40, 04
        imul    eax, dword [ebp+8H]                     ; 264F _ 0F AF. 45, 08
        mov     ecx, eax                                ; 2653 _ 89. C1
        mov     eax, dword [ebp+0CH]                    ; 2655 _ 8B. 45, 0C
        add     eax, ecx                                ; 2658 _ 01. C8
        add     edx, eax                                ; 265A _ 01. C2
        mov     eax, dword [ebp+24H]                    ; 265C _ 8B. 45, 24
        mov     byte [edx], al                          ; 265F _ 88. 02
        jmp     ?_141                                   ; 2661 _ E9, 00000142

?_133:  cmp     dword [ebp+1CH], 12                     ; 2666 _ 83. 7D, 1C, 0C
        jnz     ?_134                                   ; 266A _ 75, 3B
        mov     eax, dword [ebp+18H]                    ; 266C _ 8B. 45, 18
        mov     dword [ebp-10H], eax                    ; 266F _ 89. 45, F0
        mov     edx, dword [ebp+24H]                    ; 2672 _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 2675 _ A1, 00000264(d)
        mov     ecx, dword [ebp+8H]                     ; 267A _ 8B. 4D, 08
        mov     dword [esp+14H], ecx                    ; 267D _ 89. 4C 24, 14
        mov     ecx, dword [ebp+0CH]                    ; 2681 _ 8B. 4D, 0C
        mov     dword [esp+10H], ecx                    ; 2684 _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 2688 _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 268B _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 268F _ 89. 54 24, 08
        mov     edx, dword [ebp-10H]                    ; 2693 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 2696 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 269A _ 89. 04 24
        call    sheet_refresh                           ; 269D _ E8, FFFFFFFC(rel)
        jmp     ?_141                                   ; 26A2 _ E9, 00000101

?_134:  cmp     dword [ebp+1CH], 13                     ; 26A7 _ 83. 7D, 1C, 0D
        jnz     ?_135                                   ; 26AB _ 75, 39
        mov     eax, dword [ebp+18H]                    ; 26AD _ 8B. 45, 18
        mov     dword [ebp-10H], eax                    ; 26B0 _ 89. 45, F0
        mov     eax, dword [ebp+24H]                    ; 26B3 _ 8B. 45, 24
        mov     edx, dword [ebp+10H]                    ; 26B6 _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 26B9 _ 89. 54 24, 14
        mov     edx, dword [ebp+8H]                     ; 26BD _ 8B. 55, 08
        mov     dword [esp+10H], edx                    ; 26C0 _ 89. 54 24, 10
        mov     edx, dword [ebp+0CH]                    ; 26C4 _ 8B. 55, 0C
        mov     dword [esp+0CH], edx                    ; 26C7 _ 89. 54 24, 0C
        mov     edx, dword [ebp+20H]                    ; 26CB _ 8B. 55, 20
        mov     dword [esp+8H], edx                     ; 26CE _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 26D2 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 26D6 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 26D9 _ 89. 04 24
        call    api_linewin                             ; 26DC _ E8, FFFFFFFC(rel)
        jmp     ?_141                                   ; 26E1 _ E9, 000000C2

?_135:  cmp     dword [ebp+1CH], 14                     ; 26E6 _ 83. 7D, 1C, 0E
        jnz     ?_136                                   ; 26EA _ 75, 32
        mov     edx, dword [ebp+18H]                    ; 26EC _ 8B. 55, 18
        mov     eax, dword [shtctl]                     ; 26EF _ A1, 00000264(d)
        mov     dword [esp+4H], edx                     ; 26F4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 26F8 _ 89. 04 24
        call    sheet_free                              ; 26FB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 2700 _ 8B. 45, F4
        mov     eax, dword [eax+0B0H]                   ; 2703 _ 8B. 80, 000000B0
        mov     eax, dword [eax+4H]                     ; 2709 _ 8B. 40, 04
        add     eax, 291                                ; 270C _ 05, 00000123
        mov     dword [esp], eax                        ; 2711 _ 89. 04 24
        call    cons_putstr                             ; 2714 _ E8, FFFFFFFC(rel)
        jmp     ?_141                                   ; 2719 _ E9, 0000008A

?_136:  cmp     dword [ebp+1CH], 15                     ; 271E _ 83. 7D, 1C, 0F
        jnz     ?_137                                   ; 2722 _ 75, 1B
        mov     eax, dword [ebp+24H]                    ; 2724 _ 8B. 45, 24
        mov     edx, dword [ebp-14H]                    ; 2727 _ 8B. 55, EC
        mov     dword [esp+8H], edx                     ; 272A _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 272E _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 2732 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 2735 _ 89. 04 24
        call    handle_keyboard                         ; 2738 _ E8, FFFFFFFC(rel)
        jmp     ?_141                                   ; 273D _ EB, 69

?_137:  cmp     dword [ebp+1CH], 16                     ; 273F _ 83. 7D, 1C, 10
        jnz     ?_138                                   ; 2743 _ 75, 0F
        mov     eax, dword [ebp-14H]                    ; 2745 _ 8B. 45, EC
        lea     ebx, [eax+1CH]                          ; 2748 _ 8D. 58, 1C
        call    timer_alloc                             ; 274B _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 2750 _ 89. 03
        jmp     ?_141                                   ; 2752 _ EB, 54

?_138:  cmp     dword [ebp+1CH], 17                     ; 2754 _ 83. 7D, 1C, 11
        jnz     ?_139                                   ; 2758 _ 75, 21
        mov     eax, dword [ebp+24H]                    ; 275A _ 8B. 45, 24
        movzx   edx, al                                 ; 275D _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 2760 _ 8B. 45, F4
        lea     ecx, [eax+10H]                          ; 2763 _ 8D. 48, 10
        mov     eax, dword [ebp+18H]                    ; 2766 _ 8B. 45, 18
        mov     dword [esp+8H], edx                     ; 2769 _ 89. 54 24, 08
        mov     dword [esp+4H], ecx                     ; 276D _ 89. 4C 24, 04
        mov     dword [esp], eax                        ; 2771 _ 89. 04 24
        call    timer_init                              ; 2774 _ E8, FFFFFFFC(rel)
        jmp     ?_141                                   ; 2779 _ EB, 2D

?_139:  cmp     dword [ebp+1CH], 18                     ; 277B _ 83. 7D, 1C, 12
        jnz     ?_140                                   ; 277F _ 75, 16
        mov     eax, dword [ebp+24H]                    ; 2781 _ 8B. 45, 24
        mov     edx, eax                                ; 2784 _ 89. C2
        mov     eax, dword [ebp+18H]                    ; 2786 _ 8B. 45, 18
        mov     dword [esp+4H], edx                     ; 2789 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 278D _ 89. 04 24
        call    timer_settime                           ; 2790 _ E8, FFFFFFFC(rel)
        jmp     ?_141                                   ; 2795 _ EB, 11

?_140:  cmp     dword [ebp+1CH], 19                     ; 2797 _ 83. 7D, 1C, 13
        jnz     ?_141                                   ; 279B _ 75, 0B
        mov     eax, dword [ebp+18H]                    ; 279D _ 8B. 45, 18
        mov     dword [esp], eax                        ; 27A0 _ 89. 04 24
        call    timer_free                              ; 27A3 _ E8, FFFFFFFC(rel)
?_141:  mov     eax, 0                                  ; 27A8 _ B8, 00000000
?_142:  add     esp, 48                                 ; 27AD _ 83. C4, 30
        pop     ebx                                     ; 27B0 _ 5B
        pop     esi                                     ; 27B1 _ 5E
        pop     ebp                                     ; 27B2 _ 5D
        ret                                             ; 27B3 _ C3
; kernel_api End of function

cons_putchar:; Function begin
        push    ebp                                     ; 27B4 _ 55
        mov     ebp, esp                                ; 27B5 _ 89. E5
        push    esi                                     ; 27B7 _ 56
        push    ebx                                     ; 27B8 _ 53
        sub     esp, 48                                 ; 27B9 _ 83. EC, 30
        mov     edx, dword [ebp+8H]                     ; 27BC _ 8B. 55, 08
        mov     eax, dword [ebp+0CH]                    ; 27BF _ 8B. 45, 0C
        mov     byte [ebp-1CH], dl                      ; 27C2 _ 88. 55, E4
        mov     byte [ebp-20H], al                      ; 27C5 _ 88. 45, E0
        call    task_now                                ; 27C8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 27CD _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 27D0 _ 8B. 45, F4
        mov     ebx, dword [eax+9CH]                    ; 27D3 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 27D9 _ 8B. 45, F4
        mov     ecx, dword [eax+98H]                    ; 27DC _ 8B. 88, 00000098
        mov     eax, dword [ebp-0CH]                    ; 27E2 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 27E5 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 27EB _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 27F0 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 27F8 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 27FC _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2800 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2804 _ 89. 04 24
        call    set_cursor                              ; 2807 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 280C _ 8B. 45, F4
        movzx   edx, byte [ebp-1CH]                     ; 280F _ 0F B6. 55, E4
        mov     byte [eax+0A4H], dl                     ; 2813 _ 88. 90, 000000A4
        mov     eax, dword [ebp-0CH]                    ; 2819 _ 8B. 45, F4
        mov     byte [eax+0A5H], 0                      ; 281C _ C6. 80, 000000A5, 00
        mov     eax, dword [ebp-0CH]                    ; 2823 _ 8B. 45, F4
        lea     esi, [eax+0A4H]                         ; 2826 _ 8D. B0, 000000A4
        mov     eax, dword [ebp-0CH]                    ; 282C _ 8B. 45, F4
        mov     ebx, dword [eax+9CH]                    ; 282F _ 8B. 98, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 2835 _ 8B. 45, F4
        mov     ecx, dword [eax+98H]                    ; 2838 _ 8B. 88, 00000098
        mov     eax, dword [ebp-0CH]                    ; 283E _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 2841 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 2847 _ A1, 00000264(d)
        mov     dword [esp+14H], esi                    ; 284C _ 89. 74 24, 14
        mov     dword [esp+10H], 7                      ; 2850 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 2858 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 285C _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2860 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2864 _ 89. 04 24
        call    showString                              ; 2867 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 286C _ 8B. 45, F4
        mov     eax, dword [eax+98H]                    ; 286F _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 2875 _ 8D. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2878 _ 8B. 45, F4
        mov     dword [eax+98H], edx                    ; 287B _ 89. 90, 00000098
        add     esp, 48                                 ; 2881 _ 83. C4, 30
        pop     ebx                                     ; 2884 _ 5B
        pop     esi                                     ; 2885 _ 5E
        pop     ebp                                     ; 2886 _ 5D
        ret                                             ; 2887 _ C3
; cons_putchar End of function

cons_newline:; Function begin
        push    ebp                                     ; 2888 _ 55
        mov     ebp, esp                                ; 2889 _ 89. E5
        push    ebx                                     ; 288B _ 53
        sub     esp, 52                                 ; 288C _ 83. EC, 34
        cmp     dword [ebp+0CH], 0                      ; 288F _ 83. 7D, 0C, 00
        jnz     ?_143                                   ; 2893 _ 75, 06
        nop                                             ; 2895 _ 90
        jmp     ?_154                                   ; 2896 _ E9, 00000127

?_143:  cmp     dword [ebp+8H], 139                     ; 289B _ 81. 7D, 08, 0000008B
        jg      ?_144                                   ; 28A2 _ 7F, 09
        add     dword [ebp+8H], 16                      ; 28A4 _ 83. 45, 08, 10
        jmp     ?_153                                   ; 28A8 _ E9, 000000DF

?_144:  mov     dword [ebp-10H], 28                     ; 28AD _ C7. 45, F0, 0000001C
        jmp     ?_148                                   ; 28B4 _ EB, 52

?_145:  mov     dword [ebp-0CH], 8                      ; 28B6 _ C7. 45, F4, 00000008
        jmp     ?_147                                   ; 28BD _ EB, 3C

?_146:  mov     eax, dword [ebp+0CH]                    ; 28BF _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 28C2 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 28C4 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 28C7 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 28CA _ 0F AF. 45, F0
        mov     ecx, eax                                ; 28CE _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 28D0 _ 8B. 45, F4
        add     eax, ecx                                ; 28D3 _ 01. C8
        add     edx, eax                                ; 28D5 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 28D7 _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 28DA _ 8B. 08
        mov     eax, dword [ebp-10H]                    ; 28DC _ 8B. 45, F0
        lea     ebx, [eax+10H]                          ; 28DF _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 28E2 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 28E5 _ 8B. 40, 04
        imul    ebx, eax                                ; 28E8 _ 0F AF. D8
        mov     eax, dword [ebp-0CH]                    ; 28EB _ 8B. 45, F4
        add     eax, ebx                                ; 28EE _ 01. D8
        add     eax, ecx                                ; 28F0 _ 01. C8
        movzx   eax, byte [eax]                         ; 28F2 _ 0F B6. 00
        mov     byte [edx], al                          ; 28F5 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 28F7 _ 83. 45, F4, 01
?_147:  cmp     dword [ebp-0CH], 247                    ; 28FB _ 81. 7D, F4, 000000F7
        jle     ?_146                                   ; 2902 _ 7E, BB
        add     dword [ebp-10H], 1                      ; 2904 _ 83. 45, F0, 01
?_148:  cmp     dword [ebp-10H], 139                    ; 2908 _ 81. 7D, F0, 0000008B
        jle     ?_145                                   ; 290F _ 7E, A5
        mov     dword [ebp-10H], 140                    ; 2911 _ C7. 45, F0, 0000008C
        jmp     ?_152                                   ; 2918 _ EB, 35

?_149:  mov     dword [ebp-0CH], 8                      ; 291A _ C7. 45, F4, 00000008
        jmp     ?_151                                   ; 2921 _ EB, 1F

?_150:  mov     eax, dword [ebp+0CH]                    ; 2923 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2926 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2928 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 292B _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 292E _ 0F AF. 45, F0
        mov     ecx, eax                                ; 2932 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2934 _ 8B. 45, F4
        add     eax, ecx                                ; 2937 _ 01. C8
        add     eax, edx                                ; 2939 _ 01. D0
        mov     byte [eax], 0                           ; 293B _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 293E _ 83. 45, F4, 01
?_151:  cmp     dword [ebp-0CH], 247                    ; 2942 _ 81. 7D, F4, 000000F7
        jle     ?_150                                   ; 2949 _ 7E, D8
        add     dword [ebp-10H], 1                      ; 294B _ 83. 45, F0, 01
?_152:  cmp     dword [ebp-10H], 155                    ; 294F _ 81. 7D, F0, 0000009B
        jle     ?_149                                   ; 2956 _ 7E, C2
        mov     eax, dword [shtctl]                     ; 2958 _ A1, 00000264(d)
        mov     dword [esp+14H], 156                    ; 295D _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 2965 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 296D _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2975 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 297D _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2980 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2984 _ 89. 04 24
        call    sheet_refresh                           ; 2987 _ E8, FFFFFFFC(rel)
?_153:  mov     eax, dword [shtctl]                     ; 298C _ A1, 00000264(d)
        mov     dword [esp+14H], ?_397                  ; 2991 _ C7. 44 24, 14, 00000023(d)
        mov     dword [esp+10H], 7                      ; 2999 _ C7. 44 24, 10, 00000007
        mov     edx, dword [ebp+8H]                     ; 29A1 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 29A4 _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 29A8 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 29B0 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 29B3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 29B7 _ 89. 04 24
        call    showString                              ; 29BA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 29BF _ 8B. 45, 08
?_154:  add     esp, 52                                 ; 29C2 _ 83. C4, 34
        pop     ebx                                     ; 29C5 _ 5B
        pop     ebp                                     ; 29C6 _ 5D
        ret                                             ; 29C7 _ C3
; cons_newline End of function

init_screen8:; Function begin
        push    ebp                                     ; 29C8 _ 55
        mov     ebp, esp                                ; 29C9 _ 89. E5
        push    ebx                                     ; 29CB _ 53
        sub     esp, 36                                 ; 29CC _ 83. EC, 24
        mov     eax, dword [ebp+10H]                    ; 29CF _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 29D2 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 29D5 _ 8B. 45, 0C
        sub     eax, 1                                  ; 29D8 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 29DB _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 29DF _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 29E3 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 29EB _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 14                      ; 29F3 _ C7. 44 24, 08, 0000000E
        mov     eax, dword [ebp+0CH]                    ; 29FB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 29FE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2A02 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2A05 _ 89. 04 24
        call    boxfill8                                ; 2A08 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2A0D _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 2A10 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 2A13 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2A16 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2A19 _ 8B. 45, 10
        sub     eax, 28                                 ; 2A1C _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 2A1F _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2A23 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2A27 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 2A2B _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 2A33 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 2A3B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2A3E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2A42 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2A45 _ 89. 04 24
        call    boxfill8                                ; 2A48 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2A4D _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 2A50 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 2A53 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2A56 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2A59 _ 8B. 45, 10
        sub     eax, 27                                 ; 2A5C _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 2A5F _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2A63 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2A67 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 2A6B _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 2A73 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2A7B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2A7E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2A82 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2A85 _ 89. 04 24
        call    boxfill8                                ; 2A88 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2A8D _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 2A90 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 2A93 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2A96 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2A99 _ 8B. 45, 10
        sub     eax, 26                                 ; 2A9C _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 2A9F _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2AA3 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2AA7 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 2AAB _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 2AB3 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 2ABB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2ABE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2AC2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2AC5 _ 89. 04 24
        call    boxfill8                                ; 2AC8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2ACD _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2AD0 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 2AD3 _ 8B. 45, 10
        sub     eax, 24                                 ; 2AD6 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 2AD9 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2ADD _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2AE5 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 2AE9 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 2AF1 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2AF9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2AFC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B00 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B03 _ 89. 04 24
        call    boxfill8                                ; 2B06 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2B0B _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 2B0E _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2B11 _ 8B. 45, 10
        sub     eax, 24                                 ; 2B14 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 2B17 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 2B1B _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 2B23 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 2B27 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 2B2F _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2B37 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2B3A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B3E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B41 _ 89. 04 24
        call    boxfill8                                ; 2B44 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2B49 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 2B4C _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2B4F _ 8B. 45, 10
        sub     eax, 4                                  ; 2B52 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 2B55 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2B59 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2B61 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 2B65 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 15                      ; 2B6D _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp+0CH]                    ; 2B75 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2B78 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B7C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B7F _ 89. 04 24
        call    boxfill8                                ; 2B82 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2B87 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 2B8A _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 2B8D _ 8B. 45, 10
        sub     eax, 23                                 ; 2B90 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 2B93 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2B97 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2B9F _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 2BA3 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 15                      ; 2BAB _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp+0CH]                    ; 2BB3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2BB6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2BBA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2BBD _ 89. 04 24
        call    boxfill8                                ; 2BC0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2BC5 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2BC8 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 2BCB _ 8B. 45, 10
        sub     eax, 3                                  ; 2BCE _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 2BD1 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2BD5 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2BDD _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 2BE1 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 2BE9 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2BF1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2BF4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2BF8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2BFB _ 89. 04 24
        call    boxfill8                                ; 2BFE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2C03 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2C06 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 2C09 _ 8B. 45, 10
        sub     eax, 24                                 ; 2C0C _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 2C0F _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 2C13 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 2C1B _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 2C1F _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 2C27 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2C2F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2C32 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2C36 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C39 _ 89. 04 24
        call    boxfill8                                ; 2C3C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2C41 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 2C44 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 2C47 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 2C4A _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 2C4D _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2C50 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 2C53 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2C56 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 2C59 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2C5D _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2C61 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2C65 _ 89. 44 24, 0C
        mov     dword [esp+8H], 15                      ; 2C69 _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp+0CH]                    ; 2C71 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2C74 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2C78 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C7B _ 89. 04 24
        call    boxfill8                                ; 2C7E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2C83 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 2C86 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 2C89 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 2C8C _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 2C8F _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 2C92 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 2C95 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2C98 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 2C9B _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2C9F _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2CA3 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2CA7 _ 89. 44 24, 0C
        mov     dword [esp+8H], 15                      ; 2CAB _ C7. 44 24, 08, 0000000F
        mov     eax, dword [ebp+0CH]                    ; 2CB3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2CB6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2CBA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2CBD _ 89. 04 24
        call    boxfill8                                ; 2CC0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2CC5 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 2CC8 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 2CCB _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 2CCE _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 2CD1 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2CD4 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 2CD7 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2CDA _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 2CDD _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2CE1 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2CE5 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2CE9 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 2CED _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2CF5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2CF8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2CFC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2CFF _ 89. 04 24
        call    boxfill8                                ; 2D02 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2D07 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 2D0A _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 2D0D _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 2D10 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 2D13 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2D16 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 2D19 _ 8B. 45, 0C
        sub     eax, 3                                  ; 2D1C _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 2D1F _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2D23 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2D27 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2D2B _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 2D2F _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2D37 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2D3A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2D3E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2D41 _ 89. 04 24
        call    boxfill8                                ; 2D44 _ E8, FFFFFFFC(rel)
        add     esp, 36                                 ; 2D49 _ 83. C4, 24
        pop     ebx                                     ; 2D4C _ 5B
        pop     ebp                                     ; 2D4D _ 5D
        ret                                             ; 2D4E _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 2D4F _ 55
        mov     ebp, esp                                ; 2D50 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 2D52 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 2D55 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 2D58 _ A1, 00000134(d)
        add     eax, edx                                ; 2D5D _ 01. D0
        mov     dword [mx], eax                         ; 2D5F _ A3, 00000134(d)
        mov     eax, dword [ebp+10H]                    ; 2D64 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 2D67 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 2D6A _ A1, 00000138(d)
        add     eax, edx                                ; 2D6F _ 01. D0
        mov     dword [my], eax                         ; 2D71 _ A3, 00000138(d)
        mov     eax, dword [mx]                         ; 2D76 _ A1, 00000134(d)
        test    eax, eax                                ; 2D7B _ 85. C0
        jns     ?_155                                   ; 2D7D _ 79, 0A
        mov     dword [mx], 0                           ; 2D7F _ C7. 05, 00000134(d), 00000000
?_155:  mov     eax, dword [my]                         ; 2D89 _ A1, 00000138(d)
        test    eax, eax                                ; 2D8E _ 85. C0
        jns     ?_156                                   ; 2D90 _ 79, 0A
        mov     dword [my], 0                           ; 2D92 _ C7. 05, 00000138(d), 00000000
?_156:  mov     eax, dword [xsize]                      ; 2D9C _ A1, 0000013C(d)
        lea     edx, [eax-1H]                           ; 2DA1 _ 8D. 50, FF
        mov     eax, dword [mx]                         ; 2DA4 _ A1, 00000134(d)
        cmp     edx, eax                                ; 2DA9 _ 39. C2
        jge     ?_157                                   ; 2DAB _ 7D, 0D
        mov     eax, dword [xsize]                      ; 2DAD _ A1, 0000013C(d)
        sub     eax, 1                                  ; 2DB2 _ 83. E8, 01
        mov     dword [mx], eax                         ; 2DB5 _ A3, 00000134(d)
?_157:  mov     eax, dword [ysize]                      ; 2DBA _ A1, 00000140(d)
        lea     edx, [eax-1H]                           ; 2DBF _ 8D. 50, FF
        mov     eax, dword [my]                         ; 2DC2 _ A1, 00000138(d)
        cmp     edx, eax                                ; 2DC7 _ 39. C2
        jge     ?_158                                   ; 2DC9 _ 7D, 0D
        mov     eax, dword [ysize]                      ; 2DCB _ A1, 00000140(d)
        sub     eax, 1                                  ; 2DD0 _ 83. E8, 01
        mov     dword [my], eax                         ; 2DD3 _ A3, 00000138(d)
?_158:  pop     ebp                                     ; 2DD8 _ 5D
        ret                                             ; 2DD9 _ C3
; computeMousePosition End of function

showString:; Function begin
        push    ebp                                     ; 2DDA _ 55
        mov     ebp, esp                                ; 2DDB _ 89. E5
        push    ebx                                     ; 2DDD _ 53
        sub     esp, 52                                 ; 2DDE _ 83. EC, 34
        mov     eax, dword [ebp+18H]                    ; 2DE1 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 2DE4 _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 2DE7 _ 83. 7D, 08, 00
        jz      ?_159                                   ; 2DEB _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 2DED _ 83. 7D, 0C, 00
        jnz     ?_160                                   ; 2DF1 _ 75, 05
?_159:  jmp     ?_163                                   ; 2DF3 _ E9, 00000095

?_160:  mov     eax, dword [ebp+10H]                    ; 2DF8 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 2DFB _ 89. 45, F4
        mov     dword [ebp-10H], 0                      ; 2DFE _ C7. 45, F0, 00000000
        jmp     ?_162                                   ; 2E05 _ EB, 4B

?_161:  mov     eax, dword [ebp+1CH]                    ; 2E07 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 2E0A _ 0F B6. 00
        movzx   eax, al                                 ; 2E0D _ 0F B6. C0
        shl     eax, 4                                  ; 2E10 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 2E13 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 2E19 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 2E1D _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 2E20 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2E23 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2E26 _ 8B. 00
        mov     dword [esp+14H], ebx                    ; 2E28 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 2E2C _ 89. 4C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 2E30 _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 2E33 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 2E37 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 2E3A _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2E3E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2E42 _ 89. 04 24
        call    showFont8                               ; 2E45 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 2E4A _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 2E4E _ 83. 45, 1C, 01
?_162:  mov     eax, dword [ebp+1CH]                    ; 2E52 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 2E55 _ 0F B6. 00
        test    al, al                                  ; 2E58 _ 84. C0
        jnz     ?_161                                   ; 2E5A _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 2E5C _ 8B. 45, 14
        add     eax, 16                                 ; 2E5F _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 2E62 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 2E66 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 2E69 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 2E6D _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 2E70 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2E74 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2E77 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2E7B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2E7E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E82 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E85 _ 89. 04 24
        call    sheet_refresh                           ; 2E88 _ E8, FFFFFFFC(rel)
?_163:  add     esp, 52                                 ; 2E8D _ 83. C4, 34
        pop     ebx                                     ; 2E90 _ 5B
        pop     ebp                                     ; 2E91 _ 5D
        ret                                             ; 2E92 _ C3
; showString End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 2E93 _ 55
        mov     ebp, esp                                ; 2E94 _ 89. E5
        sub     esp, 72                                 ; 2E96 _ 83. EC, 48
        mov     eax, dword [buf_back]                   ; 2E99 _ A1, 00000144(d)
        mov     dword [ebp-10H], eax                    ; 2E9E _ 89. 45, F0
        mov     byte [ebp-11H], 0                       ; 2EA1 _ C6. 45, EF, 00
        mov     dword [ebp-18H], 0                      ; 2EA5 _ C7. 45, E8, 00000000
        call    io_sti                                  ; 2EAC _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 2EB1 _ C7. 04 24, 0000003C(d)
        call    fifo8_get                               ; 2EB8 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-11H], al                      ; 2EBD _ 88. 45, EF
        movzx   eax, byte [ebp-11H]                     ; 2EC0 _ 0F B6. 45, EF
        mov     dword [esp+4H], eax                     ; 2EC4 _ 89. 44 24, 04
        mov     dword [esp], mdec                       ; 2EC8 _ C7. 04 24, 00000100(d)
        call    mouse_decode                            ; 2ECF _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 2ED4 _ 85. C0
        je      ?_175                                   ; 2ED6 _ 0F 84, 00000386
        mov     dword [esp+8H], mdec                    ; 2EDC _ C7. 44 24, 08, 00000100(d)
        mov     eax, dword [ebp+0CH]                    ; 2EE4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2EE7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2EEB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2EEE _ 89. 04 24
        call    computeMousePosition                    ; 2EF1 _ E8, FFFFFFFC(rel)
        mov     edx, dword [my]                         ; 2EF6 _ 8B. 15, 00000138(d)
        mov     eax, dword [mx]                         ; 2EFC _ A1, 00000134(d)
        mov     dword [esp+0CH], edx                    ; 2F01 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 2F05 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2F09 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2F0C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F10 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F13 _ 89. 04 24
        call    sheet_slide                             ; 2F16 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_424]                      ; 2F1B _ A1, 0000010C(d)
        and     eax, 01H                                ; 2F20 _ 83. E0, 01
        test    eax, eax                                ; 2F23 _ 85. C0
        je      ?_174                                   ; 2F25 _ 0F 84, 0000032D
        mov     eax, dword [mmx]                        ; 2F2B _ A1, 00000118(d)
        test    eax, eax                                ; 2F30 _ 85. C0
        jns     ?_173                                   ; 2F32 _ 0F 89, 000002AF
        mov     eax, dword [ebp+8H]                     ; 2F38 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2F3B _ 8B. 40, 10
        sub     eax, 1                                  ; 2F3E _ 83. E8, 01
        mov     dword [ebp-0CH], eax                    ; 2F41 _ 89. 45, F4
        jmp     ?_171                                   ; 2F44 _ E9, 00000290

?_164:  mov     eax, dword [ebp+8H]                     ; 2F49 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2F4C _ 8B. 55, F4
        add     edx, 4                                  ; 2F4F _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2F52 _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 2F56 _ 89. 45, E8
        mov     edx, dword [mx]                         ; 2F59 _ 8B. 15, 00000134(d)
        mov     eax, dword [ebp-18H]                    ; 2F5F _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 2F62 _ 8B. 40, 0C
        sub     edx, eax                                ; 2F65 _ 29. C2
        mov     eax, edx                                ; 2F67 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2F69 _ 89. 45, E4
        mov     edx, dword [my]                         ; 2F6C _ 8B. 15, 00000138(d)
        mov     eax, dword [ebp-18H]                    ; 2F72 _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 2F75 _ 8B. 40, 10
        sub     edx, eax                                ; 2F78 _ 29. C2
        mov     eax, edx                                ; 2F7A _ 89. D0
        mov     dword [ebp-20H], eax                    ; 2F7C _ 89. 45, E0
        cmp     dword [ebp-1CH], 0                      ; 2F7F _ 83. 7D, E4, 00
        js      ?_170                                   ; 2F83 _ 0F 88, 0000024C
        mov     eax, dword [ebp-18H]                    ; 2F89 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2F8C _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 2F8F _ 3B. 45, E4
        jle     ?_170                                   ; 2F92 _ 0F 8E, 0000023D
        cmp     dword [ebp-20H], 0                      ; 2F98 _ 83. 7D, E0, 00
        js      ?_170                                   ; 2F9C _ 0F 88, 00000233
        mov     eax, dword [ebp-18H]                    ; 2FA2 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 2FA5 _ 8B. 40, 08
        cmp     eax, dword [ebp-20H]                    ; 2FA8 _ 3B. 45, E0
        jle     ?_170                                   ; 2FAB _ 0F 8E, 00000224
        mov     eax, dword [ebp-18H]                    ; 2FB1 _ 8B. 45, E8
        mov     edx, dword [eax]                        ; 2FB4 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 2FB6 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2FB9 _ 8B. 40, 04
        imul    eax, dword [ebp-20H]                    ; 2FBC _ 0F AF. 45, E0
        mov     ecx, eax                                ; 2FC0 _ 89. C1
        mov     eax, dword [ebp-1CH]                    ; 2FC2 _ 8B. 45, E4
        add     eax, ecx                                ; 2FC5 _ 01. C8
        add     eax, edx                                ; 2FC7 _ 01. D0
        movzx   eax, byte [eax]                         ; 2FC9 _ 0F B6. 00
        movzx   edx, al                                 ; 2FCC _ 0F B6. D0
        mov     eax, dword [ebp-18H]                    ; 2FCF _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 2FD2 _ 8B. 40, 14
        cmp     edx, eax                                ; 2FD5 _ 39. C2
        je      ?_170                                   ; 2FD7 _ 0F 84, 000001F8
        mov     eax, dword [current_console_task]       ; 2FDD _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 2FE2 _ 8B. 80, 000000B4
        test    eax, eax                                ; 2FE8 _ 85. C0
        jz      ?_165                                   ; 2FEA _ 74, 68
        mov     eax, dword [current_console_task]       ; 2FEC _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 2FF1 _ 8B. 80, 000000B4
        mov     dword [esp+0CH], 0                      ; 2FF7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_393                   ; 2FFF _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], eax                     ; 3007 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 300B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 300E _ 89. 04 24
        call    make_wtitle8                            ; 3011 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 3016 _ 8B. 45, E8
        mov     ecx, dword [eax+8H]                     ; 3019 _ 8B. 48, 08
        mov     eax, dword [ebp-18H]                    ; 301C _ 8B. 45, E8
        mov     edx, dword [eax+4H]                     ; 301F _ 8B. 50, 04
        mov     eax, dword [current_console_task]       ; 3022 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 3027 _ 8B. 80, 000000B4
        mov     dword [esp+14H], ecx                    ; 302D _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 3031 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 3035 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 303D _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 3045 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3049 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 304C _ 89. 04 24
        call    sheet_refresh                           ; 304F _ E8, FFFFFFFC(rel)
?_165:  mov     eax, dword [ebp-18H]                    ; 3054 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 3057 _ 8B. 40, 20
        mov     dword [current_console_task], eax       ; 305A _ A3, 00000278(d)
        mov     eax, dword [current_console_task]       ; 305F _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 3064 _ 8B. 80, 000000B4
        test    eax, eax                                ; 306A _ 85. C0
        jnz     ?_166                                   ; 306C _ 75, 32
        mov     dword [esp+14H], ?_409                  ; 306E _ C7. 44 24, 14, 00000066(d)
        mov     dword [esp+10H], 7                      ; 3076 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 96                     ; 307E _ C7. 44 24, 0C, 00000060
        mov     dword [esp+8H], 0                       ; 3086 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 308E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3091 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3095 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3098 _ 89. 04 24
        call    showString                              ; 309B _ E8, FFFFFFFC(rel)
?_166:  mov     eax, dword [current_console_task]       ; 30A0 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 30A5 _ 8B. 80, 000000B4
        test    eax, eax                                ; 30AB _ 85. C0
        jz      ?_167                                   ; 30AD _ 74, 60
        mov     eax, dword [current_console_task]       ; 30AF _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 30B4 _ 8B. 80, 000000B4
        mov     dword [esp+0CH], 1                      ; 30BA _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_393                   ; 30C2 _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], eax                     ; 30CA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 30CE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 30D1 _ 89. 04 24
        call    make_wtitle8                            ; 30D4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 30D9 _ 8B. 45, E8
        mov     edx, dword [eax+8H]                     ; 30DC _ 8B. 50, 08
        mov     eax, dword [ebp-18H]                    ; 30DF _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 30E2 _ 8B. 40, 04
        mov     dword [esp+14H], edx                    ; 30E5 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 30E9 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 30ED _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 30F5 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-18H]                    ; 30FD _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 3100 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3104 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3107 _ 89. 04 24
        call    sheet_refresh                           ; 310A _ E8, FFFFFFFC(rel)
?_167:  mov     eax, dword [ebp+8H]                     ; 310F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3112 _ 8B. 40, 10
        sub     eax, 1                                  ; 3115 _ 83. E8, 01
        mov     dword [esp+8H], eax                     ; 3118 _ 89. 44 24, 08
        mov     eax, dword [ebp-18H]                    ; 311C _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 311F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3123 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3126 _ 89. 04 24
        call    sheet_updown                            ; 3129 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-1CH], 2                      ; 312E _ 83. 7D, E4, 02
        jle     ?_168                                   ; 3132 _ 7E, 36
        mov     eax, dword [ebp-18H]                    ; 3134 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 3137 _ 8B. 40, 04
        sub     eax, 3                                  ; 313A _ 83. E8, 03
        cmp     eax, dword [ebp-1CH]                    ; 313D _ 3B. 45, E4
        jle     ?_168                                   ; 3140 _ 7E, 28
        cmp     dword [ebp-20H], 2                      ; 3142 _ 83. 7D, E0, 02
        jle     ?_168                                   ; 3146 _ 7E, 22
        cmp     dword [ebp-20H], 20                     ; 3148 _ 83. 7D, E0, 14
        jg      ?_168                                   ; 314C _ 7F, 1C
        mov     eax, dword [mx]                         ; 314E _ A1, 00000134(d)
        mov     dword [mmx], eax                        ; 3153 _ A3, 00000118(d)
        mov     eax, dword [my]                         ; 3158 _ A1, 00000138(d)
        mov     dword [mmy], eax                        ; 315D _ A3, 0000011C(d)
        mov     eax, dword [ebp-18H]                    ; 3162 _ 8B. 45, E8
        mov     dword [mouse_clicked_sht], eax          ; 3165 _ A3, 00000270(d)
?_168:  mov     eax, dword [ebp-18H]                    ; 316A _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 316D _ 8B. 40, 04
        sub     eax, 21                                 ; 3170 _ 83. E8, 15
        cmp     eax, dword [ebp-1CH]                    ; 3173 _ 3B. 45, E4
        jg      ?_169                                   ; 3176 _ 7F, 5B
        mov     eax, dword [ebp-18H]                    ; 3178 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 317B _ 8B. 40, 04
        sub     eax, 5                                  ; 317E _ 83. E8, 05
        cmp     eax, dword [ebp-1CH]                    ; 3181 _ 3B. 45, E4
        jle     ?_169                                   ; 3184 _ 7E, 4D
        cmp     dword [ebp-20H], 4                      ; 3186 _ 83. 7D, E0, 04
        jle     ?_169                                   ; 318A _ 7E, 47
        cmp     dword [ebp-20H], 18                     ; 318C _ 83. 7D, E0, 12
        jg      ?_169                                   ; 3190 _ 7F, 41
        mov     eax, dword [ebp-18H]                    ; 3192 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 3195 _ 8B. 40, 20
        test    eax, eax                                ; 3198 _ 85. C0
        jz      ?_169                                   ; 319A _ 74, 37
        call    io_cli                                  ; 319C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 31A1 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 31A4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 31A8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 31AB _ 89. 04 24
        call    sheet_free                              ; 31AE _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 31B3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 31B8 _ 89. 45, DC
        mov     eax, dword [ebp-18H]                    ; 31BB _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 31BE _ 8B. 40, 20
        mov     edx, kill_process                       ; 31C1 _ BA, 00000000(d)
        sub     edx, dword [ebp-24H]                    ; 31C6 _ 2B. 55, DC
        mov     dword [eax+4CH], edx                    ; 31C9 _ 89. 50, 4C
        call    io_sti                                  ; 31CC _ E8, FFFFFFFC(rel)
        jmp     ?_172                                   ; 31D1 _ EB, 12

?_169:  jmp     ?_172                                   ; 31D3 _ EB, 10

?_170:  sub     dword [ebp-0CH], 1                      ; 31D5 _ 83. 6D, F4, 01
?_171:  cmp     dword [ebp-0CH], 0                      ; 31D9 _ 83. 7D, F4, 00
        jg      ?_164                                   ; 31DD _ 0F 8F, FFFFFD66
        jmp     ?_175                                   ; 31E3 _ EB, 7D

?_172:  jmp     ?_175                                   ; 31E5 _ EB, 7B

?_173:  mov     edx, dword [mx]                         ; 31E7 _ 8B. 15, 00000134(d)
        mov     eax, dword [mmx]                        ; 31ED _ A1, 00000118(d)
        sub     edx, eax                                ; 31F2 _ 29. C2
        mov     eax, edx                                ; 31F4 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 31F6 _ 89. 45, E4
        mov     edx, dword [my]                         ; 31F9 _ 8B. 15, 00000138(d)
        mov     eax, dword [mmy]                        ; 31FF _ A1, 0000011C(d)
        sub     edx, eax                                ; 3204 _ 29. C2
        mov     eax, edx                                ; 3206 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 3208 _ 89. 45, E0
        mov     eax, dword [mouse_clicked_sht]          ; 320B _ A1, 00000270(d)
        mov     edx, dword [eax+10H]                    ; 3210 _ 8B. 50, 10
        mov     eax, dword [ebp-20H]                    ; 3213 _ 8B. 45, E0
        lea     ecx, [edx+eax]                          ; 3216 _ 8D. 0C 02
        mov     eax, dword [mouse_clicked_sht]          ; 3219 _ A1, 00000270(d)
        mov     edx, dword [eax+0CH]                    ; 321E _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 3221 _ 8B. 45, E4
        add     edx, eax                                ; 3224 _ 01. C2
        mov     eax, dword [mouse_clicked_sht]          ; 3226 _ A1, 00000270(d)
        mov     dword [esp+0CH], ecx                    ; 322B _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 322F _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3233 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3237 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 323A _ 89. 04 24
        call    sheet_slide                             ; 323D _ E8, FFFFFFFC(rel)
        mov     eax, dword [mx]                         ; 3242 _ A1, 00000134(d)
        mov     dword [mmx], eax                        ; 3247 _ A3, 00000118(d)
        mov     eax, dword [my]                         ; 324C _ A1, 00000138(d)
        mov     dword [mmy], eax                        ; 3251 _ A3, 0000011C(d)
        jmp     ?_175                                   ; 3256 _ EB, 0A

?_174:  mov     dword [mmx], -1                         ; 3258 _ C7. 05, 00000118(d), FFFFFFFF
?_175:  leave                                           ; 3262 _ C9
        ret                                             ; 3263 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 3264 _ 55
        mov     ebp, esp                                ; 3265 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3267 _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 326A _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 3270 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 3273 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 3279 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 327C _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 3282 _ 5D
        ret                                             ; 3283 _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 3284 _ 55
        mov     ebp, esp                                ; 3285 _ 89. E5
        sub     esp, 696                                ; 3287 _ 81. EC, 000002B8
        mov     dword [esp+8H], table_rgb.2110          ; 328D _ C7. 44 24, 08, 00000140(d)
        mov     dword [esp+4H], 15                      ; 3295 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 329D _ C7. 04 24, 00000000
        call    set_palette                             ; 32A4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 32A9 _ C7. 45, EC, 00000000
        jmp     ?_181                                   ; 32B0 _ E9, 000000EF

?_176:  mov     dword [ebp-10H], 0                      ; 32B5 _ C7. 45, F0, 00000000
        jmp     ?_180                                   ; 32BC _ E9, 000000D5

?_177:  mov     dword [ebp-0CH], 0                      ; 32C1 _ C7. 45, F4, 00000000
        jmp     ?_179                                   ; 32C8 _ E9, 000000BB

?_178:  mov     edx, dword [ebp-10H]                    ; 32CD _ 8B. 55, F0
        mov     eax, edx                                ; 32D0 _ 89. D0
        add     eax, eax                                ; 32D2 _ 01. C0
        add     eax, edx                                ; 32D4 _ 01. D0
        add     eax, eax                                ; 32D6 _ 01. C0
        mov     edx, eax                                ; 32D8 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 32DA _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 32DD _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 32E0 _ 8B. 55, EC
        mov     eax, edx                                ; 32E3 _ 89. D0
        shl     eax, 3                                  ; 32E5 _ C1. E0, 03
        add     eax, edx                                ; 32E8 _ 01. D0
        shl     eax, 2                                  ; 32EA _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 32ED _ 8D. 14 01
        mov     eax, edx                                ; 32F0 _ 89. D0
        add     eax, eax                                ; 32F2 _ 01. C0
        add     edx, eax                                ; 32F4 _ 01. C2
        mov     eax, dword [ebp-0CH]                    ; 32F6 _ 8B. 45, F4
        mov     ecx, 51                                 ; 32F9 _ B9, 00000033
        imul    eax, ecx                                ; 32FE _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 3301 _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 3308 _ 8B. 55, F0
        mov     eax, edx                                ; 330B _ 89. D0
        add     eax, eax                                ; 330D _ 01. C0
        add     eax, edx                                ; 330F _ 01. D0
        add     eax, eax                                ; 3311 _ 01. C0
        mov     edx, eax                                ; 3313 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3315 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 3318 _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 331B _ 8B. 55, EC
        mov     eax, edx                                ; 331E _ 89. D0
        shl     eax, 3                                  ; 3320 _ C1. E0, 03
        add     eax, edx                                ; 3323 _ 01. D0
        shl     eax, 2                                  ; 3325 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 3328 _ 8D. 14 01
        mov     eax, edx                                ; 332B _ 89. D0
        add     eax, eax                                ; 332D _ 01. C0
        add     eax, edx                                ; 332F _ 01. D0
        lea     edx, [eax+1H]                           ; 3331 _ 8D. 50, 01
        mov     eax, dword [ebp-10H]                    ; 3334 _ 8B. 45, F0
        mov     ecx, 51                                 ; 3337 _ B9, 00000033
        imul    eax, ecx                                ; 333C _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 333F _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 3346 _ 8B. 55, F0
        mov     eax, edx                                ; 3349 _ 89. D0
        add     eax, eax                                ; 334B _ 01. C0
        add     eax, edx                                ; 334D _ 01. D0
        add     eax, eax                                ; 334F _ 01. C0
        mov     edx, eax                                ; 3351 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3353 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 3356 _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 3359 _ 8B. 55, EC
        mov     eax, edx                                ; 335C _ 89. D0
        shl     eax, 3                                  ; 335E _ C1. E0, 03
        add     eax, edx                                ; 3361 _ 01. D0
        shl     eax, 2                                  ; 3363 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 3366 _ 8D. 14 01
        mov     eax, edx                                ; 3369 _ 89. D0
        add     eax, eax                                ; 336B _ 01. C0
        add     eax, edx                                ; 336D _ 01. D0
        lea     edx, [eax+2H]                           ; 336F _ 8D. 50, 02
        mov     eax, dword [ebp-14H]                    ; 3372 _ 8B. 45, EC
        mov     ecx, 51                                 ; 3375 _ B9, 00000033
        imul    eax, ecx                                ; 337A _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 337D _ 88. 84 15, FFFFFD64
        add     dword [ebp-0CH], 1                      ; 3384 _ 83. 45, F4, 01
?_179:  cmp     dword [ebp-0CH], 5                      ; 3388 _ 83. 7D, F4, 05
        jle     ?_178                                   ; 338C _ 0F 8E, FFFFFF3B
        add     dword [ebp-10H], 1                      ; 3392 _ 83. 45, F0, 01
?_180:  cmp     dword [ebp-10H], 5                      ; 3396 _ 83. 7D, F0, 05
        jle     ?_177                                   ; 339A _ 0F 8E, FFFFFF21
        add     dword [ebp-14H], 1                      ; 33A0 _ 83. 45, EC, 01
?_181:  cmp     dword [ebp-14H], 5                      ; 33A4 _ 83. 7D, EC, 05
        jle     ?_176                                   ; 33A8 _ 0F 8E, FFFFFF07
        lea     eax, [ebp-29CH]                         ; 33AE _ 8D. 85, FFFFFD64
        mov     dword [esp+8H], eax                     ; 33B4 _ 89. 44 24, 08
        mov     dword [esp+4H], 231                     ; 33B8 _ C7. 44 24, 04, 000000E7
        mov     dword [esp], 16                         ; 33C0 _ C7. 04 24, 00000010
        call    set_palette                             ; 33C7 _ E8, FFFFFFFC(rel)
        nop                                             ; 33CC _ 90
        leave                                           ; 33CD _ C9
        ret                                             ; 33CE _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 33CF _ 55
        mov     ebp, esp                                ; 33D0 _ 89. E5
        sub     esp, 40                                 ; 33D2 _ 83. EC, 28
        call    io_load_eflags                          ; 33D5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 33DA _ 89. 45, F0
        call    io_cli                                  ; 33DD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 33E2 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 33E5 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 33E9 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 33F0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 33F5 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 33F8 _ 89. 45, F4
        jmp     ?_183                                   ; 33FB _ EB, 62

?_182:  mov     eax, dword [ebp+10H]                    ; 33FD _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 3400 _ 0F B6. 00
        shr     al, 2                                   ; 3403 _ C0. E8, 02
        movzx   eax, al                                 ; 3406 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 3409 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 340D _ C7. 04 24, 000003C9
        call    io_out8                                 ; 3414 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3419 _ 8B. 45, 10
        add     eax, 1                                  ; 341C _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 341F _ 0F B6. 00
        shr     al, 2                                   ; 3422 _ C0. E8, 02
        movzx   eax, al                                 ; 3425 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 3428 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 342C _ C7. 04 24, 000003C9
        call    io_out8                                 ; 3433 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3438 _ 8B. 45, 10
        add     eax, 2                                  ; 343B _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 343E _ 0F B6. 00
        shr     al, 2                                   ; 3441 _ C0. E8, 02
        movzx   eax, al                                 ; 3444 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 3447 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 344B _ C7. 04 24, 000003C9
        call    io_out8                                 ; 3452 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 3457 _ 83. 45, 10, 03
        add     dword [ebp-0CH], 1                      ; 345B _ 83. 45, F4, 01
?_183:  mov     eax, dword [ebp-0CH]                    ; 345F _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 3462 _ 3B. 45, 0C
        jle     ?_182                                   ; 3465 _ 7E, 96
        mov     eax, dword [ebp-10H]                    ; 3467 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 346A _ 89. 04 24
        call    io_store_eflags                         ; 346D _ E8, FFFFFFFC(rel)
        nop                                             ; 3472 _ 90
        leave                                           ; 3473 _ C9
        ret                                             ; 3474 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 3475 _ 55
        mov     ebp, esp                                ; 3476 _ 89. E5
        sub     esp, 20                                 ; 3478 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 347B _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 347E _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 3481 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 3484 _ 89. 45, F8
        jmp     ?_187                                   ; 3487 _ EB, 33

?_184:  mov     eax, dword [ebp+14H]                    ; 3489 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 348C _ 89. 45, FC
        jmp     ?_186                                   ; 348F _ EB, 1F

?_185:  mov     eax, dword [ebp-8H]                     ; 3491 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 3494 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3498 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 349A _ 8B. 45, FC
        add     eax, edx                                ; 349D _ 01. D0
        mov     edx, eax                                ; 349F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34A1 _ 8B. 45, 08
        add     edx, eax                                ; 34A4 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 34A6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 34AA _ 88. 02
        add     dword [ebp-4H], 1                       ; 34AC _ 83. 45, FC, 01
?_186:  mov     eax, dword [ebp-4H]                     ; 34B0 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 34B3 _ 3B. 45, 1C
        jle     ?_185                                   ; 34B6 _ 7E, D9
        add     dword [ebp-8H], 1                       ; 34B8 _ 83. 45, F8, 01
?_187:  mov     eax, dword [ebp-8H]                     ; 34BC _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 34BF _ 3B. 45, 20
        jle     ?_184                                   ; 34C2 _ 7E, C5
        leave                                           ; 34C4 _ C9
        ret                                             ; 34C5 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 34C6 _ 55
        mov     ebp, esp                                ; 34C7 _ 89. E5
        sub     esp, 20                                 ; 34C9 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 34CC _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 34CF _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 34D2 _ C7. 45, FC, 00000000
        jmp     ?_197                                   ; 34D9 _ E9, 0000016C

?_188:  mov     edx, dword [ebp-4H]                     ; 34DE _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 34E1 _ 8B. 45, 1C
        add     eax, edx                                ; 34E4 _ 01. D0
        movzx   eax, byte [eax]                         ; 34E6 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 34E9 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 34EC _ 80. 7D, FB, 00
        jns     ?_189                                   ; 34F0 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 34F2 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 34F5 _ 8B. 55, 14
        add     eax, edx                                ; 34F8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 34FA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 34FE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3500 _ 8B. 45, 10
        add     eax, edx                                ; 3503 _ 01. D0
        mov     edx, eax                                ; 3505 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3507 _ 8B. 45, 08
        add     edx, eax                                ; 350A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 350C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3510 _ 88. 02
?_189:  movsx   eax, byte [ebp-5H]                      ; 3512 _ 0F BE. 45, FB
        and     eax, 40H                                ; 3516 _ 83. E0, 40
        test    eax, eax                                ; 3519 _ 85. C0
        jz      ?_190                                   ; 351B _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 351D _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 3520 _ 8B. 55, 14
        add     eax, edx                                ; 3523 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3525 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3529 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 352B _ 8B. 45, 10
        add     eax, edx                                ; 352E _ 01. D0
        lea     edx, [eax+1H]                           ; 3530 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3533 _ 8B. 45, 08
        add     edx, eax                                ; 3536 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3538 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 353C _ 88. 02
?_190:  movsx   eax, byte [ebp-5H]                      ; 353E _ 0F BE. 45, FB
        and     eax, 20H                                ; 3542 _ 83. E0, 20
        test    eax, eax                                ; 3545 _ 85. C0
        jz      ?_191                                   ; 3547 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 3549 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 354C _ 8B. 55, 14
        add     eax, edx                                ; 354F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3551 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3555 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3557 _ 8B. 45, 10
        add     eax, edx                                ; 355A _ 01. D0
        lea     edx, [eax+2H]                           ; 355C _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 355F _ 8B. 45, 08
        add     edx, eax                                ; 3562 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3564 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3568 _ 88. 02
?_191:  movsx   eax, byte [ebp-5H]                      ; 356A _ 0F BE. 45, FB
        and     eax, 10H                                ; 356E _ 83. E0, 10
        test    eax, eax                                ; 3571 _ 85. C0
        jz      ?_192                                   ; 3573 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 3575 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 3578 _ 8B. 55, 14
        add     eax, edx                                ; 357B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 357D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3581 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3583 _ 8B. 45, 10
        add     eax, edx                                ; 3586 _ 01. D0
        lea     edx, [eax+3H]                           ; 3588 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 358B _ 8B. 45, 08
        add     edx, eax                                ; 358E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3590 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3594 _ 88. 02
?_192:  movsx   eax, byte [ebp-5H]                      ; 3596 _ 0F BE. 45, FB
        and     eax, 08H                                ; 359A _ 83. E0, 08
        test    eax, eax                                ; 359D _ 85. C0
        jz      ?_193                                   ; 359F _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 35A1 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 35A4 _ 8B. 55, 14
        add     eax, edx                                ; 35A7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 35A9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 35AD _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 35AF _ 8B. 45, 10
        add     eax, edx                                ; 35B2 _ 01. D0
        lea     edx, [eax+4H]                           ; 35B4 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 35B7 _ 8B. 45, 08
        add     edx, eax                                ; 35BA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 35BC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 35C0 _ 88. 02
?_193:  movsx   eax, byte [ebp-5H]                      ; 35C2 _ 0F BE. 45, FB
        and     eax, 04H                                ; 35C6 _ 83. E0, 04
        test    eax, eax                                ; 35C9 _ 85. C0
        jz      ?_194                                   ; 35CB _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 35CD _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 35D0 _ 8B. 55, 14
        add     eax, edx                                ; 35D3 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 35D5 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 35D9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 35DB _ 8B. 45, 10
        add     eax, edx                                ; 35DE _ 01. D0
        lea     edx, [eax+5H]                           ; 35E0 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 35E3 _ 8B. 45, 08
        add     edx, eax                                ; 35E6 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 35E8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 35EC _ 88. 02
?_194:  movsx   eax, byte [ebp-5H]                      ; 35EE _ 0F BE. 45, FB
        and     eax, 02H                                ; 35F2 _ 83. E0, 02
        test    eax, eax                                ; 35F5 _ 85. C0
        jz      ?_195                                   ; 35F7 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 35F9 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 35FC _ 8B. 55, 14
        add     eax, edx                                ; 35FF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3601 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3605 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3607 _ 8B. 45, 10
        add     eax, edx                                ; 360A _ 01. D0
        lea     edx, [eax+6H]                           ; 360C _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 360F _ 8B. 45, 08
        add     edx, eax                                ; 3612 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3614 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3618 _ 88. 02
?_195:  movsx   eax, byte [ebp-5H]                      ; 361A _ 0F BE. 45, FB
        and     eax, 01H                                ; 361E _ 83. E0, 01
        test    eax, eax                                ; 3621 _ 85. C0
        jz      ?_196                                   ; 3623 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 3625 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 3628 _ 8B. 55, 14
        add     eax, edx                                ; 362B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 362D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3631 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3633 _ 8B. 45, 10
        add     eax, edx                                ; 3636 _ 01. D0
        lea     edx, [eax+7H]                           ; 3638 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 363B _ 8B. 45, 08
        add     edx, eax                                ; 363E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3640 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3644 _ 88. 02
?_196:  add     dword [ebp-4H], 1                       ; 3646 _ 83. 45, FC, 01
?_197:  cmp     dword [ebp-4H], 15                      ; 364A _ 83. 7D, FC, 0F
        jle     ?_188                                   ; 364E _ 0F 8E, FFFFFE8A
        leave                                           ; 3654 _ C9
        ret                                             ; 3655 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 3656 _ 55
        mov     ebp, esp                                ; 3657 _ 89. E5
        sub     esp, 20                                 ; 3659 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 365C _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 365F _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 3662 _ C7. 45, F8, 00000000
        jmp     ?_204                                   ; 3669 _ E9, 000000B1

?_198:  mov     dword [ebp-4H], 0                       ; 366E _ C7. 45, FC, 00000000
        jmp     ?_203                                   ; 3675 _ E9, 00000097

?_199:  mov     eax, dword [ebp-8H]                     ; 367A _ 8B. 45, F8
        shl     eax, 4                                  ; 367D _ C1. E0, 04
        mov     edx, eax                                ; 3680 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3682 _ 8B. 45, FC
        add     eax, edx                                ; 3685 _ 01. D0
        add     eax, cursor.2170                        ; 3687 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 368C _ 0F B6. 00
        cmp     al, 42                                  ; 368F _ 3C, 2A
        jnz     ?_200                                   ; 3691 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 3693 _ 8B. 45, F8
        shl     eax, 4                                  ; 3696 _ C1. E0, 04
        mov     edx, eax                                ; 3699 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 369B _ 8B. 45, FC
        add     eax, edx                                ; 369E _ 01. D0
        mov     edx, eax                                ; 36A0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 36A2 _ 8B. 45, 08
        add     eax, edx                                ; 36A5 _ 01. D0
        mov     byte [eax], 0                           ; 36A7 _ C6. 00, 00
?_200:  mov     eax, dword [ebp-8H]                     ; 36AA _ 8B. 45, F8
        shl     eax, 4                                  ; 36AD _ C1. E0, 04
        mov     edx, eax                                ; 36B0 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 36B2 _ 8B. 45, FC
        add     eax, edx                                ; 36B5 _ 01. D0
        add     eax, cursor.2170                        ; 36B7 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 36BC _ 0F B6. 00
        cmp     al, 79                                  ; 36BF _ 3C, 4F
        jnz     ?_201                                   ; 36C1 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 36C3 _ 8B. 45, F8
        shl     eax, 4                                  ; 36C6 _ C1. E0, 04
        mov     edx, eax                                ; 36C9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 36CB _ 8B. 45, FC
        add     eax, edx                                ; 36CE _ 01. D0
        mov     edx, eax                                ; 36D0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 36D2 _ 8B. 45, 08
        add     eax, edx                                ; 36D5 _ 01. D0
        mov     byte [eax], 7                           ; 36D7 _ C6. 00, 07
?_201:  mov     eax, dword [ebp-8H]                     ; 36DA _ 8B. 45, F8
        shl     eax, 4                                  ; 36DD _ C1. E0, 04
        mov     edx, eax                                ; 36E0 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 36E2 _ 8B. 45, FC
        add     eax, edx                                ; 36E5 _ 01. D0
        add     eax, cursor.2170                        ; 36E7 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 36EC _ 0F B6. 00
        cmp     al, 46                                  ; 36EF _ 3C, 2E
        jnz     ?_202                                   ; 36F1 _ 75, 1A
        mov     eax, dword [ebp-8H]                     ; 36F3 _ 8B. 45, F8
        shl     eax, 4                                  ; 36F6 _ C1. E0, 04
        mov     edx, eax                                ; 36F9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 36FB _ 8B. 45, FC
        add     eax, edx                                ; 36FE _ 01. D0
        mov     edx, eax                                ; 3700 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3702 _ 8B. 45, 08
        add     edx, eax                                ; 3705 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3707 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 370B _ 88. 02
?_202:  add     dword [ebp-4H], 1                       ; 370D _ 83. 45, FC, 01
?_203:  cmp     dword [ebp-4H], 15                      ; 3711 _ 83. 7D, FC, 0F
        jle     ?_199                                   ; 3715 _ 0F 8E, FFFFFF5F
        add     dword [ebp-8H], 1                       ; 371B _ 83. 45, F8, 01
?_204:  cmp     dword [ebp-8H], 15                      ; 371F _ 83. 7D, F8, 0F
        jle     ?_198                                   ; 3723 _ 0F 8E, FFFFFF45
        leave                                           ; 3729 _ C9
        ret                                             ; 372A _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 372B _ 55
        mov     ebp, esp                                ; 372C _ 89. E5
        sub     esp, 16                                 ; 372E _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3731 _ C7. 45, F8, 00000000
        jmp     ?_208                                   ; 3738 _ EB, 50

?_205:  mov     dword [ebp-4H], 0                       ; 373A _ C7. 45, FC, 00000000
        jmp     ?_207                                   ; 3741 _ EB, 3B

?_206:  mov     eax, dword [ebp-8H]                     ; 3743 _ 8B. 45, F8
        mov     edx, dword [ebp+1CH]                    ; 3746 _ 8B. 55, 1C
        add     eax, edx                                ; 3749 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 374B _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 374F _ 8B. 55, FC
        mov     ecx, dword [ebp+18H]                    ; 3752 _ 8B. 4D, 18
        add     edx, ecx                                ; 3755 _ 01. CA
        add     eax, edx                                ; 3757 _ 01. D0
        mov     edx, eax                                ; 3759 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 375B _ 8B. 45, 08
        add     edx, eax                                ; 375E _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 3760 _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 3763 _ 0F AF. 45, 24
        mov     ecx, eax                                ; 3767 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 3769 _ 8B. 45, FC
        add     eax, ecx                                ; 376C _ 01. C8
        mov     ecx, eax                                ; 376E _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 3770 _ 8B. 45, 20
        add     eax, ecx                                ; 3773 _ 01. C8
        movzx   eax, byte [eax]                         ; 3775 _ 0F B6. 00
        mov     byte [edx], al                          ; 3778 _ 88. 02
        add     dword [ebp-4H], 1                       ; 377A _ 83. 45, FC, 01
?_207:  mov     eax, dword [ebp-4H]                     ; 377E _ 8B. 45, FC
        cmp     eax, dword [ebp+10H]                    ; 3781 _ 3B. 45, 10
        jl      ?_206                                   ; 3784 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 3786 _ 83. 45, F8, 01
?_208:  mov     eax, dword [ebp-8H]                     ; 378A _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 378D _ 3B. 45, 14
        jl      ?_205                                   ; 3790 _ 7C, A8
        leave                                           ; 3792 _ C9
        ret                                             ; 3793 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 3794 _ 55
        mov     ebp, esp                                ; 3795 _ 89. E5
        sub     esp, 40                                 ; 3797 _ 83. EC, 28
        mov     eax, dword [bootInfo]                   ; 379A _ A1, 00000018(d)
        mov     dword [ebp-0CH], eax                    ; 379F _ 89. 45, F4
        movzx   eax, word [?_421]                       ; 37A2 _ 0F B7. 05, 0000001C(d)
        cwde                                            ; 37A9 _ 98
        mov     dword [ebp-10H], eax                    ; 37AA _ 89. 45, F0
        movzx   eax, word [?_422]                       ; 37AD _ 0F B7. 05, 0000001E(d)
        cwde                                            ; 37B4 _ 98
        mov     dword [ebp-14H], eax                    ; 37B5 _ 89. 45, EC
        mov     dword [esp+4H], 32                      ; 37B8 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 37C0 _ C7. 04 24, 00000020
        call    io_out8                                 ; 37C7 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], 0                       ; 37CC _ C6. 45, EB, 00
        mov     dword [esp], 96                         ; 37D0 _ C7. 04 24, 00000060
        call    io_in8                                  ; 37D7 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], al                      ; 37DC _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 37DF _ 0F B6. 45, EB
        mov     dword [esp+4H], eax                     ; 37E3 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 37E7 _ C7. 04 24, 00000020(d)
        call    fifo8_put                               ; 37EE _ E8, FFFFFFFC(rel)
        nop                                             ; 37F3 _ 90
        leave                                           ; 37F4 _ C9
        ret                                             ; 37F5 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 37F6 _ 55
        mov     ebp, esp                                ; 37F7 _ 89. E5
        sub     esp, 4                                  ; 37F9 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 37FC _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 37FF _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 3802 _ 80. 7D, FC, 09
        jle     ?_209                                   ; 3806 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 3808 _ 0F B6. 45, FC
        add     eax, 55                                 ; 380C _ 83. C0, 37
        jmp     ?_210                                   ; 380F _ EB, 07

?_209:  movzx   eax, byte [ebp-4H]                      ; 3811 _ 0F B6. 45, FC
        add     eax, 48                                 ; 3815 _ 83. C0, 30
?_210:  leave                                           ; 3818 _ C9
        ret                                             ; 3819 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 381A _ 55
        mov     ebp, esp                                ; 381B _ 89. E5
        sub     esp, 24                                 ; 381D _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 3820 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 3823 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 3826 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 382D _ 0F B6. 45, EC
        and     eax, 0FH                                ; 3831 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 3834 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 3837 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 383B _ 89. 04 24
        call    charToHexVal                            ; 383E _ E8, FFFFFFFC(rel)
        mov     byte [?_420], al                        ; 3843 _ A2, 00000113(d)
        movzx   eax, byte [ebp-14H]                     ; 3848 _ 0F B6. 45, EC
        shr     al, 4                                   ; 384C _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 384F _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 3852 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 3856 _ 0F BE. C0
        mov     dword [esp], eax                        ; 3859 _ 89. 04 24
        call    charToHexVal                            ; 385C _ E8, FFFFFFFC(rel)
        mov     byte [?_419], al                        ; 3861 _ A2, 00000112(d)
        mov     eax, keyval                             ; 3866 _ B8, 00000110(d)
        leave                                           ; 386B _ C9
        ret                                             ; 386C _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 386D _ 55
        mov     ebp, esp                                ; 386E _ 89. E5
        sub     esp, 16                                 ; 3870 _ 83. EC, 10
        mov     byte [str.2218], 48                     ; 3873 _ C6. 05, 00000374(d), 30
        mov     byte [?_425], 88                        ; 387A _ C6. 05, 00000375(d), 58
        mov     byte [?_426], 0                         ; 3881 _ C6. 05, 0000037E(d), 00
        mov     dword [ebp-4H], 2                       ; 3888 _ C7. 45, FC, 00000002
        jmp     ?_212                                   ; 388F _ EB, 0F

?_211:  mov     eax, dword [ebp-4H]                     ; 3891 _ 8B. 45, FC
        add     eax, str.2218                           ; 3894 _ 05, 00000374(d)
        mov     byte [eax], 48                          ; 3899 _ C6. 00, 30
        add     dword [ebp-4H], 1                       ; 389C _ 83. 45, FC, 01
?_212:  cmp     dword [ebp-4H], 9                       ; 38A0 _ 83. 7D, FC, 09
        jle     ?_211                                   ; 38A4 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 38A6 _ C7. 45, F8, 00000009
        jmp     ?_216                                   ; 38AD _ EB, 40

?_213:  mov     eax, dword [ebp+8H]                     ; 38AF _ 8B. 45, 08
        and     eax, 0FH                                ; 38B2 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 38B5 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 38B8 _ 8B. 45, 08
        shr     eax, 4                                  ; 38BB _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 38BE _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 38C1 _ 83. 7D, F4, 09
        jle     ?_214                                   ; 38C5 _ 7E, 13
        mov     eax, dword [ebp-0CH]                    ; 38C7 _ 8B. 45, F4
        add     eax, 55                                 ; 38CA _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 38CD _ 8B. 55, F8
        add     edx, str.2218                           ; 38D0 _ 81. C2, 00000374(d)
        mov     byte [edx], al                          ; 38D6 _ 88. 02
        jmp     ?_215                                   ; 38D8 _ EB, 11

?_214:  mov     eax, dword [ebp-0CH]                    ; 38DA _ 8B. 45, F4
        add     eax, 48                                 ; 38DD _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 38E0 _ 8B. 55, F8
        add     edx, str.2218                           ; 38E3 _ 81. C2, 00000374(d)
        mov     byte [edx], al                          ; 38E9 _ 88. 02
?_215:  sub     dword [ebp-8H], 1                       ; 38EB _ 83. 6D, F8, 01
?_216:  cmp     dword [ebp-8H], 1                       ; 38EF _ 83. 7D, F8, 01
        jle     ?_217                                   ; 38F3 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 38F5 _ 83. 7D, 08, 00
        jnz     ?_213                                   ; 38F9 _ 75, B4
?_217:  mov     eax, str.2218                           ; 38FB _ B8, 00000374(d)
        leave                                           ; 3900 _ C9
        ret                                             ; 3901 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 3902 _ 55
        mov     ebp, esp                                ; 3903 _ 89. E5
        sub     esp, 24                                 ; 3905 _ 83. EC, 18
?_218:  mov     dword [esp], 100                        ; 3908 _ C7. 04 24, 00000064
        call    io_in8                                  ; 390F _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 3914 _ 83. E0, 02
        test    eax, eax                                ; 3917 _ 85. C0
        jnz     ?_219                                   ; 3919 _ 75, 02
        jmp     ?_220                                   ; 391B _ EB, 02

?_219:  jmp     ?_218                                   ; 391D _ EB, E9

?_220:  leave                                           ; 391F _ C9
        ret                                             ; 3920 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 3921 _ 55
        mov     ebp, esp                                ; 3922 _ 89. E5
        sub     esp, 24                                 ; 3924 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 3927 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 392C _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 3934 _ C7. 04 24, 00000064
        call    io_out8                                 ; 393B _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 3940 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 3945 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 394D _ C7. 04 24, 00000060
        call    io_out8                                 ; 3954 _ E8, FFFFFFFC(rel)
        nop                                             ; 3959 _ 90
        leave                                           ; 395A _ C9
        ret                                             ; 395B _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 395C _ 55
        mov     ebp, esp                                ; 395D _ 89. E5
        sub     esp, 24                                 ; 395F _ 83. EC, 18
        call    wait_KBC_sendready                      ; 3962 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 3967 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 396F _ C7. 04 24, 00000064
        call    io_out8                                 ; 3976 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 397B _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 3980 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 3988 _ C7. 04 24, 00000060
        call    io_out8                                 ; 398F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 3994 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 3997 _ C6. 40, 03, 00
        nop                                             ; 399B _ 90
        leave                                           ; 399C _ C9
        ret                                             ; 399D _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 399E _ 55
        mov     ebp, esp                                ; 399F _ 89. E5
        sub     esp, 40                                 ; 39A1 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 39A4 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 39AC _ C7. 04 24, 000000A0
        call    io_out8                                 ; 39B3 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 39B8 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 39C0 _ C7. 04 24, 00000020
        call    io_out8                                 ; 39C7 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 39CC _ C7. 04 24, 00000060
        call    io_in8                                  ; 39D3 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 39D8 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 39DB _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 39DF _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 39E3 _ C7. 04 24, 0000003C(d)
        call    fifo8_put                               ; 39EA _ E8, FFFFFFFC(rel)
        leave                                           ; 39EF _ C9
        ret                                             ; 39F0 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 39F1 _ 55
        mov     ebp, esp                                ; 39F2 _ 89. E5
        sub     esp, 4                                  ; 39F4 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 39F7 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 39FA _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 39FD _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3A00 _ 0F B6. 40, 03
        test    al, al                                  ; 3A04 _ 84. C0
        jnz     ?_222                                   ; 3A06 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 3A08 _ 80. 7D, FC, FA
        jnz     ?_221                                   ; 3A0C _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 3A0E _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 3A11 _ C6. 40, 03, 01
?_221:  mov     eax, 0                                  ; 3A15 _ B8, 00000000
        jmp     ?_229                                   ; 3A1A _ E9, 0000010F

?_222:  mov     eax, dword [ebp+8H]                     ; 3A1F _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3A22 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 3A26 _ 3C, 01
        jnz     ?_224                                   ; 3A28 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 3A2A _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 3A2E _ 25, 000000C8
        cmp     eax, 8                                  ; 3A33 _ 83. F8, 08
        jnz     ?_223                                   ; 3A36 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 3A38 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3A3B _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 3A3F _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 3A41 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 3A44 _ C6. 40, 03, 02
?_223:  mov     eax, 0                                  ; 3A48 _ B8, 00000000
        jmp     ?_229                                   ; 3A4D _ E9, 000000DC

?_224:  mov     eax, dword [ebp+8H]                     ; 3A52 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3A55 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 3A59 _ 3C, 02
        jnz     ?_225                                   ; 3A5B _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 3A5D _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3A60 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 3A64 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3A67 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 3A6A _ C6. 40, 03, 03
        mov     eax, 0                                  ; 3A6E _ B8, 00000000
        jmp     ?_229                                   ; 3A73 _ E9, 000000B6

?_225:  mov     eax, dword [ebp+8H]                     ; 3A78 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3A7B _ 0F B6. 40, 03
        cmp     al, 3                                   ; 3A7F _ 3C, 03
        jne     ?_228                                   ; 3A81 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 3A87 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3A8A _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 3A8E _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 3A91 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 3A94 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 3A98 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3A9B _ 0F B6. 00
        movzx   eax, al                                 ; 3A9E _ 0F B6. C0
        and     eax, 07H                                ; 3AA1 _ 83. E0, 07
        mov     edx, eax                                ; 3AA4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3AA6 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3AA9 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3AAC _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 3AAF _ 0F B6. 40, 01
        movzx   edx, al                                 ; 3AB3 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 3AB6 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3AB9 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3ABC _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 3ABF _ 0F B6. 40, 02
        movzx   edx, al                                 ; 3AC3 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 3AC6 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3AC9 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3ACC _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3ACF _ 0F B6. 00
        movzx   eax, al                                 ; 3AD2 _ 0F B6. C0
        and     eax, 10H                                ; 3AD5 _ 83. E0, 10
        test    eax, eax                                ; 3AD8 _ 85. C0
        jz      ?_226                                   ; 3ADA _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 3ADC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3ADF _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 3AE2 _ 0D, FFFFFF00
        mov     edx, eax                                ; 3AE7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3AE9 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3AEC _ 89. 50, 04
?_226:  mov     eax, dword [ebp+8H]                     ; 3AEF _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3AF2 _ 0F B6. 00
        movzx   eax, al                                 ; 3AF5 _ 0F B6. C0
        and     eax, 20H                                ; 3AF8 _ 83. E0, 20
        test    eax, eax                                ; 3AFB _ 85. C0
        jz      ?_227                                   ; 3AFD _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 3AFF _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3B02 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 3B05 _ 0D, FFFFFF00
        mov     edx, eax                                ; 3B0A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3B0C _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3B0F _ 89. 50, 08
?_227:  mov     eax, dword [ebp+8H]                     ; 3B12 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3B15 _ 8B. 40, 08
        neg     eax                                     ; 3B18 _ F7. D8
        mov     edx, eax                                ; 3B1A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3B1C _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3B1F _ 89. 50, 08
        mov     eax, 1                                  ; 3B22 _ B8, 00000001
        jmp     ?_229                                   ; 3B27 _ EB, 05

?_228:  mov     eax, 4294967295                         ; 3B29 _ B8, FFFFFFFF
?_229:  leave                                           ; 3B2E _ C9
        ret                                             ; 3B2F _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 3B30 _ 55
        mov     ebp, esp                                ; 3B31 _ 89. E5
        sub     esp, 72                                 ; 3B33 _ 83. EC, 48
        mov     dword [ebp-0CH], 0                      ; 3B36 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 3B3D _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 3B44 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 3B4B _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 3B52 _ 8B. 15, 00000140(d)
        mov     eax, dword [ebp+0CH]                    ; 3B58 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3B5B _ 8B. 00
        mov     dword [esp+8H], edx                     ; 3B5D _ 89. 54 24, 08
        mov     edx, dword [ebp+1CH]                    ; 3B61 _ 8B. 55, 1C
        mov     dword [esp+4H], edx                     ; 3B64 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3B68 _ 89. 04 24
        call    init_screen8                            ; 3B6B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+20H]                    ; 3B70 _ 8B. 45, 20
        movsx   eax, al                                 ; 3B73 _ 0F BE. C0
        mov     dword [esp+14H], ?_410                  ; 3B76 _ C7. 44 24, 14, 00000070(d)
        mov     dword [esp+10H], eax                    ; 3B7E _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3B82 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3B85 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3B89 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3B8C _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3B90 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3B93 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3B97 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B9A _ 89. 04 24
        call    showString                              ; 3B9D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+18H]                    ; 3BA2 _ 8B. 45, 18
        mov     dword [esp], eax                        ; 3BA5 _ 89. 04 24
        call    intToHexStr                             ; 3BA8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 3BAD _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 3BB0 _ 8B. 45, 20
        movsx   eax, al                                 ; 3BB3 _ 0F BE. C0
        mov     edx, dword [ebp-1CH]                    ; 3BB6 _ 8B. 55, E4
        mov     dword [esp+14H], edx                    ; 3BB9 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3BBD _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3BC1 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3BC4 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 3BC8 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 3BCB _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3BCF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3BD2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3BD6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3BD9 _ 89. 04 24
        call    showString                              ; 3BDC _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 3BE1 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 3BE5 _ 8B. 45, 20
        movsx   eax, al                                 ; 3BE8 _ 0F BE. C0
        mov     dword [esp+14H], ?_411                  ; 3BEB _ C7. 44 24, 14, 0000007A(d)
        mov     dword [esp+10H], eax                    ; 3BF3 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3BF7 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3BFA _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3BFE _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3C01 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3C05 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3C08 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3C0C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C0F _ 89. 04 24
        call    showString                              ; 3C12 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3C17 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 3C1A _ 8B. 00
        mov     dword [esp], eax                        ; 3C1C _ 89. 04 24
        call    intToHexStr                             ; 3C1F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 3C24 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 3C27 _ 8B. 45, 20
        movsx   eax, al                                 ; 3C2A _ 0F BE. C0
        mov     edx, dword [ebp-20H]                    ; 3C2D _ 8B. 55, E0
        mov     dword [esp+14H], edx                    ; 3C30 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3C34 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3C38 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3C3B _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 3C3F _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 3C42 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3C46 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3C49 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3C4D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C50 _ 89. 04 24
        call    showString                              ; 3C53 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 3C58 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 3C5C _ 8B. 45, 20
        movsx   eax, al                                 ; 3C5F _ 0F BE. C0
        mov     dword [esp+14H], ?_412                  ; 3C62 _ C7. 44 24, 14, 00000086(d)
        mov     dword [esp+10H], eax                    ; 3C6A _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3C6E _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3C71 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3C75 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3C78 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3C7C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3C7F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3C83 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C86 _ 89. 04 24
        call    showString                              ; 3C89 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3C8E _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 3C91 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 3C94 _ 89. 04 24
        call    intToHexStr                             ; 3C97 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 3C9C _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 3C9F _ 8B. 45, 20
        movsx   eax, al                                 ; 3CA2 _ 0F BE. C0
        mov     edx, dword [ebp-24H]                    ; 3CA5 _ 8B. 55, DC
        mov     dword [esp+14H], edx                    ; 3CA8 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3CAC _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3CB0 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3CB3 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 3CB7 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 3CBA _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3CBE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3CC1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3CC5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3CC8 _ 89. 04 24
        call    showString                              ; 3CCB _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 3CD0 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 3CD4 _ 8B. 45, 20
        movsx   eax, al                                 ; 3CD7 _ 0F BE. C0
        mov     dword [esp+14H], ?_413                  ; 3CDA _ C7. 44 24, 14, 00000092(d)
        mov     dword [esp+10H], eax                    ; 3CE2 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3CE6 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3CE9 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3CED _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3CF0 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3CF4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3CF7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3CFB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3CFE _ 89. 04 24
        call    showString                              ; 3D01 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3D06 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 3D09 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 3D0C _ 89. 04 24
        call    intToHexStr                             ; 3D0F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 3D14 _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 3D17 _ 8B. 45, 20
        movsx   eax, al                                 ; 3D1A _ 0F BE. C0
        mov     edx, dword [ebp-28H]                    ; 3D1D _ 8B. 55, D8
        mov     dword [esp+14H], edx                    ; 3D20 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3D24 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3D28 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3D2B _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 3D2F _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 3D32 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3D36 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3D39 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3D3D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3D40 _ 89. 04 24
        call    showString                              ; 3D43 _ E8, FFFFFFFC(rel)
        leave                                           ; 3D48 _ C9
        ret                                             ; 3D49 _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 3D4A _ 55
        mov     ebp, esp                                ; 3D4B _ 89. E5
        sub     esp, 56                                 ; 3D4D _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 3D50 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3D53 _ 89. 04 24
        call    sheet_alloc                             ; 3D56 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3D5B _ 89. 45, F4
        mov     eax, dword [memman]                     ; 3D5E _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 3D63 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 3D6B _ 89. 04 24
        call    memman_alloc_4k                         ; 3D6E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3D73 _ 89. 45, F0
        mov     dword [esp+10H], -1                     ; 3D76 _ C7. 44 24, 10, FFFFFFFF
        mov     dword [esp+0CH], 68                     ; 3D7E _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 3D86 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-10H]                    ; 3D8E _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 3D91 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 3D95 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 3D98 _ 89. 04 24
        call    sheet_setbuf                            ; 3D9B _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 3DA0 _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 3DA8 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 3DAB _ 89. 44 24, 08
        mov     eax, dword [ebp-0CH]                    ; 3DAF _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 3DB2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3DB6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3DB9 _ 89. 04 24
        call    make_window8                            ; 3DBC _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 3DC1 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 3DC9 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 3DD1 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 3DD9 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 3DE1 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 3DE9 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 3DEC _ 89. 04 24
        call    make_textbox8                           ; 3DEF _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 3DF4 _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 3DFC _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-0CH]                    ; 3E04 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 3E07 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3E0B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3E0E _ 89. 04 24
        call    sheet_slide                             ; 3E11 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 3E16 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-0CH]                    ; 3E1E _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 3E21 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3E25 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3E28 _ 89. 04 24
        call    sheet_updown                            ; 3E2B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3E30 _ 8B. 45, F4
        leave                                           ; 3E33 _ C9
        ret                                             ; 3E34 _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 3E35 _ 55
        mov     ebp, esp                                ; 3E36 _ 89. E5
        push    ebx                                     ; 3E38 _ 53
        sub     esp, 52                                 ; 3E39 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 3E3C _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 3E3F _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 3E42 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3E45 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 3E48 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 3E4B _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3E4E _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 3E51 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 3E54 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3E57 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3E5A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3E5D _ 8B. 00
        mov     dword [esp+18H], 0                      ; 3E5F _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 3E67 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 3E6B _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 3E73 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 3E7B _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 3E83 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3E86 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3E8A _ 89. 04 24
        call    boxfill8                                ; 3E8D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3E92 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 3E95 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 3E98 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3E9B _ 8B. 00
        mov     dword [esp+18H], 1                      ; 3E9D _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 3EA5 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 3EA9 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 3EB1 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 3EB9 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 3EC1 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3EC4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3EC8 _ 89. 04 24
        call    boxfill8                                ; 3ECB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3ED0 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3ED3 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3ED6 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3ED9 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 3EDB _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 3EDF _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 3EE7 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 3EEF _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 3EF7 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 3EFF _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3F02 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3F06 _ 89. 04 24
        call    boxfill8                                ; 3F09 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3F0E _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3F11 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3F14 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3F17 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 3F19 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 3F1D _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 3F25 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 3F2D _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 3F35 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 3F3D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3F40 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3F44 _ 89. 04 24
        call    boxfill8                                ; 3F47 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3F4C _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 3F4F _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 3F52 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 3F55 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 3F58 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 3F5B _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 3F5E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3F61 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3F63 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3F67 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 3F6B _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 3F73 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 3F77 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 3F7F _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3F82 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3F86 _ 89. 04 24
        call    boxfill8                                ; 3F89 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3F8E _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 3F91 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3F94 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3F97 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 3F9A _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3F9D _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3FA0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3FA3 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3FA5 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3FA9 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 3FAD _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 3FB5 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 3FB9 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 3FC1 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3FC4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3FC8 _ 89. 04 24
        call    boxfill8                                ; 3FCB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3FD0 _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 3FD3 _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 3FD6 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 3FD9 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 3FDC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3FDF _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 3FE1 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 3FE5 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 3FE9 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 3FF1 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 3FF9 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 4001 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 4004 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4008 _ 89. 04 24
        call    boxfill8                                ; 400B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4010 _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 4013 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 4016 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 4019 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 401B _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 4023 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 4027 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 402F _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 4037 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-0CH]                    ; 403F _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 4042 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4046 _ 89. 04 24
        call    boxfill8                                ; 4049 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 404E _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 4051 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 4054 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 4057 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 405A _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 405D _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 4060 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 4063 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 4065 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 4069 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 406D _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 4071 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 4079 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 4081 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 4084 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4088 _ 89. 04 24
        call    boxfill8                                ; 408B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 4090 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 4093 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 4096 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 4099 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 409C _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 409F _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 40A2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 40A5 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 40A7 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 40AB _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 40AF _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 40B3 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 40BB _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 40C3 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 40C6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 40CA _ 89. 04 24
        call    boxfill8                                ; 40CD _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-1CH]                     ; 40D2 _ 0F BE. 45, E4
        mov     dword [esp+0CH], eax                    ; 40D6 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 40DA _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 40DD _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 40E1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 40E4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 40E8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 40EB _ 89. 04 24
        call    make_wtitle8                            ; 40EE _ E8, FFFFFFFC(rel)
        nop                                             ; 40F3 _ 90
        add     esp, 52                                 ; 40F4 _ 83. C4, 34
        pop     ebx                                     ; 40F7 _ 5B
        pop     ebp                                     ; 40F8 _ 5D
        ret                                             ; 40F9 _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 40FA _ 55
        mov     ebp, esp                                ; 40FB _ 89. E5
        push    ebx                                     ; 40FD _ 53
        sub     esp, 52                                 ; 40FE _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 4101 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 4104 _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 4107 _ 80. 7D, E4, 00
        jz      ?_230                                   ; 410B _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 410D _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 4111 _ C6. 45, ED, 0C
        jmp     ?_231                                   ; 4115 _ EB, 08

?_230:  mov     byte [ebp-12H], 8                       ; 4117 _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 411B _ C6. 45, ED, 0F
?_231:  mov     eax, dword [ebp+0CH]                    ; 411F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4122 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 4125 _ 8D. 58, FC
        movzx   eax, byte [ebp-13H]                     ; 4128 _ 0F B6. 45, ED
        movzx   ecx, al                                 ; 412C _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 412F _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 4132 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 4135 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 4138 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 413A _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], ebx                    ; 4142 _ 89. 5C 24, 14
        mov     dword [esp+10H], 3                      ; 4146 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 414E _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], ecx                     ; 4156 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 415A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 415E _ 89. 04 24
        call    boxfill8                                ; 4161 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-12H]                     ; 4166 _ 0F BE. 45, EE
        mov     edx, dword [ebp+10H]                    ; 416A _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 416D _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 4171 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 4175 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 417D _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 4185 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4188 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 418C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 418F _ 89. 04 24
        call    showString                              ; 4192 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 4197 _ C7. 45, F0, 00000000
        jmp     ?_239                                   ; 419E _ E9, 00000083

?_232:  mov     dword [ebp-0CH], 0                      ; 41A3 _ C7. 45, F4, 00000000
        jmp     ?_238                                   ; 41AA _ EB, 70

?_233:  mov     eax, dword [ebp-10H]                    ; 41AC _ 8B. 45, F0
        shl     eax, 4                                  ; 41AF _ C1. E0, 04
        mov     edx, eax                                ; 41B2 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 41B4 _ 8B. 45, F4
        add     eax, edx                                ; 41B7 _ 01. D0
        add     eax, closebtn.2289                      ; 41B9 _ 05, 00000280(d)
        movzx   eax, byte [eax]                         ; 41BE _ 0F B6. 00
        mov     byte [ebp-11H], al                      ; 41C1 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 41C4 _ 80. 7D, EF, 40
        jnz     ?_234                                   ; 41C8 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 41CA _ C6. 45, EF, 00
        jmp     ?_237                                   ; 41CE _ EB, 1C

?_234:  cmp     byte [ebp-11H], 36                      ; 41D0 _ 80. 7D, EF, 24
        jnz     ?_235                                   ; 41D4 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 41D6 _ C6. 45, EF, 0F
        jmp     ?_237                                   ; 41DA _ EB, 10

?_235:  cmp     byte [ebp-11H], 81                      ; 41DC _ 80. 7D, EF, 51
        jnz     ?_236                                   ; 41E0 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 41E2 _ C6. 45, EF, 08
        jmp     ?_237                                   ; 41E6 _ EB, 04

?_236:  mov     byte [ebp-11H], 7                       ; 41E8 _ C6. 45, EF, 07
?_237:  mov     eax, dword [ebp+0CH]                    ; 41EC _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 41EF _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 41F1 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 41F4 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 41F7 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 41FA _ 8B. 40, 04
        imul    ecx, eax                                ; 41FD _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 4200 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4203 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 4206 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 4209 _ 8B. 45, F4
        add     eax, ebx                                ; 420C _ 01. D8
        add     eax, ecx                                ; 420E _ 01. C8
        add     edx, eax                                ; 4210 _ 01. C2
        movzx   eax, byte [ebp-11H]                     ; 4212 _ 0F B6. 45, EF
        mov     byte [edx], al                          ; 4216 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 4218 _ 83. 45, F4, 01
?_238:  cmp     dword [ebp-0CH], 15                     ; 421C _ 83. 7D, F4, 0F
        jle     ?_233                                   ; 4220 _ 7E, 8A
        add     dword [ebp-10H], 1                      ; 4222 _ 83. 45, F0, 01
?_239:  cmp     dword [ebp-10H], 13                     ; 4226 _ 83. 7D, F0, 0D
        jle     ?_232                                   ; 422A _ 0F 8E, FFFFFF73
        add     esp, 52                                 ; 4230 _ 83. C4, 34
        pop     ebx                                     ; 4233 _ 5B
        pop     ebp                                     ; 4234 _ 5D
        ret                                             ; 4235 _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 4236 _ 55
        mov     ebp, esp                                ; 4237 _ 89. E5
        push    edi                                     ; 4239 _ 57
        push    esi                                     ; 423A _ 56
        push    ebx                                     ; 423B _ 53
        sub     esp, 44                                 ; 423C _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 423F _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 4242 _ 8B. 55, 0C
        add     eax, edx                                ; 4245 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 4247 _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 424A _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 424D _ 8B. 55, 10
        add     eax, edx                                ; 4250 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 4252 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 4255 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 4258 _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 425B _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 425E _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 4261 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 4264 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 4267 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 426A _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 426D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4270 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4273 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4276 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 4278 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 427C _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 4280 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4284 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 4288 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 4290 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4294 _ 89. 04 24
        call    boxfill8                                ; 4297 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 429C _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 429F _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 42A2 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 42A5 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 42A8 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 42AB _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 42AE _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 42B1 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 42B4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 42B7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 42BA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 42BD _ 8B. 00
        mov     dword [esp+18H], edi                    ; 42BF _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 42C3 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 42C7 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 42CB _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 42CF _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 42D7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 42DB _ 89. 04 24
        call    boxfill8                                ; 42DE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 42E3 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 42E6 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 42E9 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 42EC _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 42EF _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 42F2 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 42F5 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 42F8 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 42FB _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 42FE _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4301 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4304 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 4306 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 430A _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 430E _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4312 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 4316 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 431E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4322 _ 89. 04 24
        call    boxfill8                                ; 4325 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 432A _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 432D _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 4330 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 4333 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 4336 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 4339 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 433C _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 433F _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 4342 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4345 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4348 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 434B _ 8B. 00
        mov     dword [esp+18H], edi                    ; 434D _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 4351 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 4355 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4359 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 435D _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 4365 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4369 _ 89. 04 24
        call    boxfill8                                ; 436C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 4371 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 4374 _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 4377 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 437A _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 437D _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 4380 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 4383 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4386 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4389 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 438C _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 438E _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 4392 _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 4395 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 4399 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 439D _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 43A1 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 43A9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 43AD _ 89. 04 24
        call    boxfill8                                ; 43B0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 43B5 _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 43B8 _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 43BB _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 43BE _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 43C1 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 43C4 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 43C7 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 43CA _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 43CD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 43D0 _ 8B. 00
        mov     ecx, dword [ebp-14H]                    ; 43D2 _ 8B. 4D, EC
        mov     dword [esp+18H], ecx                    ; 43D5 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 43D9 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 43DD _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 43E1 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 43E5 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 43ED _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 43F1 _ 89. 04 24
        call    boxfill8                                ; 43F4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 43F9 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 43FC _ 8D. 48, 01
        mov     eax, dword [ebp-14H]                    ; 43FF _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 4402 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 4405 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 4408 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 440B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 440E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4411 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4414 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 4416 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 441A _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 441D _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 4421 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 4425 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 4429 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 4431 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4435 _ 89. 04 24
        call    boxfill8                                ; 4438 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 443D _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 4440 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 4443 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 4446 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 4449 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 444C _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 444F _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 4452 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 4455 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4458 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 445B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 445E _ 8B. 00
        mov     dword [esp+18H], edi                    ; 4460 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 4464 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 4468 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 446C _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 4470 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 4478 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 447C _ 89. 04 24
        call    boxfill8                                ; 447F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 4484 _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 4487 _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 448A _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 448D _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 4490 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 4493 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 4496 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4499 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 449C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 449F _ 8B. 00
        mov     ebx, dword [ebp-14H]                    ; 44A1 _ 8B. 5D, EC
        mov     dword [esp+18H], ebx                    ; 44A4 _ 89. 5C 24, 18
        mov     ebx, dword [ebp-10H]                    ; 44A8 _ 8B. 5D, F0
        mov     dword [esp+14H], ebx                    ; 44AB _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 44AF _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 44B3 _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 44B7 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 44BB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 44BF _ 89. 04 24
        call    boxfill8                                ; 44C2 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 44C7 _ 83. C4, 2C
        pop     ebx                                     ; 44CA _ 5B
        pop     esi                                     ; 44CB _ 5E
        pop     edi                                     ; 44CC _ 5F
        pop     ebp                                     ; 44CD _ 5D
        ret                                             ; 44CE _ C3
; make_textbox8 End of function

file_loadfile:; Function begin
        push    ebp                                     ; 44CF _ 55
        mov     ebp, esp                                ; 44D0 _ 89. E5
        sub     esp, 56                                 ; 44D2 _ 83. EC, 38
        mov     dword [ebp-0CH], 88064                  ; 44D5 _ C7. 45, F4, 00015800
        mov     eax, dword [memman]                     ; 44DC _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 44E1 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 44E9 _ 89. 04 24
        call    memman_alloc                            ; 44EC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 44F1 _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 44F4 _ 8B. 45, E4
        add     eax, 12                                 ; 44F7 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 44FA _ C6. 00, 00
        jmp     ?_250                                   ; 44FD _ E9, 0000011E

?_240:  mov     dword [ebp-10H], 0                      ; 4502 _ C7. 45, F0, 00000000
        jmp     ?_243                                   ; 4509 _ EB, 2C

?_241:  mov     edx, dword [ebp-0CH]                    ; 450B _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 450E _ 8B. 45, F0
        add     eax, edx                                ; 4511 _ 01. D0
        movzx   eax, byte [eax]                         ; 4513 _ 0F B6. 00
        test    al, al                                  ; 4516 _ 84. C0
        jz      ?_242                                   ; 4518 _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 451A _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 451D _ 8B. 45, E4
        add     edx, eax                                ; 4520 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 4522 _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 4525 _ 8B. 45, F0
        add     eax, ecx                                ; 4528 _ 01. C8
        movzx   eax, byte [eax]                         ; 452A _ 0F B6. 00
        mov     byte [edx], al                          ; 452D _ 88. 02
        add     dword [ebp-10H], 1                      ; 452F _ 83. 45, F0, 01
        jmp     ?_243                                   ; 4533 _ EB, 02

?_242:  jmp     ?_244                                   ; 4535 _ EB, 06

?_243:  cmp     dword [ebp-10H], 7                      ; 4537 _ 83. 7D, F0, 07
        jle     ?_241                                   ; 453B _ 7E, CE
?_244:  mov     dword [ebp-14H], 0                      ; 453D _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 4544 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 4547 _ 8B. 45, E4
        add     eax, edx                                ; 454A _ 01. D0
        mov     byte [eax], 46                          ; 454C _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 454F _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 4553 _ C7. 45, EC, 00000000
        jmp     ?_246                                   ; 455A _ EB, 1E

?_245:  mov     edx, dword [ebp-10H]                    ; 455C _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 455F _ 8B. 45, E4
        add     edx, eax                                ; 4562 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 4564 _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 4567 _ 8B. 45, EC
        add     eax, ecx                                ; 456A _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 456C _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 4570 _ 88. 02
        add     dword [ebp-10H], 1                      ; 4572 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 4576 _ 83. 45, EC, 01
?_246:  cmp     dword [ebp-14H], 2                      ; 457A _ 83. 7D, EC, 02
        jle     ?_245                                   ; 457E _ 7E, DC
        mov     eax, dword [ebp-1CH]                    ; 4580 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 4583 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4587 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 458A _ 89. 04 24
        call    strcmp                                  ; 458D _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 4592 _ 83. F8, 01
        jne     ?_249                                   ; 4595 _ 0F 85, 00000081
        mov     eax, dword [ebp-0CH]                    ; 459B _ 8B. 45, F4
        mov     edx, dword [eax+1CH]                    ; 459E _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 45A1 _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 45A6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 45AA _ 89. 04 24
        call    memman_alloc_4k                         ; 45AD _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 45B2 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 45B4 _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 45B7 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 45B9 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 45BC _ 8B. 40, 1C
        mov     edx, eax                                ; 45BF _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 45C1 _ 8B. 45, 0C
        mov     dword [eax+8H], edx                     ; 45C4 _ 89. 50, 08
        mov     dword [ebp-20H], 97280                  ; 45C7 _ C7. 45, E0, 00017C00
        mov     eax, dword [ebp-0CH]                    ; 45CE _ 8B. 45, F4
        movzx   eax, word [eax+1AH]                     ; 45D1 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 45D5 _ 0F B7. C0
        shl     eax, 9                                  ; 45D8 _ C1. E0, 09
        add     dword [ebp-20H], eax                    ; 45DB _ 01. 45, E0
        mov     eax, dword [ebp-0CH]                    ; 45DE _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 45E1 _ 8B. 40, 1C
        mov     dword [ebp-24H], eax                    ; 45E4 _ 89. 45, DC
        mov     dword [ebp-18H], 0                      ; 45E7 _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 45EE _ C7. 45, E8, 00000000
        jmp     ?_248                                   ; 45F5 _ EB, 1B

?_247:  mov     eax, dword [ebp+0CH]                    ; 45F7 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 45FA _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 45FC _ 8B. 45, E8
        add     edx, eax                                ; 45FF _ 01. C2
        mov     ecx, dword [ebp-18H]                    ; 4601 _ 8B. 4D, E8
        mov     eax, dword [ebp-20H]                    ; 4604 _ 8B. 45, E0
        add     eax, ecx                                ; 4607 _ 01. C8
        movzx   eax, byte [eax]                         ; 4609 _ 0F B6. 00
        mov     byte [edx], al                          ; 460C _ 88. 02
        add     dword [ebp-18H], 1                      ; 460E _ 83. 45, E8, 01
?_248:  mov     eax, dword [ebp-18H]                    ; 4612 _ 8B. 45, E8
        cmp     eax, dword [ebp-24H]                    ; 4615 _ 3B. 45, DC
        jl      ?_247                                   ; 4618 _ 7C, DD
        jmp     ?_251                                   ; 461A _ EB, 12

?_249:  add     dword [ebp-0CH], 32                     ; 461C _ 83. 45, F4, 20
?_250:  mov     eax, dword [ebp-0CH]                    ; 4620 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 4623 _ 0F B6. 00
        test    al, al                                  ; 4626 _ 84. C0
        jne     ?_240                                   ; 4628 _ 0F 85, FFFFFED4
?_251:  mov     edx, dword [ebp-1CH]                    ; 462E _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 4631 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 4636 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 463E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4642 _ 89. 04 24
        call    memman_free                             ; 4645 _ E8, FFFFFFFC(rel)
        leave                                           ; 464A _ C9
        ret                                             ; 464B _ C3
; file_loadfile End of function

intHandlerForStackOverFlow:; Function begin
        push    ebp                                     ; 464C _ 55
        mov     ebp, esp                                ; 464D _ 89. E5
        sub     esp, 40                                 ; 464F _ 83. EC, 28
        call    task_now                                ; 4652 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4657 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 465A _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 465D _ C7. 80, 00000098, 00000008
        mov     dword [esp], ?_414                      ; 4667 _ C7. 04 24, 0000009E(d)
        call    cons_putstr                             ; 466E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4673 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4676 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 4680 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 4683 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4689 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 468C _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 468F _ 89. 90, 0000009C
        mov     dword [esp], ?_415                      ; 4695 _ C7. 04 24, 000000A5(d)
        call    cons_putstr                             ; 469C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 46A1 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 46A4 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 46AE _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 46B1 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 46B7 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 46BA _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 46BD _ 89. 90, 0000009C
        mov     eax, dword [ebp+8H]                     ; 46C3 _ 8B. 45, 08
        add     eax, 44                                 ; 46C6 _ 83. C0, 2C
        mov     eax, dword [eax]                        ; 46C9 _ 8B. 00
        mov     dword [esp], eax                        ; 46CB _ 89. 04 24
        call    intToHexStr                             ; 46CE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 46D3 _ 89. 45, F0
        mov     dword [esp], ?_416                      ; 46D6 _ C7. 04 24, 000000B5(d)
        call    cons_putstr                             ; 46DD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 46E2 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 46E5 _ 89. 04 24
        call    cons_putstr                             ; 46E8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 46ED _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 46F0 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 46FA _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 46FD _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4703 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4706 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 4709 _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 470F _ 8B. 45, F4
        add     eax, 48                                 ; 4712 _ 83. C0, 30
        leave                                           ; 4715 _ C9
        ret                                             ; 4716 _ C3
; intHandlerForStackOverFlow End of function

intHandlerForException:; Function begin
        push    ebp                                     ; 4717 _ 55
        mov     ebp, esp                                ; 4718 _ 89. E5
        sub     esp, 40                                 ; 471A _ 83. EC, 28
        call    task_now                                ; 471D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4722 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4725 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4728 _ C7. 80, 00000098, 00000008
        mov     dword [esp], ?_417                      ; 4732 _ C7. 04 24, 000000BC(d)
        call    cons_putstr                             ; 4739 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 473E _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4741 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 474B _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 474E _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4754 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4757 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 475A _ 89. 90, 0000009C
        mov     dword [esp], ?_418                      ; 4760 _ C7. 04 24, 000000C4(d)
        call    cons_putstr                             ; 4767 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 476C _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 476F _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4775 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4778 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 477B _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 4781 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4784 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 478E _ 8B. 45, F4
        add     eax, 48                                 ; 4791 _ 83. C0, 30
        leave                                           ; 4794 _ C9
        ret                                             ; 4795 _ C3
; intHandlerForException End of function

memman_init:; Function begin
        push    ebp                                     ; 4796 _ 55
        mov     ebp, esp                                ; 4797 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4799 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 479C _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 47A2 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 47A5 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 47AC _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 47AF _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 47B6 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 47B9 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 47C0 _ 5D
        ret                                             ; 47C1 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 47C2 _ 55
        mov     ebp, esp                                ; 47C3 _ 89. E5
        sub     esp, 16                                 ; 47C5 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 47C8 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 47CF _ C7. 45, F8, 00000000
        jmp     ?_253                                   ; 47D6 _ EB, 14

?_252:  mov     eax, dword [ebp+8H]                     ; 47D8 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 47DB _ 8B. 55, F8
        add     edx, 2                                  ; 47DE _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 47E1 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 47E5 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 47E8 _ 83. 45, F8, 01
?_253:  mov     eax, dword [ebp+8H]                     ; 47EC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 47EF _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 47F1 _ 3B. 45, F8
        ja      ?_252                                   ; 47F4 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 47F6 _ 8B. 45, FC
        leave                                           ; 47F9 _ C9
        ret                                             ; 47FA _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 47FB _ 55
        mov     ebp, esp                                ; 47FC _ 89. E5
        push    ebx                                     ; 47FE _ 53
        sub     esp, 16                                 ; 47FF _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 4802 _ C7. 45, F4, 00000000
        jmp     ?_259                                   ; 4809 _ E9, 000000BD

?_254:  mov     eax, dword [ebp+8H]                     ; 480E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4811 _ 8B. 55, F4
        add     edx, 2                                  ; 4814 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4817 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 481B _ 3B. 45, 0C
        jc      ?_258                                   ; 481E _ 0F 82, 000000A3
        mov     eax, dword [ebp+8H]                     ; 4824 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4827 _ 8B. 55, F4
        add     edx, 2                                  ; 482A _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 482D _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 4830 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 4833 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4836 _ 8B. 55, F4
        add     edx, 2                                  ; 4839 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 483C _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 483F _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 4842 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4845 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4848 _ 8B. 55, F4
        add     edx, 2                                  ; 484B _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 484E _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 4851 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4854 _ 8B. 55, F4
        add     edx, 2                                  ; 4857 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 485A _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 485E _ 2B. 45, 0C
        mov     edx, eax                                ; 4861 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4863 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 4866 _ 8B. 4D, F4
        add     ecx, 2                                  ; 4869 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 486C _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 4870 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4873 _ 8B. 55, F4
        add     edx, 2                                  ; 4876 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4879 _ 8B. 44 D0, 04
        test    eax, eax                                ; 487D _ 85. C0
        jnz     ?_257                                   ; 487F _ 75, 41
        mov     eax, dword [ebp+8H]                     ; 4881 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4884 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4886 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4889 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 488C _ 89. 10
        jmp     ?_256                                   ; 488E _ EB, 28

?_255:  mov     eax, dword [ebp-0CH]                    ; 4890 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 4893 _ 8D. 50, 01
        mov     ecx, dword [ebp+8H]                     ; 4896 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 4899 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 489C _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 489F _ 8B. 45, 08
        add     edx, 2                                  ; 48A2 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 48A5 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 48A8 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 48AA _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 48AD _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 48B0 _ 89. 54 D9, 04
        add     dword [ebp-0CH], 1                      ; 48B4 _ 83. 45, F4, 01
?_256:  mov     eax, dword [ebp+8H]                     ; 48B8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 48BB _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 48BD _ 3B. 45, F4
        ja      ?_255                                   ; 48C0 _ 77, CE
?_257:  mov     eax, dword [ebp-8H]                     ; 48C2 _ 8B. 45, F8
        jmp     ?_260                                   ; 48C5 _ EB, 17

?_258:  add     dword [ebp-0CH], 1                      ; 48C7 _ 83. 45, F4, 01
?_259:  mov     eax, dword [ebp+8H]                     ; 48CB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 48CE _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 48D0 _ 3B. 45, F4
        ja      ?_254                                   ; 48D3 _ 0F 87, FFFFFF35
        mov     eax, 0                                  ; 48D9 _ B8, 00000000
?_260:  add     esp, 16                                 ; 48DE _ 83. C4, 10
        pop     ebx                                     ; 48E1 _ 5B
        pop     ebp                                     ; 48E2 _ 5D
        ret                                             ; 48E3 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 48E4 _ 55
        mov     ebp, esp                                ; 48E5 _ 89. E5
        push    ebx                                     ; 48E7 _ 53
        sub     esp, 16                                 ; 48E8 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 48EB _ C7. 45, F4, 00000000
        jmp     ?_263                                   ; 48F2 _ EB, 17

?_261:  mov     eax, dword [ebp+8H]                     ; 48F4 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 48F7 _ 8B. 55, F4
        add     edx, 2                                  ; 48FA _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 48FD _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 4900 _ 3B. 45, 0C
        jbe     ?_262                                   ; 4903 _ 76, 02
        jmp     ?_264                                   ; 4905 _ EB, 0E

?_262:  add     dword [ebp-0CH], 1                      ; 4907 _ 83. 45, F4, 01
?_263:  mov     eax, dword [ebp+8H]                     ; 490B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 490E _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4910 _ 3B. 45, F4
        jg      ?_261                                   ; 4913 _ 7F, DF
?_264:  cmp     dword [ebp-0CH], 0                      ; 4915 _ 83. 7D, F4, 00
        jle     ?_268                                   ; 4919 _ 0F 8E, 000000F2
        mov     eax, dword [ebp-0CH]                    ; 491F _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 4922 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4925 _ 8B. 45, 08
        add     edx, 2                                  ; 4928 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 492B _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 492E _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 4931 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 4934 _ 8B. 45, 08
        add     ecx, 2                                  ; 4937 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 493A _ 8B. 44 C8, 04
        add     eax, edx                                ; 493E _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 4940 _ 3B. 45, 0C
        jne     ?_268                                   ; 4943 _ 0F 85, 000000C8
        mov     eax, dword [ebp-0CH]                    ; 4949 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 494C _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 494F _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 4952 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4955 _ 8B. 45, 08
        add     edx, 2                                  ; 4958 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 495B _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 495F _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 4962 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4965 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 4968 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 496B _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 496F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4972 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4974 _ 3B. 45, F4
        jle     ?_267                                   ; 4977 _ 0F 8E, 0000008A
        mov     eax, dword [ebp+10H]                    ; 497D _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 4980 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 4983 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4986 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4989 _ 8B. 55, F4
        add     edx, 2                                  ; 498C _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 498F _ 8B. 04 D0
        cmp     ecx, eax                                ; 4992 _ 39. C1
        jnz     ?_267                                   ; 4994 _ 75, 71
        mov     eax, dword [ebp-0CH]                    ; 4996 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 4999 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 499C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 499F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 49A2 _ 8B. 45, 08
        add     edx, 2                                  ; 49A5 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 49A8 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 49AC _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 49AF _ 8B. 4D, F4
        add     ecx, 2                                  ; 49B2 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 49B5 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 49B9 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 49BC _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 49BF _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 49C2 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 49C6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 49C9 _ 8B. 00
        lea     edx, [eax-1H]                           ; 49CB _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 49CE _ 8B. 45, 08
        mov     dword [eax], edx                        ; 49D1 _ 89. 10
        jmp     ?_266                                   ; 49D3 _ EB, 28

?_265:  mov     eax, dword [ebp-0CH]                    ; 49D5 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 49D8 _ 8D. 50, 01
        mov     ecx, dword [ebp+8H]                     ; 49DB _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 49DE _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 49E1 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 49E4 _ 8B. 45, 08
        add     edx, 2                                  ; 49E7 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 49EA _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 49ED _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 49EF _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 49F2 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 49F5 _ 89. 54 D9, 04
        add     dword [ebp-0CH], 1                      ; 49F9 _ 83. 45, F4, 01
?_266:  mov     eax, dword [ebp+8H]                     ; 49FD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4A00 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4A02 _ 3B. 45, F4
        jg      ?_265                                   ; 4A05 _ 7F, CE
?_267:  mov     eax, 0                                  ; 4A07 _ B8, 00000000
        jmp     ?_274                                   ; 4A0C _ E9, 0000011C

?_268:  mov     eax, dword [ebp+8H]                     ; 4A11 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4A14 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4A16 _ 3B. 45, F4
        jle     ?_269                                   ; 4A19 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 4A1B _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 4A1E _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 4A21 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4A24 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4A27 _ 8B. 55, F4
        add     edx, 2                                  ; 4A2A _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 4A2D _ 8B. 04 D0
        cmp     ecx, eax                                ; 4A30 _ 39. C1
        jnz     ?_269                                   ; 4A32 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 4A34 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4A37 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 4A3A _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 4A3D _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 4A40 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 4A43 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4A46 _ 8B. 55, F4
        add     edx, 2                                  ; 4A49 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 4A4C _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 4A50 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 4A53 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4A56 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4A59 _ 8B. 55, F4
        add     edx, 2                                  ; 4A5C _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 4A5F _ 89. 4C D0, 04
        mov     eax, 0                                  ; 4A63 _ B8, 00000000
        jmp     ?_274                                   ; 4A68 _ E9, 000000C0

?_269:  mov     eax, dword [ebp+8H]                     ; 4A6D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4A70 _ 8B. 00
        cmp     eax, 4095                               ; 4A72 _ 3D, 00000FFF
        jg      ?_273                                   ; 4A77 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 4A7D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4A80 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 4A82 _ 89. 45, F8
        jmp     ?_271                                   ; 4A85 _ EB, 28

?_270:  mov     eax, dword [ebp-8H]                     ; 4A87 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 4A8A _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 4A8D _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 4A90 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 4A93 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 4A96 _ 8B. 45, 08
        add     edx, 2                                  ; 4A99 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 4A9C _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 4A9F _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 4AA1 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 4AA4 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 4AA7 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 4AAB _ 83. 6D, F8, 01
?_271:  mov     eax, dword [ebp-8H]                     ; 4AAF _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 4AB2 _ 3B. 45, F4
        jg      ?_270                                   ; 4AB5 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 4AB7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4ABA _ 8B. 00
        lea     edx, [eax+1H]                           ; 4ABC _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4ABF _ 8B. 45, 08
        mov     dword [eax], edx                        ; 4AC2 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4AC4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4AC7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4ACA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4ACD _ 8B. 00
        cmp     edx, eax                                ; 4ACF _ 39. C2
        jge     ?_272                                   ; 4AD1 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 4AD3 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 4AD6 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 4AD8 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 4ADB _ 89. 50, 04
?_272:  mov     eax, dword [ebp+8H]                     ; 4ADE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4AE1 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 4AE4 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 4AE7 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 4AEA _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 4AED _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4AF0 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 4AF3 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 4AF6 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 4AF9 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 4AFD _ B8, 00000000
        jmp     ?_274                                   ; 4B02 _ EB, 29

?_273:  mov     eax, dword [ebp+8H]                     ; 4B04 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4B07 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 4B0A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4B0D _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 4B10 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4B13 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4B16 _ 8B. 40, 08
        mov     edx, eax                                ; 4B19 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 4B1B _ 8B. 45, 10
        add     eax, edx                                ; 4B1E _ 01. D0
        mov     edx, eax                                ; 4B20 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4B22 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 4B25 _ 89. 50, 08
        mov     eax, 4294967295                         ; 4B28 _ B8, FFFFFFFF
?_274:  add     esp, 16                                 ; 4B2D _ 83. C4, 10
        pop     ebx                                     ; 4B30 _ 5B
        pop     ebp                                     ; 4B31 _ 5D
        ret                                             ; 4B32 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 4B33 _ 55
        mov     ebp, esp                                ; 4B34 _ 89. E5
        sub     esp, 24                                 ; 4B36 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 4B39 _ 8B. 45, 0C
        add     eax, 4095                               ; 4B3C _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 4B41 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 4B46 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 4B49 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4B4C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4B50 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4B53 _ 89. 04 24
        call    memman_alloc                            ; 4B56 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 4B5B _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4B5E _ 8B. 45, FC
        leave                                           ; 4B61 _ C9
        ret                                             ; 4B62 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 4B63 _ 55
        mov     ebp, esp                                ; 4B64 _ 89. E5
        sub     esp, 28                                 ; 4B66 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 4B69 _ 8B. 45, 10
        add     eax, 4095                               ; 4B6C _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 4B71 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 4B76 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 4B79 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 4B7C _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 4B80 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4B83 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4B87 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4B8A _ 89. 04 24
        call    memman_free                             ; 4B8D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 4B92 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4B95 _ 8B. 45, FC
        leave                                           ; 4B98 _ C9
        ret                                             ; 4B99 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 4B9A _ 55
        mov     ebp, esp                                ; 4B9B _ 89. E5
        sub     esp, 40                                 ; 4B9D _ 83. EC, 28
        mov     dword [esp+4H], 9232                    ; 4BA0 _ C7. 44 24, 04, 00002410
        mov     eax, dword [ebp+8H]                     ; 4BA8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4BAB _ 89. 04 24
        call    memman_alloc_4k                         ; 4BAE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4BB3 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 4BB6 _ 83. 7D, F4, 00
        jnz     ?_275                                   ; 4BBA _ 75, 0A
        mov     eax, 0                                  ; 4BBC _ B8, 00000000
        jmp     ?_279                                   ; 4BC1 _ E9, 000000C0

?_275:  mov     eax, dword [ebp+10H]                    ; 4BC6 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 4BC9 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 4BCD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4BD1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4BD4 _ 89. 04 24
        call    memman_alloc_4k                         ; 4BD7 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 4BDC _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 4BDE _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 4BE1 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 4BE4 _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 4BE7 _ 8B. 40, 04
        test    eax, eax                                ; 4BEA _ 85. C0
        jnz     ?_276                                   ; 4BEC _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 4BEE _ 8B. 45, F4
        mov     dword [esp+8H], 9232                    ; 4BF1 _ C7. 44 24, 08, 00002410
        mov     dword [esp+4H], eax                     ; 4BF9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4BFD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4C00 _ 89. 04 24
        call    memman_free_4k                          ; 4C03 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 4C08 _ B8, 00000000
        jmp     ?_279                                   ; 4C0D _ EB, 77

?_276:  mov     eax, dword [ebp-0CH]                    ; 4C0F _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 4C12 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4C15 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 4C17 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 4C1A _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 4C1D _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4C20 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 4C23 _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 4C26 _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 4C29 _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 4C2C _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 4C33 _ C7. 45, F0, 00000000
        jmp     ?_278                                   ; 4C3A _ EB, 3E

?_277:  mov     ecx, dword [ebp-0CH]                    ; 4C3C _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 4C3F _ 8B. 55, F0
        mov     eax, edx                                ; 4C42 _ 89. D0
        shl     eax, 3                                  ; 4C44 _ C1. E0, 03
        add     eax, edx                                ; 4C47 _ 01. D0
        shl     eax, 2                                  ; 4C49 _ C1. E0, 02
        add     eax, ecx                                ; 4C4C _ 01. C8
        add     eax, 1072                               ; 4C4E _ 05, 00000430
        mov     dword [eax], 0                          ; 4C53 _ C7. 00, 00000000
        mov     ecx, dword [ebp-0CH]                    ; 4C59 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 4C5C _ 8B. 55, F0
        mov     eax, edx                                ; 4C5F _ 89. D0
        shl     eax, 3                                  ; 4C61 _ C1. E0, 03
        add     eax, edx                                ; 4C64 _ 01. D0
        shl     eax, 2                                  ; 4C66 _ C1. E0, 02
        add     eax, ecx                                ; 4C69 _ 01. C8
        add     eax, 1076                               ; 4C6B _ 05, 00000434
        mov     dword [eax], 0                          ; 4C70 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 4C76 _ 83. 45, F0, 01
?_278:  cmp     dword [ebp-10H], 255                    ; 4C7A _ 81. 7D, F0, 000000FF
        jle     ?_277                                   ; 4C81 _ 7E, B9
        mov     eax, dword [ebp-0CH]                    ; 4C83 _ 8B. 45, F4
?_279:  leave                                           ; 4C86 _ C9
        ret                                             ; 4C87 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 4C88 _ 55
        mov     ebp, esp                                ; 4C89 _ 89. E5
        sub     esp, 24                                 ; 4C8B _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 4C8E _ C7. 45, F0, 00000000
        jmp     ?_282                                   ; 4C95 _ EB, 63

?_280:  mov     ecx, dword [ebp+8H]                     ; 4C97 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 4C9A _ 8B. 55, F0
        mov     eax, edx                                ; 4C9D _ 89. D0
        shl     eax, 3                                  ; 4C9F _ C1. E0, 03
        add     eax, edx                                ; 4CA2 _ 01. D0
        shl     eax, 2                                  ; 4CA4 _ C1. E0, 02
        add     eax, ecx                                ; 4CA7 _ 01. C8
        add     eax, 1072                               ; 4CA9 _ 05, 00000430
        mov     eax, dword [eax]                        ; 4CAE _ 8B. 00
        test    eax, eax                                ; 4CB0 _ 85. C0
        jnz     ?_281                                   ; 4CB2 _ 75, 42
        mov     edx, dword [ebp-10H]                    ; 4CB4 _ 8B. 55, F0
        mov     eax, edx                                ; 4CB7 _ 89. D0
        shl     eax, 3                                  ; 4CB9 _ C1. E0, 03
        add     eax, edx                                ; 4CBC _ 01. D0
        shl     eax, 2                                  ; 4CBE _ C1. E0, 02
        lea     edx, [eax+410H]                         ; 4CC1 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 4CC7 _ 8B. 45, 08
        add     eax, edx                                ; 4CCA _ 01. D0
        add     eax, 4                                  ; 4CCC _ 83. C0, 04
        mov     dword [ebp-0CH], eax                    ; 4CCF _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4CD2 _ 8B. 45, F4
        mov     dword [eax+1CH], 1                      ; 4CD5 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-0CH]                    ; 4CDC _ 8B. 45, F4
        mov     dword [eax+18H], -1                     ; 4CDF _ C7. 40, 18, FFFFFFFF
        call    task_now                                ; 4CE6 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-0CH]                    ; 4CEB _ 8B. 55, F4
        mov     dword [edx+20H], eax                    ; 4CEE _ 89. 42, 20
        mov     eax, dword [ebp-0CH]                    ; 4CF1 _ 8B. 45, F4
        jmp     ?_283                                   ; 4CF4 _ EB, 12

?_281:  add     dword [ebp-10H], 1                      ; 4CF6 _ 83. 45, F0, 01
?_282:  cmp     dword [ebp-10H], 255                    ; 4CFA _ 81. 7D, F0, 000000FF
        jle     ?_280                                   ; 4D01 _ 7E, 94
        mov     eax, 0                                  ; 4D03 _ B8, 00000000
?_283:  leave                                           ; 4D08 _ C9
        ret                                             ; 4D09 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 4D0A _ 55
        mov     ebp, esp                                ; 4D0B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4D0D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4D10 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4D13 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4D15 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4D18 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 4D1B _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4D1E _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 4D21 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 4D24 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4D27 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 4D2A _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 4D2D _ 89. 50, 14
        nop                                             ; 4D30 _ 90
        pop     ebp                                     ; 4D31 _ 5D
        ret                                             ; 4D32 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 4D33 _ 55
        mov     ebp, esp                                ; 4D34 _ 89. E5
        push    edi                                     ; 4D36 _ 57
        push    esi                                     ; 4D37 _ 56
        push    ebx                                     ; 4D38 _ 53
        sub     esp, 60                                 ; 4D39 _ 83. EC, 3C
        mov     eax, dword [ebp+0CH]                    ; 4D3C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4D3F _ 8B. 40, 18
        mov     dword [ebp-1CH], eax                    ; 4D42 _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 4D45 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4D48 _ 8B. 40, 10
        add     eax, 1                                  ; 4D4B _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 4D4E _ 3B. 45, 10
        jge     ?_284                                   ; 4D51 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 4D53 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4D56 _ 8B. 40, 10
        add     eax, 1                                  ; 4D59 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 4D5C _ 89. 45, 10
?_284:  cmp     dword [ebp+10H], -1                     ; 4D5F _ 83. 7D, 10, FF
        jge     ?_285                                   ; 4D63 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 4D65 _ C7. 45, 10, FFFFFFFF
?_285:  mov     eax, dword [ebp+0CH]                    ; 4D6C _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 4D6F _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 4D72 _ 89. 50, 18
        mov     eax, dword [ebp-1CH]                    ; 4D75 _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 4D78 _ 3B. 45, 10
        jle     ?_292                                   ; 4D7B _ 0F 8E, 00000212
        cmp     dword [ebp+10H], 0                      ; 4D81 _ 83. 7D, 10, 00
        js      ?_288                                   ; 4D85 _ 0F 88, 000000FE
        mov     eax, dword [ebp-1CH]                    ; 4D8B _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 4D8E _ 89. 45, E0
        jmp     ?_287                                   ; 4D91 _ EB, 34

?_286:  mov     eax, dword [ebp-20H]                    ; 4D93 _ 8B. 45, E0
        lea     edx, [eax-1H]                           ; 4D96 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4D99 _ 8B. 45, 08
        add     edx, 4                                  ; 4D9C _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4D9F _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4DA3 _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 4DA6 _ 8B. 4D, E0
        add     ecx, 4                                  ; 4DA9 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 4DAC _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4DB0 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 4DB3 _ 8B. 55, E0
        add     edx, 4                                  ; 4DB6 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4DB9 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 4DBD _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 4DC0 _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 4DC3 _ 83. 6D, E0, 01
?_287:  mov     eax, dword [ebp-20H]                    ; 4DC7 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 4DCA _ 3B. 45, 10
        jg      ?_286                                   ; 4DCD _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 4DCF _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4DD2 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 4DD5 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 4DD8 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4DDB _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 4DDF _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 4DE2 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 4DE5 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4DE8 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4DEB _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4DEE _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4DF1 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4DF4 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4DF7 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4DFA _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4DFD _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4E00 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4E03 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4E06 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4E09 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4E0C _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 4E0F _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 4E13 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4E17 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 4E1B _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4E1F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4E23 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4E26 _ 89. 04 24
        call    sheet_refreshmap                        ; 4E29 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 4E2E _ 8B. 45, 10
        lea     edi, [eax+1H]                           ; 4E31 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 4E34 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4E37 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4E3A _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4E3D _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 4E40 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4E43 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4E46 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4E49 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4E4C _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 4E4F _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4E52 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4E55 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4E58 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4E5B _ 8B. 40, 0C
        mov     ecx, dword [ebp-1CH]                    ; 4E5E _ 8B. 4D, E4
        mov     dword [esp+18H], ecx                    ; 4E61 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 4E65 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 4E69 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 4E6D _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 4E71 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4E75 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4E79 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4E7C _ 89. 04 24
        call    sheet_refreshsub                        ; 4E7F _ E8, FFFFFFFC(rel)
        jmp     ?_299                                   ; 4E84 _ E9, 0000027D

?_288:  mov     eax, dword [ebp+8H]                     ; 4E89 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4E8C _ 8B. 40, 10
        cmp     eax, dword [ebp-1CH]                    ; 4E8F _ 3B. 45, E4
        jle     ?_291                                   ; 4E92 _ 7E, 47
        mov     eax, dword [ebp-1CH]                    ; 4E94 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 4E97 _ 89. 45, E0
        jmp     ?_290                                   ; 4E9A _ EB, 34

?_289:  mov     eax, dword [ebp-20H]                    ; 4E9C _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 4E9F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4EA2 _ 8B. 45, 08
        add     edx, 4                                  ; 4EA5 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4EA8 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4EAC _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 4EAF _ 8B. 4D, E0
        add     ecx, 4                                  ; 4EB2 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 4EB5 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4EB9 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 4EBC _ 8B. 55, E0
        add     edx, 4                                  ; 4EBF _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4EC2 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 4EC6 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 4EC9 _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 4ECC _ 83. 45, E0, 01
?_290:  mov     eax, dword [ebp+8H]                     ; 4ED0 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4ED3 _ 8B. 40, 10
        cmp     eax, dword [ebp-20H]                    ; 4ED6 _ 3B. 45, E0
        jg      ?_289                                   ; 4ED9 _ 7F, C1
?_291:  mov     eax, dword [ebp+8H]                     ; 4EDB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4EDE _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 4EE1 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4EE4 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4EE7 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4EEA _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4EED _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4EF0 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4EF3 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4EF6 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4EF9 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4EFC _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4EFF _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4F02 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4F05 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4F08 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4F0B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4F0E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4F11 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 4F14 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 4F1C _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4F20 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 4F24 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4F28 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4F2C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4F2F _ 89. 04 24
        call    sheet_refreshmap                        ; 4F32 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 4F37 _ 8B. 45, E4
        lea     esi, [eax-1H]                           ; 4F3A _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 4F3D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4F40 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4F43 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4F46 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4F49 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4F4C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4F4F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4F52 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4F55 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4F58 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4F5B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4F5E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4F61 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4F64 _ 8B. 40, 0C
        mov     dword [esp+18H], esi                    ; 4F67 _ 89. 74 24, 18
        mov     dword [esp+14H], 0                      ; 4F6B _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 4F73 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4F77 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 4F7B _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4F7F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4F83 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4F86 _ 89. 04 24
        call    sheet_refreshsub                        ; 4F89 _ E8, FFFFFFFC(rel)
        jmp     ?_299                                   ; 4F8E _ E9, 00000173

?_292:  mov     eax, dword [ebp-1CH]                    ; 4F93 _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 4F96 _ 3B. 45, 10
        jge     ?_299                                   ; 4F99 _ 0F 8D, 00000167
        cmp     dword [ebp-1CH], 0                      ; 4F9F _ 83. 7D, E4, 00
        js      ?_295                                   ; 4FA3 _ 78, 56
        mov     eax, dword [ebp-1CH]                    ; 4FA5 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 4FA8 _ 89. 45, E0
        jmp     ?_294                                   ; 4FAB _ EB, 34

?_293:  mov     eax, dword [ebp-20H]                    ; 4FAD _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 4FB0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4FB3 _ 8B. 45, 08
        add     edx, 4                                  ; 4FB6 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4FB9 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4FBD _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 4FC0 _ 8B. 4D, E0
        add     ecx, 4                                  ; 4FC3 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 4FC6 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4FCA _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 4FCD _ 8B. 55, E0
        add     edx, 4                                  ; 4FD0 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4FD3 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 4FD7 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 4FDA _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 4FDD _ 83. 45, E0, 01
?_294:  mov     eax, dword [ebp-20H]                    ; 4FE1 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 4FE4 _ 3B. 45, 10
        jl      ?_293                                   ; 4FE7 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 4FE9 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4FEC _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 4FEF _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 4FF2 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4FF5 _ 89. 54 88, 04
        jmp     ?_298                                   ; 4FF9 _ EB, 6C

?_295:  mov     eax, dword [ebp+8H]                     ; 4FFB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4FFE _ 8B. 40, 10
        mov     dword [ebp-20H], eax                    ; 5001 _ 89. 45, E0
        jmp     ?_297                                   ; 5004 _ EB, 3A

?_296:  mov     eax, dword [ebp-20H]                    ; 5006 _ 8B. 45, E0
        lea     ecx, [eax+1H]                           ; 5009 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 500C _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 500F _ 8B. 55, E0
        add     edx, 4                                  ; 5012 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 5015 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 5019 _ 8B. 45, 08
        add     ecx, 4                                  ; 501C _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 501F _ 89. 54 88, 04
        mov     eax, dword [ebp-20H]                    ; 5023 _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 5026 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 5029 _ 8B. 45, 08
        add     edx, 4                                  ; 502C _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 502F _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 5033 _ 8B. 55, E0
        add     edx, 1                                  ; 5036 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 5039 _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 503C _ 83. 6D, E0, 01
?_297:  mov     eax, dword [ebp-20H]                    ; 5040 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 5043 _ 3B. 45, 10
        jge     ?_296                                   ; 5046 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 5048 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 504B _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 504E _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 5051 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 5054 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 5058 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 505B _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 505E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 5061 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 5064 _ 89. 50, 10
?_298:  mov     eax, dword [ebp+0CH]                    ; 5067 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 506A _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 506D _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 5070 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 5073 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 5076 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 5079 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 507C _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 507F _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 5082 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 5085 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 5088 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 508B _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 508E _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 5091 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 5094 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 5098 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 509C _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 50A0 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 50A4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 50A8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 50AB _ 89. 04 24
        call    sheet_refreshmap                        ; 50AE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 50B3 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 50B6 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 50B9 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 50BC _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 50BF _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 50C2 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 50C5 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 50C8 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 50CB _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 50CE _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 50D1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 50D4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 50D7 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 50DA _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 50DD _ 8B. 4D, 10
        mov     dword [esp+18H], ecx                    ; 50E0 _ 89. 4C 24, 18
        mov     ecx, dword [ebp+10H]                    ; 50E4 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 50E7 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 50EB _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 50EF _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 50F3 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 50F7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 50FB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 50FE _ 89. 04 24
        call    sheet_refreshsub                        ; 5101 _ E8, FFFFFFFC(rel)
?_299:  add     esp, 60                                 ; 5106 _ 83. C4, 3C
        pop     ebx                                     ; 5109 _ 5B
        pop     esi                                     ; 510A _ 5E
        pop     edi                                     ; 510B _ 5F
        pop     ebp                                     ; 510C _ 5D
        ret                                             ; 510D _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 510E _ 55
        mov     ebp, esp                                ; 510F _ 89. E5
        push    edi                                     ; 5111 _ 57
        push    esi                                     ; 5112 _ 56
        push    ebx                                     ; 5113 _ 53
        sub     esp, 44                                 ; 5114 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 5117 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 511A _ 8B. 40, 18
        test    eax, eax                                ; 511D _ 85. C0
        js      ?_300                                   ; 511F _ 78, 61
        mov     eax, dword [ebp+0CH]                    ; 5121 _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 5124 _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 5127 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 512A _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 512D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 5130 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 5133 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 5136 _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 5139 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 513C _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 513F _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 5142 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 5145 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 5148 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 514B _ 8B. 45, 14
        add     edx, eax                                ; 514E _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 5150 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 5153 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 5156 _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 5159 _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 515C _ 03. 45, E4
        mov     dword [esp+18H], ebx                    ; 515F _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 5163 _ 89. 4C 24, 14
        mov     dword [esp+10H], edi                    ; 5167 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 516B _ 89. 74 24, 0C
        mov     dword [esp+8H], edx                     ; 516F _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 5173 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 5177 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 517A _ 89. 04 24
        call    sheet_refreshsub                        ; 517D _ E8, FFFFFFFC(rel)
?_300:  mov     eax, 0                                  ; 5182 _ B8, 00000000
        add     esp, 44                                 ; 5187 _ 83. C4, 2C
        pop     ebx                                     ; 518A _ 5B
        pop     esi                                     ; 518B _ 5E
        pop     edi                                     ; 518C _ 5F
        pop     ebp                                     ; 518D _ 5D
        ret                                             ; 518E _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 518F _ 55
        mov     ebp, esp                                ; 5190 _ 89. E5
        push    esi                                     ; 5192 _ 56
        push    ebx                                     ; 5193 _ 53
        sub     esp, 48                                 ; 5194 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 5197 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 519A _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 519D _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 51A0 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 51A3 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 51A6 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 51A9 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 51AC _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 51AF _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 51B2 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 51B5 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 51B8 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 51BB _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 51BE _ 8B. 40, 18
        test    eax, eax                                ; 51C1 _ 85. C0
        js      ?_301                                   ; 51C3 _ 0F 88, 00000117
        mov     eax, dword [ebp+0CH]                    ; 51C9 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 51CC _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 51CF _ 8B. 45, F4
        add     edx, eax                                ; 51D2 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 51D4 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 51D7 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 51DA _ 8B. 45, F0
        add     eax, ecx                                ; 51DD _ 01. C8
        mov     dword [esp+14H], 0                      ; 51DF _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 51E7 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 51EB _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 51EF _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 51F2 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 51F6 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 51F9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 51FD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5200 _ 89. 04 24
        call    sheet_refreshmap                        ; 5203 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 5208 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 520B _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 520E _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 5211 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 5214 _ 8B. 55, 14
        add     ecx, edx                                ; 5217 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 5219 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 521C _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 521F _ 8B. 55, 10
        add     edx, ebx                                ; 5222 _ 01. DA
        mov     dword [esp+14H], eax                    ; 5224 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 5228 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 522C _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 5230 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 5233 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 5237 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 523A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 523E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5241 _ 89. 04 24
        call    sheet_refreshmap                        ; 5244 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 5249 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 524C _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 524F _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 5252 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 5255 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 5258 _ 8B. 45, F4
        add     edx, eax                                ; 525B _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 525D _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 5260 _ 8B. 58, 04
        mov     eax, dword [ebp-10H]                    ; 5263 _ 8B. 45, F0
        add     eax, ebx                                ; 5266 _ 01. D8
        mov     dword [esp+18H], ecx                    ; 5268 _ 89. 4C 24, 18
        mov     dword [esp+14H], 0                      ; 526C _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 5274 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 5278 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 527C _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 527F _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 5283 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 5286 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 528A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 528D _ 89. 04 24
        call    sheet_refreshsub                        ; 5290 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 5295 _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 5298 _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 529B _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 529E _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 52A1 _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 52A4 _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 52A7 _ 8B. 4D, 14
        add     ebx, ecx                                ; 52AA _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 52AC _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 52AF _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 52B2 _ 8B. 4D, 10
        add     ecx, esi                                ; 52B5 _ 01. F1
        mov     dword [esp+18H], edx                    ; 52B7 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 52BB _ 89. 44 24, 14
        mov     dword [esp+10H], ebx                    ; 52BF _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 52C3 _ 89. 4C 24, 0C
        mov     eax, dword [ebp+14H]                    ; 52C7 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 52CA _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 52CE _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 52D1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 52D5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 52D8 _ 89. 04 24
        call    sheet_refreshsub                        ; 52DB _ E8, FFFFFFFC(rel)
?_301:  add     esp, 48                                 ; 52E0 _ 83. C4, 30
        pop     ebx                                     ; 52E3 _ 5B
        pop     esi                                     ; 52E4 _ 5E
        pop     ebp                                     ; 52E5 _ 5D
        ret                                             ; 52E6 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 52E7 _ 55
        mov     ebp, esp                                ; 52E8 _ 89. E5
        sub     esp, 64                                 ; 52EA _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 52ED _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 52F0 _ 8B. 00
        mov     dword [ebp-20H], eax                    ; 52F2 _ 89. 45, E0
        mov     eax, dword [ebp+8H]                     ; 52F5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 52F8 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 52FB _ 89. 45, E4
        cmp     dword [ebp+0CH], 0                      ; 52FE _ 83. 7D, 0C, 00
        jns     ?_302                                   ; 5302 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 5304 _ C7. 45, 0C, 00000000
?_302:  cmp     dword [ebp+10H], 8                      ; 530B _ 83. 7D, 10, 08
        jg      ?_303                                   ; 530F _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 5311 _ C7. 45, 10, 00000000
?_303:  mov     eax, dword [ebp+8H]                     ; 5318 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 531B _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 531E _ 3B. 45, 14
        jge     ?_304                                   ; 5321 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 5323 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5326 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 5329 _ 89. 45, 14
?_304:  mov     eax, dword [ebp+8H]                     ; 532C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 532F _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 5332 _ 3B. 45, 18
        jge     ?_305                                   ; 5335 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 5337 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 533A _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 533D _ 89. 45, 18
?_305:  mov     eax, dword [ebp+1CH]                    ; 5340 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 5343 _ 89. 45, CC
        jmp     ?_316                                   ; 5346 _ E9, 0000015B

?_306:  mov     eax, dword [ebp+8H]                     ; 534B _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 534E _ 8B. 55, CC
        add     edx, 4                                  ; 5351 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 5354 _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 5358 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 535B _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 535E _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 5360 _ 89. 45, EC
        mov     edx, dword [ebp-18H]                    ; 5363 _ 8B. 55, E8
        mov     eax, dword [ebp+8H]                     ; 5366 _ 8B. 45, 08
        add     eax, 1044                               ; 5369 _ 05, 00000414
        sub     edx, eax                                ; 536E _ 29. C2
        mov     eax, edx                                ; 5370 _ 89. D0
        sar     eax, 2                                  ; 5372 _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 5375 _ 69. C0, 38E38E39
        mov     byte [ebp-35H], al                      ; 537B _ 88. 45, CB
        mov     eax, dword [ebp-18H]                    ; 537E _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 5381 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 5384 _ 8B. 55, 0C
        sub     edx, eax                                ; 5387 _ 29. C2
        mov     eax, edx                                ; 5389 _ 89. D0
        mov     dword [ebp-10H], eax                    ; 538B _ 89. 45, F0
        mov     eax, dword [ebp-18H]                    ; 538E _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 5391 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 5394 _ 8B. 55, 10
        sub     edx, eax                                ; 5397 _ 29. C2
        mov     eax, edx                                ; 5399 _ 89. D0
        mov     dword [ebp-0CH], eax                    ; 539B _ 89. 45, F4
        mov     eax, dword [ebp-18H]                    ; 539E _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 53A1 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 53A4 _ 8B. 55, 14
        sub     edx, eax                                ; 53A7 _ 29. C2
        mov     eax, edx                                ; 53A9 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 53AB _ 89. 45, D8
        mov     eax, dword [ebp-18H]                    ; 53AE _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 53B1 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 53B4 _ 8B. 55, 18
        sub     edx, eax                                ; 53B7 _ 29. C2
        mov     eax, edx                                ; 53B9 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 53BB _ 89. 45, DC
        cmp     dword [ebp-10H], 0                      ; 53BE _ 83. 7D, F0, 00
        jns     ?_307                                   ; 53C2 _ 79, 07
        mov     dword [ebp-10H], 0                      ; 53C4 _ C7. 45, F0, 00000000
?_307:  cmp     dword [ebp-0CH], 0                      ; 53CB _ 83. 7D, F4, 00
        jns     ?_308                                   ; 53CF _ 79, 07
        mov     dword [ebp-0CH], 0                      ; 53D1 _ C7. 45, F4, 00000000
?_308:  mov     eax, dword [ebp-18H]                    ; 53D8 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 53DB _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 53DE _ 3B. 45, D8
        jge     ?_309                                   ; 53E1 _ 7D, 09
        mov     eax, dword [ebp-18H]                    ; 53E3 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 53E6 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 53E9 _ 89. 45, D8
?_309:  mov     eax, dword [ebp-18H]                    ; 53EC _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 53EF _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 53F2 _ 3B. 45, DC
        jge     ?_310                                   ; 53F5 _ 7D, 09
        mov     eax, dword [ebp-18H]                    ; 53F7 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 53FA _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 53FD _ 89. 45, DC
?_310:  mov     dword [ebp-2CH], 0                      ; 5400 _ C7. 45, D4, 00000000
        jmp     ?_315                                   ; 5407 _ E9, 0000008A

?_311:  mov     eax, dword [ebp-18H]                    ; 540C _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 540F _ 8B. 50, 10
        mov     eax, dword [ebp-2CH]                    ; 5412 _ 8B. 45, D4
        add     eax, edx                                ; 5415 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 5417 _ 89. 45, F8
        mov     dword [ebp-30H], 0                      ; 541A _ C7. 45, D0, 00000000
        jmp     ?_314                                   ; 5421 _ EB, 67

?_312:  mov     eax, dword [ebp-18H]                    ; 5423 _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 5426 _ 8B. 50, 0C
        mov     eax, dword [ebp-30H]                    ; 5429 _ 8B. 45, D0
        add     eax, edx                                ; 542C _ 01. D0
        mov     dword [ebp-4H], eax                     ; 542E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 5431 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5434 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 5437 _ 0F AF. 45, F8
        mov     edx, eax                                ; 543B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 543D _ 8B. 45, FC
        add     eax, edx                                ; 5440 _ 01. D0
        mov     edx, eax                                ; 5442 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 5444 _ 8B. 45, E4
        add     eax, edx                                ; 5447 _ 01. D0
        movzx   eax, byte [eax]                         ; 5449 _ 0F B6. 00
        cmp     al, byte [ebp-35H]                      ; 544C _ 3A. 45, CB
        jnz     ?_313                                   ; 544F _ 75, 35
        mov     eax, dword [ebp+8H]                     ; 5451 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5454 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 5457 _ 0F AF. 45, F8
        mov     edx, eax                                ; 545B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 545D _ 8B. 45, FC
        add     eax, edx                                ; 5460 _ 01. D0
        mov     edx, eax                                ; 5462 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 5464 _ 8B. 45, E0
        add     edx, eax                                ; 5467 _ 01. C2
        mov     eax, dword [ebp-18H]                    ; 5469 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 546C _ 8B. 40, 04
        imul    eax, dword [ebp-2CH]                    ; 546F _ 0F AF. 45, D4
        mov     ecx, eax                                ; 5473 _ 89. C1
        mov     eax, dword [ebp-30H]                    ; 5475 _ 8B. 45, D0
        add     eax, ecx                                ; 5478 _ 01. C8
        mov     ecx, eax                                ; 547A _ 89. C1
        mov     eax, dword [ebp-14H]                    ; 547C _ 8B. 45, EC
        add     eax, ecx                                ; 547F _ 01. C8
        movzx   eax, byte [eax]                         ; 5481 _ 0F B6. 00
        mov     byte [edx], al                          ; 5484 _ 88. 02
?_313:  add     dword [ebp-30H], 1                      ; 5486 _ 83. 45, D0, 01
?_314:  mov     eax, dword [ebp-30H]                    ; 548A _ 8B. 45, D0
        cmp     eax, dword [ebp-28H]                    ; 548D _ 3B. 45, D8
        jl      ?_312                                   ; 5490 _ 7C, 91
        add     dword [ebp-2CH], 1                      ; 5492 _ 83. 45, D4, 01
?_315:  mov     eax, dword [ebp-2CH]                    ; 5496 _ 8B. 45, D4
        cmp     eax, dword [ebp-24H]                    ; 5499 _ 3B. 45, DC
        jl      ?_311                                   ; 549C _ 0F 8C, FFFFFF6A
        add     dword [ebp-34H], 1                      ; 54A2 _ 83. 45, CC, 01
?_316:  mov     eax, dword [ebp-34H]                    ; 54A6 _ 8B. 45, CC
        cmp     eax, dword [ebp+20H]                    ; 54A9 _ 3B. 45, 20
        jle     ?_306                                   ; 54AC _ 0F 8E, FFFFFE99
        leave                                           ; 54B2 _ C9
        ret                                             ; 54B3 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 54B4 _ 55
        mov     ebp, esp                                ; 54B5 _ 89. E5
        sub     esp, 64                                 ; 54B7 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 54BA _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 54BD _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 54C0 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 54C3 _ 83. 7D, 0C, 00
        jns     ?_317                                   ; 54C7 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 54C9 _ C7. 45, 0C, 00000000
?_317:  cmp     dword [ebp+10H], 0                      ; 54D0 _ 83. 7D, 10, 00
        jns     ?_318                                   ; 54D4 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 54D6 _ C7. 45, 10, 00000000
?_318:  mov     eax, dword [ebp+8H]                     ; 54DD _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 54E0 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 54E3 _ 3B. 45, 14
        jge     ?_319                                   ; 54E6 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 54E8 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 54EB _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 54EE _ 89. 45, 14
?_319:  mov     eax, dword [ebp+8H]                     ; 54F1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 54F4 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 54F7 _ 3B. 45, 18
        jge     ?_320                                   ; 54FA _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 54FC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 54FF _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 5502 _ 89. 45, 18
?_320:  mov     eax, dword [ebp+1CH]                    ; 5505 _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 5508 _ 89. 45, D0
        jmp     ?_331                                   ; 550B _ E9, 00000147

?_321:  mov     eax, dword [ebp+8H]                     ; 5510 _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 5513 _ 8B. 55, D0
        add     edx, 4                                  ; 5516 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 5519 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 551D _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 5520 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 5523 _ 8B. 45, 08
        add     eax, 1044                               ; 5526 _ 05, 00000414
        sub     edx, eax                                ; 552B _ 29. C2
        mov     eax, edx                                ; 552D _ 89. D0
        sar     eax, 2                                  ; 552F _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 5532 _ 69. C0, 38E38E39
        mov     byte [ebp-31H], al                      ; 5538 _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 553B _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 553E _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 5540 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 5543 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 5546 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 5549 _ 8B. 55, 0C
        sub     edx, eax                                ; 554C _ 29. C2
        mov     eax, edx                                ; 554E _ 89. D0
        mov     dword [ebp-24H], eax                    ; 5550 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 5553 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 5556 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 5559 _ 8B. 55, 10
        sub     edx, eax                                ; 555C _ 29. C2
        mov     eax, edx                                ; 555E _ 89. D0
        mov     dword [ebp-20H], eax                    ; 5560 _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 5563 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 5566 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 5569 _ 8B. 55, 14
        sub     edx, eax                                ; 556C _ 29. C2
        mov     eax, edx                                ; 556E _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 5570 _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 5573 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 5576 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 5579 _ 8B. 55, 18
        sub     edx, eax                                ; 557C _ 29. C2
        mov     eax, edx                                ; 557E _ 89. D0
        mov     dword [ebp-18H], eax                    ; 5580 _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 5583 _ 83. 7D, DC, 00
        jns     ?_322                                   ; 5587 _ 79, 07
        mov     dword [ebp-24H], 0                      ; 5589 _ C7. 45, DC, 00000000
?_322:  cmp     dword [ebp-20H], 0                      ; 5590 _ 83. 7D, E0, 00
        jns     ?_323                                   ; 5594 _ 79, 07
        mov     dword [ebp-20H], 0                      ; 5596 _ C7. 45, E0, 00000000
?_323:  mov     eax, dword [ebp-10H]                    ; 559D _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 55A0 _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 55A3 _ 3B. 45, E4
        jge     ?_324                                   ; 55A6 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 55A8 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 55AB _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 55AE _ 89. 45, E4
?_324:  mov     eax, dword [ebp-10H]                    ; 55B1 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 55B4 _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 55B7 _ 3B. 45, E8
        jge     ?_325                                   ; 55BA _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 55BC _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 55BF _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 55C2 _ 89. 45, E8
?_325:  mov     eax, dword [ebp-20H]                    ; 55C5 _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 55C8 _ 89. 45, D8
        jmp     ?_330                                   ; 55CB _ EB, 7A

?_326:  mov     eax, dword [ebp-10H]                    ; 55CD _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 55D0 _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 55D3 _ 8B. 45, D8
        add     eax, edx                                ; 55D6 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 55D8 _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 55DB _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 55DE _ 89. 45, D4
        jmp     ?_329                                   ; 55E1 _ EB, 58

?_327:  mov     eax, dword [ebp-10H]                    ; 55E3 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 55E6 _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 55E9 _ 8B. 45, D4
        add     eax, edx                                ; 55EC _ 01. D0
        mov     dword [ebp-4H], eax                     ; 55EE _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 55F1 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 55F4 _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 55F7 _ 0F AF. 45, D8
        mov     edx, eax                                ; 55FB _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 55FD _ 8B. 45, D4
        add     eax, edx                                ; 5600 _ 01. D0
        mov     edx, eax                                ; 5602 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 5604 _ 8B. 45, F4
        add     eax, edx                                ; 5607 _ 01. D0
        movzx   eax, byte [eax]                         ; 5609 _ 0F B6. 00
        movzx   edx, al                                 ; 560C _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 560F _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 5612 _ 8B. 40, 14
        cmp     edx, eax                                ; 5615 _ 39. C2
        jz      ?_328                                   ; 5617 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 5619 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 561C _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 561F _ 0F AF. 45, F8
        mov     edx, eax                                ; 5623 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 5625 _ 8B. 45, FC
        add     eax, edx                                ; 5628 _ 01. D0
        mov     edx, eax                                ; 562A _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 562C _ 8B. 45, EC
        add     edx, eax                                ; 562F _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 5631 _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 5635 _ 88. 02
?_328:  add     dword [ebp-2CH], 1                      ; 5637 _ 83. 45, D4, 01
?_329:  mov     eax, dword [ebp-2CH]                    ; 563B _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 563E _ 3B. 45, E4
        jl      ?_327                                   ; 5641 _ 7C, A0
        add     dword [ebp-28H], 1                      ; 5643 _ 83. 45, D8, 01
?_330:  mov     eax, dword [ebp-28H]                    ; 5647 _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 564A _ 3B. 45, E8
        jl      ?_326                                   ; 564D _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 5653 _ 83. 45, D0, 01
?_331:  mov     eax, dword [ebp+8H]                     ; 5657 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 565A _ 8B. 40, 10
        cmp     eax, dword [ebp-30H]                    ; 565D _ 3B. 45, D0
        jge     ?_321                                   ; 5660 _ 0F 8D, FFFFFEAA
        nop                                             ; 5666 _ 90
        leave                                           ; 5667 _ C9
        ret                                             ; 5668 _ C3
; sheet_refreshmap End of function

sheet_free:; Function begin
        push    ebp                                     ; 5669 _ 55
        mov     ebp, esp                                ; 566A _ 89. E5
        sub     esp, 24                                 ; 566C _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 566F _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 5672 _ 8B. 40, 18
        test    eax, eax                                ; 5675 _ 85. C0
        js      ?_332                                   ; 5677 _ 78, 1A
        mov     dword [esp+8H], -1                      ; 5679 _ C7. 44 24, 08, FFFFFFFF
        mov     eax, dword [ebp+0CH]                    ; 5681 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 5684 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 5688 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 568B _ 89. 04 24
        call    sheet_updown                            ; 568E _ E8, FFFFFFFC(rel)
?_332:  mov     eax, dword [ebp+0CH]                    ; 5693 _ 8B. 45, 0C
        mov     dword [eax+1CH], 0                      ; 5696 _ C7. 40, 1C, 00000000
        nop                                             ; 569D _ 90
        leave                                           ; 569E _ C9
        ret                                             ; 569F _ C3
; sheet_free End of function

init_pit:; Function begin
        push    ebp                                     ; 56A0 _ 55
        mov     ebp, esp                                ; 56A1 _ 89. E5
        sub     esp, 40                                 ; 56A3 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 56A6 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 56AE _ C7. 04 24, 00000043
        call    io_out8                                 ; 56B5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 56BA _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 56C2 _ C7. 04 24, 00000040
        call    io_out8                                 ; 56C9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 56CE _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 56D6 _ C7. 04 24, 00000040
        call    io_out8                                 ; 56DD _ E8, FFFFFFFC(rel)
        mov     dword [timerctl], 0                     ; 56E2 _ C7. 05, 00000380(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 56EC _ C7. 45, F4, 00000000
        jmp     ?_334                                   ; 56F3 _ EB, 28

?_333:  mov     eax, dword [ebp-0CH]                    ; 56F5 _ 8B. 45, F4
        shl     eax, 4                                  ; 56F8 _ C1. E0, 04
        add     eax, timerctl                           ; 56FB _ 05, 00000380(d)
        mov     dword [eax+8H], 0                       ; 5700 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 5707 _ 8B. 45, F4
        shl     eax, 4                                  ; 570A _ C1. E0, 04
        add     eax, timerctl                           ; 570D _ 05, 00000380(d)
        mov     dword [eax+0CH], 0                      ; 5712 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 5719 _ 83. 45, F4, 01
?_334:  cmp     dword [ebp-0CH], 499                    ; 571D _ 81. 7D, F4, 000001F3
        jle     ?_333                                   ; 5724 _ 7E, CF
        leave                                           ; 5726 _ C9
        ret                                             ; 5727 _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 5728 _ 55
        mov     ebp, esp                                ; 5729 _ 89. E5
        sub     esp, 16                                 ; 572B _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 572E _ C7. 45, FC, 00000000
        jmp     ?_337                                   ; 5735 _ EB, 38

?_335:  mov     eax, dword [ebp-4H]                     ; 5737 _ 8B. 45, FC
        shl     eax, 4                                  ; 573A _ C1. E0, 04
        add     eax, timerctl                           ; 573D _ 05, 00000380(d)
        mov     eax, dword [eax+8H]                     ; 5742 _ 8B. 40, 08
        test    eax, eax                                ; 5745 _ 85. C0
        jnz     ?_336                                   ; 5747 _ 75, 22
        mov     eax, dword [ebp-4H]                     ; 5749 _ 8B. 45, FC
        shl     eax, 4                                  ; 574C _ C1. E0, 04
        add     eax, timerctl                           ; 574F _ 05, 00000380(d)
        mov     dword [eax+8H], 1                       ; 5754 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-4H]                     ; 575B _ 8B. 45, FC
        shl     eax, 4                                  ; 575E _ C1. E0, 04
        add     eax, timerctl                           ; 5761 _ 05, 00000380(d)
        add     eax, 4                                  ; 5766 _ 83. C0, 04
        jmp     ?_338                                   ; 5769 _ EB, 12

?_336:  add     dword [ebp-4H], 1                       ; 576B _ 83. 45, FC, 01
?_337:  cmp     dword [ebp-4H], 499                     ; 576F _ 81. 7D, FC, 000001F3
        jle     ?_335                                   ; 5776 _ 7E, BF
        mov     eax, 0                                  ; 5778 _ B8, 00000000
?_338:  leave                                           ; 577D _ C9
        ret                                             ; 577E _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 577F _ 55
        mov     ebp, esp                                ; 5780 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 5782 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 5785 _ C7. 40, 04, 00000000
        nop                                             ; 578C _ 90
        pop     ebp                                     ; 578D _ 5D
        ret                                             ; 578E _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 578F _ 55
        mov     ebp, esp                                ; 5790 _ 89. E5
        sub     esp, 4                                  ; 5792 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 5795 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 5798 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 579B _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 579E _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 57A1 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 57A4 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 57A7 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 57AB _ 88. 50, 0C
        nop                                             ; 57AE _ 90
        leave                                           ; 57AF _ C9
        ret                                             ; 57B0 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 57B1 _ 55
        mov     ebp, esp                                ; 57B2 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 57B4 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 57B7 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 57BA _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 57BC _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 57BF _ C7. 40, 04, 00000002
        nop                                             ; 57C6 _ 90
        pop     ebp                                     ; 57C7 _ 5D
        ret                                             ; 57C8 _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 57C9 _ 55
        mov     ebp, esp                                ; 57CA _ 89. E5
        sub     esp, 40                                 ; 57CC _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 57CF _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 57D7 _ C7. 04 24, 00000020
        call    io_out8                                 ; 57DE _ E8, FFFFFFFC(rel)
        mov     eax, dword [timerctl]                   ; 57E3 _ A1, 00000380(d)
        add     eax, 1                                  ; 57E8 _ 83. C0, 01
        mov     dword [timerctl], eax                   ; 57EB _ A3, 00000380(d)
        mov     byte [ebp-0DH], 0                       ; 57F0 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 57F4 _ C7. 45, F4, 00000000
        jmp     ?_342                                   ; 57FB _ E9, 000000B0

?_339:  mov     eax, dword [ebp-0CH]                    ; 5800 _ 8B. 45, F4
        shl     eax, 4                                  ; 5803 _ C1. E0, 04
        add     eax, timerctl                           ; 5806 _ 05, 00000380(d)
        mov     eax, dword [eax+8H]                     ; 580B _ 8B. 40, 08
        cmp     eax, 2                                  ; 580E _ 83. F8, 02
        jne     ?_340                                   ; 5811 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 5817 _ 8B. 45, F4
        shl     eax, 4                                  ; 581A _ C1. E0, 04
        add     eax, timerctl                           ; 581D _ 05, 00000380(d)
        mov     eax, dword [eax+4H]                     ; 5822 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 5825 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 5828 _ 8B. 45, F4
        shl     eax, 4                                  ; 582B _ C1. E0, 04
        add     eax, timerctl                           ; 582E _ 05, 00000380(d)
        mov     dword [eax+4H], edx                     ; 5833 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 5836 _ 8B. 45, F4
        shl     eax, 4                                  ; 5839 _ C1. E0, 04
        add     eax, timerctl                           ; 583C _ 05, 00000380(d)
        mov     eax, dword [eax+4H]                     ; 5841 _ 8B. 40, 04
        test    eax, eax                                ; 5844 _ 85. C0
        jnz     ?_340                                   ; 5846 _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 5848 _ 8B. 45, F4
        shl     eax, 4                                  ; 584B _ C1. E0, 04
        add     eax, timerctl                           ; 584E _ 05, 00000380(d)
        mov     dword [eax+8H], 1                       ; 5853 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 585A _ 8B. 45, F4
        shl     eax, 4                                  ; 585D _ C1. E0, 04
        add     eax, timerctl                           ; 5860 _ 05, 00000380(d)
        movzx   eax, byte [eax+10H]                     ; 5865 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 5869 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 586C _ 8B. 45, F4
        shl     eax, 4                                  ; 586F _ C1. E0, 04
        add     eax, timerctl                           ; 5872 _ 05, 00000380(d)
        mov     eax, dword [eax+0CH]                    ; 5877 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 587A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 587E _ 89. 04 24
        call    fifo8_put                               ; 5881 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5886 _ 8B. 45, F4
        shl     eax, 4                                  ; 5889 _ C1. E0, 04
        add     eax, timerctl                           ; 588C _ 05, 00000380(d)
        lea     edx, [eax+4H]                           ; 5891 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 5894 _ A1, 00000000(d)
        cmp     edx, eax                                ; 5899 _ 39. C2
        jnz     ?_340                                   ; 589B _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 589D _ C6. 45, F3, 01
?_340:  cmp     byte [ebp-0DH], 0                       ; 58A1 _ 80. 7D, F3, 00
        jz      ?_341                                   ; 58A5 _ 74, 05
        call    task_switch                             ; 58A7 _ E8, FFFFFFFC(rel)
?_341:  add     dword [ebp-0CH], 1                      ; 58AC _ 83. 45, F4, 01
?_342:  cmp     dword [ebp-0CH], 499                    ; 58B0 _ 81. 7D, F4, 000001F3
        jle     ?_339                                   ; 58B7 _ 0F 8E, FFFFFF43
        nop                                             ; 58BD _ 90
        leave                                           ; 58BE _ C9
        ret                                             ; 58BF _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 58C0 _ 55
        mov     ebp, esp                                ; 58C1 _ 89. E5
        mov     eax, timerctl                           ; 58C3 _ B8, 00000380(d)
        pop     ebp                                     ; 58C8 _ 5D
        ret                                             ; 58C9 _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 58CA _ 55
        mov     ebp, esp                                ; 58CB _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 58CD _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 58D0 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 58D3 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 58D6 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 58D9 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 58DC _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 58DE _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 58E1 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 58E4 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 58E7 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 58EA _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 58F1 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 58F4 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 58FB _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 58FE _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 5905 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 5908 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 590B _ 89. 50, 18
        nop                                             ; 590E _ 90
        pop     ebp                                     ; 590F _ 5D
        ret                                             ; 5910 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 5911 _ 55
        mov     ebp, esp                                ; 5912 _ 89. E5
        sub     esp, 24                                 ; 5914 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 5917 _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 591A _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 591D _ 83. 7D, 08, 00
        jnz     ?_343                                   ; 5921 _ 75, 0A
        mov     eax, 4294967295                         ; 5923 _ B8, FFFFFFFF
        jmp     ?_347                                   ; 5928 _ E9, 000000B2

?_343:  mov     eax, dword [ebp+8H]                     ; 592D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5930 _ 8B. 40, 10
        test    eax, eax                                ; 5933 _ 85. C0
        jnz     ?_344                                   ; 5935 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 5937 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 593A _ 8B. 40, 14
        or      eax, 01H                                ; 593D _ 83. C8, 01
        mov     edx, eax                                ; 5940 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5942 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 5945 _ 89. 50, 14
        mov     eax, 4294967294                         ; 5948 _ B8, FFFFFFFE
        jmp     ?_347                                   ; 594D _ E9, 0000008D

?_344:  mov     eax, dword [ebp+8H]                     ; 5952 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 5955 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 5957 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 595A _ 8B. 40, 04
        add     edx, eax                                ; 595D _ 01. C2
        movzx   eax, byte [ebp-0CH]                     ; 595F _ 0F B6. 45, F4
        mov     byte [edx], al                          ; 5963 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 5965 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5968 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 596B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 596E _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 5971 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 5974 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 5977 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 597A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 597D _ 8B. 40, 0C
        cmp     edx, eax                                ; 5980 _ 39. C2
        jnz     ?_345                                   ; 5982 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 5984 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 5987 _ C7. 40, 04, 00000000
?_345:  mov     eax, dword [ebp+8H]                     ; 598E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5991 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 5994 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 5997 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 599A _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 599D _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 59A0 _ 8B. 40, 18
        test    eax, eax                                ; 59A3 _ 85. C0
        jz      ?_346                                   ; 59A5 _ 74, 33
        mov     eax, dword [ebp+8H]                     ; 59A7 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 59AA _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 59AD _ 8B. 40, 04
        cmp     eax, 2                                  ; 59B0 _ 83. F8, 02
        jz      ?_346                                   ; 59B3 _ 74, 25
        mov     eax, dword [ebp+8H]                     ; 59B5 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 59B8 _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 59BB _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 59C3 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 59CB _ 89. 04 24
        call    task_run                                ; 59CE _ E8, FFFFFFFC(rel)
        mov     eax, 1                                  ; 59D3 _ B8, 00000001
        jmp     ?_347                                   ; 59D8 _ EB, 05

?_346:  mov     eax, 0                                  ; 59DA _ B8, 00000000
?_347:  leave                                           ; 59DF _ C9
        ret                                             ; 59E0 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 59E1 _ 55
        mov     ebp, esp                                ; 59E2 _ 89. E5
        sub     esp, 16                                 ; 59E4 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 59E7 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 59EA _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 59ED _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 59F0 _ 8B. 40, 0C
        cmp     edx, eax                                ; 59F3 _ 39. C2
        jnz     ?_348                                   ; 59F5 _ 75, 07
        mov     eax, 4294967295                         ; 59F7 _ B8, FFFFFFFF
        jmp     ?_350                                   ; 59FC _ EB, 51

?_348:  mov     eax, dword [ebp+8H]                     ; 59FE _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 5A01 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 5A03 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5A06 _ 8B. 40, 08
        add     eax, edx                                ; 5A09 _ 01. D0
        movzx   eax, byte [eax]                         ; 5A0B _ 0F B6. 00
        movzx   eax, al                                 ; 5A0E _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 5A11 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 5A14 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5A17 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 5A1A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 5A1D _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 5A20 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 5A23 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 5A26 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 5A29 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5A2C _ 8B. 40, 0C
        cmp     edx, eax                                ; 5A2F _ 39. C2
        jnz     ?_349                                   ; 5A31 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 5A33 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 5A36 _ C7. 40, 08, 00000000
?_349:  mov     eax, dword [ebp+8H]                     ; 5A3D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5A40 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 5A43 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 5A46 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 5A49 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 5A4C _ 8B. 45, FC
?_350:  leave                                           ; 5A4F _ C9
        ret                                             ; 5A50 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 5A51 _ 55
        mov     ebp, esp                                ; 5A52 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 5A54 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5A57 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 5A5A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5A5D _ 8B. 40, 10
        sub     edx, eax                                ; 5A60 _ 29. C2
        mov     eax, edx                                ; 5A62 _ 89. D0
        pop     ebp                                     ; 5A64 _ 5D
        ret                                             ; 5A65 _ C3
; fifo8_status End of function

strcmp: ; Function begin
        push    ebp                                     ; 5A66 _ 55
        mov     ebp, esp                                ; 5A67 _ 89. E5
        sub     esp, 16                                 ; 5A69 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 5A6C _ 83. 7D, 08, 00
        jz      ?_351                                   ; 5A70 _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 5A72 _ 83. 7D, 0C, 00
        jnz     ?_352                                   ; 5A76 _ 75, 0A
?_351:  mov     eax, 0                                  ; 5A78 _ B8, 00000000
        jmp     ?_359                                   ; 5A7D _ E9, 0000009B

?_352:  mov     dword [ebp-4H], 0                       ; 5A82 _ C7. 45, FC, 00000000
        jmp     ?_355                                   ; 5A89 _ EB, 25

?_353:  mov     edx, dword [ebp-4H]                     ; 5A8B _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5A8E _ 8B. 45, 08
        add     eax, edx                                ; 5A91 _ 01. D0
        movzx   edx, byte [eax]                         ; 5A93 _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 5A96 _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 5A99 _ 8B. 45, 0C
        add     eax, ecx                                ; 5A9C _ 01. C8
        movzx   eax, byte [eax]                         ; 5A9E _ 0F B6. 00
        cmp     dl, al                                  ; 5AA1 _ 38. C2
        jz      ?_354                                   ; 5AA3 _ 74, 07
        mov     eax, 0                                  ; 5AA5 _ B8, 00000000
        jmp     ?_359                                   ; 5AAA _ EB, 71

?_354:  add     dword [ebp-4H], 1                       ; 5AAC _ 83. 45, FC, 01
?_355:  mov     edx, dword [ebp-4H]                     ; 5AB0 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5AB3 _ 8B. 45, 08
        add     eax, edx                                ; 5AB6 _ 01. D0
        movzx   eax, byte [eax]                         ; 5AB8 _ 0F B6. 00
        test    al, al                                  ; 5ABB _ 84. C0
        jz      ?_356                                   ; 5ABD _ 74, 0F
        mov     edx, dword [ebp-4H]                     ; 5ABF _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 5AC2 _ 8B. 45, 0C
        add     eax, edx                                ; 5AC5 _ 01. D0
        movzx   eax, byte [eax]                         ; 5AC7 _ 0F B6. 00
        test    al, al                                  ; 5ACA _ 84. C0
        jnz     ?_353                                   ; 5ACC _ 75, BD
?_356:  mov     edx, dword [ebp-4H]                     ; 5ACE _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5AD1 _ 8B. 45, 08
        add     eax, edx                                ; 5AD4 _ 01. D0
        movzx   eax, byte [eax]                         ; 5AD6 _ 0F B6. 00
        test    al, al                                  ; 5AD9 _ 84. C0
        jnz     ?_357                                   ; 5ADB _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 5ADD _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 5AE0 _ 8B. 45, 0C
        add     eax, edx                                ; 5AE3 _ 01. D0
        movzx   eax, byte [eax]                         ; 5AE5 _ 0F B6. 00
        test    al, al                                  ; 5AE8 _ 84. C0
        jz      ?_357                                   ; 5AEA _ 74, 07
        mov     eax, 0                                  ; 5AEC _ B8, 00000000
        jmp     ?_359                                   ; 5AF1 _ EB, 2A

?_357:  mov     edx, dword [ebp-4H]                     ; 5AF3 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5AF6 _ 8B. 45, 08
        add     eax, edx                                ; 5AF9 _ 01. D0
        movzx   eax, byte [eax]                         ; 5AFB _ 0F B6. 00
        test    al, al                                  ; 5AFE _ 84. C0
        jz      ?_358                                   ; 5B00 _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 5B02 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 5B05 _ 8B. 45, 0C
        add     eax, edx                                ; 5B08 _ 01. D0
        movzx   eax, byte [eax]                         ; 5B0A _ 0F B6. 00
        test    al, al                                  ; 5B0D _ 84. C0
        jz      ?_358                                   ; 5B0F _ 74, 07
        mov     eax, 0                                  ; 5B11 _ B8, 00000000
        jmp     ?_359                                   ; 5B16 _ EB, 05

?_358:  mov     eax, 1                                  ; 5B18 _ B8, 00000001
?_359:  leave                                           ; 5B1D _ C9
        ret                                             ; 5B1E _ C3
; strcmp End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 5B1F _ 55
        mov     ebp, esp                                ; 5B20 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 5B22 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_360                                   ; 5B29 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 5B2B _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 5B32 _ 8B. 45, 0C
        shr     eax, 12                                 ; 5B35 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 5B38 _ 89. 45, 0C
?_360:  mov     eax, dword [ebp+0CH]                    ; 5B3B _ 8B. 45, 0C
        mov     edx, eax                                ; 5B3E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5B40 _ 8B. 45, 08
        mov     word [eax], dx                          ; 5B43 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 5B46 _ 8B. 45, 10
        mov     edx, eax                                ; 5B49 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5B4B _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 5B4E _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 5B52 _ 8B. 45, 10
        sar     eax, 16                                 ; 5B55 _ C1. F8, 10
        mov     edx, eax                                ; 5B58 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5B5A _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 5B5D _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 5B60 _ 8B. 45, 14
        mov     edx, eax                                ; 5B63 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5B65 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 5B68 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 5B6B _ 8B. 45, 0C
        shr     eax, 16                                 ; 5B6E _ C1. E8, 10
        and     eax, 0FH                                ; 5B71 _ 83. E0, 0F
        mov     edx, eax                                ; 5B74 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 5B76 _ 8B. 45, 14
        sar     eax, 8                                  ; 5B79 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 5B7C _ 83. E0, F0
        or      eax, edx                                ; 5B7F _ 09. D0
        mov     edx, eax                                ; 5B81 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5B83 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 5B86 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 5B89 _ 8B. 45, 10
        shr     eax, 24                                 ; 5B8C _ C1. E8, 18
        mov     edx, eax                                ; 5B8F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5B91 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 5B94 _ 88. 50, 07
        nop                                             ; 5B97 _ 90
        pop     ebp                                     ; 5B98 _ 5D
        ret                                             ; 5B99 _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 5B9A _ 55
        mov     ebp, esp                                ; 5B9B _ 89. E5
        mov     eax, dword [taskctl]                    ; 5B9D _ A1, 000022C8(d)
        pop     ebp                                     ; 5BA2 _ 5D
        ret                                             ; 5BA3 _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 5BA4 _ 55
        mov     ebp, esp                                ; 5BA5 _ 89. E5
        sub     esp, 16                                 ; 5BA7 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5BAA _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp+8H]                     ; 5BB0 _ 8B. 55, 08
        mov     eax, edx                                ; 5BB3 _ 89. D0
        add     eax, eax                                ; 5BB5 _ 01. C0
        add     eax, edx                                ; 5BB7 _ 01. D0
        shl     eax, 4                                  ; 5BB9 _ C1. E0, 04
        add     eax, ecx                                ; 5BBC _ 01. C8
        add     eax, 8                                  ; 5BBE _ 83. C0, 08
        mov     dword [eax], 0                          ; 5BC1 _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 5BC7 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp+8H]                     ; 5BCD _ 8B. 55, 08
        mov     eax, edx                                ; 5BD0 _ 89. D0
        add     eax, eax                                ; 5BD2 _ 01. C0
        add     eax, edx                                ; 5BD4 _ 01. D0
        shl     eax, 4                                  ; 5BD6 _ C1. E0, 04
        add     eax, ecx                                ; 5BD9 _ 01. C8
        add     eax, 12                                 ; 5BDB _ 83. C0, 0C
        mov     dword [eax], 0                          ; 5BDE _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 5BE4 _ C7. 45, FC, 00000000
        jmp     ?_362                                   ; 5BEB _ EB, 1B

?_361:  mov     edx, dword [taskctl]                    ; 5BED _ 8B. 15, 000022C8(d)
        mov     eax, dword [ebp-4H]                     ; 5BF3 _ 8B. 45, FC
        imul    eax, eax, 52                            ; 5BF6 _ 6B. C0, 34
        add     eax, edx                                ; 5BF9 _ 01. D0
        add     eax, 16                                 ; 5BFB _ 83. C0, 10
        mov     dword [eax], 0                          ; 5BFE _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 5C04 _ 83. 45, FC, 01
?_362:  cmp     dword [ebp-4H], 9                       ; 5C08 _ 83. 7D, FC, 09
        jle     ?_361                                   ; 5C0C _ 7E, DF
        leave                                           ; 5C0E _ C9
        ret                                             ; 5C0F _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 5C10 _ 55
        mov     ebp, esp                                ; 5C11 _ 89. E5
        sub     esp, 40                                 ; 5C13 _ 83. EC, 28
        call    get_addr_gdt                            ; 5C16 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 5C1B _ 89. 45, F0
        mov     dword [esp+4H], 3048                    ; 5C1E _ C7. 44 24, 04, 00000BE8
        mov     eax, dword [ebp+8H]                     ; 5C26 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5C29 _ 89. 04 24
        call    memman_alloc_4k                         ; 5C2C _ E8, FFFFFFFC(rel)
        mov     dword [taskctl], eax                    ; 5C31 _ A3, 000022C8(d)
        mov     dword [ebp-14H], 0                      ; 5C36 _ C7. 45, EC, 00000000
        jmp     ?_364                                   ; 5C3D _ E9, 000000F8

?_363:  mov     edx, dword [taskctl]                    ; 5C42 _ 8B. 15, 000022C8(d)
        mov     eax, dword [ebp-14H]                    ; 5C48 _ 8B. 45, EC
        imul    eax, eax, 204                           ; 5C4B _ 69. C0, 000000CC
        add     eax, edx                                ; 5C51 _ 01. D0
        add     eax, 492                                ; 5C53 _ 05, 000001EC
        mov     dword [eax], 0                          ; 5C58 _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 5C5E _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp-14H]                    ; 5C64 _ 8B. 45, EC
        add     eax, 7                                  ; 5C67 _ 83. C0, 07
        lea     edx, [eax*8]                            ; 5C6A _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 5C71 _ 8B. 45, EC
        imul    eax, eax, 204                           ; 5C74 _ 69. C0, 000000CC
        add     eax, ecx                                ; 5C7A _ 01. C8
        add     eax, 488                                ; 5C7C _ 05, 000001E8
        mov     dword [eax], edx                        ; 5C81 _ 89. 10
        mov     ecx, dword [taskctl]                    ; 5C83 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp-14H]                    ; 5C89 _ 8B. 45, EC
        add     eax, 17                                 ; 5C8C _ 83. C0, 11
        lea     edx, [eax*8]                            ; 5C8F _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 5C96 _ 8B. 45, EC
        imul    eax, eax, 204                           ; 5C99 _ 69. C0, 000000CC
        add     eax, ecx                                ; 5C9F _ 01. C8
        add     eax, 628                                ; 5CA1 _ 05, 00000274
        mov     dword [eax], edx                        ; 5CA6 _ 89. 10
        mov     eax, dword [taskctl]                    ; 5CA8 _ A1, 000022C8(d)
        mov     edx, dword [ebp-14H]                    ; 5CAD _ 8B. 55, EC
        imul    edx, edx, 204                           ; 5CB0 _ 69. D2, 000000CC
        add     edx, 512                                ; 5CB6 _ 81. C2, 00000200
        add     eax, edx                                ; 5CBC _ 01. D0
        add     eax, 20                                 ; 5CBE _ 83. C0, 14
        mov     edx, dword [ebp-14H]                    ; 5CC1 _ 8B. 55, EC
        add     edx, 7                                  ; 5CC4 _ 83. C2, 07
        lea     ecx, [edx*8]                            ; 5CC7 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 5CCE _ 8B. 55, F0
        add     edx, ecx                                ; 5CD1 _ 01. CA
        mov     dword [esp+0CH], 137                    ; 5CD3 _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 5CDB _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 5CDF _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 5CE7 _ 89. 14 24
        call    set_segmdesc                            ; 5CEA _ E8, FFFFFFFC(rel)
        mov     eax, dword [taskctl]                    ; 5CEF _ A1, 000022C8(d)
        mov     edx, dword [ebp-14H]                    ; 5CF4 _ 8B. 55, EC
        imul    edx, edx, 204                           ; 5CF7 _ 69. D2, 000000CC
        add     edx, 656                                ; 5CFD _ 81. C2, 00000290
        add     eax, edx                                ; 5D03 _ 01. D0
        add     eax, 20                                 ; 5D05 _ 83. C0, 14
        mov     edx, dword [ebp-14H]                    ; 5D08 _ 8B. 55, EC
        add     edx, 17                                 ; 5D0B _ 83. C2, 11
        lea     ecx, [edx*8]                            ; 5D0E _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 5D15 _ 8B. 55, F0
        add     edx, ecx                                ; 5D18 _ 01. CA
        mov     dword [esp+0CH], 130                    ; 5D1A _ C7. 44 24, 0C, 00000082
        mov     dword [esp+8H], eax                     ; 5D22 _ 89. 44 24, 08
        mov     dword [esp+4H], 15                      ; 5D26 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], edx                        ; 5D2E _ 89. 14 24
        call    set_segmdesc                            ; 5D31 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 5D36 _ 83. 45, EC, 01
?_364:  cmp     dword [ebp-14H], 9                      ; 5D3A _ 83. 7D, EC, 09
        jle     ?_363                                   ; 5D3E _ 0F 8E, FFFFFEFE
        mov     dword [ebp-14H], 0                      ; 5D44 _ C7. 45, EC, 00000000
        jmp     ?_366                                   ; 5D4B _ EB, 0F

?_365:  mov     eax, dword [ebp-14H]                    ; 5D4D _ 8B. 45, EC
        mov     dword [esp], eax                        ; 5D50 _ 89. 04 24
        call    init_task_level                         ; 5D53 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 5D58 _ 83. 45, EC, 01
?_366:  cmp     dword [ebp-14H], 9                      ; 5D5C _ 83. 7D, EC, 09
        jle     ?_365                                   ; 5D60 _ 7E, EB
        call    task_alloc                              ; 5D62 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 5D67 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 5D6A _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 5D6D _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 5D74 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 5D77 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 5D7E _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 5D81 _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 5D88 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 5D8B _ 89. 04 24
        call    task_add                                ; 5D8E _ E8, FFFFFFFC(rel)
        call    task_switchsub                          ; 5D93 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5D98 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 5D9B _ 8B. 00
        mov     dword [esp], eax                        ; 5D9D _ 89. 04 24
        call    load_tr                                 ; 5DA0 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 5DA5 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 5DAA _ A3, 000022C4(d)
        mov     eax, dword [ebp-0CH]                    ; 5DAF _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 5DB2 _ 8B. 40, 08
        mov     edx, eax                                ; 5DB5 _ 89. C2
        mov     eax, dword [task_timer]                 ; 5DB7 _ A1, 000022C4(d)
        mov     dword [esp+4H], edx                     ; 5DBC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 5DC0 _ 89. 04 24
        call    timer_settime                           ; 5DC3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5DC8 _ 8B. 45, F4
        leave                                           ; 5DCB _ C9
        ret                                             ; 5DCC _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 5DCD _ 55
        mov     ebp, esp                                ; 5DCE _ 89. E5
        sub     esp, 16                                 ; 5DD0 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 5DD3 _ C7. 45, F8, 00000000
        jmp     ?_369                                   ; 5DDA _ E9, 000000F8

?_367:  mov     edx, dword [taskctl]                    ; 5DDF _ 8B. 15, 000022C8(d)
        mov     eax, dword [ebp-8H]                     ; 5DE5 _ 8B. 45, F8
        imul    eax, eax, 204                           ; 5DE8 _ 69. C0, 000000CC
        add     eax, edx                                ; 5DEE _ 01. D0
        add     eax, 492                                ; 5DF0 _ 05, 000001EC
        mov     eax, dword [eax]                        ; 5DF5 _ 8B. 00
        test    eax, eax                                ; 5DF7 _ 85. C0
        jne     ?_368                                   ; 5DF9 _ 0F 85, 000000D4
        mov     eax, dword [taskctl]                    ; 5DFF _ A1, 000022C8(d)
        mov     edx, dword [ebp-8H]                     ; 5E04 _ 8B. 55, F8
        imul    edx, edx, 204                           ; 5E07 _ 69. D2, 000000CC
        add     edx, 480                                ; 5E0D _ 81. C2, 000001E0
        add     eax, edx                                ; 5E13 _ 01. D0
        add     eax, 8                                  ; 5E15 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5E18 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 5E1B _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 5E1E _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 5E25 _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 5E28 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 5E2F _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 5E32 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 5E39 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 5E3C _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 5E43 _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 5E46 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 5E4D _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 5E50 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 5E57 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 5E5A _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 5E61 _ 8B. 45, F8
        add     eax, 1                                  ; 5E64 _ 83. C0, 01
        shl     eax, 9                                  ; 5E67 _ C1. E0, 09
        mov     edx, eax                                ; 5E6A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 5E6C _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 5E6F _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 5E72 _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 5E75 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 5E7C _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 5E7F _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 5E86 _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 5E89 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 5E90 _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 5E93 _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 5E9D _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 5EA0 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 5EAA _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 5EAD _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 5EB7 _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 5EBA _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 5EC1 _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 5EC4 _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 5ECE _ 8B. 45, FC
        jmp     ?_370                                   ; 5ED1 _ EB, 13

?_368:  add     dword [ebp-8H], 1                       ; 5ED3 _ 83. 45, F8, 01
?_369:  cmp     dword [ebp-8H], 9                       ; 5ED7 _ 83. 7D, F8, 09
        jle     ?_367                                   ; 5EDB _ 0F 8E, FFFFFEFE
        mov     eax, 0                                  ; 5EE1 _ B8, 00000000
?_370:  leave                                           ; 5EE6 _ C9
        ret                                             ; 5EE7 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 5EE8 _ 55
        mov     ebp, esp                                ; 5EE9 _ 89. E5
        sub     esp, 24                                 ; 5EEB _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 5EEE _ 83. 7D, 0C, 00
        jns     ?_371                                   ; 5EF2 _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 5EF4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5EF7 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 5EFA _ 89. 45, 0C
?_371:  cmp     dword [ebp+10H], 0                      ; 5EFD _ 83. 7D, 10, 00
        jle     ?_372                                   ; 5F01 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 5F03 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 5F06 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 5F09 _ 89. 50, 08
?_372:  mov     eax, dword [ebp+8H]                     ; 5F0C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5F0F _ 8B. 40, 04
        cmp     eax, 2                                  ; 5F12 _ 83. F8, 02
        jnz     ?_373                                   ; 5F15 _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 5F17 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5F1A _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 5F1D _ 3B. 45, 0C
        jz      ?_373                                   ; 5F20 _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 5F22 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5F25 _ 89. 04 24
        call    task_remove                             ; 5F28 _ E8, FFFFFFFC(rel)
?_373:  mov     eax, dword [ebp+8H]                     ; 5F2D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5F30 _ 8B. 40, 04
        cmp     eax, 2                                  ; 5F33 _ 83. F8, 02
        jz      ?_374                                   ; 5F36 _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 5F38 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5F3B _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 5F3E _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 5F41 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5F44 _ 89. 04 24
        call    task_add                                ; 5F47 _ E8, FFFFFFFC(rel)
?_374:  mov     eax, dword [taskctl]                    ; 5F4C _ A1, 000022C8(d)
        mov     dword [eax+4H], 1                       ; 5F51 _ C7. 40, 04, 00000001
        nop                                             ; 5F58 _ 90
        leave                                           ; 5F59 _ C9
        ret                                             ; 5F5A _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 5F5B _ 55
        mov     ebp, esp                                ; 5F5C _ 89. E5
        sub     esp, 40                                 ; 5F5E _ 83. EC, 28
        mov     ecx, dword [taskctl]                    ; 5F61 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 5F67 _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 5F6C _ 8B. 10
        mov     eax, edx                                ; 5F6E _ 89. D0
        add     eax, eax                                ; 5F70 _ 01. C0
        add     eax, edx                                ; 5F72 _ 01. D0
        shl     eax, 4                                  ; 5F74 _ C1. E0, 04
        add     eax, ecx                                ; 5F77 _ 01. C8
        add     eax, 8                                  ; 5F79 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 5F7C _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 5F7F _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5F82 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5F85 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 5F88 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 5F8C _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 5F8F _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 5F92 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 5F95 _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 5F98 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 5F9B _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5F9E _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5FA1 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5FA4 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 5FA7 _ 8B. 00
        cmp     edx, eax                                ; 5FA9 _ 39. C2
        jnz     ?_375                                   ; 5FAB _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 5FAD _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 5FB0 _ C7. 40, 04, 00000000
?_375:  mov     eax, dword [taskctl]                    ; 5FB7 _ A1, 000022C8(d)
        mov     eax, dword [eax+4H]                     ; 5FBC _ 8B. 40, 04
        test    eax, eax                                ; 5FBF _ 85. C0
        jz      ?_376                                   ; 5FC1 _ 74, 23
        call    task_switchsub                          ; 5FC3 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 5FC8 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 5FCE _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 5FD3 _ 8B. 10
        mov     eax, edx                                ; 5FD5 _ 89. D0
        add     eax, eax                                ; 5FD7 _ 01. C0
        add     eax, edx                                ; 5FD9 _ 01. D0
        shl     eax, 4                                  ; 5FDB _ C1. E0, 04
        add     eax, ecx                                ; 5FDE _ 01. C8
        add     eax, 8                                  ; 5FE0 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 5FE3 _ 89. 45, EC
?_376:  mov     eax, dword [ebp-14H]                    ; 5FE6 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5FE9 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5FEC _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 5FEF _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 5FF3 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 5FF6 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 5FF9 _ 8B. 40, 08
        mov     edx, eax                                ; 5FFC _ 89. C2
        mov     eax, dword [task_timer]                 ; 5FFE _ A1, 000022C4(d)
        mov     dword [esp+4H], edx                     ; 6003 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 6007 _ 89. 04 24
        call    timer_settime                           ; 600A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 600F _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 6012 _ 3B. 45, F0
        jz      ?_377                                   ; 6015 _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 6017 _ 83. 7D, F4, 00
        jz      ?_377                                   ; 601B _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 601D _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 6020 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 6022 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 6026 _ C7. 04 24, 00000000
        call    farjmp                                  ; 602D _ E8, FFFFFFFC(rel)
?_377:  nop                                             ; 6032 _ 90
        leave                                           ; 6033 _ C9
        ret                                             ; 6034 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 6035 _ 55
        mov     ebp, esp                                ; 6036 _ 89. E5
        sub     esp, 40                                 ; 6038 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 603B _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 6042 _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 6049 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 604C _ 8B. 40, 04
        cmp     eax, 2                                  ; 604F _ 83. F8, 02
        jnz     ?_378                                   ; 6052 _ 75, 51
        call    task_now                                ; 6054 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 6059 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 605C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 605F _ 89. 04 24
        call    task_remove                             ; 6062 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 6067 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 606E _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 6071 _ 3B. 45, F4
        jnz     ?_378                                   ; 6074 _ 75, 2F
        call    task_switchsub                          ; 6076 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 607B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 6080 _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 6083 _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 608A _ 83. 7D, F4, 00
        jz      ?_378                                   ; 608E _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 6090 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 6093 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 6095 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 6099 _ C7. 04 24, 00000000
        call    farjmp                                  ; 60A0 _ E8, FFFFFFFC(rel)
?_378:  mov     eax, dword [ebp-10H]                    ; 60A5 _ 8B. 45, F0
        leave                                           ; 60A8 _ C9
        ret                                             ; 60A9 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 60AA _ 55
        mov     ebp, esp                                ; 60AB _ 89. E5
        sub     esp, 16                                 ; 60AD _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 60B0 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 60B6 _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 60BB _ 8B. 10
        mov     eax, edx                                ; 60BD _ 89. D0
        add     eax, eax                                ; 60BF _ 01. C0
        add     eax, edx                                ; 60C1 _ 01. D0
        shl     eax, 4                                  ; 60C3 _ C1. E0, 04
        add     eax, ecx                                ; 60C6 _ 01. C8
        add     eax, 8                                  ; 60C8 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 60CB _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 60CE _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 60D1 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 60D4 _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 60D7 _ 8B. 44 90, 08
        leave                                           ; 60DB _ C9
        ret                                             ; 60DC _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 60DD _ 55
        mov     ebp, esp                                ; 60DE _ 89. E5
        sub     esp, 16                                 ; 60E0 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 60E3 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp+8H]                     ; 60E9 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 60EC _ 8B. 50, 0C
        mov     eax, edx                                ; 60EF _ 89. D0
        add     eax, eax                                ; 60F1 _ 01. C0
        add     eax, edx                                ; 60F3 _ 01. D0
        shl     eax, 4                                  ; 60F5 _ C1. E0, 04
        add     eax, ecx                                ; 60F8 _ 01. C8
        add     eax, 8                                  ; 60FA _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 60FD _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 6100 _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 6103 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 6105 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 6108 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 610B _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 610F _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 6112 _ 8B. 00
        lea     edx, [eax+1H]                           ; 6114 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 6117 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 611A _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 611C _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 611F _ C7. 40, 04, 00000002
        nop                                             ; 6126 _ 90
        leave                                           ; 6127 _ C9
        ret                                             ; 6128 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 6129 _ 55
        mov     ebp, esp                                ; 612A _ 89. E5
        sub     esp, 16                                 ; 612C _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 612F _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp+8H]                     ; 6135 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 6138 _ 8B. 50, 0C
        mov     eax, edx                                ; 613B _ 89. D0
        add     eax, eax                                ; 613D _ 01. C0
        add     eax, edx                                ; 613F _ 01. D0
        shl     eax, 4                                  ; 6141 _ C1. E0, 04
        add     eax, ecx                                ; 6144 _ 01. C8
        add     eax, 8                                  ; 6146 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 6149 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 614C _ C7. 45, F8, 00000000
        jmp     ?_381                                   ; 6153 _ EB, 23

?_379:  mov     eax, dword [ebp-4H]                     ; 6155 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 6158 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 615B _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 615F _ 3B. 45, 08
        jnz     ?_380                                   ; 6162 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 6164 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 6167 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 616A _ C7. 44 90, 08, 00000000
        jmp     ?_382                                   ; 6172 _ EB, 0E

?_380:  add     dword [ebp-8H], 1                       ; 6174 _ 83. 45, F8, 01
?_381:  mov     eax, dword [ebp-4H]                     ; 6178 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 617B _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 617D _ 3B. 45, F8
        jg      ?_379                                   ; 6180 _ 7F, D3
?_382:  mov     eax, dword [ebp-4H]                     ; 6182 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 6185 _ 8B. 00
        lea     edx, [eax-1H]                           ; 6187 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 618A _ 8B. 45, FC
        mov     dword [eax], edx                        ; 618D _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 618F _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 6192 _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 6195 _ 3B. 45, F8
        jle     ?_383                                   ; 6198 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 619A _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 619D _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 61A0 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 61A3 _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 61A6 _ 89. 50, 04
?_383:  mov     eax, dword [ebp-4H]                     ; 61A9 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 61AC _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 61AF _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 61B2 _ 8B. 00
        cmp     edx, eax                                ; 61B4 _ 39. C2
        jl      ?_384                                   ; 61B6 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 61B8 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 61BB _ C7. 40, 04, 00000000
?_384:  mov     eax, dword [ebp+8H]                     ; 61C2 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 61C5 _ C7. 40, 04, 00000001
        jmp     ?_386                                   ; 61CC _ EB, 1B

?_385:  mov     eax, dword [ebp-8H]                     ; 61CE _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 61D1 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 61D4 _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 61D7 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 61DB _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 61DE _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 61E1 _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 61E5 _ 83. 45, F8, 01
?_386:  mov     eax, dword [ebp-4H]                     ; 61E9 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 61EC _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 61EE _ 3B. 45, F8
        jg      ?_385                                   ; 61F1 _ 7F, DB
        nop                                             ; 61F3 _ 90
        leave                                           ; 61F4 _ C9
        ret                                             ; 61F5 _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 61F6 _ 55
        mov     ebp, esp                                ; 61F7 _ 89. E5
        sub     esp, 16                                 ; 61F9 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 61FC _ C7. 45, FC, 00000000
        jmp     ?_389                                   ; 6203 _ EB, 23

?_387:  mov     ecx, dword [taskctl]                    ; 6205 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 620B _ 8B. 55, FC
        mov     eax, edx                                ; 620E _ 89. D0
        add     eax, eax                                ; 6210 _ 01. C0
        add     eax, edx                                ; 6212 _ 01. D0
        shl     eax, 4                                  ; 6214 _ C1. E0, 04
        add     eax, ecx                                ; 6217 _ 01. C8
        add     eax, 8                                  ; 6219 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 621C _ 8B. 00
        test    eax, eax                                ; 621E _ 85. C0
        jle     ?_388                                   ; 6220 _ 7E, 02
        jmp     ?_390                                   ; 6222 _ EB, 0A

?_388:  add     dword [ebp-4H], 1                       ; 6224 _ 83. 45, FC, 01
?_389:  cmp     dword [ebp-4H], 9                       ; 6228 _ 83. 7D, FC, 09
        jle     ?_387                                   ; 622C _ 7E, D7
?_390:  mov     eax, dword [taskctl]                    ; 622E _ A1, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 6233 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 6236 _ 89. 10
        mov     eax, dword [taskctl]                    ; 6238 _ A1, 000022C8(d)
        mov     dword [eax+4H], 0                       ; 623D _ C7. 40, 04, 00000000
        leave                                           ; 6244 _ C9
        ret                                             ; 6245 _ C3
; task_switchsub End of function

send_message:; Function begin
        push    ebp                                     ; 6246 _ 55
        mov     ebp, esp                                ; 6247 _ 89. E5
        sub     esp, 24                                 ; 6249 _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 624C _ 8B. 45, 10
        movzx   eax, al                                 ; 624F _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 6252 _ 8B. 55, 0C
        add     edx, 16                                 ; 6255 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 6258 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 625C _ 89. 14 24
        call    fifo8_put                               ; 625F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 6264 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 6267 _ 89. 04 24
        call    task_sleep                              ; 626A _ E8, FFFFFFFC(rel)
        leave                                           ; 626F _ C9
        ret                                             ; 6270 _ C3
; send_message End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_391:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_392:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0008 _ task_a.

?_393:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 000F _ console.

?_394:                                                  ; byte
        db 20H, 00H                                     ; 0017 _  .

?_395:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0019 _ free .

?_396:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 001F _  KB.

?_397:                                                  ; byte
        db 3EH, 00H                                     ; 0023 _ >.

?_398:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 0025 _ mem.

?_399:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 0029 _ cls.

?_400:                                                  ; byte
        db 68H, 6CH, 74H, 00H                           ; 002D _ hlt.

?_401:                                                  ; byte
        db 68H, 6CH, 74H, 2EH, 65H, 78H, 65H, 00H       ; 0031 _ hlt.exe.

?_402:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 0039 _ dir.

?_403:                                                  ; byte
        db 65H, 78H, 69H, 74H, 00H                      ; 003D _ exit.

?_404:                                                  ; byte
        db 73H, 74H, 61H, 72H, 74H, 00H                 ; 0042 _ start.

?_405:                                                  ; byte
        db 6EH, 63H, 73H, 74H, 00H                      ; 0048 _ ncst.

?_406:                                                  ; byte
        db 63H, 72H, 61H, 63H, 6BH, 00H                 ; 004D _ crack.

?_407:                                                  ; byte
        db 63H, 72H, 61H, 63H, 6BH, 2EH, 65H, 78H       ; 0053 _ crack.ex
        db 65H, 00H                                     ; 005B _ e.

?_408:                                                  ; byte
        db 6BH, 65H, 79H, 62H, 6FH, 61H, 72H, 64H       ; 005D _ keyboard
        db 00H                                          ; 0065 _ .

?_409:                                                  ; byte
        db 75H, 73H, 65H, 72H, 20H, 70H, 72H, 6FH       ; 0066 _ user pro
        db 63H, 00H                                     ; 006E _ c.

?_410:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0070 _ page is:
        db 20H, 00H                                     ; 0078 _  .

?_411:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 007A _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0082 _ L: .

?_412:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0086 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 008E _ H: .

?_413:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0092 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 009A _ w: .

?_414:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 4FH, 43H, 00H            ; 009E _ INT OC.

?_415:                                                  ; byte
        db 53H, 74H, 61H, 63H, 6BH, 20H, 45H, 78H       ; 00A5 _ Stack Ex
        db 63H, 65H, 70H, 74H, 69H, 6FH, 6EH, 00H       ; 00AD _ ception.

?_416:                                                  ; byte
        db 45H, 49H, 50H, 20H, 3DH, 20H, 00H            ; 00B5 _ EIP = .

?_417:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 30H, 44H, 20H, 00H       ; 00BC _ INT 0D .

?_418:                                                  ; byte
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

?_419:  db 00H                                          ; 0112 _ .

?_420:  db 00H, 00H, 00H, 00H, 00H                      ; 0113 _ .....

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

table_rgb.2110:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0140 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0148 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0150 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0158 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0160 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0168 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0170 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0178 _ ........

cursor.2170:                                            ; byte
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

closebtn.2289:                                          ; byte
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

kernel_pos:                                             ; dword
        resd    1                                       ; 0014

bootInfo:                                               ; qword
        resb    4                                       ; 0018

?_421:  resw    1                                       ; 001C

?_422:  resw    1                                       ; 001E

keyinfo:                                                ; byte
        resb    24                                      ; 0020

?_423:  resd    1                                       ; 0038

mouseinfo:                                              ; byte
        resb    36                                      ; 003C

keybuf:                                                 ; yword
        resb    32                                      ; 0060

mousebuf:                                               ; byte
        resb    128                                     ; 0080

mdec:                                                   ; oword
        resb    12                                      ; 0100

?_424:  resd    1                                       ; 010C

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

task_a.1822:                                            ; dword
        resd    1                                       ; 027C

tss_a.1821:                                             ; byte
        resb    128                                     ; 0280

tss_b.1820:                                             ; byte
        resb    104                                     ; 0300

task_b.1810:                                            ; byte
        resb    12                                      ; 0368

str.2218:                                               ; byte
        resb    1                                       ; 0374

?_425:  resb    9                                       ; 0375

?_426:  resb    2                                       ; 037E

timerctl:                                               ; byte
        resd    2001                                    ; 0380

task_timer:                                             ; dword
        resd    1                                       ; 22C4

taskctl: resd   1                                       ; 22C8


