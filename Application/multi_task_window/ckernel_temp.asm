; Disassembly of file: ckernel.o
; Tue Mar 24 11:36:45 2020
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
        mov     dword [esp], bootInfo                   ; 000A _ C7. 04 24, 00000010(d)
        call    initBootInfo                            ; 0011 _ E8, FFFFFFFC(rel)
        mov     eax, dword [bootInfo]                   ; 0016 _ A1, 00000010(d)
        mov     dword [ebp-1CH], eax                    ; 001B _ 89. 45, E4
        movzx   eax, word [?_389]                       ; 001E _ 0F B7. 05, 00000014(d)
        cwde                                            ; 0025 _ 98
        mov     dword [xsize], eax                      ; 0026 _ A3, 0000013C(d)
        movzx   eax, word [?_390]                       ; 002B _ 0F B7. 05, 00000016(d)
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
        mov     dword [esp], keyinfo                    ; 011B _ C7. 04 24, 00000018(d)
        call    fifo8_init                              ; 0122 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0127 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 012F _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 128                     ; 0137 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 013F _ C7. 04 24, 00000034(d)
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
        mov     dword [esp+4H], ?_363                   ; 032A _ C7. 44 24, 04, 00000000(d)
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
        mov     dword [task_a.1809], eax                ; 039B _ A3, 00000280(d)
        mov     eax, dword [task_a.1809]                ; 03A0 _ A1, 00000280(d)
        mov     dword [?_391], eax                      ; 03A5 _ A3, 00000030(d)
        mov     eax, dword [task_a.1809]                ; 03AA _ A1, 00000280(d)
        mov     dword [task_main], eax                  ; 03AF _ A3, 0000027C(d)
        mov     eax, dword [task_a.1809]                ; 03B4 _ A1, 00000280(d)
        mov     dword [esp+8H], 0                       ; 03B9 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], 0                       ; 03C1 _ C7. 44 24, 04, 00000000
        mov     dword [esp], eax                        ; 03C9 _ 89. 04 24
        call    task_run                                ; 03CC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 03D1 _ C7. 45, EC, 00000000
        mov     dword [ebp-14H], 0                      ; 03D8 _ C7. 45, EC, 00000000
        jmp     ?_002                                   ; 03DF _ EB, 16

?_001:  mov     eax, dword [ebp-14H]                    ; 03E1 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 03E4 _ 89. 04 24
        call    launch_console                          ; 03E7 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-14H]                    ; 03EC _ 8B. 55, EC
        mov     dword [ebp+edx*4-70H], eax              ; 03EF _ 89. 44 95, 90
        add     dword [ebp-14H], 1                      ; 03F3 _ 83. 45, EC, 01
?_002:  cmp     dword [ebp-14H], 1                      ; 03F7 _ 83. 7D, EC, 01
        jle     ?_001                                   ; 03FB _ 7E, E4
        mov     edx, dword [ebp-6CH]                    ; 03FD _ 8B. 55, 94
        mov     eax, dword [shtctl]                     ; 0400 _ A1, 00000264(d)
        mov     dword [esp+0CH], 176                    ; 0405 _ C7. 44 24, 0C, 000000B0
        mov     dword [esp+8H], 156                     ; 040D _ C7. 44 24, 08, 0000009C
        mov     dword [esp+4H], edx                     ; 0415 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0419 _ 89. 04 24
        call    sheet_slide                             ; 041C _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-70H]                    ; 0421 _ 8B. 55, 90
        mov     eax, dword [shtctl]                     ; 0424 _ A1, 00000264(d)
        mov     dword [esp+0CH], 2                      ; 0429 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 0431 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 0439 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 043D _ 89. 04 24
        call    sheet_slide                             ; 0440 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-6CH]                    ; 0445 _ 8B. 55, 94
        mov     eax, dword [shtctl]                     ; 0448 _ A1, 00000264(d)
        mov     dword [esp+8H], 1                       ; 044D _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], edx                     ; 0455 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0459 _ 89. 04 24
        call    sheet_updown                            ; 045C _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-70H]                    ; 0461 _ 8B. 55, 90
        mov     eax, dword [shtctl]                     ; 0464 _ A1, 00000264(d)
        mov     dword [esp+8H], 2                       ; 0469 _ C7. 44 24, 08, 00000002
        mov     dword [esp+4H], edx                     ; 0471 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0475 _ 89. 04 24
        call    sheet_updown                            ; 0478 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], 0                      ; 047D _ C7. 45, CC, 00000000
        mov     dword [ebp-38H], 0                      ; 0484 _ C7. 45, C8, 00000000
        mov     dword [ebp-3CH], 0                      ; 048B _ C7. 45, C4, 00000000
        mov     dword [ebp-40H], 0                      ; 0492 _ C7. 45, C0, 00000000
        mov     dword [ebp-44H], 0                      ; 0499 _ C7. 45, BC, 00000000
        mov     dword [ebp-18H], 0                      ; 04A0 _ C7. 45, E8, 00000000
        mov     dword [ebp-48H], 0                      ; 04A7 _ C7. 45, B8, 00000000
        mov     dword [ebp-4CH], 0                      ; 04AE _ C7. 45, B4, 00000000
?_003:  mov     dword [esp], keyinfo                    ; 04B5 _ C7. 04 24, 00000018(d)
        call    fifo8_status                            ; 04BC _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 04C1 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 04C3 _ C7. 04 24, 00000034(d)
        call    fifo8_status                            ; 04CA _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 04CF _ 01. C3
        mov     dword [esp], timerinfo                  ; 04D1 _ C7. 04 24, 00000110(d)
        call    fifo8_status                            ; 04D8 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 04DD _ 01. D8
        test    eax, eax                                ; 04DF _ 85. C0
        jnz     ?_004                                   ; 04E1 _ 75, 0A
        call    io_sti                                  ; 04E3 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 04E8 _ E9, 000003C6

?_004:  mov     dword [esp], keyinfo                    ; 04ED _ C7. 04 24, 00000018(d)
        call    fifo8_status                            ; 04F4 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 04F9 _ 85. C0
        je      ?_013                                   ; 04FB _ 0F 84, 00000381
        call    io_sti                                  ; 0501 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0506 _ C7. 04 24, 00000018(d)
        call    fifo8_get                               ; 050D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 0512 _ 89. 45, CC
        mov     eax, dword [ebp-34H]                    ; 0515 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0518 _ 89. 04 24
        call    transferScanCode                        ; 051B _ E8, FFFFFFFC(rel)
        mov     eax, dword [KEY_CONTROL]                ; 0520 _ A1, 00000000(d)
        cmp     dword [ebp-34H], eax                    ; 0525 _ 39. 45, CC
        jnz     ?_005                                   ; 0528 _ 75, 51
        mov     eax, dword [key_shift]                  ; 052A _ A1, 00000000(d)
        test    eax, eax                                ; 052F _ 85. C0
        jz      ?_005                                   ; 0531 _ 74, 48
        mov     eax, dword [current_console]            ; 0533 _ A1, 00000000(d)
        mov     eax, dword [task_cons+eax*4]            ; 0538 _ 8B. 04 85, 00000274(d)
        mov     eax, dword [eax+34H]                    ; 053F _ 8B. 40, 34
        test    eax, eax                                ; 0542 _ 85. C0
        jz      ?_005                                   ; 0544 _ 74, 35
        mov     dword [esp], ?_364                      ; 0546 _ C7. 04 24, 00000008(d)
        call    cons_putstr                             ; 054D _ E8, FFFFFFFC(rel)
        call    io_cli                                  ; 0552 _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 0557 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-50H], eax                    ; 055C _ 89. 45, B0
        mov     eax, dword [current_console]            ; 055F _ A1, 00000000(d)
        mov     eax, dword [task_cons+eax*4]            ; 0564 _ 8B. 04 85, 00000274(d)
        mov     edx, kill_process                       ; 056B _ BA, 00000000(d)
        sub     edx, dword [ebp-50H]                    ; 0570 _ 2B. 55, B0
        mov     dword [eax+4CH], edx                    ; 0573 _ 89. 50, 4C
        call    io_sti                                  ; 0576 _ E8, FFFFFFFC(rel)
?_005:  cmp     dword [ebp-34H], 16                     ; 057B _ 83. 7D, CC, 10
        jnz     ?_006                                   ; 057F _ 75, 28
        mov     eax, dword [shtctl]                     ; 0581 _ A1, 00000264(d)
        mov     eax, dword [eax+10H]                    ; 0586 _ 8B. 40, 10
        lea     ecx, [eax-1H]                           ; 0589 _ 8D. 48, FF
        mov     eax, dword [shtctl]                     ; 058C _ A1, 00000264(d)
        mov     edx, dword [eax+18H]                    ; 0591 _ 8B. 50, 18
        mov     eax, dword [shtctl]                     ; 0594 _ A1, 00000264(d)
        mov     dword [esp+8H], ecx                     ; 0599 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 059D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05A1 _ 89. 04 24
        call    sheet_updown                            ; 05A4 _ E8, FFFFFFFC(rel)
?_006:  cmp     dword [ebp-34H], 15                     ; 05A9 _ 83. 7D, CC, 0F
        jne     ?_011                                   ; 05AD _ 0F 85, 0000019C
        mov     dword [ebp-54H], -1                     ; 05B3 _ C7. 45, AC, FFFFFFFF
        cmp     dword [ebp-18H], 0                      ; 05BA _ 83. 7D, E8, 00
        jne     ?_009                                   ; 05BE _ 0F 85, 000000AF
        mov     dword [ebp-18H], 1                      ; 05C4 _ C7. 45, E8, 00000001
        mov     eax, dword [current_console]            ; 05CB _ A1, 00000000(d)
        cmp     eax, 1                                  ; 05D0 _ 83. F8, 01
        jnz     ?_007                                   ; 05D3 _ 75, 0C
        mov     dword [current_console], 0              ; 05D5 _ C7. 05, 00000000(d), 00000000
        jmp     ?_008                                   ; 05DF _ EB, 0A

?_007:  mov     dword [current_console], 1              ; 05E1 _ C7. 05, 00000000(d), 00000001
?_008:  mov     edx, dword [shtMsgBox]                  ; 05EB _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 05F1 _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 05F6 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_365                   ; 05FE _ C7. 44 24, 08, 00000015(d)
        mov     dword [esp+4H], edx                     ; 0606 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 060A _ 89. 04 24
        call    make_wtitle8                            ; 060D _ E8, FFFFFFFC(rel)
        mov     eax, dword [current_console]            ; 0612 _ A1, 00000000(d)
        mov     edx, dword [ebp+eax*4-70H]              ; 0617 _ 8B. 54 85, 90
        mov     eax, dword [shtctl]                     ; 061B _ A1, 00000264(d)
        mov     dword [esp+0CH], 1                      ; 0620 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_366                   ; 0628 _ C7. 44 24, 08, 0000001C(d)
        mov     dword [esp+4H], edx                     ; 0630 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0634 _ 89. 04 24
        call    make_wtitle8                            ; 0637 _ E8, FFFFFFFC(rel)
        mov     edx, dword [shtMsgBox]                  ; 063C _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0642 _ A1, 00000264(d)
        mov     dword [esp+10H], 7                      ; 0647 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 064F _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0657 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 065A _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 065E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0662 _ 89. 04 24
        call    set_cursor                              ; 0665 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-54H], 87                     ; 066A _ C7. 45, AC, 00000057
        jmp     ?_010                                   ; 0671 _ EB, 5F

?_009:  mov     dword [ebp-18H], 0                      ; 0673 _ C7. 45, E8, 00000000
        mov     edx, dword [shtMsgBox]                  ; 067A _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0680 _ A1, 00000264(d)
        mov     dword [esp+0CH], 1                      ; 0685 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_365                   ; 068D _ C7. 44 24, 08, 00000015(d)
        mov     dword [esp+4H], edx                     ; 0695 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0699 _ 89. 04 24
        call    make_wtitle8                            ; 069C _ E8, FFFFFFFC(rel)
        mov     eax, dword [current_console]            ; 06A1 _ A1, 00000000(d)
        mov     edx, dword [ebp+eax*4-70H]              ; 06A6 _ 8B. 54 85, 90
        mov     eax, dword [shtctl]                     ; 06AA _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 06AF _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_366                   ; 06B7 _ C7. 44 24, 08, 0000001C(d)
        mov     dword [esp+4H], edx                     ; 06BF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06C3 _ 89. 04 24
        call    make_wtitle8                            ; 06C6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-54H], 88                     ; 06CB _ C7. 45, AC, 00000058
?_010:  mov     eax, dword [shtMsgBox]                  ; 06D2 _ A1, 00000260(d)
        mov     ecx, dword [eax+4H]                     ; 06D7 _ 8B. 48, 04
        mov     edx, dword [shtMsgBox]                  ; 06DA _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 06E0 _ A1, 00000264(d)
        mov     dword [esp+14H], 21                     ; 06E5 _ C7. 44 24, 14, 00000015
        mov     dword [esp+10H], ecx                    ; 06ED _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 06F1 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 06F9 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0701 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0705 _ 89. 04 24
        call    sheet_refresh                           ; 0708 _ E8, FFFFFFFC(rel)
        mov     eax, dword [current_console]            ; 070D _ A1, 00000000(d)
        mov     eax, dword [ebp+eax*4-70H]              ; 0712 _ 8B. 44 85, 90
        mov     ecx, dword [eax+4H]                     ; 0716 _ 8B. 48, 04
        mov     eax, dword [current_console]            ; 0719 _ A1, 00000000(d)
        mov     edx, dword [ebp+eax*4-70H]              ; 071E _ 8B. 54 85, 90
        mov     eax, dword [shtctl]                     ; 0722 _ A1, 00000264(d)
        mov     dword [esp+14H], 21                     ; 0727 _ C7. 44 24, 14, 00000015
        mov     dword [esp+10H], ecx                    ; 072F _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 0733 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 073B _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0743 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0747 _ 89. 04 24
        call    sheet_refresh                           ; 074A _ E8, FFFFFFFC(rel)
?_011:  cmp     dword [ebp-18H], 0                      ; 074F _ 83. 7D, E8, 00
        jne     ?_012                                   ; 0753 _ 0F 85, 000000D9
        mov     eax, dword [ebp-34H]                    ; 0759 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 075C _ 89. 04 24
        call    transferScanCode                        ; 075F _ E8, FFFFFFFC(rel)
        test    al, al                                  ; 0764 _ 84. C0
        je      ?_014                                   ; 0766 _ 0F 84, 00000147
        cmp     dword [ebp-0CH], 143                    ; 076C _ 81. 7D, F4, 0000008F
        jg      ?_014                                   ; 0773 _ 0F 8F, 0000013A
        mov     edx, dword [shtMsgBox]                  ; 0779 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 077F _ A1, 00000264(d)
        mov     dword [esp+10H], 7                      ; 0784 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 078C _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 0794 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 0797 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 079B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 079F _ 89. 04 24
        call    set_cursor                              ; 07A2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-34H]                    ; 07A7 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 07AA _ 89. 04 24
        call    transferScanCode                        ; 07AD _ E8, FFFFFFFC(rel)
        mov     byte [ebp-55H], al                      ; 07B2 _ 88. 45, AB
        movzx   eax, byte [ebp-55H]                     ; 07B5 _ 0F B6. 45, AB
        mov     byte [ebp-72H], al                      ; 07B9 _ 88. 45, 8E
        mov     byte [ebp-71H], 0                       ; 07BC _ C6. 45, 8F, 00
        mov     edx, dword [shtMsgBox]                  ; 07C0 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 07C6 _ A1, 00000264(d)
        lea     ecx, [ebp-72H]                          ; 07CB _ 8D. 4D, 8E
        mov     dword [esp+14H], ecx                    ; 07CE _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 07D2 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 28                     ; 07DA _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 07E2 _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 07E5 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 07E9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07ED _ 89. 04 24
        call    showString                              ; 07F0 _ E8, FFFFFFFC(rel)
        add     dword [ebp-0CH], 8                      ; 07F5 _ 83. 45, F4, 08
        mov     dword [ebp-44H], 1                      ; 07F9 _ C7. 45, BC, 00000001
        mov     edx, dword [shtMsgBox]                  ; 0800 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0806 _ A1, 00000264(d)
        mov     ecx, dword [ebp-10H]                    ; 080B _ 8B. 4D, F0
        mov     dword [esp+10H], ecx                    ; 080E _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0812 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 081A _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 081D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0821 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0825 _ 89. 04 24
        call    set_cursor                              ; 0828 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 082D _ E9, 00000081

?_012:  mov     eax, dword [ebp-34H]                    ; 0832 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0835 _ 89. 04 24
        call    isSpecialKey                            ; 0838 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 083D _ 85. C0
        jnz     ?_014                                   ; 083F _ 75, 72
        mov     eax, dword [ebp-34H]                    ; 0841 _ 8B. 45, CC
        movzx   eax, al                                 ; 0844 _ 0F B6. C0
        mov     edx, dword [current_console]            ; 0847 _ 8B. 15, 00000000(d)
        mov     edx, dword [task_cons+edx*4]            ; 084D _ 8B. 14 95, 00000274(d)
        add     edx, 16                                 ; 0854 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 0857 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 085B _ 89. 14 24
        call    fifo8_put                               ; 085E _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0863 _ C7. 04 24, 00000018(d)
        call    fifo8_status                            ; 086A _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 086F _ 85. C0
        jnz     ?_014                                   ; 0871 _ 75, 40
        mov     eax, dword [task_a.1809]                ; 0873 _ A1, 00000280(d)
        mov     dword [esp], eax                        ; 0878 _ 89. 04 24
        call    task_sleep                              ; 087B _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 0880 _ EB, 31

?_013:  mov     dword [esp], mouseinfo                  ; 0882 _ C7. 04 24, 00000034(d)
        call    fifo8_status                            ; 0889 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 088E _ 85. C0
        jz      ?_014                                   ; 0890 _ 74, 21
        mov     ecx, dword [sht_mouse]                  ; 0892 _ 8B. 0D, 0000026C(d)
        mov     edx, dword [sht_back]                   ; 0898 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 089E _ A1, 00000264(d)
        mov     dword [esp+8H], ecx                     ; 08A3 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08A7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08AB _ 89. 04 24
        call    show_mouse_info                         ; 08AE _ E8, FFFFFFFC(rel)
?_014:  mov     dword [esp], timerinfo                  ; 08B3 _ C7. 04 24, 00000110(d)
        call    fifo8_status                            ; 08BA _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 08BF _ 85. C0
        je      ?_018                                   ; 08C1 _ 0F 84, 000000DB
        call    io_sti                                  ; 08C7 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo                  ; 08CC _ C7. 04 24, 00000110(d)
        call    fifo8_get                               ; 08D3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-5CH], eax                    ; 08D8 _ 89. 45, A4
        cmp     dword [ebp-5CH], 0                      ; 08DB _ 83. 7D, A4, 00
        jz      ?_015                                   ; 08DF _ 74, 24
        mov     dword [esp+8H], 0                       ; 08E1 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo               ; 08E9 _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-28H]                    ; 08F1 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 08F4 _ 89. 04 24
        call    timer_init                              ; 08F7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 08FC _ C7. 45, F0, 00000000
        jmp     ?_016                                   ; 0903 _ EB, 22

?_015:  mov     dword [esp+8H], 1                       ; 0905 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo               ; 090D _ C7. 44 24, 04, 00000110(d)
        mov     eax, dword [ebp-28H]                    ; 0915 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0918 _ 89. 04 24
        call    timer_init                              ; 091B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 7                      ; 0920 _ C7. 45, F0, 00000007
?_016:  mov     dword [esp+4H], 50                      ; 0927 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 092F _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0932 _ 89. 04 24
        call    timer_settime                           ; 0935 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-18H], 0                      ; 093A _ 83. 7D, E8, 00
        jnz     ?_017                                   ; 093E _ 75, 2F
        mov     edx, dword [shtMsgBox]                  ; 0940 _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0946 _ A1, 00000264(d)
        mov     ecx, dword [ebp-10H]                    ; 094B _ 8B. 4D, F0
        mov     dword [esp+10H], ecx                    ; 094E _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0952 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 095A _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 095D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0961 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0965 _ 89. 04 24
        call    set_cursor                              ; 0968 _ E8, FFFFFFFC(rel)
        jmp     ?_018                                   ; 096D _ EB, 33

?_017:  mov     edx, dword [shtMsgBox]                  ; 096F _ 8B. 15, 00000260(d)
        mov     eax, dword [shtctl]                     ; 0975 _ A1, 00000264(d)
        mov     dword [esp+10H], 7                      ; 097A _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 0982 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-0CH]                    ; 098A _ 8B. 4D, F4
        mov     dword [esp+8H], ecx                     ; 098D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0991 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0995 _ 89. 04 24
        call    set_cursor                              ; 0998 _ E8, FFFFFFFC(rel)
        jmp     ?_003                                   ; 099D _ E9, FFFFFB13

?_018:  jmp     ?_003                                   ; 09A2 _ E9, FFFFFB0E
; CMain End of function

set_cursor:; Function begin
        push    ebp                                     ; 09A7 _ 55
        mov     ebp, esp                                ; 09A8 _ 89. E5
        push    esi                                     ; 09AA _ 56
        push    ebx                                     ; 09AB _ 53
        sub     esp, 32                                 ; 09AC _ 83. EC, 20
        mov     eax, dword [ebp+14H]                    ; 09AF _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 09B2 _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 09B5 _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 09B8 _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 09BB _ 8B. 45, 18
        movzx   ecx, al                                 ; 09BE _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 09C1 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 09C4 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 09C7 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 09CA _ 8B. 00
        mov     dword [esp+18H], esi                    ; 09CC _ 89. 74 24, 18
        mov     dword [esp+14H], ebx                    ; 09D0 _ 89. 5C 24, 14
        mov     ebx, dword [ebp+14H]                    ; 09D4 _ 8B. 5D, 14
        mov     dword [esp+10H], ebx                    ; 09D7 _ 89. 5C 24, 10
        mov     ebx, dword [ebp+10H]                    ; 09DB _ 8B. 5D, 10
        mov     dword [esp+0CH], ebx                    ; 09DE _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 09E2 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 09E6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 09EA _ 89. 04 24
        call    boxfill8                                ; 09ED _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 09F2 _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 09F5 _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 09F8 _ 8B. 45, 10
        add     eax, 8                                  ; 09FB _ 83. C0, 08
        mov     dword [esp+14H], edx                    ; 09FE _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0A02 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 0A06 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 0A09 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 0A0D _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 0A10 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0A14 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A17 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A1B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A1E _ 89. 04 24
        call    sheet_refresh                           ; 0A21 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 0A26 _ 83. C4, 20
        pop     ebx                                     ; 0A29 _ 5B
        pop     esi                                     ; 0A2A _ 5E
        pop     ebp                                     ; 0A2B _ 5D
        ret                                             ; 0A2C _ C3
; set_cursor End of function

isSpecialKey:; Function begin
        push    ebp                                     ; 0A2D _ 55
        mov     ebp, esp                                ; 0A2E _ 89. E5
        sub     esp, 24                                 ; 0A30 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 0A33 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A36 _ 89. 04 24
        call    transferScanCode                        ; 0A39 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 58                      ; 0A3E _ 83. 7D, 08, 3A
        jz      ?_019                                   ; 0A42 _ 74, 2D
        cmp     dword [ebp+8H], 29                      ; 0A44 _ 83. 7D, 08, 1D
        jz      ?_019                                   ; 0A48 _ 74, 27
        cmp     dword [ebp+8H], 186                     ; 0A4A _ 81. 7D, 08, 000000BA
        jz      ?_019                                   ; 0A51 _ 74, 1E
        cmp     dword [ebp+8H], 42                      ; 0A53 _ 83. 7D, 08, 2A
        jz      ?_019                                   ; 0A57 _ 74, 18
        cmp     dword [ebp+8H], 54                      ; 0A59 _ 83. 7D, 08, 36
        jz      ?_019                                   ; 0A5D _ 74, 12
        cmp     dword [ebp+8H], 170                     ; 0A5F _ 81. 7D, 08, 000000AA
        jz      ?_019                                   ; 0A66 _ 74, 09
        cmp     dword [ebp+8H], 182                     ; 0A68 _ 81. 7D, 08, 000000B6
        jnz     ?_020                                   ; 0A6F _ 75, 07
?_019:  mov     eax, 1                                  ; 0A71 _ B8, 00000001
        jmp     ?_021                                   ; 0A76 _ EB, 05

?_020:  mov     eax, 0                                  ; 0A78 _ B8, 00000000
?_021:  leave                                           ; 0A7D _ C9
        ret                                             ; 0A7E _ C3
; isSpecialKey End of function

transferScanCode:; Function begin
        push    ebp                                     ; 0A7F _ 55
        mov     ebp, esp                                ; 0A80 _ 89. E5
        sub     esp, 16                                 ; 0A82 _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 0A85 _ 83. 7D, 08, 2A
        jnz     ?_022                                   ; 0A89 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0A8B _ A1, 00000000(d)
        or      eax, 01H                                ; 0A90 _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 0A93 _ A3, 00000000(d)
?_022:  cmp     dword [ebp+8H], 54                      ; 0A98 _ 83. 7D, 08, 36
        jnz     ?_023                                   ; 0A9C _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0A9E _ A1, 00000000(d)
        or      eax, 02H                                ; 0AA3 _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 0AA6 _ A3, 00000000(d)
?_023:  cmp     dword [ebp+8H], 170                     ; 0AAB _ 81. 7D, 08, 000000AA
        jnz     ?_024                                   ; 0AB2 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0AB4 _ A1, 00000000(d)
        and     eax, 0FFFFFFFEH                         ; 0AB9 _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 0ABC _ A3, 00000000(d)
?_024:  cmp     dword [ebp+8H], 182                     ; 0AC1 _ 81. 7D, 08, 000000B6
        jnz     ?_025                                   ; 0AC8 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 0ACA _ A1, 00000000(d)
        and     eax, 0FFFFFFFDH                         ; 0ACF _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 0AD2 _ A3, 00000000(d)
?_025:  cmp     dword [ebp+8H], 58                      ; 0AD7 _ 83. 7D, 08, 3A
        jnz     ?_027                                   ; 0ADB _ 75, 1F
        mov     eax, dword [caps_lock]                  ; 0ADD _ A1, 00000000(d)
        test    eax, eax                                ; 0AE2 _ 85. C0
        jnz     ?_026                                   ; 0AE4 _ 75, 0C
        mov     dword [caps_lock], 1                    ; 0AE6 _ C7. 05, 00000000(d), 00000001
        jmp     ?_027                                   ; 0AF0 _ EB, 0A

?_026:  mov     dword [caps_lock], 0                    ; 0AF2 _ C7. 05, 00000000(d), 00000000
?_027:  cmp     dword [ebp+8H], 42                      ; 0AFC _ 83. 7D, 08, 2A
        jz      ?_028                                   ; 0B00 _ 74, 24
        cmp     dword [ebp+8H], 54                      ; 0B02 _ 83. 7D, 08, 36
        jz      ?_028                                   ; 0B06 _ 74, 1E
        cmp     dword [ebp+8H], 170                     ; 0B08 _ 81. 7D, 08, 000000AA
        jz      ?_028                                   ; 0B0F _ 74, 15
        cmp     dword [ebp+8H], 182                     ; 0B11 _ 81. 7D, 08, 000000B6
        jz      ?_028                                   ; 0B18 _ 74, 0C
        cmp     dword [ebp+8H], 83                      ; 0B1A _ 83. 7D, 08, 53
        jg      ?_028                                   ; 0B1E _ 7F, 06
        cmp     dword [ebp+8H], 58                      ; 0B20 _ 83. 7D, 08, 3A
        jnz     ?_029                                   ; 0B24 _ 75, 0A
?_028:  mov     eax, 0                                  ; 0B26 _ B8, 00000000
        jmp     ?_034                                   ; 0B2B _ E9, 00000089

?_029:  mov     byte [ebp-1H], 0                        ; 0B30 _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 0B34 _ A1, 00000000(d)
        test    eax, eax                                ; 0B39 _ 85. C0
        jnz     ?_031                                   ; 0B3B _ 75, 46
        cmp     dword [ebp+8H], 83                      ; 0B3D _ 83. 7D, 08, 53
        jg      ?_031                                   ; 0B41 _ 7F, 40
        mov     eax, dword [ebp+8H]                     ; 0B43 _ 8B. 45, 08
        add     eax, keytable                           ; 0B46 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0B4B _ 0F B6. 00
        test    al, al                                  ; 0B4E _ 84. C0
        jz      ?_031                                   ; 0B50 _ 74, 31
        mov     eax, dword [ebp+8H]                     ; 0B52 _ 8B. 45, 08
        add     eax, keytable                           ; 0B55 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 0B5A _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0B5D _ 88. 45, FF
        cmp     byte [ebp-1H], 64                       ; 0B60 _ 80. 7D, FF, 40
        jle     ?_030                                   ; 0B64 _ 7E, 1B
        cmp     byte [ebp-1H], 90                       ; 0B66 _ 80. 7D, FF, 5A
        jg      ?_030                                   ; 0B6A _ 7F, 15
        mov     eax, dword [caps_lock]                  ; 0B6C _ A1, 00000000(d)
        test    eax, eax                                ; 0B71 _ 85. C0
        jnz     ?_030                                   ; 0B73 _ 75, 0C
        movzx   eax, byte [ebp-1H]                      ; 0B75 _ 0F B6. 45, FF
        add     eax, 32                                 ; 0B79 _ 83. C0, 20
        mov     byte [ebp-1H], al                       ; 0B7C _ 88. 45, FF
        jmp     ?_033                                   ; 0B7F _ EB, 34

?_030:  jmp     ?_033                                   ; 0B81 _ EB, 32

?_031:  mov     eax, dword [key_shift]                  ; 0B83 _ A1, 00000000(d)
        test    eax, eax                                ; 0B88 _ 85. C0
        jz      ?_032                                   ; 0B8A _ 74, 25
        cmp     dword [ebp+8H], 127                     ; 0B8C _ 83. 7D, 08, 7F
        jg      ?_032                                   ; 0B90 _ 7F, 1F
        mov     eax, dword [ebp+8H]                     ; 0B92 _ 8B. 45, 08
        add     eax, keytable1                          ; 0B95 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0B9A _ 0F B6. 00
        test    al, al                                  ; 0B9D _ 84. C0
        jz      ?_032                                   ; 0B9F _ 74, 10
        mov     eax, dword [ebp+8H]                     ; 0BA1 _ 8B. 45, 08
        add     eax, keytable1                          ; 0BA4 _ 05, 00000080(d)
        movzx   eax, byte [eax]                         ; 0BA9 _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 0BAC _ 88. 45, FF
        jmp     ?_033                                   ; 0BAF _ EB, 04

?_032:  mov     byte [ebp-1H], 0                        ; 0BB1 _ C6. 45, FF, 00
?_033:  movzx   eax, byte [ebp-1H]                      ; 0BB5 _ 0F B6. 45, FF
?_034:  leave                                           ; 0BB9 _ C9
        ret                                             ; 0BBA _ C3
; transferScanCode End of function

launch_console:; Function begin
        push    ebp                                     ; 0BBB _ 55
        mov     ebp, esp                                ; 0BBC _ 89. E5
        push    ebx                                     ; 0BBE _ 53
        sub     esp, 52                                 ; 0BBF _ 83. EC, 34
        mov     eax, dword [shtctl]                     ; 0BC2 _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 0BC7 _ 89. 04 24
        call    sheet_alloc                             ; 0BCA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0BCF _ 89. 45, F4
        mov     eax, dword [memman]                     ; 0BD2 _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 0BD7 _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 0BDF _ 89. 04 24
        call    memman_alloc_4k                         ; 0BE2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0BE7 _ 89. 45, F0
        mov     dword [esp+10H], 99                     ; 0BEA _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 0BF2 _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 0BFA _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-10H]                    ; 0C02 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 0C05 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 0C09 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0C0C _ 89. 04 24
        call    sheet_setbuf                            ; 0C0F _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0C14 _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 0C19 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_366                   ; 0C21 _ C7. 44 24, 08, 0000001C(d)
        mov     edx, dword [ebp-0CH]                    ; 0C29 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0C2C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C30 _ 89. 04 24
        call    make_window8                            ; 0C33 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 0C38 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 0C40 _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 0C48 _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 0C50 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 0C58 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 0C60 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0C63 _ 89. 04 24
        call    make_textbox8                           ; 0C66 _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 0C6B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0C70 _ 89. 45, EC
        call    get_code32_addr                         ; 0C73 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0C78 _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 0C7B _ 8B. 45, EC
        mov     dword [eax+8CH], 0                      ; 0C7E _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-14H]                    ; 0C88 _ 8B. 45, EC
        mov     dword [eax+90H], 1073741824             ; 0C8B _ C7. 80, 00000090, 40000000
        mov     eax, console_task                       ; 0C95 _ B8, 00000000(d)
        sub     eax, dword [ebp-18H]                    ; 0C9A _ 2B. 45, E8
        mov     edx, eax                                ; 0C9D _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 0C9F _ 8B. 45, EC
        mov     dword [eax+4CH], edx                    ; 0CA2 _ 89. 50, 4C
        mov     eax, dword [ebp-14H]                    ; 0CA5 _ 8B. 45, EC
        mov     dword [eax+74H], 0                      ; 0CA8 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-14H]                    ; 0CAF _ 8B. 45, EC
        mov     dword [eax+78H], 8                      ; 0CB2 _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-14H]                    ; 0CB9 _ 8B. 45, EC
        mov     dword [eax+7CH], 32                     ; 0CBC _ C7. 40, 7C, 00000020
        mov     eax, dword [ebp-14H]                    ; 0CC3 _ 8B. 45, EC
        mov     dword [eax+80H], 24                     ; 0CC6 _ C7. 80, 00000080, 00000018
        mov     eax, dword [ebp-14H]                    ; 0CD0 _ 8B. 45, EC
        mov     dword [eax+84H], 0                      ; 0CD3 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-14H]                    ; 0CDD _ 8B. 45, EC
        mov     dword [eax+88H], 16                     ; 0CE0 _ C7. 80, 00000088, 00000010
        mov     eax, dword [memman]                     ; 0CEA _ A1, 00000000(d)
        mov     dword [esp+4H], 65536                   ; 0CEF _ C7. 44 24, 04, 00010000
        mov     dword [esp], eax                        ; 0CF7 _ 89. 04 24
        call    memman_alloc_4k                         ; 0CFA _ E8, FFFFFFFC(rel)
        lea     edx, [eax+0FFF4H]                       ; 0CFF _ 8D. 90, 0000FFF4
        mov     eax, dword [ebp-14H]                    ; 0D05 _ 8B. 45, EC
        mov     dword [eax+64H], edx                    ; 0D08 _ 89. 50, 64
        mov     eax, dword [ebp-14H]                    ; 0D0B _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0D0E _ 8B. 40, 64
        add     eax, 4                                  ; 0D11 _ 83. C0, 04
        mov     edx, dword [ebp-0CH]                    ; 0D14 _ 8B. 55, F4
        mov     dword [eax], edx                        ; 0D17 _ 89. 10
        mov     eax, dword [ebp-14H]                    ; 0D19 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 0D1C _ 8B. 40, 64
        add     eax, 8                                  ; 0D1F _ 83. C0, 08
        mov     ebx, eax                                ; 0D22 _ 89. C3
        mov     eax, dword [memman]                     ; 0D24 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0D29 _ 89. 04 24
        call    memman_total                            ; 0D2C _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 0D31 _ 89. 03
        mov     dword [esp+8H], 5                       ; 0D33 _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 0D3B _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-14H]                    ; 0D43 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 0D46 _ 89. 04 24
        call    task_run                                ; 0D49 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0D4E _ A1, 00000264(d)
        mov     dword [esp+0CH], 4                      ; 0D53 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 0D5B _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-0CH]                    ; 0D63 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0D66 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0D6A _ 89. 04 24
        call    sheet_slide                             ; 0D6D _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 0D72 _ A1, 00000264(d)
        mov     dword [esp+8H], 1                       ; 0D77 _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-0CH]                    ; 0D7F _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 0D82 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0D86 _ 89. 04 24
        call    sheet_updown                            ; 0D89 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0D8E _ 8B. 45, 08
        mov     edx, dword [ebp-14H]                    ; 0D91 _ 8B. 55, EC
        mov     dword [task_cons+eax*4], edx            ; 0D94 _ 89. 14 85, 00000274(d)
        mov     eax, dword [ebp-0CH]                    ; 0D9B _ 8B. 45, F4
        add     esp, 52                                 ; 0D9E _ 83. C4, 34
        pop     ebx                                     ; 0DA1 _ 5B
        pop     ebp                                     ; 0DA2 _ 5D
        ret                                             ; 0DA3 _ C3
; launch_console End of function

kill_process:; Function begin
        push    ebp                                     ; 0DA4 _ 55
        mov     ebp, esp                                ; 0DA5 _ 89. E5
        sub     esp, 40                                 ; 0DA7 _ 83. EC, 28
        call    task_now                                ; 0DAA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0DAF _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 0DB2 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 0DB5 _ 8B. 90, 00000094
        mov     eax, dword [ebp-0CH]                    ; 0DBB _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 0DBE _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 0DC4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0DC8 _ 89. 04 24
        call    cons_newline                            ; 0DCB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 0DD0 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 0DD3 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 0DD9 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 0DDC _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 0DDF _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 0DE5 _ 8B. 45, F4
        add     eax, 48                                 ; 0DE8 _ 83. C0, 30
        mov     dword [esp], eax                        ; 0DEB _ 89. 04 24
        call    asm_end_app                             ; 0DEE _ E8, FFFFFFFC(rel)
        leave                                           ; 0DF3 _ C9
        ret                                             ; 0DF4 _ C3
; kill_process End of function

cmd_dir:; Function begin
        push    ebp                                     ; 0DF5 _ 55
        mov     ebp, esp                                ; 0DF6 _ 89. E5
        push    ebx                                     ; 0DF8 _ 53
        sub     esp, 68                                 ; 0DF9 _ 83. EC, 44
        call    task_now                                ; 0DFC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0E01 _ 89. 45, E8
        mov     dword [ebp-0CH], 78848                  ; 0E04 _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 0E0B _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 0E10 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 0E18 _ 89. 04 24
        call    memman_alloc                            ; 0E1B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0E20 _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 0E23 _ 8B. 45, E4
        add     eax, 12                                 ; 0E26 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0E29 _ C6. 00, 00
        jmp     ?_042                                   ; 0E2C _ E9, 0000013C

?_035:  mov     dword [ebp-10H], 0                      ; 0E31 _ C7. 45, F0, 00000000
        jmp     ?_038                                   ; 0E38 _ EB, 2C

?_036:  mov     edx, dword [ebp-0CH]                    ; 0E3A _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 0E3D _ 8B. 45, F0
        add     eax, edx                                ; 0E40 _ 01. D0
        movzx   eax, byte [eax]                         ; 0E42 _ 0F B6. 00
        test    al, al                                  ; 0E45 _ 84. C0
        jz      ?_037                                   ; 0E47 _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 0E49 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0E4C _ 8B. 45, E4
        add     edx, eax                                ; 0E4F _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 0E51 _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 0E54 _ 8B. 45, F0
        add     eax, ecx                                ; 0E57 _ 01. C8
        movzx   eax, byte [eax]                         ; 0E59 _ 0F B6. 00
        mov     byte [edx], al                          ; 0E5C _ 88. 02
        add     dword [ebp-10H], 1                      ; 0E5E _ 83. 45, F0, 01
        jmp     ?_038                                   ; 0E62 _ EB, 02

?_037:  jmp     ?_039                                   ; 0E64 _ EB, 06

?_038:  cmp     dword [ebp-10H], 7                      ; 0E66 _ 83. 7D, F0, 07
        jle     ?_036                                   ; 0E6A _ 7E, CE
?_039:  mov     dword [ebp-14H], 0                      ; 0E6C _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 0E73 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0E76 _ 8B. 45, E4
        add     eax, edx                                ; 0E79 _ 01. D0
        mov     byte [eax], 46                          ; 0E7B _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 0E7E _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 0E82 _ C7. 45, EC, 00000000
        jmp     ?_041                                   ; 0E89 _ EB, 1E

?_040:  mov     edx, dword [ebp-10H]                    ; 0E8B _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 0E8E _ 8B. 45, E4
        add     edx, eax                                ; 0E91 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 0E93 _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 0E96 _ 8B. 45, EC
        add     eax, ecx                                ; 0E99 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 0E9B _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 0E9F _ 88. 02
        add     dword [ebp-10H], 1                      ; 0EA1 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 0EA5 _ 83. 45, EC, 01
?_041:  cmp     dword [ebp-14H], 2                      ; 0EA9 _ 83. 7D, EC, 02
        jle     ?_040                                   ; 0EAD _ 7E, DC
        mov     eax, dword [ebp-18H]                    ; 0EAF _ 8B. 45, E8
        mov     ecx, dword [eax+9CH]                    ; 0EB2 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-18H]                    ; 0EB8 _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 0EBB _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 0EC1 _ A1, 00000264(d)
        mov     ebx, dword [ebp-1CH]                    ; 0EC6 _ 8B. 5D, E4
        mov     dword [esp+14H], ebx                    ; 0EC9 _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 0ECD _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 0ED5 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 0ED9 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 0EE1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0EE5 _ 89. 04 24
        call    showString                              ; 0EE8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], 136                    ; 0EED _ C7. 45, E0, 00000088
        mov     eax, dword [ebp-0CH]                    ; 0EF4 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 0EF7 _ 8B. 40, 1C
        mov     dword [esp], eax                        ; 0EFA _ 89. 04 24
        call    intToHexStr                             ; 0EFD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 0F02 _ 89. 45, DC
        mov     eax, dword [ebp-18H]                    ; 0F05 _ 8B. 45, E8
        mov     ecx, dword [eax+9CH]                    ; 0F08 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-18H]                    ; 0F0E _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 0F11 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 0F17 _ A1, 00000264(d)
        mov     ebx, dword [ebp-24H]                    ; 0F1C _ 8B. 5D, DC
        mov     dword [esp+14H], ebx                    ; 0F1F _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 0F23 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 0F2B _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-20H]                    ; 0F2F _ 8B. 4D, E0
        mov     dword [esp+8H], ecx                     ; 0F32 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0F36 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0F3A _ 89. 04 24
        call    showString                              ; 0F3D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 0F42 _ 8B. 45, E8
        mov     edx, dword [eax+94H]                    ; 0F45 _ 8B. 90, 00000094
        mov     eax, dword [ebp-18H]                    ; 0F4B _ 8B. 45, E8
        mov     eax, dword [eax+9CH]                    ; 0F4E _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 0F54 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0F58 _ 89. 04 24
        call    cons_newline                            ; 0F5B _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-18H]                    ; 0F60 _ 8B. 55, E8
        mov     dword [edx+9CH], eax                    ; 0F63 _ 89. 82, 0000009C
        add     dword [ebp-0CH], 32                     ; 0F69 _ 83. 45, F4, 20
?_042:  mov     eax, dword [ebp-0CH]                    ; 0F6D _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 0F70 _ 0F B6. 00
        test    al, al                                  ; 0F73 _ 84. C0
        jne     ?_035                                   ; 0F75 _ 0F 85, FFFFFEB6
        mov     edx, dword [ebp-1CH]                    ; 0F7B _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 0F7E _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 0F83 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 0F8B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0F8F _ 89. 04 24
        call    memman_free                             ; 0F92 _ E8, FFFFFFFC(rel)
        add     esp, 68                                 ; 0F97 _ 83. C4, 44
        pop     ebx                                     ; 0F9A _ 5B
        pop     ebp                                     ; 0F9B _ 5D
        ret                                             ; 0F9C _ C3
; cmd_dir End of function

cmd_type:; Function begin
        push    ebp                                     ; 0F9D _ 55
        mov     ebp, esp                                ; 0F9E _ 89. E5
        push    esi                                     ; 0FA0 _ 56
        push    ebx                                     ; 0FA1 _ 53
        sub     esp, 96                                 ; 0FA2 _ 83. EC, 60
        call    task_now                                ; 0FA5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 0FAA _ 89. 45, DC
        mov     eax, dword [memman]                     ; 0FAD _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 0FB2 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 0FBA _ 89. 04 24
        call    memman_alloc                            ; 0FBD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 0FC2 _ 89. 45, D8
        mov     eax, dword [ebp-28H]                    ; 0FC5 _ 8B. 45, D8
        add     eax, 12                                 ; 0FC8 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 0FCB _ C6. 00, 00
        mov     dword [ebp-0CH], 0                      ; 0FCE _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 5                      ; 0FD5 _ C7. 45, F0, 00000005
        mov     dword [ebp-10H], 5                      ; 0FDC _ C7. 45, F0, 00000005
        jmp     ?_045                                   ; 0FE3 _ EB, 30

?_043:  mov     edx, dword [ebp-10H]                    ; 0FE5 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 0FE8 _ 8B. 45, 08
        add     eax, edx                                ; 0FEB _ 01. D0
        movzx   eax, byte [eax]                         ; 0FED _ 0F B6. 00
        test    al, al                                  ; 0FF0 _ 84. C0
        jz      ?_044                                   ; 0FF2 _ 74, 1F
        mov     edx, dword [ebp-0CH]                    ; 0FF4 _ 8B. 55, F4
        mov     eax, dword [ebp-28H]                    ; 0FF7 _ 8B. 45, D8
        add     edx, eax                                ; 0FFA _ 01. C2
        mov     ecx, dword [ebp-10H]                    ; 0FFC _ 8B. 4D, F0
        mov     eax, dword [ebp+8H]                     ; 0FFF _ 8B. 45, 08
        add     eax, ecx                                ; 1002 _ 01. C8
        movzx   eax, byte [eax]                         ; 1004 _ 0F B6. 00
        mov     byte [edx], al                          ; 1007 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 1009 _ 83. 45, F4, 01
        add     dword [ebp-10H], 1                      ; 100D _ 83. 45, F0, 01
        jmp     ?_045                                   ; 1011 _ EB, 02

?_044:  jmp     ?_046                                   ; 1013 _ EB, 06

?_045:  cmp     dword [ebp-10H], 16                     ; 1015 _ 83. 7D, F0, 10
        jle     ?_043                                   ; 1019 _ 7E, CA
?_046:  mov     edx, dword [ebp-0CH]                    ; 101B _ 8B. 55, F4
        mov     eax, dword [ebp-28H]                    ; 101E _ 8B. 45, D8
        add     eax, edx                                ; 1021 _ 01. D0
        mov     byte [eax], 0                           ; 1023 _ C6. 00, 00
        mov     dword [ebp-14H], 78848                  ; 1026 _ C7. 45, EC, 00013400
        jmp     ?_062                                   ; 102D _ E9, 000002A2

?_047:  mov     byte [ebp-31H], 0                       ; 1032 _ C6. 45, CF, 00
        mov     dword [ebp-18H], 0                      ; 1036 _ C7. 45, E8, 00000000
        jmp     ?_050                                   ; 103D _ EB, 2C

?_048:  mov     edx, dword [ebp-14H]                    ; 103F _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 1042 _ 8B. 45, E8
        add     eax, edx                                ; 1045 _ 01. D0
        movzx   eax, byte [eax]                         ; 1047 _ 0F B6. 00
        test    al, al                                  ; 104A _ 84. C0
        jz      ?_049                                   ; 104C _ 74, 1B
        mov     edx, dword [ebp-14H]                    ; 104E _ 8B. 55, EC
        mov     eax, dword [ebp-18H]                    ; 1051 _ 8B. 45, E8
        add     eax, edx                                ; 1054 _ 01. D0
        movzx   eax, byte [eax]                         ; 1056 _ 0F B6. 00
        lea     ecx, [ebp-3DH]                          ; 1059 _ 8D. 4D, C3
        mov     edx, dword [ebp-18H]                    ; 105C _ 8B. 55, E8
        add     edx, ecx                                ; 105F _ 01. CA
        mov     byte [edx], al                          ; 1061 _ 88. 02
        add     dword [ebp-18H], 1                      ; 1063 _ 83. 45, E8, 01
        jmp     ?_050                                   ; 1067 _ EB, 02

?_049:  jmp     ?_051                                   ; 1069 _ EB, 06

?_050:  cmp     dword [ebp-18H], 7                      ; 106B _ 83. 7D, E8, 07
        jle     ?_048                                   ; 106F _ 7E, CE
?_051:  mov     dword [ebp-1CH], 0                      ; 1071 _ C7. 45, E4, 00000000
        lea     edx, [ebp-3DH]                          ; 1078 _ 8D. 55, C3
        mov     eax, dword [ebp-18H]                    ; 107B _ 8B. 45, E8
        add     eax, edx                                ; 107E _ 01. D0
        mov     byte [eax], 46                          ; 1080 _ C6. 00, 2E
        add     dword [ebp-18H], 1                      ; 1083 _ 83. 45, E8, 01
        mov     dword [ebp-1CH], 0                      ; 1087 _ C7. 45, E4, 00000000
        jmp     ?_053                                   ; 108E _ EB, 1E

?_052:  mov     edx, dword [ebp-14H]                    ; 1090 _ 8B. 55, EC
        mov     eax, dword [ebp-1CH]                    ; 1093 _ 8B. 45, E4
        add     eax, edx                                ; 1096 _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 1098 _ 0F B6. 40, 08
        lea     ecx, [ebp-3DH]                          ; 109C _ 8D. 4D, C3
        mov     edx, dword [ebp-18H]                    ; 109F _ 8B. 55, E8
        add     edx, ecx                                ; 10A2 _ 01. CA
        mov     byte [edx], al                          ; 10A4 _ 88. 02
        add     dword [ebp-18H], 1                      ; 10A6 _ 83. 45, E8, 01
        add     dword [ebp-1CH], 1                      ; 10AA _ 83. 45, E4, 01
?_053:  cmp     dword [ebp-1CH], 2                      ; 10AE _ 83. 7D, E4, 02
        jle     ?_052                                   ; 10B2 _ 7E, DC
        lea     eax, [ebp-3DH]                          ; 10B4 _ 8D. 45, C3
        mov     dword [esp+4H], eax                     ; 10B7 _ 89. 44 24, 04
        mov     eax, dword [ebp-28H]                    ; 10BB _ 8B. 45, D8
        mov     dword [esp], eax                        ; 10BE _ 89. 04 24
        call    strcmp                                  ; 10C1 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 10C6 _ 83. F8, 01
        jne     ?_061                                   ; 10C9 _ 0F 85, 00000201
        mov     dword [ebp-2CH], 88064                  ; 10CF _ C7. 45, D4, 00015800
        mov     eax, dword [ebp-14H]                    ; 10D6 _ 8B. 45, EC
        movzx   eax, word [eax+1AH]                     ; 10D9 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 10DD _ 0F B7. C0
        shl     eax, 9                                  ; 10E0 _ C1. E0, 09
        add     dword [ebp-2CH], eax                    ; 10E3 _ 01. 45, D4
        mov     eax, dword [ebp-14H]                    ; 10E6 _ 8B. 45, EC
        mov     eax, dword [eax+1CH]                    ; 10E9 _ 8B. 40, 1C
        mov     dword [ebp-30H], eax                    ; 10EC _ 89. 45, D0
        mov     dword [ebp-20H], 0                      ; 10EF _ C7. 45, E0, 00000000
        mov     eax, dword [ebp-24H]                    ; 10F6 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 10F9 _ C7. 80, 00000098, 00000010
        mov     dword [ebp-20H], 0                      ; 1103 _ C7. 45, E0, 00000000
        jmp     ?_060                                   ; 110A _ E9, 000001B2

?_054:  mov     edx, dword [ebp-20H]                    ; 110F _ 8B. 55, E0
        mov     eax, dword [ebp-2CH]                    ; 1112 _ 8B. 45, D4
        add     eax, edx                                ; 1115 _ 01. D0
        movzx   eax, byte [eax]                         ; 1117 _ 0F B6. 00
        mov     byte [ebp-3FH], al                      ; 111A _ 88. 45, C1
        mov     byte [ebp-3EH], 0                       ; 111D _ C6. 45, C2, 00
        movzx   eax, byte [ebp-3FH]                     ; 1121 _ 0F B6. 45, C1
        cmp     al, 9                                   ; 1125 _ 3C, 09
        jne     ?_057                                   ; 1127 _ 0F 85, 000000A7
?_055:  mov     eax, dword [ebp-24H]                    ; 112D _ 8B. 45, DC
        mov     ebx, dword [eax+9CH]                    ; 1130 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-24H]                    ; 1136 _ 8B. 45, DC
        mov     ecx, dword [eax+98H]                    ; 1139 _ 8B. 88, 00000098
        mov     eax, dword [ebp-24H]                    ; 113F _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1142 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1148 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_367                  ; 114D _ C7. 44 24, 14, 00000024(d)
        mov     dword [esp+10H], 7                      ; 1155 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 115D _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1161 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1165 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1169 _ 89. 04 24
        call    showString                              ; 116C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 1171 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 1174 _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 117A _ 8D. 50, 08
        mov     eax, dword [ebp-24H]                    ; 117D _ 8B. 45, DC
        mov     dword [eax+98H], edx                    ; 1180 _ 89. 90, 00000098
        mov     eax, dword [ebp-24H]                    ; 1186 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 1189 _ 8B. 80, 00000098
        cmp     eax, 248                                ; 118F _ 3D, 000000F8
        jnz     ?_056                                   ; 1194 _ 75, 39
        mov     eax, dword [ebp-24H]                    ; 1196 _ 8B. 45, DC
        mov     dword [eax+98H], 8                      ; 1199 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-24H]                    ; 11A3 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 11A6 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 11AC _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 11AF _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 11B5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 11B9 _ 89. 04 24
        call    cons_newline                            ; 11BC _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 11C1 _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 11C4 _ 89. 82, 0000009C
        jmp     ?_055                                   ; 11CA _ E9, FFFFFF5E

?_056:  jmp     ?_055                                   ; 11CF _ E9, FFFFFF59

?_057:  movzx   eax, byte [ebp-3FH]                     ; 11D4 _ 0F B6. 45, C1
        cmp     al, 10                                  ; 11D8 _ 3C, 0A
        jnz     ?_058                                   ; 11DA _ 75, 39
        mov     eax, dword [ebp-24H]                    ; 11DC _ 8B. 45, DC
        mov     dword [eax+98H], 8                      ; 11DF _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-24H]                    ; 11E9 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 11EC _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 11F2 _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 11F5 _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 11FB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 11FF _ 89. 04 24
        call    cons_newline                            ; 1202 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 1207 _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 120A _ 89. 82, 0000009C
        jmp     ?_059                                   ; 1210 _ E9, 000000A8

?_058:  movzx   eax, byte [ebp-3FH]                     ; 1215 _ 0F B6. 45, C1
        cmp     al, 13                                  ; 1219 _ 3C, 0D
        je      ?_059                                   ; 121B _ 0F 84, 0000009C
        mov     eax, dword [ebp-24H]                    ; 1221 _ 8B. 45, DC
        mov     ebx, dword [eax+9CH]                    ; 1224 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-24H]                    ; 122A _ 8B. 45, DC
        mov     ecx, dword [eax+98H]                    ; 122D _ 8B. 88, 00000098
        mov     eax, dword [ebp-24H]                    ; 1233 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1236 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 123C _ A1, 00000264(d)
        lea     esi, [ebp-3FH]                          ; 1241 _ 8D. 75, C1
        mov     dword [esp+14H], esi                    ; 1244 _ 89. 74 24, 14
        mov     dword [esp+10H], 7                      ; 1248 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 1250 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1254 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1258 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 125C _ 89. 04 24
        call    showString                              ; 125F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 1264 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 1267 _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 126D _ 8D. 50, 08
        mov     eax, dword [ebp-24H]                    ; 1270 _ 8B. 45, DC
        mov     dword [eax+98H], edx                    ; 1273 _ 89. 90, 00000098
        mov     eax, dword [ebp-24H]                    ; 1279 _ 8B. 45, DC
        mov     eax, dword [eax+98H]                    ; 127C _ 8B. 80, 00000098
        cmp     eax, 248                                ; 1282 _ 3D, 000000F8
        jnz     ?_059                                   ; 1287 _ 75, 34
        mov     eax, dword [ebp-24H]                    ; 1289 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 128C _ C7. 80, 00000098, 00000010
        mov     eax, dword [ebp-24H]                    ; 1296 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 1299 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 129F _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 12A2 _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 12A8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 12AC _ 89. 04 24
        call    cons_newline                            ; 12AF _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 12B4 _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 12B7 _ 89. 82, 0000009C
?_059:  add     dword [ebp-20H], 1                      ; 12BD _ 83. 45, E0, 01
?_060:  mov     eax, dword [ebp-20H]                    ; 12C1 _ 8B. 45, E0
        cmp     eax, dword [ebp-30H]                    ; 12C4 _ 3B. 45, D0
        jl      ?_054                                   ; 12C7 _ 0F 8C, FFFFFE42
        nop                                             ; 12CD _ 90
        jmp     ?_063                                   ; 12CE _ EB, 12

?_061:  add     dword [ebp-14H], 32                     ; 12D0 _ 83. 45, EC, 20
?_062:  mov     eax, dword [ebp-14H]                    ; 12D4 _ 8B. 45, EC
        movzx   eax, byte [eax]                         ; 12D7 _ 0F B6. 00
        test    al, al                                  ; 12DA _ 84. C0
        jne     ?_047                                   ; 12DC _ 0F 85, FFFFFD50
?_063:  mov     eax, dword [ebp-24H]                    ; 12E2 _ 8B. 45, DC
        mov     edx, dword [eax+94H]                    ; 12E5 _ 8B. 90, 00000094
        mov     eax, dword [ebp-24H]                    ; 12EB _ 8B. 45, DC
        mov     eax, dword [eax+9CH]                    ; 12EE _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 12F4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 12F8 _ 89. 04 24
        call    cons_newline                            ; 12FB _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-24H]                    ; 1300 _ 8B. 55, DC
        mov     dword [edx+9CH], eax                    ; 1303 _ 89. 82, 0000009C
        mov     edx, dword [ebp-28H]                    ; 1309 _ 8B. 55, D8
        mov     eax, dword [memman]                     ; 130C _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 1311 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 1319 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 131D _ 89. 04 24
        call    memman_free                             ; 1320 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 1325 _ 8B. 45, DC
        mov     dword [eax+98H], 16                     ; 1328 _ C7. 80, 00000098, 00000010
        add     esp, 96                                 ; 1332 _ 83. C4, 60
        pop     ebx                                     ; 1335 _ 5B
        pop     esi                                     ; 1336 _ 5E
        pop     ebp                                     ; 1337 _ 5D
        ret                                             ; 1338 _ C3
; cmd_type End of function

cmd_mem:; Function begin
        push    ebp                                     ; 1339 _ 55
        mov     ebp, esp                                ; 133A _ 89. E5
        push    ebx                                     ; 133C _ 53
        sub     esp, 52                                 ; 133D _ 83. EC, 34
        call    task_now                                ; 1340 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1345 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 1348 _ 8B. 45, 08
        lea     edx, [eax+3FFH]                         ; 134B _ 8D. 90, 000003FF
        test    eax, eax                                ; 1351 _ 85. C0
        cmovs   eax, edx                                ; 1353 _ 0F 48. C2
        sar     eax, 10                                 ; 1356 _ C1. F8, 0A
        mov     dword [esp], eax                        ; 1359 _ 89. 04 24
        call    intToHexStr                             ; 135C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1361 _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 1364 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 1367 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 136D _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 1370 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1376 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_368                  ; 137B _ C7. 44 24, 14, 00000026(d)
        mov     dword [esp+10H], 7                      ; 1383 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 138B _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 138F _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 1397 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 139B _ 89. 04 24
        call    showString                              ; 139E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 13A3 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 13A6 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 13AC _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 13AF _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 13B5 _ A1, 00000264(d)
        mov     ebx, dword [ebp-10H]                    ; 13BA _ 8B. 5D, F0
        mov     dword [esp+14H], ebx                    ; 13BD _ 89. 5C 24, 14
        mov     dword [esp+10H], 7                      ; 13C1 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 13C9 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 52                      ; 13CD _ C7. 44 24, 08, 00000034
        mov     dword [esp+4H], edx                     ; 13D5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 13D9 _ 89. 04 24
        call    showString                              ; 13DC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 13E1 _ 8B. 45, F4
        mov     ecx, dword [eax+9CH]                    ; 13E4 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 13EA _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 13ED _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 13F3 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_369                  ; 13F8 _ C7. 44 24, 14, 0000002C(d)
        mov     dword [esp+10H], 7                      ; 1400 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ecx                    ; 1408 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 126                     ; 140C _ C7. 44 24, 08, 0000007E
        mov     dword [esp+4H], edx                     ; 1414 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1418 _ 89. 04 24
        call    showString                              ; 141B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1420 _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 1423 _ 8B. 90, 00000094
        mov     eax, dword [ebp-0CH]                    ; 1429 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 142C _ 8B. 80, 0000009C
        mov     dword [esp+4H], edx                     ; 1432 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1436 _ 89. 04 24
        call    cons_newline                            ; 1439 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-0CH]                    ; 143E _ 8B. 55, F4
        mov     dword [edx+9CH], eax                    ; 1441 _ 89. 82, 0000009C
        add     esp, 52                                 ; 1447 _ 83. C4, 34
        pop     ebx                                     ; 144A _ 5B
        pop     ebp                                     ; 144B _ 5D
        ret                                             ; 144C _ C3
; cmd_mem End of function

cmd_cls:; Function begin
        push    ebp                                     ; 144D _ 55
        mov     ebp, esp                                ; 144E _ 89. E5
        sub     esp, 56                                 ; 1450 _ 83. EC, 38
        call    task_now                                ; 1453 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1458 _ 89. 45, EC
        mov     dword [ebp-0CH], 8                      ; 145B _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 28                     ; 1462 _ C7. 45, F0, 0000001C
        mov     dword [ebp-10H], 28                     ; 1469 _ C7. 45, F0, 0000001C
        jmp     ?_067                                   ; 1470 _ EB, 41

?_064:  mov     dword [ebp-0CH], 8                      ; 1472 _ C7. 45, F4, 00000008
        jmp     ?_066                                   ; 1479 _ EB, 2B

?_065:  mov     eax, dword [ebp-14H]                    ; 147B _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 147E _ 8B. 80, 00000094
        mov     edx, dword [eax]                        ; 1484 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 1486 _ 8B. 45, EC
        mov     eax, dword [eax+94H]                    ; 1489 _ 8B. 80, 00000094
        mov     eax, dword [eax+4H]                     ; 148F _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 1492 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 1496 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 1498 _ 8B. 45, F4
        add     eax, ecx                                ; 149B _ 01. C8
        add     eax, edx                                ; 149D _ 01. D0
        mov     byte [eax], 0                           ; 149F _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 14A2 _ 83. 45, F4, 01
?_066:  cmp     dword [ebp-0CH], 247                    ; 14A6 _ 81. 7D, F4, 000000F7
        jle     ?_065                                   ; 14AD _ 7E, CC
        add     dword [ebp-10H], 1                      ; 14AF _ 83. 45, F0, 01
?_067:  cmp     dword [ebp-10H], 155                    ; 14B3 _ 81. 7D, F0, 0000009B
        jle     ?_064                                   ; 14BA _ 7E, B6
        mov     eax, dword [ebp-14H]                    ; 14BC _ 8B. 45, EC
        mov     edx, dword [eax+94H]                    ; 14BF _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 14C5 _ A1, 00000264(d)
        mov     dword [esp+14H], 156                    ; 14CA _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 14D2 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 14DA _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 14E2 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 14EA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 14EE _ 89. 04 24
        call    sheet_refresh                           ; 14F1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 14F6 _ 8B. 45, EC
        mov     dword [eax+9CH], 28                     ; 14F9 _ C7. 80, 0000009C, 0000001C
        mov     eax, dword [ebp-14H]                    ; 1503 _ 8B. 45, EC
        mov     edx, dword [eax+94H]                    ; 1506 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 150C _ A1, 00000264(d)
        mov     dword [esp+14H], ?_370                  ; 1511 _ C7. 44 24, 14, 00000030(d)
        mov     dword [esp+10H], 7                      ; 1519 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 1521 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 1529 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1531 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1535 _ 89. 04 24
        call    showString                              ; 1538 _ E8, FFFFFFFC(rel)
        leave                                           ; 153D _ C9
        ret                                             ; 153E _ C3
; cmd_cls End of function

cmd_hlt:; Function begin
        push    ebp                                     ; 153F _ 55
        mov     ebp, esp                                ; 1540 _ 89. E5
        sub     esp, 72                                 ; 1542 _ 83. EC, 48
        call    io_cli                                  ; 1545 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 154A _ A1, 00000000(d)
        mov     dword [esp+4H], 16                      ; 154F _ C7. 44 24, 04, 00000010
        mov     dword [esp], eax                        ; 1557 _ 89. 04 24
        call    memman_alloc                            ; 155A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 155F _ 89. 45, EC
        call    task_now                                ; 1562 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1567 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 156A _ 8B. 45, E8
        mov     edx, dword [ebp-14H]                    ; 156D _ 8B. 55, EC
        mov     dword [eax+0ACH], edx                   ; 1570 _ 89. 90, 000000AC
        mov     eax, dword [ebp-14H]                    ; 1576 _ 8B. 45, EC
        mov     dword [esp+4H], eax                     ; 1579 _ 89. 44 24, 04
        mov     dword [esp], ?_371                      ; 157D _ C7. 04 24, 00000032(d)
        call    file_loadfile                           ; 1584 _ E8, FFFFFFFC(rel)
        call    get_addr_gdt                            ; 1589 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 158E _ 89. 45, E4
        mov     dword [ebp-0CH], 21                     ; 1591 _ C7. 45, F4, 00000015
        mov     dword [ebp-10H], 22                     ; 1598 _ C7. 45, F0, 00000016
        mov     eax, dword [task_cons]                  ; 159F _ A1, 00000274(d)
        cmp     eax, dword [ebp-18H]                    ; 15A4 _ 3B. 45, E8
        jnz     ?_068                                   ; 15A7 _ 75, 0E
        mov     dword [ebp-0CH], 23                     ; 15A9 _ C7. 45, F4, 00000017
        mov     dword [ebp-10H], 24                     ; 15B0 _ C7. 45, F0, 00000018
?_068:  mov     eax, dword [ebp-14H]                    ; 15B7 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 15BA _ 8B. 00
        mov     edx, dword [ebp-0CH]                    ; 15BC _ 8B. 55, F4
        lea     ecx, [edx*8]                            ; 15BF _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-1CH]                    ; 15C6 _ 8B. 55, E4
        add     edx, ecx                                ; 15C9 _ 01. CA
        mov     dword [esp+0CH], 16634                  ; 15CB _ C7. 44 24, 0C, 000040FA
        mov     dword [esp+8H], eax                     ; 15D3 _ 89. 44 24, 08
        mov     dword [esp+4H], 1048575                 ; 15D7 _ C7. 44 24, 04, 000FFFFF
        mov     dword [esp], edx                        ; 15DF _ 89. 14 24
        call    set_segmdesc                            ; 15E2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 15E7 _ A1, 00000000(d)
        mov     dword [esp+4H], 65536                   ; 15EC _ C7. 44 24, 04, 00010000
        mov     dword [esp], eax                        ; 15F4 _ 89. 04 24
        call    memman_alloc_4k                         ; 15F7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 15FC _ 89. 45, E0
        mov     eax, dword [ebp-14H]                    ; 15FF _ 8B. 45, EC
        mov     edx, dword [ebp-20H]                    ; 1602 _ 8B. 55, E0
        mov     dword [eax+4H], edx                     ; 1605 _ 89. 50, 04
        mov     eax, dword [ebp-20H]                    ; 1608 _ 8B. 45, E0
        mov     edx, dword [ebp-10H]                    ; 160B _ 8B. 55, F0
        lea     ecx, [edx*8]                            ; 160E _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-1CH]                    ; 1615 _ 8B. 55, E4
        add     edx, ecx                                ; 1618 _ 01. CA
        mov     dword [esp+0CH], 16626                  ; 161A _ C7. 44 24, 0C, 000040F2
        mov     dword [esp+8H], eax                     ; 1622 _ 89. 44 24, 08
        mov     dword [esp+4H], 65535                   ; 1626 _ C7. 44 24, 04, 0000FFFF
        mov     dword [esp], edx                        ; 162E _ 89. 14 24
        call    set_segmdesc                            ; 1631 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 1636 _ 8B. 45, E8
        mov     dword [eax+30H], 0                      ; 1639 _ C7. 40, 30, 00000000
        call    io_sti                                  ; 1640 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 1645 _ 8B. 45, E8
        lea     ecx, [eax+30H]                          ; 1648 _ 8D. 48, 30
        mov     eax, dword [ebp-10H]                    ; 164B _ 8B. 45, F0
        lea     edx, [eax*8]                            ; 164E _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-0CH]                    ; 1655 _ 8B. 45, F4
        shl     eax, 3                                  ; 1658 _ C1. E0, 03
        mov     dword [esp+10H], ecx                    ; 165B _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 165F _ 89. 54 24, 0C
        mov     dword [esp+8H], 65536                   ; 1663 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], eax                     ; 166B _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 166F _ C7. 04 24, 00000000
        call    start_app                               ; 1676 _ E8, FFFFFFFC(rel)
        call    io_cli                                  ; 167B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 1680 _ 8B. 45, EC
        mov     eax, dword [eax+8H]                     ; 1683 _ 8B. 40, 08
        mov     ecx, eax                                ; 1686 _ 89. C1
        mov     eax, dword [ebp-14H]                    ; 1688 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 168B _ 8B. 00
        mov     edx, eax                                ; 168D _ 89. C2
        mov     eax, dword [memman]                     ; 168F _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 1694 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1698 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 169C _ 89. 04 24
        call    memman_free_4k                          ; 169F _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-20H]                    ; 16A4 _ 8B. 55, E0
        mov     eax, dword [memman]                     ; 16A7 _ A1, 00000000(d)
        mov     dword [esp+8H], 65536                   ; 16AC _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], edx                     ; 16B4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 16B8 _ 89. 04 24
        call    memman_free_4k                          ; 16BB _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-14H]                    ; 16C0 _ 8B. 55, EC
        mov     eax, dword [memman]                     ; 16C3 _ A1, 00000000(d)
        mov     dword [esp+8H], 16                      ; 16C8 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 16D0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 16D4 _ 89. 04 24
        call    memman_free                             ; 16D7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 16DC _ 8B. 45, E8
        mov     dword [eax+0ACH], 0                     ; 16DF _ C7. 80, 000000AC, 00000000
        call    io_sti                                  ; 16E9 _ E8, FFFFFFFC(rel)
        leave                                           ; 16EE _ C9
        ret                                             ; 16EF _ C3
; cmd_hlt End of function

console_task:; Function begin
        push    ebp                                     ; 16F0 _ 55
        mov     ebp, esp                                ; 16F1 _ 89. E5
        push    esi                                     ; 16F3 _ 56
        push    ebx                                     ; 16F4 _ 53
        sub     esp, 80                                 ; 16F5 _ 83. EC, 50
        call    task_now                                ; 16F8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 16FD _ 89. 45, F0
        mov     dword [ebp-0CH], 0                      ; 1700 _ C7. 45, F4, 00000000
        mov     dword [ebp-14H], 0                      ; 1707 _ C7. 45, EC, 00000000
        mov     dword [ebp-18H], 0                      ; 170E _ C7. 45, E8, 00000000
        mov     eax, dword [memman]                     ; 1715 _ A1, 00000000(d)
        mov     dword [esp+4H], 128                     ; 171A _ C7. 44 24, 04, 00000080
        mov     dword [esp], eax                        ; 1722 _ 89. 04 24
        call    memman_alloc                            ; 1725 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 172A _ 89. 45, E4
        mov     eax, dword [memman]                     ; 172D _ A1, 00000000(d)
        mov     dword [esp+4H], 30                      ; 1732 _ C7. 44 24, 04, 0000001E
        mov     dword [esp], eax                        ; 173A _ 89. 04 24
        call    memman_alloc                            ; 173D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 1742 _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 1745 _ 8B. 45, F0
        mov     edx, dword [ebp+8H]                     ; 1748 _ 8B. 55, 08
        mov     dword [eax+94H], edx                    ; 174B _ 89. 90, 00000094
        mov     eax, dword [ebp-10H]                    ; 1751 _ 8B. 45, F0
        mov     dword [eax+98H], 16                     ; 1754 _ C7. 80, 00000098, 00000010
        mov     eax, dword [ebp-10H]                    ; 175E _ 8B. 45, F0
        mov     dword [eax+9CH], 28                     ; 1761 _ C7. 80, 0000009C, 0000001C
        mov     eax, dword [ebp-10H]                    ; 176B _ 8B. 45, F0
        mov     dword [eax+0A0H], -1                    ; 176E _ C7. 80, 000000A0, FFFFFFFF
        mov     eax, dword [ebp-10H]                    ; 1778 _ 8B. 45, F0
        lea     edx, [eax+10H]                          ; 177B _ 8D. 50, 10
        mov     eax, dword [ebp-10H]                    ; 177E _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 1781 _ 89. 44 24, 0C
        mov     eax, dword [ebp-1CH]                    ; 1785 _ 8B. 45, E4
        mov     dword [esp+8H], eax                     ; 1788 _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 178C _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 1794 _ 89. 14 24
        call    fifo8_init                              ; 1797 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 179C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 17A1 _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 17A4 _ 8B. 45, F0
        add     eax, 16                                 ; 17A7 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 17AA _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 17B2 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 17B6 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 17B9 _ 89. 04 24
        call    timer_init                              ; 17BC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 17C1 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 17C9 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 17CC _ 89. 04 24
        call    timer_settime                           ; 17CF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 17D4 _ 8B. 45, F0
        mov     edx, dword [ebp-24H]                    ; 17D7 _ 8B. 55, DC
        mov     dword [eax+0A8H], edx                   ; 17DA _ 89. 90, 000000A8
        mov     eax, dword [shtctl]                     ; 17E0 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_370                  ; 17E5 _ C7. 44 24, 14, 00000030(d)
        mov     dword [esp+10H], 7                      ; 17ED _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 17F5 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 17FD _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+8H]                     ; 1805 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1808 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 180C _ 89. 04 24
        call    showString                              ; 180F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], 0                      ; 1814 _ C7. 45, D8, 00000000
        mov     dword [ebp-2CH], 78848                  ; 181B _ C7. 45, D4, 00013400
        mov     dword [ebp-30H], 0                      ; 1822 _ C7. 45, D0, 00000000
?_069:  call    io_cli                                  ; 1829 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 182E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1833 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 1836 _ 8B. 45, F0
        add     eax, 16                                 ; 1839 _ 83. C0, 10
        mov     dword [esp], eax                        ; 183C _ 89. 04 24
        call    fifo8_status                            ; 183F _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1844 _ 85. C0
        jnz     ?_070                                   ; 1846 _ 75, 0A
        call    io_sti                                  ; 1848 _ E8, FFFFFFFC(rel)
        jmp     ?_084                                   ; 184D _ E9, 0000041E

?_070:  mov     eax, dword [ebp-10H]                    ; 1852 _ 8B. 45, F0
        add     eax, 16                                 ; 1855 _ 83. C0, 10
        mov     dword [esp], eax                        ; 1858 _ 89. 04 24
        call    fifo8_get                               ; 185B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 1860 _ 89. 45, CC
        cmp     dword [ebp-34H], 1                      ; 1863 _ 83. 7D, CC, 01
        jg      ?_073                                   ; 1867 _ 7F, 6E
        cmp     dword [ebp-0CH], 0                      ; 1869 _ 83. 7D, F4, 00
        js      ?_073                                   ; 186D _ 78, 68
        cmp     dword [ebp-34H], 0                      ; 186F _ 83. 7D, CC, 00
        jz      ?_071                                   ; 1873 _ 74, 26
        mov     eax, dword [ebp-10H]                    ; 1875 _ 8B. 45, F0
        add     eax, 16                                 ; 1878 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 187B _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 1883 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 1887 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 188A _ 89. 04 24
        call    timer_init                              ; 188D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 7                      ; 1892 _ C7. 45, F4, 00000007
        jmp     ?_072                                   ; 1899 _ EB, 24

?_071:  mov     eax, dword [ebp-10H]                    ; 189B _ 8B. 45, F0
        add     eax, 16                                 ; 189E _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 18A1 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 18A9 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 18AD _ 8B. 45, DC
        mov     dword [esp], eax                        ; 18B0 _ 89. 04 24
        call    timer_init                              ; 18B3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 18B8 _ C7. 45, F4, 00000000
?_072:  mov     dword [esp+4H], 50                      ; 18BF _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 18C7 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 18CA _ 89. 04 24
        call    timer_settime                           ; 18CD _ E8, FFFFFFFC(rel)
        jmp     ?_083                                   ; 18D2 _ E9, 00000358

?_073:  cmp     dword [ebp-34H], 87                     ; 18D7 _ 83. 7D, CC, 57
        jnz     ?_074                                   ; 18DB _ 75, 3C
        mov     dword [ebp-0CH], 7                      ; 18DD _ C7. 45, F4, 00000007
        mov     eax, dword [ebp-10H]                    ; 18E4 _ 8B. 45, F0
        add     eax, 16                                 ; 18E7 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 18EA _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 18F2 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 18F6 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 18F9 _ 89. 04 24
        call    timer_init                              ; 18FC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 1901 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 1909 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 190C _ 89. 04 24
        call    timer_settime                           ; 190F _ E8, FFFFFFFC(rel)
        jmp     ?_083                                   ; 1914 _ E9, 00000316

?_074:  cmp     dword [ebp-34H], 88                     ; 1919 _ 83. 7D, CC, 58
        jne     ?_075                                   ; 191D _ 0F 85, 000000A1
        mov     edx, dword [sht_back]                   ; 1923 _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 1929 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_372                  ; 192E _ C7. 44 24, 14, 0000003A(d)
        mov     dword [esp+10H], 7                      ; 1936 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 176                    ; 193E _ C7. 44 24, 0C, 000000B0
        mov     dword [esp+8H], 0                       ; 1946 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 194E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1952 _ 89. 04 24
        call    showString                              ; 1955 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 195A _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 195D _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1963 _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1966 _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 196C _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1971 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1979 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 197D _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1981 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1984 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1988 _ 89. 04 24
        call    set_cursor                              ; 198B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], -1                     ; 1990 _ C7. 45, F4, FFFFFFFF
        mov     eax, dword [task_main]                  ; 1997 _ A1, 0000027C(d)
        mov     dword [esp+8H], 0                       ; 199C _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 19A4 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 19AC _ 89. 04 24
        call    task_run                                ; 19AF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 19B4 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 19B7 _ 89. 04 24
        call    task_sleep                              ; 19BA _ E8, FFFFFFFC(rel)
        jmp     ?_083                                   ; 19BF _ E9, 0000026B

?_075:  cmp     dword [ebp-34H], 28                     ; 19C4 _ 83. 7D, CC, 1C
        jne     ?_081                                   ; 19C8 _ 0F 85, 00000149
        mov     eax, dword [ebp-10H]                    ; 19CE _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 19D1 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 19D7 _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 19DA _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 19E0 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 19E5 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 19ED _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 19F1 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 19F5 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 19F8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19FC _ 89. 04 24
        call    set_cursor                              ; 19FF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1A04 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1A07 _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1A0D _ 8D. 50, 07
        test    eax, eax                                ; 1A10 _ 85. C0
        cmovs   eax, edx                                ; 1A12 _ 0F 48. C2
        sar     eax, 3                                  ; 1A15 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1A18 _ 8D. 50, FE
        mov     eax, dword [ebp-20H]                    ; 1A1B _ 8B. 45, E0
        add     eax, edx                                ; 1A1E _ 01. D0
        mov     byte [eax], 0                           ; 1A20 _ C6. 00, 00
        mov     eax, dword [ebp-10H]                    ; 1A23 _ 8B. 45, F0
        mov     eax, dword [eax+9CH]                    ; 1A26 _ 8B. 80, 0000009C
        mov     edx, dword [ebp+8H]                     ; 1A2C _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1A2F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A33 _ 89. 04 24
        call    cons_newline                            ; 1A36 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-10H]                    ; 1A3B _ 8B. 55, F0
        mov     dword [edx+9CH], eax                    ; 1A3E _ 89. 82, 0000009C
        mov     dword [esp+4H], ?_373                   ; 1A44 _ C7. 44 24, 04, 00000040(d)
        mov     eax, dword [ebp-20H]                    ; 1A4C _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1A4F _ 89. 04 24
        call    strcmp                                  ; 1A52 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1A57 _ 83. F8, 01
        jnz     ?_076                                   ; 1A5A _ 75, 10
        mov     eax, dword [ebp+0CH]                    ; 1A5C _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 1A5F _ 89. 04 24
        call    cmd_mem                                 ; 1A62 _ E8, FFFFFFFC(rel)
        jmp     ?_080                                   ; 1A67 _ E9, 00000099

?_076:  mov     dword [esp+4H], ?_374                   ; 1A6C _ C7. 44 24, 04, 00000044(d)
        mov     eax, dword [ebp-20H]                    ; 1A74 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1A77 _ 89. 04 24
        call    strcmp                                  ; 1A7A _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1A7F _ 83. F8, 01
        jnz     ?_077                                   ; 1A82 _ 75, 07
        call    cmd_cls                                 ; 1A84 _ E8, FFFFFFFC(rel)
        jmp     ?_080                                   ; 1A89 _ EB, 7A

?_077:  mov     dword [esp+4H], ?_375                   ; 1A8B _ C7. 44 24, 04, 00000048(d)
        mov     eax, dword [ebp-20H]                    ; 1A93 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1A96 _ 89. 04 24
        call    strcmp                                  ; 1A99 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1A9E _ 83. F8, 01
        jnz     ?_078                                   ; 1AA1 _ 75, 07
        call    cmd_hlt                                 ; 1AA3 _ E8, FFFFFFFC(rel)
        jmp     ?_080                                   ; 1AA8 _ EB, 5B

?_078:  mov     dword [esp+4H], ?_376                   ; 1AAA _ C7. 44 24, 04, 0000004C(d)
        mov     eax, dword [ebp-20H]                    ; 1AB2 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1AB5 _ 89. 04 24
        call    strcmp                                  ; 1AB8 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 1ABD _ 83. F8, 01
        jnz     ?_079                                   ; 1AC0 _ 75, 07
        call    cmd_dir                                 ; 1AC2 _ E8, FFFFFFFC(rel)
        jmp     ?_080                                   ; 1AC7 _ EB, 3C

?_079:  mov     eax, dword [ebp-20H]                    ; 1AC9 _ 8B. 45, E0
        movzx   eax, byte [eax]                         ; 1ACC _ 0F B6. 00
        cmp     al, 116                                 ; 1ACF _ 3C, 74
        jnz     ?_080                                   ; 1AD1 _ 75, 32
        mov     eax, dword [ebp-20H]                    ; 1AD3 _ 8B. 45, E0
        add     eax, 1                                  ; 1AD6 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 1AD9 _ 0F B6. 00
        cmp     al, 121                                 ; 1ADC _ 3C, 79
        jnz     ?_080                                   ; 1ADE _ 75, 25
        mov     eax, dword [ebp-20H]                    ; 1AE0 _ 8B. 45, E0
        add     eax, 2                                  ; 1AE3 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 1AE6 _ 0F B6. 00
        cmp     al, 112                                 ; 1AE9 _ 3C, 70
        jnz     ?_080                                   ; 1AEB _ 75, 18
        mov     eax, dword [ebp-20H]                    ; 1AED _ 8B. 45, E0
        add     eax, 3                                  ; 1AF0 _ 83. C0, 03
        movzx   eax, byte [eax]                         ; 1AF3 _ 0F B6. 00
        cmp     al, 101                                 ; 1AF6 _ 3C, 65
        jnz     ?_080                                   ; 1AF8 _ 75, 0B
        mov     eax, dword [ebp-20H]                    ; 1AFA _ 8B. 45, E0
        mov     dword [esp], eax                        ; 1AFD _ 89. 04 24
        call    cmd_type                                ; 1B00 _ E8, FFFFFFFC(rel)
?_080:  mov     eax, dword [ebp-10H]                    ; 1B05 _ 8B. 45, F0
        mov     dword [eax+98H], 16                     ; 1B08 _ C7. 80, 00000098, 00000010
        jmp     ?_083                                   ; 1B12 _ E9, 00000118

?_081:  cmp     dword [ebp-34H], 14                     ; 1B17 _ 83. 7D, CC, 0E
        jne     ?_082                                   ; 1B1B _ 0F 85, 00000095
        mov     eax, dword [ebp-10H]                    ; 1B21 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1B24 _ 8B. 80, 00000098
        cmp     eax, 8                                  ; 1B2A _ 83. F8, 08
        jle     ?_082                                   ; 1B2D _ 0F 8E, 00000083
        mov     eax, dword [ebp-10H]                    ; 1B33 _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1B36 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1B3C _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1B3F _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1B45 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1B4A _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1B52 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1B56 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1B5A _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1B5D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B61 _ 89. 04 24
        call    set_cursor                              ; 1B64 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1B69 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1B6C _ 8B. 80, 00000098
        lea     edx, [eax-8H]                           ; 1B72 _ 8D. 50, F8
        mov     eax, dword [ebp-10H]                    ; 1B75 _ 8B. 45, F0
        mov     dword [eax+98H], edx                    ; 1B78 _ 89. 90, 00000098
        mov     eax, dword [ebp-10H]                    ; 1B7E _ 8B. 45, F0
        mov     ecx, dword [eax+9CH]                    ; 1B81 _ 8B. 88, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1B87 _ 8B. 45, F0
        mov     edx, dword [eax+98H]                    ; 1B8A _ 8B. 90, 00000098
        mov     eax, dword [shtctl]                     ; 1B90 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 1B95 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 1B9D _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1BA1 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 1BA5 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 1BA8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BAC _ 89. 04 24
        call    set_cursor                              ; 1BAF _ E8, FFFFFFFC(rel)
        jmp     ?_083                                   ; 1BB4 _ EB, 79

?_082:  mov     eax, dword [ebp-34H]                    ; 1BB6 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 1BB9 _ 89. 04 24
        call    transferScanCode                        ; 1BBC _ E8, FFFFFFFC(rel)
        mov     byte [ebp-35H], al                      ; 1BC1 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 1BC4 _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1BC7 _ 8B. 80, 00000098
        cmp     eax, 239                                ; 1BCD _ 3D, 000000EF
        jg      ?_083                                   ; 1BD2 _ 7F, 5B
        cmp     byte [ebp-35H], 0                       ; 1BD4 _ 80. 7D, CB, 00
        jz      ?_083                                   ; 1BD8 _ 74, 55
        mov     eax, dword [ebp-10H]                    ; 1BDA _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1BDD _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1BE3 _ 8D. 50, 07
        test    eax, eax                                ; 1BE6 _ 85. C0
        cmovs   eax, edx                                ; 1BE8 _ 0F 48. C2
        sar     eax, 3                                  ; 1BEB _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 1BEE _ 8D. 50, FE
        mov     eax, dword [ebp-20H]                    ; 1BF1 _ 8B. 45, E0
        add     edx, eax                                ; 1BF4 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 1BF6 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 1BFA _ 88. 02
        mov     eax, dword [ebp-10H]                    ; 1BFC _ 8B. 45, F0
        mov     eax, dword [eax+98H]                    ; 1BFF _ 8B. 80, 00000098
        lea     edx, [eax+7H]                           ; 1C05 _ 8D. 50, 07
        test    eax, eax                                ; 1C08 _ 85. C0
        cmovs   eax, edx                                ; 1C0A _ 0F 48. C2
        sar     eax, 3                                  ; 1C0D _ C1. F8, 03
        lea     edx, [eax-1H]                           ; 1C10 _ 8D. 50, FF
        mov     eax, dword [ebp-20H]                    ; 1C13 _ 8B. 45, E0
        add     eax, edx                                ; 1C16 _ 01. D0
        mov     byte [eax], 0                           ; 1C18 _ C6. 00, 00
        movsx   eax, byte [ebp-35H]                     ; 1C1B _ 0F BE. 45, CB
        mov     dword [esp+4H], 1                       ; 1C1F _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 1C27 _ 89. 04 24
        call    cons_putchar                            ; 1C2A _ E8, FFFFFFFC(rel)
?_083:  cmp     dword [ebp-0CH], 0                      ; 1C2F _ 83. 7D, F4, 00
        js      ?_084                                   ; 1C33 _ 78, 3B
        mov     eax, dword [ebp-10H]                    ; 1C35 _ 8B. 45, F0
        mov     ebx, dword [eax+9CH]                    ; 1C38 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-10H]                    ; 1C3E _ 8B. 45, F0
        mov     ecx, dword [eax+98H]                    ; 1C41 _ 8B. 88, 00000098
        mov     eax, dword [ebp-10H]                    ; 1C47 _ 8B. 45, F0
        mov     edx, dword [eax+94H]                    ; 1C4A _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 1C50 _ A1, 00000264(d)
        mov     esi, dword [ebp-0CH]                    ; 1C55 _ 8B. 75, F4
        mov     dword [esp+10H], esi                    ; 1C58 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1C5C _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 1C60 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1C64 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C68 _ 89. 04 24
        call    set_cursor                              ; 1C6B _ E8, FFFFFFFC(rel)
?_084:  call    io_sti                                  ; 1C70 _ E8, FFFFFFFC(rel)
        jmp     ?_069                                   ; 1C75 _ E9, FFFFFBAF
; console_task End of function

cons_putstr:; Function begin
        push    ebp                                     ; 1C7A _ 55
        mov     ebp, esp                                ; 1C7B _ 89. E5
        sub     esp, 24                                 ; 1C7D _ 83. EC, 18
        jmp     ?_086                                   ; 1C80 _ EB, 1D

?_085:  mov     eax, dword [ebp+8H]                     ; 1C82 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1C85 _ 0F B6. 00
        movsx   eax, al                                 ; 1C88 _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 1C8B _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 1C93 _ 89. 04 24
        call    cons_putchar                            ; 1C96 _ E8, FFFFFFFC(rel)
        add     dword [ebp+8H], 1                       ; 1C9B _ 83. 45, 08, 01
?_086:  mov     eax, dword [ebp+8H]                     ; 1C9F _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1CA2 _ 0F B6. 00
        test    al, al                                  ; 1CA5 _ 84. C0
        jnz     ?_085                                   ; 1CA7 _ 75, D9
        nop                                             ; 1CA9 _ 90
        leave                                           ; 1CAA _ C9
        ret                                             ; 1CAB _ C3
; cons_putstr End of function

api_linewin:; Function begin
        push    ebp                                     ; 1CAC _ 55
        mov     ebp, esp                                ; 1CAD _ 89. E5
        sub     esp, 32                                 ; 1CAF _ 83. EC, 20
        mov     eax, dword [ebp+0CH]                    ; 1CB2 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1CB5 _ 8B. 55, 14
        sub     edx, eax                                ; 1CB8 _ 29. C2
        mov     eax, edx                                ; 1CBA _ 89. D0
        mov     dword [ebp-14H], eax                    ; 1CBC _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 1CBF _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 1CC2 _ 8B. 55, 18
        sub     edx, eax                                ; 1CC5 _ 29. C2
        mov     eax, edx                                ; 1CC7 _ 89. D0
        mov     dword [ebp-18H], eax                    ; 1CC9 _ 89. 45, E8
        mov     eax, dword [ebp+0CH]                    ; 1CCC _ 8B. 45, 0C
        shl     eax, 10                                 ; 1CCF _ C1. E0, 0A
        mov     dword [ebp-8H], eax                     ; 1CD2 _ 89. 45, F8
        mov     eax, dword [ebp+10H]                    ; 1CD5 _ 8B. 45, 10
        shl     eax, 10                                 ; 1CD8 _ C1. E0, 0A
        mov     dword [ebp-0CH], eax                    ; 1CDB _ 89. 45, F4
        cmp     dword [ebp-14H], 0                      ; 1CDE _ 83. 7D, EC, 00
        jns     ?_087                                   ; 1CE2 _ 79, 03
        neg     dword [ebp-14H]                         ; 1CE4 _ F7. 5D, EC
?_087:  cmp     dword [ebp-18H], 0                      ; 1CE7 _ 83. 7D, E8, 00
        jns     ?_088                                   ; 1CEB _ 79, 03
        neg     dword [ebp-18H]                         ; 1CED _ F7. 5D, E8
?_088:  mov     eax, dword [ebp-14H]                    ; 1CF0 _ 8B. 45, EC
        cmp     eax, dword [ebp-18H]                    ; 1CF3 _ 3B. 45, E8
        jl      ?_092                                   ; 1CF6 _ 7C, 5B
        mov     eax, dword [ebp-14H]                    ; 1CF8 _ 8B. 45, EC
        add     eax, 1                                  ; 1CFB _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1CFE _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1D01 _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 1D04 _ 3B. 45, 14
        jle     ?_089                                   ; 1D07 _ 7E, 09
        mov     dword [ebp-14H], -1024                  ; 1D09 _ C7. 45, EC, FFFFFC00
        jmp     ?_090                                   ; 1D10 _ EB, 07

?_089:  mov     dword [ebp-14H], 1024                   ; 1D12 _ C7. 45, EC, 00000400
?_090:  mov     eax, dword [ebp+10H]                    ; 1D19 _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 1D1C _ 3B. 45, 18
        jg      ?_091                                   ; 1D1F _ 7F, 19
        mov     eax, dword [ebp+10H]                    ; 1D21 _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 1D24 _ 8B. 55, 18
        sub     edx, eax                                ; 1D27 _ 29. C2
        mov     eax, edx                                ; 1D29 _ 89. D0
        add     eax, 1                                  ; 1D2B _ 83. C0, 01
        shl     eax, 10                                 ; 1D2E _ C1. E0, 0A
        cdq                                             ; 1D31 _ 99
        idiv    dword [ebp-10H]                         ; 1D32 _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 1D35 _ 89. 45, E8
        jmp     ?_096                                   ; 1D38 _ EB, 72

?_091:  mov     eax, dword [ebp+10H]                    ; 1D3A _ 8B. 45, 10
        mov     edx, dword [ebp+18H]                    ; 1D3D _ 8B. 55, 18
        sub     edx, eax                                ; 1D40 _ 29. C2
        mov     eax, edx                                ; 1D42 _ 89. D0
        sub     eax, 1                                  ; 1D44 _ 83. E8, 01
        shl     eax, 10                                 ; 1D47 _ C1. E0, 0A
        cdq                                             ; 1D4A _ 99
        idiv    dword [ebp-10H]                         ; 1D4B _ F7. 7D, F0
        mov     dword [ebp-18H], eax                    ; 1D4E _ 89. 45, E8
        jmp     ?_096                                   ; 1D51 _ EB, 59

?_092:  mov     eax, dword [ebp-18H]                    ; 1D53 _ 8B. 45, E8
        add     eax, 1                                  ; 1D56 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 1D59 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1D5C _ 8B. 45, 10
        cmp     eax, dword [ebp+18H]                    ; 1D5F _ 3B. 45, 18
        jle     ?_093                                   ; 1D62 _ 7E, 09
        mov     dword [ebp-18H], -1024                  ; 1D64 _ C7. 45, E8, FFFFFC00
        jmp     ?_094                                   ; 1D6B _ EB, 07

?_093:  mov     dword [ebp-18H], 1024                   ; 1D6D _ C7. 45, E8, 00000400
?_094:  mov     eax, dword [ebp+0CH]                    ; 1D74 _ 8B. 45, 0C
        cmp     eax, dword [ebp+14H]                    ; 1D77 _ 3B. 45, 14
        jg      ?_095                                   ; 1D7A _ 7F, 19
        mov     eax, dword [ebp+0CH]                    ; 1D7C _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1D7F _ 8B. 55, 14
        sub     edx, eax                                ; 1D82 _ 29. C2
        mov     eax, edx                                ; 1D84 _ 89. D0
        add     eax, 1                                  ; 1D86 _ 83. C0, 01
        shl     eax, 10                                 ; 1D89 _ C1. E0, 0A
        cdq                                             ; 1D8C _ 99
        idiv    dword [ebp-10H]                         ; 1D8D _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 1D90 _ 89. 45, EC
        jmp     ?_096                                   ; 1D93 _ EB, 17

?_095:  mov     eax, dword [ebp+0CH]                    ; 1D95 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 1D98 _ 8B. 55, 14
        sub     edx, eax                                ; 1D9B _ 29. C2
        mov     eax, edx                                ; 1D9D _ 89. D0
        sub     eax, 1                                  ; 1D9F _ 83. E8, 01
        shl     eax, 10                                 ; 1DA2 _ C1. E0, 0A
        cdq                                             ; 1DA5 _ 99
        idiv    dword [ebp-10H]                         ; 1DA6 _ F7. 7D, F0
        mov     dword [ebp-14H], eax                    ; 1DA9 _ 89. 45, EC
?_096:  mov     dword [ebp-4H], 0                       ; 1DAC _ C7. 45, FC, 00000000
        jmp     ?_098                                   ; 1DB3 _ EB, 35

?_097:  mov     eax, dword [ebp+8H]                     ; 1DB5 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1DB8 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 1DBA _ 8B. 45, F4
        sar     eax, 10                                 ; 1DBD _ C1. F8, 0A
        mov     ecx, eax                                ; 1DC0 _ 89. C1
        mov     eax, dword [ebp+8H]                     ; 1DC2 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1DC5 _ 8B. 40, 04
        imul    eax, ecx                                ; 1DC8 _ 0F AF. C1
        mov     ecx, dword [ebp-8H]                     ; 1DCB _ 8B. 4D, F8
        sar     ecx, 10                                 ; 1DCE _ C1. F9, 0A
        add     eax, ecx                                ; 1DD1 _ 01. C8
        add     edx, eax                                ; 1DD3 _ 01. C2
        mov     eax, dword [ebp+1CH]                    ; 1DD5 _ 8B. 45, 1C
        mov     byte [edx], al                          ; 1DD8 _ 88. 02
        mov     eax, dword [ebp-14H]                    ; 1DDA _ 8B. 45, EC
        add     dword [ebp-8H], eax                     ; 1DDD _ 01. 45, F8
        mov     eax, dword [ebp-18H]                    ; 1DE0 _ 8B. 45, E8
        add     dword [ebp-0CH], eax                    ; 1DE3 _ 01. 45, F4
        add     dword [ebp-4H], 1                       ; 1DE6 _ 83. 45, FC, 01
?_098:  mov     eax, dword [ebp-4H]                     ; 1DEA _ 8B. 45, FC
        cmp     eax, dword [ebp-10H]                    ; 1DED _ 3B. 45, F0
        jl      ?_097                                   ; 1DF0 _ 7C, C3
        leave                                           ; 1DF2 _ C9
        ret                                             ; 1DF3 _ C3
; api_linewin End of function

handle_keyboard:; Function begin
        push    ebp                                     ; 1DF4 _ 55
        mov     ebp, esp                                ; 1DF5 _ 89. E5
        sub     esp, 56                                 ; 1DF7 _ 83. EC, 38
?_099:  call    io_cli                                  ; 1DFA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1DFF _ 8B. 45, 08
        add     eax, 16                                 ; 1E02 _ 83. C0, 10
        mov     dword [esp], eax                        ; 1E05 _ 89. 04 24
        call    fifo8_status                            ; 1E08 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1E0D _ 85. C0
        jnz     ?_101                                   ; 1E0F _ 75, 2B
        call    io_sti                                  ; 1E11 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+0CH], 0                      ; 1E16 _ 83. 7D, 0C, 00
        jz      ?_100                                   ; 1E1A _ 74, 05
        jmp     ?_105                                   ; 1E1C _ E9, 000000DC

?_100:  call    io_sti                                  ; 1E21 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1E26 _ 8B. 45, 10
        add     eax, 28                                 ; 1E29 _ 83. C0, 1C
        mov     dword [eax], -1                         ; 1E2C _ C7. 00, FFFFFFFF
        mov     eax, 0                                  ; 1E32 _ B8, 00000000
        jmp     ?_106                                   ; 1E37 _ E9, 000000C6

?_101:  mov     eax, dword [ebp+8H]                     ; 1E3C _ 8B. 45, 08
        add     eax, 16                                 ; 1E3F _ 83. C0, 10
        mov     dword [esp], eax                        ; 1E42 _ 89. 04 24
        call    fifo8_get                               ; 1E45 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1E4A _ 89. 45, F4
        call    io_sti                                  ; 1E4D _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 255                    ; 1E52 _ 81. 7D, F4, 000000FF
        jle     ?_102                                   ; 1E59 _ 7E, 37
        mov     edx, dword [sht_back]                   ; 1E5B _ 8B. 15, 00000268(d)
        mov     eax, dword [shtctl]                     ; 1E61 _ A1, 00000264(d)
        mov     dword [esp+14H], ?_377                  ; 1E66 _ C7. 44 24, 14, 00000050(d)
        mov     dword [esp+10H], 7                      ; 1E6E _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 176                    ; 1E76 _ C7. 44 24, 0C, 000000B0
        mov     dword [esp+8H], 0                       ; 1E7E _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1E86 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E8A _ 89. 04 24
        call    showString                              ; 1E8D _ E8, FFFFFFFC(rel)
?_102:  cmp     dword [ebp-0CH], 1                      ; 1E92 _ 83. 7D, F4, 01
        jg      ?_103                                   ; 1E96 _ 7F, 3E
        mov     eax, dword [ebp+8H]                     ; 1E98 _ 8B. 45, 08
        lea     edx, [eax+10H]                          ; 1E9B _ 8D. 50, 10
        mov     eax, dword [ebp+8H]                     ; 1E9E _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 1EA1 _ 8B. 80, 000000A8
        mov     dword [esp+8H], 1                       ; 1EA7 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], edx                     ; 1EAF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1EB3 _ 89. 04 24
        call    timer_init                              ; 1EB6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 1EBB _ 8B. 45, 08
        mov     eax, dword [eax+0A8H]                   ; 1EBE _ 8B. 80, 000000A8
        mov     dword [esp+4H], 50                      ; 1EC4 _ C7. 44 24, 04, 00000032
        mov     dword [esp], eax                        ; 1ECC _ 89. 04 24
        call    timer_settime                           ; 1ECF _ E8, FFFFFFFC(rel)
        jmp     ?_105                                   ; 1ED4 _ EB, 27

?_103:  cmp     dword [ebp-0CH], 2                      ; 1ED6 _ 83. 7D, F4, 02
        jnz     ?_104                                   ; 1EDA _ 75, 0F
        mov     eax, dword [ebp+8H]                     ; 1EDC _ 8B. 45, 08
        mov     dword [eax+0A0H], 7                     ; 1EDF _ C7. 80, 000000A0, 00000007
        jmp     ?_105                                   ; 1EE9 _ EB, 12

?_104:  mov     eax, dword [ebp+10H]                    ; 1EEB _ 8B. 45, 10
        lea     edx, [eax+1CH]                          ; 1EEE _ 8D. 50, 1C
        mov     eax, dword [ebp-0CH]                    ; 1EF1 _ 8B. 45, F4
        mov     dword [edx], eax                        ; 1EF4 _ 89. 02
        mov     eax, 0                                  ; 1EF6 _ B8, 00000000
        jmp     ?_106                                   ; 1EFB _ EB, 05

?_105:  jmp     ?_099                                   ; 1EFD _ E9, FFFFFEF8

?_106:  leave                                           ; 1F02 _ C9
        ret                                             ; 1F03 _ C3
; handle_keyboard End of function

kernel_api:; Function begin
        push    ebp                                     ; 1F04 _ 55
        mov     ebp, esp                                ; 1F05 _ 89. E5
        push    esi                                     ; 1F07 _ 56
        push    ebx                                     ; 1F08 _ 53
        sub     esp, 48                                 ; 1F09 _ 83. EC, 30
        call    task_now                                ; 1F0C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1F11 _ 89. 45, F4
        lea     eax, [ebp+24H]                          ; 1F14 _ 8D. 45, 24
        add     eax, 4                                  ; 1F17 _ 83. C0, 04
        mov     dword [ebp-10H], eax                    ; 1F1A _ 89. 45, F0
        mov     dword [ebp-14H], 0                      ; 1F1D _ C7. 45, EC, 00000000
        cmp     dword [ebp+1CH], 1                      ; 1F24 _ 83. 7D, 1C, 01
        jnz     ?_107                                   ; 1F28 _ 75, 1B
        mov     eax, dword [ebp+24H]                    ; 1F2A _ 8B. 45, 24
        movsx   eax, al                                 ; 1F2D _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 1F30 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 1F38 _ 89. 04 24
        call    cons_putchar                            ; 1F3B _ E8, FFFFFFFC(rel)
        jmp     ?_121                                   ; 1F40 _ E9, 000003C0

?_107:  cmp     dword [ebp+1CH], 2                      ; 1F45 _ 83. 7D, 1C, 02
        jnz     ?_108                                   ; 1F49 _ 75, 1D
        mov     eax, dword [ebp-0CH]                    ; 1F4B _ 8B. 45, F4
        mov     eax, dword [eax+0ACH]                   ; 1F4E _ 8B. 80, 000000AC
        mov     edx, dword [eax]                        ; 1F54 _ 8B. 10
        mov     eax, dword [ebp+18H]                    ; 1F56 _ 8B. 45, 18
        add     eax, edx                                ; 1F59 _ 01. D0
        mov     dword [esp], eax                        ; 1F5B _ 89. 04 24
        call    cons_putstr                             ; 1F5E _ E8, FFFFFFFC(rel)
        jmp     ?_121                                   ; 1F63 _ E9, 0000039D

?_108:  cmp     dword [ebp+1CH], 4                      ; 1F68 _ 83. 7D, 1C, 04
        jnz     ?_109                                   ; 1F6C _ 75, 15
        mov     eax, dword [ebp-0CH]                    ; 1F6E _ 8B. 45, F4
        mov     dword [eax+34H], 0                      ; 1F71 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-0CH]                    ; 1F78 _ 8B. 45, F4
        add     eax, 48                                 ; 1F7B _ 83. C0, 30
        jmp     ?_122                                   ; 1F7E _ E9, 00000387

?_109:  cmp     dword [ebp+1CH], 5                      ; 1F83 _ 83. 7D, 1C, 05
        jne     ?_110                                   ; 1F87 _ 0F 85, 00000107
        mov     eax, dword [shtctl]                     ; 1F8D _ A1, 00000264(d)
        mov     dword [esp], eax                        ; 1F92 _ 89. 04 24
        call    sheet_alloc                             ; 1F95 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1F9A _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 1F9D _ 8B. 45, E8
        mov     edx, dword [ebp-0CH]                    ; 1FA0 _ 8B. 55, F4
        mov     dword [eax+20H], edx                    ; 1FA3 _ 89. 50, 20
        mov     eax, dword [ebp-18H]                    ; 1FA6 _ 8B. 45, E8
        mov     eax, dword [eax+1CH]                    ; 1FA9 _ 8B. 40, 1C
        or      eax, 10H                                ; 1FAC _ 83. C8, 10
        mov     edx, eax                                ; 1FAF _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 1FB1 _ 8B. 45, E8
        mov     dword [eax+1CH], edx                    ; 1FB4 _ 89. 50, 1C
        mov     eax, dword [ebp+24H]                    ; 1FB7 _ 8B. 45, 24
        mov     edx, dword [ebp-0CH]                    ; 1FBA _ 8B. 55, F4
        mov     edx, dword [edx+0ACH]                   ; 1FBD _ 8B. 92, 000000AC
        mov     ecx, dword [edx+4H]                     ; 1FC3 _ 8B. 4A, 04
        mov     edx, dword [ebp+18H]                    ; 1FC6 _ 8B. 55, 18
        add     edx, ecx                                ; 1FC9 _ 01. CA
        mov     dword [esp+10H], eax                    ; 1FCB _ 89. 44 24, 10
        mov     eax, dword [ebp+8H]                     ; 1FCF _ 8B. 45, 08
        mov     dword [esp+0CH], eax                    ; 1FD2 _ 89. 44 24, 0C
        mov     eax, dword [ebp+0CH]                    ; 1FD6 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 1FD9 _ 89. 44 24, 08
        mov     dword [esp+4H], edx                     ; 1FDD _ 89. 54 24, 04
        mov     eax, dword [ebp-18H]                    ; 1FE1 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 1FE4 _ 89. 04 24
        call    sheet_setbuf                            ; 1FE7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1FEC _ 8B. 45, F4
        mov     eax, dword [eax+0ACH]                   ; 1FEF _ 8B. 80, 000000AC
        mov     edx, dword [eax]                        ; 1FF5 _ 8B. 10
        mov     eax, dword [ebp+20H]                    ; 1FF7 _ 8B. 45, 20
        add     edx, eax                                ; 1FFA _ 01. C2
        mov     eax, dword [shtctl]                     ; 1FFC _ A1, 00000264(d)
        mov     dword [esp+0CH], 0                      ; 2001 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], edx                     ; 2009 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 200D _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2010 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2014 _ 89. 04 24
        call    make_window8                            ; 2017 _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 201C _ A1, 00000264(d)
        mov     eax, dword [eax+0CH]                    ; 2021 _ 8B. 40, 0C
        sub     eax, dword [ebp+8H]                     ; 2024 _ 2B. 45, 08
        mov     edx, eax                                ; 2027 _ 89. C2
        shr     edx, 31                                 ; 2029 _ C1. EA, 1F
        add     eax, edx                                ; 202C _ 01. D0
        sar     eax, 1                                  ; 202E _ D1. F8
        mov     ecx, eax                                ; 2030 _ 89. C1
        mov     eax, dword [shtctl]                     ; 2032 _ A1, 00000264(d)
        mov     eax, dword [eax+8H]                     ; 2037 _ 8B. 40, 08
        sub     eax, dword [ebp+0CH]                    ; 203A _ 2B. 45, 0C
        mov     edx, eax                                ; 203D _ 89. C2
        shr     edx, 31                                 ; 203F _ C1. EA, 1F
        add     eax, edx                                ; 2042 _ 01. D0
        sar     eax, 1                                  ; 2044 _ D1. F8
        mov     edx, eax                                ; 2046 _ 89. C2
        mov     eax, dword [shtctl]                     ; 2048 _ A1, 00000264(d)
        mov     dword [esp+0CH], ecx                    ; 204D _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2051 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 2055 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2058 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 205C _ 89. 04 24
        call    sheet_slide                             ; 205F _ E8, FFFFFFFC(rel)
        mov     eax, dword [shtctl]                     ; 2064 _ A1, 00000264(d)
        mov     edx, dword [eax+10H]                    ; 2069 _ 8B. 50, 10
        mov     eax, dword [shtctl]                     ; 206C _ A1, 00000264(d)
        mov     dword [esp+8H], edx                     ; 2071 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 2075 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2078 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 207C _ 89. 04 24
        call    sheet_updown                            ; 207F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2084 _ 8B. 45, F0
        lea     edx, [eax+1CH]                          ; 2087 _ 8D. 50, 1C
        mov     eax, dword [ebp-18H]                    ; 208A _ 8B. 45, E8
        mov     dword [edx], eax                        ; 208D _ 89. 02
        jmp     ?_121                                   ; 208F _ E9, 00000271

?_110:  cmp     dword [ebp+1CH], 6                      ; 2094 _ 83. 7D, 1C, 06
        jne     ?_111                                   ; 2098 _ 0F 85, 0000008C
        mov     eax, dword [ebp+18H]                    ; 209E _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 20A1 _ 89. 45, E8
        mov     eax, dword [ebp-0CH]                    ; 20A4 _ 8B. 45, F4
        mov     eax, dword [eax+0ACH]                   ; 20A7 _ 8B. 80, 000000AC
        mov     edx, dword [eax+4H]                     ; 20AD _ 8B. 50, 04
        mov     eax, dword [ebp+10H]                    ; 20B0 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 20B3 _ 8D. 0C 02
        mov     eax, dword [ebp+24H]                    ; 20B6 _ 8B. 45, 24
        movsx   edx, al                                 ; 20B9 _ 0F BE. D0
        mov     eax, dword [shtctl]                     ; 20BC _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 20C1 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 20C5 _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 20C9 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 20CC _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 20D0 _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 20D3 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 20D7 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 20DA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 20DE _ 89. 04 24
        call    showString                              ; 20E1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 20E6 _ 8B. 45, 08
        lea     ecx, [eax+10H]                          ; 20E9 _ 8D. 48, 10
        mov     eax, dword [ebp+20H]                    ; 20EC _ 8B. 45, 20
        lea     edx, [eax*8]                            ; 20EF _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp+0CH]                    ; 20F6 _ 8B. 45, 0C
        add     edx, eax                                ; 20F9 _ 01. C2
        mov     eax, dword [shtctl]                     ; 20FB _ A1, 00000264(d)
        mov     dword [esp+14H], ecx                    ; 2100 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2104 _ 89. 54 24, 10
        mov     edx, dword [ebp+8H]                     ; 2108 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 210B _ 89. 54 24, 0C
        mov     edx, dword [ebp+0CH]                    ; 210F _ 8B. 55, 0C
        mov     dword [esp+8H], edx                     ; 2112 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 2116 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2119 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 211D _ 89. 04 24
        call    sheet_refresh                           ; 2120 _ E8, FFFFFFFC(rel)
        jmp     ?_121                                   ; 2125 _ E9, 000001DB

?_111:  cmp     dword [ebp+1CH], 7                      ; 212A _ 83. 7D, 1C, 07
        jnz     ?_112                                   ; 212E _ 75, 7E
        mov     eax, dword [ebp+18H]                    ; 2130 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 2133 _ 89. 45, E8
        mov     ebx, dword [ebp+24H]                    ; 2136 _ 8B. 5D, 24
        mov     eax, dword [ebp+10H]                    ; 2139 _ 8B. 45, 10
        movzx   ecx, al                                 ; 213C _ 0F B6. C8
        mov     eax, dword [ebp-18H]                    ; 213F _ 8B. 45, E8
        mov     edx, dword [eax+4H]                     ; 2142 _ 8B. 50, 04
        mov     eax, dword [ebp-18H]                    ; 2145 _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 2148 _ 8B. 00
        mov     esi, dword [ebp+8H]                     ; 214A _ 8B. 75, 08
        mov     dword [esp+18H], esi                    ; 214D _ 89. 74 24, 18
        mov     esi, dword [ebp+0CH]                    ; 2151 _ 8B. 75, 0C
        mov     dword [esp+14H], esi                    ; 2154 _ 89. 74 24, 14
        mov     esi, dword [ebp+20H]                    ; 2158 _ 8B. 75, 20
        mov     dword [esp+10H], esi                    ; 215B _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 215F _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2163 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2167 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 216B _ 89. 04 24
        call    boxfill8                                ; 216E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2173 _ 8B. 45, 08
        lea     ebx, [eax+1H]                           ; 2176 _ 8D. 58, 01
        mov     eax, dword [ebp+0CH]                    ; 2179 _ 8B. 45, 0C
        lea     ecx, [eax+1H]                           ; 217C _ 8D. 48, 01
        mov     edx, dword [ebp+24H]                    ; 217F _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 2182 _ A1, 00000264(d)
        mov     dword [esp+14H], ebx                    ; 2187 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 218B _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 218F _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 2192 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2196 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 219A _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 219D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 21A1 _ 89. 04 24
        call    sheet_refresh                           ; 21A4 _ E8, FFFFFFFC(rel)
        jmp     ?_121                                   ; 21A9 _ E9, 00000157

?_112:  cmp     dword [ebp+1CH], 11                     ; 21AE _ 83. 7D, 1C, 0B
        jnz     ?_113                                   ; 21B2 _ 75, 28
        mov     eax, dword [ebp+18H]                    ; 21B4 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 21B7 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 21BA _ 8B. 45, E8
        mov     edx, dword [eax]                        ; 21BD _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 21BF _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 21C2 _ 8B. 40, 04
        imul    eax, dword [ebp+8H]                     ; 21C5 _ 0F AF. 45, 08
        mov     ecx, eax                                ; 21C9 _ 89. C1
        mov     eax, dword [ebp+0CH]                    ; 21CB _ 8B. 45, 0C
        add     eax, ecx                                ; 21CE _ 01. C8
        add     edx, eax                                ; 21D0 _ 01. C2
        mov     eax, dword [ebp+24H]                    ; 21D2 _ 8B. 45, 24
        mov     byte [edx], al                          ; 21D5 _ 88. 02
        jmp     ?_121                                   ; 21D7 _ E9, 00000129

?_113:  cmp     dword [ebp+1CH], 12                     ; 21DC _ 83. 7D, 1C, 0C
        jnz     ?_114                                   ; 21E0 _ 75, 3B
        mov     eax, dword [ebp+18H]                    ; 21E2 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 21E5 _ 89. 45, E8
        mov     edx, dword [ebp+24H]                    ; 21E8 _ 8B. 55, 24
        mov     eax, dword [shtctl]                     ; 21EB _ A1, 00000264(d)
        mov     ecx, dword [ebp+8H]                     ; 21F0 _ 8B. 4D, 08
        mov     dword [esp+14H], ecx                    ; 21F3 _ 89. 4C 24, 14
        mov     ecx, dword [ebp+0CH]                    ; 21F7 _ 8B. 4D, 0C
        mov     dword [esp+10H], ecx                    ; 21FA _ 89. 4C 24, 10
        mov     ecx, dword [ebp+20H]                    ; 21FE _ 8B. 4D, 20
        mov     dword [esp+0CH], ecx                    ; 2201 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2205 _ 89. 54 24, 08
        mov     edx, dword [ebp-18H]                    ; 2209 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 220C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2210 _ 89. 04 24
        call    sheet_refresh                           ; 2213 _ E8, FFFFFFFC(rel)
        jmp     ?_121                                   ; 2218 _ E9, 000000E8

?_114:  cmp     dword [ebp+1CH], 13                     ; 221D _ 83. 7D, 1C, 0D
        jnz     ?_115                                   ; 2221 _ 75, 39
        mov     eax, dword [ebp+18H]                    ; 2223 _ 8B. 45, 18
        mov     dword [ebp-18H], eax                    ; 2226 _ 89. 45, E8
        mov     eax, dword [ebp+24H]                    ; 2229 _ 8B. 45, 24
        mov     edx, dword [ebp+10H]                    ; 222C _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 222F _ 89. 54 24, 14
        mov     edx, dword [ebp+8H]                     ; 2233 _ 8B. 55, 08
        mov     dword [esp+10H], edx                    ; 2236 _ 89. 54 24, 10
        mov     edx, dword [ebp+0CH]                    ; 223A _ 8B. 55, 0C
        mov     dword [esp+0CH], edx                    ; 223D _ 89. 54 24, 0C
        mov     edx, dword [ebp+20H]                    ; 2241 _ 8B. 55, 20
        mov     dword [esp+8H], edx                     ; 2244 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2248 _ 89. 44 24, 04
        mov     eax, dword [ebp-18H]                    ; 224C _ 8B. 45, E8
        mov     dword [esp], eax                        ; 224F _ 89. 04 24
        call    api_linewin                             ; 2252 _ E8, FFFFFFFC(rel)
        jmp     ?_121                                   ; 2257 _ E9, 000000A9

?_115:  cmp     dword [ebp+1CH], 14                     ; 225C _ 83. 7D, 1C, 0E
        jnz     ?_116                                   ; 2260 _ 75, 19
        mov     edx, dword [ebp+18H]                    ; 2262 _ 8B. 55, 18
        mov     eax, dword [shtctl]                     ; 2265 _ A1, 00000264(d)
        mov     dword [esp+4H], edx                     ; 226A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 226E _ 89. 04 24
        call    sheet_free                              ; 2271 _ E8, FFFFFFFC(rel)
        jmp     ?_121                                   ; 2276 _ E9, 0000008A

?_116:  cmp     dword [ebp+1CH], 15                     ; 227B _ 83. 7D, 1C, 0F
        jnz     ?_117                                   ; 227F _ 75, 1B
        mov     eax, dword [ebp+24H]                    ; 2281 _ 8B. 45, 24
        mov     edx, dword [ebp-10H]                    ; 2284 _ 8B. 55, F0
        mov     dword [esp+8H], edx                     ; 2287 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 228B _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 228F _ 8B. 45, F4
        mov     dword [esp], eax                        ; 2292 _ 89. 04 24
        call    handle_keyboard                         ; 2295 _ E8, FFFFFFFC(rel)
        jmp     ?_121                                   ; 229A _ EB, 69

?_117:  cmp     dword [ebp+1CH], 16                     ; 229C _ 83. 7D, 1C, 10
        jnz     ?_118                                   ; 22A0 _ 75, 0F
        mov     eax, dword [ebp-10H]                    ; 22A2 _ 8B. 45, F0
        lea     ebx, [eax+1CH]                          ; 22A5 _ 8D. 58, 1C
        call    timer_alloc                             ; 22A8 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 22AD _ 89. 03
        jmp     ?_121                                   ; 22AF _ EB, 54

?_118:  cmp     dword [ebp+1CH], 17                     ; 22B1 _ 83. 7D, 1C, 11
        jnz     ?_119                                   ; 22B5 _ 75, 21
        mov     eax, dword [ebp+24H]                    ; 22B7 _ 8B. 45, 24
        movzx   edx, al                                 ; 22BA _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 22BD _ 8B. 45, F4
        lea     ecx, [eax+10H]                          ; 22C0 _ 8D. 48, 10
        mov     eax, dword [ebp+18H]                    ; 22C3 _ 8B. 45, 18
        mov     dword [esp+8H], edx                     ; 22C6 _ 89. 54 24, 08
        mov     dword [esp+4H], ecx                     ; 22CA _ 89. 4C 24, 04
        mov     dword [esp], eax                        ; 22CE _ 89. 04 24
        call    timer_init                              ; 22D1 _ E8, FFFFFFFC(rel)
        jmp     ?_121                                   ; 22D6 _ EB, 2D

?_119:  cmp     dword [ebp+1CH], 18                     ; 22D8 _ 83. 7D, 1C, 12
        jnz     ?_120                                   ; 22DC _ 75, 16
        mov     eax, dword [ebp+24H]                    ; 22DE _ 8B. 45, 24
        mov     edx, eax                                ; 22E1 _ 89. C2
        mov     eax, dword [ebp+18H]                    ; 22E3 _ 8B. 45, 18
        mov     dword [esp+4H], edx                     ; 22E6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 22EA _ 89. 04 24
        call    timer_settime                           ; 22ED _ E8, FFFFFFFC(rel)
        jmp     ?_121                                   ; 22F2 _ EB, 11

?_120:  cmp     dword [ebp+1CH], 19                     ; 22F4 _ 83. 7D, 1C, 13
        jnz     ?_121                                   ; 22F8 _ 75, 0B
        mov     eax, dword [ebp+18H]                    ; 22FA _ 8B. 45, 18
        mov     dword [esp], eax                        ; 22FD _ 89. 04 24
        call    timer_free                              ; 2300 _ E8, FFFFFFFC(rel)
?_121:  mov     eax, 0                                  ; 2305 _ B8, 00000000
?_122:  add     esp, 48                                 ; 230A _ 83. C4, 30
        pop     ebx                                     ; 230D _ 5B
        pop     esi                                     ; 230E _ 5E
        pop     ebp                                     ; 230F _ 5D
        ret                                             ; 2310 _ C3
; kernel_api End of function

cons_putchar:; Function begin
        push    ebp                                     ; 2311 _ 55
        mov     ebp, esp                                ; 2312 _ 89. E5
        push    esi                                     ; 2314 _ 56
        push    ebx                                     ; 2315 _ 53
        sub     esp, 48                                 ; 2316 _ 83. EC, 30
        mov     edx, dword [ebp+8H]                     ; 2319 _ 8B. 55, 08
        mov     eax, dword [ebp+0CH]                    ; 231C _ 8B. 45, 0C
        mov     byte [ebp-1CH], dl                      ; 231F _ 88. 55, E4
        mov     byte [ebp-20H], al                      ; 2322 _ 88. 45, E0
        call    task_now                                ; 2325 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 232A _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 232D _ 8B. 45, F4
        mov     ebx, dword [eax+9CH]                    ; 2330 _ 8B. 98, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 2336 _ 8B. 45, F4
        mov     ecx, dword [eax+98H]                    ; 2339 _ 8B. 88, 00000098
        mov     eax, dword [ebp-0CH]                    ; 233F _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 2342 _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 2348 _ A1, 00000264(d)
        mov     dword [esp+10H], 0                      ; 234D _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 2355 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2359 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 235D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2361 _ 89. 04 24
        call    set_cursor                              ; 2364 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 2369 _ 8B. 45, F4
        movzx   edx, byte [ebp-1CH]                     ; 236C _ 0F B6. 55, E4
        mov     byte [eax+0A4H], dl                     ; 2370 _ 88. 90, 000000A4
        mov     eax, dword [ebp-0CH]                    ; 2376 _ 8B. 45, F4
        mov     byte [eax+0A5H], 0                      ; 2379 _ C6. 80, 000000A5, 00
        mov     eax, dword [ebp-0CH]                    ; 2380 _ 8B. 45, F4
        lea     esi, [eax+0A4H]                         ; 2383 _ 8D. B0, 000000A4
        mov     eax, dword [ebp-0CH]                    ; 2389 _ 8B. 45, F4
        mov     ebx, dword [eax+9CH]                    ; 238C _ 8B. 98, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 2392 _ 8B. 45, F4
        mov     ecx, dword [eax+98H]                    ; 2395 _ 8B. 88, 00000098
        mov     eax, dword [ebp-0CH]                    ; 239B _ 8B. 45, F4
        mov     edx, dword [eax+94H]                    ; 239E _ 8B. 90, 00000094
        mov     eax, dword [shtctl]                     ; 23A4 _ A1, 00000264(d)
        mov     dword [esp+14H], esi                    ; 23A9 _ 89. 74 24, 14
        mov     dword [esp+10H], 7                      ; 23AD _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], ebx                    ; 23B5 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 23B9 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 23BD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 23C1 _ 89. 04 24
        call    showString                              ; 23C4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 23C9 _ 8B. 45, F4
        mov     eax, dword [eax+98H]                    ; 23CC _ 8B. 80, 00000098
        lea     edx, [eax+8H]                           ; 23D2 _ 8D. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 23D5 _ 8B. 45, F4
        mov     dword [eax+98H], edx                    ; 23D8 _ 89. 90, 00000098
        add     esp, 48                                 ; 23DE _ 83. C4, 30
        pop     ebx                                     ; 23E1 _ 5B
        pop     esi                                     ; 23E2 _ 5E
        pop     ebp                                     ; 23E3 _ 5D
        ret                                             ; 23E4 _ C3
; cons_putchar End of function

cons_newline:; Function begin
        push    ebp                                     ; 23E5 _ 55
        mov     ebp, esp                                ; 23E6 _ 89. E5
        push    ebx                                     ; 23E8 _ 53
        sub     esp, 52                                 ; 23E9 _ 83. EC, 34
        cmp     dword [ebp+8H], 139                     ; 23EC _ 81. 7D, 08, 0000008B
        jg      ?_123                                   ; 23F3 _ 7F, 09
        add     dword [ebp+8H], 16                      ; 23F5 _ 83. 45, 08, 10
        jmp     ?_132                                   ; 23F9 _ E9, 000000DF

?_123:  mov     dword [ebp-10H], 28                     ; 23FE _ C7. 45, F0, 0000001C
        jmp     ?_127                                   ; 2405 _ EB, 52

?_124:  mov     dword [ebp-0CH], 8                      ; 2407 _ C7. 45, F4, 00000008
        jmp     ?_126                                   ; 240E _ EB, 3C

?_125:  mov     eax, dword [ebp+0CH]                    ; 2410 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2413 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2415 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2418 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 241B _ 0F AF. 45, F0
        mov     ecx, eax                                ; 241F _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2421 _ 8B. 45, F4
        add     eax, ecx                                ; 2424 _ 01. C8
        add     edx, eax                                ; 2426 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2428 _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 242B _ 8B. 08
        mov     eax, dword [ebp-10H]                    ; 242D _ 8B. 45, F0
        lea     ebx, [eax+10H]                          ; 2430 _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 2433 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2436 _ 8B. 40, 04
        imul    ebx, eax                                ; 2439 _ 0F AF. D8
        mov     eax, dword [ebp-0CH]                    ; 243C _ 8B. 45, F4
        add     eax, ebx                                ; 243F _ 01. D8
        add     eax, ecx                                ; 2441 _ 01. C8
        movzx   eax, byte [eax]                         ; 2443 _ 0F B6. 00
        mov     byte [edx], al                          ; 2446 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 2448 _ 83. 45, F4, 01
?_126:  cmp     dword [ebp-0CH], 247                    ; 244C _ 81. 7D, F4, 000000F7
        jle     ?_125                                   ; 2453 _ 7E, BB
        add     dword [ebp-10H], 1                      ; 2455 _ 83. 45, F0, 01
?_127:  cmp     dword [ebp-10H], 139                    ; 2459 _ 81. 7D, F0, 0000008B
        jle     ?_124                                   ; 2460 _ 7E, A5
        mov     dword [ebp-10H], 140                    ; 2462 _ C7. 45, F0, 0000008C
        jmp     ?_131                                   ; 2469 _ EB, 35

?_128:  mov     dword [ebp-0CH], 8                      ; 246B _ C7. 45, F4, 00000008
        jmp     ?_130                                   ; 2472 _ EB, 1F

?_129:  mov     eax, dword [ebp+0CH]                    ; 2474 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2477 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2479 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 247C _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 247F _ 0F AF. 45, F0
        mov     ecx, eax                                ; 2483 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2485 _ 8B. 45, F4
        add     eax, ecx                                ; 2488 _ 01. C8
        add     eax, edx                                ; 248A _ 01. D0
        mov     byte [eax], 0                           ; 248C _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 248F _ 83. 45, F4, 01
?_130:  cmp     dword [ebp-0CH], 247                    ; 2493 _ 81. 7D, F4, 000000F7
        jle     ?_129                                   ; 249A _ 7E, D8
        add     dword [ebp-10H], 1                      ; 249C _ 83. 45, F0, 01
?_131:  cmp     dword [ebp-10H], 155                    ; 24A0 _ 81. 7D, F0, 0000009B
        jle     ?_128                                   ; 24A7 _ 7E, C2
        mov     eax, dword [shtctl]                     ; 24A9 _ A1, 00000264(d)
        mov     dword [esp+14H], 156                    ; 24AE _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 24B6 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 24BE _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 24C6 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 24CE _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 24D1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 24D5 _ 89. 04 24
        call    sheet_refresh                           ; 24D8 _ E8, FFFFFFFC(rel)
?_132:  mov     eax, dword [shtctl]                     ; 24DD _ A1, 00000264(d)
        mov     dword [esp+14H], ?_370                  ; 24E2 _ C7. 44 24, 14, 00000030(d)
        mov     dword [esp+10H], 7                      ; 24EA _ C7. 44 24, 10, 00000007
        mov     edx, dword [ebp+8H]                     ; 24F2 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 24F5 _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 24F9 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 2501 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2504 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2508 _ 89. 04 24
        call    showString                              ; 250B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2510 _ 8B. 45, 08
        add     esp, 52                                 ; 2513 _ 83. C4, 34
        pop     ebx                                     ; 2516 _ 5B
        pop     ebp                                     ; 2517 _ 5D
        ret                                             ; 2518 _ C3
; cons_newline End of function

init_screen8:; Function begin
        push    ebp                                     ; 2519 _ 55
        mov     ebp, esp                                ; 251A _ 89. E5
        push    ebx                                     ; 251C _ 53
        sub     esp, 36                                 ; 251D _ 83. EC, 24
        mov     eax, dword [ebp+10H]                    ; 2520 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 2523 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 2526 _ 8B. 45, 0C
        sub     eax, 1                                  ; 2529 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 252C _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 2530 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 2534 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 253C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 2544 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 254C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 254F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2553 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2556 _ 89. 04 24
        call    boxfill8                                ; 2559 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 255E _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 2561 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 2564 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 2567 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 256A _ 8B. 45, 10
        sub     eax, 28                                 ; 256D _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 2570 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 2574 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2578 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 257C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 2584 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 258C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 258F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2593 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2596 _ 89. 04 24
        call    boxfill8                                ; 2599 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 259E _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 25A1 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 25A4 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 25A7 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 25AA _ 8B. 45, 10
        sub     eax, 27                                 ; 25AD _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 25B0 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 25B4 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 25B8 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 25BC _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 25C4 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 25CC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 25CF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 25D3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 25D6 _ 89. 04 24
        call    boxfill8                                ; 25D9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 25DE _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 25E1 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 25E4 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 25E7 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 25EA _ 8B. 45, 10
        sub     eax, 26                                 ; 25ED _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 25F0 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 25F4 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 25F8 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 25FC _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 2604 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 260C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 260F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2613 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2616 _ 89. 04 24
        call    boxfill8                                ; 2619 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 261E _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2621 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 2624 _ 8B. 45, 10
        sub     eax, 24                                 ; 2627 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 262A _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 262E _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 2636 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 263A _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 2642 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 264A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 264D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2651 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2654 _ 89. 04 24
        call    boxfill8                                ; 2657 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 265C _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 265F _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 2662 _ 8B. 45, 10
        sub     eax, 24                                 ; 2665 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 2668 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 266C _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 2674 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 2678 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 2680 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2688 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 268B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 268F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2692 _ 89. 04 24
        call    boxfill8                                ; 2695 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 269A _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 269D _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 26A0 _ 8B. 45, 10
        sub     eax, 4                                  ; 26A3 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 26A6 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 26AA _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 26B2 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 26B6 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 26BE _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 26C6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 26C9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 26CD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 26D0 _ 89. 04 24
        call    boxfill8                                ; 26D3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 26D8 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 26DB _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 26DE _ 8B. 45, 10
        sub     eax, 23                                 ; 26E1 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 26E4 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 26E8 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 26F0 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 26F4 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 26FC _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2704 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2707 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 270B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 270E _ 89. 04 24
        call    boxfill8                                ; 2711 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2716 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2719 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 271C _ 8B. 45, 10
        sub     eax, 3                                  ; 271F _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 2722 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 2726 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 272E _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 2732 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 273A _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2742 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2745 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2749 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 274C _ 89. 04 24
        call    boxfill8                                ; 274F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2754 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2757 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 275A _ 8B. 45, 10
        sub     eax, 24                                 ; 275D _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 2760 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 2764 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 276C _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 2770 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 2778 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 2780 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2783 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2787 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 278A _ 89. 04 24
        call    boxfill8                                ; 278D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2792 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 2795 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 2798 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 279B _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 279E _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 27A1 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 27A4 _ 8B. 45, 0C
        sub     eax, 47                                 ; 27A7 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 27AA _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 27AE _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 27B2 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 27B6 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 27BA _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 27C2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 27C5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 27C9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 27CC _ 89. 04 24
        call    boxfill8                                ; 27CF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 27D4 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 27D7 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 27DA _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 27DD _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 27E0 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 27E3 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 27E6 _ 8B. 45, 0C
        sub     eax, 47                                 ; 27E9 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 27EC _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 27F0 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 27F4 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 27F8 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 27FC _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 2804 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2807 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 280B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 280E _ 89. 04 24
        call    boxfill8                                ; 2811 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2816 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 2819 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 281C _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 281F _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 2822 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 2825 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 2828 _ 8B. 45, 0C
        sub     eax, 47                                 ; 282B _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 282E _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2832 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2836 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 283A _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 283E _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2846 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2849 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 284D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2850 _ 89. 04 24
        call    boxfill8                                ; 2853 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2858 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 285B _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 285E _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 2861 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 2864 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 2867 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 286A _ 8B. 45, 0C
        sub     eax, 3                                  ; 286D _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 2870 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2874 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2878 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 287C _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 2880 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 2888 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 288B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 288F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2892 _ 89. 04 24
        call    boxfill8                                ; 2895 _ E8, FFFFFFFC(rel)
        add     esp, 36                                 ; 289A _ 83. C4, 24
        pop     ebx                                     ; 289D _ 5B
        pop     ebp                                     ; 289E _ 5D
        ret                                             ; 289F _ C3
; init_screen8 End of function

computeMousePosition:; Function begin
        push    ebp                                     ; 28A0 _ 55
        mov     ebp, esp                                ; 28A1 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 28A3 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 28A6 _ 8B. 50, 04
        mov     eax, dword [mx]                         ; 28A9 _ A1, 00000134(d)
        add     eax, edx                                ; 28AE _ 01. D0
        mov     dword [mx], eax                         ; 28B0 _ A3, 00000134(d)
        mov     eax, dword [ebp+10H]                    ; 28B5 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 28B8 _ 8B. 50, 08
        mov     eax, dword [my]                         ; 28BB _ A1, 00000138(d)
        add     eax, edx                                ; 28C0 _ 01. D0
        mov     dword [my], eax                         ; 28C2 _ A3, 00000138(d)
        mov     eax, dword [mx]                         ; 28C7 _ A1, 00000134(d)
        test    eax, eax                                ; 28CC _ 85. C0
        jns     ?_133                                   ; 28CE _ 79, 0A
        mov     dword [mx], 0                           ; 28D0 _ C7. 05, 00000134(d), 00000000
?_133:  mov     eax, dword [my]                         ; 28DA _ A1, 00000138(d)
        test    eax, eax                                ; 28DF _ 85. C0
        jns     ?_134                                   ; 28E1 _ 79, 0A
        mov     dword [my], 0                           ; 28E3 _ C7. 05, 00000138(d), 00000000
?_134:  mov     eax, dword [xsize]                      ; 28ED _ A1, 0000013C(d)
        lea     edx, [eax-1H]                           ; 28F2 _ 8D. 50, FF
        mov     eax, dword [mx]                         ; 28F5 _ A1, 00000134(d)
        cmp     edx, eax                                ; 28FA _ 39. C2
        jge     ?_135                                   ; 28FC _ 7D, 0D
        mov     eax, dword [xsize]                      ; 28FE _ A1, 0000013C(d)
        sub     eax, 1                                  ; 2903 _ 83. E8, 01
        mov     dword [mx], eax                         ; 2906 _ A3, 00000134(d)
?_135:  mov     eax, dword [ysize]                      ; 290B _ A1, 00000140(d)
        lea     edx, [eax-1H]                           ; 2910 _ 8D. 50, FF
        mov     eax, dword [my]                         ; 2913 _ A1, 00000138(d)
        cmp     edx, eax                                ; 2918 _ 39. C2
        jge     ?_136                                   ; 291A _ 7D, 0D
        mov     eax, dword [ysize]                      ; 291C _ A1, 00000140(d)
        sub     eax, 1                                  ; 2921 _ 83. E8, 01
        mov     dword [my], eax                         ; 2924 _ A3, 00000138(d)
?_136:  pop     ebp                                     ; 2929 _ 5D
        ret                                             ; 292A _ C3
; computeMousePosition End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 292B _ 55
        mov     ebp, esp                                ; 292C _ 89. E5
        sub     esp, 56                                 ; 292E _ 83. EC, 38
        mov     eax, dword [buf_back]                   ; 2931 _ A1, 00000144(d)
        mov     dword [ebp-10H], eax                    ; 2936 _ 89. 45, F0
        mov     byte [ebp-11H], 0                       ; 2939 _ C6. 45, EF, 00
        mov     dword [ebp-18H], 0                      ; 293D _ C7. 45, E8, 00000000
        call    io_sti                                  ; 2944 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 2949 _ C7. 04 24, 00000034(d)
        call    fifo8_get                               ; 2950 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-11H], al                      ; 2955 _ 88. 45, EF
        movzx   eax, byte [ebp-11H]                     ; 2958 _ 0F B6. 45, EF
        mov     dword [esp+4H], eax                     ; 295C _ 89. 44 24, 04
        mov     dword [esp], mdec                       ; 2960 _ C7. 04 24, 00000100(d)
        call    mouse_decode                            ; 2967 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 296C _ 85. C0
        je      ?_145                                   ; 296E _ 0F 84, 00000254
        mov     dword [esp+8H], mdec                    ; 2974 _ C7. 44 24, 08, 00000100(d)
        mov     eax, dword [ebp+0CH]                    ; 297C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 297F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2983 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2986 _ 89. 04 24
        call    computeMousePosition                    ; 2989 _ E8, FFFFFFFC(rel)
        mov     edx, dword [my]                         ; 298E _ 8B. 15, 00000138(d)
        mov     eax, dword [mx]                         ; 2994 _ A1, 00000134(d)
        mov     dword [esp+0CH], edx                    ; 2999 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 299D _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 29A1 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 29A4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 29A8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 29AB _ 89. 04 24
        call    sheet_slide                             ; 29AE _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_392]                      ; 29B3 _ A1, 0000010C(d)
        and     eax, 01H                                ; 29B8 _ 83. E0, 01
        test    eax, eax                                ; 29BB _ 85. C0
        je      ?_144                                   ; 29BD _ 0F 84, 000001FB
        mov     eax, dword [mmx]                        ; 29C3 _ A1, 00000118(d)
        test    eax, eax                                ; 29C8 _ 85. C0
        jns     ?_143                                   ; 29CA _ 0F 89, 0000017D
        mov     eax, dword [ebp+8H]                     ; 29D0 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 29D3 _ 8B. 40, 10
        sub     eax, 1                                  ; 29D6 _ 83. E8, 01
        mov     dword [ebp-0CH], eax                    ; 29D9 _ 89. 45, F4
        jmp     ?_141                                   ; 29DC _ E9, 0000015E

?_137:  mov     eax, dword [ebp+8H]                     ; 29E1 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 29E4 _ 8B. 55, F4
        add     edx, 4                                  ; 29E7 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 29EA _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 29EE _ 89. 45, E8
        mov     edx, dword [mx]                         ; 29F1 _ 8B. 15, 00000134(d)
        mov     eax, dword [ebp-18H]                    ; 29F7 _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 29FA _ 8B. 40, 0C
        sub     edx, eax                                ; 29FD _ 29. C2
        mov     eax, edx                                ; 29FF _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2A01 _ 89. 45, E4
        mov     edx, dword [my]                         ; 2A04 _ 8B. 15, 00000138(d)
        mov     eax, dword [ebp-18H]                    ; 2A0A _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 2A0D _ 8B. 40, 10
        sub     edx, eax                                ; 2A10 _ 29. C2
        mov     eax, edx                                ; 2A12 _ 89. D0
        mov     dword [ebp-20H], eax                    ; 2A14 _ 89. 45, E0
        cmp     dword [ebp-1CH], 0                      ; 2A17 _ 83. 7D, E4, 00
        js      ?_140                                   ; 2A1B _ 0F 88, 0000011A
        mov     eax, dword [ebp-18H]                    ; 2A21 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2A24 _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 2A27 _ 3B. 45, E4
        jle     ?_140                                   ; 2A2A _ 0F 8E, 0000010B
        cmp     dword [ebp-20H], 0                      ; 2A30 _ 83. 7D, E0, 00
        js      ?_140                                   ; 2A34 _ 0F 88, 00000101
        mov     eax, dword [ebp-18H]                    ; 2A3A _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 2A3D _ 8B. 40, 08
        cmp     eax, dword [ebp-20H]                    ; 2A40 _ 3B. 45, E0
        jle     ?_140                                   ; 2A43 _ 0F 8E, 000000F2
        mov     eax, dword [ebp-18H]                    ; 2A49 _ 8B. 45, E8
        mov     edx, dword [eax]                        ; 2A4C _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 2A4E _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2A51 _ 8B. 40, 04
        imul    eax, dword [ebp-20H]                    ; 2A54 _ 0F AF. 45, E0
        mov     ecx, eax                                ; 2A58 _ 89. C1
        mov     eax, dword [ebp-1CH]                    ; 2A5A _ 8B. 45, E4
        add     eax, ecx                                ; 2A5D _ 01. C8
        add     eax, edx                                ; 2A5F _ 01. D0
        movzx   eax, byte [eax]                         ; 2A61 _ 0F B6. 00
        movzx   edx, al                                 ; 2A64 _ 0F B6. D0
        mov     eax, dword [ebp-18H]                    ; 2A67 _ 8B. 45, E8
        mov     eax, dword [eax+14H]                    ; 2A6A _ 8B. 40, 14
        cmp     edx, eax                                ; 2A6D _ 39. C2
        je      ?_140                                   ; 2A6F _ 0F 84, 000000C6
        mov     eax, dword [ebp+8H]                     ; 2A75 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2A78 _ 8B. 40, 10
        sub     eax, 1                                  ; 2A7B _ 83. E8, 01
        mov     dword [esp+8H], eax                     ; 2A7E _ 89. 44 24, 08
        mov     eax, dword [ebp-18H]                    ; 2A82 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 2A85 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2A89 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2A8C _ 89. 04 24
        call    sheet_updown                            ; 2A8F _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-1CH], 2                      ; 2A94 _ 83. 7D, E4, 02
        jle     ?_138                                   ; 2A98 _ 7E, 36
        mov     eax, dword [ebp-18H]                    ; 2A9A _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2A9D _ 8B. 40, 04
        sub     eax, 3                                  ; 2AA0 _ 83. E8, 03
        cmp     eax, dword [ebp-1CH]                    ; 2AA3 _ 3B. 45, E4
        jle     ?_138                                   ; 2AA6 _ 7E, 28
        cmp     dword [ebp-20H], 2                      ; 2AA8 _ 83. 7D, E0, 02
        jle     ?_138                                   ; 2AAC _ 7E, 22
        cmp     dword [ebp-20H], 20                     ; 2AAE _ 83. 7D, E0, 14
        jg      ?_138                                   ; 2AB2 _ 7F, 1C
        mov     eax, dword [mx]                         ; 2AB4 _ A1, 00000134(d)
        mov     dword [mmx], eax                        ; 2AB9 _ A3, 00000118(d)
        mov     eax, dword [my]                         ; 2ABE _ A1, 00000138(d)
        mov     dword [mmy], eax                        ; 2AC3 _ A3, 0000011C(d)
        mov     eax, dword [ebp-18H]                    ; 2AC8 _ 8B. 45, E8
        mov     dword [mouse_clicked_sht], eax          ; 2ACB _ A3, 00000270(d)
?_138:  mov     eax, dword [ebp-18H]                    ; 2AD0 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2AD3 _ 8B. 40, 04
        sub     eax, 21                                 ; 2AD6 _ 83. E8, 15
        cmp     eax, dword [ebp-1CH]                    ; 2AD9 _ 3B. 45, E4
        jg      ?_139                                   ; 2ADC _ 7F, 5B
        mov     eax, dword [ebp-18H]                    ; 2ADE _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 2AE1 _ 8B. 40, 04
        sub     eax, 5                                  ; 2AE4 _ 83. E8, 05
        cmp     eax, dword [ebp-1CH]                    ; 2AE7 _ 3B. 45, E4
        jle     ?_139                                   ; 2AEA _ 7E, 4D
        cmp     dword [ebp-20H], 4                      ; 2AEC _ 83. 7D, E0, 04
        jle     ?_139                                   ; 2AF0 _ 7E, 47
        cmp     dword [ebp-20H], 18                     ; 2AF2 _ 83. 7D, E0, 12
        jg      ?_139                                   ; 2AF6 _ 7F, 41
        mov     eax, dword [ebp-18H]                    ; 2AF8 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 2AFB _ 8B. 40, 20
        test    eax, eax                                ; 2AFE _ 85. C0
        jz      ?_139                                   ; 2B00 _ 74, 37
        call    io_cli                                  ; 2B02 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 2B07 _ 8B. 45, E8
        mov     dword [esp+4H], eax                     ; 2B0A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B0E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B11 _ 89. 04 24
        call    sheet_free                              ; 2B14 _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 2B19 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 2B1E _ 89. 45, DC
        mov     eax, dword [ebp-18H]                    ; 2B21 _ 8B. 45, E8
        mov     eax, dword [eax+20H]                    ; 2B24 _ 8B. 40, 20
        mov     edx, kill_process                       ; 2B27 _ BA, 00000000(d)
        sub     edx, dword [ebp-24H]                    ; 2B2C _ 2B. 55, DC
        mov     dword [eax+4CH], edx                    ; 2B2F _ 89. 50, 4C
        call    io_sti                                  ; 2B32 _ E8, FFFFFFFC(rel)
        jmp     ?_142                                   ; 2B37 _ EB, 12

?_139:  jmp     ?_142                                   ; 2B39 _ EB, 10

?_140:  sub     dword [ebp-0CH], 1                      ; 2B3B _ 83. 6D, F4, 01
?_141:  cmp     dword [ebp-0CH], 0                      ; 2B3F _ 83. 7D, F4, 00
        jg      ?_137                                   ; 2B43 _ 0F 8F, FFFFFE98
        jmp     ?_145                                   ; 2B49 _ EB, 7D

?_142:  jmp     ?_145                                   ; 2B4B _ EB, 7B

?_143:  mov     edx, dword [mx]                         ; 2B4D _ 8B. 15, 00000134(d)
        mov     eax, dword [mmx]                        ; 2B53 _ A1, 00000118(d)
        sub     edx, eax                                ; 2B58 _ 29. C2
        mov     eax, edx                                ; 2B5A _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 2B5C _ 89. 45, E4
        mov     edx, dword [my]                         ; 2B5F _ 8B. 15, 00000138(d)
        mov     eax, dword [mmy]                        ; 2B65 _ A1, 0000011C(d)
        sub     edx, eax                                ; 2B6A _ 29. C2
        mov     eax, edx                                ; 2B6C _ 89. D0
        mov     dword [ebp-20H], eax                    ; 2B6E _ 89. 45, E0
        mov     eax, dword [mouse_clicked_sht]          ; 2B71 _ A1, 00000270(d)
        mov     edx, dword [eax+10H]                    ; 2B76 _ 8B. 50, 10
        mov     eax, dword [ebp-20H]                    ; 2B79 _ 8B. 45, E0
        lea     ecx, [edx+eax]                          ; 2B7C _ 8D. 0C 02
        mov     eax, dword [mouse_clicked_sht]          ; 2B7F _ A1, 00000270(d)
        mov     edx, dword [eax+0CH]                    ; 2B84 _ 8B. 50, 0C
        mov     eax, dword [ebp-1CH]                    ; 2B87 _ 8B. 45, E4
        add     edx, eax                                ; 2B8A _ 01. C2
        mov     eax, dword [mouse_clicked_sht]          ; 2B8C _ A1, 00000270(d)
        mov     dword [esp+0CH], ecx                    ; 2B91 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2B95 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2B99 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B9D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2BA0 _ 89. 04 24
        call    sheet_slide                             ; 2BA3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mx]                         ; 2BA8 _ A1, 00000134(d)
        mov     dword [mmx], eax                        ; 2BAD _ A3, 00000118(d)
        mov     eax, dword [my]                         ; 2BB2 _ A1, 00000138(d)
        mov     dword [mmy], eax                        ; 2BB7 _ A3, 0000011C(d)
        jmp     ?_145                                   ; 2BBC _ EB, 0A

?_144:  mov     dword [mmx], -1                         ; 2BBE _ C7. 05, 00000118(d), FFFFFFFF
?_145:  leave                                           ; 2BC8 _ C9
        ret                                             ; 2BC9 _ C3
; show_mouse_info End of function

initBootInfo:; Function begin
        push    ebp                                     ; 2BCA _ 55
        mov     ebp, esp                                ; 2BCB _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2BCD _ 8B. 45, 08
        mov     dword [eax], -536870912                 ; 2BD0 _ C7. 00, E0000000
        mov     eax, dword [ebp+8H]                     ; 2BD6 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 2BD9 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 2BDF _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 2BE2 _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 2BE8 _ 5D
        ret                                             ; 2BE9 _ C3
; initBootInfo End of function

showString:; Function begin
        push    ebp                                     ; 2BEA _ 55
        mov     ebp, esp                                ; 2BEB _ 89. E5
        push    ebx                                     ; 2BED _ 53
        sub     esp, 52                                 ; 2BEE _ 83. EC, 34
        mov     eax, dword [ebp+18H]                    ; 2BF1 _ 8B. 45, 18
        mov     byte [ebp-1CH], al                      ; 2BF4 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 2BF7 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 2BFA _ 89. 45, F4
        mov     dword [ebp-10H], 0                      ; 2BFD _ C7. 45, F0, 00000000
        jmp     ?_147                                   ; 2C04 _ EB, 4B

?_146:  mov     eax, dword [ebp+1CH]                    ; 2C06 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 2C09 _ 0F B6. 00
        movzx   eax, al                                 ; 2C0C _ 0F B6. C0
        shl     eax, 4                                  ; 2C0F _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 2C12 _ 8D. 98, 00000000(d)
        movsx   ecx, byte [ebp-1CH]                     ; 2C18 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+0CH]                    ; 2C1C _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 2C1F _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2C22 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2C25 _ 8B. 00
        mov     dword [esp+14H], ebx                    ; 2C27 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 2C2B _ 89. 4C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 2C2F _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 2C32 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 2C36 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 2C39 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2C3D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2C41 _ 89. 04 24
        call    showFont8                               ; 2C44 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 2C49 _ 83. 45, 10, 08
        add     dword [ebp+1CH], 1                      ; 2C4D _ 83. 45, 1C, 01
?_147:  mov     eax, dword [ebp+1CH]                    ; 2C51 _ 8B. 45, 1C
        movzx   eax, byte [eax]                         ; 2C54 _ 0F B6. 00
        test    al, al                                  ; 2C57 _ 84. C0
        jnz     ?_146                                   ; 2C59 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 2C5B _ 8B. 45, 14
        add     eax, 16                                 ; 2C5E _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 2C61 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 2C65 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 2C68 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 2C6C _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 2C6F _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2C73 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2C76 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2C7A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2C7D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2C81 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C84 _ 89. 04 24
        call    sheet_refresh                           ; 2C87 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 2C8C _ 83. C4, 34
        pop     ebx                                     ; 2C8F _ 5B
        pop     ebp                                     ; 2C90 _ 5D
        ret                                             ; 2C91 _ C3
; showString End of function

init_palette:; Function begin
        push    ebp                                     ; 2C92 _ 55
        mov     ebp, esp                                ; 2C93 _ 89. E5
        sub     esp, 696                                ; 2C95 _ 81. EC, 000002B8
        mov     dword [esp+8H], table_rgb.2069          ; 2C9B _ C7. 44 24, 08, 00000140(d)
        mov     dword [esp+4H], 15                      ; 2CA3 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 2CAB _ C7. 04 24, 00000000
        call    set_palette                             ; 2CB2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 2CB7 _ C7. 45, EC, 00000000
        jmp     ?_153                                   ; 2CBE _ E9, 000000EF

?_148:  mov     dword [ebp-10H], 0                      ; 2CC3 _ C7. 45, F0, 00000000
        jmp     ?_152                                   ; 2CCA _ E9, 000000D5

?_149:  mov     dword [ebp-0CH], 0                      ; 2CCF _ C7. 45, F4, 00000000
        jmp     ?_151                                   ; 2CD6 _ E9, 000000BB

?_150:  mov     edx, dword [ebp-10H]                    ; 2CDB _ 8B. 55, F0
        mov     eax, edx                                ; 2CDE _ 89. D0
        add     eax, eax                                ; 2CE0 _ 01. C0
        add     eax, edx                                ; 2CE2 _ 01. D0
        add     eax, eax                                ; 2CE4 _ 01. C0
        mov     edx, eax                                ; 2CE6 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2CE8 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 2CEB _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 2CEE _ 8B. 55, EC
        mov     eax, edx                                ; 2CF1 _ 89. D0
        shl     eax, 3                                  ; 2CF3 _ C1. E0, 03
        add     eax, edx                                ; 2CF6 _ 01. D0
        shl     eax, 2                                  ; 2CF8 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 2CFB _ 8D. 14 01
        mov     eax, edx                                ; 2CFE _ 89. D0
        add     eax, eax                                ; 2D00 _ 01. C0
        add     edx, eax                                ; 2D02 _ 01. C2
        mov     eax, dword [ebp-0CH]                    ; 2D04 _ 8B. 45, F4
        mov     ecx, 51                                 ; 2D07 _ B9, 00000033
        imul    eax, ecx                                ; 2D0C _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 2D0F _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 2D16 _ 8B. 55, F0
        mov     eax, edx                                ; 2D19 _ 89. D0
        add     eax, eax                                ; 2D1B _ 01. C0
        add     eax, edx                                ; 2D1D _ 01. D0
        add     eax, eax                                ; 2D1F _ 01. C0
        mov     edx, eax                                ; 2D21 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2D23 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 2D26 _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 2D29 _ 8B. 55, EC
        mov     eax, edx                                ; 2D2C _ 89. D0
        shl     eax, 3                                  ; 2D2E _ C1. E0, 03
        add     eax, edx                                ; 2D31 _ 01. D0
        shl     eax, 2                                  ; 2D33 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 2D36 _ 8D. 14 01
        mov     eax, edx                                ; 2D39 _ 89. D0
        add     eax, eax                                ; 2D3B _ 01. C0
        add     eax, edx                                ; 2D3D _ 01. D0
        lea     edx, [eax+1H]                           ; 2D3F _ 8D. 50, 01
        mov     eax, dword [ebp-10H]                    ; 2D42 _ 8B. 45, F0
        mov     ecx, 51                                 ; 2D45 _ B9, 00000033
        imul    eax, ecx                                ; 2D4A _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 2D4D _ 88. 84 15, FFFFFD64
        mov     edx, dword [ebp-10H]                    ; 2D54 _ 8B. 55, F0
        mov     eax, edx                                ; 2D57 _ 89. D0
        add     eax, eax                                ; 2D59 _ 01. C0
        add     eax, edx                                ; 2D5B _ 01. D0
        add     eax, eax                                ; 2D5D _ 01. C0
        mov     edx, eax                                ; 2D5F _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2D61 _ 8B. 45, F4
        lea     ecx, [edx+eax]                          ; 2D64 _ 8D. 0C 02
        mov     edx, dword [ebp-14H]                    ; 2D67 _ 8B. 55, EC
        mov     eax, edx                                ; 2D6A _ 89. D0
        shl     eax, 3                                  ; 2D6C _ C1. E0, 03
        add     eax, edx                                ; 2D6F _ 01. D0
        shl     eax, 2                                  ; 2D71 _ C1. E0, 02
        lea     edx, [ecx+eax]                          ; 2D74 _ 8D. 14 01
        mov     eax, edx                                ; 2D77 _ 89. D0
        add     eax, eax                                ; 2D79 _ 01. C0
        add     eax, edx                                ; 2D7B _ 01. D0
        lea     edx, [eax+2H]                           ; 2D7D _ 8D. 50, 02
        mov     eax, dword [ebp-14H]                    ; 2D80 _ 8B. 45, EC
        mov     ecx, 51                                 ; 2D83 _ B9, 00000033
        imul    eax, ecx                                ; 2D88 _ 0F AF. C1
        mov     byte [ebp+edx-29CH], al                 ; 2D8B _ 88. 84 15, FFFFFD64
        add     dword [ebp-0CH], 1                      ; 2D92 _ 83. 45, F4, 01
?_151:  cmp     dword [ebp-0CH], 5                      ; 2D96 _ 83. 7D, F4, 05
        jle     ?_150                                   ; 2D9A _ 0F 8E, FFFFFF3B
        add     dword [ebp-10H], 1                      ; 2DA0 _ 83. 45, F0, 01
?_152:  cmp     dword [ebp-10H], 5                      ; 2DA4 _ 83. 7D, F0, 05
        jle     ?_149                                   ; 2DA8 _ 0F 8E, FFFFFF21
        add     dword [ebp-14H], 1                      ; 2DAE _ 83. 45, EC, 01
?_153:  cmp     dword [ebp-14H], 5                      ; 2DB2 _ 83. 7D, EC, 05
        jle     ?_148                                   ; 2DB6 _ 0F 8E, FFFFFF07
        lea     eax, [ebp-29CH]                         ; 2DBC _ 8D. 85, FFFFFD64
        mov     dword [esp+8H], eax                     ; 2DC2 _ 89. 44 24, 08
        mov     dword [esp+4H], 231                     ; 2DC6 _ C7. 44 24, 04, 000000E7
        mov     dword [esp], 16                         ; 2DCE _ C7. 04 24, 00000010
        call    set_palette                             ; 2DD5 _ E8, FFFFFFFC(rel)
        nop                                             ; 2DDA _ 90
        leave                                           ; 2DDB _ C9
        ret                                             ; 2DDC _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 2DDD _ 55
        mov     ebp, esp                                ; 2DDE _ 89. E5
        sub     esp, 40                                 ; 2DE0 _ 83. EC, 28
        call    io_load_eflags                          ; 2DE3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2DE8 _ 89. 45, F0
        call    io_cli                                  ; 2DEB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2DF0 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 2DF3 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 2DF7 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 2DFE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2E03 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 2E06 _ 89. 45, F4
        jmp     ?_155                                   ; 2E09 _ EB, 62

?_154:  mov     eax, dword [ebp+10H]                    ; 2E0B _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 2E0E _ 0F B6. 00
        shr     al, 2                                   ; 2E11 _ C0. E8, 02
        movzx   eax, al                                 ; 2E14 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 2E17 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 2E1B _ C7. 04 24, 000003C9
        call    io_out8                                 ; 2E22 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2E27 _ 8B. 45, 10
        add     eax, 1                                  ; 2E2A _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 2E2D _ 0F B6. 00
        shr     al, 2                                   ; 2E30 _ C0. E8, 02
        movzx   eax, al                                 ; 2E33 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 2E36 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 2E3A _ C7. 04 24, 000003C9
        call    io_out8                                 ; 2E41 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2E46 _ 8B. 45, 10
        add     eax, 2                                  ; 2E49 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 2E4C _ 0F B6. 00
        shr     al, 2                                   ; 2E4F _ C0. E8, 02
        movzx   eax, al                                 ; 2E52 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 2E55 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 2E59 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 2E60 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 2E65 _ 83. 45, 10, 03
        add     dword [ebp-0CH], 1                      ; 2E69 _ 83. 45, F4, 01
?_155:  mov     eax, dword [ebp-0CH]                    ; 2E6D _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 2E70 _ 3B. 45, 0C
        jle     ?_154                                   ; 2E73 _ 7E, 96
        mov     eax, dword [ebp-10H]                    ; 2E75 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 2E78 _ 89. 04 24
        call    io_store_eflags                         ; 2E7B _ E8, FFFFFFFC(rel)
        nop                                             ; 2E80 _ 90
        leave                                           ; 2E81 _ C9
        ret                                             ; 2E82 _ C3
; set_palette End of function

boxfill8:; Function begin
        push    ebp                                     ; 2E83 _ 55
        mov     ebp, esp                                ; 2E84 _ 89. E5
        sub     esp, 20                                 ; 2E86 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 2E89 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 2E8C _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 2E8F _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 2E92 _ 89. 45, F8
        jmp     ?_159                                   ; 2E95 _ EB, 33

?_156:  mov     eax, dword [ebp+14H]                    ; 2E97 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 2E9A _ 89. 45, FC
        jmp     ?_158                                   ; 2E9D _ EB, 1F

?_157:  mov     eax, dword [ebp-8H]                     ; 2E9F _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 2EA2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2EA6 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2EA8 _ 8B. 45, FC
        add     eax, edx                                ; 2EAB _ 01. D0
        mov     edx, eax                                ; 2EAD _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2EAF _ 8B. 45, 08
        add     edx, eax                                ; 2EB2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2EB4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2EB8 _ 88. 02
        add     dword [ebp-4H], 1                       ; 2EBA _ 83. 45, FC, 01
?_158:  mov     eax, dword [ebp-4H]                     ; 2EBE _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 2EC1 _ 3B. 45, 1C
        jle     ?_157                                   ; 2EC4 _ 7E, D9
        add     dword [ebp-8H], 1                       ; 2EC6 _ 83. 45, F8, 01
?_159:  mov     eax, dword [ebp-8H]                     ; 2ECA _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 2ECD _ 3B. 45, 20
        jle     ?_156                                   ; 2ED0 _ 7E, C5
        leave                                           ; 2ED2 _ C9
        ret                                             ; 2ED3 _ C3
; boxfill8 End of function

showFont8:; Function begin
        push    ebp                                     ; 2ED4 _ 55
        mov     ebp, esp                                ; 2ED5 _ 89. E5
        sub     esp, 20                                 ; 2ED7 _ 83. EC, 14
        mov     eax, dword [ebp+18H]                    ; 2EDA _ 8B. 45, 18
        mov     byte [ebp-14H], al                      ; 2EDD _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 2EE0 _ C7. 45, FC, 00000000
        jmp     ?_169                                   ; 2EE7 _ E9, 0000016C

?_160:  mov     edx, dword [ebp-4H]                     ; 2EEC _ 8B. 55, FC
        mov     eax, dword [ebp+1CH]                    ; 2EEF _ 8B. 45, 1C
        add     eax, edx                                ; 2EF2 _ 01. D0
        movzx   eax, byte [eax]                         ; 2EF4 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 2EF7 _ 88. 45, FB
        cmp     byte [ebp-5H], 0                        ; 2EFA _ 80. 7D, FB, 00
        jns     ?_161                                   ; 2EFE _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 2F00 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2F03 _ 8B. 55, 14
        add     eax, edx                                ; 2F06 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2F08 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2F0C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2F0E _ 8B. 45, 10
        add     eax, edx                                ; 2F11 _ 01. D0
        mov     edx, eax                                ; 2F13 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2F15 _ 8B. 45, 08
        add     edx, eax                                ; 2F18 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2F1A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2F1E _ 88. 02
?_161:  movsx   eax, byte [ebp-5H]                      ; 2F20 _ 0F BE. 45, FB
        and     eax, 40H                                ; 2F24 _ 83. E0, 40
        test    eax, eax                                ; 2F27 _ 85. C0
        jz      ?_162                                   ; 2F29 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2F2B _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2F2E _ 8B. 55, 14
        add     eax, edx                                ; 2F31 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2F33 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2F37 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2F39 _ 8B. 45, 10
        add     eax, edx                                ; 2F3C _ 01. D0
        lea     edx, [eax+1H]                           ; 2F3E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2F41 _ 8B. 45, 08
        add     edx, eax                                ; 2F44 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2F46 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2F4A _ 88. 02
?_162:  movsx   eax, byte [ebp-5H]                      ; 2F4C _ 0F BE. 45, FB
        and     eax, 20H                                ; 2F50 _ 83. E0, 20
        test    eax, eax                                ; 2F53 _ 85. C0
        jz      ?_163                                   ; 2F55 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2F57 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2F5A _ 8B. 55, 14
        add     eax, edx                                ; 2F5D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2F5F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2F63 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2F65 _ 8B. 45, 10
        add     eax, edx                                ; 2F68 _ 01. D0
        lea     edx, [eax+2H]                           ; 2F6A _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 2F6D _ 8B. 45, 08
        add     edx, eax                                ; 2F70 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2F72 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2F76 _ 88. 02
?_163:  movsx   eax, byte [ebp-5H]                      ; 2F78 _ 0F BE. 45, FB
        and     eax, 10H                                ; 2F7C _ 83. E0, 10
        test    eax, eax                                ; 2F7F _ 85. C0
        jz      ?_164                                   ; 2F81 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2F83 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2F86 _ 8B. 55, 14
        add     eax, edx                                ; 2F89 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2F8B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2F8F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2F91 _ 8B. 45, 10
        add     eax, edx                                ; 2F94 _ 01. D0
        lea     edx, [eax+3H]                           ; 2F96 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 2F99 _ 8B. 45, 08
        add     edx, eax                                ; 2F9C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2F9E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2FA2 _ 88. 02
?_164:  movsx   eax, byte [ebp-5H]                      ; 2FA4 _ 0F BE. 45, FB
        and     eax, 08H                                ; 2FA8 _ 83. E0, 08
        test    eax, eax                                ; 2FAB _ 85. C0
        jz      ?_165                                   ; 2FAD _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2FAF _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2FB2 _ 8B. 55, 14
        add     eax, edx                                ; 2FB5 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2FB7 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2FBB _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2FBD _ 8B. 45, 10
        add     eax, edx                                ; 2FC0 _ 01. D0
        lea     edx, [eax+4H]                           ; 2FC2 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2FC5 _ 8B. 45, 08
        add     edx, eax                                ; 2FC8 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2FCA _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2FCE _ 88. 02
?_165:  movsx   eax, byte [ebp-5H]                      ; 2FD0 _ 0F BE. 45, FB
        and     eax, 04H                                ; 2FD4 _ 83. E0, 04
        test    eax, eax                                ; 2FD7 _ 85. C0
        jz      ?_166                                   ; 2FD9 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 2FDB _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 2FDE _ 8B. 55, 14
        add     eax, edx                                ; 2FE1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 2FE3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 2FE7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2FE9 _ 8B. 45, 10
        add     eax, edx                                ; 2FEC _ 01. D0
        lea     edx, [eax+5H]                           ; 2FEE _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 2FF1 _ 8B. 45, 08
        add     edx, eax                                ; 2FF4 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 2FF6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 2FFA _ 88. 02
?_166:  movsx   eax, byte [ebp-5H]                      ; 2FFC _ 0F BE. 45, FB
        and     eax, 02H                                ; 3000 _ 83. E0, 02
        test    eax, eax                                ; 3003 _ 85. C0
        jz      ?_167                                   ; 3005 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 3007 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 300A _ 8B. 55, 14
        add     eax, edx                                ; 300D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 300F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 3013 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3015 _ 8B. 45, 10
        add     eax, edx                                ; 3018 _ 01. D0
        lea     edx, [eax+6H]                           ; 301A _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 301D _ 8B. 45, 08
        add     edx, eax                                ; 3020 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3022 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3026 _ 88. 02
?_167:  movsx   eax, byte [ebp-5H]                      ; 3028 _ 0F BE. 45, FB
        and     eax, 01H                                ; 302C _ 83. E0, 01
        test    eax, eax                                ; 302F _ 85. C0
        jz      ?_168                                   ; 3031 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 3033 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 3036 _ 8B. 55, 14
        add     eax, edx                                ; 3039 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 303B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 303F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3041 _ 8B. 45, 10
        add     eax, edx                                ; 3044 _ 01. D0
        lea     edx, [eax+7H]                           ; 3046 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 3049 _ 8B. 45, 08
        add     edx, eax                                ; 304C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 304E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3052 _ 88. 02
?_168:  add     dword [ebp-4H], 1                       ; 3054 _ 83. 45, FC, 01
?_169:  cmp     dword [ebp-4H], 15                      ; 3058 _ 83. 7D, FC, 0F
        jle     ?_160                                   ; 305C _ 0F 8E, FFFFFE8A
        leave                                           ; 3062 _ C9
        ret                                             ; 3063 _ C3
; showFont8 End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 3064 _ 55
        mov     ebp, esp                                ; 3065 _ 89. E5
        sub     esp, 20                                 ; 3067 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 306A _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 306D _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 3070 _ C7. 45, F8, 00000000
        jmp     ?_176                                   ; 3077 _ E9, 000000B1

?_170:  mov     dword [ebp-4H], 0                       ; 307C _ C7. 45, FC, 00000000
        jmp     ?_175                                   ; 3083 _ E9, 00000097

?_171:  mov     eax, dword [ebp-8H]                     ; 3088 _ 8B. 45, F8
        shl     eax, 4                                  ; 308B _ C1. E0, 04
        mov     edx, eax                                ; 308E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3090 _ 8B. 45, FC
        add     eax, edx                                ; 3093 _ 01. D0
        add     eax, cursor.2129                        ; 3095 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 309A _ 0F B6. 00
        cmp     al, 42                                  ; 309D _ 3C, 2A
        jnz     ?_172                                   ; 309F _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 30A1 _ 8B. 45, F8
        shl     eax, 4                                  ; 30A4 _ C1. E0, 04
        mov     edx, eax                                ; 30A7 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 30A9 _ 8B. 45, FC
        add     eax, edx                                ; 30AC _ 01. D0
        mov     edx, eax                                ; 30AE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 30B0 _ 8B. 45, 08
        add     eax, edx                                ; 30B3 _ 01. D0
        mov     byte [eax], 0                           ; 30B5 _ C6. 00, 00
?_172:  mov     eax, dword [ebp-8H]                     ; 30B8 _ 8B. 45, F8
        shl     eax, 4                                  ; 30BB _ C1. E0, 04
        mov     edx, eax                                ; 30BE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 30C0 _ 8B. 45, FC
        add     eax, edx                                ; 30C3 _ 01. D0
        add     eax, cursor.2129                        ; 30C5 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 30CA _ 0F B6. 00
        cmp     al, 79                                  ; 30CD _ 3C, 4F
        jnz     ?_173                                   ; 30CF _ 75, 17
        mov     eax, dword [ebp-8H]                     ; 30D1 _ 8B. 45, F8
        shl     eax, 4                                  ; 30D4 _ C1. E0, 04
        mov     edx, eax                                ; 30D7 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 30D9 _ 8B. 45, FC
        add     eax, edx                                ; 30DC _ 01. D0
        mov     edx, eax                                ; 30DE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 30E0 _ 8B. 45, 08
        add     eax, edx                                ; 30E3 _ 01. D0
        mov     byte [eax], 7                           ; 30E5 _ C6. 00, 07
?_173:  mov     eax, dword [ebp-8H]                     ; 30E8 _ 8B. 45, F8
        shl     eax, 4                                  ; 30EB _ C1. E0, 04
        mov     edx, eax                                ; 30EE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 30F0 _ 8B. 45, FC
        add     eax, edx                                ; 30F3 _ 01. D0
        add     eax, cursor.2129                        ; 30F5 _ 05, 00000180(d)
        movzx   eax, byte [eax]                         ; 30FA _ 0F B6. 00
        cmp     al, 46                                  ; 30FD _ 3C, 2E
        jnz     ?_174                                   ; 30FF _ 75, 1A
        mov     eax, dword [ebp-8H]                     ; 3101 _ 8B. 45, F8
        shl     eax, 4                                  ; 3104 _ C1. E0, 04
        mov     edx, eax                                ; 3107 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3109 _ 8B. 45, FC
        add     eax, edx                                ; 310C _ 01. D0
        mov     edx, eax                                ; 310E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3110 _ 8B. 45, 08
        add     edx, eax                                ; 3113 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 3115 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 3119 _ 88. 02
?_174:  add     dword [ebp-4H], 1                       ; 311B _ 83. 45, FC, 01
?_175:  cmp     dword [ebp-4H], 15                      ; 311F _ 83. 7D, FC, 0F
        jle     ?_171                                   ; 3123 _ 0F 8E, FFFFFF5F
        add     dword [ebp-8H], 1                       ; 3129 _ 83. 45, F8, 01
?_176:  cmp     dword [ebp-8H], 15                      ; 312D _ 83. 7D, F8, 0F
        jle     ?_170                                   ; 3131 _ 0F 8E, FFFFFF45
        leave                                           ; 3137 _ C9
        ret                                             ; 3138 _ C3
; init_mouse_cursor End of function

putblock:; Function begin
        push    ebp                                     ; 3139 _ 55
        mov     ebp, esp                                ; 313A _ 89. E5
        sub     esp, 16                                 ; 313C _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 313F _ C7. 45, F8, 00000000
        jmp     ?_180                                   ; 3146 _ EB, 50

?_177:  mov     dword [ebp-4H], 0                       ; 3148 _ C7. 45, FC, 00000000
        jmp     ?_179                                   ; 314F _ EB, 3B

?_178:  mov     eax, dword [ebp-8H]                     ; 3151 _ 8B. 45, F8
        mov     edx, dword [ebp+1CH]                    ; 3154 _ 8B. 55, 1C
        add     eax, edx                                ; 3157 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 3159 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 315D _ 8B. 55, FC
        mov     ecx, dword [ebp+18H]                    ; 3160 _ 8B. 4D, 18
        add     edx, ecx                                ; 3163 _ 01. CA
        add     eax, edx                                ; 3165 _ 01. D0
        mov     edx, eax                                ; 3167 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3169 _ 8B. 45, 08
        add     edx, eax                                ; 316C _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 316E _ 8B. 45, F8
        imul    eax, dword [ebp+24H]                    ; 3171 _ 0F AF. 45, 24
        mov     ecx, eax                                ; 3175 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 3177 _ 8B. 45, FC
        add     eax, ecx                                ; 317A _ 01. C8
        mov     ecx, eax                                ; 317C _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 317E _ 8B. 45, 20
        add     eax, ecx                                ; 3181 _ 01. C8
        movzx   eax, byte [eax]                         ; 3183 _ 0F B6. 00
        mov     byte [edx], al                          ; 3186 _ 88. 02
        add     dword [ebp-4H], 1                       ; 3188 _ 83. 45, FC, 01
?_179:  mov     eax, dword [ebp-4H]                     ; 318C _ 8B. 45, FC
        cmp     eax, dword [ebp+10H]                    ; 318F _ 3B. 45, 10
        jl      ?_178                                   ; 3192 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 3194 _ 83. 45, F8, 01
?_180:  mov     eax, dword [ebp-8H]                     ; 3198 _ 8B. 45, F8
        cmp     eax, dword [ebp+14H]                    ; 319B _ 3B. 45, 14
        jl      ?_177                                   ; 319E _ 7C, A8
        leave                                           ; 31A0 _ C9
        ret                                             ; 31A1 _ C3
; putblock End of function

intHandlerFromC:; Function begin
        push    ebp                                     ; 31A2 _ 55
        mov     ebp, esp                                ; 31A3 _ 89. E5
        sub     esp, 40                                 ; 31A5 _ 83. EC, 28
        mov     eax, dword [bootInfo]                   ; 31A8 _ A1, 00000010(d)
        mov     dword [ebp-0CH], eax                    ; 31AD _ 89. 45, F4
        movzx   eax, word [?_389]                       ; 31B0 _ 0F B7. 05, 00000014(d)
        cwde                                            ; 31B7 _ 98
        mov     dword [ebp-10H], eax                    ; 31B8 _ 89. 45, F0
        movzx   eax, word [?_390]                       ; 31BB _ 0F B7. 05, 00000016(d)
        cwde                                            ; 31C2 _ 98
        mov     dword [ebp-14H], eax                    ; 31C3 _ 89. 45, EC
        mov     dword [esp+4H], 32                      ; 31C6 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 31CE _ C7. 04 24, 00000020
        call    io_out8                                 ; 31D5 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], 0                       ; 31DA _ C6. 45, EB, 00
        mov     dword [esp], 96                         ; 31DE _ C7. 04 24, 00000060
        call    io_in8                                  ; 31E5 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-15H], al                      ; 31EA _ 88. 45, EB
        movzx   eax, byte [ebp-15H]                     ; 31ED _ 0F B6. 45, EB
        mov     dword [esp+4H], eax                     ; 31F1 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 31F5 _ C7. 04 24, 00000018(d)
        call    fifo8_put                               ; 31FC _ E8, FFFFFFFC(rel)
        nop                                             ; 3201 _ 90
        leave                                           ; 3202 _ C9
        ret                                             ; 3203 _ C3
; intHandlerFromC End of function

charToHexVal:; Function begin
        push    ebp                                     ; 3204 _ 55
        mov     ebp, esp                                ; 3205 _ 89. E5
        sub     esp, 4                                  ; 3207 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 320A _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 320D _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 3210 _ 80. 7D, FC, 09
        jle     ?_181                                   ; 3214 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 3216 _ 0F B6. 45, FC
        add     eax, 55                                 ; 321A _ 83. C0, 37
        jmp     ?_182                                   ; 321D _ EB, 07

?_181:  movzx   eax, byte [ebp-4H]                      ; 321F _ 0F B6. 45, FC
        add     eax, 48                                 ; 3223 _ 83. C0, 30
?_182:  leave                                           ; 3226 _ C9
        ret                                             ; 3227 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 3228 _ 55
        mov     ebp, esp                                ; 3229 _ 89. E5
        sub     esp, 24                                 ; 322B _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 322E _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 3231 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 3234 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 323B _ 0F B6. 45, EC
        and     eax, 0FH                                ; 323F _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 3242 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 3245 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 3249 _ 89. 04 24
        call    charToHexVal                            ; 324C _ E8, FFFFFFFC(rel)
        mov     byte [?_388], al                        ; 3251 _ A2, 00000113(d)
        movzx   eax, byte [ebp-14H]                     ; 3256 _ 0F B6. 45, EC
        shr     al, 4                                   ; 325A _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 325D _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 3260 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 3264 _ 0F BE. C0
        mov     dword [esp], eax                        ; 3267 _ 89. 04 24
        call    charToHexVal                            ; 326A _ E8, FFFFFFFC(rel)
        mov     byte [?_387], al                        ; 326F _ A2, 00000112(d)
        mov     eax, keyval                             ; 3274 _ B8, 00000110(d)
        leave                                           ; 3279 _ C9
        ret                                             ; 327A _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 327B _ 55
        mov     ebp, esp                                ; 327C _ 89. E5
        sub     esp, 16                                 ; 327E _ 83. EC, 10
        mov     byte [str.2177], 48                     ; 3281 _ C6. 05, 00000394(d), 30
        mov     byte [?_393], 88                        ; 3288 _ C6. 05, 00000395(d), 58
        mov     byte [?_394], 0                         ; 328F _ C6. 05, 0000039E(d), 00
        mov     dword [ebp-4H], 2                       ; 3296 _ C7. 45, FC, 00000002
        jmp     ?_184                                   ; 329D _ EB, 0F

?_183:  mov     eax, dword [ebp-4H]                     ; 329F _ 8B. 45, FC
        add     eax, str.2177                           ; 32A2 _ 05, 00000394(d)
        mov     byte [eax], 48                          ; 32A7 _ C6. 00, 30
        add     dword [ebp-4H], 1                       ; 32AA _ 83. 45, FC, 01
?_184:  cmp     dword [ebp-4H], 9                       ; 32AE _ 83. 7D, FC, 09
        jle     ?_183                                   ; 32B2 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 32B4 _ C7. 45, F8, 00000009
        jmp     ?_188                                   ; 32BB _ EB, 40

?_185:  mov     eax, dword [ebp+8H]                     ; 32BD _ 8B. 45, 08
        and     eax, 0FH                                ; 32C0 _ 83. E0, 0F
        mov     dword [ebp-0CH], eax                    ; 32C3 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 32C6 _ 8B. 45, 08
        shr     eax, 4                                  ; 32C9 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 32CC _ 89. 45, 08
        cmp     dword [ebp-0CH], 9                      ; 32CF _ 83. 7D, F4, 09
        jle     ?_186                                   ; 32D3 _ 7E, 13
        mov     eax, dword [ebp-0CH]                    ; 32D5 _ 8B. 45, F4
        add     eax, 55                                 ; 32D8 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 32DB _ 8B. 55, F8
        add     edx, str.2177                           ; 32DE _ 81. C2, 00000394(d)
        mov     byte [edx], al                          ; 32E4 _ 88. 02
        jmp     ?_187                                   ; 32E6 _ EB, 11

?_186:  mov     eax, dword [ebp-0CH]                    ; 32E8 _ 8B. 45, F4
        add     eax, 48                                 ; 32EB _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 32EE _ 8B. 55, F8
        add     edx, str.2177                           ; 32F1 _ 81. C2, 00000394(d)
        mov     byte [edx], al                          ; 32F7 _ 88. 02
?_187:  sub     dword [ebp-8H], 1                       ; 32F9 _ 83. 6D, F8, 01
?_188:  cmp     dword [ebp-8H], 1                       ; 32FD _ 83. 7D, F8, 01
        jle     ?_189                                   ; 3301 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 3303 _ 83. 7D, 08, 00
        jnz     ?_185                                   ; 3307 _ 75, B4
?_189:  mov     eax, str.2177                           ; 3309 _ B8, 00000394(d)
        leave                                           ; 330E _ C9
        ret                                             ; 330F _ C3
; intToHexStr End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 3310 _ 55
        mov     ebp, esp                                ; 3311 _ 89. E5
        sub     esp, 24                                 ; 3313 _ 83. EC, 18
?_190:  mov     dword [esp], 100                        ; 3316 _ C7. 04 24, 00000064
        call    io_in8                                  ; 331D _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 3322 _ 83. E0, 02
        test    eax, eax                                ; 3325 _ 85. C0
        jnz     ?_191                                   ; 3327 _ 75, 02
        jmp     ?_192                                   ; 3329 _ EB, 02

?_191:  jmp     ?_190                                   ; 332B _ EB, E9

?_192:  leave                                           ; 332D _ C9
        ret                                             ; 332E _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 332F _ 55
        mov     ebp, esp                                ; 3330 _ 89. E5
        sub     esp, 24                                 ; 3332 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 3335 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 333A _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 3342 _ C7. 04 24, 00000064
        call    io_out8                                 ; 3349 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 334E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 3353 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 335B _ C7. 04 24, 00000060
        call    io_out8                                 ; 3362 _ E8, FFFFFFFC(rel)
        nop                                             ; 3367 _ 90
        leave                                           ; 3368 _ C9
        ret                                             ; 3369 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 336A _ 55
        mov     ebp, esp                                ; 336B _ 89. E5
        sub     esp, 24                                 ; 336D _ 83. EC, 18
        call    wait_KBC_sendready                      ; 3370 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 3375 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 337D _ C7. 04 24, 00000064
        call    io_out8                                 ; 3384 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 3389 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 338E _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 3396 _ C7. 04 24, 00000060
        call    io_out8                                 ; 339D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 33A2 _ 8B. 45, 08
        mov     byte [eax+3H], 0                        ; 33A5 _ C6. 40, 03, 00
        nop                                             ; 33A9 _ 90
        leave                                           ; 33AA _ C9
        ret                                             ; 33AB _ C3
; enable_mouse End of function

intHandlerForMouse:; Function begin
        push    ebp                                     ; 33AC _ 55
        mov     ebp, esp                                ; 33AD _ 89. E5
        sub     esp, 40                                 ; 33AF _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 33B2 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 33BA _ C7. 04 24, 000000A0
        call    io_out8                                 ; 33C1 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 33C6 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 33CE _ C7. 04 24, 00000020
        call    io_out8                                 ; 33D5 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 33DA _ C7. 04 24, 00000060
        call    io_in8                                  ; 33E1 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 33E6 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 33E9 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 33ED _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 33F1 _ C7. 04 24, 00000034(d)
        call    fifo8_put                               ; 33F8 _ E8, FFFFFFFC(rel)
        leave                                           ; 33FD _ C9
        ret                                             ; 33FE _ C3
; intHandlerForMouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 33FF _ 55
        mov     ebp, esp                                ; 3400 _ 89. E5
        sub     esp, 4                                  ; 3402 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 3405 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 3408 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 340B _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 340E _ 0F B6. 40, 03
        test    al, al                                  ; 3412 _ 84. C0
        jnz     ?_194                                   ; 3414 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 3416 _ 80. 7D, FC, FA
        jnz     ?_193                                   ; 341A _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 341C _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 341F _ C6. 40, 03, 01
?_193:  mov     eax, 0                                  ; 3423 _ B8, 00000000
        jmp     ?_201                                   ; 3428 _ E9, 0000010F

?_194:  mov     eax, dword [ebp+8H]                     ; 342D _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3430 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 3434 _ 3C, 01
        jnz     ?_196                                   ; 3436 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 3438 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 343C _ 25, 000000C8
        cmp     eax, 8                                  ; 3441 _ 83. F8, 08
        jnz     ?_195                                   ; 3444 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 3446 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3449 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 344D _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 344F _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 3452 _ C6. 40, 03, 02
?_195:  mov     eax, 0                                  ; 3456 _ B8, 00000000
        jmp     ?_201                                   ; 345B _ E9, 000000DC

?_196:  mov     eax, dword [ebp+8H]                     ; 3460 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3463 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 3467 _ 3C, 02
        jnz     ?_197                                   ; 3469 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 346B _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 346E _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 3472 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3475 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 3478 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 347C _ B8, 00000000
        jmp     ?_201                                   ; 3481 _ E9, 000000B6

?_197:  mov     eax, dword [ebp+8H]                     ; 3486 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3489 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 348D _ 3C, 03
        jne     ?_200                                   ; 348F _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 3495 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3498 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 349C _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 349F _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 34A2 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 34A6 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 34A9 _ 0F B6. 00
        movzx   eax, al                                 ; 34AC _ 0F B6. C0
        and     eax, 07H                                ; 34AF _ 83. E0, 07
        mov     edx, eax                                ; 34B2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34B4 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 34B7 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 34BA _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 34BD _ 0F B6. 40, 01
        movzx   edx, al                                 ; 34C1 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 34C4 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 34C7 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 34CA _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 34CD _ 0F B6. 40, 02
        movzx   edx, al                                 ; 34D1 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 34D4 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 34D7 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 34DA _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 34DD _ 0F B6. 00
        movzx   eax, al                                 ; 34E0 _ 0F B6. C0
        and     eax, 10H                                ; 34E3 _ 83. E0, 10
        test    eax, eax                                ; 34E6 _ 85. C0
        jz      ?_198                                   ; 34E8 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 34EA _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 34ED _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 34F0 _ 0D, FFFFFF00
        mov     edx, eax                                ; 34F5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34F7 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 34FA _ 89. 50, 04
?_198:  mov     eax, dword [ebp+8H]                     ; 34FD _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3500 _ 0F B6. 00
        movzx   eax, al                                 ; 3503 _ 0F B6. C0
        and     eax, 20H                                ; 3506 _ 83. E0, 20
        test    eax, eax                                ; 3509 _ 85. C0
        jz      ?_199                                   ; 350B _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 350D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3510 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 3513 _ 0D, FFFFFF00
        mov     edx, eax                                ; 3518 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 351A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 351D _ 89. 50, 08
?_199:  mov     eax, dword [ebp+8H]                     ; 3520 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3523 _ 8B. 40, 08
        neg     eax                                     ; 3526 _ F7. D8
        mov     edx, eax                                ; 3528 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 352A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 352D _ 89. 50, 08
        mov     eax, 1                                  ; 3530 _ B8, 00000001
        jmp     ?_201                                   ; 3535 _ EB, 05

?_200:  mov     eax, 4294967295                         ; 3537 _ B8, FFFFFFFF
?_201:  leave                                           ; 353C _ C9
        ret                                             ; 353D _ C3
; mouse_decode End of function

showMemoryInfo:; Function begin
        push    ebp                                     ; 353E _ 55
        mov     ebp, esp                                ; 353F _ 89. E5
        sub     esp, 72                                 ; 3541 _ 83. EC, 48
        mov     dword [ebp-0CH], 0                      ; 3544 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 354B _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 3552 _ C7. 45, EC, 00000068
        mov     dword [ebp-18H], 80                     ; 3559 _ C7. 45, E8, 00000050
        mov     edx, dword [ysize]                      ; 3560 _ 8B. 15, 00000140(d)
        mov     eax, dword [ebp+0CH]                    ; 3566 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3569 _ 8B. 00
        mov     dword [esp+8H], edx                     ; 356B _ 89. 54 24, 08
        mov     edx, dword [ebp+1CH]                    ; 356F _ 8B. 55, 1C
        mov     dword [esp+4H], edx                     ; 3572 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3576 _ 89. 04 24
        call    init_screen8                            ; 3579 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+20H]                    ; 357E _ 8B. 45, 20
        movsx   eax, al                                 ; 3581 _ 0F BE. C0
        mov     dword [esp+14H], ?_378                  ; 3584 _ C7. 44 24, 14, 00000059(d)
        mov     dword [esp+10H], eax                    ; 358C _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3590 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3593 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3597 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 359A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 359E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 35A1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 35A5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 35A8 _ 89. 04 24
        call    showString                              ; 35AB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+18H]                    ; 35B0 _ 8B. 45, 18
        mov     dword [esp], eax                        ; 35B3 _ 89. 04 24
        call    intToHexStr                             ; 35B6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 35BB _ 89. 45, E4
        mov     eax, dword [ebp+20H]                    ; 35BE _ 8B. 45, 20
        movsx   eax, al                                 ; 35C1 _ 0F BE. C0
        mov     edx, dword [ebp-1CH]                    ; 35C4 _ 8B. 55, E4
        mov     dword [esp+14H], edx                    ; 35C7 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 35CB _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 35CF _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 35D2 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 35D6 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 35D9 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 35DD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 35E0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 35E4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 35E7 _ 89. 04 24
        call    showString                              ; 35EA _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 35EF _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 35F3 _ 8B. 45, 20
        movsx   eax, al                                 ; 35F6 _ 0F BE. C0
        mov     dword [esp+14H], ?_379                  ; 35F9 _ C7. 44 24, 14, 00000063(d)
        mov     dword [esp+10H], eax                    ; 3601 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3605 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3608 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 360C _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 360F _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3613 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3616 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 361A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 361D _ 89. 04 24
        call    showString                              ; 3620 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3625 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 3628 _ 8B. 00
        mov     dword [esp], eax                        ; 362A _ 89. 04 24
        call    intToHexStr                             ; 362D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 3632 _ 89. 45, E0
        mov     eax, dword [ebp+20H]                    ; 3635 _ 8B. 45, 20
        movsx   eax, al                                 ; 3638 _ 0F BE. C0
        mov     edx, dword [ebp-20H]                    ; 363B _ 8B. 55, E0
        mov     dword [esp+14H], edx                    ; 363E _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3642 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3646 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3649 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 364D _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 3650 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3654 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3657 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 365B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 365E _ 89. 04 24
        call    showString                              ; 3661 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 3666 _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 366A _ 8B. 45, 20
        movsx   eax, al                                 ; 366D _ 0F BE. C0
        mov     dword [esp+14H], ?_380                  ; 3670 _ C7. 44 24, 14, 0000006F(d)
        mov     dword [esp+10H], eax                    ; 3678 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 367C _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 367F _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3683 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3686 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 368A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 368D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3691 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3694 _ 89. 04 24
        call    showString                              ; 3697 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 369C _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 369F _ 8B. 40, 04
        mov     dword [esp], eax                        ; 36A2 _ 89. 04 24
        call    intToHexStr                             ; 36A5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 36AA _ 89. 45, DC
        mov     eax, dword [ebp+20H]                    ; 36AD _ 8B. 45, 20
        movsx   eax, al                                 ; 36B0 _ 0F BE. C0
        mov     edx, dword [ebp-24H]                    ; 36B3 _ 8B. 55, DC
        mov     dword [esp+14H], edx                    ; 36B6 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 36BA _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 36BE _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 36C1 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 36C5 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 36C8 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 36CC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 36CF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 36D3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 36D6 _ 89. 04 24
        call    showString                              ; 36D9 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 36DE _ 83. 45, F0, 10
        mov     eax, dword [ebp+20H]                    ; 36E2 _ 8B. 45, 20
        movsx   eax, al                                 ; 36E5 _ 0F BE. C0
        mov     dword [esp+14H], ?_381                  ; 36E8 _ C7. 44 24, 14, 0000007B(d)
        mov     dword [esp+10H], eax                    ; 36F0 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 36F4 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 36F7 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 36FB _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 36FE _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3702 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3705 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3709 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 370C _ 89. 04 24
        call    showString                              ; 370F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3714 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 3717 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 371A _ 89. 04 24
        call    intToHexStr                             ; 371D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 3722 _ 89. 45, D8
        mov     eax, dword [ebp+20H]                    ; 3725 _ 8B. 45, 20
        movsx   eax, al                                 ; 3728 _ 0F BE. C0
        mov     edx, dword [ebp-28H]                    ; 372B _ 8B. 55, D8
        mov     dword [esp+14H], edx                    ; 372E _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3732 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 3736 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 3739 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 373D _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 3740 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3744 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3747 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 374B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 374E _ 89. 04 24
        call    showString                              ; 3751 _ E8, FFFFFFFC(rel)
        leave                                           ; 3756 _ C9
        ret                                             ; 3757 _ C3
; showMemoryInfo End of function

message_box:; Function begin
        push    ebp                                     ; 3758 _ 55
        mov     ebp, esp                                ; 3759 _ 89. E5
        sub     esp, 56                                 ; 375B _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 375E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3761 _ 89. 04 24
        call    sheet_alloc                             ; 3764 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3769 _ 89. 45, F4
        mov     eax, dword [memman]                     ; 376C _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 3771 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 3779 _ 89. 04 24
        call    memman_alloc_4k                         ; 377C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3781 _ 89. 45, F0
        mov     dword [esp+10H], -1                     ; 3784 _ C7. 44 24, 10, FFFFFFFF
        mov     dword [esp+0CH], 68                     ; 378C _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 3794 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-10H]                    ; 379C _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 379F _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 37A3 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 37A6 _ 89. 04 24
        call    sheet_setbuf                            ; 37A9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 37AE _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 37B6 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 37B9 _ 89. 44 24, 08
        mov     eax, dword [ebp-0CH]                    ; 37BD _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 37C0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 37C4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 37C7 _ 89. 04 24
        call    make_window8                            ; 37CA _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 37CF _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 37D7 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 37DF _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 37E7 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 37EF _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 37F7 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 37FA _ 89. 04 24
        call    make_textbox8                           ; 37FD _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 3802 _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 380A _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-0CH]                    ; 3812 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 3815 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3819 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 381C _ 89. 04 24
        call    sheet_slide                             ; 381F _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 3824 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-0CH]                    ; 382C _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 382F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3833 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3836 _ 89. 04 24
        call    sheet_updown                            ; 3839 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 383E _ 8B. 45, F4
        leave                                           ; 3841 _ C9
        ret                                             ; 3842 _ C3
; message_box End of function

make_window8:; Function begin
        push    ebp                                     ; 3843 _ 55
        mov     ebp, esp                                ; 3844 _ 89. E5
        push    ebx                                     ; 3846 _ 53
        sub     esp, 52                                 ; 3847 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 384A _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 384D _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 3850 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3853 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 3856 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 3859 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 385C _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 385F _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 3862 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3865 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3868 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 386B _ 8B. 00
        mov     dword [esp+18H], 0                      ; 386D _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 3875 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 3879 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 3881 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 3889 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 3891 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3894 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3898 _ 89. 04 24
        call    boxfill8                                ; 389B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 38A0 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 38A3 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 38A6 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 38A9 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 38AB _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 38B3 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 38B7 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 38BF _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 38C7 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 38CF _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 38D2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 38D6 _ 89. 04 24
        call    boxfill8                                ; 38D9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 38DE _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 38E1 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 38E4 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 38E7 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 38E9 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 38ED _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 38F5 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 38FD _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 3905 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 390D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3910 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3914 _ 89. 04 24
        call    boxfill8                                ; 3917 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 391C _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 391F _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3922 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3925 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 3927 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 392B _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 3933 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 393B _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 3943 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 394B _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 394E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3952 _ 89. 04 24
        call    boxfill8                                ; 3955 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 395A _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 395D _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 3960 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 3963 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 3966 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 3969 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 396C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 396F _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3971 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3975 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 3979 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 3981 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 3985 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 398D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3990 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3994 _ 89. 04 24
        call    boxfill8                                ; 3997 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 399C _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 399F _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 39A2 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 39A5 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 39A8 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 39AB _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 39AE _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 39B1 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 39B3 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 39B7 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 39BB _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 39C3 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 39C7 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 39CF _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 39D2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 39D6 _ 89. 04 24
        call    boxfill8                                ; 39D9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 39DE _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 39E1 _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 39E4 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 39E7 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 39EA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 39ED _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 39EF _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 39F3 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 39F7 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 39FF _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 3A07 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 3A0F _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3A12 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3A16 _ 89. 04 24
        call    boxfill8                                ; 3A19 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3A1E _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 3A21 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 3A24 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3A27 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 3A29 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 3A31 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 3A35 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 3A3D _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 3A45 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-0CH]                    ; 3A4D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3A50 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3A54 _ 89. 04 24
        call    boxfill8                                ; 3A57 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3A5C _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 3A5F _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 3A62 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 3A65 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 3A68 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 3A6B _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 3A6E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3A71 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3A73 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3A77 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 3A7B _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 3A7F _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 3A87 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 3A8F _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3A92 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3A96 _ 89. 04 24
        call    boxfill8                                ; 3A99 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 3A9E _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 3AA1 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3AA4 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3AA7 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 3AAA _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3AAD _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 3AB0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3AB3 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 3AB5 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 3AB9 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 3ABD _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 3AC1 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 3AC9 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 3AD1 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 3AD4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3AD8 _ 89. 04 24
        call    boxfill8                                ; 3ADB _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-1CH]                     ; 3AE0 _ 0F BE. 45, E4
        mov     dword [esp+0CH], eax                    ; 3AE4 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 3AE8 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 3AEB _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3AEF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3AF2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3AF6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3AF9 _ 89. 04 24
        call    make_wtitle8                            ; 3AFC _ E8, FFFFFFFC(rel)
        nop                                             ; 3B01 _ 90
        add     esp, 52                                 ; 3B02 _ 83. C4, 34
        pop     ebx                                     ; 3B05 _ 5B
        pop     ebp                                     ; 3B06 _ 5D
        ret                                             ; 3B07 _ C3
; make_window8 End of function

make_wtitle8:; Function begin
        push    ebp                                     ; 3B08 _ 55
        mov     ebp, esp                                ; 3B09 _ 89. E5
        push    ebx                                     ; 3B0B _ 53
        sub     esp, 52                                 ; 3B0C _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 3B0F _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 3B12 _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 3B15 _ 80. 7D, E4, 00
        jz      ?_202                                   ; 3B19 _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 3B1B _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 3B1F _ C6. 45, ED, 0C
        jmp     ?_203                                   ; 3B23 _ EB, 08

?_202:  mov     byte [ebp-12H], 8                       ; 3B25 _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 3B29 _ C6. 45, ED, 0F
?_203:  mov     eax, dword [ebp+0CH]                    ; 3B2D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3B30 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 3B33 _ 8D. 58, FC
        movzx   eax, byte [ebp-13H]                     ; 3B36 _ 0F B6. 45, ED
        movzx   ecx, al                                 ; 3B3A _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 3B3D _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 3B40 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 3B43 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 3B46 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 3B48 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], ebx                    ; 3B50 _ 89. 5C 24, 14
        mov     dword [esp+10H], 3                      ; 3B54 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 3B5C _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], ecx                     ; 3B64 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 3B68 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3B6C _ 89. 04 24
        call    boxfill8                                ; 3B6F _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-12H]                     ; 3B74 _ 0F BE. 45, EE
        mov     edx, dword [ebp+10H]                    ; 3B78 _ 8B. 55, 10
        mov     dword [esp+14H], edx                    ; 3B7B _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 3B7F _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 3B83 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 3B8B _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 3B93 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3B96 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3B9A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B9D _ 89. 04 24
        call    showString                              ; 3BA0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 3BA5 _ C7. 45, F0, 00000000
        jmp     ?_211                                   ; 3BAC _ E9, 00000083

?_204:  mov     dword [ebp-0CH], 0                      ; 3BB1 _ C7. 45, F4, 00000000
        jmp     ?_210                                   ; 3BB8 _ EB, 70

?_205:  mov     eax, dword [ebp-10H]                    ; 3BBA _ 8B. 45, F0
        shl     eax, 4                                  ; 3BBD _ C1. E0, 04
        mov     edx, eax                                ; 3BC0 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3BC2 _ 8B. 45, F4
        add     eax, edx                                ; 3BC5 _ 01. D0
        add     eax, closebtn.2248                      ; 3BC7 _ 05, 00000280(d)
        movzx   eax, byte [eax]                         ; 3BCC _ 0F B6. 00
        mov     byte [ebp-11H], al                      ; 3BCF _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 3BD2 _ 80. 7D, EF, 40
        jnz     ?_206                                   ; 3BD6 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 3BD8 _ C6. 45, EF, 00
        jmp     ?_209                                   ; 3BDC _ EB, 1C

?_206:  cmp     byte [ebp-11H], 36                      ; 3BDE _ 80. 7D, EF, 24
        jnz     ?_207                                   ; 3BE2 _ 75, 06
        mov     byte [ebp-11H], 15                      ; 3BE4 _ C6. 45, EF, 0F
        jmp     ?_209                                   ; 3BE8 _ EB, 10

?_207:  cmp     byte [ebp-11H], 81                      ; 3BEA _ 80. 7D, EF, 51
        jnz     ?_208                                   ; 3BEE _ 75, 06
        mov     byte [ebp-11H], 8                       ; 3BF0 _ C6. 45, EF, 08
        jmp     ?_209                                   ; 3BF4 _ EB, 04

?_208:  mov     byte [ebp-11H], 7                       ; 3BF6 _ C6. 45, EF, 07
?_209:  mov     eax, dword [ebp+0CH]                    ; 3BFA _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 3BFD _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 3BFF _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 3C02 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 3C05 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3C08 _ 8B. 40, 04
        imul    ecx, eax                                ; 3C0B _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 3C0E _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3C11 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 3C14 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 3C17 _ 8B. 45, F4
        add     eax, ebx                                ; 3C1A _ 01. D8
        add     eax, ecx                                ; 3C1C _ 01. C8
        add     edx, eax                                ; 3C1E _ 01. C2
        movzx   eax, byte [ebp-11H]                     ; 3C20 _ 0F B6. 45, EF
        mov     byte [edx], al                          ; 3C24 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 3C26 _ 83. 45, F4, 01
?_210:  cmp     dword [ebp-0CH], 15                     ; 3C2A _ 83. 7D, F4, 0F
        jle     ?_205                                   ; 3C2E _ 7E, 8A
        add     dword [ebp-10H], 1                      ; 3C30 _ 83. 45, F0, 01
?_211:  cmp     dword [ebp-10H], 13                     ; 3C34 _ 83. 7D, F0, 0D
        jle     ?_204                                   ; 3C38 _ 0F 8E, FFFFFF73
        add     esp, 52                                 ; 3C3E _ 83. C4, 34
        pop     ebx                                     ; 3C41 _ 5B
        pop     ebp                                     ; 3C42 _ 5D
        ret                                             ; 3C43 _ C3
; make_wtitle8 End of function

make_textbox8:; Function begin
        push    ebp                                     ; 3C44 _ 55
        mov     ebp, esp                                ; 3C45 _ 89. E5
        push    edi                                     ; 3C47 _ 57
        push    esi                                     ; 3C48 _ 56
        push    ebx                                     ; 3C49 _ 53
        sub     esp, 44                                 ; 3C4A _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 3C4D _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 3C50 _ 8B. 55, 0C
        add     eax, edx                                ; 3C53 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 3C55 _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 3C58 _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 3C5B _ 8B. 55, 10
        add     eax, edx                                ; 3C5E _ 01. D0
        mov     dword [ebp-14H], eax                    ; 3C60 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 3C63 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 3C66 _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 3C69 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3C6C _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 3C6F _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3C72 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 3C75 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 3C78 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 3C7B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3C7E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3C81 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3C84 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3C86 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3C8A _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3C8E _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3C92 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 3C96 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 3C9E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3CA2 _ 89. 04 24
        call    boxfill8                                ; 3CA5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3CAA _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 3CAD _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 3CB0 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 3CB3 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 3CB6 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3CB9 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 3CBC _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 3CBF _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 3CC2 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3CC5 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3CC8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3CCB _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3CCD _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3CD1 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3CD5 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3CD9 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 3CDD _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 3CE5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3CE9 _ 89. 04 24
        call    boxfill8                                ; 3CEC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3CF1 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 3CF4 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 3CF7 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3CFA _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 3CFD _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 3D00 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 3D03 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 3D06 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 3D09 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3D0C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3D0F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3D12 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3D14 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3D18 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3D1C _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3D20 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 3D24 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 3D2C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3D30 _ 89. 04 24
        call    boxfill8                                ; 3D33 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3D38 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 3D3B _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 3D3E _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 3D41 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 3D44 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 3D47 _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 3D4A _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 3D4D _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 3D50 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3D53 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3D56 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3D59 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3D5B _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3D5F _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3D63 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3D67 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 3D6B _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 3D73 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3D77 _ 89. 04 24
        call    boxfill8                                ; 3D7A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3D7F _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 3D82 _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 3D85 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 3D88 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 3D8B _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 3D8E _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 3D91 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3D94 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3D97 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3D9A _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 3D9C _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 3DA0 _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 3DA3 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3DA7 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3DAB _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 3DAF _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 3DB7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3DBB _ 89. 04 24
        call    boxfill8                                ; 3DBE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3DC3 _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 3DC6 _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 3DC9 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 3DCC _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 3DCF _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 3DD2 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 3DD5 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3DD8 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3DDB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3DDE _ 8B. 00
        mov     ecx, dword [ebp-14H]                    ; 3DE0 _ 8B. 4D, EC
        mov     dword [esp+18H], ecx                    ; 3DE3 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 3DE7 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 3DEB _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3DEF _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 3DF3 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 3DFB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3DFF _ 89. 04 24
        call    boxfill8                                ; 3E02 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3E07 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 3E0A _ 8D. 48, 01
        mov     eax, dword [ebp-14H]                    ; 3E0D _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 3E10 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3E13 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 3E16 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 3E19 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3E1C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3E1F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3E22 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 3E24 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 3E28 _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 3E2B _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3E2F _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3E33 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 3E37 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 3E3F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3E43 _ 89. 04 24
        call    boxfill8                                ; 3E46 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 3E4B _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 3E4E _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 3E51 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 3E54 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 3E57 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 3E5A _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 3E5D _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 3E60 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 3E63 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3E66 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3E69 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3E6C _ 8B. 00
        mov     dword [esp+18H], edi                    ; 3E6E _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 3E72 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3E76 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3E7A _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 3E7E _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 3E86 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3E8A _ 89. 04 24
        call    boxfill8                                ; 3E8D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3E92 _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 3E95 _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 3E98 _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 3E9B _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 3E9E _ 8B. 45, 1C
        movzx   ecx, al                                 ; 3EA1 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 3EA4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3EA7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3EAA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3EAD _ 8B. 00
        mov     ebx, dword [ebp-14H]                    ; 3EAF _ 8B. 5D, EC
        mov     dword [esp+18H], ebx                    ; 3EB2 _ 89. 5C 24, 18
        mov     ebx, dword [ebp-10H]                    ; 3EB6 _ 8B. 5D, F0
        mov     dword [esp+14H], ebx                    ; 3EB9 _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 3EBD _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 3EC1 _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 3EC5 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 3EC9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3ECD _ 89. 04 24
        call    boxfill8                                ; 3ED0 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 3ED5 _ 83. C4, 2C
        pop     ebx                                     ; 3ED8 _ 5B
        pop     esi                                     ; 3ED9 _ 5E
        pop     edi                                     ; 3EDA _ 5F
        pop     ebp                                     ; 3EDB _ 5D
        ret                                             ; 3EDC _ C3
; make_textbox8 End of function

file_loadfile:; Function begin
        push    ebp                                     ; 3EDD _ 55
        mov     ebp, esp                                ; 3EDE _ 89. E5
        sub     esp, 56                                 ; 3EE0 _ 83. EC, 38
        mov     dword [ebp-0CH], 78848                  ; 3EE3 _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 3EEA _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 3EEF _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 3EF7 _ 89. 04 24
        call    memman_alloc                            ; 3EFA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 3EFF _ 89. 45, E4
        mov     eax, dword [ebp-1CH]                    ; 3F02 _ 8B. 45, E4
        add     eax, 12                                 ; 3F05 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 3F08 _ C6. 00, 00
        jmp     ?_222                                   ; 3F0B _ E9, 0000011E

?_212:  mov     dword [ebp-10H], 0                      ; 3F10 _ C7. 45, F0, 00000000
        jmp     ?_215                                   ; 3F17 _ EB, 2C

?_213:  mov     edx, dword [ebp-0CH]                    ; 3F19 _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 3F1C _ 8B. 45, F0
        add     eax, edx                                ; 3F1F _ 01. D0
        movzx   eax, byte [eax]                         ; 3F21 _ 0F B6. 00
        test    al, al                                  ; 3F24 _ 84. C0
        jz      ?_214                                   ; 3F26 _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 3F28 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 3F2B _ 8B. 45, E4
        add     edx, eax                                ; 3F2E _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 3F30 _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 3F33 _ 8B. 45, F0
        add     eax, ecx                                ; 3F36 _ 01. C8
        movzx   eax, byte [eax]                         ; 3F38 _ 0F B6. 00
        mov     byte [edx], al                          ; 3F3B _ 88. 02
        add     dword [ebp-10H], 1                      ; 3F3D _ 83. 45, F0, 01
        jmp     ?_215                                   ; 3F41 _ EB, 02

?_214:  jmp     ?_216                                   ; 3F43 _ EB, 06

?_215:  cmp     dword [ebp-10H], 7                      ; 3F45 _ 83. 7D, F0, 07
        jle     ?_213                                   ; 3F49 _ 7E, CE
?_216:  mov     dword [ebp-14H], 0                      ; 3F4B _ C7. 45, EC, 00000000
        mov     edx, dword [ebp-10H]                    ; 3F52 _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 3F55 _ 8B. 45, E4
        add     eax, edx                                ; 3F58 _ 01. D0
        mov     byte [eax], 46                          ; 3F5A _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 3F5D _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 3F61 _ C7. 45, EC, 00000000
        jmp     ?_218                                   ; 3F68 _ EB, 1E

?_217:  mov     edx, dword [ebp-10H]                    ; 3F6A _ 8B. 55, F0
        mov     eax, dword [ebp-1CH]                    ; 3F6D _ 8B. 45, E4
        add     edx, eax                                ; 3F70 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 3F72 _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 3F75 _ 8B. 45, EC
        add     eax, ecx                                ; 3F78 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 3F7A _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 3F7E _ 88. 02
        add     dword [ebp-10H], 1                      ; 3F80 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 3F84 _ 83. 45, EC, 01
?_218:  cmp     dword [ebp-14H], 2                      ; 3F88 _ 83. 7D, EC, 02
        jle     ?_217                                   ; 3F8C _ 7E, DC
        mov     eax, dword [ebp-1CH]                    ; 3F8E _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 3F91 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3F95 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3F98 _ 89. 04 24
        call    strcmp                                  ; 3F9B _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 3FA0 _ 83. F8, 01
        jne     ?_221                                   ; 3FA3 _ 0F 85, 00000081
        mov     eax, dword [ebp-0CH]                    ; 3FA9 _ 8B. 45, F4
        mov     edx, dword [eax+1CH]                    ; 3FAC _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 3FAF _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 3FB4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3FB8 _ 89. 04 24
        call    memman_alloc_4k                         ; 3FBB _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 3FC0 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 3FC2 _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 3FC5 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 3FC7 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 3FCA _ 8B. 40, 1C
        mov     edx, eax                                ; 3FCD _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 3FCF _ 8B. 45, 0C
        mov     dword [eax+8H], edx                     ; 3FD2 _ 89. 50, 08
        mov     dword [ebp-20H], 88064                  ; 3FD5 _ C7. 45, E0, 00015800
        mov     eax, dword [ebp-0CH]                    ; 3FDC _ 8B. 45, F4
        movzx   eax, word [eax+1AH]                     ; 3FDF _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 3FE3 _ 0F B7. C0
        shl     eax, 9                                  ; 3FE6 _ C1. E0, 09
        add     dword [ebp-20H], eax                    ; 3FE9 _ 01. 45, E0
        mov     eax, dword [ebp-0CH]                    ; 3FEC _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 3FEF _ 8B. 40, 1C
        mov     dword [ebp-24H], eax                    ; 3FF2 _ 89. 45, DC
        mov     dword [ebp-18H], 0                      ; 3FF5 _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 3FFC _ C7. 45, E8, 00000000
        jmp     ?_220                                   ; 4003 _ EB, 1B

?_219:  mov     eax, dword [ebp+0CH]                    ; 4005 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 4008 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 400A _ 8B. 45, E8
        add     edx, eax                                ; 400D _ 01. C2
        mov     ecx, dword [ebp-18H]                    ; 400F _ 8B. 4D, E8
        mov     eax, dword [ebp-20H]                    ; 4012 _ 8B. 45, E0
        add     eax, ecx                                ; 4015 _ 01. C8
        movzx   eax, byte [eax]                         ; 4017 _ 0F B6. 00
        mov     byte [edx], al                          ; 401A _ 88. 02
        add     dword [ebp-18H], 1                      ; 401C _ 83. 45, E8, 01
?_220:  mov     eax, dword [ebp-18H]                    ; 4020 _ 8B. 45, E8
        cmp     eax, dword [ebp-24H]                    ; 4023 _ 3B. 45, DC
        jl      ?_219                                   ; 4026 _ 7C, DD
        jmp     ?_223                                   ; 4028 _ EB, 12

?_221:  add     dword [ebp-0CH], 32                     ; 402A _ 83. 45, F4, 20
?_222:  mov     eax, dword [ebp-0CH]                    ; 402E _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 4031 _ 0F B6. 00
        test    al, al                                  ; 4034 _ 84. C0
        jne     ?_212                                   ; 4036 _ 0F 85, FFFFFED4
?_223:  mov     edx, dword [ebp-1CH]                    ; 403C _ 8B. 55, E4
        mov     eax, dword [memman]                     ; 403F _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 4044 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 404C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4050 _ 89. 04 24
        call    memman_free                             ; 4053 _ E8, FFFFFFFC(rel)
        leave                                           ; 4058 _ C9
        ret                                             ; 4059 _ C3
; file_loadfile End of function

intHandlerForStackOverFlow:; Function begin
        push    ebp                                     ; 405A _ 55
        mov     ebp, esp                                ; 405B _ 89. E5
        sub     esp, 40                                 ; 405D _ 83. EC, 28
        call    task_now                                ; 4060 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4065 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4068 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 406B _ C7. 80, 00000098, 00000008
        mov     dword [esp], ?_382                      ; 4075 _ C7. 04 24, 00000087(d)
        call    cons_putstr                             ; 407C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4081 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4084 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 408E _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 4091 _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4097 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 409A _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 409D _ 89. 90, 0000009C
        mov     dword [esp], ?_383                      ; 40A3 _ C7. 04 24, 0000008E(d)
        call    cons_putstr                             ; 40AA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 40AF _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 40B2 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 40BC _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 40BF _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 40C5 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 40C8 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 40CB _ 89. 90, 0000009C
        mov     eax, dword [ebp+8H]                     ; 40D1 _ 8B. 45, 08
        add     eax, 44                                 ; 40D4 _ 83. C0, 2C
        mov     eax, dword [eax]                        ; 40D7 _ 8B. 00
        mov     dword [esp], eax                        ; 40D9 _ 89. 04 24
        call    intToHexStr                             ; 40DC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 40E1 _ 89. 45, F0
        mov     dword [esp], ?_384                      ; 40E4 _ C7. 04 24, 0000009E(d)
        call    cons_putstr                             ; 40EB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 40F0 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 40F3 _ 89. 04 24
        call    cons_putstr                             ; 40F6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 40FB _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 40FE _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 4108 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 410B _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4111 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4114 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 4117 _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 411D _ 8B. 45, F4
        add     eax, 48                                 ; 4120 _ 83. C0, 30
        leave                                           ; 4123 _ C9
        ret                                             ; 4124 _ C3
; intHandlerForStackOverFlow End of function

intHandlerForException:; Function begin
        push    ebp                                     ; 4125 _ 55
        mov     ebp, esp                                ; 4126 _ 89. E5
        sub     esp, 40                                 ; 4128 _ 83. EC, 28
        call    task_now                                ; 412B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4130 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4133 _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4136 _ C7. 80, 00000098, 00000008
        mov     dword [esp], ?_385                      ; 4140 _ C7. 04 24, 000000A5(d)
        call    cons_putstr                             ; 4147 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 414C _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 414F _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 4159 _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 415C _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4162 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4165 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 4168 _ 89. 90, 0000009C
        mov     dword [esp], ?_386                      ; 416E _ C7. 04 24, 000000AD(d)
        call    cons_putstr                             ; 4175 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 417A _ 8B. 45, F4
        mov     eax, dword [eax+9CH]                    ; 417D _ 8B. 80, 0000009C
        lea     edx, [eax+10H]                          ; 4183 _ 8D. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 4186 _ 8B. 45, F4
        mov     dword [eax+9CH], edx                    ; 4189 _ 89. 90, 0000009C
        mov     eax, dword [ebp-0CH]                    ; 418F _ 8B. 45, F4
        mov     dword [eax+98H], 8                      ; 4192 _ C7. 80, 00000098, 00000008
        mov     eax, dword [ebp-0CH]                    ; 419C _ 8B. 45, F4
        add     eax, 48                                 ; 419F _ 83. C0, 30
        leave                                           ; 41A2 _ C9
        ret                                             ; 41A3 _ C3
; intHandlerForException End of function

memman_init:; Function begin
        push    ebp                                     ; 41A4 _ 55
        mov     ebp, esp                                ; 41A5 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 41A7 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 41AA _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 41B0 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 41B3 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 41BA _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 41BD _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 41C4 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 41C7 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 41CE _ 5D
        ret                                             ; 41CF _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 41D0 _ 55
        mov     ebp, esp                                ; 41D1 _ 89. E5
        sub     esp, 16                                 ; 41D3 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 41D6 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 41DD _ C7. 45, F8, 00000000
        jmp     ?_225                                   ; 41E4 _ EB, 14

?_224:  mov     eax, dword [ebp+8H]                     ; 41E6 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 41E9 _ 8B. 55, F8
        add     edx, 2                                  ; 41EC _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 41EF _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 41F3 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 41F6 _ 83. 45, F8, 01
?_225:  mov     eax, dword [ebp+8H]                     ; 41FA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 41FD _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 41FF _ 3B. 45, F8
        ja      ?_224                                   ; 4202 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 4204 _ 8B. 45, FC
        leave                                           ; 4207 _ C9
        ret                                             ; 4208 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 4209 _ 55
        mov     ebp, esp                                ; 420A _ 89. E5
        push    ebx                                     ; 420C _ 53
        sub     esp, 16                                 ; 420D _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 4210 _ C7. 45, F4, 00000000
        jmp     ?_231                                   ; 4217 _ E9, 000000BD

?_226:  mov     eax, dword [ebp+8H]                     ; 421C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 421F _ 8B. 55, F4
        add     edx, 2                                  ; 4222 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4225 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 4229 _ 3B. 45, 0C
        jc      ?_230                                   ; 422C _ 0F 82, 000000A3
        mov     eax, dword [ebp+8H]                     ; 4232 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4235 _ 8B. 55, F4
        add     edx, 2                                  ; 4238 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 423B _ 8B. 04 D0
        mov     dword [ebp-8H], eax                     ; 423E _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 4241 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4244 _ 8B. 55, F4
        add     edx, 2                                  ; 4247 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 424A _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 424D _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 4250 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4253 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4256 _ 8B. 55, F4
        add     edx, 2                                  ; 4259 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 425C _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 425F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4262 _ 8B. 55, F4
        add     edx, 2                                  ; 4265 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4268 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 426C _ 2B. 45, 0C
        mov     edx, eax                                ; 426F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4271 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 4274 _ 8B. 4D, F4
        add     ecx, 2                                  ; 4277 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 427A _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 427E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4281 _ 8B. 55, F4
        add     edx, 2                                  ; 4284 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 4287 _ 8B. 44 D0, 04
        test    eax, eax                                ; 428B _ 85. C0
        jnz     ?_229                                   ; 428D _ 75, 41
        mov     eax, dword [ebp+8H]                     ; 428F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4292 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4294 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4297 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 429A _ 89. 10
        jmp     ?_228                                   ; 429C _ EB, 28

?_227:  mov     eax, dword [ebp-0CH]                    ; 429E _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 42A1 _ 8D. 50, 01
        mov     ecx, dword [ebp+8H]                     ; 42A4 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 42A7 _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 42AA _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 42AD _ 8B. 45, 08
        add     edx, 2                                  ; 42B0 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 42B3 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 42B6 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 42B8 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 42BB _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 42BE _ 89. 54 D9, 04
        add     dword [ebp-0CH], 1                      ; 42C2 _ 83. 45, F4, 01
?_228:  mov     eax, dword [ebp+8H]                     ; 42C6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 42C9 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 42CB _ 3B. 45, F4
        ja      ?_227                                   ; 42CE _ 77, CE
?_229:  mov     eax, dword [ebp-8H]                     ; 42D0 _ 8B. 45, F8
        jmp     ?_232                                   ; 42D3 _ EB, 17

?_230:  add     dword [ebp-0CH], 1                      ; 42D5 _ 83. 45, F4, 01
?_231:  mov     eax, dword [ebp+8H]                     ; 42D9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 42DC _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 42DE _ 3B. 45, F4
        ja      ?_226                                   ; 42E1 _ 0F 87, FFFFFF35
        mov     eax, 0                                  ; 42E7 _ B8, 00000000
?_232:  add     esp, 16                                 ; 42EC _ 83. C4, 10
        pop     ebx                                     ; 42EF _ 5B
        pop     ebp                                     ; 42F0 _ 5D
        ret                                             ; 42F1 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 42F2 _ 55
        mov     ebp, esp                                ; 42F3 _ 89. E5
        push    ebx                                     ; 42F5 _ 53
        sub     esp, 16                                 ; 42F6 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 42F9 _ C7. 45, F4, 00000000
        jmp     ?_235                                   ; 4300 _ EB, 17

?_233:  mov     eax, dword [ebp+8H]                     ; 4302 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4305 _ 8B. 55, F4
        add     edx, 2                                  ; 4308 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 430B _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 430E _ 3B. 45, 0C
        jbe     ?_234                                   ; 4311 _ 76, 02
        jmp     ?_236                                   ; 4313 _ EB, 0E

?_234:  add     dword [ebp-0CH], 1                      ; 4315 _ 83. 45, F4, 01
?_235:  mov     eax, dword [ebp+8H]                     ; 4319 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 431C _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 431E _ 3B. 45, F4
        jg      ?_233                                   ; 4321 _ 7F, DF
?_236:  cmp     dword [ebp-0CH], 0                      ; 4323 _ 83. 7D, F4, 00
        jle     ?_240                                   ; 4327 _ 0F 8E, 000000F2
        mov     eax, dword [ebp-0CH]                    ; 432D _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 4330 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4333 _ 8B. 45, 08
        add     edx, 2                                  ; 4336 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 4339 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 433C _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 433F _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 4342 _ 8B. 45, 08
        add     ecx, 2                                  ; 4345 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 4348 _ 8B. 44 C8, 04
        add     eax, edx                                ; 434C _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 434E _ 3B. 45, 0C
        jne     ?_240                                   ; 4351 _ 0F 85, 000000C8
        mov     eax, dword [ebp-0CH]                    ; 4357 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 435A _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 435D _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 4360 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 4363 _ 8B. 45, 08
        add     edx, 2                                  ; 4366 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 4369 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 436D _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 4370 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4373 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 4376 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 4379 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 437D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4380 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4382 _ 3B. 45, F4
        jle     ?_239                                   ; 4385 _ 0F 8E, 0000008A
        mov     eax, dword [ebp+10H]                    ; 438B _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 438E _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 4391 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4394 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4397 _ 8B. 55, F4
        add     edx, 2                                  ; 439A _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 439D _ 8B. 04 D0
        cmp     ecx, eax                                ; 43A0 _ 39. C1
        jnz     ?_239                                   ; 43A2 _ 75, 71
        mov     eax, dword [ebp-0CH]                    ; 43A4 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 43A7 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 43AA _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 43AD _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 43B0 _ 8B. 45, 08
        add     edx, 2                                  ; 43B3 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 43B6 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 43BA _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 43BD _ 8B. 4D, F4
        add     ecx, 2                                  ; 43C0 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 43C3 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 43C7 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 43CA _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 43CD _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 43D0 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 43D4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 43D7 _ 8B. 00
        lea     edx, [eax-1H]                           ; 43D9 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 43DC _ 8B. 45, 08
        mov     dword [eax], edx                        ; 43DF _ 89. 10
        jmp     ?_238                                   ; 43E1 _ EB, 28

?_237:  mov     eax, dword [ebp-0CH]                    ; 43E3 _ 8B. 45, F4
        lea     edx, [eax+1H]                           ; 43E6 _ 8D. 50, 01
        mov     ecx, dword [ebp+8H]                     ; 43E9 _ 8B. 4D, 08
        mov     eax, dword [ebp-0CH]                    ; 43EC _ 8B. 45, F4
        lea     ebx, [eax+2H]                           ; 43EF _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 43F2 _ 8B. 45, 08
        add     edx, 2                                  ; 43F5 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 43F8 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 43FB _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 43FD _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 4400 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 4403 _ 89. 54 D9, 04
        add     dword [ebp-0CH], 1                      ; 4407 _ 83. 45, F4, 01
?_238:  mov     eax, dword [ebp+8H]                     ; 440B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 440E _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4410 _ 3B. 45, F4
        jg      ?_237                                   ; 4413 _ 7F, CE
?_239:  mov     eax, 0                                  ; 4415 _ B8, 00000000
        jmp     ?_246                                   ; 441A _ E9, 0000011C

?_240:  mov     eax, dword [ebp+8H]                     ; 441F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4422 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 4424 _ 3B. 45, F4
        jle     ?_241                                   ; 4427 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 4429 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 442C _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 442F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4432 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4435 _ 8B. 55, F4
        add     edx, 2                                  ; 4438 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 443B _ 8B. 04 D0
        cmp     ecx, eax                                ; 443E _ 39. C1
        jnz     ?_241                                   ; 4440 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 4442 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4445 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 4448 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 444B _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 444E _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 4451 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4454 _ 8B. 55, F4
        add     edx, 2                                  ; 4457 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 445A _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 445E _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 4461 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 4464 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 4467 _ 8B. 55, F4
        add     edx, 2                                  ; 446A _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 446D _ 89. 4C D0, 04
        mov     eax, 0                                  ; 4471 _ B8, 00000000
        jmp     ?_246                                   ; 4476 _ E9, 000000C0

?_241:  mov     eax, dword [ebp+8H]                     ; 447B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 447E _ 8B. 00
        cmp     eax, 4095                               ; 4480 _ 3D, 00000FFF
        jg      ?_245                                   ; 4485 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 448B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 448E _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 4490 _ 89. 45, F8
        jmp     ?_243                                   ; 4493 _ EB, 28

?_242:  mov     eax, dword [ebp-8H]                     ; 4495 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 4498 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 449B _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 449E _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 44A1 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 44A4 _ 8B. 45, 08
        add     edx, 2                                  ; 44A7 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 44AA _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 44AD _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 44AF _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 44B2 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 44B5 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 44B9 _ 83. 6D, F8, 01
?_243:  mov     eax, dword [ebp-8H]                     ; 44BD _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 44C0 _ 3B. 45, F4
        jg      ?_242                                   ; 44C3 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 44C5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 44C8 _ 8B. 00
        lea     edx, [eax+1H]                           ; 44CA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 44CD _ 8B. 45, 08
        mov     dword [eax], edx                        ; 44D0 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 44D2 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 44D5 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 44D8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 44DB _ 8B. 00
        cmp     edx, eax                                ; 44DD _ 39. C2
        jge     ?_244                                   ; 44DF _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 44E1 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 44E4 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 44E6 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 44E9 _ 89. 50, 04
?_244:  mov     eax, dword [ebp+8H]                     ; 44EC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 44EF _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 44F2 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 44F5 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 44F8 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 44FB _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 44FE _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 4501 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 4504 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 4507 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 450B _ B8, 00000000
        jmp     ?_246                                   ; 4510 _ EB, 29

?_245:  mov     eax, dword [ebp+8H]                     ; 4512 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4515 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 4518 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 451B _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 451E _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4521 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4524 _ 8B. 40, 08
        mov     edx, eax                                ; 4527 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 4529 _ 8B. 45, 10
        add     eax, edx                                ; 452C _ 01. D0
        mov     edx, eax                                ; 452E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4530 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 4533 _ 89. 50, 08
        mov     eax, 4294967295                         ; 4536 _ B8, FFFFFFFF
?_246:  add     esp, 16                                 ; 453B _ 83. C4, 10
        pop     ebx                                     ; 453E _ 5B
        pop     ebp                                     ; 453F _ 5D
        ret                                             ; 4540 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 4541 _ 55
        mov     ebp, esp                                ; 4542 _ 89. E5
        sub     esp, 24                                 ; 4544 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 4547 _ 8B. 45, 0C
        add     eax, 4095                               ; 454A _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 454F _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 4554 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 4557 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 455A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 455E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4561 _ 89. 04 24
        call    memman_alloc                            ; 4564 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 4569 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 456C _ 8B. 45, FC
        leave                                           ; 456F _ C9
        ret                                             ; 4570 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 4571 _ 55
        mov     ebp, esp                                ; 4572 _ 89. E5
        sub     esp, 28                                 ; 4574 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 4577 _ 8B. 45, 10
        add     eax, 4095                               ; 457A _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 457F _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 4584 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 4587 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 458A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 458E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 4591 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4595 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4598 _ 89. 04 24
        call    memman_free                             ; 459B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 45A0 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 45A3 _ 8B. 45, FC
        leave                                           ; 45A6 _ C9
        ret                                             ; 45A7 _ C3
; memman_free_4k End of function

shtctl_init:; Function begin
        push    ebp                                     ; 45A8 _ 55
        mov     ebp, esp                                ; 45A9 _ 89. E5
        sub     esp, 40                                 ; 45AB _ 83. EC, 28
        mov     dword [esp+4H], 9232                    ; 45AE _ C7. 44 24, 04, 00002410
        mov     eax, dword [ebp+8H]                     ; 45B6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 45B9 _ 89. 04 24
        call    memman_alloc_4k                         ; 45BC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 45C1 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 45C4 _ 83. 7D, F4, 00
        jnz     ?_247                                   ; 45C8 _ 75, 0A
        mov     eax, 0                                  ; 45CA _ B8, 00000000
        jmp     ?_251                                   ; 45CF _ E9, 000000C0

?_247:  mov     eax, dword [ebp+10H]                    ; 45D4 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 45D7 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 45DB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 45DF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 45E2 _ 89. 04 24
        call    memman_alloc_4k                         ; 45E5 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 45EA _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 45EC _ 8B. 45, F4
        mov     dword [eax+4H], edx                     ; 45EF _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 45F2 _ 8B. 45, F4
        mov     eax, dword [eax+4H]                     ; 45F5 _ 8B. 40, 04
        test    eax, eax                                ; 45F8 _ 85. C0
        jnz     ?_248                                   ; 45FA _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 45FC _ 8B. 45, F4
        mov     dword [esp+8H], 9232                    ; 45FF _ C7. 44 24, 08, 00002410
        mov     dword [esp+4H], eax                     ; 4607 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 460B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 460E _ 89. 04 24
        call    memman_free_4k                          ; 4611 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 4616 _ B8, 00000000
        jmp     ?_251                                   ; 461B _ EB, 77

?_248:  mov     eax, dword [ebp-0CH]                    ; 461D _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 4620 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4623 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 4625 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 4628 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 462B _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 462E _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 4631 _ 8B. 55, 14
        mov     dword [eax+0CH], edx                    ; 4634 _ 89. 50, 0C
        mov     eax, dword [ebp-0CH]                    ; 4637 _ 8B. 45, F4
        mov     dword [eax+10H], -1                     ; 463A _ C7. 40, 10, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 4641 _ C7. 45, F0, 00000000
        jmp     ?_250                                   ; 4648 _ EB, 3E

?_249:  mov     ecx, dword [ebp-0CH]                    ; 464A _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 464D _ 8B. 55, F0
        mov     eax, edx                                ; 4650 _ 89. D0
        shl     eax, 3                                  ; 4652 _ C1. E0, 03
        add     eax, edx                                ; 4655 _ 01. D0
        shl     eax, 2                                  ; 4657 _ C1. E0, 02
        add     eax, ecx                                ; 465A _ 01. C8
        add     eax, 1072                               ; 465C _ 05, 00000430
        mov     dword [eax], 0                          ; 4661 _ C7. 00, 00000000
        mov     ecx, dword [ebp-0CH]                    ; 4667 _ 8B. 4D, F4
        mov     edx, dword [ebp-10H]                    ; 466A _ 8B. 55, F0
        mov     eax, edx                                ; 466D _ 89. D0
        shl     eax, 3                                  ; 466F _ C1. E0, 03
        add     eax, edx                                ; 4672 _ 01. D0
        shl     eax, 2                                  ; 4674 _ C1. E0, 02
        add     eax, ecx                                ; 4677 _ 01. C8
        add     eax, 1076                               ; 4679 _ 05, 00000434
        mov     dword [eax], 0                          ; 467E _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 4684 _ 83. 45, F0, 01
?_250:  cmp     dword [ebp-10H], 255                    ; 4688 _ 81. 7D, F0, 000000FF
        jle     ?_249                                   ; 468F _ 7E, B9
        mov     eax, dword [ebp-0CH]                    ; 4691 _ 8B. 45, F4
?_251:  leave                                           ; 4694 _ C9
        ret                                             ; 4695 _ C3
; shtctl_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 4696 _ 55
        mov     ebp, esp                                ; 4697 _ 89. E5
        sub     esp, 24                                 ; 4699 _ 83. EC, 18
        mov     dword [ebp-10H], 0                      ; 469C _ C7. 45, F0, 00000000
        jmp     ?_254                                   ; 46A3 _ EB, 63

?_252:  mov     ecx, dword [ebp+8H]                     ; 46A5 _ 8B. 4D, 08
        mov     edx, dword [ebp-10H]                    ; 46A8 _ 8B. 55, F0
        mov     eax, edx                                ; 46AB _ 89. D0
        shl     eax, 3                                  ; 46AD _ C1. E0, 03
        add     eax, edx                                ; 46B0 _ 01. D0
        shl     eax, 2                                  ; 46B2 _ C1. E0, 02
        add     eax, ecx                                ; 46B5 _ 01. C8
        add     eax, 1072                               ; 46B7 _ 05, 00000430
        mov     eax, dword [eax]                        ; 46BC _ 8B. 00
        test    eax, eax                                ; 46BE _ 85. C0
        jnz     ?_253                                   ; 46C0 _ 75, 42
        mov     edx, dword [ebp-10H]                    ; 46C2 _ 8B. 55, F0
        mov     eax, edx                                ; 46C5 _ 89. D0
        shl     eax, 3                                  ; 46C7 _ C1. E0, 03
        add     eax, edx                                ; 46CA _ 01. D0
        shl     eax, 2                                  ; 46CC _ C1. E0, 02
        lea     edx, [eax+410H]                         ; 46CF _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 46D5 _ 8B. 45, 08
        add     eax, edx                                ; 46D8 _ 01. D0
        add     eax, 4                                  ; 46DA _ 83. C0, 04
        mov     dword [ebp-0CH], eax                    ; 46DD _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 46E0 _ 8B. 45, F4
        mov     dword [eax+1CH], 1                      ; 46E3 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-0CH]                    ; 46EA _ 8B. 45, F4
        mov     dword [eax+18H], -1                     ; 46ED _ C7. 40, 18, FFFFFFFF
        call    task_now                                ; 46F4 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-0CH]                    ; 46F9 _ 8B. 55, F4
        mov     dword [edx+20H], eax                    ; 46FC _ 89. 42, 20
        mov     eax, dword [ebp-0CH]                    ; 46FF _ 8B. 45, F4
        jmp     ?_255                                   ; 4702 _ EB, 12

?_253:  add     dword [ebp-10H], 1                      ; 4704 _ 83. 45, F0, 01
?_254:  cmp     dword [ebp-10H], 255                    ; 4708 _ 81. 7D, F0, 000000FF
        jle     ?_252                                   ; 470F _ 7E, 94
        mov     eax, 0                                  ; 4711 _ B8, 00000000
?_255:  leave                                           ; 4716 _ C9
        ret                                             ; 4717 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 4718 _ 55
        mov     ebp, esp                                ; 4719 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 471B _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 471E _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4721 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4723 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4726 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 4729 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 472C _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 472F _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 4732 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4735 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 4738 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 473B _ 89. 50, 14
        nop                                             ; 473E _ 90
        pop     ebp                                     ; 473F _ 5D
        ret                                             ; 4740 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 4741 _ 55
        mov     ebp, esp                                ; 4742 _ 89. E5
        push    edi                                     ; 4744 _ 57
        push    esi                                     ; 4745 _ 56
        push    ebx                                     ; 4746 _ 53
        sub     esp, 60                                 ; 4747 _ 83. EC, 3C
        mov     eax, dword [ebp+0CH]                    ; 474A _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 474D _ 8B. 40, 18
        mov     dword [ebp-1CH], eax                    ; 4750 _ 89. 45, E4
        mov     eax, dword [ebp+8H]                     ; 4753 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4756 _ 8B. 40, 10
        add     eax, 1                                  ; 4759 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 475C _ 3B. 45, 10
        jge     ?_256                                   ; 475F _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 4761 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4764 _ 8B. 40, 10
        add     eax, 1                                  ; 4767 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 476A _ 89. 45, 10
?_256:  cmp     dword [ebp+10H], -1                     ; 476D _ 83. 7D, 10, FF
        jge     ?_257                                   ; 4771 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 4773 _ C7. 45, 10, FFFFFFFF
?_257:  mov     eax, dword [ebp+0CH]                    ; 477A _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 477D _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 4780 _ 89. 50, 18
        mov     eax, dword [ebp-1CH]                    ; 4783 _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 4786 _ 3B. 45, 10
        jle     ?_264                                   ; 4789 _ 0F 8E, 00000212
        cmp     dword [ebp+10H], 0                      ; 478F _ 83. 7D, 10, 00
        js      ?_260                                   ; 4793 _ 0F 88, 000000FE
        mov     eax, dword [ebp-1CH]                    ; 4799 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 479C _ 89. 45, E0
        jmp     ?_259                                   ; 479F _ EB, 34

?_258:  mov     eax, dword [ebp-20H]                    ; 47A1 _ 8B. 45, E0
        lea     edx, [eax-1H]                           ; 47A4 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 47A7 _ 8B. 45, 08
        add     edx, 4                                  ; 47AA _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 47AD _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 47B1 _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 47B4 _ 8B. 4D, E0
        add     ecx, 4                                  ; 47B7 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 47BA _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 47BE _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 47C1 _ 8B. 55, E0
        add     edx, 4                                  ; 47C4 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 47C7 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 47CB _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 47CE _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 47D1 _ 83. 6D, E0, 01
?_259:  mov     eax, dword [ebp-20H]                    ; 47D5 _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 47D8 _ 3B. 45, 10
        jg      ?_258                                   ; 47DB _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 47DD _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 47E0 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 47E3 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 47E6 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 47E9 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 47ED _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 47F0 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 47F3 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 47F6 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 47F9 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 47FC _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 47FF _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4802 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4805 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4808 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 480B _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 480E _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4811 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4814 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4817 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 481A _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 481D _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 4821 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4825 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 4829 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 482D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4831 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4834 _ 89. 04 24
        call    sheet_refreshmap                        ; 4837 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 483C _ 8B. 45, 10
        lea     edi, [eax+1H]                           ; 483F _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 4842 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4845 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4848 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 484B _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 484E _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4851 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4854 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4857 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 485A _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 485D _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4860 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4863 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4866 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4869 _ 8B. 40, 0C
        mov     ecx, dword [ebp-1CH]                    ; 486C _ 8B. 4D, E4
        mov     dword [esp+18H], ecx                    ; 486F _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 4873 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 4877 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 487B _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 487F _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4883 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4887 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 488A _ 89. 04 24
        call    sheet_refreshsub                        ; 488D _ E8, FFFFFFFC(rel)
        jmp     ?_271                                   ; 4892 _ E9, 0000027D

?_260:  mov     eax, dword [ebp+8H]                     ; 4897 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 489A _ 8B. 40, 10
        cmp     eax, dword [ebp-1CH]                    ; 489D _ 3B. 45, E4
        jle     ?_263                                   ; 48A0 _ 7E, 47
        mov     eax, dword [ebp-1CH]                    ; 48A2 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 48A5 _ 89. 45, E0
        jmp     ?_262                                   ; 48A8 _ EB, 34

?_261:  mov     eax, dword [ebp-20H]                    ; 48AA _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 48AD _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 48B0 _ 8B. 45, 08
        add     edx, 4                                  ; 48B3 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 48B6 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 48BA _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 48BD _ 8B. 4D, E0
        add     ecx, 4                                  ; 48C0 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 48C3 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 48C7 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 48CA _ 8B. 55, E0
        add     edx, 4                                  ; 48CD _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 48D0 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 48D4 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 48D7 _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 48DA _ 83. 45, E0, 01
?_262:  mov     eax, dword [ebp+8H]                     ; 48DE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 48E1 _ 8B. 40, 10
        cmp     eax, dword [ebp-20H]                    ; 48E4 _ 3B. 45, E0
        jg      ?_261                                   ; 48E7 _ 7F, C1
?_263:  mov     eax, dword [ebp+8H]                     ; 48E9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 48EC _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 48EF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 48F2 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 48F5 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 48F8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 48FB _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 48FE _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4901 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4904 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4907 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 490A _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 490D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4910 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4913 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4916 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4919 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 491C _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 491F _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 4922 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 492A _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 492E _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 4932 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4936 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 493A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 493D _ 89. 04 24
        call    sheet_refreshmap                        ; 4940 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 4945 _ 8B. 45, E4
        lea     esi, [eax-1H]                           ; 4948 _ 8D. 70, FF
        mov     eax, dword [ebp+0CH]                    ; 494B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 494E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4951 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4954 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 4957 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 495A _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 495D _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4960 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4963 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 4966 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 4969 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 496C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 496F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4972 _ 8B. 40, 0C
        mov     dword [esp+18H], esi                    ; 4975 _ 89. 74 24, 18
        mov     dword [esp+14H], 0                      ; 4979 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 4981 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4985 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 4989 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 498D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4991 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4994 _ 89. 04 24
        call    sheet_refreshsub                        ; 4997 _ E8, FFFFFFFC(rel)
        jmp     ?_271                                   ; 499C _ E9, 00000173

?_264:  mov     eax, dword [ebp-1CH]                    ; 49A1 _ 8B. 45, E4
        cmp     eax, dword [ebp+10H]                    ; 49A4 _ 3B. 45, 10
        jge     ?_271                                   ; 49A7 _ 0F 8D, 00000167
        cmp     dword [ebp-1CH], 0                      ; 49AD _ 83. 7D, E4, 00
        js      ?_267                                   ; 49B1 _ 78, 56
        mov     eax, dword [ebp-1CH]                    ; 49B3 _ 8B. 45, E4
        mov     dword [ebp-20H], eax                    ; 49B6 _ 89. 45, E0
        jmp     ?_266                                   ; 49B9 _ EB, 34

?_265:  mov     eax, dword [ebp-20H]                    ; 49BB _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 49BE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 49C1 _ 8B. 45, 08
        add     edx, 4                                  ; 49C4 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 49C7 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 49CB _ 8B. 45, 08
        mov     ecx, dword [ebp-20H]                    ; 49CE _ 8B. 4D, E0
        add     ecx, 4                                  ; 49D1 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 49D4 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 49D8 _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 49DB _ 8B. 55, E0
        add     edx, 4                                  ; 49DE _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 49E1 _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 49E5 _ 8B. 55, E0
        mov     dword [eax+18H], edx                    ; 49E8 _ 89. 50, 18
        add     dword [ebp-20H], 1                      ; 49EB _ 83. 45, E0, 01
?_266:  mov     eax, dword [ebp-20H]                    ; 49EF _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 49F2 _ 3B. 45, 10
        jl      ?_265                                   ; 49F5 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 49F7 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 49FA _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 49FD _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 4A00 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4A03 _ 89. 54 88, 04
        jmp     ?_270                                   ; 4A07 _ EB, 6C

?_267:  mov     eax, dword [ebp+8H]                     ; 4A09 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4A0C _ 8B. 40, 10
        mov     dword [ebp-20H], eax                    ; 4A0F _ 89. 45, E0
        jmp     ?_269                                   ; 4A12 _ EB, 3A

?_268:  mov     eax, dword [ebp-20H]                    ; 4A14 _ 8B. 45, E0
        lea     ecx, [eax+1H]                           ; 4A17 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 4A1A _ 8B. 45, 08
        mov     edx, dword [ebp-20H]                    ; 4A1D _ 8B. 55, E0
        add     edx, 4                                  ; 4A20 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4A23 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4A27 _ 8B. 45, 08
        add     ecx, 4                                  ; 4A2A _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 4A2D _ 89. 54 88, 04
        mov     eax, dword [ebp-20H]                    ; 4A31 _ 8B. 45, E0
        lea     edx, [eax+1H]                           ; 4A34 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4A37 _ 8B. 45, 08
        add     edx, 4                                  ; 4A3A _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4A3D _ 8B. 44 90, 04
        mov     edx, dword [ebp-20H]                    ; 4A41 _ 8B. 55, E0
        add     edx, 1                                  ; 4A44 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 4A47 _ 89. 50, 18
        sub     dword [ebp-20H], 1                      ; 4A4A _ 83. 6D, E0, 01
?_269:  mov     eax, dword [ebp-20H]                    ; 4A4E _ 8B. 45, E0
        cmp     eax, dword [ebp+10H]                    ; 4A51 _ 3B. 45, 10
        jge     ?_268                                   ; 4A54 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 4A56 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4A59 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 4A5C _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 4A5F _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4A62 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4A66 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4A69 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 4A6C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4A6F _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 4A72 _ 89. 50, 10
?_270:  mov     eax, dword [ebp+0CH]                    ; 4A75 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4A78 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4A7B _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4A7E _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 4A81 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4A84 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4A87 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4A8A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4A8D _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 4A90 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4A93 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4A96 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4A99 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4A9C _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 4A9F _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 4AA2 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 4AA6 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 4AAA _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 4AAE _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4AB2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4AB6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4AB9 _ 89. 04 24
        call    sheet_refreshmap                        ; 4ABC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4AC1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4AC4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4AC7 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 4ACA _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 4ACD _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4AD0 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4AD3 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4AD6 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 4AD9 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 4ADC _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4ADF _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4AE2 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4AE5 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4AE8 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 4AEB _ 8B. 4D, 10
        mov     dword [esp+18H], ecx                    ; 4AEE _ 89. 4C 24, 18
        mov     ecx, dword [ebp+10H]                    ; 4AF2 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 4AF5 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 4AF9 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 4AFD _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 4B01 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4B05 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4B09 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4B0C _ 89. 04 24
        call    sheet_refreshsub                        ; 4B0F _ E8, FFFFFFFC(rel)
?_271:  add     esp, 60                                 ; 4B14 _ 83. C4, 3C
        pop     ebx                                     ; 4B17 _ 5B
        pop     esi                                     ; 4B18 _ 5E
        pop     edi                                     ; 4B19 _ 5F
        pop     ebp                                     ; 4B1A _ 5D
        ret                                             ; 4B1B _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 4B1C _ 55
        mov     ebp, esp                                ; 4B1D _ 89. E5
        push    edi                                     ; 4B1F _ 57
        push    esi                                     ; 4B20 _ 56
        push    ebx                                     ; 4B21 _ 53
        sub     esp, 44                                 ; 4B22 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 4B25 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4B28 _ 8B. 40, 18
        test    eax, eax                                ; 4B2B _ 85. C0
        js      ?_272                                   ; 4B2D _ 78, 61
        mov     eax, dword [ebp+0CH]                    ; 4B2F _ 8B. 45, 0C
        mov     ebx, dword [eax+18H]                    ; 4B32 _ 8B. 58, 18
        mov     eax, dword [ebp+0CH]                    ; 4B35 _ 8B. 45, 0C
        mov     ecx, dword [eax+18H]                    ; 4B38 _ 8B. 48, 18
        mov     eax, dword [ebp+0CH]                    ; 4B3B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4B3E _ 8B. 50, 10
        mov     eax, dword [ebp+1CH]                    ; 4B41 _ 8B. 45, 1C
        lea     edi, [edx+eax]                          ; 4B44 _ 8D. 3C 02
        mov     eax, dword [ebp+0CH]                    ; 4B47 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4B4A _ 8B. 50, 0C
        mov     eax, dword [ebp+18H]                    ; 4B4D _ 8B. 45, 18
        lea     esi, [edx+eax]                          ; 4B50 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4B53 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4B56 _ 8B. 50, 10
        mov     eax, dword [ebp+14H]                    ; 4B59 _ 8B. 45, 14
        add     edx, eax                                ; 4B5C _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4B5E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4B61 _ 8B. 40, 0C
        mov     dword [ebp-1CH], eax                    ; 4B64 _ 89. 45, E4
        mov     eax, dword [ebp+10H]                    ; 4B67 _ 8B. 45, 10
        add     eax, dword [ebp-1CH]                    ; 4B6A _ 03. 45, E4
        mov     dword [esp+18H], ebx                    ; 4B6D _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 4B71 _ 89. 4C 24, 14
        mov     dword [esp+10H], edi                    ; 4B75 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 4B79 _ 89. 74 24, 0C
        mov     dword [esp+8H], edx                     ; 4B7D _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4B81 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4B85 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4B88 _ 89. 04 24
        call    sheet_refreshsub                        ; 4B8B _ E8, FFFFFFFC(rel)
?_272:  mov     eax, 0                                  ; 4B90 _ B8, 00000000
        add     esp, 44                                 ; 4B95 _ 83. C4, 2C
        pop     ebx                                     ; 4B98 _ 5B
        pop     esi                                     ; 4B99 _ 5E
        pop     edi                                     ; 4B9A _ 5F
        pop     ebp                                     ; 4B9B _ 5D
        ret                                             ; 4B9C _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 4B9D _ 55
        mov     ebp, esp                                ; 4B9E _ 89. E5
        push    esi                                     ; 4BA0 _ 56
        push    ebx                                     ; 4BA1 _ 53
        sub     esp, 48                                 ; 4BA2 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 4BA5 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4BA8 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 4BAB _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 4BAE _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 4BB1 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 4BB4 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 4BB7 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 4BBA _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 4BBD _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4BC0 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 4BC3 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 4BC6 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4BC9 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4BCC _ 8B. 40, 18
        test    eax, eax                                ; 4BCF _ 85. C0
        js      ?_273                                   ; 4BD1 _ 0F 88, 00000117
        mov     eax, dword [ebp+0CH]                    ; 4BD7 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 4BDA _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4BDD _ 8B. 45, F4
        add     edx, eax                                ; 4BE0 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4BE2 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 4BE5 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 4BE8 _ 8B. 45, F0
        add     eax, ecx                                ; 4BEB _ 01. C8
        mov     dword [esp+14H], 0                      ; 4BED _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 4BF5 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 4BF9 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 4BFD _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 4C00 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 4C04 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 4C07 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4C0B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4C0E _ 89. 04 24
        call    sheet_refreshmap                        ; 4C11 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4C16 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4C19 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 4C1C _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 4C1F _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 4C22 _ 8B. 55, 14
        add     ecx, edx                                ; 4C25 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 4C27 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 4C2A _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 4C2D _ 8B. 55, 10
        add     edx, ebx                                ; 4C30 _ 01. DA
        mov     dword [esp+14H], eax                    ; 4C32 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 4C36 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 4C3A _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 4C3E _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 4C41 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 4C45 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 4C48 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4C4C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4C4F _ 89. 04 24
        call    sheet_refreshmap                        ; 4C52 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4C57 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4C5A _ 8B. 40, 18
        lea     ecx, [eax-1H]                           ; 4C5D _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 4C60 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 4C63 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4C66 _ 8B. 45, F4
        add     edx, eax                                ; 4C69 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4C6B _ 8B. 45, 0C
        mov     ebx, dword [eax+4H]                     ; 4C6E _ 8B. 58, 04
        mov     eax, dword [ebp-10H]                    ; 4C71 _ 8B. 45, F0
        add     eax, ebx                                ; 4C74 _ 01. D8
        mov     dword [esp+18H], ecx                    ; 4C76 _ 89. 4C 24, 18
        mov     dword [esp+14H], 0                      ; 4C7A _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 4C82 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 4C86 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 4C8A _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 4C8D _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 4C91 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 4C94 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4C98 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4C9B _ 89. 04 24
        call    sheet_refreshsub                        ; 4C9E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4CA3 _ 8B. 45, 0C
        mov     edx, dword [eax+18H]                    ; 4CA6 _ 8B. 50, 18
        mov     eax, dword [ebp+0CH]                    ; 4CA9 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4CAC _ 8B. 40, 18
        mov     ecx, dword [ebp+0CH]                    ; 4CAF _ 8B. 4D, 0C
        mov     ebx, dword [ecx+8H]                     ; 4CB2 _ 8B. 59, 08
        mov     ecx, dword [ebp+14H]                    ; 4CB5 _ 8B. 4D, 14
        add     ebx, ecx                                ; 4CB8 _ 01. CB
        mov     ecx, dword [ebp+0CH]                    ; 4CBA _ 8B. 4D, 0C
        mov     esi, dword [ecx+4H]                     ; 4CBD _ 8B. 71, 04
        mov     ecx, dword [ebp+10H]                    ; 4CC0 _ 8B. 4D, 10
        add     ecx, esi                                ; 4CC3 _ 01. F1
        mov     dword [esp+18H], edx                    ; 4CC5 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 4CC9 _ 89. 44 24, 14
        mov     dword [esp+10H], ebx                    ; 4CCD _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 4CD1 _ 89. 4C 24, 0C
        mov     eax, dword [ebp+14H]                    ; 4CD5 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 4CD8 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 4CDC _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 4CDF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4CE3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4CE6 _ 89. 04 24
        call    sheet_refreshsub                        ; 4CE9 _ E8, FFFFFFFC(rel)
?_273:  add     esp, 48                                 ; 4CEE _ 83. C4, 30
        pop     ebx                                     ; 4CF1 _ 5B
        pop     esi                                     ; 4CF2 _ 5E
        pop     ebp                                     ; 4CF3 _ 5D
        ret                                             ; 4CF4 _ C3
; sheet_slide End of function

sheet_refreshsub:; Function begin
        push    ebp                                     ; 4CF5 _ 55
        mov     ebp, esp                                ; 4CF6 _ 89. E5
        sub     esp, 64                                 ; 4CF8 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 4CFB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4CFE _ 8B. 00
        mov     dword [ebp-20H], eax                    ; 4D00 _ 89. 45, E0
        mov     eax, dword [ebp+8H]                     ; 4D03 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4D06 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 4D09 _ 89. 45, E4
        cmp     dword [ebp+0CH], 0                      ; 4D0C _ 83. 7D, 0C, 00
        jns     ?_274                                   ; 4D10 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 4D12 _ C7. 45, 0C, 00000000
?_274:  cmp     dword [ebp+10H], 8                      ; 4D19 _ 83. 7D, 10, 08
        jg      ?_275                                   ; 4D1D _ 7F, 07
        mov     dword [ebp+10H], 0                      ; 4D1F _ C7. 45, 10, 00000000
?_275:  mov     eax, dword [ebp+8H]                     ; 4D26 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4D29 _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 4D2C _ 3B. 45, 14
        jge     ?_276                                   ; 4D2F _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4D31 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4D34 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 4D37 _ 89. 45, 14
?_276:  mov     eax, dword [ebp+8H]                     ; 4D3A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4D3D _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 4D40 _ 3B. 45, 18
        jge     ?_277                                   ; 4D43 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4D45 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4D48 _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 4D4B _ 89. 45, 18
?_277:  mov     eax, dword [ebp+1CH]                    ; 4D4E _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 4D51 _ 89. 45, CC
        jmp     ?_288                                   ; 4D54 _ E9, 0000015B

?_278:  mov     eax, dword [ebp+8H]                     ; 4D59 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 4D5C _ 8B. 55, CC
        add     edx, 4                                  ; 4D5F _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4D62 _ 8B. 44 90, 04
        mov     dword [ebp-18H], eax                    ; 4D66 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 4D69 _ 8B. 45, E8
        mov     eax, dword [eax]                        ; 4D6C _ 8B. 00
        mov     dword [ebp-14H], eax                    ; 4D6E _ 89. 45, EC
        mov     edx, dword [ebp-18H]                    ; 4D71 _ 8B. 55, E8
        mov     eax, dword [ebp+8H]                     ; 4D74 _ 8B. 45, 08
        add     eax, 1044                               ; 4D77 _ 05, 00000414
        sub     edx, eax                                ; 4D7C _ 29. C2
        mov     eax, edx                                ; 4D7E _ 89. D0
        sar     eax, 2                                  ; 4D80 _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 4D83 _ 69. C0, 38E38E39
        mov     byte [ebp-35H], al                      ; 4D89 _ 88. 45, CB
        mov     eax, dword [ebp-18H]                    ; 4D8C _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 4D8F _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 4D92 _ 8B. 55, 0C
        sub     edx, eax                                ; 4D95 _ 29. C2
        mov     eax, edx                                ; 4D97 _ 89. D0
        mov     dword [ebp-10H], eax                    ; 4D99 _ 89. 45, F0
        mov     eax, dword [ebp-18H]                    ; 4D9C _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 4D9F _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 4DA2 _ 8B. 55, 10
        sub     edx, eax                                ; 4DA5 _ 29. C2
        mov     eax, edx                                ; 4DA7 _ 89. D0
        mov     dword [ebp-0CH], eax                    ; 4DA9 _ 89. 45, F4
        mov     eax, dword [ebp-18H]                    ; 4DAC _ 8B. 45, E8
        mov     eax, dword [eax+0CH]                    ; 4DAF _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 4DB2 _ 8B. 55, 14
        sub     edx, eax                                ; 4DB5 _ 29. C2
        mov     eax, edx                                ; 4DB7 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 4DB9 _ 89. 45, D8
        mov     eax, dword [ebp-18H]                    ; 4DBC _ 8B. 45, E8
        mov     eax, dword [eax+10H]                    ; 4DBF _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 4DC2 _ 8B. 55, 18
        sub     edx, eax                                ; 4DC5 _ 29. C2
        mov     eax, edx                                ; 4DC7 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 4DC9 _ 89. 45, DC
        cmp     dword [ebp-10H], 0                      ; 4DCC _ 83. 7D, F0, 00
        jns     ?_279                                   ; 4DD0 _ 79, 07
        mov     dword [ebp-10H], 0                      ; 4DD2 _ C7. 45, F0, 00000000
?_279:  cmp     dword [ebp-0CH], 0                      ; 4DD9 _ 83. 7D, F4, 00
        jns     ?_280                                   ; 4DDD _ 79, 07
        mov     dword [ebp-0CH], 0                      ; 4DDF _ C7. 45, F4, 00000000
?_280:  mov     eax, dword [ebp-18H]                    ; 4DE6 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 4DE9 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 4DEC _ 3B. 45, D8
        jge     ?_281                                   ; 4DEF _ 7D, 09
        mov     eax, dword [ebp-18H]                    ; 4DF1 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 4DF4 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 4DF7 _ 89. 45, D8
?_281:  mov     eax, dword [ebp-18H]                    ; 4DFA _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 4DFD _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 4E00 _ 3B. 45, DC
        jge     ?_282                                   ; 4E03 _ 7D, 09
        mov     eax, dword [ebp-18H]                    ; 4E05 _ 8B. 45, E8
        mov     eax, dword [eax+8H]                     ; 4E08 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 4E0B _ 89. 45, DC
?_282:  mov     dword [ebp-2CH], 0                      ; 4E0E _ C7. 45, D4, 00000000
        jmp     ?_287                                   ; 4E15 _ E9, 0000008A

?_283:  mov     eax, dword [ebp-18H]                    ; 4E1A _ 8B. 45, E8
        mov     edx, dword [eax+10H]                    ; 4E1D _ 8B. 50, 10
        mov     eax, dword [ebp-2CH]                    ; 4E20 _ 8B. 45, D4
        add     eax, edx                                ; 4E23 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4E25 _ 89. 45, F8
        mov     dword [ebp-30H], 0                      ; 4E28 _ C7. 45, D0, 00000000
        jmp     ?_286                                   ; 4E2F _ EB, 67

?_284:  mov     eax, dword [ebp-18H]                    ; 4E31 _ 8B. 45, E8
        mov     edx, dword [eax+0CH]                    ; 4E34 _ 8B. 50, 0C
        mov     eax, dword [ebp-30H]                    ; 4E37 _ 8B. 45, D0
        add     eax, edx                                ; 4E3A _ 01. D0
        mov     dword [ebp-4H], eax                     ; 4E3C _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 4E3F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4E42 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 4E45 _ 0F AF. 45, F8
        mov     edx, eax                                ; 4E49 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4E4B _ 8B. 45, FC
        add     eax, edx                                ; 4E4E _ 01. D0
        mov     edx, eax                                ; 4E50 _ 89. C2
        mov     eax, dword [ebp-1CH]                    ; 4E52 _ 8B. 45, E4
        add     eax, edx                                ; 4E55 _ 01. D0
        movzx   eax, byte [eax]                         ; 4E57 _ 0F B6. 00
        cmp     al, byte [ebp-35H]                      ; 4E5A _ 3A. 45, CB
        jnz     ?_285                                   ; 4E5D _ 75, 35
        mov     eax, dword [ebp+8H]                     ; 4E5F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4E62 _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 4E65 _ 0F AF. 45, F8
        mov     edx, eax                                ; 4E69 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4E6B _ 8B. 45, FC
        add     eax, edx                                ; 4E6E _ 01. D0
        mov     edx, eax                                ; 4E70 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 4E72 _ 8B. 45, E0
        add     edx, eax                                ; 4E75 _ 01. C2
        mov     eax, dword [ebp-18H]                    ; 4E77 _ 8B. 45, E8
        mov     eax, dword [eax+4H]                     ; 4E7A _ 8B. 40, 04
        imul    eax, dword [ebp-2CH]                    ; 4E7D _ 0F AF. 45, D4
        mov     ecx, eax                                ; 4E81 _ 89. C1
        mov     eax, dword [ebp-30H]                    ; 4E83 _ 8B. 45, D0
        add     eax, ecx                                ; 4E86 _ 01. C8
        mov     ecx, eax                                ; 4E88 _ 89. C1
        mov     eax, dword [ebp-14H]                    ; 4E8A _ 8B. 45, EC
        add     eax, ecx                                ; 4E8D _ 01. C8
        movzx   eax, byte [eax]                         ; 4E8F _ 0F B6. 00
        mov     byte [edx], al                          ; 4E92 _ 88. 02
?_285:  add     dword [ebp-30H], 1                      ; 4E94 _ 83. 45, D0, 01
?_286:  mov     eax, dword [ebp-30H]                    ; 4E98 _ 8B. 45, D0
        cmp     eax, dword [ebp-28H]                    ; 4E9B _ 3B. 45, D8
        jl      ?_284                                   ; 4E9E _ 7C, 91
        add     dword [ebp-2CH], 1                      ; 4EA0 _ 83. 45, D4, 01
?_287:  mov     eax, dword [ebp-2CH]                    ; 4EA4 _ 8B. 45, D4
        cmp     eax, dword [ebp-24H]                    ; 4EA7 _ 3B. 45, DC
        jl      ?_283                                   ; 4EAA _ 0F 8C, FFFFFF6A
        add     dword [ebp-34H], 1                      ; 4EB0 _ 83. 45, CC, 01
?_288:  mov     eax, dword [ebp-34H]                    ; 4EB4 _ 8B. 45, CC
        cmp     eax, dword [ebp+20H]                    ; 4EB7 _ 3B. 45, 20
        jle     ?_278                                   ; 4EBA _ 0F 8E, FFFFFE99
        leave                                           ; 4EC0 _ C9
        ret                                             ; 4EC1 _ C3
; sheet_refreshsub End of function

sheet_refreshmap:; Function begin
        push    ebp                                     ; 4EC2 _ 55
        mov     ebp, esp                                ; 4EC3 _ 89. E5
        sub     esp, 64                                 ; 4EC5 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 4EC8 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4ECB _ 8B. 40, 04
        mov     dword [ebp-14H], eax                    ; 4ECE _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 4ED1 _ 83. 7D, 0C, 00
        jns     ?_289                                   ; 4ED5 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 4ED7 _ C7. 45, 0C, 00000000
?_289:  cmp     dword [ebp+10H], 0                      ; 4EDE _ 83. 7D, 10, 00
        jns     ?_290                                   ; 4EE2 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 4EE4 _ C7. 45, 10, 00000000
?_290:  mov     eax, dword [ebp+8H]                     ; 4EEB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4EEE _ 8B. 40, 08
        cmp     eax, dword [ebp+14H]                    ; 4EF1 _ 3B. 45, 14
        jge     ?_291                                   ; 4EF4 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4EF6 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4EF9 _ 8B. 40, 08
        mov     dword [ebp+14H], eax                    ; 4EFC _ 89. 45, 14
?_291:  mov     eax, dword [ebp+8H]                     ; 4EFF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4F02 _ 8B. 40, 0C
        cmp     eax, dword [ebp+18H]                    ; 4F05 _ 3B. 45, 18
        jge     ?_292                                   ; 4F08 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4F0A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4F0D _ 8B. 40, 0C
        mov     dword [ebp+18H], eax                    ; 4F10 _ 89. 45, 18
?_292:  mov     eax, dword [ebp+1CH]                    ; 4F13 _ 8B. 45, 1C
        mov     dword [ebp-30H], eax                    ; 4F16 _ 89. 45, D0
        jmp     ?_303                                   ; 4F19 _ E9, 00000147

?_293:  mov     eax, dword [ebp+8H]                     ; 4F1E _ 8B. 45, 08
        mov     edx, dword [ebp-30H]                    ; 4F21 _ 8B. 55, D0
        add     edx, 4                                  ; 4F24 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4F27 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 4F2B _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 4F2E _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 4F31 _ 8B. 45, 08
        add     eax, 1044                               ; 4F34 _ 05, 00000414
        sub     edx, eax                                ; 4F39 _ 29. C2
        mov     eax, edx                                ; 4F3B _ 89. D0
        sar     eax, 2                                  ; 4F3D _ C1. F8, 02
        imul    eax, eax, 954437177                     ; 4F40 _ 69. C0, 38E38E39
        mov     byte [ebp-31H], al                      ; 4F46 _ 88. 45, CF
        mov     eax, dword [ebp-10H]                    ; 4F49 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 4F4C _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 4F4E _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 4F51 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4F54 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 4F57 _ 8B. 55, 0C
        sub     edx, eax                                ; 4F5A _ 29. C2
        mov     eax, edx                                ; 4F5C _ 89. D0
        mov     dword [ebp-24H], eax                    ; 4F5E _ 89. 45, DC
        mov     eax, dword [ebp-10H]                    ; 4F61 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 4F64 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 4F67 _ 8B. 55, 10
        sub     edx, eax                                ; 4F6A _ 29. C2
        mov     eax, edx                                ; 4F6C _ 89. D0
        mov     dword [ebp-20H], eax                    ; 4F6E _ 89. 45, E0
        mov     eax, dword [ebp-10H]                    ; 4F71 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4F74 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 4F77 _ 8B. 55, 14
        sub     edx, eax                                ; 4F7A _ 29. C2
        mov     eax, edx                                ; 4F7C _ 89. D0
        mov     dword [ebp-1CH], eax                    ; 4F7E _ 89. 45, E4
        mov     eax, dword [ebp-10H]                    ; 4F81 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 4F84 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 4F87 _ 8B. 55, 18
        sub     edx, eax                                ; 4F8A _ 29. C2
        mov     eax, edx                                ; 4F8C _ 89. D0
        mov     dword [ebp-18H], eax                    ; 4F8E _ 89. 45, E8
        cmp     dword [ebp-24H], 0                      ; 4F91 _ 83. 7D, DC, 00
        jns     ?_294                                   ; 4F95 _ 79, 07
        mov     dword [ebp-24H], 0                      ; 4F97 _ C7. 45, DC, 00000000
?_294:  cmp     dword [ebp-20H], 0                      ; 4F9E _ 83. 7D, E0, 00
        jns     ?_295                                   ; 4FA2 _ 79, 07
        mov     dword [ebp-20H], 0                      ; 4FA4 _ C7. 45, E0, 00000000
?_295:  mov     eax, dword [ebp-10H]                    ; 4FAB _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4FAE _ 8B. 40, 04
        cmp     eax, dword [ebp-1CH]                    ; 4FB1 _ 3B. 45, E4
        jge     ?_296                                   ; 4FB4 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4FB6 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4FB9 _ 8B. 40, 04
        mov     dword [ebp-1CH], eax                    ; 4FBC _ 89. 45, E4
?_296:  mov     eax, dword [ebp-10H]                    ; 4FBF _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 4FC2 _ 8B. 40, 08
        cmp     eax, dword [ebp-18H]                    ; 4FC5 _ 3B. 45, E8
        jge     ?_297                                   ; 4FC8 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4FCA _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 4FCD _ 8B. 40, 08
        mov     dword [ebp-18H], eax                    ; 4FD0 _ 89. 45, E8
?_297:  mov     eax, dword [ebp-20H]                    ; 4FD3 _ 8B. 45, E0
        mov     dword [ebp-28H], eax                    ; 4FD6 _ 89. 45, D8
        jmp     ?_302                                   ; 4FD9 _ EB, 7A

?_298:  mov     eax, dword [ebp-10H]                    ; 4FDB _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 4FDE _ 8B. 50, 10
        mov     eax, dword [ebp-28H]                    ; 4FE1 _ 8B. 45, D8
        add     eax, edx                                ; 4FE4 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4FE6 _ 89. 45, F8
        mov     eax, dword [ebp-24H]                    ; 4FE9 _ 8B. 45, DC
        mov     dword [ebp-2CH], eax                    ; 4FEC _ 89. 45, D4
        jmp     ?_301                                   ; 4FEF _ EB, 58

?_299:  mov     eax, dword [ebp-10H]                    ; 4FF1 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 4FF4 _ 8B. 50, 0C
        mov     eax, dword [ebp-2CH]                    ; 4FF7 _ 8B. 45, D4
        add     eax, edx                                ; 4FFA _ 01. D0
        mov     dword [ebp-4H], eax                     ; 4FFC _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 4FFF _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 5002 _ 8B. 40, 04
        imul    eax, dword [ebp-28H]                    ; 5005 _ 0F AF. 45, D8
        mov     edx, eax                                ; 5009 _ 89. C2
        mov     eax, dword [ebp-2CH]                    ; 500B _ 8B. 45, D4
        add     eax, edx                                ; 500E _ 01. D0
        mov     edx, eax                                ; 5010 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 5012 _ 8B. 45, F4
        add     eax, edx                                ; 5015 _ 01. D0
        movzx   eax, byte [eax]                         ; 5017 _ 0F B6. 00
        movzx   edx, al                                 ; 501A _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 501D _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 5020 _ 8B. 40, 14
        cmp     edx, eax                                ; 5023 _ 39. C2
        jz      ?_300                                   ; 5025 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 5027 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 502A _ 8B. 40, 08
        imul    eax, dword [ebp-8H]                     ; 502D _ 0F AF. 45, F8
        mov     edx, eax                                ; 5031 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 5033 _ 8B. 45, FC
        add     eax, edx                                ; 5036 _ 01. D0
        mov     edx, eax                                ; 5038 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 503A _ 8B. 45, EC
        add     edx, eax                                ; 503D _ 01. C2
        movzx   eax, byte [ebp-31H]                     ; 503F _ 0F B6. 45, CF
        mov     byte [edx], al                          ; 5043 _ 88. 02
?_300:  add     dword [ebp-2CH], 1                      ; 5045 _ 83. 45, D4, 01
?_301:  mov     eax, dword [ebp-2CH]                    ; 5049 _ 8B. 45, D4
        cmp     eax, dword [ebp-1CH]                    ; 504C _ 3B. 45, E4
        jl      ?_299                                   ; 504F _ 7C, A0
        add     dword [ebp-28H], 1                      ; 5051 _ 83. 45, D8, 01
?_302:  mov     eax, dword [ebp-28H]                    ; 5055 _ 8B. 45, D8
        cmp     eax, dword [ebp-18H]                    ; 5058 _ 3B. 45, E8
        jl      ?_298                                   ; 505B _ 0F 8C, FFFFFF7A
        add     dword [ebp-30H], 1                      ; 5061 _ 83. 45, D0, 01
?_303:  mov     eax, dword [ebp+8H]                     ; 5065 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5068 _ 8B. 40, 10
        cmp     eax, dword [ebp-30H]                    ; 506B _ 3B. 45, D0
        jge     ?_293                                   ; 506E _ 0F 8D, FFFFFEAA
        nop                                             ; 5074 _ 90
        leave                                           ; 5075 _ C9
        ret                                             ; 5076 _ C3
; sheet_refreshmap End of function

sheet_free:; Function begin
        push    ebp                                     ; 5077 _ 55
        mov     ebp, esp                                ; 5078 _ 89. E5
        sub     esp, 24                                 ; 507A _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 507D _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 5080 _ 8B. 40, 18
        test    eax, eax                                ; 5083 _ 85. C0
        js      ?_304                                   ; 5085 _ 78, 1A
        mov     dword [esp+8H], -1                      ; 5087 _ C7. 44 24, 08, FFFFFFFF
        mov     eax, dword [ebp+0CH]                    ; 508F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 5092 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 5096 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5099 _ 89. 04 24
        call    sheet_updown                            ; 509C _ E8, FFFFFFFC(rel)
?_304:  mov     eax, dword [ebp+0CH]                    ; 50A1 _ 8B. 45, 0C
        mov     dword [eax+1CH], 0                      ; 50A4 _ C7. 40, 1C, 00000000
        nop                                             ; 50AB _ 90
        leave                                           ; 50AC _ C9
        ret                                             ; 50AD _ C3
; sheet_free End of function

init_pit:; Function begin
        push    ebp                                     ; 50AE _ 55
        mov     ebp, esp                                ; 50AF _ 89. E5
        sub     esp, 40                                 ; 50B1 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 50B4 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 50BC _ C7. 04 24, 00000043
        call    io_out8                                 ; 50C3 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 50C8 _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 50D0 _ C7. 04 24, 00000040
        call    io_out8                                 ; 50D7 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 50DC _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 50E4 _ C7. 04 24, 00000040
        call    io_out8                                 ; 50EB _ E8, FFFFFFFC(rel)
        mov     dword [timerctl], 0                     ; 50F0 _ C7. 05, 000003A0(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 50FA _ C7. 45, F4, 00000000
        jmp     ?_306                                   ; 5101 _ EB, 28

?_305:  mov     eax, dword [ebp-0CH]                    ; 5103 _ 8B. 45, F4
        shl     eax, 4                                  ; 5106 _ C1. E0, 04
        add     eax, timerctl                           ; 5109 _ 05, 000003A0(d)
        mov     dword [eax+8H], 0                       ; 510E _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 5115 _ 8B. 45, F4
        shl     eax, 4                                  ; 5118 _ C1. E0, 04
        add     eax, timerctl                           ; 511B _ 05, 000003A0(d)
        mov     dword [eax+0CH], 0                      ; 5120 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 5127 _ 83. 45, F4, 01
?_306:  cmp     dword [ebp-0CH], 499                    ; 512B _ 81. 7D, F4, 000001F3
        jle     ?_305                                   ; 5132 _ 7E, CF
        leave                                           ; 5134 _ C9
        ret                                             ; 5135 _ C3
; init_pit End of function

timer_alloc:; Function begin
        push    ebp                                     ; 5136 _ 55
        mov     ebp, esp                                ; 5137 _ 89. E5
        sub     esp, 16                                 ; 5139 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 513C _ C7. 45, FC, 00000000
        jmp     ?_309                                   ; 5143 _ EB, 38

?_307:  mov     eax, dword [ebp-4H]                     ; 5145 _ 8B. 45, FC
        shl     eax, 4                                  ; 5148 _ C1. E0, 04
        add     eax, timerctl                           ; 514B _ 05, 000003A0(d)
        mov     eax, dword [eax+8H]                     ; 5150 _ 8B. 40, 08
        test    eax, eax                                ; 5153 _ 85. C0
        jnz     ?_308                                   ; 5155 _ 75, 22
        mov     eax, dword [ebp-4H]                     ; 5157 _ 8B. 45, FC
        shl     eax, 4                                  ; 515A _ C1. E0, 04
        add     eax, timerctl                           ; 515D _ 05, 000003A0(d)
        mov     dword [eax+8H], 1                       ; 5162 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-4H]                     ; 5169 _ 8B. 45, FC
        shl     eax, 4                                  ; 516C _ C1. E0, 04
        add     eax, timerctl                           ; 516F _ 05, 000003A0(d)
        add     eax, 4                                  ; 5174 _ 83. C0, 04
        jmp     ?_310                                   ; 5177 _ EB, 12

?_308:  add     dword [ebp-4H], 1                       ; 5179 _ 83. 45, FC, 01
?_309:  cmp     dword [ebp-4H], 499                     ; 517D _ 81. 7D, FC, 000001F3
        jle     ?_307                                   ; 5184 _ 7E, BF
        mov     eax, 0                                  ; 5186 _ B8, 00000000
?_310:  leave                                           ; 518B _ C9
        ret                                             ; 518C _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 518D _ 55
        mov     ebp, esp                                ; 518E _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 5190 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 5193 _ C7. 40, 04, 00000000
        nop                                             ; 519A _ 90
        pop     ebp                                     ; 519B _ 5D
        ret                                             ; 519C _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 519D _ 55
        mov     ebp, esp                                ; 519E _ 89. E5
        sub     esp, 4                                  ; 51A0 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 51A3 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 51A6 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 51A9 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 51AC _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 51AF _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 51B2 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 51B5 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 51B9 _ 88. 50, 0C
        nop                                             ; 51BC _ 90
        leave                                           ; 51BD _ C9
        ret                                             ; 51BE _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 51BF _ 55
        mov     ebp, esp                                ; 51C0 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 51C2 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 51C5 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 51C8 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 51CA _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 51CD _ C7. 40, 04, 00000002
        nop                                             ; 51D4 _ 90
        pop     ebp                                     ; 51D5 _ 5D
        ret                                             ; 51D6 _ C3
; timer_settime End of function

intHandlerForTimer:; Function begin
        push    ebp                                     ; 51D7 _ 55
        mov     ebp, esp                                ; 51D8 _ 89. E5
        sub     esp, 40                                 ; 51DA _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 51DD _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 51E5 _ C7. 04 24, 00000020
        call    io_out8                                 ; 51EC _ E8, FFFFFFFC(rel)
        mov     eax, dword [timerctl]                   ; 51F1 _ A1, 000003A0(d)
        add     eax, 1                                  ; 51F6 _ 83. C0, 01
        mov     dword [timerctl], eax                   ; 51F9 _ A3, 000003A0(d)
        mov     byte [ebp-0DH], 0                       ; 51FE _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 5202 _ C7. 45, F4, 00000000
        jmp     ?_314                                   ; 5209 _ E9, 000000B0

?_311:  mov     eax, dword [ebp-0CH]                    ; 520E _ 8B. 45, F4
        shl     eax, 4                                  ; 5211 _ C1. E0, 04
        add     eax, timerctl                           ; 5214 _ 05, 000003A0(d)
        mov     eax, dword [eax+8H]                     ; 5219 _ 8B. 40, 08
        cmp     eax, 2                                  ; 521C _ 83. F8, 02
        jne     ?_312                                   ; 521F _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 5225 _ 8B. 45, F4
        shl     eax, 4                                  ; 5228 _ C1. E0, 04
        add     eax, timerctl                           ; 522B _ 05, 000003A0(d)
        mov     eax, dword [eax+4H]                     ; 5230 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 5233 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 5236 _ 8B. 45, F4
        shl     eax, 4                                  ; 5239 _ C1. E0, 04
        add     eax, timerctl                           ; 523C _ 05, 000003A0(d)
        mov     dword [eax+4H], edx                     ; 5241 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 5244 _ 8B. 45, F4
        shl     eax, 4                                  ; 5247 _ C1. E0, 04
        add     eax, timerctl                           ; 524A _ 05, 000003A0(d)
        mov     eax, dword [eax+4H]                     ; 524F _ 8B. 40, 04
        test    eax, eax                                ; 5252 _ 85. C0
        jnz     ?_312                                   ; 5254 _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 5256 _ 8B. 45, F4
        shl     eax, 4                                  ; 5259 _ C1. E0, 04
        add     eax, timerctl                           ; 525C _ 05, 000003A0(d)
        mov     dword [eax+8H], 1                       ; 5261 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 5268 _ 8B. 45, F4
        shl     eax, 4                                  ; 526B _ C1. E0, 04
        add     eax, timerctl                           ; 526E _ 05, 000003A0(d)
        movzx   eax, byte [eax+10H]                     ; 5273 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 5277 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 527A _ 8B. 45, F4
        shl     eax, 4                                  ; 527D _ C1. E0, 04
        add     eax, timerctl                           ; 5280 _ 05, 000003A0(d)
        mov     eax, dword [eax+0CH]                    ; 5285 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 5288 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 528C _ 89. 04 24
        call    fifo8_put                               ; 528F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5294 _ 8B. 45, F4
        shl     eax, 4                                  ; 5297 _ C1. E0, 04
        add     eax, timerctl                           ; 529A _ 05, 000003A0(d)
        lea     edx, [eax+4H]                           ; 529F _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 52A2 _ A1, 00000000(d)
        cmp     edx, eax                                ; 52A7 _ 39. C2
        jnz     ?_312                                   ; 52A9 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 52AB _ C6. 45, F3, 01
?_312:  cmp     byte [ebp-0DH], 0                       ; 52AF _ 80. 7D, F3, 00
        jz      ?_313                                   ; 52B3 _ 74, 05
        call    task_switch                             ; 52B5 _ E8, FFFFFFFC(rel)
?_313:  add     dword [ebp-0CH], 1                      ; 52BA _ 83. 45, F4, 01
?_314:  cmp     dword [ebp-0CH], 499                    ; 52BE _ 81. 7D, F4, 000001F3
        jle     ?_311                                   ; 52C5 _ 0F 8E, FFFFFF43
        nop                                             ; 52CB _ 90
        leave                                           ; 52CC _ C9
        ret                                             ; 52CD _ C3
; intHandlerForTimer End of function

getTimerController:; Function begin
        push    ebp                                     ; 52CE _ 55
        mov     ebp, esp                                ; 52CF _ 89. E5
        mov     eax, timerctl                           ; 52D1 _ B8, 000003A0(d)
        pop     ebp                                     ; 52D6 _ 5D
        ret                                             ; 52D7 _ C3
; getTimerController End of function

fifo8_init:; Function begin
        push    ebp                                     ; 52D8 _ 55
        mov     ebp, esp                                ; 52D9 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 52DB _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 52DE _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 52E1 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 52E4 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 52E7 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 52EA _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 52EC _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 52EF _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 52F2 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 52F5 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 52F8 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 52FF _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 5302 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 5309 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 530C _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 5313 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 5316 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 5319 _ 89. 50, 18
        nop                                             ; 531C _ 90
        pop     ebp                                     ; 531D _ 5D
        ret                                             ; 531E _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 531F _ 55
        mov     ebp, esp                                ; 5320 _ 89. E5
        sub     esp, 24                                 ; 5322 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 5325 _ 8B. 45, 0C
        mov     byte [ebp-0CH], al                      ; 5328 _ 88. 45, F4
        cmp     dword [ebp+8H], 0                       ; 532B _ 83. 7D, 08, 00
        jnz     ?_315                                   ; 532F _ 75, 0A
        mov     eax, 4294967295                         ; 5331 _ B8, FFFFFFFF
        jmp     ?_319                                   ; 5336 _ E9, 000000AB

?_315:  mov     eax, dword [ebp+8H]                     ; 533B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 533E _ 8B. 40, 10
        test    eax, eax                                ; 5341 _ 85. C0
        jnz     ?_316                                   ; 5343 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 5345 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 5348 _ 8B. 40, 14
        or      eax, 01H                                ; 534B _ 83. C8, 01
        mov     edx, eax                                ; 534E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5350 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 5353 _ 89. 50, 14
        mov     eax, 4294967295                         ; 5356 _ B8, FFFFFFFF
        jmp     ?_319                                   ; 535B _ E9, 00000086

?_316:  mov     eax, dword [ebp+8H]                     ; 5360 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 5363 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 5365 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5368 _ 8B. 40, 04
        add     edx, eax                                ; 536B _ 01. C2
        movzx   eax, byte [ebp-0CH]                     ; 536D _ 0F B6. 45, F4
        mov     byte [edx], al                          ; 5371 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 5373 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 5376 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 5379 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 537C _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 537F _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 5382 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 5385 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 5388 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 538B _ 8B. 40, 0C
        cmp     edx, eax                                ; 538E _ 39. C2
        jnz     ?_317                                   ; 5390 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 5392 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 5395 _ C7. 40, 04, 00000000
?_317:  mov     eax, dword [ebp+8H]                     ; 539C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 539F _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 53A2 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 53A5 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 53A8 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 53AB _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 53AE _ 8B. 40, 18
        test    eax, eax                                ; 53B1 _ 85. C0
        jz      ?_318                                   ; 53B3 _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 53B5 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 53B8 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 53BB _ 8B. 40, 04
        cmp     eax, 2                                  ; 53BE _ 83. F8, 02
        jz      ?_318                                   ; 53C1 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 53C3 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 53C6 _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 53C9 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 53D1 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 53D9 _ 89. 04 24
        call    task_run                                ; 53DC _ E8, FFFFFFFC(rel)
?_318:  mov     eax, 0                                  ; 53E1 _ B8, 00000000
?_319:  leave                                           ; 53E6 _ C9
        ret                                             ; 53E7 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 53E8 _ 55
        mov     ebp, esp                                ; 53E9 _ 89. E5
        sub     esp, 16                                 ; 53EB _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 53EE _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 53F1 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 53F4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 53F7 _ 8B. 40, 0C
        cmp     edx, eax                                ; 53FA _ 39. C2
        jnz     ?_320                                   ; 53FC _ 75, 07
        mov     eax, 4294967295                         ; 53FE _ B8, FFFFFFFF
        jmp     ?_322                                   ; 5403 _ EB, 51

?_320:  mov     eax, dword [ebp+8H]                     ; 5405 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 5408 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 540A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 540D _ 8B. 40, 08
        add     eax, edx                                ; 5410 _ 01. D0
        movzx   eax, byte [eax]                         ; 5412 _ 0F B6. 00
        movzx   eax, al                                 ; 5415 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 5418 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 541B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 541E _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 5421 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 5424 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 5427 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 542A _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 542D _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 5430 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 5433 _ 8B. 40, 0C
        cmp     edx, eax                                ; 5436 _ 39. C2
        jnz     ?_321                                   ; 5438 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 543A _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 543D _ C7. 40, 08, 00000000
?_321:  mov     eax, dword [ebp+8H]                     ; 5444 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5447 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 544A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 544D _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 5450 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 5453 _ 8B. 45, FC
?_322:  leave                                           ; 5456 _ C9
        ret                                             ; 5457 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 5458 _ 55
        mov     ebp, esp                                ; 5459 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 545B _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 545E _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 5461 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 5464 _ 8B. 40, 10
        sub     edx, eax                                ; 5467 _ 29. C2
        mov     eax, edx                                ; 5469 _ 89. D0
        pop     ebp                                     ; 546B _ 5D
        ret                                             ; 546C _ C3
; fifo8_status End of function

strcmp: ; Function begin
        push    ebp                                     ; 546D _ 55
        mov     ebp, esp                                ; 546E _ 89. E5
        sub     esp, 16                                 ; 5470 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 5473 _ 83. 7D, 08, 00
        jz      ?_323                                   ; 5477 _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 5479 _ 83. 7D, 0C, 00
        jnz     ?_324                                   ; 547D _ 75, 0A
?_323:  mov     eax, 0                                  ; 547F _ B8, 00000000
        jmp     ?_331                                   ; 5484 _ E9, 0000009B

?_324:  mov     dword [ebp-4H], 0                       ; 5489 _ C7. 45, FC, 00000000
        jmp     ?_327                                   ; 5490 _ EB, 25

?_325:  mov     edx, dword [ebp-4H]                     ; 5492 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 5495 _ 8B. 45, 08
        add     eax, edx                                ; 5498 _ 01. D0
        movzx   edx, byte [eax]                         ; 549A _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 549D _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 54A0 _ 8B. 45, 0C
        add     eax, ecx                                ; 54A3 _ 01. C8
        movzx   eax, byte [eax]                         ; 54A5 _ 0F B6. 00
        cmp     dl, al                                  ; 54A8 _ 38. C2
        jz      ?_326                                   ; 54AA _ 74, 07
        mov     eax, 0                                  ; 54AC _ B8, 00000000
        jmp     ?_331                                   ; 54B1 _ EB, 71

?_326:  add     dword [ebp-4H], 1                       ; 54B3 _ 83. 45, FC, 01
?_327:  mov     edx, dword [ebp-4H]                     ; 54B7 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 54BA _ 8B. 45, 08
        add     eax, edx                                ; 54BD _ 01. D0
        movzx   eax, byte [eax]                         ; 54BF _ 0F B6. 00
        test    al, al                                  ; 54C2 _ 84. C0
        jz      ?_328                                   ; 54C4 _ 74, 0F
        mov     edx, dword [ebp-4H]                     ; 54C6 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 54C9 _ 8B. 45, 0C
        add     eax, edx                                ; 54CC _ 01. D0
        movzx   eax, byte [eax]                         ; 54CE _ 0F B6. 00
        test    al, al                                  ; 54D1 _ 84. C0
        jnz     ?_325                                   ; 54D3 _ 75, BD
?_328:  mov     edx, dword [ebp-4H]                     ; 54D5 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 54D8 _ 8B. 45, 08
        add     eax, edx                                ; 54DB _ 01. D0
        movzx   eax, byte [eax]                         ; 54DD _ 0F B6. 00
        test    al, al                                  ; 54E0 _ 84. C0
        jnz     ?_329                                   ; 54E2 _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 54E4 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 54E7 _ 8B. 45, 0C
        add     eax, edx                                ; 54EA _ 01. D0
        movzx   eax, byte [eax]                         ; 54EC _ 0F B6. 00
        test    al, al                                  ; 54EF _ 84. C0
        jz      ?_329                                   ; 54F1 _ 74, 07
        mov     eax, 0                                  ; 54F3 _ B8, 00000000
        jmp     ?_331                                   ; 54F8 _ EB, 2A

?_329:  mov     edx, dword [ebp-4H]                     ; 54FA _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 54FD _ 8B. 45, 08
        add     eax, edx                                ; 5500 _ 01. D0
        movzx   eax, byte [eax]                         ; 5502 _ 0F B6. 00
        test    al, al                                  ; 5505 _ 84. C0
        jz      ?_330                                   ; 5507 _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 5509 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 550C _ 8B. 45, 0C
        add     eax, edx                                ; 550F _ 01. D0
        movzx   eax, byte [eax]                         ; 5511 _ 0F B6. 00
        test    al, al                                  ; 5514 _ 84. C0
        jz      ?_330                                   ; 5516 _ 74, 07
        mov     eax, 0                                  ; 5518 _ B8, 00000000
        jmp     ?_331                                   ; 551D _ EB, 05

?_330:  mov     eax, 1                                  ; 551F _ B8, 00000001
?_331:  leave                                           ; 5524 _ C9
        ret                                             ; 5525 _ C3
; strcmp End of function

set_segmdesc:; Function begin
        push    ebp                                     ; 5526 _ 55
        mov     ebp, esp                                ; 5527 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 5529 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_332                                   ; 5530 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 5532 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 5539 _ 8B. 45, 0C
        shr     eax, 12                                 ; 553C _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 553F _ 89. 45, 0C
?_332:  mov     eax, dword [ebp+0CH]                    ; 5542 _ 8B. 45, 0C
        mov     edx, eax                                ; 5545 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5547 _ 8B. 45, 08
        mov     word [eax], dx                          ; 554A _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 554D _ 8B. 45, 10
        mov     edx, eax                                ; 5550 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5552 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 5555 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 5559 _ 8B. 45, 10
        sar     eax, 16                                 ; 555C _ C1. F8, 10
        mov     edx, eax                                ; 555F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5561 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 5564 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 5567 _ 8B. 45, 14
        mov     edx, eax                                ; 556A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 556C _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 556F _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 5572 _ 8B. 45, 0C
        shr     eax, 16                                 ; 5575 _ C1. E8, 10
        and     eax, 0FH                                ; 5578 _ 83. E0, 0F
        mov     edx, eax                                ; 557B _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 557D _ 8B. 45, 14
        sar     eax, 8                                  ; 5580 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 5583 _ 83. E0, F0
        or      eax, edx                                ; 5586 _ 09. D0
        mov     edx, eax                                ; 5588 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 558A _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 558D _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 5590 _ 8B. 45, 10
        shr     eax, 24                                 ; 5593 _ C1. E8, 18
        mov     edx, eax                                ; 5596 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 5598 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 559B _ 88. 50, 07
        nop                                             ; 559E _ 90
        pop     ebp                                     ; 559F _ 5D
        ret                                             ; 55A0 _ C3
; set_segmdesc End of function

get_taskctl:; Function begin
        push    ebp                                     ; 55A1 _ 55
        mov     ebp, esp                                ; 55A2 _ 89. E5
        mov     eax, dword [taskctl]                    ; 55A4 _ A1, 000022E8(d)
        pop     ebp                                     ; 55A9 _ 5D
        ret                                             ; 55AA _ C3
; get_taskctl End of function

init_task_level:; Function begin
        push    ebp                                     ; 55AB _ 55
        mov     ebp, esp                                ; 55AC _ 89. E5
        sub     esp, 16                                 ; 55AE _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 55B1 _ 8B. 0D, 000022E8(d)
        mov     edx, dword [ebp+8H]                     ; 55B7 _ 8B. 55, 08
        mov     eax, edx                                ; 55BA _ 89. D0
        add     eax, eax                                ; 55BC _ 01. C0
        add     eax, edx                                ; 55BE _ 01. D0
        shl     eax, 4                                  ; 55C0 _ C1. E0, 04
        add     eax, ecx                                ; 55C3 _ 01. C8
        add     eax, 8                                  ; 55C5 _ 83. C0, 08
        mov     dword [eax], 0                          ; 55C8 _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 55CE _ 8B. 0D, 000022E8(d)
        mov     edx, dword [ebp+8H]                     ; 55D4 _ 8B. 55, 08
        mov     eax, edx                                ; 55D7 _ 89. D0
        add     eax, eax                                ; 55D9 _ 01. C0
        add     eax, edx                                ; 55DB _ 01. D0
        shl     eax, 4                                  ; 55DD _ C1. E0, 04
        add     eax, ecx                                ; 55E0 _ 01. C8
        add     eax, 12                                 ; 55E2 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 55E5 _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 55EB _ C7. 45, FC, 00000000
        jmp     ?_334                                   ; 55F2 _ EB, 1B

?_333:  mov     edx, dword [taskctl]                    ; 55F4 _ 8B. 15, 000022E8(d)
        mov     eax, dword [ebp-4H]                     ; 55FA _ 8B. 45, FC
        imul    eax, eax, 52                            ; 55FD _ 6B. C0, 34
        add     eax, edx                                ; 5600 _ 01. D0
        add     eax, 16                                 ; 5602 _ 83. C0, 10
        mov     dword [eax], 0                          ; 5605 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 560B _ 83. 45, FC, 01
?_334:  cmp     dword [ebp-4H], 9                       ; 560F _ 83. 7D, FC, 09
        jle     ?_333                                   ; 5613 _ 7E, DF
        leave                                           ; 5615 _ C9
        ret                                             ; 5616 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 5617 _ 55
        mov     ebp, esp                                ; 5618 _ 89. E5
        sub     esp, 40                                 ; 561A _ 83. EC, 28
        call    get_addr_gdt                            ; 561D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 5622 _ 89. 45, F0
        mov     dword [esp+4H], 3048                    ; 5625 _ C7. 44 24, 04, 00000BE8
        mov     eax, dword [ebp+8H]                     ; 562D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5630 _ 89. 04 24
        call    memman_alloc_4k                         ; 5633 _ E8, FFFFFFFC(rel)
        mov     dword [taskctl], eax                    ; 5638 _ A3, 000022E8(d)
        mov     dword [ebp-14H], 0                      ; 563D _ C7. 45, EC, 00000000
        jmp     ?_336                                   ; 5644 _ E9, 0000008C

?_335:  mov     edx, dword [taskctl]                    ; 5649 _ 8B. 15, 000022E8(d)
        mov     eax, dword [ebp-14H]                    ; 564F _ 8B. 45, EC
        imul    eax, eax, 176                           ; 5652 _ 69. C0, 000000B0
        add     eax, edx                                ; 5658 _ 01. D0
        add     eax, 492                                ; 565A _ 05, 000001EC
        mov     dword [eax], 0                          ; 565F _ C7. 00, 00000000
        mov     ecx, dword [taskctl]                    ; 5665 _ 8B. 0D, 000022E8(d)
        mov     eax, dword [ebp-14H]                    ; 566B _ 8B. 45, EC
        add     eax, 7                                  ; 566E _ 83. C0, 07
        lea     edx, [eax*8]                            ; 5671 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 5678 _ 8B. 45, EC
        imul    eax, eax, 176                           ; 567B _ 69. C0, 000000B0
        add     eax, ecx                                ; 5681 _ 01. C8
        add     eax, 488                                ; 5683 _ 05, 000001E8
        mov     dword [eax], edx                        ; 5688 _ 89. 10
        mov     eax, dword [taskctl]                    ; 568A _ A1, 000022E8(d)
        mov     edx, dword [ebp-14H]                    ; 568F _ 8B. 55, EC
        imul    edx, edx, 176                           ; 5692 _ 69. D2, 000000B0
        add     edx, 512                                ; 5698 _ 81. C2, 00000200
        add     eax, edx                                ; 569E _ 01. D0
        add     eax, 20                                 ; 56A0 _ 83. C0, 14
        mov     edx, dword [ebp-14H]                    ; 56A3 _ 8B. 55, EC
        add     edx, 7                                  ; 56A6 _ 83. C2, 07
        lea     ecx, [edx*8]                            ; 56A9 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 56B0 _ 8B. 55, F0
        add     edx, ecx                                ; 56B3 _ 01. CA
        mov     dword [esp+0CH], 137                    ; 56B5 _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 56BD _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 56C1 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 56C9 _ 89. 14 24
        call    set_segmdesc                            ; 56CC _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 56D1 _ 83. 45, EC, 01
?_336:  cmp     dword [ebp-14H], 4                      ; 56D5 _ 83. 7D, EC, 04
        jle     ?_335                                   ; 56D9 _ 0F 8E, FFFFFF6A
        mov     dword [ebp-14H], 0                      ; 56DF _ C7. 45, EC, 00000000
        jmp     ?_338                                   ; 56E6 _ EB, 0F

?_337:  mov     eax, dword [ebp-14H]                    ; 56E8 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 56EB _ 89. 04 24
        call    init_task_level                         ; 56EE _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 56F3 _ 83. 45, EC, 01
?_338:  cmp     dword [ebp-14H], 9                      ; 56F7 _ 83. 7D, EC, 09
        jle     ?_337                                   ; 56FB _ 7E, EB
        call    task_alloc                              ; 56FD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 5702 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 5705 _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 5708 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 570F _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 5712 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 5719 _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 571C _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 5723 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 5726 _ 89. 04 24
        call    task_add                                ; 5729 _ E8, FFFFFFFC(rel)
        call    task_switchsub                          ; 572E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5733 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 5736 _ 8B. 00
        mov     dword [esp], eax                        ; 5738 _ 89. 04 24
        call    load_tr                                 ; 573B _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 5740 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 5745 _ A3, 000022E4(d)
        mov     eax, dword [ebp-0CH]                    ; 574A _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 574D _ 8B. 40, 08
        mov     edx, eax                                ; 5750 _ 89. C2
        mov     eax, dword [task_timer]                 ; 5752 _ A1, 000022E4(d)
        mov     dword [esp+4H], edx                     ; 5757 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 575B _ 89. 04 24
        call    timer_settime                           ; 575E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 5763 _ 8B. 45, F4
        leave                                           ; 5766 _ C9
        ret                                             ; 5767 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 5768 _ 55
        mov     ebp, esp                                ; 5769 _ 89. E5
        sub     esp, 16                                 ; 576B _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 576E _ C7. 45, F8, 00000000
        jmp     ?_341                                   ; 5775 _ E9, 00000105

?_339:  mov     edx, dword [taskctl]                    ; 577A _ 8B. 15, 000022E8(d)
        mov     eax, dword [ebp-8H]                     ; 5780 _ 8B. 45, F8
        imul    eax, eax, 176                           ; 5783 _ 69. C0, 000000B0
        add     eax, edx                                ; 5789 _ 01. D0
        add     eax, 492                                ; 578B _ 05, 000001EC
        mov     eax, dword [eax]                        ; 5790 _ 8B. 00
        test    eax, eax                                ; 5792 _ 85. C0
        jne     ?_340                                   ; 5794 _ 0F 85, 000000E1
        mov     eax, dword [taskctl]                    ; 579A _ A1, 000022E8(d)
        mov     edx, dword [ebp-8H]                     ; 579F _ 8B. 55, F8
        imul    edx, edx, 176                           ; 57A2 _ 69. D2, 000000B0
        add     edx, 480                                ; 57A8 _ 81. C2, 000001E0
        add     eax, edx                                ; 57AE _ 01. D0
        add     eax, 8                                  ; 57B0 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 57B3 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 57B6 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 57B9 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 57C0 _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 57C3 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 57CA _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 57CD _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 57D4 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 57D7 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 57DE _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 57E1 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 57E8 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 57EB _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 57F2 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 57F5 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-8H]                     ; 57FC _ 8B. 45, F8
        add     eax, 1                                  ; 57FF _ 83. C0, 01
        shl     eax, 9                                  ; 5802 _ C1. E0, 09
        mov     edx, eax                                ; 5805 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 5807 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 580A _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 580D _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 5810 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 5817 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 581A _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 5821 _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 5824 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 582B _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 582E _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 5838 _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 583B _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 5845 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 5848 _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 5852 _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 5855 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 585C _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 585F _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 5869 _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 586C _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 5876 _ 8B. 45, FC
        jmp     ?_342                                   ; 5879 _ EB, 13

?_340:  add     dword [ebp-8H], 1                       ; 587B _ 83. 45, F8, 01
?_341:  cmp     dword [ebp-8H], 4                       ; 587F _ 83. 7D, F8, 04
        jle     ?_339                                   ; 5883 _ 0F 8E, FFFFFEF1
        mov     eax, 0                                  ; 5889 _ B8, 00000000
?_342:  leave                                           ; 588E _ C9
        ret                                             ; 588F _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 5890 _ 55
        mov     ebp, esp                                ; 5891 _ 89. E5
        sub     esp, 24                                 ; 5893 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 5896 _ 83. 7D, 0C, 00
        jns     ?_343                                   ; 589A _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 589C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 589F _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 58A2 _ 89. 45, 0C
?_343:  cmp     dword [ebp+10H], 0                      ; 58A5 _ 83. 7D, 10, 00
        jle     ?_344                                   ; 58A9 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 58AB _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 58AE _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 58B1 _ 89. 50, 08
?_344:  mov     eax, dword [ebp+8H]                     ; 58B4 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 58B7 _ 8B. 40, 04
        cmp     eax, 2                                  ; 58BA _ 83. F8, 02
        jnz     ?_345                                   ; 58BD _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 58BF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 58C2 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 58C5 _ 3B. 45, 0C
        jz      ?_345                                   ; 58C8 _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 58CA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 58CD _ 89. 04 24
        call    task_remove                             ; 58D0 _ E8, FFFFFFFC(rel)
?_345:  mov     eax, dword [ebp+8H]                     ; 58D5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 58D8 _ 8B. 40, 04
        cmp     eax, 2                                  ; 58DB _ 83. F8, 02
        jz      ?_346                                   ; 58DE _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 58E0 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 58E3 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 58E6 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 58E9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 58EC _ 89. 04 24
        call    task_add                                ; 58EF _ E8, FFFFFFFC(rel)
?_346:  mov     eax, dword [taskctl]                    ; 58F4 _ A1, 000022E8(d)
        mov     dword [eax+4H], 1                       ; 58F9 _ C7. 40, 04, 00000001
        nop                                             ; 5900 _ 90
        leave                                           ; 5901 _ C9
        ret                                             ; 5902 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 5903 _ 55
        mov     ebp, esp                                ; 5904 _ 89. E5
        sub     esp, 40                                 ; 5906 _ 83. EC, 28
        mov     ecx, dword [taskctl]                    ; 5909 _ 8B. 0D, 000022E8(d)
        mov     eax, dword [taskctl]                    ; 590F _ A1, 000022E8(d)
        mov     edx, dword [eax]                        ; 5914 _ 8B. 10
        mov     eax, edx                                ; 5916 _ 89. D0
        add     eax, eax                                ; 5918 _ 01. C0
        add     eax, edx                                ; 591A _ 01. D0
        shl     eax, 4                                  ; 591C _ C1. E0, 04
        add     eax, ecx                                ; 591F _ 01. C8
        add     eax, 8                                  ; 5921 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 5924 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 5927 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 592A _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 592D _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 5930 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 5934 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 5937 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 593A _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 593D _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 5940 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 5943 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5946 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5949 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 594C _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 594F _ 8B. 00
        cmp     edx, eax                                ; 5951 _ 39. C2
        jnz     ?_347                                   ; 5953 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 5955 _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 5958 _ C7. 40, 04, 00000000
?_347:  mov     eax, dword [taskctl]                    ; 595F _ A1, 000022E8(d)
        mov     eax, dword [eax+4H]                     ; 5964 _ 8B. 40, 04
        test    eax, eax                                ; 5967 _ 85. C0
        jz      ?_348                                   ; 5969 _ 74, 23
        call    task_switchsub                          ; 596B _ E8, FFFFFFFC(rel)
        mov     ecx, dword [taskctl]                    ; 5970 _ 8B. 0D, 000022E8(d)
        mov     eax, dword [taskctl]                    ; 5976 _ A1, 000022E8(d)
        mov     edx, dword [eax]                        ; 597B _ 8B. 10
        mov     eax, edx                                ; 597D _ 89. D0
        add     eax, eax                                ; 597F _ 01. C0
        add     eax, edx                                ; 5981 _ 01. D0
        shl     eax, 4                                  ; 5983 _ C1. E0, 04
        add     eax, ecx                                ; 5986 _ 01. C8
        add     eax, 8                                  ; 5988 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 598B _ 89. 45, EC
?_348:  mov     eax, dword [ebp-14H]                    ; 598E _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 5991 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 5994 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 5997 _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 599B _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 599E _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 59A1 _ 8B. 40, 08
        mov     edx, eax                                ; 59A4 _ 89. C2
        mov     eax, dword [task_timer]                 ; 59A6 _ A1, 000022E4(d)
        mov     dword [esp+4H], edx                     ; 59AB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 59AF _ 89. 04 24
        call    timer_settime                           ; 59B2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 59B7 _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 59BA _ 3B. 45, F0
        jz      ?_349                                   ; 59BD _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 59BF _ 83. 7D, F4, 00
        jz      ?_349                                   ; 59C3 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 59C5 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 59C8 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 59CA _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 59CE _ C7. 04 24, 00000000
        call    farjmp                                  ; 59D5 _ E8, FFFFFFFC(rel)
?_349:  nop                                             ; 59DA _ 90
        leave                                           ; 59DB _ C9
        ret                                             ; 59DC _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 59DD _ 55
        mov     ebp, esp                                ; 59DE _ 89. E5
        sub     esp, 40                                 ; 59E0 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 59E3 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 59EA _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 59F1 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 59F4 _ 8B. 40, 04
        cmp     eax, 2                                  ; 59F7 _ 83. F8, 02
        jnz     ?_350                                   ; 59FA _ 75, 51
        call    task_now                                ; 59FC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 5A01 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 5A04 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5A07 _ 89. 04 24
        call    task_remove                             ; 5A0A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 5A0F _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 5A16 _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 5A19 _ 3B. 45, F4
        jnz     ?_350                                   ; 5A1C _ 75, 2F
        call    task_switchsub                          ; 5A1E _ E8, FFFFFFFC(rel)
        call    task_now                                ; 5A23 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 5A28 _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 5A2B _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 5A32 _ 83. 7D, F4, 00
        jz      ?_350                                   ; 5A36 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 5A38 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 5A3B _ 8B. 00
        mov     dword [esp+4H], eax                     ; 5A3D _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 5A41 _ C7. 04 24, 00000000
        call    farjmp                                  ; 5A48 _ E8, FFFFFFFC(rel)
?_350:  mov     eax, dword [ebp-10H]                    ; 5A4D _ 8B. 45, F0
        leave                                           ; 5A50 _ C9
        ret                                             ; 5A51 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 5A52 _ 55
        mov     ebp, esp                                ; 5A53 _ 89. E5
        sub     esp, 16                                 ; 5A55 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5A58 _ 8B. 0D, 000022E8(d)
        mov     eax, dword [taskctl]                    ; 5A5E _ A1, 000022E8(d)
        mov     edx, dword [eax]                        ; 5A63 _ 8B. 10
        mov     eax, edx                                ; 5A65 _ 89. D0
        add     eax, eax                                ; 5A67 _ 01. C0
        add     eax, edx                                ; 5A69 _ 01. D0
        shl     eax, 4                                  ; 5A6B _ C1. E0, 04
        add     eax, ecx                                ; 5A6E _ 01. C8
        add     eax, 8                                  ; 5A70 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5A73 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 5A76 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 5A79 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 5A7C _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 5A7F _ 8B. 44 90, 08
        leave                                           ; 5A83 _ C9
        ret                                             ; 5A84 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 5A85 _ 55
        mov     ebp, esp                                ; 5A86 _ 89. E5
        sub     esp, 16                                 ; 5A88 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5A8B _ 8B. 0D, 000022E8(d)
        mov     eax, dword [ebp+8H]                     ; 5A91 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5A94 _ 8B. 50, 0C
        mov     eax, edx                                ; 5A97 _ 89. D0
        add     eax, eax                                ; 5A99 _ 01. C0
        add     eax, edx                                ; 5A9B _ 01. D0
        shl     eax, 4                                  ; 5A9D _ C1. E0, 04
        add     eax, ecx                                ; 5AA0 _ 01. C8
        add     eax, 8                                  ; 5AA2 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5AA5 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 5AA8 _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 5AAB _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 5AAD _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 5AB0 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 5AB3 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 5AB7 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5ABA _ 8B. 00
        lea     edx, [eax+1H]                           ; 5ABC _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 5ABF _ 8B. 45, FC
        mov     dword [eax], edx                        ; 5AC2 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 5AC4 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 5AC7 _ C7. 40, 04, 00000002
        nop                                             ; 5ACE _ 90
        leave                                           ; 5ACF _ C9
        ret                                             ; 5AD0 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 5AD1 _ 55
        mov     ebp, esp                                ; 5AD2 _ 89. E5
        sub     esp, 16                                 ; 5AD4 _ 83. EC, 10
        mov     ecx, dword [taskctl]                    ; 5AD7 _ 8B. 0D, 000022E8(d)
        mov     eax, dword [ebp+8H]                     ; 5ADD _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 5AE0 _ 8B. 50, 0C
        mov     eax, edx                                ; 5AE3 _ 89. D0
        add     eax, eax                                ; 5AE5 _ 01. C0
        add     eax, edx                                ; 5AE7 _ 01. D0
        shl     eax, 4                                  ; 5AE9 _ C1. E0, 04
        add     eax, ecx                                ; 5AEC _ 01. C8
        add     eax, 8                                  ; 5AEE _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 5AF1 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 5AF4 _ C7. 45, F8, 00000000
        jmp     ?_353                                   ; 5AFB _ EB, 23

?_351:  mov     eax, dword [ebp-4H]                     ; 5AFD _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 5B00 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 5B03 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 5B07 _ 3B. 45, 08
        jnz     ?_352                                   ; 5B0A _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 5B0C _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 5B0F _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 5B12 _ C7. 44 90, 08, 00000000
        jmp     ?_354                                   ; 5B1A _ EB, 0E

?_352:  add     dword [ebp-8H], 1                       ; 5B1C _ 83. 45, F8, 01
?_353:  mov     eax, dword [ebp-4H]                     ; 5B20 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5B23 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 5B25 _ 3B. 45, F8
        jg      ?_351                                   ; 5B28 _ 7F, D3
?_354:  mov     eax, dword [ebp-4H]                     ; 5B2A _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5B2D _ 8B. 00
        lea     edx, [eax-1H]                           ; 5B2F _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 5B32 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 5B35 _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 5B37 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 5B3A _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 5B3D _ 3B. 45, F8
        jle     ?_355                                   ; 5B40 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 5B42 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 5B45 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 5B48 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 5B4B _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 5B4E _ 89. 50, 04
?_355:  mov     eax, dword [ebp-4H]                     ; 5B51 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 5B54 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 5B57 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5B5A _ 8B. 00
        cmp     edx, eax                                ; 5B5C _ 39. C2
        jl      ?_356                                   ; 5B5E _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 5B60 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 5B63 _ C7. 40, 04, 00000000
?_356:  mov     eax, dword [ebp+8H]                     ; 5B6A _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 5B6D _ C7. 40, 04, 00000001
        jmp     ?_358                                   ; 5B74 _ EB, 1B

?_357:  mov     eax, dword [ebp-8H]                     ; 5B76 _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 5B79 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 5B7C _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 5B7F _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 5B83 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 5B86 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 5B89 _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 5B8D _ 83. 45, F8, 01
?_358:  mov     eax, dword [ebp-4H]                     ; 5B91 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 5B94 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 5B96 _ 3B. 45, F8
        jg      ?_357                                   ; 5B99 _ 7F, DB
        nop                                             ; 5B9B _ 90
        leave                                           ; 5B9C _ C9
        ret                                             ; 5B9D _ C3
; task_remove End of function

task_switchsub:; Function begin
        push    ebp                                     ; 5B9E _ 55
        mov     ebp, esp                                ; 5B9F _ 89. E5
        sub     esp, 16                                 ; 5BA1 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 5BA4 _ C7. 45, FC, 00000000
        jmp     ?_361                                   ; 5BAB _ EB, 23

?_359:  mov     ecx, dword [taskctl]                    ; 5BAD _ 8B. 0D, 000022E8(d)
        mov     edx, dword [ebp-4H]                     ; 5BB3 _ 8B. 55, FC
        mov     eax, edx                                ; 5BB6 _ 89. D0
        add     eax, eax                                ; 5BB8 _ 01. C0
        add     eax, edx                                ; 5BBA _ 01. D0
        shl     eax, 4                                  ; 5BBC _ C1. E0, 04
        add     eax, ecx                                ; 5BBF _ 01. C8
        add     eax, 8                                  ; 5BC1 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 5BC4 _ 8B. 00
        test    eax, eax                                ; 5BC6 _ 85. C0
        jle     ?_360                                   ; 5BC8 _ 7E, 02
        jmp     ?_362                                   ; 5BCA _ EB, 0A

?_360:  add     dword [ebp-4H], 1                       ; 5BCC _ 83. 45, FC, 01
?_361:  cmp     dword [ebp-4H], 9                       ; 5BD0 _ 83. 7D, FC, 09
        jle     ?_359                                   ; 5BD4 _ 7E, D7
?_362:  mov     eax, dword [taskctl]                    ; 5BD6 _ A1, 000022E8(d)
        mov     edx, dword [ebp-4H]                     ; 5BDB _ 8B. 55, FC
        mov     dword [eax], edx                        ; 5BDE _ 89. 10
        mov     eax, dword [taskctl]                    ; 5BE0 _ A1, 000022E8(d)
        mov     dword [eax+4H], 0                       ; 5BE5 _ C7. 40, 04, 00000000
        leave                                           ; 5BEC _ C9
        ret                                             ; 5BED _ C3
; task_switchsub End of function

send_message:; Function begin
        push    ebp                                     ; 5BEE _ 55
        mov     ebp, esp                                ; 5BEF _ 89. E5
        sub     esp, 24                                 ; 5BF1 _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 5BF4 _ 8B. 45, 10
        movzx   eax, al                                 ; 5BF7 _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 5BFA _ 8B. 55, 0C
        add     edx, 16                                 ; 5BFD _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 5C00 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 5C04 _ 89. 14 24
        call    fifo8_put                               ; 5C07 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 5C0C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5C0F _ 89. 04 24
        call    task_sleep                              ; 5C12 _ E8, FFFFFFFC(rel)
        leave                                           ; 5C17 _ C9
        ret                                             ; 5C18 _ C3
; send_message End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_363:                                                  ; byte
        db 63H, 6FH, 75H, 6EH, 74H, 65H, 72H, 00H       ; 0000 _ counter.

?_364:                                                  ; byte
        db 6BH, 69H, 6CH, 6CH, 20H, 70H, 72H, 6FH       ; 0008 _ kill pro
        db 63H, 65H, 73H, 73H, 00H                      ; 0010 _ cess.

?_365:                                                  ; byte
        db 74H, 61H, 73H, 6BH, 5FH, 61H, 00H            ; 0015 _ task_a.

?_366:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 001C _ console.

?_367:                                                  ; byte
        db 20H, 00H                                     ; 0024 _  .

?_368:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0026 _ free .

?_369:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 002C _  KB.

?_370:                                                  ; byte
        db 3EH, 00H                                     ; 0030 _ >.

?_371:                                                  ; byte
        db 68H, 6CH, 74H, 2EH, 65H, 78H, 65H, 00H       ; 0032 _ hlt.exe.

?_372:                                                  ; byte
        db 70H, 61H, 75H, 73H, 65H, 00H                 ; 003A _ pause.

?_373:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 0040 _ mem.

?_374:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 0044 _ cls.

?_375:                                                  ; byte
        db 68H, 6CH, 74H, 00H                           ; 0048 _ hlt.

?_376:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 004C _ dir.

?_377:                                                  ; byte
        db 6BH, 65H, 79H, 62H, 6FH, 61H, 72H, 64H       ; 0050 _ keyboard
        db 00H                                          ; 0058 _ .

?_378:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0059 _ page is:
        db 20H, 00H                                     ; 0061 _  .

?_379:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0063 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 006B _ L: .

?_380:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 006F _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0077 _ H: .

?_381:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 007B _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0083 _ w: .

?_382:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 4FH, 43H, 00H            ; 0087 _ INT OC.

?_383:                                                  ; byte
        db 53H, 74H, 61H, 63H, 6BH, 20H, 45H, 78H       ; 008E _ Stack Ex
        db 63H, 65H, 70H, 74H, 69H, 6FH, 6EH, 00H       ; 0096 _ ception.

?_384:                                                  ; byte
        db 45H, 49H, 50H, 20H, 3DH, 20H, 00H            ; 009E _ EIP = .

?_385:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 30H, 44H, 20H, 00H       ; 00A5 _ INT 0D .

?_386:                                                  ; byte
        db 47H, 65H, 6EH, 65H, 72H, 61H, 6CH, 20H       ; 00AD _ General 
        db 50H, 72H, 6FH, 74H, 65H, 63H, 74H, 65H       ; 00B5 _ Protecte
        db 64H, 20H, 45H, 78H, 63H, 65H, 70H, 74H       ; 00BD _ d Except
        db 69H, 6FH, 6EH, 00H                           ; 00C5 _ ion.


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

?_387:  db 00H                                          ; 0112 _ .

?_388:  db 00H, 00H, 00H, 00H, 00H                      ; 0113 _ .....

mmx:    dd 0FFFFFFFFH                                   ; 0118 _ -1 

mmy:    dd 0FFFFFFFFH                                   ; 011C _ -1 

KEY_CONTROL:                                            ; dword
        dd 0000001DH, 00000000H                         ; 0120 _ 29 0 
        dd 00000000H, 00000000H                         ; 0128 _ 0 0 
        dd 00000000H, 00000000H                         ; 0130 _ 0 0 
        dd 00000000H, 00000000H                         ; 0138 _ 0 0 

table_rgb.2069:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0140 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0148 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0150 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0158 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0160 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0168 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0170 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0178 _ ........

cursor.2129:                                            ; byte
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

closebtn.2248:                                          ; byte
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

current_console:                                        ; dword
        resd    1                                       ; 000C

bootInfo:                                               ; qword
        resb    4                                       ; 0010

?_389:  resw    1                                       ; 0014

?_390:  resw    1                                       ; 0016

keyinfo:                                                ; byte
        resb    24                                      ; 0018

?_391:  resd    1                                       ; 0030

mouseinfo:                                              ; byte
        resb    44                                      ; 0034

keybuf:                                                 ; yword
        resb    32                                      ; 0060

mousebuf:                                               ; byte
        resb    128                                     ; 0080

mdec:                                                   ; oword
        resb    12                                      ; 0100

?_392:  resd    1                                       ; 010C

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

task_cons:                                              ; qword
        resq    1                                       ; 0274

task_main:                                              ; dword
        resd    1                                       ; 027C

task_a.1809:                                            ; dword
        resd    8                                       ; 0280

tss_a.1808:                                             ; byte
        resb    128                                     ; 02A0

tss_b.1807:                                             ; byte
        resb    104                                     ; 0320

task_b.1797:                                            ; byte
        resb    12                                      ; 0388

str.2177:                                               ; byte
        resb    1                                       ; 0394

?_393:  resb    9                                       ; 0395

?_394:  resb    2                                       ; 039E

timerctl:                                               ; byte
        resd    2001                                    ; 03A0

task_timer:                                             ; dword
        resd    1                                       ; 22E4

taskctl: resd   1                                       ; 22E8


