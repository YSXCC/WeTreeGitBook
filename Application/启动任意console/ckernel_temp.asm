; Disassembly of file: ckernel.o
; Tue Mar 24 14:07:24 2020
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
global cmd_hlt: function
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
global show_mouse_info: function
global initBootInfo: function
global showString: function
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
global g_hlt
global key_shift
global caps_lock
global first_task_cons_selector
global current_console

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
        sub     esp, 148                                ; 0004 _ 81. EC, 00000094
        mov     dword [esp], bootInfo                   ; 000A _ C7. 04 24, 00000014(d)
        call    initBootInfo                            ; 0011 _ E8, FFFFFFFC(rel)
        mov     eax, dword [bootInfo]                   ; 0016 _ A1, 00000014(d)
        mov     dword [ebp-1CH], eax                    ; 001B _ 89. 45, E4
        movzx   eax, word [?_393]                       ; 001E _ 0F B7. 05, 00000018(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 0000013C(d)
        movzx   eax, word [?_394]                       ; 002B _ 0F B7. 05, 0000001A(d)
        cwde                                            ; 0032 _ 98
        mov     dword [ysize], eax                      ; 0033 _ A3, 00000140(d)
        call    init_pit                                ; 0038 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 003D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf                ; 0045 _ C7. 44 24, 08, 0000012C(d)
        mov     dword [esp+4H], 8                       ; 004D _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo                  ; 0055 _ C7. 04 24, 00000110(d)
        call    fifo8_init                              ; 005C _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0061 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0066 _ 89. 45, E0
        mov     dword [esp+8H], 10                      ; 0069 _ C7. 44 24, 08, 0000000A
        mov     dword [esp+4H], timerinfo               ; 0071 _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-20H]                    ; 0079 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 007C _ 89. 04 24
        call    timer_init                              ; 007F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0084 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-20H]                    ; 008C _ 8B. 45, E0
        mov     dword [esp], eax                        ; 008F _ 89. 04 24
        call    timer_settime                           ; 0092 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0097 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 009C _ 89. 45, DC
        mov     dword [esp+8H], 2                       ; 009F _ C7. 44 24, 08, 00000002
        mov     dword [esp+4H], timerinfo               ; 00A7 _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-24H]                    ; 00AF _ 8B. 45, DC
        mov     dword [esp], eax                        ; 00B2 _ 89. 04 24
        call    timer_init                              ; 00B5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 00BA _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-24H]                    ; 00C2 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 00C5 _ 89. 04 24
        call    timer_settime                           ; 00C8 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 00CD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 00D2 _ 89. 45, D8
        mov     dword [esp+8H], 1                       ; 00D5 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo               ; 00DD _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-28H]                    ; 00E5 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 00E8 _ 89. 04 24
        call    timer_init                              ; 00EB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 00F0 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 00F8 _ 8B. 45, D8
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
        mov     dword [ebp-2CH], eax                    ; 015A _ 89. 45, D4
        call    get_adr_buffer                          ; 015D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0162 _ 89. 45, D0
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
        mov     edx, dword [ebp-1CH]                    ; 01A8 _ 8B. 55, E4
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
        mov     dword [esp+4H], ?_367                   ; 032A _ C7. 44 24, 04, 00000000(d)
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
        mov     dword [task_a.1818], eax                ; 039B _ A3, 0000027C(d)
        mov     eax, dword [task_a.1818]                ; 03A0 _ A1, 0000027C(d)
        mov     dword [?_395], eax                      ; 03A5 _ A3, 00000034(d)
        mov     eax, dword [task_a.1818]                ; 03AA _ A1, 0000027C(d)
        mov     dword [task_main], eax                  ; 03AF _ A3, 00000274(d)
        mov     eax, dword [task_a.1818]                ; 03B4 _ A1, 0000027C(d)
        mov     dword [esp+8H], 0                       ; 03B9 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], 0                       ; 03C1 _ C7. 44 24, 04, 00000000
        mov     dword [esp], eax                        ; 03C9 _ 89. 04 24
        call    task_run                                ; 03CC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 03D1 _ C7. 45, EC, 00000000
        mov     dword [esp], 0                          ; 03D8 _ C7. 04 24, 00000000
        call    launch_console                          ; 03DF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 03E4 _ 89. 45, CC
        add     dword [ebp-14H], 1                      ; 03E7 _ 83. 45, EC, 01
        mov     eax, dword [shtctl]                     ; 03EB _ A1, 00000264(d)
        mov     dword [esp+0CH], 2                      ; 03F0 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 03F8 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-34H]                    ; 0400 _ 8B. 55, CC
        mov     dword [esp+4H], edx                     ; 0403 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0407 _ 89. 04 24
        call    sheet_slide                             ; 040A _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 040F _ A1, 00000264(d)
        mov     dword [esp+8H], 2                       ; 0414 _ C7. 44 24, 08, 00000002
        mov     edx, dword [ebp-34H]                    ; 041C _ 8B. 55, CC
        mov     dword [esp+4H], edx                     ; 041F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0423 _ 89. 04 24
        call    sheet_updown                            ; 0426 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], 0                      ; 042B _ C7. 45, C8, 00000000
        mov     dword [ebp-3CH], 0                      ; 0432 _ C7. 45, C4, 00000000
        mov     dword [ebp-40H], 0                      ; 0439 _ C7. 45, C0, 00000000
        mov     dword [ebp-44H], 0                      ; 0440 _ C7. 45, BC, 00000000
        mov     dword [ebp-48H], 0                      ; 0447 _ C7. 45, B8, 00000000
        mov     dword [ebp-18H], 0                      ; 044E _ C7. 45, E8, 00000000
        mov     dword [ebp-4CH], 0                      ; 0455 _ C7. 45, B4, 00000000
        mov     dword [ebp-50H], 0                      ; 045C _ C7. 45, B0, 00000000
?_001:  mov     dword [esp], keyinfo                    ; 0463 _ C7. 04 24, 0000001C(d)
        call    fifo8_status                            ; 046A _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 046F _ 89. C3
        mov     dword [esp], mouseinfo                  ; 0471 _ C7. 04 24, 00000038(d)
        call    fifo8_status                            ; 0478 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 047D _ 01. C3
        mov     dword [esp], timerinfo                  ; 047F _ C7. 04 24, 00000110(d)
        call    fifo8_status                            ; 0486 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 048B _ 01. D8
        test    eax, eax                                ; 048D _ 85. C0
        jnz     ?_002                                   ; 048F _ 75, 0A
        call    io_sti                                  ; 0491 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 0496 _ E9, 0000040D

?_002:  mov     dword [esp], keyinfo                    ; 049B _ C7. 04 24, 0000001C(d)
        call    fifo8_status                            ; 04A2 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 04A7 _ 85. C0
        je      ?_013                                   ; 04A9 _ 0F 84, 000003C8
        call    io_sti                                  ; 04AF _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 04B4 _ C7. 04 24, 0000001C(d)
        call    fifo8_get                               ; 04BB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 04C0 _ 89. 45, C8
        mov     eax, dword [key_shift]                  ; 04C3 _ A1, 00000000(d)
        test    eax, eax                                ; 04C8 _ 85. C0
        jz      ?_003                                   ; 04CA _ 74, 58
        cmp     dword [ebp-38H], 17                     ; 04CC _ 83. 7D, C8, 11
        jnz     ?_003                                   ; 04D0 _ 75, 52
        mov     eax, dword [ebp-14H]                    ; 04D2 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 04D5 _ 89. 04 24
        call    launch_console                          ; 04D8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 04DD _ 89. 45, CC
        mov     eax, dword [shtctl]                     ; 04E0 _ A1, 00000264(d)
        mov     dword [esp+0CH], 176                    ; 04E5 _ C7. 44 24, 0C, 000000B0
        mov     dword [esp+8H], 156                     ; 04ED _ C7. 44 24, 08, 0000009C
        mov     edx, dword [ebp-34H]                    ; 04F5 _ 8B. 55, CC
        mov     dword [esp+4H], edx                     ; 04F8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04FC _ 89. 04 24
        call    sheet_slide                             ; 04FF _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0504 _ A1, 00000264(d)
        mov     dword [esp+8H], 1                       ; 0509 _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-34H]                    ; 0511 _ 8B. 55, CC
        mov     dword [esp+4H], edx                     ; 0514 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0518 _ 89. 04 24
        call    sheet_updown                            ; 051B _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 0520 _ 83. 45, EC, 01
?_003:  cmp     dword [ebp-38H], 255                    ; 0524 _ 81. 7D, C8, 000000FF
        jnz     ?_004                                   ; 052B _ 75, 21
        mov     eax, dword [current_console_task]       ; 052D _ A1, 00000278(d)
        test    eax, eax                                ; 0532 _ 85. C0
        jz      ?_004                                   ; 0534 _ 74, 18
        mov     eax, dword [current_console_task]       ; 0536 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 053B _ 8B. 80, 000000B4
        mov     dword [esp], eax                        ; 0541 _ 89. 04 24
        call    close_console                           ; 0544 _ E8, FFFFFFFC(rel)
        jmp     ?_018                                   ; 0549 _ E9, 00000449

?_004:  mov     eax, dword [ebp-38H]                    ; 054E _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0551 _ 89. 04 24
        call    transferScanCode                        ; 0554 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-38H], 16                     ; 0559 _ 83. 7D, C8, 10
        jnz     ?_005                                   ; 055D _ 75, 28
        mov     eax, dword [shtctl]                     ; 055F _ A1, 00000264(d)
        mov     eax, dword [eax+10H]                    ; 0564 _ 8B. 40, 10
        lea     ecx, [eax-1H]                           ; 0567 _ 8D. 48, FF
        mov     eax, dword [shtctl]                     ; 056A _ A1, 00000264(d)
        mov     edx, dword [eax+18H]                    ; 056F _ 8B. 50, 18
        mov     eax, dword [shtctl]                     ; 0572 _ A1, 00000264(d)
        mov     dword [esp+8H], ecx                     ; 0577 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 057B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 057F _ 89. 04 24
        call    sheet_updown                            ; 0582 _ E8, FFFFFFFC(rel)
?_005:  cmp     dword [ebp-38H], 15                     ; 0587 _ 83. 7D, C8, 0F
        jne     ?_011                                   ; 058B _ 0F 85, 000001B1
        mov     dword [ebp-54H], -1                     ; 0591 _ C7. 45, AC, FFFFFFFF
        cmp     dword [ebp-18H], 0                      ; 0598 _ 83. 7D, E8, 00
        jne     ?_009                                   ; 059C _ 0F 85, 000000B3
        mov     dword [ebp-18H], 1                      ; 05A2 _ C7. 45, E8, 00000001
        mov     eax, dword [current_console]            ; 05A9 _ A1, 00000000(d)
        cmp     eax, 1                                  ; 05AE _ 83. F8, 01
        jnz     ?_006                                   ; 05B1 _ 75, 0C
        mov     dword [current_console], 0              ; 05B3 _ C7. 05, 00000000(d), 00000000
        jmp     ?_007                                   ; 05BD _ EB, 0A

?_006:  mov     dword [current_console], 1              ; 05BF _ C7. 05, 00000000(d), 00000001
?_007:  mov     edx, dword [shtMsgBox]                  ; 05C9 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 05CF _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 05D4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_368                   ; 05DC _ C7. 44 24, 08, 00000008(d)
        mov     dword [esp+4H], edx                     ; 05E4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05E8 _ 89. 04 24
        call    make_wtitle8                            ; 05EB _ E8, FFFFFFFC(rel)
        mov     eax, dword [current_console_task]       ; 05F0 _ A1, 00000278(d)
        test    eax, eax                                ; 05F5 _ 85. C0
        jz      ?_008                                   ; 05F7 _ 74, 2C
        mov     eax, dword [current_console_task]       ; 05F9 _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 05FE _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 0604 _ A1, 00000264(d)
        mov     dword [esp+0CH], 1                      ; 0609 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_369                   ; 0611 _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], edx                     ; 0619 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 061D _ 89. 04 24
        call    make_wtitle8                            ; 0620 _ E8, FFFFFFFC(rel)
?_008:  mov     edx, dword [shtMsgBox]                  ; 0625 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 062B _ A1, 00000264(d)
        mov     dword [esp+10H], 7                      ; 0630 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 0638 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0640 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0643 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0647 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 064B _ 89. 04 24
        call    set_cursor                              ; 064E _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0653 _ EB, 63

?_009:  mov     dword [ebp-18H], 0                      ; 0655 _ C7. 45, E8, 00000000
        mov     edx, dword [shtMsgBox]                  ; 065C _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0662 _ A1, 00000264(d)
        mov     dword [esp+0CH], 1                      ; 0667 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_368                   ; 066F _ C7. 44 24, 08, 00000008(d)
        mov     dword [esp+4H], edx                     ; 0677 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 067B _ 89. 04 24
        call    make_wtitle8                            ; 067E _ E8, FFFFFFFC(rel)
        mov     eax, dword [current_console_task]       ; 0683 _ A1, 00000278(d)
        test    eax, eax                                ; 0688 _ 85. C0
        jz      ?_010                                   ; 068A _ 74, 2C
        mov     eax, dword [current_console_task]       ; 068C _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 0691 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 0697 _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 069C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_369                   ; 06A4 _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], edx                     ; 06AC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06B0 _ 89. 04 24
        call    make_wtitle8                            ; 06B3 _ E8, FFFFFFFC(rel)
?_010:  mov     eax, dword [shtMsgBox]                  ; 06B8 _ A1, 00000260(d)
        mov     ecx, dword [eax+4H]                     ; 06BD _ 8B. 48, 04
        mov     edx, dword [shtMsgBox]                  ; 06C0 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 06C6 _ A1, 00000264(d)
        mov     dword [esp+14H], 21                     ; 06CB _ C7. 44 24, 14, 00000015
        mov     dword [esp+10H], ecx                    ; 06D3 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 06D7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 06DF _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 06E7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06EB _ 89. 04 24
        call    sheet_refresh                           ; 06EE _ E8, FFFFFFFC(rel)
        mov     eax, dword [current_console_task]       ; 06F3 _ A1, 00000278(d)
        test    eax, eax                                ; 06F8 _ 85. C0
        jz      ?_011                                   ; 06FA _ 74, 46
        mov     eax, dword [current_console_task]       ; 06FC _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 0701 _ 8B. 80, 000000B4
        mov     ecx, dword [eax+4H]                     ; 0707 _ 8B. 48, 04
        mov     eax, dword [current_console_task]       ; 070A _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 070F _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 0715 _ A1, 00000264(d)
        mov     dword [esp+14H], 21                     ; 071A _ C7. 44 24, 14, 00000015
        mov     dword [esp+10H], ecx                    ; 0722 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 0726 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 072E _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0736 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 073A _ 89. 04 24
        call    sheet_refresh                           ; 073D _ E8, FFFFFFFC(rel)
?_011:  cmp     dword [ebp-18H], 0                      ; 0742 _ 83. 7D, E8, 00
        jne     ?_012                                   ; 0746 _ 0F 85, 000000D9
        mov     eax, dword [ebp-38H]                    ; 074C _ 8B. 45, C8
        mov     dword [esp], eax                        ; 074F _ 89. 04 24
        call    transferScanCode                        ; 0752 _ E8, FFFFFFFC(rel)
        test    al, al                                  ; 0757 _ 84. C0
        je      ?_014                                   ; 0759 _ 0F 84, 00000149
        cmp     dword [ebp-0CH], 143                    ; 075F _ 81. 7D, F4, 0000008F
        jg      ?_014                                   ; 0766 _ 0F 8F, 0000013C
        mov     edx, dword [shtMsgBox]                  ; 076C _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0772 _ A1, 00000264(d)
        mov     dword [esp+10H], 7                      ; 0777 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 077F _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0787 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 078A _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 078E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0792 _ 89. 04 24
        call    set_cursor                              ; 0795 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-38H]                    ; 079A _ 8B. 45, C8
        mov     dword [esp], eax                        ; 079D _ 89. 04 24
        call    transferScanCode                        ; 07A0 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-55H], al                      ; 07A5 _ 88. 45, AB
        movzx   eax, byte [ebp-55H]                     ; 07A8 _ 0F B6. 45, AB
        mov     byte [ebp-6AH], al                      ; 07AC _ 88. 45, 96
        mov     byte [ebp-69H], 0                       ; 07AF _ C6. 45, 97, 00
        mov     edx, dword [shtMsgBox]                  ; 07B3 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 07B9 _ A1, 00000264(d)
        lea     ecx, [ebp-6AH]                          ; 07BE _ 8D. 4D, 96
        mov     dword [esp+14H], ecx                    ; 07C1 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 07C5 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 28                     ; 07CD _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 07D5 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 07D8 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 07DC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07E0 _ 89. 04 24
        call    showString                              ; 07E3 _ E8, FFFFFFFC(rel)
        add     dword [ebp-0CH], 8                      ; 07E8 _ 83. 45, F4, 08
        mov     dword [ebp-48H], 1                      ; 07EC _ C7. 45, B8, 00000001
        mov     edx, dword [shtMsgBox]                  ; 07F3 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 07F9 _ A1, 00000264(d)
        mov     ecx, dword [ebp-10H]                    ; 07FE _ 8B. 4D, F0
        mov     dword [esp+10H], ecx                    ; 0801 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0805 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 080D _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0810 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0814 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0818 _ 89. 04 24
        call    set_cursor                              ; 081B _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 0820 _ E9, 00000083

?_012:  mov     eax, dword [ebp-38H]                    ; 0825 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0828 _ 89. 04 24
        call    isSpecialKey                            ; 082B _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0830 _ 85. C0
        jnz     ?_014                                   ; 0832 _ 75, 74
        mov     eax, dword [current_console_task]       ; 0834 _ A1, 00000278(d)
        test    eax, eax                                ; 0839 _ 85. C0
        jz      ?_014                                   ; 083B _ 74, 6B
        mov     eax, dword [ebp-38H]                    ; 083D _ 8B. 45, C8
        movzx   eax, al                                 ; 0840 _ 0F B6. C0
        mov     edx, dword [current_console_task]       ; 0843 _ 8B. 15, 00000278(d)
        add     edx, 16                                 ; 0849 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 084C _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 0850 _ 89. 14 24
        call    fifo8_put                               ; 0853 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0858 _ C7. 04 24, 0000001C(d)
        call    fifo8_status                            ; 085F _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0864 _ 85. C0
        jnz     ?_014                                   ; 0866 _ 75, 40
        mov     eax, dword [task_a.1818]                ; 0868 _ A1, 0000027C(d)
        mov     dword [esp], eax                        ; 086D _ 89. 04 24
        call    task_sleep                              ; 0870 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 0875 _ EB, 31

?_013:  mov     dword [esp], mouseinfo                  ; 0877 _ C7. 04 24, 00000038(d)
        call    fifo8_status                            ; 087E _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0883 _ 85. C0
        jz      ?_014                                   ; 0885 _ 74, 21
        mov     ecx, dword [sht_mouse]                  ; 0887 _ 8B. 0D, 0000026C(d)
        mov     edx, dword [sht_back]                   ; 088D _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 0893 _ A1, 00000264(d)
        mov     dword [esp+8H], ecx                     ; 0898 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 089C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08A0 _ 89. 04 24
        call    show_mouse_info                         ; 08A3 _ E8, FFFFFFFC(rel)
?_014:  mov     dword [esp], timerinfo                  ; 08A8 _ C7. 04 24, 00000110(d)
        call    fifo8_status                            ; 08AF _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 08B4 _ 85. C0
        je      ?_018                                   ; 08B6 _ 0F 84, 000000DB
        call    io_sti                                  ; 08BC _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo                  ; 08C1 _ C7. 04 24, 00000110(d)
        call    fifo8_get                               ; 08C8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-5CH], eax                    ; 08CD _ 89. 45, A4
        cmp     dword [ebp-5CH], 0                      ; 08D0 _ 83. 7D, A4, 00
        jz      ?_015                                   ; 08D4 _ 74, 24
        mov     dword [esp+8H], 0                       ; 08D6 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo               ; 08DE _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-28H]                    ; 08E6 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 08E9 _ 89. 04 24
        call    timer_init                              ; 08EC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 08F1 _ C7. 45, F0, 00000000
        jmp     ?_016                                   ; 08F8 _ EB, 22

?_015:  mov     dword [esp+8H], 1                       ; 08FA _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo               ; 0902 _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-28H]                    ; 090A _ 8B. 45, D8
        mov     dword [esp], eax                        ; 090D _ 89. 04 24
        call    timer_init                              ; 0910 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 7                      ; 0915 _ C7. 45, F0, 00000007
?_016:  mov     dword [esp+4H], 50                      ; 091C _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 0924 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0927 _ 89. 04 24
        call    timer_settime                           ; 092A _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-18H], 0                      ; 092F _ 83. 7D, E8, 00
        jnz     ?_017                                   ; 0933 _ 75, 2F
        mov     edx, dword [shtMsgBox]                  ; 0935 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 093B _ A1, 00000264(d)
        mov     ecx, dword [ebp-10H]                    ; 0940 _ 8B. 4D, F0
        mov     dword [esp+10H], ecx                    ; 0943 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0947 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 094F _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0952 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0956 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 095A _ 89. 04 24
        call    set_cursor                              ; 095D _ E8, FFFFFFFC(rel)
        jmp     ?_018                                   ; 0962 _ EB, 33

?_017:  mov     edx, dword [shtMsgBox]                  ; 0964 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 096A _ A1, 00000264(d)
        mov     dword [esp+10H], 7                      ; 096F _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 0977 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 097F _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0982 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0986 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 098A _ 89. 04 24
        call    set_cursor                              ; 098D _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0992 _ E9, FFFFFACC

?_018:  jmp     ?_001                                   ; 0997 _ E9, FFFFFAC7
; CMain End of function

set_cursor:; Function begin
        push    ebp                                     ; 099C _ 55
        mov     ebp, esp                                ; 099D _ 89. E5
        push    esi                                     ; 099F _ 56
        push    ebx                                     ; 09A0 _ 53
        sub     esp, 32                                 ; 09A1 _ 83. EC, 20
        mov     eax, dword [ebp+14H]                    ; 09A4 _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 09A7 _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 09AA _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 09AD _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 09B0 _ 8B. 45, 18
        movzx   ecx, al                                 ; 09B3 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 09B6 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 09B9 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 09BC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 09BF _ 8B. 00
        mov     dword [esp+18H], esi                    ; 09C1 _ 89. 74 24, 18
        mov     dword [esp+14H], ebx                    ; 09C5 _ 89. 5C 24, 14
        mov     ebx, dword [ebp+14H]                    ; 09C9 _ 8B. 5D, 14
        mov     dword [esp+10H], ebx                    ; 09CC _ 89. 5C 24, 10
        mov     ebx, dword [ebp+10H]                    ; 09D0 _ 8B. 5D, 10
        mov     dword [esp+0CH], ebx                    ; 09D3 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 09D7 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 09DB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 09DF _ 89. 04 24
        call    boxfill8                                ; 09E2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 09E7 _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 09EA _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 09ED _ 8B. 45, 10
        add     eax, 8                                  ; 09F0 _ 83. C0, 08
        mov     dword [esp+14H], edx                    ; 09F3 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 09F7 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 09FB _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 09FE _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 0A02 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 0A05 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0A09 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A0C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A10 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A13 _ 89. 04 24
        call    sheet_refresh                           ; 0A16 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A1B _ 83. C4, 20
        pop     ebx                                     ; 0A1E _ 5B
        pop     esi                                     ; 0A1F _ 5E
        pop     ebp                                     ; 0A20 _ 5D
        ret                                             ; 0A21 _ C3
; set_cursor End of function

isSpecialKey:; Function begin
        push    ebp                                     ; 0A22 _ 55
        mov     ebp, esp                                ; 0A23 _ 89. E5
        sub     esp, 24                                 ; 0A25 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 0A28 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A2B _ 89. 04 24
        call    transferScanCode                        ; 0A2E _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 58                      ; 0A33 _ 83. 7D, 08, 3A
        jz      ?_019                                   ; 0A37 _ 74, 2D
        cmp     dword [ebp+8H], 29                      ; 0A39 _ 83. 7D, 08, 1D
        jz      ?_019                                   ; 0A3D _ 74, 27
        cmp     dword [ebp+8H], 186                     ; 0A3F _ 81. 7D, 08, 000000BA
        jz      ?_019                                   ; 0A46 _ 74, 1E
        cmp     dword [ebp+8H], 42                      ; 0A48 _ 83. 7D, 08, 2A
        jz      ?_019                                   ; 0A4C _ 74, 18
        cmp     dword [ebp+8H], 54                      ; 0A4E _ 83. 7D, 08, 36
        jz      ?_019                                   ; 0A52 _ 74, 12
        cmp     dword [ebp+8H], 170                     ; 0A54 _ 81. 7D, 08, 000000AA
        jz      ?_019                                   ; 0A5B _ 74, 09
        cmp     dword [ebp+8H], 182                     ; 0A5D _ 81. 7D, 08, 000000B6
        jnz     ?_020                                   ; 0A64 _ 75, 07
?_019:  mov     eax, 1                                  ; 0A66 _ B8, 00000001
        jmp     ?_021                                   ; 0A6B _ EB, 05

?_020:  mov     eax, 0                                  ; 0A6D _ B8, 00000000
?_021:  leave                                           ; 0A72 _ C9
        ret                                             ; 0A73 _ C3
; isSpecialKey End of function

transferScanCode:; Function begin
        push    ebp                                     ; 0A74 _ 55
        mov     ebp, esp                                ; 0A75 _ 89. E5
        sub     esp, 16                                 ; 0A77 _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 0A7A _ 83. 7D, 08, 2A
        jnz     ?_022                                   ; 0A7E _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0A80 _ A1, 00000000(d)
        or      eax, 01H                                ; 0A85 _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 0A88 _ A3, 00000000(d)
?_022:  cmp     dword [ebp+8H], 54                      ; 0A8D _ 83. 7D, 08, 36
        jnz     ?_023                                   ; 0A91 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0A93 _ A1, 00000000(d)
        or      eax, 02H                                ; 0A98 _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 0A9B _ A3, 00000000(d)
?_023:  cmp     dword [ebp+8H], 170                     ; 0AA0 _ 81. 7D, 08, 000000AA
        jnz     ?_024                                   ; 0AA7 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0AA9 _ A1, 00000000(d)
        and     eax, 0FFFFFFFEH                         ; 0AAE _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 0AB1 _ A3, 00000000(d)
?_024:  cmp     dword [ebp+8H], 182                     ; 0AB6 _ 81. 7D, 08, 000000B6
        jnz     ?_025                                   ; 0ABD _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0ABF _ A1, 00000000(d)
        and     eax, 0FFFFFFFDH                         ; 0AC4 _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 0AC7 _ A3, 00000000(d)
?_025:  cmp     dword [ebp+8H], 58                      ; 0ACC _ 83. 7D, 08, 3A
        jnz     ?_027                                   ; 0AD0 _ 75, 1F
        mov     eax, dword [caps_lock]                  ; 0AD2 _ A1, 00000000(d)
        test    eax, eax                                ; 0AD7 _ 85. C0
        jnz     ?_026                                   ; 0AD9 _ 75, 0C
        mov     dword [caps_lock], 1                    ; 0ADB _ C7. 05, 00000000(d), 00000001
        jmp     ?_027                                   ; 0AE5 _ EB, 0A

?_026:  mov     dword [caps_lock], 0                    ; 0AE7 _ C7. 05, 00000000(d), 00000000
?_027:  cmp     dword [ebp+8H], 42                      ; 0AF1 _ 83. 7D, 08, 2A
        jz      ?_028                                   ; 0AF5 _ 74, 24
        cmp     dword [ebp+8H], 54                      ; 0AF7 _ 83. 7D, 08, 36
        jz      ?_028                                   ; 0AFB _ 74, 1E
        cmp     dword [ebp+8H], 170                     ; 0AFD _ 81. 7D, 08, 000000AA
        jz      ?_028                                   ; 0B04 _ 74, 15
        cmp     dword [ebp+8H], 182                     ; 0B06 _ 81. 7D, 08, 000000B6
        jz      ?_028                                   ; 0B0D _ 74, 0C
        cmp     dword [ebp+8H], 83                      ; 0B0F _ 83. 7D, 08, 53
        jg      ?_028                                   ; 0B13 _ 7F, 06
        cmp     dword [ebp+8H], 58                      ; 0B15 _ 83. 7D, 08, 3A
        jnz     ?_029                                   ; 0B19 _ 75, 0A
?_028:  mov     eax, 0                                  ; 0B1B _ B8, 00000000
        jmp     ?_034                                   ; 0B20 _ E9, 00000089

?_029:  mov     byte [ebp-1H], 0                        ; 0B25 _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 0B29 _ A1, 00000000(d)
        test    eax, eax                                ; 0B2E _ 85. C0
        jnz     ?_031                                   ; 0B30 _ 75, 46
        cmp     dword [ebp+8H], 83                      ; 0B32 _ 83. 7D, 08, 53
        jg      ?_031                                   ; 0B36 _ 7F, 40
        mov     eax, dword [ebp+8H]                     ; 0B38 _ 8B. 45, 08
        add     eax, keytable                           ; 0B3B _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0B40 _ 0F B6. 00
        test    al, al                                  ; 0B43 _ 84. C0
        jz      ?_031                                   ; 0B45 _ 74, 31
        mov     eax, dword [ebp+8H]                     ; 0B47 _ 8B. 45, 08
        add     eax, keytable                           ; 0B4A _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0B4F _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0B52 _ 88. 45, FF
        cmp     byte [ebp-1H], 64                       ; 0B55 _ 80. 7D, FF, 40
        jle     ?_030                                   ; 0B59 _ 7E, 1B
        cmp     byte [ebp-1H], 90                       ; 0B5B _ 80. 7D, FF, 5A
        jg      ?_030                                   ; 0B5F _ 7F, 15
        mov     eax, dword [caps_lock]                  ; 0B61 _ A1, 00000000(d)
        test    eax, eax                                ; 0B66 _ 85. C0
        jnz     ?_030                                   ; 0B68 _ 75, 0C
        movzx   eax, byte [ebp-1H]                      ; 0B6A _ 0F B6. 45, FF
        add     eax, 32                                 ; 0B6E _ 83. C0, 20
        mov     byte [ebp-1H], al                       ; 0B71 _ 88. 45, FF
        jmp     ?_033                                   ; 0B74 _ EB, 34

?_030:  jmp     ?_033                                   ; 0B76 _ EB, 32

?_031:  mov     eax, dword [key_shift]                  ; 0B78 _ A1, 00000000(d)
        test    eax, eax                                ; 0B7D _ 85. C0
        jz      ?_032                                   ; 0B7F _ 74, 25
        cmp     dword [ebp+8H], 127                     ; 0B81 _ 83. 7D, 08, 7F
        jg      ?_032                                   ; 0B85 _ 7F, 1F
        mov     eax, dword [ebp+8H]                     ; 0B87 _ 8B. 45, 08
        add     eax, keytable1                          ; 0B8A _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0B8F _ 0F B6. 00
        test    al, al                                  ; 0B92 _ 84. C0
        jz      ?_032                                   ; 0B94 _ 74, 10
        mov     eax, dword [ebp+8H]                     ; 0B96 _ 8B. 45, 08
        add     eax, keytable1                          ; 0B99 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0B9E _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0BA1 _ 88. 45, FF
        jmp     ?_033                                   ; 0BA4 _ EB, 04

?_032:  mov     byte [ebp-1H], 0                        ; 0BA6 _ C6. 45, FF, 00
?_033:  movzx   eax, byte [ebp-1H]                      ; 0BAA _ 0F B6. 45, FF
?_034:  leave                                           ; 0BAE _ C9
        ret                                             ; 0BAF _ C3
; transferScanCode End of function

launch_console:; Function begin
        push    ebp                                     ; 0BB0 _ 55
        mov     ebp, esp                                ; 0BB1 _ 89. E5
        push    ebx                                     ; 0BB3 _ 53
        sub     esp, 52                                 ; 0BB4 _ 83. EC, 34
        mov     eax, dword [shtctl]                     ; 0BB7 _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 0BBC _ 89. 04 24
        call    sheet_alloc                             ; 0BBF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0BC4 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 0BC7 _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 0BCC _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 0BD4 _ 89. 04 24
        call    memman_alloc_4k                         ; 0BD7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0BDC _ 89. 45, F0
        mov     dword [esp+10H], 99                     ; 0BDF _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 0BE7 _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 0BEF _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-10H]                    ; 0BF7 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 0BFA _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 0BFE _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0C01 _ 89. 04 24
        call    sheet_setbuf                            ; 0C04 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 0                       ; 0C09 _ 83. 7D, 08, 00
        jle     ?_035                                   ; 0C0D _ 7E, 26
        mov     eax, dword [shtctl]                     ; 0C0F _ A1, 00000264(d)
        mov     dword [esp+0CH], 1                      ; 0C14 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_369                   ; 0C1C _ C7. 44 24, 08, 0000000F(d)
        mov     edx, dword [ebp-0CH]                    ; 0C24 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C27 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C2B _ 89. 04 24
        call    make_window8                            ; 0C2E _ E8, FFFFFFFC(rel)
        jmp     ?_036                                   ; 0C33 _ EB, 24

?_035:  mov     eax, dword [shtctl]                     ; 0C35 _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 0C3A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_369                   ; 0C42 _ C7. 44 24, 08, 0000000F(d)
        mov     edx, dword [ebp-0CH]                    ; 0C4A _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C4D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C51 _ 89. 04 24
        call    make_window8                            ; 0C54 _ E8, FFFFFFFC(rel)
?_036:  mov     eax, dword [ebp-0CH]                    ; 0C59 _ 8B. 45, F4
        mov     ecx, dword [eax+8H]                     ; 0C5C _ 8B. 48, 08
        mov     eax, dword [ebp-0CH]                    ; 0C5F _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 0C62 _ 8B. 50, 04
        mov     eax, dword [shtctl]                     ; 0C65 _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 0C6A _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0C6E _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 0C72 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0C7A _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 0C82 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C85 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C89 _ 89. 04 24
        call    sheet_refresh                           ; 0C8C _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 0C91 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 0C99 _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 0CA1 _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 0CA9 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 0CB1 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 0CB9 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0CBC _ 89. 04 24
        call    make_textbox8                           ; 0CBF _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 0CC4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0CC9 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 0CCC _ 8B. 45, EC
        mov     edx, dword [ebp-0CH]                    ; 0CCF _ 8B. 55, F4
        mov     dword [eax+0B4H], edx                   ; 0CD2 _ 89. 90, 000000B4
        mov     eax, dword [ebp-0CH]                    ; 0CD8 _ 8B. 45, F4
        mov     edx, dword [ebp-14H]                    ; 0CDB _ 8B. 55, EC
        mov     dword [eax+20H], edx                    ; 0CDE _ 89. 50, 20
        mov     eax, dword [current_console_task]       ; 0CE1 _ A1, 00000278(d)
        test    eax, eax                                ; 0CE6 _ 85. C0
        jz      ?_037                                   ; 0CE8 _ 74, 7C
        mov     eax, dword [current_console_task]       ; 0CEA _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 0CEF _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 0CF5 _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 0CFA _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_369                   ; 0D02 _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], edx                     ; 0D0A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0D0E _ 89. 04 24
        call    make_wtitle8                            ; 0D11 _ E8, FFFFFFFC(rel)
        mov     eax, dword [current_console_task]       ; 0D16 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 0D1B _ 8B. 80, 000000B4
        mov     ebx, dword [eax+8H]                     ; 0D21 _ 8B. 58, 08
        mov     eax, dword [current_console_task]       ; 0D24 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 0D29 _ 8B. 80, 000000B4
        mov     ecx, dword [eax+4H]                     ; 0D2F _ 8B. 48, 04
        mov     eax, dword [current_console_task]       ; 0D32 _ A1, 00000278(d)
        mov     edx, dword [eax+0B4H]                   ; 0D37 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 0D3D _ A1, 00000264(d)
        mov     dword [esp+14H], ebx                    ; 0D42 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 0D46 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 0D4A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0D52 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0D5A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0D5E _ 89. 04 24
        call    sheet_refresh                           ; 0D61 _ E8, FFFFFFFC(rel)
?_037:  mov     eax, dword [ebp-14H]                    ; 0D66 _ 8B. 45, EC
        mov     dword [current_console_task], eax       ; 0D69 _ A3, 00000278(d)
        call    get_code32_addr                         ; 0D6E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0D73 _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 0D76 _ 8B. 45, EC
        mov     dword [eax+8CH], 0                      ; 0D79 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-14H]                    ; 0D83 _ 8B. 45, EC
        mov     dword [eax+90H], 1073741824             ; 0D86 _ C7. 80, 00000090, 40000000
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
        mov     dword [esp+8H], 5                       ; 0E40 _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 0E48 _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-14H]                    ; 0E50 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0E53 _ 89. 04 24
        call    task_run                                ; 0E56 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 0                       ; 0E5B _ 83. 7D, 08, 00
        jnz     ?_038                                   ; 0E5F _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 0E61 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 0E64 _ 8B. 00
        mov     dword [first_task_cons_selector], eax   ; 0E66 _ A3, 00000000(d)
?_038:  mov     eax, dword [ebp-0CH]                    ; 0E6B _ 8B. 45, F4
        add     esp, 52                                 ; 0E6E _ 83. C4, 34
        pop     ebx                                     ; 0E71 _ 5B
        pop     ebp                                     ; 0E72 _ 5D
        ret                                             ; 0E73 _ C3
; launch_console End of function

kill_process:; Function begin
        push    ebp                                     ; 0E74 _ 55
        mov     ebp, esp                                ; 0E75 _ 89. E5
        sub     esp, 40                                 ; 0E77 _ 83. EC, 28
        call    task_now                                ; 0E7A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0E7F _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 0E82 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 0E85 _ 8B. 90, 00000094
        mov     eax, dword [ebp-0CH]                    ; 0E8B _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 0E8E _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 0E94 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0E98 _ 89. 04 24
        call    cons_newline                            ; 0E9B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 0EA0 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 0EA3 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 0EA9 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 0EAC _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 0EAF _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 0EB5 _ 8B. 45, F4
        add     eax, 48                                 ; 0EB8 _ 83. C0, 30
        mov     dword [esp], eax                        ; 0EBB _ 89. 04 24
        call    asm_end_app                             ; 0EBE _ E8, FFFFFFFC(rel)
        leave                                           ; 0EC3 _ C9
        ret                                             ; 0EC4 _ C3
; kill_process End of function

cmd_dir:; Function begin
        push    ebp                                     ; 0EC5 _ 55
        mov     ebp, esp                                ; 0EC6 _ 89. E5
        push    ebx                                     ; 0EC8 _ 53
        sub     esp, 68                                 ; 0EC9 _ 83. EC, 44
        call    task_now                                ; 0ECC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0ED1 _ 89. 45, E8
        mov     dword [ebp-0CH], 78848                  ; 0ED4 _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 0EDB _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 0EE0 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 0EE8 _ 89. 04 24
        call    memman_alloc                            ; 0EEB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0EF0 _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 0EF3 _ 8B. 45, E4
        add     eax, 12                                 ; 0EF6 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0EF9 _ C6. 00, 00
        jmp     ?_046                                   ; 0EFC _ E9, 0000013C

?_039:  mov     dword [ebp-10H], 0                      ; 0F01 _ C7. 45, F0, 00000000
        jmp     ?_042                                   ; 0F08 _ EB, 2C

?_040:  mov     edx, dword [ebp-0CH]                    ; 0F0A _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 0F0D _ 8B. 45, F0
        add     eax, edx                                ; 0F10 _ 01. D0
        movzx   eax, byte [eax]                         ; 0F12 _ 0F B6. 00
        test    al, al                                  ; 0F15 _ 84. C0
        jz      ?_041                                   ; 0F17 _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 0F19 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0F1C _ 8B. 45, E4
        add     edx, eax                                ; 0F1F _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 0F21 _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 0F24 _ 8B. 45, F0
        add     eax, ecx                                ; 0F27 _ 01. C8
        movzx   eax, byte [eax]                         ; 0F29 _ 0F B6. 00
        mov     byte [edx], al                          ; 0F2C _ 88. 02
        add     dword [ebp-10H], 1                      ; 0F2E _ 83. 45, F0, 01
        jmp     ?_042                                   ; 0F32 _ EB, 02

?_041:  jmp     ?_043                                   ; 0F34 _ EB, 06

?_042:  cmp     dword [ebp-10H], 7                      ; 0F36 _ 83. 7D, F0, 07
        jle     ?_040                                   ; 0F3A _ 7E, CE
?_043:  mov     dword [ebp-14H], 0                      ; 0F3C _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 0F43 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0F46 _ 8B. 45, E4
        add     eax, edx                                ; 0F49 _ 01. D0
        mov     byte [eax], 46                          ; 0F4B _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 0F4E _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 0F52 _ C7. 45, EC, 00000000
        jmp     ?_045                                   ; 0F59 _ EB, 1E

?_044:  mov     edx, dword [ebp-10H]                    ; 0F5B _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0F5E _ 8B. 45, E4
        add     edx, eax                                ; 0F61 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 0F63 _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 0F66 _ 8B. 45, EC
        add     eax, ecx                                ; 0F69 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 0F6B _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 0F6F _ 88. 02
        add     dword [ebp-10H], 1                      ; 0F71 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 0F75 _ 83. 45, EC, 01
?_045:  cmp     dword [ebp-14H], 2                      ; 0F79 _ 83. 7D, EC, 02
        jle     ?_044                                   ; 0F7D _ 7E, DC
        mov     eax, dword [ebp-18H]                    ; 0F7F _ 8B. 45, E8
        mov     ecx, dword [eax+9CH]                    ; 0F82 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-18H]                    ; 0F88 _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 0F8B _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 0F91 _ A1, 00000264(d)
        mov     ebx, dword [ebp-1CH]                    ; 0F96 _ 8B. 5D, E4
        mov     dword [esp+14H], ebx                    ; 0F99 _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 0F9D _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 0FA5 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 0FA9 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 0FB1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0FB5 _ 89. 04 24
        call    showString                              ; 0FB8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], 136                    ; 0FBD _ C7. 45, E0, 00000088
        mov     eax, dword [ebp-0CH]                    ; 0FC4 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 0FC7 _ 8B. 40, 1C
        mov     dword [esp], eax                        ; 0FCA _ 89. 04 24
        call    intToHexStr                             ; 0FCD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 0FD2 _ 89. 45, DC
        mov     eax, dword [ebp-18H]                    ; 0FD5 _ 8B. 45, E8
        mov     ecx, dword [eax+9CH]                    ; 0FD8 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-18H]                    ; 0FDE _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 0FE1 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 0FE7 _ A1, 00000264(d)
        mov     ebx, dword [ebp-24H]                    ; 0FEC _ 8B. 5D, DC
        mov     dword [esp+14H], ebx                    ; 0FEF _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 0FF3 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 0FFB _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-20H]                    ; 0FFF _ 8B. 4D, E0
        mov     dword [esp+8H], ecx                     ; 1002 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1006 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 100A _ 89. 04 24
        call    showString                              ; 100D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 1012 _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 1015 _ 8B. 90, 00000094
        mov     eax, dword [ebp-18H]                    ; 101B _ 8B. 45, E8
        mov     eax, dword [eax+9CH]                    ; 101E _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 1024 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1028 _ 89. 04 24
        call    cons_newline                            ; 102B _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-18H]                    ; 1030 _ 8B. 55, E8
        mov     dword [edx+9CH], eax                    ; 1033 _ 89. 82, 0000009C
        add     dword [ebp-0CH], 32                     ; 1039 _ 83. 45, F4, 20
?_046:  mov     eax, dword [ebp-0CH]                    ; 103D _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 1040 _ 0F B6. 00
        test    al, al                                  ; 1043 _ 84. C0
        jne     ?_039                                   ; 1045 _ 0F 85, FFFFFEB6
        mov     edx, dword [ebp-1CH]                    ; 104B _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 104E _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 1053 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 105B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 105F _ 89. 04 24
        call    memman_free                             ; 1062 _ E8, FFFFFFFC(rel)
        add     esp, 68                                 ; 1067 _ 83. C4, 44
        pop     ebx                                     ; 106A _ 5B
        pop     ebp                                     ; 106B _ 5D
        ret                                             ; 106C _ C3
; cmd_dir End of function

cmd_type:; Function begin
        push    ebp                                     ; 106D _ 55
        mov     ebp, esp                                ; 106E _ 89. E5
        push    esi                                     ; 1070 _ 56
        push    ebx                                     ; 1071 _ 53
        sub     esp, 96                                 ; 1072 _ 83. EC, 60
        call    task_now                                ; 1075 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 107A _ 89. 45, DC
        mov     eax, dword [memman]                     ; 107D _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 1082 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 108A _ 89. 04 24
        call    memman_alloc                            ; 108D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 1092 _ 89. 45, D8
        mov     eax, dword [ebp-28H]                    ; 1095 _ 8B. 45, D8
        add     eax, 12                                 ; 1098 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 109B _ C6. 00, 00
        mov     dword [ebp-0CH], 0                      ; 109E _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 5                      ; 10A5 _ C7. 45, F0, 00000005
        mov     dword [ebp-10H], 5                      ; 10AC _ C7. 45, F0, 00000005
        jmp     ?_049                                   ; 10B3 _ EB, 30

?_047:  mov     edx, dword [ebp-10H]                    ; 10B5 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 10B8 _ 8B. 45, 08
        add     eax, edx                                ; 10BB _ 01. D0
        movzx   eax, byte [eax]                         ; 10BD _ 0F B6. 00
        test    al, al                                  ; 10C0 _ 84. C0
        jz      ?_048                                   ; 10C2 _ 74, 1F
        mov     edx, dword [ebp-0CH]                    ; 10C4 _ 8B. 55, F4
        mov     eax, dword [ebp-28H]                    ; 10C7 _ 8B. 45, D8
        add     edx, eax                                ; 10CA _ 01. C2
        mov     ecx, dword [ebp-10H]                    ; 10CC _ 8B. 4D, F0
        mov     eax, dword [ebp+8H]                     ; 10CF _ 8B. 45, 08
        add     eax, ecx                                ; 10D2 _ 01. C8
        movzx   eax, byte [eax]                         ; 10D4 _ 0F B6. 00
        mov     byte [edx], al                          ; 10D7 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 10D9 _ 83. 45, F4, 01
        add     dword [ebp-10H], 1                      ; 10DD _ 83. 45, F0, 01
        jmp     ?_049                                   ; 10E1 _ EB, 02

?_048:  jmp     ?_050                                   ; 10E3 _ EB, 06

?_049:  cmp     dword [ebp-10H], 16                     ; 10E5 _ 83. 7D, F0, 10
        jle     ?_047                                   ; 10E9 _ 7E, CA
?_050:  mov     edx, dword [ebp-0CH]                    ; 10EB _ 8B. 55, F4
        mov     eax, dword [ebp-28H]                    ; 10EE _ 8B. 45, D8
        add     eax, edx                                ; 10F1 _ 01. D0
        mov     byte [eax], 0                           ; 10F3 _ C6. 00, 00
        mov     dword [ebp-14H], 78848                  ; 10F6 _ C7. 45, EC, 00013400
        jmp     ?_066                                   ; 10FD _ E9, 000002A2

?_051:  mov     byte [ebp-31H], 0                       ; 1102 _ C6. 45, CF, 00
        mov     dword [ebp-18H], 0                      ; 1106 _ C7. 45, E8, 00000000
        jmp     ?_054                                   ; 110D _ EB, 2C

?_052:  mov     edx, dword [ebp-14H]                    ; 110F _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 1112 _ 8B. 45, E8
        add     eax, edx                                ; 1115 _ 01. D0
        movzx   eax, byte [eax]                         ; 1117 _ 0F B6. 00
        test    al, al                                  ; 111A _ 84. C0
        jz      ?_053                                   ; 111C _ 74, 1B
        mov     edx, dword [ebp-14H]                    ; 111E _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 1121 _ 8B. 45, E8
        add     eax, edx                                ; 1124 _ 01. D0
        movzx   eax, byte [eax]                         ; 1126 _ 0F B6. 00
        lea     ecx, [ebp-3DH]                          ; 1129 _ 8D. 4D, C3
        mov     edx, dword [ebp-18H]                    ; 112C _ 8B. 55, E8
        add     edx, ecx                                ; 112F _ 01. CA
        mov     byte [edx], al                          ; 1131 _ 88. 02
        add     dword [ebp-18H], 1                      ; 1133 _ 83. 45, E8, 01
        jmp     ?_054                                   ; 1137 _ EB, 02

?_053:  jmp     ?_055                                   ; 1139 _ EB, 06

?_054:  cmp     dword [ebp-18H], 7                      ; 113B _ 83. 7D, E8, 07
        jle     ?_052                                   ; 113F _ 7E, CE
?_055:  mov     dword [ebp-1CH], 0                      ; 1141 _ C7. 45, E4, 00000000
        lea     edx, [ebp-3DH]                          ; 1148 _ 8D. 55, C3
        mov     eax, dword [ebp-18H]                    ; 114B _ 8B. 45, E8
        add     eax, edx                                ; 114E _ 01. D0
        mov     byte [eax], 46                          ; 1150 _ C6. 00, 2E
        add     dword [ebp-18H], 1                      ; 1153 _ 83. 45, E8, 01
        mov     dword [ebp-1CH], 0                      ; 1157 _ C7. 45, E4, 00000000
        jmp     ?_057                                   ; 115E _ EB, 1E

?_056:  mov     edx, dword [ebp-14H]                    ; 1160 _ 8B. 55, EC
        mov     eax, dword [ebp-1CH]                    ; 1163 _ 8B. 45, E4
        add     eax, edx                                ; 1166 _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 1168 _ 0F B6. 40, 08
        lea     ecx, [ebp-3DH]                          ; 116C _ 8D. 4D, C3
        mov     edx, dword [ebp-18H]                    ; 116F _ 8B. 55, E8
        add     edx, ecx                                ; 1172 _ 01. CA
        mov     byte [edx], al                          ; 1174 _ 88. 02
        add     dword [ebp-18H], 1                      ; 1176 _ 83. 45, E8, 01
        add     dword [ebp-1CH], 1                      ; 117A _ 83. 45, E4, 01
?_057:  cmp     dword [ebp-1CH], 2                      ; 117E _ 83. 7D, E4, 02
        jle     ?_056                                   ; 1182 _ 7E, DC
        lea     eax, [ebp-3DH]                          ; 1184 _ 8D. 45, C3
        mov     dword [esp+4H], eax                     ; 1187 _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 118B _ 8B. 45, D8
        mov     dword [esp], eax                        ; 118E _ 89. 04 24
        call    strcmp                                  ; 1191 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1196 _ 83. F8, 01
        jne     ?_065                                   ; 1199 _ 0F 85, 00000201
        mov     dword [ebp-2CH], 88064                  ; 119F _ C7. 45, D4, 00015800
        mov     eax, dword [ebp-14H]                    ; 11A6 _ 8B. 45, EC
        movzx   eax, word [eax+1AH]                     ; 11A9 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 11AD _ 0F B7. C0
        shl     eax, 9                                  ; 11B0 _ C1. E0, 09
        add     dword [ebp-2CH], eax                    ; 11B3 _ 01. 45, D4
        mov     eax, dword [ebp-14H]                    ; 11B6 _ 8B. 45, EC
        mov     eax, dword [eax+1CH]                    ; 11B9 _ 8B. 40, 1C
        mov     dword [ebp-30H], eax                    ; 11BC _ 89. 45, D0
        mov     dword [ebp-20H], 0                      ; 11BF _ C7. 45, E0, 00000000
        mov     eax, dword [ebp-24H]                    ; 11C6 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 11C9 _ C7. 80, 00000098, 00000010
        mov     dword [ebp-20H], 0                      ; 11D3 _ C7. 45, E0, 00000000
        jmp     ?_064                                   ; 11DA _ E9, 000001B2

?_058:  mov     edx, dword [ebp-20H]                    ; 11DF _ 8B. 55, E0
        mov     eax, dword [ebp-2CH]                    ; 11E2 _ 8B. 45, D4
        add     eax, edx                                ; 11E5 _ 01. D0
        movzx   eax, byte [eax]                         ; 11E7 _ 0F B6. 00
        mov     byte [ebp-3FH], al                      ; 11EA _ 88. 45, C1
        mov     byte [ebp-3EH], 0                       ; 11ED _ C6. 45, C2, 00
        movzx   eax, byte [ebp-3FH]                     ; 11F1 _ 0F B6. 45, C1
        cmp     al, 9                                   ; 11F5 _ 3C, 09
        jne     ?_061                                   ; 11F7 _ 0F 85, 000000A7
?_059:  mov     eax, dword [ebp-24H]                    ; 11FD _ 8B. 45, DC
        mov     ebx, dword [eax+9CH]                    ; 1200 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-24H]                    ; 1206 _ 8B. 45, DC
        mov     ecx, dword [eax+98H]                    ; 1209 _ 8B. 88, 00000098
        mov     eax, dword [ebp-24H]                    ; 120F _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1212 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1218 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_370                  ; 121D _ C7. 44 24, 14, 00000017(d)
        mov     dword [esp+10H], 7                      ; 1225 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 122D _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1231 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1235 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1239 _ 89. 04 24
        call    showString                              ; 123C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 1241 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 1244 _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 124A _ 8D. 50, 08
        mov     eax, dword [ebp-24H]                    ; 124D _ 8B. 45, DC
        mov     dword [eax+98H], edx                    ; 1250 _ 89. 90, 00000098
        mov     eax, dword [ebp-24H]                    ; 1256 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 1259 _ 8B. 80, 00000098
        cmp     eax, 248                                ; 125F _ 3D, 000000F8
        jnz     ?_060                                   ; 1264 _ 75, 39
        mov     eax, dword [ebp-24H]                    ; 1266 _ 8B. 45, DC
        mov     dword [eax+98H], 8                      ; 1269 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-24H]                    ; 1273 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1276 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 127C _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 127F _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 1285 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1289 _ 89. 04 24
        call    cons_newline                            ; 128C _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 1291 _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 1294 _ 89. 82, 0000009C
        jmp     ?_059                                   ; 129A _ E9, FFFFFF5E

?_060:  jmp     ?_059                                   ; 129F _ E9, FFFFFF59

?_061:  movzx   eax, byte [ebp-3FH]                     ; 12A4 _ 0F B6. 45, C1
        cmp     al, 10                                  ; 12A8 _ 3C, 0A
        jnz     ?_062                                   ; 12AA _ 75, 39
        mov     eax, dword [ebp-24H]                    ; 12AC _ 8B. 45, DC
        mov     dword [eax+98H], 8                      ; 12AF _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-24H]                    ; 12B9 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 12BC _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 12C2 _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 12C5 _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 12CB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 12CF _ 89. 04 24
        call    cons_newline                            ; 12D2 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 12D7 _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 12DA _ 89. 82, 0000009C
        jmp     ?_063                                   ; 12E0 _ E9, 000000A8

?_062:  movzx   eax, byte [ebp-3FH]                     ; 12E5 _ 0F B6. 45, C1
        cmp     al, 13                                  ; 12E9 _ 3C, 0D
        je      ?_063                                   ; 12EB _ 0F 84, 0000009C
        mov     eax, dword [ebp-24H]                    ; 12F1 _ 8B. 45, DC
        mov     ebx, dword [eax+9CH]                    ; 12F4 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-24H]                    ; 12FA _ 8B. 45, DC
        mov     ecx, dword [eax+98H]                    ; 12FD _ 8B. 88, 00000098
        mov     eax, dword [ebp-24H]                    ; 1303 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1306 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 130C _ A1, 00000264(d)
        lea     esi, [ebp-3FH]                          ; 1311 _ 8D. 75, C1
        mov     dword [esp+14H], esi                    ; 1314 _ 89. 74 24, 14
        mov     dword [esp+10H], 7                      ; 1318 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 1320 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1324 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1328 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 132C _ 89. 04 24
        call    showString                              ; 132F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 1334 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 1337 _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 133D _ 8D. 50, 08
        mov     eax, dword [ebp-24H]                    ; 1340 _ 8B. 45, DC
        mov     dword [eax+98H], edx                    ; 1343 _ 89. 90, 00000098
        mov     eax, dword [ebp-24H]                    ; 1349 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 134C _ 8B. 80, 00000098
        cmp     eax, 248                                ; 1352 _ 3D, 000000F8
        jnz     ?_063                                   ; 1357 _ 75, 34
        mov     eax, dword [ebp-24H]                    ; 1359 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 135C _ C7. 80, 00000098, 00000010
        mov     eax, dword [ebp-24H]                    ; 1366 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1369 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 136F _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 1372 _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 1378 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 137C _ 89. 04 24
        call    cons_newline                            ; 137F _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 1384 _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 1387 _ 89. 82, 0000009C
?_063:  add     dword [ebp-20H], 1                      ; 138D _ 83. 45, E0, 01
?_064:  mov     eax, dword [ebp-20H]                    ; 1391 _ 8B. 45, E0
        cmp     eax, dword [ebp-30H]                    ; 1394 _ 3B. 45, D0
        jl      ?_058                                   ; 1397 _ 0F 8C, FFFFFE42
        nop                                             ; 139D _ 90
        jmp     ?_067                                   ; 139E _ EB, 12

?_065:  add     dword [ebp-14H], 32                     ; 13A0 _ 83. 45, EC, 20
?_066:  mov     eax, dword [ebp-14H]                    ; 13A4 _ 8B. 45, EC
        movzx   eax, byte [eax]                         ; 13A7 _ 0F B6. 00
        test    al, al                                  ; 13AA _ 84. C0
        jne     ?_051                                   ; 13AC _ 0F 85, FFFFFD50
?_067:  mov     eax, dword [ebp-24H]                    ; 13B2 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 13B5 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 13BB _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 13BE _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 13C4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 13C8 _ 89. 04 24
        call    cons_newline                            ; 13CB _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 13D0 _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 13D3 _ 89. 82, 0000009C
        mov     edx, dword [ebp-28H]                    ; 13D9 _ 8B. 55, D8
        mov     eax, dword [memman]                     ; 13DC _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 13E1 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 13E9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 13ED _ 89. 04 24
        call    memman_free                             ; 13F0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 13F5 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 13F8 _ C7. 80, 00000098, 00000010
        add     esp, 96                                 ; 1402 _ 83. C4, 60
        pop     ebx                                     ; 1405 _ 5B
        pop     esi                                     ; 1406 _ 5E
        pop     ebp                                     ; 1407 _ 5D
        ret                                             ; 1408 _ C3
; cmd_type End of function

cmd_mem:; Function begin
        push    ebp                                     ; 1409 _ 55
        mov     ebp, esp                                ; 140A _ 89. E5
        push    ebx                                     ; 140C _ 53
        sub     esp, 52                                 ; 140D _ 83. EC, 34
        call    task_now                                ; 1410 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1415 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 1418 _ 8B. 45, 08
        lea     edx, [eax+3FFH]                         ; 141B _ 8D. 90, 000003FF
        test    eax, eax                                ; 1421 _ 85. C0
        cmovs   eax, edx                                ; 1423 _ 0F 48. C2
        sar     eax, 10                                 ; 1426 _ C1. F8, 0A
        mov     dword [esp], eax                        ; 1429 _ 89. 04 24
        call    intToHexStr                             ; 142C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1431 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 1434 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 1437 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 143D _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 1440 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1446 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_371                  ; 144B _ C7. 44 24, 14, 00000019(d)
        mov     dword [esp+10H], 7                      ; 1453 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 145B _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 145F _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 1467 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 146B _ 89. 04 24
        call    showString                              ; 146E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1473 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 1476 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 147C _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 147F _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1485 _ A1, 00000264(d)
        mov     ebx, dword [ebp-10H]                    ; 148A _ 8B. 5D, F0
        mov     dword [esp+14H], ebx                    ; 148D _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 1491 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 1499 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 52                      ; 149D _ C7. 44 24, 08, 00000034
        mov     dword [esp+4H], edx                     ; 14A5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 14A9 _ 89. 04 24
        call    showString                              ; 14AC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 14B1 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 14B4 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 14BA _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 14BD _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 14C3 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_372                  ; 14C8 _ C7. 44 24, 14, 0000001F(d)
        mov     dword [esp+10H], 7                      ; 14D0 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 14D8 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 126                     ; 14DC _ C7. 44 24, 08, 0000007E
        mov     dword [esp+4H], edx                     ; 14E4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 14E8 _ 89. 04 24
        call    showString                              ; 14EB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 14F0 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 14F3 _ 8B. 90, 00000094
        mov     eax, dword [ebp-0CH]                    ; 14F9 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 14FC _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 1502 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1506 _ 89. 04 24
        call    cons_newline                            ; 1509 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-0CH]                    ; 150E _ 8B. 55, F4
        mov     dword [edx+9CH], eax                    ; 1511 _ 89. 82, 0000009C
        add     esp, 52                                 ; 1517 _ 83. C4, 34
        pop     ebx                                     ; 151A _ 5B
        pop     ebp                                     ; 151B _ 5D
        ret                                             ; 151C _ C3
; cmd_mem End of function

cmd_cls:; Function begin
        push    ebp                                     ; 151D _ 55
        mov     ebp, esp                                ; 151E _ 89. E5
        sub     esp, 56                                 ; 1520 _ 83. EC, 38
        call    task_now                                ; 1523 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1528 _ 89. 45, EC
        mov     dword [ebp-0CH], 8                      ; 152B _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 28                     ; 1532 _ C7. 45, F0, 0000001C
        mov     dword [ebp-10H], 28                     ; 1539 _ C7. 45, F0, 0000001C
        jmp     ?_071                                   ; 1540 _ EB, 41

?_068:  mov     dword [ebp-0CH], 8                      ; 1542 _ C7. 45, F4, 00000008
        jmp     ?_070                                   ; 1549 _ EB, 2B

?_069:  mov     eax, dword [ebp-14H]                    ; 154B _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 154E _ 8B. 80, 00000094
        mov     edx, dword [eax]                        ; 1554 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 1556 _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 1559 _ 8B. 80, 00000094
        mov     eax, dword [eax+4H]                     ; 155F _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 1562 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 1566 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 1568 _ 8B. 45, F4
        add     eax, ecx                                ; 156B _ 01. C8
        add     eax, edx                                ; 156D _ 01. D0
        mov     byte [eax], 0                           ; 156F _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 1572 _ 83. 45, F4, 01
?_070:  cmp     dword [ebp-0CH], 247                    ; 1576 _ 81. 7D, F4, 000000F7
        jle     ?_069                                   ; 157D _ 7E, CC
        add     dword [ebp-10H], 1                      ; 157F _ 83. 45, F0, 01
?_071:  cmp     dword [ebp-10H], 155                    ; 1583 _ 81. 7D, F0, 0000009B
        jle     ?_068                                   ; 158A _ 7E, B6
        mov     eax, dword [ebp-14H]                    ; 158C _ 8B. 45, EC
        mov     edx, dword [eax+94H]                    ; 158F _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1595 _ A1, 00000264(d)
        mov     dword [esp+14H], 156                    ; 159A _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 15A2 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 15AA _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 15B2 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 15BA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 15BE _ 89. 04 24
        call    sheet_refresh                           ; 15C1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 15C6 _ 8B. 45, EC
        mov     dword [eax+9CH], 28                     ; 15C9 _ C7. 80, 0000009C, 0000001C
        mov     eax, dword [ebp-14H]                    ; 15D3 _ 8B. 45, EC
        mov     edx, dword [eax+94H]                    ; 15D6 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 15DC _ A1, 00000264(d)
        mov     dword [esp+14H], ?_373                  ; 15E1 _ C7. 44 24, 14, 00000023(d)
        mov     dword [esp+10H], 7                      ; 15E9 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 15F1 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 15F9 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1601 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1605 _ 89. 04 24
        call    showString                              ; 1608 _ E8, FFFFFFFC(rel)
        leave                                           ; 160D _ C9
        ret                                             ; 160E _ C3
; cmd_cls End of function

cmd_hlt:; Function begin
        push    ebp                                     ; 160F _ 55
        mov     ebp, esp                                ; 1610 _ 89. E5
        sub     esp, 72                                 ; 1612 _ 83. EC, 48
        call    io_cli                                  ; 1615 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 161A _ A1, 00000000(d)
        mov     dword [esp+4H], 16                      ; 161F _ C7. 44 24, 04, 00000010
        mov     dword [esp], eax                        ; 1627 _ 89. 04 24
        call    memman_alloc                            ; 162A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 162F _ 89. 45, F4
        call    task_now                                ; 1632 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1637 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 163A _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 163D _ 8B. 55, F4
        mov     dword [eax+0B0H], edx                   ; 1640 _ 89. 90, 000000B0
        mov     eax, dword [ebp-0CH]                    ; 1646 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 1649 _ 89. 44 24, 04
        mov     dword [esp], ?_374                      ; 164D _ C7. 04 24, 00000025(d)
        call    file_loadfile                           ; 1654 _ E8, FFFFFFFC(rel)
        call    get_addr_gdt                            ; 1659 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 165E _ 89. 45, EC
        mov     eax, dword [ebp-10H]                    ; 1661 _ 8B. 45, F0
        mov     edx, dword [eax]                        ; 1664 _ 8B. 10
        mov     eax, dword [first_task_cons_selector]   ; 1666 _ A1, 00000000(d)
        sub     edx, eax                                ; 166B _ 29. C2
        mov     eax, edx                                ; 166D _ 89. D0
        lea     edx, [eax+7H]                           ; 166F _ 8D. 50, 07
        test    eax, eax                                ; 1672 _ 85. C0
        cmovs   eax, edx                                ; 1674 _ 0F 48. C2
        sar     eax, 3                                  ; 1677 _ C1. F8, 03
        add     eax, 21                                 ; 167A _ 83. C0, 15
        mov     dword [ebp-18H], eax                    ; 167D _ 89. 45, E8
        mov     eax, dword [ebp-10H]                    ; 1680 _ 8B. 45, F0
        mov     edx, dword [eax]                        ; 1683 _ 8B. 10
        mov     eax, dword [first_task_cons_selector]   ; 1685 _ A1, 00000000(d)
        sub     edx, eax                                ; 168A _ 29. C2
        mov     eax, edx                                ; 168C _ 89. D0
        lea     edx, [eax+7H]                           ; 168E _ 8D. 50, 07
        test    eax, eax                                ; 1691 _ 85. C0
        cmovs   eax, edx                                ; 1693 _ 0F 48. C2
        sar     eax, 3                                  ; 1696 _ C1. F8, 03
        add     eax, 30                                 ; 1699 _ 83. C0, 1E
        mov     dword [ebp-1CH], eax                    ; 169C _ 89. 45, E4
        mov     eax, dword [ebp-0CH]                    ; 169F _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 16A2 _ 8B. 00
        mov     edx, dword [ebp-18H]                    ; 16A4 _ 8B. 55, E8
        lea     ecx, [edx*8]                            ; 16A7 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-14H]                    ; 16AE _ 8B. 55, EC
        add     edx, ecx                                ; 16B1 _ 01. CA
        mov     dword [esp+0CH], 16634                  ; 16B3 _ C7. 44 24, 0C, 000040FA
        mov     dword [esp+8H], eax                     ; 16BB _ 89. 44 24, 08
        mov     dword [esp+4H], 1048575                 ; 16BF _ C7. 44 24, 04, 000FFFFF
        mov     dword [esp], edx                        ; 16C7 _ 89. 14 24
        call    set_segmdesc                            ; 16CA _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 16CF _ A1, 00000000(d)
        mov     dword [esp+4H], 65536                   ; 16D4 _ C7. 44 24, 04, 00010000
        mov     dword [esp], eax                        ; 16DC _ 89. 04 24
        call    memman_alloc_4k                         ; 16DF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 16E4 _ 89. 45, E0
        mov     eax, dword [ebp-0CH]                    ; 16E7 _ 8B. 45, F4
        mov     edx, dword [ebp-20H]                    ; 16EA _ 8B. 55, E0
        mov     dword [eax+4H], edx                     ; 16ED _ 89. 50, 04
        mov     eax, dword [ebp-20H]                    ; 16F0 _ 8B. 45, E0
        mov     edx, dword [ebp-1CH]                    ; 16F3 _ 8B. 55, E4
        lea     ecx, [edx*8]                            ; 16F6 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-14H]                    ; 16FD _ 8B. 55, EC
        add     edx, ecx                                ; 1700 _ 01. CA
        mov     dword [esp+0CH], 16626                  ; 1702 _ C7. 44 24, 0C, 000040F2
        mov     dword [esp+8H], eax                     ; 170A _ 89. 44 24, 08
        mov     dword [esp+4H], 65535                   ; 170E _ C7. 44 24, 04, 0000FFFF
        mov     dword [esp], edx                        ; 1716 _ 89. 14 24
        call    set_segmdesc                            ; 1719 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 171E _ 8B. 45, F0
        mov     dword [eax+30H], 0                      ; 1721 _ C7. 40, 30, 00000000
        call    io_sti                                  ; 1728 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 172D _ 8B. 45, F0
        lea     ecx, [eax+30H]                          ; 1730 _ 8D. 48, 30
        mov     eax, dword [ebp-1CH]                    ; 1733 _ 8B. 45, E4
        lea     edx, [eax*8]                            ; 1736 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-18H]                    ; 173D _ 8B. 45, E8
        shl     eax, 3                                  ; 1740 _ C1. E0, 03
        mov     dword [esp+10H], ecx                    ; 1743 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 1747 _ 89. 54 24, 0C
        mov     dword [esp+8H], 65536                   ; 174B _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], eax                     ; 1753 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 1757 _ C7. 04 24, 00000000
        call    start_app                               ; 175E _ E8, FFFFFFFC(rel)
        call    io_cli                                  ; 1763 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1768 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 176B _ 8B. 40, 08
        mov     ecx, eax                                ; 176E _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 1770 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 1773 _ 8B. 00
        mov     edx, eax                                ; 1775 _ 89. C2
        mov     eax, dword [memman]                     ; 1777 _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 177C _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1780 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1784 _ 89. 04 24
        call    memman_free_4k                          ; 1787 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-20H]                    ; 178C _ 8B. 55, E0
        mov     eax, dword [memman]                     ; 178F _ A1, 00000000(d)
        mov     dword [esp+8H], 65536                   ; 1794 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], edx                     ; 179C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 17A0 _ 89. 04 24
        call    memman_free_4k                          ; 17A3 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-0CH]                    ; 17A8 _ 8B. 55, F4
        mov     eax, dword [memman]                     ; 17AB _ A1, 00000000(d)
        mov     dword [esp+8H], 16                      ; 17B0 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 17B8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 17BC _ 89. 04 24
        call    memman_free                             ; 17BF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 17C4 _ 8B. 45, F0
        mov     dword [eax+0B0H], 0                     ; 17C7 _ C7. 80, 000000B0, 00000000
        call    io_sti                                  ; 17D1 _ E8, FFFFFFFC(rel)
        leave                                           ; 17D6 _ C9
        ret                                             ; 17D7 _ C3
; cmd_hlt End of function

console_task:; Function begin
        push    ebp                                     ; 17D8 _ 55
        mov     ebp, esp                                ; 17D9 _ 89. E5
        push    esi                                     ; 17DB _ 56
        push    ebx                                     ; 17DC _ 53
        sub     esp, 80                                 ; 17DD _ 83. EC, 50
        call    task_now                                ; 17E0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 17E5 _ 89. 45, F0
        mov     dword [ebp-0CH], 0                      ; 17E8 _ C7. 45, F4, 00000000
        mov     dword [ebp-14H], 0                      ; 17EF _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 17F6 _ C7. 45, E8, 00000000
        mov     eax, dword [memman]                     ; 17FD _ A1, 00000000(d)
        mov     dword [esp+4H], 128                     ; 1802 _ C7. 44 24, 04, 00000080
        mov     dword [esp], eax                        ; 180A _ 89. 04 24
        call    memman_alloc                            ; 180D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 1812 _ 89. 45, E4
        mov     eax, dword [memman]                     ; 1815 _ A1, 00000000(d)
        mov     dword [esp+4H], 30                      ; 181A _ C7. 44 24, 04, 0000001E
        mov     dword [esp], eax                        ; 1822 _ 89. 04 24
        call    memman_alloc                            ; 1825 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 182A _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 182D _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 1830 _ 8B. 55, 08
        mov     dword [eax+94H], edx                    ; 1833 _ 89. 90, 00000094
        mov     eax, dword [ebp-10H]                    ; 1839 _ 8B. 45, F0
        mov     dword [eax+98H], 16                     ; 183C _ C7. 80, 00000098, 00000010
        mov     eax, dword [ebp-10H]                    ; 1846 _ 8B. 45, F0
        mov     dword [eax+9CH], 28                     ; 1849 _ C7. 80, 0000009C, 0000001C
        mov     eax, dword [ebp-10H]                    ; 1853 _ 8B. 45, F0
        mov     dword [eax+0A0H], -1                    ; 1856 _ C7. 80, 000000A0, FFFFFFFF
        mov     eax, dword [ebp-10H]                    ; 1860 _ 8B. 45, F0
        lea     edx, [eax+10H]                          ; 1863 _ 8D. 50, 10
        mov     eax, dword [ebp-10H]                    ; 1866 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 1869 _ 89. 44 24, 0C
        mov     eax, dword [ebp-1CH]                    ; 186D _ 8B. 45, E4
        mov     dword [esp+8H], eax                     ; 1870 _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 1874 _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 187C _ 89. 14 24
        call    fifo8_init                              ; 187F _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 1884 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 1889 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 188C _ 8B. 45, F0
        add     eax, 16                                 ; 188F _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 1892 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 189A _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 189E _ 8B. 45, DC
        mov     dword [esp], eax                        ; 18A1 _ 89. 04 24
        call    timer_init                              ; 18A4 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 18A9 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 18B1 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 18B4 _ 89. 04 24
        call    timer_settime                           ; 18B7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 18BC _ 8B. 45, F0
        mov     edx, dword [ebp-24H]                    ; 18BF _ 8B. 55, DC
        mov     dword [eax+0A8H], edx                   ; 18C2 _ 89. 90, 000000A8
        mov     eax, dword [ebp-10H]                    ; 18C8 _ 8B. 45, F0
        mov     edx, dword [ebp-20H]                    ; 18CB _ 8B. 55, E0
        mov     dword [eax+0ACH], edx                   ; 18CE _ 89. 90, 000000AC
        mov     eax, dword [shtctl]                     ; 18D4 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_373                  ; 18D9 _ C7. 44 24, 14, 00000023(d)
        mov     dword [esp+10H], 7                      ; 18E1 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 18E9 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 18F1 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+8H]                     ; 18F9 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 18FC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1900 _ 89. 04 24
        call    showString                              ; 1903 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], 0                      ; 1908 _ C7. 45, D8, 00000000
        mov     dword [ebp-2CH], 78848                  ; 190F _ C7. 45, D4, 00013400
        mov     dword [ebp-30H], 0                      ; 1916 _ C7. 45, D0, 00000000
?_072:  call    io_cli                                  ; 191D _ E8, FFFFFFFC(rel)
        call    task_now                                ; 1922 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1927 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 192A _ 8B. 45, F0
        add     eax, 16                                 ; 192D _ 83. C0, 10
        mov     dword [esp], eax                        ; 1930 _ 89. 04 24
        call    fifo8_status                            ; 1933 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1938 _ 85. C0
        jnz     ?_073                                   ; 193A _ 75, 0A
        call    io_sti                                  ; 193C _ E8, FFFFFFFC(rel)
        jmp     ?_088                                   ; 1941 _ E9, 00000449

?_073:  mov     eax, dword [ebp-10H]                    ; 1946 _ 8B. 45, F0
        add     eax, 16                                 ; 1949 _ 83. C0, 10
        mov     dword [esp], eax                        ; 194C _ 89. 04 24
        call    fifo8_get                               ; 194F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 1954 _ 89. 45, CC
        cmp     dword [ebp-34H], 1                      ; 1957 _ 83. 7D, CC, 01
        jg      ?_076                                   ; 195B _ 7F, 6E
        cmp     dword [ebp-0CH], 0                      ; 195D _ 83. 7D, F4, 00
        js      ?_076                                   ; 1961 _ 78, 68
        cmp     dword [ebp-34H], 0                      ; 1963 _ 83. 7D, CC, 00
        jz      ?_074                                   ; 1967 _ 74, 26
        mov     eax, dword [ebp-10H]                    ; 1969 _ 8B. 45, F0
        add     eax, 16                                 ; 196C _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 196F _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 1977 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 197B _ 8B. 45, DC
        mov     dword [esp], eax                        ; 197E _ 89. 04 24
        call    timer_init                              ; 1981 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 7                      ; 1986 _ C7. 45, F4, 00000007
        jmp     ?_075                                   ; 198D _ EB, 24

?_074:  mov     eax, dword [ebp-10H]                    ; 198F _ 8B. 45, F0
        add     eax, 16                                 ; 1992 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 1995 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 199D _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 19A1 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 19A4 _ 89. 04 24
        call    timer_init                              ; 19A7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 19AC _ C7. 45, F4, 00000000
?_075:  mov     dword [esp+4H], 50                      ; 19B3 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 19BB _ 8B. 45, DC
        mov     dword [esp], eax                        ; 19BE _ 89. 04 24
        call    timer_settime                           ; 19C1 _ E8, FFFFFFFC(rel)
        jmp     ?_087                                   ; 19C6 _ E9, 00000383

?_076:  cmp     dword [ebp-34H], 87                     ; 19CB _ 83. 7D, CC, 57
        jnz     ?_077                                   ; 19CF _ 75, 3C
        mov     dword [ebp-0CH], 7                      ; 19D1 _ C7. 45, F4, 00000007
        mov     eax, dword [ebp-10H]                    ; 19D8 _ 8B. 45, F0
        add     eax, 16                                 ; 19DB _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 19DE _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 19E6 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 19EA _ 8B. 45, DC
        mov     dword [esp], eax                        ; 19ED _ 89. 04 24
        call    timer_init                              ; 19F0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 19F5 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 19FD _ 8B. 45, DC
        mov     dword [esp], eax                        ; 1A00 _ 89. 04 24
        call    timer_settime                           ; 1A03 _ E8, FFFFFFFC(rel)
        jmp     ?_087                                   ; 1A08 _ E9, 00000341

?_077:  cmp     dword [ebp-34H], 88                     ; 1A0D _ 83. 7D, CC, 58
        jne     ?_078                                   ; 1A11 _ 0F 85, 000000A1
        mov     edx, dword [sht_back]                   ; 1A17 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 1A1D _ A1, 00000264(d)
        mov     dword [esp+14H], ?_375                  ; 1A22 _ C7. 44 24, 14, 0000002D(d)
        mov     dword [esp+10H], 7                      ; 1A2A _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 176                    ; 1A32 _ C7. 44 24, 0C, 000000B0
        mov     dword [esp+8H], 0                       ; 1A3A _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1A42 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A46 _ 89. 04 24
        call    showString                              ; 1A49 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1A4E _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1A51 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1A57 _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1A5A _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1A60 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1A65 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1A6D _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1A71 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1A75 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1A78 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A7C _ 89. 04 24
        call    set_cursor                              ; 1A7F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], -1                     ; 1A84 _ C7. 45, F4, FFFFFFFF
        mov     eax, dword [task_main]                  ; 1A8B _ A1, 00000274(d)
        mov     dword [esp+8H], 0                       ; 1A90 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 1A98 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 1AA0 _ 89. 04 24
        call    task_run                                ; 1AA3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1AA8 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1AAB _ 89. 04 24
        call    task_sleep                              ; 1AAE _ E8, FFFFFFFC(rel)
        jmp     ?_087                                   ; 1AB3 _ E9, 00000296

?_078:  cmp     dword [ebp-34H], 28                     ; 1AB8 _ 83. 7D, CC, 1C
        jne     ?_085                                   ; 1ABC _ 0F 85, 00000174
        mov     eax, dword [ebp-10H]                    ; 1AC2 _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1AC5 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1ACB _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1ACE _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1AD4 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1AD9 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1AE1 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1AE5 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1AE9 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1AEC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1AF0 _ 89. 04 24
        call    set_cursor                              ; 1AF3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1AF8 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1AFB _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1B01 _ 8D. 50, 07
        test    eax, eax                                ; 1B04 _ 85. C0
        cmovs   eax, edx                                ; 1B06 _ 0F 48. C2
        sar     eax, 3                                  ; 1B09 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1B0C _ 8D. 50, FE
        mov     eax, dword [ebp-20H]                    ; 1B0F _ 8B. 45, E0
        add     eax, edx                                ; 1B12 _ 01. D0
        mov     byte [eax], 0                           ; 1B14 _ C6. 00, 00
        mov     eax, dword [ebp-10H]                    ; 1B17 _ 8B. 45, F0
        mov     eax, dword [eax+9CH]                    ; 1B1A _ 8B. 80, 0000009C
        mov     edx, dword [ebp+8H]                     ; 1B20 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1B23 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B27 _ 89. 04 24
        call    cons_newline                            ; 1B2A _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-10H]                    ; 1B2F _ 8B. 55, F0
        mov     dword [edx+9CH], eax                    ; 1B32 _ 89. 82, 0000009C
        mov     dword [esp+4H], ?_376                   ; 1B38 _ C7. 44 24, 04, 00000033(d)
        mov     eax, dword [ebp-20H]                    ; 1B40 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1B43 _ 89. 04 24
        call    strcmp                                  ; 1B46 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1B4B _ 83. F8, 01
        jnz     ?_079                                   ; 1B4E _ 75, 10
        mov     eax, dword [ebp+0CH]                    ; 1B50 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 1B53 _ 89. 04 24
        call    cmd_mem                                 ; 1B56 _ E8, FFFFFFFC(rel)
        jmp     ?_084                                   ; 1B5B _ E9, 000000C4

?_079:  mov     dword [esp+4H], ?_377                   ; 1B60 _ C7. 44 24, 04, 00000037(d)
        mov     eax, dword [ebp-20H]                    ; 1B68 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1B6B _ 89. 04 24
        call    strcmp                                  ; 1B6E _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1B73 _ 83. F8, 01
        jnz     ?_080                                   ; 1B76 _ 75, 0A
        call    cmd_cls                                 ; 1B78 _ E8, FFFFFFFC(rel)
        jmp     ?_084                                   ; 1B7D _ E9, 000000A2

?_080:  mov     dword [esp+4H], ?_378                   ; 1B82 _ C7. 44 24, 04, 0000003B(d)
        mov     eax, dword [ebp-20H]                    ; 1B8A _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1B8D _ 89. 04 24
        call    strcmp                                  ; 1B90 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1B95 _ 83. F8, 01
        jnz     ?_081                                   ; 1B98 _ 75, 0A
        call    cmd_hlt                                 ; 1B9A _ E8, FFFFFFFC(rel)
        jmp     ?_084                                   ; 1B9F _ E9, 00000080

?_081:  mov     dword [esp+4H], ?_379                   ; 1BA4 _ C7. 44 24, 04, 0000003F(d)
        mov     eax, dword [ebp-20H]                    ; 1BAC _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1BAF _ 89. 04 24
        call    strcmp                                  ; 1BB2 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1BB7 _ 83. F8, 01
        jnz     ?_082                                   ; 1BBA _ 75, 07
        call    cmd_dir                                 ; 1BBC _ E8, FFFFFFFC(rel)
        jmp     ?_084                                   ; 1BC1 _ EB, 61

?_082:  mov     dword [esp+4H], ?_380                   ; 1BC3 _ C7. 44 24, 04, 00000043(d)
        mov     eax, dword [ebp-20H]                    ; 1BCB _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1BCE _ 89. 04 24
        call    strcmp                                  ; 1BD1 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1BD6 _ 83. F8, 01
        jnz     ?_083                                   ; 1BD9 _ 75, 0D
        mov     eax, dword [ebp-10H]                    ; 1BDB _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1BDE _ 89. 04 24
        call    cmd_exit                                ; 1BE1 _ E8, FFFFFFFC(rel)
        jmp     ?_084                                   ; 1BE6 _ EB, 3C

?_083:  mov     eax, dword [ebp-20H]                    ; 1BE8 _ 8B. 45, E0
        movzx   eax, byte [eax]                         ; 1BEB _ 0F B6. 00
        cmp     al, 116                                 ; 1BEE _ 3C, 74
        jnz     ?_084                                   ; 1BF0 _ 75, 32
        mov     eax, dword [ebp-20H]                    ; 1BF2 _ 8B. 45, E0
        add     eax, 1                                  ; 1BF5 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 1BF8 _ 0F B6. 00
        cmp     al, 121                                 ; 1BFB _ 3C, 79
        jnz     ?_084                                   ; 1BFD _ 75, 25
        mov     eax, dword [ebp-20H]                    ; 1BFF _ 8B. 45, E0
        add     eax, 2                                  ; 1C02 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 1C05 _ 0F B6. 00
        cmp     al, 112                                 ; 1C08 _ 3C, 70
        jnz     ?_084                                   ; 1C0A _ 75, 18
        mov     eax, dword [ebp-20H]                    ; 1C0C _ 8B. 45, E0
        add     eax, 3                                  ; 1C0F _ 83. C0, 03
        movzx   eax, byte [eax]                         ; 1C12 _ 0F B6. 00
        cmp     al, 101                                 ; 1C15 _ 3C, 65
        jnz     ?_084                                   ; 1C17 _ 75, 0B
        mov     eax, dword [ebp-20H]                    ; 1C19 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1C1C _ 89. 04 24
        call    cmd_type                                ; 1C1F _ E8, FFFFFFFC(rel)
?_084:  mov     eax, dword [ebp-10H]                    ; 1C24 _ 8B. 45, F0
        mov     dword [eax+98H], 16                     ; 1C27 _ C7. 80, 00000098, 00000010
        jmp     ?_087                                   ; 1C31 _ E9, 00000118

?_085:  cmp     dword [ebp-34H], 14                     ; 1C36 _ 83. 7D, CC, 0E
        jne     ?_086                                   ; 1C3A _ 0F 85, 00000095
        mov     eax, dword [ebp-10H]                    ; 1C40 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1C43 _ 8B. 80, 00000098
        cmp     eax, 8                                  ; 1C49 _ 83. F8, 08
        jle     ?_086                                   ; 1C4C _ 0F 8E, 00000083
        mov     eax, dword [ebp-10H]                    ; 1C52 _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1C55 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1C5B _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1C5E _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1C64 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1C69 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1C71 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1C75 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1C79 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1C7C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C80 _ 89. 04 24
        call    set_cursor                              ; 1C83 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1C88 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1C8B _ 8B. 80, 00000098
        lea     edx, [eax-8H]                           ; 1C91 _ 8D. 50, F8
        mov     eax, dword [ebp-10H]                    ; 1C94 _ 8B. 45, F0
        mov     dword [eax+98H], edx                    ; 1C97 _ 89. 90, 00000098
        mov     eax, dword [ebp-10H]                    ; 1C9D _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1CA0 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1CA6 _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1CA9 _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1CAF _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1CB4 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1CBC _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1CC0 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1CC4 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1CC7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CCB _ 89. 04 24
        call    set_cursor                              ; 1CCE _ E8, FFFFFFFC(rel)
        jmp     ?_087                                   ; 1CD3 _ EB, 79

?_086:  mov     eax, dword [ebp-34H]                    ; 1CD5 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 1CD8 _ 89. 04 24
        call    transferScanCode                        ; 1CDB _ E8, FFFFFFFC(rel)
        mov     byte [ebp-35H], al                      ; 1CE0 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 1CE3 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1CE6 _ 8B. 80, 00000098
        cmp     eax, 239                                ; 1CEC _ 3D, 000000EF
        jg      ?_087                                   ; 1CF1 _ 7F, 5B
        cmp     byte [ebp-35H], 0                       ; 1CF3 _ 80. 7D, CB, 00
        jz      ?_087                                   ; 1CF7 _ 74, 55
        mov     eax, dword [ebp-10H]                    ; 1CF9 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1CFC _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1D02 _ 8D. 50, 07
        test    eax, eax                                ; 1D05 _ 85. C0
        cmovs   eax, edx                                ; 1D07 _ 0F 48. C2
        sar     eax, 3                                  ; 1D0A _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1D0D _ 8D. 50, FE
        mov     eax, dword [ebp-20H]                    ; 1D10 _ 8B. 45, E0
        add     edx, eax                                ; 1D13 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 1D15 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 1D19 _ 88. 02
        mov     eax, dword [ebp-10H]                    ; 1D1B _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1D1E _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1D24 _ 8D. 50, 07
        test    eax, eax                                ; 1D27 _ 85. C0
        cmovs   eax, edx                                ; 1D29 _ 0F 48. C2
        sar     eax, 3                                  ; 1D2C _ C1. F8, 03
        lea     edx, [eax-1H]                           ; 1D2F _ 8D. 50, FF
        mov     eax, dword [ebp-20H]                    ; 1D32 _ 8B. 45, E0
        add     eax, edx                                ; 1D35 _ 01. D0
        mov     byte [eax], 0                           ; 1D37 _ C6. 00, 00
        movsx   eax, byte [ebp-35H]                     ; 1D3A _ 0F BE. 45, CB
        mov     dword [esp+4H], 1                       ; 1D3E _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 1D46 _ 89. 04 24
        call    cons_putchar                            ; 1D49 _ E8, FFFFFFFC(rel)
?_087:  cmp     dword [ebp-0CH], 0                      ; 1D4E _ 83. 7D, F4, 00
        js      ?_088                                   ; 1D52 _ 78, 3B
        mov     eax, dword [ebp-10H]                    ; 1D54 _ 8B. 45, F0
        mov     ebx, dword [eax+9CH]                    ; 1D57 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1D5D _ 8B. 45, F0
        mov     ecx, dword [eax+98H]                    ; 1D60 _ 8B. 88, 00000098
        mov     eax, dword [ebp-10H]                    ; 1D66 _ 8B. 45, F0
        mov     edx, dword [eax+94H]                    ; 1D69 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1D6F _ A1, 00000264(d)
        mov     esi, dword [ebp-0CH]                    ; 1D74 _ 8B. 75, F4
        mov     dword [esp+10H], esi                    ; 1D77 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1D7B _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1D7F _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1D83 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D87 _ 89. 04 24
        call    set_cursor                              ; 1D8A _ E8, FFFFFFFC(rel)
?_088:  call    io_sti                                  ; 1D8F _ E8, FFFFFFFC(rel)
        jmp     ?_072                                   ; 1D94 _ E9, FFFFFB84
; console_task End of function

cons_putstr:; Function begin
        push    ebp                                     ; 1D99 _ 55
        mov     ebp, esp                                ; 1D9A _ 89. E5
        sub     esp, 24                                 ; 1D9C _ 83. EC, 18
        jmp     ?_090                                   ; 1D9F _ EB, 1D

?_089:  mov     eax, dword [ebp+8H]                     ; 1DA1 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1DA4 _ 0F B6. 00
        movsx   eax, al                                 ; 1DA7 _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 1DAA _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 1DB2 _ 89. 04 24
        call    cons_putchar                            ; 1DB5 _ E8, FFFFFFFC(rel)
        add     dword [ebp+8H], 1                       ; 1DBA _ 83. 45, 08, 01
?_090:  mov     eax, dword [ebp+8H]                     ; 1DBE _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1DC1 _ 0F B6. 00
        test    al, al                                  ; 1DC4 _ 84. C0
        jnz     ?_089                                   ; 1DC6 _ 75, D9
        nop                                             ; 1DC8 _ 90
        leave                                           ; 1DC9 _ C9
        ret                                             ; 1DCA _ C3
; cons_putstr End of function

api_linewin:; Function begin
        push    ebp                                     ; 1DCB _ 55
        mov     ebp, esp                                ; 1DCC _ 89. E5
        sub     esp, 32                                 ; 1DCE _ 83. EC, 20
        mov     eax, dword [ebp+0CH]                    ; 1DD1 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1DD4 _ 8B. 55, 14
        sub     edx, eax                                ; 1DD7 _ 29. C2
        mov     eax, edx                                ; 1DD9 _ 89. D0
        mov     dword [ebp-14H], eax                    ; 1DDB _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 1DDE _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 1DE1 _ 8B. 55, 18
        sub     edx, eax                                ; 1DE4 _ 29. C2
        mov     eax, edx                                ; 1DE6 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 1DE8 _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 1DEB _ 8B. 45, 0C
        shl     eax, 10                                 ; 1DEE _ C1. E0, 0A
        mov     dword [ebp-8H], eax                     ; 1DF1 _ 89. 45, F8
        mov     eax, dword [ebp+10H]                    ; 1DF4 _ 8B. 45, 10
        shl     eax, 10                                 ; 1DF7 _ C1. E0, 0A
        mov     dword [ebp-0CH], eax                    ; 1DFA _ 89. 45, F4
        cmp     dword [ebp-14H], 0                      ; 1DFD _ 83. 7D, EC, 00
        jns     ?_091                                   ; 1E01 _ 79, 03
        neg     dword [ebp-14H]                         ; 1E03 _ F7. 5D, EC
?_091:  cmp     dword [ebp-18H], 0                      ; 1E06 _ 83. 7D, E8, 00
        jns     ?_092                                   ; 1E0A _ 79, 03
        neg     dword [ebp-18H]                         ; 1E0C _ F7. 5D, E8
?_092:  mov     eax, dword [ebp-14H]                    ; 1E0F _ 8B. 45, EC
        cmp     eax, dword [ebp-18H]                    ; 1E12 _ 3B. 45, E8
        jl      ?_096                                   ; 1E15 _ 7C, 5B
        mov     eax, dword [ebp-14H]                    ; 1E17 _ 8B. 45, EC
        add     eax, 1                                  ; 1E1A _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1E1D _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1E20 _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 1E23 _ 3B. 45, 14
        jle     ?_093                                   ; 1E26 _ 7E, 09
        mov     dword [ebp-14H], -1024                  ; 1E28 _ C7. 45, EC, FFFFFC00
        jmp     ?_094                                   ; 1E2F _ EB, 07

?_093:  mov     dword [ebp-14H], 1024                   ; 1E31 _ C7. 45, EC, 00000400
?_094:  mov     eax, dword [ebp+10H]                    ; 1E38 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 1E3B _ 3B. 45, 18
        jg      ?_095                                   ; 1E3E _ 7F, 19
        mov     eax, dword [ebp+10H]                    ; 1E40 _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 1E43 _ 8B. 55, 18
        sub     edx, eax                                ; 1E46 _ 29. C2
        mov     eax, edx                                ; 1E48 _ 89. D0
        add     eax, 1                                  ; 1E4A _ 83. C0, 01
        shl     eax, 10                                 ; 1E4D _ C1. E0, 0A
        cdq                                             ; 1E50 _ 99
        idiv    dword [ebp-10H]                         ; 1E51 _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 1E54 _ 89. 45, E8
        jmp     ?_100                                   ; 1E57 _ EB, 72

?_095:  mov     eax, dword [ebp+10H]                    ; 1E59 _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 1E5C _ 8B. 55, 18
        sub     edx, eax                                ; 1E5F _ 29. C2
        mov     eax, edx                                ; 1E61 _ 89. D0
        sub     eax, 1                                  ; 1E63 _ 83. E8, 01
        shl     eax, 10                                 ; 1E66 _ C1. E0, 0A
        cdq                                             ; 1E69 _ 99
        idiv    dword [ebp-10H]                         ; 1E6A _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 1E6D _ 89. 45, E8
        jmp     ?_100                                   ; 1E70 _ EB, 59

?_096:  mov     eax, dword [ebp-18H]                    ; 1E72 _ 8B. 45, E8
        add     eax, 1                                  ; 1E75 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1E78 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1E7B _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 1E7E _ 3B. 45, 18
        jle     ?_097                                   ; 1E81 _ 7E, 09
        mov     dword [ebp-18H], -1024                  ; 1E83 _ C7. 45, E8, FFFFFC00
        jmp     ?_098                                   ; 1E8A _ EB, 07

?_097:  mov     dword [ebp-18H], 1024                   ; 1E8C _ C7. 45, E8, 00000400
?_098:  mov     eax, dword [ebp+0CH]                    ; 1E93 _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 1E96 _ 3B. 45, 14
        jg      ?_099                                   ; 1E99 _ 7F, 19
        mov     eax, dword [ebp+0CH]                    ; 1E9B _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1E9E _ 8B. 55, 14
        sub     edx, eax                                ; 1EA1 _ 29. C2
        mov     eax, edx                                ; 1EA3 _ 89. D0
        add     eax, 1                                  ; 1EA5 _ 83. C0, 01
        shl     eax, 10                                 ; 1EA8 _ C1. E0, 0A
        cdq                                             ; 1EAB _ 99
        idiv    dword [ebp-10H]                         ; 1EAC _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 1EAF _ 89. 45, EC
        jmp     ?_100                                   ; 1EB2 _ EB, 17

?_099:  mov     eax, dword [ebp+0CH]                    ; 1EB4 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1EB7 _ 8B. 55, 14
        sub     edx, eax                                ; 1EBA _ 29. C2
        mov     eax, edx                                ; 1EBC _ 89. D0
        sub     eax, 1                                  ; 1EBE _ 83. E8, 01
        shl     eax, 10                                 ; 1EC1 _ C1. E0, 0A
        cdq                                             ; 1EC4 _ 99
        idiv    dword [ebp-10H]                         ; 1EC5 _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 1EC8 _ 89. 45, EC
?_100:  mov     dword [ebp-4H], 0                       ; 1ECB _ C7. 45, FC, 00000000
        jmp     ?_102                                   ; 1ED2 _ EB, 35

?_101:  mov     eax, dword [ebp+8H]                     ; 1ED4 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1ED7 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 1ED9 _ 8B. 45, F4
        sar     eax, 10                                 ; 1EDC _ C1. F8, 0A
        mov     ecx, eax                                ; 1EDF _ 89. C1
        mov     eax, dword [ebp+8H]                     ; 1EE1 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1EE4 _ 8B. 40, 04
        imul    eax, ecx                                ; 1EE7 _ 0F AF. C1
        mov     ecx, dword [ebp-8H]                     ; 1EEA _ 8B. 4D, F8
        sar     ecx, 10                                 ; 1EED _ C1. F9, 0A
        add     eax, ecx                                ; 1EF0 _ 01. C8
        add     edx, eax                                ; 1EF2 _ 01. C2
        mov     eax, dword [ebp+1CH]                    ; 1EF4 _ 8B. 45, 1C
        mov     byte [edx], al                          ; 1EF7 _ 88. 02
        mov     eax, dword [ebp-14H]                    ; 1EF9 _ 8B. 45, EC
        add     dword [ebp-8H], eax                     ; 1EFC _ 01. 45, F8
        mov     eax, dword [ebp-18H]                    ; 1EFF _ 8B. 45, E8
        add     dword [ebp-0CH], eax                    ; 1F02 _ 01. 45, F4
        add     dword [ebp-4H], 1                       ; 1F05 _ 83. 45, FC, 01
?_102:  mov     eax, dword [ebp-4H]                     ; 1F09 _ 8B. 45, FC
        cmp     eax, dword [ebp-10H]                    ; 1F0C _ 3B. 45, F0
        jl      ?_101                                   ; 1F0F _ 7C, C3
        leave                                           ; 1F11 _ C9
        ret                                             ; 1F12 _ C3
; api_linewin End of function

handle_keyboard:; Function begin
        push    ebp                                     ; 1F13 _ 55
        mov     ebp, esp                                ; 1F14 _ 89. E5
        sub     esp, 56                                 ; 1F16 _ 83. EC, 38
?_103:  call    io_cli                                  ; 1F19 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1F1E _ 8B. 45, 08
        add     eax, 16                                 ; 1F21 _ 83. C0, 10
        mov     dword [esp], eax                        ; 1F24 _ 89. 04 24
        call    fifo8_status                            ; 1F27 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1F2C _ 85. C0
        jnz     ?_105                                   ; 1F2E _ 75, 2B
        call    io_sti                                  ; 1F30 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+0CH], 0                      ; 1F35 _ 83. 7D, 0C, 00
        jz      ?_104                                   ; 1F39 _ 74, 05
        jmp     ?_109                                   ; 1F3B _ E9, 000000DC

?_104:  call    io_sti                                  ; 1F40 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1F45 _ 8B. 45, 10
        add     eax, 28                                 ; 1F48 _ 83. C0, 1C
        mov     dword [eax], -1                         ; 1F4B _ C7. 00, FFFFFFFF
        mov     eax, 0                                  ; 1F51 _ B8, 00000000
        jmp     ?_110                                   ; 1F56 _ E9, 000000C6

?_105:  mov     eax, dword [ebp+8H]                     ; 1F5B _ 8B. 45, 08
        add     eax, 16                                 ; 1F5E _ 83. C0, 10
        mov     dword [esp], eax                        ; 1F61 _ 89. 04 24
        call    fifo8_get                               ; 1F64 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1F69 _ 89. 45, F4
        call    io_sti                                  ; 1F6C _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 255                    ; 1F71 _ 81. 7D, F4, 000000FF
        jle     ?_106                                   ; 1F78 _ 7E, 37
        mov     edx, dword [sht_back]                   ; 1F7A _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 1F80 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_381                  ; 1F85 _ C7. 44 24, 14, 00000048(d)
        mov     dword [esp+10H], 7                      ; 1F8D _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 176                    ; 1F95 _ C7. 44 24, 0C, 000000B0
        mov     dword [esp+8H], 0                       ; 1F9D _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1FA5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1FA9 _ 89. 04 24
        call    showString                              ; 1FAC _ E8, FFFFFFFC(rel)
?_106:  cmp     dword [ebp-0CH], 1                      ; 1FB1 _ 83. 7D, F4, 01
        jg      ?_107                                   ; 1FB5 _ 7F, 3E
        mov     eax, dword [ebp+8H]                     ; 1FB7 _ 8B. 45, 08
        lea     edx, [eax+10H]                          ; 1FBA _ 8D. 50, 10
        mov     eax, dword [ebp+8H]                     ; 1FBD _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 1FC0 _ 8B. 80, 000000A8
        mov     dword [esp+8H], 1                       ; 1FC6 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], edx                     ; 1FCE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1FD2 _ 89. 04 24
        call    timer_init                              ; 1FD5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1FDA _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 1FDD _ 8B. 80, 000000A8
        mov     dword [esp+4H], 50                      ; 1FE3 _ C7. 44 24, 04, 00000032
        mov     dword [esp], eax                        ; 1FEB _ 89. 04 24
        call    timer_settime                           ; 1FEE _ E8, FFFFFFFC(rel)
        jmp     ?_109                                   ; 1FF3 _ EB, 27

?_107:  cmp     dword [ebp-0CH], 2                      ; 1FF5 _ 83. 7D, F4, 02
        jnz     ?_108                                   ; 1FF9 _ 75, 0F
        mov     eax, dword [ebp+8H]                     ; 1FFB _ 8B. 45, 08
        mov     dword [eax+0A0H], 7                     ; 1FFE _ C7. 80, 000000A0, 00000007
        jmp     ?_109                                   ; 2008 _ EB, 12

?_108:  mov     eax, dword [ebp+10H]                    ; 200A _ 8B. 45, 10
        lea     edx, [eax+1CH]                          ; 200D _ 8D. 50, 1C
        mov     eax, dword [ebp-0CH]                    ; 2010 _ 8B. 45, F4
        mov     dword [edx], eax                        ; 2013 _ 89. 02
        mov     eax, 0                                  ; 2015 _ B8, 00000000
        jmp     ?_110                                   ; 201A _ EB, 05

?_109:  jmp     ?_103                                   ; 201C _ E9, FFFFFEF8

?_110:  leave                                           ; 2021 _ C9
        ret                                             ; 2022 _ C3
; handle_keyboard End of function

close_constask:; Function begin
        push    ebp                                     ; 2023 _ 55
        mov     ebp, esp                                ; 2024 _ 89. E5
        sub     esp, 24                                 ; 2026 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 2029 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 202C _ 89. 04 24
        call    task_sleep                              ; 202F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2034 _ 8B. 45, 08
        mov     eax, dword [eax+0B8H]                   ; 2037 _ 8B. 80, 000000B8
        mov     edx, eax                                ; 203D _ 89. C2
        mov     eax, dword [memman]                     ; 203F _ A1, 00000000(d)
        mov     dword [esp+8H], 65536                   ; 2044 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], edx                     ; 204C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2050 _ 89. 04 24
        call    memman_free_4k                          ; 2053 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2058 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 205B _ 8B. 40, 10
        mov     edx, eax                                ; 205E _ 89. C2
        mov     eax, dword [memman]                     ; 2060 _ A1, 00000000(d)
        mov     dword [esp+8H], 128                     ; 2065 _ C7. 44 24, 08, 00000080
        mov     dword [esp+4H], edx                     ; 206D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2071 _ 89. 04 24
        call    memman_free                             ; 2074 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2079 _ 8B. 45, 08
        mov     eax, dword [eax+0ACH]                   ; 207C _ 8B. 80, 000000AC
        mov     edx, eax                                ; 2082 _ 89. C2
        mov     eax, dword [memman]                     ; 2084 _ A1, 00000000(d)
        mov     dword [esp+8H], 30                      ; 2089 _ C7. 44 24, 08, 0000001E
        mov     dword [esp+4H], edx                     ; 2091 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2095 _ 89. 04 24
        call    memman_free                             ; 2098 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 209D _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 20A0 _ C7. 40, 04, 00000000
        mov     dword [current_console_task], 0         ; 20A7 _ C7. 05, 00000278(d), 00000000
        leave                                           ; 20B1 _ C9
        ret                                             ; 20B2 _ C3
; close_constask End of function

close_console:; Function begin
        push    ebp                                     ; 20B3 _ 55
        mov     ebp, esp                                ; 20B4 _ 89. E5
        sub     esp, 40                                 ; 20B6 _ 83. EC, 28
        mov     eax, dword [ebp+8H]                     ; 20B9 _ 8B. 45, 08
        mov     eax, dword [eax+20H]                    ; 20BC _ 8B. 40, 20
        mov     dword [ebp-0CH], eax                    ; 20BF _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 20C2 _ 8B. 45, F4
        mov     eax, dword [eax+0A8H]                   ; 20C5 _ 8B. 80, 000000A8
        mov     dword [esp], eax                        ; 20CB _ 89. 04 24
        call    timer_free                              ; 20CE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 20D3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 20D6 _ 8B. 00
        mov     edx, eax                                ; 20D8 _ 89. C2
        mov     eax, dword [memman]                     ; 20DA _ A1, 00000000(d)
        mov     dword [esp+8H], 42240                   ; 20DF _ C7. 44 24, 08, 0000A500
        mov     dword [esp+4H], edx                     ; 20E7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 20EB _ 89. 04 24
        call    memman_free_4k                          ; 20EE _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 20F3 _ A1, 00000264(d)
        mov     edx, dword [ebp+8H]                     ; 20F8 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 20FB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 20FF _ 89. 04 24
        call    sheet_free                              ; 2102 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 2107 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 210A _ 89. 04 24
        call    close_constask                          ; 210D _ E8, FFFFFFFC(rel)
        leave                                           ; 2112 _ C9
        ret                                             ; 2113 _ C3
; close_console End of function

cmd_exit:; Function begin
        push    ebp                                     ; 2114 _ 55
        mov     ebp, esp                                ; 2115 _ 89. E5
        sub     esp, 24                                 ; 2117 _ 83. EC, 18
        call    io_cli                                  ; 211A _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 255                     ; 211F _ C7. 44 24, 04, 000000FF
        mov     dword [esp], keyinfo                    ; 2127 _ C7. 04 24, 0000001C(d)
        call    fifo8_put                               ; 212E _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 2133 _ E8, FFFFFFFC(rel)
        leave                                           ; 2138 _ C9
        ret                                             ; 2139 _ C3
; cmd_exit End of function

kernel_api:; Function begin
        push    ebp                                     ; 213A _ 55
        mov     ebp, esp                                ; 213B _ 89. E5
        push    esi                                     ; 213D _ 56
        push    ebx                                     ; 213E _ 53
        sub     esp, 48                                 ; 213F _ 83. EC, 30
        call    task_now                                ; 2142 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2147 _ 89. 45, F4
        lea     eax, [ebp+24H]                          ; 214A _ 8D. 45, 24
        add     eax, 4                                  ; 214D _ 83. C0, 04
        mov     dword [ebp-10H], eax                    ; 2150 _ 89. 45, F0
        mov     dword [ebp-14H], 0                      ; 2153 _ C7. 45, EC, 00000000
        cmp     dword [ebp+1CH], 1                      ; 215A _ 83. 7D, 1C, 01
        jnz     ?_111                                   ; 215E _ 75, 1B
        mov     eax, dword [ebp+24H]                    ; 2160 _ 8B. 45, 24
        movsx   eax, al                                 ; 2163 _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 2166 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 216E _ 89. 04 24
        call    cons_putchar                            ; 2171 _ E8, FFFFFFFC(rel)
        jmp     ?_125                                   ; 2176 _ E9, 000003C0

?_111:  cmp     dword [ebp+1CH], 2                      ; 217B _ 83. 7D, 1C, 02
        jnz     ?_112                                   ; 217F _ 75, 1D
        mov     eax, dword [ebp-0CH]                    ; 2181 _ 8B. 45, F4
        mov     eax, dword [eax+0B0H]                   ; 2184 _ 8B. 80, 000000B0
        mov     edx, dword [eax]                        ; 218A _ 8B. 10
        mov     eax, dword [ebp+18H]                    ; 218C _ 8B. 45, 18
        add     eax, edx                                ; 218F _ 01. D0
        mov     dword [esp], eax                        ; 2191 _ 89. 04 24
        call    cons_putstr                             ; 2194 _ E8, FFFFFFFC(rel)
        jmp     ?_125                                   ; 2199 _ E9, 0000039D

?_112:  cmp     dword [ebp+1CH], 4                      ; 219E _ 83. 7D, 1C, 04
        jnz     ?_113                                   ; 21A2 _ 75, 15
        mov     eax, dword [ebp-0CH]                    ; 21A4 _ 8B. 45, F4
        mov     dword [eax+34H], 0                      ; 21A7 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-0CH]                    ; 21AE _ 8B. 45, F4
        add     eax, 48                                 ; 21B1 _ 83. C0, 30
        jmp     ?_126                                   ; 21B4 _ E9, 00000387

?_113:  cmp     dword [ebp+1CH], 5                      ; 21B9 _ 83. 7D, 1C, 05
        jne     ?_114                                   ; 21BD _ 0F 85, 00000107
        mov     eax, dword [shtctl]                     ; 21C3 _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 21C8 _ 89. 04 24
        call    sheet_alloc                             ; 21CB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 21D0 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 21D3 _ 8B. 45, E8
        mov     edx, dword [ebp-0CH]                    ; 21D6 _ 8B. 55, F4
        mov     dword [eax+20H], edx                    ; 21D9 _ 89. 50, 20
        mov     eax, dword [ebp-18H]                    ; 21DC _ 8B. 45, E8
        mov     eax, dword [eax+1CH]                    ; 21DF _ 8B. 40, 1C
        or      eax, 10H                                ; 21E2 _ 83. C8, 10
        mov     edx, eax                                ; 21E5 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 21E7 _ 8B. 45, E8
        mov     dword [eax+1CH], edx                    ; 21EA _ 89. 50, 1C
        mov     eax, dword [ebp+24H]                    ; 21ED _ 8B. 45, 24
        mov     edx, dword [ebp-0CH]                    ; 21F0 _ 8B. 55, F4
        mov     edx, dword [edx+0B0H]                   ; 21F3 _ 8B. 92, 000000B0
        mov     ecx, dword [edx+4H]                     ; 21F9 _ 8B. 4A, 04
        mov     edx, dword [ebp+18H]                    ; 21FC _ 8B. 55, 18
        add     edx, ecx                                ; 21FF _ 01. CA
        mov     dword [esp+10H], eax                    ; 2201 _ 89. 44 24, 10
        mov     eax, dword [ebp+8H]                     ; 2205 _ 8B. 45, 08
        mov     dword [esp+0CH], eax                    ; 2208 _ 89. 44 24, 0C
        mov     eax, dword [ebp+0CH]                    ; 220C _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 220F _ 89. 44 24, 08
        mov     dword [esp+4H], edx                     ; 2213 _ 89. 54 24, 04
        mov     eax, dword [ebp-18H]                    ; 2217 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 221A _ 89. 04 24
        call    sheet_setbuf                            ; 221D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 2222 _ 8B. 45, F4
        mov     eax, dword [eax+0B0H]                   ; 2225 _ 8B. 80, 000000B0
        mov     edx, dword [eax]                        ; 222B _ 8B. 10
        mov     eax, dword [ebp+20H]                    ; 222D _ 8B. 45, 20
        add     edx, eax                                ; 2230 _ 01. C2
        mov     eax, dword [shtctl]                     ; 2232 _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 2237 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], edx                     ; 223F _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 2243 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2246 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 224A _ 89. 04 24
        call    make_window8                            ; 224D _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 2252 _ A1, 00000264(d)
        mov     eax, dword [eax+0CH]                    ; 2257 _ 8B. 40, 0C
        sub     eax, dword [ebp+8H]                     ; 225A _ 2B. 45, 08
        mov     edx, eax                                ; 225D _ 89. C2
        shr     edx, 31                                 ; 225F _ C1. EA, 1F
        add     eax, edx                                ; 2262 _ 01. D0
        sar     eax, 1                                  ; 2264 _ D1. F8
        mov     ecx, eax                                ; 2266 _ 89. C1
        mov     eax, dword [shtctl]                     ; 2268 _ A1, 00000264(d)
        mov     eax, dword [eax+8H]                     ; 226D _ 8B. 40, 08
        sub     eax, dword [ebp+0CH]                    ; 2270 _ 2B. 45, 0C
        mov     edx, eax                                ; 2273 _ 89. C2
        shr     edx, 31                                 ; 2275 _ C1. EA, 1F
        add     eax, edx                                ; 2278 _ 01. D0
        sar     eax, 1                                  ; 227A _ D1. F8
        mov     edx, eax                                ; 227C _ 89. C2
        mov     eax, dword [shtctl]                     ; 227E _ A1, 00000264(d)
        mov     dword [esp+0CH], ecx                    ; 2283 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2287 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 228B _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 228E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2292 _ 89. 04 24
        call    sheet_slide                             ; 2295 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 229A _ A1, 00000264(d)
        mov     edx, dword [eax+10H]                    ; 229F _ 8B. 50, 10
        mov     eax, dword [shtctl]                     ; 22A2 _ A1, 00000264(d)
        mov     dword [esp+8H], edx                     ; 22A7 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 22AB _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 22AE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 22B2 _ 89. 04 24
        call    sheet_updown                            ; 22B5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 22BA _ 8B. 45, F0
        lea     edx, [eax+1CH]                          ; 22BD _ 8D. 50, 1C
        mov     eax, dword [ebp-18H]                    ; 22C0 _ 8B. 45, E8
        mov     dword [edx], eax                        ; 22C3 _ 89. 02
        jmp     ?_125                                   ; 22C5 _ E9, 00000271

?_114:  cmp     dword [ebp+1CH], 6                      ; 22CA _ 83. 7D, 1C, 06
        jne     ?_115                                   ; 22CE _ 0F 85, 0000008C
        mov     eax, dword [ebp+18H]                    ; 22D4 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 22D7 _ 89. 45, E8
        mov     eax, dword [ebp-0CH]                    ; 22DA _ 8B. 45, F4
        mov     eax, dword [eax+0B0H]                   ; 22DD _ 8B. 80, 000000B0
        mov     edx, dword [eax+4H]                     ; 22E3 _ 8B. 50, 04
        mov     eax, dword [ebp+10H]                    ; 22E6 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 22E9 _ 8D. 0C 02
        mov     eax, dword [ebp+24H]                    ; 22EC _ 8B. 45, 24
        movsx   edx, al                                 ; 22EF _ 0F BE. D0
        mov     eax, dword [shtctl]                     ; 22F2 _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 22F7 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 22FB _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 22FF _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 2302 _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 2306 _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 2309 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 230D _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2310 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2314 _ 89. 04 24
        call    showString                              ; 2317 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 231C _ 8B. 45, 08
        lea     ecx, [eax+10H]                          ; 231F _ 8D. 48, 10
        mov     eax, dword [ebp+20H]                    ; 2322 _ 8B. 45, 20
        lea     edx, [eax*8]                            ; 2325 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp+0CH]                    ; 232C _ 8B. 45, 0C
        add     edx, eax                                ; 232F _ 01. C2
        mov     eax, dword [shtctl]                     ; 2331 _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 2336 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 233A _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 233E _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 2341 _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 2345 _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 2348 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 234C _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 234F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2353 _ 89. 04 24
        call    sheet_refresh                           ; 2356 _ E8, FFFFFFFC(rel)
        jmp     ?_125                                   ; 235B _ E9, 000001DB

?_115:  cmp     dword [ebp+1CH], 7                      ; 2360 _ 83. 7D, 1C, 07
        jnz     ?_116                                   ; 2364 _ 75, 7E
        mov     eax, dword [ebp+18H]                    ; 2366 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 2369 _ 89. 45, E8
        mov     ebx, dword [ebp+24H]                    ; 236C _ 8B. 5D, 24
        mov     eax, dword [ebp+10H]                    ; 236F _ 8B. 45, 10
        movzx   ecx, al                                 ; 2372 _ 0F B6. C8
        mov     eax, dword [ebp-18H]                    ; 2375 _ 8B. 45, E8
        mov     edx, dword [eax+4H]                     ; 2378 _ 8B. 50, 04
        mov     eax, dword [ebp-18H]                    ; 237B _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 237E _ 8B. 00
        mov     esi, dword [ebp+8H]                     ; 2380 _ 8B. 75, 08
        mov     dword [esp+18H], esi                    ; 2383 _ 89. 74 24, 18
        mov     esi, dword [ebp+0CH]                    ; 2387 _ 8B. 75, 0C
        mov     dword [esp+14H], esi                    ; 238A _ 89. 74 24, 14
        mov     esi, dword [ebp+20H]                    ; 238E _ 8B. 75, 20
        mov     dword [esp+10H], esi                    ; 2391 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2395 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2399 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 239D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 23A1 _ 89. 04 24
        call    boxfill8                                ; 23A4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 23A9 _ 8B. 45, 08
        lea     ebx, [eax+1H]                           ; 23AC _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 23AF _ 8B. 45, 0C
        lea     ecx, [eax+1H]                           ; 23B2 _ 8D. 48, 01
        mov     edx, dword [ebp+24H]                    ; 23B5 _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 23B8 _ A1, 00000264(d)
        mov     dword [esp+14H], ebx                    ; 23BD _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 23C1 _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 23C5 _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 23C8 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 23CC _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 23D0 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 23D3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 23D7 _ 89. 04 24
        call    sheet_refresh                           ; 23DA _ E8, FFFFFFFC(rel)
        jmp     ?_125                                   ; 23DF _ E9, 00000157

?_116:  cmp     dword [ebp+1CH], 11                     ; 23E4 _ 83. 7D, 1C, 0B
        jnz     ?_117                                   ; 23E8 _ 75, 28
        mov     eax, dword [ebp+18H]                    ; 23EA _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 23ED _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 23F0 _ 8B. 45, E8
        mov     edx, dword [eax]                        ; 23F3 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 23F5 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 23F8 _ 8B. 40, 04
        imul    eax, dword [ebp+8H]                     ; 23FB _ 0F AF. 45, 08
        mov     ecx, eax                                ; 23FF _ 89. C1
        mov     eax, dword [ebp+0CH]                    ; 2401 _ 8B. 45, 0C
        add     eax, ecx                                ; 2404 _ 01. C8
        add     edx, eax                                ; 2406 _ 01. C2
        mov     eax, dword [ebp+24H]                    ; 2408 _ 8B. 45, 24
        mov     byte [edx], al                          ; 240B _ 88. 02
        jmp     ?_125                                   ; 240D _ E9, 00000129

?_117:  cmp     dword [ebp+1CH], 12                     ; 2412 _ 83. 7D, 1C, 0C
        jnz     ?_118                                   ; 2416 _ 75, 3B
        mov     eax, dword [ebp+18H]                    ; 2418 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 241B _ 89. 45, E8
        mov     edx, dword [ebp+24H]                    ; 241E _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 2421 _ A1, 00000264(d)
        mov     ecx, dword [ebp+8H]                     ; 2426 _ 8B. 4D, 08
        mov     dword [esp+14H], ecx                    ; 2429 _ 89. 4C 24, 14
        mov     ecx, dword [ebp+0CH]                    ; 242D _ 8B. 4D, 0C
        mov     dword [esp+10H], ecx                    ; 2430 _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 2434 _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 2437 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 243B _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 243F _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2442 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2446 _ 89. 04 24
        call    sheet_refresh                           ; 2449 _ E8, FFFFFFFC(rel)
        jmp     ?_125                                   ; 244E _ E9, 000000E8

?_118:  cmp     dword [ebp+1CH], 13                     ; 2453 _ 83. 7D, 1C, 0D
        jnz     ?_119                                   ; 2457 _ 75, 39
        mov     eax, dword [ebp+18H]                    ; 2459 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 245C _ 89. 45, E8
        mov     eax, dword [ebp+24H]                    ; 245F _ 8B. 45, 24
        mov     edx, dword [ebp+10H]                    ; 2462 _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 2465 _ 89. 54 24, 14
        mov     edx, dword [ebp+8H]                     ; 2469 _ 8B. 55, 08
        mov     dword [esp+10H], edx                    ; 246C _ 89. 54 24, 10
        mov     edx, dword [ebp+0CH]                    ; 2470 _ 8B. 55, 0C
        mov     dword [esp+0CH], edx                    ; 2473 _ 89. 54 24, 0C
        mov     edx, dword [ebp+20H]                    ; 2477 _ 8B. 55, 20
        mov     dword [esp+8H], edx                     ; 247A _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 247E _ 89. 44 24, 04
        mov     eax, dword [ebp-18H]                    ; 2482 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 2485 _ 89. 04 24
        call    api_linewin                             ; 2488 _ E8, FFFFFFFC(rel)
        jmp     ?_125                                   ; 248D _ E9, 000000A9

?_119:  cmp     dword [ebp+1CH], 14                     ; 2492 _ 83. 7D, 1C, 0E
        jnz     ?_120                                   ; 2496 _ 75, 19
        mov     edx, dword [ebp+18H]                    ; 2498 _ 8B. 55, 18
        mov     eax, dword [shtctl]                     ; 249B _ A1, 00000264(d)
        mov     dword [esp+4H], edx                     ; 24A0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 24A4 _ 89. 04 24
        call    sheet_free                              ; 24A7 _ E8, FFFFFFFC(rel)
        jmp     ?_125                                   ; 24AC _ E9, 0000008A

?_120:  cmp     dword [ebp+1CH], 15                     ; 24B1 _ 83. 7D, 1C, 0F
        jnz     ?_121                                   ; 24B5 _ 75, 1B
        mov     eax, dword [ebp+24H]                    ; 24B7 _ 8B. 45, 24
        mov     edx, dword [ebp-10H]                    ; 24BA _ 8B. 55, F0
        mov     dword [esp+8H], edx                     ; 24BD _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 24C1 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 24C5 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 24C8 _ 89. 04 24
        call    handle_keyboard                         ; 24CB _ E8, FFFFFFFC(rel)
        jmp     ?_125                                   ; 24D0 _ EB, 69

?_121:  cmp     dword [ebp+1CH], 16                     ; 24D2 _ 83. 7D, 1C, 10
        jnz     ?_122                                   ; 24D6 _ 75, 0F
        mov     eax, dword [ebp-10H]                    ; 24D8 _ 8B. 45, F0
        lea     ebx, [eax+1CH]                          ; 24DB _ 8D. 58, 1C
        call    timer_alloc                             ; 24DE _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 24E3 _ 89. 03
        jmp     ?_125                                   ; 24E5 _ EB, 54

?_122:  cmp     dword [ebp+1CH], 17                     ; 24E7 _ 83. 7D, 1C, 11
        jnz     ?_123                                   ; 24EB _ 75, 21
        mov     eax, dword [ebp+24H]                    ; 24ED _ 8B. 45, 24
        movzx   edx, al                                 ; 24F0 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 24F3 _ 8B. 45, F4
        lea     ecx, [eax+10H]                          ; 24F6 _ 8D. 48, 10
        mov     eax, dword [ebp+18H]                    ; 24F9 _ 8B. 45, 18
        mov     dword [esp+8H], edx                     ; 24FC _ 89. 54 24, 08
        mov     dword [esp+4H], ecx                     ; 2500 _ 89. 4C 24, 04
        mov     dword [esp], eax                        ; 2504 _ 89. 04 24
        call    timer_init                              ; 2507 _ E8, FFFFFFFC(rel)
        jmp     ?_125                                   ; 250C _ EB, 2D

?_123:  cmp     dword [ebp+1CH], 18                     ; 250E _ 83. 7D, 1C, 12
        jnz     ?_124                                   ; 2512 _ 75, 16
        mov     eax, dword [ebp+24H]                    ; 2514 _ 8B. 45, 24
        mov     edx, eax                                ; 2517 _ 89. C2
        mov     eax, dword [ebp+18H]                    ; 2519 _ 8B. 45, 18
        mov     dword [esp+4H], edx                     ; 251C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2520 _ 89. 04 24
        call    timer_settime                           ; 2523 _ E8, FFFFFFFC(rel)
        jmp     ?_125                                   ; 2528 _ EB, 11

?_124:  cmp     dword [ebp+1CH], 19                     ; 252A _ 83. 7D, 1C, 13
        jnz     ?_125                                   ; 252E _ 75, 0B
        mov     eax, dword [ebp+18H]                    ; 2530 _ 8B. 45, 18
        mov     dword [esp], eax                        ; 2533 _ 89. 04 24
        call    timer_free                              ; 2536 _ E8, FFFFFFFC(rel)
?_125:  mov     eax, 0                                  ; 253B _ B8, 00000000
?_126:  add     esp, 48                                 ; 2540 _ 83. C4, 30
        pop     ebx                                     ; 2543 _ 5B
        pop     esi                                     ; 2544 _ 5E
        pop     ebp                                     ; 2545 _ 5D
        ret                                             ; 2546 _ C3
; kernel_api End of function

cons_putchar:; Function begin
        push    ebp                                     ; 2547 _ 55
        mov     ebp, esp                                ; 2548 _ 89. E5
        push    esi                                     ; 254A _ 56
        push    ebx                                     ; 254B _ 53
        sub     esp, 48                                 ; 254C _ 83. EC, 30
        mov     edx, dword [ebp+8H]                     ; 254F _ 8B. 55, 08
        mov     eax, dword [ebp+0CH]                    ; 2552 _ 8B. 45, 0C
        mov     byte [ebp-1CH], dl                      ; 2555 _ 88. 55, E4
        mov     byte [ebp-20H], al                      ; 2558 _ 88. 45, E0
        call    task_now                                ; 255B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2560 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 2563 _ 8B. 45, F4
        mov     ebx, dword [eax+9CH]                    ; 2566 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 256C _ 8B. 45, F4
        mov     ecx, dword [eax+98H]                    ; 256F _ 8B. 88, 00000098
        mov     eax, dword [ebp-0CH]                    ; 2575 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 2578 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 257E _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 2583 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 258B _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 258F _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2593 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2597 _ 89. 04 24
        call    set_cursor                              ; 259A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 259F _ 8B. 45, F4
        movzx   edx, byte [ebp-1CH]                     ; 25A2 _ 0F B6. 55, E4
        mov     byte [eax+0A4H], dl                     ; 25A6 _ 88. 90, 000000A4
        mov     eax, dword [ebp-0CH]                    ; 25AC _ 8B. 45, F4
        mov     byte [eax+0A5H], 0                      ; 25AF _ C6. 80, 000000A5, 00
        mov     eax, dword [ebp-0CH]                    ; 25B6 _ 8B. 45, F4
        lea     esi, [eax+0A4H]                         ; 25B9 _ 8D. B0, 000000A4
        mov     eax, dword [ebp-0CH]                    ; 25BF _ 8B. 45, F4
        mov     ebx, dword [eax+9CH]                    ; 25C2 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 25C8 _ 8B. 45, F4
        mov     ecx, dword [eax+98H]                    ; 25CB _ 8B. 88, 00000098
        mov     eax, dword [ebp-0CH]                    ; 25D1 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 25D4 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 25DA _ A1, 00000264(d)
        mov     dword [esp+14H], esi                    ; 25DF _ 89. 74 24, 14
        mov     dword [esp+10H], 7                      ; 25E3 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 25EB _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 25EF _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 25F3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25F7 _ 89. 04 24
        call    showString                              ; 25FA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 25FF _ 8B. 45, F4
        mov     eax, dword [eax+98H]                    ; 2602 _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 2608 _ 8D. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 260B _ 8B. 45, F4
        mov     dword [eax+98H], edx                    ; 260E _ 89. 90, 00000098
        add     esp, 48                                 ; 2614 _ 83. C4, 30
        pop     ebx                                     ; 2617 _ 5B
        pop     esi                                     ; 2618 _ 5E
        pop     ebp                                     ; 2619 _ 5D
        ret                                             ; 261A _ C3
; cons_putchar End of function

cons_newline:; Function begin
        push    ebp                                     ; 261B _ 55
        mov     ebp, esp                                ; 261C _ 89. E5
        push    ebx                                     ; 261E _ 53
        sub     esp, 52                                 ; 261F _ 83. EC, 34
        cmp     dword [ebp+8H], 139                     ; 2622 _ 81. 7D, 08, 0000008B
        jg      ?_127                                   ; 2629 _ 7F, 09
        add     dword [ebp+8H], 16                      ; 262B _ 83. 45, 08, 10
        jmp     ?_136                                   ; 262F _ E9, 000000DF

?_127:  mov     dword [ebp-10H], 28                     ; 2634 _ C7. 45, F0, 0000001C
        jmp     ?_131                                   ; 263B _ EB, 52

?_128:  mov     dword [ebp-0CH], 8                      ; 263D _ C7. 45, F4, 00000008
        jmp     ?_130                                   ; 2644 _ EB, 3C

?_129:  mov     eax, dword [ebp+0CH]                    ; 2646 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2649 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 264B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 264E _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 2651 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 2655 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2657 _ 8B. 45, F4
        add     eax, ecx                                ; 265A _ 01. C8
        add     edx, eax                                ; 265C _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 265E _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 2661 _ 8B. 08
        mov     eax, dword [ebp-10H]                    ; 2663 _ 8B. 45, F0
        lea     ebx, [eax+10H]                          ; 2666 _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 2669 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 266C _ 8B. 40, 04
        imul    ebx, eax                                ; 266F _ 0F AF. D8
        mov     eax, dword [ebp-0CH]                    ; 2672 _ 8B. 45, F4
        add     eax, ebx                                ; 2675 _ 01. D8
        add     eax, ecx                                ; 2677 _ 01. C8
        movzx   eax, byte [eax]                         ; 2679 _ 0F B6. 00
        mov     byte [edx], al                          ; 267C _ 88. 02
        add     dword [ebp-0CH], 1                      ; 267E _ 83. 45, F4, 01
?_130:  cmp     dword [ebp-0CH], 247                    ; 2682 _ 81. 7D, F4, 000000F7
        jle     ?_129                                   ; 2689 _ 7E, BB
        add     dword [ebp-10H], 1                      ; 268B _ 83. 45, F0, 01
?_131:  cmp     dword [ebp-10H], 139                    ; 268F _ 81. 7D, F0, 0000008B
        jle     ?_128                                   ; 2696 _ 7E, A5
        mov     dword [ebp-10H], 140                    ; 2698 _ C7. 45, F0, 0000008C
        jmp     ?_135                                   ; 269F _ EB, 35

?_132:  mov     dword [ebp-0CH], 8                      ; 26A1 _ C7. 45, F4, 00000008
        jmp     ?_134                                   ; 26A8 _ EB, 1F

?_133:  mov     eax, dword [ebp+0CH]                    ; 26AA _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 26AD _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 26AF _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 26B2 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 26B5 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 26B9 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 26BB _ 8B. 45, F4
        add     eax, ecx                                ; 26BE _ 01. C8
        add     eax, edx                                ; 26C0 _ 01. D0
        mov     byte [eax], 0                           ; 26C2 _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 26C5 _ 83. 45, F4, 01
?_134:  cmp     dword [ebp-0CH], 247                    ; 26C9 _ 81. 7D, F4, 000000F7
        jle     ?_133                                   ; 26D0 _ 7E, D8
        add     dword [ebp-10H], 1                      ; 26D2 _ 83. 45, F0, 01
?_135:  cmp     dword [ebp-10H], 155                    ; 26D6 _ 81. 7D, F0, 0000009B
        jle     ?_132                                   ; 26DD _ 7E, C2
        mov     eax, dword [shtctl]                     ; 26DF _ A1, 00000264(d)
        mov     dword [esp+14H], 156                    ; 26E4 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 26EC _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 26F4 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 26FC _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 2704 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2707 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 270B _ 89. 04 24
        call    sheet_refresh                           ; 270E _ E8, FFFFFFFC(rel)
?_136:  mov     eax, dword [shtctl]                     ; 2713 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_373                  ; 2718 _ C7. 44 24, 14, 00000023(d)
        mov     dword [esp+10H], 7                      ; 2720 _ C7. 44 24, 10, 00000007
        mov     edx, dword [ebp+8H]                     ; 2728 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 272B _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 272F _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 2737 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 273A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 273E _ 89. 04 24
        call    showString                              ; 2741 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2746 _ 8B. 45, 08
        add     esp, 52                                 ; 2749 _ 83. C4, 34
        pop     ebx                                     ; 274C _ 5B
        pop     ebp                                     ; 274D _ 5D
        ret                                             ; 274E _ C3
; cons_newline End of function

init_screen8:; Function begin
        push    ebp                                     ; 274F _ 55
        mov     ebp, esp                                ; 2750 _ 89. E5
        push    ebx                                     ; 2752 _ 53
        sub     esp, 36                                 ; 2753 _ 83. EC, 24
        mov     eax, dword [ebp+10H]                    ; 2756 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 2759 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 275C _ 8B. 45, 0C
        sub     eax, 1                                  ; 275F _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 2762 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 2766 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 276A _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 2772 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 277A _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2782 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2785 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2789 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 278C _ 89. 04 24
        call    boxfill8                                ; 278F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2794 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 2797 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 279A _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 279D _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 27A0 _ 8B. 45, 10
        sub     eax, 28                                 ; 27A3 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 27A6 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 27AA _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 27AE _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 27B2 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 27BA _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 27C2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 27C5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 27C9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 27CC _ 89. 04 24
        call    boxfill8                                ; 27CF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 27D4 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 27D7 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 27DA _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 27DD _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 27E0 _ 8B. 45, 10
        sub     eax, 27                                 ; 27E3 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 27E6 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 27EA _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 27EE _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 27F2 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 27FA _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2802 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2805 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2809 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 280C _ 89. 04 24
        call    boxfill8                                ; 280F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2814 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 2817 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 281A _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 281D _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2820 _ 8B. 45, 10
        sub     eax, 26                                 ; 2823 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 2826 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 282A _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 282E _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 2832 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 283A _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 2842 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2845 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2849 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 284C _ 89. 04 24
        call    boxfill8                                ; 284F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2854 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2857 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 285A _ 8B. 45, 10
        sub     eax, 24                                 ; 285D _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 2860 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2864 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 286C _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 2870 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 2878 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2880 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2883 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2887 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 288A _ 89. 04 24
        call    boxfill8                                ; 288D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2892 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 2895 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2898 _ 8B. 45, 10
        sub     eax, 24                                 ; 289B _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 289E _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 28A2 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 28AA _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 28AE _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 28B6 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 28BE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 28C1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 28C5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 28C8 _ 89. 04 24
        call    boxfill8                                ; 28CB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 28D0 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 28D3 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 28D6 _ 8B. 45, 10
        sub     eax, 4                                  ; 28D9 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 28DC _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 28E0 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 28E8 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 28EC _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 28F4 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 28FC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 28FF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2903 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2906 _ 89. 04 24
        call    boxfill8                                ; 2909 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 290E _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 2911 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 2914 _ 8B. 45, 10
        sub     eax, 23                                 ; 2917 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 291A _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 291E _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2926 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 292A _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 2932 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 293A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 293D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2941 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2944 _ 89. 04 24
        call    boxfill8                                ; 2947 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 294C _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 294F _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 2952 _ 8B. 45, 10
        sub     eax, 3                                  ; 2955 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 2958 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 295C _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2964 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 2968 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 2970 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2978 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 297B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 297F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2982 _ 89. 04 24
        call    boxfill8                                ; 2985 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 298A _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 298D _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 2990 _ 8B. 45, 10
        sub     eax, 24                                 ; 2993 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 2996 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 299A _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 29A2 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 29A6 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 29AE _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 29B6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 29B9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 29BD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 29C0 _ 89. 04 24
        call    boxfill8                                ; 29C3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 29C8 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 29CB _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 29CE _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 29D1 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 29D4 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 29D7 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 29DA _ 8B. 45, 0C
        sub     eax, 47                                 ; 29DD _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 29E0 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 29E4 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 29E8 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 29EC _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 29F0 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 29F8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 29FB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 29FF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2A02 _ 89. 04 24
        call    boxfill8                                ; 2A05 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2A0A _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 2A0D _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 2A10 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 2A13 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 2A16 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 2A19 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 2A1C _ 8B. 45, 0C
        sub     eax, 47                                 ; 2A1F _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 2A22 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2A26 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2A2A _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2A2E _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 2A32 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2A3A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2A3D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2A41 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2A44 _ 89. 04 24
        call    boxfill8                                ; 2A47 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2A4C _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 2A4F _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 2A52 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 2A55 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 2A58 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2A5B _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 2A5E _ 8B. 45, 0C
        sub     eax, 47                                 ; 2A61 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 2A64 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2A68 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2A6C _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2A70 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 2A74 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2A7C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2A7F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2A83 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2A86 _ 89. 04 24
        call    boxfill8                                ; 2A89 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2A8E _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 2A91 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 2A94 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 2A97 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 2A9A _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2A9D _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 2AA0 _ 8B. 45, 0C
        sub     eax, 3                                  ; 2AA3 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 2AA6 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2AAA _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2AAE _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2AB2 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 2AB6 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2ABE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2AC1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2AC5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2AC8 _ 89. 04 24
        call    boxfill8                                ; 2ACB _ E8, FFFFFFFC(rel)
        add     esp, 36                                 ; 2AD0 _ 83. C4, 24
        pop     ebx                                     ; 2AD3 _ 5B
        pop     ebp                                     ; 2AD4 _ 5D
        ret                                             ; 2AD5 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 2AD6 _ 55
        mov     ebp, esp                                ; 2AD7 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 2AD9 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 2ADC _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 2ADF _ A1, 00000134(d)
        add     eax, edx                                ; 2AE4 _ 01. D0
        mov     dword [mx], eax                         ; 2AE6 _ A3, 00000134(d)
        mov     eax, dword [ebp+10H]                    ; 2AEB _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 2AEE _ 8B. 50, 08
        mov     eax, dword [my]                         ; 2AF1 _ A1, 00000138(d)
        add     eax, edx                                ; 2AF6 _ 01. D0
        mov     dword [my], eax                         ; 2AF8 _ A3, 00000138(d)
        mov     eax, dword [mx]                         ; 2AFD _ A1, 00000134(d)
        test    eax, eax                                ; 2B02 _ 85. C0
        jns     ?_137                                   ; 2B04 _ 79, 0A
        mov     dword [mx], 0                           ; 2B06 _ C7. 05, 00000134(d), 00000000
?_137:  mov     eax, dword [my]                         ; 2B10 _ A1, 00000138(d)
        test    eax, eax                                ; 2B15 _ 85. C0
        jns     ?_138                                   ; 2B17 _ 79, 0A
        mov     dword [my], 0                           ; 2B19 _ C7. 05, 00000138(d), 00000000
?_138:  mov     eax, dword [xsize]                      ; 2B23 _ A1, 0000013C(d)
        lea     edx, [eax-1H]                           ; 2B28 _ 8D. 50, FF
        mov     eax, dword [mx]                         ; 2B2B _ A1, 00000134(d)
        cmp     edx, eax                                ; 2B30 _ 39. C2
        jge     ?_139                                   ; 2B32 _ 7D, 0D
        mov     eax, dword [xsize]                      ; 2B34 _ A1, 0000013C(d)
        sub     eax, 1                                  ; 2B39 _ 83. E8, 01
        mov     dword [mx], eax                         ; 2B3C _ A3, 00000134(d)
?_139:  mov     eax, dword [ysize]                      ; 2B41 _ A1, 00000140(d)
        lea     edx, [eax-1H]                           ; 2B46 _ 8D. 50, FF
        mov     eax, dword [my]                         ; 2B49 _ A1, 00000138(d)
        cmp     edx, eax                                ; 2B4E _ 39. C2
        jge     ?_140                                   ; 2B50 _ 7D, 0D
        mov     eax, dword [ysize]                      ; 2B52 _ A1, 00000140(d)
        sub     eax, 1                                  ; 2B57 _ 83. E8, 01
        mov     dword [my], eax                         ; 2B5A _ A3, 00000138(d)
?_140:  pop     ebp                                     ; 2B5F _ 5D
        ret                                             ; 2B60 _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 2B61 _ 55
        mov     ebp, esp                                ; 2B62 _ 89. E5
        sub     esp, 72                                 ; 2B64 _ 83. EC, 48
        mov     eax, dword [buf_back]                   ; 2B67 _ A1, 00000144(d)
        mov     dword [ebp-10H], eax                    ; 2B6C _ 89. 45, F0
        mov     byte [ebp-11H], 0                       ; 2B6F _ C6. 45, EF, 00
        mov     dword [ebp-18H], 0                      ; 2B73 _ C7. 45, E8, 00000000
        call    io_sti                                  ; 2B7A _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 2B7F _ C7. 04 24, 00000038(d)
        call    fifo8_get                               ; 2B86 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-11H], al                      ; 2B8B _ 88. 45, EF
        movzx   eax, byte [ebp-11H]                     ; 2B8E _ 0F B6. 45, EF
        mov     dword [esp+4H], eax                     ; 2B92 _ 89. 44 24, 04
        mov     dword [esp], mdec                       ; 2B96 _ C7. 04 24, 00000100(d)
        call    mouse_decode                            ; 2B9D _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 2BA2 _ 85. C0
        je      ?_149                                   ; 2BA4 _ 0F 84, 00000300
        mov     dword [esp+8H], mdec                    ; 2BAA _ C7. 44 24, 08, 00000100(d)
        mov     eax, dword [ebp+0CH]                    ; 2BB2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2BB5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2BB9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2BBC _ 89. 04 24
        call    computeMousePosition                    ; 2BBF _ E8, FFFFFFFC(rel)
        mov     edx, dword [my]                         ; 2BC4 _ 8B. 15, 00000138(d)
        mov     eax, dword [mx]                         ; 2BCA _ A1, 00000134(d)
        mov     dword [esp+0CH], edx                    ; 2BCF _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 2BD3 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2BD7 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2BDA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2BDE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2BE1 _ 89. 04 24
        call    sheet_slide                             ; 2BE4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_396]                      ; 2BE9 _ A1, 0000010C(d)
        and     eax, 01H                                ; 2BEE _ 83. E0, 01
        test    eax, eax                                ; 2BF1 _ 85. C0
        je      ?_148                                   ; 2BF3 _ 0F 84, 000002A7
        mov     eax, dword [mmx]                        ; 2BF9 _ A1, 00000118(d)
        test    eax, eax                                ; 2BFE _ 85. C0
        jns     ?_147                                   ; 2C00 _ 0F 89, 00000229
        mov     eax, dword [ebp+8H]                     ; 2C06 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2C09 _ 8B. 40, 10
        sub     eax, 1                                  ; 2C0C _ 83. E8, 01
        mov     dword [ebp-0CH], eax                    ; 2C0F _ 89. 45, F4
        jmp     ?_145                                   ; 2C12 _ E9, 0000020A

?_141:  mov     eax, dword [ebp+8H]                     ; 2C17 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2C1A _ 8B. 55, F4
        add     edx, 4                                  ; 2C1D _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2C20 _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 2C24 _ 89. 45, E8
        mov     edx, dword [mx]                         ; 2C27 _ 8B. 15, 00000134(d)
        mov     eax, dword [ebp-18H]                    ; 2C2D _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 2C30 _ 8B. 40, 0C
        sub     edx, eax                                ; 2C33 _ 29. C2
        mov     eax, edx                                ; 2C35 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2C37 _ 89. 45, E4
        mov     edx, dword [my]                         ; 2C3A _ 8B. 15, 00000138(d)
        mov     eax, dword [ebp-18H]                    ; 2C40 _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 2C43 _ 8B. 40, 10
        sub     edx, eax                                ; 2C46 _ 29. C2
        mov     eax, edx                                ; 2C48 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 2C4A _ 89. 45, E0
        cmp     dword [ebp-1CH], 0                      ; 2C4D _ 83. 7D, E4, 00
        js      ?_144                                   ; 2C51 _ 0F 88, 000001C6
        mov     eax, dword [ebp-18H]                    ; 2C57 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2C5A _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 2C5D _ 3B. 45, E4
        jle     ?_144                                   ; 2C60 _ 0F 8E, 000001B7
        cmp     dword [ebp-20H], 0                      ; 2C66 _ 83. 7D, E0, 00
        js      ?_144                                   ; 2C6A _ 0F 88, 000001AD
        mov     eax, dword [ebp-18H]                    ; 2C70 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 2C73 _ 8B. 40, 08
        cmp     eax, dword [ebp-20H]                    ; 2C76 _ 3B. 45, E0
        jle     ?_144                                   ; 2C79 _ 0F 8E, 0000019E
        mov     eax, dword [ebp-18H]                    ; 2C7F _ 8B. 45, E8
        mov     edx, dword [eax]                        ; 2C82 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 2C84 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2C87 _ 8B. 40, 04
        imul    eax, dword [ebp-20H]                    ; 2C8A _ 0F AF. 45, E0
        mov     ecx, eax                                ; 2C8E _ 89. C1
        mov     eax, dword [ebp-1CH]                    ; 2C90 _ 8B. 45, E4
        add     eax, ecx                                ; 2C93 _ 01. C8
        add     eax, edx                                ; 2C95 _ 01. D0
        movzx   eax, byte [eax]                         ; 2C97 _ 0F B6. 00
        movzx   edx, al                                 ; 2C9A _ 0F B6. D0
        mov     eax, dword [ebp-18H]                    ; 2C9D _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 2CA0 _ 8B. 40, 14
        cmp     edx, eax                                ; 2CA3 _ 39. C2
        je      ?_144                                   ; 2CA5 _ 0F 84, 00000172
        mov     eax, dword [current_console_task]       ; 2CAB _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 2CB0 _ 8B. 80, 000000B4
        mov     dword [esp+0CH], 0                      ; 2CB6 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_369                   ; 2CBE _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], eax                     ; 2CC6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2CCA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2CCD _ 89. 04 24
        call    make_wtitle8                            ; 2CD0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 2CD5 _ 8B. 45, E8
        mov     ecx, dword [eax+8H]                     ; 2CD8 _ 8B. 48, 08
        mov     eax, dword [ebp-18H]                    ; 2CDB _ 8B. 45, E8
        mov     edx, dword [eax+4H]                     ; 2CDE _ 8B. 50, 04
        mov     eax, dword [current_console_task]       ; 2CE1 _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 2CE6 _ 8B. 80, 000000B4
        mov     dword [esp+14H], ecx                    ; 2CEC _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2CF0 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 2CF4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 2CFC _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 2D04 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2D08 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2D0B _ 89. 04 24
        call    sheet_refresh                           ; 2D0E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 2D13 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 2D16 _ 8B. 40, 20
        mov     dword [current_console_task], eax       ; 2D19 _ A3, 00000278(d)
        mov     eax, dword [current_console_task]       ; 2D1E _ A1, 00000278(d)
        mov     eax, dword [eax+0B4H]                   ; 2D23 _ 8B. 80, 000000B4
        mov     dword [esp+0CH], 1                      ; 2D29 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_369                   ; 2D31 _ C7. 44 24, 08, 0000000F(d)
        mov     dword [esp+4H], eax                     ; 2D39 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2D3D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2D40 _ 89. 04 24
        call    make_wtitle8                            ; 2D43 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 2D48 _ 8B. 45, E8
        mov     edx, dword [eax+8H]                     ; 2D4B _ 8B. 50, 08
        mov     eax, dword [ebp-18H]                    ; 2D4E _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2D51 _ 8B. 40, 04
        mov     dword [esp+14H], edx                    ; 2D54 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2D58 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 2D5C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 2D64 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-18H]                    ; 2D6C _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 2D6F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2D73 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2D76 _ 89. 04 24
        call    sheet_refresh                           ; 2D79 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2D7E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2D81 _ 8B. 40, 10
        sub     eax, 1                                  ; 2D84 _ 83. E8, 01
        mov     dword [esp+8H], eax                     ; 2D87 _ 89. 44 24, 08
        mov     eax, dword [ebp-18H]                    ; 2D8B _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 2D8E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2D92 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2D95 _ 89. 04 24
        call    sheet_updown                            ; 2D98 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-1CH], 2                      ; 2D9D _ 83. 7D, E4, 02
        jle     ?_142                                   ; 2DA1 _ 7E, 36
        mov     eax, dword [ebp-18H]                    ; 2DA3 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2DA6 _ 8B. 40, 04
        sub     eax, 3                                  ; 2DA9 _ 83. E8, 03
        cmp     eax, dword [ebp-1CH]                    ; 2DAC _ 3B. 45, E4
        jle     ?_142                                   ; 2DAF _ 7E, 28
        cmp     dword [ebp-20H], 2                      ; 2DB1 _ 83. 7D, E0, 02
        jle     ?_142                                   ; 2DB5 _ 7E, 22
        cmp     dword [ebp-20H], 20                     ; 2DB7 _ 83. 7D, E0, 14
        jg      ?_142                                   ; 2DBB _ 7F, 1C
        mov     eax, dword [mx]                         ; 2DBD _ A1, 00000134(d)
        mov     dword [mmx], eax                        ; 2DC2 _ A3, 00000118(d)
        mov     eax, dword [my]                         ; 2DC7 _ A1, 00000138(d)
        mov     dword [mmy], eax                        ; 2DCC _ A3, 0000011C(d)
        mov     eax, dword [ebp-18H]                    ; 2DD1 _ 8B. 45, E8
        mov     dword [mouse_clicked_sht], eax          ; 2DD4 _ A3, 00000270(d)
?_142:  mov     eax, dword [ebp-18H]                    ; 2DD9 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2DDC _ 8B. 40, 04
        sub     eax, 21                                 ; 2DDF _ 83. E8, 15
        cmp     eax, dword [ebp-1CH]                    ; 2DE2 _ 3B. 45, E4
        jg      ?_143                                   ; 2DE5 _ 7F, 34
        mov     eax, dword [ebp-18H]                    ; 2DE7 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2DEA _ 8B. 40, 04
        sub     eax, 5                                  ; 2DED _ 83. E8, 05
        cmp     eax, dword [ebp-1CH]                    ; 2DF0 _ 3B. 45, E4
        jle     ?_143                                   ; 2DF3 _ 7E, 26
        cmp     dword [ebp-20H], 4                      ; 2DF5 _ 83. 7D, E0, 04
        jle     ?_143                                   ; 2DF9 _ 7E, 20
        cmp     dword [ebp-20H], 18                     ; 2DFB _ 83. 7D, E0, 12
        jg      ?_143                                   ; 2DFF _ 7F, 1A
        mov     eax, dword [ebp-18H]                    ; 2E01 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 2E04 _ 8B. 40, 20
        test    eax, eax                                ; 2E07 _ 85. C0
        jz      ?_143                                   ; 2E09 _ 74, 10
        mov     eax, dword [ebp-18H]                    ; 2E0B _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 2E0E _ 8B. 40, 20
        mov     dword [esp], eax                        ; 2E11 _ 89. 04 24
        call    cmd_exit                                ; 2E14 _ E8, FFFFFFFC(rel)
        jmp     ?_146                                   ; 2E19 _ EB, 12

?_143:  jmp     ?_146                                   ; 2E1B _ EB, 10

?_144:  sub     dword [ebp-0CH], 1                      ; 2E1D _ 83. 6D, F4, 01
?_145:  cmp     dword [ebp-0CH], 0                      ; 2E21 _ 83. 7D, F4, 00
        jg      ?_141                                   ; 2E25 _ 0F 8F, FFFFFDEC
        jmp     ?_149                                   ; 2E2B _ EB, 7D

?_146:  jmp     ?_149                                   ; 2E2D _ EB, 7B

?_147:  mov     edx, dword [mx]                         ; 2E2F _ 8B. 15, 00000134(d)
        mov     eax, dword [mmx]                        ; 2E35 _ A1, 00000118(d)
        sub     edx, eax                                ; 2E3A _ 29. C2
        mov     eax, edx                                ; 2E3C _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2E3E _ 89. 45, E4
        mov     edx, dword [my]                         ; 2E41 _ 8B. 15, 00000138(d)
        mov     eax, dword [mmy]                        ; 2E47 _ A1, 0000011C(d)
        sub     edx, eax                                ; 2E4C _ 29. C2
        mov     eax, edx                                ; 2E4E _ 89. D0
        mov     dword [ebp-20H], eax                    ; 2E50 _ 89. 45, E0
        mov     eax, dword [mouse_clicked_sht]          ; 2E53 _ A1, 00000270(d)
        mov     edx, dword [eax+10H]                    ; 2E58 _ 8B. 50, 10
        mov     eax, dword [ebp-20H]                    ; 2E5B _ 8B. 45, E0
        lea     ecx, [edx+eax]                          ; 2E5E _ 8D. 0C 02
        mov     eax, dword [mouse_clicked_sht]          ; 2E61 _ A1, 00000270(d)
        mov     edx, dword [eax+0CH]                    ; 2E66 _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 2E69 _ 8B. 45, E4
        add     edx, eax                                ; 2E6C _ 01. C2
        mov     eax, dword [mouse_clicked_sht]          ; 2E6E _ A1, 00000270(d)
        mov     dword [esp+0CH], ecx                    ; 2E73 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2E77 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2E7B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E7F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E82 _ 89. 04 24
        call    sheet_slide                             ; 2E85 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mx]                         ; 2E8A _ A1, 00000134(d)
        mov     dword [mmx], eax                        ; 2E8F _ A3, 00000118(d)
        mov     eax, dword [my]                         ; 2E94 _ A1, 00000138(d)
        mov     dword [mmy], eax                        ; 2E99 _ A3, 0000011C(d)
        jmp     ?_149                                   ; 2E9E _ EB, 0A

?_148:  mov     dword [mmx], -1                         ; 2EA0 _ C7. 05, 00000118(d), FFFFFFFF
?_149:  leave                                           ; 2EAA _ C9
        ret                                             ; 2EAB _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 2EAC _ 55
        mov     ebp, esp                                ; 2EAD _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2EAF _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 2EB2 _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 2EB8 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 2EBB _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 2EC1 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 2EC4 _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 2ECA _ 5D
        ret                                             ; 2ECB _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 2ECC _ 55
        mov     ebp, esp                                ; 2ECD _ 89. E5
        push    ebx                                     ; 2ECF _ 53
        sub     esp, 52                                 ; 2ED0 _ 83. EC, 34
        mov     eax, dword [ebp+18H]                    ; 2ED3 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 2ED6 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 2ED9 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 2EDC _ 89. 45, F4
        mov     dword [ebp-10H], 0                      ; 2EDF _ C7. 45, F0, 00000000
        jmp     ?_151                                   ; 2EE6 _ EB, 4B

?_150:  mov     eax, dword [ebp+1CH]                    ; 2EE8 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 2EEB _ 0F B6. 00
        movzx   eax, al                                 ; 2EEE _ 0F B6. C0
        shl     eax, 4                                  ; 2EF1 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 2EF4 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 2EFA _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 2EFE _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 2F01 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2F04 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2F07 _ 8B. 00
        mov     dword [esp+14H], ebx                    ; 2F09 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 2F0D _ 89. 4C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 2F11 _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 2F14 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 2F18 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 2F1B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2F1F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2F23 _ 89. 04 24
        call    showFont8                               ; 2F26 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 2F2B _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 2F2F _ 83. 45, 1C, 01
?_151:  mov     eax, dword [ebp+1CH]                    ; 2F33 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 2F36 _ 0F B6. 00
        test    al, al                                  ; 2F39 _ 84. C0
        jnz     ?_150                                   ; 2F3B _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 2F3D _ 8B. 45, 14
        add     eax, 16                                 ; 2F40 _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 2F43 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 2F47 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 2F4A _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 2F4E _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 2F51 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2F55 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2F58 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2F5C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2F5F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F63 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F66 _ 89. 04 24
        call    sheet_refresh                           ; 2F69 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 2F6E _ 83. C4, 34
        pop     ebx                                     ; 2F71 _ 5B
        pop     ebp                                     ; 2F72 _ 5D
        ret                                             ; 2F73 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 2F74 _ 55
        mov     ebp, esp                                ; 2F75 _ 89. E5
        sub     esp, 696                                ; 2F77 _ 81. EC, 000002B8
        mov     dword [esp+8H], table_rgb.2082          ; 2F7D _ C7. 44 24, 08, 00000140(d)
        mov     dword [esp+4H], 15                      ; 2F85 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 2F8D _ C7. 04 24, 00000000
        call    set_palette                             ; 2F94 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 2F99 _ C7. 45, EC, 00000000
        jmp     ?_157                                   ; 2FA0 _ E9, 000000EF

?_152:  mov     dword [ebp-10H], 0                      ; 2FA5 _ C7. 45, F0, 00000000
        jmp     ?_156                                   ; 2FAC _ E9, 000000D5

?_153:  mov     dword [ebp-0CH], 0                      ; 2FB1 _ C7. 45, F4, 00000000
        jmp     ?_155                                   ; 2FB8 _ E9, 000000BB

?_154:  mov     edx, dword [ebp-10H]                    ; 2FBD _ 8B. 55, F0
        mov     eax, edx                                ; 2FC0 _ 89. D0
        add     eax, eax                                ; 2FC2 _ 01. C0
        add     eax, edx                                ; 2FC4 _ 01. D0
        add     eax, eax                                ; 2FC6 _ 01. C0
        mov     edx, eax                                ; 2FC8 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2FCA _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 2FCD _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 2FD0 _ 8B. 55, EC
        mov     eax, edx                                ; 2FD3 _ 89. D0
        shl     eax, 3                                  ; 2FD5 _ C1. E0, 03
        add     eax, edx                                ; 2FD8 _ 01. D0
        shl     eax, 2                                  ; 2FDA _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 2FDD _ 8D. 14 01
        mov     eax, edx                                ; 2FE0 _ 89. D0
        add     eax, eax                                ; 2FE2 _ 01. C0
        add     edx, eax                                ; 2FE4 _ 01. C2
        mov     eax, dword [ebp-0CH]                    ; 2FE6 _ 8B. 45, F4
        mov     ecx, 51                                 ; 2FE9 _ B9, 00000033
        imul    eax, ecx                                ; 2FEE _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 2FF1 _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 2FF8 _ 8B. 55, F0
        mov     eax, edx                                ; 2FFB _ 89. D0
        add     eax, eax                                ; 2FFD _ 01. C0
        add     eax, edx                                ; 2FFF _ 01. D0
        add     eax, eax                                ; 3001 _ 01. C0
        mov     edx, eax                                ; 3003 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3005 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 3008 _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 300B _ 8B. 55, EC
        mov     eax, edx                                ; 300E _ 89. D0
        shl     eax, 3                                  ; 3010 _ C1. E0, 03
        add     eax, edx                                ; 3013 _ 01. D0
        shl     eax, 2                                  ; 3015 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 3018 _ 8D. 14 01
        mov     eax, edx                                ; 301B _ 89. D0
        add     eax, eax                                ; 301D _ 01. C0
        add     eax, edx                                ; 301F _ 01. D0
        lea     edx, [eax+1H]                           ; 3021 _ 8D. 50, 01
        mov     eax, dword [ebp-10H]                    ; 3024 _ 8B. 45, F0
        mov     ecx, 51                                 ; 3027 _ B9, 00000033
        imul    eax, ecx                                ; 302C _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 302F _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 3036 _ 8B. 55, F0
        mov     eax, edx                                ; 3039 _ 89. D0
        add     eax, eax                                ; 303B _ 01. C0
        add     eax, edx                                ; 303D _ 01. D0
        add     eax, eax                                ; 303F _ 01. C0
        mov     edx, eax                                ; 3041 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3043 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 3046 _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 3049 _ 8B. 55, EC
        mov     eax, edx                                ; 304C _ 89. D0
        shl     eax, 3                                  ; 304E _ C1. E0, 03
        add     eax, edx                                ; 3051 _ 01. D0
        shl     eax, 2                                  ; 3053 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 3056 _ 8D. 14 01
        mov     eax, edx                                ; 3059 _ 89. D0
        add     eax, eax                                ; 305B _ 01. C0
        add     eax, edx                                ; 305D _ 01. D0
        lea     edx, [eax+2H]                           ; 305F _ 8D. 50, 02
        mov     eax, dword [ebp-14H]                    ; 3062 _ 8B. 45, EC
        mov     ecx, 51                                 ; 3065 _ B9, 00000033
        imul    eax, ecx                                ; 306A _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 306D _ 88. 84 15, FFFFFD64
        add     dword [ebp-0CH], 1                      ; 3074 _ 83. 45, F4, 01
?_155:  cmp     dword [ebp-0CH], 5                      ; 3078 _ 83. 7D, F4, 05
        jle     ?_154                                   ; 307C _ 0F 8E, FFFFFF3B
        add     dword [ebp-10H], 1                      ; 3082 _ 83. 45, F0, 01
?_156:  cmp     dword [ebp-10H], 5                      ; 3086 _ 83. 7D, F0, 05
        jle     ?_153                                   ; 308A _ 0F 8E, FFFFFF21
        add     dword [ebp-14H], 1                      ; 3090 _ 83. 45, EC, 01
?_157:  cmp     dword [ebp-14H], 5                      ; 3094 _ 83. 7D, EC, 05
        jle     ?_152                                   ; 3098 _ 0F 8E, FFFFFF07
        lea     eax, [ebp-29CH]                         ; 309E _ 8D. 85, FFFFFD64
        mov     dword [esp+8H], eax                     ; 30A4 _ 89. 44 24, 08
        mov     dword [esp+4H], 231                     ; 30A8 _ C7. 44 24, 04, 000000E7
        mov     dword [esp], 16                         ; 30B0 _ C7. 04 24, 00000010
        call    set_palette                             ; 30B7 _ E8, FFFFFFFC(rel)
        nop                                             ; 30BC _ 90
        leave                                           ; 30BD _ C9
        ret                                             ; 30BE _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 30BF _ 55
        mov     ebp, esp                                ; 30C0 _ 89. E5
        sub     esp, 40                                 ; 30C2 _ 83. EC, 28
        call    io_load_eflags                          ; 30C5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 30CA _ 89. 45, F0
        call    io_cli                                  ; 30CD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 30D2 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 30D5 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 30D9 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 30E0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 30E5 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 30E8 _ 89. 45, F4
        jmp     ?_159                                   ; 30EB _ EB, 62

?_158:  mov     eax, dword [ebp+10H]                    ; 30ED _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 30F0 _ 0F B6. 00
        shr     al, 2                                   ; 30F3 _ C0. E8, 02
        movzx   eax, al                                 ; 30F6 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 30F9 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 30FD _ C7. 04 24, 000003C9
        call    io_out8                                 ; 3104 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3109 _ 8B. 45, 10
        add     eax, 1                                  ; 310C _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 310F _ 0F B6. 00
        shr     al, 2                                   ; 3112 _ C0. E8, 02
        movzx   eax, al                                 ; 3115 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 3118 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 311C _ C7. 04 24, 000003C9
        call    io_out8                                 ; 3123 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3128 _ 8B. 45, 10
        add     eax, 2                                  ; 312B _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 312E _ 0F B6. 00
        shr     al, 2                                   ; 3131 _ C0. E8, 02
        movzx   eax, al                                 ; 3134 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 3137 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 313B _ C7. 04 24, 000003C9
        call    io_out8                                 ; 3142 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 3147 _ 83. 45, 10, 03
        add     dword [ebp-0CH], 1                      ; 314B _ 83. 45, F4, 01
?_159:  mov     eax, dword [ebp-0CH]                    ; 314F _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 3152 _ 3B. 45, 0C
        jle     ?_158                                   ; 3155 _ 7E, 96
        mov     eax, dword [ebp-10H]                    ; 3157 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 315A _ 89. 04 24
        call    io_store_eflags                         ; 315D _ E8, FFFFFFFC(rel)
        nop                                             ; 3162 _ 90
        leave                                           ; 3163 _ C9
        ret                                             ; 3164 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 3165 _ 55
        mov     ebp, esp                                ; 3166 _ 89. E5
        sub     esp, 20                                 ; 3168 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 316B _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 316E _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 3171 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 3174 _ 89. 45, F8
        jmp     ?_163                                   ; 3177 _ EB, 33

?_160:  mov     eax, dword [ebp+14H]                    ; 3179 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 317C _ 89. 45, FC
        jmp     ?_162                                   ; 317F _ EB, 1F

?_161:  mov     eax, dword [ebp-8H]                     ; 3181 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 3184 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3188 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 318A _ 8B. 45, FC
        add     eax, edx                                ; 318D _ 01. D0
        mov     edx, eax                                ; 318F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3191 _ 8B. 45, 08
        add     edx, eax                                ; 3194 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3196 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 319A _ 88. 02
        add     dword [ebp-4H], 1                       ; 319C _ 83. 45, FC, 01
?_162:  mov     eax, dword [ebp-4H]                     ; 31A0 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 31A3 _ 3B. 45, 1C
        jle     ?_161                                   ; 31A6 _ 7E, D9
        add     dword [ebp-8H], 1                       ; 31A8 _ 83. 45, F8, 01
?_163:  mov     eax, dword [ebp-8H]                     ; 31AC _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 31AF _ 3B. 45, 20
        jle     ?_160                                   ; 31B2 _ 7E, C5
        leave                                           ; 31B4 _ C9
        ret                                             ; 31B5 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 31B6 _ 55
        mov     ebp, esp                                ; 31B7 _ 89. E5
        sub     esp, 20                                 ; 31B9 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 31BC _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 31BF _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 31C2 _ C7. 45, FC, 00000000
        jmp     ?_173                                   ; 31C9 _ E9, 0000016C

?_164:  mov     edx, dword [ebp-4H]                     ; 31CE _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 31D1 _ 8B. 45, 1C
        add     eax, edx                                ; 31D4 _ 01. D0
        movzx   eax, byte [eax]                         ; 31D6 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 31D9 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 31DC _ 80. 7D, FB, 00
        jns     ?_165                                   ; 31E0 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 31E2 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 31E5 _ 8B. 55, 14
        add     eax, edx                                ; 31E8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 31EA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 31EE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 31F0 _ 8B. 45, 10
        add     eax, edx                                ; 31F3 _ 01. D0
        mov     edx, eax                                ; 31F5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 31F7 _ 8B. 45, 08
        add     edx, eax                                ; 31FA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 31FC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3200 _ 88. 02
?_165:  movsx   eax, byte [ebp-5H]                      ; 3202 _ 0F BE. 45, FB
        and     eax, 40H                                ; 3206 _ 83. E0, 40
        test    eax, eax                                ; 3209 _ 85. C0
        jz      ?_166                                   ; 320B _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 320D _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 3210 _ 8B. 55, 14
        add     eax, edx                                ; 3213 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3215 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3219 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 321B _ 8B. 45, 10
        add     eax, edx                                ; 321E _ 01. D0
        lea     edx, [eax+1H]                           ; 3220 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3223 _ 8B. 45, 08
        add     edx, eax                                ; 3226 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3228 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 322C _ 88. 02
?_166:  movsx   eax, byte [ebp-5H]                      ; 322E _ 0F BE. 45, FB
        and     eax, 20H                                ; 3232 _ 83. E0, 20
        test    eax, eax                                ; 3235 _ 85. C0
        jz      ?_167                                   ; 3237 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 3239 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 323C _ 8B. 55, 14
        add     eax, edx                                ; 323F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3241 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3245 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3247 _ 8B. 45, 10
        add     eax, edx                                ; 324A _ 01. D0
        lea     edx, [eax+2H]                           ; 324C _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 324F _ 8B. 45, 08
        add     edx, eax                                ; 3252 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3254 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3258 _ 88. 02
?_167:  movsx   eax, byte [ebp-5H]                      ; 325A _ 0F BE. 45, FB
        and     eax, 10H                                ; 325E _ 83. E0, 10
        test    eax, eax                                ; 3261 _ 85. C0
        jz      ?_168                                   ; 3263 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 3265 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 3268 _ 8B. 55, 14
        add     eax, edx                                ; 326B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 326D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3271 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3273 _ 8B. 45, 10
        add     eax, edx                                ; 3276 _ 01. D0
        lea     edx, [eax+3H]                           ; 3278 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 327B _ 8B. 45, 08
        add     edx, eax                                ; 327E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3280 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3284 _ 88. 02
?_168:  movsx   eax, byte [ebp-5H]                      ; 3286 _ 0F BE. 45, FB
        and     eax, 08H                                ; 328A _ 83. E0, 08
        test    eax, eax                                ; 328D _ 85. C0
        jz      ?_169                                   ; 328F _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 3291 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 3294 _ 8B. 55, 14
        add     eax, edx                                ; 3297 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3299 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 329D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 329F _ 8B. 45, 10
        add     eax, edx                                ; 32A2 _ 01. D0
        lea     edx, [eax+4H]                           ; 32A4 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 32A7 _ 8B. 45, 08
        add     edx, eax                                ; 32AA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 32AC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 32B0 _ 88. 02
?_169:  movsx   eax, byte [ebp-5H]                      ; 32B2 _ 0F BE. 45, FB
        and     eax, 04H                                ; 32B6 _ 83. E0, 04
        test    eax, eax                                ; 32B9 _ 85. C0
        jz      ?_170                                   ; 32BB _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 32BD _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 32C0 _ 8B. 55, 14
        add     eax, edx                                ; 32C3 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 32C5 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 32C9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 32CB _ 8B. 45, 10
        add     eax, edx                                ; 32CE _ 01. D0
        lea     edx, [eax+5H]                           ; 32D0 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 32D3 _ 8B. 45, 08
        add     edx, eax                                ; 32D6 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 32D8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 32DC _ 88. 02
?_170:  movsx   eax, byte [ebp-5H]                      ; 32DE _ 0F BE. 45, FB
        and     eax, 02H                                ; 32E2 _ 83. E0, 02
        test    eax, eax                                ; 32E5 _ 85. C0
        jz      ?_171                                   ; 32E7 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 32E9 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 32EC _ 8B. 55, 14
        add     eax, edx                                ; 32EF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 32F1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 32F5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 32F7 _ 8B. 45, 10
        add     eax, edx                                ; 32FA _ 01. D0
        lea     edx, [eax+6H]                           ; 32FC _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 32FF _ 8B. 45, 08
        add     edx, eax                                ; 3302 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3304 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3308 _ 88. 02
?_171:  movsx   eax, byte [ebp-5H]                      ; 330A _ 0F BE. 45, FB
        and     eax, 01H                                ; 330E _ 83. E0, 01
        test    eax, eax                                ; 3311 _ 85. C0
        jz      ?_172                                   ; 3313 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 3315 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 3318 _ 8B. 55, 14
        add     eax, edx                                ; 331B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 331D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3321 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3323 _ 8B. 45, 10
        add     eax, edx                                ; 3326 _ 01. D0
        lea     edx, [eax+7H]                           ; 3328 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 332B _ 8B. 45, 08
        add     edx, eax                                ; 332E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3330 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3334 _ 88. 02
?_172:  add     dword [ebp-4H], 1                       ; 3336 _ 83. 45, FC, 01
?_173:  cmp     dword [ebp-4H], 15                      ; 333A _ 83. 7D, FC, 0F
        jle     ?_164                                   ; 333E _ 0F 8E, FFFFFE8A
        leave                                           ; 3344 _ C9
        ret                                             ; 3345 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 3346 _ 55
        mov     ebp, esp                                ; 3347 _ 89. E5
        sub     esp, 20                                 ; 3349 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 334C _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 334F _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 3352 _ C7. 45, F8, 00000000
        jmp     ?_180                                   ; 3359 _ E9, 000000B1

?_174:  mov     dword [ebp-4H], 0                       ; 335E _ C7. 45, FC, 00000000
        jmp     ?_179                                   ; 3365 _ E9, 00000097

?_175:  mov     eax, dword [ebp-8H]                     ; 336A _ 8B. 45, F8
        shl     eax, 4                                  ; 336D _ C1. E0, 04
        mov     edx, eax                                ; 3370 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3372 _ 8B. 45, FC
        add     eax, edx                                ; 3375 _ 01. D0
        add     eax, cursor.2142                        ; 3377 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 337C _ 0F B6. 00
        cmp     al, 42                                  ; 337F _ 3C, 2A
        jnz     ?_176                                   ; 3381 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 3383 _ 8B. 45, F8
        shl     eax, 4                                  ; 3386 _ C1. E0, 04
        mov     edx, eax                                ; 3389 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 338B _ 8B. 45, FC
        add     eax, edx                                ; 338E _ 01. D0
        mov     edx, eax                                ; 3390 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3392 _ 8B. 45, 08
        add     eax, edx                                ; 3395 _ 01. D0
        mov     byte [eax], 0                           ; 3397 _ C6. 00, 00
?_176:  mov     eax, dword [ebp-8H]                     ; 339A _ 8B. 45, F8
        shl     eax, 4                                  ; 339D _ C1. E0, 04
        mov     edx, eax                                ; 33A0 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 33A2 _ 8B. 45, FC
        add     eax, edx                                ; 33A5 _ 01. D0
        add     eax, cursor.2142                        ; 33A7 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 33AC _ 0F B6. 00
        cmp     al, 79                                  ; 33AF _ 3C, 4F
        jnz     ?_177                                   ; 33B1 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 33B3 _ 8B. 45, F8
        shl     eax, 4                                  ; 33B6 _ C1. E0, 04
        mov     edx, eax                                ; 33B9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 33BB _ 8B. 45, FC
        add     eax, edx                                ; 33BE _ 01. D0
        mov     edx, eax                                ; 33C0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 33C2 _ 8B. 45, 08
        add     eax, edx                                ; 33C5 _ 01. D0
        mov     byte [eax], 7                           ; 33C7 _ C6. 00, 07
?_177:  mov     eax, dword [ebp-8H]                     ; 33CA _ 8B. 45, F8
        shl     eax, 4                                  ; 33CD _ C1. E0, 04
        mov     edx, eax                                ; 33D0 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 33D2 _ 8B. 45, FC
        add     eax, edx                                ; 33D5 _ 01. D0
        add     eax, cursor.2142                        ; 33D7 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 33DC _ 0F B6. 00
        cmp     al, 46                                  ; 33DF _ 3C, 2E
        jnz     ?_178                                   ; 33E1 _ 75, 1A
        mov     eax, dword [ebp-8H]                     ; 33E3 _ 8B. 45, F8
        shl     eax, 4                                  ; 33E6 _ C1. E0, 04
        mov     edx, eax                                ; 33E9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 33EB _ 8B. 45, FC
        add     eax, edx                                ; 33EE _ 01. D0
        mov     edx, eax                                ; 33F0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 33F2 _ 8B. 45, 08
        add     edx, eax                                ; 33F5 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 33F7 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 33FB _ 88. 02
?_178:  add     dword [ebp-4H], 1                       ; 33FD _ 83. 45, FC, 01
?_179:  cmp     dword [ebp-4H], 15                      ; 3401 _ 83. 7D, FC, 0F
        jle     ?_175                                   ; 3405 _ 0F 8E, FFFFFF5F
        add     dword [ebp-8H], 1                       ; 340B _ 83. 45, F8, 01
?_180:  cmp     dword [ebp-8H], 15                      ; 340F _ 83. 7D, F8, 0F
        jle     ?_174                                   ; 3413 _ 0F 8E, FFFFFF45
        leave                                           ; 3419 _ C9
        ret                                             ; 341A _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 341B _ 55
        mov     ebp, esp                                ; 341C _ 89. E5
        sub     esp, 16                                 ; 341E _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3421 _ C7. 45, F8, 00000000
        jmp     ?_184                                   ; 3428 _ EB, 50

?_181:  mov     dword [ebp-4H], 0                       ; 342A _ C7. 45, FC, 00000000
        jmp     ?_183                                   ; 3431 _ EB, 3B

?_182:  mov     eax, dword [ebp-8H]                     ; 3433 _ 8B. 45, F8
        mov     edx, dword [ebp+1CH]                    ; 3436 _ 8B. 55, 1C
        add     eax, edx                                ; 3439 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 343B _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 343F _ 8B. 55, FC
        mov     ecx, dword [ebp+18H]                    ; 3442 _ 8B. 4D, 18
        add     edx, ecx                                ; 3445 _ 01. CA
        add     eax, edx                                ; 3447 _ 01. D0
        mov     edx, eax                                ; 3449 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 344B _ 8B. 45, 08
        add     edx, eax                                ; 344E _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 3450 _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 3453 _ 0F AF. 45, 24
        mov     ecx, eax                                ; 3457 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 3459 _ 8B. 45, FC
        add     eax, ecx                                ; 345C _ 01. C8
        mov     ecx, eax                                ; 345E _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 3460 _ 8B. 45, 20
        add     eax, ecx                                ; 3463 _ 01. C8
        movzx   eax, byte [eax]                         ; 3465 _ 0F B6. 00
        mov     byte [edx], al                          ; 3468 _ 88. 02
        add     dword [ebp-4H], 1                       ; 346A _ 83. 45, FC, 01
?_183:  mov     eax, dword [ebp-4H]                     ; 346E _ 8B. 45, FC
        cmp     eax, dword [ebp+10H]                    ; 3471 _ 3B. 45, 10
        jl      ?_182                                   ; 3474 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 3476 _ 83. 45, F8, 01
?_184:  mov     eax, dword [ebp-8H]                     ; 347A _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 347D _ 3B. 45, 14
        jl      ?_181                                   ; 3480 _ 7C, A8
        leave                                           ; 3482 _ C9
        ret                                             ; 3483 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 3484 _ 55
        mov     ebp, esp                                ; 3485 _ 89. E5
        sub     esp, 40                                 ; 3487 _ 83. EC, 28
        mov     eax, dword [bootInfo]                   ; 348A _ A1, 00000014(d)
        mov     dword [ebp-0CH], eax                    ; 348F _ 89. 45, F4
        movzx   eax, word [?_393]                       ; 3492 _ 0F B7. 05, 00000018(d)
        cwde                                            ; 3499 _ 98
        mov     dword [ebp-10H], eax                    ; 349A _ 89. 45, F0
        movzx   eax, word [?_394]                       ; 349D _ 0F B7. 05, 0000001A(d)
        cwde                                            ; 34A4 _ 98
        mov     dword [ebp-14H], eax                    ; 34A5 _ 89. 45, EC
        mov     dword [esp+4H], 32                      ; 34A8 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 34B0 _ C7. 04 24, 00000020
        call    io_out8                                 ; 34B7 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], 0                       ; 34BC _ C6. 45, EB, 00
        mov     dword [esp], 96                         ; 34C0 _ C7. 04 24, 00000060
        call    io_in8                                  ; 34C7 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], al                      ; 34CC _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 34CF _ 0F B6. 45, EB
        mov     dword [esp+4H], eax                     ; 34D3 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 34D7 _ C7. 04 24, 0000001C(d)
        call    fifo8_put                               ; 34DE _ E8, FFFFFFFC(rel)
        nop                                             ; 34E3 _ 90
        leave                                           ; 34E4 _ C9
        ret                                             ; 34E5 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 34E6 _ 55
        mov     ebp, esp                                ; 34E7 _ 89. E5
        sub     esp, 4                                  ; 34E9 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 34EC _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 34EF _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 34F2 _ 80. 7D, FC, 09
        jle     ?_185                                   ; 34F6 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 34F8 _ 0F B6. 45, FC
        add     eax, 55                                 ; 34FC _ 83. C0, 37
        jmp     ?_186                                   ; 34FF _ EB, 07

?_185:  movzx   eax, byte [ebp-4H]                      ; 3501 _ 0F B6. 45, FC
        add     eax, 48                                 ; 3505 _ 83. C0, 30
?_186:  leave                                           ; 3508 _ C9
        ret                                             ; 3509 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 350A _ 55
        mov     ebp, esp                                ; 350B _ 89. E5
        sub     esp, 24                                 ; 350D _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 3510 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 3513 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 3516 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 351D _ 0F B6. 45, EC
        and     eax, 0FH                                ; 3521 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 3524 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 3527 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 352B _ 89. 04 24
        call    charToHexVal                            ; 352E _ E8, FFFFFFFC(rel)
        mov     byte [?_392], al                        ; 3533 _ A2, 00000113(d)
        movzx   eax, byte [ebp-14H]                     ; 3538 _ 0F B6. 45, EC
        shr     al, 4                                   ; 353C _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 353F _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 3542 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 3546 _ 0F BE. C0
        mov     dword [esp], eax                        ; 3549 _ 89. 04 24
        call    charToHexVal                            ; 354C _ E8, FFFFFFFC(rel)
        mov     byte [?_391], al                        ; 3551 _ A2, 00000112(d)
        mov     eax, keyval                             ; 3556 _ B8, 00000110(d)
        leave                                           ; 355B _ C9
        ret                                             ; 355C _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 355D _ 55
        mov     ebp, esp                                ; 355E _ 89. E5
        sub     esp, 16                                 ; 3560 _ 83. EC, 10
        mov     byte [str.2190], 48                     ; 3563 _ C6. 05, 00000374(d), 30
        mov     byte [?_397], 88                        ; 356A _ C6. 05, 00000375(d), 58
        mov     byte [?_398], 0                         ; 3571 _ C6. 05, 0000037E(d), 00
        mov     dword [ebp-4H], 2                       ; 3578 _ C7. 45, FC, 00000002
        jmp     ?_188                                   ; 357F _ EB, 0F

?_187:  mov     eax, dword [ebp-4H]                     ; 3581 _ 8B. 45, FC
        add     eax, str.2190                           ; 3584 _ 05, 00000374(d)
        mov     byte [eax], 48                          ; 3589 _ C6. 00, 30
        add     dword [ebp-4H], 1                       ; 358C _ 83. 45, FC, 01
?_188:  cmp     dword [ebp-4H], 9                       ; 3590 _ 83. 7D, FC, 09
        jle     ?_187                                   ; 3594 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 3596 _ C7. 45, F8, 00000009
        jmp     ?_192                                   ; 359D _ EB, 40

?_189:  mov     eax, dword [ebp+8H]                     ; 359F _ 8B. 45, 08
        and     eax, 0FH                                ; 35A2 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 35A5 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 35A8 _ 8B. 45, 08
        shr     eax, 4                                  ; 35AB _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 35AE _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 35B1 _ 83. 7D, F4, 09
        jle     ?_190                                   ; 35B5 _ 7E, 13
        mov     eax, dword [ebp-0CH]                    ; 35B7 _ 8B. 45, F4
        add     eax, 55                                 ; 35BA _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 35BD _ 8B. 55, F8
        add     edx, str.2190                           ; 35C0 _ 81. C2, 00000374(d)
        mov     byte [edx], al                          ; 35C6 _ 88. 02
        jmp     ?_191                                   ; 35C8 _ EB, 11

?_190:  mov     eax, dword [ebp-0CH]                    ; 35CA _ 8B. 45, F4
        add     eax, 48                                 ; 35CD _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 35D0 _ 8B. 55, F8
        add     edx, str.2190                           ; 35D3 _ 81. C2, 00000374(d)
        mov     byte [edx], al                          ; 35D9 _ 88. 02
?_191:  sub     dword [ebp-8H], 1                       ; 35DB _ 83. 6D, F8, 01
?_192:  cmp     dword [ebp-8H], 1                       ; 35DF _ 83. 7D, F8, 01
        jle     ?_193                                   ; 35E3 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 35E5 _ 83. 7D, 08, 00
        jnz     ?_189                                   ; 35E9 _ 75, B4
?_193:  mov     eax, str.2190                           ; 35EB _ B8, 00000374(d)
        leave                                           ; 35F0 _ C9
        ret                                             ; 35F1 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 35F2 _ 55
        mov     ebp, esp                                ; 35F3 _ 89. E5
        sub     esp, 24                                 ; 35F5 _ 83. EC, 18
?_194:  mov     dword [esp], 100                        ; 35F8 _ C7. 04 24, 00000064
        call    io_in8                                  ; 35FF _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 3604 _ 83. E0, 02
        test    eax, eax                                ; 3607 _ 85. C0
        jnz     ?_195                                   ; 3609 _ 75, 02
        jmp     ?_196                                   ; 360B _ EB, 02

?_195:  jmp     ?_194                                   ; 360D _ EB, E9

?_196:  leave                                           ; 360F _ C9
        ret                                             ; 3610 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 3611 _ 55
        mov     ebp, esp                                ; 3612 _ 89. E5
        sub     esp, 24                                 ; 3614 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 3617 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 361C _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 3624 _ C7. 04 24, 00000064
        call    io_out8                                 ; 362B _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 3630 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 3635 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 363D _ C7. 04 24, 00000060
        call    io_out8                                 ; 3644 _ E8, FFFFFFFC(rel)
        nop                                             ; 3649 _ 90
        leave                                           ; 364A _ C9
        ret                                             ; 364B _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 364C _ 55
        mov     ebp, esp                                ; 364D _ 89. E5
        sub     esp, 24                                 ; 364F _ 83. EC, 18
        call    wait_KBC_sendready                      ; 3652 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 3657 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 365F _ C7. 04 24, 00000064
        call    io_out8                                 ; 3666 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 366B _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 3670 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 3678 _ C7. 04 24, 00000060
        call    io_out8                                 ; 367F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 3684 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 3687 _ C6. 40, 03, 00
        nop                                             ; 368B _ 90
        leave                                           ; 368C _ C9
        ret                                             ; 368D _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 368E _ 55
        mov     ebp, esp                                ; 368F _ 89. E5
        sub     esp, 40                                 ; 3691 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 3694 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 369C _ C7. 04 24, 000000A0
        call    io_out8                                 ; 36A3 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 36A8 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 36B0 _ C7. 04 24, 00000020
        call    io_out8                                 ; 36B7 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 36BC _ C7. 04 24, 00000060
        call    io_in8                                  ; 36C3 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 36C8 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 36CB _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 36CF _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 36D3 _ C7. 04 24, 00000038(d)
        call    fifo8_put                               ; 36DA _ E8, FFFFFFFC(rel)
        leave                                           ; 36DF _ C9
        ret                                             ; 36E0 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 36E1 _ 55
        mov     ebp, esp                                ; 36E2 _ 89. E5
        sub     esp, 4                                  ; 36E4 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 36E7 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 36EA _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 36ED _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 36F0 _ 0F B6. 40, 03
        test    al, al                                  ; 36F4 _ 84. C0
        jnz     ?_198                                   ; 36F6 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 36F8 _ 80. 7D, FC, FA
        jnz     ?_197                                   ; 36FC _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 36FE _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 3701 _ C6. 40, 03, 01
?_197:  mov     eax, 0                                  ; 3705 _ B8, 00000000
        jmp     ?_205                                   ; 370A _ E9, 0000010F

?_198:  mov     eax, dword [ebp+8H]                     ; 370F _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3712 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 3716 _ 3C, 01
        jnz     ?_200                                   ; 3718 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 371A _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 371E _ 25, 000000C8
        cmp     eax, 8                                  ; 3723 _ 83. F8, 08
        jnz     ?_199                                   ; 3726 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 3728 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 372B _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 372F _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 3731 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 3734 _ C6. 40, 03, 02
?_199:  mov     eax, 0                                  ; 3738 _ B8, 00000000
        jmp     ?_205                                   ; 373D _ E9, 000000DC

?_200:  mov     eax, dword [ebp+8H]                     ; 3742 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3745 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 3749 _ 3C, 02
        jnz     ?_201                                   ; 374B _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 374D _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3750 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 3754 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3757 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 375A _ C6. 40, 03, 03
        mov     eax, 0                                  ; 375E _ B8, 00000000
        jmp     ?_205                                   ; 3763 _ E9, 000000B6

?_201:  mov     eax, dword [ebp+8H]                     ; 3768 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 376B _ 0F B6. 40, 03
        cmp     al, 3                                   ; 376F _ 3C, 03
        jne     ?_204                                   ; 3771 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 3777 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 377A _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 377E _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 3781 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 3784 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 3788 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 378B _ 0F B6. 00
        movzx   eax, al                                 ; 378E _ 0F B6. C0
        and     eax, 07H                                ; 3791 _ 83. E0, 07
        mov     edx, eax                                ; 3794 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3796 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3799 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 379C _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 379F _ 0F B6. 40, 01
        movzx   edx, al                                 ; 37A3 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 37A6 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 37A9 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 37AC _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 37AF _ 0F B6. 40, 02
        movzx   edx, al                                 ; 37B3 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 37B6 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 37B9 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 37BC _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 37BF _ 0F B6. 00
        movzx   eax, al                                 ; 37C2 _ 0F B6. C0
        and     eax, 10H                                ; 37C5 _ 83. E0, 10
        test    eax, eax                                ; 37C8 _ 85. C0
        jz      ?_202                                   ; 37CA _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 37CC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 37CF _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 37D2 _ 0D, FFFFFF00
        mov     edx, eax                                ; 37D7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 37D9 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 37DC _ 89. 50, 04
?_202:  mov     eax, dword [ebp+8H]                     ; 37DF _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 37E2 _ 0F B6. 00
        movzx   eax, al                                 ; 37E5 _ 0F B6. C0
        and     eax, 20H                                ; 37E8 _ 83. E0, 20
        test    eax, eax                                ; 37EB _ 85. C0
        jz      ?_203                                   ; 37ED _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 37EF _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 37F2 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 37F5 _ 0D, FFFFFF00
        mov     edx, eax                                ; 37FA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 37FC _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 37FF _ 89. 50, 08
?_203:  mov     eax, dword [ebp+8H]                     ; 3802 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3805 _ 8B. 40, 08
        neg     eax                                     ; 3808 _ F7. D8
        mov     edx, eax                                ; 380A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 380C _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 380F _ 89. 50, 08
        mov     eax, 1                                  ; 3812 _ B8, 00000001
        jmp     ?_205                                   ; 3817 _ EB, 05

?_204:  mov     eax, 4294967295                         ; 3819 _ B8, FFFFFFFF
?_205:  leave                                           ; 381E _ C9
        ret                                             ; 381F _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 3820 _ 55
        mov     ebp, esp                                ; 3821 _ 89. E5
        sub     esp, 72                                 ; 3823 _ 83. EC, 48
        mov     dword [ebp-0CH], 0                      ; 3826 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 382D _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 3834 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 383B _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 3842 _ 8B. 15, 00000140(d)
        mov     eax, dword [ebp+0CH]                    ; 3848 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 384B _ 8B. 00
        mov     dword [esp+8H], edx                     ; 384D _ 89. 54 24, 08
        mov     edx, dword [ebp+1CH]                    ; 3851 _ 8B. 55, 1C
        mov     dword [esp+4H], edx                     ; 3854 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3858 _ 89. 04 24
        call    init_screen8                            ; 385B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+20H]                    ; 3860 _ 8B. 45, 20
        movsx   eax, al                                 ; 3863 _ 0F BE. C0
        mov     dword [esp+14H], ?_382                  ; 3866 _ C7. 44 24, 14, 00000051(d)
        mov     dword [esp+10H], eax                    ; 386E _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3872 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3875 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3879 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 387C _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3880 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3883 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3887 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 388A _ 89. 04 24
        call    showString                              ; 388D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+18H]                    ; 3892 _ 8B. 45, 18
        mov     dword [esp], eax                        ; 3895 _ 89. 04 24
        call    intToHexStr                             ; 3898 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 389D _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 38A0 _ 8B. 45, 20
        movsx   eax, al                                 ; 38A3 _ 0F BE. C0
        mov     edx, dword [ebp-1CH]                    ; 38A6 _ 8B. 55, E4
        mov     dword [esp+14H], edx                    ; 38A9 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 38AD _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 38B1 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 38B4 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 38B8 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 38BB _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 38BF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 38C2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 38C6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 38C9 _ 89. 04 24
        call    showString                              ; 38CC _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 38D1 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 38D5 _ 8B. 45, 20
        movsx   eax, al                                 ; 38D8 _ 0F BE. C0
        mov     dword [esp+14H], ?_383                  ; 38DB _ C7. 44 24, 14, 0000005B(d)
        mov     dword [esp+10H], eax                    ; 38E3 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 38E7 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 38EA _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 38EE _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 38F1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 38F5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 38F8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 38FC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 38FF _ 89. 04 24
        call    showString                              ; 3902 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3907 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 390A _ 8B. 00
        mov     dword [esp], eax                        ; 390C _ 89. 04 24
        call    intToHexStr                             ; 390F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 3914 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 3917 _ 8B. 45, 20
        movsx   eax, al                                 ; 391A _ 0F BE. C0
        mov     edx, dword [ebp-20H]                    ; 391D _ 8B. 55, E0
        mov     dword [esp+14H], edx                    ; 3920 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3924 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3928 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 392B _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 392F _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 3932 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3936 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3939 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 393D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3940 _ 89. 04 24
        call    showString                              ; 3943 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 3948 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 394C _ 8B. 45, 20
        movsx   eax, al                                 ; 394F _ 0F BE. C0
        mov     dword [esp+14H], ?_384                  ; 3952 _ C7. 44 24, 14, 00000067(d)
        mov     dword [esp+10H], eax                    ; 395A _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 395E _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3961 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3965 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3968 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 396C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 396F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3973 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3976 _ 89. 04 24
        call    showString                              ; 3979 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 397E _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 3981 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 3984 _ 89. 04 24
        call    intToHexStr                             ; 3987 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 398C _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 398F _ 8B. 45, 20
        movsx   eax, al                                 ; 3992 _ 0F BE. C0
        mov     edx, dword [ebp-24H]                    ; 3995 _ 8B. 55, DC
        mov     dword [esp+14H], edx                    ; 3998 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 399C _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 39A0 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 39A3 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 39A7 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 39AA _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 39AE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 39B1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 39B5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 39B8 _ 89. 04 24
        call    showString                              ; 39BB _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 39C0 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 39C4 _ 8B. 45, 20
        movsx   eax, al                                 ; 39C7 _ 0F BE. C0
        mov     dword [esp+14H], ?_385                  ; 39CA _ C7. 44 24, 14, 00000073(d)
        mov     dword [esp+10H], eax                    ; 39D2 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 39D6 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 39D9 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 39DD _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 39E0 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 39E4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 39E7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 39EB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 39EE _ 89. 04 24
        call    showString                              ; 39F1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 39F6 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 39F9 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 39FC _ 89. 04 24
        call    intToHexStr                             ; 39FF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 3A04 _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 3A07 _ 8B. 45, 20
        movsx   eax, al                                 ; 3A0A _ 0F BE. C0
        mov     edx, dword [ebp-28H]                    ; 3A0D _ 8B. 55, D8
        mov     dword [esp+14H], edx                    ; 3A10 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3A14 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3A18 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3A1B _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 3A1F _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 3A22 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3A26 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3A29 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3A2D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3A30 _ 89. 04 24
        call    showString                              ; 3A33 _ E8, FFFFFFFC(rel)
        leave                                           ; 3A38 _ C9
        ret                                             ; 3A39 _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 3A3A _ 55
        mov     ebp, esp                                ; 3A3B _ 89. E5
        sub     esp, 56                                 ; 3A3D _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 3A40 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3A43 _ 89. 04 24
        call    sheet_alloc                             ; 3A46 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3A4B _ 89. 45, F4
        mov     eax, dword [memman]                     ; 3A4E _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 3A53 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 3A5B _ 89. 04 24
        call    memman_alloc_4k                         ; 3A5E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3A63 _ 89. 45, F0
        mov     dword [esp+10H], -1                     ; 3A66 _ C7. 44 24, 10, FFFFFFFF
        mov     dword [esp+0CH], 68                     ; 3A6E _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 3A76 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-10H]                    ; 3A7E _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 3A81 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 3A85 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 3A88 _ 89. 04 24
        call    sheet_setbuf                            ; 3A8B _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 3A90 _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 3A98 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 3A9B _ 89. 44 24, 08
        mov     eax, dword [ebp-0CH]                    ; 3A9F _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 3AA2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3AA6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3AA9 _ 89. 04 24
        call    make_window8                            ; 3AAC _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 3AB1 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 3AB9 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 3AC1 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 3AC9 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 3AD1 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 3AD9 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 3ADC _ 89. 04 24
        call    make_textbox8                           ; 3ADF _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 3AE4 _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 3AEC _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-0CH]                    ; 3AF4 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 3AF7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3AFB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3AFE _ 89. 04 24
        call    sheet_slide                             ; 3B01 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 3B06 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-0CH]                    ; 3B0E _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 3B11 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3B15 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B18 _ 89. 04 24
        call    sheet_updown                            ; 3B1B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3B20 _ 8B. 45, F4
        leave                                           ; 3B23 _ C9
        ret                                             ; 3B24 _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 3B25 _ 55
        mov     ebp, esp                                ; 3B26 _ 89. E5
        push    ebx                                     ; 3B28 _ 53
        sub     esp, 52                                 ; 3B29 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 3B2C _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 3B2F _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 3B32 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3B35 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 3B38 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 3B3B _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3B3E _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 3B41 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 3B44 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3B47 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3B4A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3B4D _ 8B. 00
        mov     dword [esp+18H], 0                      ; 3B4F _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 3B57 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 3B5B _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 3B63 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 3B6B _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 3B73 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3B76 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3B7A _ 89. 04 24
        call    boxfill8                                ; 3B7D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3B82 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 3B85 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 3B88 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3B8B _ 8B. 00
        mov     dword [esp+18H], 1                      ; 3B8D _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 3B95 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 3B99 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 3BA1 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 3BA9 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 3BB1 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3BB4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3BB8 _ 89. 04 24
        call    boxfill8                                ; 3BBB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3BC0 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3BC3 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3BC6 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3BC9 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 3BCB _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 3BCF _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 3BD7 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 3BDF _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 3BE7 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 3BEF _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3BF2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3BF6 _ 89. 04 24
        call    boxfill8                                ; 3BF9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3BFE _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3C01 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3C04 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3C07 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 3C09 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 3C0D _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 3C15 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 3C1D _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 3C25 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 3C2D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3C30 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3C34 _ 89. 04 24
        call    boxfill8                                ; 3C37 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3C3C _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 3C3F _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 3C42 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 3C45 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 3C48 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 3C4B _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 3C4E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3C51 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3C53 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3C57 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 3C5B _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 3C63 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 3C67 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 3C6F _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3C72 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3C76 _ 89. 04 24
        call    boxfill8                                ; 3C79 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3C7E _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 3C81 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3C84 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3C87 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 3C8A _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3C8D _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3C90 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3C93 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3C95 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3C99 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 3C9D _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 3CA5 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 3CA9 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 3CB1 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3CB4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3CB8 _ 89. 04 24
        call    boxfill8                                ; 3CBB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3CC0 _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 3CC3 _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 3CC6 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 3CC9 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 3CCC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3CCF _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 3CD1 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 3CD5 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 3CD9 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 3CE1 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 3CE9 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 3CF1 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3CF4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3CF8 _ 89. 04 24
        call    boxfill8                                ; 3CFB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3D00 _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 3D03 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 3D06 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3D09 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 3D0B _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 3D13 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 3D17 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 3D1F _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 3D27 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-0CH]                    ; 3D2F _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3D32 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3D36 _ 89. 04 24
        call    boxfill8                                ; 3D39 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3D3E _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 3D41 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 3D44 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 3D47 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 3D4A _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 3D4D _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 3D50 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3D53 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3D55 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3D59 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 3D5D _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 3D61 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 3D69 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 3D71 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3D74 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3D78 _ 89. 04 24
        call    boxfill8                                ; 3D7B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3D80 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 3D83 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3D86 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3D89 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 3D8C _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3D8F _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3D92 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3D95 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3D97 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3D9B _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 3D9F _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 3DA3 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 3DAB _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 3DB3 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3DB6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3DBA _ 89. 04 24
        call    boxfill8                                ; 3DBD _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-1CH]                     ; 3DC2 _ 0F BE. 45, E4
        mov     dword [esp+0CH], eax                    ; 3DC6 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 3DCA _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 3DCD _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3DD1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3DD4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3DD8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3DDB _ 89. 04 24
        call    make_wtitle8                            ; 3DDE _ E8, FFFFFFFC(rel)
        nop                                             ; 3DE3 _ 90
        add     esp, 52                                 ; 3DE4 _ 83. C4, 34
        pop     ebx                                     ; 3DE7 _ 5B
        pop     ebp                                     ; 3DE8 _ 5D
        ret                                             ; 3DE9 _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 3DEA _ 55
        mov     ebp, esp                                ; 3DEB _ 89. E5
        push    ebx                                     ; 3DED _ 53
        sub     esp, 52                                 ; 3DEE _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 3DF1 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 3DF4 _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 3DF7 _ 80. 7D, E4, 00
        jz      ?_206                                   ; 3DFB _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 3DFD _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 3E01 _ C6. 45, ED, 0C
        jmp     ?_207                                   ; 3E05 _ EB, 08

?_206:  mov     byte [ebp-12H], 8                       ; 3E07 _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 3E0B _ C6. 45, ED, 0F
?_207:  mov     eax, dword [ebp+0CH]                    ; 3E0F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3E12 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 3E15 _ 8D. 58, FC
        movzx   eax, byte [ebp-13H]                     ; 3E18 _ 0F B6. 45, ED
        movzx   ecx, al                                 ; 3E1C _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 3E1F _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 3E22 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 3E25 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3E28 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 3E2A _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], ebx                    ; 3E32 _ 89. 5C 24, 14
        mov     dword [esp+10H], 3                      ; 3E36 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 3E3E _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], ecx                     ; 3E46 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 3E4A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3E4E _ 89. 04 24
        call    boxfill8                                ; 3E51 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-12H]                     ; 3E56 _ 0F BE. 45, EE
        mov     edx, dword [ebp+10H]                    ; 3E5A _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 3E5D _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3E61 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 3E65 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 3E6D _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 3E75 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3E78 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3E7C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3E7F _ 89. 04 24
        call    showString                              ; 3E82 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 3E87 _ C7. 45, F0, 00000000
        jmp     ?_215                                   ; 3E8E _ E9, 00000083

?_208:  mov     dword [ebp-0CH], 0                      ; 3E93 _ C7. 45, F4, 00000000
        jmp     ?_214                                   ; 3E9A _ EB, 70

?_209:  mov     eax, dword [ebp-10H]                    ; 3E9C _ 8B. 45, F0
        shl     eax, 4                                  ; 3E9F _ C1. E0, 04
        mov     edx, eax                                ; 3EA2 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3EA4 _ 8B. 45, F4
        add     eax, edx                                ; 3EA7 _ 01. D0
        add     eax, closebtn.2261                      ; 3EA9 _ 05, 00000280(d)
        movzx   eax, byte [eax]                         ; 3EAE _ 0F B6. 00
        mov     byte [ebp-11H], al                      ; 3EB1 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 3EB4 _ 80. 7D, EF, 40
        jnz     ?_210                                   ; 3EB8 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 3EBA _ C6. 45, EF, 00
        jmp     ?_213                                   ; 3EBE _ EB, 1C

?_210:  cmp     byte [ebp-11H], 36                      ; 3EC0 _ 80. 7D, EF, 24
        jnz     ?_211                                   ; 3EC4 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 3EC6 _ C6. 45, EF, 0F
        jmp     ?_213                                   ; 3ECA _ EB, 10

?_211:  cmp     byte [ebp-11H], 81                      ; 3ECC _ 80. 7D, EF, 51
        jnz     ?_212                                   ; 3ED0 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 3ED2 _ C6. 45, EF, 08
        jmp     ?_213                                   ; 3ED6 _ EB, 04

?_212:  mov     byte [ebp-11H], 7                       ; 3ED8 _ C6. 45, EF, 07
?_213:  mov     eax, dword [ebp+0CH]                    ; 3EDC _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 3EDF _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 3EE1 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 3EE4 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 3EE7 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3EEA _ 8B. 40, 04
        imul    ecx, eax                                ; 3EED _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 3EF0 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3EF3 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 3EF6 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 3EF9 _ 8B. 45, F4
        add     eax, ebx                                ; 3EFC _ 01. D8
        add     eax, ecx                                ; 3EFE _ 01. C8
        add     edx, eax                                ; 3F00 _ 01. C2
        movzx   eax, byte [ebp-11H]                     ; 3F02 _ 0F B6. 45, EF
        mov     byte [edx], al                          ; 3F06 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 3F08 _ 83. 45, F4, 01
?_214:  cmp     dword [ebp-0CH], 15                     ; 3F0C _ 83. 7D, F4, 0F
        jle     ?_209                                   ; 3F10 _ 7E, 8A
        add     dword [ebp-10H], 1                      ; 3F12 _ 83. 45, F0, 01
?_215:  cmp     dword [ebp-10H], 13                     ; 3F16 _ 83. 7D, F0, 0D
        jle     ?_208                                   ; 3F1A _ 0F 8E, FFFFFF73
        add     esp, 52                                 ; 3F20 _ 83. C4, 34
        pop     ebx                                     ; 3F23 _ 5B
        pop     ebp                                     ; 3F24 _ 5D
        ret                                             ; 3F25 _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 3F26 _ 55
        mov     ebp, esp                                ; 3F27 _ 89. E5
        push    edi                                     ; 3F29 _ 57
        push    esi                                     ; 3F2A _ 56
        push    ebx                                     ; 3F2B _ 53
        sub     esp, 44                                 ; 3F2C _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 3F2F _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 3F32 _ 8B. 55, 0C
        add     eax, edx                                ; 3F35 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 3F37 _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 3F3A _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 3F3D _ 8B. 55, 10
        add     eax, edx                                ; 3F40 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 3F42 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 3F45 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 3F48 _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 3F4B _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3F4E _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 3F51 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3F54 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 3F57 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 3F5A _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 3F5D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3F60 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3F63 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3F66 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3F68 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3F6C _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3F70 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3F74 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 3F78 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 3F80 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3F84 _ 89. 04 24
        call    boxfill8                                ; 3F87 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3F8C _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 3F8F _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 3F92 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 3F95 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 3F98 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3F9B _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 3F9E _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 3FA1 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 3FA4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3FA7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3FAA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3FAD _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3FAF _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3FB3 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3FB7 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3FBB _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 3FBF _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 3FC7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3FCB _ 89. 04 24
        call    boxfill8                                ; 3FCE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3FD3 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 3FD6 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 3FD9 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3FDC _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 3FDF _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 3FE2 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 3FE5 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 3FE8 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 3FEB _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3FEE _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3FF1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3FF4 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3FF6 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3FFA _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3FFE _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4002 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 4006 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 400E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4012 _ 89. 04 24
        call    boxfill8                                ; 4015 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 401A _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 401D _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 4020 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 4023 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 4026 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 4029 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 402C _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 402F _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 4032 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4035 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4038 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 403B _ 8B. 00
        mov     dword [esp+18H], edi                    ; 403D _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 4041 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 4045 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4049 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 404D _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 4055 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4059 _ 89. 04 24
        call    boxfill8                                ; 405C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 4061 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 4064 _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 4067 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 406A _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 406D _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 4070 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 4073 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4076 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4079 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 407C _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 407E _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 4082 _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 4085 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 4089 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 408D _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 4091 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 4099 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 409D _ 89. 04 24
        call    boxfill8                                ; 40A0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 40A5 _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 40A8 _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 40AB _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 40AE _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 40B1 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 40B4 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 40B7 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 40BA _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 40BD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 40C0 _ 8B. 00
        mov     ecx, dword [ebp-14H]                    ; 40C2 _ 8B. 4D, EC
        mov     dword [esp+18H], ecx                    ; 40C5 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 40C9 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 40CD _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 40D1 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 40D5 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 40DD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 40E1 _ 89. 04 24
        call    boxfill8                                ; 40E4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 40E9 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 40EC _ 8D. 48, 01
        mov     eax, dword [ebp-14H]                    ; 40EF _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 40F2 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 40F5 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 40F8 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 40FB _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 40FE _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4101 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4104 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 4106 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 410A _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 410D _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 4111 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 4115 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 4119 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 4121 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4125 _ 89. 04 24
        call    boxfill8                                ; 4128 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 412D _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 4130 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 4133 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 4136 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 4139 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 413C _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 413F _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 4142 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 4145 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4148 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 414B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 414E _ 8B. 00
        mov     dword [esp+18H], edi                    ; 4150 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 4154 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 4158 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 415C _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 4160 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 4168 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 416C _ 89. 04 24
        call    boxfill8                                ; 416F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 4174 _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 4177 _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 417A _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 417D _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 4180 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 4183 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 4186 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4189 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 418C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 418F _ 8B. 00
        mov     ebx, dword [ebp-14H]                    ; 4191 _ 8B. 5D, EC
        mov     dword [esp+18H], ebx                    ; 4194 _ 89. 5C 24, 18
        mov     ebx, dword [ebp-10H]                    ; 4198 _ 8B. 5D, F0
        mov     dword [esp+14H], ebx                    ; 419B _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 419F _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 41A3 _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 41A7 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 41AB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 41AF _ 89. 04 24
        call    boxfill8                                ; 41B2 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 41B7 _ 83. C4, 2C
        pop     ebx                                     ; 41BA _ 5B
        pop     esi                                     ; 41BB _ 5E
        pop     edi                                     ; 41BC _ 5F
        pop     ebp                                     ; 41BD _ 5D
        ret                                             ; 41BE _ C3
; make_textbox8 End of function

file_loadfile:; Function begin
        push    ebp                                     ; 41BF _ 55
        mov     ebp, esp                                ; 41C0 _ 89. E5
        sub     esp, 56                                 ; 41C2 _ 83. EC, 38
        mov     dword [ebp-0CH], 78848                  ; 41C5 _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 41CC _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 41D1 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 41D9 _ 89. 04 24
        call    memman_alloc                            ; 41DC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 41E1 _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 41E4 _ 8B. 45, E4
        add     eax, 12                                 ; 41E7 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 41EA _ C6. 00, 00
        jmp     ?_226                                   ; 41ED _ E9, 0000011E

?_216:  mov     dword [ebp-10H], 0                      ; 41F2 _ C7. 45, F0, 00000000
        jmp     ?_219                                   ; 41F9 _ EB, 2C

?_217:  mov     edx, dword [ebp-0CH]                    ; 41FB _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 41FE _ 8B. 45, F0
        add     eax, edx                                ; 4201 _ 01. D0
        movzx   eax, byte [eax]                         ; 4203 _ 0F B6. 00
        test    al, al                                  ; 4206 _ 84. C0
        jz      ?_218                                   ; 4208 _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 420A _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 420D _ 8B. 45, E4
        add     edx, eax                                ; 4210 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 4212 _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 4215 _ 8B. 45, F0
        add     eax, ecx                                ; 4218 _ 01. C8
        movzx   eax, byte [eax]                         ; 421A _ 0F B6. 00
        mov     byte [edx], al                          ; 421D _ 88. 02
        add     dword [ebp-10H], 1                      ; 421F _ 83. 45, F0, 01
        jmp     ?_219                                   ; 4223 _ EB, 02

?_218:  jmp     ?_220                                   ; 4225 _ EB, 06

?_219:  cmp     dword [ebp-10H], 7                      ; 4227 _ 83. 7D, F0, 07
        jle     ?_217                                   ; 422B _ 7E, CE
?_220:  mov     dword [ebp-14H], 0                      ; 422D _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 4234 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 4237 _ 8B. 45, E4
        add     eax, edx                                ; 423A _ 01. D0
        mov     byte [eax], 46                          ; 423C _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 423F _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 4243 _ C7. 45, EC, 00000000
        jmp     ?_222                                   ; 424A _ EB, 1E

?_221:  mov     edx, dword [ebp-10H]                    ; 424C _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 424F _ 8B. 45, E4
        add     edx, eax                                ; 4252 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 4254 _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 4257 _ 8B. 45, EC
        add     eax, ecx                                ; 425A _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 425C _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 4260 _ 88. 02
        add     dword [ebp-10H], 1                      ; 4262 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 4266 _ 83. 45, EC, 01
?_222:  cmp     dword [ebp-14H], 2                      ; 426A _ 83. 7D, EC, 02
        jle     ?_221                                   ; 426E _ 7E, DC
        mov     eax, dword [ebp-1CH]                    ; 4270 _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 4273 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4277 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 427A _ 89. 04 24
        call    strcmp                                  ; 427D _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 4282 _ 83. F8, 01
        jne     ?_225                                   ; 4285 _ 0F 85, 00000081
        mov     eax, dword [ebp-0CH]                    ; 428B _ 8B. 45, F4
        mov     edx, dword [eax+1CH]                    ; 428E _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 4291 _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 4296 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 429A _ 89. 04 24
        call    memman_alloc_4k                         ; 429D _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 42A2 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 42A4 _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 42A7 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 42A9 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 42AC _ 8B. 40, 1C
        mov     edx, eax                                ; 42AF _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 42B1 _ 8B. 45, 0C
        mov     dword [eax+8H], edx                     ; 42B4 _ 89. 50, 08
        mov     dword [ebp-20H], 88064                  ; 42B7 _ C7. 45, E0, 00015800
        mov     eax, dword [ebp-0CH]                    ; 42BE _ 8B. 45, F4
        movzx   eax, word [eax+1AH]                     ; 42C1 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 42C5 _ 0F B7. C0
        shl     eax, 9                                  ; 42C8 _ C1. E0, 09
        add     dword [ebp-20H], eax                    ; 42CB _ 01. 45, E0
        mov     eax, dword [ebp-0CH]                    ; 42CE _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 42D1 _ 8B. 40, 1C
        mov     dword [ebp-24H], eax                    ; 42D4 _ 89. 45, DC
        mov     dword [ebp-18H], 0                      ; 42D7 _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 42DE _ C7. 45, E8, 00000000
        jmp     ?_224                                   ; 42E5 _ EB, 1B

?_223:  mov     eax, dword [ebp+0CH]                    ; 42E7 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 42EA _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 42EC _ 8B. 45, E8
        add     edx, eax                                ; 42EF _ 01. C2
        mov     ecx, dword [ebp-18H]                    ; 42F1 _ 8B. 4D, E8
        mov     eax, dword [ebp-20H]                    ; 42F4 _ 8B. 45, E0
        add     eax, ecx                                ; 42F7 _ 01. C8
        movzx   eax, byte [eax]                         ; 42F9 _ 0F B6. 00
        mov     byte [edx], al                          ; 42FC _ 88. 02
        add     dword [ebp-18H], 1                      ; 42FE _ 83. 45, E8, 01
?_224:  mov     eax, dword [ebp-18H]                    ; 4302 _ 8B. 45, E8
        cmp     eax, dword [ebp-24H]                    ; 4305 _ 3B. 45, DC
        jl      ?_223                                   ; 4308 _ 7C, DD
        jmp     ?_227                                   ; 430A _ EB, 12

?_225:  add     dword [ebp-0CH], 32                     ; 430C _ 83. 45, F4, 20
?_226:  mov     eax, dword [ebp-0CH]                    ; 4310 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 4313 _ 0F B6. 00
        test    al, al                                  ; 4316 _ 84. C0
        jne     ?_216                                   ; 4318 _ 0F 85, FFFFFED4
?_227:  mov     edx, dword [ebp-1CH]                    ; 431E _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 4321 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 4326 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 432E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4332 _ 89. 04 24
        call    memman_free                             ; 4335 _ E8, FFFFFFFC(rel)
        leave                                           ; 433A _ C9
        ret                                             ; 433B _ C3
; file_loadfile End of function

intHandlerForStackOverFlow:; Function begin
        push    ebp                                     ; 433C _ 55
        mov     ebp, esp                                ; 433D _ 89. E5
        sub     esp, 40                                 ; 433F _ 83. EC, 28
        call    task_now                                ; 4342 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4347 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 434A _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 434D _ C7. 80, 00000098, 00000008
        mov     dword [esp], ?_386                      ; 4357 _ C7. 04 24, 0000007F(d)
        call    cons_putstr                             ; 435E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4363 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4366 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 4370 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 4373 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4379 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 437C _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 437F _ 89. 90, 0000009C
        mov     dword [esp], ?_387                      ; 4385 _ C7. 04 24, 00000086(d)
        call    cons_putstr                             ; 438C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4391 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4394 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 439E _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 43A1 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 43A7 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 43AA _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 43AD _ 89. 90, 0000009C
        mov     eax, dword [ebp+8H]                     ; 43B3 _ 8B. 45, 08
        add     eax, 44                                 ; 43B6 _ 83. C0, 2C
        mov     eax, dword [eax]                        ; 43B9 _ 8B. 00
        mov     dword [esp], eax                        ; 43BB _ 89. 04 24
        call    intToHexStr                             ; 43BE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 43C3 _ 89. 45, F0
        mov     dword [esp], ?_388                      ; 43C6 _ C7. 04 24, 00000096(d)
        call    cons_putstr                             ; 43CD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 43D2 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 43D5 _ 89. 04 24
        call    cons_putstr                             ; 43D8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 43DD _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 43E0 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 43EA _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 43ED _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 43F3 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 43F6 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 43F9 _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 43FF _ 8B. 45, F4
        add     eax, 48                                 ; 4402 _ 83. C0, 30
        leave                                           ; 4405 _ C9
        ret                                             ; 4406 _ C3
; intHandlerForStackOverFlow End of function

intHandlerForException:; Function begin
        push    ebp                                     ; 4407 _ 55
        mov     ebp, esp                                ; 4408 _ 89. E5
        sub     esp, 40                                 ; 440A _ 83. EC, 28
        call    task_now                                ; 440D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4412 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4415 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4418 _ C7. 80, 00000098, 00000008
        mov     dword [esp], ?_389                      ; 4422 _ C7. 04 24, 0000009D(d)
        call    cons_putstr                             ; 4429 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 442E _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4431 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 443B _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 443E _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4444 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4447 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 444A _ 89. 90, 0000009C
        mov     dword [esp], ?_390                      ; 4450 _ C7. 04 24, 000000A5(d)
        call    cons_putstr                             ; 4457 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 445C _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 445F _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4465 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4468 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 446B _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 4471 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4474 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 447E _ 8B. 45, F4
        add     eax, 48                                 ; 4481 _ 83. C0, 30
        leave                                           ; 4484 _ C9
        ret                                             ; 4485 _ C3
; intHandlerForException End of function

memman_init:; Function begin
        push    ebp                                     ; 4486 _ 55
        mov     ebp, esp                                ; 4487 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4489 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 448C _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 4492 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4495 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 449C _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 449F _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 44A6 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 44A9 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 44B0 _ 5D
        ret                                             ; 44B1 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 44B2 _ 55
        mov     ebp, esp                                ; 44B3 _ 89. E5
        sub     esp, 16                                 ; 44B5 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 44B8 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 44BF _ C7. 45, F8, 00000000
        jmp     ?_229                                   ; 44C6 _ EB, 14

?_228:  mov     eax, dword [ebp+8H]                     ; 44C8 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 44CB _ 8B. 55, F8
        add     edx, 2                                  ; 44CE _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 44D1 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 44D5 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 44D8 _ 83. 45, F8, 01
?_229:  mov     eax, dword [ebp+8H]                     ; 44DC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 44DF _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 44E1 _ 3B. 45, F8
        ja      ?_228                                   ; 44E4 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 44E6 _ 8B. 45, FC
        leave                                           ; 44E9 _ C9
        ret                                             ; 44EA _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 44EB _ 55
        mov     ebp, esp                                ; 44EC _ 89. E5
        push    ebx                                     ; 44EE _ 53
        sub     esp, 16                                 ; 44EF _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 44F2 _ C7. 45, F4, 00000000
        jmp     ?_235                                   ; 44F9 _ E9, 000000BD

?_230:  mov     eax, dword [ebp+8H]                     ; 44FE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4501 _ 8B. 55, F4
        add     edx, 2                                  ; 4504 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4507 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 450B _ 3B. 45, 0C
        jc      ?_234                                   ; 450E _ 0F 82, 000000A3
        mov     eax, dword [ebp+8H]                     ; 4514 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4517 _ 8B. 55, F4
        add     edx, 2                                  ; 451A _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 451D _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 4520 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 4523 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4526 _ 8B. 55, F4
        add     edx, 2                                  ; 4529 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 452C _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 452F _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 4532 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4535 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4538 _ 8B. 55, F4
        add     edx, 2                                  ; 453B _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 453E _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 4541 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4544 _ 8B. 55, F4
        add     edx, 2                                  ; 4547 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 454A _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 454E _ 2B. 45, 0C
        mov     edx, eax                                ; 4551 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4553 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 4556 _ 8B. 4D, F4
        add     ecx, 2                                  ; 4559 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 455C _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 4560 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4563 _ 8B. 55, F4
        add     edx, 2                                  ; 4566 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4569 _ 8B. 44 D0, 04
        test    eax, eax                                ; 456D _ 85. C0
        jnz     ?_233                                   ; 456F _ 75, 41
        mov     eax, dword [ebp+8H]                     ; 4571 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4574 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4576 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4579 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 457C _ 89. 10
        jmp     ?_232                                   ; 457E _ EB, 28

?_231:  mov     eax, dword [ebp-0CH]                    ; 4580 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 4583 _ 8D. 50, 01
        mov     ecx, dword [ebp+8H]                     ; 4586 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 4589 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 458C _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 458F _ 8B. 45, 08
        add     edx, 2                                  ; 4592 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 4595 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 4598 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 459A _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 459D _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 45A0 _ 89. 54 D9, 04
        add     dword [ebp-0CH], 1                      ; 45A4 _ 83. 45, F4, 01
?_232:  mov     eax, dword [ebp+8H]                     ; 45A8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 45AB _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 45AD _ 3B. 45, F4
        ja      ?_231                                   ; 45B0 _ 77, CE
?_233:  mov     eax, dword [ebp-8H]                     ; 45B2 _ 8B. 45, F8
        jmp     ?_236                                   ; 45B5 _ EB, 17

?_234:  add     dword [ebp-0CH], 1                      ; 45B7 _ 83. 45, F4, 01
?_235:  mov     eax, dword [ebp+8H]                     ; 45BB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 45BE _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 45C0 _ 3B. 45, F4
        ja      ?_230                                   ; 45C3 _ 0F 87, FFFFFF35
        mov     eax, 0                                  ; 45C9 _ B8, 00000000
?_236:  add     esp, 16                                 ; 45CE _ 83. C4, 10
        pop     ebx                                     ; 45D1 _ 5B
        pop     ebp                                     ; 45D2 _ 5D
        ret                                             ; 45D3 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 45D4 _ 55
        mov     ebp, esp                                ; 45D5 _ 89. E5
        push    ebx                                     ; 45D7 _ 53
        sub     esp, 16                                 ; 45D8 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 45DB _ C7. 45, F4, 00000000
        jmp     ?_239                                   ; 45E2 _ EB, 17

?_237:  mov     eax, dword [ebp+8H]                     ; 45E4 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 45E7 _ 8B. 55, F4
        add     edx, 2                                  ; 45EA _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 45ED _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 45F0 _ 3B. 45, 0C
        jbe     ?_238                                   ; 45F3 _ 76, 02
        jmp     ?_240                                   ; 45F5 _ EB, 0E

?_238:  add     dword [ebp-0CH], 1                      ; 45F7 _ 83. 45, F4, 01
?_239:  mov     eax, dword [ebp+8H]                     ; 45FB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 45FE _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4600 _ 3B. 45, F4
        jg      ?_237                                   ; 4603 _ 7F, DF
?_240:  cmp     dword [ebp-0CH], 0                      ; 4605 _ 83. 7D, F4, 00
        jle     ?_244                                   ; 4609 _ 0F 8E, 000000F2
        mov     eax, dword [ebp-0CH]                    ; 460F _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 4612 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4615 _ 8B. 45, 08
        add     edx, 2                                  ; 4618 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 461B _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 461E _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 4621 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 4624 _ 8B. 45, 08
        add     ecx, 2                                  ; 4627 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 462A _ 8B. 44 C8, 04
        add     eax, edx                                ; 462E _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 4630 _ 3B. 45, 0C
        jne     ?_244                                   ; 4633 _ 0F 85, 000000C8
        mov     eax, dword [ebp-0CH]                    ; 4639 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 463C _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 463F _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 4642 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4645 _ 8B. 45, 08
        add     edx, 2                                  ; 4648 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 464B _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 464F _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 4652 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4655 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 4658 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 465B _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 465F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4662 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4664 _ 3B. 45, F4
        jle     ?_243                                   ; 4667 _ 0F 8E, 0000008A
        mov     eax, dword [ebp+10H]                    ; 466D _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 4670 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 4673 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4676 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4679 _ 8B. 55, F4
        add     edx, 2                                  ; 467C _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 467F _ 8B. 04 D0
        cmp     ecx, eax                                ; 4682 _ 39. C1
        jnz     ?_243                                   ; 4684 _ 75, 71
        mov     eax, dword [ebp-0CH]                    ; 4686 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 4689 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 468C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 468F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4692 _ 8B. 45, 08
        add     edx, 2                                  ; 4695 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 4698 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 469C _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 469F _ 8B. 4D, F4
        add     ecx, 2                                  ; 46A2 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 46A5 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 46A9 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 46AC _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 46AF _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 46B2 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 46B6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 46B9 _ 8B. 00
        lea     edx, [eax-1H]                           ; 46BB _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 46BE _ 8B. 45, 08
        mov     dword [eax], edx                        ; 46C1 _ 89. 10
        jmp     ?_242                                   ; 46C3 _ EB, 28

?_241:  mov     eax, dword [ebp-0CH]                    ; 46C5 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 46C8 _ 8D. 50, 01
        mov     ecx, dword [ebp+8H]                     ; 46CB _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 46CE _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 46D1 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 46D4 _ 8B. 45, 08
        add     edx, 2                                  ; 46D7 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 46DA _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 46DD _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 46DF _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 46E2 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 46E5 _ 89. 54 D9, 04
        add     dword [ebp-0CH], 1                      ; 46E9 _ 83. 45, F4, 01
?_242:  mov     eax, dword [ebp+8H]                     ; 46ED _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 46F0 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 46F2 _ 3B. 45, F4
        jg      ?_241                                   ; 46F5 _ 7F, CE
?_243:  mov     eax, 0                                  ; 46F7 _ B8, 00000000
        jmp     ?_250                                   ; 46FC _ E9, 0000011C

?_244:  mov     eax, dword [ebp+8H]                     ; 4701 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4704 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4706 _ 3B. 45, F4
        jle     ?_245                                   ; 4709 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 470B _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 470E _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 4711 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4714 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4717 _ 8B. 55, F4
        add     edx, 2                                  ; 471A _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 471D _ 8B. 04 D0
        cmp     ecx, eax                                ; 4720 _ 39. C1
        jnz     ?_245                                   ; 4722 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 4724 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4727 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 472A _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 472D _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 4730 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 4733 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4736 _ 8B. 55, F4
        add     edx, 2                                  ; 4739 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 473C _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 4740 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 4743 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4746 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4749 _ 8B. 55, F4
        add     edx, 2                                  ; 474C _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 474F _ 89. 4C D0, 04
        mov     eax, 0                                  ; 4753 _ B8, 00000000
        jmp     ?_250                                   ; 4758 _ E9, 000000C0

?_245:  mov     eax, dword [ebp+8H]                     ; 475D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4760 _ 8B. 00
        cmp     eax, 4095                               ; 4762 _ 3D, 00000FFF
        jg      ?_249                                   ; 4767 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 476D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4770 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 4772 _ 89. 45, F8
        jmp     ?_247                                   ; 4775 _ EB, 28

?_246:  mov     eax, dword [ebp-8H]                     ; 4777 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 477A _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 477D _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 4780 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 4783 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 4786 _ 8B. 45, 08
        add     edx, 2                                  ; 4789 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 478C _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 478F _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 4791 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 4794 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 4797 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 479B _ 83. 6D, F8, 01
?_247:  mov     eax, dword [ebp-8H]                     ; 479F _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 47A2 _ 3B. 45, F4
        jg      ?_246                                   ; 47A5 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 47A7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 47AA _ 8B. 00
        lea     edx, [eax+1H]                           ; 47AC _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 47AF _ 8B. 45, 08
        mov     dword [eax], edx                        ; 47B2 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 47B4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 47B7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 47BA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 47BD _ 8B. 00
        cmp     edx, eax                                ; 47BF _ 39. C2
        jge     ?_248                                   ; 47C1 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 47C3 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 47C6 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 47C8 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 47CB _ 89. 50, 04
?_248:  mov     eax, dword [ebp+8H]                     ; 47CE _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 47D1 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 47D4 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 47D7 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 47DA _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 47DD _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 47E0 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 47E3 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 47E6 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 47E9 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 47ED _ B8, 00000000
        jmp     ?_250                                   ; 47F2 _ EB, 29

?_249:  mov     eax, dword [ebp+8H]                     ; 47F4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 47F7 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 47FA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 47FD _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 4800 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4803 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4806 _ 8B. 40, 08
        mov     edx, eax                                ; 4809 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 480B _ 8B. 45, 10
        add     eax, edx                                ; 480E _ 01. D0
        mov     edx, eax                                ; 4810 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4812 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 4815 _ 89. 50, 08
        mov     eax, 4294967295                         ; 4818 _ B8, FFFFFFFF
?_250:  add     esp, 16                                 ; 481D _ 83. C4, 10
        pop     ebx                                     ; 4820 _ 5B
        pop     ebp                                     ; 4821 _ 5D
        ret                                             ; 4822 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 4823 _ 55
        mov     ebp, esp                                ; 4824 _ 89. E5
        sub     esp, 24                                 ; 4826 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 4829 _ 8B. 45, 0C
        add     eax, 4095                               ; 482C _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 4831 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 4836 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 4839 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 483C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4840 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4843 _ 89. 04 24
        call    memman_alloc                            ; 4846 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 484B _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 484E _ 8B. 45, FC
        leave                                           ; 4851 _ C9
        ret                                             ; 4852 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 4853 _ 55
        mov     ebp, esp                                ; 4854 _ 89. E5
        sub     esp, 28                                 ; 4856 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 4859 _ 8B. 45, 10
        add     eax, 4095                               ; 485C _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 4861 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 4866 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 4869 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 486C _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 4870 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4873 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4877 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 487A _ 89. 04 24
        call    memman_free                             ; 487D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 4882 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4885 _ 8B. 45, FC
        leave                                           ; 4888 _ C9
        ret                                             ; 4889 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 488A _ 55
        mov     ebp, esp                                ; 488B _ 89. E5
        sub     esp, 40                                 ; 488D _ 83. EC, 28
        mov     dword [esp+4H], 9232                    ; 4890 _ C7. 44 24, 04, 00002410
        mov     eax, dword [ebp+8H]                     ; 4898 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 489B _ 89. 04 24
        call    memman_alloc_4k                         ; 489E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 48A3 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 48A6 _ 83. 7D, F4, 00
        jnz     ?_251                                   ; 48AA _ 75, 0A
        mov     eax, 0                                  ; 48AC _ B8, 00000000
        jmp     ?_255                                   ; 48B1 _ E9, 000000C0

?_251:  mov     eax, dword [ebp+10H]                    ; 48B6 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 48B9 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 48BD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 48C1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 48C4 _ 89. 04 24
        call    memman_alloc_4k                         ; 48C7 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 48CC _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 48CE _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 48D1 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 48D4 _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 48D7 _ 8B. 40, 04
        test    eax, eax                                ; 48DA _ 85. C0
        jnz     ?_252                                   ; 48DC _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 48DE _ 8B. 45, F4
        mov     dword [esp+8H], 9232                    ; 48E1 _ C7. 44 24, 08, 00002410
        mov     dword [esp+4H], eax                     ; 48E9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 48ED _ 8B. 45, 08
        mov     dword [esp], eax                        ; 48F0 _ 89. 04 24
        call    memman_free_4k                          ; 48F3 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 48F8 _ B8, 00000000
        jmp     ?_255                                   ; 48FD _ EB, 77

?_252:  mov     eax, dword [ebp-0CH]                    ; 48FF _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 4902 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4905 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 4907 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 490A _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 490D _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4910 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 4913 _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 4916 _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 4919 _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 491C _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 4923 _ C7. 45, F0, 00000000
        jmp     ?_254                                   ; 492A _ EB, 3E

?_253:  mov     ecx, dword [ebp-0CH]                    ; 492C _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 492F _ 8B. 55, F0
        mov     eax, edx                                ; 4932 _ 89. D0
        shl     eax, 3                                  ; 4934 _ C1. E0, 03
        add     eax, edx                                ; 4937 _ 01. D0
        shl     eax, 2                                  ; 4939 _ C1. E0, 02
        add     eax, ecx                                ; 493C _ 01. C8
        add     eax, 1072                               ; 493E _ 05, 00000430
        mov     dword [eax], 0                          ; 4943 _ C7. 00, 00000000
        mov     ecx, dword [ebp-0CH]                    ; 4949 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 494C _ 8B. 55, F0
        mov     eax, edx                                ; 494F _ 89. D0
        shl     eax, 3                                  ; 4951 _ C1. E0, 03
        add     eax, edx                                ; 4954 _ 01. D0
        shl     eax, 2                                  ; 4956 _ C1. E0, 02
        add     eax, ecx                                ; 4959 _ 01. C8
        add     eax, 1076                               ; 495B _ 05, 00000434
        mov     dword [eax], 0                          ; 4960 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 4966 _ 83. 45, F0, 01
?_254:  cmp     dword [ebp-10H], 255                    ; 496A _ 81. 7D, F0, 000000FF
        jle     ?_253                                   ; 4971 _ 7E, B9
        mov     eax, dword [ebp-0CH]                    ; 4973 _ 8B. 45, F4
?_255:  leave                                           ; 4976 _ C9
        ret                                             ; 4977 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 4978 _ 55
        mov     ebp, esp                                ; 4979 _ 89. E5
        sub     esp, 24                                 ; 497B _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 497E _ C7. 45, F0, 00000000
        jmp     ?_258                                   ; 4985 _ EB, 63

?_256:  mov     ecx, dword [ebp+8H]                     ; 4987 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 498A _ 8B. 55, F0
        mov     eax, edx                                ; 498D _ 89. D0
        shl     eax, 3                                  ; 498F _ C1. E0, 03
        add     eax, edx                                ; 4992 _ 01. D0
        shl     eax, 2                                  ; 4994 _ C1. E0, 02
        add     eax, ecx                                ; 4997 _ 01. C8
        add     eax, 1072                               ; 4999 _ 05, 00000430
        mov     eax, dword [eax]                        ; 499E _ 8B. 00
        test    eax, eax                                ; 49A0 _ 85. C0
        jnz     ?_257                                   ; 49A2 _ 75, 42
        mov     edx, dword [ebp-10H]                    ; 49A4 _ 8B. 55, F0
        mov     eax, edx                                ; 49A7 _ 89. D0
        shl     eax, 3                                  ; 49A9 _ C1. E0, 03
        add     eax, edx                                ; 49AC _ 01. D0
        shl     eax, 2                                  ; 49AE _ C1. E0, 02
        lea     edx, [eax+410H]                         ; 49B1 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 49B7 _ 8B. 45, 08
        add     eax, edx                                ; 49BA _ 01. D0
        add     eax, 4                                  ; 49BC _ 83. C0, 04
        mov     dword [ebp-0CH], eax                    ; 49BF _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 49C2 _ 8B. 45, F4
        mov     dword [eax+1CH], 1                      ; 49C5 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-0CH]                    ; 49CC _ 8B. 45, F4
        mov     dword [eax+18H], -1                     ; 49CF _ C7. 40, 18, FFFFFFFF
        call    task_now                                ; 49D6 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-0CH]                    ; 49DB _ 8B. 55, F4
        mov     dword [edx+20H], eax                    ; 49DE _ 89. 42, 20
        mov     eax, dword [ebp-0CH]                    ; 49E1 _ 8B. 45, F4
        jmp     ?_259                                   ; 49E4 _ EB, 12

?_257:  add     dword [ebp-10H], 1                      ; 49E6 _ 83. 45, F0, 01
?_258:  cmp     dword [ebp-10H], 255                    ; 49EA _ 81. 7D, F0, 000000FF
        jle     ?_256                                   ; 49F1 _ 7E, 94
        mov     eax, 0                                  ; 49F3 _ B8, 00000000
?_259:  leave                                           ; 49F8 _ C9
        ret                                             ; 49F9 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 49FA _ 55
        mov     ebp, esp                                ; 49FB _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 49FD _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4A00 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4A03 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4A05 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4A08 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 4A0B _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4A0E _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 4A11 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 4A14 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4A17 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 4A1A _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 4A1D _ 89. 50, 14
        nop                                             ; 4A20 _ 90
        pop     ebp                                     ; 4A21 _ 5D
        ret                                             ; 4A22 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 4A23 _ 55
        mov     ebp, esp                                ; 4A24 _ 89. E5
        push    edi                                     ; 4A26 _ 57
        push    esi                                     ; 4A27 _ 56
        push    ebx                                     ; 4A28 _ 53
        sub     esp, 60                                 ; 4A29 _ 83. EC, 3C
        mov     eax, dword [ebp+0CH]                    ; 4A2C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4A2F _ 8B. 40, 18
        mov     dword [ebp-1CH], eax                    ; 4A32 _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 4A35 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4A38 _ 8B. 40, 10
        add     eax, 1                                  ; 4A3B _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 4A3E _ 3B. 45, 10
        jge     ?_260                                   ; 4A41 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 4A43 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4A46 _ 8B. 40, 10
        add     eax, 1                                  ; 4A49 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 4A4C _ 89. 45, 10
?_260:  cmp     dword [ebp+10H], -1                     ; 4A4F _ 83. 7D, 10, FF
        jge     ?_261                                   ; 4A53 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 4A55 _ C7. 45, 10, FFFFFFFF
?_261:  mov     eax, dword [ebp+0CH]                    ; 4A5C _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 4A5F _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 4A62 _ 89. 50, 18
        mov     eax, dword [ebp-1CH]                    ; 4A65 _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 4A68 _ 3B. 45, 10
        jle     ?_268                                   ; 4A6B _ 0F 8E, 00000212
        cmp     dword [ebp+10H], 0                      ; 4A71 _ 83. 7D, 10, 00
        js      ?_264                                   ; 4A75 _ 0F 88, 000000FE
        mov     eax, dword [ebp-1CH]                    ; 4A7B _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 4A7E _ 89. 45, E0
        jmp     ?_263                                   ; 4A81 _ EB, 34

?_262:  mov     eax, dword [ebp-20H]                    ; 4A83 _ 8B. 45, E0
        lea     edx, [eax-1H]                           ; 4A86 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4A89 _ 8B. 45, 08
        add     edx, 4                                  ; 4A8C _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4A8F _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4A93 _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 4A96 _ 8B. 4D, E0
        add     ecx, 4                                  ; 4A99 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 4A9C _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4AA0 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 4AA3 _ 8B. 55, E0
        add     edx, 4                                  ; 4AA6 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4AA9 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 4AAD _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 4AB0 _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 4AB3 _ 83. 6D, E0, 01
?_263:  mov     eax, dword [ebp-20H]                    ; 4AB7 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 4ABA _ 3B. 45, 10
        jg      ?_262                                   ; 4ABD _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 4ABF _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4AC2 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 4AC5 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 4AC8 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4ACB _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 4ACF _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 4AD2 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 4AD5 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4AD8 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4ADB _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4ADE _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4AE1 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4AE4 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4AE7 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4AEA _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4AED _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4AF0 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4AF3 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4AF6 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4AF9 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4AFC _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 4AFF _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 4B03 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4B07 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 4B0B _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4B0F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4B13 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4B16 _ 89. 04 24
        call    sheet_refreshmap                        ; 4B19 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 4B1E _ 8B. 45, 10
        lea     edi, [eax+1H]                           ; 4B21 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 4B24 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4B27 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4B2A _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4B2D _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 4B30 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4B33 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4B36 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4B39 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4B3C _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 4B3F _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4B42 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4B45 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4B48 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4B4B _ 8B. 40, 0C
        mov     ecx, dword [ebp-1CH]                    ; 4B4E _ 8B. 4D, E4
        mov     dword [esp+18H], ecx                    ; 4B51 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 4B55 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 4B59 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 4B5D _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 4B61 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4B65 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4B69 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4B6C _ 89. 04 24
        call    sheet_refreshsub                        ; 4B6F _ E8, FFFFFFFC(rel)
        jmp     ?_275                                   ; 4B74 _ E9, 0000027D

?_264:  mov     eax, dword [ebp+8H]                     ; 4B79 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4B7C _ 8B. 40, 10
        cmp     eax, dword [ebp-1CH]                    ; 4B7F _ 3B. 45, E4
        jle     ?_267                                   ; 4B82 _ 7E, 47
        mov     eax, dword [ebp-1CH]                    ; 4B84 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 4B87 _ 89. 45, E0
        jmp     ?_266                                   ; 4B8A _ EB, 34

?_265:  mov     eax, dword [ebp-20H]                    ; 4B8C _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 4B8F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4B92 _ 8B. 45, 08
        add     edx, 4                                  ; 4B95 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4B98 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4B9C _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 4B9F _ 8B. 4D, E0
        add     ecx, 4                                  ; 4BA2 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 4BA5 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4BA9 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 4BAC _ 8B. 55, E0
        add     edx, 4                                  ; 4BAF _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4BB2 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 4BB6 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 4BB9 _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 4BBC _ 83. 45, E0, 01
?_266:  mov     eax, dword [ebp+8H]                     ; 4BC0 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4BC3 _ 8B. 40, 10
        cmp     eax, dword [ebp-20H]                    ; 4BC6 _ 3B. 45, E0
        jg      ?_265                                   ; 4BC9 _ 7F, C1
?_267:  mov     eax, dword [ebp+8H]                     ; 4BCB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4BCE _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 4BD1 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4BD4 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4BD7 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4BDA _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4BDD _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4BE0 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4BE3 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4BE6 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4BE9 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4BEC _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4BEF _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4BF2 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4BF5 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4BF8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4BFB _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4BFE _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4C01 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 4C04 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 4C0C _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4C10 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 4C14 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4C18 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4C1C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4C1F _ 89. 04 24
        call    sheet_refreshmap                        ; 4C22 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 4C27 _ 8B. 45, E4
        lea     esi, [eax-1H]                           ; 4C2A _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 4C2D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4C30 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4C33 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4C36 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4C39 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4C3C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4C3F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4C42 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4C45 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4C48 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4C4B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4C4E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4C51 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4C54 _ 8B. 40, 0C
        mov     dword [esp+18H], esi                    ; 4C57 _ 89. 74 24, 18
        mov     dword [esp+14H], 0                      ; 4C5B _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 4C63 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4C67 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 4C6B _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4C6F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4C73 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4C76 _ 89. 04 24
        call    sheet_refreshsub                        ; 4C79 _ E8, FFFFFFFC(rel)
        jmp     ?_275                                   ; 4C7E _ E9, 00000173

?_268:  mov     eax, dword [ebp-1CH]                    ; 4C83 _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 4C86 _ 3B. 45, 10
        jge     ?_275                                   ; 4C89 _ 0F 8D, 00000167
        cmp     dword [ebp-1CH], 0                      ; 4C8F _ 83. 7D, E4, 00
        js      ?_271                                   ; 4C93 _ 78, 56
        mov     eax, dword [ebp-1CH]                    ; 4C95 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 4C98 _ 89. 45, E0
        jmp     ?_270                                   ; 4C9B _ EB, 34

?_269:  mov     eax, dword [ebp-20H]                    ; 4C9D _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 4CA0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4CA3 _ 8B. 45, 08
        add     edx, 4                                  ; 4CA6 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4CA9 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4CAD _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 4CB0 _ 8B. 4D, E0
        add     ecx, 4                                  ; 4CB3 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 4CB6 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4CBA _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 4CBD _ 8B. 55, E0
        add     edx, 4                                  ; 4CC0 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4CC3 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 4CC7 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 4CCA _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 4CCD _ 83. 45, E0, 01
?_270:  mov     eax, dword [ebp-20H]                    ; 4CD1 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 4CD4 _ 3B. 45, 10
        jl      ?_269                                   ; 4CD7 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 4CD9 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4CDC _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 4CDF _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 4CE2 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4CE5 _ 89. 54 88, 04
        jmp     ?_274                                   ; 4CE9 _ EB, 6C

?_271:  mov     eax, dword [ebp+8H]                     ; 4CEB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4CEE _ 8B. 40, 10
        mov     dword [ebp-20H], eax                    ; 4CF1 _ 89. 45, E0
        jmp     ?_273                                   ; 4CF4 _ EB, 3A

?_272:  mov     eax, dword [ebp-20H]                    ; 4CF6 _ 8B. 45, E0
        lea     ecx, [eax+1H]                           ; 4CF9 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 4CFC _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 4CFF _ 8B. 55, E0
        add     edx, 4                                  ; 4D02 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4D05 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4D09 _ 8B. 45, 08
        add     ecx, 4                                  ; 4D0C _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 4D0F _ 89. 54 88, 04
        mov     eax, dword [ebp-20H]                    ; 4D13 _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 4D16 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4D19 _ 8B. 45, 08
        add     edx, 4                                  ; 4D1C _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4D1F _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 4D23 _ 8B. 55, E0
        add     edx, 1                                  ; 4D26 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 4D29 _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 4D2C _ 83. 6D, E0, 01
?_273:  mov     eax, dword [ebp-20H]                    ; 4D30 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 4D33 _ 3B. 45, 10
        jge     ?_272                                   ; 4D36 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 4D38 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4D3B _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 4D3E _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 4D41 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4D44 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4D48 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4D4B _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 4D4E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4D51 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4D54 _ 89. 50, 10
?_274:  mov     eax, dword [ebp+0CH]                    ; 4D57 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4D5A _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4D5D _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4D60 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 4D63 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4D66 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4D69 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4D6C _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4D6F _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 4D72 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4D75 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4D78 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4D7B _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4D7E _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 4D81 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 4D84 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 4D88 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 4D8C _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 4D90 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4D94 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4D98 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4D9B _ 89. 04 24
        call    sheet_refreshmap                        ; 4D9E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4DA3 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4DA6 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4DA9 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4DAC _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 4DAF _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4DB2 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4DB5 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4DB8 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4DBB _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 4DBE _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4DC1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4DC4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4DC7 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4DCA _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 4DCD _ 8B. 4D, 10
        mov     dword [esp+18H], ecx                    ; 4DD0 _ 89. 4C 24, 18
        mov     ecx, dword [ebp+10H]                    ; 4DD4 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 4DD7 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 4DDB _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 4DDF _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 4DE3 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4DE7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4DEB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4DEE _ 89. 04 24
        call    sheet_refreshsub                        ; 4DF1 _ E8, FFFFFFFC(rel)
?_275:  add     esp, 60                                 ; 4DF6 _ 83. C4, 3C
        pop     ebx                                     ; 4DF9 _ 5B
        pop     esi                                     ; 4DFA _ 5E
        pop     edi                                     ; 4DFB _ 5F
        pop     ebp                                     ; 4DFC _ 5D
        ret                                             ; 4DFD _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 4DFE _ 55
        mov     ebp, esp                                ; 4DFF _ 89. E5
        push    edi                                     ; 4E01 _ 57
        push    esi                                     ; 4E02 _ 56
        push    ebx                                     ; 4E03 _ 53
        sub     esp, 44                                 ; 4E04 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 4E07 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4E0A _ 8B. 40, 18
        test    eax, eax                                ; 4E0D _ 85. C0
        js      ?_276                                   ; 4E0F _ 78, 61
        mov     eax, dword [ebp+0CH]                    ; 4E11 _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 4E14 _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 4E17 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 4E1A _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 4E1D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4E20 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 4E23 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 4E26 _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 4E29 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4E2C _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 4E2F _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 4E32 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4E35 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4E38 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 4E3B _ 8B. 45, 14
        add     edx, eax                                ; 4E3E _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4E40 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4E43 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 4E46 _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 4E49 _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 4E4C _ 03. 45, E4
        mov     dword [esp+18H], ebx                    ; 4E4F _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 4E53 _ 89. 4C 24, 14
        mov     dword [esp+10H], edi                    ; 4E57 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 4E5B _ 89. 74 24, 0C
        mov     dword [esp+8H], edx                     ; 4E5F _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4E63 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4E67 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4E6A _ 89. 04 24
        call    sheet_refreshsub                        ; 4E6D _ E8, FFFFFFFC(rel)
?_276:  mov     eax, 0                                  ; 4E72 _ B8, 00000000
        add     esp, 44                                 ; 4E77 _ 83. C4, 2C
        pop     ebx                                     ; 4E7A _ 5B
        pop     esi                                     ; 4E7B _ 5E
        pop     edi                                     ; 4E7C _ 5F
        pop     ebp                                     ; 4E7D _ 5D
        ret                                             ; 4E7E _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 4E7F _ 55
        mov     ebp, esp                                ; 4E80 _ 89. E5
        push    esi                                     ; 4E82 _ 56
        push    ebx                                     ; 4E83 _ 53
        sub     esp, 48                                 ; 4E84 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 4E87 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4E8A _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 4E8D _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 4E90 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 4E93 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 4E96 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 4E99 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 4E9C _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 4E9F _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4EA2 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 4EA5 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 4EA8 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4EAB _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4EAE _ 8B. 40, 18
        test    eax, eax                                ; 4EB1 _ 85. C0
        js      ?_277                                   ; 4EB3 _ 0F 88, 00000117
        mov     eax, dword [ebp+0CH]                    ; 4EB9 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 4EBC _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4EBF _ 8B. 45, F4
        add     edx, eax                                ; 4EC2 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4EC4 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 4EC7 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 4ECA _ 8B. 45, F0
        add     eax, ecx                                ; 4ECD _ 01. C8
        mov     dword [esp+14H], 0                      ; 4ECF _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 4ED7 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 4EDB _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 4EDF _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 4EE2 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 4EE6 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 4EE9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4EED _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4EF0 _ 89. 04 24
        call    sheet_refreshmap                        ; 4EF3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4EF8 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4EFB _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 4EFE _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 4F01 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 4F04 _ 8B. 55, 14
        add     ecx, edx                                ; 4F07 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 4F09 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 4F0C _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 4F0F _ 8B. 55, 10
        add     edx, ebx                                ; 4F12 _ 01. DA
        mov     dword [esp+14H], eax                    ; 4F14 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 4F18 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 4F1C _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 4F20 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 4F23 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 4F27 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 4F2A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4F2E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4F31 _ 89. 04 24
        call    sheet_refreshmap                        ; 4F34 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4F39 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4F3C _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 4F3F _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 4F42 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 4F45 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4F48 _ 8B. 45, F4
        add     edx, eax                                ; 4F4B _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4F4D _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 4F50 _ 8B. 58, 04
        mov     eax, dword [ebp-10H]                    ; 4F53 _ 8B. 45, F0
        add     eax, ebx                                ; 4F56 _ 01. D8
        mov     dword [esp+18H], ecx                    ; 4F58 _ 89. 4C 24, 18
        mov     dword [esp+14H], 0                      ; 4F5C _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 4F64 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 4F68 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 4F6C _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 4F6F _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 4F73 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 4F76 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4F7A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4F7D _ 89. 04 24
        call    sheet_refreshsub                        ; 4F80 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4F85 _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 4F88 _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 4F8B _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4F8E _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 4F91 _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 4F94 _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 4F97 _ 8B. 4D, 14
        add     ebx, ecx                                ; 4F9A _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 4F9C _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 4F9F _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 4FA2 _ 8B. 4D, 10
        add     ecx, esi                                ; 4FA5 _ 01. F1
        mov     dword [esp+18H], edx                    ; 4FA7 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 4FAB _ 89. 44 24, 14
        mov     dword [esp+10H], ebx                    ; 4FAF _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4FB3 _ 89. 4C 24, 0C
        mov     eax, dword [ebp+14H]                    ; 4FB7 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 4FBA _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 4FBE _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 4FC1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4FC5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4FC8 _ 89. 04 24
        call    sheet_refreshsub                        ; 4FCB _ E8, FFFFFFFC(rel)
?_277:  add     esp, 48                                 ; 4FD0 _ 83. C4, 30
        pop     ebx                                     ; 4FD3 _ 5B
        pop     esi                                     ; 4FD4 _ 5E
        pop     ebp                                     ; 4FD5 _ 5D
        ret                                             ; 4FD6 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 4FD7 _ 55
        mov     ebp, esp                                ; 4FD8 _ 89. E5
        sub     esp, 64                                 ; 4FDA _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 4FDD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4FE0 _ 8B. 00
        mov     dword [ebp-20H], eax                    ; 4FE2 _ 89. 45, E0
        mov     eax, dword [ebp+8H]                     ; 4FE5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4FE8 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 4FEB _ 89. 45, E4
        cmp     dword [ebp+0CH], 0                      ; 4FEE _ 83. 7D, 0C, 00
        jns     ?_278                                   ; 4FF2 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 4FF4 _ C7. 45, 0C, 00000000
?_278:  cmp     dword [ebp+10H], 8                      ; 4FFB _ 83. 7D, 10, 08
        jg      ?_279                                   ; 4FFF _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 5001 _ C7. 45, 10, 00000000
?_279:  mov     eax, dword [ebp+8H]                     ; 5008 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 500B _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 500E _ 3B. 45, 14
        jge     ?_280                                   ; 5011 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 5013 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5016 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 5019 _ 89. 45, 14
?_280:  mov     eax, dword [ebp+8H]                     ; 501C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 501F _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 5022 _ 3B. 45, 18
        jge     ?_281                                   ; 5025 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 5027 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 502A _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 502D _ 89. 45, 18
?_281:  mov     eax, dword [ebp+1CH]                    ; 5030 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 5033 _ 89. 45, CC
        jmp     ?_292                                   ; 5036 _ E9, 0000015B

?_282:  mov     eax, dword [ebp+8H]                     ; 503B _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 503E _ 8B. 55, CC
        add     edx, 4                                  ; 5041 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 5044 _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 5048 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 504B _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 504E _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 5050 _ 89. 45, EC
        mov     edx, dword [ebp-18H]                    ; 5053 _ 8B. 55, E8
        mov     eax, dword [ebp+8H]                     ; 5056 _ 8B. 45, 08
        add     eax, 1044                               ; 5059 _ 05, 00000414
        sub     edx, eax                                ; 505E _ 29. C2
        mov     eax, edx                                ; 5060 _ 89. D0
        sar     eax, 2                                  ; 5062 _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 5065 _ 69. C0, 38E38E39
        mov     byte [ebp-35H], al                      ; 506B _ 88. 45, CB
        mov     eax, dword [ebp-18H]                    ; 506E _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 5071 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 5074 _ 8B. 55, 0C
        sub     edx, eax                                ; 5077 _ 29. C2
        mov     eax, edx                                ; 5079 _ 89. D0
        mov     dword [ebp-10H], eax                    ; 507B _ 89. 45, F0
        mov     eax, dword [ebp-18H]                    ; 507E _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 5081 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 5084 _ 8B. 55, 10
        sub     edx, eax                                ; 5087 _ 29. C2
        mov     eax, edx                                ; 5089 _ 89. D0
        mov     dword [ebp-0CH], eax                    ; 508B _ 89. 45, F4
        mov     eax, dword [ebp-18H]                    ; 508E _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 5091 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 5094 _ 8B. 55, 14
        sub     edx, eax                                ; 5097 _ 29. C2
        mov     eax, edx                                ; 5099 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 509B _ 89. 45, D8
        mov     eax, dword [ebp-18H]                    ; 509E _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 50A1 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 50A4 _ 8B. 55, 18
        sub     edx, eax                                ; 50A7 _ 29. C2
        mov     eax, edx                                ; 50A9 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 50AB _ 89. 45, DC
        cmp     dword [ebp-10H], 0                      ; 50AE _ 83. 7D, F0, 00
        jns     ?_283                                   ; 50B2 _ 79, 07
        mov     dword [ebp-10H], 0                      ; 50B4 _ C7. 45, F0, 00000000
?_283:  cmp     dword [ebp-0CH], 0                      ; 50BB _ 83. 7D, F4, 00
        jns     ?_284                                   ; 50BF _ 79, 07
        mov     dword [ebp-0CH], 0                      ; 50C1 _ C7. 45, F4, 00000000
?_284:  mov     eax, dword [ebp-18H]                    ; 50C8 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 50CB _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 50CE _ 3B. 45, D8
        jge     ?_285                                   ; 50D1 _ 7D, 09
        mov     eax, dword [ebp-18H]                    ; 50D3 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 50D6 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 50D9 _ 89. 45, D8
?_285:  mov     eax, dword [ebp-18H]                    ; 50DC _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 50DF _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 50E2 _ 3B. 45, DC
        jge     ?_286                                   ; 50E5 _ 7D, 09
        mov     eax, dword [ebp-18H]                    ; 50E7 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 50EA _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 50ED _ 89. 45, DC
?_286:  mov     dword [ebp-2CH], 0                      ; 50F0 _ C7. 45, D4, 00000000
        jmp     ?_291                                   ; 50F7 _ E9, 0000008A

?_287:  mov     eax, dword [ebp-18H]                    ; 50FC _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 50FF _ 8B. 50, 10
        mov     eax, dword [ebp-2CH]                    ; 5102 _ 8B. 45, D4
        add     eax, edx                                ; 5105 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 5107 _ 89. 45, F8
        mov     dword [ebp-30H], 0                      ; 510A _ C7. 45, D0, 00000000
        jmp     ?_290                                   ; 5111 _ EB, 67

?_288:  mov     eax, dword [ebp-18H]                    ; 5113 _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 5116 _ 8B. 50, 0C
        mov     eax, dword [ebp-30H]                    ; 5119 _ 8B. 45, D0
        add     eax, edx                                ; 511C _ 01. D0
        mov     dword [ebp-4H], eax                     ; 511E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 5121 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5124 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 5127 _ 0F AF. 45, F8
        mov     edx, eax                                ; 512B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 512D _ 8B. 45, FC
        add     eax, edx                                ; 5130 _ 01. D0
        mov     edx, eax                                ; 5132 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 5134 _ 8B. 45, E4
        add     eax, edx                                ; 5137 _ 01. D0
        movzx   eax, byte [eax]                         ; 5139 _ 0F B6. 00
        cmp     al, byte [ebp-35H]                      ; 513C _ 3A. 45, CB
        jnz     ?_289                                   ; 513F _ 75, 35
        mov     eax, dword [ebp+8H]                     ; 5141 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5144 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 5147 _ 0F AF. 45, F8
        mov     edx, eax                                ; 514B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 514D _ 8B. 45, FC
        add     eax, edx                                ; 5150 _ 01. D0
        mov     edx, eax                                ; 5152 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 5154 _ 8B. 45, E0
        add     edx, eax                                ; 5157 _ 01. C2
        mov     eax, dword [ebp-18H]                    ; 5159 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 515C _ 8B. 40, 04
        imul    eax, dword [ebp-2CH]                    ; 515F _ 0F AF. 45, D4
        mov     ecx, eax                                ; 5163 _ 89. C1
        mov     eax, dword [ebp-30H]                    ; 5165 _ 8B. 45, D0
        add     eax, ecx                                ; 5168 _ 01. C8
        mov     ecx, eax                                ; 516A _ 89. C1
        mov     eax, dword [ebp-14H]                    ; 516C _ 8B. 45, EC
        add     eax, ecx                                ; 516F _ 01. C8
        movzx   eax, byte [eax]                         ; 5171 _ 0F B6. 00
        mov     byte [edx], al                          ; 5174 _ 88. 02
?_289:  add     dword [ebp-30H], 1                      ; 5176 _ 83. 45, D0, 01
?_290:  mov     eax, dword [ebp-30H]                    ; 517A _ 8B. 45, D0
        cmp     eax, dword [ebp-28H]                    ; 517D _ 3B. 45, D8
        jl      ?_288                                   ; 5180 _ 7C, 91
        add     dword [ebp-2CH], 1                      ; 5182 _ 83. 45, D4, 01
?_291:  mov     eax, dword [ebp-2CH]                    ; 5186 _ 8B. 45, D4
        cmp     eax, dword [ebp-24H]                    ; 5189 _ 3B. 45, DC
        jl      ?_287                                   ; 518C _ 0F 8C, FFFFFF6A
        add     dword [ebp-34H], 1                      ; 5192 _ 83. 45, CC, 01
?_292:  mov     eax, dword [ebp-34H]                    ; 5196 _ 8B. 45, CC
        cmp     eax, dword [ebp+20H]                    ; 5199 _ 3B. 45, 20
        jle     ?_282                                   ; 519C _ 0F 8E, FFFFFE99
        leave                                           ; 51A2 _ C9
        ret                                             ; 51A3 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 51A4 _ 55
        mov     ebp, esp                                ; 51A5 _ 89. E5
        sub     esp, 64                                 ; 51A7 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 51AA _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 51AD _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 51B0 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 51B3 _ 83. 7D, 0C, 00
        jns     ?_293                                   ; 51B7 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 51B9 _ C7. 45, 0C, 00000000
?_293:  cmp     dword [ebp+10H], 0                      ; 51C0 _ 83. 7D, 10, 00
        jns     ?_294                                   ; 51C4 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 51C6 _ C7. 45, 10, 00000000
?_294:  mov     eax, dword [ebp+8H]                     ; 51CD _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 51D0 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 51D3 _ 3B. 45, 14
        jge     ?_295                                   ; 51D6 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 51D8 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 51DB _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 51DE _ 89. 45, 14
?_295:  mov     eax, dword [ebp+8H]                     ; 51E1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 51E4 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 51E7 _ 3B. 45, 18
        jge     ?_296                                   ; 51EA _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 51EC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 51EF _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 51F2 _ 89. 45, 18
?_296:  mov     eax, dword [ebp+1CH]                    ; 51F5 _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 51F8 _ 89. 45, D0
        jmp     ?_307                                   ; 51FB _ E9, 00000147

?_297:  mov     eax, dword [ebp+8H]                     ; 5200 _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 5203 _ 8B. 55, D0
        add     edx, 4                                  ; 5206 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 5209 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 520D _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 5210 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 5213 _ 8B. 45, 08
        add     eax, 1044                               ; 5216 _ 05, 00000414
        sub     edx, eax                                ; 521B _ 29. C2
        mov     eax, edx                                ; 521D _ 89. D0
        sar     eax, 2                                  ; 521F _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 5222 _ 69. C0, 38E38E39
        mov     byte [ebp-31H], al                      ; 5228 _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 522B _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 522E _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 5230 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 5233 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 5236 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 5239 _ 8B. 55, 0C
        sub     edx, eax                                ; 523C _ 29. C2
        mov     eax, edx                                ; 523E _ 89. D0
        mov     dword [ebp-24H], eax                    ; 5240 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 5243 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 5246 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 5249 _ 8B. 55, 10
        sub     edx, eax                                ; 524C _ 29. C2
        mov     eax, edx                                ; 524E _ 89. D0
        mov     dword [ebp-20H], eax                    ; 5250 _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 5253 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 5256 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 5259 _ 8B. 55, 14
        sub     edx, eax                                ; 525C _ 29. C2
        mov     eax, edx                                ; 525E _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 5260 _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 5263 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 5266 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 5269 _ 8B. 55, 18
        sub     edx, eax                                ; 526C _ 29. C2
        mov     eax, edx                                ; 526E _ 89. D0
        mov     dword [ebp-18H], eax                    ; 5270 _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 5273 _ 83. 7D, DC, 00
        jns     ?_298                                   ; 5277 _ 79, 07
        mov     dword [ebp-24H], 0                      ; 5279 _ C7. 45, DC, 00000000
?_298:  cmp     dword [ebp-20H], 0                      ; 5280 _ 83. 7D, E0, 00
        jns     ?_299                                   ; 5284 _ 79, 07
        mov     dword [ebp-20H], 0                      ; 5286 _ C7. 45, E0, 00000000
?_299:  mov     eax, dword [ebp-10H]                    ; 528D _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 5290 _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 5293 _ 3B. 45, E4
        jge     ?_300                                   ; 5296 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 5298 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 529B _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 529E _ 89. 45, E4
?_300:  mov     eax, dword [ebp-10H]                    ; 52A1 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 52A4 _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 52A7 _ 3B. 45, E8
        jge     ?_301                                   ; 52AA _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 52AC _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 52AF _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 52B2 _ 89. 45, E8
?_301:  mov     eax, dword [ebp-20H]                    ; 52B5 _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 52B8 _ 89. 45, D8
        jmp     ?_306                                   ; 52BB _ EB, 7A

?_302:  mov     eax, dword [ebp-10H]                    ; 52BD _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 52C0 _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 52C3 _ 8B. 45, D8
        add     eax, edx                                ; 52C6 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 52C8 _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 52CB _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 52CE _ 89. 45, D4
        jmp     ?_305                                   ; 52D1 _ EB, 58

?_303:  mov     eax, dword [ebp-10H]                    ; 52D3 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 52D6 _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 52D9 _ 8B. 45, D4
        add     eax, edx                                ; 52DC _ 01. D0
        mov     dword [ebp-4H], eax                     ; 52DE _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 52E1 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 52E4 _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 52E7 _ 0F AF. 45, D8
        mov     edx, eax                                ; 52EB _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 52ED _ 8B. 45, D4
        add     eax, edx                                ; 52F0 _ 01. D0
        mov     edx, eax                                ; 52F2 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 52F4 _ 8B. 45, F4
        add     eax, edx                                ; 52F7 _ 01. D0
        movzx   eax, byte [eax]                         ; 52F9 _ 0F B6. 00
        movzx   edx, al                                 ; 52FC _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 52FF _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 5302 _ 8B. 40, 14
        cmp     edx, eax                                ; 5305 _ 39. C2
        jz      ?_304                                   ; 5307 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 5309 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 530C _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 530F _ 0F AF. 45, F8
        mov     edx, eax                                ; 5313 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 5315 _ 8B. 45, FC
        add     eax, edx                                ; 5318 _ 01. D0
        mov     edx, eax                                ; 531A _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 531C _ 8B. 45, EC
        add     edx, eax                                ; 531F _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 5321 _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 5325 _ 88. 02
?_304:  add     dword [ebp-2CH], 1                      ; 5327 _ 83. 45, D4, 01
?_305:  mov     eax, dword [ebp-2CH]                    ; 532B _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 532E _ 3B. 45, E4
        jl      ?_303                                   ; 5331 _ 7C, A0
        add     dword [ebp-28H], 1                      ; 5333 _ 83. 45, D8, 01
?_306:  mov     eax, dword [ebp-28H]                    ; 5337 _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 533A _ 3B. 45, E8
        jl      ?_302                                   ; 533D _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 5343 _ 83. 45, D0, 01
?_307:  mov     eax, dword [ebp+8H]                     ; 5347 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 534A _ 8B. 40, 10
        cmp     eax, dword [ebp-30H]                    ; 534D _ 3B. 45, D0
        jge     ?_297                                   ; 5350 _ 0F 8D, FFFFFEAA
        nop                                             ; 5356 _ 90
        leave                                           ; 5357 _ C9
        ret                                             ; 5358 _ C3
; sheet_refreshmap End of function

sheet_free:; Function begin
        push    ebp                                     ; 5359 _ 55
        mov     ebp, esp                                ; 535A _ 89. E5
        sub     esp, 24                                 ; 535C _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 535F _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 5362 _ 8B. 40, 18
        test    eax, eax                                ; 5365 _ 85. C0
        js      ?_308                                   ; 5367 _ 78, 1A
        mov     dword [esp+8H], -1                      ; 5369 _ C7. 44 24, 08, FFFFFFFF
        mov     eax, dword [ebp+0CH]                    ; 5371 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 5374 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 5378 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 537B _ 89. 04 24
        call    sheet_updown                            ; 537E _ E8, FFFFFFFC(rel)
?_308:  mov     eax, dword [ebp+0CH]                    ; 5383 _ 8B. 45, 0C
        mov     dword [eax+1CH], 0                      ; 5386 _ C7. 40, 1C, 00000000
        nop                                             ; 538D _ 90
        leave                                           ; 538E _ C9
        ret                                             ; 538F _ C3
; sheet_free End of function

init_pit:; Function begin
        push    ebp                                     ; 5390 _ 55
        mov     ebp, esp                                ; 5391 _ 89. E5
        sub     esp, 40                                 ; 5393 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 5396 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 539E _ C7. 04 24, 00000043
        call    io_out8                                 ; 53A5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 53AA _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 53B2 _ C7. 04 24, 00000040
        call    io_out8                                 ; 53B9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 53BE _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 53C6 _ C7. 04 24, 00000040
        call    io_out8                                 ; 53CD _ E8, FFFFFFFC(rel)
        mov     dword [timerctl], 0                     ; 53D2 _ C7. 05, 00000380(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 53DC _ C7. 45, F4, 00000000
        jmp     ?_310                                   ; 53E3 _ EB, 28

?_309:  mov     eax, dword [ebp-0CH]                    ; 53E5 _ 8B. 45, F4
        shl     eax, 4                                  ; 53E8 _ C1. E0, 04
        add     eax, timerctl                           ; 53EB _ 05, 00000380(d)
        mov     dword [eax+8H], 0                       ; 53F0 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 53F7 _ 8B. 45, F4
        shl     eax, 4                                  ; 53FA _ C1. E0, 04
        add     eax, timerctl                           ; 53FD _ 05, 00000380(d)
        mov     dword [eax+0CH], 0                      ; 5402 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 5409 _ 83. 45, F4, 01
?_310:  cmp     dword [ebp-0CH], 499                    ; 540D _ 81. 7D, F4, 000001F3
        jle     ?_309                                   ; 5414 _ 7E, CF
        leave                                           ; 5416 _ C9
        ret                                             ; 5417 _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 5418 _ 55
        mov     ebp, esp                                ; 5419 _ 89. E5
        sub     esp, 16                                 ; 541B _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 541E _ C7. 45, FC, 00000000
        jmp     ?_313                                   ; 5425 _ EB, 38

?_311:  mov     eax, dword [ebp-4H]                     ; 5427 _ 8B. 45, FC
        shl     eax, 4                                  ; 542A _ C1. E0, 04
        add     eax, timerctl                           ; 542D _ 05, 00000380(d)
        mov     eax, dword [eax+8H]                     ; 5432 _ 8B. 40, 08
        test    eax, eax                                ; 5435 _ 85. C0
        jnz     ?_312                                   ; 5437 _ 75, 22
        mov     eax, dword [ebp-4H]                     ; 5439 _ 8B. 45, FC
        shl     eax, 4                                  ; 543C _ C1. E0, 04
        add     eax, timerctl                           ; 543F _ 05, 00000380(d)
        mov     dword [eax+8H], 1                       ; 5444 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-4H]                     ; 544B _ 8B. 45, FC
        shl     eax, 4                                  ; 544E _ C1. E0, 04
        add     eax, timerctl                           ; 5451 _ 05, 00000380(d)
        add     eax, 4                                  ; 5456 _ 83. C0, 04
        jmp     ?_314                                   ; 5459 _ EB, 12

?_312:  add     dword [ebp-4H], 1                       ; 545B _ 83. 45, FC, 01
?_313:  cmp     dword [ebp-4H], 499                     ; 545F _ 81. 7D, FC, 000001F3
        jle     ?_311                                   ; 5466 _ 7E, BF
        mov     eax, 0                                  ; 5468 _ B8, 00000000
?_314:  leave                                           ; 546D _ C9
        ret                                             ; 546E _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 546F _ 55
        mov     ebp, esp                                ; 5470 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 5472 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 5475 _ C7. 40, 04, 00000000
        nop                                             ; 547C _ 90
        pop     ebp                                     ; 547D _ 5D
        ret                                             ; 547E _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 547F _ 55
        mov     ebp, esp                                ; 5480 _ 89. E5
        sub     esp, 4                                  ; 5482 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 5485 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 5488 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 548B _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 548E _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 5491 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 5494 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 5497 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 549B _ 88. 50, 0C
        nop                                             ; 549E _ 90
        leave                                           ; 549F _ C9
        ret                                             ; 54A0 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 54A1 _ 55
        mov     ebp, esp                                ; 54A2 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 54A4 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 54A7 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 54AA _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 54AC _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 54AF _ C7. 40, 04, 00000002
        nop                                             ; 54B6 _ 90
        pop     ebp                                     ; 54B7 _ 5D
        ret                                             ; 54B8 _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 54B9 _ 55
        mov     ebp, esp                                ; 54BA _ 89. E5
        sub     esp, 40                                 ; 54BC _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 54BF _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 54C7 _ C7. 04 24, 00000020
        call    io_out8                                 ; 54CE _ E8, FFFFFFFC(rel)
        mov     eax, dword [timerctl]                   ; 54D3 _ A1, 00000380(d)
        add     eax, 1                                  ; 54D8 _ 83. C0, 01
        mov     dword [timerctl], eax                   ; 54DB _ A3, 00000380(d)
        mov     byte [ebp-0DH], 0                       ; 54E0 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 54E4 _ C7. 45, F4, 00000000
        jmp     ?_318                                   ; 54EB _ E9, 000000B0

?_315:  mov     eax, dword [ebp-0CH]                    ; 54F0 _ 8B. 45, F4
        shl     eax, 4                                  ; 54F3 _ C1. E0, 04
        add     eax, timerctl                           ; 54F6 _ 05, 00000380(d)
        mov     eax, dword [eax+8H]                     ; 54FB _ 8B. 40, 08
        cmp     eax, 2                                  ; 54FE _ 83. F8, 02
        jne     ?_316                                   ; 5501 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 5507 _ 8B. 45, F4
        shl     eax, 4                                  ; 550A _ C1. E0, 04
        add     eax, timerctl                           ; 550D _ 05, 00000380(d)
        mov     eax, dword [eax+4H]                     ; 5512 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 5515 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 5518 _ 8B. 45, F4
        shl     eax, 4                                  ; 551B _ C1. E0, 04
        add     eax, timerctl                           ; 551E _ 05, 00000380(d)
        mov     dword [eax+4H], edx                     ; 5523 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 5526 _ 8B. 45, F4
        shl     eax, 4                                  ; 5529 _ C1. E0, 04
        add     eax, timerctl                           ; 552C _ 05, 00000380(d)
        mov     eax, dword [eax+4H]                     ; 5531 _ 8B. 40, 04
        test    eax, eax                                ; 5534 _ 85. C0
        jnz     ?_316                                   ; 5536 _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 5538 _ 8B. 45, F4
        shl     eax, 4                                  ; 553B _ C1. E0, 04
        add     eax, timerctl                           ; 553E _ 05, 00000380(d)
        mov     dword [eax+8H], 1                       ; 5543 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 554A _ 8B. 45, F4
        shl     eax, 4                                  ; 554D _ C1. E0, 04
        add     eax, timerctl                           ; 5550 _ 05, 00000380(d)
        movzx   eax, byte [eax+10H]                     ; 5555 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 5559 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 555C _ 8B. 45, F4
        shl     eax, 4                                  ; 555F _ C1. E0, 04
        add     eax, timerctl                           ; 5562 _ 05, 00000380(d)
        mov     eax, dword [eax+0CH]                    ; 5567 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 556A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 556E _ 89. 04 24
        call    fifo8_put                               ; 5571 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5576 _ 8B. 45, F4
        shl     eax, 4                                  ; 5579 _ C1. E0, 04
        add     eax, timerctl                           ; 557C _ 05, 00000380(d)
        lea     edx, [eax+4H]                           ; 5581 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 5584 _ A1, 00000000(d)
        cmp     edx, eax                                ; 5589 _ 39. C2
        jnz     ?_316                                   ; 558B _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 558D _ C6. 45, F3, 01
?_316:  cmp     byte [ebp-0DH], 0                       ; 5591 _ 80. 7D, F3, 00
        jz      ?_317                                   ; 5595 _ 74, 05
        call    task_switch                             ; 5597 _ E8, FFFFFFFC(rel)
?_317:  add     dword [ebp-0CH], 1                      ; 559C _ 83. 45, F4, 01
?_318:  cmp     dword [ebp-0CH], 499                    ; 55A0 _ 81. 7D, F4, 000001F3
        jle     ?_315                                   ; 55A7 _ 0F 8E, FFFFFF43
        nop                                             ; 55AD _ 90
        leave                                           ; 55AE _ C9
        ret                                             ; 55AF _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 55B0 _ 55
        mov     ebp, esp                                ; 55B1 _ 89. E5
        mov     eax, timerctl                           ; 55B3 _ B8, 00000380(d)
        pop     ebp                                     ; 55B8 _ 5D
        ret                                             ; 55B9 _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 55BA _ 55
        mov     ebp, esp                                ; 55BB _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 55BD _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 55C0 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 55C3 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 55C6 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 55C9 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 55CC _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 55CE _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 55D1 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 55D4 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 55D7 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 55DA _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 55E1 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 55E4 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 55EB _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 55EE _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 55F5 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 55F8 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 55FB _ 89. 50, 18
        nop                                             ; 55FE _ 90
        pop     ebp                                     ; 55FF _ 5D
        ret                                             ; 5600 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 5601 _ 55
        mov     ebp, esp                                ; 5602 _ 89. E5
        sub     esp, 24                                 ; 5604 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 5607 _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 560A _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 560D _ 83. 7D, 08, 00
        jnz     ?_319                                   ; 5611 _ 75, 0A
        mov     eax, 4294967295                         ; 5613 _ B8, FFFFFFFF
        jmp     ?_323                                   ; 5618 _ E9, 000000AB

?_319:  mov     eax, dword [ebp+8H]                     ; 561D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5620 _ 8B. 40, 10
        test    eax, eax                                ; 5623 _ 85. C0
        jnz     ?_320                                   ; 5625 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 5627 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 562A _ 8B. 40, 14
        or      eax, 01H                                ; 562D _ 83. C8, 01
        mov     edx, eax                                ; 5630 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5632 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 5635 _ 89. 50, 14
        mov     eax, 4294967295                         ; 5638 _ B8, FFFFFFFF
        jmp     ?_323                                   ; 563D _ E9, 00000086

?_320:  mov     eax, dword [ebp+8H]                     ; 5642 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 5645 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 5647 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 564A _ 8B. 40, 04
        add     edx, eax                                ; 564D _ 01. C2
        movzx   eax, byte [ebp-0CH]                     ; 564F _ 0F B6. 45, F4
        mov     byte [edx], al                          ; 5653 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 5655 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5658 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 565B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 565E _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 5661 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 5664 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 5667 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 566A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 566D _ 8B. 40, 0C
        cmp     edx, eax                                ; 5670 _ 39. C2
        jnz     ?_321                                   ; 5672 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 5674 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 5677 _ C7. 40, 04, 00000000
?_321:  mov     eax, dword [ebp+8H]                     ; 567E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5681 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 5684 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 5687 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 568A _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 568D _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 5690 _ 8B. 40, 18
        test    eax, eax                                ; 5693 _ 85. C0
        jz      ?_322                                   ; 5695 _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 5697 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 569A _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 569D _ 8B. 40, 04
        cmp     eax, 2                                  ; 56A0 _ 83. F8, 02
        jz      ?_322                                   ; 56A3 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 56A5 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 56A8 _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 56AB _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 56B3 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 56BB _ 89. 04 24
        call    task_run                                ; 56BE _ E8, FFFFFFFC(rel)
?_322:  mov     eax, 0                                  ; 56C3 _ B8, 00000000
?_323:  leave                                           ; 56C8 _ C9
        ret                                             ; 56C9 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 56CA _ 55
        mov     ebp, esp                                ; 56CB _ 89. E5
        sub     esp, 16                                 ; 56CD _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 56D0 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 56D3 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 56D6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 56D9 _ 8B. 40, 0C
        cmp     edx, eax                                ; 56DC _ 39. C2
        jnz     ?_324                                   ; 56DE _ 75, 07
        mov     eax, 4294967295                         ; 56E0 _ B8, FFFFFFFF
        jmp     ?_326                                   ; 56E5 _ EB, 51

?_324:  mov     eax, dword [ebp+8H]                     ; 56E7 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 56EA _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 56EC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 56EF _ 8B. 40, 08
        add     eax, edx                                ; 56F2 _ 01. D0
        movzx   eax, byte [eax]                         ; 56F4 _ 0F B6. 00
        movzx   eax, al                                 ; 56F7 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 56FA _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 56FD _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5700 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 5703 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 5706 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 5709 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 570C _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 570F _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 5712 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5715 _ 8B. 40, 0C
        cmp     edx, eax                                ; 5718 _ 39. C2
        jnz     ?_325                                   ; 571A _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 571C _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 571F _ C7. 40, 08, 00000000
?_325:  mov     eax, dword [ebp+8H]                     ; 5726 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5729 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 572C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 572F _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 5732 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 5735 _ 8B. 45, FC
?_326:  leave                                           ; 5738 _ C9
        ret                                             ; 5739 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 573A _ 55
        mov     ebp, esp                                ; 573B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 573D _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5740 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 5743 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5746 _ 8B. 40, 10
        sub     edx, eax                                ; 5749 _ 29. C2
        mov     eax, edx                                ; 574B _ 89. D0
        pop     ebp                                     ; 574D _ 5D
        ret                                             ; 574E _ C3
; fifo8_status End of function

strcmp: ; Function begin
        push    ebp                                     ; 574F _ 55
        mov     ebp, esp                                ; 5750 _ 89. E5
        sub     esp, 16                                 ; 5752 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 5755 _ 83. 7D, 08, 00
        jz      ?_327                                   ; 5759 _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 575B _ 83. 7D, 0C, 00
        jnz     ?_328                                   ; 575F _ 75, 0A
?_327:  mov     eax, 0                                  ; 5761 _ B8, 00000000
        jmp     ?_335                                   ; 5766 _ E9, 0000009B

?_328:  mov     dword [ebp-4H], 0                       ; 576B _ C7. 45, FC, 00000000
        jmp     ?_331                                   ; 5772 _ EB, 25

?_329:  mov     edx, dword [ebp-4H]                     ; 5774 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5777 _ 8B. 45, 08
        add     eax, edx                                ; 577A _ 01. D0
        movzx   edx, byte [eax]                         ; 577C _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 577F _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 5782 _ 8B. 45, 0C
        add     eax, ecx                                ; 5785 _ 01. C8
        movzx   eax, byte [eax]                         ; 5787 _ 0F B6. 00
        cmp     dl, al                                  ; 578A _ 38. C2
        jz      ?_330                                   ; 578C _ 74, 07
        mov     eax, 0                                  ; 578E _ B8, 00000000
        jmp     ?_335                                   ; 5793 _ EB, 71

?_330:  add     dword [ebp-4H], 1                       ; 5795 _ 83. 45, FC, 01
?_331:  mov     edx, dword [ebp-4H]                     ; 5799 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 579C _ 8B. 45, 08
        add     eax, edx                                ; 579F _ 01. D0
        movzx   eax, byte [eax]                         ; 57A1 _ 0F B6. 00
        test    al, al                                  ; 57A4 _ 84. C0
        jz      ?_332                                   ; 57A6 _ 74, 0F
        mov     edx, dword [ebp-4H]                     ; 57A8 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 57AB _ 8B. 45, 0C
        add     eax, edx                                ; 57AE _ 01. D0
        movzx   eax, byte [eax]                         ; 57B0 _ 0F B6. 00
        test    al, al                                  ; 57B3 _ 84. C0
        jnz     ?_329                                   ; 57B5 _ 75, BD
?_332:  mov     edx, dword [ebp-4H]                     ; 57B7 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 57BA _ 8B. 45, 08
        add     eax, edx                                ; 57BD _ 01. D0
        movzx   eax, byte [eax]                         ; 57BF _ 0F B6. 00
        test    al, al                                  ; 57C2 _ 84. C0
        jnz     ?_333                                   ; 57C4 _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 57C6 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 57C9 _ 8B. 45, 0C
        add     eax, edx                                ; 57CC _ 01. D0
        movzx   eax, byte [eax]                         ; 57CE _ 0F B6. 00
        test    al, al                                  ; 57D1 _ 84. C0
        jz      ?_333                                   ; 57D3 _ 74, 07
        mov     eax, 0                                  ; 57D5 _ B8, 00000000
        jmp     ?_335                                   ; 57DA _ EB, 2A

?_333:  mov     edx, dword [ebp-4H]                     ; 57DC _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 57DF _ 8B. 45, 08
        add     eax, edx                                ; 57E2 _ 01. D0
        movzx   eax, byte [eax]                         ; 57E4 _ 0F B6. 00
        test    al, al                                  ; 57E7 _ 84. C0
        jz      ?_334                                   ; 57E9 _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 57EB _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 57EE _ 8B. 45, 0C
        add     eax, edx                                ; 57F1 _ 01. D0
        movzx   eax, byte [eax]                         ; 57F3 _ 0F B6. 00
        test    al, al                                  ; 57F6 _ 84. C0
        jz      ?_334                                   ; 57F8 _ 74, 07
        mov     eax, 0                                  ; 57FA _ B8, 00000000
        jmp     ?_335                                   ; 57FF _ EB, 05

?_334:  mov     eax, 1                                  ; 5801 _ B8, 00000001
?_335:  leave                                           ; 5806 _ C9
        ret                                             ; 5807 _ C3
; strcmp End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 5808 _ 55
        mov     ebp, esp                                ; 5809 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 580B _ 81. 7D, 0C, 000FFFFF
        jbe     ?_336                                   ; 5812 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 5814 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 581B _ 8B. 45, 0C
        shr     eax, 12                                 ; 581E _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 5821 _ 89. 45, 0C
?_336:  mov     eax, dword [ebp+0CH]                    ; 5824 _ 8B. 45, 0C
        mov     edx, eax                                ; 5827 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5829 _ 8B. 45, 08
        mov     word [eax], dx                          ; 582C _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 582F _ 8B. 45, 10
        mov     edx, eax                                ; 5832 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5834 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 5837 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 583B _ 8B. 45, 10
        sar     eax, 16                                 ; 583E _ C1. F8, 10
        mov     edx, eax                                ; 5841 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5843 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 5846 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 5849 _ 8B. 45, 14
        mov     edx, eax                                ; 584C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 584E _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 5851 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 5854 _ 8B. 45, 0C
        shr     eax, 16                                 ; 5857 _ C1. E8, 10
        and     eax, 0FH                                ; 585A _ 83. E0, 0F
        mov     edx, eax                                ; 585D _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 585F _ 8B. 45, 14
        sar     eax, 8                                  ; 5862 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 5865 _ 83. E0, F0
        or      eax, edx                                ; 5868 _ 09. D0
        mov     edx, eax                                ; 586A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 586C _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 586F _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 5872 _ 8B. 45, 10
        shr     eax, 24                                 ; 5875 _ C1. E8, 18
        mov     edx, eax                                ; 5878 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 587A _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 587D _ 88. 50, 07
        nop                                             ; 5880 _ 90
        pop     ebp                                     ; 5881 _ 5D
        ret                                             ; 5882 _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 5883 _ 55
        mov     ebp, esp                                ; 5884 _ 89. E5
        mov     eax, dword [taskctl]                    ; 5886 _ A1, 000022C8(d)
        pop     ebp                                     ; 588B _ 5D
        ret                                             ; 588C _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 588D _ 55
        mov     ebp, esp                                ; 588E _ 89. E5
        sub     esp, 16                                 ; 5890 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5893 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp+8H]                     ; 5899 _ 8B. 55, 08
        mov     eax, edx                                ; 589C _ 89. D0
        add     eax, eax                                ; 589E _ 01. C0
        add     eax, edx                                ; 58A0 _ 01. D0
        shl     eax, 4                                  ; 58A2 _ C1. E0, 04
        add     eax, ecx                                ; 58A5 _ 01. C8
        add     eax, 8                                  ; 58A7 _ 83. C0, 08
        mov     dword [eax], 0                          ; 58AA _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 58B0 _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp+8H]                     ; 58B6 _ 8B. 55, 08
        mov     eax, edx                                ; 58B9 _ 89. D0
        add     eax, eax                                ; 58BB _ 01. C0
        add     eax, edx                                ; 58BD _ 01. D0
        shl     eax, 4                                  ; 58BF _ C1. E0, 04
        add     eax, ecx                                ; 58C2 _ 01. C8
        add     eax, 12                                 ; 58C4 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 58C7 _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 58CD _ C7. 45, FC, 00000000
        jmp     ?_338                                   ; 58D4 _ EB, 1B

?_337:  mov     edx, dword [taskctl]                    ; 58D6 _ 8B. 15, 000022C8(d)
        mov     eax, dword [ebp-4H]                     ; 58DC _ 8B. 45, FC
        imul    eax, eax, 52                            ; 58DF _ 6B. C0, 34
        add     eax, edx                                ; 58E2 _ 01. D0
        add     eax, 16                                 ; 58E4 _ 83. C0, 10
        mov     dword [eax], 0                          ; 58E7 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 58ED _ 83. 45, FC, 01
?_338:  cmp     dword [ebp-4H], 9                       ; 58F1 _ 83. 7D, FC, 09
        jle     ?_337                                   ; 58F5 _ 7E, DF
        leave                                           ; 58F7 _ C9
        ret                                             ; 58F8 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 58F9 _ 55
        mov     ebp, esp                                ; 58FA _ 89. E5
        sub     esp, 40                                 ; 58FC _ 83. EC, 28
        call    get_addr_gdt                            ; 58FF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 5904 _ 89. 45, F0
        mov     dword [esp+4H], 3048                    ; 5907 _ C7. 44 24, 04, 00000BE8
        mov     eax, dword [ebp+8H]                     ; 590F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5912 _ 89. 04 24
        call    memman_alloc_4k                         ; 5915 _ E8, FFFFFFFC(rel)
        mov     dword [taskctl], eax                    ; 591A _ A3, 000022C8(d)
        mov     dword [ebp-14H], 0                      ; 591F _ C7. 45, EC, 00000000
        jmp     ?_340                                   ; 5926 _ E9, 0000008C

?_339:  mov     edx, dword [taskctl]                    ; 592B _ 8B. 15, 000022C8(d)
        mov     eax, dword [ebp-14H]                    ; 5931 _ 8B. 45, EC
        imul    eax, eax, 188                           ; 5934 _ 69. C0, 000000BC
        add     eax, edx                                ; 593A _ 01. D0
        add     eax, 492                                ; 593C _ 05, 000001EC
        mov     dword [eax], 0                          ; 5941 _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 5947 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp-14H]                    ; 594D _ 8B. 45, EC
        add     eax, 7                                  ; 5950 _ 83. C0, 07
        lea     edx, [eax*8]                            ; 5953 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 595A _ 8B. 45, EC
        imul    eax, eax, 188                           ; 595D _ 69. C0, 000000BC
        add     eax, ecx                                ; 5963 _ 01. C8
        add     eax, 488                                ; 5965 _ 05, 000001E8
        mov     dword [eax], edx                        ; 596A _ 89. 10
        mov     eax, dword [taskctl]                    ; 596C _ A1, 000022C8(d)
        mov     edx, dword [ebp-14H]                    ; 5971 _ 8B. 55, EC
        imul    edx, edx, 188                           ; 5974 _ 69. D2, 000000BC
        add     edx, 512                                ; 597A _ 81. C2, 00000200
        add     eax, edx                                ; 5980 _ 01. D0
        add     eax, 20                                 ; 5982 _ 83. C0, 14
        mov     edx, dword [ebp-14H]                    ; 5985 _ 8B. 55, EC
        add     edx, 7                                  ; 5988 _ 83. C2, 07
        lea     ecx, [edx*8]                            ; 598B _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 5992 _ 8B. 55, F0
        add     edx, ecx                                ; 5995 _ 01. CA
        mov     dword [esp+0CH], 137                    ; 5997 _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 599F _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 59A3 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 59AB _ 89. 14 24
        call    set_segmdesc                            ; 59AE _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 59B3 _ 83. 45, EC, 01
?_340:  cmp     dword [ebp-14H], 9                      ; 59B7 _ 83. 7D, EC, 09
        jle     ?_339                                   ; 59BB _ 0F 8E, FFFFFF6A
        mov     dword [ebp-14H], 0                      ; 59C1 _ C7. 45, EC, 00000000
        jmp     ?_342                                   ; 59C8 _ EB, 0F

?_341:  mov     eax, dword [ebp-14H]                    ; 59CA _ 8B. 45, EC
        mov     dword [esp], eax                        ; 59CD _ 89. 04 24
        call    init_task_level                         ; 59D0 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 59D5 _ 83. 45, EC, 01
?_342:  cmp     dword [ebp-14H], 9                      ; 59D9 _ 83. 7D, EC, 09
        jle     ?_341                                   ; 59DD _ 7E, EB
        call    task_alloc                              ; 59DF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 59E4 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 59E7 _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 59EA _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 59F1 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 59F4 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 59FB _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 59FE _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 5A05 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 5A08 _ 89. 04 24
        call    task_add                                ; 5A0B _ E8, FFFFFFFC(rel)
        call    task_switchsub                          ; 5A10 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5A15 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 5A18 _ 8B. 00
        mov     dword [esp], eax                        ; 5A1A _ 89. 04 24
        call    load_tr                                 ; 5A1D _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 5A22 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 5A27 _ A3, 000022C4(d)
        mov     eax, dword [ebp-0CH]                    ; 5A2C _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 5A2F _ 8B. 40, 08
        mov     edx, eax                                ; 5A32 _ 89. C2
        mov     eax, dword [task_timer]                 ; 5A34 _ A1, 000022C4(d)
        mov     dword [esp+4H], edx                     ; 5A39 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 5A3D _ 89. 04 24
        call    timer_settime                           ; 5A40 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5A45 _ 8B. 45, F4
        leave                                           ; 5A48 _ C9
        ret                                             ; 5A49 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 5A4A _ 55
        mov     ebp, esp                                ; 5A4B _ 89. E5
        sub     esp, 16                                 ; 5A4D _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 5A50 _ C7. 45, F8, 00000000
        jmp     ?_345                                   ; 5A57 _ E9, 00000105

?_343:  mov     edx, dword [taskctl]                    ; 5A5C _ 8B. 15, 000022C8(d)
        mov     eax, dword [ebp-8H]                     ; 5A62 _ 8B. 45, F8
        imul    eax, eax, 188                           ; 5A65 _ 69. C0, 000000BC
        add     eax, edx                                ; 5A6B _ 01. D0
        add     eax, 492                                ; 5A6D _ 05, 000001EC
        mov     eax, dword [eax]                        ; 5A72 _ 8B. 00
        test    eax, eax                                ; 5A74 _ 85. C0
        jne     ?_344                                   ; 5A76 _ 0F 85, 000000E1
        mov     eax, dword [taskctl]                    ; 5A7C _ A1, 000022C8(d)
        mov     edx, dword [ebp-8H]                     ; 5A81 _ 8B. 55, F8
        imul    edx, edx, 188                           ; 5A84 _ 69. D2, 000000BC
        add     edx, 480                                ; 5A8A _ 81. C2, 000001E0
        add     eax, edx                                ; 5A90 _ 01. D0
        add     eax, 8                                  ; 5A92 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5A95 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 5A98 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 5A9B _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 5AA2 _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 5AA5 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 5AAC _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 5AAF _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 5AB6 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 5AB9 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 5AC0 _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 5AC3 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 5ACA _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 5ACD _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 5AD4 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 5AD7 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 5ADE _ 8B. 45, F8
        add     eax, 1                                  ; 5AE1 _ 83. C0, 01
        shl     eax, 9                                  ; 5AE4 _ C1. E0, 09
        mov     edx, eax                                ; 5AE7 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 5AE9 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 5AEC _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 5AEF _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 5AF2 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 5AF9 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 5AFC _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 5B03 _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 5B06 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 5B0D _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 5B10 _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 5B1A _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 5B1D _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 5B27 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 5B2A _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 5B34 _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 5B37 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 5B3E _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 5B41 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 5B4B _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 5B4E _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 5B58 _ 8B. 45, FC
        jmp     ?_346                                   ; 5B5B _ EB, 13

?_344:  add     dword [ebp-8H], 1                       ; 5B5D _ 83. 45, F8, 01
?_345:  cmp     dword [ebp-8H], 9                       ; 5B61 _ 83. 7D, F8, 09
        jle     ?_343                                   ; 5B65 _ 0F 8E, FFFFFEF1
        mov     eax, 0                                  ; 5B6B _ B8, 00000000
?_346:  leave                                           ; 5B70 _ C9
        ret                                             ; 5B71 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 5B72 _ 55
        mov     ebp, esp                                ; 5B73 _ 89. E5
        sub     esp, 24                                 ; 5B75 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 5B78 _ 83. 7D, 0C, 00
        jns     ?_347                                   ; 5B7C _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 5B7E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5B81 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 5B84 _ 89. 45, 0C
?_347:  cmp     dword [ebp+10H], 0                      ; 5B87 _ 83. 7D, 10, 00
        jle     ?_348                                   ; 5B8B _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 5B8D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 5B90 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 5B93 _ 89. 50, 08
?_348:  mov     eax, dword [ebp+8H]                     ; 5B96 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5B99 _ 8B. 40, 04
        cmp     eax, 2                                  ; 5B9C _ 83. F8, 02
        jnz     ?_349                                   ; 5B9F _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 5BA1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5BA4 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 5BA7 _ 3B. 45, 0C
        jz      ?_349                                   ; 5BAA _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 5BAC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5BAF _ 89. 04 24
        call    task_remove                             ; 5BB2 _ E8, FFFFFFFC(rel)
?_349:  mov     eax, dword [ebp+8H]                     ; 5BB7 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5BBA _ 8B. 40, 04
        cmp     eax, 2                                  ; 5BBD _ 83. F8, 02
        jz      ?_350                                   ; 5BC0 _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 5BC2 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5BC5 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 5BC8 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 5BCB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5BCE _ 89. 04 24
        call    task_add                                ; 5BD1 _ E8, FFFFFFFC(rel)
?_350:  mov     eax, dword [taskctl]                    ; 5BD6 _ A1, 000022C8(d)
        mov     dword [eax+4H], 1                       ; 5BDB _ C7. 40, 04, 00000001
        nop                                             ; 5BE2 _ 90
        leave                                           ; 5BE3 _ C9
        ret                                             ; 5BE4 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 5BE5 _ 55
        mov     ebp, esp                                ; 5BE6 _ 89. E5
        sub     esp, 40                                 ; 5BE8 _ 83. EC, 28
        mov     ecx, dword [taskctl]                    ; 5BEB _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 5BF1 _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 5BF6 _ 8B. 10
        mov     eax, edx                                ; 5BF8 _ 89. D0
        add     eax, eax                                ; 5BFA _ 01. C0
        add     eax, edx                                ; 5BFC _ 01. D0
        shl     eax, 4                                  ; 5BFE _ C1. E0, 04
        add     eax, ecx                                ; 5C01 _ 01. C8
        add     eax, 8                                  ; 5C03 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 5C06 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 5C09 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5C0C _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5C0F _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 5C12 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 5C16 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 5C19 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 5C1C _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 5C1F _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 5C22 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 5C25 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5C28 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5C2B _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5C2E _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 5C31 _ 8B. 00
        cmp     edx, eax                                ; 5C33 _ 39. C2
        jnz     ?_351                                   ; 5C35 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 5C37 _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 5C3A _ C7. 40, 04, 00000000
?_351:  mov     eax, dword [taskctl]                    ; 5C41 _ A1, 000022C8(d)
        mov     eax, dword [eax+4H]                     ; 5C46 _ 8B. 40, 04
        test    eax, eax                                ; 5C49 _ 85. C0
        jz      ?_352                                   ; 5C4B _ 74, 23
        call    task_switchsub                          ; 5C4D _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 5C52 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 5C58 _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 5C5D _ 8B. 10
        mov     eax, edx                                ; 5C5F _ 89. D0
        add     eax, eax                                ; 5C61 _ 01. C0
        add     eax, edx                                ; 5C63 _ 01. D0
        shl     eax, 4                                  ; 5C65 _ C1. E0, 04
        add     eax, ecx                                ; 5C68 _ 01. C8
        add     eax, 8                                  ; 5C6A _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 5C6D _ 89. 45, EC
?_352:  mov     eax, dword [ebp-14H]                    ; 5C70 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5C73 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5C76 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 5C79 _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 5C7D _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 5C80 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 5C83 _ 8B. 40, 08
        mov     edx, eax                                ; 5C86 _ 89. C2
        mov     eax, dword [task_timer]                 ; 5C88 _ A1, 000022C4(d)
        mov     dword [esp+4H], edx                     ; 5C8D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 5C91 _ 89. 04 24
        call    timer_settime                           ; 5C94 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5C99 _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 5C9C _ 3B. 45, F0
        jz      ?_353                                   ; 5C9F _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 5CA1 _ 83. 7D, F4, 00
        jz      ?_353                                   ; 5CA5 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 5CA7 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 5CAA _ 8B. 00
        mov     dword [esp+4H], eax                     ; 5CAC _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 5CB0 _ C7. 04 24, 00000000
        call    farjmp                                  ; 5CB7 _ E8, FFFFFFFC(rel)
?_353:  nop                                             ; 5CBC _ 90
        leave                                           ; 5CBD _ C9
        ret                                             ; 5CBE _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 5CBF _ 55
        mov     ebp, esp                                ; 5CC0 _ 89. E5
        sub     esp, 40                                 ; 5CC2 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 5CC5 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 5CCC _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 5CD3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5CD6 _ 8B. 40, 04
        cmp     eax, 2                                  ; 5CD9 _ 83. F8, 02
        jnz     ?_354                                   ; 5CDC _ 75, 51
        call    task_now                                ; 5CDE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 5CE3 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 5CE6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5CE9 _ 89. 04 24
        call    task_remove                             ; 5CEC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 5CF1 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 5CF8 _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 5CFB _ 3B. 45, F4
        jnz     ?_354                                   ; 5CFE _ 75, 2F
        call    task_switchsub                          ; 5D00 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 5D05 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 5D0A _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 5D0D _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 5D14 _ 83. 7D, F4, 00
        jz      ?_354                                   ; 5D18 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 5D1A _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 5D1D _ 8B. 00
        mov     dword [esp+4H], eax                     ; 5D1F _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 5D23 _ C7. 04 24, 00000000
        call    farjmp                                  ; 5D2A _ E8, FFFFFFFC(rel)
?_354:  mov     eax, dword [ebp-10H]                    ; 5D2F _ 8B. 45, F0
        leave                                           ; 5D32 _ C9
        ret                                             ; 5D33 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 5D34 _ 55
        mov     ebp, esp                                ; 5D35 _ 89. E5
        sub     esp, 16                                 ; 5D37 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5D3A _ 8B. 0D, 000022C8(d)
        mov     eax, dword [taskctl]                    ; 5D40 _ A1, 000022C8(d)
        mov     edx, dword [eax]                        ; 5D45 _ 8B. 10
        mov     eax, edx                                ; 5D47 _ 89. D0
        add     eax, eax                                ; 5D49 _ 01. C0
        add     eax, edx                                ; 5D4B _ 01. D0
        shl     eax, 4                                  ; 5D4D _ C1. E0, 04
        add     eax, ecx                                ; 5D50 _ 01. C8
        add     eax, 8                                  ; 5D52 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5D55 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 5D58 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 5D5B _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 5D5E _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 5D61 _ 8B. 44 90, 08
        leave                                           ; 5D65 _ C9
        ret                                             ; 5D66 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 5D67 _ 55
        mov     ebp, esp                                ; 5D68 _ 89. E5
        sub     esp, 16                                 ; 5D6A _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5D6D _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp+8H]                     ; 5D73 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5D76 _ 8B. 50, 0C
        mov     eax, edx                                ; 5D79 _ 89. D0
        add     eax, eax                                ; 5D7B _ 01. C0
        add     eax, edx                                ; 5D7D _ 01. D0
        shl     eax, 4                                  ; 5D7F _ C1. E0, 04
        add     eax, ecx                                ; 5D82 _ 01. C8
        add     eax, 8                                  ; 5D84 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5D87 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 5D8A _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 5D8D _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 5D8F _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 5D92 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 5D95 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 5D99 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5D9C _ 8B. 00
        lea     edx, [eax+1H]                           ; 5D9E _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 5DA1 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 5DA4 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 5DA6 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 5DA9 _ C7. 40, 04, 00000002
        nop                                             ; 5DB0 _ 90
        leave                                           ; 5DB1 _ C9
        ret                                             ; 5DB2 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 5DB3 _ 55
        mov     ebp, esp                                ; 5DB4 _ 89. E5
        sub     esp, 16                                 ; 5DB6 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5DB9 _ 8B. 0D, 000022C8(d)
        mov     eax, dword [ebp+8H]                     ; 5DBF _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5DC2 _ 8B. 50, 0C
        mov     eax, edx                                ; 5DC5 _ 89. D0
        add     eax, eax                                ; 5DC7 _ 01. C0
        add     eax, edx                                ; 5DC9 _ 01. D0
        shl     eax, 4                                  ; 5DCB _ C1. E0, 04
        add     eax, ecx                                ; 5DCE _ 01. C8
        add     eax, 8                                  ; 5DD0 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5DD3 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 5DD6 _ C7. 45, F8, 00000000
        jmp     ?_357                                   ; 5DDD _ EB, 23

?_355:  mov     eax, dword [ebp-4H]                     ; 5DDF _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 5DE2 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 5DE5 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 5DE9 _ 3B. 45, 08
        jnz     ?_356                                   ; 5DEC _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 5DEE _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 5DF1 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 5DF4 _ C7. 44 90, 08, 00000000
        jmp     ?_358                                   ; 5DFC _ EB, 0E

?_356:  add     dword [ebp-8H], 1                       ; 5DFE _ 83. 45, F8, 01
?_357:  mov     eax, dword [ebp-4H]                     ; 5E02 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5E05 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 5E07 _ 3B. 45, F8
        jg      ?_355                                   ; 5E0A _ 7F, D3
?_358:  mov     eax, dword [ebp-4H]                     ; 5E0C _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5E0F _ 8B. 00
        lea     edx, [eax-1H]                           ; 5E11 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 5E14 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 5E17 _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 5E19 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 5E1C _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 5E1F _ 3B. 45, F8
        jle     ?_359                                   ; 5E22 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 5E24 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 5E27 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 5E2A _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 5E2D _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 5E30 _ 89. 50, 04
?_359:  mov     eax, dword [ebp-4H]                     ; 5E33 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 5E36 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 5E39 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5E3C _ 8B. 00
        cmp     edx, eax                                ; 5E3E _ 39. C2
        jl      ?_360                                   ; 5E40 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 5E42 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 5E45 _ C7. 40, 04, 00000000
?_360:  mov     eax, dword [ebp+8H]                     ; 5E4C _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 5E4F _ C7. 40, 04, 00000001
        jmp     ?_362                                   ; 5E56 _ EB, 1B

?_361:  mov     eax, dword [ebp-8H]                     ; 5E58 _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 5E5B _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 5E5E _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 5E61 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 5E65 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 5E68 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 5E6B _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 5E6F _ 83. 45, F8, 01
?_362:  mov     eax, dword [ebp-4H]                     ; 5E73 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5E76 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 5E78 _ 3B. 45, F8
        jg      ?_361                                   ; 5E7B _ 7F, DB
        nop                                             ; 5E7D _ 90
        leave                                           ; 5E7E _ C9
        ret                                             ; 5E7F _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 5E80 _ 55
        mov     ebp, esp                                ; 5E81 _ 89. E5
        sub     esp, 16                                 ; 5E83 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 5E86 _ C7. 45, FC, 00000000
        jmp     ?_365                                   ; 5E8D _ EB, 23

?_363:  mov     ecx, dword [taskctl]                    ; 5E8F _ 8B. 0D, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 5E95 _ 8B. 55, FC
        mov     eax, edx                                ; 5E98 _ 89. D0
        add     eax, eax                                ; 5E9A _ 01. C0
        add     eax, edx                                ; 5E9C _ 01. D0
        shl     eax, 4                                  ; 5E9E _ C1. E0, 04
        add     eax, ecx                                ; 5EA1 _ 01. C8
        add     eax, 8                                  ; 5EA3 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 5EA6 _ 8B. 00
        test    eax, eax                                ; 5EA8 _ 85. C0
        jle     ?_364                                   ; 5EAA _ 7E, 02
        jmp     ?_366                                   ; 5EAC _ EB, 0A

?_364:  add     dword [ebp-4H], 1                       ; 5EAE _ 83. 45, FC, 01
?_365:  cmp     dword [ebp-4H], 9                       ; 5EB2 _ 83. 7D, FC, 09
        jle     ?_363                                   ; 5EB6 _ 7E, D7
?_366:  mov     eax, dword [taskctl]                    ; 5EB8 _ A1, 000022C8(d)
        mov     edx, dword [ebp-4H]                     ; 5EBD _ 8B. 55, FC
        mov     dword [eax], edx                        ; 5EC0 _ 89. 10
        mov     eax, dword [taskctl]                    ; 5EC2 _ A1, 000022C8(d)
        mov     dword [eax+4H], 0                       ; 5EC7 _ C7. 40, 04, 00000000
        leave                                           ; 5ECE _ C9
        ret                                             ; 5ECF _ C3
; task_switchsub End of function

send_message:; Function begin
        push    ebp                                     ; 5ED0 _ 55
        mov     ebp, esp                                ; 5ED1 _ 89. E5
        sub     esp, 24                                 ; 5ED3 _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 5ED6 _ 8B. 45, 10
        movzx   eax, al                                 ; 5ED9 _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 5EDC _ 8B. 55, 0C
        add     edx, 16                                 ; 5EDF _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 5EE2 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 5EE6 _ 89. 14 24
        call    fifo8_put                               ; 5EE9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 5EEE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5EF1 _ 89. 04 24
        call    task_sleep                              ; 5EF4 _ E8, FFFFFFFC(rel)
        leave                                           ; 5EF9 _ C9
        ret                                             ; 5EFA _ C3
; send_message End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_367:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_368:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0008 _ task_a.

?_369:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 000F _ console.

?_370:                                                  ; byte
        db 20H, 00H                                     ; 0017 _  .

?_371:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0019 _ free .

?_372:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 001F _  KB.

?_373:                                                  ; byte
        db 3EH, 00H                                     ; 0023 _ >.

?_374:                                                  ; byte
        db 68H, 6CH, 74H, 2EH, 65H, 78H, 65H, 00H       ; 0025 _ hlt.exe.

?_375:                                                  ; byte
        db 70H, 61H, 75H, 73H, 65H, 00H                 ; 002D _ pause.

?_376:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 0033 _ mem.

?_377:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 0037 _ cls.

?_378:                                                  ; byte
        db 68H, 6CH, 74H, 00H                           ; 003B _ hlt.

?_379:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 003F _ dir.

?_380:                                                  ; byte
        db 65H, 78H, 69H, 74H, 00H                      ; 0043 _ exit.

?_381:                                                  ; byte
        db 6BH, 65H, 79H, 62H, 6FH, 61H, 72H, 64H       ; 0048 _ keyboard
        db 00H                                          ; 0050 _ .

?_382:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0051 _ page is:
        db 20H, 00H                                     ; 0059 _  .

?_383:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 005B _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0063 _ L: .

?_384:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0067 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 006F _ H: .

?_385:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0073 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 007B _ w: .

?_386:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 4FH, 43H, 00H            ; 007F _ INT OC.

?_387:                                                  ; byte
        db 53H, 74H, 61H, 63H, 6BH, 20H, 45H, 78H       ; 0086 _ Stack Ex
        db 63H, 65H, 70H, 74H, 69H, 6FH, 6EH, 00H       ; 008E _ ception.

?_388:                                                  ; byte
        db 45H, 49H, 50H, 20H, 3DH, 20H, 00H            ; 0096 _ EIP = .

?_389:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 30H, 44H, 20H, 00H       ; 009D _ INT 0D .

?_390:                                                  ; byte
        db 47H, 65H, 6EH, 65H, 72H, 61H, 6CH, 20H       ; 00A5 _ General 
        db 50H, 72H, 6FH, 74H, 65H, 63H, 74H, 65H       ; 00AD _ Protecte
        db 64H, 20H, 45H, 78H, 63H, 65H, 70H, 74H       ; 00B5 _ d Except
        db 69H, 6FH, 6EH, 00H                           ; 00BD _ ion.


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

?_391:  db 00H                                          ; 0112 _ .

?_392:  db 00H, 00H, 00H, 00H, 00H                      ; 0113 _ .....

mmx:    dd 0FFFFFFFFH                                   ; 0118 _ -1 

mmy:    dd 0FFFFFFFFH                                   ; 011C _ -1 

KEY_CONTROL:                                            ; dword
        dd 0000001DH, 00000000H                         ; 0120 _ 29 0 
        dd 00000000H, 00000000H                         ; 0128 _ 0 0 
        dd 00000000H, 00000000H                         ; 0130 _ 0 0 
        dd 00000000H, 00000000H                         ; 0138 _ 0 0 

table_rgb.2082:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0140 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0148 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0150 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0158 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0160 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0168 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0170 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0178 _ ........

cursor.2142:                                            ; byte
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0180 _ *.......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0188 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0190 _ **......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0198 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01A0 _ *O*.....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01A8 _ ........
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 01B0 _ *OO*....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01B8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 01C0 _ *OOO*...
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01C8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 01D0 _ *OOOO*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01D8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 01E0 _ *OOOOO*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01E8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH       ; 01F0 _ *OOOOOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01F8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0200 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0208 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 2AH       ; 0210 _ *OOOO***
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0218 _ **......
        db 2AH, 4FH, 4FH, 2AH, 4FH, 2AH, 2EH, 2EH       ; 0220 _ *OO*O*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0228 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 0230 _ *O*.*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0238 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 0240 _ **..*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0248 _ ........
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0250 _ *....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0258 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0260 _ .....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0268 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2EH       ; 0270 _ ......*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0278 _ ........

closebtn.2261:                                          ; byte
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

g_hlt:                                                  ; dword
        resd    1                                       ; 0000

key_shift:                                              ; dword
        resd    1                                       ; 0004

caps_lock:                                              ; dword
        resd    1                                       ; 0008

first_task_cons_selector:                               ; dword
        resd    1                                       ; 000C

current_console:                                        ; dword
        resd    1                                       ; 0010

bootInfo:                                               ; qword
        resb    4                                       ; 0014

?_393:  resw    1                                       ; 0018

?_394:  resw    1                                       ; 001A

keyinfo:                                                ; byte
        resb    24                                      ; 001C

?_395:  resd    1                                       ; 0034

mouseinfo:                                              ; byte
        resb    40                                      ; 0038

keybuf:                                                 ; yword
        resb    32                                      ; 0060

mousebuf:                                               ; byte
        resb    128                                     ; 0080

mdec:                                                   ; oword
        resb    12                                      ; 0100

?_396:  resd    1                                       ; 010C

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

task_a.1818:                                            ; dword
        resd    1                                       ; 027C

tss_a.1817:                                             ; byte
        resb    128                                     ; 0280

tss_b.1816:                                             ; byte
        resb    104                                     ; 0300

task_b.1806:                                            ; byte
        resb    12                                      ; 0368

str.2190:                                               ; byte
        resb    1                                       ; 0374

?_397:  resb    9                                       ; 0375

?_398:  resb    2                                       ; 037E

timerctl:                                               ; byte
        resd    2001                                    ; 0380

task_timer:                                             ; dword
        resd    1                                       ; 22C4

taskctl: resd   1                                       ; 22C8


