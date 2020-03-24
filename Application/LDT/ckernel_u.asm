; Disassembly of file: ckernel.o
; Fri Dec  8 16:06:44 2017
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
        sub     esp, 100                                ; 0004 _ 83. EC, 64
        sub     esp, 12                                 ; 0007 _ 83. EC, 0C
        push    bootInfo                                ; 000A _ 68, 00000018(d)
        call    initBootInfo                            ; 000F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0014 _ 83. C4, 10
        mov     eax, dword [bootInfo]                   ; 0017 _ A1, 00000018(d)
        mov     dword [ebp-18H], eax                    ; 001C _ 89. 45, E8
        movzx   eax, word [?_425]                       ; 001F _ 0F B7. 05, 0000001C(d)
        cwde                                            ; 0026 _ 98
        mov     dword [xsize], eax                      ; 0027 _ A3, 0000013C(d)
        movzx   eax, word [?_426]                       ; 002C _ 0F B7. 05, 0000001E(d)
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
        push    keyinfo                                 ; 00E7 _ 68, 00000020(d)
        call    fifo8_init                              ; 00EC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 00F1 _ 83. C4, 10
        push    0                                       ; 00F4 _ 6A, 00
        push    mousebuf                                ; 00F6 _ 68, 00000080(d)
        push    128                                     ; 00FB _ 68, 00000080
        push    mouseinfo                               ; 0100 _ 68, 0000003C(d)
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
        push    ?_395                                   ; 02BB _ 68, 00000000(d)
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
        mov     dword [task_a.1843], eax                ; 0328 _ A3, 0000029C(d)
        mov     eax, dword [task_a.1843]                ; 032D _ A1, 0000029C(d)
        mov     dword [?_427], eax                      ; 0332 _ A3, 00000038(d)
        mov     eax, dword [task_a.1843]                ; 0337 _ A1, 0000029C(d)
        mov     dword [task_main], eax                  ; 033C _ A3, 00000294(d)
        mov     eax, dword [task_a.1843]                ; 0341 _ A1, 0000029C(d)
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
        push    keyinfo                                 ; 03D9 _ 68, 00000020(d)
        call    fifo8_status                            ; 03DE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 03E3 _ 83. C4, 10
        mov     ebx, eax                                ; 03E6 _ 89. C3
        sub     esp, 12                                 ; 03E8 _ 83. EC, 0C
        push    mouseinfo                               ; 03EB _ 68, 0000003C(d)
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
        push    keyinfo                                 ; 041D _ 68, 00000020(d)
        call    fifo8_status                            ; 0422 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0427 _ 83. C4, 10
        test    eax, eax                                ; 042A _ 85. C0
        je      ?_013                                   ; 042C _ 0F 84, 0000034C
        call    io_sti                                  ; 0432 _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 0437 _ 83. EC, 0C
        push    keyinfo                                 ; 043A _ 68, 00000020(d)
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
        push    ?_396                                   ; 055C _ 68, 00000008(d)
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
        push    ?_397                                   ; 0586 _ 68, 0000000F(d)
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
        push    ?_396                                   ; 05CA _ 68, 00000008(d)
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
        push    ?_397                                   ; 05F4 _ 68, 0000000F(d)
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
        push    keyinfo                                 ; 075A _ 68, 00000020(d)
        call    fifo8_status                            ; 075F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0764 _ 83. C4, 10
        test    eax, eax                                ; 0767 _ 85. C0
        jnz     ?_014                                   ; 0769 _ 75, 46
        mov     eax, dword [task_a.1843]                ; 076B _ A1, 0000029C(d)
        sub     esp, 12                                 ; 0770 _ 83. EC, 0C
        push    eax                                     ; 0773 _ 50
        call    task_sleep                              ; 0774 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0779 _ 83. C4, 10
        jmp     ?_014                                   ; 077C _ EB, 33

?_013:  sub     esp, 12                                 ; 077E _ 83. EC, 0C
        push    mouseinfo                               ; 0781 _ 68, 0000003C(d)
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
        sub     esp, 36                                 ; 0A7E _ 83. EC, 24
        mov     dword [ebp-0CH], 0                      ; 0A81 _ C7. 45, F4, 00000000
        mov     eax, dword [shtctl]                     ; 0A88 _ A1, 00000284(d)
        sub     esp, 12                                 ; 0A8D _ 83. EC, 0C
        push    eax                                     ; 0A90 _ 50
        call    sheet_alloc                             ; 0A91 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0A96 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 0A99 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 0A9C _ A1, 00000000(d)
        sub     esp, 8                                  ; 0AA1 _ 83. EC, 08
        push    42240                                   ; 0AA4 _ 68, 0000A500
        push    eax                                     ; 0AA9 _ 50
        call    memman_alloc_4k                         ; 0AAA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AAF _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 0AB2 _ 89. 45, F0
        sub     esp, 12                                 ; 0AB5 _ 83. EC, 0C
        push    99                                      ; 0AB8 _ 6A, 63
        push    165                                     ; 0ABA _ 68, 000000A5
        push    256                                     ; 0ABF _ 68, 00000100
        push    dword [ebp-10H]                         ; 0AC4 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 0AC7 _ FF. 75, F4
        call    sheet_setbuf                            ; 0ACA _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0ACF _ 83. C4, 20
        cmp     dword [ebp+8H], 0                       ; 0AD2 _ 83. 7D, 08, 00
        jle     ?_037                                   ; 0AD6 _ 7E, 1A
        mov     eax, dword [shtctl]                     ; 0AD8 _ A1, 00000284(d)
        push    1                                       ; 0ADD _ 6A, 01
        push    ?_397                                   ; 0ADF _ 68, 0000000F(d)
        push    dword [ebp-0CH]                         ; 0AE4 _ FF. 75, F4
        push    eax                                     ; 0AE7 _ 50
        call    make_window8                            ; 0AE8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0AED _ 83. C4, 10
        jmp     ?_038                                   ; 0AF0 _ EB, 18

?_037:  mov     eax, dword [shtctl]                     ; 0AF2 _ A1, 00000284(d)
        push    0                                       ; 0AF7 _ 6A, 00
        push    ?_397                                   ; 0AF9 _ 68, 0000000F(d)
        push    dword [ebp-0CH]                         ; 0AFE _ FF. 75, F4
        push    eax                                     ; 0B01 _ 50
        call    make_window8                            ; 0B02 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B07 _ 83. C4, 10
?_038:  mov     eax, dword [ebp-0CH]                    ; 0B0A _ 8B. 45, F4
        mov     ecx, dword [eax+8H]                     ; 0B0D _ 8B. 48, 08
        mov     eax, dword [ebp-0CH]                    ; 0B10 _ 8B. 45, F4
        mov     edx, dword [eax+4H]                     ; 0B13 _ 8B. 50, 04
        mov     eax, dword [shtctl]                     ; 0B16 _ A1, 00000284(d)
        sub     esp, 8                                  ; 0B1B _ 83. EC, 08
        push    ecx                                     ; 0B1E _ 51
        push    edx                                     ; 0B1F _ 52
        push    0                                       ; 0B20 _ 6A, 00
        push    0                                       ; 0B22 _ 6A, 00
        push    dword [ebp-0CH]                         ; 0B24 _ FF. 75, F4
        push    eax                                     ; 0B27 _ 50
        call    sheet_refresh                           ; 0B28 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B2D _ 83. C4, 20
        sub     esp, 8                                  ; 0B30 _ 83. EC, 08
        push    0                                       ; 0B33 _ 6A, 00
        push    128                                     ; 0B35 _ 68, 00000080
        push    240                                     ; 0B3A _ 68, 000000F0
        push    28                                      ; 0B3F _ 6A, 1C
        push    8                                       ; 0B41 _ 6A, 08
        push    dword [ebp-0CH]                         ; 0B43 _ FF. 75, F4
        call    make_textbox8                           ; 0B46 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0B4B _ 83. C4, 20
        call    task_alloc                              ; 0B4E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0B53 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 0B56 _ 8B. 45, EC
        mov     edx, dword [ebp-0CH]                    ; 0B59 _ 8B. 55, F4
        mov     dword [eax+0B4H], edx                   ; 0B5C _ 89. 90, 000000B4
        mov     eax, dword [ebp-0CH]                    ; 0B62 _ 8B. 45, F4
        mov     edx, dword [ebp-14H]                    ; 0B65 _ 8B. 55, EC
        mov     dword [eax+20H], edx                    ; 0B68 _ 89. 50, 20
        mov     eax, dword [current_console_task]       ; 0B6B _ A1, 00000298(d)
        test    eax, eax                                ; 0B70 _ 85. C0
        jz      ?_039                                   ; 0B72 _ 74, 60
        mov     eax, dword [current_console_task]       ; 0B74 _ A1, 00000298(d)
        mov     edx, dword [eax+0B4H]                   ; 0B79 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 0B7F _ A1, 00000284(d)
        push    0                                       ; 0B84 _ 6A, 00
        push    ?_397                                   ; 0B86 _ 68, 0000000F(d)
        push    edx                                     ; 0B8B _ 52
        push    eax                                     ; 0B8C _ 50
        call    make_wtitle8                            ; 0B8D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0B92 _ 83. C4, 10
        mov     eax, dword [current_console_task]       ; 0B95 _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 0B9A _ 8B. 80, 000000B4
        mov     ebx, dword [eax+8H]                     ; 0BA0 _ 8B. 58, 08
        mov     eax, dword [current_console_task]       ; 0BA3 _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 0BA8 _ 8B. 80, 000000B4
        mov     ecx, dword [eax+4H]                     ; 0BAE _ 8B. 48, 04
        mov     eax, dword [current_console_task]       ; 0BB1 _ A1, 00000298(d)
        mov     edx, dword [eax+0B4H]                   ; 0BB6 _ 8B. 90, 000000B4
        mov     eax, dword [shtctl]                     ; 0BBC _ A1, 00000284(d)
        sub     esp, 8                                  ; 0BC1 _ 83. EC, 08
        push    ebx                                     ; 0BC4 _ 53
        push    ecx                                     ; 0BC5 _ 51
        push    0                                       ; 0BC6 _ 6A, 00
        push    0                                       ; 0BC8 _ 6A, 00
        push    edx                                     ; 0BCA _ 52
        push    eax                                     ; 0BCB _ 50
        call    sheet_refresh                           ; 0BCC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0BD1 _ 83. C4, 20
?_039:  mov     eax, dword [ebp-14H]                    ; 0BD4 _ 8B. 45, EC
        mov     dword [current_console_task], eax       ; 0BD7 _ A3, 00000298(d)
        call    get_code32_addr                         ; 0BDC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0BE1 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 0BE4 _ 8B. 45, E8
        neg     eax                                     ; 0BE7 _ F7. D8
        add     eax, console_task                       ; 0BE9 _ 05, 00000000(d)
        mov     edx, eax                                ; 0BEE _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 0BF0 _ 8B. 45, EC
        mov     dword [eax+4CH], edx                    ; 0BF3 _ 89. 50, 4C
        mov     eax, dword [ebp-14H]                    ; 0BF6 _ 8B. 45, EC
        mov     dword [eax+74H], 0                      ; 0BF9 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-14H]                    ; 0C00 _ 8B. 45, EC
        mov     dword [eax+78H], 8                      ; 0C03 _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-14H]                    ; 0C0A _ 8B. 45, EC
        mov     dword [eax+7CH], 32                     ; 0C0D _ C7. 40, 7C, 00000020
        mov     eax, dword [ebp-14H]                    ; 0C14 _ 8B. 45, EC
        mov     dword [eax+80H], 24                     ; 0C17 _ C7. 80, 00000080, 00000018
        mov     eax, dword [ebp-14H]                    ; 0C21 _ 8B. 45, EC
        mov     dword [eax+84H], 0                      ; 0C24 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-14H]                    ; 0C2E _ 8B. 45, EC
        mov     dword [eax+88H], 16                     ; 0C31 _ C7. 80, 00000088, 00000010
        mov     eax, dword [memman]                     ; 0C3B _ A1, 00000000(d)
        sub     esp, 8                                  ; 0C40 _ 83. EC, 08
        push    65536                                   ; 0C43 _ 68, 00010000
        push    eax                                     ; 0C48 _ 50
        call    memman_alloc_4k                         ; 0C49 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C4E _ 83. C4, 10
        mov     edx, eax                                ; 0C51 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 0C53 _ 8B. 45, EC
        mov     dword [eax+0B8H], edx                   ; 0C56 _ 89. 90, 000000B8
        mov     eax, dword [ebp-14H]                    ; 0C5C _ 8B. 45, EC
        mov     eax, dword [eax+0B8H]                   ; 0C5F _ 8B. 80, 000000B8
        lea     edx, [eax+3F4H]                         ; 0C65 _ 8D. 90, 000003F4
        mov     eax, dword [ebp-14H]                    ; 0C6B _ 8B. 45, EC
        mov     dword [eax+64H], edx                    ; 0C6E _ 89. 50, 64
        mov     eax, dword [ebp-14H]                    ; 0C71 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0C74 _ 8B. 40, 64
        add     eax, 4                                  ; 0C77 _ 83. C0, 04
        mov     edx, eax                                ; 0C7A _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 0C7C _ 8B. 45, F4
        mov     dword [edx], eax                        ; 0C7F _ 89. 02
        mov     eax, dword [ebp-14H]                    ; 0C81 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0C84 _ 8B. 40, 64
        add     eax, 8                                  ; 0C87 _ 83. C0, 08
        mov     ebx, eax                                ; 0C8A _ 89. C3
        mov     eax, dword [memman]                     ; 0C8C _ A1, 00000000(d)
        sub     esp, 12                                 ; 0C91 _ 83. EC, 0C
        push    eax                                     ; 0C94 _ 50
        call    memman_total                            ; 0C95 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0C9A _ 83. C4, 10
        mov     dword [ebx], eax                        ; 0C9D _ 89. 03
        mov     eax, dword [memman]                     ; 0C9F _ A1, 00000000(d)
        sub     esp, 8                                  ; 0CA4 _ 83. EC, 08
        push    128                                     ; 0CA7 _ 68, 00000080
        push    eax                                     ; 0CAC _ 50
        call    memman_alloc                            ; 0CAD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CB2 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0CB5 _ 89. 45, E4
        mov     eax, dword [ebp-14H]                    ; 0CB8 _ 8B. 45, EC
        add     eax, 16                                 ; 0CBB _ 83. C0, 10
        push    dword [ebp-14H]                         ; 0CBE _ FF. 75, EC
        push    dword [ebp-1CH]                         ; 0CC1 _ FF. 75, E4
        push    128                                     ; 0CC4 _ 68, 00000080
        push    eax                                     ; 0CC9 _ 50
        call    fifo8_init                              ; 0CCA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CCF _ 83. C4, 10
        sub     esp, 4                                  ; 0CD2 _ 83. EC, 04
        push    5                                       ; 0CD5 _ 6A, 05
        push    1                                       ; 0CD7 _ 6A, 01
        push    dword [ebp-14H]                         ; 0CD9 _ FF. 75, EC
        call    task_run                                ; 0CDC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0CE1 _ 83. C4, 10
        cmp     dword [ebp+8H], 0                       ; 0CE4 _ 83. 7D, 08, 00
        jnz     ?_040                                   ; 0CE8 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 0CEA _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 0CED _ 8B. 00
        mov     dword [first_task_cons_selector], eax   ; 0CEF _ A3, 00000000(d)
?_040:  mov     eax, dword [ebp-0CH]                    ; 0CF4 _ 8B. 45, F4
        mov     ebx, dword [ebp-4H]                     ; 0CF7 _ 8B. 5D, FC
        leave                                           ; 0CFA _ C9
        ret                                             ; 0CFB _ C3
; launch_console End of function

kill_process:; Function begin
        push    ebp                                     ; 0CFC _ 55
        mov     ebp, esp                                ; 0CFD _ 89. E5
        sub     esp, 24                                 ; 0CFF _ 83. EC, 18
        call    task_now                                ; 0D02 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0D07 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 0D0A _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 0D0D _ 8B. 90, 00000094
        mov     eax, dword [ebp-0CH]                    ; 0D13 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 0D16 _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 0D1C _ 83. EC, 08
        push    edx                                     ; 0D1F _ 52
        push    eax                                     ; 0D20 _ 50
        call    cons_newline                            ; 0D21 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D26 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 0D29 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 0D2C _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 0D32 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 0D35 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 0D38 _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 0D3E _ 8B. 45, F4
        add     eax, 48                                 ; 0D41 _ 83. C0, 30
        sub     esp, 12                                 ; 0D44 _ 83. EC, 0C
        push    eax                                     ; 0D47 _ 50
        call    asm_end_app                             ; 0D48 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D4D _ 83. C4, 10
        leave                                           ; 0D50 _ C9
        ret                                             ; 0D51 _ C3
; kill_process End of function

cmd_dir:; Function begin
        push    ebp                                     ; 0D52 _ 55
        mov     ebp, esp                                ; 0D53 _ 89. E5
        sub     esp, 40                                 ; 0D55 _ 83. EC, 28
        call    task_now                                ; 0D58 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0D5D _ 89. 45, E8
        mov     dword [ebp-0CH], 88064                  ; 0D60 _ C7. 45, F4, 00015800
        mov     eax, dword [memman]                     ; 0D67 _ A1, 00000000(d)
        sub     esp, 8                                  ; 0D6C _ 83. EC, 08
        push    13                                      ; 0D6F _ 6A, 0D
        push    eax                                     ; 0D71 _ 50
        call    memman_alloc                            ; 0D72 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0D77 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 0D7A _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 0D7D _ 8B. 45, E4
        add     eax, 12                                 ; 0D80 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0D83 _ C6. 00, 00
        jmp     ?_049                                   ; 0D86 _ E9, 00000121

?_041:  mov     dword [ebp-10H], 0                      ; 0D8B _ C7. 45, F0, 00000000
        jmp     ?_045                                   ; 0D92 _ EB, 2C

?_042:  mov     edx, dword [ebp-0CH]                    ; 0D94 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 0D97 _ 8B. 45, F0
        add     eax, edx                                ; 0D9A _ 01. D0
        movzx   eax, byte [eax]                         ; 0D9C _ 0F B6. 00
        test    al, al                                  ; 0D9F _ 84. C0
        jz      ?_043                                   ; 0DA1 _ 74, 17
        mov     edx, dword [ebp-10H]                    ; 0DA3 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0DA6 _ 8B. 45, E4
        add     eax, edx                                ; 0DA9 _ 01. D0
        mov     ecx, dword [ebp-0CH]                    ; 0DAB _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 0DAE _ 8B. 55, F0
        add     edx, ecx                                ; 0DB1 _ 01. CA
        movzx   edx, byte [edx]                         ; 0DB3 _ 0F B6. 12
        mov     byte [eax], dl                          ; 0DB6 _ 88. 10
        jmp     ?_044                                   ; 0DB8 _ EB, 02

?_043:  jmp     ?_046                                   ; 0DBA _ EB, 0A

?_044:  add     dword [ebp-10H], 1                      ; 0DBC _ 83. 45, F0, 01
?_045:  cmp     dword [ebp-10H], 7                      ; 0DC0 _ 83. 7D, F0, 07
        jle     ?_042                                   ; 0DC4 _ 7E, CE
?_046:  mov     dword [ebp-14H], 0                      ; 0DC6 _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 0DCD _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0DD0 _ 8B. 45, E4
        add     eax, edx                                ; 0DD3 _ 01. D0
        mov     byte [eax], 46                          ; 0DD5 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 0DD8 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 0DDC _ C7. 45, EC, 00000000
        jmp     ?_048                                   ; 0DE3 _ EB, 1E

?_047:  mov     edx, dword [ebp-10H]                    ; 0DE5 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0DE8 _ 8B. 45, E4
        add     eax, edx                                ; 0DEB _ 01. D0
        mov     ecx, dword [ebp-0CH]                    ; 0DED _ 8B. 4D, F4
        mov     edx, dword [ebp-14H]                    ; 0DF0 _ 8B. 55, EC
        add     edx, ecx                                ; 0DF3 _ 01. CA
        movzx   edx, byte [edx+8H]                      ; 0DF5 _ 0F B6. 52, 08
        mov     byte [eax], dl                          ; 0DF9 _ 88. 10
        add     dword [ebp-10H], 1                      ; 0DFB _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 0DFF _ 83. 45, EC, 01
?_048:  cmp     dword [ebp-14H], 2                      ; 0E03 _ 83. 7D, EC, 02
        jle     ?_047                                   ; 0E07 _ 7E, DC
        mov     eax, dword [ebp-18H]                    ; 0E09 _ 8B. 45, E8
        mov     ecx, dword [eax+9CH]                    ; 0E0C _ 8B. 88, 0000009C
        mov     eax, dword [ebp-18H]                    ; 0E12 _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 0E15 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 0E1B _ A1, 00000284(d)
        sub     esp, 8                                  ; 0E20 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 0E23 _ FF. 75, E4
        push    7                                       ; 0E26 _ 6A, 07
        push    ecx                                     ; 0E28 _ 51
        push    16                                      ; 0E29 _ 6A, 10
        push    edx                                     ; 0E2B _ 52
        push    eax                                     ; 0E2C _ 50
        call    showString                              ; 0E2D _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E32 _ 83. C4, 20
        mov     dword [ebp-20H], 136                    ; 0E35 _ C7. 45, E0, 00000088
        mov     eax, dword [ebp-0CH]                    ; 0E3C _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 0E3F _ 8B. 40, 1C
        sub     esp, 12                                 ; 0E42 _ 83. EC, 0C
        push    eax                                     ; 0E45 _ 50
        call    intToHexStr                             ; 0E46 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E4B _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 0E4E _ 89. 45, DC
        mov     eax, dword [ebp-18H]                    ; 0E51 _ 8B. 45, E8
        mov     ecx, dword [eax+9CH]                    ; 0E54 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-18H]                    ; 0E5A _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 0E5D _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 0E63 _ A1, 00000284(d)
        sub     esp, 8                                  ; 0E68 _ 83. EC, 08
        push    dword [ebp-24H]                         ; 0E6B _ FF. 75, DC
        push    7                                       ; 0E6E _ 6A, 07
        push    ecx                                     ; 0E70 _ 51
        push    dword [ebp-20H]                         ; 0E71 _ FF. 75, E0
        push    edx                                     ; 0E74 _ 52
        push    eax                                     ; 0E75 _ 50
        call    showString                              ; 0E76 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0E7B _ 83. C4, 20
        mov     eax, dword [ebp-18H]                    ; 0E7E _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 0E81 _ 8B. 90, 00000094
        mov     eax, dword [ebp-18H]                    ; 0E87 _ 8B. 45, E8
        mov     eax, dword [eax+9CH]                    ; 0E8A _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 0E90 _ 83. EC, 08
        push    edx                                     ; 0E93 _ 52
        push    eax                                     ; 0E94 _ 50
        call    cons_newline                            ; 0E95 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0E9A _ 83. C4, 10
        mov     edx, eax                                ; 0E9D _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 0E9F _ 8B. 45, E8
        mov     dword [eax+9CH], edx                    ; 0EA2 _ 89. 90, 0000009C
        add     dword [ebp-0CH], 32                     ; 0EA8 _ 83. 45, F4, 20
?_049:  mov     eax, dword [ebp-0CH]                    ; 0EAC _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 0EAF _ 0F B6. 00
        test    al, al                                  ; 0EB2 _ 84. C0
        jne     ?_041                                   ; 0EB4 _ 0F 85, FFFFFED1
        mov     edx, dword [ebp-1CH]                    ; 0EBA _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 0EBD _ A1, 00000000(d)
        sub     esp, 4                                  ; 0EC2 _ 83. EC, 04
        push    13                                      ; 0EC5 _ 6A, 0D
        push    edx                                     ; 0EC7 _ 52
        push    eax                                     ; 0EC8 _ 50
        call    memman_free                             ; 0EC9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0ECE _ 83. C4, 10
        leave                                           ; 0ED1 _ C9
        ret                                             ; 0ED2 _ C3
; cmd_dir End of function

cmd_type:; Function begin
        push    ebp                                     ; 0ED3 _ 55
        mov     ebp, esp                                ; 0ED4 _ 89. E5
        push    esi                                     ; 0ED6 _ 56
        push    ebx                                     ; 0ED7 _ 53
        sub     esp, 64                                 ; 0ED8 _ 83. EC, 40
        call    task_now                                ; 0EDB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 0EE0 _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 0EE3 _ 8B. 45, DC
        mov     eax, dword [eax+94H]                    ; 0EE6 _ 8B. 80, 00000094
        test    eax, eax                                ; 0EEC _ 85. C0
        jnz     ?_050                                   ; 0EEE _ 75, 05
        jmp     ?_074                                   ; 0EF0 _ E9, 0000036D

?_050:  mov     eax, dword [memman]                     ; 0EF5 _ A1, 00000000(d)
        sub     esp, 8                                  ; 0EFA _ 83. EC, 08
        push    13                                      ; 0EFD _ 6A, 0D
        push    eax                                     ; 0EFF _ 50
        call    memman_alloc                            ; 0F00 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 0F05 _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 0F08 _ 89. 45, D8
        mov     eax, dword [ebp-28H]                    ; 0F0B _ 8B. 45, D8
        add     eax, 12                                 ; 0F0E _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0F11 _ C6. 00, 00
        mov     dword [ebp-0CH], 0                      ; 0F14 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 5                      ; 0F1B _ C7. 45, F0, 00000005
        mov     dword [ebp-10H], 5                      ; 0F22 _ C7. 45, F0, 00000005
        jmp     ?_054                                   ; 0F29 _ EB, 30

?_051:  mov     edx, dword [ebp-10H]                    ; 0F2B _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 0F2E _ 8B. 45, 08
        add     eax, edx                                ; 0F31 _ 01. D0
        movzx   eax, byte [eax]                         ; 0F33 _ 0F B6. 00
        test    al, al                                  ; 0F36 _ 84. C0
        jz      ?_052                                   ; 0F38 _ 74, 1B
        mov     edx, dword [ebp-0CH]                    ; 0F3A _ 8B. 55, F4
        mov     eax, dword [ebp-28H]                    ; 0F3D _ 8B. 45, D8
        add     edx, eax                                ; 0F40 _ 01. C2
        mov     ecx, dword [ebp-10H]                    ; 0F42 _ 8B. 4D, F0
        mov     eax, dword [ebp+8H]                     ; 0F45 _ 8B. 45, 08
        add     eax, ecx                                ; 0F48 _ 01. C8
        movzx   eax, byte [eax]                         ; 0F4A _ 0F B6. 00
        mov     byte [edx], al                          ; 0F4D _ 88. 02
        add     dword [ebp-0CH], 1                      ; 0F4F _ 83. 45, F4, 01
        jmp     ?_053                                   ; 0F53 _ EB, 02

?_052:  jmp     ?_055                                   ; 0F55 _ EB, 0A

?_053:  add     dword [ebp-10H], 1                      ; 0F57 _ 83. 45, F0, 01
?_054:  cmp     dword [ebp-10H], 16                     ; 0F5B _ 83. 7D, F0, 10
        jle     ?_051                                   ; 0F5F _ 7E, CA
?_055:  mov     edx, dword [ebp-0CH]                    ; 0F61 _ 8B. 55, F4
        mov     eax, dword [ebp-28H]                    ; 0F64 _ 8B. 45, D8
        add     eax, edx                                ; 0F67 _ 01. D0
        mov     byte [eax], 0                           ; 0F69 _ C6. 00, 00
        mov     dword [ebp-14H], 88064                  ; 0F6C _ C7. 45, EC, 00015800
        jmp     ?_072                                   ; 0F73 _ E9, 0000028E

?_056:  mov     byte [ebp-31H], 0                       ; 0F78 _ C6. 45, CF, 00
        mov     dword [ebp-18H], 0                      ; 0F7C _ C7. 45, E8, 00000000
        jmp     ?_060                                   ; 0F83 _ EB, 2E

?_057:  mov     edx, dword [ebp-14H]                    ; 0F85 _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 0F88 _ 8B. 45, E8
        add     eax, edx                                ; 0F8B _ 01. D0
        movzx   eax, byte [eax]                         ; 0F8D _ 0F B6. 00
        test    al, al                                  ; 0F90 _ 84. C0
        jz      ?_058                                   ; 0F92 _ 74, 19
        mov     edx, dword [ebp-14H]                    ; 0F94 _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 0F97 _ 8B. 45, E8
        add     eax, edx                                ; 0F9A _ 01. D0
        movzx   eax, byte [eax]                         ; 0F9C _ 0F B6. 00
        mov     ecx, eax                                ; 0F9F _ 89. C1
        lea     edx, [ebp-3DH]                          ; 0FA1 _ 8D. 55, C3
        mov     eax, dword [ebp-18H]                    ; 0FA4 _ 8B. 45, E8
        add     eax, edx                                ; 0FA7 _ 01. D0
        mov     byte [eax], cl                          ; 0FA9 _ 88. 08
        jmp     ?_059                                   ; 0FAB _ EB, 02

?_058:  jmp     ?_061                                   ; 0FAD _ EB, 0A

?_059:  add     dword [ebp-18H], 1                      ; 0FAF _ 83. 45, E8, 01
?_060:  cmp     dword [ebp-18H], 7                      ; 0FB3 _ 83. 7D, E8, 07
        jle     ?_057                                   ; 0FB7 _ 7E, CC
?_061:  mov     dword [ebp-1CH], 0                      ; 0FB9 _ C7. 45, E4, 00000000
        lea     edx, [ebp-3DH]                          ; 0FC0 _ 8D. 55, C3
        mov     eax, dword [ebp-18H]                    ; 0FC3 _ 8B. 45, E8
        add     eax, edx                                ; 0FC6 _ 01. D0
        mov     byte [eax], 46                          ; 0FC8 _ C6. 00, 2E
        add     dword [ebp-18H], 1                      ; 0FCB _ 83. 45, E8, 01
        mov     dword [ebp-1CH], 0                      ; 0FCF _ C7. 45, E4, 00000000
        jmp     ?_063                                   ; 0FD6 _ EB, 20

?_062:  mov     edx, dword [ebp-14H]                    ; 0FD8 _ 8B. 55, EC
        mov     eax, dword [ebp-1CH]                    ; 0FDB _ 8B. 45, E4
        add     eax, edx                                ; 0FDE _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 0FE0 _ 0F B6. 40, 08
        mov     ecx, eax                                ; 0FE4 _ 89. C1
        lea     edx, [ebp-3DH]                          ; 0FE6 _ 8D. 55, C3
        mov     eax, dword [ebp-18H]                    ; 0FE9 _ 8B. 45, E8
        add     eax, edx                                ; 0FEC _ 01. D0
        mov     byte [eax], cl                          ; 0FEE _ 88. 08
        add     dword [ebp-18H], 1                      ; 0FF0 _ 83. 45, E8, 01
        add     dword [ebp-1CH], 1                      ; 0FF4 _ 83. 45, E4, 01
?_063:  cmp     dword [ebp-1CH], 2                      ; 0FF8 _ 83. 7D, E4, 02
        jle     ?_062                                   ; 0FFC _ 7E, DA
        sub     esp, 8                                  ; 0FFE _ 83. EC, 08
        lea     eax, [ebp-3DH]                          ; 1001 _ 8D. 45, C3
        push    eax                                     ; 1004 _ 50
        push    dword [ebp-28H]                         ; 1005 _ FF. 75, D8
        call    strcmp                                  ; 1008 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 100D _ 83. C4, 10
        cmp     eax, 1                                  ; 1010 _ 83. F8, 01
        jne     ?_071                                   ; 1013 _ 0F 85, 000001E9
        mov     dword [ebp-2CH], 97280                  ; 1019 _ C7. 45, D4, 00017C00
        mov     eax, dword [ebp-14H]                    ; 1020 _ 8B. 45, EC
        movzx   eax, word [eax+1AH]                     ; 1023 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 1027 _ 0F B7. C0
        shl     eax, 9                                  ; 102A _ C1. E0, 09
        add     dword [ebp-2CH], eax                    ; 102D _ 01. 45, D4
        mov     eax, dword [ebp-14H]                    ; 1030 _ 8B. 45, EC
        mov     eax, dword [eax+1CH]                    ; 1033 _ 8B. 40, 1C
        mov     dword [ebp-30H], eax                    ; 1036 _ 89. 45, D0
        mov     dword [ebp-20H], 0                      ; 1039 _ C7. 45, E0, 00000000
        mov     eax, dword [ebp-24H]                    ; 1040 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 1043 _ C7. 80, 00000098, 00000010
        mov     dword [ebp-20H], 0                      ; 104D _ C7. 45, E0, 00000000
        jmp     ?_070                                   ; 1054 _ E9, 0000019A

?_064:  mov     edx, dword [ebp-20H]                    ; 1059 _ 8B. 55, E0
        mov     eax, dword [ebp-2CH]                    ; 105C _ 8B. 45, D4
        add     eax, edx                                ; 105F _ 01. D0
        movzx   eax, byte [eax]                         ; 1061 _ 0F B6. 00
        mov     byte [ebp-3FH], al                      ; 1064 _ 88. 45, C1
        mov     byte [ebp-3EH], 0                       ; 1067 _ C6. 45, C2, 00
        movzx   eax, byte [ebp-3FH]                     ; 106B _ 0F B6. 45, C1
        cmp     al, 9                                   ; 106F _ 3C, 09
        jne     ?_067                                   ; 1071 _ 0F 85, 00000097
?_065:  mov     eax, dword [ebp-24H]                    ; 1077 _ 8B. 45, DC
        mov     ebx, dword [eax+9CH]                    ; 107A _ 8B. 98, 0000009C
        mov     eax, dword [ebp-24H]                    ; 1080 _ 8B. 45, DC
        mov     ecx, dword [eax+98H]                    ; 1083 _ 8B. 88, 00000098
        mov     eax, dword [ebp-24H]                    ; 1089 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 108C _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1092 _ A1, 00000284(d)
        sub     esp, 8                                  ; 1097 _ 83. EC, 08
        push    ?_398                                   ; 109A _ 68, 00000017(d)
        push    7                                       ; 109F _ 6A, 07
        push    ebx                                     ; 10A1 _ 53
        push    ecx                                     ; 10A2 _ 51
        push    edx                                     ; 10A3 _ 52
        push    eax                                     ; 10A4 _ 50
        call    showString                              ; 10A5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 10AA _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 10AD _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 10B0 _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 10B6 _ 8D. 50, 08
        mov     eax, dword [ebp-24H]                    ; 10B9 _ 8B. 45, DC
        mov     dword [eax+98H], edx                    ; 10BC _ 89. 90, 00000098
        mov     eax, dword [ebp-24H]                    ; 10C2 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 10C5 _ 8B. 80, 00000098
        cmp     eax, 248                                ; 10CB _ 3D, 000000F8
        jnz     ?_066                                   ; 10D0 _ 75, 37
        mov     eax, dword [ebp-24H]                    ; 10D2 _ 8B. 45, DC
        mov     dword [eax+98H], 8                      ; 10D5 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-24H]                    ; 10DF _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 10E2 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 10E8 _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 10EB _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 10F1 _ 83. EC, 08
        push    edx                                     ; 10F4 _ 52
        push    eax                                     ; 10F5 _ 50
        call    cons_newline                            ; 10F6 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 10FB _ 83. C4, 10
        mov     edx, eax                                ; 10FE _ 89. C2
        mov     eax, dword [ebp-24H]                    ; 1100 _ 8B. 45, DC
        mov     dword [eax+9CH], edx                    ; 1103 _ 89. 90, 0000009C
?_066:  jmp     ?_065                                   ; 1109 _ E9, FFFFFF69

?_067:  movzx   eax, byte [ebp-3FH]                     ; 110E _ 0F B6. 45, C1
        cmp     al, 10                                  ; 1112 _ 3C, 0A
        jnz     ?_068                                   ; 1114 _ 75, 3C
        mov     eax, dword [ebp-24H]                    ; 1116 _ 8B. 45, DC
        mov     dword [eax+98H], 8                      ; 1119 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-24H]                    ; 1123 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1126 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 112C _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 112F _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 1135 _ 83. EC, 08
        push    edx                                     ; 1138 _ 52
        push    eax                                     ; 1139 _ 50
        call    cons_newline                            ; 113A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 113F _ 83. C4, 10
        mov     edx, eax                                ; 1142 _ 89. C2
        mov     eax, dword [ebp-24H]                    ; 1144 _ 8B. 45, DC
        mov     dword [eax+9CH], edx                    ; 1147 _ 89. 90, 0000009C
        jmp     ?_069                                   ; 114D _ E9, 0000009D

?_068:  movzx   eax, byte [ebp-3FH]                     ; 1152 _ 0F B6. 45, C1
        cmp     al, 13                                  ; 1156 _ 3C, 0D
        je      ?_069                                   ; 1158 _ 0F 84, 00000091
        mov     eax, dword [ebp-24H]                    ; 115E _ 8B. 45, DC
        mov     ebx, dword [eax+9CH]                    ; 1161 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-24H]                    ; 1167 _ 8B. 45, DC
        mov     ecx, dword [eax+98H]                    ; 116A _ 8B. 88, 00000098
        mov     eax, dword [ebp-24H]                    ; 1170 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1173 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1179 _ A1, 00000284(d)
        sub     esp, 8                                  ; 117E _ 83. EC, 08
        lea     esi, [ebp-3FH]                          ; 1181 _ 8D. 75, C1
        push    esi                                     ; 1184 _ 56
        push    7                                       ; 1185 _ 6A, 07
        push    ebx                                     ; 1187 _ 53
        push    ecx                                     ; 1188 _ 51
        push    edx                                     ; 1189 _ 52
        push    eax                                     ; 118A _ 50
        call    showString                              ; 118B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1190 _ 83. C4, 20
        mov     eax, dword [ebp-24H]                    ; 1193 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 1196 _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 119C _ 8D. 50, 08
        mov     eax, dword [ebp-24H]                    ; 119F _ 8B. 45, DC
        mov     dword [eax+98H], edx                    ; 11A2 _ 89. 90, 00000098
        mov     eax, dword [ebp-24H]                    ; 11A8 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 11AB _ 8B. 80, 00000098
        cmp     eax, 248                                ; 11B1 _ 3D, 000000F8
        jnz     ?_069                                   ; 11B6 _ 75, 37
        mov     eax, dword [ebp-24H]                    ; 11B8 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 11BB _ C7. 80, 00000098, 00000010
        mov     eax, dword [ebp-24H]                    ; 11C5 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 11C8 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 11CE _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 11D1 _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 11D7 _ 83. EC, 08
        push    edx                                     ; 11DA _ 52
        push    eax                                     ; 11DB _ 50
        call    cons_newline                            ; 11DC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 11E1 _ 83. C4, 10
        mov     edx, eax                                ; 11E4 _ 89. C2
        mov     eax, dword [ebp-24H]                    ; 11E6 _ 8B. 45, DC
        mov     dword [eax+9CH], edx                    ; 11E9 _ 89. 90, 0000009C
?_069:  add     dword [ebp-20H], 1                      ; 11EF _ 83. 45, E0, 01
?_070:  mov     eax, dword [ebp-20H]                    ; 11F3 _ 8B. 45, E0
        cmp     eax, dword [ebp-30H]                    ; 11F6 _ 3B. 45, D0
        jl      ?_064                                   ; 11F9 _ 0F 8C, FFFFFE5A
        nop                                             ; 11FF _ 90
        jmp     ?_073                                   ; 1200 _ EB, 12

?_071:  add     dword [ebp-14H], 32                     ; 1202 _ 83. 45, EC, 20
?_072:  mov     eax, dword [ebp-14H]                    ; 1206 _ 8B. 45, EC
        movzx   eax, byte [eax]                         ; 1209 _ 0F B6. 00
        test    al, al                                  ; 120C _ 84. C0
        jne     ?_056                                   ; 120E _ 0F 85, FFFFFD64
?_073:  mov     eax, dword [ebp-24H]                    ; 1214 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1217 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 121D _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 1220 _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 1226 _ 83. EC, 08
        push    edx                                     ; 1229 _ 52
        push    eax                                     ; 122A _ 50
        call    cons_newline                            ; 122B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1230 _ 83. C4, 10
        mov     edx, eax                                ; 1233 _ 89. C2
        mov     eax, dword [ebp-24H]                    ; 1235 _ 8B. 45, DC
        mov     dword [eax+9CH], edx                    ; 1238 _ 89. 90, 0000009C
        mov     edx, dword [ebp-28H]                    ; 123E _ 8B. 55, D8
        mov     eax, dword [memman]                     ; 1241 _ A1, 00000000(d)
        sub     esp, 4                                  ; 1246 _ 83. EC, 04
        push    13                                      ; 1249 _ 6A, 0D
        push    edx                                     ; 124B _ 52
        push    eax                                     ; 124C _ 50
        call    memman_free                             ; 124D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1252 _ 83. C4, 10
        mov     eax, dword [ebp-24H]                    ; 1255 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 1258 _ C7. 80, 00000098, 00000010
?_074:  lea     esp, [ebp-8H]                           ; 1262 _ 8D. 65, F8
        pop     ebx                                     ; 1265 _ 5B
        pop     esi                                     ; 1266 _ 5E
        pop     ebp                                     ; 1267 _ 5D
        ret                                             ; 1268 _ C3
; cmd_type End of function

cmd_mem:; Function begin
        push    ebp                                     ; 1269 _ 55
        mov     ebp, esp                                ; 126A _ 89. E5
        sub     esp, 24                                 ; 126C _ 83. EC, 18
        call    task_now                                ; 126F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1274 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 1277 _ 8B. 45, F4
        mov     eax, dword [eax+94H]                    ; 127A _ 8B. 80, 00000094
        test    eax, eax                                ; 1280 _ 85. C0
        jnz     ?_075                                   ; 1282 _ 75, 05
        jmp     ?_076                                   ; 1284 _ E9, 000000D2

?_075:  mov     eax, dword [ebp+8H]                     ; 1289 _ 8B. 45, 08
        lea     edx, [eax+3FFH]                         ; 128C _ 8D. 90, 000003FF
        test    eax, eax                                ; 1292 _ 85. C0
        cmovs   eax, edx                                ; 1294 _ 0F 48. C2
        sar     eax, 10                                 ; 1297 _ C1. F8, 0A
        sub     esp, 12                                 ; 129A _ 83. EC, 0C
        push    eax                                     ; 129D _ 50
        call    intToHexStr                             ; 129E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 12A3 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 12A6 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 12A9 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 12AC _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 12B2 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 12B5 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 12BB _ A1, 00000284(d)
        sub     esp, 8                                  ; 12C0 _ 83. EC, 08
        push    ?_399                                   ; 12C3 _ 68, 00000019(d)
        push    7                                       ; 12C8 _ 6A, 07
        push    ecx                                     ; 12CA _ 51
        push    16                                      ; 12CB _ 6A, 10
        push    edx                                     ; 12CD _ 52
        push    eax                                     ; 12CE _ 50
        call    showString                              ; 12CF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 12D4 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 12D7 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 12DA _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 12E0 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 12E3 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 12E9 _ A1, 00000284(d)
        sub     esp, 8                                  ; 12EE _ 83. EC, 08
        push    dword [ebp-10H]                         ; 12F1 _ FF. 75, F0
        push    7                                       ; 12F4 _ 6A, 07
        push    ecx                                     ; 12F6 _ 51
        push    52                                      ; 12F7 _ 6A, 34
        push    edx                                     ; 12F9 _ 52
        push    eax                                     ; 12FA _ 50
        call    showString                              ; 12FB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1300 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 1303 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 1306 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 130C _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 130F _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1315 _ A1, 00000284(d)
        sub     esp, 8                                  ; 131A _ 83. EC, 08
        push    ?_400                                   ; 131D _ 68, 0000001F(d)
        push    7                                       ; 1322 _ 6A, 07
        push    ecx                                     ; 1324 _ 51
        push    126                                     ; 1325 _ 6A, 7E
        push    edx                                     ; 1327 _ 52
        push    eax                                     ; 1328 _ 50
        call    showString                              ; 1329 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 132E _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 1331 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 1334 _ 8B. 90, 00000094
        mov     eax, dword [ebp-0CH]                    ; 133A _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 133D _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 1343 _ 83. EC, 08
        push    edx                                     ; 1346 _ 52
        push    eax                                     ; 1347 _ 50
        call    cons_newline                            ; 1348 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 134D _ 83. C4, 10
        mov     edx, eax                                ; 1350 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1352 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 1355 _ 89. 90, 0000009C
?_076:  leave                                           ; 135B _ C9
        ret                                             ; 135C _ C3
; cmd_mem End of function

cmd_cls:; Function begin
        push    ebp                                     ; 135D _ 55
        mov     ebp, esp                                ; 135E _ 89. E5
        sub     esp, 24                                 ; 1360 _ 83. EC, 18
        call    task_now                                ; 1363 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1368 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 136B _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 136E _ 8B. 80, 00000094
        test    eax, eax                                ; 1374 _ 85. C0
        jnz     ?_077                                   ; 1376 _ 75, 05
        jmp     ?_082                                   ; 1378 _ E9, 000000BD

?_077:  mov     dword [ebp-0CH], 8                      ; 137D _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 28                     ; 1384 _ C7. 45, F0, 0000001C
        mov     dword [ebp-10H], 28                     ; 138B _ C7. 45, F0, 0000001C
        jmp     ?_081                                   ; 1392 _ EB, 41

?_078:  mov     dword [ebp-0CH], 8                      ; 1394 _ C7. 45, F4, 00000008
        jmp     ?_080                                   ; 139B _ EB, 2B

?_079:  mov     eax, dword [ebp-14H]                    ; 139D _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 13A0 _ 8B. 80, 00000094
        mov     edx, dword [eax]                        ; 13A6 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 13A8 _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 13AB _ 8B. 80, 00000094
        mov     eax, dword [eax+4H]                     ; 13B1 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 13B4 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 13B8 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 13BA _ 8B. 45, F4
        add     eax, ecx                                ; 13BD _ 01. C8
        add     eax, edx                                ; 13BF _ 01. D0
        mov     byte [eax], 0                           ; 13C1 _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 13C4 _ 83. 45, F4, 01
?_080:  cmp     dword [ebp-0CH], 247                    ; 13C8 _ 81. 7D, F4, 000000F7
        jle     ?_079                                   ; 13CF _ 7E, CC
        add     dword [ebp-10H], 1                      ; 13D1 _ 83. 45, F0, 01
?_081:  cmp     dword [ebp-10H], 155                    ; 13D5 _ 81. 7D, F0, 0000009B
        jle     ?_078                                   ; 13DC _ 7E, B6
        mov     eax, dword [ebp-14H]                    ; 13DE _ 8B. 45, EC
        mov     edx, dword [eax+94H]                    ; 13E1 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 13E7 _ A1, 00000284(d)
        sub     esp, 8                                  ; 13EC _ 83. EC, 08
        push    156                                     ; 13EF _ 68, 0000009C
        push    248                                     ; 13F4 _ 68, 000000F8
        push    28                                      ; 13F9 _ 6A, 1C
        push    8                                       ; 13FB _ 6A, 08
        push    edx                                     ; 13FD _ 52
        push    eax                                     ; 13FE _ 50
        call    sheet_refresh                           ; 13FF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1404 _ 83. C4, 20
        mov     eax, dword [ebp-14H]                    ; 1407 _ 8B. 45, EC
        mov     dword [eax+9CH], 28                     ; 140A _ C7. 80, 0000009C, 0000001C
        mov     eax, dword [ebp-14H]                    ; 1414 _ 8B. 45, EC
        mov     edx, dword [eax+94H]                    ; 1417 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 141D _ A1, 00000284(d)
        sub     esp, 8                                  ; 1422 _ 83. EC, 08
        push    ?_401                                   ; 1425 _ 68, 00000023(d)
        push    7                                       ; 142A _ 6A, 07
        push    28                                      ; 142C _ 6A, 1C
        push    8                                       ; 142E _ 6A, 08
        push    edx                                     ; 1430 _ 52
        push    eax                                     ; 1431 _ 50
        call    showString                              ; 1432 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1437 _ 83. C4, 20
?_082:  leave                                           ; 143A _ C9
        ret                                             ; 143B _ C3
; cmd_cls End of function

cmd_execute_program:; Function begin
        push    ebp                                     ; 143C _ 55
        mov     ebp, esp                                ; 143D _ 89. E5
        sub     esp, 40                                 ; 143F _ 83. EC, 28
        call    io_cli                                  ; 1442 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 1447 _ A1, 00000000(d)
        sub     esp, 8                                  ; 144C _ 83. EC, 08
        push    16                                      ; 144F _ 6A, 10
        push    eax                                     ; 1451 _ 50
        call    memman_alloc                            ; 1452 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1457 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 145A _ 89. 45, F4
        call    task_now                                ; 145D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1462 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 1465 _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 1468 _ 8B. 55, F4
        mov     dword [eax+0B0H], edx                   ; 146B _ 89. 90, 000000B0
        sub     esp, 8                                  ; 1471 _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 1474 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 1477 _ FF. 75, 08
        call    file_loadfile                           ; 147A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 147F _ 83. C4, 10
        call    get_addr_gdt                            ; 1482 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1487 _ 89. 45, EC
        mov     eax, dword [ebp-10H]                    ; 148A _ 8B. 45, F0
        mov     edx, dword [eax]                        ; 148D _ 8B. 10
        mov     eax, dword [first_task_cons_selector]   ; 148F _ A1, 00000000(d)
        sub     edx, eax                                ; 1494 _ 29. C2
        mov     eax, edx                                ; 1496 _ 89. D0
        lea     edx, [eax+7H]                           ; 1498 _ 8D. 50, 07
        test    eax, eax                                ; 149B _ 85. C0
        cmovs   eax, edx                                ; 149D _ 0F 48. C2
        sar     eax, 3                                  ; 14A0 _ C1. F8, 03
        add     eax, 21                                 ; 14A3 _ 83. C0, 15
        mov     dword [ebp-18H], eax                    ; 14A6 _ 89. 45, E8
        mov     eax, dword [ebp-10H]                    ; 14A9 _ 8B. 45, F0
        mov     edx, dword [eax]                        ; 14AC _ 8B. 10
        mov     eax, dword [first_task_cons_selector]   ; 14AE _ A1, 00000000(d)
        sub     edx, eax                                ; 14B3 _ 29. C2
        mov     eax, edx                                ; 14B5 _ 89. D0
        lea     edx, [eax+7H]                           ; 14B7 _ 8D. 50, 07
        test    eax, eax                                ; 14BA _ 85. C0
        cmovs   eax, edx                                ; 14BC _ 0F 48. C2
        sar     eax, 3                                  ; 14BF _ C1. F8, 03
        add     eax, 30                                 ; 14C2 _ 83. C0, 1E
        mov     dword [ebp-1CH], eax                    ; 14C5 _ 89. 45, E4
        mov     eax, dword [ebp-0CH]                    ; 14C8 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 14CB _ 8B. 00
        mov     edx, eax                                ; 14CD _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 14CF _ 8B. 45, F0
        add     eax, 188                                ; 14D2 _ 05, 000000BC
        push    16634                                   ; 14D7 _ 68, 000040FA
        push    edx                                     ; 14DC _ 52
        push    1048575                                 ; 14DD _ 68, 000FFFFF
        push    eax                                     ; 14E2 _ 50
        call    set_segmdesc                            ; 14E3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14E8 _ 83. C4, 10
        mov     eax, dword [memman]                     ; 14EB _ A1, 00000000(d)
        sub     esp, 8                                  ; 14F0 _ 83. EC, 08
        push    65536                                   ; 14F3 _ 68, 00010000
        push    eax                                     ; 14F8 _ 50
        call    memman_alloc_4k                         ; 14F9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 14FE _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 1501 _ 89. 45, E0
        mov     eax, dword [ebp-0CH]                    ; 1504 _ 8B. 45, F4
        mov     edx, dword [ebp-20H]                    ; 1507 _ 8B. 55, E0
        mov     dword [eax+4H], edx                     ; 150A _ 89. 50, 04
        mov     eax, dword [ebp-20H]                    ; 150D _ 8B. 45, E0
        mov     edx, dword [ebp-10H]                    ; 1510 _ 8B. 55, F0
        add     edx, 196                                ; 1513 _ 81. C2, 000000C4
        push    16626                                   ; 1519 _ 68, 000040F2
        push    eax                                     ; 151E _ 50
        push    77055                                   ; 151F _ 68, 00012CFF
        push    edx                                     ; 1524 _ 52
        call    set_segmdesc                            ; 1525 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 152A _ 83. C4, 10
        mov     eax, dword [ebp-10H]                    ; 152D _ 8B. 45, F0
        mov     dword [eax+30H], 0                      ; 1530 _ C7. 40, 30, 00000000
        call    io_sti                                  ; 1537 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 153C _ 8B. 45, F0
        add     eax, 48                                 ; 153F _ 83. C0, 30
        sub     esp, 12                                 ; 1542 _ 83. EC, 0C
        push    eax                                     ; 1545 _ 50
        push    12                                      ; 1546 _ 6A, 0C
        push    65536                                   ; 1548 _ 68, 00010000
        push    4                                       ; 154D _ 6A, 04
        push    0                                       ; 154F _ 6A, 00
        call    start_app                               ; 1551 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1556 _ 83. C4, 20
        call    io_cli                                  ; 1559 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 155E _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 1561 _ 8B. 40, 08
        mov     ecx, eax                                ; 1564 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 1566 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 1569 _ 8B. 00
        mov     edx, eax                                ; 156B _ 89. C2
        mov     eax, dword [memman]                     ; 156D _ A1, 00000000(d)
        sub     esp, 4                                  ; 1572 _ 83. EC, 04
        push    ecx                                     ; 1575 _ 51
        push    edx                                     ; 1576 _ 52
        push    eax                                     ; 1577 _ 50
        call    memman_free_4k                          ; 1578 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 157D _ 83. C4, 10
        mov     edx, dword [ebp-20H]                    ; 1580 _ 8B. 55, E0
        mov     eax, dword [memman]                     ; 1583 _ A1, 00000000(d)
        sub     esp, 4                                  ; 1588 _ 83. EC, 04
        push    65536                                   ; 158B _ 68, 00010000
        push    edx                                     ; 1590 _ 52
        push    eax                                     ; 1591 _ 50
        call    memman_free_4k                          ; 1592 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1597 _ 83. C4, 10
        mov     edx, dword [ebp-0CH]                    ; 159A _ 8B. 55, F4
        mov     eax, dword [memman]                     ; 159D _ A1, 00000000(d)
        sub     esp, 4                                  ; 15A2 _ 83. EC, 04
        push    16                                      ; 15A5 _ 6A, 10
        push    edx                                     ; 15A7 _ 52
        push    eax                                     ; 15A8 _ 50
        call    memman_free                             ; 15A9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 15AE _ 83. C4, 10
        mov     eax, dword [ebp-10H]                    ; 15B1 _ 8B. 45, F0
        mov     dword [eax+0B0H], 0                     ; 15B4 _ C7. 80, 000000B0, 00000000
        call    io_sti                                  ; 15BE _ E8, FFFFFFFC(rel)
        leave                                           ; 15C3 _ C9
        ret                                             ; 15C4 _ C3
; cmd_execute_program End of function

cmd_start:; Function begin
        push    ebp                                     ; 15C5 _ 55
        mov     ebp, esp                                ; 15C6 _ 89. E5
        sub     esp, 24                                 ; 15C8 _ 83. EC, 18
        mov     eax, dword [console_count]              ; 15CB _ A1, 00000000(d)
        sub     esp, 12                                 ; 15D0 _ 83. EC, 0C
        push    eax                                     ; 15D3 _ 50
        call    launch_console                          ; 15D4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 15D9 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 15DC _ 89. 45, F0
        mov     eax, dword [shtctl]                     ; 15DF _ A1, 00000284(d)
        push    176                                     ; 15E4 _ 68, 000000B0
        push    156                                     ; 15E9 _ 68, 0000009C
        push    dword [ebp-10H]                         ; 15EE _ FF. 75, F0
        push    eax                                     ; 15F1 _ 50
        call    sheet_slide                             ; 15F2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 15F7 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 15FA _ A1, 00000284(d)
        sub     esp, 4                                  ; 15FF _ 83. EC, 04
        push    1                                       ; 1602 _ 6A, 01
        push    dword [ebp-10H]                         ; 1604 _ FF. 75, F0
        push    eax                                     ; 1607 _ 50
        call    sheet_updown                            ; 1608 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 160D _ 83. C4, 10
        mov     eax, dword [console_count]              ; 1610 _ A1, 00000000(d)
        add     eax, 1                                  ; 1615 _ 83. C0, 01
        mov     dword [console_count], eax              ; 1618 _ A3, 00000000(d)
        mov     eax, dword [ebp-10H]                    ; 161D _ 8B. 45, F0
        mov     eax, dword [eax+20H]                    ; 1620 _ 8B. 40, 20
        mov     dword [ebp-14H], eax                    ; 1623 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 1626 _ 8B. 45, EC
        mov     dword [eax+28H], 0                      ; 1629 _ C7. 40, 28, 00000000
        mov     dword [ebp-0CH], 6                      ; 1630 _ C7. 45, F4, 00000006
        jmp     ?_084                                   ; 1637 _ EB, 25

?_083:  mov     edx, dword [ebp-0CH]                    ; 1639 _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 163C _ 8B. 45, 08
        add     eax, edx                                ; 163F _ 01. D0
        movzx   eax, byte [eax]                         ; 1641 _ 0F B6. 00
        movzx   eax, al                                 ; 1644 _ 0F B6. C0
        mov     edx, dword [ebp-14H]                    ; 1647 _ 8B. 55, EC
        add     edx, 16                                 ; 164A _ 83. C2, 10
        sub     esp, 8                                  ; 164D _ 83. EC, 08
        push    eax                                     ; 1650 _ 50
        push    edx                                     ; 1651 _ 52
        call    fifo8_put                               ; 1652 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1657 _ 83. C4, 10
        add     dword [ebp-0CH], 1                      ; 165A _ 83. 45, F4, 01
?_084:  mov     edx, dword [ebp-0CH]                    ; 165E _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 1661 _ 8B. 45, 08
        add     eax, edx                                ; 1664 _ 01. D0
        movzx   eax, byte [eax]                         ; 1666 _ 0F B6. 00
        test    al, al                                  ; 1669 _ 84. C0
        jnz     ?_083                                   ; 166B _ 75, CC
        mov     eax, dword [ebp-14H]                    ; 166D _ 8B. 45, EC
        mov     edx, dword [ebp-14H]                    ; 1670 _ 8B. 55, EC
        mov     dword [eax+28H], edx                    ; 1673 _ 89. 50, 28
        mov     eax, dword [ebp-14H]                    ; 1676 _ 8B. 45, EC
        add     eax, 16                                 ; 1679 _ 83. C0, 10
        sub     esp, 8                                  ; 167C _ 83. EC, 08
        push    28                                      ; 167F _ 6A, 1C
        push    eax                                     ; 1681 _ 50
        call    fifo8_put                               ; 1682 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1687 _ 83. C4, 10
        leave                                           ; 168A _ C9
        ret                                             ; 168B _ C3
; cmd_start End of function

cmd_ncst:; Function begin
        push    ebp                                     ; 168C _ 55
        mov     ebp, esp                                ; 168D _ 89. E5
        sub     esp, 24                                 ; 168F _ 83. EC, 18
        mov     eax, dword [console_count]              ; 1692 _ A1, 00000000(d)
        sub     esp, 12                                 ; 1697 _ 83. EC, 0C
        push    eax                                     ; 169A _ 50
        call    launch_console                          ; 169B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16A0 _ 83. C4, 10
        mov     eax, dword [console_count]              ; 16A3 _ A1, 00000000(d)
        add     eax, 1                                  ; 16A8 _ 83. C0, 01
        mov     dword [console_count], eax              ; 16AB _ A3, 00000000(d)
        mov     eax, dword [current_console_task]       ; 16B0 _ A1, 00000298(d)
        mov     dword [ebp-10H], eax                    ; 16B5 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 16B8 _ 8B. 45, F0
        mov     dword [eax+28H], 0                      ; 16BB _ C7. 40, 28, 00000000
        mov     dword [ebp-0CH], 5                      ; 16C2 _ C7. 45, F4, 00000005
        mov     dword [ebp-14H], 0                      ; 16C9 _ C7. 45, EC, 00000000
        jmp     ?_086                                   ; 16D0 _ EB, 25

?_085:  mov     edx, dword [ebp-0CH]                    ; 16D2 _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 16D5 _ 8B. 45, 08
        add     eax, edx                                ; 16D8 _ 01. D0
        movzx   eax, byte [eax]                         ; 16DA _ 0F B6. 00
        movzx   eax, al                                 ; 16DD _ 0F B6. C0
        mov     edx, dword [ebp-10H]                    ; 16E0 _ 8B. 55, F0
        add     edx, 16                                 ; 16E3 _ 83. C2, 10
        sub     esp, 8                                  ; 16E6 _ 83. EC, 08
        push    eax                                     ; 16E9 _ 50
        push    edx                                     ; 16EA _ 52
        call    fifo8_put                               ; 16EB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 16F0 _ 83. C4, 10
        add     dword [ebp-0CH], 1                      ; 16F3 _ 83. 45, F4, 01
?_086:  mov     edx, dword [ebp-0CH]                    ; 16F7 _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 16FA _ 8B. 45, 08
        add     eax, edx                                ; 16FD _ 01. D0
        movzx   eax, byte [eax]                         ; 16FF _ 0F B6. 00
        test    al, al                                  ; 1702 _ 84. C0
        jnz     ?_085                                   ; 1704 _ 75, CC
        mov     eax, dword [ebp-10H]                    ; 1706 _ 8B. 45, F0
        mov     edx, dword [ebp-10H]                    ; 1709 _ 8B. 55, F0
        mov     dword [eax+28H], edx                    ; 170C _ 89. 50, 28
        mov     eax, dword [ebp-10H]                    ; 170F _ 8B. 45, F0
        add     eax, 16                                 ; 1712 _ 83. C0, 10
        sub     esp, 8                                  ; 1715 _ 83. EC, 08
        push    28                                      ; 1718 _ 6A, 1C
        push    eax                                     ; 171A _ 50
        call    fifo8_put                               ; 171B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1720 _ 83. C4, 10
        leave                                           ; 1723 _ C9
        ret                                             ; 1724 _ C3
; cmd_ncst End of function

console_task:; Function begin
        push    ebp                                     ; 1725 _ 55
        mov     ebp, esp                                ; 1726 _ 89. E5
        push    ebx                                     ; 1728 _ 53
        sub     esp, 84                                 ; 1729 _ 83. EC, 54
        call    task_now                                ; 172C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1731 _ 89. 45, F0
        mov     dword [ebp-0CH], 0                      ; 1734 _ C7. 45, F4, 00000000
        mov     dword [ebp-14H], 0                      ; 173B _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 1742 _ C7. 45, E8, 00000000
        mov     eax, dword [memman]                     ; 1749 _ A1, 00000000(d)
        sub     esp, 8                                  ; 174E _ 83. EC, 08
        push    30                                      ; 1751 _ 6A, 1E
        push    eax                                     ; 1753 _ 50
        call    memman_alloc                            ; 1754 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1759 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 175C _ 89. 45, E4
        mov     dword [ebp-20H], 96                     ; 175F _ C7. 45, E0, 00000060
        mov     dword [ebp-24H], 176                    ; 1766 _ C7. 45, DC, 000000B0
        mov     eax, dword [ebp-10H]                    ; 176D _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 1770 _ 8B. 55, 08
        mov     dword [eax+94H], edx                    ; 1773 _ 89. 90, 00000094
        mov     eax, dword [ebp-10H]                    ; 1779 _ 8B. 45, F0
        mov     dword [eax+98H], 16                     ; 177C _ C7. 80, 00000098, 00000010
        mov     eax, dword [ebp-10H]                    ; 1786 _ 8B. 45, F0
        mov     dword [eax+9CH], 28                     ; 1789 _ C7. 80, 0000009C, 0000001C
        mov     eax, dword [ebp-10H]                    ; 1793 _ 8B. 45, F0
        mov     dword [eax+0A0H], -1                    ; 1796 _ C7. 80, 000000A0, FFFFFFFF
        call    timer_alloc                             ; 17A0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 17A5 _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 17A8 _ 8B. 45, F0
        add     eax, 16                                 ; 17AB _ 83. C0, 10
        sub     esp, 4                                  ; 17AE _ 83. EC, 04
        push    1                                       ; 17B1 _ 6A, 01
        push    eax                                     ; 17B3 _ 50
        push    dword [ebp-28H]                         ; 17B4 _ FF. 75, D8
        call    timer_init                              ; 17B7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17BC _ 83. C4, 10
        sub     esp, 8                                  ; 17BF _ 83. EC, 08
        push    50                                      ; 17C2 _ 6A, 32
        push    dword [ebp-28H]                         ; 17C4 _ FF. 75, D8
        call    timer_settime                           ; 17C7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 17CC _ 83. C4, 10
        mov     eax, dword [ebp-10H]                    ; 17CF _ 8B. 45, F0
        mov     edx, dword [ebp-28H]                    ; 17D2 _ 8B. 55, D8
        mov     dword [eax+0A8H], edx                   ; 17D5 _ 89. 90, 000000A8
        mov     eax, dword [ebp-10H]                    ; 17DB _ 8B. 45, F0
        mov     edx, dword [ebp-1CH]                    ; 17DE _ 8B. 55, E4
        mov     dword [eax+0ACH], edx                   ; 17E1 _ 89. 90, 000000AC
        mov     eax, dword [shtctl]                     ; 17E7 _ A1, 00000284(d)
        sub     esp, 8                                  ; 17EC _ 83. EC, 08
        push    ?_401                                   ; 17EF _ 68, 00000023(d)
        push    7                                       ; 17F4 _ 6A, 07
        push    28                                      ; 17F6 _ 6A, 1C
        push    8                                       ; 17F8 _ 6A, 08
        push    dword [ebp+8H]                          ; 17FA _ FF. 75, 08
        push    eax                                     ; 17FD _ 50
        call    showString                              ; 17FE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1803 _ 83. C4, 20
        mov     dword [ebp-2CH], 88064                  ; 1806 _ C7. 45, D4, 00015800
        mov     dword [ebp-30H], 0                      ; 180D _ C7. 45, D0, 00000000
?_087:  call    io_cli                                  ; 1814 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 1819 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 181E _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 1821 _ 8B. 45, F0
        add     eax, 16                                 ; 1824 _ 83. C0, 10
        sub     esp, 12                                 ; 1827 _ 83. EC, 0C
        push    eax                                     ; 182A _ 50
        call    fifo8_status                            ; 182B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1830 _ 83. C4, 10
        test    eax, eax                                ; 1833 _ 85. C0
        jnz     ?_088                                   ; 1835 _ 75, 0A
        call    io_sti                                  ; 1837 _ E8, FFFFFFFC(rel)
        jmp     ?_106                                   ; 183C _ E9, 000004BB

?_088:  mov     eax, dword [ebp-10H]                    ; 1841 _ 8B. 45, F0
        add     eax, 16                                 ; 1844 _ 83. C0, 10
        sub     esp, 12                                 ; 1847 _ 83. EC, 0C
        push    eax                                     ; 184A _ 50
        call    fifo8_get                               ; 184B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1850 _ 83. C4, 10
        mov     dword [ebp-34H], eax                    ; 1853 _ 89. 45, CC
        cmp     dword [ebp-34H], 1                      ; 1856 _ 83. 7D, CC, 01
        jg      ?_091                                   ; 185A _ 7F, 5F
        cmp     dword [ebp-0CH], 0                      ; 185C _ 83. 7D, F4, 00
        js      ?_091                                   ; 1860 _ 78, 59
        cmp     dword [ebp-34H], 0                      ; 1862 _ 83. 7D, CC, 00
        jz      ?_089                                   ; 1866 _ 74, 20
        mov     eax, dword [ebp-10H]                    ; 1868 _ 8B. 45, F0
        add     eax, 16                                 ; 186B _ 83. C0, 10
        sub     esp, 4                                  ; 186E _ 83. EC, 04
        push    0                                       ; 1871 _ 6A, 00
        push    eax                                     ; 1873 _ 50
        push    dword [ebp-28H]                         ; 1874 _ FF. 75, D8
        call    timer_init                              ; 1877 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 187C _ 83. C4, 10
        mov     dword [ebp-0CH], 7                      ; 187F _ C7. 45, F4, 00000007
        jmp     ?_090                                   ; 1886 _ EB, 1E

?_089:  mov     eax, dword [ebp-10H]                    ; 1888 _ 8B. 45, F0
        add     eax, 16                                 ; 188B _ 83. C0, 10
        sub     esp, 4                                  ; 188E _ 83. EC, 04
        push    1                                       ; 1891 _ 6A, 01
        push    eax                                     ; 1893 _ 50
        push    dword [ebp-28H]                         ; 1894 _ FF. 75, D8
        call    timer_init                              ; 1897 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 189C _ 83. C4, 10
        mov     dword [ebp-0CH], 0                      ; 189F _ C7. 45, F4, 00000000
?_090:  sub     esp, 8                                  ; 18A6 _ 83. EC, 08
        push    50                                      ; 18A9 _ 6A, 32
        push    dword [ebp-28H]                         ; 18AB _ FF. 75, D8
        call    timer_settime                           ; 18AE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18B3 _ 83. C4, 10
        jmp     ?_105                                   ; 18B6 _ E9, 000003FC

?_091:  cmp     dword [ebp-34H], 87                     ; 18BB _ 83. 7D, CC, 57
        jnz     ?_092                                   ; 18BF _ 75, 33
        mov     dword [ebp-0CH], 7                      ; 18C1 _ C7. 45, F4, 00000007
        mov     eax, dword [ebp-10H]                    ; 18C8 _ 8B. 45, F0
        add     eax, 16                                 ; 18CB _ 83. C0, 10
        sub     esp, 4                                  ; 18CE _ 83. EC, 04
        push    0                                       ; 18D1 _ 6A, 00
        push    eax                                     ; 18D3 _ 50
        push    dword [ebp-28H]                         ; 18D4 _ FF. 75, D8
        call    timer_init                              ; 18D7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18DC _ 83. C4, 10
        sub     esp, 8                                  ; 18DF _ 83. EC, 08
        push    50                                      ; 18E2 _ 6A, 32
        push    dword [ebp-28H]                         ; 18E4 _ FF. 75, D8
        call    timer_settime                           ; 18E7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 18EC _ 83. C4, 10
        jmp     ?_105                                   ; 18EF _ E9, 000003C3

?_092:  cmp     dword [ebp-34H], 88                     ; 18F4 _ 83. 7D, CC, 58
        jnz     ?_093                                   ; 18F8 _ 75, 59
        mov     eax, dword [ebp-10H]                    ; 18FA _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 18FD _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1903 _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1906 _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 190C _ A1, 00000284(d)
        sub     esp, 12                                 ; 1911 _ 83. EC, 0C
        push    0                                       ; 1914 _ 6A, 00
        push    ecx                                     ; 1916 _ 51
        push    edx                                     ; 1917 _ 52
        push    dword [ebp+8H]                          ; 1918 _ FF. 75, 08
        push    eax                                     ; 191B _ 50
        call    set_cursor                              ; 191C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1921 _ 83. C4, 20
        mov     dword [ebp-0CH], -1                     ; 1924 _ C7. 45, F4, FFFFFFFF
        mov     eax, dword [task_main]                  ; 192B _ A1, 00000294(d)
        sub     esp, 4                                  ; 1930 _ 83. EC, 04
        push    0                                       ; 1933 _ 6A, 00
        push    -1                                      ; 1935 _ 6A, FF
        push    eax                                     ; 1937 _ 50
        call    task_run                                ; 1938 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 193D _ 83. C4, 10
        sub     esp, 12                                 ; 1940 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 1943 _ FF. 75, F0
        call    task_sleep                              ; 1946 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 194B _ 83. C4, 10
        jmp     ?_105                                   ; 194E _ E9, 00000364

?_093:  cmp     dword [ebp-34H], 28                     ; 1953 _ 83. 7D, CC, 1C
        jne     ?_103                                   ; 1957 _ 0F 85, 0000021C
        mov     eax, dword [ebp-10H]                    ; 195D _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1960 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1966 _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1969 _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 196F _ A1, 00000284(d)
        sub     esp, 12                                 ; 1974 _ 83. EC, 0C
        push    0                                       ; 1977 _ 6A, 00
        push    ecx                                     ; 1979 _ 51
        push    edx                                     ; 197A _ 52
        push    dword [ebp+8H]                          ; 197B _ FF. 75, 08
        push    eax                                     ; 197E _ 50
        call    set_cursor                              ; 197F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1984 _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 1987 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 198A _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1990 _ 8D. 50, 07
        test    eax, eax                                ; 1993 _ 85. C0
        cmovs   eax, edx                                ; 1995 _ 0F 48. C2
        sar     eax, 3                                  ; 1998 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 199B _ 8D. 50, FE
        mov     eax, dword [ebp-1CH]                    ; 199E _ 8B. 45, E4
        add     eax, edx                                ; 19A1 _ 01. D0
        mov     byte [eax], 0                           ; 19A3 _ C6. 00, 00
        mov     eax, dword [ebp-10H]                    ; 19A6 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 19A9 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 19AF _ 8D. 50, 07
        test    eax, eax                                ; 19B2 _ 85. C0
        cmovs   eax, edx                                ; 19B4 _ 0F 48. C2
        sar     eax, 3                                  ; 19B7 _ C1. F8, 03
        sub     eax, 2                                  ; 19BA _ 83. E8, 02
        mov     byte [ebp+eax-55H], 0                   ; 19BD _ C6. 44 05, AB, 00
        mov     eax, dword [ebp-10H]                    ; 19C2 _ 8B. 45, F0
        mov     eax, dword [eax+9CH]                    ; 19C5 _ 8B. 80, 0000009C
        sub     esp, 8                                  ; 19CB _ 83. EC, 08
        push    dword [ebp+8H]                          ; 19CE _ FF. 75, 08
        push    eax                                     ; 19D1 _ 50
        call    cons_newline                            ; 19D2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 19D7 _ 83. C4, 10
        mov     edx, eax                                ; 19DA _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 19DC _ 8B. 45, F0
        mov     dword [eax+9CH], edx                    ; 19DF _ 89. 90, 0000009C
        sub     esp, 8                                  ; 19E5 _ 83. EC, 08
        push    ?_402                                   ; 19E8 _ 68, 00000025(d)
        push    dword [ebp-1CH]                         ; 19ED _ FF. 75, E4
        call    strcmp                                  ; 19F0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 19F5 _ 83. C4, 10
        cmp     eax, 1                                  ; 19F8 _ 83. F8, 01
        jnz     ?_094                                   ; 19FB _ 75, 13
        sub     esp, 12                                 ; 19FD _ 83. EC, 0C
        push    dword [ebp+0CH]                         ; 1A00 _ FF. 75, 0C
        call    cmd_mem                                 ; 1A03 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A08 _ 83. C4, 10
        jmp     ?_102                                   ; 1A0B _ E9, 00000157

?_094:  sub     esp, 8                                  ; 1A10 _ 83. EC, 08
        push    ?_403                                   ; 1A13 _ 68, 00000029(d)
        push    dword [ebp-1CH]                         ; 1A18 _ FF. 75, E4
        call    strcmp                                  ; 1A1B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A20 _ 83. C4, 10
        cmp     eax, 1                                  ; 1A23 _ 83. F8, 01
        jnz     ?_095                                   ; 1A26 _ 75, 0A
        call    cmd_cls                                 ; 1A28 _ E8, FFFFFFFC(rel)
        jmp     ?_102                                   ; 1A2D _ E9, 00000135

?_095:  sub     esp, 8                                  ; 1A32 _ 83. EC, 08
        push    ?_404                                   ; 1A35 _ 68, 0000002D(d)
        push    dword [ebp-1CH]                         ; 1A3A _ FF. 75, E4
        call    strcmp                                  ; 1A3D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A42 _ 83. C4, 10
        cmp     eax, 1                                  ; 1A45 _ 83. F8, 01
        jnz     ?_096                                   ; 1A48 _ 75, 15
        sub     esp, 12                                 ; 1A4A _ 83. EC, 0C
        push    ?_405                                   ; 1A4D _ 68, 00000031(d)
        call    cmd_execute_program                     ; 1A52 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A57 _ 83. C4, 10
        jmp     ?_102                                   ; 1A5A _ E9, 00000108

?_096:  sub     esp, 8                                  ; 1A5F _ 83. EC, 08
        push    ?_406                                   ; 1A62 _ 68, 00000039(d)
        push    dword [ebp-1CH]                         ; 1A67 _ FF. 75, E4
        call    strcmp                                  ; 1A6A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A6F _ 83. C4, 10
        cmp     eax, 1                                  ; 1A72 _ 83. F8, 01
        jnz     ?_097                                   ; 1A75 _ 75, 0A
        call    cmd_dir                                 ; 1A77 _ E8, FFFFFFFC(rel)
        jmp     ?_102                                   ; 1A7C _ E9, 000000E6

?_097:  sub     esp, 8                                  ; 1A81 _ 83. EC, 08
        push    ?_407                                   ; 1A84 _ 68, 0000003D(d)
        push    dword [ebp-1CH]                         ; 1A89 _ FF. 75, E4
        call    strcmp                                  ; 1A8C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1A91 _ 83. C4, 10
        cmp     eax, 1                                  ; 1A94 _ 83. F8, 01
        jnz     ?_098                                   ; 1A97 _ 75, 13
        sub     esp, 12                                 ; 1A99 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 1A9C _ FF. 75, F0
        call    cmd_exit                                ; 1A9F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1AA4 _ 83. C4, 10
        jmp     ?_102                                   ; 1AA7 _ E9, 000000BB

?_098:  mov     eax, dword [ebp-1CH]                    ; 1AAC _ 8B. 45, E4
        movzx   eax, byte [eax]                         ; 1AAF _ 0F B6. 00
        cmp     al, 116                                 ; 1AB2 _ 3C, 74
        jnz     ?_099                                   ; 1AB4 _ 75, 37
        mov     eax, dword [ebp-1CH]                    ; 1AB6 _ 8B. 45, E4
        add     eax, 1                                  ; 1AB9 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 1ABC _ 0F B6. 00
        cmp     al, 121                                 ; 1ABF _ 3C, 79
        jnz     ?_099                                   ; 1AC1 _ 75, 2A
        mov     eax, dword [ebp-1CH]                    ; 1AC3 _ 8B. 45, E4
        add     eax, 2                                  ; 1AC6 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 1AC9 _ 0F B6. 00
        cmp     al, 112                                 ; 1ACC _ 3C, 70
        jnz     ?_099                                   ; 1ACE _ 75, 1D
        mov     eax, dword [ebp-1CH]                    ; 1AD0 _ 8B. 45, E4
        add     eax, 3                                  ; 1AD3 _ 83. C0, 03
        movzx   eax, byte [eax]                         ; 1AD6 _ 0F B6. 00
        cmp     al, 101                                 ; 1AD9 _ 3C, 65
        jnz     ?_099                                   ; 1ADB _ 75, 10
        sub     esp, 12                                 ; 1ADD _ 83. EC, 0C
        push    dword [ebp-1CH]                         ; 1AE0 _ FF. 75, E4
        call    cmd_type                                ; 1AE3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1AE8 _ 83. C4, 10
        jmp     ?_102                                   ; 1AEB _ EB, 7A

?_099:  sub     esp, 8                                  ; 1AED _ 83. EC, 08
        push    ?_408                                   ; 1AF0 _ 68, 00000042(d)
        push    dword [ebp-1CH]                         ; 1AF5 _ FF. 75, E4
        call    strcmp                                  ; 1AF8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1AFD _ 83. C4, 10
        cmp     eax, 1                                  ; 1B00 _ 83. F8, 01
        jnz     ?_100                                   ; 1B03 _ 75, 11
        sub     esp, 12                                 ; 1B05 _ 83. EC, 0C
        lea     eax, [ebp-55H]                          ; 1B08 _ 8D. 45, AB
        push    eax                                     ; 1B0B _ 50
        call    cmd_start                               ; 1B0C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B11 _ 83. C4, 10
        jmp     ?_102                                   ; 1B14 _ EB, 51

?_100:  sub     esp, 8                                  ; 1B16 _ 83. EC, 08
        push    ?_409                                   ; 1B19 _ 68, 00000048(d)
        push    dword [ebp-1CH]                         ; 1B1E _ FF. 75, E4
        call    strcmp                                  ; 1B21 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B26 _ 83. C4, 10
        cmp     eax, 1                                  ; 1B29 _ 83. F8, 01
        jnz     ?_101                                   ; 1B2C _ 75, 11
        sub     esp, 12                                 ; 1B2E _ 83. EC, 0C
        lea     eax, [ebp-55H]                          ; 1B31 _ 8D. 45, AB
        push    eax                                     ; 1B34 _ 50
        call    cmd_ncst                                ; 1B35 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B3A _ 83. C4, 10
        jmp     ?_102                                   ; 1B3D _ EB, 28

?_101:  sub     esp, 8                                  ; 1B3F _ 83. EC, 08
        push    ?_410                                   ; 1B42 _ 68, 0000004D(d)
        push    dword [ebp-1CH]                         ; 1B47 _ FF. 75, E4
        call    strcmp                                  ; 1B4A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B4F _ 83. C4, 10
        cmp     eax, 1                                  ; 1B52 _ 83. F8, 01
        jnz     ?_102                                   ; 1B55 _ 75, 10
        sub     esp, 12                                 ; 1B57 _ 83. EC, 0C
        push    ?_411                                   ; 1B5A _ 68, 00000053(d)
        call    cmd_execute_program                     ; 1B5F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1B64 _ 83. C4, 10
?_102:  mov     eax, dword [ebp-10H]                    ; 1B67 _ 8B. 45, F0
        mov     dword [eax+98H], 16                     ; 1B6A _ C7. 80, 00000098, 00000010
        jmp     ?_105                                   ; 1B74 _ E9, 0000013E

?_103:  cmp     dword [ebp-34H], 14                     ; 1B79 _ 83. 7D, CC, 0E
        jnz     ?_104                                   ; 1B7D _ 75, 7C
        mov     eax, dword [ebp-10H]                    ; 1B7F _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1B82 _ 8B. 80, 00000098
        cmp     eax, 8                                  ; 1B88 _ 83. F8, 08
        jle     ?_104                                   ; 1B8B _ 7E, 6E
        mov     eax, dword [ebp-10H]                    ; 1B8D _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1B90 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1B96 _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1B99 _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1B9F _ A1, 00000284(d)
        sub     esp, 12                                 ; 1BA4 _ 83. EC, 0C
        push    0                                       ; 1BA7 _ 6A, 00
        push    ecx                                     ; 1BA9 _ 51
        push    edx                                     ; 1BAA _ 52
        push    dword [ebp+8H]                          ; 1BAB _ FF. 75, 08
        push    eax                                     ; 1BAE _ 50
        call    set_cursor                              ; 1BAF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1BB4 _ 83. C4, 20
        mov     eax, dword [ebp-10H]                    ; 1BB7 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1BBA _ 8B. 80, 00000098
        lea     edx, [eax-8H]                           ; 1BC0 _ 8D. 50, F8
        mov     eax, dword [ebp-10H]                    ; 1BC3 _ 8B. 45, F0
        mov     dword [eax+98H], edx                    ; 1BC6 _ 89. 90, 00000098
        mov     eax, dword [ebp-10H]                    ; 1BCC _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1BCF _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1BD5 _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1BD8 _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1BDE _ A1, 00000284(d)
        sub     esp, 12                                 ; 1BE3 _ 83. EC, 0C
        push    0                                       ; 1BE6 _ 6A, 00
        push    ecx                                     ; 1BE8 _ 51
        push    edx                                     ; 1BE9 _ 52
        push    dword [ebp+8H]                          ; 1BEA _ FF. 75, 08
        push    eax                                     ; 1BED _ 50
        call    set_cursor                              ; 1BEE _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1BF3 _ 83. C4, 20
        jmp     ?_105                                   ; 1BF6 _ E9, 000000BC

?_104:  sub     esp, 12                                 ; 1BFB _ 83. EC, 0C
        push    dword [ebp-34H]                         ; 1BFE _ FF. 75, CC
        call    transferScanCode                        ; 1C01 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1C06 _ 83. C4, 10
        mov     byte [ebp-35H], al                      ; 1C09 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 1C0C _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1C0F _ 8B. 80, 00000098
        cmp     eax, 239                                ; 1C15 _ 3D, 000000EF
        jg      ?_105                                   ; 1C1A _ 0F 8F, 00000097
        cmp     byte [ebp-35H], 0                       ; 1C20 _ 80. 7D, CB, 00
        je      ?_105                                   ; 1C24 _ 0F 84, 0000008D
        mov     eax, dword [ebp-10H]                    ; 1C2A _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1C2D _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1C33 _ 8D. 50, 07
        test    eax, eax                                ; 1C36 _ 85. C0
        cmovs   eax, edx                                ; 1C38 _ 0F 48. C2
        sar     eax, 3                                  ; 1C3B _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1C3E _ 8D. 50, FE
        mov     eax, dword [ebp-1CH]                    ; 1C41 _ 8B. 45, E4
        add     edx, eax                                ; 1C44 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 1C46 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 1C4A _ 88. 02
        mov     eax, dword [ebp-10H]                    ; 1C4C _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1C4F _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1C55 _ 8D. 50, 07
        test    eax, eax                                ; 1C58 _ 85. C0
        cmovs   eax, edx                                ; 1C5A _ 0F 48. C2
        sar     eax, 3                                  ; 1C5D _ C1. F8, 03
        lea     edx, [eax-1H]                           ; 1C60 _ 8D. 50, FF
        mov     eax, dword [ebp-1CH]                    ; 1C63 _ 8B. 45, E4
        add     eax, edx                                ; 1C66 _ 01. D0
        mov     byte [eax], 0                           ; 1C68 _ C6. 00, 00
        mov     eax, dword [ebp-10H]                    ; 1C6B _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1C6E _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1C74 _ 8D. 50, 07
        test    eax, eax                                ; 1C77 _ 85. C0
        cmovs   eax, edx                                ; 1C79 _ 0F 48. C2
        sar     eax, 3                                  ; 1C7C _ C1. F8, 03
        sub     eax, 2                                  ; 1C7F _ 83. E8, 02
        mov     edx, dword [ebp-34H]                    ; 1C82 _ 8B. 55, CC
        mov     byte [ebp+eax-55H], dl                  ; 1C85 _ 88. 54 05, AB
        mov     eax, dword [ebp-10H]                    ; 1C89 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1C8C _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1C92 _ 8D. 50, 07
        test    eax, eax                                ; 1C95 _ 85. C0
        cmovs   eax, edx                                ; 1C97 _ 0F 48. C2
        sar     eax, 3                                  ; 1C9A _ C1. F8, 03
        sub     eax, 1                                  ; 1C9D _ 83. E8, 01
        mov     byte [ebp+eax-55H], 0                   ; 1CA0 _ C6. 44 05, AB, 00
        movsx   eax, byte [ebp-35H]                     ; 1CA5 _ 0F BE. 45, CB
        sub     esp, 8                                  ; 1CA9 _ 83. EC, 08
        push    1                                       ; 1CAC _ 6A, 01
        push    eax                                     ; 1CAE _ 50
        call    cons_putchar                            ; 1CAF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1CB4 _ 83. C4, 10
?_105:  cmp     dword [ebp-0CH], 0                      ; 1CB7 _ 83. 7D, F4, 00
        js      ?_106                                   ; 1CBB _ 78, 3F
        mov     eax, dword [ebp-10H]                    ; 1CBD _ 8B. 45, F0
        mov     eax, dword [eax+94H]                    ; 1CC0 _ 8B. 80, 00000094
        test    eax, eax                                ; 1CC6 _ 85. C0
        jz      ?_106                                   ; 1CC8 _ 74, 32
        mov     eax, dword [ebp-10H]                    ; 1CCA _ 8B. 45, F0
        mov     ebx, dword [eax+9CH]                    ; 1CCD _ 8B. 98, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1CD3 _ 8B. 45, F0
        mov     ecx, dword [eax+98H]                    ; 1CD6 _ 8B. 88, 00000098
        mov     eax, dword [ebp-10H]                    ; 1CDC _ 8B. 45, F0
        mov     edx, dword [eax+94H]                    ; 1CDF _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1CE5 _ A1, 00000284(d)
        sub     esp, 12                                 ; 1CEA _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 1CED _ FF. 75, F4
        push    ebx                                     ; 1CF0 _ 53
        push    ecx                                     ; 1CF1 _ 51
        push    edx                                     ; 1CF2 _ 52
        push    eax                                     ; 1CF3 _ 50
        call    set_cursor                              ; 1CF4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1CF9 _ 83. C4, 20
?_106:  call    io_sti                                  ; 1CFC _ E8, FFFFFFFC(rel)
        jmp     ?_087                                   ; 1D01 _ E9, FFFFFB0E
; console_task End of function

cons_putstr:; Function begin
        push    ebp                                     ; 1D06 _ 55
        mov     ebp, esp                                ; 1D07 _ 89. E5
        sub     esp, 8                                  ; 1D09 _ 83. EC, 08
        jmp     ?_108                                   ; 1D0C _ EB, 1B

?_107:  mov     eax, dword [ebp+8H]                     ; 1D0E _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1D11 _ 0F B6. 00
        movsx   eax, al                                 ; 1D14 _ 0F BE. C0
        sub     esp, 8                                  ; 1D17 _ 83. EC, 08
        push    1                                       ; 1D1A _ 6A, 01
        push    eax                                     ; 1D1C _ 50
        call    cons_putchar                            ; 1D1D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1D22 _ 83. C4, 10
        add     dword [ebp+8H], 1                       ; 1D25 _ 83. 45, 08, 01
?_108:  mov     eax, dword [ebp+8H]                     ; 1D29 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1D2C _ 0F B6. 00
        test    al, al                                  ; 1D2F _ 84. C0
        jnz     ?_107                                   ; 1D31 _ 75, DB
        nop                                             ; 1D33 _ 90
        leave                                           ; 1D34 _ C9
        ret                                             ; 1D35 _ C3
; cons_putstr End of function

api_linewin:; Function begin
        push    ebp                                     ; 1D36 _ 55
        mov     ebp, esp                                ; 1D37 _ 89. E5
        sub     esp, 32                                 ; 1D39 _ 83. EC, 20
        mov     eax, dword [ebp+14H]                    ; 1D3C _ 8B. 45, 14
        sub     eax, dword [ebp+0CH]                    ; 1D3F _ 2B. 45, 0C
        mov     dword [ebp-14H], eax                    ; 1D42 _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 1D45 _ 8B. 45, 18
        sub     eax, dword [ebp+10H]                    ; 1D48 _ 2B. 45, 10
        mov     dword [ebp-18H], eax                    ; 1D4B _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 1D4E _ 8B. 45, 0C
        shl     eax, 10                                 ; 1D51 _ C1. E0, 0A
        mov     dword [ebp-8H], eax                     ; 1D54 _ 89. 45, F8
        mov     eax, dword [ebp+10H]                    ; 1D57 _ 8B. 45, 10
        shl     eax, 10                                 ; 1D5A _ C1. E0, 0A
        mov     dword [ebp-0CH], eax                    ; 1D5D _ 89. 45, F4
        cmp     dword [ebp-14H], 0                      ; 1D60 _ 83. 7D, EC, 00
        jns     ?_109                                   ; 1D64 _ 79, 03
        neg     dword [ebp-14H]                         ; 1D66 _ F7. 5D, EC
?_109:  cmp     dword [ebp-18H], 0                      ; 1D69 _ 83. 7D, E8, 00
        jns     ?_110                                   ; 1D6D _ 79, 03
        neg     dword [ebp-18H]                         ; 1D6F _ F7. 5D, E8
?_110:  mov     eax, dword [ebp-14H]                    ; 1D72 _ 8B. 45, EC
        cmp     eax, dword [ebp-18H]                    ; 1D75 _ 3B. 45, E8
        jl      ?_114                                   ; 1D78 _ 7C, 53
        mov     eax, dword [ebp-14H]                    ; 1D7A _ 8B. 45, EC
        add     eax, 1                                  ; 1D7D _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1D80 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1D83 _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 1D86 _ 3B. 45, 14
        jle     ?_111                                   ; 1D89 _ 7E, 09
        mov     dword [ebp-14H], -1024                  ; 1D8B _ C7. 45, EC, FFFFFC00
        jmp     ?_112                                   ; 1D92 _ EB, 07

?_111:  mov     dword [ebp-14H], 1024                   ; 1D94 _ C7. 45, EC, 00000400
?_112:  mov     eax, dword [ebp+10H]                    ; 1D9B _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 1D9E _ 3B. 45, 18
        jg      ?_113                                   ; 1DA1 _ 7F, 15
        mov     eax, dword [ebp+18H]                    ; 1DA3 _ 8B. 45, 18
        sub     eax, dword [ebp+10H]                    ; 1DA6 _ 2B. 45, 10
        add     eax, 1                                  ; 1DA9 _ 83. C0, 01
        shl     eax, 10                                 ; 1DAC _ C1. E0, 0A
        cdq                                             ; 1DAF _ 99
        idiv    dword [ebp-10H]                         ; 1DB0 _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 1DB3 _ 89. 45, E8
        jmp     ?_118                                   ; 1DB6 _ EB, 66

?_113:  mov     eax, dword [ebp+18H]                    ; 1DB8 _ 8B. 45, 18
        sub     eax, dword [ebp+10H]                    ; 1DBB _ 2B. 45, 10
        sub     eax, 1                                  ; 1DBE _ 83. E8, 01
        shl     eax, 10                                 ; 1DC1 _ C1. E0, 0A
        cdq                                             ; 1DC4 _ 99
        idiv    dword [ebp-10H]                         ; 1DC5 _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 1DC8 _ 89. 45, E8
        jmp     ?_118                                   ; 1DCB _ EB, 51

?_114:  mov     eax, dword [ebp-18H]                    ; 1DCD _ 8B. 45, E8
        add     eax, 1                                  ; 1DD0 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1DD3 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1DD6 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 1DD9 _ 3B. 45, 18
        jle     ?_115                                   ; 1DDC _ 7E, 09
        mov     dword [ebp-18H], -1024                  ; 1DDE _ C7. 45, E8, FFFFFC00
        jmp     ?_116                                   ; 1DE5 _ EB, 07

?_115:  mov     dword [ebp-18H], 1024                   ; 1DE7 _ C7. 45, E8, 00000400
?_116:  mov     eax, dword [ebp+0CH]                    ; 1DEE _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 1DF1 _ 3B. 45, 14
        jg      ?_117                                   ; 1DF4 _ 7F, 15
        mov     eax, dword [ebp+14H]                    ; 1DF6 _ 8B. 45, 14
        sub     eax, dword [ebp+0CH]                    ; 1DF9 _ 2B. 45, 0C
        add     eax, 1                                  ; 1DFC _ 83. C0, 01
        shl     eax, 10                                 ; 1DFF _ C1. E0, 0A
        cdq                                             ; 1E02 _ 99
        idiv    dword [ebp-10H]                         ; 1E03 _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 1E06 _ 89. 45, EC
        jmp     ?_118                                   ; 1E09 _ EB, 13

?_117:  mov     eax, dword [ebp+14H]                    ; 1E0B _ 8B. 45, 14
        sub     eax, dword [ebp+0CH]                    ; 1E0E _ 2B. 45, 0C
        sub     eax, 1                                  ; 1E11 _ 83. E8, 01
        shl     eax, 10                                 ; 1E14 _ C1. E0, 0A
        cdq                                             ; 1E17 _ 99
        idiv    dword [ebp-10H]                         ; 1E18 _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 1E1B _ 89. 45, EC
?_118:  mov     dword [ebp-4H], 0                       ; 1E1E _ C7. 45, FC, 00000000
        jmp     ?_120                                   ; 1E25 _ EB, 35

?_119:  mov     eax, dword [ebp+8H]                     ; 1E27 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1E2A _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 1E2C _ 8B. 45, F4
        sar     eax, 10                                 ; 1E2F _ C1. F8, 0A
        mov     ecx, eax                                ; 1E32 _ 89. C1
        mov     eax, dword [ebp+8H]                     ; 1E34 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1E37 _ 8B. 40, 04
        imul    eax, ecx                                ; 1E3A _ 0F AF. C1
        mov     ecx, dword [ebp-8H]                     ; 1E3D _ 8B. 4D, F8
        sar     ecx, 10                                 ; 1E40 _ C1. F9, 0A
        add     eax, ecx                                ; 1E43 _ 01. C8
        add     eax, edx                                ; 1E45 _ 01. D0
        mov     edx, dword [ebp+1CH]                    ; 1E47 _ 8B. 55, 1C
        mov     byte [eax], dl                          ; 1E4A _ 88. 10
        mov     eax, dword [ebp-14H]                    ; 1E4C _ 8B. 45, EC
        add     dword [ebp-8H], eax                     ; 1E4F _ 01. 45, F8
        mov     eax, dword [ebp-18H]                    ; 1E52 _ 8B. 45, E8
        add     dword [ebp-0CH], eax                    ; 1E55 _ 01. 45, F4
        add     dword [ebp-4H], 1                       ; 1E58 _ 83. 45, FC, 01
?_120:  mov     eax, dword [ebp-4H]                     ; 1E5C _ 8B. 45, FC
        cmp     eax, dword [ebp-10H]                    ; 1E5F _ 3B. 45, F0
        jl      ?_119                                   ; 1E62 _ 7C, C3
        leave                                           ; 1E64 _ C9
        ret                                             ; 1E65 _ C3
; api_linewin End of function

handle_keyboard:; Function begin
        push    ebp                                     ; 1E66 _ 55
        mov     ebp, esp                                ; 1E67 _ 89. E5
        sub     esp, 24                                 ; 1E69 _ 83. EC, 18
?_121:  call    io_cli                                  ; 1E6C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1E71 _ 8B. 45, 08
        add     eax, 16                                 ; 1E74 _ 83. C0, 10
        sub     esp, 12                                 ; 1E77 _ 83. EC, 0C
        push    eax                                     ; 1E7A _ 50
        call    fifo8_status                            ; 1E7B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1E80 _ 83. C4, 10
        test    eax, eax                                ; 1E83 _ 85. C0
        jnz     ?_123                                   ; 1E85 _ 75, 2B
        call    io_sti                                  ; 1E87 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+0CH], 0                      ; 1E8C _ 83. 7D, 0C, 00
        jz      ?_122                                   ; 1E90 _ 74, 05
        jmp     ?_127                                   ; 1E92 _ E9, 000000C8

?_122:  call    io_sti                                  ; 1E97 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1E9C _ 8B. 45, 10
        add     eax, 28                                 ; 1E9F _ 83. C0, 1C
        mov     dword [eax], -1                         ; 1EA2 _ C7. 00, FFFFFFFF
        mov     eax, 0                                  ; 1EA8 _ B8, 00000000
        jmp     ?_128                                   ; 1EAD _ E9, 000000B2

?_123:  mov     eax, dword [ebp+8H]                     ; 1EB2 _ 8B. 45, 08
        add     eax, 16                                 ; 1EB5 _ 83. C0, 10
        sub     esp, 12                                 ; 1EB8 _ 83. EC, 0C
        push    eax                                     ; 1EBB _ 50
        call    fifo8_get                               ; 1EBC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1EC1 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 1EC4 _ 89. 45, F4
        call    io_sti                                  ; 1EC7 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 255                    ; 1ECC _ 81. 7D, F4, 000000FF
        jle     ?_124                                   ; 1ED3 _ 7E, 26
        mov     edx, dword [sht_back]                   ; 1ED5 _ 8B. 15, 00000288(d)
        mov     eax, dword [shtctl]                     ; 1EDB _ A1, 00000284(d)
        sub     esp, 8                                  ; 1EE0 _ 83. EC, 08
        push    ?_412                                   ; 1EE3 _ 68, 0000005D(d)
        push    7                                       ; 1EE8 _ 6A, 07
        push    176                                     ; 1EEA _ 68, 000000B0
        push    0                                       ; 1EEF _ 6A, 00
        push    edx                                     ; 1EF1 _ 52
        push    eax                                     ; 1EF2 _ 50
        call    showString                              ; 1EF3 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 1EF8 _ 83. C4, 20
?_124:  cmp     dword [ebp-0CH], 1                      ; 1EFB _ 83. 7D, F4, 01
        jg      ?_125                                   ; 1EFF _ 7F, 37
        mov     eax, dword [ebp+8H]                     ; 1F01 _ 8B. 45, 08
        lea     edx, [eax+10H]                          ; 1F04 _ 8D. 50, 10
        mov     eax, dword [ebp+8H]                     ; 1F07 _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 1F0A _ 8B. 80, 000000A8
        sub     esp, 4                                  ; 1F10 _ 83. EC, 04
        push    1                                       ; 1F13 _ 6A, 01
        push    edx                                     ; 1F15 _ 52
        push    eax                                     ; 1F16 _ 50
        call    timer_init                              ; 1F17 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1F1C _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 1F1F _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 1F22 _ 8B. 80, 000000A8
        sub     esp, 8                                  ; 1F28 _ 83. EC, 08
        push    50                                      ; 1F2B _ 6A, 32
        push    eax                                     ; 1F2D _ 50
        call    timer_settime                           ; 1F2E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1F33 _ 83. C4, 10
        jmp     ?_127                                   ; 1F36 _ EB, 27

?_125:  cmp     dword [ebp-0CH], 2                      ; 1F38 _ 83. 7D, F4, 02
        jnz     ?_126                                   ; 1F3C _ 75, 0F
        mov     eax, dword [ebp+8H]                     ; 1F3E _ 8B. 45, 08
        mov     dword [eax+0A0H], 7                     ; 1F41 _ C7. 80, 000000A0, 00000007
        jmp     ?_127                                   ; 1F4B _ EB, 12

?_126:  mov     eax, dword [ebp+10H]                    ; 1F4D _ 8B. 45, 10
        lea     edx, [eax+1CH]                          ; 1F50 _ 8D. 50, 1C
        mov     eax, dword [ebp-0CH]                    ; 1F53 _ 8B. 45, F4
        mov     dword [edx], eax                        ; 1F56 _ 89. 02
        mov     eax, 0                                  ; 1F58 _ B8, 00000000
        jmp     ?_128                                   ; 1F5D _ EB, 05

?_127:  jmp     ?_121                                   ; 1F5F _ E9, FFFFFF08

?_128:  leave                                           ; 1F64 _ C9
        ret                                             ; 1F65 _ C3
; handle_keyboard End of function

close_constask:; Function begin
        push    ebp                                     ; 1F66 _ 55
        mov     ebp, esp                                ; 1F67 _ 89. E5
        sub     esp, 8                                  ; 1F69 _ 83. EC, 08
        sub     esp, 12                                 ; 1F6C _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 1F6F _ FF. 75, 08
        call    task_sleep                              ; 1F72 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1F77 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 1F7A _ 8B. 45, 08
        mov     eax, dword [eax+0B8H]                   ; 1F7D _ 8B. 80, 000000B8
        mov     edx, eax                                ; 1F83 _ 89. C2
        mov     eax, dword [memman]                     ; 1F85 _ A1, 00000000(d)
        sub     esp, 4                                  ; 1F8A _ 83. EC, 04
        push    65536                                   ; 1F8D _ 68, 00010000
        push    edx                                     ; 1F92 _ 52
        push    eax                                     ; 1F93 _ 50
        call    memman_free_4k                          ; 1F94 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1F99 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 1F9C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1F9F _ 8B. 40, 10
        mov     edx, eax                                ; 1FA2 _ 89. C2
        mov     eax, dword [memman]                     ; 1FA4 _ A1, 00000000(d)
        sub     esp, 4                                  ; 1FA9 _ 83. EC, 04
        push    128                                     ; 1FAC _ 68, 00000080
        push    edx                                     ; 1FB1 _ 52
        push    eax                                     ; 1FB2 _ 50
        call    memman_free                             ; 1FB3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1FB8 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 1FBB _ 8B. 45, 08
        mov     eax, dword [eax+0ACH]                   ; 1FBE _ 8B. 80, 000000AC
        mov     edx, eax                                ; 1FC4 _ 89. C2
        mov     eax, dword [memman]                     ; 1FC6 _ A1, 00000000(d)
        sub     esp, 4                                  ; 1FCB _ 83. EC, 04
        push    30                                      ; 1FCE _ 6A, 1E
        push    edx                                     ; 1FD0 _ 52
        push    eax                                     ; 1FD1 _ 50
        call    memman_free                             ; 1FD2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 1FD7 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 1FDA _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1FDD _ C7. 40, 04, 00000000
        mov     dword [current_console_task], 0         ; 1FE4 _ C7. 05, 00000298(d), 00000000
        leave                                           ; 1FEE _ C9
        ret                                             ; 1FEF _ C3
; close_constask End of function

close_console:; Function begin
        push    ebp                                     ; 1FF0 _ 55
        mov     ebp, esp                                ; 1FF1 _ 89. E5
        sub     esp, 24                                 ; 1FF3 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 1FF6 _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 1FF9 _ 8B. 80, 000000A8
        sub     esp, 12                                 ; 1FFF _ 83. EC, 0C
        push    eax                                     ; 2002 _ 50
        call    timer_free                              ; 2003 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2008 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 200B _ 8B. 45, 08
        mov     eax, dword [eax+0B4H]                   ; 200E _ 8B. 80, 000000B4
        test    eax, eax                                ; 2014 _ 85. C0
        jz      ?_129                                   ; 2016 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 2018 _ 8B. 45, 08
        mov     eax, dword [eax+0B4H]                   ; 201B _ 8B. 80, 000000B4
        mov     dword [ebp-0CH], eax                    ; 2021 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 2024 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 2027 _ 8B. 00
        mov     edx, eax                                ; 2029 _ 89. C2
        mov     eax, dword [memman]                     ; 202B _ A1, 00000000(d)
        sub     esp, 4                                  ; 2030 _ 83. EC, 04
        push    42240                                   ; 2033 _ 68, 0000A500
        push    edx                                     ; 2038 _ 52
        push    eax                                     ; 2039 _ 50
        call    memman_free_4k                          ; 203A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 203F _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 2042 _ A1, 00000284(d)
        sub     esp, 8                                  ; 2047 _ 83. EC, 08
        push    dword [ebp-0CH]                         ; 204A _ FF. 75, F4
        push    eax                                     ; 204D _ 50
        call    sheet_free                              ; 204E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2053 _ 83. C4, 10
?_129:  sub     esp, 12                                 ; 2056 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 2059 _ FF. 75, 08
        call    close_constask                          ; 205C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2061 _ 83. C4, 10
        leave                                           ; 2064 _ C9
        ret                                             ; 2065 _ C3
; close_console End of function

cmd_exit:; Function begin
        push    ebp                                     ; 2066 _ 55
        mov     ebp, esp                                ; 2067 _ 89. E5
        sub     esp, 8                                  ; 2069 _ 83. EC, 08
        call    io_cli                                  ; 206C _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 2071 _ 83. EC, 08
        push    255                                     ; 2074 _ 68, 000000FF
        push    keyinfo                                 ; 2079 _ 68, 00000020(d)
        call    fifo8_put                               ; 207E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2083 _ 83. C4, 10
        call    io_sti                                  ; 2086 _ E8, FFFFFFFC(rel)
        leave                                           ; 208B _ C9
        ret                                             ; 208C _ C3
; cmd_exit End of function

kernel_api:; Function begin
        push    ebp                                     ; 208D _ 55
        mov     ebp, esp                                ; 208E _ 89. E5
        push    ebx                                     ; 2090 _ 53
        sub     esp, 20                                 ; 2091 _ 83. EC, 14
        call    task_now                                ; 2094 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2099 _ 89. 45, F4
        mov     dword [ebp-10H], 0                      ; 209C _ C7. 45, F0, 00000000
        lea     eax, [ebp+24H]                          ; 20A3 _ 8D. 45, 24
        add     eax, 4                                  ; 20A6 _ 83. C0, 04
        mov     dword [ebp-14H], eax                    ; 20A9 _ 89. 45, EC
        mov     dword [ebp-18H], 0                      ; 20AC _ C7. 45, E8, 00000000
        cmp     dword [ebp+1CH], 1                      ; 20B3 _ 83. 7D, 1C, 01
        jnz     ?_130                                   ; 20B7 _ 75, 19
        mov     eax, dword [ebp+24H]                    ; 20B9 _ 8B. 45, 24
        movsx   eax, al                                 ; 20BC _ 0F BE. C0
        sub     esp, 8                                  ; 20BF _ 83. EC, 08
        push    1                                       ; 20C2 _ 6A, 01
        push    eax                                     ; 20C4 _ 50
        call    cons_putchar                            ; 20C5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 20CA _ 83. C4, 10
        jmp     ?_144                                   ; 20CD _ E9, 00000365

?_130:  cmp     dword [ebp+1CH], 2                      ; 20D2 _ 83. 7D, 1C, 02
        jnz     ?_131                                   ; 20D6 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 20D8 _ 8B. 45, F4
        mov     eax, dword [eax+0B0H]                   ; 20DB _ 8B. 80, 000000B0
        mov     edx, dword [eax]                        ; 20E1 _ 8B. 10
        mov     eax, dword [ebp+18H]                    ; 20E3 _ 8B. 45, 18
        add     eax, edx                                ; 20E6 _ 01. D0
        sub     esp, 12                                 ; 20E8 _ 83. EC, 0C
        push    eax                                     ; 20EB _ 50
        call    cons_putstr                             ; 20EC _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 20F1 _ 83. C4, 10
        jmp     ?_144                                   ; 20F4 _ E9, 0000033E

?_131:  cmp     dword [ebp+1CH], 4                      ; 20F9 _ 83. 7D, 1C, 04
        jnz     ?_132                                   ; 20FD _ 75, 15
        mov     eax, dword [ebp-0CH]                    ; 20FF _ 8B. 45, F4
        mov     dword [eax+34H], 0                      ; 2102 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-0CH]                    ; 2109 _ 8B. 45, F4
        add     eax, 48                                 ; 210C _ 83. C0, 30
        jmp     ?_145                                   ; 210F _ E9, 00000328

?_132:  cmp     dword [ebp+1CH], 5                      ; 2114 _ 83. 7D, 1C, 05
        jne     ?_133                                   ; 2118 _ 0F 85, 000000E8
        mov     eax, dword [shtctl]                     ; 211E _ A1, 00000284(d)
        sub     esp, 12                                 ; 2123 _ 83. EC, 0C
        push    eax                                     ; 2126 _ 50
        call    sheet_alloc                             ; 2127 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 212C _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 212F _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 2132 _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 2135 _ 8B. 55, F4
        mov     dword [eax+20H], edx                    ; 2138 _ 89. 50, 20
        mov     eax, dword [ebp-10H]                    ; 213B _ 8B. 45, F0
        mov     eax, dword [eax+1CH]                    ; 213E _ 8B. 40, 1C
        or      eax, 10H                                ; 2141 _ 83. C8, 10
        mov     edx, eax                                ; 2144 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 2146 _ 8B. 45, F0
        mov     dword [eax+1CH], edx                    ; 2149 _ 89. 50, 1C
        mov     eax, dword [ebp+24H]                    ; 214C _ 8B. 45, 24
        mov     edx, dword [ebp-0CH]                    ; 214F _ 8B. 55, F4
        mov     edx, dword [edx+0B0H]                   ; 2152 _ 8B. 92, 000000B0
        mov     ecx, dword [edx+4H]                     ; 2158 _ 8B. 4A, 04
        mov     edx, dword [ebp+18H]                    ; 215B _ 8B. 55, 18
        add     edx, ecx                                ; 215E _ 01. CA
        sub     esp, 12                                 ; 2160 _ 83. EC, 0C
        push    eax                                     ; 2163 _ 50
        push    dword [ebp+8H]                          ; 2164 _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 2167 _ FF. 75, 0C
        push    edx                                     ; 216A _ 52
        push    dword [ebp-10H]                         ; 216B _ FF. 75, F0
        call    sheet_setbuf                            ; 216E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2173 _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 2176 _ 8B. 45, F4
        mov     eax, dword [eax+0B0H]                   ; 2179 _ 8B. 80, 000000B0
        mov     edx, dword [eax]                        ; 217F _ 8B. 10
        mov     eax, dword [ebp+20H]                    ; 2181 _ 8B. 45, 20
        add     edx, eax                                ; 2184 _ 01. C2
        mov     eax, dword [shtctl]                     ; 2186 _ A1, 00000284(d)
        push    0                                       ; 218B _ 6A, 00
        push    edx                                     ; 218D _ 52
        push    dword [ebp-10H]                         ; 218E _ FF. 75, F0
        push    eax                                     ; 2191 _ 50
        call    make_window8                            ; 2192 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2197 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 219A _ A1, 00000284(d)
        mov     eax, dword [eax+0CH]                    ; 219F _ 8B. 40, 0C
        sub     eax, dword [ebp+8H]                     ; 21A2 _ 2B. 45, 08
        mov     edx, eax                                ; 21A5 _ 89. C2
        shr     edx, 31                                 ; 21A7 _ C1. EA, 1F
        add     eax, edx                                ; 21AA _ 01. D0
        sar     eax, 1                                  ; 21AC _ D1. F8
        mov     ecx, eax                                ; 21AE _ 89. C1
        mov     eax, dword [shtctl]                     ; 21B0 _ A1, 00000284(d)
        mov     eax, dword [eax+8H]                     ; 21B5 _ 8B. 40, 08
        sub     eax, dword [ebp+0CH]                    ; 21B8 _ 2B. 45, 0C
        mov     edx, eax                                ; 21BB _ 89. C2
        shr     edx, 31                                 ; 21BD _ C1. EA, 1F
        add     eax, edx                                ; 21C0 _ 01. D0
        sar     eax, 1                                  ; 21C2 _ D1. F8
        mov     edx, eax                                ; 21C4 _ 89. C2
        mov     eax, dword [shtctl]                     ; 21C6 _ A1, 00000284(d)
        push    ecx                                     ; 21CB _ 51
        push    edx                                     ; 21CC _ 52
        push    dword [ebp-10H]                         ; 21CD _ FF. 75, F0
        push    eax                                     ; 21D0 _ 50
        call    sheet_slide                             ; 21D1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 21D6 _ 83. C4, 10
        mov     eax, dword [shtctl]                     ; 21D9 _ A1, 00000284(d)
        mov     edx, dword [eax+10H]                    ; 21DE _ 8B. 50, 10
        mov     eax, dword [shtctl]                     ; 21E1 _ A1, 00000284(d)
        sub     esp, 4                                  ; 21E6 _ 83. EC, 04
        push    edx                                     ; 21E9 _ 52
        push    dword [ebp-10H]                         ; 21EA _ FF. 75, F0
        push    eax                                     ; 21ED _ 50
        call    sheet_updown                            ; 21EE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 21F3 _ 83. C4, 10
        mov     eax, dword [ebp-14H]                    ; 21F6 _ 8B. 45, EC
        lea     edx, [eax+1CH]                          ; 21F9 _ 8D. 50, 1C
        mov     eax, dword [ebp-10H]                    ; 21FC _ 8B. 45, F0
        mov     dword [edx], eax                        ; 21FF _ 89. 02
        jmp     ?_144                                   ; 2201 _ E9, 00000231

?_133:  cmp     dword [ebp+1CH], 6                      ; 2206 _ 83. 7D, 1C, 06
        jnz     ?_134                                   ; 220A _ 75, 70
        mov     eax, dword [ebp+18H]                    ; 220C _ 8B. 45, 18
        mov     dword [ebp-10H], eax                    ; 220F _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 2212 _ 8B. 45, F4
        mov     eax, dword [eax+0B0H]                   ; 2215 _ 8B. 80, 000000B0
        mov     edx, dword [eax+4H]                     ; 221B _ 8B. 50, 04
        mov     eax, dword [ebp+10H]                    ; 221E _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2221 _ 8D. 0C 02
        mov     eax, dword [ebp+24H]                    ; 2224 _ 8B. 45, 24
        movsx   edx, al                                 ; 2227 _ 0F BE. D0
        mov     eax, dword [shtctl]                     ; 222A _ A1, 00000284(d)
        sub     esp, 8                                  ; 222F _ 83. EC, 08
        push    ecx                                     ; 2232 _ 51
        push    edx                                     ; 2233 _ 52
        push    dword [ebp+8H]                          ; 2234 _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 2237 _ FF. 75, 0C
        push    dword [ebp-10H]                         ; 223A _ FF. 75, F0
        push    eax                                     ; 223D _ 50
        call    showString                              ; 223E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2243 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 2246 _ 8B. 45, 08
        lea     ecx, [eax+10H]                          ; 2249 _ 8D. 48, 10
        mov     eax, dword [ebp+20H]                    ; 224C _ 8B. 45, 20
        lea     edx, [eax*8]                            ; 224F _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2256 _ 8B. 45, 0C
        add     edx, eax                                ; 2259 _ 01. C2
        mov     eax, dword [shtctl]                     ; 225B _ A1, 00000284(d)
        sub     esp, 8                                  ; 2260 _ 83. EC, 08
        push    ecx                                     ; 2263 _ 51
        push    edx                                     ; 2264 _ 52
        push    dword [ebp+8H]                          ; 2265 _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 2268 _ FF. 75, 0C
        push    dword [ebp-10H]                         ; 226B _ FF. 75, F0
        push    eax                                     ; 226E _ 50
        call    sheet_refresh                           ; 226F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2274 _ 83. C4, 20
        jmp     ?_144                                   ; 2277 _ E9, 000001BB

?_134:  cmp     dword [ebp+1CH], 7                      ; 227C _ 83. 7D, 1C, 07
        jnz     ?_135                                   ; 2280 _ 75, 60
        mov     eax, dword [ebp+18H]                    ; 2282 _ 8B. 45, 18
        mov     dword [ebp-10H], eax                    ; 2285 _ 89. 45, F0
        mov     ebx, dword [ebp+24H]                    ; 2288 _ 8B. 5D, 24
        mov     eax, dword [ebp+10H]                    ; 228B _ 8B. 45, 10
        movzx   ecx, al                                 ; 228E _ 0F B6. C8
        mov     eax, dword [ebp-10H]                    ; 2291 _ 8B. 45, F0
        mov     edx, dword [eax+4H]                     ; 2294 _ 8B. 50, 04
        mov     eax, dword [ebp-10H]                    ; 2297 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 229A _ 8B. 00
        sub     esp, 4                                  ; 229C _ 83. EC, 04
        push    dword [ebp+8H]                          ; 229F _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 22A2 _ FF. 75, 0C
        push    dword [ebp+20H]                         ; 22A5 _ FF. 75, 20
        push    ebx                                     ; 22A8 _ 53
        push    ecx                                     ; 22A9 _ 51
        push    edx                                     ; 22AA _ 52
        push    eax                                     ; 22AB _ 50
        call    boxfill8                                ; 22AC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 22B1 _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 22B4 _ 8B. 45, 08
        lea     ebx, [eax+1H]                           ; 22B7 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 22BA _ 8B. 45, 0C
        lea     ecx, [eax+1H]                           ; 22BD _ 8D. 48, 01
        mov     edx, dword [ebp+24H]                    ; 22C0 _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 22C3 _ A1, 00000284(d)
        sub     esp, 8                                  ; 22C8 _ 83. EC, 08
        push    ebx                                     ; 22CB _ 53
        push    ecx                                     ; 22CC _ 51
        push    dword [ebp+20H]                         ; 22CD _ FF. 75, 20
        push    edx                                     ; 22D0 _ 52
        push    dword [ebp-10H]                         ; 22D1 _ FF. 75, F0
        push    eax                                     ; 22D4 _ 50
        call    sheet_refresh                           ; 22D5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 22DA _ 83. C4, 20
        jmp     ?_144                                   ; 22DD _ E9, 00000155

?_135:  cmp     dword [ebp+1CH], 11                     ; 22E2 _ 83. 7D, 1C, 0B
        jnz     ?_136                                   ; 22E6 _ 75, 28
        mov     eax, dword [ebp+18H]                    ; 22E8 _ 8B. 45, 18
        mov     dword [ebp-10H], eax                    ; 22EB _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 22EE _ 8B. 45, F0
        mov     edx, dword [eax]                        ; 22F1 _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 22F3 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 22F6 _ 8B. 40, 04
        imul    eax, dword [ebp+8H]                     ; 22F9 _ 0F AF. 45, 08
        mov     ecx, eax                                ; 22FD _ 89. C1
        mov     eax, dword [ebp+0CH]                    ; 22FF _ 8B. 45, 0C
        add     eax, ecx                                ; 2302 _ 01. C8
        add     eax, edx                                ; 2304 _ 01. D0
        mov     edx, dword [ebp+24H]                    ; 2306 _ 8B. 55, 24
        mov     byte [eax], dl                          ; 2309 _ 88. 10
        jmp     ?_144                                   ; 230B _ E9, 00000127

?_136:  cmp     dword [ebp+1CH], 12                     ; 2310 _ 83. 7D, 1C, 0C
        jnz     ?_137                                   ; 2314 _ 75, 2C
        mov     eax, dword [ebp+18H]                    ; 2316 _ 8B. 45, 18
        mov     dword [ebp-10H], eax                    ; 2319 _ 89. 45, F0
        mov     edx, dword [ebp+24H]                    ; 231C _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 231F _ A1, 00000284(d)
        sub     esp, 8                                  ; 2324 _ 83. EC, 08
        push    dword [ebp+8H]                          ; 2327 _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 232A _ FF. 75, 0C
        push    dword [ebp+20H]                         ; 232D _ FF. 75, 20
        push    edx                                     ; 2330 _ 52
        push    dword [ebp-10H]                         ; 2331 _ FF. 75, F0
        push    eax                                     ; 2334 _ 50
        call    sheet_refresh                           ; 2335 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 233A _ 83. C4, 20
        jmp     ?_144                                   ; 233D _ E9, 000000F5

?_137:  cmp     dword [ebp+1CH], 13                     ; 2342 _ 83. 7D, 1C, 0D
        jnz     ?_138                                   ; 2346 _ 75, 29
        mov     eax, dword [ebp+18H]                    ; 2348 _ 8B. 45, 18
        mov     dword [ebp-10H], eax                    ; 234B _ 89. 45, F0
        mov     eax, dword [ebp+24H]                    ; 234E _ 8B. 45, 24
        sub     esp, 8                                  ; 2351 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 2354 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 2357 _ FF. 75, 08
        push    dword [ebp+0CH]                         ; 235A _ FF. 75, 0C
        push    dword [ebp+20H]                         ; 235D _ FF. 75, 20
        push    eax                                     ; 2360 _ 50
        push    dword [ebp-10H]                         ; 2361 _ FF. 75, F0
        call    api_linewin                             ; 2364 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2369 _ 83. C4, 20
        jmp     ?_144                                   ; 236C _ E9, 000000C6

?_138:  cmp     dword [ebp+1CH], 14                     ; 2371 _ 83. 7D, 1C, 0E
        jnz     ?_139                                   ; 2375 _ 75, 37
        mov     edx, dword [ebp+18H]                    ; 2377 _ 8B. 55, 18
        mov     eax, dword [shtctl]                     ; 237A _ A1, 00000284(d)
        sub     esp, 8                                  ; 237F _ 83. EC, 08
        push    edx                                     ; 2382 _ 52
        push    eax                                     ; 2383 _ 50
        call    sheet_free                              ; 2384 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2389 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 238C _ 8B. 45, F4
        mov     eax, dword [eax+0B0H]                   ; 238F _ 8B. 80, 000000B0
        mov     eax, dword [eax+4H]                     ; 2395 _ 8B. 40, 04
        add     eax, 291                                ; 2398 _ 05, 00000123
        sub     esp, 12                                 ; 239D _ 83. EC, 0C
        push    eax                                     ; 23A0 _ 50
        call    cons_putstr                             ; 23A1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 23A6 _ 83. C4, 10
        jmp     ?_144                                   ; 23A9 _ E9, 00000089

?_139:  cmp     dword [ebp+1CH], 15                     ; 23AE _ 83. 7D, 1C, 0F
        jnz     ?_140                                   ; 23B2 _ 75, 17
        mov     eax, dword [ebp+24H]                    ; 23B4 _ 8B. 45, 24
        sub     esp, 4                                  ; 23B7 _ 83. EC, 04
        push    dword [ebp-14H]                         ; 23BA _ FF. 75, EC
        push    eax                                     ; 23BD _ 50
        push    dword [ebp-0CH]                         ; 23BE _ FF. 75, F4
        call    handle_keyboard                         ; 23C1 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 23C6 _ 83. C4, 10
        jmp     ?_144                                   ; 23C9 _ EB, 6C

?_140:  cmp     dword [ebp+1CH], 16                     ; 23CB _ 83. 7D, 1C, 10
        jnz     ?_141                                   ; 23CF _ 75, 0F
        mov     eax, dword [ebp-14H]                    ; 23D1 _ 8B. 45, EC
        lea     ebx, [eax+1CH]                          ; 23D4 _ 8D. 58, 1C
        call    timer_alloc                             ; 23D7 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 23DC _ 89. 03
        jmp     ?_144                                   ; 23DE _ EB, 57

?_141:  cmp     dword [ebp+1CH], 17                     ; 23E0 _ 83. 7D, 1C, 11
        jnz     ?_142                                   ; 23E4 _ 75, 1F
        mov     eax, dword [ebp+24H]                    ; 23E6 _ 8B. 45, 24
        movzx   edx, al                                 ; 23E9 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 23EC _ 8B. 45, F4
        lea     ecx, [eax+10H]                          ; 23EF _ 8D. 48, 10
        mov     eax, dword [ebp+18H]                    ; 23F2 _ 8B. 45, 18
        sub     esp, 4                                  ; 23F5 _ 83. EC, 04
        push    edx                                     ; 23F8 _ 52
        push    ecx                                     ; 23F9 _ 51
        push    eax                                     ; 23FA _ 50
        call    timer_init                              ; 23FB _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2400 _ 83. C4, 10
        jmp     ?_144                                   ; 2403 _ EB, 32

?_142:  cmp     dword [ebp+1CH], 18                     ; 2405 _ 83. 7D, 1C, 12
        jnz     ?_143                                   ; 2409 _ 75, 17
        mov     eax, dword [ebp+24H]                    ; 240B _ 8B. 45, 24
        mov     edx, eax                                ; 240E _ 89. C2
        mov     eax, dword [ebp+18H]                    ; 2410 _ 8B. 45, 18
        sub     esp, 8                                  ; 2413 _ 83. EC, 08
        push    edx                                     ; 2416 _ 52
        push    eax                                     ; 2417 _ 50
        call    timer_settime                           ; 2418 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 241D _ 83. C4, 10
        jmp     ?_144                                   ; 2420 _ EB, 15

?_143:  cmp     dword [ebp+1CH], 19                     ; 2422 _ 83. 7D, 1C, 13
        jnz     ?_144                                   ; 2426 _ 75, 0F
        mov     eax, dword [ebp+18H]                    ; 2428 _ 8B. 45, 18
        sub     esp, 12                                 ; 242B _ 83. EC, 0C
        push    eax                                     ; 242E _ 50
        call    timer_free                              ; 242F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2434 _ 83. C4, 10
?_144:  mov     eax, 0                                  ; 2437 _ B8, 00000000
?_145:  mov     ebx, dword [ebp-4H]                     ; 243C _ 8B. 5D, FC
        leave                                           ; 243F _ C9
        ret                                             ; 2440 _ C3
; kernel_api End of function

cons_putchar:; Function begin
        push    ebp                                     ; 2441 _ 55
        mov     ebp, esp                                ; 2442 _ 89. E5
        push    esi                                     ; 2444 _ 56
        push    ebx                                     ; 2445 _ 53
        sub     esp, 32                                 ; 2446 _ 83. EC, 20
        mov     edx, dword [ebp+8H]                     ; 2449 _ 8B. 55, 08
        mov     eax, dword [ebp+0CH]                    ; 244C _ 8B. 45, 0C
        mov     byte [ebp-1CH], dl                      ; 244F _ 88. 55, E4
        mov     byte [ebp-20H], al                      ; 2452 _ 88. 45, E0
        call    task_now                                ; 2455 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 245A _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 245D _ 8B. 45, F4
        mov     ebx, dword [eax+9CH]                    ; 2460 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 2466 _ 8B. 45, F4
        mov     ecx, dword [eax+98H]                    ; 2469 _ 8B. 88, 00000098
        mov     eax, dword [ebp-0CH]                    ; 246F _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 2472 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 2478 _ A1, 00000284(d)
        sub     esp, 12                                 ; 247D _ 83. EC, 0C
        push    0                                       ; 2480 _ 6A, 00
        push    ebx                                     ; 2482 _ 53
        push    ecx                                     ; 2483 _ 51
        push    edx                                     ; 2484 _ 52
        push    eax                                     ; 2485 _ 50
        call    set_cursor                              ; 2486 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 248B _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 248E _ 8B. 45, F4
        movzx   edx, byte [ebp-1CH]                     ; 2491 _ 0F B6. 55, E4
        mov     byte [eax+0A4H], dl                     ; 2495 _ 88. 90, 000000A4
        mov     eax, dword [ebp-0CH]                    ; 249B _ 8B. 45, F4
        mov     byte [eax+0A5H], 0                      ; 249E _ C6. 80, 000000A5, 00
        mov     eax, dword [ebp-0CH]                    ; 24A5 _ 8B. 45, F4
        lea     esi, [eax+0A4H]                         ; 24A8 _ 8D. B0, 000000A4
        mov     eax, dword [ebp-0CH]                    ; 24AE _ 8B. 45, F4
        mov     ebx, dword [eax+9CH]                    ; 24B1 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 24B7 _ 8B. 45, F4
        mov     ecx, dword [eax+98H]                    ; 24BA _ 8B. 88, 00000098
        mov     eax, dword [ebp-0CH]                    ; 24C0 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 24C3 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 24C9 _ A1, 00000284(d)
        sub     esp, 8                                  ; 24CE _ 83. EC, 08
        push    esi                                     ; 24D1 _ 56
        push    7                                       ; 24D2 _ 6A, 07
        push    ebx                                     ; 24D4 _ 53
        push    ecx                                     ; 24D5 _ 51
        push    edx                                     ; 24D6 _ 52
        push    eax                                     ; 24D7 _ 50
        call    showString                              ; 24D8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 24DD _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 24E0 _ 8B. 45, F4
        mov     eax, dword [eax+98H]                    ; 24E3 _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 24E9 _ 8D. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 24EC _ 8B. 45, F4
        mov     dword [eax+98H], edx                    ; 24EF _ 89. 90, 00000098
        lea     esp, [ebp-8H]                           ; 24F5 _ 8D. 65, F8
        pop     ebx                                     ; 24F8 _ 5B
        pop     esi                                     ; 24F9 _ 5E
        pop     ebp                                     ; 24FA _ 5D
        ret                                             ; 24FB _ C3
; cons_putchar End of function

cons_newline:; Function begin
        push    ebp                                     ; 24FC _ 55
        mov     ebp, esp                                ; 24FD _ 89. E5
        push    ebx                                     ; 24FF _ 53
        sub     esp, 20                                 ; 2500 _ 83. EC, 14
        cmp     dword [ebp+0CH], 0                      ; 2503 _ 83. 7D, 0C, 00
        jnz     ?_146                                   ; 2507 _ 75, 06
        nop                                             ; 2509 _ 90
        jmp     ?_157                                   ; 250A _ E9, 00000102

?_146:  cmp     dword [ebp+8H], 139                     ; 250F _ 81. 7D, 08, 0000008B
        jg      ?_147                                   ; 2516 _ 7F, 09
        add     dword [ebp+8H], 16                      ; 2518 _ 83. 45, 08, 10
        jmp     ?_156                                   ; 251C _ E9, 000000CD

?_147:  mov     dword [ebp-10H], 28                     ; 2521 _ C7. 45, F0, 0000001C
        jmp     ?_151                                   ; 2528 _ EB, 52

?_148:  mov     dword [ebp-0CH], 8                      ; 252A _ C7. 45, F4, 00000008
        jmp     ?_150                                   ; 2531 _ EB, 3C

?_149:  mov     eax, dword [ebp+0CH]                    ; 2533 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2536 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2538 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 253B _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 253E _ 0F AF. 45, F0
        mov     ecx, eax                                ; 2542 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2544 _ 8B. 45, F4
        add     eax, ecx                                ; 2547 _ 01. C8
        add     edx, eax                                ; 2549 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 254B _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 254E _ 8B. 08
        mov     eax, dword [ebp-10H]                    ; 2550 _ 8B. 45, F0
        lea     ebx, [eax+10H]                          ; 2553 _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 2556 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2559 _ 8B. 40, 04
        imul    ebx, eax                                ; 255C _ 0F AF. D8
        mov     eax, dword [ebp-0CH]                    ; 255F _ 8B. 45, F4
        add     eax, ebx                                ; 2562 _ 01. D8
        add     eax, ecx                                ; 2564 _ 01. C8
        movzx   eax, byte [eax]                         ; 2566 _ 0F B6. 00
        mov     byte [edx], al                          ; 2569 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 256B _ 83. 45, F4, 01
?_150:  cmp     dword [ebp-0CH], 247                    ; 256F _ 81. 7D, F4, 000000F7
        jle     ?_149                                   ; 2576 _ 7E, BB
        add     dword [ebp-10H], 1                      ; 2578 _ 83. 45, F0, 01
?_151:  cmp     dword [ebp-10H], 139                    ; 257C _ 81. 7D, F0, 0000008B
        jle     ?_148                                   ; 2583 _ 7E, A5
        mov     dword [ebp-10H], 140                    ; 2585 _ C7. 45, F0, 0000008C
        jmp     ?_155                                   ; 258C _ EB, 35

?_152:  mov     dword [ebp-0CH], 8                      ; 258E _ C7. 45, F4, 00000008
        jmp     ?_154                                   ; 2595 _ EB, 1F

?_153:  mov     eax, dword [ebp+0CH]                    ; 2597 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 259A _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 259C _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 259F _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 25A2 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 25A6 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 25A8 _ 8B. 45, F4
        add     eax, ecx                                ; 25AB _ 01. C8
        add     eax, edx                                ; 25AD _ 01. D0
        mov     byte [eax], 0                           ; 25AF _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 25B2 _ 83. 45, F4, 01
?_154:  cmp     dword [ebp-0CH], 247                    ; 25B6 _ 81. 7D, F4, 000000F7
        jle     ?_153                                   ; 25BD _ 7E, D8
        add     dword [ebp-10H], 1                      ; 25BF _ 83. 45, F0, 01
?_155:  cmp     dword [ebp-10H], 155                    ; 25C3 _ 81. 7D, F0, 0000009B
        jle     ?_152                                   ; 25CA _ 7E, C2
        mov     eax, dword [shtctl]                     ; 25CC _ A1, 00000284(d)
        sub     esp, 8                                  ; 25D1 _ 83. EC, 08
        push    156                                     ; 25D4 _ 68, 0000009C
        push    248                                     ; 25D9 _ 68, 000000F8
        push    28                                      ; 25DE _ 6A, 1C
        push    8                                       ; 25E0 _ 6A, 08
        push    dword [ebp+0CH]                         ; 25E2 _ FF. 75, 0C
        push    eax                                     ; 25E5 _ 50
        call    sheet_refresh                           ; 25E6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 25EB _ 83. C4, 20
?_156:  mov     eax, dword [shtctl]                     ; 25EE _ A1, 00000284(d)
        sub     esp, 8                                  ; 25F3 _ 83. EC, 08
        push    ?_401                                   ; 25F6 _ 68, 00000023(d)
        push    7                                       ; 25FB _ 6A, 07
        push    dword [ebp+8H]                          ; 25FD _ FF. 75, 08
        push    8                                       ; 2600 _ 6A, 08
        push    dword [ebp+0CH]                         ; 2602 _ FF. 75, 0C
        push    eax                                     ; 2605 _ 50
        call    showString                              ; 2606 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 260B _ 83. C4, 20
        mov     eax, dword [ebp+8H]                     ; 260E _ 8B. 45, 08
?_157:  mov     ebx, dword [ebp-4H]                     ; 2611 _ 8B. 5D, FC
        leave                                           ; 2614 _ C9
        ret                                             ; 2615 _ C3
; cons_newline End of function

init_screen8:; Function begin
        push    ebp                                     ; 2616 _ 55
        mov     ebp, esp                                ; 2617 _ 89. E5
        push    ebx                                     ; 2619 _ 53
        sub     esp, 4                                  ; 261A _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 261D _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 2620 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 2623 _ 8B. 45, 0C
        sub     eax, 1                                  ; 2626 _ 83. E8, 01
        sub     esp, 4                                  ; 2629 _ 83. EC, 04
        push    edx                                     ; 262C _ 52
        push    eax                                     ; 262D _ 50
        push    0                                       ; 262E _ 6A, 00
        push    0                                       ; 2630 _ 6A, 00
        push    14                                      ; 2632 _ 6A, 0E
        push    dword [ebp+0CH]                         ; 2634 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2637 _ FF. 75, 08
        call    boxfill8                                ; 263A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 263F _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2642 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 2645 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 2648 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 264B _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 264E _ 8B. 45, 10
        sub     eax, 28                                 ; 2651 _ 83. E8, 1C
        sub     esp, 4                                  ; 2654 _ 83. EC, 04
        push    ecx                                     ; 2657 _ 51
        push    edx                                     ; 2658 _ 52
        push    eax                                     ; 2659 _ 50
        push    0                                       ; 265A _ 6A, 00
        push    8                                       ; 265C _ 6A, 08
        push    dword [ebp+0CH]                         ; 265E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2661 _ FF. 75, 08
        call    boxfill8                                ; 2664 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2669 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 266C _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 266F _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 2672 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2675 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 2678 _ 8B. 45, 10
        sub     eax, 27                                 ; 267B _ 83. E8, 1B
        sub     esp, 4                                  ; 267E _ 83. EC, 04
        push    ecx                                     ; 2681 _ 51
        push    edx                                     ; 2682 _ 52
        push    eax                                     ; 2683 _ 50
        push    0                                       ; 2684 _ 6A, 00
        push    7                                       ; 2686 _ 6A, 07
        push    dword [ebp+0CH]                         ; 2688 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 268B _ FF. 75, 08
        call    boxfill8                                ; 268E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2693 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2696 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 2699 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 269C _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 269F _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 26A2 _ 8B. 45, 10
        sub     eax, 26                                 ; 26A5 _ 83. E8, 1A
        sub     esp, 4                                  ; 26A8 _ 83. EC, 04
        push    ecx                                     ; 26AB _ 51
        push    edx                                     ; 26AC _ 52
        push    eax                                     ; 26AD _ 50
        push    0                                       ; 26AE _ 6A, 00
        push    8                                       ; 26B0 _ 6A, 08
        push    dword [ebp+0CH]                         ; 26B2 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 26B5 _ FF. 75, 08
        call    boxfill8                                ; 26B8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 26BD _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 26C0 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 26C3 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 26C6 _ 8B. 45, 10
        sub     eax, 24                                 ; 26C9 _ 83. E8, 18
        sub     esp, 4                                  ; 26CC _ 83. EC, 04
        push    edx                                     ; 26CF _ 52
        push    59                                      ; 26D0 _ 6A, 3B
        push    eax                                     ; 26D2 _ 50
        push    3                                       ; 26D3 _ 6A, 03
        push    7                                       ; 26D5 _ 6A, 07
        push    dword [ebp+0CH]                         ; 26D7 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 26DA _ FF. 75, 08
        call    boxfill8                                ; 26DD _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 26E2 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 26E5 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 26E8 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 26EB _ 8B. 45, 10
        sub     eax, 24                                 ; 26EE _ 83. E8, 18
        sub     esp, 4                                  ; 26F1 _ 83. EC, 04
        push    edx                                     ; 26F4 _ 52
        push    2                                       ; 26F5 _ 6A, 02
        push    eax                                     ; 26F7 _ 50
        push    2                                       ; 26F8 _ 6A, 02
        push    7                                       ; 26FA _ 6A, 07
        push    dword [ebp+0CH]                         ; 26FC _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 26FF _ FF. 75, 08
        call    boxfill8                                ; 2702 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2707 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 270A _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 270D _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2710 _ 8B. 45, 10
        sub     eax, 4                                  ; 2713 _ 83. E8, 04
        sub     esp, 4                                  ; 2716 _ 83. EC, 04
        push    edx                                     ; 2719 _ 52
        push    59                                      ; 271A _ 6A, 3B
        push    eax                                     ; 271C _ 50
        push    3                                       ; 271D _ 6A, 03
        push    15                                      ; 271F _ 6A, 0F
        push    dword [ebp+0CH]                         ; 2721 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2724 _ FF. 75, 08
        call    boxfill8                                ; 2727 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 272C _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 272F _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 2732 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 2735 _ 8B. 45, 10
        sub     eax, 23                                 ; 2738 _ 83. E8, 17
        sub     esp, 4                                  ; 273B _ 83. EC, 04
        push    edx                                     ; 273E _ 52
        push    59                                      ; 273F _ 6A, 3B
        push    eax                                     ; 2741 _ 50
        push    59                                      ; 2742 _ 6A, 3B
        push    15                                      ; 2744 _ 6A, 0F
        push    dword [ebp+0CH]                         ; 2746 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2749 _ FF. 75, 08
        call    boxfill8                                ; 274C _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2751 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2754 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2757 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 275A _ 8B. 45, 10
        sub     eax, 3                                  ; 275D _ 83. E8, 03
        sub     esp, 4                                  ; 2760 _ 83. EC, 04
        push    edx                                     ; 2763 _ 52
        push    59                                      ; 2764 _ 6A, 3B
        push    eax                                     ; 2766 _ 50
        push    2                                       ; 2767 _ 6A, 02
        push    0                                       ; 2769 _ 6A, 00
        push    dword [ebp+0CH]                         ; 276B _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 276E _ FF. 75, 08
        call    boxfill8                                ; 2771 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2776 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 2779 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 277C _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 277F _ 8B. 45, 10
        sub     eax, 24                                 ; 2782 _ 83. E8, 18
        sub     esp, 4                                  ; 2785 _ 83. EC, 04
        push    edx                                     ; 2788 _ 52
        push    60                                      ; 2789 _ 6A, 3C
        push    eax                                     ; 278B _ 50
        push    60                                      ; 278C _ 6A, 3C
        push    0                                       ; 278E _ 6A, 00
        push    dword [ebp+0CH]                         ; 2790 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2793 _ FF. 75, 08
        call    boxfill8                                ; 2796 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 279B _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 279E _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 27A1 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 27A4 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 27A7 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 27AA _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 27AD _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 27B0 _ 8B. 45, 0C
        sub     eax, 47                                 ; 27B3 _ 83. E8, 2F
        sub     esp, 4                                  ; 27B6 _ 83. EC, 04
        push    ebx                                     ; 27B9 _ 53
        push    ecx                                     ; 27BA _ 51
        push    edx                                     ; 27BB _ 52
        push    eax                                     ; 27BC _ 50
        push    15                                      ; 27BD _ 6A, 0F
        push    dword [ebp+0CH]                         ; 27BF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 27C2 _ FF. 75, 08
        call    boxfill8                                ; 27C5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 27CA _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 27CD _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 27D0 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 27D3 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 27D6 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 27D9 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 27DC _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 27DF _ 8B. 45, 0C
        sub     eax, 47                                 ; 27E2 _ 83. E8, 2F
        sub     esp, 4                                  ; 27E5 _ 83. EC, 04
        push    ebx                                     ; 27E8 _ 53
        push    ecx                                     ; 27E9 _ 51
        push    edx                                     ; 27EA _ 52
        push    eax                                     ; 27EB _ 50
        push    15                                      ; 27EC _ 6A, 0F
        push    dword [ebp+0CH]                         ; 27EE _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 27F1 _ FF. 75, 08
        call    boxfill8                                ; 27F4 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 27F9 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 27FC _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 27FF _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 2802 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 2805 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 2808 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 280B _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 280E _ 8B. 45, 0C
        sub     eax, 47                                 ; 2811 _ 83. E8, 2F
        sub     esp, 4                                  ; 2814 _ 83. EC, 04
        push    ebx                                     ; 2817 _ 53
        push    ecx                                     ; 2818 _ 51
        push    edx                                     ; 2819 _ 52
        push    eax                                     ; 281A _ 50
        push    7                                       ; 281B _ 6A, 07
        push    dword [ebp+0CH]                         ; 281D _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2820 _ FF. 75, 08
        call    boxfill8                                ; 2823 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2828 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 282B _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 282E _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 2831 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 2834 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 2837 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 283A _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 283D _ 8B. 45, 0C
        sub     eax, 3                                  ; 2840 _ 83. E8, 03
        sub     esp, 4                                  ; 2843 _ 83. EC, 04
        push    ebx                                     ; 2846 _ 53
        push    ecx                                     ; 2847 _ 51
        push    edx                                     ; 2848 _ 52
        push    eax                                     ; 2849 _ 50
        push    7                                       ; 284A _ 6A, 07
        push    dword [ebp+0CH]                         ; 284C _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 284F _ FF. 75, 08
        call    boxfill8                                ; 2852 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2857 _ 83. C4, 20
        mov     ebx, dword [ebp-4H]                     ; 285A _ 8B. 5D, FC
        leave                                           ; 285D _ C9
        ret                                             ; 285E _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 285F _ 55
        mov     ebp, esp                                ; 2860 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 2862 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 2865 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 2868 _ A1, 00000134(d)
        add     eax, edx                                ; 286D _ 01. D0
        mov     dword [mx], eax                         ; 286F _ A3, 00000134(d)
        mov     eax, dword [ebp+10H]                    ; 2874 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 2877 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 287A _ A1, 00000138(d)
        add     eax, edx                                ; 287F _ 01. D0
        mov     dword [my], eax                         ; 2881 _ A3, 00000138(d)
        mov     eax, dword [mx]                         ; 2886 _ A1, 00000134(d)
        test    eax, eax                                ; 288B _ 85. C0
        jns     ?_158                                   ; 288D _ 79, 0A
        mov     dword [mx], 0                           ; 288F _ C7. 05, 00000134(d), 00000000
?_158:  mov     eax, dword [my]                         ; 2899 _ A1, 00000138(d)
        test    eax, eax                                ; 289E _ 85. C0
        jns     ?_159                                   ; 28A0 _ 79, 0A
        mov     dword [my], 0                           ; 28A2 _ C7. 05, 00000138(d), 00000000
?_159:  mov     eax, dword [xsize]                      ; 28AC _ A1, 0000013C(d)
        lea     edx, [eax-1H]                           ; 28B1 _ 8D. 50, FF
        mov     eax, dword [mx]                         ; 28B4 _ A1, 00000134(d)
        cmp     edx, eax                                ; 28B9 _ 39. C2
        jge     ?_160                                   ; 28BB _ 7D, 0D
        mov     eax, dword [xsize]                      ; 28BD _ A1, 0000013C(d)
        sub     eax, 1                                  ; 28C2 _ 83. E8, 01
        mov     dword [mx], eax                         ; 28C5 _ A3, 00000134(d)
?_160:  mov     eax, dword [ysize]                      ; 28CA _ A1, 00000140(d)
        lea     edx, [eax-1H]                           ; 28CF _ 8D. 50, FF
        mov     eax, dword [my]                         ; 28D2 _ A1, 00000138(d)
        cmp     edx, eax                                ; 28D7 _ 39. C2
        jge     ?_161                                   ; 28D9 _ 7D, 0D
        mov     eax, dword [ysize]                      ; 28DB _ A1, 00000140(d)
        sub     eax, 1                                  ; 28E0 _ 83. E8, 01
        mov     dword [my], eax                         ; 28E3 _ A3, 00000138(d)
?_161:  pop     ebp                                     ; 28E8 _ 5D
        ret                                             ; 28E9 _ C3
; computeMousePosition End of function

showString:; Function begin
        push    ebp                                     ; 28EA _ 55
        mov     ebp, esp                                ; 28EB _ 89. E5
        push    ebx                                     ; 28ED _ 53
        sub     esp, 36                                 ; 28EE _ 83. EC, 24
        mov     eax, dword [ebp+18H]                    ; 28F1 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 28F4 _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 28F7 _ 83. 7D, 08, 00
        jz      ?_162                                   ; 28FB _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 28FD _ 83. 7D, 0C, 00
        jnz     ?_163                                   ; 2901 _ 75, 02
?_162:  jmp     ?_166                                   ; 2903 _ EB, 78

?_163:  mov     eax, dword [ebp+10H]                    ; 2905 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 2908 _ 89. 45, F4
        mov     dword [ebp-10H], 0                      ; 290B _ C7. 45, F0, 00000000
        jmp     ?_165                                   ; 2912 _ EB, 3E

?_164:  mov     eax, dword [ebp+1CH]                    ; 2914 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 2917 _ 0F B6. 00
        movzx   eax, al                                 ; 291A _ 0F B6. C0
        shl     eax, 4                                  ; 291D _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 2920 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 2926 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 292A _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 292D _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2930 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2933 _ 8B. 00
        sub     esp, 8                                  ; 2935 _ 83. EC, 08
        push    ebx                                     ; 2938 _ 53
        push    ecx                                     ; 2939 _ 51
        push    dword [ebp+14H]                         ; 293A _ FF. 75, 14
        push    dword [ebp+10H]                         ; 293D _ FF. 75, 10
        push    edx                                     ; 2940 _ 52
        push    eax                                     ; 2941 _ 50
        call    showFont8                               ; 2942 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2947 _ 83. C4, 20
        add     dword [ebp+10H], 8                      ; 294A _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 294E _ 83. 45, 1C, 01
?_165:  mov     eax, dword [ebp+1CH]                    ; 2952 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 2955 _ 0F B6. 00
        test    al, al                                  ; 2958 _ 84. C0
        jnz     ?_164                                   ; 295A _ 75, B8
        mov     eax, dword [ebp+14H]                    ; 295C _ 8B. 45, 14
        add     eax, 16                                 ; 295F _ 83. C0, 10
        sub     esp, 8                                  ; 2962 _ 83. EC, 08
        push    eax                                     ; 2965 _ 50
        push    dword [ebp+10H]                         ; 2966 _ FF. 75, 10
        push    dword [ebp+14H]                         ; 2969 _ FF. 75, 14
        push    dword [ebp-0CH]                         ; 296C _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 296F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2972 _ FF. 75, 08
        call    sheet_refresh                           ; 2975 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 297A _ 83. C4, 20
?_166:  mov     ebx, dword [ebp-4H]                     ; 297D _ 8B. 5D, FC
        leave                                           ; 2980 _ C9
        ret                                             ; 2981 _ C3
; showString End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 2982 _ 55
        mov     ebp, esp                                ; 2983 _ 89. E5
        sub     esp, 40                                 ; 2985 _ 83. EC, 28
        mov     eax, dword [buf_back]                   ; 2988 _ A1, 00000144(d)
        mov     dword [ebp-10H], eax                    ; 298D _ 89. 45, F0
        mov     byte [ebp-11H], 0                       ; 2990 _ C6. 45, EF, 00
        mov     dword [ebp-18H], 0                      ; 2994 _ C7. 45, E8, 00000000
        call    io_sti                                  ; 299B _ E8, FFFFFFFC(rel)
        sub     esp, 12                                 ; 29A0 _ 83. EC, 0C
        push    mouseinfo                               ; 29A3 _ 68, 0000003C(d)
        call    fifo8_get                               ; 29A8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 29AD _ 83. C4, 10
        mov     byte [ebp-11H], al                      ; 29B0 _ 88. 45, EF
        movzx   eax, byte [ebp-11H]                     ; 29B3 _ 0F B6. 45, EF
        sub     esp, 8                                  ; 29B7 _ 83. EC, 08
        push    eax                                     ; 29BA _ 50
        push    mdec                                    ; 29BB _ 68, 00000100(d)
        call    mouse_decode                            ; 29C0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 29C5 _ 83. C4, 10
        test    eax, eax                                ; 29C8 _ 85. C0
        je      ?_178                                   ; 29CA _ 0F 84, 00000317
        sub     esp, 4                                  ; 29D0 _ 83. EC, 04
        push    mdec                                    ; 29D3 _ 68, 00000100(d)
        push    dword [ebp+0CH]                         ; 29D8 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 29DB _ FF. 75, 08
        call    computeMousePosition                    ; 29DE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 29E3 _ 83. C4, 10
        mov     edx, dword [my]                         ; 29E6 _ 8B. 15, 00000138(d)
        mov     eax, dword [mx]                         ; 29EC _ A1, 00000134(d)
        push    edx                                     ; 29F1 _ 52
        push    eax                                     ; 29F2 _ 50
        push    dword [ebp+10H]                         ; 29F3 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 29F6 _ FF. 75, 08
        call    sheet_slide                             ; 29F9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 29FE _ 83. C4, 10
        mov     eax, dword [?_428]                      ; 2A01 _ A1, 0000010C(d)
        and     eax, 01H                                ; 2A06 _ 83. E0, 01
        test    eax, eax                                ; 2A09 _ 85. C0
        je      ?_177                                   ; 2A0B _ 0F 84, 000002CC
        mov     eax, dword [mmx]                        ; 2A11 _ A1, 00000158(d)
        test    eax, eax                                ; 2A16 _ 85. C0
        jns     ?_176                                   ; 2A18 _ 0F 89, 00000257
        mov     eax, dword [ebp+8H]                     ; 2A1E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2A21 _ 8B. 40, 10
        sub     eax, 1                                  ; 2A24 _ 83. E8, 01
        mov     dword [ebp-0CH], eax                    ; 2A27 _ 89. 45, F4
        jmp     ?_174                                   ; 2A2A _ E9, 00000238

?_167:  mov     eax, dword [ebp+8H]                     ; 2A2F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2A32 _ 8B. 55, F4
        add     edx, 4                                  ; 2A35 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2A38 _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 2A3C _ 89. 45, E8
        mov     edx, dword [mx]                         ; 2A3F _ 8B. 15, 00000134(d)
        mov     eax, dword [ebp-18H]                    ; 2A45 _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 2A48 _ 8B. 40, 0C
        sub     edx, eax                                ; 2A4B _ 29. C2
        mov     eax, edx                                ; 2A4D _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2A4F _ 89. 45, E4
        mov     edx, dword [my]                         ; 2A52 _ 8B. 15, 00000138(d)
        mov     eax, dword [ebp-18H]                    ; 2A58 _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 2A5B _ 8B. 40, 10
        sub     edx, eax                                ; 2A5E _ 29. C2
        mov     eax, edx                                ; 2A60 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 2A62 _ 89. 45, E0
        cmp     dword [ebp-1CH], 0                      ; 2A65 _ 83. 7D, E4, 00
        js      ?_173                                   ; 2A69 _ 0F 88, 000001F4
        mov     eax, dword [ebp-18H]                    ; 2A6F _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2A72 _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 2A75 _ 3B. 45, E4
        jle     ?_173                                   ; 2A78 _ 0F 8E, 000001E5
        cmp     dword [ebp-20H], 0                      ; 2A7E _ 83. 7D, E0, 00
        js      ?_173                                   ; 2A82 _ 0F 88, 000001DB
        mov     eax, dword [ebp-18H]                    ; 2A88 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 2A8B _ 8B. 40, 08
        cmp     eax, dword [ebp-20H]                    ; 2A8E _ 3B. 45, E0
        jle     ?_173                                   ; 2A91 _ 0F 8E, 000001CC
        mov     eax, dword [ebp-18H]                    ; 2A97 _ 8B. 45, E8
        mov     edx, dword [eax]                        ; 2A9A _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 2A9C _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2A9F _ 8B. 40, 04
        imul    eax, dword [ebp-20H]                    ; 2AA2 _ 0F AF. 45, E0
        mov     ecx, eax                                ; 2AA6 _ 89. C1
        mov     eax, dword [ebp-1CH]                    ; 2AA8 _ 8B. 45, E4
        add     eax, ecx                                ; 2AAB _ 01. C8
        add     eax, edx                                ; 2AAD _ 01. D0
        movzx   eax, byte [eax]                         ; 2AAF _ 0F B6. 00
        movzx   edx, al                                 ; 2AB2 _ 0F B6. D0
        mov     eax, dword [ebp-18H]                    ; 2AB5 _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 2AB8 _ 8B. 40, 14
        cmp     edx, eax                                ; 2ABB _ 39. C2
        je      ?_173                                   ; 2ABD _ 0F 84, 000001A0
        mov     eax, dword [current_console_task]       ; 2AC3 _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 2AC8 _ 8B. 80, 000000B4
        test    eax, eax                                ; 2ACE _ 85. C0
        jz      ?_168                                   ; 2AD0 _ 74, 4A
        mov     eax, dword [current_console_task]       ; 2AD2 _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 2AD7 _ 8B. 80, 000000B4
        push    0                                       ; 2ADD _ 6A, 00
        push    ?_397                                   ; 2ADF _ 68, 0000000F(d)
        push    eax                                     ; 2AE4 _ 50
        push    dword [ebp+8H]                          ; 2AE5 _ FF. 75, 08
        call    make_wtitle8                            ; 2AE8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2AED _ 83. C4, 10
        mov     eax, dword [ebp-18H]                    ; 2AF0 _ 8B. 45, E8
        mov     ecx, dword [eax+8H]                     ; 2AF3 _ 8B. 48, 08
        mov     eax, dword [ebp-18H]                    ; 2AF6 _ 8B. 45, E8
        mov     edx, dword [eax+4H]                     ; 2AF9 _ 8B. 50, 04
        mov     eax, dword [current_console_task]       ; 2AFC _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 2B01 _ 8B. 80, 000000B4
        sub     esp, 8                                  ; 2B07 _ 83. EC, 08
        push    ecx                                     ; 2B0A _ 51
        push    edx                                     ; 2B0B _ 52
        push    0                                       ; 2B0C _ 6A, 00
        push    0                                       ; 2B0E _ 6A, 00
        push    eax                                     ; 2B10 _ 50
        push    dword [ebp+8H]                          ; 2B11 _ FF. 75, 08
        call    sheet_refresh                           ; 2B14 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2B19 _ 83. C4, 20
?_168:  mov     eax, dword [ebp-18H]                    ; 2B1C _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 2B1F _ 8B. 40, 20
        mov     dword [current_console_task], eax       ; 2B22 _ A3, 00000298(d)
        mov     eax, dword [current_console_task]       ; 2B27 _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 2B2C _ 8B. 80, 000000B4
        test    eax, eax                                ; 2B32 _ 85. C0
        jnz     ?_169                                   ; 2B34 _ 75, 1C
        sub     esp, 8                                  ; 2B36 _ 83. EC, 08
        push    ?_413                                   ; 2B39 _ 68, 00000066(d)
        push    7                                       ; 2B3E _ 6A, 07
        push    96                                      ; 2B40 _ 6A, 60
        push    0                                       ; 2B42 _ 6A, 00
        push    dword [ebp+0CH]                         ; 2B44 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 2B47 _ FF. 75, 08
        call    showString                              ; 2B4A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2B4F _ 83. C4, 20
?_169:  mov     eax, dword [current_console_task]       ; 2B52 _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 2B57 _ 8B. 80, 000000B4
        test    eax, eax                                ; 2B5D _ 85. C0
        jz      ?_170                                   ; 2B5F _ 74, 41
        mov     eax, dword [current_console_task]       ; 2B61 _ A1, 00000298(d)
        mov     eax, dword [eax+0B4H]                   ; 2B66 _ 8B. 80, 000000B4
        push    1                                       ; 2B6C _ 6A, 01
        push    ?_397                                   ; 2B6E _ 68, 0000000F(d)
        push    eax                                     ; 2B73 _ 50
        push    dword [ebp+8H]                          ; 2B74 _ FF. 75, 08
        call    make_wtitle8                            ; 2B77 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2B7C _ 83. C4, 10
        mov     eax, dword [ebp-18H]                    ; 2B7F _ 8B. 45, E8
        mov     edx, dword [eax+8H]                     ; 2B82 _ 8B. 50, 08
        mov     eax, dword [ebp-18H]                    ; 2B85 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2B88 _ 8B. 40, 04
        sub     esp, 8                                  ; 2B8B _ 83. EC, 08
        push    edx                                     ; 2B8E _ 52
        push    eax                                     ; 2B8F _ 50
        push    0                                       ; 2B90 _ 6A, 00
        push    0                                       ; 2B92 _ 6A, 00
        push    dword [ebp-18H]                         ; 2B94 _ FF. 75, E8
        push    dword [ebp+8H]                          ; 2B97 _ FF. 75, 08
        call    sheet_refresh                           ; 2B9A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2B9F _ 83. C4, 20
?_170:  mov     eax, dword [ebp+8H]                     ; 2BA2 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2BA5 _ 8B. 40, 10
        sub     eax, 1                                  ; 2BA8 _ 83. E8, 01
        sub     esp, 4                                  ; 2BAB _ 83. EC, 04
        push    eax                                     ; 2BAE _ 50
        push    dword [ebp-18H]                         ; 2BAF _ FF. 75, E8
        push    dword [ebp+8H]                          ; 2BB2 _ FF. 75, 08
        call    sheet_updown                            ; 2BB5 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2BBA _ 83. C4, 10
        cmp     dword [ebp-1CH], 2                      ; 2BBD _ 83. 7D, E4, 02
        jle     ?_171                                   ; 2BC1 _ 7E, 36
        mov     eax, dword [ebp-18H]                    ; 2BC3 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2BC6 _ 8B. 40, 04
        sub     eax, 3                                  ; 2BC9 _ 83. E8, 03
        cmp     eax, dword [ebp-1CH]                    ; 2BCC _ 3B. 45, E4
        jle     ?_171                                   ; 2BCF _ 7E, 28
        cmp     dword [ebp-20H], 2                      ; 2BD1 _ 83. 7D, E0, 02
        jle     ?_171                                   ; 2BD5 _ 7E, 22
        cmp     dword [ebp-20H], 20                     ; 2BD7 _ 83. 7D, E0, 14
        jg      ?_171                                   ; 2BDB _ 7F, 1C
        mov     eax, dword [mx]                         ; 2BDD _ A1, 00000134(d)
        mov     dword [mmx], eax                        ; 2BE2 _ A3, 00000158(d)
        mov     eax, dword [my]                         ; 2BE7 _ A1, 00000138(d)
        mov     dword [mmy], eax                        ; 2BEC _ A3, 0000015C(d)
        mov     eax, dword [ebp-18H]                    ; 2BF1 _ 8B. 45, E8
        mov     dword [mouse_clicked_sht], eax          ; 2BF4 _ A3, 00000290(d)
?_171:  mov     eax, dword [ebp-18H]                    ; 2BF9 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2BFC _ 8B. 40, 04
        sub     eax, 21                                 ; 2BFF _ 83. E8, 15
        cmp     eax, dword [ebp-1CH]                    ; 2C02 _ 3B. 45, E4
        jg      ?_172                                   ; 2C05 _ 7F, 5A
        mov     eax, dword [ebp-18H]                    ; 2C07 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2C0A _ 8B. 40, 04
        sub     eax, 5                                  ; 2C0D _ 83. E8, 05
        cmp     eax, dword [ebp-1CH]                    ; 2C10 _ 3B. 45, E4
        jle     ?_172                                   ; 2C13 _ 7E, 4C
        cmp     dword [ebp-20H], 4                      ; 2C15 _ 83. 7D, E0, 04
        jle     ?_172                                   ; 2C19 _ 7E, 46
        cmp     dword [ebp-20H], 18                     ; 2C1B _ 83. 7D, E0, 12
        jg      ?_172                                   ; 2C1F _ 7F, 40
        mov     eax, dword [ebp-18H]                    ; 2C21 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 2C24 _ 8B. 40, 20
        test    eax, eax                                ; 2C27 _ 85. C0
        jz      ?_172                                   ; 2C29 _ 74, 36
        call    io_cli                                  ; 2C2B _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 2C30 _ 83. EC, 08
        push    dword [ebp-18H]                         ; 2C33 _ FF. 75, E8
        push    dword [ebp+8H]                          ; 2C36 _ FF. 75, 08
        call    sheet_free                              ; 2C39 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2C3E _ 83. C4, 10
        call    get_code32_addr                         ; 2C41 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 2C46 _ 89. 45, DC
        mov     eax, dword [ebp-18H]                    ; 2C49 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 2C4C _ 8B. 40, 20
        mov     edx, kill_process                       ; 2C4F _ BA, 00000000(d)
        sub     edx, dword [ebp-24H]                    ; 2C54 _ 2B. 55, DC
        mov     dword [eax+4CH], edx                    ; 2C57 _ 89. 50, 4C
        call    io_sti                                  ; 2C5A _ E8, FFFFFFFC(rel)
        jmp     ?_175                                   ; 2C5F _ EB, 12

?_172:  jmp     ?_175                                   ; 2C61 _ EB, 10

?_173:  sub     dword [ebp-0CH], 1                      ; 2C63 _ 83. 6D, F4, 01
?_174:  cmp     dword [ebp-0CH], 0                      ; 2C67 _ 83. 7D, F4, 00
        jg      ?_167                                   ; 2C6B _ 0F 8F, FFFFFDBE
        jmp     ?_178                                   ; 2C71 _ EB, 74

?_175:  jmp     ?_178                                   ; 2C73 _ EB, 72

?_176:  mov     edx, dword [mx]                         ; 2C75 _ 8B. 15, 00000134(d)
        mov     eax, dword [mmx]                        ; 2C7B _ A1, 00000158(d)
        sub     edx, eax                                ; 2C80 _ 29. C2
        mov     eax, edx                                ; 2C82 _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2C84 _ 89. 45, E4
        mov     edx, dword [my]                         ; 2C87 _ 8B. 15, 00000138(d)
        mov     eax, dword [mmy]                        ; 2C8D _ A1, 0000015C(d)
        sub     edx, eax                                ; 2C92 _ 29. C2
        mov     eax, edx                                ; 2C94 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 2C96 _ 89. 45, E0
        mov     eax, dword [mouse_clicked_sht]          ; 2C99 _ A1, 00000290(d)
        mov     edx, dword [eax+10H]                    ; 2C9E _ 8B. 50, 10
        mov     eax, dword [ebp-20H]                    ; 2CA1 _ 8B. 45, E0
        lea     ecx, [edx+eax]                          ; 2CA4 _ 8D. 0C 02
        mov     eax, dword [mouse_clicked_sht]          ; 2CA7 _ A1, 00000290(d)
        mov     edx, dword [eax+0CH]                    ; 2CAC _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 2CAF _ 8B. 45, E4
        add     edx, eax                                ; 2CB2 _ 01. C2
        mov     eax, dword [mouse_clicked_sht]          ; 2CB4 _ A1, 00000290(d)
        push    ecx                                     ; 2CB9 _ 51
        push    edx                                     ; 2CBA _ 52
        push    eax                                     ; 2CBB _ 50
        push    dword [ebp+8H]                          ; 2CBC _ FF. 75, 08
        call    sheet_slide                             ; 2CBF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2CC4 _ 83. C4, 10
        mov     eax, dword [mx]                         ; 2CC7 _ A1, 00000134(d)
        mov     dword [mmx], eax                        ; 2CCC _ A3, 00000158(d)
        mov     eax, dword [my]                         ; 2CD1 _ A1, 00000138(d)
        mov     dword [mmy], eax                        ; 2CD6 _ A3, 0000015C(d)
        jmp     ?_178                                   ; 2CDB _ EB, 0A

?_177:  mov     dword [mmx], -1                         ; 2CDD _ C7. 05, 00000158(d), FFFFFFFF
?_178:  leave                                           ; 2CE7 _ C9
        ret                                             ; 2CE8 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 2CE9 _ 55
        mov     ebp, esp                                ; 2CEA _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2CEC _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 2CEF _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 2CF5 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 2CF8 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 2CFE _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 2D01 _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 2D07 _ 5D
        ret                                             ; 2D08 _ C3
; initBootInfo End of function

init_palette:; Function begin
        push    ebp                                     ; 2D09 _ 55
        mov     ebp, esp                                ; 2D0A _ 89. E5
        sub     esp, 680                                ; 2D0C _ 81. EC, 000002A8
        sub     esp, 4                                  ; 2D12 _ 83. EC, 04
        push    table_rgb.2131                          ; 2D15 _ 68, 00000180(d)
        push    15                                      ; 2D1A _ 6A, 0F
        push    0                                       ; 2D1C _ 6A, 00
        call    set_palette                             ; 2D1E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2D23 _ 83. C4, 10
        mov     dword [ebp-14H], 0                      ; 2D26 _ C7. 45, EC, 00000000
        jmp     ?_184                                   ; 2D2D _ E9, 000000EF

?_179:  mov     dword [ebp-10H], 0                      ; 2D32 _ C7. 45, F0, 00000000
        jmp     ?_183                                   ; 2D39 _ E9, 000000D5

?_180:  mov     dword [ebp-0CH], 0                      ; 2D3E _ C7. 45, F4, 00000000
        jmp     ?_182                                   ; 2D45 _ E9, 000000BB

?_181:  mov     edx, dword [ebp-10H]                    ; 2D4A _ 8B. 55, F0
        mov     eax, edx                                ; 2D4D _ 89. D0
        add     eax, eax                                ; 2D4F _ 01. C0
        add     eax, edx                                ; 2D51 _ 01. D0
        add     eax, eax                                ; 2D53 _ 01. C0
        mov     edx, eax                                ; 2D55 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2D57 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 2D5A _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 2D5D _ 8B. 55, EC
        mov     eax, edx                                ; 2D60 _ 89. D0
        shl     eax, 3                                  ; 2D62 _ C1. E0, 03
        add     eax, edx                                ; 2D65 _ 01. D0
        shl     eax, 2                                  ; 2D67 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 2D6A _ 8D. 14 01
        mov     eax, edx                                ; 2D6D _ 89. D0
        add     eax, eax                                ; 2D6F _ 01. C0
        add     edx, eax                                ; 2D71 _ 01. C2
        mov     eax, dword [ebp-0CH]                    ; 2D73 _ 8B. 45, F4
        mov     ecx, 51                                 ; 2D76 _ B9, 00000033
        imul    eax, ecx                                ; 2D7B _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 2D7E _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 2D85 _ 8B. 55, F0
        mov     eax, edx                                ; 2D88 _ 89. D0
        add     eax, eax                                ; 2D8A _ 01. C0
        add     eax, edx                                ; 2D8C _ 01. D0
        add     eax, eax                                ; 2D8E _ 01. C0
        mov     edx, eax                                ; 2D90 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2D92 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 2D95 _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 2D98 _ 8B. 55, EC
        mov     eax, edx                                ; 2D9B _ 89. D0
        shl     eax, 3                                  ; 2D9D _ C1. E0, 03
        add     eax, edx                                ; 2DA0 _ 01. D0
        shl     eax, 2                                  ; 2DA2 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 2DA5 _ 8D. 14 01
        mov     eax, edx                                ; 2DA8 _ 89. D0
        add     eax, eax                                ; 2DAA _ 01. C0
        add     eax, edx                                ; 2DAC _ 01. D0
        lea     edx, [eax+1H]                           ; 2DAE _ 8D. 50, 01
        mov     eax, dword [ebp-10H]                    ; 2DB1 _ 8B. 45, F0
        mov     ecx, 51                                 ; 2DB4 _ B9, 00000033
        imul    eax, ecx                                ; 2DB9 _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 2DBC _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 2DC3 _ 8B. 55, F0
        mov     eax, edx                                ; 2DC6 _ 89. D0
        add     eax, eax                                ; 2DC8 _ 01. C0
        add     eax, edx                                ; 2DCA _ 01. D0
        add     eax, eax                                ; 2DCC _ 01. C0
        mov     edx, eax                                ; 2DCE _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2DD0 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 2DD3 _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 2DD6 _ 8B. 55, EC
        mov     eax, edx                                ; 2DD9 _ 89. D0
        shl     eax, 3                                  ; 2DDB _ C1. E0, 03
        add     eax, edx                                ; 2DDE _ 01. D0
        shl     eax, 2                                  ; 2DE0 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 2DE3 _ 8D. 14 01
        mov     eax, edx                                ; 2DE6 _ 89. D0
        add     eax, eax                                ; 2DE8 _ 01. C0
        add     eax, edx                                ; 2DEA _ 01. D0
        lea     edx, [eax+2H]                           ; 2DEC _ 8D. 50, 02
        mov     eax, dword [ebp-14H]                    ; 2DEF _ 8B. 45, EC
        mov     ecx, 51                                 ; 2DF2 _ B9, 00000033
        imul    eax, ecx                                ; 2DF7 _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 2DFA _ 88. 84 15, FFFFFD64
        add     dword [ebp-0CH], 1                      ; 2E01 _ 83. 45, F4, 01
?_182:  cmp     dword [ebp-0CH], 5                      ; 2E05 _ 83. 7D, F4, 05
        jle     ?_181                                   ; 2E09 _ 0F 8E, FFFFFF3B
        add     dword [ebp-10H], 1                      ; 2E0F _ 83. 45, F0, 01
?_183:  cmp     dword [ebp-10H], 5                      ; 2E13 _ 83. 7D, F0, 05
        jle     ?_180                                   ; 2E17 _ 0F 8E, FFFFFF21
        add     dword [ebp-14H], 1                      ; 2E1D _ 83. 45, EC, 01
?_184:  cmp     dword [ebp-14H], 5                      ; 2E21 _ 83. 7D, EC, 05
        jle     ?_179                                   ; 2E25 _ 0F 8E, FFFFFF07
        sub     esp, 4                                  ; 2E2B _ 83. EC, 04
        lea     eax, [ebp-29CH]                         ; 2E2E _ 8D. 85, FFFFFD64
        push    eax                                     ; 2E34 _ 50
        push    231                                     ; 2E35 _ 68, 000000E7
        push    16                                      ; 2E3A _ 6A, 10
        call    set_palette                             ; 2E3C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E41 _ 83. C4, 10
        nop                                             ; 2E44 _ 90
        leave                                           ; 2E45 _ C9
        ret                                             ; 2E46 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 2E47 _ 55
        mov     ebp, esp                                ; 2E48 _ 89. E5
        sub     esp, 24                                 ; 2E4A _ 83. EC, 18
        call    io_load_eflags                          ; 2E4D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2E52 _ 89. 45, F0
        call    io_cli                                  ; 2E55 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 2E5A _ 83. EC, 08
        push    dword [ebp+8H]                          ; 2E5D _ FF. 75, 08
        push    968                                     ; 2E60 _ 68, 000003C8
        call    io_out8                                 ; 2E65 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E6A _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 2E6D _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 2E70 _ 89. 45, F4
        jmp     ?_186                                   ; 2E73 _ EB, 65

?_185:  mov     eax, dword [ebp+10H]                    ; 2E75 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 2E78 _ 0F B6. 00
        shr     al, 2                                   ; 2E7B _ C0. E8, 02
        movzx   eax, al                                 ; 2E7E _ 0F B6. C0
        sub     esp, 8                                  ; 2E81 _ 83. EC, 08
        push    eax                                     ; 2E84 _ 50
        push    969                                     ; 2E85 _ 68, 000003C9
        call    io_out8                                 ; 2E8A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2E8F _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 2E92 _ 8B. 45, 10
        add     eax, 1                                  ; 2E95 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 2E98 _ 0F B6. 00
        shr     al, 2                                   ; 2E9B _ C0. E8, 02
        movzx   eax, al                                 ; 2E9E _ 0F B6. C0
        sub     esp, 8                                  ; 2EA1 _ 83. EC, 08
        push    eax                                     ; 2EA4 _ 50
        push    969                                     ; 2EA5 _ 68, 000003C9
        call    io_out8                                 ; 2EAA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2EAF _ 83. C4, 10
        mov     eax, dword [ebp+10H]                    ; 2EB2 _ 8B. 45, 10
        add     eax, 2                                  ; 2EB5 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 2EB8 _ 0F B6. 00
        shr     al, 2                                   ; 2EBB _ C0. E8, 02
        movzx   eax, al                                 ; 2EBE _ 0F B6. C0
        sub     esp, 8                                  ; 2EC1 _ 83. EC, 08
        push    eax                                     ; 2EC4 _ 50
        push    969                                     ; 2EC5 _ 68, 000003C9
        call    io_out8                                 ; 2ECA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2ECF _ 83. C4, 10
        add     dword [ebp+10H], 3                      ; 2ED2 _ 83. 45, 10, 03
        add     dword [ebp-0CH], 1                      ; 2ED6 _ 83. 45, F4, 01
?_186:  mov     eax, dword [ebp-0CH]                    ; 2EDA _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 2EDD _ 3B. 45, 0C
        jle     ?_185                                   ; 2EE0 _ 7E, 93
        sub     esp, 12                                 ; 2EE2 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 2EE5 _ FF. 75, F0
        call    io_store_eflags                         ; 2EE8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 2EED _ 83. C4, 10
        nop                                             ; 2EF0 _ 90
        leave                                           ; 2EF1 _ C9
        ret                                             ; 2EF2 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 2EF3 _ 55
        mov     ebp, esp                                ; 2EF4 _ 89. E5
        sub     esp, 20                                 ; 2EF6 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 2EF9 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 2EFC _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 2EFF _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 2F02 _ 89. 45, F8
        jmp     ?_190                                   ; 2F05 _ EB, 33

?_187:  mov     eax, dword [ebp+14H]                    ; 2F07 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 2F0A _ 89. 45, FC
        jmp     ?_189                                   ; 2F0D _ EB, 1F

?_188:  mov     eax, dword [ebp-8H]                     ; 2F0F _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 2F12 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2F16 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2F18 _ 8B. 45, FC
        add     eax, edx                                ; 2F1B _ 01. D0
        mov     edx, eax                                ; 2F1D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2F1F _ 8B. 45, 08
        add     edx, eax                                ; 2F22 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2F24 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2F28 _ 88. 02
        add     dword [ebp-4H], 1                       ; 2F2A _ 83. 45, FC, 01
?_189:  mov     eax, dword [ebp-4H]                     ; 2F2E _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 2F31 _ 3B. 45, 1C
        jle     ?_188                                   ; 2F34 _ 7E, D9
        add     dword [ebp-8H], 1                       ; 2F36 _ 83. 45, F8, 01
?_190:  mov     eax, dword [ebp-8H]                     ; 2F3A _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 2F3D _ 3B. 45, 20
        jle     ?_187                                   ; 2F40 _ 7E, C5
        leave                                           ; 2F42 _ C9
        ret                                             ; 2F43 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 2F44 _ 55
        mov     ebp, esp                                ; 2F45 _ 89. E5
        sub     esp, 20                                 ; 2F47 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 2F4A _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 2F4D _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 2F50 _ C7. 45, FC, 00000000
        jmp     ?_200                                   ; 2F57 _ E9, 0000016C

?_191:  mov     edx, dword [ebp-4H]                     ; 2F5C _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 2F5F _ 8B. 45, 1C
        add     eax, edx                                ; 2F62 _ 01. D0
        movzx   eax, byte [eax]                         ; 2F64 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 2F67 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 2F6A _ 80. 7D, FB, 00
        jns     ?_192                                   ; 2F6E _ 79, 20
        mov     edx, dword [ebp+14H]                    ; 2F70 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 2F73 _ 8B. 45, FC
        add     eax, edx                                ; 2F76 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2F78 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2F7C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2F7E _ 8B. 45, 10
        add     eax, edx                                ; 2F81 _ 01. D0
        mov     edx, eax                                ; 2F83 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2F85 _ 8B. 45, 08
        add     edx, eax                                ; 2F88 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2F8A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2F8E _ 88. 02
?_192:  movsx   eax, byte [ebp-5H]                      ; 2F90 _ 0F BE. 45, FB
        and     eax, 40H                                ; 2F94 _ 83. E0, 40
        test    eax, eax                                ; 2F97 _ 85. C0
        jz      ?_193                                   ; 2F99 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 2F9B _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 2F9E _ 8B. 45, FC
        add     eax, edx                                ; 2FA1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2FA3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2FA7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2FA9 _ 8B. 45, 10
        add     eax, edx                                ; 2FAC _ 01. D0
        lea     edx, [eax+1H]                           ; 2FAE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2FB1 _ 8B. 45, 08
        add     edx, eax                                ; 2FB4 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2FB6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2FBA _ 88. 02
?_193:  movsx   eax, byte [ebp-5H]                      ; 2FBC _ 0F BE. 45, FB
        and     eax, 20H                                ; 2FC0 _ 83. E0, 20
        test    eax, eax                                ; 2FC3 _ 85. C0
        jz      ?_194                                   ; 2FC5 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 2FC7 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 2FCA _ 8B. 45, FC
        add     eax, edx                                ; 2FCD _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2FCF _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2FD3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2FD5 _ 8B. 45, 10
        add     eax, edx                                ; 2FD8 _ 01. D0
        lea     edx, [eax+2H]                           ; 2FDA _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 2FDD _ 8B. 45, 08
        add     edx, eax                                ; 2FE0 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2FE2 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2FE6 _ 88. 02
?_194:  movsx   eax, byte [ebp-5H]                      ; 2FE8 _ 0F BE. 45, FB
        and     eax, 10H                                ; 2FEC _ 83. E0, 10
        test    eax, eax                                ; 2FEF _ 85. C0
        jz      ?_195                                   ; 2FF1 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 2FF3 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 2FF6 _ 8B. 45, FC
        add     eax, edx                                ; 2FF9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2FFB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2FFF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3001 _ 8B. 45, 10
        add     eax, edx                                ; 3004 _ 01. D0
        lea     edx, [eax+3H]                           ; 3006 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 3009 _ 8B. 45, 08
        add     edx, eax                                ; 300C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 300E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3012 _ 88. 02
?_195:  movsx   eax, byte [ebp-5H]                      ; 3014 _ 0F BE. 45, FB
        and     eax, 08H                                ; 3018 _ 83. E0, 08
        test    eax, eax                                ; 301B _ 85. C0
        jz      ?_196                                   ; 301D _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 301F _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 3022 _ 8B. 45, FC
        add     eax, edx                                ; 3025 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3027 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 302B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 302D _ 8B. 45, 10
        add     eax, edx                                ; 3030 _ 01. D0
        lea     edx, [eax+4H]                           ; 3032 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3035 _ 8B. 45, 08
        add     edx, eax                                ; 3038 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 303A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 303E _ 88. 02
?_196:  movsx   eax, byte [ebp-5H]                      ; 3040 _ 0F BE. 45, FB
        and     eax, 04H                                ; 3044 _ 83. E0, 04
        test    eax, eax                                ; 3047 _ 85. C0
        jz      ?_197                                   ; 3049 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 304B _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 304E _ 8B. 45, FC
        add     eax, edx                                ; 3051 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3053 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3057 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3059 _ 8B. 45, 10
        add     eax, edx                                ; 305C _ 01. D0
        lea     edx, [eax+5H]                           ; 305E _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 3061 _ 8B. 45, 08
        add     edx, eax                                ; 3064 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3066 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 306A _ 88. 02
?_197:  movsx   eax, byte [ebp-5H]                      ; 306C _ 0F BE. 45, FB
        and     eax, 02H                                ; 3070 _ 83. E0, 02
        test    eax, eax                                ; 3073 _ 85. C0
        jz      ?_198                                   ; 3075 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 3077 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 307A _ 8B. 45, FC
        add     eax, edx                                ; 307D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 307F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3083 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3085 _ 8B. 45, 10
        add     eax, edx                                ; 3088 _ 01. D0
        lea     edx, [eax+6H]                           ; 308A _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 308D _ 8B. 45, 08
        add     edx, eax                                ; 3090 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3092 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3096 _ 88. 02
?_198:  movsx   eax, byte [ebp-5H]                      ; 3098 _ 0F BE. 45, FB
        and     eax, 01H                                ; 309C _ 83. E0, 01
        test    eax, eax                                ; 309F _ 85. C0
        jz      ?_199                                   ; 30A1 _ 74, 21
        mov     edx, dword [ebp+14H]                    ; 30A3 _ 8B. 55, 14
        mov     eax, dword [ebp-4H]                     ; 30A6 _ 8B. 45, FC
        add     eax, edx                                ; 30A9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 30AB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 30AF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 30B1 _ 8B. 45, 10
        add     eax, edx                                ; 30B4 _ 01. D0
        lea     edx, [eax+7H]                           ; 30B6 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 30B9 _ 8B. 45, 08
        add     edx, eax                                ; 30BC _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 30BE _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 30C2 _ 88. 02
?_199:  add     dword [ebp-4H], 1                       ; 30C4 _ 83. 45, FC, 01
?_200:  cmp     dword [ebp-4H], 15                      ; 30C8 _ 83. 7D, FC, 0F
        jle     ?_191                                   ; 30CC _ 0F 8E, FFFFFE8A
        leave                                           ; 30D2 _ C9
        ret                                             ; 30D3 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 30D4 _ 55
        mov     ebp, esp                                ; 30D5 _ 89. E5
        sub     esp, 20                                 ; 30D7 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 30DA _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 30DD _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 30E0 _ C7. 45, F8, 00000000
        jmp     ?_207                                   ; 30E7 _ E9, 000000B1

?_201:  mov     dword [ebp-4H], 0                       ; 30EC _ C7. 45, FC, 00000000
        jmp     ?_206                                   ; 30F3 _ E9, 00000097

?_202:  mov     eax, dword [ebp-8H]                     ; 30F8 _ 8B. 45, F8
        shl     eax, 4                                  ; 30FB _ C1. E0, 04
        mov     edx, eax                                ; 30FE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3100 _ 8B. 45, FC
        add     eax, edx                                ; 3103 _ 01. D0
        add     eax, cursor.2191                        ; 3105 _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 310A _ 0F B6. 00
        cmp     al, 42                                  ; 310D _ 3C, 2A
        jnz     ?_203                                   ; 310F _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 3111 _ 8B. 45, F8
        shl     eax, 4                                  ; 3114 _ C1. E0, 04
        mov     edx, eax                                ; 3117 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3119 _ 8B. 45, FC
        add     eax, edx                                ; 311C _ 01. D0
        mov     edx, eax                                ; 311E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3120 _ 8B. 45, 08
        add     eax, edx                                ; 3123 _ 01. D0
        mov     byte [eax], 0                           ; 3125 _ C6. 00, 00
?_203:  mov     eax, dword [ebp-8H]                     ; 3128 _ 8B. 45, F8
        shl     eax, 4                                  ; 312B _ C1. E0, 04
        mov     edx, eax                                ; 312E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3130 _ 8B. 45, FC
        add     eax, edx                                ; 3133 _ 01. D0
        add     eax, cursor.2191                        ; 3135 _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 313A _ 0F B6. 00
        cmp     al, 79                                  ; 313D _ 3C, 4F
        jnz     ?_204                                   ; 313F _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 3141 _ 8B. 45, F8
        shl     eax, 4                                  ; 3144 _ C1. E0, 04
        mov     edx, eax                                ; 3147 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3149 _ 8B. 45, FC
        add     eax, edx                                ; 314C _ 01. D0
        mov     edx, eax                                ; 314E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3150 _ 8B. 45, 08
        add     eax, edx                                ; 3153 _ 01. D0
        mov     byte [eax], 7                           ; 3155 _ C6. 00, 07
?_204:  mov     eax, dword [ebp-8H]                     ; 3158 _ 8B. 45, F8
        shl     eax, 4                                  ; 315B _ C1. E0, 04
        mov     edx, eax                                ; 315E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3160 _ 8B. 45, FC
        add     eax, edx                                ; 3163 _ 01. D0
        add     eax, cursor.2191                        ; 3165 _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 316A _ 0F B6. 00
        cmp     al, 46                                  ; 316D _ 3C, 2E
        jnz     ?_205                                   ; 316F _ 75, 1A
        mov     eax, dword [ebp-8H]                     ; 3171 _ 8B. 45, F8
        shl     eax, 4                                  ; 3174 _ C1. E0, 04
        mov     edx, eax                                ; 3177 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3179 _ 8B. 45, FC
        add     eax, edx                                ; 317C _ 01. D0
        mov     edx, eax                                ; 317E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3180 _ 8B. 45, 08
        add     edx, eax                                ; 3183 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3185 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3189 _ 88. 02
?_205:  add     dword [ebp-4H], 1                       ; 318B _ 83. 45, FC, 01
?_206:  cmp     dword [ebp-4H], 15                      ; 318F _ 83. 7D, FC, 0F
        jle     ?_202                                   ; 3193 _ 0F 8E, FFFFFF5F
        add     dword [ebp-8H], 1                       ; 3199 _ 83. 45, F8, 01
?_207:  cmp     dword [ebp-8H], 15                      ; 319D _ 83. 7D, F8, 0F
        jle     ?_201                                   ; 31A1 _ 0F 8E, FFFFFF45
        leave                                           ; 31A7 _ C9
        ret                                             ; 31A8 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 31A9 _ 55
        mov     ebp, esp                                ; 31AA _ 89. E5
        sub     esp, 16                                 ; 31AC _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 31AF _ C7. 45, F8, 00000000
        jmp     ?_211                                   ; 31B6 _ EB, 50

?_208:  mov     dword [ebp-4H], 0                       ; 31B8 _ C7. 45, FC, 00000000
        jmp     ?_210                                   ; 31BF _ EB, 3B

?_209:  mov     edx, dword [ebp+1CH]                    ; 31C1 _ 8B. 55, 1C
        mov     eax, dword [ebp-8H]                     ; 31C4 _ 8B. 45, F8
        add     eax, edx                                ; 31C7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 31C9 _ 0F AF. 45, 0C
        mov     ecx, dword [ebp+18H]                    ; 31CD _ 8B. 4D, 18
        mov     edx, dword [ebp-4H]                     ; 31D0 _ 8B. 55, FC
        add     edx, ecx                                ; 31D3 _ 01. CA
        add     eax, edx                                ; 31D5 _ 01. D0
        mov     edx, eax                                ; 31D7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 31D9 _ 8B. 45, 08
        add     edx, eax                                ; 31DC _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 31DE _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 31E1 _ 0F AF. 45, 24
        mov     ecx, eax                                ; 31E5 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 31E7 _ 8B. 45, FC
        add     eax, ecx                                ; 31EA _ 01. C8
        mov     ecx, eax                                ; 31EC _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 31EE _ 8B. 45, 20
        add     eax, ecx                                ; 31F1 _ 01. C8
        movzx   eax, byte [eax]                         ; 31F3 _ 0F B6. 00
        mov     byte [edx], al                          ; 31F6 _ 88. 02
        add     dword [ebp-4H], 1                       ; 31F8 _ 83. 45, FC, 01
?_210:  mov     eax, dword [ebp-4H]                     ; 31FC _ 8B. 45, FC
        cmp     eax, dword [ebp+10H]                    ; 31FF _ 3B. 45, 10
        jl      ?_209                                   ; 3202 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 3204 _ 83. 45, F8, 01
?_211:  mov     eax, dword [ebp-8H]                     ; 3208 _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 320B _ 3B. 45, 14
        jl      ?_208                                   ; 320E _ 7C, A8
        leave                                           ; 3210 _ C9
        ret                                             ; 3211 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 3212 _ 55
        mov     ebp, esp                                ; 3213 _ 89. E5
        sub     esp, 24                                 ; 3215 _ 83. EC, 18
        mov     eax, dword [bootInfo]                   ; 3218 _ A1, 00000018(d)
        mov     dword [ebp-0CH], eax                    ; 321D _ 89. 45, F4
        movzx   eax, word [?_425]                       ; 3220 _ 0F B7. 05, 0000001C(d)
        cwde                                            ; 3227 _ 98
        mov     dword [ebp-10H], eax                    ; 3228 _ 89. 45, F0
        movzx   eax, word [?_426]                       ; 322B _ 0F B7. 05, 0000001E(d)
        cwde                                            ; 3232 _ 98
        mov     dword [ebp-14H], eax                    ; 3233 _ 89. 45, EC
        sub     esp, 8                                  ; 3236 _ 83. EC, 08
        push    32                                      ; 3239 _ 6A, 20
        push    32                                      ; 323B _ 6A, 20
        call    io_out8                                 ; 323D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3242 _ 83. C4, 10
        mov     byte [ebp-15H], 0                       ; 3245 _ C6. 45, EB, 00
        sub     esp, 12                                 ; 3249 _ 83. EC, 0C
        push    96                                      ; 324C _ 6A, 60
        call    io_in8                                  ; 324E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3253 _ 83. C4, 10
        mov     byte [ebp-15H], al                      ; 3256 _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 3259 _ 0F B6. 45, EB
        sub     esp, 8                                  ; 325D _ 83. EC, 08
        push    eax                                     ; 3260 _ 50
        push    keyinfo                                 ; 3261 _ 68, 00000020(d)
        call    fifo8_put                               ; 3266 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 326B _ 83. C4, 10
        nop                                             ; 326E _ 90
        leave                                           ; 326F _ C9
        ret                                             ; 3270 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 3271 _ 55
        mov     ebp, esp                                ; 3272 _ 89. E5
        sub     esp, 4                                  ; 3274 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 3277 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 327A _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 327D _ 80. 7D, FC, 09
        jle     ?_212                                   ; 3281 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 3283 _ 0F B6. 45, FC
        add     eax, 55                                 ; 3287 _ 83. C0, 37
        jmp     ?_213                                   ; 328A _ EB, 07

?_212:  movzx   eax, byte [ebp-4H]                      ; 328C _ 0F B6. 45, FC
        add     eax, 48                                 ; 3290 _ 83. C0, 30
?_213:  leave                                           ; 3293 _ C9
        ret                                             ; 3294 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 3295 _ 55
        mov     ebp, esp                                ; 3296 _ 89. E5
        sub     esp, 20                                 ; 3298 _ 83. EC, 14
        mov     eax, dword [ebp+8H]                     ; 329B _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 329E _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 32A1 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 32A8 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 32AC _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 32AF _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 32B2 _ 0F BE. 45, FB
        push    eax                                     ; 32B6 _ 50
        call    charToHexVal                            ; 32B7 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 32BC _ 83. C4, 04
        mov     byte [?_424], al                        ; 32BF _ A2, 00000153(d)
        movzx   eax, byte [ebp-14H]                     ; 32C4 _ 0F B6. 45, EC
        shr     al, 4                                   ; 32C8 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 32CB _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 32CE _ 0F B6. 45, EC
        movsx   eax, al                                 ; 32D2 _ 0F BE. C0
        push    eax                                     ; 32D5 _ 50
        call    charToHexVal                            ; 32D6 _ E8, FFFFFFFC(rel)
        add     esp, 4                                  ; 32DB _ 83. C4, 04
        mov     byte [?_423], al                        ; 32DE _ A2, 00000152(d)
        mov     eax, keyval                             ; 32E3 _ B8, 00000150(d)
        leave                                           ; 32E8 _ C9
        ret                                             ; 32E9 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 32EA _ 55
        mov     ebp, esp                                ; 32EB _ 89. E5
        sub     esp, 16                                 ; 32ED _ 83. EC, 10
        mov     byte [str.2239], 48                     ; 32F0 _ C6. 05, 000003B4(d), 30
        mov     byte [?_429], 88                        ; 32F7 _ C6. 05, 000003B5(d), 58
        mov     byte [?_430], 0                         ; 32FE _ C6. 05, 000003BE(d), 00
        mov     dword [ebp-4H], 2                       ; 3305 _ C7. 45, FC, 00000002
        jmp     ?_215                                   ; 330C _ EB, 0F

?_214:  mov     eax, dword [ebp-4H]                     ; 330E _ 8B. 45, FC
        add     eax, str.2239                           ; 3311 _ 05, 000003B4(d)
        mov     byte [eax], 48                          ; 3316 _ C6. 00, 30
        add     dword [ebp-4H], 1                       ; 3319 _ 83. 45, FC, 01
?_215:  cmp     dword [ebp-4H], 9                       ; 331D _ 83. 7D, FC, 09
        jle     ?_214                                   ; 3321 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 3323 _ C7. 45, F8, 00000009
        jmp     ?_219                                   ; 332A _ EB, 42

?_216:  mov     eax, dword [ebp+8H]                     ; 332C _ 8B. 45, 08
        and     eax, 0FH                                ; 332F _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 3332 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3335 _ 8B. 45, 08
        shr     eax, 4                                  ; 3338 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 333B _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 333E _ 83. 7D, F4, 09
        jle     ?_217                                   ; 3342 _ 7E, 14
        mov     eax, dword [ebp-0CH]                    ; 3344 _ 8B. 45, F4
        add     eax, 55                                 ; 3347 _ 83. C0, 37
        mov     edx, eax                                ; 334A _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 334C _ 8B. 45, F8
        add     eax, str.2239                           ; 334F _ 05, 000003B4(d)
        mov     byte [eax], dl                          ; 3354 _ 88. 10
        jmp     ?_218                                   ; 3356 _ EB, 12

?_217:  mov     eax, dword [ebp-0CH]                    ; 3358 _ 8B. 45, F4
        add     eax, 48                                 ; 335B _ 83. C0, 30
        mov     edx, eax                                ; 335E _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 3360 _ 8B. 45, F8
        add     eax, str.2239                           ; 3363 _ 05, 000003B4(d)
        mov     byte [eax], dl                          ; 3368 _ 88. 10
?_218:  sub     dword [ebp-8H], 1                       ; 336A _ 83. 6D, F8, 01
?_219:  cmp     dword [ebp-8H], 1                       ; 336E _ 83. 7D, F8, 01
        jle     ?_220                                   ; 3372 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 3374 _ 83. 7D, 08, 00
        jnz     ?_216                                   ; 3378 _ 75, B2
?_220:  mov     eax, str.2239                           ; 337A _ B8, 000003B4(d)
        leave                                           ; 337F _ C9
        ret                                             ; 3380 _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 3381 _ 55
        mov     ebp, esp                                ; 3382 _ 89. E5
        sub     esp, 8                                  ; 3384 _ 83. EC, 08
?_221:  sub     esp, 12                                 ; 3387 _ 83. EC, 0C
        push    100                                     ; 338A _ 6A, 64
        call    io_in8                                  ; 338C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3391 _ 83. C4, 10
        and     eax, 02H                                ; 3394 _ 83. E0, 02
        test    eax, eax                                ; 3397 _ 85. C0
        jnz     ?_222                                   ; 3399 _ 75, 02
        jmp     ?_223                                   ; 339B _ EB, 02

?_222:  jmp     ?_221                                   ; 339D _ EB, E8

?_223:  leave                                           ; 339F _ C9
        ret                                             ; 33A0 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 33A1 _ 55
        mov     ebp, esp                                ; 33A2 _ 89. E5
        sub     esp, 8                                  ; 33A4 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 33A7 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 33AC _ 83. EC, 08
        push    96                                      ; 33AF _ 6A, 60
        push    100                                     ; 33B1 _ 6A, 64
        call    io_out8                                 ; 33B3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 33B8 _ 83. C4, 10
        call    wait_KBC_sendready                      ; 33BB _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 33C0 _ 83. EC, 08
        push    71                                      ; 33C3 _ 6A, 47
        push    96                                      ; 33C5 _ 6A, 60
        call    io_out8                                 ; 33C7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 33CC _ 83. C4, 10
        nop                                             ; 33CF _ 90
        leave                                           ; 33D0 _ C9
        ret                                             ; 33D1 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 33D2 _ 55
        mov     ebp, esp                                ; 33D3 _ 89. E5
        sub     esp, 8                                  ; 33D5 _ 83. EC, 08
        call    wait_KBC_sendready                      ; 33D8 _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 33DD _ 83. EC, 08
        push    212                                     ; 33E0 _ 68, 000000D4
        push    100                                     ; 33E5 _ 6A, 64
        call    io_out8                                 ; 33E7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 33EC _ 83. C4, 10
        call    wait_KBC_sendready                      ; 33EF _ E8, FFFFFFFC(rel)
        sub     esp, 8                                  ; 33F4 _ 83. EC, 08
        push    244                                     ; 33F7 _ 68, 000000F4
        push    96                                      ; 33FC _ 6A, 60
        call    io_out8                                 ; 33FE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3403 _ 83. C4, 10
        mov     eax, dword [ebp+8H]                     ; 3406 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 3409 _ C6. 40, 03, 00
        nop                                             ; 340D _ 90
        leave                                           ; 340E _ C9
        ret                                             ; 340F _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 3410 _ 55
        mov     ebp, esp                                ; 3411 _ 89. E5
        sub     esp, 24                                 ; 3413 _ 83. EC, 18
        sub     esp, 8                                  ; 3416 _ 83. EC, 08
        push    32                                      ; 3419 _ 6A, 20
        push    160                                     ; 341B _ 68, 000000A0
        call    io_out8                                 ; 3420 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3425 _ 83. C4, 10
        sub     esp, 8                                  ; 3428 _ 83. EC, 08
        push    32                                      ; 342B _ 6A, 20
        push    32                                      ; 342D _ 6A, 20
        call    io_out8                                 ; 342F _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3434 _ 83. C4, 10
        sub     esp, 12                                 ; 3437 _ 83. EC, 0C
        push    96                                      ; 343A _ 6A, 60
        call    io_in8                                  ; 343C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3441 _ 83. C4, 10
        mov     byte [ebp-9H], al                       ; 3444 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 3447 _ 0F B6. 45, F7
        sub     esp, 8                                  ; 344B _ 83. EC, 08
        push    eax                                     ; 344E _ 50
        push    mouseinfo                               ; 344F _ 68, 0000003C(d)
        call    fifo8_put                               ; 3454 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3459 _ 83. C4, 10
        leave                                           ; 345C _ C9
        ret                                             ; 345D _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 345E _ 55
        mov     ebp, esp                                ; 345F _ 89. E5
        sub     esp, 4                                  ; 3461 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 3464 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 3467 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 346A _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 346D _ 0F B6. 40, 03
        test    al, al                                  ; 3471 _ 84. C0
        jnz     ?_225                                   ; 3473 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 3475 _ 80. 7D, FC, FA
        jnz     ?_224                                   ; 3479 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 347B _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 347E _ C6. 40, 03, 01
?_224:  mov     eax, 0                                  ; 3482 _ B8, 00000000
        jmp     ?_232                                   ; 3487 _ E9, 0000010F

?_225:  mov     eax, dword [ebp+8H]                     ; 348C _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 348F _ 0F B6. 40, 03
        cmp     al, 1                                   ; 3493 _ 3C, 01
        jnz     ?_227                                   ; 3495 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 3497 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 349B _ 25, 000000C8
        cmp     eax, 8                                  ; 34A0 _ 83. F8, 08
        jnz     ?_226                                   ; 34A3 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 34A5 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 34A8 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 34AC _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 34AE _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 34B1 _ C6. 40, 03, 02
?_226:  mov     eax, 0                                  ; 34B5 _ B8, 00000000
        jmp     ?_232                                   ; 34BA _ E9, 000000DC

?_227:  mov     eax, dword [ebp+8H]                     ; 34BF _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 34C2 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 34C6 _ 3C, 02
        jnz     ?_228                                   ; 34C8 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 34CA _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 34CD _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 34D1 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 34D4 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 34D7 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 34DB _ B8, 00000000
        jmp     ?_232                                   ; 34E0 _ E9, 000000B6

?_228:  mov     eax, dword [ebp+8H]                     ; 34E5 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 34E8 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 34EC _ 3C, 03
        jne     ?_231                                   ; 34EE _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 34F4 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 34F7 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 34FB _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 34FE _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 3501 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 3505 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3508 _ 0F B6. 00
        movzx   eax, al                                 ; 350B _ 0F B6. C0
        and     eax, 07H                                ; 350E _ 83. E0, 07
        mov     edx, eax                                ; 3511 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3513 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3516 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3519 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 351C _ 0F B6. 40, 01
        movzx   edx, al                                 ; 3520 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 3523 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3526 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3529 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 352C _ 0F B6. 40, 02
        movzx   edx, al                                 ; 3530 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 3533 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3536 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3539 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 353C _ 0F B6. 00
        movzx   eax, al                                 ; 353F _ 0F B6. C0
        and     eax, 10H                                ; 3542 _ 83. E0, 10
        test    eax, eax                                ; 3545 _ 85. C0
        jz      ?_229                                   ; 3547 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 3549 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 354C _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 354F _ 0D, FFFFFF00
        mov     edx, eax                                ; 3554 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3556 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3559 _ 89. 50, 04
?_229:  mov     eax, dword [ebp+8H]                     ; 355C _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 355F _ 0F B6. 00
        movzx   eax, al                                 ; 3562 _ 0F B6. C0
        and     eax, 20H                                ; 3565 _ 83. E0, 20
        test    eax, eax                                ; 3568 _ 85. C0
        jz      ?_230                                   ; 356A _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 356C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 356F _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 3572 _ 0D, FFFFFF00
        mov     edx, eax                                ; 3577 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3579 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 357C _ 89. 50, 08
?_230:  mov     eax, dword [ebp+8H]                     ; 357F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3582 _ 8B. 40, 08
        neg     eax                                     ; 3585 _ F7. D8
        mov     edx, eax                                ; 3587 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3589 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 358C _ 89. 50, 08
        mov     eax, 1                                  ; 358F _ B8, 00000001
        jmp     ?_232                                   ; 3594 _ EB, 05

?_231:  mov     eax, 4294967295                         ; 3596 _ B8, FFFFFFFF
?_232:  leave                                           ; 359B _ C9
        ret                                             ; 359C _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 359D _ 55
        mov     ebp, esp                                ; 359E _ 89. E5
        sub     esp, 40                                 ; 35A0 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 35A3 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 35AA _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 35B1 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 35B8 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 35BF _ 8B. 15, 00000140(d)
        mov     eax, dword [ebp+0CH]                    ; 35C5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 35C8 _ 8B. 00
        sub     esp, 4                                  ; 35CA _ 83. EC, 04
        push    edx                                     ; 35CD _ 52
        push    dword [ebp+1CH]                         ; 35CE _ FF. 75, 1C
        push    eax                                     ; 35D1 _ 50
        call    init_screen8                            ; 35D2 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 35D7 _ 83. C4, 10
        mov     eax, dword [ebp+20H]                    ; 35DA _ 8B. 45, 20
        movsx   eax, al                                 ; 35DD _ 0F BE. C0
        sub     esp, 8                                  ; 35E0 _ 83. EC, 08
        push    ?_414                                   ; 35E3 _ 68, 00000070(d)
        push    eax                                     ; 35E8 _ 50
        push    dword [ebp-10H]                         ; 35E9 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 35EC _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 35EF _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 35F2 _ FF. 75, 08
        call    showString                              ; 35F5 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 35FA _ 83. C4, 20
        mov     eax, dword [ebp+18H]                    ; 35FD _ 8B. 45, 18
        sub     esp, 12                                 ; 3600 _ 83. EC, 0C
        push    eax                                     ; 3603 _ 50
        call    intToHexStr                             ; 3604 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3609 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 360C _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 360F _ 8B. 45, 20
        movsx   eax, al                                 ; 3612 _ 0F BE. C0
        sub     esp, 8                                  ; 3615 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 3618 _ FF. 75, E4
        push    eax                                     ; 361B _ 50
        push    dword [ebp-10H]                         ; 361C _ FF. 75, F0
        push    dword [ebp-14H]                         ; 361F _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 3622 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 3625 _ FF. 75, 08
        call    showString                              ; 3628 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 362D _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 3630 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 3634 _ 8B. 45, 20
        movsx   eax, al                                 ; 3637 _ 0F BE. C0
        sub     esp, 8                                  ; 363A _ 83. EC, 08
        push    ?_415                                   ; 363D _ 68, 0000007A(d)
        push    eax                                     ; 3642 _ 50
        push    dword [ebp-10H]                         ; 3643 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 3646 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 3649 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 364C _ FF. 75, 08
        call    showString                              ; 364F _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3654 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 3657 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 365A _ 8B. 00
        sub     esp, 12                                 ; 365C _ 83. EC, 0C
        push    eax                                     ; 365F _ 50
        call    intToHexStr                             ; 3660 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3665 _ 83. C4, 10
        mov     dword [ebp-20H], eax                    ; 3668 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 366B _ 8B. 45, 20
        movsx   eax, al                                 ; 366E _ 0F BE. C0
        sub     esp, 8                                  ; 3671 _ 83. EC, 08
        push    dword [ebp-20H]                         ; 3674 _ FF. 75, E0
        push    eax                                     ; 3677 _ 50
        push    dword [ebp-10H]                         ; 3678 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 367B _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 367E _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 3681 _ FF. 75, 08
        call    showString                              ; 3684 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3689 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 368C _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 3690 _ 8B. 45, 20
        movsx   eax, al                                 ; 3693 _ 0F BE. C0
        sub     esp, 8                                  ; 3696 _ 83. EC, 08
        push    ?_416                                   ; 3699 _ 68, 00000086(d)
        push    eax                                     ; 369E _ 50
        push    dword [ebp-10H]                         ; 369F _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 36A2 _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 36A5 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 36A8 _ FF. 75, 08
        call    showString                              ; 36AB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 36B0 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 36B3 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 36B6 _ 8B. 40, 04
        sub     esp, 12                                 ; 36B9 _ 83. EC, 0C
        push    eax                                     ; 36BC _ 50
        call    intToHexStr                             ; 36BD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 36C2 _ 83. C4, 10
        mov     dword [ebp-24H], eax                    ; 36C5 _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 36C8 _ 8B. 45, 20
        movsx   eax, al                                 ; 36CB _ 0F BE. C0
        sub     esp, 8                                  ; 36CE _ 83. EC, 08
        push    dword [ebp-24H]                         ; 36D1 _ FF. 75, DC
        push    eax                                     ; 36D4 _ 50
        push    dword [ebp-10H]                         ; 36D5 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 36D8 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 36DB _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 36DE _ FF. 75, 08
        call    showString                              ; 36E1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 36E6 _ 83. C4, 20
        add     dword [ebp-10H], 16                     ; 36E9 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 36ED _ 8B. 45, 20
        movsx   eax, al                                 ; 36F0 _ 0F BE. C0
        sub     esp, 8                                  ; 36F3 _ 83. EC, 08
        push    ?_417                                   ; 36F6 _ 68, 00000092(d)
        push    eax                                     ; 36FB _ 50
        push    dword [ebp-10H]                         ; 36FC _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 36FF _ FF. 75, F4
        push    dword [ebp+0CH]                         ; 3702 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 3705 _ FF. 75, 08
        call    showString                              ; 3708 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 370D _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 3710 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 3713 _ 8B. 40, 08
        sub     esp, 12                                 ; 3716 _ 83. EC, 0C
        push    eax                                     ; 3719 _ 50
        call    intToHexStr                             ; 371A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 371F _ 83. C4, 10
        mov     dword [ebp-28H], eax                    ; 3722 _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 3725 _ 8B. 45, 20
        movsx   eax, al                                 ; 3728 _ 0F BE. C0
        sub     esp, 8                                  ; 372B _ 83. EC, 08
        push    dword [ebp-28H]                         ; 372E _ FF. 75, D8
        push    eax                                     ; 3731 _ 50
        push    dword [ebp-10H]                         ; 3732 _ FF. 75, F0
        push    dword [ebp-14H]                         ; 3735 _ FF. 75, EC
        push    dword [ebp+0CH]                         ; 3738 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 373B _ FF. 75, 08
        call    showString                              ; 373E _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3743 _ 83. C4, 20
        leave                                           ; 3746 _ C9
        ret                                             ; 3747 _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 3748 _ 55
        mov     ebp, esp                                ; 3749 _ 89. E5
        sub     esp, 24                                 ; 374B _ 83. EC, 18
        sub     esp, 12                                 ; 374E _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 3751 _ FF. 75, 08
        call    sheet_alloc                             ; 3754 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3759 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 375C _ 89. 45, F4
        mov     eax, dword [memman]                     ; 375F _ A1, 00000000(d)
        sub     esp, 8                                  ; 3764 _ 83. EC, 08
        push    10880                                   ; 3767 _ 68, 00002A80
        push    eax                                     ; 376C _ 50
        call    memman_alloc_4k                         ; 376D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3772 _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 3775 _ 89. 45, F0
        sub     esp, 12                                 ; 3778 _ 83. EC, 0C
        push    -1                                      ; 377B _ 6A, FF
        push    68                                      ; 377D _ 6A, 44
        push    160                                     ; 377F _ 68, 000000A0
        push    dword [ebp-10H]                         ; 3784 _ FF. 75, F0
        push    dword [ebp-0CH]                         ; 3787 _ FF. 75, F4
        call    sheet_setbuf                            ; 378A _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 378F _ 83. C4, 20
        push    1                                       ; 3792 _ 6A, 01
        push    dword [ebp+0CH]                         ; 3794 _ FF. 75, 0C
        push    dword [ebp-0CH]                         ; 3797 _ FF. 75, F4
        push    dword [ebp+8H]                          ; 379A _ FF. 75, 08
        call    make_window8                            ; 379D _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 37A2 _ 83. C4, 10
        sub     esp, 8                                  ; 37A5 _ 83. EC, 08
        push    7                                       ; 37A8 _ 6A, 07
        push    16                                      ; 37AA _ 6A, 10
        push    144                                     ; 37AC _ 68, 00000090
        push    28                                      ; 37B1 _ 6A, 1C
        push    8                                       ; 37B3 _ 6A, 08
        push    dword [ebp-0CH]                         ; 37B5 _ FF. 75, F4
        call    make_textbox8                           ; 37B8 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 37BD _ 83. C4, 20
        push    172                                     ; 37C0 _ 68, 000000AC
        push    260                                     ; 37C5 _ 68, 00000104
        push    dword [ebp-0CH]                         ; 37CA _ FF. 75, F4
        push    dword [ebp+8H]                          ; 37CD _ FF. 75, 08
        call    sheet_slide                             ; 37D0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 37D5 _ 83. C4, 10
        sub     esp, 4                                  ; 37D8 _ 83. EC, 04
        push    2                                       ; 37DB _ 6A, 02
        push    dword [ebp-0CH]                         ; 37DD _ FF. 75, F4
        push    dword [ebp+8H]                          ; 37E0 _ FF. 75, 08
        call    sheet_updown                            ; 37E3 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 37E8 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 37EB _ 8B. 45, F4
        leave                                           ; 37EE _ C9
        ret                                             ; 37EF _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 37F0 _ 55
        mov     ebp, esp                                ; 37F1 _ 89. E5
        push    ebx                                     ; 37F3 _ 53
        sub     esp, 36                                 ; 37F4 _ 83. EC, 24
        mov     eax, dword [ebp+14H]                    ; 37F7 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 37FA _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 37FD _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3800 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 3803 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 3806 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3809 _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 380C _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 380F _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3812 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3815 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3818 _ 8B. 00
        push    0                                       ; 381A _ 6A, 00
        push    edx                                     ; 381C _ 52
        push    0                                       ; 381D _ 6A, 00
        push    0                                       ; 381F _ 6A, 00
        push    8                                       ; 3821 _ 6A, 08
        push    dword [ebp-0CH]                         ; 3823 _ FF. 75, F4
        push    eax                                     ; 3826 _ 50
        call    boxfill8                                ; 3827 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 382C _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 382F _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 3832 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 3835 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3838 _ 8B. 00
        push    1                                       ; 383A _ 6A, 01
        push    edx                                     ; 383C _ 52
        push    1                                       ; 383D _ 6A, 01
        push    1                                       ; 383F _ 6A, 01
        push    7                                       ; 3841 _ 6A, 07
        push    dword [ebp-0CH]                         ; 3843 _ FF. 75, F4
        push    eax                                     ; 3846 _ 50
        call    boxfill8                                ; 3847 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 384C _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 384F _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3852 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3855 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3858 _ 8B. 00
        push    edx                                     ; 385A _ 52
        push    0                                       ; 385B _ 6A, 00
        push    0                                       ; 385D _ 6A, 00
        push    0                                       ; 385F _ 6A, 00
        push    8                                       ; 3861 _ 6A, 08
        push    dword [ebp-0CH]                         ; 3863 _ FF. 75, F4
        push    eax                                     ; 3866 _ 50
        call    boxfill8                                ; 3867 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 386C _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 386F _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3872 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3875 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3878 _ 8B. 00
        push    edx                                     ; 387A _ 52
        push    1                                       ; 387B _ 6A, 01
        push    1                                       ; 387D _ 6A, 01
        push    1                                       ; 387F _ 6A, 01
        push    7                                       ; 3881 _ 6A, 07
        push    dword [ebp-0CH]                         ; 3883 _ FF. 75, F4
        push    eax                                     ; 3886 _ 50
        call    boxfill8                                ; 3887 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 388C _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 388F _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 3892 _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 3895 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 3898 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 389B _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 389E _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 38A1 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 38A4 _ 8B. 00
        push    ebx                                     ; 38A6 _ 53
        push    ecx                                     ; 38A7 _ 51
        push    1                                       ; 38A8 _ 6A, 01
        push    edx                                     ; 38AA _ 52
        push    15                                      ; 38AB _ 6A, 0F
        push    dword [ebp-0CH]                         ; 38AD _ FF. 75, F4
        push    eax                                     ; 38B0 _ 50
        call    boxfill8                                ; 38B1 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 38B6 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 38B9 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 38BC _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 38BF _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 38C2 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 38C5 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 38C8 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 38CB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 38CE _ 8B. 00
        push    ebx                                     ; 38D0 _ 53
        push    ecx                                     ; 38D1 _ 51
        push    0                                       ; 38D2 _ 6A, 00
        push    edx                                     ; 38D4 _ 52
        push    0                                       ; 38D5 _ 6A, 00
        push    dword [ebp-0CH]                         ; 38D7 _ FF. 75, F4
        push    eax                                     ; 38DA _ 50
        call    boxfill8                                ; 38DB _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 38E0 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 38E3 _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 38E6 _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 38E9 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 38EC _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 38EF _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 38F2 _ 8B. 00
        push    ecx                                     ; 38F4 _ 51
        push    edx                                     ; 38F5 _ 52
        push    2                                       ; 38F6 _ 6A, 02
        push    2                                       ; 38F8 _ 6A, 02
        push    8                                       ; 38FA _ 6A, 08
        push    dword [ebp-0CH]                         ; 38FC _ FF. 75, F4
        push    eax                                     ; 38FF _ 50
        call    boxfill8                                ; 3900 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3905 _ 83. C4, 1C
        mov     eax, dword [ebp-0CH]                    ; 3908 _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 390B _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 390E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3911 _ 8B. 00
        push    20                                      ; 3913 _ 6A, 14
        push    edx                                     ; 3915 _ 52
        push    3                                       ; 3916 _ 6A, 03
        push    3                                       ; 3918 _ 6A, 03
        push    12                                      ; 391A _ 6A, 0C
        push    dword [ebp-0CH]                         ; 391C _ FF. 75, F4
        push    eax                                     ; 391F _ 50
        call    boxfill8                                ; 3920 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3925 _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 3928 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 392B _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 392E _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 3931 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 3934 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 3937 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 393A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 393D _ 8B. 00
        push    ebx                                     ; 393F _ 53
        push    ecx                                     ; 3940 _ 51
        push    edx                                     ; 3941 _ 52
        push    1                                       ; 3942 _ 6A, 01
        push    15                                      ; 3944 _ 6A, 0F
        push    dword [ebp-0CH]                         ; 3946 _ FF. 75, F4
        push    eax                                     ; 3949 _ 50
        call    boxfill8                                ; 394A _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 394F _ 83. C4, 1C
        mov     eax, dword [ebp-10H]                    ; 3952 _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 3955 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3958 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 395B _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 395E _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3961 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3964 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3967 _ 8B. 00
        push    ebx                                     ; 3969 _ 53
        push    ecx                                     ; 396A _ 51
        push    edx                                     ; 396B _ 52
        push    0                                       ; 396C _ 6A, 00
        push    0                                       ; 396E _ 6A, 00
        push    dword [ebp-0CH]                         ; 3970 _ FF. 75, F4
        push    eax                                     ; 3973 _ 50
        call    boxfill8                                ; 3974 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3979 _ 83. C4, 1C
        movsx   eax, byte [ebp-1CH]                     ; 397C _ 0F BE. 45, E4
        push    eax                                     ; 3980 _ 50
        push    dword [ebp+10H]                         ; 3981 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 3984 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 3987 _ FF. 75, 08
        call    make_wtitle8                            ; 398A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 398F _ 83. C4, 10
        nop                                             ; 3992 _ 90
        mov     ebx, dword [ebp-4H]                     ; 3993 _ 8B. 5D, FC
        leave                                           ; 3996 _ C9
        ret                                             ; 3997 _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 3998 _ 55
        mov     ebp, esp                                ; 3999 _ 89. E5
        push    ebx                                     ; 399B _ 53
        sub     esp, 36                                 ; 399C _ 83. EC, 24
        mov     eax, dword [ebp+14H]                    ; 399F _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 39A2 _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 39A5 _ 80. 7D, E4, 00
        jz      ?_233                                   ; 39A9 _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 39AB _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 39AF _ C6. 45, ED, 0C
        jmp     ?_234                                   ; 39B3 _ EB, 08

?_233:  mov     byte [ebp-12H], 8                       ; 39B5 _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 39B9 _ C6. 45, ED, 0F
?_234:  mov     eax, dword [ebp+0CH]                    ; 39BD _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 39C0 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 39C3 _ 8D. 58, FC
        movzx   eax, byte [ebp-13H]                     ; 39C6 _ 0F B6. 45, ED
        movzx   ecx, al                                 ; 39CA _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 39CD _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 39D0 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 39D3 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 39D6 _ 8B. 00
        push    20                                      ; 39D8 _ 6A, 14
        push    ebx                                     ; 39DA _ 53
        push    3                                       ; 39DB _ 6A, 03
        push    3                                       ; 39DD _ 6A, 03
        push    ecx                                     ; 39DF _ 51
        push    edx                                     ; 39E0 _ 52
        push    eax                                     ; 39E1 _ 50
        call    boxfill8                                ; 39E2 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 39E7 _ 83. C4, 1C
        movsx   eax, byte [ebp-12H]                     ; 39EA _ 0F BE. 45, EE
        sub     esp, 8                                  ; 39EE _ 83. EC, 08
        push    dword [ebp+10H]                         ; 39F1 _ FF. 75, 10
        push    eax                                     ; 39F4 _ 50
        push    4                                       ; 39F5 _ 6A, 04
        push    24                                      ; 39F7 _ 6A, 18
        push    dword [ebp+0CH]                         ; 39F9 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 39FC _ FF. 75, 08
        call    showString                              ; 39FF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 3A04 _ 83. C4, 20
        mov     dword [ebp-10H], 0                      ; 3A07 _ C7. 45, F0, 00000000
        jmp     ?_242                                   ; 3A0E _ E9, 00000083

?_235:  mov     dword [ebp-0CH], 0                      ; 3A13 _ C7. 45, F4, 00000000
        jmp     ?_241                                   ; 3A1A _ EB, 70

?_236:  mov     eax, dword [ebp-10H]                    ; 3A1C _ 8B. 45, F0
        shl     eax, 4                                  ; 3A1F _ C1. E0, 04
        mov     edx, eax                                ; 3A22 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3A24 _ 8B. 45, F4
        add     eax, edx                                ; 3A27 _ 01. D0
        add     eax, closebtn.2310                      ; 3A29 _ 05, 000002C0(d)
        movzx   eax, byte [eax]                         ; 3A2E _ 0F B6. 00
        mov     byte [ebp-11H], al                      ; 3A31 _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 3A34 _ 80. 7D, EF, 40
        jnz     ?_237                                   ; 3A38 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 3A3A _ C6. 45, EF, 00
        jmp     ?_240                                   ; 3A3E _ EB, 1C

?_237:  cmp     byte [ebp-11H], 36                      ; 3A40 _ 80. 7D, EF, 24
        jnz     ?_238                                   ; 3A44 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 3A46 _ C6. 45, EF, 0F
        jmp     ?_240                                   ; 3A4A _ EB, 10

?_238:  cmp     byte [ebp-11H], 81                      ; 3A4C _ 80. 7D, EF, 51
        jnz     ?_239                                   ; 3A50 _ 75, 06
        mov     byte [ebp-11H], 8                       ; 3A52 _ C6. 45, EF, 08
        jmp     ?_240                                   ; 3A56 _ EB, 04

?_239:  mov     byte [ebp-11H], 7                       ; 3A58 _ C6. 45, EF, 07
?_240:  mov     eax, dword [ebp+0CH]                    ; 3A5C _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 3A5F _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 3A61 _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 3A64 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 3A67 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3A6A _ 8B. 40, 04
        imul    ecx, eax                                ; 3A6D _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 3A70 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3A73 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 3A76 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 3A79 _ 8B. 45, F4
        add     eax, ebx                                ; 3A7C _ 01. D8
        add     eax, ecx                                ; 3A7E _ 01. C8
        add     edx, eax                                ; 3A80 _ 01. C2
        movzx   eax, byte [ebp-11H]                     ; 3A82 _ 0F B6. 45, EF
        mov     byte [edx], al                          ; 3A86 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 3A88 _ 83. 45, F4, 01
?_241:  cmp     dword [ebp-0CH], 15                     ; 3A8C _ 83. 7D, F4, 0F
        jle     ?_236                                   ; 3A90 _ 7E, 8A
        add     dword [ebp-10H], 1                      ; 3A92 _ 83. 45, F0, 01
?_242:  cmp     dword [ebp-10H], 13                     ; 3A96 _ 83. 7D, F0, 0D
        jle     ?_235                                   ; 3A9A _ 0F 8E, FFFFFF73
        mov     ebx, dword [ebp-4H]                     ; 3AA0 _ 8B. 5D, FC
        leave                                           ; 3AA3 _ C9
        ret                                             ; 3AA4 _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 3AA5 _ 55
        mov     ebp, esp                                ; 3AA6 _ 89. E5
        push    edi                                     ; 3AA8 _ 57
        push    esi                                     ; 3AA9 _ 56
        push    ebx                                     ; 3AAA _ 53
        sub     esp, 16                                 ; 3AAB _ 83. EC, 10
        mov     edx, dword [ebp+0CH]                    ; 3AAE _ 8B. 55, 0C
        mov     eax, dword [ebp+14H]                    ; 3AB1 _ 8B. 45, 14
        add     eax, edx                                ; 3AB4 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 3AB6 _ 89. 45, F0
        mov     edx, dword [ebp+10H]                    ; 3AB9 _ 8B. 55, 10
        mov     eax, dword [ebp+18H]                    ; 3ABC _ 8B. 45, 18
        add     eax, edx                                ; 3ABF _ 01. D0
        mov     dword [ebp-14H], eax                    ; 3AC1 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 3AC4 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 3AC7 _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 3ACA _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3ACD _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 3AD0 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3AD3 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 3AD6 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 3AD9 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 3ADC _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3ADF _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3AE2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3AE5 _ 8B. 00
        push    edi                                     ; 3AE7 _ 57
        push    esi                                     ; 3AE8 _ 56
        push    ebx                                     ; 3AE9 _ 53
        push    ecx                                     ; 3AEA _ 51
        push    15                                      ; 3AEB _ 6A, 0F
        push    edx                                     ; 3AED _ 52
        push    eax                                     ; 3AEE _ 50
        call    boxfill8                                ; 3AEF _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3AF4 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 3AF7 _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 3AFA _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 3AFD _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 3B00 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 3B03 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3B06 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 3B09 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 3B0C _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 3B0F _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3B12 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3B15 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3B18 _ 8B. 00
        push    edi                                     ; 3B1A _ 57
        push    esi                                     ; 3B1B _ 56
        push    ebx                                     ; 3B1C _ 53
        push    ecx                                     ; 3B1D _ 51
        push    15                                      ; 3B1E _ 6A, 0F
        push    edx                                     ; 3B20 _ 52
        push    eax                                     ; 3B21 _ 50
        call    boxfill8                                ; 3B22 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3B27 _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 3B2A _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 3B2D _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 3B30 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3B33 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 3B36 _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 3B39 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 3B3C _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 3B3F _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 3B42 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3B45 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3B48 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3B4B _ 8B. 00
        push    edi                                     ; 3B4D _ 57
        push    esi                                     ; 3B4E _ 56
        push    ebx                                     ; 3B4F _ 53
        push    ecx                                     ; 3B50 _ 51
        push    7                                       ; 3B51 _ 6A, 07
        push    edx                                     ; 3B53 _ 52
        push    eax                                     ; 3B54 _ 50
        call    boxfill8                                ; 3B55 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3B5A _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 3B5D _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 3B60 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 3B63 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 3B66 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 3B69 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3B6C _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 3B6F _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 3B72 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 3B75 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3B78 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3B7B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3B7E _ 8B. 00
        push    edi                                     ; 3B80 _ 57
        push    esi                                     ; 3B81 _ 56
        push    ebx                                     ; 3B82 _ 53
        push    ecx                                     ; 3B83 _ 51
        push    7                                       ; 3B84 _ 6A, 07
        push    edx                                     ; 3B86 _ 52
        push    eax                                     ; 3B87 _ 50
        call    boxfill8                                ; 3B88 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3B8D _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 3B90 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 3B93 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 3B96 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 3B99 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 3B9C _ 8B. 45, 0C
        lea     ecx, [eax-1H]                           ; 3B9F _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 3BA2 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3BA5 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3BA8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3BAB _ 8B. 00
        push    esi                                     ; 3BAD _ 56
        push    dword [ebp-10H]                         ; 3BAE _ FF. 75, F0
        push    ebx                                     ; 3BB1 _ 53
        push    ecx                                     ; 3BB2 _ 51
        push    0                                       ; 3BB3 _ 6A, 00
        push    edx                                     ; 3BB5 _ 52
        push    eax                                     ; 3BB6 _ 50
        call    boxfill8                                ; 3BB7 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3BBC _ 83. C4, 1C
        mov     eax, dword [ebp+0CH]                    ; 3BBF _ 8B. 45, 0C
        lea     esi, [eax-2H]                           ; 3BC2 _ 8D. 70, FE
        mov     eax, dword [ebp+10H]                    ; 3BC5 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 3BC8 _ 8D. 58, FE
        mov     eax, dword [ebp+0CH]                    ; 3BCB _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 3BCE _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 3BD1 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3BD4 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3BD7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3BDA _ 8B. 00
        push    dword [ebp-14H]                         ; 3BDC _ FF. 75, EC
        push    esi                                     ; 3BDF _ 56
        push    ebx                                     ; 3BE0 _ 53
        push    ecx                                     ; 3BE1 _ 51
        push    0                                       ; 3BE2 _ 6A, 00
        push    edx                                     ; 3BE4 _ 52
        push    eax                                     ; 3BE5 _ 50
        call    boxfill8                                ; 3BE6 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3BEB _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 3BEE _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 3BF1 _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 3BF4 _ 8B. 45, EC
        lea     ebx, [eax+1H]                           ; 3BF7 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 3BFA _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 3BFD _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 3C00 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3C03 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3C06 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3C09 _ 8B. 00
        push    esi                                     ; 3C0B _ 56
        push    dword [ebp-10H]                         ; 3C0C _ FF. 75, F0
        push    ebx                                     ; 3C0F _ 53
        push    ecx                                     ; 3C10 _ 51
        push    8                                       ; 3C11 _ 6A, 08
        push    edx                                     ; 3C13 _ 52
        push    eax                                     ; 3C14 _ 50
        call    boxfill8                                ; 3C15 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3C1A _ 83. C4, 1C
        mov     eax, dword [ebp-14H]                    ; 3C1D _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 3C20 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 3C23 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3C26 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 3C29 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 3C2C _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 3C2F _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 3C32 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 3C35 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3C38 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3C3B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3C3E _ 8B. 00
        push    edi                                     ; 3C40 _ 57
        push    esi                                     ; 3C41 _ 56
        push    ebx                                     ; 3C42 _ 53
        push    ecx                                     ; 3C43 _ 51
        push    8                                       ; 3C44 _ 6A, 08
        push    edx                                     ; 3C46 _ 52
        push    eax                                     ; 3C47 _ 50
        call    boxfill8                                ; 3C48 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3C4D _ 83. C4, 1C
        mov     eax, dword [ebp+10H]                    ; 3C50 _ 8B. 45, 10
        lea     esi, [eax-1H]                           ; 3C53 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 3C56 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 3C59 _ 8D. 58, FF
        mov     eax, dword [ebp+1CH]                    ; 3C5C _ 8B. 45, 1C
        movzx   ecx, al                                 ; 3C5F _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 3C62 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3C65 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3C68 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3C6B _ 8B. 00
        push    dword [ebp-14H]                         ; 3C6D _ FF. 75, EC
        push    dword [ebp-10H]                         ; 3C70 _ FF. 75, F0
        push    esi                                     ; 3C73 _ 56
        push    ebx                                     ; 3C74 _ 53
        push    ecx                                     ; 3C75 _ 51
        push    edx                                     ; 3C76 _ 52
        push    eax                                     ; 3C77 _ 50
        call    boxfill8                                ; 3C78 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 3C7D _ 83. C4, 1C
        lea     esp, [ebp-0CH]                          ; 3C80 _ 8D. 65, F4
        pop     ebx                                     ; 3C83 _ 5B
        pop     esi                                     ; 3C84 _ 5E
        pop     edi                                     ; 3C85 _ 5F
        pop     ebp                                     ; 3C86 _ 5D
        ret                                             ; 3C87 _ C3
; make_textbox8 End of function

file_loadfile:; Function begin
        push    ebp                                     ; 3C88 _ 55
        mov     ebp, esp                                ; 3C89 _ 89. E5
        sub     esp, 40                                 ; 3C8B _ 83. EC, 28
        mov     dword [ebp-0CH], 88064                  ; 3C8E _ C7. 45, F4, 00015800
        mov     eax, dword [memman]                     ; 3C95 _ A1, 00000000(d)
        sub     esp, 8                                  ; 3C9A _ 83. EC, 08
        push    13                                      ; 3C9D _ 6A, 0D
        push    eax                                     ; 3C9F _ 50
        call    memman_alloc                            ; 3CA0 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3CA5 _ 83. C4, 10
        mov     dword [ebp-1CH], eax                    ; 3CA8 _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 3CAB _ 8B. 45, E4
        add     eax, 12                                 ; 3CAE _ 83. C0, 0C
        mov     byte [eax], 0                           ; 3CB1 _ C6. 00, 00
        jmp     ?_254                                   ; 3CB4 _ E9, 0000011E

?_243:  mov     dword [ebp-10H], 0                      ; 3CB9 _ C7. 45, F0, 00000000
        jmp     ?_247                                   ; 3CC0 _ EB, 2C

?_244:  mov     edx, dword [ebp-0CH]                    ; 3CC2 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 3CC5 _ 8B. 45, F0
        add     eax, edx                                ; 3CC8 _ 01. D0
        movzx   eax, byte [eax]                         ; 3CCA _ 0F B6. 00
        test    al, al                                  ; 3CCD _ 84. C0
        jz      ?_245                                   ; 3CCF _ 74, 17
        mov     edx, dword [ebp-10H]                    ; 3CD1 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 3CD4 _ 8B. 45, E4
        add     eax, edx                                ; 3CD7 _ 01. D0
        mov     ecx, dword [ebp-0CH]                    ; 3CD9 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 3CDC _ 8B. 55, F0
        add     edx, ecx                                ; 3CDF _ 01. CA
        movzx   edx, byte [edx]                         ; 3CE1 _ 0F B6. 12
        mov     byte [eax], dl                          ; 3CE4 _ 88. 10
        jmp     ?_246                                   ; 3CE6 _ EB, 02

?_245:  jmp     ?_248                                   ; 3CE8 _ EB, 0A

?_246:  add     dword [ebp-10H], 1                      ; 3CEA _ 83. 45, F0, 01
?_247:  cmp     dword [ebp-10H], 7                      ; 3CEE _ 83. 7D, F0, 07
        jle     ?_244                                   ; 3CF2 _ 7E, CE
?_248:  mov     dword [ebp-14H], 0                      ; 3CF4 _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 3CFB _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 3CFE _ 8B. 45, E4
        add     eax, edx                                ; 3D01 _ 01. D0
        mov     byte [eax], 46                          ; 3D03 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 3D06 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 3D0A _ C7. 45, EC, 00000000
        jmp     ?_250                                   ; 3D11 _ EB, 1E

?_249:  mov     edx, dword [ebp-10H]                    ; 3D13 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 3D16 _ 8B. 45, E4
        add     eax, edx                                ; 3D19 _ 01. D0
        mov     ecx, dword [ebp-0CH]                    ; 3D1B _ 8B. 4D, F4
        mov     edx, dword [ebp-14H]                    ; 3D1E _ 8B. 55, EC
        add     edx, ecx                                ; 3D21 _ 01. CA
        movzx   edx, byte [edx+8H]                      ; 3D23 _ 0F B6. 52, 08
        mov     byte [eax], dl                          ; 3D27 _ 88. 10
        add     dword [ebp-10H], 1                      ; 3D29 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 3D2D _ 83. 45, EC, 01
?_250:  cmp     dword [ebp-14H], 2                      ; 3D31 _ 83. 7D, EC, 02
        jle     ?_249                                   ; 3D35 _ 7E, DC
        sub     esp, 8                                  ; 3D37 _ 83. EC, 08
        push    dword [ebp-1CH]                         ; 3D3A _ FF. 75, E4
        push    dword [ebp+8H]                          ; 3D3D _ FF. 75, 08
        call    strcmp                                  ; 3D40 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3D45 _ 83. C4, 10
        cmp     eax, 1                                  ; 3D48 _ 83. F8, 01
        jne     ?_253                                   ; 3D4B _ 0F 85, 00000082
        mov     eax, dword [ebp-0CH]                    ; 3D51 _ 8B. 45, F4
        mov     edx, dword [eax+1CH]                    ; 3D54 _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 3D57 _ A1, 00000000(d)
        sub     esp, 8                                  ; 3D5C _ 83. EC, 08
        push    edx                                     ; 3D5F _ 52
        push    eax                                     ; 3D60 _ 50
        call    memman_alloc_4k                         ; 3D61 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3D66 _ 83. C4, 10
        mov     edx, eax                                ; 3D69 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 3D6B _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 3D6E _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 3D70 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 3D73 _ 8B. 40, 1C
        mov     edx, eax                                ; 3D76 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 3D78 _ 8B. 45, 0C
        mov     dword [eax+8H], edx                     ; 3D7B _ 89. 50, 08
        mov     dword [ebp-20H], 97280                  ; 3D7E _ C7. 45, E0, 00017C00
        mov     eax, dword [ebp-0CH]                    ; 3D85 _ 8B. 45, F4
        movzx   eax, word [eax+1AH]                     ; 3D88 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 3D8C _ 0F B7. C0
        shl     eax, 9                                  ; 3D8F _ C1. E0, 09
        add     dword [ebp-20H], eax                    ; 3D92 _ 01. 45, E0
        mov     eax, dword [ebp-0CH]                    ; 3D95 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 3D98 _ 8B. 40, 1C
        mov     dword [ebp-24H], eax                    ; 3D9B _ 89. 45, DC
        mov     dword [ebp-18H], 0                      ; 3D9E _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 3DA5 _ C7. 45, E8, 00000000
        jmp     ?_252                                   ; 3DAC _ EB, 1B

?_251:  mov     eax, dword [ebp+0CH]                    ; 3DAE _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 3DB1 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 3DB3 _ 8B. 45, E8
        add     eax, edx                                ; 3DB6 _ 01. D0
        mov     ecx, dword [ebp-18H]                    ; 3DB8 _ 8B. 4D, E8
        mov     edx, dword [ebp-20H]                    ; 3DBB _ 8B. 55, E0
        add     edx, ecx                                ; 3DBE _ 01. CA
        movzx   edx, byte [edx]                         ; 3DC0 _ 0F B6. 12
        mov     byte [eax], dl                          ; 3DC3 _ 88. 10
        add     dword [ebp-18H], 1                      ; 3DC5 _ 83. 45, E8, 01
?_252:  mov     eax, dword [ebp-18H]                    ; 3DC9 _ 8B. 45, E8
        cmp     eax, dword [ebp-24H]                    ; 3DCC _ 3B. 45, DC
        jl      ?_251                                   ; 3DCF _ 7C, DD
        jmp     ?_255                                   ; 3DD1 _ EB, 12

?_253:  add     dword [ebp-0CH], 32                     ; 3DD3 _ 83. 45, F4, 20
?_254:  mov     eax, dword [ebp-0CH]                    ; 3DD7 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 3DDA _ 0F B6. 00
        test    al, al                                  ; 3DDD _ 84. C0
        jne     ?_243                                   ; 3DDF _ 0F 85, FFFFFED4
?_255:  mov     edx, dword [ebp-1CH]                    ; 3DE5 _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 3DE8 _ A1, 00000000(d)
        sub     esp, 4                                  ; 3DED _ 83. EC, 04
        push    13                                      ; 3DF0 _ 6A, 0D
        push    edx                                     ; 3DF2 _ 52
        push    eax                                     ; 3DF3 _ 50
        call    memman_free                             ; 3DF4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3DF9 _ 83. C4, 10
        leave                                           ; 3DFC _ C9
        ret                                             ; 3DFD _ C3
; file_loadfile End of function

intHandlerForStackOverFlow:; Function begin
        push    ebp                                     ; 3DFE _ 55
        mov     ebp, esp                                ; 3DFF _ 89. E5
        sub     esp, 24                                 ; 3E01 _ 83. EC, 18
        call    task_now                                ; 3E04 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3E09 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 3E0C _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 3E0F _ C7. 80, 00000098, 00000008
        sub     esp, 12                                 ; 3E19 _ 83. EC, 0C
        push    ?_418                                   ; 3E1C _ 68, 0000009E(d)
        call    cons_putstr                             ; 3E21 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3E26 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 3E29 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 3E2C _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 3E36 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 3E39 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 3E3F _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 3E42 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 3E45 _ 89. 90, 0000009C
        sub     esp, 12                                 ; 3E4B _ 83. EC, 0C
        push    ?_419                                   ; 3E4E _ 68, 000000A5(d)
        call    cons_putstr                             ; 3E53 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3E58 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 3E5B _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 3E5E _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 3E68 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 3E6B _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 3E71 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 3E74 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 3E77 _ 89. 90, 0000009C
        mov     eax, dword [ebp+8H]                     ; 3E7D _ 8B. 45, 08
        add     eax, 44                                 ; 3E80 _ 83. C0, 2C
        mov     eax, dword [eax]                        ; 3E83 _ 8B. 00
        sub     esp, 12                                 ; 3E85 _ 83. EC, 0C
        push    eax                                     ; 3E88 _ 50
        call    intToHexStr                             ; 3E89 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3E8E _ 83. C4, 10
        mov     dword [ebp-10H], eax                    ; 3E91 _ 89. 45, F0
        sub     esp, 12                                 ; 3E94 _ 83. EC, 0C
        push    ?_420                                   ; 3E97 _ 68, 000000B5(d)
        call    cons_putstr                             ; 3E9C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3EA1 _ 83. C4, 10
        sub     esp, 12                                 ; 3EA4 _ 83. EC, 0C
        push    dword [ebp-10H]                         ; 3EA7 _ FF. 75, F0
        call    cons_putstr                             ; 3EAA _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3EAF _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 3EB2 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 3EB5 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 3EBF _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 3EC2 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 3EC8 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 3ECB _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 3ECE _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 3ED4 _ 8B. 45, F4
        add     eax, 48                                 ; 3ED7 _ 83. C0, 30
        leave                                           ; 3EDA _ C9
        ret                                             ; 3EDB _ C3
; intHandlerForStackOverFlow End of function

intHandlerForException:; Function begin
        push    ebp                                     ; 3EDC _ 55
        mov     ebp, esp                                ; 3EDD _ 89. E5
        sub     esp, 24                                 ; 3EDF _ 83. EC, 18
        call    task_now                                ; 3EE2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3EE7 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 3EEA _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 3EED _ C7. 80, 00000098, 00000008
        sub     esp, 12                                 ; 3EF7 _ 83. EC, 0C
        push    ?_421                                   ; 3EFA _ 68, 000000BC(d)
        call    cons_putstr                             ; 3EFF _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3F04 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 3F07 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 3F0A _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 3F14 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 3F17 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 3F1D _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 3F20 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 3F23 _ 89. 90, 0000009C
        sub     esp, 12                                 ; 3F29 _ 83. EC, 0C
        push    ?_422                                   ; 3F2C _ 68, 000000C4(d)
        call    cons_putstr                             ; 3F31 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 3F36 _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 3F39 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 3F3C _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 3F42 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 3F45 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 3F48 _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 3F4E _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 3F51 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 3F5B _ 8B. 45, F4
        add     eax, 48                                 ; 3F5E _ 83. C0, 30
        leave                                           ; 3F61 _ C9
        ret                                             ; 3F62 _ C3
; intHandlerForException End of function

memman_init:; Function begin
        push    ebp                                     ; 3F63 _ 55
        mov     ebp, esp                                ; 3F64 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3F66 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 3F69 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 3F6F _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3F72 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 3F79 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 3F7C _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 3F83 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 3F86 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 3F8D _ 5D
        ret                                             ; 3F8E _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 3F8F _ 55
        mov     ebp, esp                                ; 3F90 _ 89. E5
        sub     esp, 16                                 ; 3F92 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3F95 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 3F9C _ C7. 45, F8, 00000000
        jmp     ?_257                                   ; 3FA3 _ EB, 14

?_256:  mov     eax, dword [ebp+8H]                     ; 3FA5 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3FA8 _ 8B. 55, F8
        add     edx, 2                                  ; 3FAB _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3FAE _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 3FB2 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 3FB5 _ 83. 45, F8, 01
?_257:  mov     eax, dword [ebp+8H]                     ; 3FB9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3FBC _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3FBE _ 3B. 45, F8
        ja      ?_256                                   ; 3FC1 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 3FC3 _ 8B. 45, FC
        leave                                           ; 3FC6 _ C9
        ret                                             ; 3FC7 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 3FC8 _ 55
        mov     ebp, esp                                ; 3FC9 _ 89. E5
        push    ebx                                     ; 3FCB _ 53
        sub     esp, 16                                 ; 3FCC _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 3FCF _ C7. 45, F4, 00000000
        jmp     ?_263                                   ; 3FD6 _ E9, 000000BD

?_258:  mov     eax, dword [ebp+8H]                     ; 3FDB _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3FDE _ 8B. 55, F4
        add     edx, 2                                  ; 3FE1 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3FE4 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 3FE8 _ 3B. 45, 0C
        jc      ?_262                                   ; 3FEB _ 0F 82, 000000A3
        mov     eax, dword [ebp+8H]                     ; 3FF1 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3FF4 _ 8B. 55, F4
        add     edx, 2                                  ; 3FF7 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3FFA _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 3FFD _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 4000 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4003 _ 8B. 55, F4
        add     edx, 2                                  ; 4006 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 4009 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 400C _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 400F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4012 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4015 _ 8B. 55, F4
        add     edx, 2                                  ; 4018 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 401B _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 401E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4021 _ 8B. 55, F4
        add     edx, 2                                  ; 4024 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4027 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 402B _ 2B. 45, 0C
        mov     edx, eax                                ; 402E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4030 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 4033 _ 8B. 4D, F4
        add     ecx, 2                                  ; 4036 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 4039 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 403D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4040 _ 8B. 55, F4
        add     edx, 2                                  ; 4043 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4046 _ 8B. 44 D0, 04
        test    eax, eax                                ; 404A _ 85. C0
        jnz     ?_261                                   ; 404C _ 75, 41
        mov     eax, dword [ebp+8H]                     ; 404E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4051 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4053 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4056 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 4059 _ 89. 10
        jmp     ?_260                                   ; 405B _ EB, 28

?_259:  mov     eax, dword [ebp-0CH]                    ; 405D _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 4060 _ 8D. 50, 01
        mov     ecx, dword [ebp+8H]                     ; 4063 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 4066 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 4069 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 406C _ 8B. 45, 08
        add     edx, 2                                  ; 406F _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 4072 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 4075 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 4077 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 407A _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 407D _ 89. 54 D9, 04
        add     dword [ebp-0CH], 1                      ; 4081 _ 83. 45, F4, 01
?_260:  mov     eax, dword [ebp+8H]                     ; 4085 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4088 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 408A _ 3B. 45, F4
        ja      ?_259                                   ; 408D _ 77, CE
?_261:  mov     eax, dword [ebp-8H]                     ; 408F _ 8B. 45, F8
        jmp     ?_264                                   ; 4092 _ EB, 17

?_262:  add     dword [ebp-0CH], 1                      ; 4094 _ 83. 45, F4, 01
?_263:  mov     eax, dword [ebp+8H]                     ; 4098 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 409B _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 409D _ 3B. 45, F4
        ja      ?_258                                   ; 40A0 _ 0F 87, FFFFFF35
        mov     eax, 0                                  ; 40A6 _ B8, 00000000
?_264:  add     esp, 16                                 ; 40AB _ 83. C4, 10
        pop     ebx                                     ; 40AE _ 5B
        pop     ebp                                     ; 40AF _ 5D
        ret                                             ; 40B0 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 40B1 _ 55
        mov     ebp, esp                                ; 40B2 _ 89. E5
        push    ebx                                     ; 40B4 _ 53
        sub     esp, 16                                 ; 40B5 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 40B8 _ C7. 45, F4, 00000000
        jmp     ?_267                                   ; 40BF _ EB, 17

?_265:  mov     eax, dword [ebp+8H]                     ; 40C1 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 40C4 _ 8B. 55, F4
        add     edx, 2                                  ; 40C7 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 40CA _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 40CD _ 3B. 45, 0C
        jbe     ?_266                                   ; 40D0 _ 76, 02
        jmp     ?_268                                   ; 40D2 _ EB, 0E

?_266:  add     dword [ebp-0CH], 1                      ; 40D4 _ 83. 45, F4, 01
?_267:  mov     eax, dword [ebp+8H]                     ; 40D8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 40DB _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 40DD _ 3B. 45, F4
        jg      ?_265                                   ; 40E0 _ 7F, DF
?_268:  cmp     dword [ebp-0CH], 0                      ; 40E2 _ 83. 7D, F4, 00
        jle     ?_272                                   ; 40E6 _ 0F 8E, 000000F2
        mov     eax, dword [ebp-0CH]                    ; 40EC _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 40EF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 40F2 _ 8B. 45, 08
        add     edx, 2                                  ; 40F5 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 40F8 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 40FB _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 40FE _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 4101 _ 8B. 45, 08
        add     ecx, 2                                  ; 4104 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 4107 _ 8B. 44 C8, 04
        add     eax, edx                                ; 410B _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 410D _ 3B. 45, 0C
        jne     ?_272                                   ; 4110 _ 0F 85, 000000C8
        mov     eax, dword [ebp-0CH]                    ; 4116 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 4119 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 411C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 411F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4122 _ 8B. 45, 08
        add     edx, 2                                  ; 4125 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 4128 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 412C _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 412F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4132 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 4135 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 4138 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 413C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 413F _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4141 _ 3B. 45, F4
        jle     ?_271                                   ; 4144 _ 0F 8E, 0000008A
        mov     edx, dword [ebp+0CH]                    ; 414A _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 414D _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 4150 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4153 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4156 _ 8B. 55, F4
        add     edx, 2                                  ; 4159 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 415C _ 8B. 04 D0
        cmp     ecx, eax                                ; 415F _ 39. C1
        jnz     ?_271                                   ; 4161 _ 75, 71
        mov     eax, dword [ebp-0CH]                    ; 4163 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 4166 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 4169 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 416C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 416F _ 8B. 45, 08
        add     edx, 2                                  ; 4172 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 4175 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 4179 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 417C _ 8B. 4D, F4
        add     ecx, 2                                  ; 417F _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 4182 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 4186 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4189 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 418C _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 418F _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 4193 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4196 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4198 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 419B _ 8B. 45, 08
        mov     dword [eax], edx                        ; 419E _ 89. 10
        jmp     ?_270                                   ; 41A0 _ EB, 28

?_269:  mov     eax, dword [ebp-0CH]                    ; 41A2 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 41A5 _ 8D. 50, 01
        mov     ecx, dword [ebp+8H]                     ; 41A8 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 41AB _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 41AE _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 41B1 _ 8B. 45, 08
        add     edx, 2                                  ; 41B4 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 41B7 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 41BA _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 41BC _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 41BF _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 41C2 _ 89. 54 D9, 04
        add     dword [ebp-0CH], 1                      ; 41C6 _ 83. 45, F4, 01
?_270:  mov     eax, dword [ebp+8H]                     ; 41CA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 41CD _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 41CF _ 3B. 45, F4
        jg      ?_269                                   ; 41D2 _ 7F, CE
?_271:  mov     eax, 0                                  ; 41D4 _ B8, 00000000
        jmp     ?_278                                   ; 41D9 _ E9, 0000011C

?_272:  mov     eax, dword [ebp+8H]                     ; 41DE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 41E1 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 41E3 _ 3B. 45, F4
        jle     ?_273                                   ; 41E6 _ 7E, 52
        mov     edx, dword [ebp+0CH]                    ; 41E8 _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 41EB _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 41EE _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 41F1 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 41F4 _ 8B. 55, F4
        add     edx, 2                                  ; 41F7 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 41FA _ 8B. 04 D0
        cmp     ecx, eax                                ; 41FD _ 39. C1
        jnz     ?_273                                   ; 41FF _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 4201 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4204 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 4207 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 420A _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 420D _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 4210 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4213 _ 8B. 55, F4
        add     edx, 2                                  ; 4216 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 4219 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 421D _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 4220 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4223 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4226 _ 8B. 55, F4
        add     edx, 2                                  ; 4229 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 422C _ 89. 4C D0, 04
        mov     eax, 0                                  ; 4230 _ B8, 00000000
        jmp     ?_278                                   ; 4235 _ E9, 000000C0

?_273:  mov     eax, dword [ebp+8H]                     ; 423A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 423D _ 8B. 00
        cmp     eax, 4095                               ; 423F _ 3D, 00000FFF
        jg      ?_277                                   ; 4244 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 424A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 424D _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 424F _ 89. 45, F8
        jmp     ?_275                                   ; 4252 _ EB, 28

?_274:  mov     eax, dword [ebp-8H]                     ; 4254 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 4257 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 425A _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 425D _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 4260 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 4263 _ 8B. 45, 08
        add     edx, 2                                  ; 4266 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 4269 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 426C _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 426E _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 4271 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 4274 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 4278 _ 83. 6D, F8, 01
?_275:  mov     eax, dword [ebp-8H]                     ; 427C _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 427F _ 3B. 45, F4
        jg      ?_274                                   ; 4282 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 4284 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4287 _ 8B. 00
        lea     edx, [eax+1H]                           ; 4289 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 428C _ 8B. 45, 08
        mov     dword [eax], edx                        ; 428F _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4291 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 4294 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 4297 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 429A _ 8B. 00
        cmp     edx, eax                                ; 429C _ 39. C2
        jge     ?_276                                   ; 429E _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 42A0 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 42A3 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 42A5 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 42A8 _ 89. 50, 04
?_276:  mov     eax, dword [ebp+8H]                     ; 42AB _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 42AE _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 42B1 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 42B4 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 42B7 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 42BA _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 42BD _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 42C0 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 42C3 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 42C6 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 42CA _ B8, 00000000
        jmp     ?_278                                   ; 42CF _ EB, 29

?_277:  mov     eax, dword [ebp+8H]                     ; 42D1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 42D4 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 42D7 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 42DA _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 42DD _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 42E0 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 42E3 _ 8B. 40, 08
        mov     edx, eax                                ; 42E6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 42E8 _ 8B. 45, 10
        add     eax, edx                                ; 42EB _ 01. D0
        mov     edx, eax                                ; 42ED _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 42EF _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 42F2 _ 89. 50, 08
        mov     eax, 4294967295                         ; 42F5 _ B8, FFFFFFFF
?_278:  add     esp, 16                                 ; 42FA _ 83. C4, 10
        pop     ebx                                     ; 42FD _ 5B
        pop     ebp                                     ; 42FE _ 5D
        ret                                             ; 42FF _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 4300 _ 55
        mov     ebp, esp                                ; 4301 _ 89. E5
        sub     esp, 16                                 ; 4303 _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 4306 _ 8B. 45, 0C
        add     eax, 4095                               ; 4309 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 430E _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 4313 _ 89. 45, 0C
        push    dword [ebp+0CH]                         ; 4316 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 4319 _ FF. 75, 08
        call    memman_alloc                            ; 431C _ E8, FFFFFFFC(rel)
        add     esp, 8                                  ; 4321 _ 83. C4, 08
        mov     dword [ebp-4H], eax                     ; 4324 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4327 _ 8B. 45, FC
        leave                                           ; 432A _ C9
        ret                                             ; 432B _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 432C _ 55
        mov     ebp, esp                                ; 432D _ 89. E5
        sub     esp, 16                                 ; 432F _ 83. EC, 10
        mov     eax, dword [ebp+10H]                    ; 4332 _ 8B. 45, 10
        add     eax, 4095                               ; 4335 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 433A _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 433F _ 89. 45, 10
        push    dword [ebp+10H]                         ; 4342 _ FF. 75, 10
        push    dword [ebp+0CH]                         ; 4345 _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 4348 _ FF. 75, 08
        call    memman_free                             ; 434B _ E8, FFFFFFFC(rel)
        add     esp, 12                                 ; 4350 _ 83. C4, 0C
        mov     dword [ebp-4H], eax                     ; 4353 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4356 _ 8B. 45, FC
        leave                                           ; 4359 _ C9
        ret                                             ; 435A _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 435B _ 55
        mov     ebp, esp                                ; 435C _ 89. E5
        sub     esp, 24                                 ; 435E _ 83. EC, 18
        sub     esp, 8                                  ; 4361 _ 83. EC, 08
        push    9232                                    ; 4364 _ 68, 00002410
        push    dword [ebp+8H]                          ; 4369 _ FF. 75, 08
        call    memman_alloc_4k                         ; 436C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4371 _ 83. C4, 10
        mov     dword [ebp-0CH], eax                    ; 4374 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 4377 _ 83. 7D, F4, 00
        jnz     ?_279                                   ; 437B _ 75, 0A
        mov     eax, 0                                  ; 437D _ B8, 00000000
        jmp     ?_283                                   ; 4382 _ E9, 000000BF

?_279:  mov     eax, dword [ebp+10H]                    ; 4387 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 438A _ 0F AF. 45, 14
        sub     esp, 8                                  ; 438E _ 83. EC, 08
        push    eax                                     ; 4391 _ 50
        push    dword [ebp+8H]                          ; 4392 _ FF. 75, 08
        call    memman_alloc_4k                         ; 4395 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 439A _ 83. C4, 10
        mov     edx, eax                                ; 439D _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 439F _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 43A2 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 43A5 _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 43A8 _ 8B. 40, 04
        test    eax, eax                                ; 43AB _ 85. C0
        jnz     ?_280                                   ; 43AD _ 75, 1E
        mov     eax, dword [ebp-0CH]                    ; 43AF _ 8B. 45, F4
        sub     esp, 4                                  ; 43B2 _ 83. EC, 04
        push    9232                                    ; 43B5 _ 68, 00002410
        push    eax                                     ; 43BA _ 50
        push    dword [ebp+8H]                          ; 43BB _ FF. 75, 08
        call    memman_free_4k                          ; 43BE _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 43C3 _ 83. C4, 10
        mov     eax, 0                                  ; 43C6 _ B8, 00000000
        jmp     ?_283                                   ; 43CB _ EB, 79

?_280:  mov     eax, dword [ebp-0CH]                    ; 43CD _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 43D0 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 43D3 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 43D5 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 43D8 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 43DB _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 43DE _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 43E1 _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 43E4 _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 43E7 _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 43EA _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 43F1 _ C7. 45, F0, 00000000
        jmp     ?_282                                   ; 43F8 _ EB, 40

?_281:  mov     ecx, dword [ebp-0CH]                    ; 43FA _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 43FD _ 8B. 55, F0
        mov     eax, edx                                ; 4400 _ 89. D0
        shl     eax, 3                                  ; 4402 _ C1. E0, 03
        add     eax, edx                                ; 4405 _ 01. D0
        shl     eax, 2                                  ; 4407 _ C1. E0, 02
        add     eax, ecx                                ; 440A _ 01. C8
        add     eax, 1056                               ; 440C _ 05, 00000420
        mov     dword [eax+10H], 0                      ; 4411 _ C7. 40, 10, 00000000
        mov     ecx, dword [ebp-0CH]                    ; 4418 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 441B _ 8B. 55, F0
        mov     eax, edx                                ; 441E _ 89. D0
        shl     eax, 3                                  ; 4420 _ C1. E0, 03
        add     eax, edx                                ; 4423 _ 01. D0
        shl     eax, 2                                  ; 4425 _ C1. E0, 02
        add     eax, ecx                                ; 4428 _ 01. C8
        add     eax, 1072                               ; 442A _ 05, 00000430
        mov     dword [eax+4H], 0                       ; 442F _ C7. 40, 04, 00000000
        add     dword [ebp-10H], 1                      ; 4436 _ 83. 45, F0, 01
?_282:  cmp     dword [ebp-10H], 255                    ; 443A _ 81. 7D, F0, 000000FF
        jle     ?_281                                   ; 4441 _ 7E, B7
        mov     eax, dword [ebp-0CH]                    ; 4443 _ 8B. 45, F4
?_283:  leave                                           ; 4446 _ C9
        ret                                             ; 4447 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 4448 _ 55
        mov     ebp, esp                                ; 4449 _ 89. E5
        sub     esp, 24                                 ; 444B _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 444E _ C7. 45, F0, 00000000
        jmp     ?_286                                   ; 4455 _ EB, 66

?_284:  mov     ecx, dword [ebp+8H]                     ; 4457 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 445A _ 8B. 55, F0
        mov     eax, edx                                ; 445D _ 89. D0
        shl     eax, 3                                  ; 445F _ C1. E0, 03
        add     eax, edx                                ; 4462 _ 01. D0
        shl     eax, 2                                  ; 4464 _ C1. E0, 02
        add     eax, ecx                                ; 4467 _ 01. C8
        add     eax, 1056                               ; 4469 _ 05, 00000420
        mov     eax, dword [eax+10H]                    ; 446E _ 8B. 40, 10
        test    eax, eax                                ; 4471 _ 85. C0
        jnz     ?_285                                   ; 4473 _ 75, 44
        mov     edx, dword [ebp-10H]                    ; 4475 _ 8B. 55, F0
        mov     eax, edx                                ; 4478 _ 89. D0
        shl     eax, 3                                  ; 447A _ C1. E0, 03
        add     eax, edx                                ; 447D _ 01. D0
        shl     eax, 2                                  ; 447F _ C1. E0, 02
        lea     edx, [eax+410H]                         ; 4482 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 4488 _ 8B. 45, 08
        add     eax, edx                                ; 448B _ 01. D0
        add     eax, 4                                  ; 448D _ 83. C0, 04
        mov     dword [ebp-0CH], eax                    ; 4490 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4493 _ 8B. 45, F4
        mov     dword [eax+1CH], 1                      ; 4496 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-0CH]                    ; 449D _ 8B. 45, F4
        mov     dword [eax+18H], -1                     ; 44A0 _ C7. 40, 18, FFFFFFFF
        call    task_now                                ; 44A7 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 44AC _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 44AE _ 8B. 45, F4
        mov     dword [eax+20H], edx                    ; 44B1 _ 89. 50, 20
        mov     eax, dword [ebp-0CH]                    ; 44B4 _ 8B. 45, F4
        jmp     ?_287                                   ; 44B7 _ EB, 12

?_285:  add     dword [ebp-10H], 1                      ; 44B9 _ 83. 45, F0, 01
?_286:  cmp     dword [ebp-10H], 255                    ; 44BD _ 81. 7D, F0, 000000FF
        jle     ?_284                                   ; 44C4 _ 7E, 91
        mov     eax, 0                                  ; 44C6 _ B8, 00000000
?_287:  leave                                           ; 44CB _ C9
        ret                                             ; 44CC _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 44CD _ 55
        mov     ebp, esp                                ; 44CE _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 44D0 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 44D3 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 44D6 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 44D8 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 44DB _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 44DE _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 44E1 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 44E4 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 44E7 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 44EA _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 44ED _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 44F0 _ 89. 50, 14
        nop                                             ; 44F3 _ 90
        pop     ebp                                     ; 44F4 _ 5D
        ret                                             ; 44F5 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 44F6 _ 55
        mov     ebp, esp                                ; 44F7 _ 89. E5
        push    esi                                     ; 44F9 _ 56
        push    ebx                                     ; 44FA _ 53
        sub     esp, 16                                 ; 44FB _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 44FE _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4501 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 4504 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 4507 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 450A _ 8B. 40, 10
        add     eax, 1                                  ; 450D _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 4510 _ 3B. 45, 10
        jge     ?_288                                   ; 4513 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 4515 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4518 _ 8B. 40, 10
        add     eax, 1                                  ; 451B _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 451E _ 89. 45, 10
?_288:  cmp     dword [ebp+10H], -1                     ; 4521 _ 83. 7D, 10, FF
        jge     ?_289                                   ; 4525 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 4527 _ C7. 45, 10, FFFFFFFF
?_289:  mov     eax, dword [ebp+0CH]                    ; 452E _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 4531 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 4534 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 4537 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 453A _ 3B. 45, 10
        jle     ?_296                                   ; 453D _ 0F 8E, 000001D5
        cmp     dword [ebp+10H], 0                      ; 4543 _ 83. 7D, 10, 00
        js      ?_292                                   ; 4547 _ 0F 88, 000000E2
        mov     eax, dword [ebp-0CH]                    ; 454D _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 4550 _ 89. 45, F0
        jmp     ?_291                                   ; 4553 _ EB, 34

?_290:  mov     eax, dword [ebp-10H]                    ; 4555 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 4558 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 455B _ 8B. 45, 08
        add     edx, 4                                  ; 455E _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4561 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4565 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 4568 _ 8B. 4D, F0
        add     ecx, 4                                  ; 456B _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 456E _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4572 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 4575 _ 8B. 55, F0
        add     edx, 4                                  ; 4578 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 457B _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 457F _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 4582 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 4585 _ 83. 6D, F0, 01
?_291:  mov     eax, dword [ebp-10H]                    ; 4589 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 458C _ 3B. 45, 10
        jg      ?_290                                   ; 458F _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 4591 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4594 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 4597 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 459A _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 459D _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 45A1 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 45A4 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 45A7 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 45AA _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 45AD _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 45B0 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 45B3 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 45B6 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 45B9 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 45BC _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 45BF _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 45C2 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 45C5 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 45C8 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 45CB _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 45CE _ 8B. 40, 0C
        sub     esp, 8                                  ; 45D1 _ 83. EC, 08
        push    esi                                     ; 45D4 _ 56
        push    ebx                                     ; 45D5 _ 53
        push    ecx                                     ; 45D6 _ 51
        push    edx                                     ; 45D7 _ 52
        push    eax                                     ; 45D8 _ 50
        push    dword [ebp+8H]                          ; 45D9 _ FF. 75, 08
        call    sheet_refreshmap                        ; 45DC _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 45E1 _ 83. C4, 20
        mov     eax, dword [ebp+10H]                    ; 45E4 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 45E7 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 45EA _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 45ED _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 45F0 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 45F3 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 45F6 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 45F9 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 45FC _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 45FF _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4602 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4605 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4608 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 460B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 460E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4611 _ 8B. 40, 0C
        sub     esp, 4                                  ; 4614 _ 83. EC, 04
        push    dword [ebp-0CH]                         ; 4617 _ FF. 75, F4
        push    esi                                     ; 461A _ 56
        push    ebx                                     ; 461B _ 53
        push    ecx                                     ; 461C _ 51
        push    edx                                     ; 461D _ 52
        push    eax                                     ; 461E _ 50
        push    dword [ebp+8H]                          ; 461F _ FF. 75, 08
        call    sheet_refreshsub                        ; 4622 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4627 _ 83. C4, 20
        jmp     ?_303                                   ; 462A _ E9, 0000023E

?_292:  mov     eax, dword [ebp+8H]                     ; 462F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4632 _ 8B. 40, 10
        cmp     eax, dword [ebp-0CH]                    ; 4635 _ 3B. 45, F4
        jle     ?_295                                   ; 4638 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 463A _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 463D _ 89. 45, F0
        jmp     ?_294                                   ; 4640 _ EB, 34

?_293:  mov     eax, dword [ebp-10H]                    ; 4642 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 4645 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4648 _ 8B. 45, 08
        add     edx, 4                                  ; 464B _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 464E _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4652 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 4655 _ 8B. 4D, F0
        add     ecx, 4                                  ; 4658 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 465B _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 465F _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 4662 _ 8B. 55, F0
        add     edx, 4                                  ; 4665 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4668 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 466C _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 466F _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 4672 _ 83. 45, F0, 01
?_294:  mov     eax, dword [ebp+8H]                     ; 4676 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4679 _ 8B. 40, 10
        cmp     eax, dword [ebp-10H]                    ; 467C _ 3B. 45, F0
        jg      ?_293                                   ; 467F _ 7F, C1
?_295:  mov     eax, dword [ebp+8H]                     ; 4681 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4684 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 4687 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 468A _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 468D _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4690 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4693 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4696 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4699 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 469C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 469F _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 46A2 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 46A5 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 46A8 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 46AB _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 46AE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 46B1 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 46B4 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 46B7 _ 8B. 40, 0C
        sub     esp, 8                                  ; 46BA _ 83. EC, 08
        push    0                                       ; 46BD _ 6A, 00
        push    ebx                                     ; 46BF _ 53
        push    ecx                                     ; 46C0 _ 51
        push    edx                                     ; 46C1 _ 52
        push    eax                                     ; 46C2 _ 50
        push    dword [ebp+8H]                          ; 46C3 _ FF. 75, 08
        call    sheet_refreshmap                        ; 46C6 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 46CB _ 83. C4, 20
        mov     eax, dword [ebp-0CH]                    ; 46CE _ 8B. 45, F4
        lea     esi, [eax-1H]                           ; 46D1 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 46D4 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 46D7 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 46DA _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 46DD _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 46E0 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 46E3 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 46E6 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 46E9 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 46EC _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 46EF _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 46F2 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 46F5 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 46F8 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 46FB _ 8B. 40, 0C
        sub     esp, 4                                  ; 46FE _ 83. EC, 04
        push    esi                                     ; 4701 _ 56
        push    0                                       ; 4702 _ 6A, 00
        push    ebx                                     ; 4704 _ 53
        push    ecx                                     ; 4705 _ 51
        push    edx                                     ; 4706 _ 52
        push    eax                                     ; 4707 _ 50
        push    dword [ebp+8H]                          ; 4708 _ FF. 75, 08
        call    sheet_refreshsub                        ; 470B _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4710 _ 83. C4, 20
        jmp     ?_303                                   ; 4713 _ E9, 00000155

?_296:  mov     eax, dword [ebp-0CH]                    ; 4718 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 471B _ 3B. 45, 10
        jge     ?_303                                   ; 471E _ 0F 8D, 00000149
        cmp     dword [ebp-0CH], 0                      ; 4724 _ 83. 7D, F4, 00
        js      ?_299                                   ; 4728 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 472A _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 472D _ 89. 45, F0
        jmp     ?_298                                   ; 4730 _ EB, 34

?_297:  mov     eax, dword [ebp-10H]                    ; 4732 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 4735 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4738 _ 8B. 45, 08
        add     edx, 4                                  ; 473B _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 473E _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4742 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 4745 _ 8B. 4D, F0
        add     ecx, 4                                  ; 4748 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 474B _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 474F _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 4752 _ 8B. 55, F0
        add     edx, 4                                  ; 4755 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4758 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 475C _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 475F _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 4762 _ 83. 45, F0, 01
?_298:  mov     eax, dword [ebp-10H]                    ; 4766 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 4769 _ 3B. 45, 10
        jl      ?_297                                   ; 476C _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 476E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4771 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 4774 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 4777 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 477A _ 89. 54 88, 04
        jmp     ?_302                                   ; 477E _ EB, 6C

?_299:  mov     eax, dword [ebp+8H]                     ; 4780 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4783 _ 8B. 40, 10
        mov     dword [ebp-10H], eax                    ; 4786 _ 89. 45, F0
        jmp     ?_301                                   ; 4789 _ EB, 3A

?_300:  mov     eax, dword [ebp-10H]                    ; 478B _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 478E _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 4791 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 4794 _ 8B. 55, F0
        add     edx, 4                                  ; 4797 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 479A _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 479E _ 8B. 45, 08
        add     ecx, 4                                  ; 47A1 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 47A4 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 47A8 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 47AB _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 47AE _ 8B. 45, 08
        add     edx, 4                                  ; 47B1 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 47B4 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 47B8 _ 8B. 55, F0
        add     edx, 1                                  ; 47BB _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 47BE _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 47C1 _ 83. 6D, F0, 01
?_301:  mov     eax, dword [ebp-10H]                    ; 47C5 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 47C8 _ 3B. 45, 10
        jge     ?_300                                   ; 47CB _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 47CD _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 47D0 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 47D3 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 47D6 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 47D9 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 47DD _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 47E0 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 47E3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 47E6 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 47E9 _ 89. 50, 10
?_302:  mov     eax, dword [ebp+0CH]                    ; 47EC _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 47EF _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 47F2 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 47F5 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 47F8 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 47FB _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 47FE _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4801 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4804 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4807 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 480A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 480D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4810 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4813 _ 8B. 40, 0C
        sub     esp, 8                                  ; 4816 _ 83. EC, 08
        push    dword [ebp+10H]                         ; 4819 _ FF. 75, 10
        push    ebx                                     ; 481C _ 53
        push    ecx                                     ; 481D _ 51
        push    edx                                     ; 481E _ 52
        push    eax                                     ; 481F _ 50
        push    dword [ebp+8H]                          ; 4820 _ FF. 75, 08
        call    sheet_refreshmap                        ; 4823 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 4828 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 482B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 482E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4831 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4834 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4837 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 483A _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 483D _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4840 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4843 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4846 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4849 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 484C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 484F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4852 _ 8B. 40, 0C
        sub     esp, 4                                  ; 4855 _ 83. EC, 04
        push    dword [ebp+10H]                         ; 4858 _ FF. 75, 10
        push    dword [ebp+10H]                         ; 485B _ FF. 75, 10
        push    ebx                                     ; 485E _ 53
        push    ecx                                     ; 485F _ 51
        push    edx                                     ; 4860 _ 52
        push    eax                                     ; 4861 _ 50
        push    dword [ebp+8H]                          ; 4862 _ FF. 75, 08
        call    sheet_refreshsub                        ; 4865 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 486A _ 83. C4, 20
?_303:  lea     esp, [ebp-8H]                           ; 486D _ 8D. 65, F8
        pop     ebx                                     ; 4870 _ 5B
        pop     esi                                     ; 4871 _ 5E
        pop     ebp                                     ; 4872 _ 5D
        ret                                             ; 4873 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 4874 _ 55
        mov     ebp, esp                                ; 4875 _ 89. E5
        push    edi                                     ; 4877 _ 57
        push    esi                                     ; 4878 _ 56
        push    ebx                                     ; 4879 _ 53
        sub     esp, 28                                 ; 487A _ 83. EC, 1C
        mov     eax, dword [ebp+0CH]                    ; 487D _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4880 _ 8B. 40, 18
        test    eax, eax                                ; 4883 _ 85. C0
        js      ?_304                                   ; 4885 _ 78, 52
        mov     eax, dword [ebp+0CH]                    ; 4887 _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 488A _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 488D _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 4890 _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 4893 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4896 _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 4899 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 489C _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 489F _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 48A2 _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 48A5 _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 48A8 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 48AB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 48AE _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 48B1 _ 8B. 45, 14
        add     edx, eax                                ; 48B4 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 48B6 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 48B9 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 48BC _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 48BF _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 48C2 _ 03. 45, E4
        sub     esp, 4                                  ; 48C5 _ 83. EC, 04
        push    ebx                                     ; 48C8 _ 53
        push    ecx                                     ; 48C9 _ 51
        push    edi                                     ; 48CA _ 57
        push    esi                                     ; 48CB _ 56
        push    edx                                     ; 48CC _ 52
        push    eax                                     ; 48CD _ 50
        push    dword [ebp+8H]                          ; 48CE _ FF. 75, 08
        call    sheet_refreshsub                        ; 48D1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 48D6 _ 83. C4, 20
?_304:  mov     eax, 0                                  ; 48D9 _ B8, 00000000
        lea     esp, [ebp-0CH]                          ; 48DE _ 8D. 65, F4
        pop     ebx                                     ; 48E1 _ 5B
        pop     esi                                     ; 48E2 _ 5E
        pop     edi                                     ; 48E3 _ 5F
        pop     ebp                                     ; 48E4 _ 5D
        ret                                             ; 48E5 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 48E6 _ 55
        mov     ebp, esp                                ; 48E7 _ 89. E5
        push    esi                                     ; 48E9 _ 56
        push    ebx                                     ; 48EA _ 53
        sub     esp, 16                                 ; 48EB _ 83. EC, 10
        mov     eax, dword [ebp+0CH]                    ; 48EE _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 48F1 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 48F4 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 48F7 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 48FA _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 48FD _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 4900 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 4903 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 4906 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4909 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 490C _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 490F _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4912 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4915 _ 8B. 40, 18
        test    eax, eax                                ; 4918 _ 85. C0
        js      ?_305                                   ; 491A _ 0F 88, 000000D3
        mov     eax, dword [ebp+0CH]                    ; 4920 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 4923 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4926 _ 8B. 45, F4
        add     edx, eax                                ; 4929 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 492B _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 492E _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 4931 _ 8B. 45, F0
        add     eax, ecx                                ; 4934 _ 01. C8
        sub     esp, 8                                  ; 4936 _ 83. EC, 08
        push    0                                       ; 4939 _ 6A, 00
        push    edx                                     ; 493B _ 52
        push    eax                                     ; 493C _ 50
        push    dword [ebp-0CH]                         ; 493D _ FF. 75, F4
        push    dword [ebp-10H]                         ; 4940 _ FF. 75, F0
        push    dword [ebp+8H]                          ; 4943 _ FF. 75, 08
        call    sheet_refreshmap                        ; 4946 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 494B _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 494E _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4951 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 4954 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 4957 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 495A _ 8B. 55, 14
        add     ecx, edx                                ; 495D _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 495F _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 4962 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 4965 _ 8B. 55, 10
        add     edx, ebx                                ; 4968 _ 01. DA
        sub     esp, 8                                  ; 496A _ 83. EC, 08
        push    eax                                     ; 496D _ 50
        push    ecx                                     ; 496E _ 51
        push    edx                                     ; 496F _ 52
        push    dword [ebp+14H]                         ; 4970 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 4973 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 4976 _ FF. 75, 08
        call    sheet_refreshmap                        ; 4979 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 497E _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 4981 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4984 _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 4987 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 498A _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 498D _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4990 _ 8B. 45, F4
        add     edx, eax                                ; 4993 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4995 _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 4998 _ 8B. 58, 04
        mov     eax, dword [ebp-10H]                    ; 499B _ 8B. 45, F0
        add     eax, ebx                                ; 499E _ 01. D8
        sub     esp, 4                                  ; 49A0 _ 83. EC, 04
        push    ecx                                     ; 49A3 _ 51
        push    0                                       ; 49A4 _ 6A, 00
        push    edx                                     ; 49A6 _ 52
        push    eax                                     ; 49A7 _ 50
        push    dword [ebp-0CH]                         ; 49A8 _ FF. 75, F4
        push    dword [ebp-10H]                         ; 49AB _ FF. 75, F0
        push    dword [ebp+8H]                          ; 49AE _ FF. 75, 08
        call    sheet_refreshsub                        ; 49B1 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 49B6 _ 83. C4, 20
        mov     eax, dword [ebp+0CH]                    ; 49B9 _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 49BC _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 49BF _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 49C2 _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 49C5 _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 49C8 _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 49CB _ 8B. 4D, 14
        add     ebx, ecx                                ; 49CE _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 49D0 _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 49D3 _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 49D6 _ 8B. 4D, 10
        add     ecx, esi                                ; 49D9 _ 01. F1
        sub     esp, 4                                  ; 49DB _ 83. EC, 04
        push    edx                                     ; 49DE _ 52
        push    eax                                     ; 49DF _ 50
        push    ebx                                     ; 49E0 _ 53
        push    ecx                                     ; 49E1 _ 51
        push    dword [ebp+14H]                         ; 49E2 _ FF. 75, 14
        push    dword [ebp+10H]                         ; 49E5 _ FF. 75, 10
        push    dword [ebp+8H]                          ; 49E8 _ FF. 75, 08
        call    sheet_refreshsub                        ; 49EB _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 49F0 _ 83. C4, 20
?_305:  lea     esp, [ebp-8H]                           ; 49F3 _ 8D. 65, F8
        pop     ebx                                     ; 49F6 _ 5B
        pop     esi                                     ; 49F7 _ 5E
        pop     ebp                                     ; 49F8 _ 5D
        ret                                             ; 49F9 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 49FA _ 55
        mov     ebp, esp                                ; 49FB _ 89. E5
        sub     esp, 64                                 ; 49FD _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 4A00 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4A03 _ 8B. 00
        mov     dword [ebp-20H], eax                    ; 4A05 _ 89. 45, E0
        mov     eax, dword [ebp+8H]                     ; 4A08 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4A0B _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 4A0E _ 89. 45, E4
        cmp     dword [ebp+0CH], 0                      ; 4A11 _ 83. 7D, 0C, 00
        jns     ?_306                                   ; 4A15 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 4A17 _ C7. 45, 0C, 00000000
?_306:  cmp     dword [ebp+10H], 8                      ; 4A1E _ 83. 7D, 10, 08
        jg      ?_307                                   ; 4A22 _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 4A24 _ C7. 45, 10, 00000000
?_307:  mov     eax, dword [ebp+8H]                     ; 4A2B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4A2E _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 4A31 _ 3B. 45, 14
        jge     ?_308                                   ; 4A34 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4A36 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4A39 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 4A3C _ 89. 45, 14
?_308:  mov     eax, dword [ebp+8H]                     ; 4A3F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4A42 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 4A45 _ 3B. 45, 18
        jge     ?_309                                   ; 4A48 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4A4A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4A4D _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 4A50 _ 89. 45, 18
?_309:  mov     eax, dword [ebp+1CH]                    ; 4A53 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 4A56 _ 89. 45, CC
        jmp     ?_320                                   ; 4A59 _ E9, 0000015A

?_310:  mov     eax, dword [ebp+8H]                     ; 4A5E _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 4A61 _ 8B. 55, CC
        add     edx, 4                                  ; 4A64 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4A67 _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 4A6B _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 4A6E _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 4A71 _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 4A73 _ 89. 45, EC
        mov     eax, dword [ebp-18H]                    ; 4A76 _ 8B. 45, E8
        mov     edx, dword [ebp+8H]                     ; 4A79 _ 8B. 55, 08
        add     edx, 1044                               ; 4A7C _ 81. C2, 00000414
        sub     eax, edx                                ; 4A82 _ 29. D0
        sar     eax, 2                                  ; 4A84 _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 4A87 _ 69. C0, 38E38E39
        mov     byte [ebp-35H], al                      ; 4A8D _ 88. 45, CB
        mov     eax, dword [ebp-18H]                    ; 4A90 _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 4A93 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 4A96 _ 8B. 55, 0C
        sub     edx, eax                                ; 4A99 _ 29. C2
        mov     eax, edx                                ; 4A9B _ 89. D0
        mov     dword [ebp-10H], eax                    ; 4A9D _ 89. 45, F0
        mov     eax, dword [ebp-18H]                    ; 4AA0 _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 4AA3 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 4AA6 _ 8B. 55, 10
        sub     edx, eax                                ; 4AA9 _ 29. C2
        mov     eax, edx                                ; 4AAB _ 89. D0
        mov     dword [ebp-0CH], eax                    ; 4AAD _ 89. 45, F4
        mov     eax, dword [ebp-18H]                    ; 4AB0 _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 4AB3 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 4AB6 _ 8B. 55, 14
        sub     edx, eax                                ; 4AB9 _ 29. C2
        mov     eax, edx                                ; 4ABB _ 89. D0
        mov     dword [ebp-28H], eax                    ; 4ABD _ 89. 45, D8
        mov     eax, dword [ebp-18H]                    ; 4AC0 _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 4AC3 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 4AC6 _ 8B. 55, 18
        sub     edx, eax                                ; 4AC9 _ 29. C2
        mov     eax, edx                                ; 4ACB _ 89. D0
        mov     dword [ebp-24H], eax                    ; 4ACD _ 89. 45, DC
        cmp     dword [ebp-10H], 0                      ; 4AD0 _ 83. 7D, F0, 00
        jns     ?_311                                   ; 4AD4 _ 79, 07
        mov     dword [ebp-10H], 0                      ; 4AD6 _ C7. 45, F0, 00000000
?_311:  cmp     dword [ebp-0CH], 0                      ; 4ADD _ 83. 7D, F4, 00
        jns     ?_312                                   ; 4AE1 _ 79, 07
        mov     dword [ebp-0CH], 0                      ; 4AE3 _ C7. 45, F4, 00000000
?_312:  mov     eax, dword [ebp-18H]                    ; 4AEA _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 4AED _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 4AF0 _ 3B. 45, D8
        jge     ?_313                                   ; 4AF3 _ 7D, 09
        mov     eax, dword [ebp-18H]                    ; 4AF5 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 4AF8 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 4AFB _ 89. 45, D8
?_313:  mov     eax, dword [ebp-18H]                    ; 4AFE _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 4B01 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 4B04 _ 3B. 45, DC
        jge     ?_314                                   ; 4B07 _ 7D, 09
        mov     eax, dword [ebp-18H]                    ; 4B09 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 4B0C _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 4B0F _ 89. 45, DC
?_314:  mov     dword [ebp-2CH], 0                      ; 4B12 _ C7. 45, D4, 00000000
        jmp     ?_319                                   ; 4B19 _ E9, 0000008A

?_315:  mov     eax, dword [ebp-18H]                    ; 4B1E _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 4B21 _ 8B. 50, 10
        mov     eax, dword [ebp-2CH]                    ; 4B24 _ 8B. 45, D4
        add     eax, edx                                ; 4B27 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4B29 _ 89. 45, F8
        mov     dword [ebp-30H], 0                      ; 4B2C _ C7. 45, D0, 00000000
        jmp     ?_318                                   ; 4B33 _ EB, 67

?_316:  mov     eax, dword [ebp-18H]                    ; 4B35 _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 4B38 _ 8B. 50, 0C
        mov     eax, dword [ebp-30H]                    ; 4B3B _ 8B. 45, D0
        add     eax, edx                                ; 4B3E _ 01. D0
        mov     dword [ebp-4H], eax                     ; 4B40 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 4B43 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4B46 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 4B49 _ 0F AF. 45, F8
        mov     edx, eax                                ; 4B4D _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4B4F _ 8B. 45, FC
        add     eax, edx                                ; 4B52 _ 01. D0
        mov     edx, eax                                ; 4B54 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 4B56 _ 8B. 45, E4
        add     eax, edx                                ; 4B59 _ 01. D0
        movzx   eax, byte [eax]                         ; 4B5B _ 0F B6. 00
        cmp     al, byte [ebp-35H]                      ; 4B5E _ 3A. 45, CB
        jnz     ?_317                                   ; 4B61 _ 75, 35
        mov     eax, dword [ebp+8H]                     ; 4B63 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4B66 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 4B69 _ 0F AF. 45, F8
        mov     edx, eax                                ; 4B6D _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4B6F _ 8B. 45, FC
        add     eax, edx                                ; 4B72 _ 01. D0
        mov     edx, eax                                ; 4B74 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 4B76 _ 8B. 45, E0
        add     edx, eax                                ; 4B79 _ 01. C2
        mov     eax, dword [ebp-18H]                    ; 4B7B _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 4B7E _ 8B. 40, 04
        imul    eax, dword [ebp-2CH]                    ; 4B81 _ 0F AF. 45, D4
        mov     ecx, eax                                ; 4B85 _ 89. C1
        mov     eax, dword [ebp-30H]                    ; 4B87 _ 8B. 45, D0
        add     eax, ecx                                ; 4B8A _ 01. C8
        mov     ecx, eax                                ; 4B8C _ 89. C1
        mov     eax, dword [ebp-14H]                    ; 4B8E _ 8B. 45, EC
        add     eax, ecx                                ; 4B91 _ 01. C8
        movzx   eax, byte [eax]                         ; 4B93 _ 0F B6. 00
        mov     byte [edx], al                          ; 4B96 _ 88. 02
?_317:  add     dword [ebp-30H], 1                      ; 4B98 _ 83. 45, D0, 01
?_318:  mov     eax, dword [ebp-30H]                    ; 4B9C _ 8B. 45, D0
        cmp     eax, dword [ebp-28H]                    ; 4B9F _ 3B. 45, D8
        jl      ?_316                                   ; 4BA2 _ 7C, 91
        add     dword [ebp-2CH], 1                      ; 4BA4 _ 83. 45, D4, 01
?_319:  mov     eax, dword [ebp-2CH]                    ; 4BA8 _ 8B. 45, D4
        cmp     eax, dword [ebp-24H]                    ; 4BAB _ 3B. 45, DC
        jl      ?_315                                   ; 4BAE _ 0F 8C, FFFFFF6A
        add     dword [ebp-34H], 1                      ; 4BB4 _ 83. 45, CC, 01
?_320:  mov     eax, dword [ebp-34H]                    ; 4BB8 _ 8B. 45, CC
        cmp     eax, dword [ebp+20H]                    ; 4BBB _ 3B. 45, 20
        jle     ?_310                                   ; 4BBE _ 0F 8E, FFFFFE9A
        leave                                           ; 4BC4 _ C9
        ret                                             ; 4BC5 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 4BC6 _ 55
        mov     ebp, esp                                ; 4BC7 _ 89. E5
        sub     esp, 64                                 ; 4BC9 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 4BCC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4BCF _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 4BD2 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 4BD5 _ 83. 7D, 0C, 00
        jns     ?_321                                   ; 4BD9 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 4BDB _ C7. 45, 0C, 00000000
?_321:  cmp     dword [ebp+10H], 0                      ; 4BE2 _ 83. 7D, 10, 00
        jns     ?_322                                   ; 4BE6 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 4BE8 _ C7. 45, 10, 00000000
?_322:  mov     eax, dword [ebp+8H]                     ; 4BEF _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4BF2 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 4BF5 _ 3B. 45, 14
        jge     ?_323                                   ; 4BF8 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4BFA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4BFD _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 4C00 _ 89. 45, 14
?_323:  mov     eax, dword [ebp+8H]                     ; 4C03 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4C06 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 4C09 _ 3B. 45, 18
        jge     ?_324                                   ; 4C0C _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4C0E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4C11 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 4C14 _ 89. 45, 18
?_324:  mov     eax, dword [ebp+1CH]                    ; 4C17 _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 4C1A _ 89. 45, D0
        jmp     ?_335                                   ; 4C1D _ E9, 00000146

?_325:  mov     eax, dword [ebp+8H]                     ; 4C22 _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 4C25 _ 8B. 55, D0
        add     edx, 4                                  ; 4C28 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4C2B _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 4C2F _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 4C32 _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 4C35 _ 8B. 55, 08
        add     edx, 1044                               ; 4C38 _ 81. C2, 00000414
        sub     eax, edx                                ; 4C3E _ 29. D0
        sar     eax, 2                                  ; 4C40 _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 4C43 _ 69. C0, 38E38E39
        mov     byte [ebp-31H], al                      ; 4C49 _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 4C4C _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 4C4F _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 4C51 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 4C54 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4C57 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 4C5A _ 8B. 55, 0C
        sub     edx, eax                                ; 4C5D _ 29. C2
        mov     eax, edx                                ; 4C5F _ 89. D0
        mov     dword [ebp-24H], eax                    ; 4C61 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 4C64 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 4C67 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 4C6A _ 8B. 55, 10
        sub     edx, eax                                ; 4C6D _ 29. C2
        mov     eax, edx                                ; 4C6F _ 89. D0
        mov     dword [ebp-20H], eax                    ; 4C71 _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 4C74 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4C77 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 4C7A _ 8B. 55, 14
        sub     edx, eax                                ; 4C7D _ 29. C2
        mov     eax, edx                                ; 4C7F _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 4C81 _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 4C84 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 4C87 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 4C8A _ 8B. 55, 18
        sub     edx, eax                                ; 4C8D _ 29. C2
        mov     eax, edx                                ; 4C8F _ 89. D0
        mov     dword [ebp-18H], eax                    ; 4C91 _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 4C94 _ 83. 7D, DC, 00
        jns     ?_326                                   ; 4C98 _ 79, 07
        mov     dword [ebp-24H], 0                      ; 4C9A _ C7. 45, DC, 00000000
?_326:  cmp     dword [ebp-20H], 0                      ; 4CA1 _ 83. 7D, E0, 00
        jns     ?_327                                   ; 4CA5 _ 79, 07
        mov     dword [ebp-20H], 0                      ; 4CA7 _ C7. 45, E0, 00000000
?_327:  mov     eax, dword [ebp-10H]                    ; 4CAE _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4CB1 _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 4CB4 _ 3B. 45, E4
        jge     ?_328                                   ; 4CB7 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4CB9 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4CBC _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 4CBF _ 89. 45, E4
?_328:  mov     eax, dword [ebp-10H]                    ; 4CC2 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 4CC5 _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 4CC8 _ 3B. 45, E8
        jge     ?_329                                   ; 4CCB _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4CCD _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 4CD0 _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 4CD3 _ 89. 45, E8
?_329:  mov     eax, dword [ebp-20H]                    ; 4CD6 _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 4CD9 _ 89. 45, D8
        jmp     ?_334                                   ; 4CDC _ EB, 7A

?_330:  mov     eax, dword [ebp-10H]                    ; 4CDE _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 4CE1 _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 4CE4 _ 8B. 45, D8
        add     eax, edx                                ; 4CE7 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4CE9 _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 4CEC _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 4CEF _ 89. 45, D4
        jmp     ?_333                                   ; 4CF2 _ EB, 58

?_331:  mov     eax, dword [ebp-10H]                    ; 4CF4 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 4CF7 _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 4CFA _ 8B. 45, D4
        add     eax, edx                                ; 4CFD _ 01. D0
        mov     dword [ebp-4H], eax                     ; 4CFF _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 4D02 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4D05 _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 4D08 _ 0F AF. 45, D8
        mov     edx, eax                                ; 4D0C _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 4D0E _ 8B. 45, D4
        add     eax, edx                                ; 4D11 _ 01. D0
        mov     edx, eax                                ; 4D13 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 4D15 _ 8B. 45, F4
        add     eax, edx                                ; 4D18 _ 01. D0
        movzx   eax, byte [eax]                         ; 4D1A _ 0F B6. 00
        movzx   edx, al                                 ; 4D1D _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 4D20 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 4D23 _ 8B. 40, 14
        cmp     edx, eax                                ; 4D26 _ 39. C2
        jz      ?_332                                   ; 4D28 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 4D2A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4D2D _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 4D30 _ 0F AF. 45, F8
        mov     edx, eax                                ; 4D34 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4D36 _ 8B. 45, FC
        add     eax, edx                                ; 4D39 _ 01. D0
        mov     edx, eax                                ; 4D3B _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 4D3D _ 8B. 45, EC
        add     edx, eax                                ; 4D40 _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 4D42 _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 4D46 _ 88. 02
?_332:  add     dword [ebp-2CH], 1                      ; 4D48 _ 83. 45, D4, 01
?_333:  mov     eax, dword [ebp-2CH]                    ; 4D4C _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 4D4F _ 3B. 45, E4
        jl      ?_331                                   ; 4D52 _ 7C, A0
        add     dword [ebp-28H], 1                      ; 4D54 _ 83. 45, D8, 01
?_334:  mov     eax, dword [ebp-28H]                    ; 4D58 _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 4D5B _ 3B. 45, E8
        jl      ?_330                                   ; 4D5E _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 4D64 _ 83. 45, D0, 01
?_335:  mov     eax, dword [ebp+8H]                     ; 4D68 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4D6B _ 8B. 40, 10
        cmp     eax, dword [ebp-30H]                    ; 4D6E _ 3B. 45, D0
        jge     ?_325                                   ; 4D71 _ 0F 8D, FFFFFEAB
        nop                                             ; 4D77 _ 90
        leave                                           ; 4D78 _ C9
        ret                                             ; 4D79 _ C3
; sheet_refreshmap End of function

sheet_free:; Function begin
        push    ebp                                     ; 4D7A _ 55
        mov     ebp, esp                                ; 4D7B _ 89. E5
        sub     esp, 8                                  ; 4D7D _ 83. EC, 08
        mov     eax, dword [ebp+0CH]                    ; 4D80 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4D83 _ 8B. 40, 18
        test    eax, eax                                ; 4D86 _ 85. C0
        js      ?_336                                   ; 4D88 _ 78, 13
        sub     esp, 4                                  ; 4D8A _ 83. EC, 04
        push    -1                                      ; 4D8D _ 6A, FF
        push    dword [ebp+0CH]                         ; 4D8F _ FF. 75, 0C
        push    dword [ebp+8H]                          ; 4D92 _ FF. 75, 08
        call    sheet_updown                            ; 4D95 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4D9A _ 83. C4, 10
?_336:  mov     eax, dword [ebp+0CH]                    ; 4D9D _ 8B. 45, 0C
        mov     dword [eax+1CH], 0                      ; 4DA0 _ C7. 40, 1C, 00000000
        nop                                             ; 4DA7 _ 90
        leave                                           ; 4DA8 _ C9
        ret                                             ; 4DA9 _ C3
; sheet_free End of function

init_pit:; Function begin
        push    ebp                                     ; 4DAA _ 55
        mov     ebp, esp                                ; 4DAB _ 89. E5
        sub     esp, 24                                 ; 4DAD _ 83. EC, 18
        sub     esp, 8                                  ; 4DB0 _ 83. EC, 08
        push    52                                      ; 4DB3 _ 6A, 34
        push    67                                      ; 4DB5 _ 6A, 43
        call    io_out8                                 ; 4DB7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4DBC _ 83. C4, 10
        sub     esp, 8                                  ; 4DBF _ 83. EC, 08
        push    156                                     ; 4DC2 _ 68, 0000009C
        push    64                                      ; 4DC7 _ 6A, 40
        call    io_out8                                 ; 4DC9 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4DCE _ 83. C4, 10
        sub     esp, 8                                  ; 4DD1 _ 83. EC, 08
        push    46                                      ; 4DD4 _ 6A, 2E
        push    64                                      ; 4DD6 _ 6A, 40
        call    io_out8                                 ; 4DD8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4DDD _ 83. C4, 10
        mov     dword [timerctl], 0                     ; 4DE0 _ C7. 05, 000003C0(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 4DEA _ C7. 45, F4, 00000000
        jmp     ?_338                                   ; 4DF1 _ EB, 28

?_337:  mov     eax, dword [ebp-0CH]                    ; 4DF3 _ 8B. 45, F4
        shl     eax, 4                                  ; 4DF6 _ C1. E0, 04
        add     eax, timerctl                           ; 4DF9 _ 05, 000003C0(d)
        mov     dword [eax+8H], 0                       ; 4DFE _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 4E05 _ 8B. 45, F4
        shl     eax, 4                                  ; 4E08 _ C1. E0, 04
        add     eax, timerctl                           ; 4E0B _ 05, 000003C0(d)
        mov     dword [eax+0CH], 0                      ; 4E10 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 4E17 _ 83. 45, F4, 01
?_338:  cmp     dword [ebp-0CH], 499                    ; 4E1B _ 81. 7D, F4, 000001F3
        jle     ?_337                                   ; 4E22 _ 7E, CF
        leave                                           ; 4E24 _ C9
        ret                                             ; 4E25 _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 4E26 _ 55
        mov     ebp, esp                                ; 4E27 _ 89. E5
        sub     esp, 16                                 ; 4E29 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4E2C _ C7. 45, FC, 00000000
        jmp     ?_341                                   ; 4E33 _ EB, 38

?_339:  mov     eax, dword [ebp-4H]                     ; 4E35 _ 8B. 45, FC
        shl     eax, 4                                  ; 4E38 _ C1. E0, 04
        add     eax, timerctl                           ; 4E3B _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 4E40 _ 8B. 40, 08
        test    eax, eax                                ; 4E43 _ 85. C0
        jnz     ?_340                                   ; 4E45 _ 75, 22
        mov     eax, dword [ebp-4H]                     ; 4E47 _ 8B. 45, FC
        shl     eax, 4                                  ; 4E4A _ C1. E0, 04
        add     eax, timerctl                           ; 4E4D _ 05, 000003C0(d)
        mov     dword [eax+8H], 1                       ; 4E52 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-4H]                     ; 4E59 _ 8B. 45, FC
        shl     eax, 4                                  ; 4E5C _ C1. E0, 04
        add     eax, timerctl                           ; 4E5F _ 05, 000003C0(d)
        add     eax, 4                                  ; 4E64 _ 83. C0, 04
        jmp     ?_342                                   ; 4E67 _ EB, 12

?_340:  add     dword [ebp-4H], 1                       ; 4E69 _ 83. 45, FC, 01
?_341:  cmp     dword [ebp-4H], 499                     ; 4E6D _ 81. 7D, FC, 000001F3
        jle     ?_339                                   ; 4E74 _ 7E, BF
        mov     eax, 0                                  ; 4E76 _ B8, 00000000
?_342:  leave                                           ; 4E7B _ C9
        ret                                             ; 4E7C _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 4E7D _ 55
        mov     ebp, esp                                ; 4E7E _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4E80 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4E83 _ C7. 40, 04, 00000000
        nop                                             ; 4E8A _ 90
        pop     ebp                                     ; 4E8B _ 5D
        ret                                             ; 4E8C _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 4E8D _ 55
        mov     ebp, esp                                ; 4E8E _ 89. E5
        sub     esp, 4                                  ; 4E90 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 4E93 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 4E96 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 4E99 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4E9C _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 4E9F _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4EA2 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 4EA5 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 4EA9 _ 88. 50, 0C
        nop                                             ; 4EAC _ 90
        leave                                           ; 4EAD _ C9
        ret                                             ; 4EAE _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 4EAF _ 55
        mov     ebp, esp                                ; 4EB0 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4EB2 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4EB5 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4EB8 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4EBA _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4EBD _ C7. 40, 04, 00000002
        nop                                             ; 4EC4 _ 90
        pop     ebp                                     ; 4EC5 _ 5D
        ret                                             ; 4EC6 _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 4EC7 _ 55
        mov     ebp, esp                                ; 4EC8 _ 89. E5
        sub     esp, 24                                 ; 4ECA _ 83. EC, 18
        sub     esp, 8                                  ; 4ECD _ 83. EC, 08
        push    32                                      ; 4ED0 _ 6A, 20
        push    32                                      ; 4ED2 _ 6A, 20
        call    io_out8                                 ; 4ED4 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4ED9 _ 83. C4, 10
        mov     eax, dword [timerctl]                   ; 4EDC _ A1, 000003C0(d)
        add     eax, 1                                  ; 4EE1 _ 83. C0, 01
        mov     dword [timerctl], eax                   ; 4EE4 _ A3, 000003C0(d)
        mov     byte [ebp-0DH], 0                       ; 4EE9 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 4EED _ C7. 45, F4, 00000000
        jmp     ?_346                                   ; 4EF4 _ E9, 000000B1

?_343:  mov     eax, dword [ebp-0CH]                    ; 4EF9 _ 8B. 45, F4
        shl     eax, 4                                  ; 4EFC _ C1. E0, 04
        add     eax, timerctl                           ; 4EFF _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 4F04 _ 8B. 40, 08
        cmp     eax, 2                                  ; 4F07 _ 83. F8, 02
        jne     ?_344                                   ; 4F0A _ 0F 85, 0000008B
        mov     eax, dword [ebp-0CH]                    ; 4F10 _ 8B. 45, F4
        shl     eax, 4                                  ; 4F13 _ C1. E0, 04
        add     eax, timerctl                           ; 4F16 _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 4F1B _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 4F1E _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 4F21 _ 8B. 45, F4
        shl     eax, 4                                  ; 4F24 _ C1. E0, 04
        add     eax, timerctl                           ; 4F27 _ 05, 000003C0(d)
        mov     dword [eax+4H], edx                     ; 4F2C _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 4F2F _ 8B. 45, F4
        shl     eax, 4                                  ; 4F32 _ C1. E0, 04
        add     eax, timerctl                           ; 4F35 _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 4F3A _ 8B. 40, 04
        test    eax, eax                                ; 4F3D _ 85. C0
        jnz     ?_344                                   ; 4F3F _ 75, 5A
        mov     eax, dword [ebp-0CH]                    ; 4F41 _ 8B. 45, F4
        shl     eax, 4                                  ; 4F44 _ C1. E0, 04
        add     eax, timerctl                           ; 4F47 _ 05, 000003C0(d)
        mov     dword [eax+8H], 1                       ; 4F4C _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 4F53 _ 8B. 45, F4
        shl     eax, 4                                  ; 4F56 _ C1. E0, 04
        add     eax, timerctl                           ; 4F59 _ 05, 000003C0(d)
        movzx   eax, byte [eax+10H]                     ; 4F5E _ 0F B6. 40, 10
        movzx   edx, al                                 ; 4F62 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 4F65 _ 8B. 45, F4
        shl     eax, 4                                  ; 4F68 _ C1. E0, 04
        add     eax, timerctl                           ; 4F6B _ 05, 000003C0(d)
        mov     eax, dword [eax+0CH]                    ; 4F70 _ 8B. 40, 0C
        sub     esp, 8                                  ; 4F73 _ 83. EC, 08
        push    edx                                     ; 4F76 _ 52
        push    eax                                     ; 4F77 _ 50
        call    fifo8_put                               ; 4F78 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 4F7D _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 4F80 _ 8B. 45, F4
        shl     eax, 4                                  ; 4F83 _ C1. E0, 04
        add     eax, timerctl                           ; 4F86 _ 05, 000003C0(d)
        lea     edx, [eax+4H]                           ; 4F8B _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 4F8E _ A1, 00000000(d)
        cmp     edx, eax                                ; 4F93 _ 39. C2
        jnz     ?_344                                   ; 4F95 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 4F97 _ C6. 45, F3, 01
?_344:  cmp     byte [ebp-0DH], 0                       ; 4F9B _ 80. 7D, F3, 00
        jz      ?_345                                   ; 4F9F _ 74, 05
        call    task_switch                             ; 4FA1 _ E8, FFFFFFFC(rel)
?_345:  add     dword [ebp-0CH], 1                      ; 4FA6 _ 83. 45, F4, 01
?_346:  cmp     dword [ebp-0CH], 499                    ; 4FAA _ 81. 7D, F4, 000001F3
        jle     ?_343                                   ; 4FB1 _ 0F 8E, FFFFFF42
        nop                                             ; 4FB7 _ 90
        leave                                           ; 4FB8 _ C9
        ret                                             ; 4FB9 _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 4FBA _ 55
        mov     ebp, esp                                ; 4FBB _ 89. E5
        mov     eax, timerctl                           ; 4FBD _ B8, 000003C0(d)
        pop     ebp                                     ; 4FC2 _ 5D
        ret                                             ; 4FC3 _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 4FC4 _ 55
        mov     ebp, esp                                ; 4FC5 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4FC7 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4FCA _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 4FCD _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4FD0 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4FD3 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 4FD6 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4FD8 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4FDB _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 4FDE _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 4FE1 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 4FE4 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 4FEB _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4FEE _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 4FF5 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 4FF8 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 4FFF _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 5002 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 5005 _ 89. 50, 18
        nop                                             ; 5008 _ 90
        pop     ebp                                     ; 5009 _ 5D
        ret                                             ; 500A _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 500B _ 55
        mov     ebp, esp                                ; 500C _ 89. E5
        sub     esp, 24                                 ; 500E _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 5011 _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 5014 _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 5017 _ 83. 7D, 08, 00
        jnz     ?_347                                   ; 501B _ 75, 0A
        mov     eax, 4294967295                         ; 501D _ B8, FFFFFFFF
        jmp     ?_351                                   ; 5022 _ E9, 000000AA

?_347:  mov     eax, dword [ebp+8H]                     ; 5027 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 502A _ 8B. 40, 10
        test    eax, eax                                ; 502D _ 85. C0
        jnz     ?_348                                   ; 502F _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 5031 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 5034 _ 8B. 40, 14
        or      eax, 01H                                ; 5037 _ 83. C8, 01
        mov     edx, eax                                ; 503A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 503C _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 503F _ 89. 50, 14
        mov     eax, 4294967294                         ; 5042 _ B8, FFFFFFFE
        jmp     ?_351                                   ; 5047 _ E9, 00000085

?_348:  mov     eax, dword [ebp+8H]                     ; 504C _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 504F _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 5051 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5054 _ 8B. 40, 04
        add     edx, eax                                ; 5057 _ 01. C2
        movzx   eax, byte [ebp-0CH]                     ; 5059 _ 0F B6. 45, F4
        mov     byte [edx], al                          ; 505D _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 505F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5062 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 5065 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 5068 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 506B _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 506E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 5071 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 5074 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5077 _ 8B. 40, 0C
        cmp     edx, eax                                ; 507A _ 39. C2
        jnz     ?_349                                   ; 507C _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 507E _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 5081 _ C7. 40, 04, 00000000
?_349:  mov     eax, dword [ebp+8H]                     ; 5088 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 508B _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 508E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 5091 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 5094 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 5097 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 509A _ 8B. 40, 18
        test    eax, eax                                ; 509D _ 85. C0
        jz      ?_350                                   ; 509F _ 74, 2B
        mov     eax, dword [ebp+8H]                     ; 50A1 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 50A4 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 50A7 _ 8B. 40, 04
        cmp     eax, 2                                  ; 50AA _ 83. F8, 02
        jz      ?_350                                   ; 50AD _ 74, 1D
        mov     eax, dword [ebp+8H]                     ; 50AF _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 50B2 _ 8B. 40, 18
        sub     esp, 4                                  ; 50B5 _ 83. EC, 04
        push    0                                       ; 50B8 _ 6A, 00
        push    -1                                      ; 50BA _ 6A, FF
        push    eax                                     ; 50BC _ 50
        call    task_run                                ; 50BD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 50C2 _ 83. C4, 10
        mov     eax, 1                                  ; 50C5 _ B8, 00000001
        jmp     ?_351                                   ; 50CA _ EB, 05

?_350:  mov     eax, 0                                  ; 50CC _ B8, 00000000
?_351:  leave                                           ; 50D1 _ C9
        ret                                             ; 50D2 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 50D3 _ 55
        mov     ebp, esp                                ; 50D4 _ 89. E5
        sub     esp, 16                                 ; 50D6 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 50D9 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 50DC _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 50DF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 50E2 _ 8B. 40, 0C
        cmp     edx, eax                                ; 50E5 _ 39. C2
        jnz     ?_352                                   ; 50E7 _ 75, 07
        mov     eax, 4294967295                         ; 50E9 _ B8, FFFFFFFF
        jmp     ?_354                                   ; 50EE _ EB, 51

?_352:  mov     eax, dword [ebp+8H]                     ; 50F0 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 50F3 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 50F5 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 50F8 _ 8B. 40, 08
        add     eax, edx                                ; 50FB _ 01. D0
        movzx   eax, byte [eax]                         ; 50FD _ 0F B6. 00
        movzx   eax, al                                 ; 5100 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 5103 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 5106 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 5109 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 510C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 510F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 5112 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 5115 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 5118 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 511B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 511E _ 8B. 40, 0C
        cmp     edx, eax                                ; 5121 _ 39. C2
        jnz     ?_353                                   ; 5123 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 5125 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 5128 _ C7. 40, 08, 00000000
?_353:  mov     eax, dword [ebp+8H]                     ; 512F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5132 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 5135 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 5138 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 513B _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 513E _ 8B. 45, FC
?_354:  leave                                           ; 5141 _ C9
        ret                                             ; 5142 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 5143 _ 55
        mov     ebp, esp                                ; 5144 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 5146 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5149 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 514C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 514F _ 8B. 40, 10
        sub     edx, eax                                ; 5152 _ 29. C2
        mov     eax, edx                                ; 5154 _ 89. D0
        pop     ebp                                     ; 5156 _ 5D
        ret                                             ; 5157 _ C3
; fifo8_status End of function

strcmp: ; Function begin
        push    ebp                                     ; 5158 _ 55
        mov     ebp, esp                                ; 5159 _ 89. E5
        sub     esp, 16                                 ; 515B _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 515E _ 83. 7D, 08, 00
        jz      ?_355                                   ; 5162 _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 5164 _ 83. 7D, 0C, 00
        jnz     ?_356                                   ; 5168 _ 75, 0A
?_355:  mov     eax, 0                                  ; 516A _ B8, 00000000
        jmp     ?_363                                   ; 516F _ E9, 0000009B

?_356:  mov     dword [ebp-4H], 0                       ; 5174 _ C7. 45, FC, 00000000
        jmp     ?_359                                   ; 517B _ EB, 25

?_357:  mov     edx, dword [ebp-4H]                     ; 517D _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5180 _ 8B. 45, 08
        add     eax, edx                                ; 5183 _ 01. D0
        movzx   edx, byte [eax]                         ; 5185 _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 5188 _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 518B _ 8B. 45, 0C
        add     eax, ecx                                ; 518E _ 01. C8
        movzx   eax, byte [eax]                         ; 5190 _ 0F B6. 00
        cmp     dl, al                                  ; 5193 _ 38. C2
        jz      ?_358                                   ; 5195 _ 74, 07
        mov     eax, 0                                  ; 5197 _ B8, 00000000
        jmp     ?_363                                   ; 519C _ EB, 71

?_358:  add     dword [ebp-4H], 1                       ; 519E _ 83. 45, FC, 01
?_359:  mov     edx, dword [ebp-4H]                     ; 51A2 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 51A5 _ 8B. 45, 08
        add     eax, edx                                ; 51A8 _ 01. D0
        movzx   eax, byte [eax]                         ; 51AA _ 0F B6. 00
        test    al, al                                  ; 51AD _ 84. C0
        jz      ?_360                                   ; 51AF _ 74, 0F
        mov     edx, dword [ebp-4H]                     ; 51B1 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 51B4 _ 8B. 45, 0C
        add     eax, edx                                ; 51B7 _ 01. D0
        movzx   eax, byte [eax]                         ; 51B9 _ 0F B6. 00
        test    al, al                                  ; 51BC _ 84. C0
        jnz     ?_357                                   ; 51BE _ 75, BD
?_360:  mov     edx, dword [ebp-4H]                     ; 51C0 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 51C3 _ 8B. 45, 08
        add     eax, edx                                ; 51C6 _ 01. D0
        movzx   eax, byte [eax]                         ; 51C8 _ 0F B6. 00
        test    al, al                                  ; 51CB _ 84. C0
        jnz     ?_361                                   ; 51CD _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 51CF _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 51D2 _ 8B. 45, 0C
        add     eax, edx                                ; 51D5 _ 01. D0
        movzx   eax, byte [eax]                         ; 51D7 _ 0F B6. 00
        test    al, al                                  ; 51DA _ 84. C0
        jz      ?_361                                   ; 51DC _ 74, 07
        mov     eax, 0                                  ; 51DE _ B8, 00000000
        jmp     ?_363                                   ; 51E3 _ EB, 2A

?_361:  mov     edx, dword [ebp-4H]                     ; 51E5 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 51E8 _ 8B. 45, 08
        add     eax, edx                                ; 51EB _ 01. D0
        movzx   eax, byte [eax]                         ; 51ED _ 0F B6. 00
        test    al, al                                  ; 51F0 _ 84. C0
        jz      ?_362                                   ; 51F2 _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 51F4 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 51F7 _ 8B. 45, 0C
        add     eax, edx                                ; 51FA _ 01. D0
        movzx   eax, byte [eax]                         ; 51FC _ 0F B6. 00
        test    al, al                                  ; 51FF _ 84. C0
        jz      ?_362                                   ; 5201 _ 74, 07
        mov     eax, 0                                  ; 5203 _ B8, 00000000
        jmp     ?_363                                   ; 5208 _ EB, 05

?_362:  mov     eax, 1                                  ; 520A _ B8, 00000001
?_363:  leave                                           ; 520F _ C9
        ret                                             ; 5210 _ C3
; strcmp End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 5211 _ 55
        mov     ebp, esp                                ; 5212 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 5214 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_364                                   ; 521B _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 521D _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 5224 _ 8B. 45, 0C
        shr     eax, 12                                 ; 5227 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 522A _ 89. 45, 0C
?_364:  mov     eax, dword [ebp+0CH]                    ; 522D _ 8B. 45, 0C
        mov     edx, eax                                ; 5230 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5232 _ 8B. 45, 08
        mov     word [eax], dx                          ; 5235 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 5238 _ 8B. 45, 10
        mov     edx, eax                                ; 523B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 523D _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 5240 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 5244 _ 8B. 45, 10
        sar     eax, 16                                 ; 5247 _ C1. F8, 10
        mov     edx, eax                                ; 524A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 524C _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 524F _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 5252 _ 8B. 45, 14
        mov     edx, eax                                ; 5255 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5257 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 525A _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 525D _ 8B. 45, 0C
        shr     eax, 16                                 ; 5260 _ C1. E8, 10
        and     eax, 0FH                                ; 5263 _ 83. E0, 0F
        mov     edx, eax                                ; 5266 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 5268 _ 8B. 45, 14
        sar     eax, 8                                  ; 526B _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 526E _ 83. E0, F0
        or      eax, edx                                ; 5271 _ 09. D0
        mov     edx, eax                                ; 5273 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5275 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 5278 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 527B _ 8B. 45, 10
        shr     eax, 24                                 ; 527E _ C1. E8, 18
        mov     edx, eax                                ; 5281 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5283 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 5286 _ 88. 50, 07
        nop                                             ; 5289 _ 90
        pop     ebp                                     ; 528A _ 5D
        ret                                             ; 528B _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 528C _ 55
        mov     ebp, esp                                ; 528D _ 89. E5
        mov     eax, dword [taskctl]                    ; 528F _ A1, 00002308(d)
        pop     ebp                                     ; 5294 _ 5D
        ret                                             ; 5295 _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 5296 _ 55
        mov     ebp, esp                                ; 5297 _ 89. E5
        sub     esp, 16                                 ; 5299 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 529C _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp+8H]                     ; 52A2 _ 8B. 55, 08
        mov     eax, edx                                ; 52A5 _ 89. D0
        add     eax, eax                                ; 52A7 _ 01. C0
        add     eax, edx                                ; 52A9 _ 01. D0
        shl     eax, 4                                  ; 52AB _ C1. E0, 04
        add     eax, ecx                                ; 52AE _ 01. C8
        mov     dword [eax+8H], 0                       ; 52B0 _ C7. 40, 08, 00000000
        mov     ecx, dword [taskctl]                    ; 52B7 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp+8H]                     ; 52BD _ 8B. 55, 08
        mov     eax, edx                                ; 52C0 _ 89. D0
        add     eax, eax                                ; 52C2 _ 01. C0
        add     eax, edx                                ; 52C4 _ 01. D0
        shl     eax, 4                                  ; 52C6 _ C1. E0, 04
        add     eax, ecx                                ; 52C9 _ 01. C8
        mov     dword [eax+0CH], 0                      ; 52CB _ C7. 40, 0C, 00000000
        mov     dword [ebp-4H], 0                       ; 52D2 _ C7. 45, FC, 00000000
        jmp     ?_366                                   ; 52D9 _ EB, 19

?_365:  mov     edx, dword [taskctl]                    ; 52DB _ 8B. 15, 00002308(d)
        mov     eax, dword [ebp-4H]                     ; 52E1 _ 8B. 45, FC
        imul    eax, eax, 52                            ; 52E4 _ 6B. C0, 34
        add     eax, edx                                ; 52E7 _ 01. D0
        mov     dword [eax+10H], 0                      ; 52E9 _ C7. 40, 10, 00000000
        add     dword [ebp-4H], 1                       ; 52F0 _ 83. 45, FC, 01
?_366:  cmp     dword [ebp-4H], 9                       ; 52F4 _ 83. 7D, FC, 09
        jle     ?_365                                   ; 52F8 _ 7E, E1
        leave                                           ; 52FA _ C9
        ret                                             ; 52FB _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 52FC _ 55
        mov     ebp, esp                                ; 52FD _ 89. E5
        sub     esp, 24                                 ; 52FF _ 83. EC, 18
        call    get_addr_gdt                            ; 5302 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 5307 _ 89. 45, F0
        sub     esp, 8                                  ; 530A _ 83. EC, 08
        push    3048                                    ; 530D _ 68, 00000BE8
        push    dword [ebp+8H]                          ; 5312 _ FF. 75, 08
        call    memman_alloc_4k                         ; 5315 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 531A _ 83. C4, 10
        mov     dword [taskctl], eax                    ; 531D _ A3, 00002308(d)
        mov     dword [ebp-14H], 0                      ; 5322 _ C7. 45, EC, 00000000
        jmp     ?_368                                   ; 5329 _ E9, 000000E9

?_367:  mov     edx, dword [taskctl]                    ; 532E _ 8B. 15, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 5334 _ 8B. 45, EC
        imul    eax, eax, 204                           ; 5337 _ 69. C0, 000000CC
        add     eax, edx                                ; 533D _ 01. D0
        add     eax, 480                                ; 533F _ 05, 000001E0
        mov     dword [eax+0CH], 0                      ; 5344 _ C7. 40, 0C, 00000000
        mov     ecx, dword [taskctl]                    ; 534B _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 5351 _ 8B. 45, EC
        add     eax, 7                                  ; 5354 _ 83. C0, 07
        lea     edx, [eax*8]                            ; 5357 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 535E _ 8B. 45, EC
        imul    eax, eax, 204                           ; 5361 _ 69. C0, 000000CC
        add     eax, ecx                                ; 5367 _ 01. C8
        add     eax, 480                                ; 5369 _ 05, 000001E0
        mov     dword [eax+8H], edx                     ; 536E _ 89. 50, 08
        mov     ecx, dword [taskctl]                    ; 5371 _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 5377 _ 8B. 45, EC
        add     eax, 17                                 ; 537A _ 83. C0, 11
        lea     edx, [eax*8]                            ; 537D _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 5384 _ 8B. 45, EC
        imul    eax, eax, 204                           ; 5387 _ 69. C0, 000000CC
        add     eax, ecx                                ; 538D _ 01. C8
        add     eax, 608                                ; 538F _ 05, 00000260
        mov     dword [eax+14H], edx                    ; 5394 _ 89. 50, 14
        mov     eax, dword [taskctl]                    ; 5397 _ A1, 00002308(d)
        mov     edx, dword [ebp-14H]                    ; 539C _ 8B. 55, EC
        imul    edx, edx, 204                           ; 539F _ 69. D2, 000000CC
        add     edx, 512                                ; 53A5 _ 81. C2, 00000200
        add     eax, edx                                ; 53AB _ 01. D0
        add     eax, 20                                 ; 53AD _ 83. C0, 14
        mov     ecx, eax                                ; 53B0 _ 89. C1
        mov     eax, dword [ebp-14H]                    ; 53B2 _ 8B. 45, EC
        add     eax, 7                                  ; 53B5 _ 83. C0, 07
        lea     edx, [eax*8]                            ; 53B8 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-10H]                    ; 53BF _ 8B. 45, F0
        add     eax, edx                                ; 53C2 _ 01. D0
        push    137                                     ; 53C4 _ 68, 00000089
        push    ecx                                     ; 53C9 _ 51
        push    103                                     ; 53CA _ 6A, 67
        push    eax                                     ; 53CC _ 50
        call    set_segmdesc                            ; 53CD _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 53D2 _ 83. C4, 10
        mov     eax, dword [taskctl]                    ; 53D5 _ A1, 00002308(d)
        mov     edx, dword [ebp-14H]                    ; 53DA _ 8B. 55, EC
        imul    edx, edx, 204                           ; 53DD _ 69. D2, 000000CC
        add     edx, 656                                ; 53E3 _ 81. C2, 00000290
        add     eax, edx                                ; 53E9 _ 01. D0
        add     eax, 20                                 ; 53EB _ 83. C0, 14
        mov     ecx, eax                                ; 53EE _ 89. C1
        mov     eax, dword [ebp-14H]                    ; 53F0 _ 8B. 45, EC
        add     eax, 17                                 ; 53F3 _ 83. C0, 11
        lea     edx, [eax*8]                            ; 53F6 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-10H]                    ; 53FD _ 8B. 45, F0
        add     eax, edx                                ; 5400 _ 01. D0
        push    130                                     ; 5402 _ 68, 00000082
        push    ecx                                     ; 5407 _ 51
        push    15                                      ; 5408 _ 6A, 0F
        push    eax                                     ; 540A _ 50
        call    set_segmdesc                            ; 540B _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5410 _ 83. C4, 10
        add     dword [ebp-14H], 1                      ; 5413 _ 83. 45, EC, 01
?_368:  cmp     dword [ebp-14H], 9                      ; 5417 _ 83. 7D, EC, 09
        jle     ?_367                                   ; 541B _ 0F 8E, FFFFFF0D
        mov     dword [ebp-14H], 0                      ; 5421 _ C7. 45, EC, 00000000
        jmp     ?_370                                   ; 5428 _ EB, 12

?_369:  sub     esp, 12                                 ; 542A _ 83. EC, 0C
        push    dword [ebp-14H]                         ; 542D _ FF. 75, EC
        call    init_task_level                         ; 5430 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5435 _ 83. C4, 10
        add     dword [ebp-14H], 1                      ; 5438 _ 83. 45, EC, 01
?_370:  cmp     dword [ebp-14H], 9                      ; 543C _ 83. 7D, EC, 09
        jle     ?_369                                   ; 5440 _ 7E, E8
        call    task_alloc                              ; 5442 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 5447 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 544A _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 544D _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 5454 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 5457 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 545E _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 5461 _ C7. 40, 0C, 00000000
        sub     esp, 12                                 ; 5468 _ 83. EC, 0C
        push    dword [ebp-0CH]                         ; 546B _ FF. 75, F4
        call    task_add                                ; 546E _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5473 _ 83. C4, 10
        call    task_switchsub                          ; 5476 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 547B _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 547E _ 8B. 00
        sub     esp, 12                                 ; 5480 _ 83. EC, 0C
        push    eax                                     ; 5483 _ 50
        call    load_tr                                 ; 5484 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5489 _ 83. C4, 10
        call    timer_alloc                             ; 548C _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 5491 _ A3, 00002304(d)
        mov     eax, dword [ebp-0CH]                    ; 5496 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 5499 _ 8B. 40, 08
        mov     edx, eax                                ; 549C _ 89. C2
        mov     eax, dword [task_timer]                 ; 549E _ A1, 00002304(d)
        sub     esp, 8                                  ; 54A3 _ 83. EC, 08
        push    edx                                     ; 54A6 _ 52
        push    eax                                     ; 54A7 _ 50
        call    timer_settime                           ; 54A8 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 54AD _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 54B0 _ 8B. 45, F4
        leave                                           ; 54B3 _ C9
        ret                                             ; 54B4 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 54B5 _ 55
        mov     ebp, esp                                ; 54B6 _ 89. E5
        sub     esp, 16                                 ; 54B8 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 54BB _ C7. 45, F8, 00000000
        jmp     ?_373                                   ; 54C2 _ E9, 000000F9

?_371:  mov     edx, dword [taskctl]                    ; 54C7 _ 8B. 15, 00002308(d)
        mov     eax, dword [ebp-8H]                     ; 54CD _ 8B. 45, F8
        imul    eax, eax, 204                           ; 54D0 _ 69. C0, 000000CC
        add     eax, edx                                ; 54D6 _ 01. D0
        add     eax, 480                                ; 54D8 _ 05, 000001E0
        mov     eax, dword [eax+0CH]                    ; 54DD _ 8B. 40, 0C
        test    eax, eax                                ; 54E0 _ 85. C0
        jne     ?_372                                   ; 54E2 _ 0F 85, 000000D4
        mov     eax, dword [taskctl]                    ; 54E8 _ A1, 00002308(d)
        mov     edx, dword [ebp-8H]                     ; 54ED _ 8B. 55, F8
        imul    edx, edx, 204                           ; 54F0 _ 69. D2, 000000CC
        add     edx, 480                                ; 54F6 _ 81. C2, 000001E0
        add     eax, edx                                ; 54FC _ 01. D0
        add     eax, 8                                  ; 54FE _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5501 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 5504 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 5507 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 550E _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 5511 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 5518 _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 551B _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 5522 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 5525 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 552C _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 552F _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 5536 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 5539 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 5540 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 5543 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 554A _ 8B. 45, F8
        add     eax, 1                                  ; 554D _ 83. C0, 01
        shl     eax, 9                                  ; 5550 _ C1. E0, 09
        mov     edx, eax                                ; 5553 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 5555 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 5558 _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 555B _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 555E _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 5565 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 5568 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 556F _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 5572 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 5579 _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 557C _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 5586 _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 5589 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 5593 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 5596 _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 55A0 _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 55A3 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 55AA _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 55AD _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 55B7 _ 8B. 45, FC
        jmp     ?_374                                   ; 55BA _ EB, 13

?_372:  add     dword [ebp-8H], 1                       ; 55BC _ 83. 45, F8, 01
?_373:  cmp     dword [ebp-8H], 9                       ; 55C0 _ 83. 7D, F8, 09
        jle     ?_371                                   ; 55C4 _ 0F 8E, FFFFFEFD
        mov     eax, 0                                  ; 55CA _ B8, 00000000
?_374:  leave                                           ; 55CF _ C9
        ret                                             ; 55D0 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 55D1 _ 55
        mov     ebp, esp                                ; 55D2 _ 89. E5
        sub     esp, 8                                  ; 55D4 _ 83. EC, 08
        cmp     dword [ebp+0CH], 0                      ; 55D7 _ 83. 7D, 0C, 00
        jns     ?_375                                   ; 55DB _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 55DD _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 55E0 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 55E3 _ 89. 45, 0C
?_375:  cmp     dword [ebp+10H], 0                      ; 55E6 _ 83. 7D, 10, 00
        jle     ?_376                                   ; 55EA _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 55EC _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 55EF _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 55F2 _ 89. 50, 08
?_376:  mov     eax, dword [ebp+8H]                     ; 55F5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 55F8 _ 8B. 40, 04
        cmp     eax, 2                                  ; 55FB _ 83. F8, 02
        jnz     ?_377                                   ; 55FE _ 75, 19
        mov     eax, dword [ebp+8H]                     ; 5600 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5603 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 5606 _ 3B. 45, 0C
        jz      ?_377                                   ; 5609 _ 74, 0E
        sub     esp, 12                                 ; 560B _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 560E _ FF. 75, 08
        call    task_remove                             ; 5611 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5616 _ 83. C4, 10
?_377:  mov     eax, dword [ebp+8H]                     ; 5619 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 561C _ 8B. 40, 04
        cmp     eax, 2                                  ; 561F _ 83. F8, 02
        jz      ?_378                                   ; 5622 _ 74, 17
        mov     eax, dword [ebp+8H]                     ; 5624 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 5627 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 562A _ 89. 50, 0C
        sub     esp, 12                                 ; 562D _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 5630 _ FF. 75, 08
        call    task_add                                ; 5633 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5638 _ 83. C4, 10
?_378:  mov     eax, dword [taskctl]                    ; 563B _ A1, 00002308(d)
        mov     dword [eax+4H], 1                       ; 5640 _ C7. 40, 04, 00000001
        nop                                             ; 5647 _ 90
        leave                                           ; 5648 _ C9
        ret                                             ; 5649 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 564A _ 55
        mov     ebp, esp                                ; 564B _ 89. E5
        sub     esp, 24                                 ; 564D _ 83. EC, 18
        mov     ecx, dword [taskctl]                    ; 5650 _ 8B. 0D, 00002308(d)
        mov     eax, dword [taskctl]                    ; 5656 _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 565B _ 8B. 10
        mov     eax, edx                                ; 565D _ 89. D0
        add     eax, eax                                ; 565F _ 01. C0
        add     eax, edx                                ; 5661 _ 01. D0
        shl     eax, 4                                  ; 5663 _ C1. E0, 04
        add     eax, ecx                                ; 5666 _ 01. C8
        add     eax, 8                                  ; 5668 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 566B _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 566E _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5671 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5674 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 5677 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 567B _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 567E _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 5681 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 5684 _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 5687 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 568A _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 568D _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5690 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5693 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 5696 _ 8B. 00
        cmp     edx, eax                                ; 5698 _ 39. C2
        jnz     ?_379                                   ; 569A _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 569C _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 569F _ C7. 40, 04, 00000000
?_379:  mov     eax, dword [taskctl]                    ; 56A6 _ A1, 00002308(d)
        mov     eax, dword [eax+4H]                     ; 56AB _ 8B. 40, 04
        test    eax, eax                                ; 56AE _ 85. C0
        jz      ?_380                                   ; 56B0 _ 74, 23
        call    task_switchsub                          ; 56B2 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 56B7 _ 8B. 0D, 00002308(d)
        mov     eax, dword [taskctl]                    ; 56BD _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 56C2 _ 8B. 10
        mov     eax, edx                                ; 56C4 _ 89. D0
        add     eax, eax                                ; 56C6 _ 01. C0
        add     eax, edx                                ; 56C8 _ 01. D0
        shl     eax, 4                                  ; 56CA _ C1. E0, 04
        add     eax, ecx                                ; 56CD _ 01. C8
        add     eax, 8                                  ; 56CF _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 56D2 _ 89. 45, EC
?_380:  mov     eax, dword [ebp-14H]                    ; 56D5 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 56D8 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 56DB _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 56DE _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 56E2 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 56E5 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 56E8 _ 8B. 40, 08
        mov     edx, eax                                ; 56EB _ 89. C2
        mov     eax, dword [task_timer]                 ; 56ED _ A1, 00002304(d)
        sub     esp, 8                                  ; 56F2 _ 83. EC, 08
        push    edx                                     ; 56F5 _ 52
        push    eax                                     ; 56F6 _ 50
        call    timer_settime                           ; 56F7 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 56FC _ 83. C4, 10
        mov     eax, dword [ebp-0CH]                    ; 56FF _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 5702 _ 3B. 45, F0
        jz      ?_381                                   ; 5705 _ 74, 19
        cmp     dword [ebp-0CH], 0                      ; 5707 _ 83. 7D, F4, 00
        jz      ?_381                                   ; 570B _ 74, 13
        mov     eax, dword [ebp-0CH]                    ; 570D _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 5710 _ 8B. 00
        sub     esp, 8                                  ; 5712 _ 83. EC, 08
        push    eax                                     ; 5715 _ 50
        push    0                                       ; 5716 _ 6A, 00
        call    farjmp                                  ; 5718 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 571D _ 83. C4, 10
?_381:  nop                                             ; 5720 _ 90
        leave                                           ; 5721 _ C9
        ret                                             ; 5722 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 5723 _ 55
        mov     ebp, esp                                ; 5724 _ 89. E5
        sub     esp, 24                                 ; 5726 _ 83. EC, 18
        mov     dword [ebp-0CH], 0                      ; 5729 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 5730 _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 5737 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 573A _ 8B. 40, 04
        cmp     eax, 2                                  ; 573D _ 83. F8, 02
        jnz     ?_382                                   ; 5740 _ 75, 52
        call    task_now                                ; 5742 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 5747 _ 89. 45, F4
        sub     esp, 12                                 ; 574A _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 574D _ FF. 75, 08
        call    task_remove                             ; 5750 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5755 _ 83. C4, 10
        mov     dword [ebp-10H], 1                      ; 5758 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 575F _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 5762 _ 3B. 45, F4
        jnz     ?_382                                   ; 5765 _ 75, 2D
        call    task_switchsub                          ; 5767 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 576C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 5771 _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 5774 _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 577B _ 83. 7D, F4, 00
        jz      ?_382                                   ; 577F _ 74, 13
        mov     eax, dword [ebp-0CH]                    ; 5781 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 5784 _ 8B. 00
        sub     esp, 8                                  ; 5786 _ 83. EC, 08
        push    eax                                     ; 5789 _ 50
        push    0                                       ; 578A _ 6A, 00
        call    farjmp                                  ; 578C _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 5791 _ 83. C4, 10
?_382:  mov     eax, dword [ebp-10H]                    ; 5794 _ 8B. 45, F0
        leave                                           ; 5797 _ C9
        ret                                             ; 5798 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 5799 _ 55
        mov     ebp, esp                                ; 579A _ 89. E5
        sub     esp, 16                                 ; 579C _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 579F _ 8B. 0D, 00002308(d)
        mov     eax, dword [taskctl]                    ; 57A5 _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 57AA _ 8B. 10
        mov     eax, edx                                ; 57AC _ 89. D0
        add     eax, eax                                ; 57AE _ 01. C0
        add     eax, edx                                ; 57B0 _ 01. D0
        shl     eax, 4                                  ; 57B2 _ C1. E0, 04
        add     eax, ecx                                ; 57B5 _ 01. C8
        add     eax, 8                                  ; 57B7 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 57BA _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 57BD _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 57C0 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 57C3 _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 57C6 _ 8B. 44 90, 08
        leave                                           ; 57CA _ C9
        ret                                             ; 57CB _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 57CC _ 55
        mov     ebp, esp                                ; 57CD _ 89. E5
        sub     esp, 16                                 ; 57CF _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 57D2 _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp+8H]                     ; 57D8 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 57DB _ 8B. 50, 0C
        mov     eax, edx                                ; 57DE _ 89. D0
        add     eax, eax                                ; 57E0 _ 01. C0
        add     eax, edx                                ; 57E2 _ 01. D0
        shl     eax, 4                                  ; 57E4 _ C1. E0, 04
        add     eax, ecx                                ; 57E7 _ 01. C8
        add     eax, 8                                  ; 57E9 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 57EC _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 57EF _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 57F2 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 57F4 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 57F7 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 57FA _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 57FE _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5801 _ 8B. 00
        lea     edx, [eax+1H]                           ; 5803 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 5806 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 5809 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 580B _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 580E _ C7. 40, 04, 00000002
        nop                                             ; 5815 _ 90
        leave                                           ; 5816 _ C9
        ret                                             ; 5817 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 5818 _ 55
        mov     ebp, esp                                ; 5819 _ 89. E5
        sub     esp, 16                                 ; 581B _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 581E _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp+8H]                     ; 5824 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5827 _ 8B. 50, 0C
        mov     eax, edx                                ; 582A _ 89. D0
        add     eax, eax                                ; 582C _ 01. C0
        add     eax, edx                                ; 582E _ 01. D0
        shl     eax, 4                                  ; 5830 _ C1. E0, 04
        add     eax, ecx                                ; 5833 _ 01. C8
        add     eax, 8                                  ; 5835 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5838 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 583B _ C7. 45, F8, 00000000
        jmp     ?_385                                   ; 5842 _ EB, 23

?_383:  mov     eax, dword [ebp-4H]                     ; 5844 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 5847 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 584A _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 584E _ 3B. 45, 08
        jnz     ?_384                                   ; 5851 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 5853 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 5856 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 5859 _ C7. 44 90, 08, 00000000
        jmp     ?_386                                   ; 5861 _ EB, 0E

?_384:  add     dword [ebp-8H], 1                       ; 5863 _ 83. 45, F8, 01
?_385:  mov     eax, dword [ebp-4H]                     ; 5867 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 586A _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 586C _ 3B. 45, F8
        jg      ?_383                                   ; 586F _ 7F, D3
?_386:  mov     eax, dword [ebp-4H]                     ; 5871 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5874 _ 8B. 00
        lea     edx, [eax-1H]                           ; 5876 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 5879 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 587C _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 587E _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 5881 _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 5884 _ 3B. 45, F8
        jle     ?_387                                   ; 5887 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 5889 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 588C _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 588F _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 5892 _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 5895 _ 89. 50, 04
?_387:  mov     eax, dword [ebp-4H]                     ; 5898 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 589B _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 589E _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 58A1 _ 8B. 00
        cmp     edx, eax                                ; 58A3 _ 39. C2
        jl      ?_388                                   ; 58A5 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 58A7 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 58AA _ C7. 40, 04, 00000000
?_388:  mov     eax, dword [ebp+8H]                     ; 58B1 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 58B4 _ C7. 40, 04, 00000001
        jmp     ?_390                                   ; 58BB _ EB, 1B

?_389:  mov     eax, dword [ebp-8H]                     ; 58BD _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 58C0 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 58C3 _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 58C6 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 58CA _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 58CD _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 58D0 _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 58D4 _ 83. 45, F8, 01
?_390:  mov     eax, dword [ebp-4H]                     ; 58D8 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 58DB _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 58DD _ 3B. 45, F8
        jg      ?_389                                   ; 58E0 _ 7F, DB
        nop                                             ; 58E2 _ 90
        leave                                           ; 58E3 _ C9
        ret                                             ; 58E4 _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 58E5 _ 55
        mov     ebp, esp                                ; 58E6 _ 89. E5
        sub     esp, 16                                 ; 58E8 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 58EB _ C7. 45, FC, 00000000
        jmp     ?_393                                   ; 58F2 _ EB, 21

?_391:  mov     ecx, dword [taskctl]                    ; 58F4 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 58FA _ 8B. 55, FC
        mov     eax, edx                                ; 58FD _ 89. D0
        add     eax, eax                                ; 58FF _ 01. C0
        add     eax, edx                                ; 5901 _ 01. D0
        shl     eax, 4                                  ; 5903 _ C1. E0, 04
        add     eax, ecx                                ; 5906 _ 01. C8
        mov     eax, dword [eax+8H]                     ; 5908 _ 8B. 40, 08
        test    eax, eax                                ; 590B _ 85. C0
        jle     ?_392                                   ; 590D _ 7E, 02
        jmp     ?_394                                   ; 590F _ EB, 0A

?_392:  add     dword [ebp-4H], 1                       ; 5911 _ 83. 45, FC, 01
?_393:  cmp     dword [ebp-4H], 9                       ; 5915 _ 83. 7D, FC, 09
        jle     ?_391                                   ; 5919 _ 7E, D9
?_394:  mov     eax, dword [taskctl]                    ; 591B _ A1, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 5920 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 5923 _ 89. 10
        mov     eax, dword [taskctl]                    ; 5925 _ A1, 00002308(d)
        mov     dword [eax+4H], 0                       ; 592A _ C7. 40, 04, 00000000
        leave                                           ; 5931 _ C9
        ret                                             ; 5932 _ C3
; task_switchsub End of function

send_message:; Function begin
        push    ebp                                     ; 5933 _ 55
        mov     ebp, esp                                ; 5934 _ 89. E5
        sub     esp, 8                                  ; 5936 _ 83. EC, 08
        mov     eax, dword [ebp+10H]                    ; 5939 _ 8B. 45, 10
        movzx   eax, al                                 ; 593C _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 593F _ 8B. 55, 0C
        add     edx, 16                                 ; 5942 _ 83. C2, 10
        sub     esp, 8                                  ; 5945 _ 83. EC, 08
        push    eax                                     ; 5948 _ 50
        push    edx                                     ; 5949 _ 52
        call    fifo8_put                               ; 594A _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 594F _ 83. C4, 10
        sub     esp, 12                                 ; 5952 _ 83. EC, 0C
        push    dword [ebp+8H]                          ; 5955 _ FF. 75, 08
        call    task_sleep                              ; 5958 _ E8, FFFFFFFC(rel)
        add     esp, 16                                 ; 595D _ 83. C4, 10
        leave                                           ; 5960 _ C9
        ret                                             ; 5961 _ C3
; send_message End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_395:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_396:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0008 _ task_a.

?_397:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 000F _ console.

?_398:                                                  ; byte
        db 20H, 00H                                     ; 0017 _  .

?_399:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0019 _ free .

?_400:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 001F _  KB.

?_401:                                                  ; byte
        db 3EH, 00H                                     ; 0023 _ >.

?_402:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 0025 _ mem.

?_403:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 0029 _ cls.

?_404:                                                  ; byte
        db 68H, 6CH, 74H, 00H                           ; 002D _ hlt.

?_405:                                                  ; byte
        db 61H, 62H, 63H, 2EH, 65H, 78H, 65H, 00H       ; 0031 _ abc.exe.

?_406:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 0039 _ dir.

?_407:                                                  ; byte
        db 65H, 78H, 69H, 74H, 00H                      ; 003D _ exit.

?_408:                                                  ; byte
        db 73H, 74H, 61H, 72H, 74H, 00H                 ; 0042 _ start.

?_409:                                                  ; byte
        db 6EH, 63H, 73H, 74H, 00H                      ; 0048 _ ncst.

?_410:                                                  ; byte
        db 63H, 72H, 61H, 63H, 6BH, 00H                 ; 004D _ crack.

?_411:                                                  ; byte
        db 63H, 72H, 61H, 63H, 6BH, 2EH, 65H, 78H       ; 0053 _ crack.ex
        db 65H, 00H                                     ; 005B _ e.

?_412:                                                  ; byte
        db 6BH, 65H, 79H, 62H, 6FH, 61H, 72H, 64H       ; 005D _ keyboard
        db 00H                                          ; 0065 _ .

?_413:                                                  ; byte
        db 75H, 73H, 65H, 72H, 20H, 70H, 72H, 6FH       ; 0066 _ user pro
        db 63H, 00H                                     ; 006E _ c.

?_414:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0070 _ page is:
        db 20H, 00H                                     ; 0078 _  .

?_415:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 007A _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0082 _ L: .

?_416:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0086 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 008E _ H: .

?_417:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0092 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 009A _ w: .

?_418:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 4FH, 43H, 00H            ; 009E _ INT OC.

?_419:                                                  ; byte
        db 53H, 74H, 61H, 63H, 6BH, 20H, 45H, 78H       ; 00A5 _ Stack Ex
        db 63H, 65H, 70H, 74H, 69H, 6FH, 6EH, 00H       ; 00AD _ ception.

?_420:                                                  ; byte
        db 45H, 49H, 50H, 20H, 3DH, 20H, 00H            ; 00B5 _ EIP = .

?_421:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 30H, 44H, 20H, 00H       ; 00BC _ INT 0D .

?_422:                                                  ; byte
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

?_423:  db 00H                                          ; 0152 _ .

?_424:  db 00H, 00H, 00H, 00H, 00H                      ; 0153 _ .....

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

table_rgb.2131:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 00H, 0FFH     ; 0180 _ ........
        db 00H, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH   ; 0188 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0190 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0198 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 01A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 01A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01B8 _ ........

cursor.2191:                                            ; byte
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

closebtn.2310:                                          ; byte
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

kernel_pos:                                             ; dword
        resd    1                                       ; 0014

bootInfo:                                               ; qword
        resb    4                                       ; 0018

?_425:  resw    1                                       ; 001C

?_426:  resw    1                                       ; 001E

keyinfo:                                                ; byte
        resb    24                                      ; 0020

?_427:  resd    1                                       ; 0038

mouseinfo:                                              ; byte
        resb    36                                      ; 003C

keybuf:                                                 ; yword
        resb    32                                      ; 0060

mousebuf:                                               ; byte
        resb    128                                     ; 0080

mdec:                                                   ; oword
        resb    12                                      ; 0100

?_428:  resd    1                                       ; 010C

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

task_a.1843:                                            ; dword
        resd    9                                       ; 029C

tss_a.1842:                                             ; byte
        resb    128                                     ; 02C0

tss_b.1841:                                             ; byte
        resb    104                                     ; 0340

task_b.1831:                                            ; byte
        resb    12                                      ; 03A8

str.2239:                                               ; byte
        resb    1                                       ; 03B4

?_429:  resb    9                                       ; 03B5

?_430:  resb    2                                       ; 03BE

timerctl:                                               ; byte
        resd    2001                                    ; 03C0

task_timer:                                             ; dword
        resd    1                                       ; 2304

taskctl: resd   1                                       ; 2308


