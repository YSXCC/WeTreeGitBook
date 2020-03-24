; Disassembly of file: ckernel.o
; Sat Jan  6 12:18:56 2018
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
        sub     esp, 100                                ; 0004 _ 83. EC, 64
        sub     esp, 12                                 ; 0007 _ 83. EC, 0C
        push    bootInfo                                ; 000A _ 68, 00000014(d)
        call    initBootInfo                            ; 000F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0014 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0017 _ A1, 00000014(d)
        mov     dword [ebp-18H], eax                    ; 001C _ 89. 45, E8
        movzx   eax, word [?_452]                       ; 001F _ 0F B7. 05, 00000018(d)
        cwde                                            ; 0026 _ 98
        mov     dword [xsize], eax                      ; 0027 _ A3, 0000013C(d)
        movzx   eax, word [?_453]                       ; 002C _ 0F B7. 05, 0000001A(d)
        cwde                                            ; 0033 _ 98
        mov     dword [ysize], eax                      ; 0034 _ A3, 00000140(d)
        call    init_pit                                ; 0039 _ E8, FFFFFFFC(rel)
        push    0                                       ; 003E _ 6A, 00
        push    timerbuf                                ; 0040 _ 68, 0000012C(d)
        push    8                                       ; 0045 _ 6A, 08
        push    timerinfo                               ; 0047 _ 68, 00000110(d)
        call    fifo8_init                              ; 004C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0051 _ 83. C4, 10
        call    timer_alloc                             ; 0054 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0059 _ 89. 45, E4
        sub     esp, 4                                  ; 005C _ 83. EC, 04
        push    10                                      ; 005F _ 6A, 0A
        push    timerinfo                               ; 0061 _ 68, 00000110(d)
        push    dword [ebp-1CH]                         ; 0066 _ FF. 75, E4
        call    timer_init                              ; 0069 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 006E _ 83. C4, 10
        sub     esp, 8                                  ; 0071 _ 83. EC, 08
        push    100                                     ; 0074 _ 6A, 64
        push    dword [ebp-1CH]                         ; 0076 _ FF. 75, E4
        call    timer_settime                           ; 0079 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 007E _ 83. C4, 10
        call    timer_alloc                             ; 0081 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0086 _ 89. 45, E0
        sub     esp, 4                                  ; 0089 _ 83. EC, 04
        push    2                                       ; 008C _ 6A, 02
        push    timerinfo                               ; 008E _ 68, 00000110(d)
        push    dword [ebp-20H]                         ; 0093 _ FF. 75, E0
        call    timer_init                              ; 0096 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 009B _ 83. C4, 10
        sub     esp, 8                                  ; 009E _ 83. EC, 08
        push    300                                     ; 00A1 _ 68, 0000012C
        push    dword [ebp-20H]                         ; 00A6 _ FF. 75, E0
        call    timer_settime                           ; 00A9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00AE _ 83. C4, 10
        call    timer_alloc                             ; 00B1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 00B6 _ 89. 45, DC
        sub     esp, 4                                  ; 00B9 _ 83. EC, 04
        push    1                                       ; 00BC _ 6A, 01
        push    timerinfo                               ; 00BE _ 68, 00000110(d)
        push    dword [ebp-24H]                         ; 00C3 _ FF. 75, DC
        call    timer_init                              ; 00C6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00CB _ 83. C4, 10
        sub     esp, 8                                  ; 00CE _ 83. EC, 08
        push    50                                      ; 00D1 _ 6A, 32
        push    dword [ebp-24H]                         ; 00D3 _ FF. 75, DC
        call    timer_settime                           ; 00D6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00DB _ 83. C4, 10
        push    0                                       ; 00DE _ 6A, 00
        push    keybuf                                  ; 00E0 _ 68, 00000060(d)
        push    32                                      ; 00E5 _ 6A, 20
        push    keyinfo                                 ; 00E7 _ 68, 0000001C(d)
        call    fifo8_init                              ; 00EC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00F1 _ 83. C4, 10
        push    0                                       ; 00F4 _ 6A, 00
        push    mousebuf                                ; 00F6 _ 68, 00000080(d)
        push    128                                     ; 00FB _ 68, 00000080
        push    mouseinfo                               ; 0100 _ 68, 00000038(d)
        call    fifo8_init                              ; 0105 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 010A _ 83. C4, 10
        call    init_palette                            ; 010D _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0112 _ E8, FFFFFFFC(rel)
        call    get_memory_block_count                  ; 0117 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 011C _ 89. 45, D8
        call    get_adr_buffer                          ; 011F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 0124 _ 89. 45, D4
        mov     eax, dword [memman]                     ; 0127 _ A1, 00000000(d)
        sub     esp, 12                                 ; 012C _ 83. EC, 0C
        push    eax                                     ; 012F _ 50
        call    memman_init                             ; 0130 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0135 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 0138 _ A1, 00000000(d)
        sub     esp, 4                                  ; 013D _ 83. EC, 04
        push    1072594944                              ; 0140 _ 68, 3FEE8000
        push    16809984                                ; 0145 _ 68, 01008000
        push    eax                                     ; 014A _ 50
        call    memman_free                             ; 014B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0150 _ 83. C4, 10
        mov     ecx, dword [ysize]                      ; 0153 _ 8B. 0D, 00000140(d)
        mov     edx, dword [xsize]                      ; 0159 _ 8B. 15, 0000013C(d)
        mov     eax, dword [memman]                     ; 015F _ A1, 00000000(d)
        push    ecx                                     ; 0164 _ 51
        push    edx                                     ; 0165 _ 52
        push    dword [ebp-18H]                         ; 0166 _ FF. 75, E8
        push    eax                                     ; 0169 _ 50
        call    shtctl_init                             ; 016A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 016F _ 83. C4, 10
        mov     dword [shtctl], eax                     ; 0172 _ A3, 00000284(d)
        mov     eax, dword [shtctl]                     ; 0177 _ A1, 00000284(d)
        sub     esp, 12                                 ; 017C _ 83. EC, 0C
        push    eax                                     ; 017F _ 50
        call    sheet_alloc                             ; 0180 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0185 _ 83. C4, 10
        mov     dword [sht_back], eax                   ; 0188 _ A3, 00000288(d)
        mov     eax, dword [shtctl]                     ; 018D _ A1, 00000284(d)
        sub     esp, 12                                 ; 0192 _ 83. EC, 0C
        push    eax                                     ; 0195 _ 50
        call    sheet_alloc                             ; 0196 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 019B _ 83. C4, 10
        mov     dword [sht_mouse], eax                  ; 019E _ A3, 0000028C(d)
        mov     edx, dword [xsize]                      ; 01A3 _ 8B. 15, 0000013C(d)
        mov     eax, dword [ysize]                      ; 01A9 _ A1, 00000140(d)
        imul    edx, eax                                ; 01AE _ 0F AF. D0
        mov     eax, dword [memman]                     ; 01B1 _ A1, 00000000(d)
        sub     esp, 8                                  ; 01B6 _ 83. EC, 08
        push    edx                                     ; 01B9 _ 52
        push    eax                                     ; 01BA _ 50
        call    memman_alloc_4k                         ; 01BB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 01C0 _ 83. C4, 10
        mov     dword [buf_back], eax                   ; 01C3 _ A3, 00000144(d)
        mov     ebx, dword [ysize]                      ; 01C8 _ 8B. 1D, 00000140(d)
        mov     ecx, dword [xsize]                      ; 01CE _ 8B. 0D, 0000013C(d)
        mov     edx, dword [buf_back]                   ; 01D4 _ 8B. 15, 00000144(d)
        mov     eax, dword [sht_back]                   ; 01DA _ A1, 00000288(d)
        sub     esp, 12                                 ; 01DF _ 83. EC, 0C
        push    99                                      ; 01E2 _ 6A, 63
        push    ebx                                     ; 01E4 _ 53
        push    ecx                                     ; 01E5 _ 51
        push    edx                                     ; 01E6 _ 52
        push    eax                                     ; 01E7 _ 50
        call    sheet_setbuf                            ; 01E8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 01ED _ 83. C4, 20
        mov     eax, dword [sht_mouse]                  ; 01F0 _ A1, 0000028C(d)
        sub     esp, 12                                 ; 01F5 _ 83. EC, 0C
        push    99                                      ; 01F8 _ 6A, 63
        push    16                                      ; 01FA _ 6A, 10
        push    16                                      ; 01FC _ 6A, 10
        push    buf_mouse                               ; 01FE _ 68, 00000180(d)
        push    eax                                     ; 0203 _ 50
        call    sheet_setbuf                            ; 0204 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0209 _ 83. C4, 20
        mov     ecx, dword [ysize]                      ; 020C _ 8B. 0D, 00000140(d)
        mov     edx, dword [xsize]                      ; 0212 _ 8B. 15, 0000013C(d)
        mov     eax, dword [buf_back]                   ; 0218 _ A1, 00000144(d)
        sub     esp, 4                                  ; 021D _ 83. EC, 04
        push    ecx                                     ; 0220 _ 51
        push    edx                                     ; 0221 _ 52
        push    eax                                     ; 0222 _ 50
        call    init_screen8                            ; 0223 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0228 _ 83. C4, 10
        sub     esp, 8                                  ; 022B _ 83. EC, 08
        push    99                                      ; 022E _ 6A, 63
        push    buf_mouse                               ; 0230 _ 68, 00000180(d)
        call    init_mouse_cursor                       ; 0235 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 023A _ 83. C4, 10
        mov     edx, dword [sht_back]                   ; 023D _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 0243 _ A1, 00000284(d)
        push    0                                       ; 0248 _ 6A, 00
        push    0                                       ; 024A _ 6A, 00
        push    edx                                     ; 024C _ 52
        push    eax                                     ; 024D _ 50
        call    sheet_slide                             ; 024E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0253 _ 83. C4, 10
        mov     eax, dword [xsize]                      ; 0256 _ A1, 0000013C(d)
        sub     eax, 16                                 ; 025B _ 83. E8, 10
        mov     edx, eax                                ; 025E _ 89. C2
        shr     edx, 31                                 ; 0260 _ C1. EA, 1F
        add     eax, edx                                ; 0263 _ 01. D0
        sar     eax, 1                                  ; 0265 _ D1. F8
        mov     dword [mx], eax                         ; 0267 _ A3, 00000134(d)
        mov     eax, dword [ysize]                      ; 026C _ A1, 00000140(d)
        sub     eax, 44                                 ; 0271 _ 83. E8, 2C
        mov     edx, eax                                ; 0274 _ 89. C2
        shr     edx, 31                                 ; 0276 _ C1. EA, 1F
        add     eax, edx                                ; 0279 _ 01. D0
        sar     eax, 1                                  ; 027B _ D1. F8
        mov     dword [my], eax                         ; 027D _ A3, 00000138(d)
        mov     ebx, dword [my]                         ; 0282 _ 8B. 1D, 00000138(d)
        mov     ecx, dword [mx]                         ; 0288 _ 8B. 0D, 00000134(d)
        mov     edx, dword [sht_mouse]                  ; 028E _ 8B. 15, 0000028C(d)
        mov     eax, dword [shtctl]                     ; 0294 _ A1, 00000284(d)
        push    ebx                                     ; 0299 _ 53
        push    ecx                                     ; 029A _ 51
        push    edx                                     ; 029B _ 52
        push    eax                                     ; 029C _ 50
        call    sheet_slide                             ; 029D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02A2 _ 83. C4, 10
        mov     dword [ebp-0CH], 8                      ; 02A5 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 7                      ; 02AC _ C7. 45, F0, 00000007
        mov     eax, dword [shtctl]                     ; 02B3 _ A1, 00000284(d)
        sub     esp, 8                                  ; 02B8 _ 83. EC, 08
        push    ?_422                                   ; 02BB _ 68, 00000000(d)
        push    eax                                     ; 02C0 _ 50
        call    message_box                             ; 02C1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02C6 _ 83. C4, 10
        mov     dword [shtMsgBox], eax                  ; 02C9 _ A3, 00000280(d)
        mov     edx, dword [sht_back]                   ; 02CE _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 02D4 _ A1, 00000284(d)
        sub     esp, 4                                  ; 02D9 _ 83. EC, 04
        push    0                                       ; 02DC _ 6A, 00
        push    edx                                     ; 02DE _ 52
        push    eax                                     ; 02DF _ 50
        call    sheet_updown                            ; 02E0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02E5 _ 83. C4, 10
        mov     edx, dword [sht_mouse]                  ; 02E8 _ 8B. 15, 0000028C(d)
        mov     eax, dword [shtctl]                     ; 02EE _ A1, 00000284(d)
        sub     esp, 4                                  ; 02F3 _ 83. EC, 04
        push    4                                       ; 02F6 _ 6A, 04
        push    edx                                     ; 02F8 _ 52
        push    eax                                     ; 02F9 _ 50
        call    sheet_updown                            ; 02FA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 02FF _ 83. C4, 10
        call    io_sti                                  ; 0302 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0307 _ 83. EC, 0C
        push    mdec                                    ; 030A _ 68, 00000100(d)
        call    enable_mouse                            ; 030F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0314 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 0317 _ A1, 00000000(d)
        sub     esp, 12                                 ; 031C _ 83. EC, 0C
        push    eax                                     ; 031F _ 50
        call    task_init                               ; 0320 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0325 _ 83. C4, 10
        mov     dword [task_a.1848], eax                ; 0328 _ A3, 0000029C(d)
        mov     eax, dword [task_a.1848]                ; 032D _ A1, 0000029C(d)
        mov     dword [?_454], eax                      ; 0332 _ A3, 00000034(d)
        mov     eax, dword [task_a.1848]                ; 0337 _ A1, 0000029C(d)
        mov     dword [task_main], eax                  ; 033C _ A3, 00000294(d)
        mov     eax, dword [task_a.1848]                ; 0341 _ A1, 0000029C(d)
        sub     esp, 4                                  ; 0346 _ 83. EC, 04
        push    0                                       ; 0349 _ 6A, 00
        push    0                                       ; 034B _ 6A, 00
        push    eax                                     ; 034D _ 50
        call    task_run                                ; 034E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0353 _ 83. C4, 10
        sub     esp, 12                                 ; 0356 _ 83. EC, 0C
        push    0                                       ; 0359 _ 6A, 00
        call    launch_console                          ; 035B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0360 _ 83. C4, 10
        mov     dword [ebp-30H], eax                    ; 0363 _ 89. 45, D0
        mov     eax, dword [console_count]              ; 0366 _ A1, 00000000(d)
        add     eax, 1                                  ; 036B _ 83. C0, 01
        mov     dword [console_count], eax              ; 036E _ A3, 00000000(d)
        mov     eax, dword [shtctl]                     ; 0373 _ A1, 00000284(d)
        push    2                                       ; 0378 _ 6A, 02
        push    8                                       ; 037A _ 6A, 08
        push    dword [ebp-30H]                         ; 037C _ FF. 75, D0
        push    eax                                     ; 037F _ 50
        call    sheet_slide                             ; 0380 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0385 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0388 _ A1, 00000284(d)
        sub     esp, 4                                  ; 038D _ 83. EC, 04
        push    2                                       ; 0390 _ 6A, 02
        push    dword [ebp-30H]                         ; 0392 _ FF. 75, D0
        push    eax                                     ; 0395 _ 50
        call    sheet_updown                            ; 0396 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 039B _ 83. C4, 10
        mov     dword [ebp-34H], 0                      ; 039E _ C7. 45, CC, 00000000
        mov     dword [ebp-38H], 0                      ; 03A5 _ C7. 45, C8, 00000000
        mov     dword [ebp-3CH], 0                      ; 03AC _ C7. 45, C4, 00000000
        mov     dword [ebp-40H], 0                      ; 03B3 _ C7. 45, C0, 00000000
        mov     dword [ebp-44H], 0                      ; 03BA _ C7. 45, BC, 00000000
        mov     dword [ebp-14H], 0                      ; 03C1 _ C7. 45, EC, 00000000
        mov     dword [ebp-48H], 0                      ; 03C8 _ C7. 45, B8, 00000000
        mov     dword [ebp-4CH], 0                      ; 03CF _ C7. 45, B4, 00000000
?_001:  sub     esp, 12                                 ; 03D6 _ 83. EC, 0C
        push    keyinfo                                 ; 03D9 _ 68, 0000001C(d)
        call    fifo8_status                            ; 03DE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03E3 _ 83. C4, 10
        mov     ebx, eax                                ; 03E6 _ 89. C3
        sub     esp, 12                                 ; 03E8 _ 83. EC, 0C
        push    mouseinfo                               ; 03EB _ 68, 00000038(d)
        call    fifo8_status                            ; 03F0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03F5 _ 83. C4, 10
        add     ebx, eax                                ; 03F8 _ 01. C3
        sub     esp, 12                                 ; 03FA _ 83. EC, 0C
        push    timerinfo                               ; 03FD _ 68, 00000110(d)
        call    fifo8_status                            ; 0402 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0407 _ 83. C4, 10
        add     eax, ebx                                ; 040A _ 01. D8
        test    eax, eax                                ; 040C _ 85. C0
        jnz     ?_002                                   ; 040E _ 75, 0A
        call    io_sti                                  ; 0410 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 0415 _ E9, 00000397

?_002:  sub     esp, 12                                 ; 041A _ 83. EC, 0C
        push    keyinfo                                 ; 041D _ 68, 0000001C(d)
        call    fifo8_status                            ; 0422 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0427 _ 83. C4, 10
        test    eax, eax                                ; 042A _ 85. C0
        je      ?_013                                   ; 042C _ 0F 84, 0000034C
        call    io_sti                                  ; 0432 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0437 _ 83. EC, 0C
        push    keyinfo                                 ; 043A _ 68, 0000001C(d)
        call    fifo8_get                               ; 043F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0444 _ 83. C4, 10
        mov     dword [ebp-34H], eax                    ; 0447 _ 89. 45, CC
        mov     eax, dword [key_shift]                  ; 044A _ A1, 00000000(d)
        test    eax, eax                                ; 044F _ 85. C0
        jz      ?_003                                   ; 0451 _ 74, 58
        cmp     dword [ebp-34H], 17                     ; 0453 _ 83. 7D, CC, 11
        jnz     ?_003                                   ; 0457 _ 75, 52
        mov     eax, dword [console_count]              ; 0459 _ A1, 00000000(d)
        sub     esp, 12                                 ; 045E _ 83. EC, 0C
        push    eax                                     ; 0461 _ 50
        call    launch_console                          ; 0462 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0467 _ 83. C4, 10
        mov     dword [ebp-30H], eax                    ; 046A _ 89. 45, D0
        mov     eax, dword [shtctl]                     ; 046D _ A1, 00000284(d)
        push    176                                     ; 0472 _ 68, 000000B0
        push    156                                     ; 0477 _ 68, 0000009C
        push    dword [ebp-30H]                         ; 047C _ FF. 75, D0
        push    eax                                     ; 047F _ 50
        call    sheet_slide                             ; 0480 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0485 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 0488 _ A1, 00000284(d)
        sub     esp, 4                                  ; 048D _ 83. EC, 04
        push    1                                       ; 0490 _ 6A, 01
        push    dword [ebp-30H]                         ; 0492 _ FF. 75, D0
        push    eax                                     ; 0495 _ 50
        call    sheet_updown                            ; 0496 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 049B _ 83. C4, 10
        mov     eax, dword [console_count]              ; 049E _ A1, 00000000(d)
        add     eax, 1                                  ; 04A3 _ 83. C0, 01
        mov     dword [console_count], eax              ; 04A6 _ A3, 00000000(d)
?_003:  cmp     dword [ebp-34H], 255                    ; 04AB _ 81. 7D, CC, 000000FF
        jnz     ?_004                                   ; 04B2 _ 75, 1F
        mov     eax, dword [current_console_task]       ; 04B4 _ A1, 00000298(d)
        test    eax, eax                                ; 04B9 _ 85. C0
        jz      ?_004                                   ; 04BB _ 74, 16
        mov     eax, dword [current_console_task]       ; 04BD _ A1, 00000298(d)
        sub     esp, 12                                 ; 04C2 _ 83. EC, 0C
        push    eax                                     ; 04C5 _ 50
        call    close_console                           ; 04C6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04CB _ 83. C4, 10
        jmp     ?_018                                   ; 04CE _ E9, 000003A5

?_004:  sub     esp, 12                                 ; 04D3 _ 83. EC, 0C
        push    dword [ebp-34H]                         ; 04D6 _ FF. 75, CC
        call    transferScanCode                        ; 04D9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 04DE _ 83. C4, 10
        cmp     dword [ebp-34H], 16                     ; 04E1 _ 83. 7D, CC, 10
        jnz     ?_005                                   ; 04E5 _ 75, 26
        mov     eax, dword [shtctl]                     ; 04E7 _ A1, 00000284(d)
        mov     eax, dword [eax+10H]                    ; 04EC _ 8B. 40, 10
        lea     ecx, [eax-1H]                           ; 04EF _ 8D. 48, FF
        mov     eax, dword [shtctl]                     ; 04F2 _ A1, 00000284(d)
        mov     edx, dword [eax+18H]                    ; 04F7 _ 8B. 50, 18
        mov     eax, dword [shtctl]                     ; 04FA _ A1, 00000284(d)
        sub     esp, 4                                  ; 04FF _ 83. EC, 04
        push    ecx                                     ; 0502 _ 51
        push    edx                                     ; 0503 _ 52
        push    eax                                     ; 0504 _ 50
        call    sheet_updown                            ; 0505 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 050A _ 83. C4, 10
?_005:  cmp     dword [ebp-34H], 15                     ; 050D _ 83. 7D, CC, 0F
        jne     ?_011                                   ; 0511 _ 0F 85, 0000014E
        mov     dword [ebp-50H], -1                     ; 0517 _ C7. 45, B0, FFFFFFFF
        cmp     dword [ebp-14H], 0                      ; 051E _ 83. 7D, EC, 00
        jne     ?_009                                   ; 0522 _ 0F 85, 0000008E
        mov     dword [ebp-14H], 1                      ; 0528 _ C7. 45, EC, 00000001
        mov     eax, dword [current_console]            ; 052F _ A1, 00000000(d)
        cmp     eax, 1                                  ; 0534 _ 83. F8, 01
        jnz     ?_006                                   ; 0537 _ 75, 0C
        mov     dword [current_console], 0              ; 0539 _ C7. 05, 00000000(d), 00000000
        jmp     ?_007                                   ; 0543 _ EB, 0A

?_006:  mov     dword [current_console], 1              ; 0545 _ C7. 05, 00000000(d), 00000001
?_007:  mov     edx, dword [shtMsgBox]                  ; 054F _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0555 _ A1, 00000284(d)
        push    0                                       ; 055A _ 6A, 00
        push    ?_423                                   ; 055C _ 68, 00000008(d)
        push    edx                                     ; 0561 _ 52
        push    eax                                     ; 0562 _ 50
        call    make_wtitle8                            ; 0563 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0568 _ 83. C4, 10
        mov     eax, dword [current_console_task]       ; 056B _ A1, 00000298(d)
        test    eax, eax                                ; 0570 _ 85. C0
        jz      ?_008                                   ; 0572 _ 74, 21
        mov     eax, dword [current_console_task]       ; 0574 _ A1, 00000298(d)
        mov     edx, dword [eax+0B4H]                   ; 0579 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 057F _ A1, 00000284(d)
        push    1                                       ; 0584 _ 6A, 01
        push    ?_424                                   ; 0586 _ 68, 0000000F(d)
        push    edx                                     ; 058B _ 52
        push    eax                                     ; 058C _ 50
        call    make_wtitle8                            ; 058D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0592 _ 83. C4, 10
?_008:  mov     edx, dword [shtMsgBox]                  ; 0595 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 059B _ A1, 00000284(d)
        sub     esp, 12                                 ; 05A0 _ 83. EC, 0C
        push    7                                       ; 05A3 _ 6A, 07
        push    28                                      ; 05A5 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 05A7 _ FF. 75, F4
        push    edx                                     ; 05AA _ 52
        push    eax                                     ; 05AB _ 50
        call    set_cursor                              ; 05AC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 05B1 _ 83. C4, 20
        jmp     ?_010                                   ; 05B4 _ EB, 4D

?_009:  mov     dword [ebp-14H], 0                      ; 05B6 _ C7. 45, EC, 00000000
        mov     edx, dword [shtMsgBox]                  ; 05BD _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 05C3 _ A1, 00000284(d)
        push    1                                       ; 05C8 _ 6A, 01
        push    ?_423                                   ; 05CA _ 68, 00000008(d)
        push    edx                                     ; 05CF _ 52
        push    eax                                     ; 05D0 _ 50
        call    make_wtitle8                            ; 05D1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 05D6 _ 83. C4, 10
        mov     eax, dword [current_console_task]       ; 05D9 _ A1, 00000298(d)
        test    eax, eax                                ; 05DE _ 85. C0
        jz      ?_010                                   ; 05E0 _ 74, 21
        mov     eax, dword [current_console_task]       ; 05E2 _ A1, 00000298(d)
        mov     edx, dword [eax+0B4H]                   ; 05E7 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 05ED _ A1, 00000284(d)
        push    0                                       ; 05F2 _ 6A, 00
        push    ?_424                                   ; 05F4 _ 68, 0000000F(d)
        push    edx                                     ; 05F9 _ 52
        push    eax                                     ; 05FA _ 50
        call    make_wtitle8                            ; 05FB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0600 _ 83. C4, 10
?_010:  mov     eax, dword [shtMsgBox]                  ; 0603 _ A1, 00000280(d)
        mov     ecx, dword [eax+4H]                     ; 0608 _ 8B. 48, 04
        mov     edx, dword [shtMsgBox]                  ; 060B _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0611 _ A1, 00000284(d)
        sub     esp, 8                                  ; 0616 _ 83. EC, 08
        push    21                                      ; 0619 _ 6A, 15
        push    ecx                                     ; 061B _ 51
        push    0                                       ; 061C _ 6A, 00
        push    0                                       ; 061E _ 6A, 00
        push    edx                                     ; 0620 _ 52
        push    eax                                     ; 0621 _ 50
        call    sheet_refresh                           ; 0622 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0627 _ 83. C4, 20
        mov     eax, dword [current_console_task]       ; 062A _ A1, 00000298(d)
        test    eax, eax                                ; 062F _ 85. C0
        jz      ?_011                                   ; 0631 _ 74, 32
        mov     eax, dword [current_console_task]       ; 0633 _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 0638 _ 8B. 80, 000000B4
        mov     ecx, dword [eax+4H]                     ; 063E _ 8B. 48, 04
        mov     eax, dword [current_console_task]       ; 0641 _ A1, 00000298(d)
        mov     edx, dword [eax+0B4H]                   ; 0646 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 064C _ A1, 00000284(d)
        sub     esp, 8                                  ; 0651 _ 83. EC, 08
        push    21                                      ; 0654 _ 6A, 15
        push    ecx                                     ; 0656 _ 51
        push    0                                       ; 0657 _ 6A, 00
        push    0                                       ; 0659 _ 6A, 00
        push    edx                                     ; 065B _ 52
        push    eax                                     ; 065C _ 50
        call    sheet_refresh                           ; 065D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0662 _ 83. C4, 20
?_011:  cmp     dword [ebp-14H], 0                      ; 0665 _ 83. 7D, EC, 00
        jne     ?_012                                   ; 0669 _ 0F 85, 000000B1
        sub     esp, 12                                 ; 066F _ 83. EC, 0C
        push    dword [ebp-34H]                         ; 0672 _ FF. 75, CC
        call    transferScanCode                        ; 0675 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 067A _ 83. C4, 10
        test    al, al                                  ; 067D _ 84. C0
        je      ?_014                                   ; 067F _ 0F 84, 0000012C
        cmp     dword [ebp-0CH], 143                    ; 0685 _ 81. 7D, F4, 0000008F
        jg      ?_014                                   ; 068C _ 0F 8F, 0000011F
        mov     edx, dword [shtMsgBox]                  ; 0692 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0698 _ A1, 00000284(d)
        sub     esp, 12                                 ; 069D _ 83. EC, 0C
        push    7                                       ; 06A0 _ 6A, 07
        push    28                                      ; 06A2 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 06A4 _ FF. 75, F4
        push    edx                                     ; 06A7 _ 52
        push    eax                                     ; 06A8 _ 50
        call    set_cursor                              ; 06A9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06AE _ 83. C4, 20
        sub     esp, 12                                 ; 06B1 _ 83. EC, 0C
        push    dword [ebp-34H]                         ; 06B4 _ FF. 75, CC
        call    transferScanCode                        ; 06B7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 06BC _ 83. C4, 10
        mov     byte [ebp-51H], al                      ; 06BF _ 88. 45, AF
        movzx   eax, byte [ebp-51H]                     ; 06C2 _ 0F B6. 45, AF
        mov     byte [ebp-66H], al                      ; 06C6 _ 88. 45, 9A
        mov     byte [ebp-65H], 0                       ; 06C9 _ C6. 45, 9B, 00
        mov     edx, dword [shtMsgBox]                  ; 06CD _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 06D3 _ A1, 00000284(d)
        sub     esp, 8                                  ; 06D8 _ 83. EC, 08
        lea     ecx, [ebp-66H]                          ; 06DB _ 8D. 4D, 9A
        push    ecx                                     ; 06DE _ 51
        push    0                                       ; 06DF _ 6A, 00
        push    28                                      ; 06E1 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 06E3 _ FF. 75, F4
        push    edx                                     ; 06E6 _ 52
        push    eax                                     ; 06E7 _ 50
        call    showString                              ; 06E8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 06ED _ 83. C4, 20
        add     dword [ebp-0CH], 8                      ; 06F0 _ 83. 45, F4, 08
        mov     dword [ebp-44H], 1                      ; 06F4 _ C7. 45, BC, 00000001
        mov     edx, dword [shtMsgBox]                  ; 06FB _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 0701 _ A1, 00000284(d)
        sub     esp, 12                                 ; 0706 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0709 _ FF. 75, F0
        push    28                                      ; 070C _ 6A, 1C
        push    dword [ebp-0CH]                         ; 070E _ FF. 75, F4
        push    edx                                     ; 0711 _ 52
        push    eax                                     ; 0712 _ 50
        call    set_cursor                              ; 0713 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0718 _ 83. C4, 20
        jmp     ?_014                                   ; 071B _ E9, 00000091

?_012:  sub     esp, 12                                 ; 0720 _ 83. EC, 0C
        push    dword [ebp-34H]                         ; 0723 _ FF. 75, CC
        call    isSpecialKey                            ; 0726 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 072B _ 83. C4, 10
        test    eax, eax                                ; 072E _ 85. C0
        jnz     ?_014                                   ; 0730 _ 75, 7F
        mov     eax, dword [current_console_task]       ; 0732 _ A1, 00000298(d)
        test    eax, eax                                ; 0737 _ 85. C0
        jz      ?_014                                   ; 0739 _ 74, 76
        mov     eax, dword [ebp-34H]                    ; 073B _ 8B. 45, CC
        movzx   eax, al                                 ; 073E _ 0F B6. C0
        mov     edx, dword [current_console_task]       ; 0741 _ 8B. 15, 00000298(d)
        add     edx, 16                                 ; 0747 _ 83. C2, 10
        sub     esp, 8                                  ; 074A _ 83. EC, 08
        push    eax                                     ; 074D _ 50
        push    edx                                     ; 074E _ 52
        call    fifo8_put                               ; 074F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0754 _ 83. C4, 10
        sub     esp, 12                                 ; 0757 _ 83. EC, 0C
        push    keyinfo                                 ; 075A _ 68, 0000001C(d)
        call    fifo8_status                            ; 075F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0764 _ 83. C4, 10
        test    eax, eax                                ; 0767 _ 85. C0
        jnz     ?_014                                   ; 0769 _ 75, 46
        mov     eax, dword [task_a.1848]                ; 076B _ A1, 0000029C(d)
        sub     esp, 12                                 ; 0770 _ 83. EC, 0C
        push    eax                                     ; 0773 _ 50
        call    task_sleep                              ; 0774 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0779 _ 83. C4, 10
        jmp     ?_014                                   ; 077C _ EB, 33

?_013:  sub     esp, 12                                 ; 077E _ 83. EC, 0C
        push    mouseinfo                               ; 0781 _ 68, 00000038(d)
        call    fifo8_status                            ; 0786 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 078B _ 83. C4, 10
        test    eax, eax                                ; 078E _ 85. C0
        jz      ?_014                                   ; 0790 _ 74, 1F
        mov     ecx, dword [sht_mouse]                  ; 0792 _ 8B. 0D, 0000028C(d)
        mov     edx, dword [sht_back]                   ; 0798 _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 079E _ A1, 00000284(d)
        sub     esp, 4                                  ; 07A3 _ 83. EC, 04
        push    ecx                                     ; 07A6 _ 51
        push    edx                                     ; 07A7 _ 52
        push    eax                                     ; 07A8 _ 50
        call    show_mouse_info                         ; 07A9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07AE _ 83. C4, 10
?_014:  sub     esp, 12                                 ; 07B1 _ 83. EC, 0C
        push    timerinfo                               ; 07B4 _ 68, 00000110(d)
        call    fifo8_status                            ; 07B9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07BE _ 83. C4, 10
        test    eax, eax                                ; 07C1 _ 85. C0
        je      ?_018                                   ; 07C3 _ 0F 84, 000000AF
        call    io_sti                                  ; 07C9 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 07CE _ 83. EC, 0C
        push    timerinfo                               ; 07D1 _ 68, 00000110(d)
        call    fifo8_get                               ; 07D6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07DB _ 83. C4, 10
        mov     dword [ebp-58H], eax                    ; 07DE _ 89. 45, A8
        cmp     dword [ebp-58H], 0                      ; 07E1 _ 83. 7D, A8, 00
        jz      ?_015                                   ; 07E5 _ 74, 1E
        sub     esp, 4                                  ; 07E7 _ 83. EC, 04
        push    0                                       ; 07EA _ 6A, 00
        push    timerinfo                               ; 07EC _ 68, 00000110(d)
        push    dword [ebp-24H]                         ; 07F1 _ FF. 75, DC
        call    timer_init                              ; 07F4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 07F9 _ 83. C4, 10
        mov     dword [ebp-10H], 0                      ; 07FC _ C7. 45, F0, 00000000
        jmp     ?_016                                   ; 0803 _ EB, 1C

?_015:  sub     esp, 4                                  ; 0805 _ 83. EC, 04
        push    1                                       ; 0808 _ 6A, 01
        push    timerinfo                               ; 080A _ 68, 00000110(d)
        push    dword [ebp-24H]                         ; 080F _ FF. 75, DC
        call    timer_init                              ; 0812 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0817 _ 83. C4, 10
        mov     dword [ebp-10H], 7                      ; 081A _ C7. 45, F0, 00000007
?_016:  sub     esp, 8                                  ; 0821 _ 83. EC, 08
        push    50                                      ; 0824 _ 6A, 32
        push    dword [ebp-24H]                         ; 0826 _ FF. 75, DC
        call    timer_settime                           ; 0829 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 082E _ 83. C4, 10
        cmp     dword [ebp-14H], 0                      ; 0831 _ 83. 7D, EC, 00
        jnz     ?_017                                   ; 0835 _ 75, 22
        mov     edx, dword [shtMsgBox]                  ; 0837 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 083D _ A1, 00000284(d)
        sub     esp, 12                                 ; 0842 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 0845 _ FF. 75, F0
        push    28                                      ; 0848 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 084A _ FF. 75, F4
        push    edx                                     ; 084D _ 52
        push    eax                                     ; 084E _ 50
        call    set_cursor                              ; 084F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0854 _ 83. C4, 20
        jmp     ?_018                                   ; 0857 _ EB, 1F

?_017:  mov     edx, dword [shtMsgBox]                  ; 0859 _ 8B. 15, 00000280(d)
        mov     eax, dword [shtctl]                     ; 085F _ A1, 00000284(d)
        sub     esp, 12                                 ; 0864 _ 83. EC, 0C
        push    7                                       ; 0867 _ 6A, 07
        push    28                                      ; 0869 _ 6A, 1C
        push    dword [ebp-0CH]                         ; 086B _ FF. 75, F4
        push    edx                                     ; 086E _ 52
        push    eax                                     ; 086F _ 50
        call    set_cursor                              ; 0870 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0875 _ 83. C4, 20
?_018:  jmp     ?_001                                   ; 0878 _ E9, FFFFFB59
; CMain End of function

set_cursor:; Function begin
        push    ebp                                     ; 087D _ 55
        mov     ebp, esp                                ; 087E _ 89. E5
        push    esi                                     ; 0880 _ 56
        push    ebx                                     ; 0881 _ 53
        cmp     dword [ebp+0CH], 0                      ; 0882 _ 83. 7D, 0C, 00
        jnz     ?_019                                   ; 0886 _ 75, 02
        jmp     ?_020                                   ; 0888 _ EB, 58

?_019:  mov     eax, dword [ebp+14H]                    ; 088A _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 088D _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 0890 _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 0893 _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 0896 _ 8B. 45, 18
        movzx   ecx, al                                 ; 0899 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 089C _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 089F _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 08A2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 08A5 _ 8B. 00
        sub     esp, 4                                  ; 08A7 _ 83. EC, 04
        push    esi                                     ; 08AA _ 56
        push    ebx                                     ; 08AB _ 53
        push    dword [ebp+14H]                         ; 08AC _ FF. 75, 14
        push    dword [ebp+10H]                         ; 08AF _ FF. 75, 10
        push    ecx                                     ; 08B2 _ 51
        push    edx                                     ; 08B3 _ 52
        push    eax                                     ; 08B4 _ 50
        call    boxfill8                                ; 08B5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 08BA _ 83. C4, 20
        mov     eax, dword [ebp+14H]                    ; 08BD _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 08C0 _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 08C3 _ 8B. 45, 10
        add     eax, 8                                  ; 08C6 _ 83. C0, 08
        sub     esp, 8                                  ; 08C9 _ 83. EC, 08
        push    edx                                     ; 08CC _ 52
        push    eax                                     ; 08CD _ 50
        push    dword [ebp+14H]                         ; 08CE _ FF. 75, 14
        push    dword [ebp+10H]                         ; 08D1 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 08D4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 08D7 _ FF. 75, 08
        call    sheet_refresh                           ; 08DA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 08DF _ 83. C4, 20
?_020:  lea     esp, [ebp-8H]                           ; 08E2 _ 8D. 65, F8
        pop     ebx                                     ; 08E5 _ 5B
        pop     esi                                     ; 08E6 _ 5E
        pop     ebp                                     ; 08E7 _ 5D
        ret                                             ; 08E8 _ C3
; set_cursor End of function

isSpecialKey:; Function begin
        push    ebp                                     ; 08E9 _ 55
        mov     ebp, esp                                ; 08EA _ 89. E5
        sub     esp, 8                                  ; 08EC _ 83. EC, 08
        sub     esp, 12                                 ; 08EF _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 08F2 _ FF. 75, 08
        call    transferScanCode                        ; 08F5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 08FA _ 83. C4, 10
        cmp     dword [ebp+8H], 58                      ; 08FD _ 83. 7D, 08, 3A
        jz      ?_021                                   ; 0901 _ 74, 2D
        cmp     dword [ebp+8H], 29                      ; 0903 _ 83. 7D, 08, 1D
        jz      ?_021                                   ; 0907 _ 74, 27
        cmp     dword [ebp+8H], 186                     ; 0909 _ 81. 7D, 08, 000000BA
        jz      ?_021                                   ; 0910 _ 74, 1E
        cmp     dword [ebp+8H], 42                      ; 0912 _ 83. 7D, 08, 2A
        jz      ?_021                                   ; 0916 _ 74, 18
        cmp     dword [ebp+8H], 54                      ; 0918 _ 83. 7D, 08, 36
        jz      ?_021                                   ; 091C _ 74, 12
        cmp     dword [ebp+8H], 170                     ; 091E _ 81. 7D, 08, 000000AA
        jz      ?_021                                   ; 0925 _ 74, 09
        cmp     dword [ebp+8H], 182                     ; 0927 _ 81. 7D, 08, 000000B6
        jnz     ?_022                                   ; 092E _ 75, 07
?_021:  mov     eax, 1                                  ; 0930 _ B8, 00000001
        jmp     ?_023                                   ; 0935 _ EB, 05

?_022:  mov     eax, 0                                  ; 0937 _ B8, 00000000
?_023:  leave                                           ; 093C _ C9
        ret                                             ; 093D _ C3
; isSpecialKey End of function

transferScanCode:; Function begin
        push    ebp                                     ; 093E _ 55
        mov     ebp, esp                                ; 093F _ 89. E5
        sub     esp, 16                                 ; 0941 _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 0944 _ 83. 7D, 08, 2A
        jnz     ?_024                                   ; 0948 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 094A _ A1, 00000000(d)
        or      eax, 01H                                ; 094F _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 0952 _ A3, 00000000(d)
?_024:  cmp     dword [ebp+8H], 54                      ; 0957 _ 83. 7D, 08, 36
        jnz     ?_025                                   ; 095B _ 75, 0D
        mov     eax, dword [key_shift]                  ; 095D _ A1, 00000000(d)
        or      eax, 02H                                ; 0962 _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 0965 _ A3, 00000000(d)
?_025:  cmp     dword [ebp+8H], 170                     ; 096A _ 81. 7D, 08, 000000AA
        jnz     ?_026                                   ; 0971 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0973 _ A1, 00000000(d)
        and     eax, 0FFFFFFFEH                         ; 0978 _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 097B _ A3, 00000000(d)
?_026:  cmp     dword [ebp+8H], 182                     ; 0980 _ 81. 7D, 08, 000000B6
        jnz     ?_027                                   ; 0987 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0989 _ A1, 00000000(d)
        and     eax, 0FFFFFFFDH                         ; 098E _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 0991 _ A3, 00000000(d)
?_027:  cmp     dword [ebp+8H], 58                      ; 0996 _ 83. 7D, 08, 3A
        jnz     ?_029                                   ; 099A _ 75, 1F
        mov     eax, dword [caps_lock]                  ; 099C _ A1, 00000000(d)
        test    eax, eax                                ; 09A1 _ 85. C0
        jnz     ?_028                                   ; 09A3 _ 75, 0C
        mov     dword [caps_lock], 1                    ; 09A5 _ C7. 05, 00000000(d), 00000001
        jmp     ?_029                                   ; 09AF _ EB, 0A

?_028:  mov     dword [caps_lock], 0                    ; 09B1 _ C7. 05, 00000000(d), 00000000
?_029:  cmp     dword [ebp+8H], 42                      ; 09BB _ 83. 7D, 08, 2A
        jz      ?_030                                   ; 09BF _ 74, 24
        cmp     dword [ebp+8H], 54                      ; 09C1 _ 83. 7D, 08, 36
        jz      ?_030                                   ; 09C5 _ 74, 1E
        cmp     dword [ebp+8H], 170                     ; 09C7 _ 81. 7D, 08, 000000AA
        jz      ?_030                                   ; 09CE _ 74, 15
        cmp     dword [ebp+8H], 182                     ; 09D0 _ 81. 7D, 08, 000000B6
        jz      ?_030                                   ; 09D7 _ 74, 0C
        cmp     dword [ebp+8H], 83                      ; 09D9 _ 83. 7D, 08, 53
        jg      ?_030                                   ; 09DD _ 7F, 06
        cmp     dword [ebp+8H], 58                      ; 09DF _ 83. 7D, 08, 3A
        jnz     ?_031                                   ; 09E3 _ 75, 0A
?_030:  mov     eax, 0                                  ; 09E5 _ B8, 00000000
        jmp     ?_036                                   ; 09EA _ E9, 00000089

?_031:  mov     byte [ebp-1H], 0                        ; 09EF _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 09F3 _ A1, 00000000(d)
        test    eax, eax                                ; 09F8 _ 85. C0
        jnz     ?_033                                   ; 09FA _ 75, 46
        cmp     dword [ebp+8H], 83                      ; 09FC _ 83. 7D, 08, 53
        jg      ?_033                                   ; 0A00 _ 7F, 40
        mov     eax, dword [ebp+8H]                     ; 0A02 _ 8B. 45, 08
        add     eax, keytable                           ; 0A05 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 0A0A _ 0F B6. 00
        test    al, al                                  ; 0A0D _ 84. C0
        jz      ?_033                                   ; 0A0F _ 74, 31
        mov     eax, dword [ebp+8H]                     ; 0A11 _ 8B. 45, 08
        add     eax, keytable                           ; 0A14 _ 05, 00000040(d)
        movzx   eax, byte [eax]                         ; 0A19 _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0A1C _ 88. 45, FF
        cmp     byte [ebp-1H], 64                       ; 0A1F _ 80. 7D, FF, 40
        jle     ?_032                                   ; 0A23 _ 7E, 1B
        cmp     byte [ebp-1H], 90                       ; 0A25 _ 80. 7D, FF, 5A
        jg      ?_032                                   ; 0A29 _ 7F, 15
        mov     eax, dword [caps_lock]                  ; 0A2B _ A1, 00000000(d)
        test    eax, eax                                ; 0A30 _ 85. C0
        jnz     ?_032                                   ; 0A32 _ 75, 0C
        movzx   eax, byte [ebp-1H]                      ; 0A34 _ 0F B6. 45, FF
        add     eax, 32                                 ; 0A38 _ 83. C0, 20
        mov     byte [ebp-1H], al                       ; 0A3B _ 88. 45, FF
        jmp     ?_035                                   ; 0A3E _ EB, 34

?_032:  jmp     ?_035                                   ; 0A40 _ EB, 32

?_033:  mov     eax, dword [key_shift]                  ; 0A42 _ A1, 00000000(d)
        test    eax, eax                                ; 0A47 _ 85. C0
        jz      ?_034                                   ; 0A49 _ 74, 25
        cmp     dword [ebp+8H], 127                     ; 0A4B _ 83. 7D, 08, 7F
        jg      ?_034                                   ; 0A4F _ 7F, 1F
        mov     eax, dword [ebp+8H]                     ; 0A51 _ 8B. 45, 08
        add     eax, keytable1                          ; 0A54 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 0A59 _ 0F B6. 00
        test    al, al                                  ; 0A5C _ 84. C0
        jz      ?_034                                   ; 0A5E _ 74, 10
        mov     eax, dword [ebp+8H]                     ; 0A60 _ 8B. 45, 08
        add     eax, keytable1                          ; 0A63 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 0A68 _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0A6B _ 88. 45, FF
        jmp     ?_035                                   ; 0A6E _ EB, 04

?_034:  mov     byte [ebp-1H], 0                        ; 0A70 _ C6. 45, FF, 00
?_035:  movzx   eax, byte [ebp-1H]                      ; 0A74 _ 0F B6. 45, FF
?_036:  leave                                           ; 0A78 _ C9
        ret                                             ; 0A79 _ C3
; transferScanCode End of function

launch_console:; Function begin
        push    ebp                                     ; 0A7A _ 55
        mov     ebp, esp                                ; 0A7B _ 89. E5
        push    ebx                                     ; 0A7D _ 53
        sub     esp, 132                                ; 0A7E _ 81. EC, 00000084
        mov     dword [ebp-0CH], 0                      ; 0A84 _ C7. 45, F4, 00000000
        mov     eax, dword [shtctl]                     ; 0A8B _ A1, 00000284(d)
        sub     esp, 12                                 ; 0A90 _ 83. EC, 0C
        push    eax                                     ; 0A93 _ 50
        call    sheet_alloc                             ; 0A94 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A99 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 0A9C _ 89. 45, F4
        mov     eax, dword [memman]                     ; 0A9F _ A1, 00000000(d)
        sub     esp, 8                                  ; 0AA4 _ 83. EC, 08
        push    42240                                   ; 0AA7 _ 68, 0000A500
        push    eax                                     ; 0AAC _ 50
        call    memman_alloc_4k                         ; 0AAD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AB2 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 0AB5 _ 89. 45, F0
        sub     esp, 12                                 ; 0AB8 _ 83. EC, 0C
        push    99                                      ; 0ABB _ 6A, 63
        push    165                                     ; 0ABD _ 68, 000000A5
        push    256                                     ; 0AC2 _ 68, 00000100
        push    dword [ebp-10H]                         ; 0AC7 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0ACA _ FF. 75, F4
        call    sheet_setbuf                            ; 0ACD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0AD2 _ 83. C4, 20
        cmp     dword [ebp+8H], 0                       ; 0AD5 _ 83. 7D, 08, 00
        jle     ?_037                                   ; 0AD9 _ 7E, 1A
        mov     eax, dword [shtctl]                     ; 0ADB _ A1, 00000284(d)
        push    1                                       ; 0AE0 _ 6A, 01
        push    ?_424                                   ; 0AE2 _ 68, 0000000F(d)
        push    dword [ebp-0CH]                         ; 0AE7 _ FF. 75, F4
        push    eax                                     ; 0AEA _ 50
        call    make_window8                            ; 0AEB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AF0 _ 83. C4, 10
        jmp     ?_038                                   ; 0AF3 _ EB, 18

?_037:  mov     eax, dword [shtctl]                     ; 0AF5 _ A1, 00000284(d)
        push    0                                       ; 0AFA _ 6A, 00
        push    ?_424                                   ; 0AFC _ 68, 0000000F(d)
        push    dword [ebp-0CH]                         ; 0B01 _ FF. 75, F4
        push    eax                                     ; 0B04 _ 50
        call    make_window8                            ; 0B05 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B0A _ 83. C4, 10
?_038:  mov     eax, dword [ebp-0CH]                    ; 0B0D _ 8B. 45, F4
        mov     ecx, dword [eax+8H]                     ; 0B10 _ 8B. 48, 08
        mov     eax, dword [ebp-0CH]                    ; 0B13 _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 0B16 _ 8B. 50, 04
        mov     eax, dword [shtctl]                     ; 0B19 _ A1, 00000284(d)
        sub     esp, 8                                  ; 0B1E _ 83. EC, 08
        push    ecx                                     ; 0B21 _ 51
        push    edx                                     ; 0B22 _ 52
        push    0                                       ; 0B23 _ 6A, 00
        push    0                                       ; 0B25 _ 6A, 00
        push    dword [ebp-0CH]                         ; 0B27 _ FF. 75, F4
        push    eax                                     ; 0B2A _ 50
        call    sheet_refresh                           ; 0B2B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B30 _ 83. C4, 20
        sub     esp, 8                                  ; 0B33 _ 83. EC, 08
        push    0                                       ; 0B36 _ 6A, 00
        push    128                                     ; 0B38 _ 68, 00000080
        push    240                                     ; 0B3D _ 68, 000000F0
        push    28                                      ; 0B42 _ 6A, 1C
        push    8                                       ; 0B44 _ 6A, 08
        push    dword [ebp-0CH]                         ; 0B46 _ FF. 75, F4
        call    make_textbox8                           ; 0B49 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B4E _ 83. C4, 20
        call    task_alloc                              ; 0B51 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0B56 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 0B59 _ 8B. 45, EC
        mov     edx, dword [ebp-0CH]                    ; 0B5C _ 8B. 55, F4
        mov     dword [eax+0B4H], edx                   ; 0B5F _ 89. 90, 000000B4
        mov     eax, dword [ebp-0CH]                    ; 0B65 _ 8B. 45, F4
        mov     edx, dword [ebp-14H]                    ; 0B68 _ 8B. 55, EC
        mov     dword [eax+20H], edx                    ; 0B6B _ 89. 50, 20
        mov     eax, dword [current_console_task]       ; 0B6E _ A1, 00000298(d)
        test    eax, eax                                ; 0B73 _ 85. C0
        jz      ?_039                                   ; 0B75 _ 74, 60
        mov     eax, dword [current_console_task]       ; 0B77 _ A1, 00000298(d)
        mov     edx, dword [eax+0B4H]                   ; 0B7C _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 0B82 _ A1, 00000284(d)
        push    0                                       ; 0B87 _ 6A, 00
        push    ?_424                                   ; 0B89 _ 68, 0000000F(d)
        push    edx                                     ; 0B8E _ 52
        push    eax                                     ; 0B8F _ 50
        call    make_wtitle8                            ; 0B90 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B95 _ 83. C4, 10
        mov     eax, dword [current_console_task]       ; 0B98 _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 0B9D _ 8B. 80, 000000B4
        mov     ebx, dword [eax+8H]                     ; 0BA3 _ 8B. 58, 08
        mov     eax, dword [current_console_task]       ; 0BA6 _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 0BAB _ 8B. 80, 000000B4
        mov     ecx, dword [eax+4H]                     ; 0BB1 _ 8B. 48, 04
        mov     eax, dword [current_console_task]       ; 0BB4 _ A1, 00000298(d)
        mov     edx, dword [eax+0B4H]                   ; 0BB9 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 0BBF _ A1, 00000284(d)
        sub     esp, 8                                  ; 0BC4 _ 83. EC, 08
        push    ebx                                     ; 0BC7 _ 53
        push    ecx                                     ; 0BC8 _ 51
        push    0                                       ; 0BC9 _ 6A, 00
        push    0                                       ; 0BCB _ 6A, 00
        push    edx                                     ; 0BCD _ 52
        push    eax                                     ; 0BCE _ 50
        call    sheet_refresh                           ; 0BCF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BD4 _ 83. C4, 20
?_039:  mov     eax, dword [ebp-14H]                    ; 0BD7 _ 8B. 45, EC
        mov     dword [current_console_task], eax       ; 0BDA _ A3, 00000298(d)
        call    get_code32_addr                         ; 0BDF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0BE4 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 0BE7 _ 8B. 45, E8
        neg     eax                                     ; 0BEA _ F7. D8
        add     eax, console_task                       ; 0BEC _ 05, 00000000(d)
        mov     edx, eax                                ; 0BF1 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 0BF3 _ 8B. 45, EC
        mov     dword [eax+4CH], edx                    ; 0BF6 _ 89. 50, 4C
        mov     eax, dword [ebp-14H]                    ; 0BF9 _ 8B. 45, EC
        mov     dword [eax+74H], 0                      ; 0BFC _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-14H]                    ; 0C03 _ 8B. 45, EC
        mov     dword [eax+78H], 8                      ; 0C06 _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-14H]                    ; 0C0D _ 8B. 45, EC
        mov     dword [eax+7CH], 32                     ; 0C10 _ C7. 40, 7C, 00000020
        mov     eax, dword [ebp-14H]                    ; 0C17 _ 8B. 45, EC
        mov     dword [eax+80H], 24                     ; 0C1A _ C7. 80, 00000080, 00000018
        mov     eax, dword [ebp-14H]                    ; 0C24 _ 8B. 45, EC
        mov     dword [eax+84H], 0                      ; 0C27 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-14H]                    ; 0C31 _ 8B. 45, EC
        mov     dword [eax+88H], 16                     ; 0C34 _ C7. 80, 00000088, 00000010
        mov     eax, dword [memman]                     ; 0C3E _ A1, 00000000(d)
        sub     esp, 8                                  ; 0C43 _ 83. EC, 08
        push    65536                                   ; 0C46 _ 68, 00010000
        push    eax                                     ; 0C4B _ 50
        call    memman_alloc_4k                         ; 0C4C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C51 _ 83. C4, 10
        mov     edx, eax                                ; 0C54 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 0C56 _ 8B. 45, EC
        mov     dword [eax+0B8H], edx                   ; 0C59 _ 89. 90, 000000B8
        mov     eax, dword [ebp-14H]                    ; 0C5F _ 8B. 45, EC
        mov     eax, dword [eax+0B8H]                   ; 0C62 _ 8B. 80, 000000B8
        lea     edx, [eax+3F4H]                         ; 0C68 _ 8D. 90, 000003F4
        mov     eax, dword [ebp-14H]                    ; 0C6E _ 8B. 45, EC
        mov     dword [eax+64H], edx                    ; 0C71 _ 89. 50, 64
        mov     eax, dword [ebp-14H]                    ; 0C74 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0C77 _ 8B. 40, 64
        add     eax, 4                                  ; 0C7A _ 83. C0, 04
        mov     edx, eax                                ; 0C7D _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0C7F _ 8B. 45, F4
        mov     dword [edx], eax                        ; 0C82 _ 89. 02
        mov     eax, dword [ebp-14H]                    ; 0C84 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0C87 _ 8B. 40, 64
        add     eax, 8                                  ; 0C8A _ 83. C0, 08
        mov     ebx, eax                                ; 0C8D _ 89. C3
        mov     eax, dword [memman]                     ; 0C8F _ A1, 00000000(d)
        sub     esp, 12                                 ; 0C94 _ 83. EC, 0C
        push    eax                                     ; 0C97 _ 50
        call    memman_total                            ; 0C98 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C9D _ 83. C4, 10
        mov     dword [ebx], eax                        ; 0CA0 _ 89. 03
        mov     eax, dword [memman]                     ; 0CA2 _ A1, 00000000(d)
        sub     esp, 8                                  ; 0CA7 _ 83. EC, 08
        push    128                                     ; 0CAA _ 68, 00000080
        push    eax                                     ; 0CAF _ 50
        call    memman_alloc                            ; 0CB0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CB5 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0CB8 _ 89. 45, E4
        mov     eax, dword [ebp-14H]                    ; 0CBB _ 8B. 45, EC
        add     eax, 16                                 ; 0CBE _ 83. C0, 10
        push    dword [ebp-14H]                         ; 0CC1 _ FF. 75, EC
        push    dword [ebp-1CH]                         ; 0CC4 _ FF. 75, E4
        push    128                                     ; 0CC7 _ 68, 00000080
        push    eax                                     ; 0CCC _ 50
        call    fifo8_init                              ; 0CCD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CD2 _ 83. C4, 10
        mov     dword [ebp+8H], 0                       ; 0CD5 _ C7. 45, 08, 00000000
        jmp     ?_041                                   ; 0CDC _ EB, 1E

?_040:  mov     edx, dword [ebp+8H]                     ; 0CDE _ 8B. 55, 08
        mov     eax, edx                                ; 0CE1 _ 89. D0
        add     eax, eax                                ; 0CE3 _ 01. C0
        add     eax, edx                                ; 0CE5 _ 01. D0
        shl     eax, 2                                  ; 0CE7 _ C1. E0, 02
        lea     ecx, [ebp-8H]                           ; 0CEA _ 8D. 4D, F8
        add     eax, ecx                                ; 0CED _ 01. C8
        sub     eax, 116                                ; 0CEF _ 83. E8, 74
        mov     dword [eax], 0                          ; 0CF2 _ C7. 00, 00000000
        add     dword [ebp+8H], 1                       ; 0CF8 _ 83. 45, 08, 01
?_041:  cmp     dword [ebp+8H], 7                       ; 0CFC _ 83. 7D, 08, 07
        jle     ?_040                                   ; 0D00 _ 7E, DC
        mov     eax, dword [ebp-14H]                    ; 0D02 _ 8B. 45, EC
        lea     edx, [ebp-7CH]                          ; 0D05 _ 8D. 55, 84
        mov     dword [eax+0CCH], edx                   ; 0D08 _ 89. 90, 000000CC
        sub     esp, 4                                  ; 0D0E _ 83. EC, 04
        push    5                                       ; 0D11 _ 6A, 05
        push    1                                       ; 0D13 _ 6A, 01
        push    dword [ebp-14H]                         ; 0D15 _ FF. 75, EC
        call    task_run                                ; 0D18 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D1D _ 83. C4, 10
        cmp     dword [ebp+8H], 0                       ; 0D20 _ 83. 7D, 08, 00
        jnz     ?_042                                   ; 0D24 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 0D26 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 0D29 _ 8B. 00
        mov     dword [first_task_cons_selector], eax   ; 0D2B _ A3, 00000000(d)
?_042:  mov     eax, dword [ebp-0CH]                    ; 0D30 _ 8B. 45, F4
        mov     ebx, dword [ebp-4H]                     ; 0D33 _ 8B. 5D, FC
        leave                                           ; 0D36 _ C9
        ret                                             ; 0D37 _ C3
; launch_console End of function

kill_process:; Function begin
        push    ebp                                     ; 0D38 _ 55
        mov     ebp, esp                                ; 0D39 _ 89. E5
        sub     esp, 24                                 ; 0D3B _ 83. EC, 18
        call    task_now                                ; 0D3E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0D43 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 0D46 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 0D49 _ 8B. 90, 00000094
        mov     eax, dword [ebp-0CH]                    ; 0D4F _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 0D52 _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 0D58 _ 83. EC, 08
        push    edx                                     ; 0D5B _ 52
        push    eax                                     ; 0D5C _ 50
        call    cons_newline                            ; 0D5D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D62 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 0D65 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 0D68 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 0D6E _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 0D71 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 0D74 _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 0D7A _ 8B. 45, F4
        add     eax, 48                                 ; 0D7D _ 83. C0, 30
        sub     esp, 12                                 ; 0D80 _ 83. EC, 0C
        push    eax                                     ; 0D83 _ 50
        call    asm_end_app                             ; 0D84 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D89 _ 83. C4, 10
        leave                                           ; 0D8C _ C9
        ret                                             ; 0D8D _ C3
; kill_process End of function

cmd_dir:; Function begin
        push    ebp                                     ; 0D8E _ 55
        mov     ebp, esp                                ; 0D8F _ 89. E5
        sub     esp, 40                                 ; 0D91 _ 83. EC, 28
        call    task_now                                ; 0D94 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0D99 _ 89. 45, E8
        mov     dword [ebp-0CH], 88064                  ; 0D9C _ C7. 45, F4, 00015800
        mov     eax, dword [memman]                     ; 0DA3 _ A1, 00000000(d)
        sub     esp, 8                                  ; 0DA8 _ 83. EC, 08
        push    13                                      ; 0DAB _ 6A, 0D
        push    eax                                     ; 0DAD _ 50
        call    memman_alloc                            ; 0DAE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0DB3 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0DB6 _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 0DB9 _ 8B. 45, E4
        add     eax, 12                                 ; 0DBC _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0DBF _ C6. 00, 00
        jmp     ?_051                                   ; 0DC2 _ E9, 00000121

?_043:  mov     dword [ebp-10H], 0                      ; 0DC7 _ C7. 45, F0, 00000000
        jmp     ?_047                                   ; 0DCE _ EB, 2C

?_044:  mov     edx, dword [ebp-0CH]                    ; 0DD0 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 0DD3 _ 8B. 45, F0
        add     eax, edx                                ; 0DD6 _ 01. D0
        movzx   eax, byte [eax]                         ; 0DD8 _ 0F B6. 00
        test    al, al                                  ; 0DDB _ 84. C0
        jz      ?_045                                   ; 0DDD _ 74, 17
        mov     edx, dword [ebp-10H]                    ; 0DDF _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0DE2 _ 8B. 45, E4
        add     eax, edx                                ; 0DE5 _ 01. D0
        mov     ecx, dword [ebp-0CH]                    ; 0DE7 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 0DEA _ 8B. 55, F0
        add     edx, ecx                                ; 0DED _ 01. CA
        movzx   edx, byte [edx]                         ; 0DEF _ 0F B6. 12
        mov     byte [eax], dl                          ; 0DF2 _ 88. 10
        jmp     ?_046                                   ; 0DF4 _ EB, 02

?_045:  jmp     ?_048                                   ; 0DF6 _ EB, 0A

?_046:  add     dword [ebp-10H], 1                      ; 0DF8 _ 83. 45, F0, 01
?_047:  cmp     dword [ebp-10H], 7                      ; 0DFC _ 83. 7D, F0, 07
        jle     ?_044                                   ; 0E00 _ 7E, CE
?_048:  mov     dword [ebp-14H], 0                      ; 0E02 _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 0E09 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0E0C _ 8B. 45, E4
        add     eax, edx                                ; 0E0F _ 01. D0
        mov     byte [eax], 46                          ; 0E11 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 0E14 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 0E18 _ C7. 45, EC, 00000000
        jmp     ?_050                                   ; 0E1F _ EB, 1E

?_049:  mov     edx, dword [ebp-10H]                    ; 0E21 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0E24 _ 8B. 45, E4
        add     eax, edx                                ; 0E27 _ 01. D0
        mov     ecx, dword [ebp-0CH]                    ; 0E29 _ 8B. 4D, F4
        mov     edx, dword [ebp-14H]                    ; 0E2C _ 8B. 55, EC
        add     edx, ecx                                ; 0E2F _ 01. CA
        movzx   edx, byte [edx+8H]                      ; 0E31 _ 0F B6. 52, 08
        mov     byte [eax], dl                          ; 0E35 _ 88. 10
        add     dword [ebp-10H], 1                      ; 0E37 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 0E3B _ 83. 45, EC, 01
?_050:  cmp     dword [ebp-14H], 2                      ; 0E3F _ 83. 7D, EC, 02
        jle     ?_049                                   ; 0E43 _ 7E, DC
        mov     eax, dword [ebp-18H]                    ; 0E45 _ 8B. 45, E8
        mov     ecx, dword [eax+9CH]                    ; 0E48 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-18H]                    ; 0E4E _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 0E51 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 0E57 _ A1, 00000284(d)
        sub     esp, 8                                  ; 0E5C _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0E5F _ FF. 75, E4
        push    7                                       ; 0E62 _ 6A, 07
        push    ecx                                     ; 0E64 _ 51
        push    16                                      ; 0E65 _ 6A, 10
        push    edx                                     ; 0E67 _ 52
        push    eax                                     ; 0E68 _ 50
        call    showString                              ; 0E69 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E6E _ 83. C4, 20
        mov     dword [ebp-20H], 136                    ; 0E71 _ C7. 45, E0, 00000088
        mov     eax, dword [ebp-0CH]                    ; 0E78 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 0E7B _ 8B. 40, 1C
        sub     esp, 12                                 ; 0E7E _ 83. EC, 0C
        push    eax                                     ; 0E81 _ 50
        call    intToHexStr                             ; 0E82 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E87 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 0E8A _ 89. 45, DC
        mov     eax, dword [ebp-18H]                    ; 0E8D _ 8B. 45, E8
        mov     ecx, dword [eax+9CH]                    ; 0E90 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-18H]                    ; 0E96 _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 0E99 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 0E9F _ A1, 00000284(d)
        sub     esp, 8                                  ; 0EA4 _ 83. EC, 08
        push    dword [ebp-24H]                         ; 0EA7 _ FF. 75, DC
        push    7                                       ; 0EAA _ 6A, 07
        push    ecx                                     ; 0EAC _ 51
        push    dword [ebp-20H]                         ; 0EAD _ FF. 75, E0
        push    edx                                     ; 0EB0 _ 52
        push    eax                                     ; 0EB1 _ 50
        call    showString                              ; 0EB2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0EB7 _ 83. C4, 20
        mov     eax, dword [ebp-18H]                    ; 0EBA _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 0EBD _ 8B. 90, 00000094
        mov     eax, dword [ebp-18H]                    ; 0EC3 _ 8B. 45, E8
        mov     eax, dword [eax+9CH]                    ; 0EC6 _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 0ECC _ 83. EC, 08
        push    edx                                     ; 0ECF _ 52
        push    eax                                     ; 0ED0 _ 50
        call    cons_newline                            ; 0ED1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0ED6 _ 83. C4, 10
        mov     edx, eax                                ; 0ED9 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 0EDB _ 8B. 45, E8
        mov     dword [eax+9CH], edx                    ; 0EDE _ 89. 90, 0000009C
        add     dword [ebp-0CH], 32                     ; 0EE4 _ 83. 45, F4, 20
?_051:  mov     eax, dword [ebp-0CH]                    ; 0EE8 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 0EEB _ 0F B6. 00
        test    al, al                                  ; 0EEE _ 84. C0
        jne     ?_043                                   ; 0EF0 _ 0F 85, FFFFFED1
        mov     edx, dword [ebp-1CH]                    ; 0EF6 _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 0EF9 _ A1, 00000000(d)
        sub     esp, 4                                  ; 0EFE _ 83. EC, 04
        push    13                                      ; 0F01 _ 6A, 0D
        push    edx                                     ; 0F03 _ 52
        push    eax                                     ; 0F04 _ 50
        call    memman_free                             ; 0F05 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F0A _ 83. C4, 10
        leave                                           ; 0F0D _ C9
        ret                                             ; 0F0E _ C3
; cmd_dir End of function

cmd_type:; Function begin
        push    ebp                                     ; 0F0F _ 55
        mov     ebp, esp                                ; 0F10 _ 89. E5
        push    esi                                     ; 0F12 _ 56
        push    ebx                                     ; 0F13 _ 53
        sub     esp, 64                                 ; 0F14 _ 83. EC, 40
        call    task_now                                ; 0F17 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 0F1C _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 0F1F _ 8B. 45, DC
        mov     eax, dword [eax+94H]                    ; 0F22 _ 8B. 80, 00000094
        test    eax, eax                                ; 0F28 _ 85. C0
        jnz     ?_052                                   ; 0F2A _ 75, 05
        jmp     ?_076                                   ; 0F2C _ E9, 0000036D

?_052:  mov     eax, dword [memman]                     ; 0F31 _ A1, 00000000(d)
        sub     esp, 8                                  ; 0F36 _ 83. EC, 08
        push    13                                      ; 0F39 _ 6A, 0D
        push    eax                                     ; 0F3B _ 50
        call    memman_alloc                            ; 0F3C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F41 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 0F44 _ 89. 45, D8
        mov     eax, dword [ebp-28H]                    ; 0F47 _ 8B. 45, D8
        add     eax, 12                                 ; 0F4A _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0F4D _ C6. 00, 00
        mov     dword [ebp-0CH], 0                      ; 0F50 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 5                      ; 0F57 _ C7. 45, F0, 00000005
        mov     dword [ebp-10H], 5                      ; 0F5E _ C7. 45, F0, 00000005
        jmp     ?_056                                   ; 0F65 _ EB, 30

?_053:  mov     edx, dword [ebp-10H]                    ; 0F67 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 0F6A _ 8B. 45, 08
        add     eax, edx                                ; 0F6D _ 01. D0
        movzx   eax, byte [eax]                         ; 0F6F _ 0F B6. 00
        test    al, al                                  ; 0F72 _ 84. C0
        jz      ?_054                                   ; 0F74 _ 74, 1B
        mov     edx, dword [ebp-0CH]                    ; 0F76 _ 8B. 55, F4
        mov     eax, dword [ebp-28H]                    ; 0F79 _ 8B. 45, D8
        add     edx, eax                                ; 0F7C _ 01. C2
        mov     ecx, dword [ebp-10H]                    ; 0F7E _ 8B. 4D, F0
        mov     eax, dword [ebp+8H]                     ; 0F81 _ 8B. 45, 08
        add     eax, ecx                                ; 0F84 _ 01. C8
        movzx   eax, byte [eax]                         ; 0F86 _ 0F B6. 00
        mov     byte [edx], al                          ; 0F89 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 0F8B _ 83. 45, F4, 01
        jmp     ?_055                                   ; 0F8F _ EB, 02

?_054:  jmp     ?_057                                   ; 0F91 _ EB, 0A

?_055:  add     dword [ebp-10H], 1                      ; 0F93 _ 83. 45, F0, 01
?_056:  cmp     dword [ebp-10H], 16                     ; 0F97 _ 83. 7D, F0, 10
        jle     ?_053                                   ; 0F9B _ 7E, CA
?_057:  mov     edx, dword [ebp-0CH]                    ; 0F9D _ 8B. 55, F4
        mov     eax, dword [ebp-28H]                    ; 0FA0 _ 8B. 45, D8
        add     eax, edx                                ; 0FA3 _ 01. D0
        mov     byte [eax], 0                           ; 0FA5 _ C6. 00, 00
        mov     dword [ebp-14H], 88064                  ; 0FA8 _ C7. 45, EC, 00015800
        jmp     ?_074                                   ; 0FAF _ E9, 0000028E

?_058:  mov     byte [ebp-31H], 0                       ; 0FB4 _ C6. 45, CF, 00
        mov     dword [ebp-18H], 0                      ; 0FB8 _ C7. 45, E8, 00000000
        jmp     ?_062                                   ; 0FBF _ EB, 2E

?_059:  mov     edx, dword [ebp-14H]                    ; 0FC1 _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 0FC4 _ 8B. 45, E8
        add     eax, edx                                ; 0FC7 _ 01. D0
        movzx   eax, byte [eax]                         ; 0FC9 _ 0F B6. 00
        test    al, al                                  ; 0FCC _ 84. C0
        jz      ?_060                                   ; 0FCE _ 74, 19
        mov     edx, dword [ebp-14H]                    ; 0FD0 _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 0FD3 _ 8B. 45, E8
        add     eax, edx                                ; 0FD6 _ 01. D0
        movzx   eax, byte [eax]                         ; 0FD8 _ 0F B6. 00
        mov     ecx, eax                                ; 0FDB _ 89. C1
        lea     edx, [ebp-3DH]                          ; 0FDD _ 8D. 55, C3
        mov     eax, dword [ebp-18H]                    ; 0FE0 _ 8B. 45, E8
        add     eax, edx                                ; 0FE3 _ 01. D0
        mov     byte [eax], cl                          ; 0FE5 _ 88. 08
        jmp     ?_061                                   ; 0FE7 _ EB, 02

?_060:  jmp     ?_063                                   ; 0FE9 _ EB, 0A

?_061:  add     dword [ebp-18H], 1                      ; 0FEB _ 83. 45, E8, 01
?_062:  cmp     dword [ebp-18H], 7                      ; 0FEF _ 83. 7D, E8, 07
        jle     ?_059                                   ; 0FF3 _ 7E, CC
?_063:  mov     dword [ebp-1CH], 0                      ; 0FF5 _ C7. 45, E4, 00000000
        lea     edx, [ebp-3DH]                          ; 0FFC _ 8D. 55, C3
        mov     eax, dword [ebp-18H]                    ; 0FFF _ 8B. 45, E8
        add     eax, edx                                ; 1002 _ 01. D0
        mov     byte [eax], 46                          ; 1004 _ C6. 00, 2E
        add     dword [ebp-18H], 1                      ; 1007 _ 83. 45, E8, 01
        mov     dword [ebp-1CH], 0                      ; 100B _ C7. 45, E4, 00000000
        jmp     ?_065                                   ; 1012 _ EB, 20

?_064:  mov     edx, dword [ebp-14H]                    ; 1014 _ 8B. 55, EC
        mov     eax, dword [ebp-1CH]                    ; 1017 _ 8B. 45, E4
        add     eax, edx                                ; 101A _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 101C _ 0F B6. 40, 08
        mov     ecx, eax                                ; 1020 _ 89. C1
        lea     edx, [ebp-3DH]                          ; 1022 _ 8D. 55, C3
        mov     eax, dword [ebp-18H]                    ; 1025 _ 8B. 45, E8
        add     eax, edx                                ; 1028 _ 01. D0
        mov     byte [eax], cl                          ; 102A _ 88. 08
        add     dword [ebp-18H], 1                      ; 102C _ 83. 45, E8, 01
        add     dword [ebp-1CH], 1                      ; 1030 _ 83. 45, E4, 01
?_065:  cmp     dword [ebp-1CH], 2                      ; 1034 _ 83. 7D, E4, 02
        jle     ?_064                                   ; 1038 _ 7E, DA
        sub     esp, 8                                  ; 103A _ 83. EC, 08
        lea     eax, [ebp-3DH]                          ; 103D _ 8D. 45, C3
        push    eax                                     ; 1040 _ 50
        push    dword [ebp-28H]                         ; 1041 _ FF. 75, D8
        call    strcmp                                  ; 1044 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1049 _ 83. C4, 10
        cmp     eax, 1                                  ; 104C _ 83. F8, 01
        jne     ?_073                                   ; 104F _ 0F 85, 000001E9
        mov     dword [ebp-2CH], 97280                  ; 1055 _ C7. 45, D4, 00017C00
        mov     eax, dword [ebp-14H]                    ; 105C _ 8B. 45, EC
        movzx   eax, word [eax+1AH]                     ; 105F _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 1063 _ 0F B7. C0
        shl     eax, 9                                  ; 1066 _ C1. E0, 09
        add     dword [ebp-2CH], eax                    ; 1069 _ 01. 45, D4
        mov     eax, dword [ebp-14H]                    ; 106C _ 8B. 45, EC
        mov     eax, dword [eax+1CH]                    ; 106F _ 8B. 40, 1C
        mov     dword [ebp-30H], eax                    ; 1072 _ 89. 45, D0
        mov     dword [ebp-20H], 0                      ; 1075 _ C7. 45, E0, 00000000
        mov     eax, dword [ebp-24H]                    ; 107C _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 107F _ C7. 80, 00000098, 00000010
        mov     dword [ebp-20H], 0                      ; 1089 _ C7. 45, E0, 00000000
        jmp     ?_072                                   ; 1090 _ E9, 0000019A

?_066:  mov     edx, dword [ebp-20H]                    ; 1095 _ 8B. 55, E0
        mov     eax, dword [ebp-2CH]                    ; 1098 _ 8B. 45, D4
        add     eax, edx                                ; 109B _ 01. D0
        movzx   eax, byte [eax]                         ; 109D _ 0F B6. 00
        mov     byte [ebp-3FH], al                      ; 10A0 _ 88. 45, C1
        mov     byte [ebp-3EH], 0                       ; 10A3 _ C6. 45, C2, 00
        movzx   eax, byte [ebp-3FH]                     ; 10A7 _ 0F B6. 45, C1
        cmp     al, 9                                   ; 10AB _ 3C, 09
        jne     ?_069                                   ; 10AD _ 0F 85, 00000097
?_067:  mov     eax, dword [ebp-24H]                    ; 10B3 _ 8B. 45, DC
        mov     ebx, dword [eax+9CH]                    ; 10B6 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-24H]                    ; 10BC _ 8B. 45, DC
        mov     ecx, dword [eax+98H]                    ; 10BF _ 8B. 88, 00000098
        mov     eax, dword [ebp-24H]                    ; 10C5 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 10C8 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 10CE _ A1, 00000284(d)
        sub     esp, 8                                  ; 10D3 _ 83. EC, 08
        push    ?_425                                   ; 10D6 _ 68, 00000017(d)
        push    7                                       ; 10DB _ 6A, 07
        push    ebx                                     ; 10DD _ 53
        push    ecx                                     ; 10DE _ 51
        push    edx                                     ; 10DF _ 52
        push    eax                                     ; 10E0 _ 50
        call    showString                              ; 10E1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10E6 _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 10E9 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 10EC _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 10F2 _ 8D. 50, 08
        mov     eax, dword [ebp-24H]                    ; 10F5 _ 8B. 45, DC
        mov     dword [eax+98H], edx                    ; 10F8 _ 89. 90, 00000098
        mov     eax, dword [ebp-24H]                    ; 10FE _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 1101 _ 8B. 80, 00000098
        cmp     eax, 248                                ; 1107 _ 3D, 000000F8
        jnz     ?_068                                   ; 110C _ 75, 37
        mov     eax, dword [ebp-24H]                    ; 110E _ 8B. 45, DC
        mov     dword [eax+98H], 8                      ; 1111 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-24H]                    ; 111B _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 111E _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 1124 _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 1127 _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 112D _ 83. EC, 08
        push    edx                                     ; 1130 _ 52
        push    eax                                     ; 1131 _ 50
        call    cons_newline                            ; 1132 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1137 _ 83. C4, 10
        mov     edx, eax                                ; 113A _ 89. C2
        mov     eax, dword [ebp-24H]                    ; 113C _ 8B. 45, DC
        mov     dword [eax+9CH], edx                    ; 113F _ 89. 90, 0000009C
?_068:  jmp     ?_067                                   ; 1145 _ E9, FFFFFF69

?_069:  movzx   eax, byte [ebp-3FH]                     ; 114A _ 0F B6. 45, C1
        cmp     al, 10                                  ; 114E _ 3C, 0A
        jnz     ?_070                                   ; 1150 _ 75, 3C
        mov     eax, dword [ebp-24H]                    ; 1152 _ 8B. 45, DC
        mov     dword [eax+98H], 8                      ; 1155 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-24H]                    ; 115F _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1162 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 1168 _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 116B _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 1171 _ 83. EC, 08
        push    edx                                     ; 1174 _ 52
        push    eax                                     ; 1175 _ 50
        call    cons_newline                            ; 1176 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 117B _ 83. C4, 10
        mov     edx, eax                                ; 117E _ 89. C2
        mov     eax, dword [ebp-24H]                    ; 1180 _ 8B. 45, DC
        mov     dword [eax+9CH], edx                    ; 1183 _ 89. 90, 0000009C
        jmp     ?_071                                   ; 1189 _ E9, 0000009D

?_070:  movzx   eax, byte [ebp-3FH]                     ; 118E _ 0F B6. 45, C1
        cmp     al, 13                                  ; 1192 _ 3C, 0D
        je      ?_071                                   ; 1194 _ 0F 84, 00000091
        mov     eax, dword [ebp-24H]                    ; 119A _ 8B. 45, DC
        mov     ebx, dword [eax+9CH]                    ; 119D _ 8B. 98, 0000009C
        mov     eax, dword [ebp-24H]                    ; 11A3 _ 8B. 45, DC
        mov     ecx, dword [eax+98H]                    ; 11A6 _ 8B. 88, 00000098
        mov     eax, dword [ebp-24H]                    ; 11AC _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 11AF _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 11B5 _ A1, 00000284(d)
        sub     esp, 8                                  ; 11BA _ 83. EC, 08
        lea     esi, [ebp-3FH]                          ; 11BD _ 8D. 75, C1
        push    esi                                     ; 11C0 _ 56
        push    7                                       ; 11C1 _ 6A, 07
        push    ebx                                     ; 11C3 _ 53
        push    ecx                                     ; 11C4 _ 51
        push    edx                                     ; 11C5 _ 52
        push    eax                                     ; 11C6 _ 50
        call    showString                              ; 11C7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 11CC _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 11CF _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 11D2 _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 11D8 _ 8D. 50, 08
        mov     eax, dword [ebp-24H]                    ; 11DB _ 8B. 45, DC
        mov     dword [eax+98H], edx                    ; 11DE _ 89. 90, 00000098
        mov     eax, dword [ebp-24H]                    ; 11E4 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 11E7 _ 8B. 80, 00000098
        cmp     eax, 248                                ; 11ED _ 3D, 000000F8
        jnz     ?_071                                   ; 11F2 _ 75, 37
        mov     eax, dword [ebp-24H]                    ; 11F4 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 11F7 _ C7. 80, 00000098, 00000010
        mov     eax, dword [ebp-24H]                    ; 1201 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1204 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 120A _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 120D _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 1213 _ 83. EC, 08
        push    edx                                     ; 1216 _ 52
        push    eax                                     ; 1217 _ 50
        call    cons_newline                            ; 1218 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 121D _ 83. C4, 10
        mov     edx, eax                                ; 1220 _ 89. C2
        mov     eax, dword [ebp-24H]                    ; 1222 _ 8B. 45, DC
        mov     dword [eax+9CH], edx                    ; 1225 _ 89. 90, 0000009C
?_071:  add     dword [ebp-20H], 1                      ; 122B _ 83. 45, E0, 01
?_072:  mov     eax, dword [ebp-20H]                    ; 122F _ 8B. 45, E0
        cmp     eax, dword [ebp-30H]                    ; 1232 _ 3B. 45, D0
        jl      ?_066                                   ; 1235 _ 0F 8C, FFFFFE5A
        nop                                             ; 123B _ 90
        jmp     ?_075                                   ; 123C _ EB, 12

?_073:  add     dword [ebp-14H], 32                     ; 123E _ 83. 45, EC, 20
?_074:  mov     eax, dword [ebp-14H]                    ; 1242 _ 8B. 45, EC
        movzx   eax, byte [eax]                         ; 1245 _ 0F B6. 00
        test    al, al                                  ; 1248 _ 84. C0
        jne     ?_058                                   ; 124A _ 0F 85, FFFFFD64
?_075:  mov     eax, dword [ebp-24H]                    ; 1250 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1253 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 1259 _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 125C _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 1262 _ 83. EC, 08
        push    edx                                     ; 1265 _ 52
        push    eax                                     ; 1266 _ 50
        call    cons_newline                            ; 1267 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 126C _ 83. C4, 10
        mov     edx, eax                                ; 126F _ 89. C2
        mov     eax, dword [ebp-24H]                    ; 1271 _ 8B. 45, DC
        mov     dword [eax+9CH], edx                    ; 1274 _ 89. 90, 0000009C
        mov     edx, dword [ebp-28H]                    ; 127A _ 8B. 55, D8
        mov     eax, dword [memman]                     ; 127D _ A1, 00000000(d)
        sub     esp, 4                                  ; 1282 _ 83. EC, 04
        push    13                                      ; 1285 _ 6A, 0D
        push    edx                                     ; 1287 _ 52
        push    eax                                     ; 1288 _ 50
        call    memman_free                             ; 1289 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 128E _ 83. C4, 10
        mov     eax, dword [ebp-24H]                    ; 1291 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 1294 _ C7. 80, 00000098, 00000010
?_076:  lea     esp, [ebp-8H]                           ; 129E _ 8D. 65, F8
        pop     ebx                                     ; 12A1 _ 5B
        pop     esi                                     ; 12A2 _ 5E
        pop     ebp                                     ; 12A3 _ 5D
        ret                                             ; 12A4 _ C3
; cmd_type End of function

cmd_mem:; Function begin
        push    ebp                                     ; 12A5 _ 55
        mov     ebp, esp                                ; 12A6 _ 89. E5
        sub     esp, 24                                 ; 12A8 _ 83. EC, 18
        call    task_now                                ; 12AB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 12B0 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 12B3 _ 8B. 45, F4
        mov     eax, dword [eax+94H]                    ; 12B6 _ 8B. 80, 00000094
        test    eax, eax                                ; 12BC _ 85. C0
        jnz     ?_077                                   ; 12BE _ 75, 05
        jmp     ?_078                                   ; 12C0 _ E9, 000000D2

?_077:  mov     eax, dword [ebp+8H]                     ; 12C5 _ 8B. 45, 08
        lea     edx, [eax+3FFH]                         ; 12C8 _ 8D. 90, 000003FF
        test    eax, eax                                ; 12CE _ 85. C0
        cmovs   eax, edx                                ; 12D0 _ 0F 48. C2
        sar     eax, 10                                 ; 12D3 _ C1. F8, 0A
        sub     esp, 12                                 ; 12D6 _ 83. EC, 0C
        push    eax                                     ; 12D9 _ 50
        call    intToHexStr                             ; 12DA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12DF _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 12E2 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 12E5 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 12E8 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 12EE _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 12F1 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 12F7 _ A1, 00000284(d)
        sub     esp, 8                                  ; 12FC _ 83. EC, 08
        push    ?_426                                   ; 12FF _ 68, 00000019(d)
        push    7                                       ; 1304 _ 6A, 07
        push    ecx                                     ; 1306 _ 51
        push    16                                      ; 1307 _ 6A, 10
        push    edx                                     ; 1309 _ 52
        push    eax                                     ; 130A _ 50
        call    showString                              ; 130B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1310 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 1313 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 1316 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 131C _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 131F _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1325 _ A1, 00000284(d)
        sub     esp, 8                                  ; 132A _ 83. EC, 08
        push    dword [ebp-10H]                         ; 132D _ FF. 75, F0
        push    7                                       ; 1330 _ 6A, 07
        push    ecx                                     ; 1332 _ 51
        push    52                                      ; 1333 _ 6A, 34
        push    edx                                     ; 1335 _ 52
        push    eax                                     ; 1336 _ 50
        call    showString                              ; 1337 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 133C _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 133F _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 1342 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 1348 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 134B _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1351 _ A1, 00000284(d)
        sub     esp, 8                                  ; 1356 _ 83. EC, 08
        push    ?_427                                   ; 1359 _ 68, 0000001F(d)
        push    7                                       ; 135E _ 6A, 07
        push    ecx                                     ; 1360 _ 51
        push    126                                     ; 1361 _ 6A, 7E
        push    edx                                     ; 1363 _ 52
        push    eax                                     ; 1364 _ 50
        call    showString                              ; 1365 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 136A _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 136D _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 1370 _ 8B. 90, 00000094
        mov     eax, dword [ebp-0CH]                    ; 1376 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 1379 _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 137F _ 83. EC, 08
        push    edx                                     ; 1382 _ 52
        push    eax                                     ; 1383 _ 50
        call    cons_newline                            ; 1384 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1389 _ 83. C4, 10
        mov     edx, eax                                ; 138C _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 138E _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 1391 _ 89. 90, 0000009C
?_078:  leave                                           ; 1397 _ C9
        ret                                             ; 1398 _ C3
; cmd_mem End of function

cmd_cls:; Function begin
        push    ebp                                     ; 1399 _ 55
        mov     ebp, esp                                ; 139A _ 89. E5
        sub     esp, 24                                 ; 139C _ 83. EC, 18
        call    task_now                                ; 139F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 13A4 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 13A7 _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 13AA _ 8B. 80, 00000094
        test    eax, eax                                ; 13B0 _ 85. C0
        jnz     ?_079                                   ; 13B2 _ 75, 05
        jmp     ?_084                                   ; 13B4 _ E9, 000000BD

?_079:  mov     dword [ebp-0CH], 8                      ; 13B9 _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 28                     ; 13C0 _ C7. 45, F0, 0000001C
        mov     dword [ebp-10H], 28                     ; 13C7 _ C7. 45, F0, 0000001C
        jmp     ?_083                                   ; 13CE _ EB, 41

?_080:  mov     dword [ebp-0CH], 8                      ; 13D0 _ C7. 45, F4, 00000008
        jmp     ?_082                                   ; 13D7 _ EB, 2B

?_081:  mov     eax, dword [ebp-14H]                    ; 13D9 _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 13DC _ 8B. 80, 00000094
        mov     edx, dword [eax]                        ; 13E2 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 13E4 _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 13E7 _ 8B. 80, 00000094
        mov     eax, dword [eax+4H]                     ; 13ED _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 13F0 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 13F4 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 13F6 _ 8B. 45, F4
        add     eax, ecx                                ; 13F9 _ 01. C8
        add     eax, edx                                ; 13FB _ 01. D0
        mov     byte [eax], 0                           ; 13FD _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 1400 _ 83. 45, F4, 01
?_082:  cmp     dword [ebp-0CH], 247                    ; 1404 _ 81. 7D, F4, 000000F7
        jle     ?_081                                   ; 140B _ 7E, CC
        add     dword [ebp-10H], 1                      ; 140D _ 83. 45, F0, 01
?_083:  cmp     dword [ebp-10H], 155                    ; 1411 _ 81. 7D, F0, 0000009B
        jle     ?_080                                   ; 1418 _ 7E, B6
        mov     eax, dword [ebp-14H]                    ; 141A _ 8B. 45, EC
        mov     edx, dword [eax+94H]                    ; 141D _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1423 _ A1, 00000284(d)
        sub     esp, 8                                  ; 1428 _ 83. EC, 08
        push    156                                     ; 142B _ 68, 0000009C
        push    248                                     ; 1430 _ 68, 000000F8
        push    28                                      ; 1435 _ 6A, 1C
        push    8                                       ; 1437 _ 6A, 08
        push    edx                                     ; 1439 _ 52
        push    eax                                     ; 143A _ 50
        call    sheet_refresh                           ; 143B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1440 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 1443 _ 8B. 45, EC
        mov     dword [eax+9CH], 28                     ; 1446 _ C7. 80, 0000009C, 0000001C
        mov     eax, dword [ebp-14H]                    ; 1450 _ 8B. 45, EC
        mov     edx, dword [eax+94H]                    ; 1453 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1459 _ A1, 00000284(d)
        sub     esp, 8                                  ; 145E _ 83. EC, 08
        push    ?_428                                   ; 1461 _ 68, 00000023(d)
        push    7                                       ; 1466 _ 6A, 07
        push    28                                      ; 1468 _ 6A, 1C
        push    8                                       ; 146A _ 6A, 08
        push    edx                                     ; 146C _ 52
        push    eax                                     ; 146D _ 50
        call    showString                              ; 146E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1473 _ 83. C4, 20
?_084:  leave                                           ; 1476 _ C9
        ret                                             ; 1477 _ C3
; cmd_cls End of function

cmd_execute_program:; Function begin
        push    ebp                                     ; 1478 _ 55
        mov     ebp, esp                                ; 1479 _ 89. E5
        push    ebx                                     ; 147B _ 53
        sub     esp, 36                                 ; 147C _ 83. EC, 24
        call    io_cli                                  ; 147F _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 1484 _ A1, 00000000(d)
        sub     esp, 8                                  ; 1489 _ 83. EC, 08
        push    16                                      ; 148C _ 6A, 10
        push    eax                                     ; 148E _ 50
        call    memman_alloc                            ; 148F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1494 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 1497 _ 89. 45, F0
        call    task_now                                ; 149A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 149F _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 14A2 _ 8B. 45, EC
        mov     edx, dword [ebp-10H]                    ; 14A5 _ 8B. 55, F0
        mov     dword [eax+0B0H], edx                   ; 14A8 _ 89. 90, 000000B0
        sub     esp, 8                                  ; 14AE _ 83. EC, 08
        push    dword [ebp-10H]                         ; 14B1 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 14B4 _ FF. 75, 08
        call    file_loadfile                           ; 14B7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14BC _ 83. C4, 10
        call    get_addr_gdt                            ; 14BF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 14C4 _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 14C7 _ 8B. 45, EC
        mov     edx, dword [eax]                        ; 14CA _ 8B. 10
        mov     eax, dword [first_task_cons_selector]   ; 14CC _ A1, 00000000(d)
        sub     edx, eax                                ; 14D1 _ 29. C2
        mov     eax, edx                                ; 14D3 _ 89. D0
        lea     edx, [eax+7H]                           ; 14D5 _ 8D. 50, 07
        test    eax, eax                                ; 14D8 _ 85. C0
        cmovs   eax, edx                                ; 14DA _ 0F 48. C2
        sar     eax, 3                                  ; 14DD _ C1. F8, 03
        add     eax, 21                                 ; 14E0 _ 83. C0, 15
        mov     dword [ebp-1CH], eax                    ; 14E3 _ 89. 45, E4
        mov     eax, dword [ebp-14H]                    ; 14E6 _ 8B. 45, EC
        mov     edx, dword [eax]                        ; 14E9 _ 8B. 10
        mov     eax, dword [first_task_cons_selector]   ; 14EB _ A1, 00000000(d)
        sub     edx, eax                                ; 14F0 _ 29. C2
        mov     eax, edx                                ; 14F2 _ 89. D0
        lea     edx, [eax+7H]                           ; 14F4 _ 8D. 50, 07
        test    eax, eax                                ; 14F7 _ 85. C0
        cmovs   eax, edx                                ; 14F9 _ 0F 48. C2
        sar     eax, 3                                  ; 14FC _ C1. F8, 03
        add     eax, 30                                 ; 14FF _ 83. C0, 1E
        mov     dword [ebp-20H], eax                    ; 1502 _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 1505 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 1508 _ 8B. 00
        mov     edx, eax                                ; 150A _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 150C _ 8B. 45, EC
        add     eax, 188                                ; 150F _ 05, 000000BC
        push    16634                                   ; 1514 _ 68, 000040FA
        push    edx                                     ; 1519 _ 52
        push    1048575                                 ; 151A _ 68, 000FFFFF
        push    eax                                     ; 151F _ 50
        call    set_segmdesc                            ; 1520 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1525 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 1528 _ A1, 00000000(d)
        sub     esp, 8                                  ; 152D _ 83. EC, 08
        push    65536                                   ; 1530 _ 68, 00010000
        push    eax                                     ; 1535 _ 50
        call    memman_alloc_4k                         ; 1536 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 153B _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 153E _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 1541 _ 8B. 45, F0
        mov     edx, dword [ebp-24H]                    ; 1544 _ 8B. 55, DC
        mov     dword [eax+4H], edx                     ; 1547 _ 89. 50, 04
        mov     eax, dword [ebp-24H]                    ; 154A _ 8B. 45, DC
        mov     edx, dword [ebp-14H]                    ; 154D _ 8B. 55, EC
        add     edx, 196                                ; 1550 _ 81. C2, 000000C4
        push    16626                                   ; 1556 _ 68, 000040F2
        push    eax                                     ; 155B _ 50
        push    77055                                   ; 155C _ 68, 00012CFF
        push    edx                                     ; 1561 _ 52
        call    set_segmdesc                            ; 1562 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1567 _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 156A _ 8B. 45, EC
        mov     dword [eax+30H], 0                      ; 156D _ C7. 40, 30, 00000000
        call    io_sti                                  ; 1574 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 1579 _ 8B. 45, EC
        add     eax, 48                                 ; 157C _ 83. C0, 30
        sub     esp, 12                                 ; 157F _ 83. EC, 0C
        push    eax                                     ; 1582 _ 50
        push    12                                      ; 1583 _ 6A, 0C
        push    65536                                   ; 1585 _ 68, 00010000
        push    4                                       ; 158A _ 6A, 04
        push    0                                       ; 158C _ 6A, 00
        call    start_app                               ; 158E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1593 _ 83. C4, 20
        call    io_cli                                  ; 1596 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 159B _ C7. 45, F4, 00000000
        mov     dword [ebp-0CH], 0                      ; 15A2 _ C7. 45, F4, 00000000
        jmp     ?_087                                   ; 15A9 _ E9, 00000088

?_085:  mov     eax, dword [ebp-14H]                    ; 15AE _ 8B. 45, EC
        mov     ecx, dword [eax+0CCH]                   ; 15B1 _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 15B7 _ 8B. 55, F4
        mov     eax, edx                                ; 15BA _ 89. D0
        add     eax, eax                                ; 15BC _ 01. C0
        add     eax, edx                                ; 15BE _ 01. D0
        shl     eax, 2                                  ; 15C0 _ C1. E0, 02
        add     eax, ecx                                ; 15C3 _ 01. C8
        mov     eax, dword [eax]                        ; 15C5 _ 8B. 00
        test    eax, eax                                ; 15C7 _ 85. C0
        jz      ?_086                                   ; 15C9 _ 74, 67
        mov     eax, dword [ebp-14H]                    ; 15CB _ 8B. 45, EC
        mov     ecx, dword [eax+0CCH]                   ; 15CE _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 15D4 _ 8B. 55, F4
        mov     eax, edx                                ; 15D7 _ 89. D0
        add     eax, eax                                ; 15D9 _ 01. C0
        add     eax, edx                                ; 15DB _ 01. D0
        shl     eax, 2                                  ; 15DD _ C1. E0, 02
        add     eax, ecx                                ; 15E0 _ 01. C8
        mov     eax, dword [eax+4H]                     ; 15E2 _ 8B. 40, 04
        mov     ebx, eax                                ; 15E5 _ 89. C3
        mov     eax, dword [ebp-14H]                    ; 15E7 _ 8B. 45, EC
        mov     ecx, dword [eax+0CCH]                   ; 15EA _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 15F0 _ 8B. 55, F4
        mov     eax, edx                                ; 15F3 _ 89. D0
        add     eax, eax                                ; 15F5 _ 01. C0
        add     eax, edx                                ; 15F7 _ 01. D0
        shl     eax, 2                                  ; 15F9 _ C1. E0, 02
        add     eax, ecx                                ; 15FC _ 01. C8
        mov     eax, dword [eax]                        ; 15FE _ 8B. 00
        mov     edx, eax                                ; 1600 _ 89. C2
        mov     eax, dword [memman]                     ; 1602 _ A1, 00000000(d)
        sub     esp, 4                                  ; 1607 _ 83. EC, 04
        push    ebx                                     ; 160A _ 53
        push    edx                                     ; 160B _ 52
        push    eax                                     ; 160C _ 50
        call    memman_free_4k                          ; 160D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1612 _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 1615 _ 8B. 45, EC
        mov     ecx, dword [eax+0CCH]                   ; 1618 _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 161E _ 8B. 55, F4
        mov     eax, edx                                ; 1621 _ 89. D0
        add     eax, eax                                ; 1623 _ 01. C0
        add     eax, edx                                ; 1625 _ 01. D0
        shl     eax, 2                                  ; 1627 _ C1. E0, 02
        add     eax, ecx                                ; 162A _ 01. C8
        mov     dword [eax], 0                          ; 162C _ C7. 00, 00000000
?_086:  add     dword [ebp-0CH], 1                      ; 1632 _ 83. 45, F4, 01
?_087:  cmp     dword [ebp-0CH], 7                      ; 1636 _ 83. 7D, F4, 07
        jle     ?_085                                   ; 163A _ 0F 8E, FFFFFF6E
        mov     eax, dword [ebp-10H]                    ; 1640 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 1643 _ 8B. 40, 08
        mov     ecx, eax                                ; 1646 _ 89. C1
        mov     eax, dword [ebp-10H]                    ; 1648 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 164B _ 8B. 00
        mov     edx, eax                                ; 164D _ 89. C2
        mov     eax, dword [memman]                     ; 164F _ A1, 00000000(d)
        sub     esp, 4                                  ; 1654 _ 83. EC, 04
        push    ecx                                     ; 1657 _ 51
        push    edx                                     ; 1658 _ 52
        push    eax                                     ; 1659 _ 50
        call    memman_free_4k                          ; 165A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 165F _ 83. C4, 10
        mov     edx, dword [ebp-24H]                    ; 1662 _ 8B. 55, DC
        mov     eax, dword [memman]                     ; 1665 _ A1, 00000000(d)
        sub     esp, 4                                  ; 166A _ 83. EC, 04
        push    65536                                   ; 166D _ 68, 00010000
        push    edx                                     ; 1672 _ 52
        push    eax                                     ; 1673 _ 50
        call    memman_free_4k                          ; 1674 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1679 _ 83. C4, 10
        mov     edx, dword [ebp-10H]                    ; 167C _ 8B. 55, F0
        mov     eax, dword [memman]                     ; 167F _ A1, 00000000(d)
        sub     esp, 4                                  ; 1684 _ 83. EC, 04
        push    16                                      ; 1687 _ 6A, 10
        push    edx                                     ; 1689 _ 52
        push    eax                                     ; 168A _ 50
        call    memman_free                             ; 168B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1690 _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 1693 _ 8B. 45, EC
        mov     dword [eax+0B0H], 0                     ; 1696 _ C7. 80, 000000B0, 00000000
        call    io_sti                                  ; 16A0 _ E8, FFFFFFFC(rel)
        mov     ebx, dword [ebp-4H]                     ; 16A5 _ 8B. 5D, FC
        leave                                           ; 16A8 _ C9
        ret                                             ; 16A9 _ C3
; cmd_execute_program End of function

cmd_start:; Function begin
        push    ebp                                     ; 16AA _ 55
        mov     ebp, esp                                ; 16AB _ 89. E5
        sub     esp, 24                                 ; 16AD _ 83. EC, 18
        mov     eax, dword [console_count]              ; 16B0 _ A1, 00000000(d)
        sub     esp, 12                                 ; 16B5 _ 83. EC, 0C
        push    eax                                     ; 16B8 _ 50
        call    launch_console                          ; 16B9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16BE _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 16C1 _ 89. 45, F0
        mov     eax, dword [shtctl]                     ; 16C4 _ A1, 00000284(d)
        push    176                                     ; 16C9 _ 68, 000000B0
        push    156                                     ; 16CE _ 68, 0000009C
        push    dword [ebp-10H]                         ; 16D3 _ FF. 75, F0
        push    eax                                     ; 16D6 _ 50
        call    sheet_slide                             ; 16D7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16DC _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 16DF _ A1, 00000284(d)
        sub     esp, 4                                  ; 16E4 _ 83. EC, 04
        push    1                                       ; 16E7 _ 6A, 01
        push    dword [ebp-10H]                         ; 16E9 _ FF. 75, F0
        push    eax                                     ; 16EC _ 50
        call    sheet_updown                            ; 16ED _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16F2 _ 83. C4, 10
        mov     eax, dword [console_count]              ; 16F5 _ A1, 00000000(d)
        add     eax, 1                                  ; 16FA _ 83. C0, 01
        mov     dword [console_count], eax              ; 16FD _ A3, 00000000(d)
        mov     eax, dword [ebp-10H]                    ; 1702 _ 8B. 45, F0
        mov     eax, dword [eax+20H]                    ; 1705 _ 8B. 40, 20
        mov     dword [ebp-14H], eax                    ; 1708 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 170B _ 8B. 45, EC
        mov     dword [eax+28H], 0                      ; 170E _ C7. 40, 28, 00000000
        mov     dword [ebp-0CH], 6                      ; 1715 _ C7. 45, F4, 00000006
        jmp     ?_089                                   ; 171C _ EB, 25

?_088:  mov     edx, dword [ebp-0CH]                    ; 171E _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 1721 _ 8B. 45, 08
        add     eax, edx                                ; 1724 _ 01. D0
        movzx   eax, byte [eax]                         ; 1726 _ 0F B6. 00
        movzx   eax, al                                 ; 1729 _ 0F B6. C0
        mov     edx, dword [ebp-14H]                    ; 172C _ 8B. 55, EC
        add     edx, 16                                 ; 172F _ 83. C2, 10
        sub     esp, 8                                  ; 1732 _ 83. EC, 08
        push    eax                                     ; 1735 _ 50
        push    edx                                     ; 1736 _ 52
        call    fifo8_put                               ; 1737 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 173C _ 83. C4, 10
        add     dword [ebp-0CH], 1                      ; 173F _ 83. 45, F4, 01
?_089:  mov     edx, dword [ebp-0CH]                    ; 1743 _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 1746 _ 8B. 45, 08
        add     eax, edx                                ; 1749 _ 01. D0
        movzx   eax, byte [eax]                         ; 174B _ 0F B6. 00
        test    al, al                                  ; 174E _ 84. C0
        jnz     ?_088                                   ; 1750 _ 75, CC
        mov     eax, dword [ebp-14H]                    ; 1752 _ 8B. 45, EC
        mov     edx, dword [ebp-14H]                    ; 1755 _ 8B. 55, EC
        mov     dword [eax+28H], edx                    ; 1758 _ 89. 50, 28
        mov     eax, dword [ebp-14H]                    ; 175B _ 8B. 45, EC
        add     eax, 16                                 ; 175E _ 83. C0, 10
        sub     esp, 8                                  ; 1761 _ 83. EC, 08
        push    28                                      ; 1764 _ 6A, 1C
        push    eax                                     ; 1766 _ 50
        call    fifo8_put                               ; 1767 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 176C _ 83. C4, 10
        leave                                           ; 176F _ C9
        ret                                             ; 1770 _ C3
; cmd_start End of function

cmd_ncst:; Function begin
        push    ebp                                     ; 1771 _ 55
        mov     ebp, esp                                ; 1772 _ 89. E5
        sub     esp, 24                                 ; 1774 _ 83. EC, 18
        mov     eax, dword [console_count]              ; 1777 _ A1, 00000000(d)
        sub     esp, 12                                 ; 177C _ 83. EC, 0C
        push    eax                                     ; 177F _ 50
        call    launch_console                          ; 1780 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1785 _ 83. C4, 10
        mov     eax, dword [console_count]              ; 1788 _ A1, 00000000(d)
        add     eax, 1                                  ; 178D _ 83. C0, 01
        mov     dword [console_count], eax              ; 1790 _ A3, 00000000(d)
        mov     eax, dword [current_console_task]       ; 1795 _ A1, 00000298(d)
        mov     dword [ebp-10H], eax                    ; 179A _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 179D _ 8B. 45, F0
        mov     dword [eax+28H], 0                      ; 17A0 _ C7. 40, 28, 00000000
        mov     dword [ebp-0CH], 5                      ; 17A7 _ C7. 45, F4, 00000005
        mov     dword [ebp-14H], 0                      ; 17AE _ C7. 45, EC, 00000000
        jmp     ?_091                                   ; 17B5 _ EB, 25

?_090:  mov     edx, dword [ebp-0CH]                    ; 17B7 _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 17BA _ 8B. 45, 08
        add     eax, edx                                ; 17BD _ 01. D0
        movzx   eax, byte [eax]                         ; 17BF _ 0F B6. 00
        movzx   eax, al                                 ; 17C2 _ 0F B6. C0
        mov     edx, dword [ebp-10H]                    ; 17C5 _ 8B. 55, F0
        add     edx, 16                                 ; 17C8 _ 83. C2, 10
        sub     esp, 8                                  ; 17CB _ 83. EC, 08
        push    eax                                     ; 17CE _ 50
        push    edx                                     ; 17CF _ 52
        call    fifo8_put                               ; 17D0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17D5 _ 83. C4, 10
        add     dword [ebp-0CH], 1                      ; 17D8 _ 83. 45, F4, 01
?_091:  mov     edx, dword [ebp-0CH]                    ; 17DC _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 17DF _ 8B. 45, 08
        add     eax, edx                                ; 17E2 _ 01. D0
        movzx   eax, byte [eax]                         ; 17E4 _ 0F B6. 00
        test    al, al                                  ; 17E7 _ 84. C0
        jnz     ?_090                                   ; 17E9 _ 75, CC
        mov     eax, dword [ebp-10H]                    ; 17EB _ 8B. 45, F0
        mov     edx, dword [ebp-10H]                    ; 17EE _ 8B. 55, F0
        mov     dword [eax+28H], edx                    ; 17F1 _ 89. 50, 28
        mov     eax, dword [ebp-10H]                    ; 17F4 _ 8B. 45, F0
        add     eax, 16                                 ; 17F7 _ 83. C0, 10
        sub     esp, 8                                  ; 17FA _ 83. EC, 08
        push    28                                      ; 17FD _ 6A, 1C
        push    eax                                     ; 17FF _ 50
        call    fifo8_put                               ; 1800 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1805 _ 83. C4, 10
        leave                                           ; 1808 _ C9
        ret                                             ; 1809 _ C3
; cmd_ncst End of function

console_task:; Function begin
        push    ebp                                     ; 180A _ 55
        mov     ebp, esp                                ; 180B _ 89. E5
        push    ebx                                     ; 180D _ 53
        sub     esp, 84                                 ; 180E _ 83. EC, 54
        call    task_now                                ; 1811 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1816 _ 89. 45, F0
        mov     dword [ebp-0CH], 0                      ; 1819 _ C7. 45, F4, 00000000
        mov     dword [ebp-14H], 0                      ; 1820 _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 1827 _ C7. 45, E8, 00000000
        mov     eax, dword [memman]                     ; 182E _ A1, 00000000(d)
        sub     esp, 8                                  ; 1833 _ 83. EC, 08
        push    30                                      ; 1836 _ 6A, 1E
        push    eax                                     ; 1838 _ 50
        call    memman_alloc                            ; 1839 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 183E _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 1841 _ 89. 45, E4
        mov     dword [ebp-20H], 96                     ; 1844 _ C7. 45, E0, 00000060
        mov     dword [ebp-24H], 176                    ; 184B _ C7. 45, DC, 000000B0
        mov     eax, dword [ebp-10H]                    ; 1852 _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 1855 _ 8B. 55, 08
        mov     dword [eax+94H], edx                    ; 1858 _ 89. 90, 00000094
        mov     eax, dword [ebp-10H]                    ; 185E _ 8B. 45, F0
        mov     dword [eax+98H], 16                     ; 1861 _ C7. 80, 00000098, 00000010
        mov     eax, dword [ebp-10H]                    ; 186B _ 8B. 45, F0
        mov     dword [eax+9CH], 28                     ; 186E _ C7. 80, 0000009C, 0000001C
        mov     eax, dword [ebp-10H]                    ; 1878 _ 8B. 45, F0
        mov     dword [eax+0A0H], -1                    ; 187B _ C7. 80, 000000A0, FFFFFFFF
        call    timer_alloc                             ; 1885 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 188A _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 188D _ 8B. 45, F0
        add     eax, 16                                 ; 1890 _ 83. C0, 10
        sub     esp, 4                                  ; 1893 _ 83. EC, 04
        push    1                                       ; 1896 _ 6A, 01
        push    eax                                     ; 1898 _ 50
        push    dword [ebp-28H]                         ; 1899 _ FF. 75, D8
        call    timer_init                              ; 189C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18A1 _ 83. C4, 10
        sub     esp, 8                                  ; 18A4 _ 83. EC, 08
        push    50                                      ; 18A7 _ 6A, 32
        push    dword [ebp-28H]                         ; 18A9 _ FF. 75, D8
        call    timer_settime                           ; 18AC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18B1 _ 83. C4, 10
        mov     eax, dword [ebp-10H]                    ; 18B4 _ 8B. 45, F0
        mov     edx, dword [ebp-28H]                    ; 18B7 _ 8B. 55, D8
        mov     dword [eax+0A8H], edx                   ; 18BA _ 89. 90, 000000A8
        mov     eax, dword [ebp-10H]                    ; 18C0 _ 8B. 45, F0
        mov     edx, dword [ebp-1CH]                    ; 18C3 _ 8B. 55, E4
        mov     dword [eax+0ACH], edx                   ; 18C6 _ 89. 90, 000000AC
        mov     eax, dword [shtctl]                     ; 18CC _ A1, 00000284(d)
        sub     esp, 8                                  ; 18D1 _ 83. EC, 08
        push    ?_428                                   ; 18D4 _ 68, 00000023(d)
        push    7                                       ; 18D9 _ 6A, 07
        push    28                                      ; 18DB _ 6A, 1C
        push    8                                       ; 18DD _ 6A, 08
        push    dword [ebp+8H]                          ; 18DF _ FF. 75, 08
        push    eax                                     ; 18E2 _ 50
        call    showString                              ; 18E3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 18E8 _ 83. C4, 20
        mov     dword [ebp-2CH], 88064                  ; 18EB _ C7. 45, D4, 00015800
        mov     dword [ebp-30H], 0                      ; 18F2 _ C7. 45, D0, 00000000
?_092:  call    io_cli                                  ; 18F9 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 18FE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1903 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 1906 _ 8B. 45, F0
        add     eax, 16                                 ; 1909 _ 83. C0, 10
        sub     esp, 12                                 ; 190C _ 83. EC, 0C
        push    eax                                     ; 190F _ 50
        call    fifo8_status                            ; 1910 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1915 _ 83. C4, 10
        test    eax, eax                                ; 1918 _ 85. C0
        jnz     ?_093                                   ; 191A _ 75, 0A
        call    io_sti                                  ; 191C _ E8, FFFFFFFC(rel)
        jmp     ?_111                                   ; 1921 _ E9, 000004BB

?_093:  mov     eax, dword [ebp-10H]                    ; 1926 _ 8B. 45, F0
        add     eax, 16                                 ; 1929 _ 83. C0, 10
        sub     esp, 12                                 ; 192C _ 83. EC, 0C
        push    eax                                     ; 192F _ 50
        call    fifo8_get                               ; 1930 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1935 _ 83. C4, 10
        mov     dword [ebp-34H], eax                    ; 1938 _ 89. 45, CC
        cmp     dword [ebp-34H], 1                      ; 193B _ 83. 7D, CC, 01
        jg      ?_096                                   ; 193F _ 7F, 5F
        cmp     dword [ebp-0CH], 0                      ; 1941 _ 83. 7D, F4, 00
        js      ?_096                                   ; 1945 _ 78, 59
        cmp     dword [ebp-34H], 0                      ; 1947 _ 83. 7D, CC, 00
        jz      ?_094                                   ; 194B _ 74, 20
        mov     eax, dword [ebp-10H]                    ; 194D _ 8B. 45, F0
        add     eax, 16                                 ; 1950 _ 83. C0, 10
        sub     esp, 4                                  ; 1953 _ 83. EC, 04
        push    0                                       ; 1956 _ 6A, 00
        push    eax                                     ; 1958 _ 50
        push    dword [ebp-28H]                         ; 1959 _ FF. 75, D8
        call    timer_init                              ; 195C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1961 _ 83. C4, 10
        mov     dword [ebp-0CH], 7                      ; 1964 _ C7. 45, F4, 00000007
        jmp     ?_095                                   ; 196B _ EB, 1E

?_094:  mov     eax, dword [ebp-10H]                    ; 196D _ 8B. 45, F0
        add     eax, 16                                 ; 1970 _ 83. C0, 10
        sub     esp, 4                                  ; 1973 _ 83. EC, 04
        push    1                                       ; 1976 _ 6A, 01
        push    eax                                     ; 1978 _ 50
        push    dword [ebp-28H]                         ; 1979 _ FF. 75, D8
        call    timer_init                              ; 197C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1981 _ 83. C4, 10
        mov     dword [ebp-0CH], 0                      ; 1984 _ C7. 45, F4, 00000000
?_095:  sub     esp, 8                                  ; 198B _ 83. EC, 08
        push    50                                      ; 198E _ 6A, 32
        push    dword [ebp-28H]                         ; 1990 _ FF. 75, D8
        call    timer_settime                           ; 1993 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1998 _ 83. C4, 10
        jmp     ?_110                                   ; 199B _ E9, 000003FC

?_096:  cmp     dword [ebp-34H], 87                     ; 19A0 _ 83. 7D, CC, 57
        jnz     ?_097                                   ; 19A4 _ 75, 33
        mov     dword [ebp-0CH], 7                      ; 19A6 _ C7. 45, F4, 00000007
        mov     eax, dword [ebp-10H]                    ; 19AD _ 8B. 45, F0
        add     eax, 16                                 ; 19B0 _ 83. C0, 10
        sub     esp, 4                                  ; 19B3 _ 83. EC, 04
        push    0                                       ; 19B6 _ 6A, 00
        push    eax                                     ; 19B8 _ 50
        push    dword [ebp-28H]                         ; 19B9 _ FF. 75, D8
        call    timer_init                              ; 19BC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 19C1 _ 83. C4, 10
        sub     esp, 8                                  ; 19C4 _ 83. EC, 08
        push    50                                      ; 19C7 _ 6A, 32
        push    dword [ebp-28H]                         ; 19C9 _ FF. 75, D8
        call    timer_settime                           ; 19CC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 19D1 _ 83. C4, 10
        jmp     ?_110                                   ; 19D4 _ E9, 000003C3

?_097:  cmp     dword [ebp-34H], 88                     ; 19D9 _ 83. 7D, CC, 58
        jnz     ?_098                                   ; 19DD _ 75, 59
        mov     eax, dword [ebp-10H]                    ; 19DF _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 19E2 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 19E8 _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 19EB _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 19F1 _ A1, 00000284(d)
        sub     esp, 12                                 ; 19F6 _ 83. EC, 0C
        push    0                                       ; 19F9 _ 6A, 00
        push    ecx                                     ; 19FB _ 51
        push    edx                                     ; 19FC _ 52
        push    dword [ebp+8H]                          ; 19FD _ FF. 75, 08
        push    eax                                     ; 1A00 _ 50
        call    set_cursor                              ; 1A01 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1A06 _ 83. C4, 20
        mov     dword [ebp-0CH], -1                     ; 1A09 _ C7. 45, F4, FFFFFFFF
        mov     eax, dword [task_main]                  ; 1A10 _ A1, 00000294(d)
        sub     esp, 4                                  ; 1A15 _ 83. EC, 04
        push    0                                       ; 1A18 _ 6A, 00
        push    -1                                      ; 1A1A _ 6A, FF
        push    eax                                     ; 1A1C _ 50
        call    task_run                                ; 1A1D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A22 _ 83. C4, 10
        sub     esp, 12                                 ; 1A25 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 1A28 _ FF. 75, F0
        call    task_sleep                              ; 1A2B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A30 _ 83. C4, 10
        jmp     ?_110                                   ; 1A33 _ E9, 00000364

?_098:  cmp     dword [ebp-34H], 28                     ; 1A38 _ 83. 7D, CC, 1C
        jne     ?_108                                   ; 1A3C _ 0F 85, 0000021C
        mov     eax, dword [ebp-10H]                    ; 1A42 _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1A45 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1A4B _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1A4E _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1A54 _ A1, 00000284(d)
        sub     esp, 12                                 ; 1A59 _ 83. EC, 0C
        push    0                                       ; 1A5C _ 6A, 00
        push    ecx                                     ; 1A5E _ 51
        push    edx                                     ; 1A5F _ 52
        push    dword [ebp+8H]                          ; 1A60 _ FF. 75, 08
        push    eax                                     ; 1A63 _ 50
        call    set_cursor                              ; 1A64 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1A69 _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 1A6C _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1A6F _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1A75 _ 8D. 50, 07
        test    eax, eax                                ; 1A78 _ 85. C0
        cmovs   eax, edx                                ; 1A7A _ 0F 48. C2
        sar     eax, 3                                  ; 1A7D _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1A80 _ 8D. 50, FE
        mov     eax, dword [ebp-1CH]                    ; 1A83 _ 8B. 45, E4
        add     eax, edx                                ; 1A86 _ 01. D0
        mov     byte [eax], 0                           ; 1A88 _ C6. 00, 00
        mov     eax, dword [ebp-10H]                    ; 1A8B _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1A8E _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1A94 _ 8D. 50, 07
        test    eax, eax                                ; 1A97 _ 85. C0
        cmovs   eax, edx                                ; 1A99 _ 0F 48. C2
        sar     eax, 3                                  ; 1A9C _ C1. F8, 03
        sub     eax, 2                                  ; 1A9F _ 83. E8, 02
        mov     byte [ebp+eax-55H], 0                   ; 1AA2 _ C6. 44 05, AB, 00
        mov     eax, dword [ebp-10H]                    ; 1AA7 _ 8B. 45, F0
        mov     eax, dword [eax+9CH]                    ; 1AAA _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 1AB0 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 1AB3 _ FF. 75, 08
        push    eax                                     ; 1AB6 _ 50
        call    cons_newline                            ; 1AB7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1ABC _ 83. C4, 10
        mov     edx, eax                                ; 1ABF _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 1AC1 _ 8B. 45, F0
        mov     dword [eax+9CH], edx                    ; 1AC4 _ 89. 90, 0000009C
        sub     esp, 8                                  ; 1ACA _ 83. EC, 08
        push    ?_429                                   ; 1ACD _ 68, 00000025(d)
        push    dword [ebp-1CH]                         ; 1AD2 _ FF. 75, E4
        call    strcmp                                  ; 1AD5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1ADA _ 83. C4, 10
        cmp     eax, 1                                  ; 1ADD _ 83. F8, 01
        jnz     ?_099                                   ; 1AE0 _ 75, 13
        sub     esp, 12                                 ; 1AE2 _ 83. EC, 0C
        push    dword [ebp+0CH]                         ; 1AE5 _ FF. 75, 0C
        call    cmd_mem                                 ; 1AE8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1AED _ 83. C4, 10
        jmp     ?_107                                   ; 1AF0 _ E9, 00000157

?_099:  sub     esp, 8                                  ; 1AF5 _ 83. EC, 08
        push    ?_430                                   ; 1AF8 _ 68, 00000029(d)
        push    dword [ebp-1CH]                         ; 1AFD _ FF. 75, E4
        call    strcmp                                  ; 1B00 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B05 _ 83. C4, 10
        cmp     eax, 1                                  ; 1B08 _ 83. F8, 01
        jnz     ?_100                                   ; 1B0B _ 75, 0A
        call    cmd_cls                                 ; 1B0D _ E8, FFFFFFFC(rel)
        jmp     ?_107                                   ; 1B12 _ E9, 00000135

?_100:  sub     esp, 8                                  ; 1B17 _ 83. EC, 08
        push    ?_431                                   ; 1B1A _ 68, 0000002D(d)
        push    dword [ebp-1CH]                         ; 1B1F _ FF. 75, E4
        call    strcmp                                  ; 1B22 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B27 _ 83. C4, 10
        cmp     eax, 1                                  ; 1B2A _ 83. F8, 01
        jnz     ?_101                                   ; 1B2D _ 75, 15
        sub     esp, 12                                 ; 1B2F _ 83. EC, 0C
        push    ?_432                                   ; 1B32 _ 68, 00000031(d)
        call    cmd_execute_program                     ; 1B37 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B3C _ 83. C4, 10
        jmp     ?_107                                   ; 1B3F _ E9, 00000108

?_101:  sub     esp, 8                                  ; 1B44 _ 83. EC, 08
        push    ?_433                                   ; 1B47 _ 68, 00000039(d)
        push    dword [ebp-1CH]                         ; 1B4C _ FF. 75, E4
        call    strcmp                                  ; 1B4F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B54 _ 83. C4, 10
        cmp     eax, 1                                  ; 1B57 _ 83. F8, 01
        jnz     ?_102                                   ; 1B5A _ 75, 0A
        call    cmd_dir                                 ; 1B5C _ E8, FFFFFFFC(rel)
        jmp     ?_107                                   ; 1B61 _ E9, 000000E6

?_102:  sub     esp, 8                                  ; 1B66 _ 83. EC, 08
        push    ?_434                                   ; 1B69 _ 68, 0000003D(d)
        push    dword [ebp-1CH]                         ; 1B6E _ FF. 75, E4
        call    strcmp                                  ; 1B71 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B76 _ 83. C4, 10
        cmp     eax, 1                                  ; 1B79 _ 83. F8, 01
        jnz     ?_103                                   ; 1B7C _ 75, 13
        sub     esp, 12                                 ; 1B7E _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 1B81 _ FF. 75, F0
        call    cmd_exit                                ; 1B84 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B89 _ 83. C4, 10
        jmp     ?_107                                   ; 1B8C _ E9, 000000BB

?_103:  mov     eax, dword [ebp-1CH]                    ; 1B91 _ 8B. 45, E4
        movzx   eax, byte [eax]                         ; 1B94 _ 0F B6. 00
        cmp     al, 116                                 ; 1B97 _ 3C, 74
        jnz     ?_104                                   ; 1B99 _ 75, 37
        mov     eax, dword [ebp-1CH]                    ; 1B9B _ 8B. 45, E4
        add     eax, 1                                  ; 1B9E _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 1BA1 _ 0F B6. 00
        cmp     al, 121                                 ; 1BA4 _ 3C, 79
        jnz     ?_104                                   ; 1BA6 _ 75, 2A
        mov     eax, dword [ebp-1CH]                    ; 1BA8 _ 8B. 45, E4
        add     eax, 2                                  ; 1BAB _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 1BAE _ 0F B6. 00
        cmp     al, 112                                 ; 1BB1 _ 3C, 70
        jnz     ?_104                                   ; 1BB3 _ 75, 1D
        mov     eax, dword [ebp-1CH]                    ; 1BB5 _ 8B. 45, E4
        add     eax, 3                                  ; 1BB8 _ 83. C0, 03
        movzx   eax, byte [eax]                         ; 1BBB _ 0F B6. 00
        cmp     al, 101                                 ; 1BBE _ 3C, 65
        jnz     ?_104                                   ; 1BC0 _ 75, 10
        sub     esp, 12                                 ; 1BC2 _ 83. EC, 0C
        push    dword [ebp-1CH]                         ; 1BC5 _ FF. 75, E4
        call    cmd_type                                ; 1BC8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1BCD _ 83. C4, 10
        jmp     ?_107                                   ; 1BD0 _ EB, 7A

?_104:  sub     esp, 8                                  ; 1BD2 _ 83. EC, 08
        push    ?_435                                   ; 1BD5 _ 68, 00000042(d)
        push    dword [ebp-1CH]                         ; 1BDA _ FF. 75, E4
        call    strcmp                                  ; 1BDD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1BE2 _ 83. C4, 10
        cmp     eax, 1                                  ; 1BE5 _ 83. F8, 01
        jnz     ?_105                                   ; 1BE8 _ 75, 11
        sub     esp, 12                                 ; 1BEA _ 83. EC, 0C
        lea     eax, [ebp-55H]                          ; 1BED _ 8D. 45, AB
        push    eax                                     ; 1BF0 _ 50
        call    cmd_start                               ; 1BF1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1BF6 _ 83. C4, 10
        jmp     ?_107                                   ; 1BF9 _ EB, 51

?_105:  sub     esp, 8                                  ; 1BFB _ 83. EC, 08
        push    ?_436                                   ; 1BFE _ 68, 00000048(d)
        push    dword [ebp-1CH]                         ; 1C03 _ FF. 75, E4
        call    strcmp                                  ; 1C06 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C0B _ 83. C4, 10
        cmp     eax, 1                                  ; 1C0E _ 83. F8, 01
        jnz     ?_106                                   ; 1C11 _ 75, 11
        sub     esp, 12                                 ; 1C13 _ 83. EC, 0C
        lea     eax, [ebp-55H]                          ; 1C16 _ 8D. 45, AB
        push    eax                                     ; 1C19 _ 50
        call    cmd_ncst                                ; 1C1A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C1F _ 83. C4, 10
        jmp     ?_107                                   ; 1C22 _ EB, 28

?_106:  sub     esp, 8                                  ; 1C24 _ 83. EC, 08
        push    ?_437                                   ; 1C27 _ 68, 0000004D(d)
        push    dword [ebp-1CH]                         ; 1C2C _ FF. 75, E4
        call    strcmp                                  ; 1C2F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C34 _ 83. C4, 10
        cmp     eax, 1                                  ; 1C37 _ 83. F8, 01
        jnz     ?_107                                   ; 1C3A _ 75, 10
        sub     esp, 12                                 ; 1C3C _ 83. EC, 0C
        push    ?_438                                   ; 1C3F _ 68, 00000053(d)
        call    cmd_execute_program                     ; 1C44 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C49 _ 83. C4, 10
?_107:  mov     eax, dword [ebp-10H]                    ; 1C4C _ 8B. 45, F0
        mov     dword [eax+98H], 16                     ; 1C4F _ C7. 80, 00000098, 00000010
        jmp     ?_110                                   ; 1C59 _ E9, 0000013E

?_108:  cmp     dword [ebp-34H], 14                     ; 1C5E _ 83. 7D, CC, 0E
        jnz     ?_109                                   ; 1C62 _ 75, 7C
        mov     eax, dword [ebp-10H]                    ; 1C64 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1C67 _ 8B. 80, 00000098
        cmp     eax, 8                                  ; 1C6D _ 83. F8, 08
        jle     ?_109                                   ; 1C70 _ 7E, 6E
        mov     eax, dword [ebp-10H]                    ; 1C72 _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1C75 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1C7B _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1C7E _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1C84 _ A1, 00000284(d)
        sub     esp, 12                                 ; 1C89 _ 83. EC, 0C
        push    0                                       ; 1C8C _ 6A, 00
        push    ecx                                     ; 1C8E _ 51
        push    edx                                     ; 1C8F _ 52
        push    dword [ebp+8H]                          ; 1C90 _ FF. 75, 08
        push    eax                                     ; 1C93 _ 50
        call    set_cursor                              ; 1C94 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1C99 _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 1C9C _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1C9F _ 8B. 80, 00000098
        lea     edx, [eax-8H]                           ; 1CA5 _ 8D. 50, F8
        mov     eax, dword [ebp-10H]                    ; 1CA8 _ 8B. 45, F0
        mov     dword [eax+98H], edx                    ; 1CAB _ 89. 90, 00000098
        mov     eax, dword [ebp-10H]                    ; 1CB1 _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1CB4 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1CBA _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1CBD _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1CC3 _ A1, 00000284(d)
        sub     esp, 12                                 ; 1CC8 _ 83. EC, 0C
        push    0                                       ; 1CCB _ 6A, 00
        push    ecx                                     ; 1CCD _ 51
        push    edx                                     ; 1CCE _ 52
        push    dword [ebp+8H]                          ; 1CCF _ FF. 75, 08
        push    eax                                     ; 1CD2 _ 50
        call    set_cursor                              ; 1CD3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1CD8 _ 83. C4, 20
        jmp     ?_110                                   ; 1CDB _ E9, 000000BC

?_109:  sub     esp, 12                                 ; 1CE0 _ 83. EC, 0C
        push    dword [ebp-34H]                         ; 1CE3 _ FF. 75, CC
        call    transferScanCode                        ; 1CE6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1CEB _ 83. C4, 10
        mov     byte [ebp-35H], al                      ; 1CEE _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 1CF1 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1CF4 _ 8B. 80, 00000098
        cmp     eax, 239                                ; 1CFA _ 3D, 000000EF
        jg      ?_110                                   ; 1CFF _ 0F 8F, 00000097
        cmp     byte [ebp-35H], 0                       ; 1D05 _ 80. 7D, CB, 00
        je      ?_110                                   ; 1D09 _ 0F 84, 0000008D
        mov     eax, dword [ebp-10H]                    ; 1D0F _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1D12 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1D18 _ 8D. 50, 07
        test    eax, eax                                ; 1D1B _ 85. C0
        cmovs   eax, edx                                ; 1D1D _ 0F 48. C2
        sar     eax, 3                                  ; 1D20 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1D23 _ 8D. 50, FE
        mov     eax, dword [ebp-1CH]                    ; 1D26 _ 8B. 45, E4
        add     edx, eax                                ; 1D29 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 1D2B _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 1D2F _ 88. 02
        mov     eax, dword [ebp-10H]                    ; 1D31 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1D34 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1D3A _ 8D. 50, 07
        test    eax, eax                                ; 1D3D _ 85. C0
        cmovs   eax, edx                                ; 1D3F _ 0F 48. C2
        sar     eax, 3                                  ; 1D42 _ C1. F8, 03
        lea     edx, [eax-1H]                           ; 1D45 _ 8D. 50, FF
        mov     eax, dword [ebp-1CH]                    ; 1D48 _ 8B. 45, E4
        add     eax, edx                                ; 1D4B _ 01. D0
        mov     byte [eax], 0                           ; 1D4D _ C6. 00, 00
        mov     eax, dword [ebp-10H]                    ; 1D50 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1D53 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1D59 _ 8D. 50, 07
        test    eax, eax                                ; 1D5C _ 85. C0
        cmovs   eax, edx                                ; 1D5E _ 0F 48. C2
        sar     eax, 3                                  ; 1D61 _ C1. F8, 03
        sub     eax, 2                                  ; 1D64 _ 83. E8, 02
        mov     edx, dword [ebp-34H]                    ; 1D67 _ 8B. 55, CC
        mov     byte [ebp+eax-55H], dl                  ; 1D6A _ 88. 54 05, AB
        mov     eax, dword [ebp-10H]                    ; 1D6E _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1D71 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1D77 _ 8D. 50, 07
        test    eax, eax                                ; 1D7A _ 85. C0
        cmovs   eax, edx                                ; 1D7C _ 0F 48. C2
        sar     eax, 3                                  ; 1D7F _ C1. F8, 03
        sub     eax, 1                                  ; 1D82 _ 83. E8, 01
        mov     byte [ebp+eax-55H], 0                   ; 1D85 _ C6. 44 05, AB, 00
        movsx   eax, byte [ebp-35H]                     ; 1D8A _ 0F BE. 45, CB
        sub     esp, 8                                  ; 1D8E _ 83. EC, 08
        push    1                                       ; 1D91 _ 6A, 01
        push    eax                                     ; 1D93 _ 50
        call    cons_putchar                            ; 1D94 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1D99 _ 83. C4, 10
?_110:  cmp     dword [ebp-0CH], 0                      ; 1D9C _ 83. 7D, F4, 00
        js      ?_111                                   ; 1DA0 _ 78, 3F
        mov     eax, dword [ebp-10H]                    ; 1DA2 _ 8B. 45, F0
        mov     eax, dword [eax+94H]                    ; 1DA5 _ 8B. 80, 00000094
        test    eax, eax                                ; 1DAB _ 85. C0
        jz      ?_111                                   ; 1DAD _ 74, 32
        mov     eax, dword [ebp-10H]                    ; 1DAF _ 8B. 45, F0
        mov     ebx, dword [eax+9CH]                    ; 1DB2 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1DB8 _ 8B. 45, F0
        mov     ecx, dword [eax+98H]                    ; 1DBB _ 8B. 88, 00000098
        mov     eax, dword [ebp-10H]                    ; 1DC1 _ 8B. 45, F0
        mov     edx, dword [eax+94H]                    ; 1DC4 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1DCA _ A1, 00000284(d)
        sub     esp, 12                                 ; 1DCF _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 1DD2 _ FF. 75, F4
        push    ebx                                     ; 1DD5 _ 53
        push    ecx                                     ; 1DD6 _ 51
        push    edx                                     ; 1DD7 _ 52
        push    eax                                     ; 1DD8 _ 50
        call    set_cursor                              ; 1DD9 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1DDE _ 83. C4, 20
?_111:  call    io_sti                                  ; 1DE1 _ E8, FFFFFFFC(rel)
        jmp     ?_092                                   ; 1DE6 _ E9, FFFFFB0E
; console_task End of function

cons_putstr:; Function begin
        push    ebp                                     ; 1DEB _ 55
        mov     ebp, esp                                ; 1DEC _ 89. E5
        sub     esp, 8                                  ; 1DEE _ 83. EC, 08
        jmp     ?_113                                   ; 1DF1 _ EB, 1B

?_112:  mov     eax, dword [ebp+8H]                     ; 1DF3 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1DF6 _ 0F B6. 00
        movsx   eax, al                                 ; 1DF9 _ 0F BE. C0
        sub     esp, 8                                  ; 1DFC _ 83. EC, 08
        push    1                                       ; 1DFF _ 6A, 01
        push    eax                                     ; 1E01 _ 50
        call    cons_putchar                            ; 1E02 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1E07 _ 83. C4, 10
        add     dword [ebp+8H], 1                       ; 1E0A _ 83. 45, 08, 01
?_113:  mov     eax, dword [ebp+8H]                     ; 1E0E _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1E11 _ 0F B6. 00
        test    al, al                                  ; 1E14 _ 84. C0
        jnz     ?_112                                   ; 1E16 _ 75, DB
        nop                                             ; 1E18 _ 90
        leave                                           ; 1E19 _ C9
        ret                                             ; 1E1A _ C3
; cons_putstr End of function

api_linewin:; Function begin
        push    ebp                                     ; 1E1B _ 55
        mov     ebp, esp                                ; 1E1C _ 89. E5
        sub     esp, 32                                 ; 1E1E _ 83. EC, 20
        mov     eax, dword [ebp+14H]                    ; 1E21 _ 8B. 45, 14
        sub     eax, dword [ebp+0CH]                    ; 1E24 _ 2B. 45, 0C
        mov     dword [ebp-14H], eax                    ; 1E27 _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 1E2A _ 8B. 45, 18
        sub     eax, dword [ebp+10H]                    ; 1E2D _ 2B. 45, 10
        mov     dword [ebp-18H], eax                    ; 1E30 _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 1E33 _ 8B. 45, 0C
        shl     eax, 10                                 ; 1E36 _ C1. E0, 0A
        mov     dword [ebp-8H], eax                     ; 1E39 _ 89. 45, F8
        mov     eax, dword [ebp+10H]                    ; 1E3C _ 8B. 45, 10
        shl     eax, 10                                 ; 1E3F _ C1. E0, 0A
        mov     dword [ebp-0CH], eax                    ; 1E42 _ 89. 45, F4
        cmp     dword [ebp-14H], 0                      ; 1E45 _ 83. 7D, EC, 00
        jns     ?_114                                   ; 1E49 _ 79, 03
        neg     dword [ebp-14H]                         ; 1E4B _ F7. 5D, EC
?_114:  cmp     dword [ebp-18H], 0                      ; 1E4E _ 83. 7D, E8, 00
        jns     ?_115                                   ; 1E52 _ 79, 03
        neg     dword [ebp-18H]                         ; 1E54 _ F7. 5D, E8
?_115:  mov     eax, dword [ebp-14H]                    ; 1E57 _ 8B. 45, EC
        cmp     eax, dword [ebp-18H]                    ; 1E5A _ 3B. 45, E8
        jl      ?_119                                   ; 1E5D _ 7C, 53
        mov     eax, dword [ebp-14H]                    ; 1E5F _ 8B. 45, EC
        add     eax, 1                                  ; 1E62 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1E65 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1E68 _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 1E6B _ 3B. 45, 14
        jle     ?_116                                   ; 1E6E _ 7E, 09
        mov     dword [ebp-14H], -1024                  ; 1E70 _ C7. 45, EC, FFFFFC00
        jmp     ?_117                                   ; 1E77 _ EB, 07

?_116:  mov     dword [ebp-14H], 1024                   ; 1E79 _ C7. 45, EC, 00000400
?_117:  mov     eax, dword [ebp+10H]                    ; 1E80 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 1E83 _ 3B. 45, 18
        jg      ?_118                                   ; 1E86 _ 7F, 15
        mov     eax, dword [ebp+18H]                    ; 1E88 _ 8B. 45, 18
        sub     eax, dword [ebp+10H]                    ; 1E8B _ 2B. 45, 10
        add     eax, 1                                  ; 1E8E _ 83. C0, 01
        shl     eax, 10                                 ; 1E91 _ C1. E0, 0A
        cdq                                             ; 1E94 _ 99
        idiv    dword [ebp-10H]                         ; 1E95 _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 1E98 _ 89. 45, E8
        jmp     ?_123                                   ; 1E9B _ EB, 66

?_118:  mov     eax, dword [ebp+18H]                    ; 1E9D _ 8B. 45, 18
        sub     eax, dword [ebp+10H]                    ; 1EA0 _ 2B. 45, 10
        sub     eax, 1                                  ; 1EA3 _ 83. E8, 01
        shl     eax, 10                                 ; 1EA6 _ C1. E0, 0A
        cdq                                             ; 1EA9 _ 99
        idiv    dword [ebp-10H]                         ; 1EAA _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 1EAD _ 89. 45, E8
        jmp     ?_123                                   ; 1EB0 _ EB, 51

?_119:  mov     eax, dword [ebp-18H]                    ; 1EB2 _ 8B. 45, E8
        add     eax, 1                                  ; 1EB5 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1EB8 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1EBB _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 1EBE _ 3B. 45, 18
        jle     ?_120                                   ; 1EC1 _ 7E, 09
        mov     dword [ebp-18H], -1024                  ; 1EC3 _ C7. 45, E8, FFFFFC00
        jmp     ?_121                                   ; 1ECA _ EB, 07

?_120:  mov     dword [ebp-18H], 1024                   ; 1ECC _ C7. 45, E8, 00000400
?_121:  mov     eax, dword [ebp+0CH]                    ; 1ED3 _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 1ED6 _ 3B. 45, 14
        jg      ?_122                                   ; 1ED9 _ 7F, 15
        mov     eax, dword [ebp+14H]                    ; 1EDB _ 8B. 45, 14
        sub     eax, dword [ebp+0CH]                    ; 1EDE _ 2B. 45, 0C
        add     eax, 1                                  ; 1EE1 _ 83. C0, 01
        shl     eax, 10                                 ; 1EE4 _ C1. E0, 0A
        cdq                                             ; 1EE7 _ 99
        idiv    dword [ebp-10H]                         ; 1EE8 _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 1EEB _ 89. 45, EC
        jmp     ?_123                                   ; 1EEE _ EB, 13

?_122:  mov     eax, dword [ebp+14H]                    ; 1EF0 _ 8B. 45, 14
        sub     eax, dword [ebp+0CH]                    ; 1EF3 _ 2B. 45, 0C
        sub     eax, 1                                  ; 1EF6 _ 83. E8, 01
        shl     eax, 10                                 ; 1EF9 _ C1. E0, 0A
        cdq                                             ; 1EFC _ 99
        idiv    dword [ebp-10H]                         ; 1EFD _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 1F00 _ 89. 45, EC
?_123:  mov     dword [ebp-4H], 0                       ; 1F03 _ C7. 45, FC, 00000000
        jmp     ?_125                                   ; 1F0A _ EB, 35

?_124:  mov     eax, dword [ebp+8H]                     ; 1F0C _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1F0F _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 1F11 _ 8B. 45, F4
        sar     eax, 10                                 ; 1F14 _ C1. F8, 0A
        mov     ecx, eax                                ; 1F17 _ 89. C1
        mov     eax, dword [ebp+8H]                     ; 1F19 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1F1C _ 8B. 40, 04
        imul    eax, ecx                                ; 1F1F _ 0F AF. C1
        mov     ecx, dword [ebp-8H]                     ; 1F22 _ 8B. 4D, F8
        sar     ecx, 10                                 ; 1F25 _ C1. F9, 0A
        add     eax, ecx                                ; 1F28 _ 01. C8
        add     eax, edx                                ; 1F2A _ 01. D0
        mov     edx, dword [ebp+1CH]                    ; 1F2C _ 8B. 55, 1C
        mov     byte [eax], dl                          ; 1F2F _ 88. 10
        mov     eax, dword [ebp-14H]                    ; 1F31 _ 8B. 45, EC
        add     dword [ebp-8H], eax                     ; 1F34 _ 01. 45, F8
        mov     eax, dword [ebp-18H]                    ; 1F37 _ 8B. 45, E8
        add     dword [ebp-0CH], eax                    ; 1F3A _ 01. 45, F4
        add     dword [ebp-4H], 1                       ; 1F3D _ 83. 45, FC, 01
?_125:  mov     eax, dword [ebp-4H]                     ; 1F41 _ 8B. 45, FC
        cmp     eax, dword [ebp-10H]                    ; 1F44 _ 3B. 45, F0
        jl      ?_124                                   ; 1F47 _ 7C, C3
        leave                                           ; 1F49 _ C9
        ret                                             ; 1F4A _ C3
; api_linewin End of function

handle_keyboard:; Function begin
        push    ebp                                     ; 1F4B _ 55
        mov     ebp, esp                                ; 1F4C _ 89. E5
        sub     esp, 24                                 ; 1F4E _ 83. EC, 18
?_126:  call    io_cli                                  ; 1F51 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1F56 _ 8B. 45, 08
        add     eax, 16                                 ; 1F59 _ 83. C0, 10
        sub     esp, 12                                 ; 1F5C _ 83. EC, 0C
        push    eax                                     ; 1F5F _ 50
        call    fifo8_status                            ; 1F60 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1F65 _ 83. C4, 10
        test    eax, eax                                ; 1F68 _ 85. C0
        jnz     ?_128                                   ; 1F6A _ 75, 2B
        call    io_sti                                  ; 1F6C _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+0CH], 0                      ; 1F71 _ 83. 7D, 0C, 00
        jz      ?_127                                   ; 1F75 _ 74, 05
        jmp     ?_132                                   ; 1F77 _ E9, 000000C8

?_127:  call    io_sti                                  ; 1F7C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1F81 _ 8B. 45, 10
        add     eax, 28                                 ; 1F84 _ 83. C0, 1C
        mov     dword [eax], -1                         ; 1F87 _ C7. 00, FFFFFFFF
        mov     eax, 0                                  ; 1F8D _ B8, 00000000
        jmp     ?_133                                   ; 1F92 _ E9, 000000B2

?_128:  mov     eax, dword [ebp+8H]                     ; 1F97 _ 8B. 45, 08
        add     eax, 16                                 ; 1F9A _ 83. C0, 10
        sub     esp, 12                                 ; 1F9D _ 83. EC, 0C
        push    eax                                     ; 1FA0 _ 50
        call    fifo8_get                               ; 1FA1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1FA6 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1FA9 _ 89. 45, F4
        call    io_sti                                  ; 1FAC _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 255                    ; 1FB1 _ 81. 7D, F4, 000000FF
        jle     ?_129                                   ; 1FB8 _ 7E, 26
        mov     edx, dword [sht_back]                   ; 1FBA _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 1FC0 _ A1, 00000284(d)
        sub     esp, 8                                  ; 1FC5 _ 83. EC, 08
        push    ?_439                                   ; 1FC8 _ 68, 0000005D(d)
        push    7                                       ; 1FCD _ 6A, 07
        push    176                                     ; 1FCF _ 68, 000000B0
        push    0                                       ; 1FD4 _ 6A, 00
        push    edx                                     ; 1FD6 _ 52
        push    eax                                     ; 1FD7 _ 50
        call    showString                              ; 1FD8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1FDD _ 83. C4, 20
?_129:  cmp     dword [ebp-0CH], 1                      ; 1FE0 _ 83. 7D, F4, 01
        jg      ?_130                                   ; 1FE4 _ 7F, 37
        mov     eax, dword [ebp+8H]                     ; 1FE6 _ 8B. 45, 08
        lea     edx, [eax+10H]                          ; 1FE9 _ 8D. 50, 10
        mov     eax, dword [ebp+8H]                     ; 1FEC _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 1FEF _ 8B. 80, 000000A8
        sub     esp, 4                                  ; 1FF5 _ 83. EC, 04
        push    1                                       ; 1FF8 _ 6A, 01
        push    edx                                     ; 1FFA _ 52
        push    eax                                     ; 1FFB _ 50
        call    timer_init                              ; 1FFC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2001 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 2004 _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 2007 _ 8B. 80, 000000A8
        sub     esp, 8                                  ; 200D _ 83. EC, 08
        push    50                                      ; 2010 _ 6A, 32
        push    eax                                     ; 2012 _ 50
        call    timer_settime                           ; 2013 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2018 _ 83. C4, 10
        jmp     ?_132                                   ; 201B _ EB, 27

?_130:  cmp     dword [ebp-0CH], 2                      ; 201D _ 83. 7D, F4, 02
        jnz     ?_131                                   ; 2021 _ 75, 0F
        mov     eax, dword [ebp+8H]                     ; 2023 _ 8B. 45, 08
        mov     dword [eax+0A0H], 7                     ; 2026 _ C7. 80, 000000A0, 00000007
        jmp     ?_132                                   ; 2030 _ EB, 12

?_131:  mov     eax, dword [ebp+10H]                    ; 2032 _ 8B. 45, 10
        lea     edx, [eax+1CH]                          ; 2035 _ 8D. 50, 1C
        mov     eax, dword [ebp-0CH]                    ; 2038 _ 8B. 45, F4
        mov     dword [edx], eax                        ; 203B _ 89. 02
        mov     eax, 0                                  ; 203D _ B8, 00000000
        jmp     ?_133                                   ; 2042 _ EB, 05

?_132:  jmp     ?_126                                   ; 2044 _ E9, FFFFFF08

?_133:  leave                                           ; 2049 _ C9
        ret                                             ; 204A _ C3
; handle_keyboard End of function

close_constask:; Function begin
        push    ebp                                     ; 204B _ 55
        mov     ebp, esp                                ; 204C _ 89. E5
        sub     esp, 8                                  ; 204E _ 83. EC, 08
        sub     esp, 12                                 ; 2051 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 2054 _ FF. 75, 08
        call    task_sleep                              ; 2057 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 205C _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 205F _ 8B. 45, 08
        mov     eax, dword [eax+0B8H]                   ; 2062 _ 8B. 80, 000000B8
        mov     edx, eax                                ; 2068 _ 89. C2
        mov     eax, dword [memman]                     ; 206A _ A1, 00000000(d)
        sub     esp, 4                                  ; 206F _ 83. EC, 04
        push    65536                                   ; 2072 _ 68, 00010000
        push    edx                                     ; 2077 _ 52
        push    eax                                     ; 2078 _ 50
        call    memman_free_4k                          ; 2079 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 207E _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 2081 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2084 _ 8B. 40, 10
        mov     edx, eax                                ; 2087 _ 89. C2
        mov     eax, dword [memman]                     ; 2089 _ A1, 00000000(d)
        sub     esp, 4                                  ; 208E _ 83. EC, 04
        push    128                                     ; 2091 _ 68, 00000080
        push    edx                                     ; 2096 _ 52
        push    eax                                     ; 2097 _ 50
        call    memman_free                             ; 2098 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 209D _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 20A0 _ 8B. 45, 08
        mov     eax, dword [eax+0ACH]                   ; 20A3 _ 8B. 80, 000000AC
        mov     edx, eax                                ; 20A9 _ 89. C2
        mov     eax, dword [memman]                     ; 20AB _ A1, 00000000(d)
        sub     esp, 4                                  ; 20B0 _ 83. EC, 04
        push    30                                      ; 20B3 _ 6A, 1E
        push    edx                                     ; 20B5 _ 52
        push    eax                                     ; 20B6 _ 50
        call    memman_free                             ; 20B7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 20BC _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 20BF _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 20C2 _ C7. 40, 04, 00000000
        mov     dword [current_console_task], 0         ; 20C9 _ C7. 05, 00000298(d), 00000000
        leave                                           ; 20D3 _ C9
        ret                                             ; 20D4 _ C3
; close_constask End of function

close_console:; Function begin
        push    ebp                                     ; 20D5 _ 55
        mov     ebp, esp                                ; 20D6 _ 89. E5
        sub     esp, 24                                 ; 20D8 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 20DB _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 20DE _ 8B. 80, 000000A8
        sub     esp, 12                                 ; 20E4 _ 83. EC, 0C
        push    eax                                     ; 20E7 _ 50
        call    timer_free                              ; 20E8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 20ED _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 20F0 _ 8B. 45, 08
        mov     eax, dword [eax+0B4H]                   ; 20F3 _ 8B. 80, 000000B4
        test    eax, eax                                ; 20F9 _ 85. C0
        jz      ?_134                                   ; 20FB _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 20FD _ 8B. 45, 08
        mov     eax, dword [eax+0B4H]                   ; 2100 _ 8B. 80, 000000B4
        mov     dword [ebp-0CH], eax                    ; 2106 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 2109 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 210C _ 8B. 00
        mov     edx, eax                                ; 210E _ 89. C2
        mov     eax, dword [memman]                     ; 2110 _ A1, 00000000(d)
        sub     esp, 4                                  ; 2115 _ 83. EC, 04
        push    42240                                   ; 2118 _ 68, 0000A500
        push    edx                                     ; 211D _ 52
        push    eax                                     ; 211E _ 50
        call    memman_free_4k                          ; 211F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2124 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 2127 _ A1, 00000284(d)
        sub     esp, 8                                  ; 212C _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 212F _ FF. 75, F4
        push    eax                                     ; 2132 _ 50
        call    sheet_free                              ; 2133 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2138 _ 83. C4, 10
?_134:  sub     esp, 12                                 ; 213B _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 213E _ FF. 75, 08
        call    close_constask                          ; 2141 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2146 _ 83. C4, 10
        leave                                           ; 2149 _ C9
        ret                                             ; 214A _ C3
; close_console End of function

cmd_exit:; Function begin
        push    ebp                                     ; 214B _ 55
        mov     ebp, esp                                ; 214C _ 89. E5
        sub     esp, 8                                  ; 214E _ 83. EC, 08
        call    io_cli                                  ; 2151 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 2156 _ 83. EC, 08
        push    255                                     ; 2159 _ 68, 000000FF
        push    keyinfo                                 ; 215E _ 68, 0000001C(d)
        call    fifo8_put                               ; 2163 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2168 _ 83. C4, 10
        call    io_sti                                  ; 216B _ E8, FFFFFFFC(rel)
        leave                                           ; 2170 _ C9
        ret                                             ; 2171 _ C3
; cmd_exit End of function

kernel_api:; Function begin
        push    ebp                                     ; 2172 _ 55
        mov     ebp, esp                                ; 2173 _ 89. E5
        push    ebx                                     ; 2175 _ 53
        sub     esp, 52                                 ; 2176 _ 83. EC, 34
        call    task_now                                ; 2179 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 217E _ 89. 45, F0
        mov     dword [ebp-14H], 0                      ; 2181 _ C7. 45, EC, 00000000
        lea     eax, [ebp+24H]                          ; 2188 _ 8D. 45, 24
        add     eax, 4                                  ; 218B _ 83. C0, 04
        mov     dword [ebp-18H], eax                    ; 218E _ 89. 45, E8
        mov     dword [ebp-0CH], 0                      ; 2191 _ C7. 45, F4, 00000000
        mov     dword [ebp-1CH], 0                      ; 2198 _ C7. 45, E4, 00000000
        cmp     dword [ebp+1CH], 1                      ; 219F _ 83. 7D, 1C, 01
        jnz     ?_135                                   ; 21A3 _ 75, 19
        mov     eax, dword [ebp+24H]                    ; 21A5 _ 8B. 45, 24
        movsx   eax, al                                 ; 21A8 _ 0F BE. C0
        sub     esp, 8                                  ; 21AB _ 83. EC, 08
        push    1                                       ; 21AE _ 6A, 01
        push    eax                                     ; 21B0 _ 50
        call    cons_putchar                            ; 21B1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 21B6 _ 83. C4, 10
        jmp     ?_169                                   ; 21B9 _ E9, 000005E2

?_135:  cmp     dword [ebp+1CH], 2                      ; 21BE _ 83. 7D, 1C, 02
        jnz     ?_136                                   ; 21C2 _ 75, 21
        mov     eax, dword [ebp-10H]                    ; 21C4 _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 21C7 _ 8B. 80, 000000B0
        mov     edx, dword [eax]                        ; 21CD _ 8B. 10
        mov     eax, dword [ebp+18H]                    ; 21CF _ 8B. 45, 18
        add     eax, edx                                ; 21D2 _ 01. D0
        sub     esp, 12                                 ; 21D4 _ 83. EC, 0C
        push    eax                                     ; 21D7 _ 50
        call    cons_putstr                             ; 21D8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 21DD _ 83. C4, 10
        jmp     ?_169                                   ; 21E0 _ E9, 000005BB

?_136:  cmp     dword [ebp+1CH], 4                      ; 21E5 _ 83. 7D, 1C, 04
        jnz     ?_137                                   ; 21E9 _ 75, 15
        mov     eax, dword [ebp-10H]                    ; 21EB _ 8B. 45, F0
        mov     dword [eax+34H], 0                      ; 21EE _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-10H]                    ; 21F5 _ 8B. 45, F0
        add     eax, 48                                 ; 21F8 _ 83. C0, 30
        jmp     ?_170                                   ; 21FB _ E9, 000005A5

?_137:  cmp     dword [ebp+1CH], 5                      ; 2200 _ 83. 7D, 1C, 05
        jne     ?_138                                   ; 2204 _ 0F 85, 000000E8
        mov     eax, dword [shtctl]                     ; 220A _ A1, 00000284(d)
        sub     esp, 12                                 ; 220F _ 83. EC, 0C
        push    eax                                     ; 2212 _ 50
        call    sheet_alloc                             ; 2213 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2218 _ 83. C4, 10
        mov     dword [ebp-14H], eax                    ; 221B _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 221E _ 8B. 45, EC
        mov     edx, dword [ebp-10H]                    ; 2221 _ 8B. 55, F0
        mov     dword [eax+20H], edx                    ; 2224 _ 89. 50, 20
        mov     eax, dword [ebp-14H]                    ; 2227 _ 8B. 45, EC
        mov     eax, dword [eax+1CH]                    ; 222A _ 8B. 40, 1C
        or      eax, 10H                                ; 222D _ 83. C8, 10
        mov     edx, eax                                ; 2230 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2232 _ 8B. 45, EC
        mov     dword [eax+1CH], edx                    ; 2235 _ 89. 50, 1C
        mov     eax, dword [ebp+24H]                    ; 2238 _ 8B. 45, 24
        mov     edx, dword [ebp-10H]                    ; 223B _ 8B. 55, F0
        mov     edx, dword [edx+0B0H]                   ; 223E _ 8B. 92, 000000B0
        mov     ecx, dword [edx+4H]                     ; 2244 _ 8B. 4A, 04
        mov     edx, dword [ebp+18H]                    ; 2247 _ 8B. 55, 18
        add     edx, ecx                                ; 224A _ 01. CA
        sub     esp, 12                                 ; 224C _ 83. EC, 0C
        push    eax                                     ; 224F _ 50
        push    dword [ebp+8H]                          ; 2250 _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 2253 _ FF. 75, 0C
        push    edx                                     ; 2256 _ 52
        push    dword [ebp-14H]                         ; 2257 _ FF. 75, EC
        call    sheet_setbuf                            ; 225A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 225F _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 2262 _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 2265 _ 8B. 80, 000000B0
        mov     edx, dword [eax]                        ; 226B _ 8B. 10
        mov     eax, dword [ebp+20H]                    ; 226D _ 8B. 45, 20
        add     edx, eax                                ; 2270 _ 01. C2
        mov     eax, dword [shtctl]                     ; 2272 _ A1, 00000284(d)
        push    0                                       ; 2277 _ 6A, 00
        push    edx                                     ; 2279 _ 52
        push    dword [ebp-14H]                         ; 227A _ FF. 75, EC
        push    eax                                     ; 227D _ 50
        call    make_window8                            ; 227E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2283 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 2286 _ A1, 00000284(d)
        mov     eax, dword [eax+0CH]                    ; 228B _ 8B. 40, 0C
        sub     eax, dword [ebp+8H]                     ; 228E _ 2B. 45, 08
        mov     edx, eax                                ; 2291 _ 89. C2
        shr     edx, 31                                 ; 2293 _ C1. EA, 1F
        add     eax, edx                                ; 2296 _ 01. D0
        sar     eax, 1                                  ; 2298 _ D1. F8
        mov     ecx, eax                                ; 229A _ 89. C1
        mov     eax, dword [shtctl]                     ; 229C _ A1, 00000284(d)
        mov     eax, dword [eax+8H]                     ; 22A1 _ 8B. 40, 08
        sub     eax, dword [ebp+0CH]                    ; 22A4 _ 2B. 45, 0C
        mov     edx, eax                                ; 22A7 _ 89. C2
        shr     edx, 31                                 ; 22A9 _ C1. EA, 1F
        add     eax, edx                                ; 22AC _ 01. D0
        sar     eax, 1                                  ; 22AE _ D1. F8
        mov     edx, eax                                ; 22B0 _ 89. C2
        mov     eax, dword [shtctl]                     ; 22B2 _ A1, 00000284(d)
        push    ecx                                     ; 22B7 _ 51
        push    edx                                     ; 22B8 _ 52
        push    dword [ebp-14H]                         ; 22B9 _ FF. 75, EC
        push    eax                                     ; 22BC _ 50
        call    sheet_slide                             ; 22BD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 22C2 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 22C5 _ A1, 00000284(d)
        mov     edx, dword [eax+10H]                    ; 22CA _ 8B. 50, 10
        mov     eax, dword [shtctl]                     ; 22CD _ A1, 00000284(d)
        sub     esp, 4                                  ; 22D2 _ 83. EC, 04
        push    edx                                     ; 22D5 _ 52
        push    dword [ebp-14H]                         ; 22D6 _ FF. 75, EC
        push    eax                                     ; 22D9 _ 50
        call    sheet_updown                            ; 22DA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 22DF _ 83. C4, 10
        mov     eax, dword [ebp-18H]                    ; 22E2 _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 22E5 _ 8D. 50, 1C
        mov     eax, dword [ebp-14H]                    ; 22E8 _ 8B. 45, EC
        mov     dword [edx], eax                        ; 22EB _ 89. 02
        jmp     ?_169                                   ; 22ED _ E9, 000004AE

?_138:  cmp     dword [ebp+1CH], 6                      ; 22F2 _ 83. 7D, 1C, 06
        jnz     ?_139                                   ; 22F6 _ 75, 70
        mov     eax, dword [ebp+18H]                    ; 22F8 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 22FB _ 89. 45, EC
        mov     eax, dword [ebp-10H]                    ; 22FE _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 2301 _ 8B. 80, 000000B0
        mov     edx, dword [eax+4H]                     ; 2307 _ 8B. 50, 04
        mov     eax, dword [ebp+10H]                    ; 230A _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 230D _ 8D. 0C 02
        mov     eax, dword [ebp+24H]                    ; 2310 _ 8B. 45, 24
        movsx   edx, al                                 ; 2313 _ 0F BE. D0
        mov     eax, dword [shtctl]                     ; 2316 _ A1, 00000284(d)
        sub     esp, 8                                  ; 231B _ 83. EC, 08
        push    ecx                                     ; 231E _ 51
        push    edx                                     ; 231F _ 52
        push    dword [ebp+8H]                          ; 2320 _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 2323 _ FF. 75, 0C
        push    dword [ebp-14H]                         ; 2326 _ FF. 75, EC
        push    eax                                     ; 2329 _ 50
        call    showString                              ; 232A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 232F _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 2332 _ 8B. 45, 08
        lea     ecx, [eax+10H]                          ; 2335 _ 8D. 48, 10
        mov     eax, dword [ebp+20H]                    ; 2338 _ 8B. 45, 20
        lea     edx, [eax*8]                            ; 233B _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2342 _ 8B. 45, 0C
        add     edx, eax                                ; 2345 _ 01. C2
        mov     eax, dword [shtctl]                     ; 2347 _ A1, 00000284(d)
        sub     esp, 8                                  ; 234C _ 83. EC, 08
        push    ecx                                     ; 234F _ 51
        push    edx                                     ; 2350 _ 52
        push    dword [ebp+8H]                          ; 2351 _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 2354 _ FF. 75, 0C
        push    dword [ebp-14H]                         ; 2357 _ FF. 75, EC
        push    eax                                     ; 235A _ 50
        call    sheet_refresh                           ; 235B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2360 _ 83. C4, 20
        jmp     ?_169                                   ; 2363 _ E9, 00000438

?_139:  cmp     dword [ebp+1CH], 7                      ; 2368 _ 83. 7D, 1C, 07
        jnz     ?_140                                   ; 236C _ 75, 60
        mov     eax, dword [ebp+18H]                    ; 236E _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 2371 _ 89. 45, EC
        mov     ebx, dword [ebp+24H]                    ; 2374 _ 8B. 5D, 24
        mov     eax, dword [ebp+10H]                    ; 2377 _ 8B. 45, 10
        movzx   ecx, al                                 ; 237A _ 0F B6. C8
        mov     eax, dword [ebp-14H]                    ; 237D _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 2380 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 2383 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 2386 _ 8B. 00
        sub     esp, 4                                  ; 2388 _ 83. EC, 04
        push    dword [ebp+8H]                          ; 238B _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 238E _ FF. 75, 0C
        push    dword [ebp+20H]                         ; 2391 _ FF. 75, 20
        push    ebx                                     ; 2394 _ 53
        push    ecx                                     ; 2395 _ 51
        push    edx                                     ; 2396 _ 52
        push    eax                                     ; 2397 _ 50
        call    boxfill8                                ; 2398 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 239D _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 23A0 _ 8B. 45, 08
        lea     ebx, [eax+1H]                           ; 23A3 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 23A6 _ 8B. 45, 0C
        lea     ecx, [eax+1H]                           ; 23A9 _ 8D. 48, 01
        mov     edx, dword [ebp+24H]                    ; 23AC _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 23AF _ A1, 00000284(d)
        sub     esp, 8                                  ; 23B4 _ 83. EC, 08
        push    ebx                                     ; 23B7 _ 53
        push    ecx                                     ; 23B8 _ 51
        push    dword [ebp+20H]                         ; 23B9 _ FF. 75, 20
        push    edx                                     ; 23BC _ 52
        push    dword [ebp-14H]                         ; 23BD _ FF. 75, EC
        push    eax                                     ; 23C0 _ 50
        call    sheet_refresh                           ; 23C1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 23C6 _ 83. C4, 20
        jmp     ?_169                                   ; 23C9 _ E9, 000003D2

?_140:  cmp     dword [ebp+1CH], 11                     ; 23CE _ 83. 7D, 1C, 0B
        jnz     ?_141                                   ; 23D2 _ 75, 28
        mov     eax, dword [ebp+18H]                    ; 23D4 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 23D7 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 23DA _ 8B. 45, EC
        mov     edx, dword [eax]                        ; 23DD _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 23DF _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 23E2 _ 8B. 40, 04
        imul    eax, dword [ebp+8H]                     ; 23E5 _ 0F AF. 45, 08
        mov     ecx, eax                                ; 23E9 _ 89. C1
        mov     eax, dword [ebp+0CH]                    ; 23EB _ 8B. 45, 0C
        add     eax, ecx                                ; 23EE _ 01. C8
        add     eax, edx                                ; 23F0 _ 01. D0
        mov     edx, dword [ebp+24H]                    ; 23F2 _ 8B. 55, 24
        mov     byte [eax], dl                          ; 23F5 _ 88. 10
        jmp     ?_169                                   ; 23F7 _ E9, 000003A4

?_141:  cmp     dword [ebp+1CH], 12                     ; 23FC _ 83. 7D, 1C, 0C
        jnz     ?_142                                   ; 2400 _ 75, 2C
        mov     eax, dword [ebp+18H]                    ; 2402 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 2405 _ 89. 45, EC
        mov     edx, dword [ebp+24H]                    ; 2408 _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 240B _ A1, 00000284(d)
        sub     esp, 8                                  ; 2410 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 2413 _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 2416 _ FF. 75, 0C
        push    dword [ebp+20H]                         ; 2419 _ FF. 75, 20
        push    edx                                     ; 241C _ 52
        push    dword [ebp-14H]                         ; 241D _ FF. 75, EC
        push    eax                                     ; 2420 _ 50
        call    sheet_refresh                           ; 2421 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2426 _ 83. C4, 20
        jmp     ?_169                                   ; 2429 _ E9, 00000372

?_142:  cmp     dword [ebp+1CH], 13                     ; 242E _ 83. 7D, 1C, 0D
        jnz     ?_143                                   ; 2432 _ 75, 29
        mov     eax, dword [ebp+18H]                    ; 2434 _ 8B. 45, 18
        mov     dword [ebp-14H], eax                    ; 2437 _ 89. 45, EC
        mov     eax, dword [ebp+24H]                    ; 243A _ 8B. 45, 24
        sub     esp, 8                                  ; 243D _ 83. EC, 08
        push    dword [ebp+10H]                         ; 2440 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2443 _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 2446 _ FF. 75, 0C
        push    dword [ebp+20H]                         ; 2449 _ FF. 75, 20
        push    eax                                     ; 244C _ 50
        push    dword [ebp-14H]                         ; 244D _ FF. 75, EC
        call    api_linewin                             ; 2450 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2455 _ 83. C4, 20
        jmp     ?_169                                   ; 2458 _ E9, 00000343

?_143:  cmp     dword [ebp+1CH], 14                     ; 245D _ 83. 7D, 1C, 0E
        jnz     ?_144                                   ; 2461 _ 75, 37
        mov     edx, dword [ebp+18H]                    ; 2463 _ 8B. 55, 18
        mov     eax, dword [shtctl]                     ; 2466 _ A1, 00000284(d)
        sub     esp, 8                                  ; 246B _ 83. EC, 08
        push    edx                                     ; 246E _ 52
        push    eax                                     ; 246F _ 50
        call    sheet_free                              ; 2470 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2475 _ 83. C4, 10
        mov     eax, dword [ebp-10H]                    ; 2478 _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 247B _ 8B. 80, 000000B0
        mov     eax, dword [eax+4H]                     ; 2481 _ 8B. 40, 04
        add     eax, 291                                ; 2484 _ 05, 00000123
        sub     esp, 12                                 ; 2489 _ 83. EC, 0C
        push    eax                                     ; 248C _ 50
        call    cons_putstr                             ; 248D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2492 _ 83. C4, 10
        jmp     ?_169                                   ; 2495 _ E9, 00000306

?_144:  cmp     dword [ebp+1CH], 15                     ; 249A _ 83. 7D, 1C, 0F
        jnz     ?_145                                   ; 249E _ 75, 1A
        mov     eax, dword [ebp+24H]                    ; 24A0 _ 8B. 45, 24
        sub     esp, 4                                  ; 24A3 _ 83. EC, 04
        push    dword [ebp-18H]                         ; 24A6 _ FF. 75, E8
        push    eax                                     ; 24A9 _ 50
        push    dword [ebp-10H]                         ; 24AA _ FF. 75, F0
        call    handle_keyboard                         ; 24AD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 24B2 _ 83. C4, 10
        jmp     ?_169                                   ; 24B5 _ E9, 000002E6

?_145:  cmp     dword [ebp+1CH], 16                     ; 24BA _ 83. 7D, 1C, 10
        jnz     ?_146                                   ; 24BE _ 75, 12
        mov     eax, dword [ebp-18H]                    ; 24C0 _ 8B. 45, E8
        lea     ebx, [eax+1CH]                          ; 24C3 _ 8D. 58, 1C
        call    timer_alloc                             ; 24C6 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 24CB _ 89. 03
        jmp     ?_169                                   ; 24CD _ E9, 000002CE

?_146:  cmp     dword [ebp+1CH], 17                     ; 24D2 _ 83. 7D, 1C, 11
        jnz     ?_147                                   ; 24D6 _ 75, 22
        mov     eax, dword [ebp+24H]                    ; 24D8 _ 8B. 45, 24
        movzx   edx, al                                 ; 24DB _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 24DE _ 8B. 45, F0
        lea     ecx, [eax+10H]                          ; 24E1 _ 8D. 48, 10
        mov     eax, dword [ebp+18H]                    ; 24E4 _ 8B. 45, 18
        sub     esp, 4                                  ; 24E7 _ 83. EC, 04
        push    edx                                     ; 24EA _ 52
        push    ecx                                     ; 24EB _ 51
        push    eax                                     ; 24EC _ 50
        call    timer_init                              ; 24ED _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 24F2 _ 83. C4, 10
        jmp     ?_169                                   ; 24F5 _ E9, 000002A6

?_147:  cmp     dword [ebp+1CH], 18                     ; 24FA _ 83. 7D, 1C, 12
        jnz     ?_148                                   ; 24FE _ 75, 1A
        mov     eax, dword [ebp+24H]                    ; 2500 _ 8B. 45, 24
        mov     edx, eax                                ; 2503 _ 89. C2
        mov     eax, dword [ebp+18H]                    ; 2505 _ 8B. 45, 18
        sub     esp, 8                                  ; 2508 _ 83. EC, 08
        push    edx                                     ; 250B _ 52
        push    eax                                     ; 250C _ 50
        call    timer_settime                           ; 250D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2512 _ 83. C4, 10
        jmp     ?_169                                   ; 2515 _ E9, 00000286

?_148:  cmp     dword [ebp+1CH], 19                     ; 251A _ 83. 7D, 1C, 13
        jnz     ?_149                                   ; 251E _ 75, 14
        mov     eax, dword [ebp+18H]                    ; 2520 _ 8B. 45, 18
        sub     esp, 12                                 ; 2523 _ 83. EC, 0C
        push    eax                                     ; 2526 _ 50
        call    timer_free                              ; 2527 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 252C _ 83. C4, 10
        jmp     ?_169                                   ; 252F _ E9, 0000026C

?_149:  cmp     dword [ebp+1CH], 21                     ; 2534 _ 83. 7D, 1C, 15
        jne     ?_155                                   ; 2538 _ 0F 85, 000000C5
        mov     dword [ebp-0CH], 0                      ; 253E _ C7. 45, F4, 00000000
        jmp     ?_152                                   ; 2545 _ EB, 23

?_150:  mov     eax, dword [ebp-10H]                    ; 2547 _ 8B. 45, F0
        mov     ecx, dword [eax+0CCH]                   ; 254A _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 2550 _ 8B. 55, F4
        mov     eax, edx                                ; 2553 _ 89. D0
        add     eax, eax                                ; 2555 _ 01. C0
        add     eax, edx                                ; 2557 _ 01. D0
        shl     eax, 2                                  ; 2559 _ C1. E0, 02
        add     eax, ecx                                ; 255C _ 01. C8
        mov     eax, dword [eax]                        ; 255E _ 8B. 00
        test    eax, eax                                ; 2560 _ 85. C0
        jnz     ?_151                                   ; 2562 _ 75, 02
        jmp     ?_153                                   ; 2564 _ EB, 0A

?_151:  add     dword [ebp-0CH], 1                      ; 2566 _ 83. 45, F4, 01
?_152:  cmp     dword [ebp-0CH], 7                      ; 256A _ 83. 7D, F4, 07
        jle     ?_150                                   ; 256E _ 7E, D7
?_153:  mov     eax, dword [ebp-10H]                    ; 2570 _ 8B. 45, F0
        mov     ecx, dword [eax+0CCH]                   ; 2573 _ 8B. 88, 000000CC
        mov     edx, dword [ebp-0CH]                    ; 2579 _ 8B. 55, F4
        mov     eax, edx                                ; 257C _ 89. D0
        add     eax, eax                                ; 257E _ 01. C0
        add     eax, edx                                ; 2580 _ 01. D0
        shl     eax, 2                                  ; 2582 _ C1. E0, 02
        add     eax, ecx                                ; 2585 _ 01. C8
        mov     dword [ebp-1CH], eax                    ; 2587 _ 89. 45, E4
        mov     eax, dword [ebp-18H]                    ; 258A _ 8B. 45, E8
        add     eax, 28                                 ; 258D _ 83. C0, 1C
        mov     dword [eax], 0                          ; 2590 _ C7. 00, 00000000
        cmp     dword [ebp-0CH], 7                      ; 2596 _ 83. 7D, F4, 07
        jg      ?_169                                   ; 259A _ 0F 8F, 00000200
        mov     dword [ebp-2CH], 0                      ; 25A0 _ C7. 45, D4, 00000000
        mov     eax, dword [ebp-10H]                    ; 25A7 _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 25AA _ 8B. 80, 000000B0
        mov     edx, dword [eax]                        ; 25B0 _ 8B. 10
        mov     eax, dword [ebp+18H]                    ; 25B2 _ 8B. 45, 18
        add     eax, edx                                ; 25B5 _ 01. D0
        mov     dword [ebp-20H], eax                    ; 25B7 _ 89. 45, E0
        sub     esp, 8                                  ; 25BA _ 83. EC, 08
        lea     eax, [ebp-2CH]                          ; 25BD _ 8D. 45, D4
        push    eax                                     ; 25C0 _ 50
        push    dword [ebp-20H]                         ; 25C1 _ FF. 75, E0
        call    file_loadfile                           ; 25C4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 25C9 _ 83. C4, 10
        mov     eax, dword [ebp-2CH]                    ; 25CC _ 8B. 45, D4
        test    eax, eax                                ; 25CF _ 85. C0
        jz      ?_154                                   ; 25D1 _ 74, 2B
        mov     eax, dword [ebp-18H]                    ; 25D3 _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 25D6 _ 8D. 50, 1C
        mov     eax, dword [ebp-1CH]                    ; 25D9 _ 8B. 45, E4
        mov     dword [edx], eax                        ; 25DC _ 89. 02
        mov     edx, dword [ebp-2CH]                    ; 25DE _ 8B. 55, D4
        mov     eax, dword [ebp-1CH]                    ; 25E1 _ 8B. 45, E4
        mov     dword [eax], edx                        ; 25E4 _ 89. 10
        mov     edx, dword [ebp-24H]                    ; 25E6 _ 8B. 55, DC
        mov     eax, dword [ebp-1CH]                    ; 25E9 _ 8B. 45, E4
        mov     dword [eax+4H], edx                     ; 25EC _ 89. 50, 04
        mov     eax, dword [ebp-1CH]                    ; 25EF _ 8B. 45, E4
        mov     dword [eax+8H], 0                       ; 25F2 _ C7. 40, 08, 00000000
        jmp     ?_169                                   ; 25F9 _ E9, 000001A2

?_154:  jmp     ?_169                                   ; 25FE _ E9, 0000019D

?_155:  cmp     dword [ebp+1CH], 22                     ; 2603 _ 83. 7D, 1C, 16
        jnz     ?_156                                   ; 2607 _ 75, 36
        mov     eax, dword [ebp+24H]                    ; 2609 _ 8B. 45, 24
        mov     dword [ebp-1CH], eax                    ; 260C _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 260F _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 2612 _ 8B. 40, 04
        mov     ecx, eax                                ; 2615 _ 89. C1
        mov     eax, dword [ebp-1CH]                    ; 2617 _ 8B. 45, E4
        mov     eax, dword [eax]                        ; 261A _ 8B. 00
        mov     edx, eax                                ; 261C _ 89. C2
        mov     eax, dword [memman]                     ; 261E _ A1, 00000000(d)
        sub     esp, 4                                  ; 2623 _ 83. EC, 04
        push    ecx                                     ; 2626 _ 51
        push    edx                                     ; 2627 _ 52
        push    eax                                     ; 2628 _ 50
        call    memman_free_4k                          ; 2629 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 262E _ 83. C4, 10
        mov     eax, dword [ebp-1CH]                    ; 2631 _ 8B. 45, E4
        mov     dword [eax], 0                          ; 2634 _ C7. 00, 00000000
        jmp     ?_169                                   ; 263A _ E9, 00000161

?_156:  cmp     dword [ebp+1CH], 23                     ; 263F _ 83. 7D, 1C, 17
        jne     ?_161                                   ; 2643 _ 0F 85, 00000080
        mov     eax, dword [ebp+24H]                    ; 2649 _ 8B. 45, 24
        mov     dword [ebp-1CH], eax                    ; 264C _ 89. 45, E4
        cmp     dword [ebp+20H], 0                      ; 264F _ 83. 7D, 20, 00
        jnz     ?_157                                   ; 2653 _ 75, 0B
        mov     eax, dword [ebp-1CH]                    ; 2655 _ 8B. 45, E4
        mov     edx, dword [ebp+18H]                    ; 2658 _ 8B. 55, 18
        mov     dword [eax+8H], edx                     ; 265B _ 89. 50, 08
        jmp     ?_159                                   ; 265E _ EB, 30

?_157:  cmp     dword [ebp+20H], 1                      ; 2660 _ 83. 7D, 20, 01
        jnz     ?_158                                   ; 2664 _ 75, 13
        mov     eax, dword [ebp-1CH]                    ; 2666 _ 8B. 45, E4
        mov     edx, dword [eax+8H]                     ; 2669 _ 8B. 50, 08
        mov     eax, dword [ebp+18H]                    ; 266C _ 8B. 45, 18
        add     edx, eax                                ; 266F _ 01. C2
        mov     eax, dword [ebp-1CH]                    ; 2671 _ 8B. 45, E4
        mov     dword [eax+8H], edx                     ; 2674 _ 89. 50, 08
        jmp     ?_159                                   ; 2677 _ EB, 17

?_158:  cmp     dword [ebp+20H], 2                      ; 2679 _ 83. 7D, 20, 02
        jnz     ?_159                                   ; 267D _ 75, 11
        mov     eax, dword [ebp-1CH]                    ; 267F _ 8B. 45, E4
        mov     edx, dword [eax+4H]                     ; 2682 _ 8B. 50, 04
        mov     eax, dword [ebp+18H]                    ; 2685 _ 8B. 45, 18
        add     edx, eax                                ; 2688 _ 01. C2
        mov     eax, dword [ebp-1CH]                    ; 268A _ 8B. 45, E4
        mov     dword [eax+8H], edx                     ; 268D _ 89. 50, 08
?_159:  mov     eax, dword [ebp-1CH]                    ; 2690 _ 8B. 45, E4
        mov     eax, dword [eax+8H]                     ; 2693 _ 8B. 40, 08
        test    eax, eax                                ; 2696 _ 85. C0
        jns     ?_160                                   ; 2698 _ 79, 0A
        mov     eax, dword [ebp-1CH]                    ; 269A _ 8B. 45, E4
        mov     dword [eax+8H], 0                       ; 269D _ C7. 40, 08, 00000000
?_160:  mov     eax, dword [ebp-1CH]                    ; 26A4 _ 8B. 45, E4
        mov     edx, dword [eax+8H]                     ; 26A7 _ 8B. 50, 08
        mov     eax, dword [ebp-1CH]                    ; 26AA _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 26AD _ 8B. 40, 04
        cmp     edx, eax                                ; 26B0 _ 39. C2
        jle     ?_169                                   ; 26B2 _ 0F 8E, 000000E8
        mov     eax, dword [ebp-1CH]                    ; 26B8 _ 8B. 45, E4
        mov     edx, dword [eax+4H]                     ; 26BB _ 8B. 50, 04
        mov     eax, dword [ebp-1CH]                    ; 26BE _ 8B. 45, E4
        mov     dword [eax+8H], edx                     ; 26C1 _ 89. 50, 08
        jmp     ?_169                                   ; 26C4 _ E9, 000000D7

?_161:  cmp     dword [ebp+1CH], 24                     ; 26C9 _ 83. 7D, 1C, 18
        jnz     ?_164                                   ; 26CD _ 75, 5C
        mov     eax, dword [ebp+24H]                    ; 26CF _ 8B. 45, 24
        mov     dword [ebp-1CH], eax                    ; 26D2 _ 89. 45, E4
        cmp     dword [ebp+20H], 0                      ; 26D5 _ 83. 7D, 20, 00
        jnz     ?_162                                   ; 26D9 _ 75, 13
        mov     eax, dword [ebp-18H]                    ; 26DB _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 26DE _ 8D. 50, 1C
        mov     eax, dword [ebp-1CH]                    ; 26E1 _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 26E4 _ 8B. 40, 04
        mov     dword [edx], eax                        ; 26E7 _ 89. 02
        jmp     ?_169                                   ; 26E9 _ E9, 000000B2

?_162:  cmp     dword [ebp+20H], 1                      ; 26EE _ 83. 7D, 20, 01
        jnz     ?_163                                   ; 26F2 _ 75, 13
        mov     eax, dword [ebp-18H]                    ; 26F4 _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 26F7 _ 8D. 50, 1C
        mov     eax, dword [ebp-1CH]                    ; 26FA _ 8B. 45, E4
        mov     eax, dword [eax+8H]                     ; 26FD _ 8B. 40, 08
        mov     dword [edx], eax                        ; 2700 _ 89. 02
        jmp     ?_169                                   ; 2702 _ E9, 00000099

?_163:  cmp     dword [ebp+20H], 2                      ; 2707 _ 83. 7D, 20, 02
        jne     ?_169                                   ; 270B _ 0F 85, 0000008F
        mov     eax, dword [ebp-18H]                    ; 2711 _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 2714 _ 8D. 50, 1C
        mov     eax, dword [ebp-1CH]                    ; 2717 _ 8B. 45, E4
        mov     ecx, dword [eax+8H]                     ; 271A _ 8B. 48, 08
        mov     eax, dword [ebp-1CH]                    ; 271D _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 2720 _ 8B. 40, 04
        sub     ecx, eax                                ; 2723 _ 29. C1
        mov     eax, ecx                                ; 2725 _ 89. C8
        mov     dword [edx], eax                        ; 2727 _ 89. 02
        jmp     ?_169                                   ; 2729 _ EB, 75

?_164:  cmp     dword [ebp+1CH], 25                     ; 272B _ 83. 7D, 1C, 19
        jnz     ?_169                                   ; 272F _ 75, 6F
        mov     eax, dword [ebp+24H]                    ; 2731 _ 8B. 45, 24
        mov     dword [ebp-1CH], eax                    ; 2734 _ 89. 45, E4
        mov     dword [ebp-0CH], 0                      ; 2737 _ C7. 45, F4, 00000000
        jmp     ?_167                                   ; 273E _ EB, 4D

?_165:  mov     eax, dword [ebp-1CH]                    ; 2740 _ 8B. 45, E4
        mov     edx, dword [eax+8H]                     ; 2743 _ 8B. 50, 08
        mov     eax, dword [ebp-1CH]                    ; 2746 _ 8B. 45, E4
        mov     eax, dword [eax+4H]                     ; 2749 _ 8B. 40, 04
        cmp     edx, eax                                ; 274C _ 39. C2
        jnz     ?_166                                   ; 274E _ 75, 02
        jmp     ?_168                                   ; 2750 _ EB, 43

?_166:  mov     eax, dword [ebp-10H]                    ; 2752 _ 8B. 45, F0
        mov     eax, dword [eax+0B0H]                   ; 2755 _ 8B. 80, 000000B0
        mov     eax, dword [eax+4H]                     ; 275B _ 8B. 40, 04
        mov     ecx, dword [ebp+18H]                    ; 275E _ 8B. 4D, 18
        mov     edx, dword [ebp-0CH]                    ; 2761 _ 8B. 55, F4
        add     edx, ecx                                ; 2764 _ 01. CA
        add     edx, eax                                ; 2766 _ 01. C2
        mov     eax, dword [ebp-1CH]                    ; 2768 _ 8B. 45, E4
        mov     ecx, dword [eax]                        ; 276B _ 8B. 08
        mov     eax, dword [ebp-1CH]                    ; 276D _ 8B. 45, E4
        mov     eax, dword [eax+8H]                     ; 2770 _ 8B. 40, 08
        add     eax, ecx                                ; 2773 _ 01. C8
        movzx   eax, byte [eax]                         ; 2775 _ 0F B6. 00
        mov     byte [edx], al                          ; 2778 _ 88. 02
        mov     eax, dword [ebp-1CH]                    ; 277A _ 8B. 45, E4
        mov     eax, dword [eax+8H]                     ; 277D _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2780 _ 8D. 50, 01
        mov     eax, dword [ebp-1CH]                    ; 2783 _ 8B. 45, E4
        mov     dword [eax+8H], edx                     ; 2786 _ 89. 50, 08
        add     dword [ebp-0CH], 1                      ; 2789 _ 83. 45, F4, 01
?_167:  mov     eax, dword [ebp-0CH]                    ; 278D _ 8B. 45, F4
        cmp     eax, dword [ebp+20H]                    ; 2790 _ 3B. 45, 20
        jl      ?_165                                   ; 2793 _ 7C, AB
?_168:  mov     eax, dword [ebp-18H]                    ; 2795 _ 8B. 45, E8
        lea     edx, [eax+1CH]                          ; 2798 _ 8D. 50, 1C
        mov     eax, dword [ebp-0CH]                    ; 279B _ 8B. 45, F4
        mov     dword [edx], eax                        ; 279E _ 89. 02
?_169:  mov     eax, 0                                  ; 27A0 _ B8, 00000000
?_170:  mov     ebx, dword [ebp-4H]                     ; 27A5 _ 8B. 5D, FC
        leave                                           ; 27A8 _ C9
        ret                                             ; 27A9 _ C3
; kernel_api End of function

cons_putchar:; Function begin
        push    ebp                                     ; 27AA _ 55
        mov     ebp, esp                                ; 27AB _ 89. E5
        push    esi                                     ; 27AD _ 56
        push    ebx                                     ; 27AE _ 53
        sub     esp, 32                                 ; 27AF _ 83. EC, 20
        mov     edx, dword [ebp+8H]                     ; 27B2 _ 8B. 55, 08
        mov     eax, dword [ebp+0CH]                    ; 27B5 _ 8B. 45, 0C
        mov     byte [ebp-1CH], dl                      ; 27B8 _ 88. 55, E4
        mov     byte [ebp-20H], al                      ; 27BB _ 88. 45, E0
        call    task_now                                ; 27BE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 27C3 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 27C6 _ 8B. 45, F4
        mov     ebx, dword [eax+9CH]                    ; 27C9 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 27CF _ 8B. 45, F4
        mov     ecx, dword [eax+98H]                    ; 27D2 _ 8B. 88, 00000098
        mov     eax, dword [ebp-0CH]                    ; 27D8 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 27DB _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 27E1 _ A1, 00000284(d)
        sub     esp, 12                                 ; 27E6 _ 83. EC, 0C
        push    0                                       ; 27E9 _ 6A, 00
        push    ebx                                     ; 27EB _ 53
        push    ecx                                     ; 27EC _ 51
        push    edx                                     ; 27ED _ 52
        push    eax                                     ; 27EE _ 50
        call    set_cursor                              ; 27EF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 27F4 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 27F7 _ 8B. 45, F4
        movzx   edx, byte [ebp-1CH]                     ; 27FA _ 0F B6. 55, E4
        mov     byte [eax+0A4H], dl                     ; 27FE _ 88. 90, 000000A4
        mov     eax, dword [ebp-0CH]                    ; 2804 _ 8B. 45, F4
        mov     byte [eax+0A5H], 0                      ; 2807 _ C6. 80, 000000A5, 00
        mov     eax, dword [ebp-0CH]                    ; 280E _ 8B. 45, F4
        lea     esi, [eax+0A4H]                         ; 2811 _ 8D. B0, 000000A4
        mov     eax, dword [ebp-0CH]                    ; 2817 _ 8B. 45, F4
        mov     ebx, dword [eax+9CH]                    ; 281A _ 8B. 98, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 2820 _ 8B. 45, F4
        mov     ecx, dword [eax+98H]                    ; 2823 _ 8B. 88, 00000098
        mov     eax, dword [ebp-0CH]                    ; 2829 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 282C _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 2832 _ A1, 00000284(d)
        sub     esp, 8                                  ; 2837 _ 83. EC, 08
        push    esi                                     ; 283A _ 56
        push    7                                       ; 283B _ 6A, 07
        push    ebx                                     ; 283D _ 53
        push    ecx                                     ; 283E _ 51
        push    edx                                     ; 283F _ 52
        push    eax                                     ; 2840 _ 50
        call    showString                              ; 2841 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2846 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 2849 _ 8B. 45, F4
        mov     eax, dword [eax+98H]                    ; 284C _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 2852 _ 8D. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2855 _ 8B. 45, F4
        mov     dword [eax+98H], edx                    ; 2858 _ 89. 90, 00000098
        lea     esp, [ebp-8H]                           ; 285E _ 8D. 65, F8
        pop     ebx                                     ; 2861 _ 5B
        pop     esi                                     ; 2862 _ 5E
        pop     ebp                                     ; 2863 _ 5D
        ret                                             ; 2864 _ C3
; cons_putchar End of function

cons_newline:; Function begin
        push    ebp                                     ; 2865 _ 55
        mov     ebp, esp                                ; 2866 _ 89. E5
        push    ebx                                     ; 2868 _ 53
        sub     esp, 20                                 ; 2869 _ 83. EC, 14
        cmp     dword [ebp+0CH], 0                      ; 286C _ 83. 7D, 0C, 00
        jnz     ?_171                                   ; 2870 _ 75, 06
        nop                                             ; 2872 _ 90
        jmp     ?_182                                   ; 2873 _ E9, 00000102

?_171:  cmp     dword [ebp+8H], 139                     ; 2878 _ 81. 7D, 08, 0000008B
        jg      ?_172                                   ; 287F _ 7F, 09
        add     dword [ebp+8H], 16                      ; 2881 _ 83. 45, 08, 10
        jmp     ?_181                                   ; 2885 _ E9, 000000CD

?_172:  mov     dword [ebp-10H], 28                     ; 288A _ C7. 45, F0, 0000001C
        jmp     ?_176                                   ; 2891 _ EB, 52

?_173:  mov     dword [ebp-0CH], 8                      ; 2893 _ C7. 45, F4, 00000008
        jmp     ?_175                                   ; 289A _ EB, 3C

?_174:  mov     eax, dword [ebp+0CH]                    ; 289C _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 289F _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 28A1 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 28A4 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 28A7 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 28AB _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 28AD _ 8B. 45, F4
        add     eax, ecx                                ; 28B0 _ 01. C8
        add     edx, eax                                ; 28B2 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 28B4 _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 28B7 _ 8B. 08
        mov     eax, dword [ebp-10H]                    ; 28B9 _ 8B. 45, F0
        lea     ebx, [eax+10H]                          ; 28BC _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 28BF _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 28C2 _ 8B. 40, 04
        imul    ebx, eax                                ; 28C5 _ 0F AF. D8
        mov     eax, dword [ebp-0CH]                    ; 28C8 _ 8B. 45, F4
        add     eax, ebx                                ; 28CB _ 01. D8
        add     eax, ecx                                ; 28CD _ 01. C8
        movzx   eax, byte [eax]                         ; 28CF _ 0F B6. 00
        mov     byte [edx], al                          ; 28D2 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 28D4 _ 83. 45, F4, 01
?_175:  cmp     dword [ebp-0CH], 247                    ; 28D8 _ 81. 7D, F4, 000000F7
        jle     ?_174                                   ; 28DF _ 7E, BB
        add     dword [ebp-10H], 1                      ; 28E1 _ 83. 45, F0, 01
?_176:  cmp     dword [ebp-10H], 139                    ; 28E5 _ 81. 7D, F0, 0000008B
        jle     ?_173                                   ; 28EC _ 7E, A5
        mov     dword [ebp-10H], 140                    ; 28EE _ C7. 45, F0, 0000008C
        jmp     ?_180                                   ; 28F5 _ EB, 35

?_177:  mov     dword [ebp-0CH], 8                      ; 28F7 _ C7. 45, F4, 00000008
        jmp     ?_179                                   ; 28FE _ EB, 1F

?_178:  mov     eax, dword [ebp+0CH]                    ; 2900 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2903 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2905 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2908 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 290B _ 0F AF. 45, F0
        mov     ecx, eax                                ; 290F _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2911 _ 8B. 45, F4
        add     eax, ecx                                ; 2914 _ 01. C8
        add     eax, edx                                ; 2916 _ 01. D0
        mov     byte [eax], 0                           ; 2918 _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 291B _ 83. 45, F4, 01
?_179:  cmp     dword [ebp-0CH], 247                    ; 291F _ 81. 7D, F4, 000000F7
        jle     ?_178                                   ; 2926 _ 7E, D8
        add     dword [ebp-10H], 1                      ; 2928 _ 83. 45, F0, 01
?_180:  cmp     dword [ebp-10H], 155                    ; 292C _ 81. 7D, F0, 0000009B
        jle     ?_177                                   ; 2933 _ 7E, C2
        mov     eax, dword [shtctl]                     ; 2935 _ A1, 00000284(d)
        sub     esp, 8                                  ; 293A _ 83. EC, 08
        push    156                                     ; 293D _ 68, 0000009C
        push    248                                     ; 2942 _ 68, 000000F8
        push    28                                      ; 2947 _ 6A, 1C
        push    8                                       ; 2949 _ 6A, 08
        push    dword [ebp+0CH]                         ; 294B _ FF. 75, 0C
        push    eax                                     ; 294E _ 50
        call    sheet_refresh                           ; 294F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2954 _ 83. C4, 20
?_181:  mov     eax, dword [shtctl]                     ; 2957 _ A1, 00000284(d)
        sub     esp, 8                                  ; 295C _ 83. EC, 08
        push    ?_428                                   ; 295F _ 68, 00000023(d)
        push    7                                       ; 2964 _ 6A, 07
        push    dword [ebp+8H]                          ; 2966 _ FF. 75, 08
        push    8                                       ; 2969 _ 6A, 08
        push    dword [ebp+0CH]                         ; 296B _ FF. 75, 0C
        push    eax                                     ; 296E _ 50
        call    showString                              ; 296F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2974 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 2977 _ 8B. 45, 08
?_182:  mov     ebx, dword [ebp-4H]                     ; 297A _ 8B. 5D, FC
        leave                                           ; 297D _ C9
        ret                                             ; 297E _ C3
; cons_newline End of function

init_screen8:; Function begin
        push    ebp                                     ; 297F _ 55
        mov     ebp, esp                                ; 2980 _ 89. E5
        push    ebx                                     ; 2982 _ 53
        sub     esp, 4                                  ; 2983 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 2986 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 2989 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 298C _ 8B. 45, 0C
        sub     eax, 1                                  ; 298F _ 83. E8, 01
        sub     esp, 4                                  ; 2992 _ 83. EC, 04
        push    edx                                     ; 2995 _ 52
        push    eax                                     ; 2996 _ 50
        push    0                                       ; 2997 _ 6A, 00
        push    0                                       ; 2999 _ 6A, 00
        push    14                                      ; 299B _ 6A, 0E
        push    dword [ebp+0CH]                         ; 299D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 29A0 _ FF. 75, 08
        call    boxfill8                                ; 29A3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 29A8 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 29AB _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 29AE _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 29B1 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 29B4 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 29B7 _ 8B. 45, 10
        sub     eax, 28                                 ; 29BA _ 83. E8, 1C
        sub     esp, 4                                  ; 29BD _ 83. EC, 04
        push    ecx                                     ; 29C0 _ 51
        push    edx                                     ; 29C1 _ 52
        push    eax                                     ; 29C2 _ 50
        push    0                                       ; 29C3 _ 6A, 00
        push    8                                       ; 29C5 _ 6A, 08
        push    dword [ebp+0CH]                         ; 29C7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 29CA _ FF. 75, 08
        call    boxfill8                                ; 29CD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 29D2 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 29D5 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 29D8 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 29DB _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 29DE _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 29E1 _ 8B. 45, 10
        sub     eax, 27                                 ; 29E4 _ 83. E8, 1B
        sub     esp, 4                                  ; 29E7 _ 83. EC, 04
        push    ecx                                     ; 29EA _ 51
        push    edx                                     ; 29EB _ 52
        push    eax                                     ; 29EC _ 50
        push    0                                       ; 29ED _ 6A, 00
        push    7                                       ; 29EF _ 6A, 07
        push    dword [ebp+0CH]                         ; 29F1 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 29F4 _ FF. 75, 08
        call    boxfill8                                ; 29F7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 29FC _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 29FF _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 2A02 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 2A05 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2A08 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2A0B _ 8B. 45, 10
        sub     eax, 26                                 ; 2A0E _ 83. E8, 1A
        sub     esp, 4                                  ; 2A11 _ 83. EC, 04
        push    ecx                                     ; 2A14 _ 51
        push    edx                                     ; 2A15 _ 52
        push    eax                                     ; 2A16 _ 50
        push    0                                       ; 2A17 _ 6A, 00
        push    8                                       ; 2A19 _ 6A, 08
        push    dword [ebp+0CH]                         ; 2A1B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2A1E _ FF. 75, 08
        call    boxfill8                                ; 2A21 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2A26 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2A29 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2A2C _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 2A2F _ 8B. 45, 10
        sub     eax, 24                                 ; 2A32 _ 83. E8, 18
        sub     esp, 4                                  ; 2A35 _ 83. EC, 04
        push    edx                                     ; 2A38 _ 52
        push    59                                      ; 2A39 _ 6A, 3B
        push    eax                                     ; 2A3B _ 50
        push    3                                       ; 2A3C _ 6A, 03
        push    7                                       ; 2A3E _ 6A, 07
        push    dword [ebp+0CH]                         ; 2A40 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2A43 _ FF. 75, 08
        call    boxfill8                                ; 2A46 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2A4B _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2A4E _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 2A51 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2A54 _ 8B. 45, 10
        sub     eax, 24                                 ; 2A57 _ 83. E8, 18
        sub     esp, 4                                  ; 2A5A _ 83. EC, 04
        push    edx                                     ; 2A5D _ 52
        push    2                                       ; 2A5E _ 6A, 02
        push    eax                                     ; 2A60 _ 50
        push    2                                       ; 2A61 _ 6A, 02
        push    7                                       ; 2A63 _ 6A, 07
        push    dword [ebp+0CH]                         ; 2A65 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2A68 _ FF. 75, 08
        call    boxfill8                                ; 2A6B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2A70 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2A73 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 2A76 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2A79 _ 8B. 45, 10
        sub     eax, 4                                  ; 2A7C _ 83. E8, 04
        sub     esp, 4                                  ; 2A7F _ 83. EC, 04
        push    edx                                     ; 2A82 _ 52
        push    59                                      ; 2A83 _ 6A, 3B
        push    eax                                     ; 2A85 _ 50
        push    3                                       ; 2A86 _ 6A, 03
        push    15                                      ; 2A88 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 2A8A _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2A8D _ FF. 75, 08
        call    boxfill8                                ; 2A90 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2A95 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2A98 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 2A9B _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 2A9E _ 8B. 45, 10
        sub     eax, 23                                 ; 2AA1 _ 83. E8, 17
        sub     esp, 4                                  ; 2AA4 _ 83. EC, 04
        push    edx                                     ; 2AA7 _ 52
        push    59                                      ; 2AA8 _ 6A, 3B
        push    eax                                     ; 2AAA _ 50
        push    59                                      ; 2AAB _ 6A, 3B
        push    15                                      ; 2AAD _ 6A, 0F
        push    dword [ebp+0CH]                         ; 2AAF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2AB2 _ FF. 75, 08
        call    boxfill8                                ; 2AB5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2ABA _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2ABD _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2AC0 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 2AC3 _ 8B. 45, 10
        sub     eax, 3                                  ; 2AC6 _ 83. E8, 03
        sub     esp, 4                                  ; 2AC9 _ 83. EC, 04
        push    edx                                     ; 2ACC _ 52
        push    59                                      ; 2ACD _ 6A, 3B
        push    eax                                     ; 2ACF _ 50
        push    2                                       ; 2AD0 _ 6A, 02
        push    0                                       ; 2AD2 _ 6A, 00
        push    dword [ebp+0CH]                         ; 2AD4 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2AD7 _ FF. 75, 08
        call    boxfill8                                ; 2ADA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2ADF _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2AE2 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2AE5 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 2AE8 _ 8B. 45, 10
        sub     eax, 24                                 ; 2AEB _ 83. E8, 18
        sub     esp, 4                                  ; 2AEE _ 83. EC, 04
        push    edx                                     ; 2AF1 _ 52
        push    60                                      ; 2AF2 _ 6A, 3C
        push    eax                                     ; 2AF4 _ 50
        push    60                                      ; 2AF5 _ 6A, 3C
        push    0                                       ; 2AF7 _ 6A, 00
        push    dword [ebp+0CH]                         ; 2AF9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2AFC _ FF. 75, 08
        call    boxfill8                                ; 2AFF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2B04 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2B07 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 2B0A _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 2B0D _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 2B10 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 2B13 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2B16 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 2B19 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2B1C _ 83. E8, 2F
        sub     esp, 4                                  ; 2B1F _ 83. EC, 04
        push    ebx                                     ; 2B22 _ 53
        push    ecx                                     ; 2B23 _ 51
        push    edx                                     ; 2B24 _ 52
        push    eax                                     ; 2B25 _ 50
        push    15                                      ; 2B26 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 2B28 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2B2B _ FF. 75, 08
        call    boxfill8                                ; 2B2E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2B33 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2B36 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 2B39 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 2B3C _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 2B3F _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 2B42 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 2B45 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 2B48 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2B4B _ 83. E8, 2F
        sub     esp, 4                                  ; 2B4E _ 83. EC, 04
        push    ebx                                     ; 2B51 _ 53
        push    ecx                                     ; 2B52 _ 51
        push    edx                                     ; 2B53 _ 52
        push    eax                                     ; 2B54 _ 50
        push    15                                      ; 2B55 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 2B57 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2B5A _ FF. 75, 08
        call    boxfill8                                ; 2B5D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2B62 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2B65 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 2B68 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 2B6B _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 2B6E _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 2B71 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2B74 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 2B77 _ 8B. 45, 0C
        sub     eax, 47                                 ; 2B7A _ 83. E8, 2F
        sub     esp, 4                                  ; 2B7D _ 83. EC, 04
        push    ebx                                     ; 2B80 _ 53
        push    ecx                                     ; 2B81 _ 51
        push    edx                                     ; 2B82 _ 52
        push    eax                                     ; 2B83 _ 50
        push    7                                       ; 2B84 _ 6A, 07
        push    dword [ebp+0CH]                         ; 2B86 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2B89 _ FF. 75, 08
        call    boxfill8                                ; 2B8C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2B91 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2B94 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 2B97 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 2B9A _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 2B9D _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 2BA0 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2BA3 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 2BA6 _ 8B. 45, 0C
        sub     eax, 3                                  ; 2BA9 _ 83. E8, 03
        sub     esp, 4                                  ; 2BAC _ 83. EC, 04
        push    ebx                                     ; 2BAF _ 53
        push    ecx                                     ; 2BB0 _ 51
        push    edx                                     ; 2BB1 _ 52
        push    eax                                     ; 2BB2 _ 50
        push    7                                       ; 2BB3 _ 6A, 07
        push    dword [ebp+0CH]                         ; 2BB5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2BB8 _ FF. 75, 08
        call    boxfill8                                ; 2BBB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2BC0 _ 83. C4, 20
        mov     ebx, dword [ebp-4H]                     ; 2BC3 _ 8B. 5D, FC
        leave                                           ; 2BC6 _ C9
        ret                                             ; 2BC7 _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 2BC8 _ 55
        mov     ebp, esp                                ; 2BC9 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 2BCB _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 2BCE _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 2BD1 _ A1, 00000134(d)
        add     eax, edx                                ; 2BD6 _ 01. D0
        mov     dword [mx], eax                         ; 2BD8 _ A3, 00000134(d)
        mov     eax, dword [ebp+10H]                    ; 2BDD _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 2BE0 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 2BE3 _ A1, 00000138(d)
        add     eax, edx                                ; 2BE8 _ 01. D0
        mov     dword [my], eax                         ; 2BEA _ A3, 00000138(d)
        mov     eax, dword [mx]                         ; 2BEF _ A1, 00000134(d)
        test    eax, eax                                ; 2BF4 _ 85. C0
        jns     ?_183                                   ; 2BF6 _ 79, 0A
        mov     dword [mx], 0                           ; 2BF8 _ C7. 05, 00000134(d), 00000000
?_183:  mov     eax, dword [my]                         ; 2C02 _ A1, 00000138(d)
        test    eax, eax                                ; 2C07 _ 85. C0
        jns     ?_184                                   ; 2C09 _ 79, 0A
        mov     dword [my], 0                           ; 2C0B _ C7. 05, 00000138(d), 00000000
?_184:  mov     eax, dword [xsize]                      ; 2C15 _ A1, 0000013C(d)
        lea     edx, [eax-1H]                           ; 2C1A _ 8D. 50, FF
        mov     eax, dword [mx]                         ; 2C1D _ A1, 00000134(d)
        cmp     edx, eax                                ; 2C22 _ 39. C2
        jge     ?_185                                   ; 2C24 _ 7D, 0D
        mov     eax, dword [xsize]                      ; 2C26 _ A1, 0000013C(d)
        sub     eax, 1                                  ; 2C2B _ 83. E8, 01
        mov     dword [mx], eax                         ; 2C2E _ A3, 00000134(d)
?_185:  mov     eax, dword [ysize]                      ; 2C33 _ A1, 00000140(d)
        lea     edx, [eax-1H]                           ; 2C38 _ 8D. 50, FF
        mov     eax, dword [my]                         ; 2C3B _ A1, 00000138(d)
        cmp     edx, eax                                ; 2C40 _ 39. C2
        jge     ?_186                                   ; 2C42 _ 7D, 0D
        mov     eax, dword [ysize]                      ; 2C44 _ A1, 00000140(d)
        sub     eax, 1                                  ; 2C49 _ 83. E8, 01
        mov     dword [my], eax                         ; 2C4C _ A3, 00000138(d)
?_186:  pop     ebp                                     ; 2C51 _ 5D
        ret                                             ; 2C52 _ C3
; computeMousePosition End of function

showString:; Function begin
        push    ebp                                     ; 2C53 _ 55
        mov     ebp, esp                                ; 2C54 _ 89. E5
        push    ebx                                     ; 2C56 _ 53
        sub     esp, 36                                 ; 2C57 _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 2C5A _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 2C5D _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 2C60 _ 83. 7D, 08, 00
        jz      ?_187                                   ; 2C64 _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 2C66 _ 83. 7D, 0C, 00
        jnz     ?_188                                   ; 2C6A _ 75, 02
?_187:  jmp     ?_191                                   ; 2C6C _ EB, 78

?_188:  mov     eax, dword [ebp+10H]                    ; 2C6E _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 2C71 _ 89. 45, F4
        mov     dword [ebp-10H], 0                      ; 2C74 _ C7. 45, F0, 00000000
        jmp     ?_190                                   ; 2C7B _ EB, 3E

?_189:  mov     eax, dword [ebp+1CH]                    ; 2C7D _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 2C80 _ 0F B6. 00
        movzx   eax, al                                 ; 2C83 _ 0F B6. C0
        shl     eax, 4                                  ; 2C86 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 2C89 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 2C8F _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 2C93 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 2C96 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2C99 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2C9C _ 8B. 00
        sub     esp, 8                                  ; 2C9E _ 83. EC, 08
        push    ebx                                     ; 2CA1 _ 53
        push    ecx                                     ; 2CA2 _ 51
        push    dword [ebp+14H]                         ; 2CA3 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 2CA6 _ FF. 75, 10
        push    edx                                     ; 2CA9 _ 52
        push    eax                                     ; 2CAA _ 50
        call    showFont8                               ; 2CAB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2CB0 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 2CB3 _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 2CB7 _ 83. 45, 1C, 01
?_190:  mov     eax, dword [ebp+1CH]                    ; 2CBB _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 2CBE _ 0F B6. 00
        test    al, al                                  ; 2CC1 _ 84. C0
        jnz     ?_189                                   ; 2CC3 _ 75, B8
        mov     eax, dword [ebp+14H]                    ; 2CC5 _ 8B. 45, 14
        add     eax, 16                                 ; 2CC8 _ 83. C0, 10
        sub     esp, 8                                  ; 2CCB _ 83. EC, 08
        push    eax                                     ; 2CCE _ 50
        push    dword [ebp+10H]                         ; 2CCF _ FF. 75, 10
        push    dword [ebp+14H]                         ; 2CD2 _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 2CD5 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 2CD8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2CDB _ FF. 75, 08
        call    sheet_refresh                           ; 2CDE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2CE3 _ 83. C4, 20
?_191:  mov     ebx, dword [ebp-4H]                     ; 2CE6 _ 8B. 5D, FC
        leave                                           ; 2CE9 _ C9
        ret                                             ; 2CEA _ C3
; showString End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 2CEB _ 55
        mov     ebp, esp                                ; 2CEC _ 89. E5
        sub     esp, 40                                 ; 2CEE _ 83. EC, 28
        mov     eax, dword [buf_back]                   ; 2CF1 _ A1, 00000144(d)
        mov     dword [ebp-10H], eax                    ; 2CF6 _ 89. 45, F0
        mov     byte [ebp-11H], 0                       ; 2CF9 _ C6. 45, EF, 00
        mov     dword [ebp-18H], 0                      ; 2CFD _ C7. 45, E8, 00000000
        call    io_sti                                  ; 2D04 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 2D09 _ 83. EC, 0C
        push    mouseinfo                               ; 2D0C _ 68, 00000038(d)
        call    fifo8_get                               ; 2D11 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2D16 _ 83. C4, 10
        mov     byte [ebp-11H], al                      ; 2D19 _ 88. 45, EF
        movzx   eax, byte [ebp-11H]                     ; 2D1C _ 0F B6. 45, EF
        sub     esp, 8                                  ; 2D20 _ 83. EC, 08
        push    eax                                     ; 2D23 _ 50
        push    mdec                                    ; 2D24 _ 68, 00000100(d)
        call    mouse_decode                            ; 2D29 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2D2E _ 83. C4, 10
        test    eax, eax                                ; 2D31 _ 85. C0
        je      ?_203                                   ; 2D33 _ 0F 84, 00000317
        sub     esp, 4                                  ; 2D39 _ 83. EC, 04
        push    mdec                                    ; 2D3C _ 68, 00000100(d)
        push    dword [ebp+0CH]                         ; 2D41 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2D44 _ FF. 75, 08
        call    computeMousePosition                    ; 2D47 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2D4C _ 83. C4, 10
        mov     edx, dword [my]                         ; 2D4F _ 8B. 15, 00000138(d)
        mov     eax, dword [mx]                         ; 2D55 _ A1, 00000134(d)
        push    edx                                     ; 2D5A _ 52
        push    eax                                     ; 2D5B _ 50
        push    dword [ebp+10H]                         ; 2D5C _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2D5F _ FF. 75, 08
        call    sheet_slide                             ; 2D62 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2D67 _ 83. C4, 10
        mov     eax, dword [?_455]                      ; 2D6A _ A1, 0000010C(d)
        and     eax, 01H                                ; 2D6F _ 83. E0, 01
        test    eax, eax                                ; 2D72 _ 85. C0
        je      ?_202                                   ; 2D74 _ 0F 84, 000002CC
        mov     eax, dword [mmx]                        ; 2D7A _ A1, 00000158(d)
        test    eax, eax                                ; 2D7F _ 85. C0
        jns     ?_201                                   ; 2D81 _ 0F 89, 00000257
        mov     eax, dword [ebp+8H]                     ; 2D87 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2D8A _ 8B. 40, 10
        sub     eax, 1                                  ; 2D8D _ 83. E8, 01
        mov     dword [ebp-0CH], eax                    ; 2D90 _ 89. 45, F4
        jmp     ?_199                                   ; 2D93 _ E9, 00000238

?_192:  mov     eax, dword [ebp+8H]                     ; 2D98 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2D9B _ 8B. 55, F4
        add     edx, 4                                  ; 2D9E _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2DA1 _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 2DA5 _ 89. 45, E8
        mov     edx, dword [mx]                         ; 2DA8 _ 8B. 15, 00000134(d)
        mov     eax, dword [ebp-18H]                    ; 2DAE _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 2DB1 _ 8B. 40, 0C
        sub     edx, eax                                ; 2DB4 _ 29. C2
        mov     eax, edx                                ; 2DB6 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2DB8 _ 89. 45, E4
        mov     edx, dword [my]                         ; 2DBB _ 8B. 15, 00000138(d)
        mov     eax, dword [ebp-18H]                    ; 2DC1 _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 2DC4 _ 8B. 40, 10
        sub     edx, eax                                ; 2DC7 _ 29. C2
        mov     eax, edx                                ; 2DC9 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 2DCB _ 89. 45, E0
        cmp     dword [ebp-1CH], 0                      ; 2DCE _ 83. 7D, E4, 00
        js      ?_198                                   ; 2DD2 _ 0F 88, 000001F4
        mov     eax, dword [ebp-18H]                    ; 2DD8 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2DDB _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 2DDE _ 3B. 45, E4
        jle     ?_198                                   ; 2DE1 _ 0F 8E, 000001E5
        cmp     dword [ebp-20H], 0                      ; 2DE7 _ 83. 7D, E0, 00
        js      ?_198                                   ; 2DEB _ 0F 88, 000001DB
        mov     eax, dword [ebp-18H]                    ; 2DF1 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 2DF4 _ 8B. 40, 08
        cmp     eax, dword [ebp-20H]                    ; 2DF7 _ 3B. 45, E0
        jle     ?_198                                   ; 2DFA _ 0F 8E, 000001CC
        mov     eax, dword [ebp-18H]                    ; 2E00 _ 8B. 45, E8
        mov     edx, dword [eax]                        ; 2E03 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 2E05 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2E08 _ 8B. 40, 04
        imul    eax, dword [ebp-20H]                    ; 2E0B _ 0F AF. 45, E0
        mov     ecx, eax                                ; 2E0F _ 89. C1
        mov     eax, dword [ebp-1CH]                    ; 2E11 _ 8B. 45, E4
        add     eax, ecx                                ; 2E14 _ 01. C8
        add     eax, edx                                ; 2E16 _ 01. D0
        movzx   eax, byte [eax]                         ; 2E18 _ 0F B6. 00
        movzx   edx, al                                 ; 2E1B _ 0F B6. D0
        mov     eax, dword [ebp-18H]                    ; 2E1E _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 2E21 _ 8B. 40, 14
        cmp     edx, eax                                ; 2E24 _ 39. C2
        je      ?_198                                   ; 2E26 _ 0F 84, 000001A0
        mov     eax, dword [current_console_task]       ; 2E2C _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 2E31 _ 8B. 80, 000000B4
        test    eax, eax                                ; 2E37 _ 85. C0
        jz      ?_193                                   ; 2E39 _ 74, 4A
        mov     eax, dword [current_console_task]       ; 2E3B _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 2E40 _ 8B. 80, 000000B4
        push    0                                       ; 2E46 _ 6A, 00
        push    ?_424                                   ; 2E48 _ 68, 0000000F(d)
        push    eax                                     ; 2E4D _ 50
        push    dword [ebp+8H]                          ; 2E4E _ FF. 75, 08
        call    make_wtitle8                            ; 2E51 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E56 _ 83. C4, 10
        mov     eax, dword [ebp-18H]                    ; 2E59 _ 8B. 45, E8
        mov     ecx, dword [eax+8H]                     ; 2E5C _ 8B. 48, 08
        mov     eax, dword [ebp-18H]                    ; 2E5F _ 8B. 45, E8
        mov     edx, dword [eax+4H]                     ; 2E62 _ 8B. 50, 04
        mov     eax, dword [current_console_task]       ; 2E65 _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 2E6A _ 8B. 80, 000000B4
        sub     esp, 8                                  ; 2E70 _ 83. EC, 08
        push    ecx                                     ; 2E73 _ 51
        push    edx                                     ; 2E74 _ 52
        push    0                                       ; 2E75 _ 6A, 00
        push    0                                       ; 2E77 _ 6A, 00
        push    eax                                     ; 2E79 _ 50
        push    dword [ebp+8H]                          ; 2E7A _ FF. 75, 08
        call    sheet_refresh                           ; 2E7D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2E82 _ 83. C4, 20
?_193:  mov     eax, dword [ebp-18H]                    ; 2E85 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 2E88 _ 8B. 40, 20
        mov     dword [current_console_task], eax       ; 2E8B _ A3, 00000298(d)
        mov     eax, dword [current_console_task]       ; 2E90 _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 2E95 _ 8B. 80, 000000B4
        test    eax, eax                                ; 2E9B _ 85. C0
        jnz     ?_194                                   ; 2E9D _ 75, 1C
        sub     esp, 8                                  ; 2E9F _ 83. EC, 08
        push    ?_440                                   ; 2EA2 _ 68, 00000066(d)
        push    7                                       ; 2EA7 _ 6A, 07
        push    96                                      ; 2EA9 _ 6A, 60
        push    0                                       ; 2EAB _ 6A, 00
        push    dword [ebp+0CH]                         ; 2EAD _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2EB0 _ FF. 75, 08
        call    showString                              ; 2EB3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2EB8 _ 83. C4, 20
?_194:  mov     eax, dword [current_console_task]       ; 2EBB _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 2EC0 _ 8B. 80, 000000B4
        test    eax, eax                                ; 2EC6 _ 85. C0
        jz      ?_195                                   ; 2EC8 _ 74, 41
        mov     eax, dword [current_console_task]       ; 2ECA _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 2ECF _ 8B. 80, 000000B4
        push    1                                       ; 2ED5 _ 6A, 01
        push    ?_424                                   ; 2ED7 _ 68, 0000000F(d)
        push    eax                                     ; 2EDC _ 50
        push    dword [ebp+8H]                          ; 2EDD _ FF. 75, 08
        call    make_wtitle8                            ; 2EE0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2EE5 _ 83. C4, 10
        mov     eax, dword [ebp-18H]                    ; 2EE8 _ 8B. 45, E8
        mov     edx, dword [eax+8H]                     ; 2EEB _ 8B. 50, 08
        mov     eax, dword [ebp-18H]                    ; 2EEE _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2EF1 _ 8B. 40, 04
        sub     esp, 8                                  ; 2EF4 _ 83. EC, 08
        push    edx                                     ; 2EF7 _ 52
        push    eax                                     ; 2EF8 _ 50
        push    0                                       ; 2EF9 _ 6A, 00
        push    0                                       ; 2EFB _ 6A, 00
        push    dword [ebp-18H]                         ; 2EFD _ FF. 75, E8
        push    dword [ebp+8H]                          ; 2F00 _ FF. 75, 08
        call    sheet_refresh                           ; 2F03 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2F08 _ 83. C4, 20
?_195:  mov     eax, dword [ebp+8H]                     ; 2F0B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2F0E _ 8B. 40, 10
        sub     eax, 1                                  ; 2F11 _ 83. E8, 01
        sub     esp, 4                                  ; 2F14 _ 83. EC, 04
        push    eax                                     ; 2F17 _ 50
        push    dword [ebp-18H]                         ; 2F18 _ FF. 75, E8
        push    dword [ebp+8H]                          ; 2F1B _ FF. 75, 08
        call    sheet_updown                            ; 2F1E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2F23 _ 83. C4, 10
        cmp     dword [ebp-1CH], 2                      ; 2F26 _ 83. 7D, E4, 02
        jle     ?_196                                   ; 2F2A _ 7E, 36
        mov     eax, dword [ebp-18H]                    ; 2F2C _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2F2F _ 8B. 40, 04
        sub     eax, 3                                  ; 2F32 _ 83. E8, 03
        cmp     eax, dword [ebp-1CH]                    ; 2F35 _ 3B. 45, E4
        jle     ?_196                                   ; 2F38 _ 7E, 28
        cmp     dword [ebp-20H], 2                      ; 2F3A _ 83. 7D, E0, 02
        jle     ?_196                                   ; 2F3E _ 7E, 22
        cmp     dword [ebp-20H], 20                     ; 2F40 _ 83. 7D, E0, 14
        jg      ?_196                                   ; 2F44 _ 7F, 1C
        mov     eax, dword [mx]                         ; 2F46 _ A1, 00000134(d)
        mov     dword [mmx], eax                        ; 2F4B _ A3, 00000158(d)
        mov     eax, dword [my]                         ; 2F50 _ A1, 00000138(d)
        mov     dword [mmy], eax                        ; 2F55 _ A3, 0000015C(d)
        mov     eax, dword [ebp-18H]                    ; 2F5A _ 8B. 45, E8
        mov     dword [mouse_clicked_sht], eax          ; 2F5D _ A3, 00000290(d)
?_196:  mov     eax, dword [ebp-18H]                    ; 2F62 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2F65 _ 8B. 40, 04
        sub     eax, 21                                 ; 2F68 _ 83. E8, 15
        cmp     eax, dword [ebp-1CH]                    ; 2F6B _ 3B. 45, E4
        jg      ?_197                                   ; 2F6E _ 7F, 5A
        mov     eax, dword [ebp-18H]                    ; 2F70 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2F73 _ 8B. 40, 04
        sub     eax, 5                                  ; 2F76 _ 83. E8, 05
        cmp     eax, dword [ebp-1CH]                    ; 2F79 _ 3B. 45, E4
        jle     ?_197                                   ; 2F7C _ 7E, 4C
        cmp     dword [ebp-20H], 4                      ; 2F7E _ 83. 7D, E0, 04
        jle     ?_197                                   ; 2F82 _ 7E, 46
        cmp     dword [ebp-20H], 18                     ; 2F84 _ 83. 7D, E0, 12
        jg      ?_197                                   ; 2F88 _ 7F, 40
        mov     eax, dword [ebp-18H]                    ; 2F8A _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 2F8D _ 8B. 40, 20
        test    eax, eax                                ; 2F90 _ 85. C0
        jz      ?_197                                   ; 2F92 _ 74, 36
        call    io_cli                                  ; 2F94 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 2F99 _ 83. EC, 08
        push    dword [ebp-18H]                         ; 2F9C _ FF. 75, E8
        push    dword [ebp+8H]                          ; 2F9F _ FF. 75, 08
        call    sheet_free                              ; 2FA2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2FA7 _ 83. C4, 10
        call    get_code32_addr                         ; 2FAA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 2FAF _ 89. 45, DC
        mov     eax, dword [ebp-18H]                    ; 2FB2 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 2FB5 _ 8B. 40, 20
        mov     edx, kill_process                       ; 2FB8 _ BA, 00000000(d)
        sub     edx, dword [ebp-24H]                    ; 2FBD _ 2B. 55, DC
        mov     dword [eax+4CH], edx                    ; 2FC0 _ 89. 50, 4C
        call    io_sti                                  ; 2FC3 _ E8, FFFFFFFC(rel)
        jmp     ?_200                                   ; 2FC8 _ EB, 12

?_197:  jmp     ?_200                                   ; 2FCA _ EB, 10

?_198:  sub     dword [ebp-0CH], 1                      ; 2FCC _ 83. 6D, F4, 01
?_199:  cmp     dword [ebp-0CH], 0                      ; 2FD0 _ 83. 7D, F4, 00
        jg      ?_192                                   ; 2FD4 _ 0F 8F, FFFFFDBE
        jmp     ?_203                                   ; 2FDA _ EB, 74

?_200:  jmp     ?_203                                   ; 2FDC _ EB, 72

?_201:  mov     edx, dword [mx]                         ; 2FDE _ 8B. 15, 00000134(d)
        mov     eax, dword [mmx]                        ; 2FE4 _ A1, 00000158(d)
        sub     edx, eax                                ; 2FE9 _ 29. C2
        mov     eax, edx                                ; 2FEB _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2FED _ 89. 45, E4
        mov     edx, dword [my]                         ; 2FF0 _ 8B. 15, 00000138(d)
        mov     eax, dword [mmy]                        ; 2FF6 _ A1, 0000015C(d)
        sub     edx, eax                                ; 2FFB _ 29. C2
        mov     eax, edx                                ; 2FFD _ 89. D0
        mov     dword [ebp-20H], eax                    ; 2FFF _ 89. 45, E0
        mov     eax, dword [mouse_clicked_sht]          ; 3002 _ A1, 00000290(d)
        mov     edx, dword [eax+10H]                    ; 3007 _ 8B. 50, 10
        mov     eax, dword [ebp-20H]                    ; 300A _ 8B. 45, E0
        lea     ecx, [edx+eax]                          ; 300D _ 8D. 0C 02
        mov     eax, dword [mouse_clicked_sht]          ; 3010 _ A1, 00000290(d)
        mov     edx, dword [eax+0CH]                    ; 3015 _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 3018 _ 8B. 45, E4
        add     edx, eax                                ; 301B _ 01. C2
        mov     eax, dword [mouse_clicked_sht]          ; 301D _ A1, 00000290(d)
        push    ecx                                     ; 3022 _ 51
        push    edx                                     ; 3023 _ 52
        push    eax                                     ; 3024 _ 50
        push    dword [ebp+8H]                          ; 3025 _ FF. 75, 08
        call    sheet_slide                             ; 3028 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 302D _ 83. C4, 10
        mov     eax, dword [mx]                         ; 3030 _ A1, 00000134(d)
        mov     dword [mmx], eax                        ; 3035 _ A3, 00000158(d)
        mov     eax, dword [my]                         ; 303A _ A1, 00000138(d)
        mov     dword [mmy], eax                        ; 303F _ A3, 0000015C(d)
        jmp     ?_203                                   ; 3044 _ EB, 0A

?_202:  mov     dword [mmx], -1                         ; 3046 _ C7. 05, 00000158(d), FFFFFFFF
?_203:  leave                                           ; 3050 _ C9
        ret                                             ; 3051 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 3052 _ 55
        mov     ebp, esp                                ; 3053 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3055 _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 3058 _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 305E _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 3061 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 3067 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 306A _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 3070 _ 5D
        ret                                             ; 3071 _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 3072 _ 55
        mov     ebp, esp                                ; 3073 _ 89. E5
        sub     esp, 680                                ; 3075 _ 81. EC, 000002A8
        sub     esp, 4                                  ; 307B _ 83. EC, 04
        push    table_rgb.2152                          ; 307E _ 68, 00000180(d)
        push    15                                      ; 3083 _ 6A, 0F
        push    0                                       ; 3085 _ 6A, 00
        call    set_palette                             ; 3087 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 308C _ 83. C4, 10
        mov     dword [ebp-14H], 0                      ; 308F _ C7. 45, EC, 00000000
        jmp     ?_209                                   ; 3096 _ E9, 000000EF

?_204:  mov     dword [ebp-10H], 0                      ; 309B _ C7. 45, F0, 00000000
        jmp     ?_208                                   ; 30A2 _ E9, 000000D5

?_205:  mov     dword [ebp-0CH], 0                      ; 30A7 _ C7. 45, F4, 00000000
        jmp     ?_207                                   ; 30AE _ E9, 000000BB

?_206:  mov     edx, dword [ebp-10H]                    ; 30B3 _ 8B. 55, F0
        mov     eax, edx                                ; 30B6 _ 89. D0
        add     eax, eax                                ; 30B8 _ 01. C0
        add     eax, edx                                ; 30BA _ 01. D0
        add     eax, eax                                ; 30BC _ 01. C0
        mov     edx, eax                                ; 30BE _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 30C0 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 30C3 _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 30C6 _ 8B. 55, EC
        mov     eax, edx                                ; 30C9 _ 89. D0
        shl     eax, 3                                  ; 30CB _ C1. E0, 03
        add     eax, edx                                ; 30CE _ 01. D0
        shl     eax, 2                                  ; 30D0 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 30D3 _ 8D. 14 01
        mov     eax, edx                                ; 30D6 _ 89. D0
        add     eax, eax                                ; 30D8 _ 01. C0
        add     edx, eax                                ; 30DA _ 01. C2
        mov     eax, dword [ebp-0CH]                    ; 30DC _ 8B. 45, F4
        mov     ecx, 51                                 ; 30DF _ B9, 00000033
        imul    eax, ecx                                ; 30E4 _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 30E7 _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 30EE _ 8B. 55, F0
        mov     eax, edx                                ; 30F1 _ 89. D0
        add     eax, eax                                ; 30F3 _ 01. C0
        add     eax, edx                                ; 30F5 _ 01. D0
        add     eax, eax                                ; 30F7 _ 01. C0
        mov     edx, eax                                ; 30F9 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 30FB _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 30FE _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 3101 _ 8B. 55, EC
        mov     eax, edx                                ; 3104 _ 89. D0
        shl     eax, 3                                  ; 3106 _ C1. E0, 03
        add     eax, edx                                ; 3109 _ 01. D0
        shl     eax, 2                                  ; 310B _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 310E _ 8D. 14 01
        mov     eax, edx                                ; 3111 _ 89. D0
        add     eax, eax                                ; 3113 _ 01. C0
        add     eax, edx                                ; 3115 _ 01. D0
        lea     edx, [eax+1H]                           ; 3117 _ 8D. 50, 01
        mov     eax, dword [ebp-10H]                    ; 311A _ 8B. 45, F0
        mov     ecx, 51                                 ; 311D _ B9, 00000033
        imul    eax, ecx                                ; 3122 _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 3125 _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 312C _ 8B. 55, F0
        mov     eax, edx                                ; 312F _ 89. D0
        add     eax, eax                                ; 3131 _ 01. C0
        add     eax, edx                                ; 3133 _ 01. D0
        add     eax, eax                                ; 3135 _ 01. C0
        mov     edx, eax                                ; 3137 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3139 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 313C _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 313F _ 8B. 55, EC
        mov     eax, edx                                ; 3142 _ 89. D0
        shl     eax, 3                                  ; 3144 _ C1. E0, 03
        add     eax, edx                                ; 3147 _ 01. D0
        shl     eax, 2                                  ; 3149 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 314C _ 8D. 14 01
        mov     eax, edx                                ; 314F _ 89. D0
        add     eax, eax                                ; 3151 _ 01. C0
        add     eax, edx                                ; 3153 _ 01. D0
        lea     edx, [eax+2H]                           ; 3155 _ 8D. 50, 02
        mov     eax, dword [ebp-14H]                    ; 3158 _ 8B. 45, EC
        mov     ecx, 51                                 ; 315B _ B9, 00000033
        imul    eax, ecx                                ; 3160 _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 3163 _ 88. 84 15, FFFFFD64
        add     dword [ebp-0CH], 1                      ; 316A _ 83. 45, F4, 01
?_207:  cmp     dword [ebp-0CH], 5                      ; 316E _ 83. 7D, F4, 05
        jle     ?_206                                   ; 3172 _ 0F 8E, FFFFFF3B
        add     dword [ebp-10H], 1                      ; 3178 _ 83. 45, F0, 01
?_208:  cmp     dword [ebp-10H], 5                      ; 317C _ 83. 7D, F0, 05
        jle     ?_205                                   ; 3180 _ 0F 8E, FFFFFF21
        add     dword [ebp-14H], 1                      ; 3186 _ 83. 45, EC, 01
?_209:  cmp     dword [ebp-14H], 5                      ; 318A _ 83. 7D, EC, 05
        jle     ?_204                                   ; 318E _ 0F 8E, FFFFFF07
        sub     esp, 4                                  ; 3194 _ 83. EC, 04
        lea     eax, [ebp-29CH]                         ; 3197 _ 8D. 85, FFFFFD64
        push    eax                                     ; 319D _ 50
        push    231                                     ; 319E _ 68, 000000E7
        push    16                                      ; 31A3 _ 6A, 10
        call    set_palette                             ; 31A5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 31AA _ 83. C4, 10
        nop                                             ; 31AD _ 90
        leave                                           ; 31AE _ C9
        ret                                             ; 31AF _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 31B0 _ 55
        mov     ebp, esp                                ; 31B1 _ 89. E5
        sub     esp, 24                                 ; 31B3 _ 83. EC, 18
        call    io_load_eflags                          ; 31B6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 31BB _ 89. 45, F0
        call    io_cli                                  ; 31BE _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 31C3 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 31C6 _ FF. 75, 08
        push    968                                     ; 31C9 _ 68, 000003C8
        call    io_out8                                 ; 31CE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 31D3 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 31D6 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 31D9 _ 89. 45, F4
        jmp     ?_211                                   ; 31DC _ EB, 65

?_210:  mov     eax, dword [ebp+10H]                    ; 31DE _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 31E1 _ 0F B6. 00
        shr     al, 2                                   ; 31E4 _ C0. E8, 02
        movzx   eax, al                                 ; 31E7 _ 0F B6. C0
        sub     esp, 8                                  ; 31EA _ 83. EC, 08
        push    eax                                     ; 31ED _ 50
        push    969                                     ; 31EE _ 68, 000003C9
        call    io_out8                                 ; 31F3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 31F8 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 31FB _ 8B. 45, 10
        add     eax, 1                                  ; 31FE _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 3201 _ 0F B6. 00
        shr     al, 2                                   ; 3204 _ C0. E8, 02
        movzx   eax, al                                 ; 3207 _ 0F B6. C0
        sub     esp, 8                                  ; 320A _ 83. EC, 08
        push    eax                                     ; 320D _ 50
        push    969                                     ; 320E _ 68, 000003C9
        call    io_out8                                 ; 3213 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3218 _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 321B _ 8B. 45, 10
        add     eax, 2                                  ; 321E _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 3221 _ 0F B6. 00
        shr     al, 2                                   ; 3224 _ C0. E8, 02
        movzx   eax, al                                 ; 3227 _ 0F B6. C0
        sub     esp, 8                                  ; 322A _ 83. EC, 08
        push    eax                                     ; 322D _ 50
        push    969                                     ; 322E _ 68, 000003C9
        call    io_out8                                 ; 3233 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3238 _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 323B _ 83. 45, 10, 03
        add     dword [ebp-0CH], 1                      ; 323F _ 83. 45, F4, 01
?_211:  mov     eax, dword [ebp-0CH]                    ; 3243 _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 3246 _ 3B. 45, 0C
        jle     ?_210                                   ; 3249 _ 7E, 93
        sub     esp, 12                                 ; 324B _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 324E _ FF. 75, F0
        call    io_store_eflags                         ; 3251 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3256 _ 83. C4, 10
        nop                                             ; 3259 _ 90
        leave                                           ; 325A _ C9
        ret                                             ; 325B _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 325C _ 55
        mov     ebp, esp                                ; 325D _ 89. E5
        sub     esp, 20                                 ; 325F _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 3262 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 3265 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 3268 _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 326B _ 89. 45, F8
        jmp     ?_215                                   ; 326E _ EB, 33

?_212:  mov     eax, dword [ebp+14H]                    ; 3270 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 3273 _ 89. 45, FC
        jmp     ?_214                                   ; 3276 _ EB, 1F

?_213:  mov     eax, dword [ebp-8H]                     ; 3278 _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 327B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 327F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3281 _ 8B. 45, FC
        add     eax, edx                                ; 3284 _ 01. D0
        mov     edx, eax                                ; 3286 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3288 _ 8B. 45, 08
        add     edx, eax                                ; 328B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 328D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3291 _ 88. 02
        add     dword [ebp-4H], 1                       ; 3293 _ 83. 45, FC, 01
?_214:  mov     eax, dword [ebp-4H]                     ; 3297 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 329A _ 3B. 45, 1C
        jle     ?_213                                   ; 329D _ 7E, D9
        add     dword [ebp-8H], 1                       ; 329F _ 83. 45, F8, 01
?_215:  mov     eax, dword [ebp-8H]                     ; 32A3 _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 32A6 _ 3B. 45, 20
        jle     ?_212                                   ; 32A9 _ 7E, C5
        leave                                           ; 32AB _ C9
        ret                                             ; 32AC _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 32AD _ 55
        mov     ebp, esp                                ; 32AE _ 89. E5
        sub     esp, 20                                 ; 32B0 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 32B3 _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 32B6 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 32B9 _ C7. 45, FC, 00000000
        jmp     ?_225                                   ; 32C0 _ E9, 0000016C

?_216:  mov     edx, dword [ebp-4H]                     ; 32C5 _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 32C8 _ 8B. 45, 1C
        add     eax, edx                                ; 32CB _ 01. D0
        movzx   eax, byte [eax]                         ; 32CD _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 32D0 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 32D3 _ 80. 7D, FB, 00
        jns     ?_217                                   ; 32D7 _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 32D9 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 32DC _ 8B. 45, FC
        add     eax, edx                                ; 32DF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 32E1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 32E5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 32E7 _ 8B. 45, 10
        add     eax, edx                                ; 32EA _ 01. D0
        mov     edx, eax                                ; 32EC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 32EE _ 8B. 45, 08
        add     edx, eax                                ; 32F1 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 32F3 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 32F7 _ 88. 02
?_217:  movsx   eax, byte [ebp-5H]                      ; 32F9 _ 0F BE. 45, FB
        and     eax, 40H                                ; 32FD _ 83. E0, 40
        test    eax, eax                                ; 3300 _ 85. C0
        jz      ?_218                                   ; 3302 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 3304 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 3307 _ 8B. 45, FC
        add     eax, edx                                ; 330A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 330C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3310 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3312 _ 8B. 45, 10
        add     eax, edx                                ; 3315 _ 01. D0
        lea     edx, [eax+1H]                           ; 3317 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 331A _ 8B. 45, 08
        add     edx, eax                                ; 331D _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 331F _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3323 _ 88. 02
?_218:  movsx   eax, byte [ebp-5H]                      ; 3325 _ 0F BE. 45, FB
        and     eax, 20H                                ; 3329 _ 83. E0, 20
        test    eax, eax                                ; 332C _ 85. C0
        jz      ?_219                                   ; 332E _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 3330 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 3333 _ 8B. 45, FC
        add     eax, edx                                ; 3336 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3338 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 333C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 333E _ 8B. 45, 10
        add     eax, edx                                ; 3341 _ 01. D0
        lea     edx, [eax+2H]                           ; 3343 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 3346 _ 8B. 45, 08
        add     edx, eax                                ; 3349 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 334B _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 334F _ 88. 02
?_219:  movsx   eax, byte [ebp-5H]                      ; 3351 _ 0F BE. 45, FB
        and     eax, 10H                                ; 3355 _ 83. E0, 10
        test    eax, eax                                ; 3358 _ 85. C0
        jz      ?_220                                   ; 335A _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 335C _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 335F _ 8B. 45, FC
        add     eax, edx                                ; 3362 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3364 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3368 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 336A _ 8B. 45, 10
        add     eax, edx                                ; 336D _ 01. D0
        lea     edx, [eax+3H]                           ; 336F _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 3372 _ 8B. 45, 08
        add     edx, eax                                ; 3375 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3377 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 337B _ 88. 02
?_220:  movsx   eax, byte [ebp-5H]                      ; 337D _ 0F BE. 45, FB
        and     eax, 08H                                ; 3381 _ 83. E0, 08
        test    eax, eax                                ; 3384 _ 85. C0
        jz      ?_221                                   ; 3386 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 3388 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 338B _ 8B. 45, FC
        add     eax, edx                                ; 338E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3390 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3394 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3396 _ 8B. 45, 10
        add     eax, edx                                ; 3399 _ 01. D0
        lea     edx, [eax+4H]                           ; 339B _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 339E _ 8B. 45, 08
        add     edx, eax                                ; 33A1 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 33A3 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 33A7 _ 88. 02
?_221:  movsx   eax, byte [ebp-5H]                      ; 33A9 _ 0F BE. 45, FB
        and     eax, 04H                                ; 33AD _ 83. E0, 04
        test    eax, eax                                ; 33B0 _ 85. C0
        jz      ?_222                                   ; 33B2 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 33B4 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 33B7 _ 8B. 45, FC
        add     eax, edx                                ; 33BA _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 33BC _ 0F AF. 45, 0C
        mov     edx, eax                                ; 33C0 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 33C2 _ 8B. 45, 10
        add     eax, edx                                ; 33C5 _ 01. D0
        lea     edx, [eax+5H]                           ; 33C7 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 33CA _ 8B. 45, 08
        add     edx, eax                                ; 33CD _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 33CF _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 33D3 _ 88. 02
?_222:  movsx   eax, byte [ebp-5H]                      ; 33D5 _ 0F BE. 45, FB
        and     eax, 02H                                ; 33D9 _ 83. E0, 02
        test    eax, eax                                ; 33DC _ 85. C0
        jz      ?_223                                   ; 33DE _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 33E0 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 33E3 _ 8B. 45, FC
        add     eax, edx                                ; 33E6 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 33E8 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 33EC _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 33EE _ 8B. 45, 10
        add     eax, edx                                ; 33F1 _ 01. D0
        lea     edx, [eax+6H]                           ; 33F3 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 33F6 _ 8B. 45, 08
        add     edx, eax                                ; 33F9 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 33FB _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 33FF _ 88. 02
?_223:  movsx   eax, byte [ebp-5H]                      ; 3401 _ 0F BE. 45, FB
        and     eax, 01H                                ; 3405 _ 83. E0, 01
        test    eax, eax                                ; 3408 _ 85. C0
        jz      ?_224                                   ; 340A _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 340C _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 340F _ 8B. 45, FC
        add     eax, edx                                ; 3412 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3414 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3418 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 341A _ 8B. 45, 10
        add     eax, edx                                ; 341D _ 01. D0
        lea     edx, [eax+7H]                           ; 341F _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 3422 _ 8B. 45, 08
        add     edx, eax                                ; 3425 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3427 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 342B _ 88. 02
?_224:  add     dword [ebp-4H], 1                       ; 342D _ 83. 45, FC, 01
?_225:  cmp     dword [ebp-4H], 15                      ; 3431 _ 83. 7D, FC, 0F
        jle     ?_216                                   ; 3435 _ 0F 8E, FFFFFE8A
        leave                                           ; 343B _ C9
        ret                                             ; 343C _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 343D _ 55
        mov     ebp, esp                                ; 343E _ 89. E5
        sub     esp, 20                                 ; 3440 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 3443 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 3446 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 3449 _ C7. 45, F8, 00000000
        jmp     ?_232                                   ; 3450 _ E9, 000000B1

?_226:  mov     dword [ebp-4H], 0                       ; 3455 _ C7. 45, FC, 00000000
        jmp     ?_231                                   ; 345C _ E9, 00000097

?_227:  mov     eax, dword [ebp-8H]                     ; 3461 _ 8B. 45, F8
        shl     eax, 4                                  ; 3464 _ C1. E0, 04
        mov     edx, eax                                ; 3467 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3469 _ 8B. 45, FC
        add     eax, edx                                ; 346C _ 01. D0
        add     eax, cursor.2212                        ; 346E _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 3473 _ 0F B6. 00
        cmp     al, 42                                  ; 3476 _ 3C, 2A
        jnz     ?_228                                   ; 3478 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 347A _ 8B. 45, F8
        shl     eax, 4                                  ; 347D _ C1. E0, 04
        mov     edx, eax                                ; 3480 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3482 _ 8B. 45, FC
        add     eax, edx                                ; 3485 _ 01. D0
        mov     edx, eax                                ; 3487 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3489 _ 8B. 45, 08
        add     eax, edx                                ; 348C _ 01. D0
        mov     byte [eax], 0                           ; 348E _ C6. 00, 00
?_228:  mov     eax, dword [ebp-8H]                     ; 3491 _ 8B. 45, F8
        shl     eax, 4                                  ; 3494 _ C1. E0, 04
        mov     edx, eax                                ; 3497 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3499 _ 8B. 45, FC
        add     eax, edx                                ; 349C _ 01. D0
        add     eax, cursor.2212                        ; 349E _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 34A3 _ 0F B6. 00
        cmp     al, 79                                  ; 34A6 _ 3C, 4F
        jnz     ?_229                                   ; 34A8 _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 34AA _ 8B. 45, F8
        shl     eax, 4                                  ; 34AD _ C1. E0, 04
        mov     edx, eax                                ; 34B0 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 34B2 _ 8B. 45, FC
        add     eax, edx                                ; 34B5 _ 01. D0
        mov     edx, eax                                ; 34B7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34B9 _ 8B. 45, 08
        add     eax, edx                                ; 34BC _ 01. D0
        mov     byte [eax], 7                           ; 34BE _ C6. 00, 07
?_229:  mov     eax, dword [ebp-8H]                     ; 34C1 _ 8B. 45, F8
        shl     eax, 4                                  ; 34C4 _ C1. E0, 04
        mov     edx, eax                                ; 34C7 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 34C9 _ 8B. 45, FC
        add     eax, edx                                ; 34CC _ 01. D0
        add     eax, cursor.2212                        ; 34CE _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 34D3 _ 0F B6. 00
        cmp     al, 46                                  ; 34D6 _ 3C, 2E
        jnz     ?_230                                   ; 34D8 _ 75, 1A
        mov     eax, dword [ebp-8H]                     ; 34DA _ 8B. 45, F8
        shl     eax, 4                                  ; 34DD _ C1. E0, 04
        mov     edx, eax                                ; 34E0 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 34E2 _ 8B. 45, FC
        add     eax, edx                                ; 34E5 _ 01. D0
        mov     edx, eax                                ; 34E7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34E9 _ 8B. 45, 08
        add     edx, eax                                ; 34EC _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 34EE _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 34F2 _ 88. 02
?_230:  add     dword [ebp-4H], 1                       ; 34F4 _ 83. 45, FC, 01
?_231:  cmp     dword [ebp-4H], 15                      ; 34F8 _ 83. 7D, FC, 0F
        jle     ?_227                                   ; 34FC _ 0F 8E, FFFFFF5F
        add     dword [ebp-8H], 1                       ; 3502 _ 83. 45, F8, 01
?_232:  cmp     dword [ebp-8H], 15                      ; 3506 _ 83. 7D, F8, 0F
        jle     ?_226                                   ; 350A _ 0F 8E, FFFFFF45
        leave                                           ; 3510 _ C9
        ret                                             ; 3511 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 3512 _ 55
        mov     ebp, esp                                ; 3513 _ 89. E5
        sub     esp, 16                                 ; 3515 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3518 _ C7. 45, F8, 00000000
        jmp     ?_236                                   ; 351F _ EB, 50

?_233:  mov     dword [ebp-4H], 0                       ; 3521 _ C7. 45, FC, 00000000
        jmp     ?_235                                   ; 3528 _ EB, 3B

?_234:  mov     edx, dword [ebp+1CH]                    ; 352A _ 8B. 55, 1C
        mov     eax, dword [ebp-8H]                     ; 352D _ 8B. 45, F8
        add     eax, edx                                ; 3530 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3532 _ 0F AF. 45, 0C
        mov     ecx, dword [ebp+18H]                    ; 3536 _ 8B. 4D, 18
        mov     edx, dword [ebp-4H]                     ; 3539 _ 8B. 55, FC
        add     edx, ecx                                ; 353C _ 01. CA
        add     eax, edx                                ; 353E _ 01. D0
        mov     edx, eax                                ; 3540 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3542 _ 8B. 45, 08
        add     edx, eax                                ; 3545 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 3547 _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 354A _ 0F AF. 45, 24
        mov     ecx, eax                                ; 354E _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 3550 _ 8B. 45, FC
        add     eax, ecx                                ; 3553 _ 01. C8
        mov     ecx, eax                                ; 3555 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 3557 _ 8B. 45, 20
        add     eax, ecx                                ; 355A _ 01. C8
        movzx   eax, byte [eax]                         ; 355C _ 0F B6. 00
        mov     byte [edx], al                          ; 355F _ 88. 02
        add     dword [ebp-4H], 1                       ; 3561 _ 83. 45, FC, 01
?_235:  mov     eax, dword [ebp-4H]                     ; 3565 _ 8B. 45, FC
        cmp     eax, dword [ebp+10H]                    ; 3568 _ 3B. 45, 10
        jl      ?_234                                   ; 356B _ 7C, BD
        add     dword [ebp-8H], 1                       ; 356D _ 83. 45, F8, 01
?_236:  mov     eax, dword [ebp-8H]                     ; 3571 _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 3574 _ 3B. 45, 14
        jl      ?_233                                   ; 3577 _ 7C, A8
        leave                                           ; 3579 _ C9
        ret                                             ; 357A _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 357B _ 55
        mov     ebp, esp                                ; 357C _ 89. E5
        sub     esp, 24                                 ; 357E _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 3581 _ A1, 00000014(d)
        mov     dword [ebp-0CH], eax                    ; 3586 _ 89. 45, F4
        movzx   eax, word [?_452]                       ; 3589 _ 0F B7. 05, 00000018(d)
        cwde                                            ; 3590 _ 98
        mov     dword [ebp-10H], eax                    ; 3591 _ 89. 45, F0
        movzx   eax, word [?_453]                       ; 3594 _ 0F B7. 05, 0000001A(d)
        cwde                                            ; 359B _ 98
        mov     dword [ebp-14H], eax                    ; 359C _ 89. 45, EC
        sub     esp, 8                                  ; 359F _ 83. EC, 08
        push    32                                      ; 35A2 _ 6A, 20
        push    32                                      ; 35A4 _ 6A, 20
        call    io_out8                                 ; 35A6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 35AB _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 35AE _ C6. 45, EB, 00
        sub     esp, 12                                 ; 35B2 _ 83. EC, 0C
        push    96                                      ; 35B5 _ 6A, 60
        call    io_in8                                  ; 35B7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 35BC _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 35BF _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 35C2 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 35C6 _ 83. EC, 08
        push    eax                                     ; 35C9 _ 50
        push    keyinfo                                 ; 35CA _ 68, 0000001C(d)
        call    fifo8_put                               ; 35CF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 35D4 _ 83. C4, 10
        nop                                             ; 35D7 _ 90
        leave                                           ; 35D8 _ C9
        ret                                             ; 35D9 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 35DA _ 55
        mov     ebp, esp                                ; 35DB _ 89. E5
        sub     esp, 4                                  ; 35DD _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 35E0 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 35E3 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 35E6 _ 80. 7D, FC, 09
        jle     ?_237                                   ; 35EA _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 35EC _ 0F B6. 45, FC
        add     eax, 55                                 ; 35F0 _ 83. C0, 37
        jmp     ?_238                                   ; 35F3 _ EB, 07

?_237:  movzx   eax, byte [ebp-4H]                      ; 35F5 _ 0F B6. 45, FC
        add     eax, 48                                 ; 35F9 _ 83. C0, 30
?_238:  leave                                           ; 35FC _ C9
        ret                                             ; 35FD _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 35FE _ 55
        mov     ebp, esp                                ; 35FF _ 89. E5
        sub     esp, 20                                 ; 3601 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 3604 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 3607 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 360A _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 3611 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 3615 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 3618 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 361B _ 0F BE. 45, FB
        push    eax                                     ; 361F _ 50
        call    charToHexVal                            ; 3620 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 3625 _ 83. C4, 04
        mov     byte [?_451], al                        ; 3628 _ A2, 00000153(d)
        movzx   eax, byte [ebp-14H]                     ; 362D _ 0F B6. 45, EC
        shr     al, 4                                   ; 3631 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 3634 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 3637 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 363B _ 0F BE. C0
        push    eax                                     ; 363E _ 50
        call    charToHexVal                            ; 363F _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 3644 _ 83. C4, 04
        mov     byte [?_450], al                        ; 3647 _ A2, 00000152(d)
        mov     eax, keyval                             ; 364C _ B8, 00000150(d)
        leave                                           ; 3651 _ C9
        ret                                             ; 3652 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 3653 _ 55
        mov     ebp, esp                                ; 3654 _ 89. E5
        sub     esp, 16                                 ; 3656 _ 83. EC, 10
        mov     byte [str.2260], 48                     ; 3659 _ C6. 05, 000003B4(d), 30
        mov     byte [?_456], 88                        ; 3660 _ C6. 05, 000003B5(d), 58
        mov     byte [?_457], 0                         ; 3667 _ C6. 05, 000003BE(d), 00
        mov     dword [ebp-4H], 2                       ; 366E _ C7. 45, FC, 00000002
        jmp     ?_240                                   ; 3675 _ EB, 0F

?_239:  mov     eax, dword [ebp-4H]                     ; 3677 _ 8B. 45, FC
        add     eax, str.2260                           ; 367A _ 05, 000003B4(d)
        mov     byte [eax], 48                          ; 367F _ C6. 00, 30
        add     dword [ebp-4H], 1                       ; 3682 _ 83. 45, FC, 01
?_240:  cmp     dword [ebp-4H], 9                       ; 3686 _ 83. 7D, FC, 09
        jle     ?_239                                   ; 368A _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 368C _ C7. 45, F8, 00000009
        jmp     ?_244                                   ; 3693 _ EB, 42

?_241:  mov     eax, dword [ebp+8H]                     ; 3695 _ 8B. 45, 08
        and     eax, 0FH                                ; 3698 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 369B _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 369E _ 8B. 45, 08
        shr     eax, 4                                  ; 36A1 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 36A4 _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 36A7 _ 83. 7D, F4, 09
        jle     ?_242                                   ; 36AB _ 7E, 14
        mov     eax, dword [ebp-0CH]                    ; 36AD _ 8B. 45, F4
        add     eax, 55                                 ; 36B0 _ 83. C0, 37
        mov     edx, eax                                ; 36B3 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 36B5 _ 8B. 45, F8
        add     eax, str.2260                           ; 36B8 _ 05, 000003B4(d)
        mov     byte [eax], dl                          ; 36BD _ 88. 10
        jmp     ?_243                                   ; 36BF _ EB, 12

?_242:  mov     eax, dword [ebp-0CH]                    ; 36C1 _ 8B. 45, F4
        add     eax, 48                                 ; 36C4 _ 83. C0, 30
        mov     edx, eax                                ; 36C7 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 36C9 _ 8B. 45, F8
        add     eax, str.2260                           ; 36CC _ 05, 000003B4(d)
        mov     byte [eax], dl                          ; 36D1 _ 88. 10
?_243:  sub     dword [ebp-8H], 1                       ; 36D3 _ 83. 6D, F8, 01
?_244:  cmp     dword [ebp-8H], 1                       ; 36D7 _ 83. 7D, F8, 01
        jle     ?_245                                   ; 36DB _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 36DD _ 83. 7D, 08, 00
        jnz     ?_241                                   ; 36E1 _ 75, B2
?_245:  mov     eax, str.2260                           ; 36E3 _ B8, 000003B4(d)
        leave                                           ; 36E8 _ C9
        ret                                             ; 36E9 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 36EA _ 55
        mov     ebp, esp                                ; 36EB _ 89. E5
        sub     esp, 8                                  ; 36ED _ 83. EC, 08
?_246:  sub     esp, 12                                 ; 36F0 _ 83. EC, 0C
        push    100                                     ; 36F3 _ 6A, 64
        call    io_in8                                  ; 36F5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 36FA _ 83. C4, 10
        and     eax, 02H                                ; 36FD _ 83. E0, 02
        test    eax, eax                                ; 3700 _ 85. C0
        jnz     ?_247                                   ; 3702 _ 75, 02
        jmp     ?_248                                   ; 3704 _ EB, 02

?_247:  jmp     ?_246                                   ; 3706 _ EB, E8

?_248:  leave                                           ; 3708 _ C9
        ret                                             ; 3709 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 370A _ 55
        mov     ebp, esp                                ; 370B _ 89. E5
        sub     esp, 8                                  ; 370D _ 83. EC, 08
        call    wait_KBC_sendready                      ; 3710 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 3715 _ 83. EC, 08
        push    96                                      ; 3718 _ 6A, 60
        push    100                                     ; 371A _ 6A, 64
        call    io_out8                                 ; 371C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3721 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 3724 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 3729 _ 83. EC, 08
        push    71                                      ; 372C _ 6A, 47
        push    96                                      ; 372E _ 6A, 60
        call    io_out8                                 ; 3730 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3735 _ 83. C4, 10
        nop                                             ; 3738 _ 90
        leave                                           ; 3739 _ C9
        ret                                             ; 373A _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 373B _ 55
        mov     ebp, esp                                ; 373C _ 89. E5
        sub     esp, 8                                  ; 373E _ 83. EC, 08
        call    wait_KBC_sendready                      ; 3741 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 3746 _ 83. EC, 08
        push    212                                     ; 3749 _ 68, 000000D4
        push    100                                     ; 374E _ 6A, 64
        call    io_out8                                 ; 3750 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3755 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 3758 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 375D _ 83. EC, 08
        push    244                                     ; 3760 _ 68, 000000F4
        push    96                                      ; 3765 _ 6A, 60
        call    io_out8                                 ; 3767 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 376C _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 376F _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 3772 _ C6. 40, 03, 00
        nop                                             ; 3776 _ 90
        leave                                           ; 3777 _ C9
        ret                                             ; 3778 _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 3779 _ 55
        mov     ebp, esp                                ; 377A _ 89. E5
        sub     esp, 24                                 ; 377C _ 83. EC, 18
        sub     esp, 8                                  ; 377F _ 83. EC, 08
        push    32                                      ; 3782 _ 6A, 20
        push    160                                     ; 3784 _ 68, 000000A0
        call    io_out8                                 ; 3789 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 378E _ 83. C4, 10
        sub     esp, 8                                  ; 3791 _ 83. EC, 08
        push    32                                      ; 3794 _ 6A, 20
        push    32                                      ; 3796 _ 6A, 20
        call    io_out8                                 ; 3798 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 379D _ 83. C4, 10
        sub     esp, 12                                 ; 37A0 _ 83. EC, 0C
        push    96                                      ; 37A3 _ 6A, 60
        call    io_in8                                  ; 37A5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 37AA _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 37AD _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 37B0 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 37B4 _ 83. EC, 08
        push    eax                                     ; 37B7 _ 50
        push    mouseinfo                               ; 37B8 _ 68, 00000038(d)
        call    fifo8_put                               ; 37BD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 37C2 _ 83. C4, 10
        leave                                           ; 37C5 _ C9
        ret                                             ; 37C6 _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 37C7 _ 55
        mov     ebp, esp                                ; 37C8 _ 89. E5
        sub     esp, 4                                  ; 37CA _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 37CD _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 37D0 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 37D3 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 37D6 _ 0F B6. 40, 03
        test    al, al                                  ; 37DA _ 84. C0
        jnz     ?_250                                   ; 37DC _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 37DE _ 80. 7D, FC, FA
        jnz     ?_249                                   ; 37E2 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 37E4 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 37E7 _ C6. 40, 03, 01
?_249:  mov     eax, 0                                  ; 37EB _ B8, 00000000
        jmp     ?_257                                   ; 37F0 _ E9, 0000010F

?_250:  mov     eax, dword [ebp+8H]                     ; 37F5 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 37F8 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 37FC _ 3C, 01
        jnz     ?_252                                   ; 37FE _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 3800 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 3804 _ 25, 000000C8
        cmp     eax, 8                                  ; 3809 _ 83. F8, 08
        jnz     ?_251                                   ; 380C _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 380E _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3811 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 3815 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 3817 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 381A _ C6. 40, 03, 02
?_251:  mov     eax, 0                                  ; 381E _ B8, 00000000
        jmp     ?_257                                   ; 3823 _ E9, 000000DC

?_252:  mov     eax, dword [ebp+8H]                     ; 3828 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 382B _ 0F B6. 40, 03
        cmp     al, 2                                   ; 382F _ 3C, 02
        jnz     ?_253                                   ; 3831 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 3833 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3836 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 383A _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 383D _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 3840 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 3844 _ B8, 00000000
        jmp     ?_257                                   ; 3849 _ E9, 000000B6

?_253:  mov     eax, dword [ebp+8H]                     ; 384E _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3851 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 3855 _ 3C, 03
        jne     ?_256                                   ; 3857 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 385D _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3860 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 3864 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 3867 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 386A _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 386E _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3871 _ 0F B6. 00
        movzx   eax, al                                 ; 3874 _ 0F B6. C0
        and     eax, 07H                                ; 3877 _ 83. E0, 07
        mov     edx, eax                                ; 387A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 387C _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 387F _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3882 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 3885 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 3889 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 388C _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 388F _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3892 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 3895 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 3899 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 389C _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 389F _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 38A2 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 38A5 _ 0F B6. 00
        movzx   eax, al                                 ; 38A8 _ 0F B6. C0
        and     eax, 10H                                ; 38AB _ 83. E0, 10
        test    eax, eax                                ; 38AE _ 85. C0
        jz      ?_254                                   ; 38B0 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 38B2 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 38B5 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 38B8 _ 0D, FFFFFF00
        mov     edx, eax                                ; 38BD _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 38BF _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 38C2 _ 89. 50, 04
?_254:  mov     eax, dword [ebp+8H]                     ; 38C5 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 38C8 _ 0F B6. 00
        movzx   eax, al                                 ; 38CB _ 0F B6. C0
        and     eax, 20H                                ; 38CE _ 83. E0, 20
        test    eax, eax                                ; 38D1 _ 85. C0
        jz      ?_255                                   ; 38D3 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 38D5 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 38D8 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 38DB _ 0D, FFFFFF00
        mov     edx, eax                                ; 38E0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 38E2 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 38E5 _ 89. 50, 08
?_255:  mov     eax, dword [ebp+8H]                     ; 38E8 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 38EB _ 8B. 40, 08
        neg     eax                                     ; 38EE _ F7. D8
        mov     edx, eax                                ; 38F0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 38F2 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 38F5 _ 89. 50, 08
        mov     eax, 1                                  ; 38F8 _ B8, 00000001
        jmp     ?_257                                   ; 38FD _ EB, 05

?_256:  mov     eax, 4294967295                         ; 38FF _ B8, FFFFFFFF
?_257:  leave                                           ; 3904 _ C9
        ret                                             ; 3905 _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 3906 _ 55
        mov     ebp, esp                                ; 3907 _ 89. E5
        sub     esp, 40                                 ; 3909 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 390C _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 3913 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 391A _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 3921 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 3928 _ 8B. 15, 00000140(d)
        mov     eax, dword [ebp+0CH]                    ; 392E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3931 _ 8B. 00
        sub     esp, 4                                  ; 3933 _ 83. EC, 04
        push    edx                                     ; 3936 _ 52
        push    dword [ebp+1CH]                         ; 3937 _ FF. 75, 1C
        push    eax                                     ; 393A _ 50
        call    init_screen8                            ; 393B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3940 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 3943 _ 8B. 45, 20
        movsx   eax, al                                 ; 3946 _ 0F BE. C0
        sub     esp, 8                                  ; 3949 _ 83. EC, 08
        push    ?_441                                   ; 394C _ 68, 00000070(d)
        push    eax                                     ; 3951 _ 50
        push    dword [ebp-10H]                         ; 3952 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 3955 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 3958 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 395B _ FF. 75, 08
        call    showString                              ; 395E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3963 _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 3966 _ 8B. 45, 18
        sub     esp, 12                                 ; 3969 _ 83. EC, 0C
        push    eax                                     ; 396C _ 50
        call    intToHexStr                             ; 396D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3972 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 3975 _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 3978 _ 8B. 45, 20
        movsx   eax, al                                 ; 397B _ 0F BE. C0
        sub     esp, 8                                  ; 397E _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 3981 _ FF. 75, E4
        push    eax                                     ; 3984 _ 50
        push    dword [ebp-10H]                         ; 3985 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 3988 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 398B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 398E _ FF. 75, 08
        call    showString                              ; 3991 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3996 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 3999 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 399D _ 8B. 45, 20
        movsx   eax, al                                 ; 39A0 _ 0F BE. C0
        sub     esp, 8                                  ; 39A3 _ 83. EC, 08
        push    ?_442                                   ; 39A6 _ 68, 0000007A(d)
        push    eax                                     ; 39AB _ 50
        push    dword [ebp-10H]                         ; 39AC _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 39AF _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 39B2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 39B5 _ FF. 75, 08
        call    showString                              ; 39B8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 39BD _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 39C0 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 39C3 _ 8B. 00
        sub     esp, 12                                 ; 39C5 _ 83. EC, 0C
        push    eax                                     ; 39C8 _ 50
        call    intToHexStr                             ; 39C9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 39CE _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 39D1 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 39D4 _ 8B. 45, 20
        movsx   eax, al                                 ; 39D7 _ 0F BE. C0
        sub     esp, 8                                  ; 39DA _ 83. EC, 08
        push    dword [ebp-20H]                         ; 39DD _ FF. 75, E0
        push    eax                                     ; 39E0 _ 50
        push    dword [ebp-10H]                         ; 39E1 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 39E4 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 39E7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 39EA _ FF. 75, 08
        call    showString                              ; 39ED _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 39F2 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 39F5 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 39F9 _ 8B. 45, 20
        movsx   eax, al                                 ; 39FC _ 0F BE. C0
        sub     esp, 8                                  ; 39FF _ 83. EC, 08
        push    ?_443                                   ; 3A02 _ 68, 00000086(d)
        push    eax                                     ; 3A07 _ 50
        push    dword [ebp-10H]                         ; 3A08 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 3A0B _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 3A0E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 3A11 _ FF. 75, 08
        call    showString                              ; 3A14 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3A19 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 3A1C _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 3A1F _ 8B. 40, 04
        sub     esp, 12                                 ; 3A22 _ 83. EC, 0C
        push    eax                                     ; 3A25 _ 50
        call    intToHexStr                             ; 3A26 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3A2B _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 3A2E _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 3A31 _ 8B. 45, 20
        movsx   eax, al                                 ; 3A34 _ 0F BE. C0
        sub     esp, 8                                  ; 3A37 _ 83. EC, 08
        push    dword [ebp-24H]                         ; 3A3A _ FF. 75, DC
        push    eax                                     ; 3A3D _ 50
        push    dword [ebp-10H]                         ; 3A3E _ FF. 75, F0
        push    dword [ebp-14H]                         ; 3A41 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 3A44 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 3A47 _ FF. 75, 08
        call    showString                              ; 3A4A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3A4F _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 3A52 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 3A56 _ 8B. 45, 20
        movsx   eax, al                                 ; 3A59 _ 0F BE. C0
        sub     esp, 8                                  ; 3A5C _ 83. EC, 08
        push    ?_444                                   ; 3A5F _ 68, 00000092(d)
        push    eax                                     ; 3A64 _ 50
        push    dword [ebp-10H]                         ; 3A65 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 3A68 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 3A6B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 3A6E _ FF. 75, 08
        call    showString                              ; 3A71 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3A76 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 3A79 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 3A7C _ 8B. 40, 08
        sub     esp, 12                                 ; 3A7F _ 83. EC, 0C
        push    eax                                     ; 3A82 _ 50
        call    intToHexStr                             ; 3A83 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3A88 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 3A8B _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 3A8E _ 8B. 45, 20
        movsx   eax, al                                 ; 3A91 _ 0F BE. C0
        sub     esp, 8                                  ; 3A94 _ 83. EC, 08
        push    dword [ebp-28H]                         ; 3A97 _ FF. 75, D8
        push    eax                                     ; 3A9A _ 50
        push    dword [ebp-10H]                         ; 3A9B _ FF. 75, F0
        push    dword [ebp-14H]                         ; 3A9E _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 3AA1 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 3AA4 _ FF. 75, 08
        call    showString                              ; 3AA7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3AAC _ 83. C4, 20
        leave                                           ; 3AAF _ C9
        ret                                             ; 3AB0 _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 3AB1 _ 55
        mov     ebp, esp                                ; 3AB2 _ 89. E5
        sub     esp, 24                                 ; 3AB4 _ 83. EC, 18
        sub     esp, 12                                 ; 3AB7 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 3ABA _ FF. 75, 08
        call    sheet_alloc                             ; 3ABD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3AC2 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 3AC5 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 3AC8 _ A1, 00000000(d)
        sub     esp, 8                                  ; 3ACD _ 83. EC, 08
        push    10880                                   ; 3AD0 _ 68, 00002A80
        push    eax                                     ; 3AD5 _ 50
        call    memman_alloc_4k                         ; 3AD6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3ADB _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 3ADE _ 89. 45, F0
        sub     esp, 12                                 ; 3AE1 _ 83. EC, 0C
        push    -1                                      ; 3AE4 _ 6A, FF
        push    68                                      ; 3AE6 _ 6A, 44
        push    160                                     ; 3AE8 _ 68, 000000A0
        push    dword [ebp-10H]                         ; 3AED _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 3AF0 _ FF. 75, F4
        call    sheet_setbuf                            ; 3AF3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3AF8 _ 83. C4, 20
        push    1                                       ; 3AFB _ 6A, 01
        push    dword [ebp+0CH]                         ; 3AFD _ FF. 75, 0C
        push    dword [ebp-0CH]                         ; 3B00 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 3B03 _ FF. 75, 08
        call    make_window8                            ; 3B06 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3B0B _ 83. C4, 10
        sub     esp, 8                                  ; 3B0E _ 83. EC, 08
        push    7                                       ; 3B11 _ 6A, 07
        push    16                                      ; 3B13 _ 6A, 10
        push    144                                     ; 3B15 _ 68, 00000090
        push    28                                      ; 3B1A _ 6A, 1C
        push    8                                       ; 3B1C _ 6A, 08
        push    dword [ebp-0CH]                         ; 3B1E _ FF. 75, F4
        call    make_textbox8                           ; 3B21 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3B26 _ 83. C4, 20
        push    172                                     ; 3B29 _ 68, 000000AC
        push    260                                     ; 3B2E _ 68, 00000104
        push    dword [ebp-0CH]                         ; 3B33 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 3B36 _ FF. 75, 08
        call    sheet_slide                             ; 3B39 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3B3E _ 83. C4, 10
        sub     esp, 4                                  ; 3B41 _ 83. EC, 04
        push    2                                       ; 3B44 _ 6A, 02
        push    dword [ebp-0CH]                         ; 3B46 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 3B49 _ FF. 75, 08
        call    sheet_updown                            ; 3B4C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3B51 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 3B54 _ 8B. 45, F4
        leave                                           ; 3B57 _ C9
        ret                                             ; 3B58 _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 3B59 _ 55
        mov     ebp, esp                                ; 3B5A _ 89. E5
        push    ebx                                     ; 3B5C _ 53
        sub     esp, 36                                 ; 3B5D _ 83. EC, 24
        mov     eax, dword [ebp+14H]                    ; 3B60 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 3B63 _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 3B66 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3B69 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 3B6C _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 3B6F _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3B72 _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 3B75 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 3B78 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3B7B _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3B7E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3B81 _ 8B. 00
        push    0                                       ; 3B83 _ 6A, 00
        push    edx                                     ; 3B85 _ 52
        push    0                                       ; 3B86 _ 6A, 00
        push    0                                       ; 3B88 _ 6A, 00
        push    8                                       ; 3B8A _ 6A, 08
        push    dword [ebp-0CH]                         ; 3B8C _ FF. 75, F4
        push    eax                                     ; 3B8F _ 50
        call    boxfill8                                ; 3B90 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3B95 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 3B98 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 3B9B _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 3B9E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3BA1 _ 8B. 00
        push    1                                       ; 3BA3 _ 6A, 01
        push    edx                                     ; 3BA5 _ 52
        push    1                                       ; 3BA6 _ 6A, 01
        push    1                                       ; 3BA8 _ 6A, 01
        push    7                                       ; 3BAA _ 6A, 07
        push    dword [ebp-0CH]                         ; 3BAC _ FF. 75, F4
        push    eax                                     ; 3BAF _ 50
        call    boxfill8                                ; 3BB0 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3BB5 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 3BB8 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3BBB _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3BBE _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3BC1 _ 8B. 00
        push    edx                                     ; 3BC3 _ 52
        push    0                                       ; 3BC4 _ 6A, 00
        push    0                                       ; 3BC6 _ 6A, 00
        push    0                                       ; 3BC8 _ 6A, 00
        push    8                                       ; 3BCA _ 6A, 08
        push    dword [ebp-0CH]                         ; 3BCC _ FF. 75, F4
        push    eax                                     ; 3BCF _ 50
        call    boxfill8                                ; 3BD0 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3BD5 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 3BD8 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3BDB _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3BDE _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3BE1 _ 8B. 00
        push    edx                                     ; 3BE3 _ 52
        push    1                                       ; 3BE4 _ 6A, 01
        push    1                                       ; 3BE6 _ 6A, 01
        push    1                                       ; 3BE8 _ 6A, 01
        push    7                                       ; 3BEA _ 6A, 07
        push    dword [ebp-0CH]                         ; 3BEC _ FF. 75, F4
        push    eax                                     ; 3BEF _ 50
        call    boxfill8                                ; 3BF0 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3BF5 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 3BF8 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 3BFB _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 3BFE _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 3C01 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 3C04 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 3C07 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 3C0A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3C0D _ 8B. 00
        push    ebx                                     ; 3C0F _ 53
        push    ecx                                     ; 3C10 _ 51
        push    1                                       ; 3C11 _ 6A, 01
        push    edx                                     ; 3C13 _ 52
        push    15                                      ; 3C14 _ 6A, 0F
        push    dword [ebp-0CH]                         ; 3C16 _ FF. 75, F4
        push    eax                                     ; 3C19 _ 50
        call    boxfill8                                ; 3C1A _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3C1F _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 3C22 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 3C25 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3C28 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3C2B _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 3C2E _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3C31 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3C34 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3C37 _ 8B. 00
        push    ebx                                     ; 3C39 _ 53
        push    ecx                                     ; 3C3A _ 51
        push    0                                       ; 3C3B _ 6A, 00
        push    edx                                     ; 3C3D _ 52
        push    0                                       ; 3C3E _ 6A, 00
        push    dword [ebp-0CH]                         ; 3C40 _ FF. 75, F4
        push    eax                                     ; 3C43 _ 50
        call    boxfill8                                ; 3C44 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3C49 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 3C4C _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 3C4F _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 3C52 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 3C55 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 3C58 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3C5B _ 8B. 00
        push    ecx                                     ; 3C5D _ 51
        push    edx                                     ; 3C5E _ 52
        push    2                                       ; 3C5F _ 6A, 02
        push    2                                       ; 3C61 _ 6A, 02
        push    8                                       ; 3C63 _ 6A, 08
        push    dword [ebp-0CH]                         ; 3C65 _ FF. 75, F4
        push    eax                                     ; 3C68 _ 50
        call    boxfill8                                ; 3C69 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3C6E _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 3C71 _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 3C74 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 3C77 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3C7A _ 8B. 00
        push    20                                      ; 3C7C _ 6A, 14
        push    edx                                     ; 3C7E _ 52
        push    3                                       ; 3C7F _ 6A, 03
        push    3                                       ; 3C81 _ 6A, 03
        push    12                                      ; 3C83 _ 6A, 0C
        push    dword [ebp-0CH]                         ; 3C85 _ FF. 75, F4
        push    eax                                     ; 3C88 _ 50
        call    boxfill8                                ; 3C89 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3C8E _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 3C91 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 3C94 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 3C97 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 3C9A _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 3C9D _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 3CA0 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 3CA3 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3CA6 _ 8B. 00
        push    ebx                                     ; 3CA8 _ 53
        push    ecx                                     ; 3CA9 _ 51
        push    edx                                     ; 3CAA _ 52
        push    1                                       ; 3CAB _ 6A, 01
        push    15                                      ; 3CAD _ 6A, 0F
        push    dword [ebp-0CH]                         ; 3CAF _ FF. 75, F4
        push    eax                                     ; 3CB2 _ 50
        call    boxfill8                                ; 3CB3 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3CB8 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 3CBB _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 3CBE _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3CC1 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3CC4 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 3CC7 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3CCA _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3CCD _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3CD0 _ 8B. 00
        push    ebx                                     ; 3CD2 _ 53
        push    ecx                                     ; 3CD3 _ 51
        push    edx                                     ; 3CD4 _ 52
        push    0                                       ; 3CD5 _ 6A, 00
        push    0                                       ; 3CD7 _ 6A, 00
        push    dword [ebp-0CH]                         ; 3CD9 _ FF. 75, F4
        push    eax                                     ; 3CDC _ 50
        call    boxfill8                                ; 3CDD _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3CE2 _ 83. C4, 1C
        movsx   eax, byte [ebp-1CH]                     ; 3CE5 _ 0F BE. 45, E4
        push    eax                                     ; 3CE9 _ 50
        push    dword [ebp+10H]                         ; 3CEA _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 3CED _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 3CF0 _ FF. 75, 08
        call    make_wtitle8                            ; 3CF3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3CF8 _ 83. C4, 10
        nop                                             ; 3CFB _ 90
        mov     ebx, dword [ebp-4H]                     ; 3CFC _ 8B. 5D, FC
        leave                                           ; 3CFF _ C9
        ret                                             ; 3D00 _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 3D01 _ 55
        mov     ebp, esp                                ; 3D02 _ 89. E5
        push    ebx                                     ; 3D04 _ 53
        sub     esp, 36                                 ; 3D05 _ 83. EC, 24
        mov     eax, dword [ebp+14H]                    ; 3D08 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 3D0B _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 3D0E _ 80. 7D, E4, 00
        jz      ?_258                                   ; 3D12 _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 3D14 _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 3D18 _ C6. 45, ED, 0C
        jmp     ?_259                                   ; 3D1C _ EB, 08

?_258:  mov     byte [ebp-12H], 8                       ; 3D1E _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 3D22 _ C6. 45, ED, 0F
?_259:  mov     eax, dword [ebp+0CH]                    ; 3D26 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3D29 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 3D2C _ 8D. 58, FC
        movzx   eax, byte [ebp-13H]                     ; 3D2F _ 0F B6. 45, ED
        movzx   ecx, al                                 ; 3D33 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 3D36 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 3D39 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 3D3C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3D3F _ 8B. 00
        push    20                                      ; 3D41 _ 6A, 14
        push    ebx                                     ; 3D43 _ 53
        push    3                                       ; 3D44 _ 6A, 03
        push    3                                       ; 3D46 _ 6A, 03
        push    ecx                                     ; 3D48 _ 51
        push    edx                                     ; 3D49 _ 52
        push    eax                                     ; 3D4A _ 50
        call    boxfill8                                ; 3D4B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3D50 _ 83. C4, 1C
        movsx   eax, byte [ebp-12H]                     ; 3D53 _ 0F BE. 45, EE
        sub     esp, 8                                  ; 3D57 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 3D5A _ FF. 75, 10
        push    eax                                     ; 3D5D _ 50
        push    4                                       ; 3D5E _ 6A, 04
        push    24                                      ; 3D60 _ 6A, 18
        push    dword [ebp+0CH]                         ; 3D62 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 3D65 _ FF. 75, 08
        call    showString                              ; 3D68 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3D6D _ 83. C4, 20
        mov     dword [ebp-10H], 0                      ; 3D70 _ C7. 45, F0, 00000000
        jmp     ?_267                                   ; 3D77 _ E9, 00000083

?_260:  mov     dword [ebp-0CH], 0                      ; 3D7C _ C7. 45, F4, 00000000
        jmp     ?_266                                   ; 3D83 _ EB, 70

?_261:  mov     eax, dword [ebp-10H]                    ; 3D85 _ 8B. 45, F0
        shl     eax, 4                                  ; 3D88 _ C1. E0, 04
        mov     edx, eax                                ; 3D8B _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3D8D _ 8B. 45, F4
        add     eax, edx                                ; 3D90 _ 01. D0
        add     eax, closebtn.2331                      ; 3D92 _ 05, 000002C0(d)
        movzx   eax, byte [eax]                         ; 3D97 _ 0F B6. 00
        mov     byte [ebp-11H], al                      ; 3D9A _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 3D9D _ 80. 7D, EF, 40
        jnz     ?_262                                   ; 3DA1 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 3DA3 _ C6. 45, EF, 00
        jmp     ?_265                                   ; 3DA7 _ EB, 1C

?_262:  cmp     byte [ebp-11H], 36                      ; 3DA9 _ 80. 7D, EF, 24
        jnz     ?_263                                   ; 3DAD _ 75, 06
        mov     byte [ebp-11H], 15                      ; 3DAF _ C6. 45, EF, 0F
        jmp     ?_265                                   ; 3DB3 _ EB, 10

?_263:  cmp     byte [ebp-11H], 81                      ; 3DB5 _ 80. 7D, EF, 51
        jnz     ?_264                                   ; 3DB9 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 3DBB _ C6. 45, EF, 08
        jmp     ?_265                                   ; 3DBF _ EB, 04

?_264:  mov     byte [ebp-11H], 7                       ; 3DC1 _ C6. 45, EF, 07
?_265:  mov     eax, dword [ebp+0CH]                    ; 3DC5 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 3DC8 _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 3DCA _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 3DCD _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 3DD0 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3DD3 _ 8B. 40, 04
        imul    ecx, eax                                ; 3DD6 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 3DD9 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3DDC _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 3DDF _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 3DE2 _ 8B. 45, F4
        add     eax, ebx                                ; 3DE5 _ 01. D8
        add     eax, ecx                                ; 3DE7 _ 01. C8
        add     edx, eax                                ; 3DE9 _ 01. C2
        movzx   eax, byte [ebp-11H]                     ; 3DEB _ 0F B6. 45, EF
        mov     byte [edx], al                          ; 3DEF _ 88. 02
        add     dword [ebp-0CH], 1                      ; 3DF1 _ 83. 45, F4, 01
?_266:  cmp     dword [ebp-0CH], 15                     ; 3DF5 _ 83. 7D, F4, 0F
        jle     ?_261                                   ; 3DF9 _ 7E, 8A
        add     dword [ebp-10H], 1                      ; 3DFB _ 83. 45, F0, 01
?_267:  cmp     dword [ebp-10H], 13                     ; 3DFF _ 83. 7D, F0, 0D
        jle     ?_260                                   ; 3E03 _ 0F 8E, FFFFFF73
        mov     ebx, dword [ebp-4H]                     ; 3E09 _ 8B. 5D, FC
        leave                                           ; 3E0C _ C9
        ret                                             ; 3E0D _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 3E0E _ 55
        mov     ebp, esp                                ; 3E0F _ 89. E5
        push    edi                                     ; 3E11 _ 57
        push    esi                                     ; 3E12 _ 56
        push    ebx                                     ; 3E13 _ 53
        sub     esp, 16                                 ; 3E14 _ 83. EC, 10
        mov     edx, dword [ebp+0CH]                    ; 3E17 _ 8B. 55, 0C
        mov     eax, dword [ebp+14H]                    ; 3E1A _ 8B. 45, 14
        add     eax, edx                                ; 3E1D _ 01. D0
        mov     dword [ebp-10H], eax                    ; 3E1F _ 89. 45, F0
        mov     edx, dword [ebp+10H]                    ; 3E22 _ 8B. 55, 10
        mov     eax, dword [ebp+18H]                    ; 3E25 _ 8B. 45, 18
        add     eax, edx                                ; 3E28 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 3E2A _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 3E2D _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 3E30 _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 3E33 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3E36 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 3E39 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3E3C _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 3E3F _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 3E42 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 3E45 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3E48 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3E4B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3E4E _ 8B. 00
        push    edi                                     ; 3E50 _ 57
        push    esi                                     ; 3E51 _ 56
        push    ebx                                     ; 3E52 _ 53
        push    ecx                                     ; 3E53 _ 51
        push    15                                      ; 3E54 _ 6A, 0F
        push    edx                                     ; 3E56 _ 52
        push    eax                                     ; 3E57 _ 50
        call    boxfill8                                ; 3E58 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3E5D _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 3E60 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 3E63 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 3E66 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 3E69 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 3E6C _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3E6F _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 3E72 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 3E75 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 3E78 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3E7B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3E7E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3E81 _ 8B. 00
        push    edi                                     ; 3E83 _ 57
        push    esi                                     ; 3E84 _ 56
        push    ebx                                     ; 3E85 _ 53
        push    ecx                                     ; 3E86 _ 51
        push    15                                      ; 3E87 _ 6A, 0F
        push    edx                                     ; 3E89 _ 52
        push    eax                                     ; 3E8A _ 50
        call    boxfill8                                ; 3E8B _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3E90 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 3E93 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 3E96 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 3E99 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3E9C _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 3E9F _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 3EA2 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 3EA5 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 3EA8 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 3EAB _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3EAE _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3EB1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3EB4 _ 8B. 00
        push    edi                                     ; 3EB6 _ 57
        push    esi                                     ; 3EB7 _ 56
        push    ebx                                     ; 3EB8 _ 53
        push    ecx                                     ; 3EB9 _ 51
        push    7                                       ; 3EBA _ 6A, 07
        push    edx                                     ; 3EBC _ 52
        push    eax                                     ; 3EBD _ 50
        call    boxfill8                                ; 3EBE _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3EC3 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 3EC6 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 3EC9 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 3ECC _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 3ECF _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 3ED2 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3ED5 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 3ED8 _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 3EDB _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 3EDE _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3EE1 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3EE4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3EE7 _ 8B. 00
        push    edi                                     ; 3EE9 _ 57
        push    esi                                     ; 3EEA _ 56
        push    ebx                                     ; 3EEB _ 53
        push    ecx                                     ; 3EEC _ 51
        push    7                                       ; 3EED _ 6A, 07
        push    edx                                     ; 3EEF _ 52
        push    eax                                     ; 3EF0 _ 50
        call    boxfill8                                ; 3EF1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3EF6 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 3EF9 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 3EFC _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 3EFF _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 3F02 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 3F05 _ 8B. 45, 0C
        lea     ecx, [eax-1H]                           ; 3F08 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 3F0B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3F0E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3F11 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3F14 _ 8B. 00
        push    esi                                     ; 3F16 _ 56
        push    dword [ebp-10H]                         ; 3F17 _ FF. 75, F0
        push    ebx                                     ; 3F1A _ 53
        push    ecx                                     ; 3F1B _ 51
        push    0                                       ; 3F1C _ 6A, 00
        push    edx                                     ; 3F1E _ 52
        push    eax                                     ; 3F1F _ 50
        call    boxfill8                                ; 3F20 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3F25 _ 83. C4, 1C
        mov     eax, dword [ebp+0CH]                    ; 3F28 _ 8B. 45, 0C
        lea     esi, [eax-2H]                           ; 3F2B _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 3F2E _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 3F31 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 3F34 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 3F37 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 3F3A _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3F3D _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3F40 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3F43 _ 8B. 00
        push    dword [ebp-14H]                         ; 3F45 _ FF. 75, EC
        push    esi                                     ; 3F48 _ 56
        push    ebx                                     ; 3F49 _ 53
        push    ecx                                     ; 3F4A _ 51
        push    0                                       ; 3F4B _ 6A, 00
        push    edx                                     ; 3F4D _ 52
        push    eax                                     ; 3F4E _ 50
        call    boxfill8                                ; 3F4F _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3F54 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 3F57 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 3F5A _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 3F5D _ 8B. 45, EC
        lea     ebx, [eax+1H]                           ; 3F60 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 3F63 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 3F66 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 3F69 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3F6C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3F6F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3F72 _ 8B. 00
        push    esi                                     ; 3F74 _ 56
        push    dword [ebp-10H]                         ; 3F75 _ FF. 75, F0
        push    ebx                                     ; 3F78 _ 53
        push    ecx                                     ; 3F79 _ 51
        push    8                                       ; 3F7A _ 6A, 08
        push    edx                                     ; 3F7C _ 52
        push    eax                                     ; 3F7D _ 50
        call    boxfill8                                ; 3F7E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3F83 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 3F86 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 3F89 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 3F8C _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3F8F _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 3F92 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 3F95 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 3F98 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 3F9B _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 3F9E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3FA1 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3FA4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3FA7 _ 8B. 00
        push    edi                                     ; 3FA9 _ 57
        push    esi                                     ; 3FAA _ 56
        push    ebx                                     ; 3FAB _ 53
        push    ecx                                     ; 3FAC _ 51
        push    8                                       ; 3FAD _ 6A, 08
        push    edx                                     ; 3FAF _ 52
        push    eax                                     ; 3FB0 _ 50
        call    boxfill8                                ; 3FB1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3FB6 _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 3FB9 _ 8B. 45, 10
        lea     esi, [eax-1H]                           ; 3FBC _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 3FBF _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 3FC2 _ 8D. 58, FF
        mov     eax, dword [ebp+1CH]                    ; 3FC5 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 3FC8 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 3FCB _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3FCE _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3FD1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3FD4 _ 8B. 00
        push    dword [ebp-14H]                         ; 3FD6 _ FF. 75, EC
        push    dword [ebp-10H]                         ; 3FD9 _ FF. 75, F0
        push    esi                                     ; 3FDC _ 56
        push    ebx                                     ; 3FDD _ 53
        push    ecx                                     ; 3FDE _ 51
        push    edx                                     ; 3FDF _ 52
        push    eax                                     ; 3FE0 _ 50
        call    boxfill8                                ; 3FE1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3FE6 _ 83. C4, 1C
        lea     esp, [ebp-0CH]                          ; 3FE9 _ 8D. 65, F4
        pop     ebx                                     ; 3FEC _ 5B
        pop     esi                                     ; 3FED _ 5E
        pop     edi                                     ; 3FEE _ 5F
        pop     ebp                                     ; 3FEF _ 5D
        ret                                             ; 3FF0 _ C3
; make_textbox8 End of function

file_loadfile:; Function begin
        push    ebp                                     ; 3FF1 _ 55
        mov     ebp, esp                                ; 3FF2 _ 89. E5
        sub     esp, 40                                 ; 3FF4 _ 83. EC, 28
        mov     dword [ebp-0CH], 88064                  ; 3FF7 _ C7. 45, F4, 00015800
        mov     eax, dword [memman]                     ; 3FFE _ A1, 00000000(d)
        sub     esp, 8                                  ; 4003 _ 83. EC, 08
        push    13                                      ; 4006 _ 6A, 0D
        push    eax                                     ; 4008 _ 50
        call    memman_alloc                            ; 4009 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 400E _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 4011 _ 89. 45, E4
        jmp     ?_281                                   ; 4014 _ E9, 0000013C

?_268:  mov     dword [ebp-10H], 0                      ; 4019 _ C7. 45, F0, 00000000
        jmp     ?_270                                   ; 4020 _ EB, 0F

?_269:  mov     edx, dword [ebp-10H]                    ; 4022 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 4025 _ 8B. 45, E4
        add     eax, edx                                ; 4028 _ 01. D0
        mov     byte [eax], 0                           ; 402A _ C6. 00, 00
        add     dword [ebp-10H], 1                      ; 402D _ 83. 45, F0, 01
?_270:  cmp     dword [ebp-10H], 11                     ; 4031 _ 83. 7D, F0, 0B
        jle     ?_269                                   ; 4035 _ 7E, EB
        mov     dword [ebp-10H], 0                      ; 4037 _ C7. 45, F0, 00000000
        jmp     ?_274                                   ; 403E _ EB, 2C

?_271:  mov     edx, dword [ebp-0CH]                    ; 4040 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 4043 _ 8B. 45, F0
        add     eax, edx                                ; 4046 _ 01. D0
        movzx   eax, byte [eax]                         ; 4048 _ 0F B6. 00
        test    al, al                                  ; 404B _ 84. C0
        jz      ?_272                                   ; 404D _ 74, 17
        mov     edx, dword [ebp-10H]                    ; 404F _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 4052 _ 8B. 45, E4
        add     eax, edx                                ; 4055 _ 01. D0
        mov     ecx, dword [ebp-0CH]                    ; 4057 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 405A _ 8B. 55, F0
        add     edx, ecx                                ; 405D _ 01. CA
        movzx   edx, byte [edx]                         ; 405F _ 0F B6. 12
        mov     byte [eax], dl                          ; 4062 _ 88. 10
        jmp     ?_273                                   ; 4064 _ EB, 02

?_272:  jmp     ?_275                                   ; 4066 _ EB, 0A

?_273:  add     dword [ebp-10H], 1                      ; 4068 _ 83. 45, F0, 01
?_274:  cmp     dword [ebp-10H], 7                      ; 406C _ 83. 7D, F0, 07
        jle     ?_271                                   ; 4070 _ 7E, CE
?_275:  mov     dword [ebp-14H], 0                      ; 4072 _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 4079 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 407C _ 8B. 45, E4
        add     eax, edx                                ; 407F _ 01. D0
        mov     byte [eax], 46                          ; 4081 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 4084 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 4088 _ C7. 45, EC, 00000000
        jmp     ?_277                                   ; 408F _ EB, 1E

?_276:  mov     edx, dword [ebp-10H]                    ; 4091 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 4094 _ 8B. 45, E4
        add     eax, edx                                ; 4097 _ 01. D0
        mov     ecx, dword [ebp-0CH]                    ; 4099 _ 8B. 4D, F4
        mov     edx, dword [ebp-14H]                    ; 409C _ 8B. 55, EC
        add     edx, ecx                                ; 409F _ 01. CA
        movzx   edx, byte [edx+8H]                      ; 40A1 _ 0F B6. 52, 08
        mov     byte [eax], dl                          ; 40A5 _ 88. 10
        add     dword [ebp-10H], 1                      ; 40A7 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 40AB _ 83. 45, EC, 01
?_277:  cmp     dword [ebp-14H], 2                      ; 40AF _ 83. 7D, EC, 02
        jle     ?_276                                   ; 40B3 _ 7E, DC
        sub     esp, 8                                  ; 40B5 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 40B8 _ FF. 75, E4
        push    dword [ebp+8H]                          ; 40BB _ FF. 75, 08
        call    strcmp                                  ; 40BE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 40C3 _ 83. C4, 10
        cmp     eax, 1                                  ; 40C6 _ 83. F8, 01
        jne     ?_280                                   ; 40C9 _ 0F 85, 00000082
        mov     eax, dword [ebp-0CH]                    ; 40CF _ 8B. 45, F4
        mov     edx, dword [eax+1CH]                    ; 40D2 _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 40D5 _ A1, 00000000(d)
        sub     esp, 8                                  ; 40DA _ 83. EC, 08
        push    edx                                     ; 40DD _ 52
        push    eax                                     ; 40DE _ 50
        call    memman_alloc_4k                         ; 40DF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 40E4 _ 83. C4, 10
        mov     edx, eax                                ; 40E7 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 40E9 _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 40EC _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 40EE _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 40F1 _ 8B. 40, 1C
        mov     edx, eax                                ; 40F4 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 40F6 _ 8B. 45, 0C
        mov     dword [eax+8H], edx                     ; 40F9 _ 89. 50, 08
        mov     dword [ebp-20H], 97280                  ; 40FC _ C7. 45, E0, 00017C00
        mov     eax, dword [ebp-0CH]                    ; 4103 _ 8B. 45, F4
        movzx   eax, word [eax+1AH]                     ; 4106 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 410A _ 0F B7. C0
        shl     eax, 9                                  ; 410D _ C1. E0, 09
        add     dword [ebp-20H], eax                    ; 4110 _ 01. 45, E0
        mov     eax, dword [ebp-0CH]                    ; 4113 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 4116 _ 8B. 40, 1C
        mov     dword [ebp-24H], eax                    ; 4119 _ 89. 45, DC
        mov     dword [ebp-18H], 0                      ; 411C _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 4123 _ C7. 45, E8, 00000000
        jmp     ?_279                                   ; 412A _ EB, 1B

?_278:  mov     eax, dword [ebp+0CH]                    ; 412C _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 412F _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 4131 _ 8B. 45, E8
        add     eax, edx                                ; 4134 _ 01. D0
        mov     ecx, dword [ebp-18H]                    ; 4136 _ 8B. 4D, E8
        mov     edx, dword [ebp-20H]                    ; 4139 _ 8B. 55, E0
        add     edx, ecx                                ; 413C _ 01. CA
        movzx   edx, byte [edx]                         ; 413E _ 0F B6. 12
        mov     byte [eax], dl                          ; 4141 _ 88. 10
        add     dword [ebp-18H], 1                      ; 4143 _ 83. 45, E8, 01
?_279:  mov     eax, dword [ebp-18H]                    ; 4147 _ 8B. 45, E8
        cmp     eax, dword [ebp-24H]                    ; 414A _ 3B. 45, DC
        jl      ?_278                                   ; 414D _ 7C, DD
        jmp     ?_282                                   ; 414F _ EB, 12

?_280:  add     dword [ebp-0CH], 32                     ; 4151 _ 83. 45, F4, 20
?_281:  mov     eax, dword [ebp-0CH]                    ; 4155 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 4158 _ 0F B6. 00
        test    al, al                                  ; 415B _ 84. C0
        jne     ?_268                                   ; 415D _ 0F 85, FFFFFEB6
?_282:  mov     edx, dword [ebp-1CH]                    ; 4163 _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 4166 _ A1, 00000000(d)
        sub     esp, 4                                  ; 416B _ 83. EC, 04
        push    13                                      ; 416E _ 6A, 0D
        push    edx                                     ; 4170 _ 52
        push    eax                                     ; 4171 _ 50
        call    memman_free                             ; 4172 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4177 _ 83. C4, 10
        leave                                           ; 417A _ C9
        ret                                             ; 417B _ C3
; file_loadfile End of function

intHandlerForStackOverFlow:; Function begin
        push    ebp                                     ; 417C _ 55
        mov     ebp, esp                                ; 417D _ 89. E5
        sub     esp, 24                                 ; 417F _ 83. EC, 18
        call    task_now                                ; 4182 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4187 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 418A _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 418D _ C7. 80, 00000098, 00000008
        sub     esp, 12                                 ; 4197 _ 83. EC, 0C
        push    ?_445                                   ; 419A _ 68, 0000009E(d)
        call    cons_putstr                             ; 419F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 41A4 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 41A7 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 41AA _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 41B4 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 41B7 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 41BD _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 41C0 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 41C3 _ 89. 90, 0000009C
        sub     esp, 12                                 ; 41C9 _ 83. EC, 0C
        push    ?_446                                   ; 41CC _ 68, 000000A5(d)
        call    cons_putstr                             ; 41D1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 41D6 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 41D9 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 41DC _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 41E6 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 41E9 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 41EF _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 41F2 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 41F5 _ 89. 90, 0000009C
        mov     eax, dword [ebp+8H]                     ; 41FB _ 8B. 45, 08
        add     eax, 44                                 ; 41FE _ 83. C0, 2C
        mov     eax, dword [eax]                        ; 4201 _ 8B. 00
        sub     esp, 12                                 ; 4203 _ 83. EC, 0C
        push    eax                                     ; 4206 _ 50
        call    intToHexStr                             ; 4207 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 420C _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 420F _ 89. 45, F0
        sub     esp, 12                                 ; 4212 _ 83. EC, 0C
        push    ?_447                                   ; 4215 _ 68, 000000B5(d)
        call    cons_putstr                             ; 421A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 421F _ 83. C4, 10
        sub     esp, 12                                 ; 4222 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 4225 _ FF. 75, F0
        call    cons_putstr                             ; 4228 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 422D _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 4230 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4233 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 423D _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 4240 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4246 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4249 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 424C _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 4252 _ 8B. 45, F4
        add     eax, 48                                 ; 4255 _ 83. C0, 30
        leave                                           ; 4258 _ C9
        ret                                             ; 4259 _ C3
; intHandlerForStackOverFlow End of function

intHandlerForException:; Function begin
        push    ebp                                     ; 425A _ 55
        mov     ebp, esp                                ; 425B _ 89. E5
        sub     esp, 24                                 ; 425D _ 83. EC, 18
        call    task_now                                ; 4260 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4265 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4268 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 426B _ C7. 80, 00000098, 00000008
        sub     esp, 12                                 ; 4275 _ 83. EC, 0C
        push    ?_448                                   ; 4278 _ 68, 000000BC(d)
        call    cons_putstr                             ; 427D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4282 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 4285 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4288 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 4292 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 4295 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 429B _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 429E _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 42A1 _ 89. 90, 0000009C
        sub     esp, 12                                 ; 42A7 _ 83. EC, 0C
        push    ?_449                                   ; 42AA _ 68, 000000C4(d)
        call    cons_putstr                             ; 42AF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 42B4 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 42B7 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 42BA _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 42C0 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 42C3 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 42C6 _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 42CC _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 42CF _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 42D9 _ 8B. 45, F4
        add     eax, 48                                 ; 42DC _ 83. C0, 30
        leave                                           ; 42DF _ C9
        ret                                             ; 42E0 _ C3
; intHandlerForException End of function

memman_init:; Function begin
        push    ebp                                     ; 42E1 _ 55
        mov     ebp, esp                                ; 42E2 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 42E4 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 42E7 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 42ED _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 42F0 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 42F7 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 42FA _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 4301 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 4304 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 430B _ 5D
        ret                                             ; 430C _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 430D _ 55
        mov     ebp, esp                                ; 430E _ 89. E5
        sub     esp, 16                                 ; 4310 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4313 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 431A _ C7. 45, F8, 00000000
        jmp     ?_284                                   ; 4321 _ EB, 14

?_283:  mov     eax, dword [ebp+8H]                     ; 4323 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 4326 _ 8B. 55, F8
        add     edx, 2                                  ; 4329 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 432C _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 4330 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 4333 _ 83. 45, F8, 01
?_284:  mov     eax, dword [ebp+8H]                     ; 4337 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 433A _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 433C _ 3B. 45, F8
        ja      ?_283                                   ; 433F _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 4341 _ 8B. 45, FC
        leave                                           ; 4344 _ C9
        ret                                             ; 4345 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 4346 _ 55
        mov     ebp, esp                                ; 4347 _ 89. E5
        push    ebx                                     ; 4349 _ 53
        sub     esp, 16                                 ; 434A _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 434D _ C7. 45, F4, 00000000
        jmp     ?_290                                   ; 4354 _ E9, 000000BD

?_285:  mov     eax, dword [ebp+8H]                     ; 4359 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 435C _ 8B. 55, F4
        add     edx, 2                                  ; 435F _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4362 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 4366 _ 3B. 45, 0C
        jc      ?_289                                   ; 4369 _ 0F 82, 000000A3
        mov     eax, dword [ebp+8H]                     ; 436F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4372 _ 8B. 55, F4
        add     edx, 2                                  ; 4375 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 4378 _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 437B _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 437E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4381 _ 8B. 55, F4
        add     edx, 2                                  ; 4384 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 4387 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 438A _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 438D _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4390 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4393 _ 8B. 55, F4
        add     edx, 2                                  ; 4396 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 4399 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 439C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 439F _ 8B. 55, F4
        add     edx, 2                                  ; 43A2 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 43A5 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 43A9 _ 2B. 45, 0C
        mov     edx, eax                                ; 43AC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 43AE _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 43B1 _ 8B. 4D, F4
        add     ecx, 2                                  ; 43B4 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 43B7 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 43BB _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 43BE _ 8B. 55, F4
        add     edx, 2                                  ; 43C1 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 43C4 _ 8B. 44 D0, 04
        test    eax, eax                                ; 43C8 _ 85. C0
        jnz     ?_288                                   ; 43CA _ 75, 41
        mov     eax, dword [ebp+8H]                     ; 43CC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 43CF _ 8B. 00
        lea     edx, [eax-1H]                           ; 43D1 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 43D4 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 43D7 _ 89. 10
        jmp     ?_287                                   ; 43D9 _ EB, 28

?_286:  mov     eax, dword [ebp-0CH]                    ; 43DB _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 43DE _ 8D. 50, 01
        mov     ecx, dword [ebp+8H]                     ; 43E1 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 43E4 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 43E7 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 43EA _ 8B. 45, 08
        add     edx, 2                                  ; 43ED _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 43F0 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 43F3 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 43F5 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 43F8 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 43FB _ 89. 54 D9, 04
        add     dword [ebp-0CH], 1                      ; 43FF _ 83. 45, F4, 01
?_287:  mov     eax, dword [ebp+8H]                     ; 4403 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4406 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4408 _ 3B. 45, F4
        ja      ?_286                                   ; 440B _ 77, CE
?_288:  mov     eax, dword [ebp-8H]                     ; 440D _ 8B. 45, F8
        jmp     ?_291                                   ; 4410 _ EB, 17

?_289:  add     dword [ebp-0CH], 1                      ; 4412 _ 83. 45, F4, 01
?_290:  mov     eax, dword [ebp+8H]                     ; 4416 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4419 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 441B _ 3B. 45, F4
        ja      ?_285                                   ; 441E _ 0F 87, FFFFFF35
        mov     eax, 0                                  ; 4424 _ B8, 00000000
?_291:  add     esp, 16                                 ; 4429 _ 83. C4, 10
        pop     ebx                                     ; 442C _ 5B
        pop     ebp                                     ; 442D _ 5D
        ret                                             ; 442E _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 442F _ 55
        mov     ebp, esp                                ; 4430 _ 89. E5
        push    ebx                                     ; 4432 _ 53
        sub     esp, 16                                 ; 4433 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 4436 _ C7. 45, F4, 00000000
        jmp     ?_294                                   ; 443D _ EB, 17

?_292:  mov     eax, dword [ebp+8H]                     ; 443F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4442 _ 8B. 55, F4
        add     edx, 2                                  ; 4445 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 4448 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 444B _ 3B. 45, 0C
        jbe     ?_293                                   ; 444E _ 76, 02
        jmp     ?_295                                   ; 4450 _ EB, 0E

?_293:  add     dword [ebp-0CH], 1                      ; 4452 _ 83. 45, F4, 01
?_294:  mov     eax, dword [ebp+8H]                     ; 4456 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4459 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 445B _ 3B. 45, F4
        jg      ?_292                                   ; 445E _ 7F, DF
?_295:  cmp     dword [ebp-0CH], 0                      ; 4460 _ 83. 7D, F4, 00
        jle     ?_299                                   ; 4464 _ 0F 8E, 000000F2
        mov     eax, dword [ebp-0CH]                    ; 446A _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 446D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4470 _ 8B. 45, 08
        add     edx, 2                                  ; 4473 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 4476 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 4479 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 447C _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 447F _ 8B. 45, 08
        add     ecx, 2                                  ; 4482 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 4485 _ 8B. 44 C8, 04
        add     eax, edx                                ; 4489 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 448B _ 3B. 45, 0C
        jne     ?_299                                   ; 448E _ 0F 85, 000000C8
        mov     eax, dword [ebp-0CH]                    ; 4494 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 4497 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 449A _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 449D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 44A0 _ 8B. 45, 08
        add     edx, 2                                  ; 44A3 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 44A6 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 44AA _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 44AD _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 44B0 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 44B3 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 44B6 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 44BA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 44BD _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 44BF _ 3B. 45, F4
        jle     ?_298                                   ; 44C2 _ 0F 8E, 0000008A
        mov     edx, dword [ebp+0CH]                    ; 44C8 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 44CB _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 44CE _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 44D1 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 44D4 _ 8B. 55, F4
        add     edx, 2                                  ; 44D7 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 44DA _ 8B. 04 D0
        cmp     ecx, eax                                ; 44DD _ 39. C1
        jnz     ?_298                                   ; 44DF _ 75, 71
        mov     eax, dword [ebp-0CH]                    ; 44E1 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 44E4 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 44E7 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 44EA _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 44ED _ 8B. 45, 08
        add     edx, 2                                  ; 44F0 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 44F3 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 44F7 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 44FA _ 8B. 4D, F4
        add     ecx, 2                                  ; 44FD _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 4500 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 4504 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4507 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 450A _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 450D _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 4511 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4514 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4516 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4519 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 451C _ 89. 10
        jmp     ?_297                                   ; 451E _ EB, 28

?_296:  mov     eax, dword [ebp-0CH]                    ; 4520 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 4523 _ 8D. 50, 01
        mov     ecx, dword [ebp+8H]                     ; 4526 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 4529 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 452C _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 452F _ 8B. 45, 08
        add     edx, 2                                  ; 4532 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 4535 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 4538 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 453A _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 453D _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 4540 _ 89. 54 D9, 04
        add     dword [ebp-0CH], 1                      ; 4544 _ 83. 45, F4, 01
?_297:  mov     eax, dword [ebp+8H]                     ; 4548 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 454B _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 454D _ 3B. 45, F4
        jg      ?_296                                   ; 4550 _ 7F, CE
?_298:  mov     eax, 0                                  ; 4552 _ B8, 00000000
        jmp     ?_305                                   ; 4557 _ E9, 0000011C

?_299:  mov     eax, dword [ebp+8H]                     ; 455C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 455F _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4561 _ 3B. 45, F4
        jle     ?_300                                   ; 4564 _ 7E, 52
        mov     edx, dword [ebp+0CH]                    ; 4566 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 4569 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 456C _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 456F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4572 _ 8B. 55, F4
        add     edx, 2                                  ; 4575 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 4578 _ 8B. 04 D0
        cmp     ecx, eax                                ; 457B _ 39. C1
        jnz     ?_300                                   ; 457D _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 457F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4582 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 4585 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 4588 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 458B _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 458E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4591 _ 8B. 55, F4
        add     edx, 2                                  ; 4594 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 4597 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 459B _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 459E _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 45A1 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 45A4 _ 8B. 55, F4
        add     edx, 2                                  ; 45A7 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 45AA _ 89. 4C D0, 04
        mov     eax, 0                                  ; 45AE _ B8, 00000000
        jmp     ?_305                                   ; 45B3 _ E9, 000000C0

?_300:  mov     eax, dword [ebp+8H]                     ; 45B8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 45BB _ 8B. 00
        cmp     eax, 4095                               ; 45BD _ 3D, 00000FFF
        jg      ?_304                                   ; 45C2 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 45C8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 45CB _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 45CD _ 89. 45, F8
        jmp     ?_302                                   ; 45D0 _ EB, 28

?_301:  mov     eax, dword [ebp-8H]                     ; 45D2 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 45D5 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 45D8 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 45DB _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 45DE _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 45E1 _ 8B. 45, 08
        add     edx, 2                                  ; 45E4 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 45E7 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 45EA _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 45EC _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 45EF _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 45F2 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 45F6 _ 83. 6D, F8, 01
?_302:  mov     eax, dword [ebp-8H]                     ; 45FA _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 45FD _ 3B. 45, F4
        jg      ?_301                                   ; 4600 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 4602 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4605 _ 8B. 00
        lea     edx, [eax+1H]                           ; 4607 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 460A _ 8B. 45, 08
        mov     dword [eax], edx                        ; 460D _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 460F _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4612 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4615 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4618 _ 8B. 00
        cmp     edx, eax                                ; 461A _ 39. C2
        jge     ?_303                                   ; 461C _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 461E _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 4621 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 4623 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 4626 _ 89. 50, 04
?_303:  mov     eax, dword [ebp+8H]                     ; 4629 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 462C _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 462F _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 4632 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 4635 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 4638 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 463B _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 463E _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 4641 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 4644 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 4648 _ B8, 00000000
        jmp     ?_305                                   ; 464D _ EB, 29

?_304:  mov     eax, dword [ebp+8H]                     ; 464F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4652 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 4655 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4658 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 465B _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 465E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4661 _ 8B. 40, 08
        mov     edx, eax                                ; 4664 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 4666 _ 8B. 45, 10
        add     eax, edx                                ; 4669 _ 01. D0
        mov     edx, eax                                ; 466B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 466D _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 4670 _ 89. 50, 08
        mov     eax, 4294967295                         ; 4673 _ B8, FFFFFFFF
?_305:  add     esp, 16                                 ; 4678 _ 83. C4, 10
        pop     ebx                                     ; 467B _ 5B
        pop     ebp                                     ; 467C _ 5D
        ret                                             ; 467D _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 467E _ 55
        mov     ebp, esp                                ; 467F _ 89. E5
        sub     esp, 16                                 ; 4681 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 4684 _ 8B. 45, 0C
        add     eax, 4095                               ; 4687 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 468C _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 4691 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 4694 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 4697 _ FF. 75, 08
        call    memman_alloc                            ; 469A _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 469F _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 46A2 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 46A5 _ 8B. 45, FC
        leave                                           ; 46A8 _ C9
        ret                                             ; 46A9 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 46AA _ 55
        mov     ebp, esp                                ; 46AB _ 89. E5
        sub     esp, 16                                 ; 46AD _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 46B0 _ 8B. 45, 10
        add     eax, 4095                               ; 46B3 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 46B8 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 46BD _ 89. 45, 10
        push    dword [ebp+10H]                         ; 46C0 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 46C3 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 46C6 _ FF. 75, 08
        call    memman_free                             ; 46C9 _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 46CE _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 46D1 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 46D4 _ 8B. 45, FC
        leave                                           ; 46D7 _ C9
        ret                                             ; 46D8 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 46D9 _ 55
        mov     ebp, esp                                ; 46DA _ 89. E5
        sub     esp, 24                                 ; 46DC _ 83. EC, 18
        sub     esp, 8                                  ; 46DF _ 83. EC, 08
        push    9232                                    ; 46E2 _ 68, 00002410
        push    dword [ebp+8H]                          ; 46E7 _ FF. 75, 08
        call    memman_alloc_4k                         ; 46EA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 46EF _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 46F2 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 46F5 _ 83. 7D, F4, 00
        jnz     ?_306                                   ; 46F9 _ 75, 0A
        mov     eax, 0                                  ; 46FB _ B8, 00000000
        jmp     ?_310                                   ; 4700 _ E9, 000000BF

?_306:  mov     eax, dword [ebp+10H]                    ; 4705 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 4708 _ 0F AF. 45, 14
        sub     esp, 8                                  ; 470C _ 83. EC, 08
        push    eax                                     ; 470F _ 50
        push    dword [ebp+8H]                          ; 4710 _ FF. 75, 08
        call    memman_alloc_4k                         ; 4713 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4718 _ 83. C4, 10
        mov     edx, eax                                ; 471B _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 471D _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 4720 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 4723 _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 4726 _ 8B. 40, 04
        test    eax, eax                                ; 4729 _ 85. C0
        jnz     ?_307                                   ; 472B _ 75, 1E
        mov     eax, dword [ebp-0CH]                    ; 472D _ 8B. 45, F4
        sub     esp, 4                                  ; 4730 _ 83. EC, 04
        push    9232                                    ; 4733 _ 68, 00002410
        push    eax                                     ; 4738 _ 50
        push    dword [ebp+8H]                          ; 4739 _ FF. 75, 08
        call    memman_free_4k                          ; 473C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4741 _ 83. C4, 10
        mov     eax, 0                                  ; 4744 _ B8, 00000000
        jmp     ?_310                                   ; 4749 _ EB, 79

?_307:  mov     eax, dword [ebp-0CH]                    ; 474B _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 474E _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4751 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 4753 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 4756 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 4759 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 475C _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 475F _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 4762 _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 4765 _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 4768 _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 476F _ C7. 45, F0, 00000000
        jmp     ?_309                                   ; 4776 _ EB, 40

?_308:  mov     ecx, dword [ebp-0CH]                    ; 4778 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 477B _ 8B. 55, F0
        mov     eax, edx                                ; 477E _ 89. D0
        shl     eax, 3                                  ; 4780 _ C1. E0, 03
        add     eax, edx                                ; 4783 _ 01. D0
        shl     eax, 2                                  ; 4785 _ C1. E0, 02
        add     eax, ecx                                ; 4788 _ 01. C8
        add     eax, 1056                               ; 478A _ 05, 00000420
        mov     dword [eax+10H], 0                      ; 478F _ C7. 40, 10, 00000000
        mov     ecx, dword [ebp-0CH]                    ; 4796 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 4799 _ 8B. 55, F0
        mov     eax, edx                                ; 479C _ 89. D0
        shl     eax, 3                                  ; 479E _ C1. E0, 03
        add     eax, edx                                ; 47A1 _ 01. D0
        shl     eax, 2                                  ; 47A3 _ C1. E0, 02
        add     eax, ecx                                ; 47A6 _ 01. C8
        add     eax, 1072                               ; 47A8 _ 05, 00000430
        mov     dword [eax+4H], 0                       ; 47AD _ C7. 40, 04, 00000000
        add     dword [ebp-10H], 1                      ; 47B4 _ 83. 45, F0, 01
?_309:  cmp     dword [ebp-10H], 255                    ; 47B8 _ 81. 7D, F0, 000000FF
        jle     ?_308                                   ; 47BF _ 7E, B7
        mov     eax, dword [ebp-0CH]                    ; 47C1 _ 8B. 45, F4
?_310:  leave                                           ; 47C4 _ C9
        ret                                             ; 47C5 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 47C6 _ 55
        mov     ebp, esp                                ; 47C7 _ 89. E5
        sub     esp, 24                                 ; 47C9 _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 47CC _ C7. 45, F0, 00000000
        jmp     ?_313                                   ; 47D3 _ EB, 66

?_311:  mov     ecx, dword [ebp+8H]                     ; 47D5 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 47D8 _ 8B. 55, F0
        mov     eax, edx                                ; 47DB _ 89. D0
        shl     eax, 3                                  ; 47DD _ C1. E0, 03
        add     eax, edx                                ; 47E0 _ 01. D0
        shl     eax, 2                                  ; 47E2 _ C1. E0, 02
        add     eax, ecx                                ; 47E5 _ 01. C8
        add     eax, 1056                               ; 47E7 _ 05, 00000420
        mov     eax, dword [eax+10H]                    ; 47EC _ 8B. 40, 10
        test    eax, eax                                ; 47EF _ 85. C0
        jnz     ?_312                                   ; 47F1 _ 75, 44
        mov     edx, dword [ebp-10H]                    ; 47F3 _ 8B. 55, F0
        mov     eax, edx                                ; 47F6 _ 89. D0
        shl     eax, 3                                  ; 47F8 _ C1. E0, 03
        add     eax, edx                                ; 47FB _ 01. D0
        shl     eax, 2                                  ; 47FD _ C1. E0, 02
        lea     edx, [eax+410H]                         ; 4800 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 4806 _ 8B. 45, 08
        add     eax, edx                                ; 4809 _ 01. D0
        add     eax, 4                                  ; 480B _ 83. C0, 04
        mov     dword [ebp-0CH], eax                    ; 480E _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4811 _ 8B. 45, F4
        mov     dword [eax+1CH], 1                      ; 4814 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-0CH]                    ; 481B _ 8B. 45, F4
        mov     dword [eax+18H], -1                     ; 481E _ C7. 40, 18, FFFFFFFF
        call    task_now                                ; 4825 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 482A _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 482C _ 8B. 45, F4
        mov     dword [eax+20H], edx                    ; 482F _ 89. 50, 20
        mov     eax, dword [ebp-0CH]                    ; 4832 _ 8B. 45, F4
        jmp     ?_314                                   ; 4835 _ EB, 12

?_312:  add     dword [ebp-10H], 1                      ; 4837 _ 83. 45, F0, 01
?_313:  cmp     dword [ebp-10H], 255                    ; 483B _ 81. 7D, F0, 000000FF
        jle     ?_311                                   ; 4842 _ 7E, 91
        mov     eax, 0                                  ; 4844 _ B8, 00000000
?_314:  leave                                           ; 4849 _ C9
        ret                                             ; 484A _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 484B _ 55
        mov     ebp, esp                                ; 484C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 484E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4851 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4854 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4856 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4859 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 485C _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 485F _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 4862 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 4865 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4868 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 486B _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 486E _ 89. 50, 14
        nop                                             ; 4871 _ 90
        pop     ebp                                     ; 4872 _ 5D
        ret                                             ; 4873 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 4874 _ 55
        mov     ebp, esp                                ; 4875 _ 89. E5
        push    esi                                     ; 4877 _ 56
        push    ebx                                     ; 4878 _ 53
        sub     esp, 16                                 ; 4879 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 487C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 487F _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 4882 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 4885 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4888 _ 8B. 40, 10
        add     eax, 1                                  ; 488B _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 488E _ 3B. 45, 10
        jge     ?_315                                   ; 4891 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 4893 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4896 _ 8B. 40, 10
        add     eax, 1                                  ; 4899 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 489C _ 89. 45, 10
?_315:  cmp     dword [ebp+10H], -1                     ; 489F _ 83. 7D, 10, FF
        jge     ?_316                                   ; 48A3 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 48A5 _ C7. 45, 10, FFFFFFFF
?_316:  mov     eax, dword [ebp+0CH]                    ; 48AC _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 48AF _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 48B2 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 48B5 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 48B8 _ 3B. 45, 10
        jle     ?_323                                   ; 48BB _ 0F 8E, 000001D5
        cmp     dword [ebp+10H], 0                      ; 48C1 _ 83. 7D, 10, 00
        js      ?_319                                   ; 48C5 _ 0F 88, 000000E2
        mov     eax, dword [ebp-0CH]                    ; 48CB _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 48CE _ 89. 45, F0
        jmp     ?_318                                   ; 48D1 _ EB, 34

?_317:  mov     eax, dword [ebp-10H]                    ; 48D3 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 48D6 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 48D9 _ 8B. 45, 08
        add     edx, 4                                  ; 48DC _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 48DF _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 48E3 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 48E6 _ 8B. 4D, F0
        add     ecx, 4                                  ; 48E9 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 48EC _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 48F0 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 48F3 _ 8B. 55, F0
        add     edx, 4                                  ; 48F6 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 48F9 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 48FD _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 4900 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 4903 _ 83. 6D, F0, 01
?_318:  mov     eax, dword [ebp-10H]                    ; 4907 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 490A _ 3B. 45, 10
        jg      ?_317                                   ; 490D _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 490F _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4912 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 4915 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 4918 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 491B _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 491F _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 4922 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 4925 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4928 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 492B _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 492E _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4931 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4934 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4937 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 493A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 493D _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4940 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4943 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4946 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4949 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 494C _ 8B. 40, 0C
        sub     esp, 8                                  ; 494F _ 83. EC, 08
        push    esi                                     ; 4952 _ 56
        push    ebx                                     ; 4953 _ 53
        push    ecx                                     ; 4954 _ 51
        push    edx                                     ; 4955 _ 52
        push    eax                                     ; 4956 _ 50
        push    dword [ebp+8H]                          ; 4957 _ FF. 75, 08
        call    sheet_refreshmap                        ; 495A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 495F _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 4962 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 4965 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 4968 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 496B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 496E _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4971 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4974 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4977 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 497A _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 497D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4980 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4983 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4986 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4989 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 498C _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 498F _ 8B. 40, 0C
        sub     esp, 4                                  ; 4992 _ 83. EC, 04
        push    dword [ebp-0CH]                         ; 4995 _ FF. 75, F4
        push    esi                                     ; 4998 _ 56
        push    ebx                                     ; 4999 _ 53
        push    ecx                                     ; 499A _ 51
        push    edx                                     ; 499B _ 52
        push    eax                                     ; 499C _ 50
        push    dword [ebp+8H]                          ; 499D _ FF. 75, 08
        call    sheet_refreshsub                        ; 49A0 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 49A5 _ 83. C4, 20
        jmp     ?_330                                   ; 49A8 _ E9, 0000023E

?_319:  mov     eax, dword [ebp+8H]                     ; 49AD _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 49B0 _ 8B. 40, 10
        cmp     eax, dword [ebp-0CH]                    ; 49B3 _ 3B. 45, F4
        jle     ?_322                                   ; 49B6 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 49B8 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 49BB _ 89. 45, F0
        jmp     ?_321                                   ; 49BE _ EB, 34

?_320:  mov     eax, dword [ebp-10H]                    ; 49C0 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 49C3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 49C6 _ 8B. 45, 08
        add     edx, 4                                  ; 49C9 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 49CC _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 49D0 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 49D3 _ 8B. 4D, F0
        add     ecx, 4                                  ; 49D6 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 49D9 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 49DD _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 49E0 _ 8B. 55, F0
        add     edx, 4                                  ; 49E3 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 49E6 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 49EA _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 49ED _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 49F0 _ 83. 45, F0, 01
?_321:  mov     eax, dword [ebp+8H]                     ; 49F4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 49F7 _ 8B. 40, 10
        cmp     eax, dword [ebp-10H]                    ; 49FA _ 3B. 45, F0
        jg      ?_320                                   ; 49FD _ 7F, C1
?_322:  mov     eax, dword [ebp+8H]                     ; 49FF _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4A02 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 4A05 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4A08 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4A0B _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4A0E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4A11 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4A14 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4A17 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4A1A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4A1D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4A20 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4A23 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4A26 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4A29 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4A2C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4A2F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4A32 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4A35 _ 8B. 40, 0C
        sub     esp, 8                                  ; 4A38 _ 83. EC, 08
        push    0                                       ; 4A3B _ 6A, 00
        push    ebx                                     ; 4A3D _ 53
        push    ecx                                     ; 4A3E _ 51
        push    edx                                     ; 4A3F _ 52
        push    eax                                     ; 4A40 _ 50
        push    dword [ebp+8H]                          ; 4A41 _ FF. 75, 08
        call    sheet_refreshmap                        ; 4A44 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4A49 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 4A4C _ 8B. 45, F4
        lea     esi, [eax-1H]                           ; 4A4F _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 4A52 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4A55 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4A58 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4A5B _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4A5E _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4A61 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4A64 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4A67 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4A6A _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4A6D _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4A70 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4A73 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4A76 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4A79 _ 8B. 40, 0C
        sub     esp, 4                                  ; 4A7C _ 83. EC, 04
        push    esi                                     ; 4A7F _ 56
        push    0                                       ; 4A80 _ 6A, 00
        push    ebx                                     ; 4A82 _ 53
        push    ecx                                     ; 4A83 _ 51
        push    edx                                     ; 4A84 _ 52
        push    eax                                     ; 4A85 _ 50
        push    dword [ebp+8H]                          ; 4A86 _ FF. 75, 08
        call    sheet_refreshsub                        ; 4A89 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4A8E _ 83. C4, 20
        jmp     ?_330                                   ; 4A91 _ E9, 00000155

?_323:  mov     eax, dword [ebp-0CH]                    ; 4A96 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 4A99 _ 3B. 45, 10
        jge     ?_330                                   ; 4A9C _ 0F 8D, 00000149
        cmp     dword [ebp-0CH], 0                      ; 4AA2 _ 83. 7D, F4, 00
        js      ?_326                                   ; 4AA6 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 4AA8 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 4AAB _ 89. 45, F0
        jmp     ?_325                                   ; 4AAE _ EB, 34

?_324:  mov     eax, dword [ebp-10H]                    ; 4AB0 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 4AB3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4AB6 _ 8B. 45, 08
        add     edx, 4                                  ; 4AB9 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4ABC _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4AC0 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 4AC3 _ 8B. 4D, F0
        add     ecx, 4                                  ; 4AC6 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 4AC9 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4ACD _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 4AD0 _ 8B. 55, F0
        add     edx, 4                                  ; 4AD3 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4AD6 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 4ADA _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 4ADD _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 4AE0 _ 83. 45, F0, 01
?_325:  mov     eax, dword [ebp-10H]                    ; 4AE4 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 4AE7 _ 3B. 45, 10
        jl      ?_324                                   ; 4AEA _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 4AEC _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4AEF _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 4AF2 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 4AF5 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4AF8 _ 89. 54 88, 04
        jmp     ?_329                                   ; 4AFC _ EB, 6C

?_326:  mov     eax, dword [ebp+8H]                     ; 4AFE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4B01 _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 4B04 _ 89. 45, F0
        jmp     ?_328                                   ; 4B07 _ EB, 3A

?_327:  mov     eax, dword [ebp-10H]                    ; 4B09 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 4B0C _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 4B0F _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 4B12 _ 8B. 55, F0
        add     edx, 4                                  ; 4B15 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4B18 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4B1C _ 8B. 45, 08
        add     ecx, 4                                  ; 4B1F _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 4B22 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 4B26 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 4B29 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4B2C _ 8B. 45, 08
        add     edx, 4                                  ; 4B2F _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4B32 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 4B36 _ 8B. 55, F0
        add     edx, 1                                  ; 4B39 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 4B3C _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 4B3F _ 83. 6D, F0, 01
?_328:  mov     eax, dword [ebp-10H]                    ; 4B43 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 4B46 _ 3B. 45, 10
        jge     ?_327                                   ; 4B49 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 4B4B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4B4E _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 4B51 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 4B54 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4B57 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4B5B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4B5E _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 4B61 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4B64 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4B67 _ 89. 50, 10
?_329:  mov     eax, dword [ebp+0CH]                    ; 4B6A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4B6D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4B70 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4B73 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4B76 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4B79 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4B7C _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4B7F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4B82 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4B85 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4B88 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4B8B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4B8E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4B91 _ 8B. 40, 0C
        sub     esp, 8                                  ; 4B94 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 4B97 _ FF. 75, 10
        push    ebx                                     ; 4B9A _ 53
        push    ecx                                     ; 4B9B _ 51
        push    edx                                     ; 4B9C _ 52
        push    eax                                     ; 4B9D _ 50
        push    dword [ebp+8H]                          ; 4B9E _ FF. 75, 08
        call    sheet_refreshmap                        ; 4BA1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4BA6 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 4BA9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4BAC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4BAF _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4BB2 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4BB5 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4BB8 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4BBB _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4BBE _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4BC1 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4BC4 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4BC7 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4BCA _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4BCD _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4BD0 _ 8B. 40, 0C
        sub     esp, 4                                  ; 4BD3 _ 83. EC, 04
        push    dword [ebp+10H]                         ; 4BD6 _ FF. 75, 10
        push    dword [ebp+10H]                         ; 4BD9 _ FF. 75, 10
        push    ebx                                     ; 4BDC _ 53
        push    ecx                                     ; 4BDD _ 51
        push    edx                                     ; 4BDE _ 52
        push    eax                                     ; 4BDF _ 50
        push    dword [ebp+8H]                          ; 4BE0 _ FF. 75, 08
        call    sheet_refreshsub                        ; 4BE3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4BE8 _ 83. C4, 20
?_330:  lea     esp, [ebp-8H]                           ; 4BEB _ 8D. 65, F8
        pop     ebx                                     ; 4BEE _ 5B
        pop     esi                                     ; 4BEF _ 5E
        pop     ebp                                     ; 4BF0 _ 5D
        ret                                             ; 4BF1 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 4BF2 _ 55
        mov     ebp, esp                                ; 4BF3 _ 89. E5
        push    edi                                     ; 4BF5 _ 57
        push    esi                                     ; 4BF6 _ 56
        push    ebx                                     ; 4BF7 _ 53
        sub     esp, 28                                 ; 4BF8 _ 83. EC, 1C
        mov     eax, dword [ebp+0CH]                    ; 4BFB _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4BFE _ 8B. 40, 18
        test    eax, eax                                ; 4C01 _ 85. C0
        js      ?_331                                   ; 4C03 _ 78, 52
        mov     eax, dword [ebp+0CH]                    ; 4C05 _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 4C08 _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 4C0B _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 4C0E _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 4C11 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4C14 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 4C17 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 4C1A _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 4C1D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4C20 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 4C23 _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 4C26 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4C29 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4C2C _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 4C2F _ 8B. 45, 14
        add     edx, eax                                ; 4C32 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4C34 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4C37 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 4C3A _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 4C3D _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 4C40 _ 03. 45, E4
        sub     esp, 4                                  ; 4C43 _ 83. EC, 04
        push    ebx                                     ; 4C46 _ 53
        push    ecx                                     ; 4C47 _ 51
        push    edi                                     ; 4C48 _ 57
        push    esi                                     ; 4C49 _ 56
        push    edx                                     ; 4C4A _ 52
        push    eax                                     ; 4C4B _ 50
        push    dword [ebp+8H]                          ; 4C4C _ FF. 75, 08
        call    sheet_refreshsub                        ; 4C4F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4C54 _ 83. C4, 20
?_331:  mov     eax, 0                                  ; 4C57 _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 4C5C _ 8D. 65, F4
        pop     ebx                                     ; 4C5F _ 5B
        pop     esi                                     ; 4C60 _ 5E
        pop     edi                                     ; 4C61 _ 5F
        pop     ebp                                     ; 4C62 _ 5D
        ret                                             ; 4C63 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 4C64 _ 55
        mov     ebp, esp                                ; 4C65 _ 89. E5
        push    esi                                     ; 4C67 _ 56
        push    ebx                                     ; 4C68 _ 53
        sub     esp, 16                                 ; 4C69 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 4C6C _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4C6F _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 4C72 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 4C75 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 4C78 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 4C7B _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 4C7E _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 4C81 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 4C84 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4C87 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 4C8A _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 4C8D _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4C90 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4C93 _ 8B. 40, 18
        test    eax, eax                                ; 4C96 _ 85. C0
        js      ?_332                                   ; 4C98 _ 0F 88, 000000D3
        mov     eax, dword [ebp+0CH]                    ; 4C9E _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 4CA1 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4CA4 _ 8B. 45, F4
        add     edx, eax                                ; 4CA7 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4CA9 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 4CAC _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 4CAF _ 8B. 45, F0
        add     eax, ecx                                ; 4CB2 _ 01. C8
        sub     esp, 8                                  ; 4CB4 _ 83. EC, 08
        push    0                                       ; 4CB7 _ 6A, 00
        push    edx                                     ; 4CB9 _ 52
        push    eax                                     ; 4CBA _ 50
        push    dword [ebp-0CH]                         ; 4CBB _ FF. 75, F4
        push    dword [ebp-10H]                         ; 4CBE _ FF. 75, F0
        push    dword [ebp+8H]                          ; 4CC1 _ FF. 75, 08
        call    sheet_refreshmap                        ; 4CC4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4CC9 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 4CCC _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4CCF _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 4CD2 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 4CD5 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 4CD8 _ 8B. 55, 14
        add     ecx, edx                                ; 4CDB _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 4CDD _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 4CE0 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 4CE3 _ 8B. 55, 10
        add     edx, ebx                                ; 4CE6 _ 01. DA
        sub     esp, 8                                  ; 4CE8 _ 83. EC, 08
        push    eax                                     ; 4CEB _ 50
        push    ecx                                     ; 4CEC _ 51
        push    edx                                     ; 4CED _ 52
        push    dword [ebp+14H]                         ; 4CEE _ FF. 75, 14
        push    dword [ebp+10H]                         ; 4CF1 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 4CF4 _ FF. 75, 08
        call    sheet_refreshmap                        ; 4CF7 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4CFC _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 4CFF _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4D02 _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 4D05 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 4D08 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 4D0B _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4D0E _ 8B. 45, F4
        add     edx, eax                                ; 4D11 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4D13 _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 4D16 _ 8B. 58, 04
        mov     eax, dword [ebp-10H]                    ; 4D19 _ 8B. 45, F0
        add     eax, ebx                                ; 4D1C _ 01. D8
        sub     esp, 4                                  ; 4D1E _ 83. EC, 04
        push    ecx                                     ; 4D21 _ 51
        push    0                                       ; 4D22 _ 6A, 00
        push    edx                                     ; 4D24 _ 52
        push    eax                                     ; 4D25 _ 50
        push    dword [ebp-0CH]                         ; 4D26 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 4D29 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 4D2C _ FF. 75, 08
        call    sheet_refreshsub                        ; 4D2F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4D34 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 4D37 _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 4D3A _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 4D3D _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4D40 _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 4D43 _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 4D46 _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 4D49 _ 8B. 4D, 14
        add     ebx, ecx                                ; 4D4C _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 4D4E _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 4D51 _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 4D54 _ 8B. 4D, 10
        add     ecx, esi                                ; 4D57 _ 01. F1
        sub     esp, 4                                  ; 4D59 _ 83. EC, 04
        push    edx                                     ; 4D5C _ 52
        push    eax                                     ; 4D5D _ 50
        push    ebx                                     ; 4D5E _ 53
        push    ecx                                     ; 4D5F _ 51
        push    dword [ebp+14H]                         ; 4D60 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 4D63 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 4D66 _ FF. 75, 08
        call    sheet_refreshsub                        ; 4D69 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4D6E _ 83. C4, 20
?_332:  lea     esp, [ebp-8H]                           ; 4D71 _ 8D. 65, F8
        pop     ebx                                     ; 4D74 _ 5B
        pop     esi                                     ; 4D75 _ 5E
        pop     ebp                                     ; 4D76 _ 5D
        ret                                             ; 4D77 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 4D78 _ 55
        mov     ebp, esp                                ; 4D79 _ 89. E5
        sub     esp, 64                                 ; 4D7B _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 4D7E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4D81 _ 8B. 00
        mov     dword [ebp-20H], eax                    ; 4D83 _ 89. 45, E0
        mov     eax, dword [ebp+8H]                     ; 4D86 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4D89 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 4D8C _ 89. 45, E4
        cmp     dword [ebp+0CH], 0                      ; 4D8F _ 83. 7D, 0C, 00
        jns     ?_333                                   ; 4D93 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 4D95 _ C7. 45, 0C, 00000000
?_333:  cmp     dword [ebp+10H], 8                      ; 4D9C _ 83. 7D, 10, 08
        jg      ?_334                                   ; 4DA0 _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 4DA2 _ C7. 45, 10, 00000000
?_334:  mov     eax, dword [ebp+8H]                     ; 4DA9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4DAC _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 4DAF _ 3B. 45, 14
        jge     ?_335                                   ; 4DB2 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4DB4 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4DB7 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 4DBA _ 89. 45, 14
?_335:  mov     eax, dword [ebp+8H]                     ; 4DBD _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4DC0 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 4DC3 _ 3B. 45, 18
        jge     ?_336                                   ; 4DC6 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4DC8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4DCB _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 4DCE _ 89. 45, 18
?_336:  mov     eax, dword [ebp+1CH]                    ; 4DD1 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 4DD4 _ 89. 45, CC
        jmp     ?_347                                   ; 4DD7 _ E9, 0000015A

?_337:  mov     eax, dword [ebp+8H]                     ; 4DDC _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 4DDF _ 8B. 55, CC
        add     edx, 4                                  ; 4DE2 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4DE5 _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 4DE9 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 4DEC _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 4DEF _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 4DF1 _ 89. 45, EC
        mov     eax, dword [ebp-18H]                    ; 4DF4 _ 8B. 45, E8
        mov     edx, dword [ebp+8H]                     ; 4DF7 _ 8B. 55, 08
        add     edx, 1044                               ; 4DFA _ 81. C2, 00000414
        sub     eax, edx                                ; 4E00 _ 29. D0
        sar     eax, 2                                  ; 4E02 _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 4E05 _ 69. C0, 38E38E39
        mov     byte [ebp-35H], al                      ; 4E0B _ 88. 45, CB
        mov     eax, dword [ebp-18H]                    ; 4E0E _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 4E11 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 4E14 _ 8B. 55, 0C
        sub     edx, eax                                ; 4E17 _ 29. C2
        mov     eax, edx                                ; 4E19 _ 89. D0
        mov     dword [ebp-10H], eax                    ; 4E1B _ 89. 45, F0
        mov     eax, dword [ebp-18H]                    ; 4E1E _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 4E21 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 4E24 _ 8B. 55, 10
        sub     edx, eax                                ; 4E27 _ 29. C2
        mov     eax, edx                                ; 4E29 _ 89. D0
        mov     dword [ebp-0CH], eax                    ; 4E2B _ 89. 45, F4
        mov     eax, dword [ebp-18H]                    ; 4E2E _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 4E31 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 4E34 _ 8B. 55, 14
        sub     edx, eax                                ; 4E37 _ 29. C2
        mov     eax, edx                                ; 4E39 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 4E3B _ 89. 45, D8
        mov     eax, dword [ebp-18H]                    ; 4E3E _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 4E41 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 4E44 _ 8B. 55, 18
        sub     edx, eax                                ; 4E47 _ 29. C2
        mov     eax, edx                                ; 4E49 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 4E4B _ 89. 45, DC
        cmp     dword [ebp-10H], 0                      ; 4E4E _ 83. 7D, F0, 00
        jns     ?_338                                   ; 4E52 _ 79, 07
        mov     dword [ebp-10H], 0                      ; 4E54 _ C7. 45, F0, 00000000
?_338:  cmp     dword [ebp-0CH], 0                      ; 4E5B _ 83. 7D, F4, 00
        jns     ?_339                                   ; 4E5F _ 79, 07
        mov     dword [ebp-0CH], 0                      ; 4E61 _ C7. 45, F4, 00000000
?_339:  mov     eax, dword [ebp-18H]                    ; 4E68 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 4E6B _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 4E6E _ 3B. 45, D8
        jge     ?_340                                   ; 4E71 _ 7D, 09
        mov     eax, dword [ebp-18H]                    ; 4E73 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 4E76 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 4E79 _ 89. 45, D8
?_340:  mov     eax, dword [ebp-18H]                    ; 4E7C _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 4E7F _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 4E82 _ 3B. 45, DC
        jge     ?_341                                   ; 4E85 _ 7D, 09
        mov     eax, dword [ebp-18H]                    ; 4E87 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 4E8A _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 4E8D _ 89. 45, DC
?_341:  mov     dword [ebp-2CH], 0                      ; 4E90 _ C7. 45, D4, 00000000
        jmp     ?_346                                   ; 4E97 _ E9, 0000008A

?_342:  mov     eax, dword [ebp-18H]                    ; 4E9C _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 4E9F _ 8B. 50, 10
        mov     eax, dword [ebp-2CH]                    ; 4EA2 _ 8B. 45, D4
        add     eax, edx                                ; 4EA5 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4EA7 _ 89. 45, F8
        mov     dword [ebp-30H], 0                      ; 4EAA _ C7. 45, D0, 00000000
        jmp     ?_345                                   ; 4EB1 _ EB, 67

?_343:  mov     eax, dword [ebp-18H]                    ; 4EB3 _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 4EB6 _ 8B. 50, 0C
        mov     eax, dword [ebp-30H]                    ; 4EB9 _ 8B. 45, D0
        add     eax, edx                                ; 4EBC _ 01. D0
        mov     dword [ebp-4H], eax                     ; 4EBE _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 4EC1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4EC4 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 4EC7 _ 0F AF. 45, F8
        mov     edx, eax                                ; 4ECB _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4ECD _ 8B. 45, FC
        add     eax, edx                                ; 4ED0 _ 01. D0
        mov     edx, eax                                ; 4ED2 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 4ED4 _ 8B. 45, E4
        add     eax, edx                                ; 4ED7 _ 01. D0
        movzx   eax, byte [eax]                         ; 4ED9 _ 0F B6. 00
        cmp     al, byte [ebp-35H]                      ; 4EDC _ 3A. 45, CB
        jnz     ?_344                                   ; 4EDF _ 75, 35
        mov     eax, dword [ebp+8H]                     ; 4EE1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4EE4 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 4EE7 _ 0F AF. 45, F8
        mov     edx, eax                                ; 4EEB _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4EED _ 8B. 45, FC
        add     eax, edx                                ; 4EF0 _ 01. D0
        mov     edx, eax                                ; 4EF2 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 4EF4 _ 8B. 45, E0
        add     edx, eax                                ; 4EF7 _ 01. C2
        mov     eax, dword [ebp-18H]                    ; 4EF9 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 4EFC _ 8B. 40, 04
        imul    eax, dword [ebp-2CH]                    ; 4EFF _ 0F AF. 45, D4
        mov     ecx, eax                                ; 4F03 _ 89. C1
        mov     eax, dword [ebp-30H]                    ; 4F05 _ 8B. 45, D0
        add     eax, ecx                                ; 4F08 _ 01. C8
        mov     ecx, eax                                ; 4F0A _ 89. C1
        mov     eax, dword [ebp-14H]                    ; 4F0C _ 8B. 45, EC
        add     eax, ecx                                ; 4F0F _ 01. C8
        movzx   eax, byte [eax]                         ; 4F11 _ 0F B6. 00
        mov     byte [edx], al                          ; 4F14 _ 88. 02
?_344:  add     dword [ebp-30H], 1                      ; 4F16 _ 83. 45, D0, 01
?_345:  mov     eax, dword [ebp-30H]                    ; 4F1A _ 8B. 45, D0
        cmp     eax, dword [ebp-28H]                    ; 4F1D _ 3B. 45, D8
        jl      ?_343                                   ; 4F20 _ 7C, 91
        add     dword [ebp-2CH], 1                      ; 4F22 _ 83. 45, D4, 01
?_346:  mov     eax, dword [ebp-2CH]                    ; 4F26 _ 8B. 45, D4
        cmp     eax, dword [ebp-24H]                    ; 4F29 _ 3B. 45, DC
        jl      ?_342                                   ; 4F2C _ 0F 8C, FFFFFF6A
        add     dword [ebp-34H], 1                      ; 4F32 _ 83. 45, CC, 01
?_347:  mov     eax, dword [ebp-34H]                    ; 4F36 _ 8B. 45, CC
        cmp     eax, dword [ebp+20H]                    ; 4F39 _ 3B. 45, 20
        jle     ?_337                                   ; 4F3C _ 0F 8E, FFFFFE9A
        leave                                           ; 4F42 _ C9
        ret                                             ; 4F43 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 4F44 _ 55
        mov     ebp, esp                                ; 4F45 _ 89. E5
        sub     esp, 64                                 ; 4F47 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 4F4A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4F4D _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 4F50 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 4F53 _ 83. 7D, 0C, 00
        jns     ?_348                                   ; 4F57 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 4F59 _ C7. 45, 0C, 00000000
?_348:  cmp     dword [ebp+10H], 0                      ; 4F60 _ 83. 7D, 10, 00
        jns     ?_349                                   ; 4F64 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 4F66 _ C7. 45, 10, 00000000
?_349:  mov     eax, dword [ebp+8H]                     ; 4F6D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4F70 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 4F73 _ 3B. 45, 14
        jge     ?_350                                   ; 4F76 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4F78 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4F7B _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 4F7E _ 89. 45, 14
?_350:  mov     eax, dword [ebp+8H]                     ; 4F81 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4F84 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 4F87 _ 3B. 45, 18
        jge     ?_351                                   ; 4F8A _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4F8C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4F8F _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 4F92 _ 89. 45, 18
?_351:  mov     eax, dword [ebp+1CH]                    ; 4F95 _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 4F98 _ 89. 45, D0
        jmp     ?_362                                   ; 4F9B _ E9, 00000146

?_352:  mov     eax, dword [ebp+8H]                     ; 4FA0 _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 4FA3 _ 8B. 55, D0
        add     edx, 4                                  ; 4FA6 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4FA9 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 4FAD _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 4FB0 _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 4FB3 _ 8B. 55, 08
        add     edx, 1044                               ; 4FB6 _ 81. C2, 00000414
        sub     eax, edx                                ; 4FBC _ 29. D0
        sar     eax, 2                                  ; 4FBE _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 4FC1 _ 69. C0, 38E38E39
        mov     byte [ebp-31H], al                      ; 4FC7 _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 4FCA _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 4FCD _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 4FCF _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 4FD2 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4FD5 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 4FD8 _ 8B. 55, 0C
        sub     edx, eax                                ; 4FDB _ 29. C2
        mov     eax, edx                                ; 4FDD _ 89. D0
        mov     dword [ebp-24H], eax                    ; 4FDF _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 4FE2 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 4FE5 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 4FE8 _ 8B. 55, 10
        sub     edx, eax                                ; 4FEB _ 29. C2
        mov     eax, edx                                ; 4FED _ 89. D0
        mov     dword [ebp-20H], eax                    ; 4FEF _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 4FF2 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4FF5 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 4FF8 _ 8B. 55, 14
        sub     edx, eax                                ; 4FFB _ 29. C2
        mov     eax, edx                                ; 4FFD _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 4FFF _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 5002 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 5005 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 5008 _ 8B. 55, 18
        sub     edx, eax                                ; 500B _ 29. C2
        mov     eax, edx                                ; 500D _ 89. D0
        mov     dword [ebp-18H], eax                    ; 500F _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 5012 _ 83. 7D, DC, 00
        jns     ?_353                                   ; 5016 _ 79, 07
        mov     dword [ebp-24H], 0                      ; 5018 _ C7. 45, DC, 00000000
?_353:  cmp     dword [ebp-20H], 0                      ; 501F _ 83. 7D, E0, 00
        jns     ?_354                                   ; 5023 _ 79, 07
        mov     dword [ebp-20H], 0                      ; 5025 _ C7. 45, E0, 00000000
?_354:  mov     eax, dword [ebp-10H]                    ; 502C _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 502F _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 5032 _ 3B. 45, E4
        jge     ?_355                                   ; 5035 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 5037 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 503A _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 503D _ 89. 45, E4
?_355:  mov     eax, dword [ebp-10H]                    ; 5040 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 5043 _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 5046 _ 3B. 45, E8
        jge     ?_356                                   ; 5049 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 504B _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 504E _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 5051 _ 89. 45, E8
?_356:  mov     eax, dword [ebp-20H]                    ; 5054 _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 5057 _ 89. 45, D8
        jmp     ?_361                                   ; 505A _ EB, 7A

?_357:  mov     eax, dword [ebp-10H]                    ; 505C _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 505F _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 5062 _ 8B. 45, D8
        add     eax, edx                                ; 5065 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 5067 _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 506A _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 506D _ 89. 45, D4
        jmp     ?_360                                   ; 5070 _ EB, 58

?_358:  mov     eax, dword [ebp-10H]                    ; 5072 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 5075 _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 5078 _ 8B. 45, D4
        add     eax, edx                                ; 507B _ 01. D0
        mov     dword [ebp-4H], eax                     ; 507D _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 5080 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 5083 _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 5086 _ 0F AF. 45, D8
        mov     edx, eax                                ; 508A _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 508C _ 8B. 45, D4
        add     eax, edx                                ; 508F _ 01. D0
        mov     edx, eax                                ; 5091 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 5093 _ 8B. 45, F4
        add     eax, edx                                ; 5096 _ 01. D0
        movzx   eax, byte [eax]                         ; 5098 _ 0F B6. 00
        movzx   edx, al                                 ; 509B _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 509E _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 50A1 _ 8B. 40, 14
        cmp     edx, eax                                ; 50A4 _ 39. C2
        jz      ?_359                                   ; 50A6 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 50A8 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 50AB _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 50AE _ 0F AF. 45, F8
        mov     edx, eax                                ; 50B2 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 50B4 _ 8B. 45, FC
        add     eax, edx                                ; 50B7 _ 01. D0
        mov     edx, eax                                ; 50B9 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 50BB _ 8B. 45, EC
        add     edx, eax                                ; 50BE _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 50C0 _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 50C4 _ 88. 02
?_359:  add     dword [ebp-2CH], 1                      ; 50C6 _ 83. 45, D4, 01
?_360:  mov     eax, dword [ebp-2CH]                    ; 50CA _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 50CD _ 3B. 45, E4
        jl      ?_358                                   ; 50D0 _ 7C, A0
        add     dword [ebp-28H], 1                      ; 50D2 _ 83. 45, D8, 01
?_361:  mov     eax, dword [ebp-28H]                    ; 50D6 _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 50D9 _ 3B. 45, E8
        jl      ?_357                                   ; 50DC _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 50E2 _ 83. 45, D0, 01
?_362:  mov     eax, dword [ebp+8H]                     ; 50E6 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 50E9 _ 8B. 40, 10
        cmp     eax, dword [ebp-30H]                    ; 50EC _ 3B. 45, D0
        jge     ?_352                                   ; 50EF _ 0F 8D, FFFFFEAB
        nop                                             ; 50F5 _ 90
        leave                                           ; 50F6 _ C9
        ret                                             ; 50F7 _ C3
; sheet_refreshmap End of function

sheet_free:; Function begin
        push    ebp                                     ; 50F8 _ 55
        mov     ebp, esp                                ; 50F9 _ 89. E5
        sub     esp, 8                                  ; 50FB _ 83. EC, 08
        mov     eax, dword [ebp+0CH]                    ; 50FE _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 5101 _ 8B. 40, 18
        test    eax, eax                                ; 5104 _ 85. C0
        js      ?_363                                   ; 5106 _ 78, 13
        sub     esp, 4                                  ; 5108 _ 83. EC, 04
        push    -1                                      ; 510B _ 6A, FF
        push    dword [ebp+0CH]                         ; 510D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 5110 _ FF. 75, 08
        call    sheet_updown                            ; 5113 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5118 _ 83. C4, 10
?_363:  mov     eax, dword [ebp+0CH]                    ; 511B _ 8B. 45, 0C
        mov     dword [eax+1CH], 0                      ; 511E _ C7. 40, 1C, 00000000
        nop                                             ; 5125 _ 90
        leave                                           ; 5126 _ C9
        ret                                             ; 5127 _ C3
; sheet_free End of function

init_pit:; Function begin
        push    ebp                                     ; 5128 _ 55
        mov     ebp, esp                                ; 5129 _ 89. E5
        sub     esp, 24                                 ; 512B _ 83. EC, 18
        sub     esp, 8                                  ; 512E _ 83. EC, 08
        push    52                                      ; 5131 _ 6A, 34
        push    67                                      ; 5133 _ 6A, 43
        call    io_out8                                 ; 5135 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 513A _ 83. C4, 10
        sub     esp, 8                                  ; 513D _ 83. EC, 08
        push    156                                     ; 5140 _ 68, 0000009C
        push    64                                      ; 5145 _ 6A, 40
        call    io_out8                                 ; 5147 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 514C _ 83. C4, 10
        sub     esp, 8                                  ; 514F _ 83. EC, 08
        push    46                                      ; 5152 _ 6A, 2E
        push    64                                      ; 5154 _ 6A, 40
        call    io_out8                                 ; 5156 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 515B _ 83. C4, 10
        mov     dword [timerctl], 0                     ; 515E _ C7. 05, 000003C0(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 5168 _ C7. 45, F4, 00000000
        jmp     ?_365                                   ; 516F _ EB, 28

?_364:  mov     eax, dword [ebp-0CH]                    ; 5171 _ 8B. 45, F4
        shl     eax, 4                                  ; 5174 _ C1. E0, 04
        add     eax, timerctl                           ; 5177 _ 05, 000003C0(d)
        mov     dword [eax+8H], 0                       ; 517C _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 5183 _ 8B. 45, F4
        shl     eax, 4                                  ; 5186 _ C1. E0, 04
        add     eax, timerctl                           ; 5189 _ 05, 000003C0(d)
        mov     dword [eax+0CH], 0                      ; 518E _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 5195 _ 83. 45, F4, 01
?_365:  cmp     dword [ebp-0CH], 499                    ; 5199 _ 81. 7D, F4, 000001F3
        jle     ?_364                                   ; 51A0 _ 7E, CF
        leave                                           ; 51A2 _ C9
        ret                                             ; 51A3 _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 51A4 _ 55
        mov     ebp, esp                                ; 51A5 _ 89. E5
        sub     esp, 16                                 ; 51A7 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 51AA _ C7. 45, FC, 00000000
        jmp     ?_368                                   ; 51B1 _ EB, 38

?_366:  mov     eax, dword [ebp-4H]                     ; 51B3 _ 8B. 45, FC
        shl     eax, 4                                  ; 51B6 _ C1. E0, 04
        add     eax, timerctl                           ; 51B9 _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 51BE _ 8B. 40, 08
        test    eax, eax                                ; 51C1 _ 85. C0
        jnz     ?_367                                   ; 51C3 _ 75, 22
        mov     eax, dword [ebp-4H]                     ; 51C5 _ 8B. 45, FC
        shl     eax, 4                                  ; 51C8 _ C1. E0, 04
        add     eax, timerctl                           ; 51CB _ 05, 000003C0(d)
        mov     dword [eax+8H], 1                       ; 51D0 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-4H]                     ; 51D7 _ 8B. 45, FC
        shl     eax, 4                                  ; 51DA _ C1. E0, 04
        add     eax, timerctl                           ; 51DD _ 05, 000003C0(d)
        add     eax, 4                                  ; 51E2 _ 83. C0, 04
        jmp     ?_369                                   ; 51E5 _ EB, 12

?_367:  add     dword [ebp-4H], 1                       ; 51E7 _ 83. 45, FC, 01
?_368:  cmp     dword [ebp-4H], 499                     ; 51EB _ 81. 7D, FC, 000001F3
        jle     ?_366                                   ; 51F2 _ 7E, BF
        mov     eax, 0                                  ; 51F4 _ B8, 00000000
?_369:  leave                                           ; 51F9 _ C9
        ret                                             ; 51FA _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 51FB _ 55
        mov     ebp, esp                                ; 51FC _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 51FE _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 5201 _ C7. 40, 04, 00000000
        nop                                             ; 5208 _ 90
        pop     ebp                                     ; 5209 _ 5D
        ret                                             ; 520A _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 520B _ 55
        mov     ebp, esp                                ; 520C _ 89. E5
        sub     esp, 4                                  ; 520E _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 5211 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 5214 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 5217 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 521A _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 521D _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 5220 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 5223 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 5227 _ 88. 50, 0C
        nop                                             ; 522A _ 90
        leave                                           ; 522B _ C9
        ret                                             ; 522C _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 522D _ 55
        mov     ebp, esp                                ; 522E _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 5230 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5233 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 5236 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 5238 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 523B _ C7. 40, 04, 00000002
        nop                                             ; 5242 _ 90
        pop     ebp                                     ; 5243 _ 5D
        ret                                             ; 5244 _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 5245 _ 55
        mov     ebp, esp                                ; 5246 _ 89. E5
        sub     esp, 24                                 ; 5248 _ 83. EC, 18
        sub     esp, 8                                  ; 524B _ 83. EC, 08
        push    32                                      ; 524E _ 6A, 20
        push    32                                      ; 5250 _ 6A, 20
        call    io_out8                                 ; 5252 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5257 _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 525A _ A1, 000003C0(d)
        add     eax, 1                                  ; 525F _ 83. C0, 01
        mov     dword [timerctl], eax                   ; 5262 _ A3, 000003C0(d)
        mov     byte [ebp-0DH], 0                       ; 5267 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 526B _ C7. 45, F4, 00000000
        jmp     ?_373                                   ; 5272 _ E9, 000000B1

?_370:  mov     eax, dword [ebp-0CH]                    ; 5277 _ 8B. 45, F4
        shl     eax, 4                                  ; 527A _ C1. E0, 04
        add     eax, timerctl                           ; 527D _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 5282 _ 8B. 40, 08
        cmp     eax, 2                                  ; 5285 _ 83. F8, 02
        jne     ?_371                                   ; 5288 _ 0F 85, 0000008B
        mov     eax, dword [ebp-0CH]                    ; 528E _ 8B. 45, F4
        shl     eax, 4                                  ; 5291 _ C1. E0, 04
        add     eax, timerctl                           ; 5294 _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 5299 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 529C _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 529F _ 8B. 45, F4
        shl     eax, 4                                  ; 52A2 _ C1. E0, 04
        add     eax, timerctl                           ; 52A5 _ 05, 000003C0(d)
        mov     dword [eax+4H], edx                     ; 52AA _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 52AD _ 8B. 45, F4
        shl     eax, 4                                  ; 52B0 _ C1. E0, 04
        add     eax, timerctl                           ; 52B3 _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 52B8 _ 8B. 40, 04
        test    eax, eax                                ; 52BB _ 85. C0
        jnz     ?_371                                   ; 52BD _ 75, 5A
        mov     eax, dword [ebp-0CH]                    ; 52BF _ 8B. 45, F4
        shl     eax, 4                                  ; 52C2 _ C1. E0, 04
        add     eax, timerctl                           ; 52C5 _ 05, 000003C0(d)
        mov     dword [eax+8H], 1                       ; 52CA _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 52D1 _ 8B. 45, F4
        shl     eax, 4                                  ; 52D4 _ C1. E0, 04
        add     eax, timerctl                           ; 52D7 _ 05, 000003C0(d)
        movzx   eax, byte [eax+10H]                     ; 52DC _ 0F B6. 40, 10
        movzx   edx, al                                 ; 52E0 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 52E3 _ 8B. 45, F4
        shl     eax, 4                                  ; 52E6 _ C1. E0, 04
        add     eax, timerctl                           ; 52E9 _ 05, 000003C0(d)
        mov     eax, dword [eax+0CH]                    ; 52EE _ 8B. 40, 0C
        sub     esp, 8                                  ; 52F1 _ 83. EC, 08
        push    edx                                     ; 52F4 _ 52
        push    eax                                     ; 52F5 _ 50
        call    fifo8_put                               ; 52F6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 52FB _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 52FE _ 8B. 45, F4
        shl     eax, 4                                  ; 5301 _ C1. E0, 04
        add     eax, timerctl                           ; 5304 _ 05, 000003C0(d)
        lea     edx, [eax+4H]                           ; 5309 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 530C _ A1, 00000000(d)
        cmp     edx, eax                                ; 5311 _ 39. C2
        jnz     ?_371                                   ; 5313 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 5315 _ C6. 45, F3, 01
?_371:  cmp     byte [ebp-0DH], 0                       ; 5319 _ 80. 7D, F3, 00
        jz      ?_372                                   ; 531D _ 74, 05
        call    task_switch                             ; 531F _ E8, FFFFFFFC(rel)
?_372:  add     dword [ebp-0CH], 1                      ; 5324 _ 83. 45, F4, 01
?_373:  cmp     dword [ebp-0CH], 499                    ; 5328 _ 81. 7D, F4, 000001F3
        jle     ?_370                                   ; 532F _ 0F 8E, FFFFFF42
        nop                                             ; 5335 _ 90
        leave                                           ; 5336 _ C9
        ret                                             ; 5337 _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 5338 _ 55
        mov     ebp, esp                                ; 5339 _ 89. E5
        mov     eax, timerctl                           ; 533B _ B8, 000003C0(d)
        pop     ebp                                     ; 5340 _ 5D
        ret                                             ; 5341 _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 5342 _ 55
        mov     ebp, esp                                ; 5343 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 5345 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5348 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 534B _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 534E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 5351 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 5354 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 5356 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5359 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 535C _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 535F _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 5362 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 5369 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 536C _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 5373 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 5376 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 537D _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 5380 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 5383 _ 89. 50, 18
        nop                                             ; 5386 _ 90
        pop     ebp                                     ; 5387 _ 5D
        ret                                             ; 5388 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 5389 _ 55
        mov     ebp, esp                                ; 538A _ 89. E5
        sub     esp, 24                                 ; 538C _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 538F _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 5392 _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 5395 _ 83. 7D, 08, 00
        jnz     ?_374                                   ; 5399 _ 75, 0A
        mov     eax, 4294967295                         ; 539B _ B8, FFFFFFFF
        jmp     ?_378                                   ; 53A0 _ E9, 000000AA

?_374:  mov     eax, dword [ebp+8H]                     ; 53A5 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 53A8 _ 8B. 40, 10
        test    eax, eax                                ; 53AB _ 85. C0
        jnz     ?_375                                   ; 53AD _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 53AF _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 53B2 _ 8B. 40, 14
        or      eax, 01H                                ; 53B5 _ 83. C8, 01
        mov     edx, eax                                ; 53B8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 53BA _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 53BD _ 89. 50, 14
        mov     eax, 4294967294                         ; 53C0 _ B8, FFFFFFFE
        jmp     ?_378                                   ; 53C5 _ E9, 00000085

?_375:  mov     eax, dword [ebp+8H]                     ; 53CA _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 53CD _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 53CF _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 53D2 _ 8B. 40, 04
        add     edx, eax                                ; 53D5 _ 01. C2
        movzx   eax, byte [ebp-0CH]                     ; 53D7 _ 0F B6. 45, F4
        mov     byte [edx], al                          ; 53DB _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 53DD _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 53E0 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 53E3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 53E6 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 53E9 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 53EC _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 53EF _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 53F2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 53F5 _ 8B. 40, 0C
        cmp     edx, eax                                ; 53F8 _ 39. C2
        jnz     ?_376                                   ; 53FA _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 53FC _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 53FF _ C7. 40, 04, 00000000
?_376:  mov     eax, dword [ebp+8H]                     ; 5406 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5409 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 540C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 540F _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 5412 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 5415 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 5418 _ 8B. 40, 18
        test    eax, eax                                ; 541B _ 85. C0
        jz      ?_377                                   ; 541D _ 74, 2B
        mov     eax, dword [ebp+8H]                     ; 541F _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 5422 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 5425 _ 8B. 40, 04
        cmp     eax, 2                                  ; 5428 _ 83. F8, 02
        jz      ?_377                                   ; 542B _ 74, 1D
        mov     eax, dword [ebp+8H]                     ; 542D _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 5430 _ 8B. 40, 18
        sub     esp, 4                                  ; 5433 _ 83. EC, 04
        push    0                                       ; 5436 _ 6A, 00
        push    -1                                      ; 5438 _ 6A, FF
        push    eax                                     ; 543A _ 50
        call    task_run                                ; 543B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5440 _ 83. C4, 10
        mov     eax, 1                                  ; 5443 _ B8, 00000001
        jmp     ?_378                                   ; 5448 _ EB, 05

?_377:  mov     eax, 0                                  ; 544A _ B8, 00000000
?_378:  leave                                           ; 544F _ C9
        ret                                             ; 5450 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 5451 _ 55
        mov     ebp, esp                                ; 5452 _ 89. E5
        sub     esp, 16                                 ; 5454 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 5457 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 545A _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 545D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5460 _ 8B. 40, 0C
        cmp     edx, eax                                ; 5463 _ 39. C2
        jnz     ?_379                                   ; 5465 _ 75, 07
        mov     eax, 4294967295                         ; 5467 _ B8, FFFFFFFF
        jmp     ?_381                                   ; 546C _ EB, 51

?_379:  mov     eax, dword [ebp+8H]                     ; 546E _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 5471 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 5473 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5476 _ 8B. 40, 08
        add     eax, edx                                ; 5479 _ 01. D0
        movzx   eax, byte [eax]                         ; 547B _ 0F B6. 00
        movzx   eax, al                                 ; 547E _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 5481 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 5484 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5487 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 548A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 548D _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 5490 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 5493 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 5496 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 5499 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 549C _ 8B. 40, 0C
        cmp     edx, eax                                ; 549F _ 39. C2
        jnz     ?_380                                   ; 54A1 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 54A3 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 54A6 _ C7. 40, 08, 00000000
?_380:  mov     eax, dword [ebp+8H]                     ; 54AD _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 54B0 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 54B3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 54B6 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 54B9 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 54BC _ 8B. 45, FC
?_381:  leave                                           ; 54BF _ C9
        ret                                             ; 54C0 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 54C1 _ 55
        mov     ebp, esp                                ; 54C2 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 54C4 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 54C7 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 54CA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 54CD _ 8B. 40, 10
        sub     edx, eax                                ; 54D0 _ 29. C2
        mov     eax, edx                                ; 54D2 _ 89. D0
        pop     ebp                                     ; 54D4 _ 5D
        ret                                             ; 54D5 _ C3
; fifo8_status End of function

strcmp: ; Function begin
        push    ebp                                     ; 54D6 _ 55
        mov     ebp, esp                                ; 54D7 _ 89. E5
        sub     esp, 16                                 ; 54D9 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 54DC _ 83. 7D, 08, 00
        jz      ?_382                                   ; 54E0 _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 54E2 _ 83. 7D, 0C, 00
        jnz     ?_383                                   ; 54E6 _ 75, 0A
?_382:  mov     eax, 0                                  ; 54E8 _ B8, 00000000
        jmp     ?_390                                   ; 54ED _ E9, 0000009B

?_383:  mov     dword [ebp-4H], 0                       ; 54F2 _ C7. 45, FC, 00000000
        jmp     ?_386                                   ; 54F9 _ EB, 25

?_384:  mov     edx, dword [ebp-4H]                     ; 54FB _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 54FE _ 8B. 45, 08
        add     eax, edx                                ; 5501 _ 01. D0
        movzx   edx, byte [eax]                         ; 5503 _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 5506 _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 5509 _ 8B. 45, 0C
        add     eax, ecx                                ; 550C _ 01. C8
        movzx   eax, byte [eax]                         ; 550E _ 0F B6. 00
        cmp     dl, al                                  ; 5511 _ 38. C2
        jz      ?_385                                   ; 5513 _ 74, 07
        mov     eax, 0                                  ; 5515 _ B8, 00000000
        jmp     ?_390                                   ; 551A _ EB, 71

?_385:  add     dword [ebp-4H], 1                       ; 551C _ 83. 45, FC, 01
?_386:  mov     edx, dword [ebp-4H]                     ; 5520 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5523 _ 8B. 45, 08
        add     eax, edx                                ; 5526 _ 01. D0
        movzx   eax, byte [eax]                         ; 5528 _ 0F B6. 00
        test    al, al                                  ; 552B _ 84. C0
        jz      ?_387                                   ; 552D _ 74, 0F
        mov     edx, dword [ebp-4H]                     ; 552F _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 5532 _ 8B. 45, 0C
        add     eax, edx                                ; 5535 _ 01. D0
        movzx   eax, byte [eax]                         ; 5537 _ 0F B6. 00
        test    al, al                                  ; 553A _ 84. C0
        jnz     ?_384                                   ; 553C _ 75, BD
?_387:  mov     edx, dword [ebp-4H]                     ; 553E _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5541 _ 8B. 45, 08
        add     eax, edx                                ; 5544 _ 01. D0
        movzx   eax, byte [eax]                         ; 5546 _ 0F B6. 00
        test    al, al                                  ; 5549 _ 84. C0
        jnz     ?_388                                   ; 554B _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 554D _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 5550 _ 8B. 45, 0C
        add     eax, edx                                ; 5553 _ 01. D0
        movzx   eax, byte [eax]                         ; 5555 _ 0F B6. 00
        test    al, al                                  ; 5558 _ 84. C0
        jz      ?_388                                   ; 555A _ 74, 07
        mov     eax, 0                                  ; 555C _ B8, 00000000
        jmp     ?_390                                   ; 5561 _ EB, 2A

?_388:  mov     edx, dword [ebp-4H]                     ; 5563 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5566 _ 8B. 45, 08
        add     eax, edx                                ; 5569 _ 01. D0
        movzx   eax, byte [eax]                         ; 556B _ 0F B6. 00
        test    al, al                                  ; 556E _ 84. C0
        jz      ?_389                                   ; 5570 _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 5572 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 5575 _ 8B. 45, 0C
        add     eax, edx                                ; 5578 _ 01. D0
        movzx   eax, byte [eax]                         ; 557A _ 0F B6. 00
        test    al, al                                  ; 557D _ 84. C0
        jz      ?_389                                   ; 557F _ 74, 07
        mov     eax, 0                                  ; 5581 _ B8, 00000000
        jmp     ?_390                                   ; 5586 _ EB, 05

?_389:  mov     eax, 1                                  ; 5588 _ B8, 00000001
?_390:  leave                                           ; 558D _ C9
        ret                                             ; 558E _ C3
; strcmp End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 558F _ 55
        mov     ebp, esp                                ; 5590 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 5592 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_391                                   ; 5599 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 559B _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 55A2 _ 8B. 45, 0C
        shr     eax, 12                                 ; 55A5 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 55A8 _ 89. 45, 0C
?_391:  mov     eax, dword [ebp+0CH]                    ; 55AB _ 8B. 45, 0C
        mov     edx, eax                                ; 55AE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 55B0 _ 8B. 45, 08
        mov     word [eax], dx                          ; 55B3 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 55B6 _ 8B. 45, 10
        mov     edx, eax                                ; 55B9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 55BB _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 55BE _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 55C2 _ 8B. 45, 10
        sar     eax, 16                                 ; 55C5 _ C1. F8, 10
        mov     edx, eax                                ; 55C8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 55CA _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 55CD _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 55D0 _ 8B. 45, 14
        mov     edx, eax                                ; 55D3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 55D5 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 55D8 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 55DB _ 8B. 45, 0C
        shr     eax, 16                                 ; 55DE _ C1. E8, 10
        and     eax, 0FH                                ; 55E1 _ 83. E0, 0F
        mov     edx, eax                                ; 55E4 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 55E6 _ 8B. 45, 14
        sar     eax, 8                                  ; 55E9 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 55EC _ 83. E0, F0
        or      eax, edx                                ; 55EF _ 09. D0
        mov     edx, eax                                ; 55F1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 55F3 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 55F6 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 55F9 _ 8B. 45, 10
        shr     eax, 24                                 ; 55FC _ C1. E8, 18
        mov     edx, eax                                ; 55FF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5601 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 5604 _ 88. 50, 07
        nop                                             ; 5607 _ 90
        pop     ebp                                     ; 5608 _ 5D
        ret                                             ; 5609 _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 560A _ 55
        mov     ebp, esp                                ; 560B _ 89. E5
        mov     eax, dword [taskctl]                    ; 560D _ A1, 00002308(d)
        pop     ebp                                     ; 5612 _ 5D
        ret                                             ; 5613 _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 5614 _ 55
        mov     ebp, esp                                ; 5615 _ 89. E5
        sub     esp, 16                                 ; 5617 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 561A _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp+8H]                     ; 5620 _ 8B. 55, 08
        mov     eax, edx                                ; 5623 _ 89. D0
        add     eax, eax                                ; 5625 _ 01. C0
        add     eax, edx                                ; 5627 _ 01. D0
        shl     eax, 4                                  ; 5629 _ C1. E0, 04
        add     eax, ecx                                ; 562C _ 01. C8
        mov     dword [eax+8H], 0                       ; 562E _ C7. 40, 08, 00000000
        mov     ecx, dword [taskctl]                    ; 5635 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp+8H]                     ; 563B _ 8B. 55, 08
        mov     eax, edx                                ; 563E _ 89. D0
        add     eax, eax                                ; 5640 _ 01. C0
        add     eax, edx                                ; 5642 _ 01. D0
        shl     eax, 4                                  ; 5644 _ C1. E0, 04
        add     eax, ecx                                ; 5647 _ 01. C8
        mov     dword [eax+0CH], 0                      ; 5649 _ C7. 40, 0C, 00000000
        mov     dword [ebp-4H], 0                       ; 5650 _ C7. 45, FC, 00000000
        jmp     ?_393                                   ; 5657 _ EB, 19

?_392:  mov     edx, dword [taskctl]                    ; 5659 _ 8B. 15, 00002308(d)
        mov     eax, dword [ebp-4H]                     ; 565F _ 8B. 45, FC
        imul    eax, eax, 52                            ; 5662 _ 6B. C0, 34
        add     eax, edx                                ; 5665 _ 01. D0
        mov     dword [eax+10H], 0                      ; 5667 _ C7. 40, 10, 00000000
        add     dword [ebp-4H], 1                       ; 566E _ 83. 45, FC, 01
?_393:  cmp     dword [ebp-4H], 9                       ; 5672 _ 83. 7D, FC, 09
        jle     ?_392                                   ; 5676 _ 7E, E1
        leave                                           ; 5678 _ C9
        ret                                             ; 5679 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 567A _ 55
        mov     ebp, esp                                ; 567B _ 89. E5
        sub     esp, 24                                 ; 567D _ 83. EC, 18
        call    get_addr_gdt                            ; 5680 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 5685 _ 89. 45, F0
        sub     esp, 8                                  ; 5688 _ 83. EC, 08
        push    3128                                    ; 568B _ 68, 00000C38
        push    dword [ebp+8H]                          ; 5690 _ FF. 75, 08
        call    memman_alloc_4k                         ; 5693 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5698 _ 83. C4, 10
        mov     dword [taskctl], eax                    ; 569B _ A3, 00002308(d)
        mov     dword [ebp-14H], 0                      ; 56A0 _ C7. 45, EC, 00000000
        jmp     ?_395                                   ; 56A7 _ E9, 000000E9

?_394:  mov     edx, dword [taskctl]                    ; 56AC _ 8B. 15, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 56B2 _ 8B. 45, EC
        imul    eax, eax, 208                           ; 56B5 _ 69. C0, 000000D0
        add     eax, edx                                ; 56BB _ 01. D0
        add     eax, 480                                ; 56BD _ 05, 000001E0
        mov     dword [eax+0CH], 0                      ; 56C2 _ C7. 40, 0C, 00000000
        mov     ecx, dword [taskctl]                    ; 56C9 _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 56CF _ 8B. 45, EC
        add     eax, 7                                  ; 56D2 _ 83. C0, 07
        lea     edx, [eax*8]                            ; 56D5 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 56DC _ 8B. 45, EC
        imul    eax, eax, 208                           ; 56DF _ 69. C0, 000000D0
        add     eax, ecx                                ; 56E5 _ 01. C8
        add     eax, 480                                ; 56E7 _ 05, 000001E0
        mov     dword [eax+8H], edx                     ; 56EC _ 89. 50, 08
        mov     ecx, dword [taskctl]                    ; 56EF _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 56F5 _ 8B. 45, EC
        add     eax, 17                                 ; 56F8 _ 83. C0, 11
        lea     edx, [eax*8]                            ; 56FB _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 5702 _ 8B. 45, EC
        imul    eax, eax, 208                           ; 5705 _ 69. C0, 000000D0
        add     eax, ecx                                ; 570B _ 01. C8
        add     eax, 608                                ; 570D _ 05, 00000260
        mov     dword [eax+14H], edx                    ; 5712 _ 89. 50, 14
        mov     eax, dword [taskctl]                    ; 5715 _ A1, 00002308(d)
        mov     edx, dword [ebp-14H]                    ; 571A _ 8B. 55, EC
        imul    edx, edx, 208                           ; 571D _ 69. D2, 000000D0
        add     edx, 512                                ; 5723 _ 81. C2, 00000200
        add     eax, edx                                ; 5729 _ 01. D0
        add     eax, 20                                 ; 572B _ 83. C0, 14
        mov     ecx, eax                                ; 572E _ 89. C1
        mov     eax, dword [ebp-14H]                    ; 5730 _ 8B. 45, EC
        add     eax, 7                                  ; 5733 _ 83. C0, 07
        lea     edx, [eax*8]                            ; 5736 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-10H]                    ; 573D _ 8B. 45, F0
        add     eax, edx                                ; 5740 _ 01. D0
        push    137                                     ; 5742 _ 68, 00000089
        push    ecx                                     ; 5747 _ 51
        push    103                                     ; 5748 _ 6A, 67
        push    eax                                     ; 574A _ 50
        call    set_segmdesc                            ; 574B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5750 _ 83. C4, 10
        mov     eax, dword [taskctl]                    ; 5753 _ A1, 00002308(d)
        mov     edx, dword [ebp-14H]                    ; 5758 _ 8B. 55, EC
        imul    edx, edx, 208                           ; 575B _ 69. D2, 000000D0
        add     edx, 656                                ; 5761 _ 81. C2, 00000290
        add     eax, edx                                ; 5767 _ 01. D0
        add     eax, 20                                 ; 5769 _ 83. C0, 14
        mov     ecx, eax                                ; 576C _ 89. C1
        mov     eax, dword [ebp-14H]                    ; 576E _ 8B. 45, EC
        add     eax, 17                                 ; 5771 _ 83. C0, 11
        lea     edx, [eax*8]                            ; 5774 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-10H]                    ; 577B _ 8B. 45, F0
        add     eax, edx                                ; 577E _ 01. D0
        push    130                                     ; 5780 _ 68, 00000082
        push    ecx                                     ; 5785 _ 51
        push    15                                      ; 5786 _ 6A, 0F
        push    eax                                     ; 5788 _ 50
        call    set_segmdesc                            ; 5789 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 578E _ 83. C4, 10
        add     dword [ebp-14H], 1                      ; 5791 _ 83. 45, EC, 01
?_395:  cmp     dword [ebp-14H], 9                      ; 5795 _ 83. 7D, EC, 09
        jle     ?_394                                   ; 5799 _ 0F 8E, FFFFFF0D
        mov     dword [ebp-14H], 0                      ; 579F _ C7. 45, EC, 00000000
        jmp     ?_397                                   ; 57A6 _ EB, 12

?_396:  sub     esp, 12                                 ; 57A8 _ 83. EC, 0C
        push    dword [ebp-14H]                         ; 57AB _ FF. 75, EC
        call    init_task_level                         ; 57AE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 57B3 _ 83. C4, 10
        add     dword [ebp-14H], 1                      ; 57B6 _ 83. 45, EC, 01
?_397:  cmp     dword [ebp-14H], 9                      ; 57BA _ 83. 7D, EC, 09
        jle     ?_396                                   ; 57BE _ 7E, E8
        call    task_alloc                              ; 57C0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 57C5 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 57C8 _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 57CB _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 57D2 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 57D5 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 57DC _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 57DF _ C7. 40, 0C, 00000000
        sub     esp, 12                                 ; 57E6 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 57E9 _ FF. 75, F4
        call    task_add                                ; 57EC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 57F1 _ 83. C4, 10
        call    task_switchsub                          ; 57F4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 57F9 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 57FC _ 8B. 00
        sub     esp, 12                                 ; 57FE _ 83. EC, 0C
        push    eax                                     ; 5801 _ 50
        call    load_tr                                 ; 5802 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5807 _ 83. C4, 10
        call    timer_alloc                             ; 580A _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 580F _ A3, 00002304(d)
        mov     eax, dword [ebp-0CH]                    ; 5814 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 5817 _ 8B. 40, 08
        mov     edx, eax                                ; 581A _ 89. C2
        mov     eax, dword [task_timer]                 ; 581C _ A1, 00002304(d)
        sub     esp, 8                                  ; 5821 _ 83. EC, 08
        push    edx                                     ; 5824 _ 52
        push    eax                                     ; 5825 _ 50
        call    timer_settime                           ; 5826 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 582B _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 582E _ 8B. 45, F4
        leave                                           ; 5831 _ C9
        ret                                             ; 5832 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 5833 _ 55
        mov     ebp, esp                                ; 5834 _ 89. E5
        sub     esp, 16                                 ; 5836 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 5839 _ C7. 45, F8, 00000000
        jmp     ?_400                                   ; 5840 _ E9, 000000F9

?_398:  mov     edx, dword [taskctl]                    ; 5845 _ 8B. 15, 00002308(d)
        mov     eax, dword [ebp-8H]                     ; 584B _ 8B. 45, F8
        imul    eax, eax, 208                           ; 584E _ 69. C0, 000000D0
        add     eax, edx                                ; 5854 _ 01. D0
        add     eax, 480                                ; 5856 _ 05, 000001E0
        mov     eax, dword [eax+0CH]                    ; 585B _ 8B. 40, 0C
        test    eax, eax                                ; 585E _ 85. C0
        jne     ?_399                                   ; 5860 _ 0F 85, 000000D4
        mov     eax, dword [taskctl]                    ; 5866 _ A1, 00002308(d)
        mov     edx, dword [ebp-8H]                     ; 586B _ 8B. 55, F8
        imul    edx, edx, 208                           ; 586E _ 69. D2, 000000D0
        add     edx, 480                                ; 5874 _ 81. C2, 000001E0
        add     eax, edx                                ; 587A _ 01. D0
        add     eax, 8                                  ; 587C _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 587F _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 5882 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 5885 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 588C _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 588F _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 5896 _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 5899 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 58A0 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 58A3 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 58AA _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 58AD _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 58B4 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 58B7 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 58BE _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 58C1 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 58C8 _ 8B. 45, F8
        add     eax, 1                                  ; 58CB _ 83. C0, 01
        shl     eax, 9                                  ; 58CE _ C1. E0, 09
        mov     edx, eax                                ; 58D1 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 58D3 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 58D6 _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 58D9 _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 58DC _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 58E3 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 58E6 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 58ED _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 58F0 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 58F7 _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 58FA _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 5904 _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 5907 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 5911 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 5914 _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 591E _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 5921 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 5928 _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 592B _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 5935 _ 8B. 45, FC
        jmp     ?_401                                   ; 5938 _ EB, 13

?_399:  add     dword [ebp-8H], 1                       ; 593A _ 83. 45, F8, 01
?_400:  cmp     dword [ebp-8H], 9                       ; 593E _ 83. 7D, F8, 09
        jle     ?_398                                   ; 5942 _ 0F 8E, FFFFFEFD
        mov     eax, 0                                  ; 5948 _ B8, 00000000
?_401:  leave                                           ; 594D _ C9
        ret                                             ; 594E _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 594F _ 55
        mov     ebp, esp                                ; 5950 _ 89. E5
        sub     esp, 8                                  ; 5952 _ 83. EC, 08
        cmp     dword [ebp+0CH], 0                      ; 5955 _ 83. 7D, 0C, 00
        jns     ?_402                                   ; 5959 _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 595B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 595E _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 5961 _ 89. 45, 0C
?_402:  cmp     dword [ebp+10H], 0                      ; 5964 _ 83. 7D, 10, 00
        jle     ?_403                                   ; 5968 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 596A _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 596D _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 5970 _ 89. 50, 08
?_403:  mov     eax, dword [ebp+8H]                     ; 5973 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5976 _ 8B. 40, 04
        cmp     eax, 2                                  ; 5979 _ 83. F8, 02
        jnz     ?_404                                   ; 597C _ 75, 19
        mov     eax, dword [ebp+8H]                     ; 597E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5981 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 5984 _ 3B. 45, 0C
        jz      ?_404                                   ; 5987 _ 74, 0E
        sub     esp, 12                                 ; 5989 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 598C _ FF. 75, 08
        call    task_remove                             ; 598F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5994 _ 83. C4, 10
?_404:  mov     eax, dword [ebp+8H]                     ; 5997 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 599A _ 8B. 40, 04
        cmp     eax, 2                                  ; 599D _ 83. F8, 02
        jz      ?_405                                   ; 59A0 _ 74, 17
        mov     eax, dword [ebp+8H]                     ; 59A2 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 59A5 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 59A8 _ 89. 50, 0C
        sub     esp, 12                                 ; 59AB _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 59AE _ FF. 75, 08
        call    task_add                                ; 59B1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 59B6 _ 83. C4, 10
?_405:  mov     eax, dword [taskctl]                    ; 59B9 _ A1, 00002308(d)
        mov     dword [eax+4H], 1                       ; 59BE _ C7. 40, 04, 00000001
        nop                                             ; 59C5 _ 90
        leave                                           ; 59C6 _ C9
        ret                                             ; 59C7 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 59C8 _ 55
        mov     ebp, esp                                ; 59C9 _ 89. E5
        sub     esp, 24                                 ; 59CB _ 83. EC, 18
        mov     ecx, dword [taskctl]                    ; 59CE _ 8B. 0D, 00002308(d)
        mov     eax, dword [taskctl]                    ; 59D4 _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 59D9 _ 8B. 10
        mov     eax, edx                                ; 59DB _ 89. D0
        add     eax, eax                                ; 59DD _ 01. C0
        add     eax, edx                                ; 59DF _ 01. D0
        shl     eax, 4                                  ; 59E1 _ C1. E0, 04
        add     eax, ecx                                ; 59E4 _ 01. C8
        add     eax, 8                                  ; 59E6 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 59E9 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 59EC _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 59EF _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 59F2 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 59F5 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 59F9 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 59FC _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 59FF _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 5A02 _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 5A05 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 5A08 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5A0B _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5A0E _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5A11 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 5A14 _ 8B. 00
        cmp     edx, eax                                ; 5A16 _ 39. C2
        jnz     ?_406                                   ; 5A18 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 5A1A _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 5A1D _ C7. 40, 04, 00000000
?_406:  mov     eax, dword [taskctl]                    ; 5A24 _ A1, 00002308(d)
        mov     eax, dword [eax+4H]                     ; 5A29 _ 8B. 40, 04
        test    eax, eax                                ; 5A2C _ 85. C0
        jz      ?_407                                   ; 5A2E _ 74, 23
        call    task_switchsub                          ; 5A30 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 5A35 _ 8B. 0D, 00002308(d)
        mov     eax, dword [taskctl]                    ; 5A3B _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 5A40 _ 8B. 10
        mov     eax, edx                                ; 5A42 _ 89. D0
        add     eax, eax                                ; 5A44 _ 01. C0
        add     eax, edx                                ; 5A46 _ 01. D0
        shl     eax, 4                                  ; 5A48 _ C1. E0, 04
        add     eax, ecx                                ; 5A4B _ 01. C8
        add     eax, 8                                  ; 5A4D _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 5A50 _ 89. 45, EC
?_407:  mov     eax, dword [ebp-14H]                    ; 5A53 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5A56 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5A59 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 5A5C _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 5A60 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 5A63 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 5A66 _ 8B. 40, 08
        mov     edx, eax                                ; 5A69 _ 89. C2
        mov     eax, dword [task_timer]                 ; 5A6B _ A1, 00002304(d)
        sub     esp, 8                                  ; 5A70 _ 83. EC, 08
        push    edx                                     ; 5A73 _ 52
        push    eax                                     ; 5A74 _ 50
        call    timer_settime                           ; 5A75 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5A7A _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 5A7D _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 5A80 _ 3B. 45, F0
        jz      ?_408                                   ; 5A83 _ 74, 19
        cmp     dword [ebp-0CH], 0                      ; 5A85 _ 83. 7D, F4, 00
        jz      ?_408                                   ; 5A89 _ 74, 13
        mov     eax, dword [ebp-0CH]                    ; 5A8B _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 5A8E _ 8B. 00
        sub     esp, 8                                  ; 5A90 _ 83. EC, 08
        push    eax                                     ; 5A93 _ 50
        push    0                                       ; 5A94 _ 6A, 00
        call    farjmp                                  ; 5A96 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5A9B _ 83. C4, 10
?_408:  nop                                             ; 5A9E _ 90
        leave                                           ; 5A9F _ C9
        ret                                             ; 5AA0 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 5AA1 _ 55
        mov     ebp, esp                                ; 5AA2 _ 89. E5
        sub     esp, 24                                 ; 5AA4 _ 83. EC, 18
        mov     dword [ebp-0CH], 0                      ; 5AA7 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 5AAE _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 5AB5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5AB8 _ 8B. 40, 04
        cmp     eax, 2                                  ; 5ABB _ 83. F8, 02
        jnz     ?_409                                   ; 5ABE _ 75, 52
        call    task_now                                ; 5AC0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 5AC5 _ 89. 45, F4
        sub     esp, 12                                 ; 5AC8 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 5ACB _ FF. 75, 08
        call    task_remove                             ; 5ACE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5AD3 _ 83. C4, 10
        mov     dword [ebp-10H], 1                      ; 5AD6 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 5ADD _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 5AE0 _ 3B. 45, F4
        jnz     ?_409                                   ; 5AE3 _ 75, 2D
        call    task_switchsub                          ; 5AE5 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 5AEA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 5AEF _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 5AF2 _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 5AF9 _ 83. 7D, F4, 00
        jz      ?_409                                   ; 5AFD _ 74, 13
        mov     eax, dword [ebp-0CH]                    ; 5AFF _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 5B02 _ 8B. 00
        sub     esp, 8                                  ; 5B04 _ 83. EC, 08
        push    eax                                     ; 5B07 _ 50
        push    0                                       ; 5B08 _ 6A, 00
        call    farjmp                                  ; 5B0A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5B0F _ 83. C4, 10
?_409:  mov     eax, dword [ebp-10H]                    ; 5B12 _ 8B. 45, F0
        leave                                           ; 5B15 _ C9
        ret                                             ; 5B16 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 5B17 _ 55
        mov     ebp, esp                                ; 5B18 _ 89. E5
        sub     esp, 16                                 ; 5B1A _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5B1D _ 8B. 0D, 00002308(d)
        mov     eax, dword [taskctl]                    ; 5B23 _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 5B28 _ 8B. 10
        mov     eax, edx                                ; 5B2A _ 89. D0
        add     eax, eax                                ; 5B2C _ 01. C0
        add     eax, edx                                ; 5B2E _ 01. D0
        shl     eax, 4                                  ; 5B30 _ C1. E0, 04
        add     eax, ecx                                ; 5B33 _ 01. C8
        add     eax, 8                                  ; 5B35 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5B38 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 5B3B _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 5B3E _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 5B41 _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 5B44 _ 8B. 44 90, 08
        leave                                           ; 5B48 _ C9
        ret                                             ; 5B49 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 5B4A _ 55
        mov     ebp, esp                                ; 5B4B _ 89. E5
        sub     esp, 16                                 ; 5B4D _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5B50 _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp+8H]                     ; 5B56 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5B59 _ 8B. 50, 0C
        mov     eax, edx                                ; 5B5C _ 89. D0
        add     eax, eax                                ; 5B5E _ 01. C0
        add     eax, edx                                ; 5B60 _ 01. D0
        shl     eax, 4                                  ; 5B62 _ C1. E0, 04
        add     eax, ecx                                ; 5B65 _ 01. C8
        add     eax, 8                                  ; 5B67 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5B6A _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 5B6D _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 5B70 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 5B72 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 5B75 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 5B78 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 5B7C _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5B7F _ 8B. 00
        lea     edx, [eax+1H]                           ; 5B81 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 5B84 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 5B87 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 5B89 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 5B8C _ C7. 40, 04, 00000002
        nop                                             ; 5B93 _ 90
        leave                                           ; 5B94 _ C9
        ret                                             ; 5B95 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 5B96 _ 55
        mov     ebp, esp                                ; 5B97 _ 89. E5
        sub     esp, 16                                 ; 5B99 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5B9C _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp+8H]                     ; 5BA2 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5BA5 _ 8B. 50, 0C
        mov     eax, edx                                ; 5BA8 _ 89. D0
        add     eax, eax                                ; 5BAA _ 01. C0
        add     eax, edx                                ; 5BAC _ 01. D0
        shl     eax, 4                                  ; 5BAE _ C1. E0, 04
        add     eax, ecx                                ; 5BB1 _ 01. C8
        add     eax, 8                                  ; 5BB3 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5BB6 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 5BB9 _ C7. 45, F8, 00000000
        jmp     ?_412                                   ; 5BC0 _ EB, 23

?_410:  mov     eax, dword [ebp-4H]                     ; 5BC2 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 5BC5 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 5BC8 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 5BCC _ 3B. 45, 08
        jnz     ?_411                                   ; 5BCF _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 5BD1 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 5BD4 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 5BD7 _ C7. 44 90, 08, 00000000
        jmp     ?_413                                   ; 5BDF _ EB, 0E

?_411:  add     dword [ebp-8H], 1                       ; 5BE1 _ 83. 45, F8, 01
?_412:  mov     eax, dword [ebp-4H]                     ; 5BE5 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5BE8 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 5BEA _ 3B. 45, F8
        jg      ?_410                                   ; 5BED _ 7F, D3
?_413:  mov     eax, dword [ebp-4H]                     ; 5BEF _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5BF2 _ 8B. 00
        lea     edx, [eax-1H]                           ; 5BF4 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 5BF7 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 5BFA _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 5BFC _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 5BFF _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 5C02 _ 3B. 45, F8
        jle     ?_414                                   ; 5C05 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 5C07 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 5C0A _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 5C0D _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 5C10 _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 5C13 _ 89. 50, 04
?_414:  mov     eax, dword [ebp-4H]                     ; 5C16 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 5C19 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 5C1C _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5C1F _ 8B. 00
        cmp     edx, eax                                ; 5C21 _ 39. C2
        jl      ?_415                                   ; 5C23 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 5C25 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 5C28 _ C7. 40, 04, 00000000
?_415:  mov     eax, dword [ebp+8H]                     ; 5C2F _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 5C32 _ C7. 40, 04, 00000001
        jmp     ?_417                                   ; 5C39 _ EB, 1B

?_416:  mov     eax, dword [ebp-8H]                     ; 5C3B _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 5C3E _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 5C41 _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 5C44 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 5C48 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 5C4B _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 5C4E _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 5C52 _ 83. 45, F8, 01
?_417:  mov     eax, dword [ebp-4H]                     ; 5C56 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5C59 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 5C5B _ 3B. 45, F8
        jg      ?_416                                   ; 5C5E _ 7F, DB
        nop                                             ; 5C60 _ 90
        leave                                           ; 5C61 _ C9
        ret                                             ; 5C62 _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 5C63 _ 55
        mov     ebp, esp                                ; 5C64 _ 89. E5
        sub     esp, 16                                 ; 5C66 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 5C69 _ C7. 45, FC, 00000000
        jmp     ?_420                                   ; 5C70 _ EB, 21

?_418:  mov     ecx, dword [taskctl]                    ; 5C72 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 5C78 _ 8B. 55, FC
        mov     eax, edx                                ; 5C7B _ 89. D0
        add     eax, eax                                ; 5C7D _ 01. C0
        add     eax, edx                                ; 5C7F _ 01. D0
        shl     eax, 4                                  ; 5C81 _ C1. E0, 04
        add     eax, ecx                                ; 5C84 _ 01. C8
        mov     eax, dword [eax+8H]                     ; 5C86 _ 8B. 40, 08
        test    eax, eax                                ; 5C89 _ 85. C0
        jle     ?_419                                   ; 5C8B _ 7E, 02
        jmp     ?_421                                   ; 5C8D _ EB, 0A

?_419:  add     dword [ebp-4H], 1                       ; 5C8F _ 83. 45, FC, 01
?_420:  cmp     dword [ebp-4H], 9                       ; 5C93 _ 83. 7D, FC, 09
        jle     ?_418                                   ; 5C97 _ 7E, D9
?_421:  mov     eax, dword [taskctl]                    ; 5C99 _ A1, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 5C9E _ 8B. 55, FC
        mov     dword [eax], edx                        ; 5CA1 _ 89. 10
        mov     eax, dword [taskctl]                    ; 5CA3 _ A1, 00002308(d)
        mov     dword [eax+4H], 0                       ; 5CA8 _ C7. 40, 04, 00000000
        leave                                           ; 5CAF _ C9
        ret                                             ; 5CB0 _ C3
; task_switchsub End of function

send_message:; Function begin
        push    ebp                                     ; 5CB1 _ 55
        mov     ebp, esp                                ; 5CB2 _ 89. E5
        sub     esp, 8                                  ; 5CB4 _ 83. EC, 08
        mov     eax, dword [ebp+10H]                    ; 5CB7 _ 8B. 45, 10
        movzx   eax, al                                 ; 5CBA _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 5CBD _ 8B. 55, 0C
        add     edx, 16                                 ; 5CC0 _ 83. C2, 10
        sub     esp, 8                                  ; 5CC3 _ 83. EC, 08
        push    eax                                     ; 5CC6 _ 50
        push    edx                                     ; 5CC7 _ 52
        call    fifo8_put                               ; 5CC8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5CCD _ 83. C4, 10
        sub     esp, 12                                 ; 5CD0 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 5CD3 _ FF. 75, 08
        call    task_sleep                              ; 5CD6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5CDB _ 83. C4, 10
        leave                                           ; 5CDE _ C9
        ret                                             ; 5CDF _ C3
; send_message End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_422:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_423:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0008 _ task_a.

?_424:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 000F _ console.

?_425:                                                  ; byte
        db 20H, 00H                                     ; 0017 _  .

?_426:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0019 _ free .

?_427:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 001F _  KB.

?_428:                                                  ; byte
        db 3EH, 00H                                     ; 0023 _ >.

?_429:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 0025 _ mem.

?_430:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 0029 _ cls.

?_431:                                                  ; byte
        db 68H, 6CH, 74H, 00H                           ; 002D _ hlt.

?_432:                                                  ; byte
        db 61H, 62H, 63H, 2EH, 65H, 78H, 65H, 00H       ; 0031 _ abc.exe.

?_433:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 0039 _ dir.

?_434:                                                  ; byte
        db 65H, 78H, 69H, 74H, 00H                      ; 003D _ exit.

?_435:                                                  ; byte
        db 73H, 74H, 61H, 72H, 74H, 00H                 ; 0042 _ start.

?_436:                                                  ; byte
        db 6EH, 63H, 73H, 74H, 00H                      ; 0048 _ ncst.

?_437:                                                  ; byte
        db 63H, 72H, 61H, 63H, 6BH, 00H                 ; 004D _ crack.

?_438:                                                  ; byte
        db 63H, 72H, 61H, 63H, 6BH, 2EH, 65H, 78H       ; 0053 _ crack.ex
        db 65H, 00H                                     ; 005B _ e.

?_439:                                                  ; byte
        db 6BH, 65H, 79H, 62H, 6FH, 61H, 72H, 64H       ; 005D _ keyboard
        db 00H                                          ; 0065 _ .

?_440:                                                  ; byte
        db 75H, 73H, 65H, 72H, 20H, 70H, 72H, 6FH       ; 0066 _ user pro
        db 63H, 00H                                     ; 006E _ c.

?_441:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0070 _ page is:
        db 20H, 00H                                     ; 0078 _  .

?_442:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 007A _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0082 _ L: .

?_443:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0086 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 008E _ H: .

?_444:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0092 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 009A _ w: .

?_445:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 4FH, 43H, 00H            ; 009E _ INT OC.

?_446:                                                  ; byte
        db 53H, 74H, 61H, 63H, 6BH, 20H, 45H, 78H       ; 00A5 _ Stack Ex
        db 63H, 65H, 70H, 74H, 69H, 6FH, 6EH, 00H       ; 00AD _ ception.

?_447:                                                  ; byte
        db 45H, 49H, 50H, 20H, 3DH, 20H, 00H            ; 00B5 _ EIP = .

?_448:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 30H, 44H, 20H, 00H       ; 00BC _ INT 0D .

?_449:                                                  ; byte
        db 47H, 65H, 6EH, 65H, 72H, 61H, 6CH, 20H       ; 00C4 _ General 
        db 50H, 72H, 6FH, 74H, 65H, 63H, 74H, 65H       ; 00CC _ Protecte
        db 64H, 20H, 45H, 78H, 63H, 65H, 70H, 74H       ; 00D4 _ d Except
        db 69H, 6FH, 6EH, 00H                           ; 00DC _ ion.


SECTION .data   align=64 noexecute                      ; section number 3, data

memman:                                                 ; dword
        dd 00100000H, 00000000H                         ; 0000 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0008 _ 0 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 
        dd 00000000H, 00000000H                         ; 0020 _ 0 0 
        dd 00000000H, 00000000H                         ; 0028 _ 0 0 
        dd 00000000H, 00000000H                         ; 0030 _ 0 0 
        dd 00000000H, 00000000H                         ; 0038 _ 0 0 

keytable:                                               ; byte
        db 00H, 00H, 31H, 32H, 33H, 34H, 35H, 36H       ; 0040 _ ..123456
        db 37H, 38H, 39H, 30H, 2DH, 5EH, 00H, 00H       ; 0048 _ 7890-^..
        db 51H, 57H, 45H, 52H, 54H, 59H, 55H, 49H       ; 0050 _ QWERTYUI
        db 4FH, 50H, 40H, 5BH, 00H, 00H, 41H, 53H       ; 0058 _ OP@[..AS
        db 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH, 3BH       ; 0060 _ DFGHJKL;
        db 3AH, 00H, 00H, 5DH, 5AH, 58H, 43H, 56H       ; 0068 _ :..]ZXCV
        db 42H, 4EH, 4DH, 2CH, 2EH, 2FH, 00H, 2AH       ; 0070 _ BNM,./.*
        db 00H, 20H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ . ......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 37H       ; 0080 _ .......7
        db 38H, 39H, 2DH, 34H, 35H, 36H, 2BH, 31H       ; 0088 _ 89-456+1
        db 32H, 33H, 30H, 2EH, 00H, 00H, 00H, 00H       ; 0090 _ 230.....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0098 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00A0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

keytable1:                                              ; byte
        db 00H, 00H, 21H, 40H, 23H, 24H, 25H, 5EH       ; 00C0 _ ..!@#$%^
        db 26H, 2AH, 28H, 29H, 2DH, 3DH, 7EH, 00H       ; 00C8 _ &*()-=~.
        db 00H, 51H, 57H, 45H, 52H, 54H, 59H, 55H       ; 00D0 _ .QWERTYU
        db 49H, 4FH, 50H, 60H, 7BH, 00H, 00H, 41H       ; 00D8 _ IOP`{..A
        db 53H, 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH       ; 00E0 _ SDFGHJKL
        db 2BH, 2AH, 00H, 00H, 7DH, 5AH, 58H, 43H       ; 00E8 _ +*..}ZXC
        db 56H, 42H, 4EH, 4DH, 3CH, 3EH, 3FH, 00H       ; 00F0 _ VBNM<>?.
        db 2AH, 00H, 20H, 00H, 00H, 00H, 00H, 00H       ; 00F8 _ *. .....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0100 _ ........
        db 37H, 38H, 39H, 2DH, 34H, 35H, 36H, 2BH       ; 0108 _ 789-456+
        db 31H, 32H, 33H, 30H, 2EH, 00H, 00H, 00H       ; 0110 _ 1230....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0118 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0120 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0128 _ ........
        db 00H, 00H, 00H, 00H, 5FH, 00H, 00H, 00H       ; 0130 _ ...._...
        db 00H, 00H, 00H, 00H, 00H, 00H, 7CH, 00H       ; 0138 _ ......|.
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0140 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0148 _ ........

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0150 _ 0X

?_450:  db 00H                                          ; 0152 _ .

?_451:  db 00H, 00H, 00H, 00H, 00H                      ; 0153 _ .....

mmx:    dd 0FFFFFFFFH                                   ; 0158 _ -1 

mmy:    dd 0FFFFFFFFH                                   ; 015C _ -1 

KEY_CONTROL:                                            ; dword
        dd 0000001DH                                    ; 0160 _ 29 

show_console_window:                                    ; dword
        dd 00000001H                                    ; 0164 _ 1 

console_pos:                                            ; dword
        dd 000000F0H, 00000000H                         ; 0168 _ 240 0 
        dd 00000000H, 00000000H                         ; 0170 _ 0 0 
        dd 00000000H, 00000000H                         ; 0178 _ 0 0 

table_rgb.2152:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0180 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0188 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0190 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0198 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 01A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 01A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01B8 _ ........

cursor.2212:                                            ; byte
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH       ; 01C0 _ ********
        db 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2EH, 2EH       ; 01C8 _ ******..
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01D0 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 01D8 _ OOOO*...
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01E0 _ *OOOOOOO
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 01E8 _ OOO*....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01F0 _ *OOOOOOO
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01F8 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0200 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0208 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0210 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0218 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0220 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0228 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0230 _ *OOOOOOO
        db 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0238 _ O*......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 4FH       ; 0240 _ *OOOO**O
        db 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0248 _ OO*.....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2AH       ; 0250 _ *OOO*..*
        db 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0258 _ OOO*....
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0260 _ *OO*....
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0268 _ *OOO*...
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0270 _ *O*.....
        db 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 0278 _ .*OOO*..
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0280 _ **......
        db 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 0288 _ ..*OOO*.
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0290 _ *.......
        db 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 4FH, 2AH       ; 0298 _ ...*OOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 02A0 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 4FH, 2AH       ; 02A8 _ ....*OO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 02B0 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2AH, 2AH       ; 02B8 _ .....***

closebtn.2331:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 02C0 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 02C8 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 02D0 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02D8 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 02E0 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02E8 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 02F0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 02F8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 0300 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 0308 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 0310 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0318 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 0320 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0328 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 0330 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0338 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 0340 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 0348 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0350 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0358 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0360 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0368 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0370 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0378 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0380 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0388 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0390 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0398 _ @@@@@@@@


SECTION .bss    align=64 noexecute                      ; section number 4, bss

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

?_452:  resw    1                                       ; 0018

?_453:  resw    1                                       ; 001A

keyinfo:                                                ; byte
        resb    24                                      ; 001C

?_454:  resd    1                                       ; 0034

mouseinfo:                                              ; byte
        resb    40                                      ; 0038

keybuf:                                                 ; yword
        resb    32                                      ; 0060

mousebuf:                                               ; byte
        resb    128                                     ; 0080

mdec:                                                   ; oword
        resb    12                                      ; 0100

?_455:  resd    1                                       ; 010C

timerinfo:                                              ; byte
        resb    28                                      ; 0110

timerbuf: resq  1                                       ; 012C

mx:     resd    1                                       ; 0134

my:     resd    1                                       ; 0138

xsize:  resd    1                                       ; 013C

ysize:  resd    1                                       ; 0140

buf_back: resd  15                                      ; 0144

buf_mouse:                                              ; byte
        resb    256                                     ; 0180

shtMsgBox:                                              ; dword
        resd    1                                       ; 0280

shtctl: resd    1                                       ; 0284

sht_back: resd  1                                       ; 0288

sht_mouse:                                              ; dword
        resd    1                                       ; 028C

mouse_clicked_sht:                                      ; dword
        resd    1                                       ; 0290

task_main:                                              ; dword
        resd    1                                       ; 0294

current_console_task:                                   ; dword
        resd    1                                       ; 0298

task_a.1848:                                            ; dword
        resd    9                                       ; 029C

tss_a.1847:                                             ; byte
        resb    128                                     ; 02C0

tss_b.1846:                                             ; byte
        resb    104                                     ; 0340

task_b.1836:                                            ; byte
        resb    12                                      ; 03A8

str.2260:                                               ; byte
        resb    1                                       ; 03B4

?_456:  resb    9                                       ; 03B5

?_457:  resb    2                                       ; 03BE

timerctl:                                               ; byte
        resd    2001                                    ; 03C0

task_timer:                                             ; dword
        resd    1                                       ; 2304

taskctl: resd   1                                       ; 2308


