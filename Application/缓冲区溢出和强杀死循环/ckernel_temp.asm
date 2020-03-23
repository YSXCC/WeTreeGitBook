; Disassembly of file: ckernel.o
; Mon Mar 23 11:39:56 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro


global CMain: function
global task_b_main: function
global init_screeninfo: function
global init_palette: function
global set_palette: function
global paint_rectangle: function
global init_desktop: function
global init_mouse_position: function
global paint_font: function
global paint_string: function
global init_mouse_cursor: function
global paint_block: function
global init_fifo_buf: function
global compute_mouse_position: function
global show_mouse_info: function
global show_memory_info: function
global message_box: function
global make_textbox: function
global make_windows: function
global make_window_title: function
global transfer_scancode: function
global is_special_key: function
global console_task: function
global command_mem: function
global command_cls: function
global command_dir: function
global command_type: function
global command_hlt: function
global launch_console: function
global set_cursor: function
global console_new_line: function
global strcmp: function
global c_console_putchar: function
global c_console_putstr: function
global kernel_api: function
global intHandlerException: function
global intHandlerStackOverflow: function
global kill_process: function
global wait_KBC_sendready: function
global init_keyboard: function
global enable_mouse: function
global mouse_decode: function
global intHandlerKeyboard: function
global intHandlerMouse: function
global fifo8_init: function
global fifo8_put: function
global fifo8_get: function
global fifo8_status: function
global charToHexVal: function
global charToHexStr: function
global intToHexStr: function
global memman_init: function
global memman_total: function
global memman_alloc: function
global memman_free: function
global memman_alloc_4k: function
global memman_free_4k: function
global sheet_control_init: function
global sheet_alloc: function
global sheet_setbuf: function
global sheet_updown: function
global sheet_refresh: function
global sheet_slide: function
global sheet_refresh_local: function
global sheet_refresh_map: function
global init_time_port: function
global get_timer_control: function
global timer_alloc: function
global timer_free: function
global timer_init: function
global timer_settime: function
global intHandlerTimer: function
global segment_descriptor: function
global init_task_level: function
global task_init: function
global task_alloc: function
global task_run: function
global task_switch: function
global task_sleep: function
global task_now: function
global task_add: function
global task_remove: function
global task_switch_sub: function
global task_send_message: function
global file_load_content: function

extern task_timer                                       ; dword
extern mouse_y                                          ; dword
extern keyinfo                                          ; dword
extern task_main                                        ; dword
extern memman                                           ; dword
extern back_buf                                         ; dword
extern io_out8                                          ; near
extern mouse_send_info                                  ; dword
extern start_app                                        ; near
extern io_sti                                           ; near
extern load_tr                                          ; near
extern farjmp                                           ; near
extern get_code32_addr                                  ; near
extern keybuf                                           ; byte
extern asm_end_app                                      ; near
extern io_store_eflags                                  ; near
extern mouse_cursor_buf                                 ; byte
extern get_addr_gdt                                     ; near
extern io_cli                                           ; near
extern sheet_control                                    ; dword
extern screen_info                                      ; dword
extern key_shift                                        ; dword
extern io_in8                                           ; near
extern VRAM_ADDRESS                                     ; dword
extern task_console_g                                   ; dword
extern mouseinfo                                        ; byte
extern systemFont                                       ; byte
extern sheet_win                                        ; dword
extern io_load_eflags                                   ; near
extern mouse_x                                          ; dword
extern mousebuf                                         ; byte


SECTION .text   align=1 execute                         ; section number 1, code

CMain:  ; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        push    ebx                                     ; 0003 _ 53
        sub     esp, 132                                ; 0004 _ 81. EC, 00000084
        mov     dword [esp], screen_info                ; 000A _ C7. 04 24, 00000000(d)
        call    init_screeninfo                         ; 0011 _ E8, FFFFFFFC(rel)
        mov     eax, dword [screen_info]                ; 0016 _ A1, 00000000(d)
        mov     dword [ebp-4CH], eax                    ; 001B _ 89. 45, B4
        movzx   eax, word [screen_info+4H]              ; 001E _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0025 _ 98
        mov     dword [ebp-48H], eax                    ; 0026 _ 89. 45, B8
        movzx   eax, word [screen_info+6H]              ; 0029 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0030 _ 98
        mov     dword [ebp-44H], eax                    ; 0031 _ 89. 45, BC
        mov     eax, dword [memman]                     ; 0034 _ A1, 00000004(d)
        mov     dword [esp], eax                        ; 0039 _ 89. 04 24
        call    memman_init                             ; 003C _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 0041 _ A1, 00000004(d)
        mov     dword [esp+8H], 1072594944              ; 0046 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 17301504                ; 004E _ C7. 44 24, 04, 01080000
        mov     dword [esp], eax                        ; 0056 _ 89. 04 24
        call    memman_free                             ; 0059 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 005E _ A1, 00000004(d)
        mov     edx, dword [ebp-44H]                    ; 0063 _ 8B. 55, BC
        mov     dword [esp+0CH], edx                    ; 0066 _ 89. 54 24, 0C
        mov     edx, dword [ebp-48H]                    ; 006A _ 8B. 55, B8
        mov     dword [esp+8H], edx                     ; 006D _ 89. 54 24, 08
        mov     edx, dword [ebp-4CH]                    ; 0071 _ 8B. 55, B4
        mov     dword [esp+4H], edx                     ; 0074 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0078 _ 89. 04 24
        call    sheet_control_init                      ; 007B _ E8, FFFFFFFC(rel)
        mov     dword [sheet_control], eax              ; 0080 _ A3, 0000000C(d)
        mov     eax, dword [sheet_control]              ; 0085 _ A1, 0000000C(d)
        mov     dword [esp], eax                        ; 008A _ 89. 04 24
        call    sheet_alloc                             ; 008D _ E8, FFFFFFFC(rel)
        mov     dword [back_sheet], eax                 ; 0092 _ A3, 00000010(d)
        mov     eax, dword [sheet_control]              ; 0097 _ A1, 0000000C(d)
        mov     dword [esp], eax                        ; 009C _ 89. 04 24
        call    sheet_alloc                             ; 009F _ E8, FFFFFFFC(rel)
        mov     dword [mouse_sheet], eax                ; 00A4 _ A3, 00000014(d)
        mov     eax, dword [ebp-48H]                    ; 00A9 _ 8B. 45, B8
        imul    eax, dword [ebp-44H]                    ; 00AC _ 0F AF. 45, BC
        mov     edx, eax                                ; 00B0 _ 89. C2
        mov     eax, dword [memman]                     ; 00B2 _ A1, 00000004(d)
        mov     dword [esp+4H], edx                     ; 00B7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00BB _ 89. 04 24
        call    memman_alloc_4k                         ; 00BE _ E8, FFFFFFFC(rel)
        mov     dword [back_buf], eax                   ; 00C3 _ A3, 00000000(d)
        mov     edx, dword [back_buf]                   ; 00C8 _ 8B. 15, 00000000(d)
        mov     eax, dword [back_sheet]                 ; 00CE _ A1, 00000010(d)
        mov     dword [esp+10H], 99                     ; 00D3 _ C7. 44 24, 10, 00000063
        mov     ecx, dword [ebp-44H]                    ; 00DB _ 8B. 4D, BC
        mov     dword [esp+0CH], ecx                    ; 00DE _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-48H]                    ; 00E2 _ 8B. 4D, B8
        mov     dword [esp+8H], ecx                     ; 00E5 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 00E9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00ED _ 89. 04 24
        call    sheet_setbuf                            ; 00F0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_sheet]                ; 00F5 _ A1, 00000014(d)
        mov     dword [esp+10H], 99                     ; 00FA _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 16                     ; 0102 _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 16                      ; 010A _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], mouse_cursor_buf        ; 0112 _ C7. 44 24, 04, 00000000(d)
        mov     dword [esp], eax                        ; 011A _ 89. 04 24
        call    sheet_setbuf                            ; 011D _ E8, FFFFFFFC(rel)
        call    init_mouse_position                     ; 0122 _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 0127 _ E8, FFFFFFFC(rel)
        call    init_fifo_buf                           ; 012C _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 0131 _ E8, FFFFFFFC(rel)
        call    get_timer_control                       ; 0136 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-40H], eax                    ; 013B _ 89. 45, C0
        call    init_time_port                          ; 013E _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0143 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf1.1803          ; 014B _ C7. 44 24, 08, 00000034(d)
        mov     dword [esp+4H], 8                       ; 0153 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1800            ; 015B _ C7. 04 24, 00000018(d)
        call    fifo8_init                              ; 0162 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0167 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-3CH], eax                    ; 016C _ 89. 45, C4
        mov     dword [esp+8H], 1                       ; 016F _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1800         ; 0177 _ C7. 44 24, 04, 00000018(d)
        mov     eax, dword [ebp-3CH]                    ; 017F _ 8B. 45, C4
        mov     dword [esp], eax                        ; 0182 _ 89. 04 24
        call    timer_init                              ; 0185 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 018A _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-3CH]                    ; 0192 _ 8B. 45, C4
        mov     dword [esp], eax                        ; 0195 _ 89. 04 24
        call    timer_settime                           ; 0198 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 019D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf2.1804          ; 01A5 _ C7. 44 24, 08, 00000058(d)
        mov     dword [esp+4H], 8                       ; 01AD _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1801            ; 01B5 _ C7. 04 24, 0000003C(d)
        call    fifo8_init                              ; 01BC _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01C1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 01C6 _ 89. 45, C8
        mov     dword [esp+8H], 1                       ; 01C9 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1801         ; 01D1 _ C7. 44 24, 04, 0000003C(d)
        mov     eax, dword [ebp-38H]                    ; 01D9 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 01DC _ 89. 04 24
        call    timer_init                              ; 01DF _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01E4 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-38H]                    ; 01EC _ 8B. 45, C8
        mov     dword [esp], eax                        ; 01EF _ 89. 04 24
        call    timer_settime                           ; 01F2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 01F7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf3.1805          ; 01FF _ C7. 44 24, 08, 0000007C(d)
        mov     dword [esp+4H], 8                       ; 0207 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1802            ; 020F _ C7. 04 24, 00000060(d)
        call    fifo8_init                              ; 0216 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 021B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 0220 _ 89. 45, CC
        mov     dword [esp+8H], 1                       ; 0223 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1802         ; 022B _ C7. 44 24, 04, 00000060(d)
        mov     eax, dword [ebp-34H]                    ; 0233 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0236 _ 89. 04 24
        call    timer_init                              ; 0239 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 023E _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-34H]                    ; 0246 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0249 _ 89. 04 24
        call    timer_settime                           ; 024C _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 0251 _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 0256 _ A1, 00000000(d)
        mov     edx, dword [ebp-44H]                    ; 025B _ 8B. 55, BC
        mov     dword [esp+8H], edx                     ; 025E _ 89. 54 24, 08
        mov     edx, dword [ebp-48H]                    ; 0262 _ 8B. 55, B8
        mov     dword [esp+4H], edx                     ; 0265 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0269 _ 89. 04 24
        call    init_desktop                            ; 026C _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 99                      ; 0271 _ C7. 44 24, 04, 00000063
        mov     dword [esp], mouse_cursor_buf           ; 0279 _ C7. 04 24, 00000000(d)
        call    init_mouse_cursor                       ; 0280 _ E8, FFFFFFFC(rel)
        mov     edx, dword [back_sheet]                 ; 0285 _ 8B. 15, 00000010(d)
        mov     eax, dword [sheet_control]              ; 028B _ A1, 0000000C(d)
        mov     dword [esp+0CH], 0                      ; 0290 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0298 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 02A0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 02A4 _ 89. 04 24
        call    sheet_slide                             ; 02A7 _ E8, FFFFFFFC(rel)
        mov     ebx, dword [mouse_y]                    ; 02AC _ 8B. 1D, 00000000(d)
        mov     ecx, dword [mouse_x]                    ; 02B2 _ 8B. 0D, 00000000(d)
        mov     edx, dword [mouse_sheet]                ; 02B8 _ 8B. 15, 00000014(d)
        mov     eax, dword [sheet_control]              ; 02BE _ A1, 0000000C(d)
        mov     dword [esp+0CH], ebx                    ; 02C3 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 02C7 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 02CB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 02CF _ 89. 04 24
        call    sheet_slide                             ; 02D2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 02D7 _ A1, 0000000C(d)
        mov     dword [esp+4H], ?_306                   ; 02DC _ C7. 44 24, 04, 00000000(d)
        mov     dword [esp], eax                        ; 02E4 _ 89. 04 24
        call    message_box                             ; 02E7 _ E8, FFFFFFFC(rel)
        mov     dword [sheet_win], eax                  ; 02EC _ A3, 00000000(d)
        mov     edx, dword [back_sheet]                 ; 02F1 _ 8B. 15, 00000010(d)
        mov     eax, dword [sheet_control]              ; 02F7 _ A1, 0000000C(d)
        mov     dword [esp+8H], 0                       ; 02FC _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0304 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0308 _ 89. 04 24
        call    sheet_updown                            ; 030B _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_sheet]                ; 0310 _ 8B. 15, 00000014(d)
        mov     eax, dword [sheet_control]              ; 0316 _ A1, 0000000C(d)
        mov     dword [esp+8H], 100                     ; 031B _ C7. 44 24, 08, 00000064
        mov     dword [esp+4H], edx                     ; 0323 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0327 _ 89. 04 24
        call    sheet_updown                            ; 032A _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 032F _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 0334 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0339 _ 89. 45, D0
        call    get_addr_gdt                            ; 033C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 0341 _ 89. 45, D4
        mov     eax, dword [memman]                     ; 0344 _ A1, 00000004(d)
        mov     dword [esp], eax                        ; 0349 _ 89. 04 24
        call    task_init                               ; 034C _ E8, FFFFFFFC(rel)
        mov     dword [task_a], eax                     ; 0351 _ A3, 00000008(d)
        mov     eax, dword [task_a]                     ; 0356 _ A1, 00000008(d)
        mov     dword [keyinfo+18H], eax                ; 035B _ A3, 00000018(d)
        mov     eax, dword [task_a]                     ; 0360 _ A1, 00000008(d)
        mov     dword [task_main], eax                  ; 0365 _ A3, 00000004(d)
        mov     eax, dword [task_a]                     ; 036A _ A1, 00000008(d)
        mov     dword [esp+8H], 0                       ; 036F _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], 0                       ; 0377 _ C7. 44 24, 04, 00000000
        mov     dword [esp], eax                        ; 037F _ 89. 04 24
        call    task_run                                ; 0382 _ E8, FFFFFFFC(rel)
        call    launch_console                          ; 0387 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 038C _ 89. 45, D8
        mov     dword [ebp-24H], 0                      ; 038F _ C7. 45, DC, 00000000
        mov     dword [ebp-20H], 0                      ; 0396 _ C7. 45, E0, 00000000
        mov     dword [ebp-1CH], 0                      ; 039D _ C7. 45, E4, 00000000
        mov     dword [ebp-5CH], 8                      ; 03A4 _ C7. 45, A4, 00000008
        mov     dword [ebp-58H], 7                      ; 03AB _ C7. 45, A8, 00000007
        mov     dword [ebp-18H], 0                      ; 03B2 _ C7. 45, E8, 00000000
        mov     dword [ebp-54H], 0                      ; 03B9 _ C7. 45, AC, 00000000
        mov     dword [ebp-14H], 0                      ; 03C0 _ C7. 45, EC, 00000000
?_001:  call    io_cli                                  ; 03C7 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 03CC _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 03D3 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 03D8 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 03DA _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 03E1 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03E6 _ 01. C3
        mov     dword [esp], timerinfo1.1800            ; 03E8 _ C7. 04 24, 00000018(d)
        call    fifo8_status                            ; 03EF _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03F4 _ 01. C3
        mov     dword [esp], timerinfo2.1801            ; 03F6 _ C7. 04 24, 0000003C(d)
        call    fifo8_status                            ; 03FD _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0402 _ 01. C3
        mov     dword [esp], timerinfo3.1802            ; 0404 _ C7. 04 24, 00000060(d)
        call    fifo8_status                            ; 040B _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 0410 _ 01. D8
        test    eax, eax                                ; 0412 _ 85. C0
        jnz     ?_002                                   ; 0414 _ 75, 0A
        call    io_sti                                  ; 0416 _ E8, FFFFFFFC(rel)
        jmp     ?_011                                   ; 041B _ E9, 000003D1

?_002:  mov     dword [esp], keyinfo                    ; 0420 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0427 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 042C _ 85. C0
        je      ?_008                                   ; 042E _ 0F 84, 00000346
        call    io_sti                                  ; 0434 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0439 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0440 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 0445 _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 0448 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 044B _ 89. 04 24
        call    transfer_scancode                       ; 044E _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-24H], 29                     ; 0453 _ 83. 7D, DC, 1D
        jnz     ?_003                                   ; 0457 _ 75, 43
        mov     eax, dword [key_shift]                  ; 0459 _ A1, 00000000(d)
        test    eax, eax                                ; 045E _ 85. C0
        jz      ?_003                                   ; 0460 _ 74, 3A
        mov     eax, dword [task_console_g]             ; 0462 _ A1, 00000000(d)
        mov     eax, dword [eax+34H]                    ; 0467 _ 8B. 40, 34
        test    eax, eax                                ; 046A _ 85. C0
        jz      ?_003                                   ; 046C _ 74, 2E
        mov     dword [esp], ?_307                      ; 046E _ C7. 04 24, 00000007(d)
        call    c_console_putstr                        ; 0475 _ E8, FFFFFFFC(rel)
        call    io_cli                                  ; 047A _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 047F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0484 _ 89. 45, F0
        mov     eax, dword [task_console_g]             ; 0487 _ A1, 00000000(d)
        mov     edx, kill_process                       ; 048C _ BA, 00000000(d)
        sub     edx, dword [ebp-10H]                    ; 0491 _ 2B. 55, F0
        mov     dword [eax+4CH], edx                    ; 0494 _ 89. 50, 4C
        call    io_sti                                  ; 0497 _ E8, FFFFFFFC(rel)
?_003:  cmp     dword [ebp-24H], 15                     ; 049C _ 83. 7D, DC, 0F
        jne     ?_006                                   ; 04A0 _ 0F 85, 000001A0
        mov     dword [ebp-50H], -1                     ; 04A6 _ C7. 45, B0, FFFFFFFF
        cmp     dword [ebp-54H], 0                      ; 04AD _ 83. 7D, AC, 00
        jne     ?_004                                   ; 04B1 _ 0F 85, 00000089
        mov     dword [ebp-54H], 1                      ; 04B7 _ C7. 45, AC, 00000001
        mov     edx, dword [sheet_win]                  ; 04BE _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 04C4 _ A1, 0000000C(d)
        mov     dword [esp+0CH], 0                      ; 04C9 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_306                   ; 04D1 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 04D9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04DD _ 89. 04 24
        call    make_window_title                       ; 04E0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 04E5 _ A1, 0000000C(d)
        mov     dword [esp+0CH], 1                      ; 04EA _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_308                   ; 04F2 _ C7. 44 24, 08, 00000014(d)
        mov     edx, dword [ebp-28H]                    ; 04FA _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 04FD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0501 _ 89. 04 24
        call    make_window_title                       ; 0504 _ E8, FFFFFFFC(rel)
        mov     edx, dword [sheet_win]                  ; 0509 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 050F _ A1, 0000000C(d)
        mov     dword [esp+10H], 7                      ; 0514 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 051C _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-5CH]                    ; 0524 _ 8B. 4D, A4
        mov     dword [esp+8H], ecx                     ; 0527 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 052B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 052F _ 89. 04 24
        call    set_cursor                              ; 0532 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-50H], 87                     ; 0537 _ C7. 45, B0, 00000057
        jmp     ?_005                                   ; 053E _ EB, 71

?_004:  mov     dword [ebp-54H], 0                      ; 0540 _ C7. 45, AC, 00000000
        mov     edx, dword [sheet_win]                  ; 0547 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 054D _ A1, 0000000C(d)
        mov     dword [esp+0CH], 1                      ; 0552 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_306                   ; 055A _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 0562 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0566 _ 89. 04 24
        call    make_window_title                       ; 0569 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 056E _ A1, 0000000C(d)
        mov     dword [esp+0CH], 0                      ; 0573 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_308                   ; 057B _ C7. 44 24, 08, 00000014(d)
        mov     edx, dword [ebp-28H]                    ; 0583 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 0586 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 058A _ 89. 04 24
        call    make_window_title                       ; 058D _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_console_g]             ; 0592 _ A1, 00000000(d)
        add     eax, 16                                 ; 0597 _ 83. C0, 10
        mov     dword [esp+4H], 88                      ; 059A _ C7. 44 24, 04, 00000058
        mov     dword [esp], eax                        ; 05A2 _ 89. 04 24
        call    fifo8_put                               ; 05A5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-50H], 88                     ; 05AA _ C7. 45, B0, 00000058
?_005:  mov     eax, dword [sheet_win]                  ; 05B1 _ A1, 00000000(d)
        mov     ebx, dword [eax+8H]                     ; 05B6 _ 8B. 58, 08
        mov     eax, dword [sheet_win]                  ; 05B9 _ A1, 00000000(d)
        mov     ecx, dword [eax+4H]                     ; 05BE _ 8B. 48, 04
        mov     edx, dword [sheet_win]                  ; 05C1 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 05C7 _ A1, 0000000C(d)
        mov     dword [esp+14H], ebx                    ; 05CC _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 05D0 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 05D4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 05DC _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 05E4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05E8 _ 89. 04 24
        call    sheet_refresh                           ; 05EB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-28H]                    ; 05F0 _ 8B. 45, D8
        mov     ecx, dword [eax+8H]                     ; 05F3 _ 8B. 48, 08
        mov     eax, dword [ebp-28H]                    ; 05F6 _ 8B. 45, D8
        mov     edx, dword [eax+4H]                     ; 05F9 _ 8B. 50, 04
        mov     eax, dword [sheet_control]              ; 05FC _ A1, 0000000C(d)
        mov     dword [esp+14H], ecx                    ; 0601 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0605 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 0609 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0611 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-28H]                    ; 0619 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 061C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0620 _ 89. 04 24
        call    sheet_refresh                           ; 0623 _ E8, FFFFFFFC(rel)
        mov     edx, dword [task_console_g]             ; 0628 _ 8B. 15, 00000000(d)
        mov     eax, dword [task_a]                     ; 062E _ A1, 00000008(d)
        mov     ecx, dword [ebp-50H]                    ; 0633 _ 8B. 4D, B0
        mov     dword [esp+8H], ecx                     ; 0636 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 063A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 063E _ 89. 04 24
        call    task_send_message                       ; 0641 _ E8, FFFFFFFC(rel)
?_006:  cmp     dword [ebp-54H], 0                      ; 0646 _ 83. 7D, AC, 00
        jne     ?_007                                   ; 064A _ 0F 85, 000000D9
        mov     eax, dword [ebp-24H]                    ; 0650 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0653 _ 89. 04 24
        call    transfer_scancode                       ; 0656 _ E8, FFFFFFFC(rel)
        test    al, al                                  ; 065B _ 84. C0
        je      ?_011                                   ; 065D _ 0F 84, 0000018E
        cmp     dword [ebp-5CH], 143                    ; 0663 _ 81. 7D, A4, 0000008F
        jg      ?_011                                   ; 066A _ 0F 8F, 00000181
        mov     edx, dword [sheet_win]                  ; 0670 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0676 _ A1, 0000000C(d)
        mov     dword [esp+10H], 7                      ; 067B _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 0683 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-5CH]                    ; 068B _ 8B. 4D, A4
        mov     dword [esp+8H], ecx                     ; 068E _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0692 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0696 _ 89. 04 24
        call    set_cursor                              ; 0699 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 069E _ 8B. 45, DC
        mov     dword [esp], eax                        ; 06A1 _ 89. 04 24
        call    transfer_scancode                       ; 06A4 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-5FH], al                      ; 06A9 _ 88. 45, A1
        movzx   eax, byte [ebp-5FH]                     ; 06AC _ 0F B6. 45, A1
        mov     byte [ebp-5EH], al                      ; 06B0 _ 88. 45, A2
        mov     byte [ebp-5DH], 0                       ; 06B3 _ C6. 45, A3, 00
        mov     edx, dword [sheet_win]                  ; 06B7 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 06BD _ A1, 0000000C(d)
        mov     dword [esp+14H], 0                      ; 06C2 _ C7. 44 24, 14, 00000000
        lea     ecx, [ebp-5EH]                          ; 06CA _ 8D. 4D, A2
        mov     dword [esp+10H], ecx                    ; 06CD _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 06D1 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-5CH]                    ; 06D9 _ 8B. 4D, A4
        mov     dword [esp+8H], ecx                     ; 06DC _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06E0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06E4 _ 89. 04 24
        call    paint_string                            ; 06E7 _ E8, FFFFFFFC(rel)
        add     dword [ebp-5CH], 8                      ; 06EC _ 83. 45, A4, 08
        mov     dword [ebp-14H], 1                      ; 06F0 _ C7. 45, EC, 00000001
        mov     edx, dword [sheet_win]                  ; 06F7 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 06FD _ A1, 0000000C(d)
        mov     ecx, dword [ebp-58H]                    ; 0702 _ 8B. 4D, A8
        mov     dword [esp+10H], ecx                    ; 0705 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0709 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-5CH]                    ; 0711 _ 8B. 4D, A4
        mov     dword [esp+8H], ecx                     ; 0714 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0718 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 071C _ 89. 04 24
        call    set_cursor                              ; 071F _ E8, FFFFFFFC(rel)
        jmp     ?_011                                   ; 0724 _ E9, 000000C8

?_007:  mov     eax, dword [ebp-24H]                    ; 0729 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 072C _ 89. 04 24
        call    is_special_key                          ; 072F _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0734 _ 85. C0
        jne     ?_011                                   ; 0736 _ 0F 85, 000000B5
        mov     eax, dword [ebp-24H]                    ; 073C _ 8B. 45, DC
        movzx   eax, al                                 ; 073F _ 0F B6. C0
        mov     edx, dword [task_console_g]             ; 0742 _ 8B. 15, 00000000(d)
        add     edx, 16                                 ; 0748 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 074B _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 074F _ 89. 14 24
        call    fifo8_put                               ; 0752 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0757 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 075E _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0763 _ 85. C0
        jne     ?_011                                   ; 0765 _ 0F 85, 00000086
        mov     eax, dword [task_a]                     ; 076B _ A1, 00000008(d)
        mov     dword [esp], eax                        ; 0770 _ 89. 04 24
        call    task_sleep                              ; 0773 _ E8, FFFFFFFC(rel)
        jmp     ?_011                                   ; 0778 _ EB, 77

?_008:  mov     dword [esp], mouseinfo                  ; 077A _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0781 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0786 _ 85. C0
        jz      ?_009                                   ; 0788 _ 74, 23
        mov     ecx, dword [mouse_sheet]                ; 078A _ 8B. 0D, 00000014(d)
        mov     edx, dword [back_sheet]                 ; 0790 _ 8B. 15, 00000010(d)
        mov     eax, dword [sheet_control]              ; 0796 _ A1, 0000000C(d)
        mov     dword [esp+8H], ecx                     ; 079B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 079F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07A3 _ 89. 04 24
        call    show_mouse_info                         ; 07A6 _ E8, FFFFFFFC(rel)
        jmp     ?_011                                   ; 07AB _ EB, 44

?_009:  mov     dword [esp], timerinfo1.1800            ; 07AD _ C7. 04 24, 00000018(d)
        call    fifo8_status                            ; 07B4 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07B9 _ 85. C0
        jz      ?_010                                   ; 07BB _ 74, 13
        call    io_sti                                  ; 07BD _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1800            ; 07C2 _ C7. 04 24, 00000018(d)
        call    fifo8_get                               ; 07C9 _ E8, FFFFFFFC(rel)
        jmp     ?_011                                   ; 07CE _ EB, 21

?_010:  mov     dword [esp], timerinfo2.1801            ; 07D0 _ C7. 04 24, 0000003C(d)
        call    fifo8_status                            ; 07D7 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07DC _ 85. C0
        jz      ?_011                                   ; 07DE _ 74, 11
        call    io_sti                                  ; 07E0 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1801            ; 07E5 _ C7. 04 24, 0000003C(d)
        call    fifo8_get                               ; 07EC _ E8, FFFFFFFC(rel)
?_011:  mov     dword [esp], timerinfo3.1802            ; 07F1 _ C7. 04 24, 00000060(d)
        call    fifo8_status                            ; 07F8 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07FD _ 85. C0
        je      ?_015                                   ; 07FF _ 0F 84, 000000DB
        mov     dword [esp], timerinfo3.1802            ; 0805 _ C7. 04 24, 00000060(d)
        call    fifo8_get                               ; 080C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0811 _ 89. 45, F4
        call    io_sti                                  ; 0814 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 0819 _ 83. 7D, F4, 00
        jz      ?_012                                   ; 081D _ 74, 24
        mov     dword [esp+8H], 0                       ; 081F _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1802         ; 0827 _ C7. 44 24, 04, 00000060(d)
        mov     eax, dword [ebp-34H]                    ; 082F _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0832 _ 89. 04 24
        call    timer_init                              ; 0835 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-58H], 0                      ; 083A _ C7. 45, A8, 00000000
        jmp     ?_013                                   ; 0841 _ EB, 22

?_012:  mov     dword [esp+8H], 1                       ; 0843 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1802         ; 084B _ C7. 44 24, 04, 00000060(d)
        mov     eax, dword [ebp-34H]                    ; 0853 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0856 _ 89. 04 24
        call    timer_init                              ; 0859 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-58H], 7                      ; 085E _ C7. 45, A8, 00000007
?_013:  mov     dword [esp+4H], 50                      ; 0865 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-34H]                    ; 086D _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0870 _ 89. 04 24
        call    timer_settime                           ; 0873 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-54H], 0                      ; 0878 _ 83. 7D, AC, 00
        jnz     ?_014                                   ; 087C _ 75, 2F
        mov     edx, dword [sheet_win]                  ; 087E _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0884 _ A1, 0000000C(d)
        mov     ecx, dword [ebp-58H]                    ; 0889 _ 8B. 4D, A8
        mov     dword [esp+10H], ecx                    ; 088C _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0890 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-5CH]                    ; 0898 _ 8B. 4D, A4
        mov     dword [esp+8H], ecx                     ; 089B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 089F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08A3 _ 89. 04 24
        call    set_cursor                              ; 08A6 _ E8, FFFFFFFC(rel)
        jmp     ?_015                                   ; 08AB _ EB, 33

?_014:  mov     edx, dword [sheet_win]                  ; 08AD _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 08B3 _ A1, 0000000C(d)
        mov     dword [esp+10H], 7                      ; 08B8 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 08C0 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-5CH]                    ; 08C8 _ 8B. 4D, A4
        mov     dword [esp+8H], ecx                     ; 08CB _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08CF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08D3 _ 89. 04 24
        call    set_cursor                              ; 08D6 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 08DB _ E9, FFFFFAE7

?_015:  jmp     ?_001                                   ; 08E0 _ E9, FFFFFAE2
; CMain End of function

task_b_main:; Function begin
        push    ebp                                     ; 08E5 _ 55
        mov     ebp, esp                                ; 08E6 _ 89. E5
        sub     esp, 104                                ; 08E8 _ 83. EC, 68
        mov     eax, dword [ebp+8H]                     ; 08EB _ 8B. 45, 08
        mov     dword [ebp-4CH], eax                    ; 08EE _ 89. 45, B4
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 08F1 _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 08F7 _ 89. 45, F4
        xor     eax, eax                                ; 08FA _ 31. C0
        mov     edx, dword [back_sheet]                 ; 08FC _ 8B. 15, 00000010(d)
        mov     eax, dword [sheet_control]              ; 0902 _ A1, 0000000C(d)
        mov     dword [esp+14H], 7                      ; 0907 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_309                  ; 090F _ C7. 44 24, 10, 0000001C(d)
        mov     dword [esp+0CH], 160                    ; 0917 _ C7. 44 24, 0C, 000000A0
        mov     dword [esp+8H], 0                       ; 091F _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0927 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 092B _ 89. 04 24
        call    paint_string                            ; 092E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], 0                      ; 0933 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 093A _ C7. 45, CC, 00000000
        mov     dword [esp+0CH], 0                      ; 0941 _ C7. 44 24, 0C, 00000000
        lea     eax, [ebp-14H]                          ; 0949 _ 8D. 45, EC
        mov     dword [esp+8H], eax                     ; 094C _ 89. 44 24, 08
        mov     dword [esp+4H], 8                       ; 0950 _ C7. 44 24, 04, 00000008
        lea     eax, [ebp-30H]                          ; 0958 _ 8D. 45, D0
        mov     dword [esp], eax                        ; 095B _ 89. 04 24
        call    fifo8_init                              ; 095E _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0963 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 0968 _ 89. 45, C8
        mov     dword [esp+8H], 123                     ; 096B _ C7. 44 24, 08, 0000007B
        lea     eax, [ebp-30H]                          ; 0973 _ 8D. 45, D0
        mov     dword [esp+4H], eax                     ; 0976 _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 097A _ 8B. 45, C8
        mov     dword [esp], eax                        ; 097D _ 89. 04 24
        call    timer_init                              ; 0980 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0985 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 098D _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0990 _ 89. 04 24
        call    timer_settime                           ; 0993 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-40H], 0                      ; 0998 _ C7. 45, C0, 00000000
        mov     dword [ebp-3CH], 0                      ; 099F _ C7. 45, C4, 00000000
?_016:  add     dword [ebp-40H], 1                      ; 09A6 _ 83. 45, C0, 01
        call    io_cli                                  ; 09AA _ E8, FFFFFFFC(rel)
        lea     eax, [ebp-30H]                          ; 09AF _ 8D. 45, D0
        mov     dword [esp], eax                        ; 09B2 _ 89. 04 24
        call    fifo8_status                            ; 09B5 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 09BA _ 85. C0
        jnz     ?_017                                   ; 09BC _ 75, 07
        call    io_sti                                  ; 09BE _ E8, FFFFFFFC(rel)
        jmp     ?_018                                   ; 09C3 _ EB, 6B

?_017:  lea     eax, [ebp-30H]                          ; 09C5 _ 8D. 45, D0
        mov     dword [esp], eax                        ; 09C8 _ 89. 04 24
        call    fifo8_get                               ; 09CB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 09D0 _ 89. 45, CC
        call    io_sti                                  ; 09D3 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-34H], 123                    ; 09D8 _ 83. 7D, CC, 7B
        jnz     ?_018                                   ; 09DC _ 75, 52
        mov     edx, dword [back_sheet]                 ; 09DE _ 8B. 15, 00000010(d)
        mov     eax, dword [sheet_control]              ; 09E4 _ A1, 0000000C(d)
        mov     dword [esp+14H], 7                      ; 09E9 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_310                  ; 09F1 _ C7. 44 24, 10, 00000029(d)
        mov     dword [esp+0CH], 176                    ; 09F9 _ C7. 44 24, 0C, 000000B0
        mov     ecx, dword [ebp-3CH]                    ; 0A01 _ 8B. 4D, C4
        mov     dword [esp+8H], ecx                     ; 0A04 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0A08 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0A0C _ 89. 04 24
        call    paint_string                            ; 0A0F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0A14 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 0A1C _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0A1F _ 89. 04 24
        call    timer_settime                           ; 0A22 _ E8, FFFFFFFC(rel)
        add     dword [ebp-3CH], 8                      ; 0A27 _ 83. 45, C4, 08
        jmp     ?_016                                   ; 0A2B _ E9, FFFFFF76

?_018:  jmp     ?_016                                   ; 0A30 _ E9, FFFFFF71
; task_b_main End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0A35 _ 55
        mov     ebp, esp                                ; 0A36 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0A38 _ A1, 00000000(d)
        mov     edx, eax                                ; 0A3D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A3F _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0A42 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0A44 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0A47 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0A4D _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 0A50 _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 0A56 _ 5D
        ret                                             ; 0A57 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0A58 _ 55
        mov     ebp, esp                                ; 0A59 _ 89. E5
        sub     esp, 24                                 ; 0A5B _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1817          ; 0A5E _ C7. 44 24, 08, 00000120(d)
        mov     dword [esp+4H], 15                      ; 0A66 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 0A6E _ C7. 04 24, 00000000
        call    set_palette                             ; 0A75 _ E8, FFFFFFFC(rel)
        nop                                             ; 0A7A _ 90
        leave                                           ; 0A7B _ C9
        ret                                             ; 0A7C _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0A7D _ 55
        mov     ebp, esp                                ; 0A7E _ 89. E5
        sub     esp, 40                                 ; 0A80 _ 83. EC, 28
        call    io_load_eflags                          ; 0A83 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0A88 _ 89. 45, F0
        call    io_cli                                  ; 0A8B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0A90 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0A93 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0A97 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0A9E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0AA3 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 0AA6 _ 89. 45, F4
        jmp     ?_020                                   ; 0AA9 _ EB, 62

?_019:  mov     eax, dword [ebp+10H]                    ; 0AAB _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0AAE _ 0F B6. 00
        shr     al, 2                                   ; 0AB1 _ C0. E8, 02
        movzx   eax, al                                 ; 0AB4 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0AB7 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0ABB _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0AC2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0AC7 _ 8B. 45, 10
        add     eax, 1                                  ; 0ACA _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0ACD _ 0F B6. 00
        shr     al, 2                                   ; 0AD0 _ C0. E8, 02
        movzx   eax, al                                 ; 0AD3 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0AD6 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0ADA _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0AE1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0AE6 _ 8B. 45, 10
        add     eax, 2                                  ; 0AE9 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0AEC _ 0F B6. 00
        shr     al, 2                                   ; 0AEF _ C0. E8, 02
        movzx   eax, al                                 ; 0AF2 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0AF5 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0AF9 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0B00 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0B05 _ 83. 45, 10, 03
        add     dword [ebp-0CH], 1                      ; 0B09 _ 83. 45, F4, 01
?_020:  mov     eax, dword [ebp-0CH]                    ; 0B0D _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 0B10 _ 3B. 45, 0C
        jle     ?_019                                   ; 0B13 _ 7E, 96
        mov     eax, dword [ebp-10H]                    ; 0B15 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 0B18 _ 89. 04 24
        call    io_store_eflags                         ; 0B1B _ E8, FFFFFFFC(rel)
        nop                                             ; 0B20 _ 90
        leave                                           ; 0B21 _ C9
        ret                                             ; 0B22 _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0B23 _ 55
        mov     ebp, esp                                ; 0B24 _ 89. E5
        sub     esp, 20                                 ; 0B26 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0B29 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0B2C _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0B2F _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 0B32 _ 89. 45, F8
        jmp     ?_024                                   ; 0B35 _ EB, 33

?_021:  mov     eax, dword [ebp+14H]                    ; 0B37 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 0B3A _ 89. 45, FC
        jmp     ?_023                                   ; 0B3D _ EB, 1F

?_022:  mov     eax, dword [ebp-8H]                     ; 0B3F _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 0B42 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B46 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0B48 _ 8B. 45, FC
        add     eax, edx                                ; 0B4B _ 01. D0
        mov     edx, eax                                ; 0B4D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B4F _ 8B. 45, 08
        add     edx, eax                                ; 0B52 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0B54 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0B58 _ 88. 02
        add     dword [ebp-4H], 1                       ; 0B5A _ 83. 45, FC, 01
?_023:  mov     eax, dword [ebp-4H]                     ; 0B5E _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 0B61 _ 3B. 45, 1C
        jle     ?_022                                   ; 0B64 _ 7E, D9
        add     dword [ebp-8H], 1                       ; 0B66 _ 83. 45, F8, 01
?_024:  mov     eax, dword [ebp-8H]                     ; 0B6A _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 0B6D _ 3B. 45, 20
        jle     ?_021                                   ; 0B70 _ 7E, C5
        leave                                           ; 0B72 _ C9
        ret                                             ; 0B73 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0B74 _ 55
        mov     ebp, esp                                ; 0B75 _ 89. E5
        push    ebx                                     ; 0B77 _ 53
        sub     esp, 28                                 ; 0B78 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 0B7B _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0B7E _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0B81 _ 8B. 45, 0C
        sub     eax, 1                                  ; 0B84 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0B87 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0B8B _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0B8F _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0B97 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0B9F _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0BA7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0BAA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0BAE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0BB1 _ 89. 04 24
        call    paint_rectangle                         ; 0BB4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0BB9 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0BBC _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0BBF _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0BC2 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0BC5 _ 8B. 45, 10
        sub     eax, 28                                 ; 0BC8 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 0BCB _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0BCF _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0BD3 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0BD7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0BDF _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0BE7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0BEA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0BEE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0BF1 _ 89. 04 24
        call    paint_rectangle                         ; 0BF4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0BF9 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0BFC _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0BFF _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0C02 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0C05 _ 8B. 45, 10
        sub     eax, 27                                 ; 0C08 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0C0B _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0C0F _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0C13 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0C17 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0C1F _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0C27 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C2A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C2E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C31 _ 89. 04 24
        call    paint_rectangle                         ; 0C34 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C39 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0C3C _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0C3F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0C42 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0C45 _ 8B. 45, 10
        sub     eax, 26                                 ; 0C48 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0C4B _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0C4F _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0C53 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0C57 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0C5F _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0C67 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C6A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C6E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C71 _ 89. 04 24
        call    paint_rectangle                         ; 0C74 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C79 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0C7C _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0C7F _ 8B. 45, 10
        sub     eax, 24                                 ; 0C82 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0C85 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0C89 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0C91 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0C95 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0C9D _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0CA5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CA8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CAC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CAF _ 89. 04 24
        call    paint_rectangle                         ; 0CB2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0CB7 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0CBA _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0CBD _ 8B. 45, 10
        sub     eax, 24                                 ; 0CC0 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0CC3 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0CC7 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0CCF _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0CD3 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 0CDB _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0CE3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CE6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CEA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CED _ 89. 04 24
        call    paint_rectangle                         ; 0CF0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0CF5 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0CF8 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0CFB _ 8B. 45, 10
        sub     eax, 4                                  ; 0CFE _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0D01 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0D05 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0D0D _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0D11 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0D19 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0D21 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D24 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D28 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D2B _ 89. 04 24
        call    paint_rectangle                         ; 0D2E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D33 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0D36 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0D39 _ 8B. 45, 10
        sub     eax, 23                                 ; 0D3C _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0D3F _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0D43 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0D4B _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0D4F _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0D57 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0D5F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D62 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D66 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D69 _ 89. 04 24
        call    paint_rectangle                         ; 0D6C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D71 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0D74 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0D77 _ 8B. 45, 10
        sub     eax, 3                                  ; 0D7A _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0D7D _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0D81 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0D89 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0D8D _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0D95 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0D9D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DA0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DA4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DA7 _ 89. 04 24
        call    paint_rectangle                         ; 0DAA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0DAF _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0DB2 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0DB5 _ 8B. 45, 10
        sub     eax, 24                                 ; 0DB8 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0DBB _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 0DBF _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0DC7 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 0DCB _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0DD3 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0DDB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DDE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DE2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DE5 _ 89. 04 24
        call    paint_rectangle                         ; 0DE8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0DED _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0DF0 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0DF3 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0DF6 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0DF9 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0DFC _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0DFF _ 8B. 45, 0C
        sub     eax, 47                                 ; 0E02 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0E05 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0E09 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0E0D _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0E11 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0E15 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0E1D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E20 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E24 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E27 _ 89. 04 24
        call    paint_rectangle                         ; 0E2A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E2F _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0E32 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0E35 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0E38 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0E3B _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0E3E _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0E41 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0E44 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0E47 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0E4B _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0E4F _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0E53 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0E57 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0E5F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E62 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E66 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E69 _ 89. 04 24
        call    paint_rectangle                         ; 0E6C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E71 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0E74 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0E77 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0E7A _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0E7D _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0E80 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0E83 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0E86 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0E89 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0E8D _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0E91 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0E95 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0E99 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0EA1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EA4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EA8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EAB _ 89. 04 24
        call    paint_rectangle                         ; 0EAE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0EB3 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0EB6 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0EB9 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0EBC _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0EBF _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0EC2 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0EC5 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0EC8 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 0ECB _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0ECF _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0ED3 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0ED7 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0EDB _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0EE3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EE6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EEA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EED _ 89. 04 24
        call    paint_rectangle                         ; 0EF0 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0EF5 _ 83. C4, 1C
        pop     ebx                                     ; 0EF8 _ 5B
        pop     ebp                                     ; 0EF9 _ 5D
        ret                                             ; 0EFA _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 0EFB _ 55
        mov     ebp, esp                                ; 0EFC _ 89. E5
        sub     esp, 16                                 ; 0EFE _ 83. EC, 10
        movzx   eax, word [?_334]                       ; 0F01 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 0F08 _ 98
        mov     dword [ebp-4H], eax                     ; 0F09 _ 89. 45, FC
        movzx   eax, word [?_335]                       ; 0F0C _ 0F B7. 05, 000000A6(d)
        cwde                                            ; 0F13 _ 98
        mov     dword [ebp-8H], eax                     ; 0F14 _ 89. 45, F8
        mov     eax, dword [ebp-4H]                     ; 0F17 _ 8B. 45, FC
        sub     eax, 16                                 ; 0F1A _ 83. E8, 10
        mov     edx, eax                                ; 0F1D _ 89. C2
        shr     edx, 31                                 ; 0F1F _ C1. EA, 1F
        add     eax, edx                                ; 0F22 _ 01. D0
        sar     eax, 1                                  ; 0F24 _ D1. F8
        mov     dword [mouse_x], eax                    ; 0F26 _ A3, 000001C8(d)
        mov     eax, dword [ebp-8H]                     ; 0F2B _ 8B. 45, F8
        sub     eax, 44                                 ; 0F2E _ 83. E8, 2C
        mov     edx, eax                                ; 0F31 _ 89. C2
        shr     edx, 31                                 ; 0F33 _ C1. EA, 1F
        add     eax, edx                                ; 0F36 _ 01. D0
        sar     eax, 1                                  ; 0F38 _ D1. F8
        mov     dword [mouse_y], eax                    ; 0F3A _ A3, 000001CC(d)
        leave                                           ; 0F3F _ C9
        ret                                             ; 0F40 _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0F41 _ 55
        mov     ebp, esp                                ; 0F42 _ 89. E5
        sub     esp, 20                                 ; 0F44 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 0F47 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 0F4A _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0F4D _ C7. 45, FC, 00000000
        jmp     ?_034                                   ; 0F54 _ E9, 0000016E

?_025:  mov     edx, dword [ebp-4H]                     ; 0F59 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 0F5C _ 8B. 45, 18
        add     eax, edx                                ; 0F5F _ 01. D0
        movzx   eax, byte [eax]                         ; 0F61 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0F64 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0F67 _ 0F B6. 45, FB
        test    al, al                                  ; 0F6B _ 84. C0
        jns     ?_026                                   ; 0F6D _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0F6F _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0F72 _ 8B. 55, 14
        add     eax, edx                                ; 0F75 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0F77 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0F7B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0F7D _ 8B. 45, 10
        add     eax, edx                                ; 0F80 _ 01. D0
        mov     edx, eax                                ; 0F82 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F84 _ 8B. 45, 08
        add     edx, eax                                ; 0F87 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0F89 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0F8D _ 88. 02
?_026:  movzx   eax, byte [ebp-5H]                      ; 0F8F _ 0F B6. 45, FB
        and     eax, 40H                                ; 0F93 _ 83. E0, 40
        test    eax, eax                                ; 0F96 _ 85. C0
        jz      ?_027                                   ; 0F98 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0F9A _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0F9D _ 8B. 55, 14
        add     eax, edx                                ; 0FA0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FA2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FA6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FA8 _ 8B. 45, 10
        add     eax, edx                                ; 0FAB _ 01. D0
        lea     edx, [eax+1H]                           ; 0FAD _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0FB0 _ 8B. 45, 08
        add     edx, eax                                ; 0FB3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0FB5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0FB9 _ 88. 02
?_027:  movzx   eax, byte [ebp-5H]                      ; 0FBB _ 0F B6. 45, FB
        and     eax, 20H                                ; 0FBF _ 83. E0, 20
        test    eax, eax                                ; 0FC2 _ 85. C0
        jz      ?_028                                   ; 0FC4 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0FC6 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0FC9 _ 8B. 55, 14
        add     eax, edx                                ; 0FCC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FCE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FD2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FD4 _ 8B. 45, 10
        add     eax, edx                                ; 0FD7 _ 01. D0
        lea     edx, [eax+2H]                           ; 0FD9 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0FDC _ 8B. 45, 08
        add     edx, eax                                ; 0FDF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0FE1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0FE5 _ 88. 02
?_028:  movzx   eax, byte [ebp-5H]                      ; 0FE7 _ 0F B6. 45, FB
        and     eax, 10H                                ; 0FEB _ 83. E0, 10
        test    eax, eax                                ; 0FEE _ 85. C0
        jz      ?_029                                   ; 0FF0 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0FF2 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0FF5 _ 8B. 55, 14
        add     eax, edx                                ; 0FF8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FFA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FFE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1000 _ 8B. 45, 10
        add     eax, edx                                ; 1003 _ 01. D0
        lea     edx, [eax+3H]                           ; 1005 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 1008 _ 8B. 45, 08
        add     edx, eax                                ; 100B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 100D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1011 _ 88. 02
?_029:  movzx   eax, byte [ebp-5H]                      ; 1013 _ 0F B6. 45, FB
        and     eax, 08H                                ; 1017 _ 83. E0, 08
        test    eax, eax                                ; 101A _ 85. C0
        jz      ?_030                                   ; 101C _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 101E _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1021 _ 8B. 55, 14
        add     eax, edx                                ; 1024 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1026 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 102A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 102C _ 8B. 45, 10
        add     eax, edx                                ; 102F _ 01. D0
        lea     edx, [eax+4H]                           ; 1031 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1034 _ 8B. 45, 08
        add     edx, eax                                ; 1037 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1039 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 103D _ 88. 02
?_030:  movzx   eax, byte [ebp-5H]                      ; 103F _ 0F B6. 45, FB
        and     eax, 04H                                ; 1043 _ 83. E0, 04
        test    eax, eax                                ; 1046 _ 85. C0
        jz      ?_031                                   ; 1048 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 104A _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 104D _ 8B. 55, 14
        add     eax, edx                                ; 1050 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1052 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1056 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1058 _ 8B. 45, 10
        add     eax, edx                                ; 105B _ 01. D0
        lea     edx, [eax+5H]                           ; 105D _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 1060 _ 8B. 45, 08
        add     edx, eax                                ; 1063 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1065 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1069 _ 88. 02
?_031:  movzx   eax, byte [ebp-5H]                      ; 106B _ 0F B6. 45, FB
        and     eax, 02H                                ; 106F _ 83. E0, 02
        test    eax, eax                                ; 1072 _ 85. C0
        jz      ?_032                                   ; 1074 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1076 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1079 _ 8B. 55, 14
        add     eax, edx                                ; 107C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 107E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1082 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1084 _ 8B. 45, 10
        add     eax, edx                                ; 1087 _ 01. D0
        lea     edx, [eax+6H]                           ; 1089 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 108C _ 8B. 45, 08
        add     edx, eax                                ; 108F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1091 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1095 _ 88. 02
?_032:  movzx   eax, byte [ebp-5H]                      ; 1097 _ 0F B6. 45, FB
        and     eax, 01H                                ; 109B _ 83. E0, 01
        test    eax, eax                                ; 109E _ 85. C0
        jz      ?_033                                   ; 10A0 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 10A2 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 10A5 _ 8B. 55, 14
        add     eax, edx                                ; 10A8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10AA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10AE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10B0 _ 8B. 45, 10
        add     eax, edx                                ; 10B3 _ 01. D0
        lea     edx, [eax+7H]                           ; 10B5 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 10B8 _ 8B. 45, 08
        add     edx, eax                                ; 10BB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 10BD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 10C1 _ 88. 02
?_033:  add     dword [ebp-4H], 1                       ; 10C3 _ 83. 45, FC, 01
?_034:  cmp     dword [ebp-4H], 15                      ; 10C7 _ 83. 7D, FC, 0F
        jle     ?_025                                   ; 10CB _ 0F 8E, FFFFFE88
        leave                                           ; 10D1 _ C9
        ret                                             ; 10D2 _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 10D3 _ 55
        mov     ebp, esp                                ; 10D4 _ 89. E5
        push    ebx                                     ; 10D6 _ 53
        sub     esp, 52                                 ; 10D7 _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 10DA _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 10DD _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 10E0 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 10E3 _ 89. 45, F4
        jmp     ?_036                                   ; 10E6 _ EB, 4B

?_035:  movsx   ecx, byte [ebp-1CH]                     ; 10E8 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 10EC _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 10EF _ 0F B6. 00
        movsx   eax, al                                 ; 10F2 _ 0F BE. C0
        shl     eax, 4                                  ; 10F5 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 10F8 _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 10FE _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 1101 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1104 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1107 _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 1109 _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 110D _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 1111 _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 1114 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 1118 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 111B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 111F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1123 _ 89. 04 24
        call    paint_font                              ; 1126 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 112B _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 112F _ 83. 45, 18, 01
?_036:  mov     eax, dword [ebp+18H]                    ; 1133 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 1136 _ 0F B6. 00
        test    al, al                                  ; 1139 _ 84. C0
        jnz     ?_035                                   ; 113B _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 113D _ 8B. 45, 14
        add     eax, 16                                 ; 1140 _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 1143 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 1147 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 114A _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 114E _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 1151 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 1155 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 1158 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 115C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 115F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1163 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1166 _ 89. 04 24
        call    sheet_refresh                           ; 1169 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 116E _ 83. C4, 34
        pop     ebx                                     ; 1171 _ 5B
        pop     ebp                                     ; 1172 _ 5D
        ret                                             ; 1173 _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 1174 _ 55
        mov     ebp, esp                                ; 1175 _ 89. E5
        sub     esp, 20                                 ; 1177 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 117A _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 117D _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 1180 _ C7. 45, FC, 00000000
        jmp     ?_043                                   ; 1187 _ E9, 0000009C

?_037:  mov     dword [ebp-8H], 0                       ; 118C _ C7. 45, F8, 00000000
        jmp     ?_042                                   ; 1193 _ E9, 00000082

?_038:  mov     eax, dword [ebp-4H]                     ; 1198 _ 8B. 45, FC
        shl     eax, 4                                  ; 119B _ C1. E0, 04
        mov     edx, eax                                ; 119E _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 11A0 _ 8B. 45, F8
        add     eax, edx                                ; 11A3 _ 01. D0
        add     eax, cursor.1885                        ; 11A5 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 11AA _ 0F B6. 00
        cmp     al, 42                                  ; 11AD _ 3C, 2A
        jnz     ?_039                                   ; 11AF _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 11B1 _ 8B. 45, FC
        shl     eax, 4                                  ; 11B4 _ C1. E0, 04
        mov     edx, eax                                ; 11B7 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 11B9 _ 8B. 45, F8
        add     eax, edx                                ; 11BC _ 01. D0
        mov     edx, eax                                ; 11BE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 11C0 _ 8B. 45, 08
        add     eax, edx                                ; 11C3 _ 01. D0
        mov     byte [eax], 0                           ; 11C5 _ C6. 00, 00
        jmp     ?_041                                   ; 11C8 _ EB, 4C

?_039:  mov     eax, dword [ebp-4H]                     ; 11CA _ 8B. 45, FC
        shl     eax, 4                                  ; 11CD _ C1. E0, 04
        mov     edx, eax                                ; 11D0 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 11D2 _ 8B. 45, F8
        add     eax, edx                                ; 11D5 _ 01. D0
        add     eax, cursor.1885                        ; 11D7 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 11DC _ 0F B6. 00
        cmp     al, 79                                  ; 11DF _ 3C, 4F
        jnz     ?_040                                   ; 11E1 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 11E3 _ 8B. 45, FC
        shl     eax, 4                                  ; 11E6 _ C1. E0, 04
        mov     edx, eax                                ; 11E9 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 11EB _ 8B. 45, F8
        add     eax, edx                                ; 11EE _ 01. D0
        mov     edx, eax                                ; 11F0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 11F2 _ 8B. 45, 08
        add     eax, edx                                ; 11F5 _ 01. D0
        mov     byte [eax], 7                           ; 11F7 _ C6. 00, 07
        jmp     ?_041                                   ; 11FA _ EB, 1A

?_040:  mov     eax, dword [ebp-4H]                     ; 11FC _ 8B. 45, FC
        shl     eax, 4                                  ; 11FF _ C1. E0, 04
        mov     edx, eax                                ; 1202 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1204 _ 8B. 45, F8
        add     eax, edx                                ; 1207 _ 01. D0
        mov     edx, eax                                ; 1209 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 120B _ 8B. 45, 08
        add     edx, eax                                ; 120E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1210 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1214 _ 88. 02
?_041:  add     dword [ebp-8H], 1                       ; 1216 _ 83. 45, F8, 01
?_042:  cmp     dword [ebp-8H], 15                      ; 121A _ 83. 7D, F8, 0F
        jle     ?_038                                   ; 121E _ 0F 8E, FFFFFF74
        add     dword [ebp-4H], 1                       ; 1224 _ 83. 45, FC, 01
?_043:  cmp     dword [ebp-4H], 15                      ; 1228 _ 83. 7D, FC, 0F
        jle     ?_037                                   ; 122C _ 0F 8E, FFFFFF5A
        leave                                           ; 1232 _ C9
        ret                                             ; 1233 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 1234 _ 55
        mov     ebp, esp                                ; 1235 _ 89. E5
        sub     esp, 16                                 ; 1237 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 123A _ C7. 45, FC, 00000000
        jmp     ?_047                                   ; 1241 _ EB, 50

?_044:  mov     dword [ebp-8H], 0                       ; 1243 _ C7. 45, F8, 00000000
        jmp     ?_046                                   ; 124A _ EB, 3B

?_045:  mov     eax, dword [ebp-4H]                     ; 124C _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 124F _ 8B. 55, 14
        add     eax, edx                                ; 1252 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1254 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-8H]                     ; 1258 _ 8B. 55, F8
        mov     ecx, dword [ebp+10H]                    ; 125B _ 8B. 4D, 10
        add     edx, ecx                                ; 125E _ 01. CA
        add     eax, edx                                ; 1260 _ 01. D0
        mov     edx, eax                                ; 1262 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1264 _ 8B. 45, 08
        add     edx, eax                                ; 1267 _ 01. C2
        mov     eax, dword [ebp-4H]                     ; 1269 _ 8B. 45, FC
        imul    eax, dword [ebp+18H]                    ; 126C _ 0F AF. 45, 18
        mov     ecx, eax                                ; 1270 _ 89. C1
        mov     eax, dword [ebp-8H]                     ; 1272 _ 8B. 45, F8
        add     eax, ecx                                ; 1275 _ 01. C8
        mov     ecx, eax                                ; 1277 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 1279 _ 8B. 45, 20
        add     eax, ecx                                ; 127C _ 01. C8
        movzx   eax, byte [eax]                         ; 127E _ 0F B6. 00
        mov     byte [edx], al                          ; 1281 _ 88. 02
        add     dword [ebp-8H], 1                       ; 1283 _ 83. 45, F8, 01
?_046:  mov     eax, dword [ebp-8H]                     ; 1287 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 128A _ 3B. 45, 18
        jl      ?_045                                   ; 128D _ 7C, BD
        add     dword [ebp-4H], 1                       ; 128F _ 83. 45, FC, 01
?_047:  mov     eax, dword [ebp-4H]                     ; 1293 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 1296 _ 3B. 45, 1C
        jl      ?_044                                   ; 1299 _ 7C, A8
        leave                                           ; 129B _ C9
        ret                                             ; 129C _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 129D _ 55
        mov     ebp, esp                                ; 129E _ 89. E5
        sub     esp, 24                                 ; 12A0 _ 83. EC, 18
        mov     dword [esp+0CH], 0                      ; 12A3 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 12AB _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 12B3 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 12BB _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 12C2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 12C7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], keybuf                  ; 12CF _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 12D7 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 12DF _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 12E6 _ E8, FFFFFFFC(rel)
        leave                                           ; 12EB _ C9
        ret                                             ; 12EC _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 12ED _ 55
        mov     ebp, esp                                ; 12EE _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 12F0 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 12F3 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 12F6 _ A1, 000001C8(d)
        add     eax, edx                                ; 12FB _ 01. D0
        mov     dword [mouse_x], eax                    ; 12FD _ A3, 000001C8(d)
        mov     eax, dword [ebp+10H]                    ; 1302 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 1305 _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 1308 _ A1, 000001CC(d)
        add     eax, edx                                ; 130D _ 01. D0
        mov     dword [mouse_y], eax                    ; 130F _ A3, 000001CC(d)
        mov     eax, dword [mouse_x]                    ; 1314 _ A1, 000001C8(d)
        test    eax, eax                                ; 1319 _ 85. C0
        jns     ?_048                                   ; 131B _ 79, 0A
        mov     dword [mouse_x], 0                      ; 131D _ C7. 05, 000001C8(d), 00000000
?_048:  mov     eax, dword [mouse_y]                    ; 1327 _ A1, 000001CC(d)
        test    eax, eax                                ; 132C _ 85. C0
        jns     ?_049                                   ; 132E _ 79, 0A
        mov     dword [mouse_y], 0                      ; 1330 _ C7. 05, 000001CC(d), 00000000
?_049:  movzx   eax, word [?_334]                       ; 133A _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 1341 _ 98
        lea     edx, [eax-10H]                          ; 1342 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 1345 _ A1, 000001C8(d)
        cmp     edx, eax                                ; 134A _ 39. C2
        jge     ?_050                                   ; 134C _ 7D, 10
        movzx   eax, word [?_334]                       ; 134E _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 1355 _ 98
        sub     eax, 16                                 ; 1356 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 1359 _ A3, 000001C8(d)
?_050:  movzx   eax, word [?_334]                       ; 135E _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 1365 _ 98
        lea     edx, [eax-10H]                          ; 1366 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 1369 _ A1, 000001CC(d)
        cmp     edx, eax                                ; 136E _ 39. C2
        jge     ?_051                                   ; 1370 _ 7D, 10
        movzx   eax, word [?_334]                       ; 1372 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 1379 _ 98
        sub     eax, 16                                 ; 137A _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 137D _ A3, 000001CC(d)
?_051:  pop     ebp                                     ; 1382 _ 5D
        ret                                             ; 1383 _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 1384 _ 55
        mov     ebp, esp                                ; 1385 _ 89. E5
        sub     esp, 40                                 ; 1387 _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 138A _ C6. 45, F7, 00
        call    io_sti                                  ; 138E _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 1393 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 139A _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 139F _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 13A2 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 13A6 _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 13AA _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 13B1 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 13B6 _ 85. C0
        jz      ?_052                                   ; 13B8 _ 74, 77
        mov     dword [esp+8H], mouse_send_info         ; 13BA _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 13C2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 13C5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13C9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13CC _ 89. 04 24
        call    compute_mouse_position                  ; 13CF _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 13D4 _ 8B. 15, 000001CC(d)
        mov     eax, dword [mouse_x]                    ; 13DA _ A1, 000001C8(d)
        mov     dword [esp+0CH], edx                    ; 13DF _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 13E3 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 13E7 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 13EA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13EE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13F1 _ 89. 04 24
        call    sheet_slide                             ; 13F4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_send_info+0CH]        ; 13F9 _ A1, 0000000C(d)
        and     eax, 01H                                ; 13FE _ 83. E0, 01
        test    eax, eax                                ; 1401 _ 85. C0
        jz      ?_052                                   ; 1403 _ 74, 2C
        mov     eax, dword [mouse_y]                    ; 1405 _ A1, 000001CC(d)
        lea     ecx, [eax-8H]                           ; 140A _ 8D. 48, F8
        mov     eax, dword [mouse_x]                    ; 140D _ A1, 000001C8(d)
        lea     edx, [eax-50H]                          ; 1412 _ 8D. 50, B0
        mov     eax, dword [sheet_win]                  ; 1415 _ A1, 000001C4(d)
        mov     dword [esp+0CH], ecx                    ; 141A _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 141E _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1422 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1426 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1429 _ 89. 04 24
        call    sheet_slide                             ; 142C _ E8, FFFFFFFC(rel)
?_052:  leave                                           ; 1431 _ C9
        ret                                             ; 1432 _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 1433 _ 55
        mov     ebp, esp                                ; 1434 _ 89. E5
        sub     esp, 88                                 ; 1436 _ 83. EC, 58
        mov     dword [ebp-0CH], 0                      ; 1439 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 1440 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 1447 _ C7. 45, EC, 00000068
        mov     eax, dword [screen_info]                ; 144E _ A1, 000000A0(d)
        mov     dword [ebp-18H], eax                    ; 1453 _ 89. 45, E8
        movzx   eax, word [?_334]                       ; 1456 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 145D _ 98
        mov     dword [ebp-1CH], eax                    ; 145E _ 89. 45, E4
        movzx   eax, word [?_335]                       ; 1461 _ 0F B7. 05, 000000A6(d)
        cwde                                            ; 1468 _ 98
        mov     dword [ebp-20H], eax                    ; 1469 _ 89. 45, E0
        mov     eax, dword [ebp+0CH]                    ; 146C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 146F _ 8B. 00
        mov     edx, dword [ebp-20H]                    ; 1471 _ 8B. 55, E0
        mov     dword [esp+8H], edx                     ; 1474 _ 89. 54 24, 08
        mov     edx, dword [ebp-1CH]                    ; 1478 _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 147B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 147F _ 89. 04 24
        call    init_desktop                            ; 1482 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1487 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_311                  ; 148F _ C7. 44 24, 10, 0000002B(d)
        mov     eax, dword [ebp-10H]                    ; 1497 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 149A _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 149E _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 14A1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14A5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14A8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14AC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14AF _ 89. 04 24
        call    paint_string                            ; 14B2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 14B7 _ 8B. 45, 14
        mov     dword [esp], eax                        ; 14BA _ 89. 04 24
        call    intToHexStr                             ; 14BD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 14C2 _ 89. 45, DC
        mov     dword [esp+14H], 7                      ; 14C5 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-24H]                    ; 14CD _ 8B. 45, DC
        mov     dword [esp+10H], eax                    ; 14D0 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 14D4 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 14D7 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 14DB _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 14DE _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14E2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14E5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14E9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14EC _ 89. 04 24
        call    paint_string                            ; 14EF _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 14F4 _ 83. 45, F0, 10
        mov     dword [esp+14H], 7                      ; 14F8 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_312                  ; 1500 _ C7. 44 24, 10, 00000035(d)
        mov     eax, dword [ebp-10H]                    ; 1508 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 150B _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 150F _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 1512 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1516 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1519 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 151D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1520 _ 89. 04 24
        call    paint_string                            ; 1523 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1528 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 152B _ 8B. 00
        mov     dword [esp], eax                        ; 152D _ 89. 04 24
        call    intToHexStr                             ; 1530 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 1535 _ 89. 45, D8
        mov     dword [esp+14H], 7                      ; 1538 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-28H]                    ; 1540 _ 8B. 45, D8
        mov     dword [esp+10H], eax                    ; 1543 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 1547 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 154A _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 154E _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 1551 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1555 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1558 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 155C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 155F _ 89. 04 24
        call    paint_string                            ; 1562 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 1567 _ 83. 45, F0, 10
        mov     dword [esp+14H], 7                      ; 156B _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_313                  ; 1573 _ C7. 44 24, 10, 00000041(d)
        mov     eax, dword [ebp-10H]                    ; 157B _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 157E _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 1582 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 1585 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1589 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 158C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1590 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1593 _ 89. 04 24
        call    paint_string                            ; 1596 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 159B _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 159E _ 8B. 40, 04
        mov     dword [esp], eax                        ; 15A1 _ 89. 04 24
        call    intToHexStr                             ; 15A4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 15A9 _ 89. 45, D4
        mov     dword [esp+14H], 7                      ; 15AC _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-2CH]                    ; 15B4 _ 8B. 45, D4
        mov     dword [esp+10H], eax                    ; 15B7 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 15BB _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 15BE _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 15C2 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 15C5 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15C9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 15CC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 15D0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 15D3 _ 89. 04 24
        call    paint_string                            ; 15D6 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 15DB _ 83. 45, F0, 10
        mov     dword [esp+14H], 7                      ; 15DF _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_314                  ; 15E7 _ C7. 44 24, 10, 0000004D(d)
        mov     eax, dword [ebp-10H]                    ; 15EF _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 15F2 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 15F6 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 15F9 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15FD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1600 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1604 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1607 _ 89. 04 24
        call    paint_string                            ; 160A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 160F _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 1612 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 1615 _ 89. 04 24
        call    intToHexStr                             ; 1618 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 161D _ 89. 45, D0
        mov     dword [esp+14H], 7                      ; 1620 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-30H]                    ; 1628 _ 8B. 45, D0
        mov     dword [esp+10H], eax                    ; 162B _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 162F _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 1632 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 1636 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 1639 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 163D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1640 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1644 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1647 _ 89. 04 24
        call    paint_string                            ; 164A _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 164F _ 83. 45, F0, 10
        mov     dword [esp+14H], 7                      ; 1653 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_315                  ; 165B _ C7. 44 24, 10, 00000059(d)
        mov     eax, dword [ebp-10H]                    ; 1663 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 1666 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 166A _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 166D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1671 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1674 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1678 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 167B _ 89. 04 24
        call    paint_string                            ; 167E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1683 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 1686 _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 1689 _ 89. 04 24
        call    intToHexStr                             ; 168C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 1691 _ 89. 45, CC
        mov     dword [esp+14H], 7                      ; 1694 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-34H]                    ; 169C _ 8B. 45, CC
        mov     dword [esp+10H], eax                    ; 169F _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 16A3 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 16A6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 16AA _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 16AD _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 16B1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 16B4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16B8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16BB _ 89. 04 24
        call    paint_string                            ; 16BE _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 16C3 _ 83. 45, F0, 10
        mov     dword [esp+14H], 7                      ; 16C7 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_316                  ; 16CF _ C7. 44 24, 10, 00000066(d)
        mov     eax, dword [ebp-10H]                    ; 16D7 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 16DA _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 16DE _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 16E1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 16E5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 16E8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16EC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16EF _ 89. 04 24
        call    paint_string                            ; 16F2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 16F7 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 16FA _ 8B. 40, 10
        mov     dword [esp], eax                        ; 16FD _ 89. 04 24
        call    intToHexStr                             ; 1700 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 1705 _ 89. 45, C8
        mov     dword [esp+14H], 7                      ; 1708 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-38H]                    ; 1710 _ 8B. 45, C8
        mov     dword [esp+10H], eax                    ; 1713 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 1717 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 171A _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 171E _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 1721 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1725 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1728 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 172C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 172F _ 89. 04 24
        call    paint_string                            ; 1732 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 1737 _ 83. 45, F0, 10
        leave                                           ; 173B _ C9
        ret                                             ; 173C _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 173D _ 55
        mov     ebp, esp                                ; 173E _ 89. E5
        sub     esp, 56                                 ; 1740 _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 1743 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1746 _ 89. 04 24
        call    sheet_alloc                             ; 1749 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 174E _ 89. 45, F4
        mov     eax, dword [memman]                     ; 1751 _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 1756 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 175E _ 89. 04 24
        call    memman_alloc_4k                         ; 1761 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1766 _ 89. 45, F0
        mov     dword [esp+10H], 99                     ; 1769 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 1771 _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 1779 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-10H]                    ; 1781 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1784 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 1788 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 178B _ 89. 04 24
        call    sheet_setbuf                            ; 178E _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 1793 _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 179B _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 179E _ 89. 44 24, 08
        mov     eax, dword [ebp-0CH]                    ; 17A2 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 17A5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 17A9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17AC _ 89. 04 24
        call    make_windows                            ; 17AF _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 17B4 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 17BC _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 17C4 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 17CC _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 17D4 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 17DC _ 8B. 45, F4
        mov     dword [esp], eax                        ; 17DF _ 89. 04 24
        call    make_textbox                            ; 17E2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 17E7 _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 17EF _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-0CH]                    ; 17F7 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 17FA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 17FE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1801 _ 89. 04 24
        call    sheet_slide                             ; 1804 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 1809 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-0CH]                    ; 1811 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 1814 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1818 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 181B _ 89. 04 24
        call    sheet_updown                            ; 181E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1823 _ 8B. 45, F4
        leave                                           ; 1826 _ C9
        ret                                             ; 1827 _ C3
; message_box End of function

make_textbox:; Function begin
        push    ebp                                     ; 1828 _ 55
        mov     ebp, esp                                ; 1829 _ 89. E5
        push    edi                                     ; 182B _ 57
        push    esi                                     ; 182C _ 56
        push    ebx                                     ; 182D _ 53
        sub     esp, 44                                 ; 182E _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 1831 _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 1834 _ 8B. 55, 0C
        add     eax, edx                                ; 1837 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1839 _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 183C _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 183F _ 8B. 55, 10
        add     eax, edx                                ; 1842 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1844 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 1847 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 184A _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 184D _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1850 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1853 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1856 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1859 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 185C _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 185F _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1862 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1865 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1868 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 186A _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 186E _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1872 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1876 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 187A _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 1882 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1886 _ 89. 04 24
        call    paint_rectangle                         ; 1889 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 188E _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 1891 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 1894 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 1897 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 189A _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 189D _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 18A0 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 18A3 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 18A6 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 18A9 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18AC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18AF _ 8B. 00
        mov     dword [esp+18H], edi                    ; 18B1 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 18B5 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 18B9 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 18BD _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 18C1 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 18C9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18CD _ 89. 04 24
        call    paint_rectangle                         ; 18D0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 18D5 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 18D8 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 18DB _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 18DE _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 18E1 _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 18E4 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 18E7 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 18EA _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 18ED _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 18F0 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18F3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18F6 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 18F8 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 18FC _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1900 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1904 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 1908 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 1910 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1914 _ 89. 04 24
        call    paint_rectangle                         ; 1917 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 191C _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 191F _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1922 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 1925 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1928 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 192B _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 192E _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 1931 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1934 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1937 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 193A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 193D _ 8B. 00
        mov     dword [esp+18H], edi                    ; 193F _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1943 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1947 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 194B _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 194F _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 1957 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 195B _ 89. 04 24
        call    paint_rectangle                         ; 195E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1963 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 1966 _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 1969 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 196C _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 196F _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1972 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 1975 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1978 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 197B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 197E _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1980 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 1984 _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 1987 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 198B _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 198F _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 1993 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 199B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 199F _ 89. 04 24
        call    paint_rectangle                         ; 19A2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 19A7 _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 19AA _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 19AD _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 19B0 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 19B3 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 19B6 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 19B9 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 19BC _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19BF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19C2 _ 8B. 00
        mov     ecx, dword [ebp-14H]                    ; 19C4 _ 8B. 4D, EC
        mov     dword [esp+18H], ecx                    ; 19C7 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 19CB _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 19CF _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 19D3 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 19D7 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 19DF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19E3 _ 89. 04 24
        call    paint_rectangle                         ; 19E6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 19EB _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 19EE _ 8D. 48, 01
        mov     eax, dword [ebp-14H]                    ; 19F1 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 19F4 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 19F7 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 19FA _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 19FD _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A00 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A03 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A06 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1A08 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 1A0C _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 1A0F _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1A13 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1A17 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 1A1B _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1A23 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A27 _ 89. 04 24
        call    paint_rectangle                         ; 1A2A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 1A2F _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 1A32 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 1A35 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1A38 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1A3B _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1A3E _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1A41 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1A44 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1A47 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A4A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A4D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A50 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1A52 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1A56 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1A5A _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1A5E _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 1A62 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1A6A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A6E _ 89. 04 24
        call    paint_rectangle                         ; 1A71 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1A76 _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 1A79 _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 1A7C _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 1A7F _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 1A82 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1A85 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1A88 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A8B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A8E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A91 _ 8B. 00
        mov     ebx, dword [ebp-14H]                    ; 1A93 _ 8B. 5D, EC
        mov     dword [esp+18H], ebx                    ; 1A96 _ 89. 5C 24, 18
        mov     ebx, dword [ebp-10H]                    ; 1A9A _ 8B. 5D, F0
        mov     dword [esp+14H], ebx                    ; 1A9D _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 1AA1 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 1AA5 _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 1AA9 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1AAD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1AB1 _ 89. 04 24
        call    paint_rectangle                         ; 1AB4 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 1AB9 _ 83. C4, 2C
        pop     ebx                                     ; 1ABC _ 5B
        pop     esi                                     ; 1ABD _ 5E
        pop     edi                                     ; 1ABE _ 5F
        pop     ebp                                     ; 1ABF _ 5D
        ret                                             ; 1AC0 _ C3
; make_textbox End of function

make_windows:; Function begin
        push    ebp                                     ; 1AC1 _ 55
        mov     ebp, esp                                ; 1AC2 _ 89. E5
        push    ebx                                     ; 1AC4 _ 53
        sub     esp, 52                                 ; 1AC5 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 1AC8 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1ACB _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 1ACE _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1AD1 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 1AD4 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1AD7 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1ADA _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 1ADD _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 1AE0 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1AE3 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1AE6 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1AE9 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 1AEB _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 1AF3 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 1AF7 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1AFF _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1B07 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 1B0F _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1B12 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B16 _ 89. 04 24
        call    paint_rectangle                         ; 1B19 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1B1E _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1B21 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1B24 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B27 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 1B29 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 1B31 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 1B35 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1B3D _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1B45 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 1B4D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1B50 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B54 _ 89. 04 24
        call    paint_rectangle                         ; 1B57 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1B5C _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1B5F _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1B62 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B65 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1B67 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 1B6B _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 1B73 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1B7B _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1B83 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 1B8B _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1B8E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B92 _ 89. 04 24
        call    paint_rectangle                         ; 1B95 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1B9A _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1B9D _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1BA0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BA3 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1BA5 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 1BA9 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 1BB1 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1BB9 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1BC1 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 1BC9 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1BCC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BD0 _ 89. 04 24
        call    paint_rectangle                         ; 1BD3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1BD8 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 1BDB _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 1BDE _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 1BE1 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1BE4 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1BE7 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1BEA _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BED _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1BEF _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1BF3 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 1BF7 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 1BFF _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 1C03 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 1C0B _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1C0E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C12 _ 89. 04 24
        call    paint_rectangle                         ; 1C15 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1C1A _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 1C1D _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1C20 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1C23 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1C26 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1C29 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1C2C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C2F _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1C31 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1C35 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 1C39 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 1C41 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 1C45 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 1C4D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1C50 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C54 _ 89. 04 24
        call    paint_rectangle                         ; 1C57 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1C5C _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 1C5F _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 1C62 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 1C65 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1C68 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C6B _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1C6D _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1C71 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 1C75 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 1C7D _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 1C85 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 1C8D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1C90 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C94 _ 89. 04 24
        call    paint_rectangle                         ; 1C97 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1C9C _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 1C9F _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1CA2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CA5 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1CA7 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1CAF _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 1CB3 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1CBB _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 1CC3 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-0CH]                    ; 1CCB _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1CCE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CD2 _ 89. 04 24
        call    paint_rectangle                         ; 1CD5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1CDA _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 1CDD _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 1CE0 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 1CE3 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1CE6 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1CE9 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1CEC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CEF _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1CF1 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1CF5 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1CF9 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 1CFD _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 1D05 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 1D0D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1D10 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D14 _ 89. 04 24
        call    paint_rectangle                         ; 1D17 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1D1C _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 1D1F _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1D22 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1D25 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1D28 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1D2B _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1D2E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D31 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1D33 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1D37 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1D3B _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 1D3F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 1D47 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 1D4F _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1D52 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D56 _ 89. 04 24
        call    paint_rectangle                         ; 1D59 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-1CH]                     ; 1D5E _ 0F BE. 45, E4
        mov     dword [esp+0CH], eax                    ; 1D62 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 1D66 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 1D69 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1D6D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1D70 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1D74 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1D77 _ 89. 04 24
        call    make_window_title                       ; 1D7A _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 1D7F _ 83. C4, 34
        pop     ebx                                     ; 1D82 _ 5B
        pop     ebp                                     ; 1D83 _ 5D
        ret                                             ; 1D84 _ C3
; make_windows End of function

make_window_title:; Function begin
        push    ebp                                     ; 1D85 _ 55
        mov     ebp, esp                                ; 1D86 _ 89. E5
        push    ebx                                     ; 1D88 _ 53
        sub     esp, 52                                 ; 1D89 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 1D8C _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1D8F _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 1D92 _ 80. 7D, E4, 00
        jz      ?_053                                   ; 1D96 _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 1D98 _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 1D9C _ C6. 45, ED, 0C
        jmp     ?_054                                   ; 1DA0 _ EB, 08

?_053:  mov     byte [ebp-12H], 8                       ; 1DA2 _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 1DA6 _ C6. 45, ED, 0F
?_054:  mov     eax, dword [ebp+0CH]                    ; 1DAA _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1DAD _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 1DB0 _ 8D. 58, FC
        movzx   eax, byte [ebp-13H]                     ; 1DB3 _ 0F B6. 45, ED
        movzx   ecx, al                                 ; 1DB7 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 1DBA _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 1DBD _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1DC0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1DC3 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1DC5 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], ebx                    ; 1DCD _ 89. 5C 24, 14
        mov     dword [esp+10H], 3                      ; 1DD1 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1DD9 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], ecx                     ; 1DE1 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1DE5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1DE9 _ 89. 04 24
        call    paint_rectangle                         ; 1DEC _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-12H]                     ; 1DF1 _ 0F BE. 45, EE
        mov     dword [esp+14H], eax                    ; 1DF5 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 1DF9 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1DFC _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 1E00 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 1E08 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 1E10 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1E13 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1E17 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1E1A _ 89. 04 24
        call    paint_string                            ; 1E1D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 1E22 _ C7. 45, F0, 00000000
        jmp     ?_062                                   ; 1E29 _ E9, 00000083

?_055:  mov     dword [ebp-0CH], 0                      ; 1E2E _ C7. 45, F4, 00000000
        jmp     ?_061                                   ; 1E35 _ EB, 70

?_056:  mov     eax, dword [ebp-10H]                    ; 1E37 _ 8B. 45, F0
        shl     eax, 4                                  ; 1E3A _ C1. E0, 04
        mov     edx, eax                                ; 1E3D _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1E3F _ 8B. 45, F4
        add     eax, edx                                ; 1E42 _ 01. D0
        add     eax, closebtn.1972                      ; 1E44 _ 05, 00000260(d)
        movzx   eax, byte [eax]                         ; 1E49 _ 0F B6. 00
        mov     byte [ebp-11H], al                      ; 1E4C _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 1E4F _ 80. 7D, EF, 40
        jnz     ?_057                                   ; 1E53 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 1E55 _ C6. 45, EF, 00
        jmp     ?_060                                   ; 1E59 _ EB, 1C

?_057:  cmp     byte [ebp-11H], 36                      ; 1E5B _ 80. 7D, EF, 24
        jnz     ?_058                                   ; 1E5F _ 75, 06
        mov     byte [ebp-11H], 15                      ; 1E61 _ C6. 45, EF, 0F
        jmp     ?_060                                   ; 1E65 _ EB, 10

?_058:  cmp     byte [ebp-11H], 81                      ; 1E67 _ 80. 7D, EF, 51
        jnz     ?_059                                   ; 1E6B _ 75, 06
        mov     byte [ebp-11H], 8                       ; 1E6D _ C6. 45, EF, 08
        jmp     ?_060                                   ; 1E71 _ EB, 04

?_059:  mov     byte [ebp-11H], 7                       ; 1E73 _ C6. 45, EF, 07
?_060:  mov     eax, dword [ebp+0CH]                    ; 1E77 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1E7A _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 1E7C _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 1E7F _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1E82 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1E85 _ 8B. 40, 04
        imul    ecx, eax                                ; 1E88 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1E8B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1E8E _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1E91 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 1E94 _ 8B. 45, F4
        add     eax, ebx                                ; 1E97 _ 01. D8
        add     eax, ecx                                ; 1E99 _ 01. C8
        add     edx, eax                                ; 1E9B _ 01. C2
        movzx   eax, byte [ebp-11H]                     ; 1E9D _ 0F B6. 45, EF
        mov     byte [edx], al                          ; 1EA1 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 1EA3 _ 83. 45, F4, 01
?_061:  cmp     dword [ebp-0CH], 15                     ; 1EA7 _ 83. 7D, F4, 0F
        jle     ?_056                                   ; 1EAB _ 7E, 8A
        add     dword [ebp-10H], 1                      ; 1EAD _ 83. 45, F0, 01
?_062:  cmp     dword [ebp-10H], 13                     ; 1EB1 _ 83. 7D, F0, 0D
        jle     ?_055                                   ; 1EB5 _ 0F 8E, FFFFFF73
        add     esp, 52                                 ; 1EBB _ 83. C4, 34
        pop     ebx                                     ; 1EBE _ 5B
        pop     ebp                                     ; 1EBF _ 5D
        ret                                             ; 1EC0 _ C3
; make_window_title End of function

transfer_scancode:; Function begin
        push    ebp                                     ; 1EC1 _ 55
        mov     ebp, esp                                ; 1EC2 _ 89. E5
        sub     esp, 16                                 ; 1EC4 _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 1EC7 _ 83. 7D, 08, 2A
        jnz     ?_063                                   ; 1ECB _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1ECD _ A1, 000001D0(d)
        or      eax, 01H                                ; 1ED2 _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 1ED5 _ A3, 000001D0(d)
?_063:  cmp     dword [ebp+8H], 54                      ; 1EDA _ 83. 7D, 08, 36
        jnz     ?_064                                   ; 1EDE _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1EE0 _ A1, 000001D0(d)
        or      eax, 02H                                ; 1EE5 _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 1EE8 _ A3, 000001D0(d)
?_064:  cmp     dword [ebp+8H], 170                     ; 1EED _ 81. 7D, 08, 000000AA
        jnz     ?_065                                   ; 1EF4 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1EF6 _ A1, 000001D0(d)
        and     eax, 0FFFFFFFEH                         ; 1EFB _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 1EFE _ A3, 000001D0(d)
?_065:  cmp     dword [ebp+8H], 182                     ; 1F03 _ 81. 7D, 08, 000000B6
        jnz     ?_066                                   ; 1F0A _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1F0C _ A1, 000001D0(d)
        and     eax, 0FFFFFFFDH                         ; 1F11 _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 1F14 _ A3, 000001D0(d)
?_066:  cmp     dword [ebp+8H], 58                      ; 1F19 _ 83. 7D, 08, 3A
        jnz     ?_068                                   ; 1F1D _ 75, 1F
        mov     eax, dword [caps_lock]                  ; 1F1F _ A1, 000001D4(d)
        test    eax, eax                                ; 1F24 _ 85. C0
        jnz     ?_067                                   ; 1F26 _ 75, 0C
        mov     dword [caps_lock], 1                    ; 1F28 _ C7. 05, 000001D4(d), 00000001
        jmp     ?_068                                   ; 1F32 _ EB, 0A

?_067:  mov     dword [caps_lock], 0                    ; 1F34 _ C7. 05, 000001D4(d), 00000000
?_068:  cmp     dword [ebp+8H], 42                      ; 1F3E _ 83. 7D, 08, 2A
        jz      ?_069                                   ; 1F42 _ 74, 24
        cmp     dword [ebp+8H], 54                      ; 1F44 _ 83. 7D, 08, 36
        jz      ?_069                                   ; 1F48 _ 74, 1E
        cmp     dword [ebp+8H], 170                     ; 1F4A _ 81. 7D, 08, 000000AA
        jz      ?_069                                   ; 1F51 _ 74, 15
        cmp     dword [ebp+8H], 182                     ; 1F53 _ 81. 7D, 08, 000000B6
        jz      ?_069                                   ; 1F5A _ 74, 0C
        cmp     dword [ebp+8H], 127                     ; 1F5C _ 83. 7D, 08, 7F
        jg      ?_069                                   ; 1F60 _ 7F, 06
        cmp     dword [ebp+8H], 58                      ; 1F62 _ 83. 7D, 08, 3A
        jnz     ?_070                                   ; 1F66 _ 75, 0A
?_069:  mov     eax, 0                                  ; 1F68 _ B8, 00000000
        jmp     ?_075                                   ; 1F6D _ E9, 00000089

?_070:  mov     byte [ebp-1H], 0                        ; 1F72 _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 1F76 _ A1, 000001D0(d)
        test    eax, eax                                ; 1F7B _ 85. C0
        jnz     ?_072                                   ; 1F7D _ 75, 46
        cmp     dword [ebp+8H], 127                     ; 1F7F _ 83. 7D, 08, 7F
        jg      ?_072                                   ; 1F83 _ 7F, 40
        mov     eax, dword [ebp+8H]                     ; 1F85 _ 8B. 45, 08
        add     eax, keytable                           ; 1F88 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 1F8D _ 0F B6. 00
        test    al, al                                  ; 1F90 _ 84. C0
        jz      ?_072                                   ; 1F92 _ 74, 31
        mov     eax, dword [ebp+8H]                     ; 1F94 _ 8B. 45, 08
        add     eax, keytable                           ; 1F97 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 1F9C _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 1F9F _ 88. 45, FF
        cmp     byte [ebp-1H], 64                       ; 1FA2 _ 80. 7D, FF, 40
        jle     ?_071                                   ; 1FA6 _ 7E, 1B
        cmp     byte [ebp-1H], 90                       ; 1FA8 _ 80. 7D, FF, 5A
        jg      ?_071                                   ; 1FAC _ 7F, 15
        mov     eax, dword [caps_lock]                  ; 1FAE _ A1, 000001D4(d)
        test    eax, eax                                ; 1FB3 _ 85. C0
        jnz     ?_071                                   ; 1FB5 _ 75, 0C
        movzx   eax, byte [ebp-1H]                      ; 1FB7 _ 0F B6. 45, FF
        add     eax, 32                                 ; 1FBB _ 83. C0, 20
        mov     byte [ebp-1H], al                       ; 1FBE _ 88. 45, FF
        jmp     ?_074                                   ; 1FC1 _ EB, 34

?_071:  jmp     ?_074                                   ; 1FC3 _ EB, 32

?_072:  mov     eax, dword [key_shift]                  ; 1FC5 _ A1, 000001D0(d)
        test    eax, eax                                ; 1FCA _ 85. C0
        jz      ?_073                                   ; 1FCC _ 74, 25
        cmp     dword [ebp+8H], 83                      ; 1FCE _ 83. 7D, 08, 53
        jg      ?_073                                   ; 1FD2 _ 7F, 1F
        mov     eax, dword [ebp+8H]                     ; 1FD4 _ 8B. 45, 08
        add     eax, keytable_shift                     ; 1FD7 _ 05, 000000A0(d)
        movzx   eax, byte [eax]                         ; 1FDC _ 0F B6. 00
        test    al, al                                  ; 1FDF _ 84. C0
        jz      ?_073                                   ; 1FE1 _ 74, 10
        mov     eax, dword [ebp+8H]                     ; 1FE3 _ 8B. 45, 08
        add     eax, keytable_shift                     ; 1FE6 _ 05, 000000A0(d)
        movzx   eax, byte [eax]                         ; 1FEB _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 1FEE _ 88. 45, FF
        jmp     ?_074                                   ; 1FF1 _ EB, 04

?_073:  mov     byte [ebp-1H], 0                        ; 1FF3 _ C6. 45, FF, 00
?_074:  movzx   eax, byte [ebp-1H]                      ; 1FF7 _ 0F B6. 45, FF
?_075:  leave                                           ; 1FFB _ C9
        ret                                             ; 1FFC _ C3
; transfer_scancode End of function

is_special_key:; Function begin
        push    ebp                                     ; 1FFD _ 55
        mov     ebp, esp                                ; 1FFE _ 89. E5
        sub     esp, 4                                  ; 2000 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 2003 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2006 _ 89. 04 24
        call    transfer_scancode                       ; 2009 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 42                      ; 200E _ 83. 7D, 08, 2A
        jz      ?_076                                   ; 2012 _ 74, 2D
        cmp     dword [ebp+8H], 54                      ; 2014 _ 83. 7D, 08, 36
        jz      ?_076                                   ; 2018 _ 74, 27
        cmp     dword [ebp+8H], 170                     ; 201A _ 81. 7D, 08, 000000AA
        jz      ?_076                                   ; 2021 _ 74, 1E
        cmp     dword [ebp+8H], 29                      ; 2023 _ 83. 7D, 08, 1D
        jz      ?_076                                   ; 2027 _ 74, 18
        cmp     dword [ebp+8H], 182                     ; 2029 _ 81. 7D, 08, 000000B6
        jz      ?_076                                   ; 2030 _ 74, 0F
        cmp     dword [ebp+8H], 58                      ; 2032 _ 83. 7D, 08, 3A
        jz      ?_076                                   ; 2036 _ 74, 09
        cmp     dword [ebp+8H], 186                     ; 2038 _ 81. 7D, 08, 000000BA
        jnz     ?_077                                   ; 203F _ 75, 07
?_076:  mov     eax, 1                                  ; 2041 _ B8, 00000001
        jmp     ?_078                                   ; 2046 _ EB, 05

?_077:  mov     eax, 0                                  ; 2048 _ B8, 00000000
?_078:  leave                                           ; 204D _ C9
        ret                                             ; 204E _ C3
; is_special_key End of function

console_task:; Function begin
        push    ebp                                     ; 204F _ 55
        mov     ebp, esp                                ; 2050 _ 89. E5
        push    ebx                                     ; 2052 _ 53
        sub     esp, 84                                 ; 2053 _ 83. EC, 54
        mov     dword [ebp-10H], 78848                  ; 2056 _ C7. 45, F0, 00013400
        call    task_now                                ; 205D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 2062 _ 89. 45, EC
        mov     dword [ebp-18H], 16                     ; 2065 _ C7. 45, E8, 00000010
        mov     dword [ebp-1CH], 28                     ; 206C _ C7. 45, E4, 0000001C
        mov     dword [ebp-0CH], 0                      ; 2073 _ C7. 45, F4, 00000000
        mov     dword [ebp-20H], 0                      ; 207A _ C7. 45, E0, 00000000
        mov     dword [ebp-24H], 0                      ; 2081 _ C7. 45, DC, 00000000
        mov     eax, dword [ebp+8H]                     ; 2088 _ 8B. 45, 08
        mov     dword [g_Console], eax                  ; 208B _ A3, 000000A8(d)
        mov     dword [?_336], 16                       ; 2090 _ C7. 05, 000000AC(d), 00000010
        mov     dword [?_337], 28                       ; 209A _ C7. 05, 000000B0(d), 0000001C
        mov     dword [?_338], -1                       ; 20A4 _ C7. 05, 000000B4(d), FFFFFFFF
        mov     eax, dword [memman]                     ; 20AE _ A1, 00000000(d)
        mov     dword [esp+4H], 128                     ; 20B3 _ C7. 44 24, 04, 00000080
        mov     dword [esp], eax                        ; 20BB _ 89. 04 24
        call    memman_alloc                            ; 20BE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 20C3 _ 89. 45, D8
        mov     eax, dword [memman]                     ; 20C6 _ A1, 00000000(d)
        mov     dword [esp+4H], 30                      ; 20CB _ C7. 44 24, 04, 0000001E
        mov     dword [esp], eax                        ; 20D3 _ 89. 04 24
        call    memman_alloc                            ; 20D6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 20DB _ 89. 45, D4
        mov     eax, dword [ebp-14H]                    ; 20DE _ 8B. 45, EC
        lea     edx, [eax+10H]                          ; 20E1 _ 8D. 50, 10
        mov     eax, dword [ebp-14H]                    ; 20E4 _ 8B. 45, EC
        mov     dword [esp+0CH], eax                    ; 20E7 _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 20EB _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 20EE _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 20F2 _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 20FA _ 89. 14 24
        call    fifo8_init                              ; 20FD _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 2102 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 2107 _ 89. 45, D0
        mov     eax, dword [ebp-14H]                    ; 210A _ 8B. 45, EC
        add     eax, 16                                 ; 210D _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 2110 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 2118 _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 211C _ 8B. 45, D0
        mov     dword [esp], eax                        ; 211F _ 89. 04 24
        call    timer_init                              ; 2122 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 2127 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-30H]                    ; 212F _ 8B. 45, D0
        mov     dword [esp], eax                        ; 2132 _ 89. 04 24
        call    timer_settime                           ; 2135 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 213A _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 213F _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_317                  ; 2147 _ C7. 44 24, 10, 0000006D(d)
        mov     dword [esp+0CH], 28                     ; 214F _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2157 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+8H]                     ; 215F _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 2162 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2166 _ 89. 04 24
        call    paint_string                            ; 2169 _ E8, FFFFFFFC(rel)
?_079:  call    io_cli                                  ; 216E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 2173 _ 8B. 45, EC
        add     eax, 16                                 ; 2176 _ 83. C0, 10
        mov     dword [esp], eax                        ; 2179 _ 89. 04 24
        call    fifo8_status                            ; 217C _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 2181 _ 85. C0
        jnz     ?_080                                   ; 2183 _ 75, 0A
        call    io_sti                                  ; 2185 _ E8, FFFFFFFC(rel)
        jmp     ?_093                                   ; 218A _ E9, 000003A2

?_080:  mov     eax, dword [ebp-14H]                    ; 218F _ 8B. 45, EC
        add     eax, 16                                 ; 2192 _ 83. C0, 10
        mov     dword [esp], eax                        ; 2195 _ 89. 04 24
        call    fifo8_get                               ; 2198 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 219D _ 89. 45, CC
        call    io_sti                                  ; 21A0 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-34H], 1                      ; 21A5 _ 83. 7D, CC, 01
        jg      ?_083                                   ; 21A9 _ 7F, 6E
        cmp     dword [ebp-0CH], 0                      ; 21AB _ 83. 7D, F4, 00
        js      ?_083                                   ; 21AF _ 78, 68
        cmp     dword [ebp-34H], 0                      ; 21B1 _ 83. 7D, CC, 00
        jz      ?_081                                   ; 21B5 _ 74, 26
        mov     eax, dword [ebp-14H]                    ; 21B7 _ 8B. 45, EC
        add     eax, 16                                 ; 21BA _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 21BD _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 21C5 _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 21C9 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 21CC _ 89. 04 24
        call    timer_init                              ; 21CF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 7                      ; 21D4 _ C7. 45, F4, 00000007
        jmp     ?_082                                   ; 21DB _ EB, 24

?_081:  mov     eax, dword [ebp-14H]                    ; 21DD _ 8B. 45, EC
        add     eax, 16                                 ; 21E0 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 21E3 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 21EB _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 21EF _ 8B. 45, D0
        mov     dword [esp], eax                        ; 21F2 _ 89. 04 24
        call    timer_init                              ; 21F5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 21FA _ C7. 45, F4, 00000000
?_082:  mov     dword [esp+4H], 50                      ; 2201 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-30H]                    ; 2209 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 220C _ 89. 04 24
        call    timer_settime                           ; 220F _ E8, FFFFFFFC(rel)
        jmp     ?_092                                   ; 2214 _ E9, 000002DE

?_083:  cmp     dword [ebp-34H], 87                     ; 2219 _ 83. 7D, CC, 57
        jnz     ?_084                                   ; 221D _ 75, 3C
        mov     dword [ebp-0CH], 7                      ; 221F _ C7. 45, F4, 00000007
        mov     eax, dword [ebp-14H]                    ; 2226 _ 8B. 45, EC
        add     eax, 16                                 ; 2229 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 222C _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 2234 _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 2238 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 223B _ 89. 04 24
        call    timer_init                              ; 223E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 2243 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-30H]                    ; 224B _ 8B. 45, D0
        mov     dword [esp], eax                        ; 224E _ 89. 04 24
        call    timer_settime                           ; 2251 _ E8, FFFFFFFC(rel)
        jmp     ?_092                                   ; 2256 _ E9, 0000029C

?_084:  cmp     dword [ebp-34H], 88                     ; 225B _ 83. 7D, CC, 58
        jnz     ?_085                                   ; 225F _ 75, 59
        mov     ecx, dword [?_337]                      ; 2261 _ 8B. 0D, 000000B0(d)
        mov     edx, dword [?_336]                      ; 2267 _ 8B. 15, 000000AC(d)
        mov     eax, dword [sheet_control]              ; 226D _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 2272 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 227A _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 227E _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 2282 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 2285 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2289 _ 89. 04 24
        call    set_cursor                              ; 228C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], -1                     ; 2291 _ C7. 45, F4, FFFFFFFF
        mov     eax, dword [task_main]                  ; 2298 _ A1, 00000000(d)
        mov     dword [esp+8H], 0                       ; 229D _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 22A5 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 22AD _ 89. 04 24
        call    task_run                                ; 22B0 _ E8, FFFFFFFC(rel)
        jmp     ?_092                                   ; 22B5 _ E9, 0000023D

?_085:  cmp     dword [ebp-34H], 14                     ; 22BA _ 83. 7D, CC, 0E
        jne     ?_086                                   ; 22BE _ 0F 85, 00000082
        mov     eax, dword [?_336]                      ; 22C4 _ A1, 000000AC(d)
        cmp     eax, 16                                 ; 22C9 _ 83. F8, 10
        jle     ?_086                                   ; 22CC _ 7E, 78
        mov     ebx, dword [?_337]                      ; 22CE _ 8B. 1D, 000000B0(d)
        mov     ecx, dword [?_336]                      ; 22D4 _ 8B. 0D, 000000AC(d)
        mov     edx, dword [g_Console]                  ; 22DA _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 22E0 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 22E5 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 22ED _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 22F1 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 22F5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 22F9 _ 89. 04 24
        call    set_cursor                              ; 22FC _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_336]                      ; 2301 _ A1, 000000AC(d)
        sub     eax, 8                                  ; 2306 _ 83. E8, 08
        mov     dword [?_336], eax                      ; 2309 _ A3, 000000AC(d)
        mov     ebx, dword [?_337]                      ; 230E _ 8B. 1D, 000000B0(d)
        mov     ecx, dword [?_336]                      ; 2314 _ 8B. 0D, 000000AC(d)
        mov     edx, dword [g_Console]                  ; 231A _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 2320 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 2325 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 232D _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2331 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2335 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2339 _ 89. 04 24
        call    set_cursor                              ; 233C _ E8, FFFFFFFC(rel)
        jmp     ?_092                                   ; 2341 _ E9, 000001B1

?_086:  cmp     dword [ebp-34H], 28                     ; 2346 _ 83. 7D, CC, 1C
        jne     ?_091                                   ; 234A _ 0F 85, 0000013A
        mov     ecx, dword [?_337]                      ; 2350 _ 8B. 0D, 000000B0(d)
        mov     edx, dword [?_336]                      ; 2356 _ 8B. 15, 000000AC(d)
        mov     eax, dword [sheet_control]              ; 235C _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 2361 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 2369 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 236D _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 2371 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 2374 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2378 _ 89. 04 24
        call    set_cursor                              ; 237B _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_336]                      ; 2380 _ A1, 000000AC(d)
        lea     edx, [eax+7H]                           ; 2385 _ 8D. 50, 07
        test    eax, eax                                ; 2388 _ 85. C0
        cmovs   eax, edx                                ; 238A _ 0F 48. C2
        sar     eax, 3                                  ; 238D _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 2390 _ 8D. 50, FE
        mov     eax, dword [ebp-2CH]                    ; 2393 _ 8B. 45, D4
        add     eax, edx                                ; 2396 _ 01. D0
        mov     byte [eax], 0                           ; 2398 _ C6. 00, 00
        mov     eax, dword [?_337]                      ; 239B _ A1, 000000B0(d)
        mov     edx, dword [ebp+8H]                     ; 23A0 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 23A3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 23A7 _ 89. 04 24
        call    console_new_line                        ; 23AA _ E8, FFFFFFFC(rel)
        mov     dword [?_337], eax                      ; 23AF _ A3, 000000B0(d)
        mov     dword [?_336], 16                       ; 23B4 _ C7. 05, 000000AC(d), 00000010
        mov     dword [esp+4H], ?_318                   ; 23BE _ C7. 44 24, 04, 0000006F(d)
        mov     eax, dword [ebp-2CH]                    ; 23C6 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 23C9 _ 89. 04 24
        call    strcmp                                  ; 23CC _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 23D1 _ 83. F8, 01
        jnz     ?_087                                   ; 23D4 _ 75, 10
        mov     eax, dword [ebp+0CH]                    ; 23D6 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 23D9 _ 89. 04 24
        call    command_mem                             ; 23DC _ E8, FFFFFFFC(rel)
        jmp     ?_092                                   ; 23E1 _ E9, 00000111

?_087:  mov     dword [esp+4H], ?_319                   ; 23E6 _ C7. 44 24, 04, 00000073(d)
        mov     eax, dword [ebp-2CH]                    ; 23EE _ 8B. 45, D4
        mov     dword [esp], eax                        ; 23F1 _ 89. 04 24
        call    strcmp                                  ; 23F4 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 23F9 _ 83. F8, 01
        jnz     ?_088                                   ; 23FC _ 75, 0A
        call    command_cls                             ; 23FE _ E8, FFFFFFFC(rel)
        jmp     ?_092                                   ; 2403 _ E9, 000000EF

?_088:  mov     dword [esp+4H], ?_320                   ; 2408 _ C7. 44 24, 04, 00000077(d)
        mov     eax, dword [ebp-2CH]                    ; 2410 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 2413 _ 89. 04 24
        call    strcmp                                  ; 2416 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 241B _ 83. F8, 01
        jnz     ?_089                                   ; 241E _ 75, 0A
        call    command_dir                             ; 2420 _ E8, FFFFFFFC(rel)
        jmp     ?_092                                   ; 2425 _ E9, 000000CD

?_089:  mov     eax, dword [ebp-2CH]                    ; 242A _ 8B. 45, D4
        movzx   eax, byte [eax]                         ; 242D _ 0F B6. 00
        cmp     al, 116                                 ; 2430 _ 3C, 74
        jnz     ?_090                                   ; 2432 _ 75, 37
        mov     eax, dword [ebp-2CH]                    ; 2434 _ 8B. 45, D4
        add     eax, 1                                  ; 2437 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 243A _ 0F B6. 00
        cmp     al, 121                                 ; 243D _ 3C, 79
        jnz     ?_090                                   ; 243F _ 75, 2A
        mov     eax, dword [ebp-2CH]                    ; 2441 _ 8B. 45, D4
        add     eax, 2                                  ; 2444 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 2447 _ 0F B6. 00
        cmp     al, 112                                 ; 244A _ 3C, 70
        jnz     ?_090                                   ; 244C _ 75, 1D
        mov     eax, dword [ebp-2CH]                    ; 244E _ 8B. 45, D4
        add     eax, 3                                  ; 2451 _ 83. C0, 03
        movzx   eax, byte [eax]                         ; 2454 _ 0F B6. 00
        cmp     al, 101                                 ; 2457 _ 3C, 65
        jnz     ?_090                                   ; 2459 _ 75, 10
        mov     eax, dword [ebp-2CH]                    ; 245B _ 8B. 45, D4
        mov     dword [esp], eax                        ; 245E _ 89. 04 24
        call    command_type                            ; 2461 _ E8, FFFFFFFC(rel)
        jmp     ?_092                                   ; 2466 _ E9, 0000008C

?_090:  mov     dword [esp+4H], ?_321                   ; 246B _ C7. 44 24, 04, 0000007B(d)
        mov     eax, dword [ebp-2CH]                    ; 2473 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 2476 _ 89. 04 24
        call    strcmp                                  ; 2479 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 247E _ 83. F8, 01
        jnz     ?_092                                   ; 2481 _ 75, 74
        call    command_hlt                             ; 2483 _ E8, FFFFFFFC(rel)
        jmp     ?_092                                   ; 2488 _ EB, 6D

?_091:  mov     eax, dword [ebp-34H]                    ; 248A _ 8B. 45, CC
        mov     dword [esp], eax                        ; 248D _ 89. 04 24
        call    transfer_scancode                       ; 2490 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-35H], al                      ; 2495 _ 88. 45, CB
        cmp     byte [ebp-35H], 0                       ; 2498 _ 80. 7D, CB, 00
        jz      ?_092                                   ; 249C _ 74, 59
        mov     eax, dword [?_336]                      ; 249E _ A1, 000000AC(d)
        cmp     eax, 239                                ; 24A3 _ 3D, 000000EF
        jg      ?_092                                   ; 24A8 _ 7F, 4D
        mov     eax, dword [?_336]                      ; 24AA _ A1, 000000AC(d)
        lea     edx, [eax+7H]                           ; 24AF _ 8D. 50, 07
        test    eax, eax                                ; 24B2 _ 85. C0
        cmovs   eax, edx                                ; 24B4 _ 0F 48. C2
        sar     eax, 3                                  ; 24B7 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 24BA _ 8D. 50, FE
        mov     eax, dword [ebp-2CH]                    ; 24BD _ 8B. 45, D4
        add     edx, eax                                ; 24C0 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 24C2 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 24C6 _ 88. 02
        mov     eax, dword [?_336]                      ; 24C8 _ A1, 000000AC(d)
        lea     edx, [eax+7H]                           ; 24CD _ 8D. 50, 07
        test    eax, eax                                ; 24D0 _ 85. C0
        cmovs   eax, edx                                ; 24D2 _ 0F 48. C2
        sar     eax, 3                                  ; 24D5 _ C1. F8, 03
        lea     edx, [eax-1H]                           ; 24D8 _ 8D. 50, FF
        mov     eax, dword [ebp-2CH]                    ; 24DB _ 8B. 45, D4
        add     eax, edx                                ; 24DE _ 01. D0
        mov     byte [eax], 0                           ; 24E0 _ C6. 00, 00
        movsx   eax, byte [ebp-35H]                     ; 24E3 _ 0F BE. 45, CB
        mov     dword [esp+4H], 1                       ; 24E7 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 24EF _ 89. 04 24
        call    c_console_putchar                       ; 24F2 _ E8, FFFFFFFC(rel)
?_092:  cmp     dword [ebp-0CH], 0                      ; 24F7 _ 83. 7D, F4, 00
        js      ?_093                                   ; 24FB _ 78, 34
        mov     ecx, dword [?_337]                      ; 24FD _ 8B. 0D, 000000B0(d)
        mov     edx, dword [?_336]                      ; 2503 _ 8B. 15, 000000AC(d)
        mov     eax, dword [sheet_control]              ; 2509 _ A1, 00000000(d)
        mov     ebx, dword [ebp-0CH]                    ; 250E _ 8B. 5D, F4
        mov     dword [esp+10H], ebx                    ; 2511 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2515 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2519 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 251D _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 2520 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2524 _ 89. 04 24
        call    set_cursor                              ; 2527 _ E8, FFFFFFFC(rel)
        jmp     ?_079                                   ; 252C _ E9, FFFFFC3D

?_093:  jmp     ?_079                                   ; 2531 _ E9, FFFFFC38
; console_task End of function

command_mem:; Function begin
        push    ebp                                     ; 2536 _ 55
        mov     ebp, esp                                ; 2537 _ 89. E5
        push    ebx                                     ; 2539 _ 53
        sub     esp, 52                                 ; 253A _ 83. EC, 34
        mov     eax, dword [ebp+8H]                     ; 253D _ 8B. 45, 08
        lea     edx, [eax+3FFH]                         ; 2540 _ 8D. 90, 000003FF
        test    eax, eax                                ; 2546 _ 85. C0
        cmovs   eax, edx                                ; 2548 _ 0F 48. C2
        sar     eax, 10                                 ; 254B _ C1. F8, 0A
        mov     dword [esp], eax                        ; 254E _ 89. 04 24
        call    intToHexStr                             ; 2551 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2556 _ 89. 45, F4
        mov     ecx, dword [?_337]                      ; 2559 _ 8B. 0D, 000000B0(d)
        mov     edx, dword [g_Console]                  ; 255F _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 2565 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 256A _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_322                  ; 2572 _ C7. 44 24, 10, 0000007F(d)
        mov     dword [esp+0CH], ecx                    ; 257A _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 257E _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 2586 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 258A _ 89. 04 24
        call    paint_string                            ; 258D _ E8, FFFFFFFC(rel)
        mov     ecx, dword [?_337]                      ; 2592 _ 8B. 0D, 000000B0(d)
        mov     edx, dword [g_Console]                  ; 2598 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 259E _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 25A3 _ C7. 44 24, 14, 00000007
        mov     ebx, dword [ebp-0CH]                    ; 25AB _ 8B. 5D, F4
        mov     dword [esp+10H], ebx                    ; 25AE _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 25B2 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 52                      ; 25B6 _ C7. 44 24, 08, 00000034
        mov     dword [esp+4H], edx                     ; 25BE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25C2 _ 89. 04 24
        call    paint_string                            ; 25C5 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [?_337]                      ; 25CA _ 8B. 0D, 000000B0(d)
        mov     edx, dword [g_Console]                  ; 25D0 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 25D6 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 25DB _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_323                  ; 25E3 _ C7. 44 24, 10, 00000085(d)
        mov     dword [esp+0CH], ecx                    ; 25EB _ 89. 4C 24, 0C
        mov     dword [esp+8H], 126                     ; 25EF _ C7. 44 24, 08, 0000007E
        mov     dword [esp+4H], edx                     ; 25F7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25FB _ 89. 04 24
        call    paint_string                            ; 25FE _ E8, FFFFFFFC(rel)
        mov     edx, dword [g_Console]                  ; 2603 _ 8B. 15, 000000A8(d)
        mov     eax, dword [?_337]                      ; 2609 _ A1, 000000B0(d)
        mov     dword [esp+4H], edx                     ; 260E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2612 _ 89. 04 24
        call    console_new_line                        ; 2615 _ E8, FFFFFFFC(rel)
        mov     dword [?_337], eax                      ; 261A _ A3, 000000B0(d)
        add     esp, 52                                 ; 261F _ 83. C4, 34
        pop     ebx                                     ; 2622 _ 5B
        pop     ebp                                     ; 2623 _ 5D
        ret                                             ; 2624 _ C3
; command_mem End of function

command_cls:; Function begin
        push    ebp                                     ; 2625 _ 55
        mov     ebp, esp                                ; 2626 _ 89. E5
        sub     esp, 56                                 ; 2628 _ 83. EC, 38
        mov     dword [ebp-0CH], 8                      ; 262B _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 28                     ; 2632 _ C7. 45, F0, 0000001C
        mov     dword [ebp-10H], 28                     ; 2639 _ C7. 45, F0, 0000001C
        jmp     ?_097                                   ; 2640 _ EB, 39

?_094:  mov     dword [ebp-0CH], 8                      ; 2642 _ C7. 45, F4, 00000008
        jmp     ?_096                                   ; 2649 _ EB, 23

?_095:  mov     eax, dword [g_Console]                  ; 264B _ A1, 000000A8(d)
        mov     edx, dword [eax]                        ; 2650 _ 8B. 10
        mov     eax, dword [g_Console]                  ; 2652 _ A1, 000000A8(d)
        mov     eax, dword [eax+4H]                     ; 2657 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 265A _ 0F AF. 45, F0
        mov     ecx, eax                                ; 265E _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2660 _ 8B. 45, F4
        add     eax, ecx                                ; 2663 _ 01. C8
        add     eax, edx                                ; 2665 _ 01. D0
        mov     byte [eax], 0                           ; 2667 _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 266A _ 83. 45, F4, 01
?_096:  cmp     dword [ebp-0CH], 247                    ; 266E _ 81. 7D, F4, 000000F7
        jle     ?_095                                   ; 2675 _ 7E, D4
        add     dword [ebp-10H], 1                      ; 2677 _ 83. 45, F0, 01
?_097:  cmp     dword [ebp-10H], 155                    ; 267B _ 81. 7D, F0, 0000009B
        jle     ?_094                                   ; 2682 _ 7E, BE
        mov     edx, dword [g_Console]                  ; 2684 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 268A _ A1, 00000000(d)
        mov     dword [esp+14H], 156                    ; 268F _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 2697 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 269F _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 26A7 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 26AF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 26B3 _ 89. 04 24
        call    sheet_refresh                           ; 26B6 _ E8, FFFFFFFC(rel)
        mov     dword [?_337], 28                       ; 26BB _ C7. 05, 000000B0(d), 0000001C
        mov     edx, dword [g_Console]                  ; 26C5 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 26CB _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 26D0 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_317                  ; 26D8 _ C7. 44 24, 10, 0000006D(d)
        mov     dword [esp+0CH], 28                     ; 26E0 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 26E8 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 26F0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 26F4 _ 89. 04 24
        call    paint_string                            ; 26F7 _ E8, FFFFFFFC(rel)
        leave                                           ; 26FC _ C9
        ret                                             ; 26FD _ C3
; command_cls End of function

command_dir:; Function begin
        push    ebp                                     ; 26FE _ 55
        mov     ebp, esp                                ; 26FF _ 89. E5
        push    ebx                                     ; 2701 _ 53
        sub     esp, 68                                 ; 2702 _ 83. EC, 44
        mov     dword [ebp-0CH], 78848                  ; 2705 _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 270C _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 2711 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 2719 _ 89. 04 24
        call    memman_alloc                            ; 271C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 2721 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 2724 _ 8B. 45, E8
        add     eax, 12                                 ; 2727 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 272A _ C6. 00, 00
        jmp     ?_105                                   ; 272D _ E9, 00000129

?_098:  mov     dword [ebp-10H], 0                      ; 2732 _ C7. 45, F0, 00000000
        jmp     ?_101                                   ; 2739 _ EB, 2C

?_099:  mov     edx, dword [ebp-0CH]                    ; 273B _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 273E _ 8B. 45, F0
        add     eax, edx                                ; 2741 _ 01. D0
        movzx   eax, byte [eax]                         ; 2743 _ 0F B6. 00
        test    al, al                                  ; 2746 _ 84. C0
        jz      ?_100                                   ; 2748 _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 274A _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 274D _ 8B. 45, E8
        add     edx, eax                                ; 2750 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 2752 _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 2755 _ 8B. 45, F0
        add     eax, ecx                                ; 2758 _ 01. C8
        movzx   eax, byte [eax]                         ; 275A _ 0F B6. 00
        mov     byte [edx], al                          ; 275D _ 88. 02
        add     dword [ebp-10H], 1                      ; 275F _ 83. 45, F0, 01
        jmp     ?_101                                   ; 2763 _ EB, 02

?_100:  jmp     ?_102                                   ; 2765 _ EB, 06

?_101:  cmp     dword [ebp-10H], 7                      ; 2767 _ 83. 7D, F0, 07
        jle     ?_099                                   ; 276B _ 7E, CE
?_102:  mov     edx, dword [ebp-10H]                    ; 276D _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 2770 _ 8B. 45, E8
        add     eax, edx                                ; 2773 _ 01. D0
        mov     byte [eax], 46                          ; 2775 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 2778 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 277C _ C7. 45, EC, 00000000
        jmp     ?_104                                   ; 2783 _ EB, 1E

?_103:  mov     edx, dword [ebp-10H]                    ; 2785 _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 2788 _ 8B. 45, E8
        add     edx, eax                                ; 278B _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 278D _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 2790 _ 8B. 45, EC
        add     eax, ecx                                ; 2793 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 2795 _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 2799 _ 88. 02
        add     dword [ebp-10H], 1                      ; 279B _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 279F _ 83. 45, EC, 01
?_104:  cmp     dword [ebp-14H], 2                      ; 27A3 _ 83. 7D, EC, 02
        jle     ?_103                                   ; 27A7 _ 7E, DC
        mov     edx, dword [ebp-10H]                    ; 27A9 _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 27AC _ 8B. 45, E8
        add     eax, edx                                ; 27AF _ 01. D0
        mov     byte [eax], 0                           ; 27B1 _ C6. 00, 00
        mov     ecx, dword [?_337]                      ; 27B4 _ 8B. 0D, 000000B0(d)
        mov     edx, dword [g_Console]                  ; 27BA _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 27C0 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 27C5 _ C7. 44 24, 14, 00000007
        mov     ebx, dword [ebp-18H]                    ; 27CD _ 8B. 5D, E8
        mov     dword [esp+10H], ebx                    ; 27D0 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 27D4 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 27D8 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 27E0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 27E4 _ 89. 04 24
        call    paint_string                            ; 27E7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], 136                    ; 27EC _ C7. 45, E4, 00000088
        mov     eax, dword [ebp-0CH]                    ; 27F3 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 27F6 _ 8B. 40, 1C
        mov     dword [esp], eax                        ; 27F9 _ 89. 04 24
        call    intToHexStr                             ; 27FC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 2801 _ 89. 45, E0
        mov     ecx, dword [?_337]                      ; 2804 _ 8B. 0D, 000000B0(d)
        mov     edx, dword [g_Console]                  ; 280A _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 2810 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2815 _ C7. 44 24, 14, 00000007
        mov     ebx, dword [ebp-20H]                    ; 281D _ 8B. 5D, E0
        mov     dword [esp+10H], ebx                    ; 2820 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2824 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-1CH]                    ; 2828 _ 8B. 4D, E4
        mov     dword [esp+8H], ecx                     ; 282B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 282F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2833 _ 89. 04 24
        call    paint_string                            ; 2836 _ E8, FFFFFFFC(rel)
        mov     edx, dword [g_Console]                  ; 283B _ 8B. 15, 000000A8(d)
        mov     eax, dword [?_337]                      ; 2841 _ A1, 000000B0(d)
        mov     dword [esp+4H], edx                     ; 2846 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 284A _ 89. 04 24
        call    console_new_line                        ; 284D _ E8, FFFFFFFC(rel)
        mov     dword [?_337], eax                      ; 2852 _ A3, 000000B0(d)
        add     dword [ebp-0CH], 32                     ; 2857 _ 83. 45, F4, 20
?_105:  mov     eax, dword [ebp-0CH]                    ; 285B _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 285E _ 0F B6. 00
        test    al, al                                  ; 2861 _ 84. C0
        jne     ?_098                                   ; 2863 _ 0F 85, FFFFFEC9
        mov     edx, dword [ebp-18H]                    ; 2869 _ 8B. 55, E8
        mov     eax, dword [memman]                     ; 286C _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 2871 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 2879 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 287D _ 89. 04 24
        call    memman_free                             ; 2880 _ E8, FFFFFFFC(rel)
        add     esp, 68                                 ; 2885 _ 83. C4, 44
        pop     ebx                                     ; 2888 _ 5B
        pop     ebp                                     ; 2889 _ 5D
        ret                                             ; 288A _ C3
; command_dir End of function

command_type:; Function begin
        push    ebp                                     ; 288B _ 55
        mov     ebp, esp                                ; 288C _ 89. E5
        push    esi                                     ; 288E _ 56
        push    ebx                                     ; 288F _ 53
        sub     esp, 96                                 ; 2890 _ 83. EC, 60
        mov     dword [ebp-0CH], 78848                  ; 2893 _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 289A _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 289F _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 28A7 _ 89. 04 24
        call    memman_alloc                            ; 28AA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 28AF _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 28B2 _ 8B. 45, DC
        add     eax, 12                                 ; 28B5 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 28B8 _ C6. 00, 00
        mov     dword [ebp-10H], 0                      ; 28BB _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 5                      ; 28C2 _ C7. 45, EC, 00000005
        mov     dword [ebp-14H], 5                      ; 28C9 _ C7. 45, EC, 00000005
        jmp     ?_108                                   ; 28D0 _ EB, 30

?_106:  mov     edx, dword [ebp-14H]                    ; 28D2 _ 8B. 55, EC
        mov     eax, dword [ebp+8H]                     ; 28D5 _ 8B. 45, 08
        add     eax, edx                                ; 28D8 _ 01. D0
        movzx   eax, byte [eax]                         ; 28DA _ 0F B6. 00
        test    al, al                                  ; 28DD _ 84. C0
        jz      ?_107                                   ; 28DF _ 74, 1F
        mov     edx, dword [ebp-10H]                    ; 28E1 _ 8B. 55, F0
        mov     eax, dword [ebp-24H]                    ; 28E4 _ 8B. 45, DC
        add     edx, eax                                ; 28E7 _ 01. C2
        mov     ecx, dword [ebp-14H]                    ; 28E9 _ 8B. 4D, EC
        mov     eax, dword [ebp+8H]                     ; 28EC _ 8B. 45, 08
        add     eax, ecx                                ; 28EF _ 01. C8
        movzx   eax, byte [eax]                         ; 28F1 _ 0F B6. 00
        mov     byte [edx], al                          ; 28F4 _ 88. 02
        add     dword [ebp-10H], 1                      ; 28F6 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 28FA _ 83. 45, EC, 01
        jmp     ?_108                                   ; 28FE _ EB, 02

?_107:  jmp     ?_109                                   ; 2900 _ EB, 06

?_108:  cmp     dword [ebp-14H], 16                     ; 2902 _ 83. 7D, EC, 10
        jle     ?_106                                   ; 2906 _ 7E, CA
?_109:  mov     edx, dword [ebp-10H]                    ; 2908 _ 8B. 55, F0
        mov     eax, dword [ebp-24H]                    ; 290B _ 8B. 45, DC
        add     eax, edx                                ; 290E _ 01. D0
        mov     byte [eax], 0                           ; 2910 _ C6. 00, 00
        jmp     ?_125                                   ; 2913 _ E9, 00000241

?_110:  mov     byte [ebp-2DH], 0                       ; 2918 _ C6. 45, D3, 00
        mov     dword [ebp-18H], 0                      ; 291C _ C7. 45, E8, 00000000
        jmp     ?_113                                   ; 2923 _ EB, 2C

?_111:  mov     edx, dword [ebp-0CH]                    ; 2925 _ 8B. 55, F4
        mov     eax, dword [ebp-18H]                    ; 2928 _ 8B. 45, E8
        add     eax, edx                                ; 292B _ 01. D0
        movzx   eax, byte [eax]                         ; 292D _ 0F B6. 00
        test    al, al                                  ; 2930 _ 84. C0
        jz      ?_112                                   ; 2932 _ 74, 1B
        mov     edx, dword [ebp-0CH]                    ; 2934 _ 8B. 55, F4
        mov     eax, dword [ebp-18H]                    ; 2937 _ 8B. 45, E8
        add     eax, edx                                ; 293A _ 01. D0
        movzx   eax, byte [eax]                         ; 293C _ 0F B6. 00
        lea     ecx, [ebp-39H]                          ; 293F _ 8D. 4D, C7
        mov     edx, dword [ebp-18H]                    ; 2942 _ 8B. 55, E8
        add     edx, ecx                                ; 2945 _ 01. CA
        mov     byte [edx], al                          ; 2947 _ 88. 02
        add     dword [ebp-18H], 1                      ; 2949 _ 83. 45, E8, 01
        jmp     ?_113                                   ; 294D _ EB, 02

?_112:  jmp     ?_114                                   ; 294F _ EB, 06

?_113:  cmp     dword [ebp-18H], 7                      ; 2951 _ 83. 7D, E8, 07
        jle     ?_111                                   ; 2955 _ 7E, CE
?_114:  lea     edx, [ebp-39H]                          ; 2957 _ 8D. 55, C7
        mov     eax, dword [ebp-18H]                    ; 295A _ 8B. 45, E8
        add     eax, edx                                ; 295D _ 01. D0
        mov     byte [eax], 46                          ; 295F _ C6. 00, 2E
        add     dword [ebp-18H], 1                      ; 2962 _ 83. 45, E8, 01
        mov     dword [ebp-1CH], 0                      ; 2966 _ C7. 45, E4, 00000000
        jmp     ?_116                                   ; 296D _ EB, 1E

?_115:  mov     edx, dword [ebp-0CH]                    ; 296F _ 8B. 55, F4
        mov     eax, dword [ebp-1CH]                    ; 2972 _ 8B. 45, E4
        add     eax, edx                                ; 2975 _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 2977 _ 0F B6. 40, 08
        lea     ecx, [ebp-39H]                          ; 297B _ 8D. 4D, C7
        mov     edx, dword [ebp-18H]                    ; 297E _ 8B. 55, E8
        add     edx, ecx                                ; 2981 _ 01. CA
        mov     byte [edx], al                          ; 2983 _ 88. 02
        add     dword [ebp-18H], 1                      ; 2985 _ 83. 45, E8, 01
        add     dword [ebp-1CH], 1                      ; 2989 _ 83. 45, E4, 01
?_116:  cmp     dword [ebp-1CH], 2                      ; 298D _ 83. 7D, E4, 02
        jle     ?_115                                   ; 2991 _ 7E, DC
        lea     edx, [ebp-39H]                          ; 2993 _ 8D. 55, C7
        mov     eax, dword [ebp-18H]                    ; 2996 _ 8B. 45, E8
        add     eax, edx                                ; 2999 _ 01. D0
        mov     byte [eax], 0                           ; 299B _ C6. 00, 00
        lea     eax, [ebp-39H]                          ; 299E _ 8D. 45, C7
        mov     dword [esp+4H], eax                     ; 29A1 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 29A5 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 29A8 _ 89. 04 24
        call    strcmp                                  ; 29AB _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 29B0 _ 83. F8, 01
        jne     ?_124                                   ; 29B3 _ 0F 85, 0000019C
        mov     dword [ebp-28H], 88064                  ; 29B9 _ C7. 45, D8, 00015800
        mov     eax, dword [ebp-0CH]                    ; 29C0 _ 8B. 45, F4
        movzx   eax, word [eax+1AH]                     ; 29C3 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 29C7 _ 0F B7. C0
        shl     eax, 9                                  ; 29CA _ C1. E0, 09
        add     dword [ebp-28H], eax                    ; 29CD _ 01. 45, D8
        mov     eax, dword [ebp-0CH]                    ; 29D0 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 29D3 _ 8B. 40, 1C
        mov     dword [ebp-2CH], eax                    ; 29D6 _ 89. 45, D4
        mov     dword [ebp-20H], 0                      ; 29D9 _ C7. 45, E0, 00000000
        mov     dword [?_336], 16                       ; 29E0 _ C7. 05, 000000AC(d), 00000010
        mov     dword [ebp-20H], 0                      ; 29EA _ C7. 45, E0, 00000000
        jmp     ?_123                                   ; 29F1 _ E9, 00000150

?_117:  mov     edx, dword [ebp-20H]                    ; 29F6 _ 8B. 55, E0
        mov     eax, dword [ebp-28H]                    ; 29F9 _ 8B. 45, D8
        add     eax, edx                                ; 29FC _ 01. D0
        movzx   eax, byte [eax]                         ; 29FE _ 0F B6. 00
        mov     byte [ebp-3BH], al                      ; 2A01 _ 88. 45, C5
        mov     byte [ebp-3AH], 0                       ; 2A04 _ C6. 45, C6, 00
        movzx   eax, byte [ebp-3BH]                     ; 2A08 _ 0F B6. 45, C5
        cmp     al, 9                                   ; 2A0C _ 3C, 09
        jnz     ?_120                                   ; 2A0E _ 75, 7E
?_118:  mov     ebx, dword [?_337]                      ; 2A10 _ 8B. 1D, 000000B0(d)
        mov     ecx, dword [?_336]                      ; 2A16 _ 8B. 0D, 000000AC(d)
        mov     edx, dword [g_Console]                  ; 2A1C _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 2A22 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2A27 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_324                  ; 2A2F _ C7. 44 24, 10, 00000089(d)
        mov     dword [esp+0CH], ebx                    ; 2A37 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2A3B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2A3F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2A43 _ 89. 04 24
        call    paint_string                            ; 2A46 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_336]                      ; 2A4B _ A1, 000000AC(d)
        add     eax, 8                                  ; 2A50 _ 83. C0, 08
        mov     dword [?_336], eax                      ; 2A53 _ A3, 000000AC(d)
        mov     eax, dword [?_336]                      ; 2A58 _ A1, 000000AC(d)
        cmp     eax, 248                                ; 2A5D _ 3D, 000000F8
        jnz     ?_119                                   ; 2A62 _ 75, 28
        mov     dword [?_336], 8                        ; 2A64 _ C7. 05, 000000AC(d), 00000008
        mov     edx, dword [g_Console]                  ; 2A6E _ 8B. 15, 000000A8(d)
        mov     eax, dword [?_337]                      ; 2A74 _ A1, 000000B0(d)
        mov     dword [esp+4H], edx                     ; 2A79 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2A7D _ 89. 04 24
        call    console_new_line                        ; 2A80 _ E8, FFFFFFFC(rel)
        mov     dword [?_337], eax                      ; 2A85 _ A3, 000000B0(d)
        jmp     ?_118                                   ; 2A8A _ EB, 84

?_119:  jmp     ?_118                                   ; 2A8C _ EB, 82

?_120:  movzx   eax, byte [ebp-3BH]                     ; 2A8E _ 0F B6. 45, C5
        cmp     al, 10                                  ; 2A92 _ 3C, 0A
        jnz     ?_121                                   ; 2A94 _ 75, 2B
        mov     dword [?_336], 8                        ; 2A96 _ C7. 05, 000000AC(d), 00000008
        mov     edx, dword [g_Console]                  ; 2AA0 _ 8B. 15, 000000A8(d)
        mov     eax, dword [?_337]                      ; 2AA6 _ A1, 000000B0(d)
        mov     dword [esp+4H], edx                     ; 2AAB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2AAF _ 89. 04 24
        call    console_new_line                        ; 2AB2 _ E8, FFFFFFFC(rel)
        mov     dword [?_337], eax                      ; 2AB7 _ A3, 000000B0(d)
        jmp     ?_122                                   ; 2ABC _ E9, 00000081

?_121:  movzx   eax, byte [ebp-3BH]                     ; 2AC1 _ 0F B6. 45, C5
        cmp     al, 13                                  ; 2AC5 _ 3C, 0D
        jz      ?_122                                   ; 2AC7 _ 74, 79
        mov     ebx, dword [?_337]                      ; 2AC9 _ 8B. 1D, 000000B0(d)
        mov     ecx, dword [?_336]                      ; 2ACF _ 8B. 0D, 000000AC(d)
        mov     edx, dword [g_Console]                  ; 2AD5 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 2ADB _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2AE0 _ C7. 44 24, 14, 00000007
        lea     esi, [ebp-3BH]                          ; 2AE8 _ 8D. 75, C5
        mov     dword [esp+10H], esi                    ; 2AEB _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2AEF _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2AF3 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2AF7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2AFB _ 89. 04 24
        call    paint_string                            ; 2AFE _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_336]                      ; 2B03 _ A1, 000000AC(d)
        add     eax, 8                                  ; 2B08 _ 83. C0, 08
        mov     dword [?_336], eax                      ; 2B0B _ A3, 000000AC(d)
        mov     eax, dword [?_336]                      ; 2B10 _ A1, 000000AC(d)
        cmp     eax, 248                                ; 2B15 _ 3D, 000000F8
        jnz     ?_122                                   ; 2B1A _ 75, 26
        mov     dword [?_336], 16                       ; 2B1C _ C7. 05, 000000AC(d), 00000010
        mov     edx, dword [g_Console]                  ; 2B26 _ 8B. 15, 000000A8(d)
        mov     eax, dword [?_337]                      ; 2B2C _ A1, 000000B0(d)
        mov     dword [esp+4H], edx                     ; 2B31 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2B35 _ 89. 04 24
        call    console_new_line                        ; 2B38 _ E8, FFFFFFFC(rel)
        mov     dword [?_337], eax                      ; 2B3D _ A3, 000000B0(d)
?_122:  add     dword [ebp-20H], 1                      ; 2B42 _ 83. 45, E0, 01
?_123:  mov     eax, dword [ebp-20H]                    ; 2B46 _ 8B. 45, E0
        cmp     eax, dword [ebp-2CH]                    ; 2B49 _ 3B. 45, D4
        jl      ?_117                                   ; 2B4C _ 0F 8C, FFFFFEA4
        nop                                             ; 2B52 _ 90
        jmp     ?_126                                   ; 2B53 _ EB, 12

?_124:  add     dword [ebp-0CH], 32                     ; 2B55 _ 83. 45, F4, 20
?_125:  mov     eax, dword [ebp-0CH]                    ; 2B59 _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 2B5C _ 0F B6. 00
        test    al, al                                  ; 2B5F _ 84. C0
        jne     ?_110                                   ; 2B61 _ 0F 85, FFFFFDB1
?_126:  mov     edx, dword [g_Console]                  ; 2B67 _ 8B. 15, 000000A8(d)
        mov     eax, dword [?_337]                      ; 2B6D _ A1, 000000B0(d)
        mov     dword [esp+4H], edx                     ; 2B72 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2B76 _ 89. 04 24
        call    console_new_line                        ; 2B79 _ E8, FFFFFFFC(rel)
        mov     dword [?_337], eax                      ; 2B7E _ A3, 000000B0(d)
        mov     dword [?_336], 16                       ; 2B83 _ C7. 05, 000000AC(d), 00000010
        mov     edx, dword [ebp-24H]                    ; 2B8D _ 8B. 55, DC
        mov     eax, dword [memman]                     ; 2B90 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 2B95 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 2B9D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2BA1 _ 89. 04 24
        call    memman_free                             ; 2BA4 _ E8, FFFFFFFC(rel)
        add     esp, 96                                 ; 2BA9 _ 83. C4, 60
        pop     ebx                                     ; 2BAC _ 5B
        pop     esi                                     ; 2BAD _ 5E
        pop     ebp                                     ; 2BAE _ 5D
        ret                                             ; 2BAF _ C3
; command_type End of function

command_hlt:; Function begin
        push    ebp                                     ; 2BB0 _ 55
        mov     ebp, esp                                ; 2BB1 _ 89. E5
        sub     esp, 56                                 ; 2BB3 _ 83. EC, 38
        mov     dword [esp+4H], buffer                  ; 2BB6 _ C7. 44 24, 04, 000001D8(d)
        mov     dword [esp], ?_325                      ; 2BBE _ C7. 04 24, 0000008B(d)
        call    file_load_content                       ; 2BC5 _ E8, FFFFFFFC(rel)
        call    get_addr_gdt                            ; 2BCA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2BCF _ 89. 45, F4
        mov     eax, dword [buffer]                     ; 2BD2 _ A1, 000001D8(d)
        mov     edx, dword [ebp-0CH]                    ; 2BD7 _ 8B. 55, F4
        add     edx, 88                                 ; 2BDA _ 83. C2, 58
        mov     dword [esp+0CH], 16634                  ; 2BDD _ C7. 44 24, 0C, 000040FA
        mov     dword [esp+8H], eax                     ; 2BE5 _ 89. 44 24, 08
        mov     dword [esp+4H], 1048575                 ; 2BE9 _ C7. 44 24, 04, 000FFFFF
        mov     dword [esp], edx                        ; 2BF1 _ 89. 14 24
        call    segment_descriptor                      ; 2BF4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 2BF9 _ A1, 00000000(d)
        mov     dword [esp+4H], 65536                   ; 2BFE _ C7. 44 24, 04, 00010000
        mov     dword [esp], eax                        ; 2C06 _ 89. 04 24
        call    memman_alloc_4k                         ; 2C09 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2C0E _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 2C11 _ 8B. 45, F0
        mov     edx, dword [ebp-0CH]                    ; 2C14 _ 8B. 55, F4
        add     edx, 96                                 ; 2C17 _ 83. C2, 60
        mov     dword [esp+0CH], 16626                  ; 2C1A _ C7. 44 24, 0C, 000040F2
        mov     dword [esp+8H], eax                     ; 2C22 _ 89. 44 24, 08
        mov     dword [esp+4H], 65535                   ; 2C26 _ C7. 44 24, 04, 0000FFFF
        mov     dword [esp], edx                        ; 2C2E _ 89. 14 24
        call    segment_descriptor                      ; 2C31 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 2C36 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 2C3B _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 2C3E _ 8B. 45, EC
        mov     dword [eax+30H], 0                      ; 2C41 _ C7. 40, 30, 00000000
        mov     eax, dword [ebp-14H]                    ; 2C48 _ 8B. 45, EC
        add     eax, 48                                 ; 2C4B _ 83. C0, 30
        mov     dword [esp+10H], eax                    ; 2C4E _ 89. 44 24, 10
        mov     dword [esp+0CH], 96                     ; 2C52 _ C7. 44 24, 0C, 00000060
        mov     dword [esp+8H], 65536                   ; 2C5A _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], 88                      ; 2C62 _ C7. 44 24, 04, 00000058
        mov     dword [esp], 0                          ; 2C6A _ C7. 04 24, 00000000
        call    start_app                               ; 2C71 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_341]                      ; 2C76 _ A1, 000001DC(d)
        mov     ecx, eax                                ; 2C7B _ 89. C1
        mov     eax, dword [buffer]                     ; 2C7D _ A1, 000001D8(d)
        mov     edx, eax                                ; 2C82 _ 89. C2
        mov     eax, dword [memman]                     ; 2C84 _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 2C89 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2C8D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2C91 _ 89. 04 24
        call    memman_free_4k                          ; 2C94 _ E8, FFFFFFFC(rel)
        mov     edx, dword [ebp-10H]                    ; 2C99 _ 8B. 55, F0
        mov     eax, dword [memman]                     ; 2C9C _ A1, 00000000(d)
        mov     dword [esp+8H], 65536                   ; 2CA1 _ C7. 44 24, 08, 00010000
        mov     dword [esp+4H], edx                     ; 2CA9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2CAD _ 89. 04 24
        call    memman_free_4k                          ; 2CB0 _ E8, FFFFFFFC(rel)
        leave                                           ; 2CB5 _ C9
        ret                                             ; 2CB6 _ C3
; command_hlt End of function

launch_console:; Function begin
        push    ebp                                     ; 2CB7 _ 55
        mov     ebp, esp                                ; 2CB8 _ 89. E5
        push    ebx                                     ; 2CBA _ 53
        sub     esp, 52                                 ; 2CBB _ 83. EC, 34
        mov     eax, dword [sheet_control]              ; 2CBE _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 2CC3 _ 89. 04 24
        call    sheet_alloc                             ; 2CC6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2CCB _ 89. 45, F4
        mov     eax, dword [memman]                     ; 2CCE _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 2CD3 _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 2CDB _ 89. 04 24
        call    memman_alloc_4k                         ; 2CDE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2CE3 _ 89. 45, F0
        mov     dword [esp+10H], 99                     ; 2CE6 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 2CEE _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 2CF6 _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-10H]                    ; 2CFE _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2D01 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 2D05 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 2D08 _ 89. 04 24
        call    sheet_setbuf                            ; 2D0B _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2D10 _ A1, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 2D15 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_326                   ; 2D1D _ C7. 44 24, 08, 00000093(d)
        mov     edx, dword [ebp-0CH]                    ; 2D25 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2D28 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2D2C _ 89. 04 24
        call    make_windows                            ; 2D2F _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 2D34 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 2D3C _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 2D44 _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 2D4C _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 2D54 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 2D5C _ 8B. 45, F4
        mov     dword [esp], eax                        ; 2D5F _ 89. 04 24
        call    make_textbox                            ; 2D62 _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 2D67 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 2D6C _ 89. 45, EC
        call    get_code32_addr                         ; 2D6F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 2D74 _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 2D77 _ 8B. 45, EC
        mov     dword [eax+8CH], 0                      ; 2D7A _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-14H]                    ; 2D84 _ 8B. 45, EC
        mov     dword [eax+90H], 1073741824             ; 2D87 _ C7. 80, 00000090, 40000000
        mov     eax, console_task                       ; 2D91 _ B8, 00000000(d)
        sub     eax, dword [ebp-18H]                    ; 2D96 _ 2B. 45, E8
        mov     edx, eax                                ; 2D99 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2D9B _ 8B. 45, EC
        mov     dword [eax+4CH], edx                    ; 2D9E _ 89. 50, 4C
        mov     eax, dword [ebp-14H]                    ; 2DA1 _ 8B. 45, EC
        mov     dword [eax+74H], 0                      ; 2DA4 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-14H]                    ; 2DAB _ 8B. 45, EC
        mov     dword [eax+78H], 8                      ; 2DAE _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-14H]                    ; 2DB5 _ 8B. 45, EC
        mov     dword [eax+7CH], 48                     ; 2DB8 _ C7. 40, 7C, 00000030
        mov     eax, dword [ebp-14H]                    ; 2DBF _ 8B. 45, EC
        mov     dword [eax+80H], 32                     ; 2DC2 _ C7. 80, 00000080, 00000020
        mov     eax, dword [ebp-14H]                    ; 2DCC _ 8B. 45, EC
        mov     dword [eax+84H], 0                      ; 2DCF _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-14H]                    ; 2DD9 _ 8B. 45, EC
        mov     dword [eax+88H], 16                     ; 2DDC _ C7. 80, 00000088, 00000010
        mov     eax, dword [ebp-14H]                    ; 2DE6 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 2DE9 _ 8B. 40, 64
        lea     edx, [eax-8H]                           ; 2DEC _ 8D. 50, F8
        mov     eax, dword [ebp-14H]                    ; 2DEF _ 8B. 45, EC
        mov     dword [eax+64H], edx                    ; 2DF2 _ 89. 50, 64
        mov     eax, dword [ebp-14H]                    ; 2DF5 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 2DF8 _ 8B. 40, 64
        add     eax, 4                                  ; 2DFB _ 83. C0, 04
        mov     edx, dword [ebp-0CH]                    ; 2DFE _ 8B. 55, F4
        mov     dword [eax], edx                        ; 2E01 _ 89. 10
        mov     eax, dword [ebp-14H]                    ; 2E03 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 2E06 _ 8B. 40, 64
        add     eax, 8                                  ; 2E09 _ 83. C0, 08
        mov     ebx, eax                                ; 2E0C _ 89. C3
        mov     eax, dword [memman]                     ; 2E0E _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 2E13 _ 89. 04 24
        call    memman_total                            ; 2E16 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 2E1B _ 89. 03
        mov     dword [esp+8H], 5                       ; 2E1D _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 2E25 _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-14H]                    ; 2E2D _ 8B. 45, EC
        mov     dword [esp], eax                        ; 2E30 _ 89. 04 24
        call    task_run                                ; 2E33 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2E38 _ A1, 00000000(d)
        mov     dword [esp+0CH], 4                      ; 2E3D _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 2E45 _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-0CH]                    ; 2E4D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2E50 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2E54 _ 89. 04 24
        call    sheet_slide                             ; 2E57 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2E5C _ A1, 00000000(d)
        mov     dword [esp+8H], 1                       ; 2E61 _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-0CH]                    ; 2E69 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2E6C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2E70 _ 89. 04 24
        call    sheet_updown                            ; 2E73 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 2E78 _ 8B. 45, EC
        mov     dword [task_console_g], eax             ; 2E7B _ A3, 00000000(d)
        mov     eax, dword [ebp-0CH]                    ; 2E80 _ 8B. 45, F4
        add     esp, 52                                 ; 2E83 _ 83. C4, 34
        pop     ebx                                     ; 2E86 _ 5B
        pop     ebp                                     ; 2E87 _ 5D
        ret                                             ; 2E88 _ C3
; launch_console End of function

set_cursor:; Function begin
        push    ebp                                     ; 2E89 _ 55
        mov     ebp, esp                                ; 2E8A _ 89. E5
        push    esi                                     ; 2E8C _ 56
        push    ebx                                     ; 2E8D _ 53
        sub     esp, 32                                 ; 2E8E _ 83. EC, 20
        mov     eax, dword [ebp+14H]                    ; 2E91 _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 2E94 _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 2E97 _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 2E9A _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 2E9D _ 8B. 45, 18
        movzx   ecx, al                                 ; 2EA0 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 2EA3 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 2EA6 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2EA9 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2EAC _ 8B. 00
        mov     dword [esp+18H], esi                    ; 2EAE _ 89. 74 24, 18
        mov     dword [esp+14H], ebx                    ; 2EB2 _ 89. 5C 24, 14
        mov     ebx, dword [ebp+14H]                    ; 2EB6 _ 8B. 5D, 14
        mov     dword [esp+10H], ebx                    ; 2EB9 _ 89. 5C 24, 10
        mov     ebx, dword [ebp+10H]                    ; 2EBD _ 8B. 5D, 10
        mov     dword [esp+0CH], ebx                    ; 2EC0 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2EC4 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2EC8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2ECC _ 89. 04 24
        call    paint_rectangle                         ; 2ECF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 2ED4 _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 2ED7 _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 2EDA _ 8B. 45, 10
        add     eax, 8                                  ; 2EDD _ 83. C0, 08
        mov     dword [esp+14H], edx                    ; 2EE0 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2EE4 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 2EE8 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 2EEB _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 2EEF _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 2EF2 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2EF6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2EF9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2EFD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F00 _ 89. 04 24
        call    sheet_refresh                           ; 2F03 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2F08 _ 83. C4, 20
        pop     ebx                                     ; 2F0B _ 5B
        pop     esi                                     ; 2F0C _ 5E
        pop     ebp                                     ; 2F0D _ 5D
        ret                                             ; 2F0E _ C3
; set_cursor End of function

console_new_line:; Function begin
        push    ebp                                     ; 2F0F _ 55
        mov     ebp, esp                                ; 2F10 _ 89. E5
        push    ebx                                     ; 2F12 _ 53
        sub     esp, 52                                 ; 2F13 _ 83. EC, 34
        cmp     dword [ebp+8H], 139                     ; 2F16 _ 81. 7D, 08, 0000008B
        jg      ?_127                                   ; 2F1D _ 7F, 09
        add     dword [ebp+8H], 16                      ; 2F1F _ 83. 45, 08, 10
        jmp     ?_136                                   ; 2F23 _ E9, 000000DF

?_127:  mov     dword [ebp-10H], 28                     ; 2F28 _ C7. 45, F0, 0000001C
        jmp     ?_131                                   ; 2F2F _ EB, 52

?_128:  mov     dword [ebp-0CH], 8                      ; 2F31 _ C7. 45, F4, 00000008
        jmp     ?_130                                   ; 2F38 _ EB, 3C

?_129:  mov     eax, dword [ebp+0CH]                    ; 2F3A _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2F3D _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2F3F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2F42 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 2F45 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 2F49 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2F4B _ 8B. 45, F4
        add     eax, ecx                                ; 2F4E _ 01. C8
        add     edx, eax                                ; 2F50 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2F52 _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 2F55 _ 8B. 08
        mov     eax, dword [ebp-10H]                    ; 2F57 _ 8B. 45, F0
        lea     ebx, [eax+10H]                          ; 2F5A _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 2F5D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2F60 _ 8B. 40, 04
        imul    ebx, eax                                ; 2F63 _ 0F AF. D8
        mov     eax, dword [ebp-0CH]                    ; 2F66 _ 8B. 45, F4
        add     eax, ebx                                ; 2F69 _ 01. D8
        add     eax, ecx                                ; 2F6B _ 01. C8
        movzx   eax, byte [eax]                         ; 2F6D _ 0F B6. 00
        mov     byte [edx], al                          ; 2F70 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 2F72 _ 83. 45, F4, 01
?_130:  cmp     dword [ebp-0CH], 247                    ; 2F76 _ 81. 7D, F4, 000000F7
        jle     ?_129                                   ; 2F7D _ 7E, BB
        add     dword [ebp-10H], 1                      ; 2F7F _ 83. 45, F0, 01
?_131:  cmp     dword [ebp-10H], 139                    ; 2F83 _ 81. 7D, F0, 0000008B
        jle     ?_128                                   ; 2F8A _ 7E, A5
        mov     dword [ebp-10H], 140                    ; 2F8C _ C7. 45, F0, 0000008C
        jmp     ?_135                                   ; 2F93 _ EB, 35

?_132:  mov     dword [ebp-0CH], 8                      ; 2F95 _ C7. 45, F4, 00000008
        jmp     ?_134                                   ; 2F9C _ EB, 1F

?_133:  mov     eax, dword [ebp+0CH]                    ; 2F9E _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2FA1 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2FA3 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2FA6 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 2FA9 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 2FAD _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2FAF _ 8B. 45, F4
        add     eax, ecx                                ; 2FB2 _ 01. C8
        add     eax, edx                                ; 2FB4 _ 01. D0
        mov     byte [eax], 0                           ; 2FB6 _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 2FB9 _ 83. 45, F4, 01
?_134:  cmp     dword [ebp-0CH], 247                    ; 2FBD _ 81. 7D, F4, 000000F7
        jle     ?_133                                   ; 2FC4 _ 7E, D8
        add     dword [ebp-10H], 1                      ; 2FC6 _ 83. 45, F0, 01
?_135:  cmp     dword [ebp-10H], 155                    ; 2FCA _ 81. 7D, F0, 0000009B
        jle     ?_132                                   ; 2FD1 _ 7E, C2
        mov     eax, dword [sheet_control]              ; 2FD3 _ A1, 00000000(d)
        mov     dword [esp+14H], 156                    ; 2FD8 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 2FE0 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 2FE8 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2FF0 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 2FF8 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2FFB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2FFF _ 89. 04 24
        call    sheet_refresh                           ; 3002 _ E8, FFFFFFFC(rel)
?_136:  mov     eax, dword [sheet_control]              ; 3007 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 300C _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_317                  ; 3014 _ C7. 44 24, 10, 0000006D(d)
        mov     edx, dword [ebp+8H]                     ; 301C _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 301F _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 3023 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 302B _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 302E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3032 _ 89. 04 24
        call    paint_string                            ; 3035 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 303A _ 8B. 45, 08
        add     esp, 52                                 ; 303D _ 83. C4, 34
        pop     ebx                                     ; 3040 _ 5B
        pop     ebp                                     ; 3041 _ 5D
        ret                                             ; 3042 _ C3
; console_new_line End of function

strcmp: ; Function begin
        push    ebp                                     ; 3043 _ 55
        mov     ebp, esp                                ; 3044 _ 89. E5
        sub     esp, 16                                 ; 3046 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 3049 _ 83. 7D, 08, 00
        jz      ?_137                                   ; 304D _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 304F _ 83. 7D, 0C, 00
        jnz     ?_138                                   ; 3053 _ 75, 0A
?_137:  mov     eax, 0                                  ; 3055 _ B8, 00000000
        jmp     ?_145                                   ; 305A _ E9, 00000092

?_138:  mov     dword [ebp-4H], 0                       ; 305F _ C7. 45, FC, 00000000
        jmp     ?_141                                   ; 3066 _ EB, 25

?_139:  mov     edx, dword [ebp-4H]                     ; 3068 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 306B _ 8B. 45, 08
        add     eax, edx                                ; 306E _ 01. D0
        movzx   edx, byte [eax]                         ; 3070 _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 3073 _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 3076 _ 8B. 45, 0C
        add     eax, ecx                                ; 3079 _ 01. C8
        movzx   eax, byte [eax]                         ; 307B _ 0F B6. 00
        cmp     dl, al                                  ; 307E _ 38. C2
        jz      ?_140                                   ; 3080 _ 74, 07
        mov     eax, 0                                  ; 3082 _ B8, 00000000
        jmp     ?_145                                   ; 3087 _ EB, 68

?_140:  add     dword [ebp-4H], 1                       ; 3089 _ 83. 45, FC, 01
?_141:  mov     edx, dword [ebp-4H]                     ; 308D _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 3090 _ 8B. 45, 08
        add     eax, edx                                ; 3093 _ 01. D0
        movzx   eax, byte [eax]                         ; 3095 _ 0F B6. 00
        test    al, al                                  ; 3098 _ 84. C0
        jz      ?_142                                   ; 309A _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 309C _ 83. 7D, 0C, 00
        jnz     ?_139                                   ; 30A0 _ 75, C6
?_142:  mov     edx, dword [ebp-4H]                     ; 30A2 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 30A5 _ 8B. 45, 08
        add     eax, edx                                ; 30A8 _ 01. D0
        movzx   eax, byte [eax]                         ; 30AA _ 0F B6. 00
        test    al, al                                  ; 30AD _ 84. C0
        jnz     ?_143                                   ; 30AF _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 30B1 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 30B4 _ 8B. 45, 0C
        add     eax, edx                                ; 30B7 _ 01. D0
        movzx   eax, byte [eax]                         ; 30B9 _ 0F B6. 00
        test    al, al                                  ; 30BC _ 84. C0
        jz      ?_143                                   ; 30BE _ 74, 07
        mov     eax, 0                                  ; 30C0 _ B8, 00000000
        jmp     ?_145                                   ; 30C5 _ EB, 2A

?_143:  mov     edx, dword [ebp-4H]                     ; 30C7 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 30CA _ 8B. 45, 08
        add     eax, edx                                ; 30CD _ 01. D0
        movzx   eax, byte [eax]                         ; 30CF _ 0F B6. 00
        test    al, al                                  ; 30D2 _ 84. C0
        jz      ?_144                                   ; 30D4 _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 30D6 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 30D9 _ 8B. 45, 0C
        add     eax, edx                                ; 30DC _ 01. D0
        movzx   eax, byte [eax]                         ; 30DE _ 0F B6. 00
        test    al, al                                  ; 30E1 _ 84. C0
        jz      ?_144                                   ; 30E3 _ 74, 07
        mov     eax, 0                                  ; 30E5 _ B8, 00000000
        jmp     ?_145                                   ; 30EA _ EB, 05

?_144:  mov     eax, 1                                  ; 30EC _ B8, 00000001
?_145:  leave                                           ; 30F1 _ C9
        ret                                             ; 30F2 _ C3
; strcmp End of function

c_console_putchar:; Function begin
        push    ebp                                     ; 30F3 _ 55
        mov     ebp, esp                                ; 30F4 _ 89. E5
        push    ebx                                     ; 30F6 _ 53
        sub     esp, 36                                 ; 30F7 _ 83. EC, 24
        mov     edx, dword [ebp+8H]                     ; 30FA _ 8B. 55, 08
        mov     eax, dword [ebp+0CH]                    ; 30FD _ 8B. 45, 0C
        mov     byte [ebp-0CH], dl                      ; 3100 _ 88. 55, F4
        mov     byte [ebp-10H], al                      ; 3103 _ 88. 45, F0
        mov     ebx, dword [?_337]                      ; 3106 _ 8B. 1D, 000000B0(d)
        mov     ecx, dword [?_336]                      ; 310C _ 8B. 0D, 000000AC(d)
        mov     edx, dword [g_Console]                  ; 3112 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 3118 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 311D _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 3125 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 3129 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 312D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3131 _ 89. 04 24
        call    set_cursor                              ; 3134 _ E8, FFFFFFFC(rel)
        movzx   eax, byte [ebp-0CH]                     ; 3139 _ 0F B6. 45, F4
        mov     byte [?_339], al                        ; 313D _ A2, 000000B8(d)
        mov     byte [?_340], 0                         ; 3142 _ C6. 05, 000000B9(d), 00
        mov     ebx, dword [?_337]                      ; 3149 _ 8B. 1D, 000000B0(d)
        mov     ecx, dword [?_336]                      ; 314F _ 8B. 0D, 000000AC(d)
        mov     edx, dword [g_Console]                  ; 3155 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 315B _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 3160 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_339                  ; 3168 _ C7. 44 24, 10, 000000B8(d)
        mov     dword [esp+0CH], ebx                    ; 3170 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 3174 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 3178 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 317C _ 89. 04 24
        call    paint_string                            ; 317F _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_336]                      ; 3184 _ A1, 000000AC(d)
        add     eax, 8                                  ; 3189 _ 83. C0, 08
        mov     dword [?_336], eax                      ; 318C _ A3, 000000AC(d)
        add     esp, 36                                 ; 3191 _ 83. C4, 24
        pop     ebx                                     ; 3194 _ 5B
        pop     ebp                                     ; 3195 _ 5D
        ret                                             ; 3196 _ C3
; c_console_putchar End of function

c_console_putstr:; Function begin
        push    ebp                                     ; 3197 _ 55
        mov     ebp, esp                                ; 3198 _ 89. E5
        sub     esp, 24                                 ; 319A _ 83. EC, 18
        jmp     ?_147                                   ; 319D _ EB, 1D

?_146:  mov     eax, dword [ebp+8H]                     ; 319F _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 31A2 _ 0F B6. 00
        movsx   eax, al                                 ; 31A5 _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 31A8 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 31B0 _ 89. 04 24
        call    c_console_putchar                       ; 31B3 _ E8, FFFFFFFC(rel)
        add     dword [ebp+8H], 1                       ; 31B8 _ 83. 45, 08, 01
?_147:  mov     eax, dword [ebp+8H]                     ; 31BC _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 31BF _ 0F B6. 00
        test    al, al                                  ; 31C2 _ 84. C0
        jnz     ?_146                                   ; 31C4 _ 75, D9
        leave                                           ; 31C6 _ C9
        ret                                             ; 31C7 _ C3
; c_console_putstr End of function

kernel_api:; Function begin
        push    ebp                                     ; 31C8 _ 55
        mov     ebp, esp                                ; 31C9 _ 89. E5
        sub     esp, 40                                 ; 31CB _ 83. EC, 28
        call    task_now                                ; 31CE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 31D3 _ 89. 45, F4
        cmp     dword [ebp+1CH], 1                      ; 31D6 _ 83. 7D, 1C, 01
        jnz     ?_148                                   ; 31DA _ 75, 18
        mov     eax, dword [ebp+24H]                    ; 31DC _ 8B. 45, 24
        movsx   eax, al                                 ; 31DF _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 31E2 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 31EA _ 89. 04 24
        call    c_console_putchar                       ; 31ED _ E8, FFFFFFFC(rel)
        jmp     ?_150                                   ; 31F2 _ EB, 29

?_148:  cmp     dword [ebp+1CH], 2                      ; 31F4 _ 83. 7D, 1C, 02
        jnz     ?_149                                   ; 31F8 _ 75, 15
        mov     edx, dword [buffer]                     ; 31FA _ 8B. 15, 000001D8(d)
        mov     eax, dword [ebp+18H]                    ; 3200 _ 8B. 45, 18
        add     eax, edx                                ; 3203 _ 01. D0
        mov     dword [esp], eax                        ; 3205 _ 89. 04 24
        call    c_console_putstr                        ; 3208 _ E8, FFFFFFFC(rel)
        jmp     ?_150                                   ; 320D _ EB, 0E

?_149:  cmp     dword [ebp+1CH], 4                      ; 320F _ 83. 7D, 1C, 04
        jnz     ?_150                                   ; 3213 _ 75, 08
        mov     eax, dword [ebp-0CH]                    ; 3215 _ 8B. 45, F4
        add     eax, 48                                 ; 3218 _ 83. C0, 30
        jmp     ?_151                                   ; 321B _ EB, 05

?_150:  mov     eax, 0                                  ; 321D _ B8, 00000000
?_151:  leave                                           ; 3222 _ C9
        ret                                             ; 3223 _ C3
; kernel_api End of function

intHandlerException:; Function begin
        push    ebp                                     ; 3224 _ 55
        mov     ebp, esp                                ; 3225 _ 89. E5
        sub     esp, 24                                 ; 3227 _ 83. EC, 18
        mov     dword [?_336], 8                        ; 322A _ C7. 05, 000000AC(d), 00000008
        mov     dword [esp], ?_327                      ; 3234 _ C7. 04 24, 0000009B(d)
        call    c_console_putstr                        ; 323B _ E8, FFFFFFFC(rel)
        mov     dword [?_336], 8                        ; 3240 _ C7. 05, 000000AC(d), 00000008
        mov     eax, dword [?_337]                      ; 324A _ A1, 000000B0(d)
        add     eax, 16                                 ; 324F _ 83. C0, 10
        mov     dword [?_337], eax                      ; 3252 _ A3, 000000B0(d)
        mov     dword [esp], ?_328                      ; 3257 _ C7. 04 24, 000000A3(d)
        call    c_console_putstr                        ; 325E _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_337]                      ; 3263 _ A1, 000000B0(d)
        add     eax, 16                                 ; 3268 _ 83. C0, 10
        mov     dword [?_337], eax                      ; 326B _ A3, 000000B0(d)
        mov     dword [?_336], 8                        ; 3270 _ C7. 05, 000000AC(d), 00000008
        nop                                             ; 327A _ 90
        leave                                           ; 327B _ C9
        ret                                             ; 327C _ C3
; intHandlerException End of function

intHandlerStackOverflow:; Function begin
        push    ebp                                     ; 327D _ 55
        mov     ebp, esp                                ; 327E _ 89. E5
        sub     esp, 40                                 ; 3280 _ 83. EC, 28
        mov     dword [?_336], 8                        ; 3283 _ C7. 05, 000000AC(d), 00000008
        mov     dword [esp], ?_329                      ; 328D _ C7. 04 24, 000000BF(d)
        call    c_console_putstr                        ; 3294 _ E8, FFFFFFFC(rel)
        mov     dword [?_336], 8                        ; 3299 _ C7. 05, 000000AC(d), 00000008
        mov     eax, dword [?_337]                      ; 32A3 _ A1, 000000B0(d)
        add     eax, 16                                 ; 32A8 _ 83. C0, 10
        mov     dword [?_337], eax                      ; 32AB _ A3, 000000B0(d)
        mov     dword [esp], ?_330                      ; 32B0 _ C7. 04 24, 000000C6(d)
        call    c_console_putstr                        ; 32B7 _ E8, FFFFFFFC(rel)
        mov     dword [?_336], 8                        ; 32BC _ C7. 05, 000000AC(d), 00000008
        mov     eax, dword [?_337]                      ; 32C6 _ A1, 000000B0(d)
        add     eax, 16                                 ; 32CB _ 83. C0, 10
        mov     dword [?_337], eax                      ; 32CE _ A3, 000000B0(d)
        mov     eax, dword [ebp+8H]                     ; 32D3 _ 8B. 45, 08
        add     eax, 44                                 ; 32D6 _ 83. C0, 2C
        mov     eax, dword [eax]                        ; 32D9 _ 8B. 00
        mov     dword [esp], eax                        ; 32DB _ 89. 04 24
        call    intToHexStr                             ; 32DE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 32E3 _ 89. 45, F4
        mov     dword [esp], ?_331                      ; 32E6 _ C7. 04 24, 000000D6(d)
        call    c_console_putstr                        ; 32ED _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 32F2 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 32F5 _ 89. 04 24
        call    c_console_putstr                        ; 32F8 _ E8, FFFFFFFC(rel)
        mov     dword [?_336], 8                        ; 32FD _ C7. 05, 000000AC(d), 00000008
        mov     eax, dword [?_337]                      ; 3307 _ A1, 000000B0(d)
        add     eax, 16                                 ; 330C _ 83. C0, 10
        mov     dword [?_337], eax                      ; 330F _ A3, 000000B0(d)
        call    task_now                                ; 3314 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3319 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 331C _ 8B. 45, F0
        add     eax, 48                                 ; 331F _ 83. C0, 30
        leave                                           ; 3322 _ C9
        ret                                             ; 3323 _ C3
; intHandlerStackOverflow End of function

kill_process:; Function begin
        push    ebp                                     ; 3324 _ 55
        mov     ebp, esp                                ; 3325 _ 89. E5
        sub     esp, 24                                 ; 3327 _ 83. EC, 18
        mov     edx, dword [g_Console]                  ; 332A _ 8B. 15, 000000A8(d)
        mov     eax, dword [?_337]                      ; 3330 _ A1, 000000B0(d)
        mov     dword [esp+4H], edx                     ; 3335 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3339 _ 89. 04 24
        call    console_new_line                        ; 333C _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_337]                      ; 3341 _ A1, 000000B0(d)
        add     eax, 16                                 ; 3346 _ 83. C0, 10
        mov     dword [?_337], eax                      ; 3349 _ A3, 000000B0(d)
        mov     eax, dword [task_console_g]             ; 334E _ A1, 00000000(d)
        add     eax, 48                                 ; 3353 _ 83. C0, 30
        mov     dword [esp], eax                        ; 3356 _ 89. 04 24
        call    asm_end_app                             ; 3359 _ E8, FFFFFFFC(rel)
        leave                                           ; 335E _ C9
        ret                                             ; 335F _ C3
; kill_process End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 3360 _ 55
        mov     ebp, esp                                ; 3361 _ 89. E5
        sub     esp, 24                                 ; 3363 _ 83. EC, 18
?_152:  mov     dword [esp], 100                        ; 3366 _ C7. 04 24, 00000064
        call    io_in8                                  ; 336D _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 3372 _ 83. E0, 02
        test    eax, eax                                ; 3375 _ 85. C0
        jnz     ?_153                                   ; 3377 _ 75, 02
        jmp     ?_154                                   ; 3379 _ EB, 02

?_153:  jmp     ?_152                                   ; 337B _ EB, E9

?_154:  leave                                           ; 337D _ C9
        ret                                             ; 337E _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 337F _ 55
        mov     ebp, esp                                ; 3380 _ 89. E5
        sub     esp, 24                                 ; 3382 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 3385 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 338A _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 3392 _ C7. 04 24, 00000064
        call    io_out8                                 ; 3399 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 339E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 33A3 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 33AB _ C7. 04 24, 00000060
        call    io_out8                                 ; 33B2 _ E8, FFFFFFFC(rel)
        leave                                           ; 33B7 _ C9
        ret                                             ; 33B8 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 33B9 _ 55
        mov     ebp, esp                                ; 33BA _ 89. E5
        sub     esp, 24                                 ; 33BC _ 83. EC, 18
        call    wait_KBC_sendready                      ; 33BF _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 33C4 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 33CC _ C7. 04 24, 00000064
        call    io_out8                                 ; 33D3 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 33D8 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 33DD _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 33E5 _ C7. 04 24, 00000060
        call    io_out8                                 ; 33EC _ E8, FFFFFFFC(rel)
        leave                                           ; 33F1 _ C9
        ret                                             ; 33F2 _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 33F3 _ 55
        mov     ebp, esp                                ; 33F4 _ 89. E5
        sub     esp, 4                                  ; 33F6 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 33F9 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 33FC _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 33FF _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3402 _ 0F B6. 40, 03
        test    al, al                                  ; 3406 _ 84. C0
        jnz     ?_156                                   ; 3408 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 340A _ 80. 7D, FC, FA
        jnz     ?_155                                   ; 340E _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 3410 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 3413 _ C6. 40, 03, 01
?_155:  mov     eax, 0                                  ; 3417 _ B8, 00000000
        jmp     ?_163                                   ; 341C _ E9, 0000010F

?_156:  mov     eax, dword [ebp+8H]                     ; 3421 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3424 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 3428 _ 3C, 01
        jnz     ?_158                                   ; 342A _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 342C _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 3430 _ 25, 000000C8
        cmp     eax, 8                                  ; 3435 _ 83. F8, 08
        jnz     ?_157                                   ; 3438 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 343A _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 343D _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 3441 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 3443 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 3446 _ C6. 40, 03, 02
?_157:  mov     eax, 0                                  ; 344A _ B8, 00000000
        jmp     ?_163                                   ; 344F _ E9, 000000DC

?_158:  mov     eax, dword [ebp+8H]                     ; 3454 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3457 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 345B _ 3C, 02
        jnz     ?_159                                   ; 345D _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 345F _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3462 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 3466 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3469 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 346C _ C6. 40, 03, 03
        mov     eax, 0                                  ; 3470 _ B8, 00000000
        jmp     ?_163                                   ; 3475 _ E9, 000000B6

?_159:  mov     eax, dword [ebp+8H]                     ; 347A _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 347D _ 0F B6. 40, 03
        cmp     al, 3                                   ; 3481 _ 3C, 03
        jne     ?_162                                   ; 3483 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 3489 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 348C _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 3490 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 3493 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 3496 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 349A _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 349D _ 0F B6. 00
        movzx   eax, al                                 ; 34A0 _ 0F B6. C0
        and     eax, 07H                                ; 34A3 _ 83. E0, 07
        mov     edx, eax                                ; 34A6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34A8 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 34AB _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 34AE _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 34B1 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 34B5 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 34B8 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 34BB _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 34BE _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 34C1 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 34C5 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 34C8 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 34CB _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 34CE _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 34D1 _ 0F B6. 00
        movzx   eax, al                                 ; 34D4 _ 0F B6. C0
        and     eax, 10H                                ; 34D7 _ 83. E0, 10
        test    eax, eax                                ; 34DA _ 85. C0
        jz      ?_160                                   ; 34DC _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 34DE _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 34E1 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 34E4 _ 0D, FFFFFF00
        mov     edx, eax                                ; 34E9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34EB _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 34EE _ 89. 50, 04
?_160:  mov     eax, dword [ebp+8H]                     ; 34F1 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 34F4 _ 0F B6. 00
        movzx   eax, al                                 ; 34F7 _ 0F B6. C0
        and     eax, 20H                                ; 34FA _ 83. E0, 20
        test    eax, eax                                ; 34FD _ 85. C0
        jz      ?_161                                   ; 34FF _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 3501 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3504 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 3507 _ 0D, FFFFFF00
        mov     edx, eax                                ; 350C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 350E _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3511 _ 89. 50, 08
?_161:  mov     eax, dword [ebp+8H]                     ; 3514 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3517 _ 8B. 40, 08
        neg     eax                                     ; 351A _ F7. D8
        mov     edx, eax                                ; 351C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 351E _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3521 _ 89. 50, 08
        mov     eax, 1                                  ; 3524 _ B8, 00000001
        jmp     ?_163                                   ; 3529 _ EB, 05

?_162:  mov     eax, 4294967295                         ; 352B _ B8, FFFFFFFF
?_163:  leave                                           ; 3530 _ C9
        ret                                             ; 3531 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 3532 _ 55
        mov     ebp, esp                                ; 3533 _ 89. E5
        sub     esp, 40                                 ; 3535 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 3538 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 3540 _ C7. 04 24, 00000020
        call    io_out8                                 ; 3547 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 354C _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 3554 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 355B _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 3560 _ C7. 04 24, 00000060
        call    io_in8                                  ; 3567 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 356C _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 356F _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 3573 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 3577 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 357E _ E8, FFFFFFFC(rel)
        leave                                           ; 3583 _ C9
        ret                                             ; 3584 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 3585 _ 55
        mov     ebp, esp                                ; 3586 _ 89. E5
        sub     esp, 40                                 ; 3588 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 358B _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 3593 _ C7. 04 24, 00000020
        call    io_out8                                 ; 359A _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 359F _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 35A7 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 35AE _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 35B3 _ C7. 04 24, 00000060
        call    io_in8                                  ; 35BA _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 35BF _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 35C2 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 35C6 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 35CA _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 35D1 _ E8, FFFFFFFC(rel)
        leave                                           ; 35D6 _ C9
        ret                                             ; 35D7 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 35D8 _ 55
        mov     ebp, esp                                ; 35D9 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 35DB _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 35DE _ 8B. 55, 10
        mov     dword [eax], edx                        ; 35E1 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 35E3 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 35E6 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 35ED _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 35F0 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 35F7 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 35FA _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 35FD _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3600 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3603 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 3606 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 3609 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 360C _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 3613 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 3616 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 3619 _ 89. 50, 18
        pop     ebp                                     ; 361C _ 5D
        ret                                             ; 361D _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 361E _ 55
        mov     ebp, esp                                ; 361F _ 89. E5
        sub     esp, 40                                 ; 3621 _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 3624 _ 8B. 45, 0C
        mov     byte [ebp-1CH], al                      ; 3627 _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 362A _ 83. 7D, 08, 00
        jnz     ?_164                                   ; 362E _ 75, 0A
        mov     eax, 4294967295                         ; 3630 _ B8, FFFFFFFF
        jmp     ?_168                                   ; 3635 _ E9, 000000B1

?_164:  mov     eax, dword [ebp+8H]                     ; 363A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 363D _ 8B. 40, 10
        test    eax, eax                                ; 3640 _ 85. C0
        jnz     ?_165                                   ; 3642 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 3644 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 3647 _ 8B. 40, 14
        or      eax, 01H                                ; 364A _ 83. C8, 01
        mov     edx, eax                                ; 364D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 364F _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 3652 _ 89. 50, 14
        mov     eax, 4294967295                         ; 3655 _ B8, FFFFFFFF
        jmp     ?_168                                   ; 365A _ E9, 0000008C

?_165:  mov     eax, dword [ebp+8H]                     ; 365F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3662 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 3665 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3668 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 366B _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 366D _ 8B. 45, F4
        add     edx, eax                                ; 3670 _ 01. C2
        movzx   eax, byte [ebp-1CH]                     ; 3672 _ 0F B6. 45, E4
        mov     byte [edx], al                          ; 3676 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 3678 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 367B _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 367E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3681 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3684 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3687 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 368A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 368D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3690 _ 8B. 40, 0C
        cmp     edx, eax                                ; 3693 _ 39. C2
        jnz     ?_166                                   ; 3695 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 3697 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 369A _ C7. 40, 04, 00000000
?_166:  mov     eax, dword [ebp+8H]                     ; 36A1 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 36A4 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 36A7 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 36AA _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 36AD _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 36B0 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 36B3 _ 8B. 40, 18
        test    eax, eax                                ; 36B6 _ 85. C0
        jz      ?_167                                   ; 36B8 _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 36BA _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 36BD _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 36C0 _ 8B. 40, 04
        cmp     eax, 2                                  ; 36C3 _ 83. F8, 02
        jz      ?_167                                   ; 36C6 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 36C8 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 36CB _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 36CE _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 36D6 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 36DE _ 89. 04 24
        call    task_run                                ; 36E1 _ E8, FFFFFFFC(rel)
?_167:  mov     eax, 0                                  ; 36E6 _ B8, 00000000
?_168:  leave                                           ; 36EB _ C9
        ret                                             ; 36EC _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 36ED _ 55
        mov     ebp, esp                                ; 36EE _ 89. E5
        sub     esp, 16                                 ; 36F0 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 36F3 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 36F6 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 36F9 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 36FC _ 8B. 40, 0C
        cmp     edx, eax                                ; 36FF _ 39. C2
        jnz     ?_169                                   ; 3701 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 3703 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 3706 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 370D _ B8, FFFFFFFF
        jmp     ?_171                                   ; 3712 _ EB, 57

?_169:  mov     eax, dword [ebp+8H]                     ; 3714 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3717 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 371A _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 371D _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 3720 _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 3722 _ 8B. 45, F8
        add     eax, edx                                ; 3725 _ 01. D0
        movzx   eax, byte [eax]                         ; 3727 _ 0F B6. 00
        movzx   eax, al                                 ; 372A _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 372D _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3730 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3733 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 3736 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3739 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 373C _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 373F _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 3742 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3745 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3748 _ 8B. 40, 0C
        cmp     edx, eax                                ; 374B _ 39. C2
        jnz     ?_170                                   ; 374D _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 374F _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 3752 _ C7. 40, 08, 00000000
?_170:  mov     eax, dword [ebp+8H]                     ; 3759 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 375C _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 375F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3762 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 3765 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 3768 _ 8B. 45, FC
?_171:  leave                                           ; 376B _ C9
        ret                                             ; 376C _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 376D _ 55
        mov     ebp, esp                                ; 376E _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3770 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 3773 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3776 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3779 _ 8B. 40, 10
        sub     edx, eax                                ; 377C _ 29. C2
        mov     eax, edx                                ; 377E _ 89. D0
        pop     ebp                                     ; 3780 _ 5D
        ret                                             ; 3781 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 3782 _ 55
        mov     ebp, esp                                ; 3783 _ 89. E5
        sub     esp, 4                                  ; 3785 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 3788 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 378B _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 378E _ 80. 7D, FC, 09
        jle     ?_172                                   ; 3792 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 3794 _ 0F B6. 45, FC
        add     eax, 55                                 ; 3798 _ 83. C0, 37
        jmp     ?_173                                   ; 379B _ EB, 07

?_172:  movzx   eax, byte [ebp-4H]                      ; 379D _ 0F B6. 45, FC
        add     eax, 48                                 ; 37A1 _ 83. C0, 30
?_173:  leave                                           ; 37A4 _ C9
        ret                                             ; 37A5 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 37A6 _ 55
        mov     ebp, esp                                ; 37A7 _ 89. E5
        sub     esp, 24                                 ; 37A9 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 37AC _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 37AF _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 37B2 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 37B9 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 37BD _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 37C0 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 37C3 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 37C7 _ 89. 04 24
        call    charToHexVal                            ; 37CA _ E8, FFFFFFFC(rel)
        mov     byte [?_333], al                        ; 37CF _ A2, 00000343(d)
        movzx   eax, byte [ebp-14H]                     ; 37D4 _ 0F B6. 45, EC
        shr     al, 4                                   ; 37D8 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 37DB _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 37DE _ 0F B6. 45, EC
        movsx   eax, al                                 ; 37E2 _ 0F BE. C0
        mov     dword [esp], eax                        ; 37E5 _ 89. 04 24
        call    charToHexVal                            ; 37E8 _ E8, FFFFFFFC(rel)
        mov     byte [?_332], al                        ; 37ED _ A2, 00000342(d)
        mov     eax, keyval                             ; 37F2 _ B8, 00000340(d)
        leave                                           ; 37F7 _ C9
        ret                                             ; 37F8 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 37F9 _ 55
        mov     ebp, esp                                ; 37FA _ 89. E5
        sub     esp, 16                                 ; 37FC _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 37FF _ C6. 05, 000002E0(d), 30
        mov     byte [?_342], 88                        ; 3806 _ C6. 05, 000002E1(d), 58
        mov     byte [?_343], 0                         ; 380D _ C6. 05, 000002EA(d), 00
        mov     dword [ebp-0CH], 2                      ; 3814 _ C7. 45, F4, 00000002
        jmp     ?_175                                   ; 381B _ EB, 0F

?_174:  mov     eax, dword [ebp-0CH]                    ; 381D _ 8B. 45, F4
        add     eax, str.1386                           ; 3820 _ 05, 000002E0(d)
        mov     byte [eax], 48                          ; 3825 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 3828 _ 83. 45, F4, 01
?_175:  cmp     dword [ebp-0CH], 9                      ; 382C _ 83. 7D, F4, 09
        jle     ?_174                                   ; 3830 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 3832 _ C7. 45, F8, 00000009
        jmp     ?_179                                   ; 3839 _ EB, 40

?_176:  mov     eax, dword [ebp+8H]                     ; 383B _ 8B. 45, 08
        and     eax, 0FH                                ; 383E _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 3841 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3844 _ 8B. 45, 08
        shr     eax, 4                                  ; 3847 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 384A _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 384D _ 83. 7D, FC, 09
        jle     ?_177                                   ; 3851 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 3853 _ 8B. 45, FC
        add     eax, 55                                 ; 3856 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 3859 _ 8B. 55, F8
        add     edx, str.1386                           ; 385C _ 81. C2, 000002E0(d)
        mov     byte [edx], al                          ; 3862 _ 88. 02
        jmp     ?_178                                   ; 3864 _ EB, 11

?_177:  mov     eax, dword [ebp-4H]                     ; 3866 _ 8B. 45, FC
        add     eax, 48                                 ; 3869 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 386C _ 8B. 55, F8
        add     edx, str.1386                           ; 386F _ 81. C2, 000002E0(d)
        mov     byte [edx], al                          ; 3875 _ 88. 02
?_178:  sub     dword [ebp-8H], 1                       ; 3877 _ 83. 6D, F8, 01
?_179:  cmp     dword [ebp-8H], 1                       ; 387B _ 83. 7D, F8, 01
        jle     ?_180                                   ; 387F _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 3881 _ 83. 7D, 08, 00
        jnz     ?_176                                   ; 3885 _ 75, B4
?_180:  mov     eax, str.1386                           ; 3887 _ B8, 000002E0(d)
        leave                                           ; 388C _ C9
        ret                                             ; 388D _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 388E _ 55
        mov     ebp, esp                                ; 388F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3891 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 3894 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 389A _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 389D _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 38A4 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 38A7 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 38AE _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 38B1 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 38B8 _ 5D
        ret                                             ; 38B9 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 38BA _ 55
        mov     ebp, esp                                ; 38BB _ 89. E5
        sub     esp, 16                                 ; 38BD _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 38C0 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 38C7 _ C7. 45, F8, 00000000
        jmp     ?_182                                   ; 38CE _ EB, 14

?_181:  mov     eax, dword [ebp+8H]                     ; 38D0 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 38D3 _ 8B. 55, F8
        add     edx, 2                                  ; 38D6 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 38D9 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 38DD _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 38E0 _ 83. 45, F8, 01
?_182:  mov     eax, dword [ebp+8H]                     ; 38E4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 38E7 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 38E9 _ 3B. 45, F8
        ja      ?_181                                   ; 38EC _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 38EE _ 8B. 45, FC
        leave                                           ; 38F1 _ C9
        ret                                             ; 38F2 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 38F3 _ 55
        mov     ebp, esp                                ; 38F4 _ 89. E5
        sub     esp, 16                                 ; 38F6 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 38F9 _ C7. 45, F8, 00000000
        jmp     ?_186                                   ; 3900 _ E9, 00000085

?_183:  mov     eax, dword [ebp+8H]                     ; 3905 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3908 _ 8B. 55, F8
        add     edx, 2                                  ; 390B _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 390E _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 3912 _ 3B. 45, 0C
        jc      ?_185                                   ; 3915 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 3917 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 391A _ 8B. 55, F8
        add     edx, 2                                  ; 391D _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3920 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 3923 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3926 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3929 _ 8B. 55, F8
        add     edx, 2                                  ; 392C _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 392F _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 3932 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 3935 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3938 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 393B _ 8B. 55, F8
        add     edx, 2                                  ; 393E _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 3941 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 3944 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3947 _ 8B. 55, F8
        add     edx, 2                                  ; 394A _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 394D _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 3951 _ 2B. 45, 0C
        mov     edx, eax                                ; 3954 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3956 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 3959 _ 8B. 4D, F8
        add     ecx, 2                                  ; 395C _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 395F _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 3963 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3966 _ 8B. 55, F8
        add     edx, 2                                  ; 3969 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 396C _ 8B. 44 D0, 04
        test    eax, eax                                ; 3970 _ 85. C0
        jnz     ?_184                                   ; 3972 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 3974 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3977 _ 8B. 00
        lea     edx, [eax-1H]                           ; 3979 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 397C _ 8B. 45, 08
        mov     dword [eax], edx                        ; 397F _ 89. 10
?_184:  mov     eax, dword [ebp-4H]                     ; 3981 _ 8B. 45, FC
        jmp     ?_187                                   ; 3984 _ EB, 17

?_185:  add     dword [ebp-8H], 1                       ; 3986 _ 83. 45, F8, 01
?_186:  mov     eax, dword [ebp+8H]                     ; 398A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 398D _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 398F _ 3B. 45, F8
        ja      ?_183                                   ; 3992 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 3998 _ B8, 00000000
?_187:  leave                                           ; 399D _ C9
        ret                                             ; 399E _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 399F _ 55
        mov     ebp, esp                                ; 39A0 _ 89. E5
        push    ebx                                     ; 39A2 _ 53
        sub     esp, 16                                 ; 39A3 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 39A6 _ C7. 45, F4, 00000000
        jmp     ?_190                                   ; 39AD _ EB, 17

?_188:  mov     eax, dword [ebp+8H]                     ; 39AF _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 39B2 _ 8B. 55, F4
        add     edx, 2                                  ; 39B5 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 39B8 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 39BB _ 3B. 45, 0C
        jbe     ?_189                                   ; 39BE _ 76, 02
        jmp     ?_191                                   ; 39C0 _ EB, 0E

?_189:  add     dword [ebp-0CH], 1                      ; 39C2 _ 83. 45, F4, 01
?_190:  mov     eax, dword [ebp+8H]                     ; 39C6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 39C9 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 39CB _ 3B. 45, F4
        jg      ?_188                                   ; 39CE _ 7F, DF
?_191:  cmp     dword [ebp-0CH], 0                      ; 39D0 _ 83. 7D, F4, 00
        jle     ?_193                                   ; 39D4 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 39DA _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 39DD _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 39E0 _ 8B. 45, 08
        add     edx, 2                                  ; 39E3 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 39E6 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 39E9 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 39EC _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 39EF _ 8B. 45, 08
        add     ecx, 2                                  ; 39F2 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 39F5 _ 8B. 44 C8, 04
        add     eax, edx                                ; 39F9 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 39FB _ 3B. 45, 0C
        jne     ?_193                                   ; 39FE _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 3A04 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 3A07 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3A0A _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3A0D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3A10 _ 8B. 45, 08
        add     edx, 2                                  ; 3A13 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3A16 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 3A1A _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 3A1D _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3A20 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 3A23 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3A26 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 3A2A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3A2D _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3A2F _ 3B. 45, F4
        jle     ?_192                                   ; 3A32 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 3A34 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 3A37 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 3A3A _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3A3D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3A40 _ 8B. 55, F4
        add     edx, 2                                  ; 3A43 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3A46 _ 8B. 04 D0
        cmp     ecx, eax                                ; 3A49 _ 39. C1
        jnz     ?_192                                   ; 3A4B _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 3A4D _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 3A50 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3A53 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3A56 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3A59 _ 8B. 45, 08
        add     edx, 2                                  ; 3A5C _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3A5F _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 3A63 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 3A66 _ 8B. 4D, F4
        add     ecx, 2                                  ; 3A69 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 3A6C _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 3A70 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3A73 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 3A76 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3A79 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 3A7D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3A80 _ 8B. 00
        lea     edx, [eax-1H]                           ; 3A82 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3A85 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3A88 _ 89. 10
?_192:  mov     eax, 0                                  ; 3A8A _ B8, 00000000
        jmp     ?_199                                   ; 3A8F _ E9, 0000011C

?_193:  mov     eax, dword [ebp+8H]                     ; 3A94 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3A97 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3A99 _ 3B. 45, F4
        jle     ?_194                                   ; 3A9C _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 3A9E _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 3AA1 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 3AA4 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3AA7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3AAA _ 8B. 55, F4
        add     edx, 2                                  ; 3AAD _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3AB0 _ 8B. 04 D0
        cmp     ecx, eax                                ; 3AB3 _ 39. C1
        jnz     ?_194                                   ; 3AB5 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 3AB7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3ABA _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3ABD _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3AC0 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 3AC3 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 3AC6 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3AC9 _ 8B. 55, F4
        add     edx, 2                                  ; 3ACC _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3ACF _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 3AD3 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 3AD6 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3AD9 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3ADC _ 8B. 55, F4
        add     edx, 2                                  ; 3ADF _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3AE2 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 3AE6 _ B8, 00000000
        jmp     ?_199                                   ; 3AEB _ E9, 000000C0

?_194:  mov     eax, dword [ebp+8H]                     ; 3AF0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3AF3 _ 8B. 00
        cmp     eax, 4095                               ; 3AF5 _ 3D, 00000FFF
        jg      ?_198                                   ; 3AFA _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 3B00 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3B03 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 3B05 _ 89. 45, F8
        jmp     ?_196                                   ; 3B08 _ EB, 28

?_195:  mov     eax, dword [ebp-8H]                     ; 3B0A _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 3B0D _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 3B10 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 3B13 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 3B16 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 3B19 _ 8B. 45, 08
        add     edx, 2                                  ; 3B1C _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 3B1F _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 3B22 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 3B24 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 3B27 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 3B2A _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 3B2E _ 83. 6D, F8, 01
?_196:  mov     eax, dword [ebp-8H]                     ; 3B32 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 3B35 _ 3B. 45, F4
        jg      ?_195                                   ; 3B38 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 3B3A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3B3D _ 8B. 00
        lea     edx, [eax+1H]                           ; 3B3F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3B42 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3B45 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3B47 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3B4A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3B4D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3B50 _ 8B. 00
        cmp     edx, eax                                ; 3B52 _ 39. C2
        jge     ?_197                                   ; 3B54 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 3B56 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 3B59 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 3B5B _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3B5E _ 89. 50, 04
?_197:  mov     eax, dword [ebp+8H]                     ; 3B61 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3B64 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3B67 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3B6A _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 3B6D _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 3B70 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3B73 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3B76 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 3B79 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 3B7C _ 89. 54 C8, 04
        mov     eax, 0                                  ; 3B80 _ B8, 00000000
        jmp     ?_199                                   ; 3B85 _ EB, 29

?_198:  mov     eax, dword [ebp+8H]                     ; 3B87 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3B8A _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 3B8D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3B90 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3B93 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3B96 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3B99 _ 8B. 40, 08
        mov     edx, eax                                ; 3B9C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3B9E _ 8B. 45, 10
        add     eax, edx                                ; 3BA1 _ 01. D0
        mov     edx, eax                                ; 3BA3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3BA5 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3BA8 _ 89. 50, 08
        mov     eax, 4294967295                         ; 3BAB _ B8, FFFFFFFF
?_199:  add     esp, 16                                 ; 3BB0 _ 83. C4, 10
        pop     ebx                                     ; 3BB3 _ 5B
        pop     ebp                                     ; 3BB4 _ 5D
        ret                                             ; 3BB5 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 3BB6 _ 55
        mov     ebp, esp                                ; 3BB7 _ 89. E5
        sub     esp, 24                                 ; 3BB9 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 3BBC _ 8B. 45, 0C
        add     eax, 4095                               ; 3BBF _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 3BC4 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 3BC9 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 3BCC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3BCF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3BD3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3BD6 _ 89. 04 24
        call    memman_alloc                            ; 3BD9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 3BDE _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3BE1 _ 8B. 45, FC
        leave                                           ; 3BE4 _ C9
        ret                                             ; 3BE5 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 3BE6 _ 55
        mov     ebp, esp                                ; 3BE7 _ 89. E5
        sub     esp, 28                                 ; 3BE9 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 3BEC _ 8B. 45, 10
        add     eax, 4095                               ; 3BEF _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 3BF4 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 3BF9 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 3BFC _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 3BFF _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3C03 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3C06 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3C0A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C0D _ 89. 04 24
        call    memman_free                             ; 3C10 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 3C15 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3C18 _ 8B. 45, FC
        leave                                           ; 3C1B _ C9
        ret                                             ; 3C1C _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 3C1D _ 55
        mov     ebp, esp                                ; 3C1E _ 89. E5
        sub     esp, 40                                 ; 3C20 _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 3C23 _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 3C2B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C2E _ 89. 04 24
        call    memman_alloc_4k                         ; 3C31 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3C36 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 3C39 _ 83. 7D, F4, 00
        jnz     ?_200                                   ; 3C3D _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 3C3F _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 3C42 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 3C4A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3C4E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C51 _ 89. 04 24
        call    memman_free_4k                          ; 3C54 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3C59 _ B8, 00000000
        jmp     ?_204                                   ; 3C5E _ E9, 0000009D

?_200:  mov     eax, dword [ebp-0CH]                    ; 3C63 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 3C66 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3C69 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 3C6B _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 3C6E _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 3C71 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3C74 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 3C77 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3C7A _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3C7D _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 3C80 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 3C87 _ C7. 45, F0, 00000000
        jmp     ?_202                                   ; 3C8E _ EB, 1B

?_201:  mov     eax, dword [ebp-0CH]                    ; 3C90 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 3C93 _ 8B. 55, F0
        add     edx, 33                                 ; 3C96 _ 83. C2, 21
        shl     edx, 5                                  ; 3C99 _ C1. E2, 05
        add     eax, edx                                ; 3C9C _ 01. D0
        add     eax, 16                                 ; 3C9E _ 83. C0, 10
        mov     dword [eax], 0                          ; 3CA1 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 3CA7 _ 83. 45, F0, 01
?_202:  cmp     dword [ebp-10H], 255                    ; 3CAB _ 81. 7D, F0, 000000FF
        jle     ?_201                                   ; 3CB2 _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 3CB4 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 3CB7 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 3CBB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3CBF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3CC2 _ 89. 04 24
        call    memman_alloc_4k                         ; 3CC5 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 3CCA _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3CCC _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 3CCF _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 3CD2 _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 3CD5 _ 8B. 40, 10
        test    eax, eax                                ; 3CD8 _ 85. C0
        jnz     ?_203                                   ; 3CDA _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 3CDC _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 3CDF _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 3CE7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3CEB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3CEE _ 89. 04 24
        call    memman_free_4k                          ; 3CF1 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3CF6 _ B8, 00000000
        jmp     ?_204                                   ; 3CFB _ EB, 03

?_203:  mov     eax, dword [ebp-0CH]                    ; 3CFD _ 8B. 45, F4
?_204:  leave                                           ; 3D00 _ C9
        ret                                             ; 3D01 _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 3D02 _ 55
        mov     ebp, esp                                ; 3D03 _ 89. E5
        sub     esp, 16                                 ; 3D05 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3D08 _ C7. 45, F8, 00000000
        jmp     ?_207                                   ; 3D0F _ EB, 5B

?_205:  mov     eax, dword [ebp+8H]                     ; 3D11 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3D14 _ 8B. 55, F8
        add     edx, 33                                 ; 3D17 _ 83. C2, 21
        shl     edx, 5                                  ; 3D1A _ C1. E2, 05
        add     eax, edx                                ; 3D1D _ 01. D0
        add     eax, 16                                 ; 3D1F _ 83. C0, 10
        mov     eax, dword [eax]                        ; 3D22 _ 8B. 00
        test    eax, eax                                ; 3D24 _ 85. C0
        jnz     ?_206                                   ; 3D26 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 3D28 _ 8B. 45, F8
        shl     eax, 5                                  ; 3D2B _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 3D2E _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 3D34 _ 8B. 45, 08
        add     eax, edx                                ; 3D37 _ 01. D0
        add     eax, 4                                  ; 3D39 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 3D3C _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3D3F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3D42 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 3D45 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 3D48 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 3D4B _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 3D4F _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 3D52 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 3D59 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 3D5C _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 3D63 _ 8B. 45, FC
        jmp     ?_208                                   ; 3D66 _ EB, 12

?_206:  add     dword [ebp-8H], 1                       ; 3D68 _ 83. 45, F8, 01
?_207:  cmp     dword [ebp-8H], 255                     ; 3D6C _ 81. 7D, F8, 000000FF
        jle     ?_205                                   ; 3D73 _ 7E, 9C
        mov     eax, 0                                  ; 3D75 _ B8, 00000000
?_208:  leave                                           ; 3D7A _ C9
        ret                                             ; 3D7B _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 3D7C _ 55
        mov     ebp, esp                                ; 3D7D _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3D7F _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3D82 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3D85 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3D87 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3D8A _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 3D8D _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3D90 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 3D93 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3D96 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3D99 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 3D9C _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 3D9F _ 89. 50, 14
        pop     ebp                                     ; 3DA2 _ 5D
        ret                                             ; 3DA3 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 3DA4 _ 55
        mov     ebp, esp                                ; 3DA5 _ 89. E5
        push    esi                                     ; 3DA7 _ 56
        push    ebx                                     ; 3DA8 _ 53
        sub     esp, 48                                 ; 3DA9 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 3DAC _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3DAF _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 3DB2 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3DB5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3DB8 _ 8B. 40, 0C
        add     eax, 1                                  ; 3DBB _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 3DBE _ 3B. 45, 10
        jge     ?_209                                   ; 3DC1 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 3DC3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3DC6 _ 8B. 40, 0C
        add     eax, 1                                  ; 3DC9 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 3DCC _ 89. 45, 10
?_209:  cmp     dword [ebp+10H], -1                     ; 3DCF _ 83. 7D, 10, FF
        jge     ?_210                                   ; 3DD3 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 3DD5 _ C7. 45, 10, FFFFFFFF
?_210:  mov     eax, dword [ebp+0CH]                    ; 3DDC _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3DDF _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 3DE2 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 3DE5 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3DE8 _ 3B. 45, 10
        jle     ?_217                                   ; 3DEB _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 3DF1 _ 83. 7D, 10, 00
        js      ?_213                                   ; 3DF5 _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 3DFB _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3DFE _ 89. 45, F0
        jmp     ?_212                                   ; 3E01 _ EB, 34

?_211:  mov     eax, dword [ebp-10H]                    ; 3E03 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3E06 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3E09 _ 8B. 45, 08
        add     edx, 4                                  ; 3E0C _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3E0F _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3E13 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3E16 _ 8B. 4D, F0
        add     ecx, 4                                  ; 3E19 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3E1C _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3E20 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3E23 _ 8B. 55, F0
        add     edx, 4                                  ; 3E26 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3E29 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3E2D _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3E30 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 3E33 _ 83. 6D, F0, 01
?_212:  mov     eax, dword [ebp-10H]                    ; 3E37 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3E3A _ 3B. 45, 10
        jg      ?_211                                   ; 3E3D _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 3E3F _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3E42 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3E45 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3E48 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3E4B _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 3E4F _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3E52 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3E55 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3E58 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3E5B _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3E5E _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3E61 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3E64 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3E67 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3E6A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3E6D _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3E70 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3E73 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3E76 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3E79 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3E7C _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 3E7F _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3E83 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3E87 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3E8B _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3E8F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3E93 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3E96 _ 89. 04 24
        call    sheet_refresh_map                       ; 3E99 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3E9E _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3EA1 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3EA4 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3EA7 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3EAA _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3EAD _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3EB0 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3EB3 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3EB6 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3EB9 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3EBC _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3EBF _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3EC2 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3EC5 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3EC8 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3ECB _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 3ECE _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3ED2 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3ED6 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3EDA _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3EDE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3EE2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3EE5 _ 89. 04 24
        call    sheet_refresh_local                     ; 3EE8 _ E8, FFFFFFFC(rel)
        jmp     ?_224                                   ; 3EED _ E9, 0000026C

?_213:  mov     eax, dword [ebp+8H]                     ; 3EF2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3EF5 _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 3EF8 _ 3B. 45, F4
        jle     ?_216                                   ; 3EFB _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 3EFD _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3F00 _ 89. 45, F0
        jmp     ?_215                                   ; 3F03 _ EB, 34

?_214:  mov     eax, dword [ebp-10H]                    ; 3F05 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3F08 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3F0B _ 8B. 45, 08
        add     edx, 4                                  ; 3F0E _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3F11 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3F15 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3F18 _ 8B. 4D, F0
        add     ecx, 4                                  ; 3F1B _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3F1E _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3F22 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3F25 _ 8B. 55, F0
        add     edx, 4                                  ; 3F28 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3F2B _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3F2F _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3F32 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 3F35 _ 83. 45, F0, 01
?_215:  mov     eax, dword [ebp+8H]                     ; 3F39 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3F3C _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 3F3F _ 3B. 45, F0
        jg      ?_214                                   ; 3F42 _ 7F, C1
?_216:  mov     eax, dword [ebp+8H]                     ; 3F44 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3F47 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 3F4A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3F4D _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3F50 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3F53 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3F56 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3F59 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3F5C _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3F5F _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3F62 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3F65 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3F68 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3F6B _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3F6E _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3F71 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3F74 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3F77 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3F7A _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 3F7D _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3F85 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3F89 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3F8D _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3F91 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3F95 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3F98 _ 89. 04 24
        call    sheet_refresh_map                       ; 3F9B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3FA0 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3FA3 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3FA6 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3FA9 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3FAC _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3FAF _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3FB2 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3FB5 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3FB8 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3FBB _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3FBE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3FC1 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3FC4 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3FC7 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 3FCA _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3FD2 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3FD6 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3FDA _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3FDE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3FE2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3FE5 _ 89. 04 24
        call    sheet_refresh_local                     ; 3FE8 _ E8, FFFFFFFC(rel)
        jmp     ?_224                                   ; 3FED _ E9, 0000016C

?_217:  mov     eax, dword [ebp-0CH]                    ; 3FF2 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3FF5 _ 3B. 45, 10
        jge     ?_224                                   ; 3FF8 _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 3FFE _ 83. 7D, F4, 00
        js      ?_220                                   ; 4002 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 4004 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 4007 _ 89. 45, F0
        jmp     ?_219                                   ; 400A _ EB, 34

?_218:  mov     eax, dword [ebp-10H]                    ; 400C _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 400F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4012 _ 8B. 45, 08
        add     edx, 4                                  ; 4015 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4018 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 401C _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 401F _ 8B. 4D, F0
        add     ecx, 4                                  ; 4022 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 4025 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 4029 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 402C _ 8B. 55, F0
        add     edx, 4                                  ; 402F _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4032 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 4036 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 4039 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 403C _ 83. 45, F0, 01
?_219:  mov     eax, dword [ebp-10H]                    ; 4040 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 4043 _ 3B. 45, 10
        jl      ?_218                                   ; 4046 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 4048 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 404B _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 404E _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 4051 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 4054 _ 89. 54 88, 04
        jmp     ?_223                                   ; 4058 _ EB, 6C

?_220:  mov     eax, dword [ebp+8H]                     ; 405A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 405D _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 4060 _ 89. 45, F0
        jmp     ?_222                                   ; 4063 _ EB, 3A

?_221:  mov     eax, dword [ebp-10H]                    ; 4065 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 4068 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 406B _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 406E _ 8B. 55, F0
        add     edx, 4                                  ; 4071 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 4074 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 4078 _ 8B. 45, 08
        add     ecx, 4                                  ; 407B _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 407E _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 4082 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 4085 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 4088 _ 8B. 45, 08
        add     edx, 4                                  ; 408B _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 408E _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 4092 _ 8B. 55, F0
        add     edx, 1                                  ; 4095 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 4098 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 409B _ 83. 6D, F0, 01
?_222:  mov     eax, dword [ebp-10H]                    ; 409F _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 40A2 _ 3B. 45, 10
        jge     ?_221                                   ; 40A5 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 40A7 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 40AA _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 40AD _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 40B0 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 40B3 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 40B7 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 40BA _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 40BD _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 40C0 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 40C3 _ 89. 50, 0C
?_223:  mov     eax, dword [ebp+0CH]                    ; 40C6 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 40C9 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 40CC _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 40CF _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 40D2 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 40D5 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 40D8 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 40DB _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 40DE _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 40E1 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 40E4 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 40E7 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 40EA _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 40ED _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 40F0 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 40F3 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 40F7 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 40FB _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 40FF _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 4103 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4107 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 410A _ 89. 04 24
        call    sheet_refresh_map                       ; 410D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4112 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4115 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4118 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 411B _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 411E _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 4121 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 4124 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4127 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 412A _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 412D _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 4130 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 4133 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4136 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4139 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 413C _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 413F _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 4143 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 4147 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 414B _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 414F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4153 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4156 _ 89. 04 24
        call    sheet_refresh_local                     ; 4159 _ E8, FFFFFFFC(rel)
?_224:  add     esp, 48                                 ; 415E _ 83. C4, 30
        pop     ebx                                     ; 4161 _ 5B
        pop     esi                                     ; 4162 _ 5E
        pop     ebp                                     ; 4163 _ 5D
        ret                                             ; 4164 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 4165 _ 55
        mov     ebp, esp                                ; 4166 _ 89. E5
        push    edi                                     ; 4168 _ 57
        push    esi                                     ; 4169 _ 56
        push    ebx                                     ; 416A _ 53
        sub     esp, 44                                 ; 416B _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 416E _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4171 _ 8B. 40, 18
        test    eax, eax                                ; 4174 _ 85. C0
        js      ?_225                                   ; 4176 _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 4178 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 417B _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 417E _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 4181 _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 4184 _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 4187 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 418A _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 418D _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 4190 _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 4193 _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 4196 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 4199 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 419C _ 8B. 55, 14
        add     ecx, edx                                ; 419F _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 41A1 _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 41A4 _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 41A7 _ 8B. 55, 10
        add     edx, edi                                ; 41AA _ 01. FA
        mov     dword [esp+14H], eax                    ; 41AC _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 41B0 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 41B4 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 41B8 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 41BC _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 41C0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 41C3 _ 89. 04 24
        call    sheet_refresh_local                     ; 41C6 _ E8, FFFFFFFC(rel)
?_225:  mov     eax, 0                                  ; 41CB _ B8, 00000000
        add     esp, 44                                 ; 41D0 _ 83. C4, 2C
        pop     ebx                                     ; 41D3 _ 5B
        pop     esi                                     ; 41D4 _ 5E
        pop     edi                                     ; 41D5 _ 5F
        pop     ebp                                     ; 41D6 _ 5D
        ret                                             ; 41D7 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 41D8 _ 55
        mov     ebp, esp                                ; 41D9 _ 89. E5
        push    ebx                                     ; 41DB _ 53
        sub     esp, 52                                 ; 41DC _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 41DF _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 41E2 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 41E5 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 41E8 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 41EB _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 41EE _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 41F1 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 41F4 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 41F7 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 41FA _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 41FD _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 4200 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4203 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4206 _ 8B. 40, 18
        test    eax, eax                                ; 4209 _ 85. C0
        js      ?_226                                   ; 420B _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 4211 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 4214 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4217 _ 8B. 45, F4
        add     edx, eax                                ; 421A _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 421C _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 421F _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 4222 _ 8B. 45, F0
        add     eax, ecx                                ; 4225 _ 01. C8
        mov     dword [esp+14H], 0                      ; 4227 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 422F _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 4233 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 4237 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 423A _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 423E _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 4241 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4245 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4248 _ 89. 04 24
        call    sheet_refresh_map                       ; 424B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4250 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4253 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 4256 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 4259 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 425C _ 8B. 55, 14
        add     ecx, edx                                ; 425F _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 4261 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 4264 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 4267 _ 8B. 55, 10
        add     edx, ebx                                ; 426A _ 01. DA
        mov     dword [esp+14H], eax                    ; 426C _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 4270 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 4274 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 4278 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 427B _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 427F _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 4282 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4286 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4289 _ 89. 04 24
        call    sheet_refresh_map                       ; 428C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4291 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 4294 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4297 _ 8B. 45, F4
        add     edx, eax                                ; 429A _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 429C _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 429F _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 42A2 _ 8B. 45, F0
        add     eax, ecx                                ; 42A5 _ 01. C8
        mov     dword [esp+14H], 0                      ; 42A7 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 42AF _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 42B3 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 42B7 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 42BA _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 42BE _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 42C1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 42C5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 42C8 _ 89. 04 24
        call    sheet_refresh_local                     ; 42CB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 42D0 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 42D3 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 42D6 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 42D9 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 42DC _ 8B. 55, 14
        add     ecx, edx                                ; 42DF _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 42E1 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 42E4 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 42E7 _ 8B. 55, 10
        add     edx, ebx                                ; 42EA _ 01. DA
        mov     dword [esp+14H], eax                    ; 42EC _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 42F0 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 42F4 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 42F8 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 42FB _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 42FF _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 4302 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4306 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4309 _ 89. 04 24
        call    sheet_refresh_local                     ; 430C _ E8, FFFFFFFC(rel)
?_226:  add     esp, 52                                 ; 4311 _ 83. C4, 34
        pop     ebx                                     ; 4314 _ 5B
        pop     ebp                                     ; 4315 _ 5D
        ret                                             ; 4316 _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 4317 _ 55
        mov     ebp, esp                                ; 4318 _ 89. E5
        sub     esp, 48                                 ; 431A _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 431D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4320 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 4322 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 4325 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 4328 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 432B _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 432E _ 83. 7D, 0C, 00
        jns     ?_227                                   ; 4332 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 4334 _ C7. 45, 0C, 00000000
?_227:  cmp     dword [ebp+10H], 0                      ; 433B _ 83. 7D, 10, 00
        jns     ?_228                                   ; 433F _ 79, 07
        mov     dword [ebp+10H], 0                      ; 4341 _ C7. 45, 10, 00000000
?_228:  mov     eax, dword [ebp+8H]                     ; 4348 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 434B _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 434E _ 3B. 45, 14
        jge     ?_229                                   ; 4351 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4353 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4356 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 4359 _ 89. 45, 14
?_229:  mov     eax, dword [ebp+8H]                     ; 435C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 435F _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 4362 _ 3B. 45, 18
        jge     ?_230                                   ; 4365 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4367 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 436A _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 436D _ 89. 45, 18
?_230:  mov     eax, dword [ebp+1CH]                    ; 4370 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 4373 _ 89. 45, DC
        jmp     ?_237                                   ; 4376 _ E9, 00000119

?_231:  mov     eax, dword [ebp+8H]                     ; 437B _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 437E _ 8B. 55, DC
        add     edx, 4                                  ; 4381 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4384 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 4388 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 438B _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 438E _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 4390 _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 4393 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 4396 _ 8B. 45, 08
        add     eax, 1044                               ; 4399 _ 05, 00000414
        sub     edx, eax                                ; 439E _ 29. C2
        mov     eax, edx                                ; 43A0 _ 89. D0
        sar     eax, 5                                  ; 43A2 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 43A5 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 43A8 _ C7. 45, E4, 00000000
        jmp     ?_236                                   ; 43AF _ E9, 000000CD

?_232:  mov     eax, dword [ebp-10H]                    ; 43B4 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 43B7 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 43BA _ 8B. 45, E4
        add     eax, edx                                ; 43BD _ 01. D0
        mov     dword [ebp-8H], eax                     ; 43BF _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 43C2 _ C7. 45, E0, 00000000
        jmp     ?_235                                   ; 43C9 _ E9, 000000A0

?_233:  mov     eax, dword [ebp-10H]                    ; 43CE _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 43D1 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 43D4 _ 8B. 45, E0
        add     eax, edx                                ; 43D7 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 43D9 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 43DC _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 43DF _ 3B. 45, FC
        jg      ?_234                                   ; 43E2 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 43E8 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 43EB _ 3B. 45, 14
        jge     ?_234                                   ; 43EE _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 43F0 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 43F3 _ 3B. 45, F8
        jg      ?_234                                   ; 43F6 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 43F8 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 43FB _ 3B. 45, 18
        jge     ?_234                                   ; 43FE _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 4400 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4403 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 4406 _ 0F AF. 45, E4
        mov     edx, eax                                ; 440A _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 440C _ 8B. 45, E0
        add     eax, edx                                ; 440F _ 01. D0
        mov     edx, eax                                ; 4411 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 4413 _ 8B. 45, F4
        add     eax, edx                                ; 4416 _ 01. D0
        movzx   eax, byte [eax]                         ; 4418 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 441B _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 441E _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 4422 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 4425 _ 8B. 40, 14
        cmp     edx, eax                                ; 4428 _ 39. C2
        jz      ?_234                                   ; 442A _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 442C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 442F _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 4432 _ 0F AF. 45, F8
        mov     edx, eax                                ; 4436 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4438 _ 8B. 45, FC
        add     eax, edx                                ; 443B _ 01. D0
        mov     edx, eax                                ; 443D _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 443F _ 8B. 45, EC
        add     eax, edx                                ; 4442 _ 01. D0
        movzx   eax, byte [eax]                         ; 4444 _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 4447 _ 3A. 45, DA
        jnz     ?_234                                   ; 444A _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 444C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 444F _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 4452 _ 0F AF. 45, F8
        mov     edx, eax                                ; 4456 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4458 _ 8B. 45, FC
        add     eax, edx                                ; 445B _ 01. D0
        mov     edx, eax                                ; 445D _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 445F _ 8B. 45, E8
        add     edx, eax                                ; 4462 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 4464 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 4468 _ 88. 02
?_234:  add     dword [ebp-20H], 1                      ; 446A _ 83. 45, E0, 01
?_235:  mov     eax, dword [ebp-10H]                    ; 446E _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4471 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 4474 _ 3B. 45, E0
        jg      ?_233                                   ; 4477 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 447D _ 83. 45, E4, 01
?_236:  mov     eax, dword [ebp-10H]                    ; 4481 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 4484 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 4487 _ 3B. 45, E4
        jg      ?_232                                   ; 448A _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 4490 _ 83. 45, DC, 01
?_237:  mov     eax, dword [ebp+8H]                     ; 4494 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4497 _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 449A _ 3B. 45, DC
        jge     ?_231                                   ; 449D _ 0F 8D, FFFFFED8
        leave                                           ; 44A3 _ C9
        ret                                             ; 44A4 _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 44A5 _ 55
        mov     ebp, esp                                ; 44A6 _ 89. E5
        sub     esp, 64                                 ; 44A8 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 44AB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 44AE _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 44B0 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 44B3 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 44B6 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 44B9 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 44BC _ 83. 7D, 0C, 00
        jns     ?_238                                   ; 44C0 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 44C2 _ C7. 45, 0C, 00000000
?_238:  cmp     dword [ebp+10H], 0                      ; 44C9 _ 83. 7D, 10, 00
        jns     ?_239                                   ; 44CD _ 79, 07
        mov     dword [ebp+10H], 0                      ; 44CF _ C7. 45, 10, 00000000
?_239:  mov     eax, dword [ebp+8H]                     ; 44D6 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 44D9 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 44DC _ 3B. 45, 14
        jge     ?_240                                   ; 44DF _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 44E1 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 44E4 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 44E7 _ 89. 45, 14
?_240:  mov     eax, dword [ebp+8H]                     ; 44EA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 44ED _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 44F0 _ 3B. 45, 18
        jge     ?_241                                   ; 44F3 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 44F5 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 44F8 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 44FB _ 89. 45, 18
?_241:  mov     eax, dword [ebp+1CH]                    ; 44FE _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 4501 _ 89. 45, CC
        jmp     ?_252                                   ; 4504 _ E9, 00000141

?_242:  mov     eax, dword [ebp+8H]                     ; 4509 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 450C _ 8B. 55, CC
        add     edx, 4                                  ; 450F _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4512 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 4516 _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 4519 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 451C _ 8B. 45, 08
        add     eax, 1044                               ; 451F _ 05, 00000414
        sub     edx, eax                                ; 4524 _ 29. C2
        mov     eax, edx                                ; 4526 _ 89. D0
        sar     eax, 5                                  ; 4528 _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 452B _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 452E _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 4531 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 4533 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 4536 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4539 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 453C _ 8B. 55, 0C
        sub     edx, eax                                ; 453F _ 29. C2
        mov     eax, edx                                ; 4541 _ 89. D0
        mov     dword [ebp-30H], eax                    ; 4543 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 4546 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 4549 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 454C _ 8B. 55, 10
        sub     edx, eax                                ; 454F _ 29. C2
        mov     eax, edx                                ; 4551 _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 4553 _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 4556 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4559 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 455C _ 8B. 55, 14
        sub     edx, eax                                ; 455F _ 29. C2
        mov     eax, edx                                ; 4561 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 4563 _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 4566 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 4569 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 456C _ 8B. 55, 18
        sub     edx, eax                                ; 456F _ 29. C2
        mov     eax, edx                                ; 4571 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 4573 _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 4576 _ 83. 7D, D0, 00
        jns     ?_243                                   ; 457A _ 79, 07
        mov     dword [ebp-30H], 0                      ; 457C _ C7. 45, D0, 00000000
?_243:  cmp     dword [ebp-2CH], 0                      ; 4583 _ 83. 7D, D4, 00
        jns     ?_244                                   ; 4587 _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 4589 _ C7. 45, D4, 00000000
?_244:  mov     eax, dword [ebp-10H]                    ; 4590 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4593 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 4596 _ 3B. 45, D8
        jge     ?_245                                   ; 4599 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 459B _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 459E _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 45A1 _ 89. 45, D8
?_245:  mov     eax, dword [ebp-10H]                    ; 45A4 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 45A7 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 45AA _ 3B. 45, DC
        jge     ?_246                                   ; 45AD _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 45AF _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 45B2 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 45B5 _ 89. 45, DC
?_246:  mov     eax, dword [ebp-2CH]                    ; 45B8 _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 45BB _ 89. 45, E4
        jmp     ?_251                                   ; 45BE _ EB, 7A

?_247:  mov     eax, dword [ebp-10H]                    ; 45C0 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 45C3 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 45C6 _ 8B. 45, E4
        add     eax, edx                                ; 45C9 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 45CB _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 45CE _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 45D1 _ 89. 45, E0
        jmp     ?_250                                   ; 45D4 _ EB, 58

?_248:  mov     eax, dword [ebp-10H]                    ; 45D6 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 45D9 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 45DC _ 8B. 45, E0
        add     eax, edx                                ; 45DF _ 01. D0
        mov     dword [ebp-4H], eax                     ; 45E1 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 45E4 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 45E7 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 45EA _ 0F AF. 45, E4
        mov     edx, eax                                ; 45EE _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 45F0 _ 8B. 45, E0
        add     eax, edx                                ; 45F3 _ 01. D0
        mov     edx, eax                                ; 45F5 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 45F7 _ 8B. 45, F4
        add     eax, edx                                ; 45FA _ 01. D0
        movzx   eax, byte [eax]                         ; 45FC _ 0F B6. 00
        movzx   edx, al                                 ; 45FF _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 4602 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 4605 _ 8B. 40, 14
        cmp     edx, eax                                ; 4608 _ 39. C2
        jz      ?_249                                   ; 460A _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 460C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 460F _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 4612 _ 0F AF. 45, F8
        mov     edx, eax                                ; 4616 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4618 _ 8B. 45, FC
        add     eax, edx                                ; 461B _ 01. D0
        mov     edx, eax                                ; 461D _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 461F _ 8B. 45, EC
        add     edx, eax                                ; 4622 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 4624 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 4628 _ 88. 02
?_249:  add     dword [ebp-20H], 1                      ; 462A _ 83. 45, E0, 01
?_250:  mov     eax, dword [ebp-20H]                    ; 462E _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 4631 _ 3B. 45, D8
        jl      ?_248                                   ; 4634 _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 4636 _ 83. 45, E4, 01
?_251:  mov     eax, dword [ebp-1CH]                    ; 463A _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 463D _ 3B. 45, DC
        jl      ?_247                                   ; 4640 _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 4646 _ 83. 45, CC, 01
?_252:  mov     eax, dword [ebp+8H]                     ; 464A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 464D _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 4650 _ 3B. 45, CC
        jge     ?_242                                   ; 4653 _ 0F 8D, FFFFFEB0
        leave                                           ; 4659 _ C9
        ret                                             ; 465A _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 465B _ 55
        mov     ebp, esp                                ; 465C _ 89. E5
        sub     esp, 40                                 ; 465E _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 4661 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 4669 _ C7. 04 24, 00000043
        call    io_out8                                 ; 4670 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 4675 _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 467D _ C7. 04 24, 00000040
        call    io_out8                                 ; 4684 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 4689 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 4691 _ C7. 04 24, 00000040
        call    io_out8                                 ; 4698 _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 469D _ C7. 05, 00000300(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 46A7 _ C7. 45, F4, 00000000
        jmp     ?_254                                   ; 46AE _ EB, 28

?_253:  mov     eax, dword [ebp-0CH]                    ; 46B0 _ 8B. 45, F4
        shl     eax, 4                                  ; 46B3 _ C1. E0, 04
        add     eax, timer_control                      ; 46B6 _ 05, 00000300(d)
        mov     dword [eax+8H], 0                       ; 46BB _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 46C2 _ 8B. 45, F4
        shl     eax, 4                                  ; 46C5 _ C1. E0, 04
        add     eax, timer_control                      ; 46C8 _ 05, 00000300(d)
        mov     dword [eax+0CH], 0                      ; 46CD _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 46D4 _ 83. 45, F4, 01
?_254:  cmp     dword [ebp-0CH], 499                    ; 46D8 _ 81. 7D, F4, 000001F3
        jle     ?_253                                   ; 46DF _ 7E, CF
        leave                                           ; 46E1 _ C9
        ret                                             ; 46E2 _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 46E3 _ 55
        mov     ebp, esp                                ; 46E4 _ 89. E5
        mov     eax, timer_control                      ; 46E6 _ B8, 00000300(d)
        pop     ebp                                     ; 46EB _ 5D
        ret                                             ; 46EC _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 46ED _ 55
        mov     ebp, esp                                ; 46EE _ 89. E5
        sub     esp, 16                                 ; 46F0 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 46F3 _ C7. 45, FC, 00000000
        jmp     ?_257                                   ; 46FA _ EB, 26

?_255:  mov     eax, dword [ebp-4H]                     ; 46FC _ 8B. 45, FC
        shl     eax, 4                                  ; 46FF _ C1. E0, 04
        add     eax, timer_control                      ; 4702 _ 05, 00000300(d)
        mov     eax, dword [eax+8H]                     ; 4707 _ 8B. 40, 08
        test    eax, eax                                ; 470A _ 85. C0
        jnz     ?_256                                   ; 470C _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 470E _ 8B. 45, FC
        shl     eax, 4                                  ; 4711 _ C1. E0, 04
        add     eax, timer_control                      ; 4714 _ 05, 00000300(d)
        add     eax, 4                                  ; 4719 _ 83. C0, 04
        jmp     ?_258                                   ; 471C _ EB, 0D

?_256:  add     dword [ebp-4H], 1                       ; 471E _ 83. 45, FC, 01
?_257:  cmp     dword [ebp-4H], 499                     ; 4722 _ 81. 7D, FC, 000001F3
        jle     ?_255                                   ; 4729 _ 7E, D1
?_258:  leave                                           ; 472B _ C9
        ret                                             ; 472C _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 472D _ 55
        mov     ebp, esp                                ; 472E _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4730 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4733 _ C7. 40, 04, 00000000
        pop     ebp                                     ; 473A _ 5D
        ret                                             ; 473B _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 473C _ 55
        mov     ebp, esp                                ; 473D _ 89. E5
        sub     esp, 4                                  ; 473F _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 4742 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 4745 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 4748 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 474B _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 474E _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 4751 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 4754 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 4758 _ 88. 50, 0C
        leave                                           ; 475B _ C9
        ret                                             ; 475C _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 475D _ 55
        mov     ebp, esp                                ; 475E _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4760 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4763 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 4766 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4768 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 476B _ C7. 40, 04, 00000002
        pop     ebp                                     ; 4772 _ 5D
        ret                                             ; 4773 _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 4774 _ 55
        mov     ebp, esp                                ; 4775 _ 89. E5
        sub     esp, 40                                 ; 4777 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 477A _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 4782 _ C7. 04 24, 00000020
        call    io_out8                                 ; 4789 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 478E _ A1, 00000300(d)
        add     eax, 1                                  ; 4793 _ 83. C0, 01
        mov     dword [timer_control], eax              ; 4796 _ A3, 00000300(d)
        mov     byte [ebp-0DH], 0                       ; 479B _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 479F _ C7. 45, F4, 00000000
        jmp     ?_262                                   ; 47A6 _ E9, 000000B0

?_259:  mov     eax, dword [ebp-0CH]                    ; 47AB _ 8B. 45, F4
        shl     eax, 4                                  ; 47AE _ C1. E0, 04
        add     eax, timer_control                      ; 47B1 _ 05, 00000300(d)
        mov     eax, dword [eax+8H]                     ; 47B6 _ 8B. 40, 08
        cmp     eax, 2                                  ; 47B9 _ 83. F8, 02
        jne     ?_260                                   ; 47BC _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 47C2 _ 8B. 45, F4
        shl     eax, 4                                  ; 47C5 _ C1. E0, 04
        add     eax, timer_control                      ; 47C8 _ 05, 00000300(d)
        mov     eax, dword [eax+4H]                     ; 47CD _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 47D0 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 47D3 _ 8B. 45, F4
        shl     eax, 4                                  ; 47D6 _ C1. E0, 04
        add     eax, timer_control                      ; 47D9 _ 05, 00000300(d)
        mov     dword [eax+4H], edx                     ; 47DE _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 47E1 _ 8B. 45, F4
        shl     eax, 4                                  ; 47E4 _ C1. E0, 04
        add     eax, timer_control                      ; 47E7 _ 05, 00000300(d)
        mov     eax, dword [eax+4H]                     ; 47EC _ 8B. 40, 04
        test    eax, eax                                ; 47EF _ 85. C0
        jnz     ?_260                                   ; 47F1 _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 47F3 _ 8B. 45, F4
        shl     eax, 4                                  ; 47F6 _ C1. E0, 04
        add     eax, timer_control                      ; 47F9 _ 05, 00000300(d)
        mov     dword [eax+8H], 1                       ; 47FE _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 4805 _ 8B. 45, F4
        shl     eax, 4                                  ; 4808 _ C1. E0, 04
        add     eax, timer_control                      ; 480B _ 05, 00000300(d)
        movzx   eax, byte [eax+10H]                     ; 4810 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 4814 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 4817 _ 8B. 45, F4
        shl     eax, 4                                  ; 481A _ C1. E0, 04
        add     eax, timer_control                      ; 481D _ 05, 00000300(d)
        mov     eax, dword [eax+0CH]                    ; 4822 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 4825 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4829 _ 89. 04 24
        call    fifo8_put                               ; 482C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4831 _ 8B. 45, F4
        shl     eax, 4                                  ; 4834 _ C1. E0, 04
        add     eax, timer_control                      ; 4837 _ 05, 00000300(d)
        lea     edx, [eax+4H]                           ; 483C _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 483F _ A1, 00000000(d)
        cmp     edx, eax                                ; 4844 _ 39. C2
        jnz     ?_260                                   ; 4846 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 4848 _ C6. 45, F3, 01
?_260:  cmp     byte [ebp-0DH], 0                       ; 484C _ 80. 7D, F3, 00
        jz      ?_261                                   ; 4850 _ 74, 05
        call    task_switch                             ; 4852 _ E8, FFFFFFFC(rel)
?_261:  add     dword [ebp-0CH], 1                      ; 4857 _ 83. 45, F4, 01
?_262:  cmp     dword [ebp-0CH], 499                    ; 485B _ 81. 7D, F4, 000001F3
        jle     ?_259                                   ; 4862 _ 0F 8E, FFFFFF43
        leave                                           ; 4868 _ C9
        ret                                             ; 4869 _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 486A _ 55
        mov     ebp, esp                                ; 486B _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 486D _ 81. 7D, 0C, 000FFFFF
        jbe     ?_263                                   ; 4874 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 4876 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 487D _ 8B. 45, 0C
        shr     eax, 12                                 ; 4880 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 4883 _ 89. 45, 0C
?_263:  mov     eax, dword [ebp+0CH]                    ; 4886 _ 8B. 45, 0C
        mov     edx, eax                                ; 4889 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 488B _ 8B. 45, 08
        mov     word [eax], dx                          ; 488E _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 4891 _ 8B. 45, 10
        mov     edx, eax                                ; 4894 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4896 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 4899 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 489D _ 8B. 45, 10
        sar     eax, 16                                 ; 48A0 _ C1. F8, 10
        mov     edx, eax                                ; 48A3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 48A5 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 48A8 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 48AB _ 8B. 45, 14
        mov     edx, eax                                ; 48AE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 48B0 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 48B3 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 48B6 _ 8B. 45, 0C
        shr     eax, 16                                 ; 48B9 _ C1. E8, 10
        and     eax, 0FH                                ; 48BC _ 83. E0, 0F
        mov     edx, eax                                ; 48BF _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 48C1 _ 8B. 45, 14
        sar     eax, 8                                  ; 48C4 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 48C7 _ 83. E0, F0
        or      eax, edx                                ; 48CA _ 09. D0
        mov     edx, eax                                ; 48CC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 48CE _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 48D1 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 48D4 _ 8B. 45, 10
        shr     eax, 24                                 ; 48D7 _ C1. E8, 18
        mov     edx, eax                                ; 48DA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 48DC _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 48DF _ 88. 50, 07
        pop     ebp                                     ; 48E2 _ 5D
        ret                                             ; 48E3 _ C3
; segment_descriptor End of function

init_task_level:; Function begin
        push    ebp                                     ; 48E4 _ 55
        mov     ebp, esp                                ; 48E5 _ 89. E5
        sub     esp, 16                                 ; 48E7 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 48EA _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp+8H]                     ; 48F0 _ 8B. 55, 08
        mov     eax, edx                                ; 48F3 _ 89. D0
        shl     eax, 2                                  ; 48F5 _ C1. E0, 02
        add     eax, edx                                ; 48F8 _ 01. D0
        shl     eax, 2                                  ; 48FA _ C1. E0, 02
        add     eax, ecx                                ; 48FD _ 01. C8
        add     eax, 8                                  ; 48FF _ 83. C0, 08
        mov     dword [eax], 0                          ; 4902 _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 4908 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp+8H]                     ; 490E _ 8B. 55, 08
        mov     eax, edx                                ; 4911 _ 89. D0
        shl     eax, 2                                  ; 4913 _ C1. E0, 02
        add     eax, edx                                ; 4916 _ 01. D0
        shl     eax, 2                                  ; 4918 _ C1. E0, 02
        add     eax, ecx                                ; 491B _ 01. C8
        add     eax, 12                                 ; 491D _ 83. C0, 0C
        mov     dword [eax], 0                          ; 4920 _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 4926 _ C7. 45, FC, 00000000
        jmp     ?_265                                   ; 492D _ EB, 21

?_264:  mov     ecx, dword [task_control]               ; 492F _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 4935 _ 8B. 55, FC
        mov     eax, edx                                ; 4938 _ 89. D0
        add     eax, eax                                ; 493A _ 01. C0
        add     eax, edx                                ; 493C _ 01. D0
        shl     eax, 3                                  ; 493E _ C1. E0, 03
        add     eax, ecx                                ; 4941 _ 01. C8
        add     eax, 16                                 ; 4943 _ 83. C0, 10
        mov     dword [eax], 0                          ; 4946 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 494C _ 83. 45, FC, 01
?_265:  cmp     dword [ebp-4H], 2                       ; 4950 _ 83. 7D, FC, 02
        jle     ?_264                                   ; 4954 _ 7E, D9
        leave                                           ; 4956 _ C9
        ret                                             ; 4957 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 4958 _ 55
        mov     ebp, esp                                ; 4959 _ 89. E5
        sub     esp, 40                                 ; 495B _ 83. EC, 28
        call    get_addr_gdt                            ; 495E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 4963 _ 89. 45, F0
        mov     dword [esp+4H], 808                     ; 4966 _ C7. 44 24, 04, 00000328
        mov     eax, dword [ebp+8H]                     ; 496E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4971 _ 89. 04 24
        call    memman_alloc_4k                         ; 4974 _ E8, FFFFFFFC(rel)
        mov     dword [task_control], eax               ; 4979 _ A3, 00002248(d)
        mov     dword [ebp-14H], 0                      ; 497E _ C7. 45, EC, 00000000
        jmp     ?_267                                   ; 4985 _ E9, 00000085

?_266:  mov     edx, dword [task_control]               ; 498A _ 8B. 15, 00002248(d)
        mov     eax, dword [ebp-14H]                    ; 4990 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 4993 _ 69. C0, 00000094
        add     eax, edx                                ; 4999 _ 01. D0
        add     eax, 72                                 ; 499B _ 83. C0, 48
        mov     dword [eax], 0                          ; 499E _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 49A4 _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp-14H]                    ; 49AA _ 8B. 45, EC
        add     eax, 8                                  ; 49AD _ 83. C0, 08
        lea     edx, [eax*8]                            ; 49B0 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 49B7 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 49BA _ 69. C0, 00000094
        add     eax, ecx                                ; 49C0 _ 01. C8
        add     eax, 68                                 ; 49C2 _ 83. C0, 44
        mov     dword [eax], edx                        ; 49C5 _ 89. 10
        mov     eax, dword [task_control]               ; 49C7 _ A1, 00002248(d)
        mov     edx, dword [ebp-14H]                    ; 49CC _ 8B. 55, EC
        imul    edx, edx, 148                           ; 49CF _ 69. D2, 00000094
        add     edx, 96                                 ; 49D5 _ 83. C2, 60
        add     eax, edx                                ; 49D8 _ 01. D0
        add     eax, 16                                 ; 49DA _ 83. C0, 10
        mov     edx, dword [ebp-14H]                    ; 49DD _ 8B. 55, EC
        add     edx, 8                                  ; 49E0 _ 83. C2, 08
        lea     ecx, [edx*8]                            ; 49E3 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 49EA _ 8B. 55, F0
        add     edx, ecx                                ; 49ED _ 01. CA
        mov     dword [esp+0CH], 137                    ; 49EF _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 49F7 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 49FB _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 4A03 _ 89. 14 24
        call    segment_descriptor                      ; 4A06 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 4A0B _ 83. 45, EC, 01
?_267:  cmp     dword [ebp-14H], 4                      ; 4A0F _ 83. 7D, EC, 04
        jle     ?_266                                   ; 4A13 _ 0F 8E, FFFFFF71
        mov     dword [ebp-14H], 0                      ; 4A19 _ C7. 45, EC, 00000000
        jmp     ?_269                                   ; 4A20 _ EB, 0F

?_268:  mov     eax, dword [ebp-14H]                    ; 4A22 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 4A25 _ 89. 04 24
        call    init_task_level                         ; 4A28 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 4A2D _ 83. 45, EC, 01
?_269:  cmp     dword [ebp-14H], 2                      ; 4A31 _ 83. 7D, EC, 02
        jle     ?_268                                   ; 4A35 _ 7E, EB
        call    task_alloc                              ; 4A37 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4A3C _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4A3F _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 4A42 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 4A49 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 4A4C _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 4A53 _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 4A56 _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 4A5D _ 8B. 45, F4
        mov     dword [esp], eax                        ; 4A60 _ 89. 04 24
        call    task_add                                ; 4A63 _ E8, FFFFFFFC(rel)
        call    task_switch_sub                         ; 4A68 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4A6D _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4A70 _ 8B. 00
        mov     dword [esp], eax                        ; 4A72 _ 89. 04 24
        call    load_tr                                 ; 4A75 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 4A7A _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 4A7F _ A3, 00002244(d)
        mov     eax, dword [ebp-0CH]                    ; 4A84 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 4A87 _ 8B. 40, 08
        mov     edx, eax                                ; 4A8A _ 89. C2
        mov     eax, dword [task_timer]                 ; 4A8C _ A1, 00002244(d)
        mov     dword [esp+4H], edx                     ; 4A91 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4A95 _ 89. 04 24
        call    timer_settime                           ; 4A98 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4A9D _ 8B. 45, F4
        leave                                           ; 4AA0 _ C9
        ret                                             ; 4AA1 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 4AA2 _ 55
        mov     ebp, esp                                ; 4AA3 _ 89. E5
        sub     esp, 16                                 ; 4AA5 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 4AA8 _ C7. 45, F8, 00000000
        jmp     ?_272                                   ; 4AAF _ E9, 00000100

?_270:  mov     edx, dword [task_control]               ; 4AB4 _ 8B. 15, 00002248(d)
        mov     eax, dword [ebp-8H]                     ; 4ABA _ 8B. 45, F8
        imul    eax, eax, 148                           ; 4ABD _ 69. C0, 00000094
        add     eax, edx                                ; 4AC3 _ 01. D0
        add     eax, 72                                 ; 4AC5 _ 83. C0, 48
        mov     eax, dword [eax]                        ; 4AC8 _ 8B. 00
        test    eax, eax                                ; 4ACA _ 85. C0
        jne     ?_271                                   ; 4ACC _ 0F 85, 000000DE
        mov     eax, dword [task_control]               ; 4AD2 _ A1, 00002248(d)
        mov     edx, dword [ebp-8H]                     ; 4AD7 _ 8B. 55, F8
        imul    edx, edx, 148                           ; 4ADA _ 69. D2, 00000094
        add     edx, 64                                 ; 4AE0 _ 83. C2, 40
        add     eax, edx                                ; 4AE3 _ 01. D0
        add     eax, 4                                  ; 4AE5 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 4AE8 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4AEB _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 4AEE _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 4AF5 _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 4AF8 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 4AFF _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 4B02 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 4B09 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 4B0C _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 4B13 _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 4B16 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4B1D _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 4B20 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-8H]                     ; 4B27 _ 8B. 45, F8
        add     eax, 1                                  ; 4B2A _ 83. C0, 01
        shl     eax, 9                                  ; 4B2D _ C1. E0, 09
        mov     edx, eax                                ; 4B30 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4B32 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 4B35 _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 4B38 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 4B3B _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-4H]                     ; 4B42 _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 4B45 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4B4C _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 4B4F _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 4B56 _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 4B59 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 4B60 _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 4B63 _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 4B6D _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 4B70 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 4B7A _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 4B7D _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 4B87 _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 4B8A _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4B94 _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 4B97 _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 4BA1 _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 4BA4 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 4BAB _ 8B. 45, FC
        jmp     ?_273                                   ; 4BAE _ EB, 13

?_271:  add     dword [ebp-8H], 1                       ; 4BB0 _ 83. 45, F8, 01
?_272:  cmp     dword [ebp-8H], 4                       ; 4BB4 _ 83. 7D, F8, 04
        jle     ?_270                                   ; 4BB8 _ 0F 8E, FFFFFEF6
        mov     eax, 0                                  ; 4BBE _ B8, 00000000
?_273:  leave                                           ; 4BC3 _ C9
        ret                                             ; 4BC4 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 4BC5 _ 55
        mov     ebp, esp                                ; 4BC6 _ 89. E5
        sub     esp, 24                                 ; 4BC8 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 4BCB _ 83. 7D, 0C, 00
        jns     ?_274                                   ; 4BCF _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 4BD1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4BD4 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 4BD7 _ 89. 45, 0C
?_274:  cmp     dword [ebp+10H], 0                      ; 4BDA _ 83. 7D, 10, 00
        jle     ?_275                                   ; 4BDE _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 4BE0 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4BE3 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 4BE6 _ 89. 50, 08
?_275:  mov     eax, dword [ebp+8H]                     ; 4BE9 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4BEC _ 8B. 40, 04
        cmp     eax, 2                                  ; 4BEF _ 83. F8, 02
        jnz     ?_276                                   ; 4BF2 _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 4BF4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4BF7 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 4BFA _ 3B. 45, 0C
        jz      ?_276                                   ; 4BFD _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 4BFF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4C02 _ 89. 04 24
        call    task_remove                             ; 4C05 _ E8, FFFFFFFC(rel)
?_276:  mov     eax, dword [ebp+8H]                     ; 4C0A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4C0D _ 8B. 40, 04
        cmp     eax, 2                                  ; 4C10 _ 83. F8, 02
        jz      ?_277                                   ; 4C13 _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 4C15 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4C18 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 4C1B _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4C1E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4C21 _ 89. 04 24
        call    task_add                                ; 4C24 _ E8, FFFFFFFC(rel)
?_277:  mov     eax, dword [task_control]               ; 4C29 _ A1, 00002248(d)
        mov     dword [eax+4H], 1                       ; 4C2E _ C7. 40, 04, 00000001
        leave                                           ; 4C35 _ C9
        ret                                             ; 4C36 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 4C37 _ 55
        mov     ebp, esp                                ; 4C38 _ 89. E5
        sub     esp, 40                                 ; 4C3A _ 83. EC, 28
        mov     ecx, dword [task_control]               ; 4C3D _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4C43 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4C48 _ 8B. 10
        mov     eax, edx                                ; 4C4A _ 89. D0
        shl     eax, 2                                  ; 4C4C _ C1. E0, 02
        add     eax, edx                                ; 4C4F _ 01. D0
        shl     eax, 2                                  ; 4C51 _ C1. E0, 02
        add     eax, ecx                                ; 4C54 _ 01. C8
        add     eax, 8                                  ; 4C56 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4C59 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 4C5C _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4C5F _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4C62 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4C65 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 4C69 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 4C6C _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 4C6F _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 4C72 _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 4C75 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 4C78 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4C7B _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4C7E _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4C81 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 4C84 _ 8B. 00
        cmp     edx, eax                                ; 4C86 _ 39. C2
        jnz     ?_278                                   ; 4C88 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 4C8A _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 4C8D _ C7. 40, 04, 00000000
?_278:  mov     eax, dword [task_control]               ; 4C94 _ A1, 00002248(d)
        mov     eax, dword [eax+4H]                     ; 4C99 _ 8B. 40, 04
        test    eax, eax                                ; 4C9C _ 85. C0
        jz      ?_279                                   ; 4C9E _ 74, 24
        call    task_switch_sub                         ; 4CA0 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [task_control]               ; 4CA5 _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4CAB _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4CB0 _ 8B. 10
        mov     eax, edx                                ; 4CB2 _ 89. D0
        shl     eax, 2                                  ; 4CB4 _ C1. E0, 02
        add     eax, edx                                ; 4CB7 _ 01. D0
        shl     eax, 2                                  ; 4CB9 _ C1. E0, 02
        add     eax, ecx                                ; 4CBC _ 01. C8
        add     eax, 8                                  ; 4CBE _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4CC1 _ 89. 45, EC
?_279:  mov     eax, dword [ebp-14H]                    ; 4CC4 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4CC7 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4CCA _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4CCD _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 4CD1 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4CD4 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 4CD7 _ 8B. 40, 08
        mov     edx, eax                                ; 4CDA _ 89. C2
        mov     eax, dword [task_timer]                 ; 4CDC _ A1, 00002244(d)
        mov     dword [esp+4H], edx                     ; 4CE1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4CE5 _ 89. 04 24
        call    timer_settime                           ; 4CE8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4CED _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 4CF0 _ 3B. 45, F0
        jz      ?_280                                   ; 4CF3 _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 4CF5 _ 83. 7D, F4, 00
        jz      ?_280                                   ; 4CF9 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4CFB _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4CFE _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4D00 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4D04 _ C7. 04 24, 00000000
        call    farjmp                                  ; 4D0B _ E8, FFFFFFFC(rel)
?_280:  leave                                           ; 4D10 _ C9
        ret                                             ; 4D11 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 4D12 _ 55
        mov     ebp, esp                                ; 4D13 _ 89. E5
        sub     esp, 40                                 ; 4D15 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 4D18 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 4D1F _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 4D26 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4D29 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4D2C _ 83. F8, 02
        jnz     ?_281                                   ; 4D2F _ 75, 51
        call    task_now                                ; 4D31 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4D36 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 4D39 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4D3C _ 89. 04 24
        call    task_remove                             ; 4D3F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 4D44 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 4D4B _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 4D4E _ 3B. 45, F4
        jnz     ?_281                                   ; 4D51 _ 75, 2F
        call    task_switch_sub                         ; 4D53 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 4D58 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4D5D _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 4D60 _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 4D67 _ 83. 7D, F4, 00
        jz      ?_281                                   ; 4D6B _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4D6D _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4D70 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4D72 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4D76 _ C7. 04 24, 00000000
        call    farjmp                                  ; 4D7D _ E8, FFFFFFFC(rel)
?_281:  mov     eax, dword [ebp-10H]                    ; 4D82 _ 8B. 45, F0
        leave                                           ; 4D85 _ C9
        ret                                             ; 4D86 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 4D87 _ 55
        mov     ebp, esp                                ; 4D88 _ 89. E5
        sub     esp, 16                                 ; 4D8A _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4D8D _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4D93 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4D98 _ 8B. 10
        mov     eax, edx                                ; 4D9A _ 89. D0
        shl     eax, 2                                  ; 4D9C _ C1. E0, 02
        add     eax, edx                                ; 4D9F _ 01. D0
        shl     eax, 2                                  ; 4DA1 _ C1. E0, 02
        add     eax, ecx                                ; 4DA4 _ 01. C8
        add     eax, 8                                  ; 4DA6 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4DA9 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4DAC _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4DAF _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4DB2 _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 4DB5 _ 8B. 44 90, 08
        leave                                           ; 4DB9 _ C9
        ret                                             ; 4DBA _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 4DBB _ 55
        mov     ebp, esp                                ; 4DBC _ 89. E5
        sub     esp, 16                                 ; 4DBE _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4DC1 _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp+8H]                     ; 4DC7 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4DCA _ 8B. 50, 0C
        mov     eax, edx                                ; 4DCD _ 89. D0
        shl     eax, 2                                  ; 4DCF _ C1. E0, 02
        add     eax, edx                                ; 4DD2 _ 01. D0
        shl     eax, 2                                  ; 4DD4 _ C1. E0, 02
        add     eax, ecx                                ; 4DD7 _ 01. C8
        add     eax, 8                                  ; 4DD9 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4DDC _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4DDF _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 4DE2 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 4DE4 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 4DE7 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 4DEA _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4DEE _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4DF1 _ 8B. 00
        lea     edx, [eax+1H]                           ; 4DF3 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4DF6 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4DF9 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4DFB _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4DFE _ C7. 40, 04, 00000002
        leave                                           ; 4E05 _ C9
        ret                                             ; 4E06 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 4E07 _ 55
        mov     ebp, esp                                ; 4E08 _ 89. E5
        sub     esp, 16                                 ; 4E0A _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4E0D _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp+8H]                     ; 4E13 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4E16 _ 8B. 50, 0C
        mov     eax, edx                                ; 4E19 _ 89. D0
        shl     eax, 2                                  ; 4E1B _ C1. E0, 02
        add     eax, edx                                ; 4E1E _ 01. D0
        shl     eax, 2                                  ; 4E20 _ C1. E0, 02
        add     eax, ecx                                ; 4E23 _ 01. C8
        add     eax, 8                                  ; 4E25 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4E28 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 4E2B _ C7. 45, F8, 00000000
        jmp     ?_284                                   ; 4E32 _ EB, 23

?_282:  mov     eax, dword [ebp-4H]                     ; 4E34 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4E37 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 4E3A _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 4E3E _ 3B. 45, 08
        jnz     ?_283                                   ; 4E41 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 4E43 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4E46 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 4E49 _ C7. 44 90, 08, 00000000
        jmp     ?_285                                   ; 4E51 _ EB, 0E

?_283:  add     dword [ebp-8H], 1                       ; 4E53 _ 83. 45, F8, 01
?_284:  mov     eax, dword [ebp-4H]                     ; 4E57 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4E5A _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4E5C _ 3B. 45, F8
        jg      ?_282                                   ; 4E5F _ 7F, D3
?_285:  mov     eax, dword [ebp-4H]                     ; 4E61 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4E64 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4E66 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4E69 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4E6C _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 4E6E _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4E71 _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 4E74 _ 3B. 45, F8
        jle     ?_286                                   ; 4E77 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 4E79 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4E7C _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 4E7F _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4E82 _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 4E85 _ 89. 50, 04
?_286:  mov     eax, dword [ebp-4H]                     ; 4E88 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4E8B _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4E8E _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4E91 _ 8B. 00
        cmp     edx, eax                                ; 4E93 _ 39. C2
        jl      ?_287                                   ; 4E95 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 4E97 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 4E9A _ C7. 40, 04, 00000000
?_287:  mov     eax, dword [ebp+8H]                     ; 4EA1 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 4EA4 _ C7. 40, 04, 00000001
        jmp     ?_289                                   ; 4EAB _ EB, 1B

?_288:  mov     eax, dword [ebp-8H]                     ; 4EAD _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 4EB0 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4EB3 _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 4EB6 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4EBA _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4EBD _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 4EC0 _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 4EC4 _ 83. 45, F8, 01
?_289:  mov     eax, dword [ebp-4H]                     ; 4EC8 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4ECB _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4ECD _ 3B. 45, F8
        jg      ?_288                                   ; 4ED0 _ 7F, DB
        leave                                           ; 4ED2 _ C9
        ret                                             ; 4ED3 _ C3
; task_remove End of function

task_switch_sub:; Function begin
        push    ebp                                     ; 4ED4 _ 55
        mov     ebp, esp                                ; 4ED5 _ 89. E5
        sub     esp, 16                                 ; 4ED7 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4EDA _ C7. 45, FC, 00000000
        jmp     ?_292                                   ; 4EE1 _ EB, 24

?_290:  mov     ecx, dword [task_control]               ; 4EE3 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 4EE9 _ 8B. 55, FC
        mov     eax, edx                                ; 4EEC _ 89. D0
        shl     eax, 2                                  ; 4EEE _ C1. E0, 02
        add     eax, edx                                ; 4EF1 _ 01. D0
        shl     eax, 2                                  ; 4EF3 _ C1. E0, 02
        add     eax, ecx                                ; 4EF6 _ 01. C8
        add     eax, 8                                  ; 4EF8 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 4EFB _ 8B. 00
        test    eax, eax                                ; 4EFD _ 85. C0
        jle     ?_291                                   ; 4EFF _ 7E, 02
        jmp     ?_293                                   ; 4F01 _ EB, 0A

?_291:  add     dword [ebp-4H], 1                       ; 4F03 _ 83. 45, FC, 01
?_292:  cmp     dword [ebp-4H], 2                       ; 4F07 _ 83. 7D, FC, 02
        jle     ?_290                                   ; 4F0B _ 7E, D6
?_293:  mov     eax, dword [task_control]               ; 4F0D _ A1, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 4F12 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 4F15 _ 89. 10
        mov     eax, dword [task_control]               ; 4F17 _ A1, 00002248(d)
        mov     dword [eax+4H], 0                       ; 4F1C _ C7. 40, 04, 00000000
        leave                                           ; 4F23 _ C9
        ret                                             ; 4F24 _ C3
; task_switch_sub End of function

task_send_message:; Function begin
        push    ebp                                     ; 4F25 _ 55
        mov     ebp, esp                                ; 4F26 _ 89. E5
        sub     esp, 24                                 ; 4F28 _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 4F2B _ 8B. 45, 10
        movzx   eax, al                                 ; 4F2E _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 4F31 _ 8B. 55, 0C
        add     edx, 16                                 ; 4F34 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 4F37 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 4F3B _ 89. 14 24
        call    fifo8_put                               ; 4F3E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 4F43 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4F46 _ 89. 04 24
        call    task_sleep                              ; 4F49 _ E8, FFFFFFFC(rel)
        leave                                           ; 4F4E _ C9
        ret                                             ; 4F4F _ C3
; task_send_message End of function

file_load_content:; Function begin
        push    ebp                                     ; 4F50 _ 55
        mov     ebp, esp                                ; 4F51 _ 89. E5
        sub     esp, 56                                 ; 4F53 _ 83. EC, 38
        mov     dword [ebp-24H], 78848                  ; 4F56 _ C7. 45, DC, 00013400
        mov     eax, dword [memman]                     ; 4F5D _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 4F62 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 4F6A _ 89. 04 24
        call    memman_alloc                            ; 4F6D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 4F72 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 4F75 _ 8B. 45, EC
        add     eax, 12                                 ; 4F78 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 4F7B _ C6. 00, 00
        jmp     ?_304                                   ; 4F7E _ E9, 00000129

?_294:  mov     dword [ebp-20H], 0                      ; 4F83 _ C7. 45, E0, 00000000
        jmp     ?_297                                   ; 4F8A _ EB, 2C

?_295:  mov     edx, dword [ebp-24H]                    ; 4F8C _ 8B. 55, DC
        mov     eax, dword [ebp-20H]                    ; 4F8F _ 8B. 45, E0
        add     eax, edx                                ; 4F92 _ 01. D0
        movzx   eax, byte [eax]                         ; 4F94 _ 0F B6. 00
        test    al, al                                  ; 4F97 _ 84. C0
        jz      ?_296                                   ; 4F99 _ 74, 1B
        mov     edx, dword [ebp-20H]                    ; 4F9B _ 8B. 55, E0
        mov     eax, dword [ebp-14H]                    ; 4F9E _ 8B. 45, EC
        add     edx, eax                                ; 4FA1 _ 01. C2
        mov     ecx, dword [ebp-24H]                    ; 4FA3 _ 8B. 4D, DC
        mov     eax, dword [ebp-20H]                    ; 4FA6 _ 8B. 45, E0
        add     eax, ecx                                ; 4FA9 _ 01. C8
        movzx   eax, byte [eax]                         ; 4FAB _ 0F B6. 00
        mov     byte [edx], al                          ; 4FAE _ 88. 02
        add     dword [ebp-20H], 1                      ; 4FB0 _ 83. 45, E0, 01
        jmp     ?_297                                   ; 4FB4 _ EB, 02

?_296:  jmp     ?_298                                   ; 4FB6 _ EB, 06

?_297:  cmp     dword [ebp-20H], 7                      ; 4FB8 _ 83. 7D, E0, 07
        jle     ?_295                                   ; 4FBC _ 7E, CE
?_298:  mov     dword [ebp-1CH], 0                      ; 4FBE _ C7. 45, E4, 00000000
        mov     edx, dword [ebp-20H]                    ; 4FC5 _ 8B. 55, E0
        mov     eax, dword [ebp-14H]                    ; 4FC8 _ 8B. 45, EC
        add     eax, edx                                ; 4FCB _ 01. D0
        mov     byte [eax], 46                          ; 4FCD _ C6. 00, 2E
        add     dword [ebp-20H], 1                      ; 4FD0 _ 83. 45, E0, 01
        mov     dword [ebp-1CH], 0                      ; 4FD4 _ C7. 45, E4, 00000000
        jmp     ?_300                                   ; 4FDB _ EB, 1E

?_299:  mov     edx, dword [ebp-20H]                    ; 4FDD _ 8B. 55, E0
        mov     eax, dword [ebp-14H]                    ; 4FE0 _ 8B. 45, EC
        add     edx, eax                                ; 4FE3 _ 01. C2
        mov     ecx, dword [ebp-24H]                    ; 4FE5 _ 8B. 4D, DC
        mov     eax, dword [ebp-1CH]                    ; 4FE8 _ 8B. 45, E4
        add     eax, ecx                                ; 4FEB _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 4FED _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 4FF1 _ 88. 02
        add     dword [ebp-20H], 1                      ; 4FF3 _ 83. 45, E0, 01
        add     dword [ebp-1CH], 1                      ; 4FF7 _ 83. 45, E4, 01
?_300:  cmp     dword [ebp-1CH], 2                      ; 4FFB _ 83. 7D, E4, 02
        jle     ?_299                                   ; 4FFF _ 7E, DC
        mov     edx, dword [ebp-20H]                    ; 5001 _ 8B. 55, E0
        mov     eax, dword [ebp-14H]                    ; 5004 _ 8B. 45, EC
        add     eax, edx                                ; 5007 _ 01. D0
        mov     byte [eax], 0                           ; 5009 _ C6. 00, 00
        mov     eax, dword [ebp-14H]                    ; 500C _ 8B. 45, EC
        mov     dword [esp+4H], eax                     ; 500F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 5013 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 5016 _ 89. 04 24
        call    strcmp                                  ; 5019 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 501E _ 83. F8, 01
        jne     ?_303                                   ; 5021 _ 0F 85, 00000081
        mov     eax, dword [ebp-24H]                    ; 5027 _ 8B. 45, DC
        mov     edx, dword [eax+1CH]                    ; 502A _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 502D _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 5032 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 5036 _ 89. 04 24
        call    memman_alloc_4k                         ; 5039 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 503E _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 5040 _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 5043 _ 89. 10
        mov     eax, dword [ebp-24H]                    ; 5045 _ 8B. 45, DC
        mov     eax, dword [eax+1CH]                    ; 5048 _ 8B. 40, 1C
        mov     edx, eax                                ; 504B _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 504D _ 8B. 45, 0C
        mov     dword [eax+4H], edx                     ; 5050 _ 89. 50, 04
        mov     dword [ebp-10H], 88064                  ; 5053 _ C7. 45, F0, 00015800
        mov     eax, dword [ebp-24H]                    ; 505A _ 8B. 45, DC
        movzx   eax, word [eax+1AH]                     ; 505D _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 5061 _ 0F B7. C0
        shl     eax, 9                                  ; 5064 _ C1. E0, 09
        add     dword [ebp-10H], eax                    ; 5067 _ 01. 45, F0
        mov     eax, dword [ebp-24H]                    ; 506A _ 8B. 45, DC
        mov     eax, dword [eax+1CH]                    ; 506D _ 8B. 40, 1C
        mov     dword [ebp-0CH], eax                    ; 5070 _ 89. 45, F4
        mov     dword [ebp-18H], 0                      ; 5073 _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 507A _ C7. 45, E8, 00000000
        jmp     ?_302                                   ; 5081 _ EB, 1B

?_301:  mov     eax, dword [ebp+0CH]                    ; 5083 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 5086 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 5088 _ 8B. 45, E8
        add     edx, eax                                ; 508B _ 01. C2
        mov     ecx, dword [ebp-18H]                    ; 508D _ 8B. 4D, E8
        mov     eax, dword [ebp-10H]                    ; 5090 _ 8B. 45, F0
        add     eax, ecx                                ; 5093 _ 01. C8
        movzx   eax, byte [eax]                         ; 5095 _ 0F B6. 00
        mov     byte [edx], al                          ; 5098 _ 88. 02
        add     dword [ebp-18H], 1                      ; 509A _ 83. 45, E8, 01
?_302:  mov     eax, dword [ebp-18H]                    ; 509E _ 8B. 45, E8
        cmp     eax, dword [ebp-0CH]                    ; 50A1 _ 3B. 45, F4
        jl      ?_301                                   ; 50A4 _ 7C, DD
        jmp     ?_305                                   ; 50A6 _ EB, 12

?_303:  add     dword [ebp-24H], 32                     ; 50A8 _ 83. 45, DC, 20
?_304:  mov     eax, dword [ebp-24H]                    ; 50AC _ 8B. 45, DC
        movzx   eax, byte [eax]                         ; 50AF _ 0F B6. 00
        test    al, al                                  ; 50B2 _ 84. C0
        jne     ?_294                                   ; 50B4 _ 0F 85, FFFFFEC9
?_305:  mov     edx, dword [ebp-14H]                    ; 50BA _ 8B. 55, EC
        mov     eax, dword [memman]                     ; 50BD _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 50C2 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 50CA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 50CE _ 89. 04 24
        call    memman_free                             ; 50D1 _ E8, FFFFFFFC(rel)
        leave                                           ; 50D6 _ C9
        ret                                             ; 50D7 _ C3
; file_load_content End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_306:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_307:                                                  ; byte
        db 6BH, 69H, 6CH, 6CH, 20H, 70H, 72H, 6FH       ; 0007 _ kill pro
        db 63H, 65H, 73H, 73H, 00H                      ; 000F _ cess.

?_308:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0014 _ console.

?_309:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 001C _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0024 _ sk b.

?_310:                                                  ; byte
        db 42H, 00H                                     ; 0029 _ B.

?_311:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 002B _ page is:
        db 20H, 00H                                     ; 0033 _  .

?_312:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0035 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 003D _ L: .

?_313:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0041 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0049 _ H: .

?_314:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 004D _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0055 _ w: .

?_315:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0059 _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0061 _ gh: .

?_316:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0066 _ type: .

?_317:                                                  ; byte
        db 3EH, 00H                                     ; 006D _ >.

?_318:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 006F _ mem.

?_319:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 0073 _ cls.

?_320:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 0077 _ dir.

?_321:                                                  ; byte
        db 68H, 6CH, 74H, 00H                           ; 007B _ hlt.

?_322:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 007F _ free .

?_323:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 0085 _  KB.

?_324:                                                  ; byte
        db 20H, 00H                                     ; 0089 _  .

?_325:                                                  ; byte
        db 68H, 6CH, 74H, 2EH, 65H, 78H, 65H, 00H       ; 008B _ hlt.exe.

?_326:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0093 _ console.

?_327:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 30H, 44H, 20H, 00H       ; 009B _ INT 0D .

?_328:                                                  ; byte
        db 47H, 65H, 6EH, 65H, 72H, 61H, 6CH, 20H       ; 00A3 _ General 
        db 50H, 72H, 6FH, 74H, 65H, 63H, 74H, 65H       ; 00AB _ Protecte
        db 64H, 20H, 45H, 78H, 63H, 65H, 70H, 74H       ; 00B3 _ d Except
        db 69H, 6FH, 6EH, 00H                           ; 00BB _ ion.

?_329:                                                  ; byte
        db 49H, 4EH, 54H, 20H, 30H, 43H, 00H            ; 00BF _ INT 0C.

?_330:                                                  ; byte
        db 53H, 74H, 61H, 63H, 6BH, 20H, 45H, 78H       ; 00C6 _ Stack Ex
        db 63H, 65H, 70H, 74H, 69H, 6FH, 6EH, 00H       ; 00CE _ ception.

?_331:                                                  ; byte
        db 45H, 49H, 50H, 20H, 3DH, 20H, 00H            ; 00D6 _ EIP = .


SECTION .data   align=32 noexecute                      ; section number 3, data

test:                                                   ; dword
        dd 00000064H                                    ; 0000 _ 100 

memman: dd 00100000H, 00000000H                         ; 0004 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 000C _ 0 0 
        dd 00000000H, 00000000H                         ; 0014 _ 0 0 
        dd 00000000H                                    ; 001C _ 0 

keytable:                                               ; byte
        db 00H, 00H, 31H, 32H, 33H, 34H, 35H, 36H       ; 0020 _ ..123456
        db 37H, 38H, 39H, 30H, 2DH, 3DH, 00H, 00H       ; 0028 _ 7890-=..
        db 51H, 57H, 45H, 52H, 54H, 59H, 55H, 49H       ; 0030 _ QWERTYUI
        db 4FH, 50H, 5BH, 5DH, 00H, 00H, 41H, 53H       ; 0038 _ OP[]..AS
        db 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH, 3BH       ; 0040 _ DFGHJKL;
        db 2CH, 60H, 00H, 5CH, 5AH, 58H, 43H, 56H       ; 0048 _ ,`.\ZXCV
        db 42H, 4EH, 4DH, 2CH, 2EH, 2FH, 00H, 00H       ; 0050 _ BNM,./..
        db 00H, 20H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ . ......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0060 _ ........
        db 00H, 00H, 2DH, 00H, 00H, 2BH, 00H, 00H       ; 0068 _ ..-..+..
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0070 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0080 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0088 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0090 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0098 _ ........

keytable_shift:                                         ; byte
        db 00H, 00H, 21H, 40H, 23H, 24H, 25H, 5EH       ; 00A0 _ ..!@#$%^
        db 26H, 2AH, 28H, 29H, 5FH, 2BH, 00H, 00H       ; 00A8 _ &*()_+..
        db 51H, 57H, 45H, 52H, 54H, 59H, 55H, 49H       ; 00B0 _ QWERTYUI
        db 4FH, 50H, 7BH, 7DH, 00H, 00H, 41H, 53H       ; 00B8 _ OP{}..AS
        db 44H, 46H, 47H, 48H, 4AH, 4BH, 4CH, 3AH       ; 00C0 _ DFGHJKL:
        db 22H, 7EH, 00H, 7CH, 5AH, 58H, 43H, 56H       ; 00C8 _ "~.|ZXCV
        db 42H, 4EH, 4DH, 3CH, 3EH, 3FH, 00H, 00H       ; 00D0 _ BNM<>?..
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00D8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00E0 _ ........
        db 00H, 00H, 2DH, 00H, 00H, 2BH, 00H, 00H       ; 00E8 _ ..-..+..
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00F0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00F8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0100 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0108 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0110 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0118 _ ........

table_rgb.1817:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0120 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0128 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0130 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0138 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0140 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0148 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0150 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........

cursor.1885:                                            ; byte
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0160 _ *.......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0168 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0170 _ **......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0178 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0180 _ *O*.....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0188 _ ........
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0190 _ *OO*....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0198 _ ........
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 01A0 _ *OOO*...
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01A8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 01B0 _ *OOOO*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01B8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 01C0 _ *OOOOO*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01C8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH       ; 01D0 _ *OOOOOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01D8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01E0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01E8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 2AH       ; 01F0 _ *OOOO***
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01F8 _ **......
        db 2AH, 4FH, 4FH, 2AH, 4FH, 2AH, 2EH, 2EH       ; 0200 _ *OO*O*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0208 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 0210 _ *O*.*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0218 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 0220 _ **..*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0228 _ ........
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0230 _ *....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0238 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0240 _ .....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0248 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2EH       ; 0250 _ ......*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0258 _ ........

closebtn.1972:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0260 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 0268 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0270 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0278 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0280 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0288 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0290 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0298 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 02A0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 02A8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 02B0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02B8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 02C0 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02C8 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 02D0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 02D8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 02E0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 02E8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 02F0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 02F8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0300 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0308 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0310 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0318 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0320 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0328 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0330 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0338 _ @@@@@@@@

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0340 _ 0X

?_332:  db 00H                                          ; 0342 _ .

?_333:  db 00H, 00H                                     ; 0343 _ ..


SECTION .bss    align=32 noexecute                      ; section number 4, bss

task_console_g:                                         ; dword
        resd    1                                       ; 0000

task_main:                                              ; dword
        resd    1                                       ; 0004

task_a: resd    1                                       ; 0008

sheet_control:                                          ; dword
        resd    1                                       ; 000C

back_sheet:                                             ; dword
        resd    1                                       ; 0010

mouse_sheet:                                            ; dword
        resd    1                                       ; 0014

timerinfo1.1800:                                        ; byte
        resb    28                                      ; 0018

timerbuf1.1803:                                         ; qword
        resq    1                                       ; 0034

timerinfo2.1801:                                        ; byte
        resb    28                                      ; 003C

timerbuf2.1804:                                         ; qword
        resq    1                                       ; 0058

timerinfo3.1802:                                        ; byte
        resb    28                                      ; 0060

timerbuf3.1805:                                         ; qword
        resq    4                                       ; 007C
        resb    4                                       ; 009C

screen_info:                                            ; qword
        resb    4                                       ; 00A0

?_334:  resw    1                                       ; 00A4

?_335:  resw    1                                       ; 00A6

g_Console:                                              ; byte
        resd    1                                       ; 00A8

?_336:  resd    1                                       ; 00AC

?_337:  resd    1                                       ; 00B0

?_338:  resd    1                                       ; 00B4

?_339:  resb    1                                       ; 00B8

?_340:  resb    7                                       ; 00B9

mouse_cursor_buf:                                       ; byte
        resb    256                                     ; 00C0

back_buf: resd  1                                       ; 01C0

sheet_win:                                              ; dword
        resd    1                                       ; 01C4

mouse_x: resd   1                                       ; 01C8

mouse_y: resd   1                                       ; 01CC

key_shift:                                              ; dword
        resd    1                                       ; 01D0

caps_lock:                                              ; dword
        resd    1                                       ; 01D4

buffer:                                                 ; qword
        resb    4                                       ; 01D8

?_341:  resd    1                                       ; 01DC

mouse_send_info:                                        ; oword
        resb    32                                      ; 01E0

keyinfo:                                                ; byte
        resb    32                                      ; 0200

keybuf:                                                 ; yword
        resb    32                                      ; 0220

mouseinfo:                                              ; byte
        resb    32                                      ; 0240

mousebuf:                                               ; byte
        resb    128                                     ; 0260

str.1386:                                               ; byte
        resb    1                                       ; 02E0

?_342:  resb    9                                       ; 02E1

?_343:  resb    22                                      ; 02EA

timer_control:                                          ; byte
        resd    2001                                    ; 0300

task_timer:                                             ; dword
        resd    1                                       ; 2244

task_control:                                           ; dword
        resd    1                                       ; 2248


