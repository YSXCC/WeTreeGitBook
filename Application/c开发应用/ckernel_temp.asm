; Disassembly of file: ckernel.o
; Thu Mar 19 21:13:31 2020
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
extern io_sti                                           ; near
extern load_tr                                          ; near
extern farjmp                                           ; near
extern get_code32_addr                                  ; near
extern keybuf                                           ; byte
extern io_store_eflags                                  ; near
extern mouse_cursor_buf                                 ; byte
extern get_addr_gdt                                     ; near
extern io_cli                                           ; near
extern sheet_control                                    ; dword
extern screen_info                                      ; dword
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
        mov     dword [ebp-48H], eax                    ; 001B _ 89. 45, B8
        movzx   eax, word [screen_info+4H]              ; 001E _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0025 _ 98
        mov     dword [ebp-44H], eax                    ; 0026 _ 89. 45, BC
        movzx   eax, word [screen_info+6H]              ; 0029 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 0030 _ 98
        mov     dword [ebp-40H], eax                    ; 0031 _ 89. 45, C0
        mov     eax, dword [memman]                     ; 0034 _ A1, 00000004(d)
        mov     dword [esp], eax                        ; 0039 _ 89. 04 24
        call    memman_init                             ; 003C _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 0041 _ A1, 00000004(d)
        mov     dword [esp+8H], 1072594944              ; 0046 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 17301504                ; 004E _ C7. 44 24, 04, 01080000
        mov     dword [esp], eax                        ; 0056 _ 89. 04 24
        call    memman_free                             ; 0059 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 005E _ A1, 00000004(d)
        mov     edx, dword [ebp-40H]                    ; 0063 _ 8B. 55, C0
        mov     dword [esp+0CH], edx                    ; 0066 _ 89. 54 24, 0C
        mov     edx, dword [ebp-44H]                    ; 006A _ 8B. 55, BC
        mov     dword [esp+8H], edx                     ; 006D _ 89. 54 24, 08
        mov     edx, dword [ebp-48H]                    ; 0071 _ 8B. 55, B8
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
        mov     eax, dword [ebp-44H]                    ; 00A9 _ 8B. 45, BC
        imul    eax, dword [ebp-40H]                    ; 00AC _ 0F AF. 45, C0
        mov     edx, eax                                ; 00B0 _ 89. C2
        mov     eax, dword [memman]                     ; 00B2 _ A1, 00000004(d)
        mov     dword [esp+4H], edx                     ; 00B7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00BB _ 89. 04 24
        call    memman_alloc_4k                         ; 00BE _ E8, FFFFFFFC(rel)
        mov     dword [back_buf], eax                   ; 00C3 _ A3, 00000000(d)
        mov     edx, dword [back_buf]                   ; 00C8 _ 8B. 15, 00000000(d)
        mov     eax, dword [back_sheet]                 ; 00CE _ A1, 00000010(d)
        mov     dword [esp+10H], 99                     ; 00D3 _ C7. 44 24, 10, 00000063
        mov     ecx, dword [ebp-40H]                    ; 00DB _ 8B. 4D, C0
        mov     dword [esp+0CH], ecx                    ; 00DE _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-44H]                    ; 00E2 _ 8B. 4D, BC
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
        mov     dword [ebp-3CH], eax                    ; 013B _ 89. 45, C4
        call    init_time_port                          ; 013E _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0143 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf1.1797          ; 014B _ C7. 44 24, 08, 00000034(d)
        mov     dword [esp+4H], 8                       ; 0153 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1794            ; 015B _ C7. 04 24, 00000018(d)
        call    fifo8_init                              ; 0162 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0167 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 016C _ 89. 45, C8
        mov     dword [esp+8H], 1                       ; 016F _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1794         ; 0177 _ C7. 44 24, 04, 00000018(d)
        mov     eax, dword [ebp-38H]                    ; 017F _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0182 _ 89. 04 24
        call    timer_init                              ; 0185 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 018A _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 0192 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0195 _ 89. 04 24
        call    timer_settime                           ; 0198 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 019D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf2.1798          ; 01A5 _ C7. 44 24, 08, 00000058(d)
        mov     dword [esp+4H], 8                       ; 01AD _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1795            ; 01B5 _ C7. 04 24, 0000003C(d)
        call    fifo8_init                              ; 01BC _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01C1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 01C6 _ 89. 45, CC
        mov     dword [esp+8H], 1                       ; 01C9 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1795         ; 01D1 _ C7. 44 24, 04, 0000003C(d)
        mov     eax, dword [ebp-34H]                    ; 01D9 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 01DC _ 89. 04 24
        call    timer_init                              ; 01DF _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01E4 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-34H]                    ; 01EC _ 8B. 45, CC
        mov     dword [esp], eax                        ; 01EF _ 89. 04 24
        call    timer_settime                           ; 01F2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 01F7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf3.1799          ; 01FF _ C7. 44 24, 08, 0000007C(d)
        mov     dword [esp+4H], 8                       ; 0207 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1796            ; 020F _ C7. 04 24, 00000060(d)
        call    fifo8_init                              ; 0216 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 021B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0220 _ 89. 45, D0
        mov     dword [esp+8H], 1                       ; 0223 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1796         ; 022B _ C7. 44 24, 04, 00000060(d)
        mov     eax, dword [ebp-30H]                    ; 0233 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0236 _ 89. 04 24
        call    timer_init                              ; 0239 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 023E _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-30H]                    ; 0246 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0249 _ 89. 04 24
        call    timer_settime                           ; 024C _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 0251 _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 0256 _ A1, 00000000(d)
        mov     edx, dword [ebp-40H]                    ; 025B _ 8B. 55, C0
        mov     dword [esp+8H], edx                     ; 025E _ 89. 54 24, 08
        mov     edx, dword [ebp-44H]                    ; 0262 _ 8B. 55, BC
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
        mov     dword [esp+4H], ?_304                   ; 02DC _ C7. 44 24, 04, 00000000(d)
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
        mov     dword [ebp-2CH], eax                    ; 0339 _ 89. 45, D4
        call    get_addr_gdt                            ; 033C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 0341 _ 89. 45, D8
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
        mov     dword [ebp-24H], eax                    ; 038C _ 89. 45, DC
        mov     dword [ebp-20H], 0                      ; 038F _ C7. 45, E0, 00000000
        mov     dword [ebp-1CH], 0                      ; 0396 _ C7. 45, E4, 00000000
        mov     dword [ebp-18H], 0                      ; 039D _ C7. 45, E8, 00000000
        mov     dword [ebp-58H], 8                      ; 03A4 _ C7. 45, A8, 00000008
        mov     dword [ebp-54H], 7                      ; 03AB _ C7. 45, AC, 00000007
        mov     dword [ebp-14H], 0                      ; 03B2 _ C7. 45, EC, 00000000
        mov     dword [ebp-50H], 0                      ; 03B9 _ C7. 45, B0, 00000000
        mov     dword [ebp-10H], 0                      ; 03C0 _ C7. 45, F0, 00000000
?_001:  call    io_cli                                  ; 03C7 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 03CC _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 03D3 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 03D8 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 03DA _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 03E1 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03E6 _ 01. C3
        mov     dword [esp], timerinfo1.1794            ; 03E8 _ C7. 04 24, 00000018(d)
        call    fifo8_status                            ; 03EF _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03F4 _ 01. C3
        mov     dword [esp], timerinfo2.1795            ; 03F6 _ C7. 04 24, 0000003C(d)
        call    fifo8_status                            ; 03FD _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0402 _ 01. C3
        mov     dword [esp], timerinfo3.1796            ; 0404 _ C7. 04 24, 00000060(d)
        call    fifo8_status                            ; 040B _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 0410 _ 01. D8
        test    eax, eax                                ; 0412 _ 85. C0
        jnz     ?_002                                   ; 0414 _ 75, 0A
        call    io_sti                                  ; 0416 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 041B _ E9, 00000421

?_002:  mov     dword [esp], keyinfo                    ; 0420 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0427 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 042C _ 85. C0
        je      ?_007                                   ; 042E _ 0F 84, 00000396
        call    io_sti                                  ; 0434 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0439 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0440 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0445 _ 89. 45, E0
        cmp     dword [ebp-20H], 15                     ; 0448 _ 83. 7D, E0, 0F
        jne     ?_005                                   ; 044C _ 0F 85, 000001A5
        mov     dword [ebp-4CH], -1                     ; 0452 _ C7. 45, B4, FFFFFFFF
        cmp     dword [ebp-50H], 0                      ; 0459 _ 83. 7D, B0, 00
        jne     ?_003                                   ; 045D _ 0F 85, 00000089
        mov     dword [ebp-50H], 1                      ; 0463 _ C7. 45, B0, 00000001
        mov     edx, dword [sheet_win]                  ; 046A _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0470 _ A1, 0000000C(d)
        mov     dword [esp+0CH], 0                      ; 0475 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_304                   ; 047D _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 0485 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0489 _ 89. 04 24
        call    make_window_title                       ; 048C _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 0491 _ A1, 0000000C(d)
        mov     dword [esp+0CH], 1                      ; 0496 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_305                   ; 049E _ C7. 44 24, 08, 00000007(d)
        mov     edx, dword [ebp-24H]                    ; 04A6 _ 8B. 55, DC
        mov     dword [esp+4H], edx                     ; 04A9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04AD _ 89. 04 24
        call    make_window_title                       ; 04B0 _ E8, FFFFFFFC(rel)
        mov     edx, dword [sheet_win]                  ; 04B5 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 04BB _ A1, 0000000C(d)
        mov     dword [esp+10H], 7                      ; 04C0 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 04C8 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 04D0 _ 8B. 4D, A8
        mov     dword [esp+8H], ecx                     ; 04D3 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 04D7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04DB _ 89. 04 24
        call    set_cursor                              ; 04DE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4CH], 87                     ; 04E3 _ C7. 45, B4, 00000057
        jmp     ?_004                                   ; 04EA _ EB, 71

?_003:  mov     dword [ebp-50H], 0                      ; 04EC _ C7. 45, B0, 00000000
        mov     edx, dword [sheet_win]                  ; 04F3 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 04F9 _ A1, 0000000C(d)
        mov     dword [esp+0CH], 1                      ; 04FE _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_304                   ; 0506 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 050E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0512 _ 89. 04 24
        call    make_window_title                       ; 0515 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 051A _ A1, 0000000C(d)
        mov     dword [esp+0CH], 0                      ; 051F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_305                   ; 0527 _ C7. 44 24, 08, 00000007(d)
        mov     edx, dword [ebp-24H]                    ; 052F _ 8B. 55, DC
        mov     dword [esp+4H], edx                     ; 0532 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0536 _ 89. 04 24
        call    make_window_title                       ; 0539 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_console_g]             ; 053E _ A1, 00000000(d)
        add     eax, 16                                 ; 0543 _ 83. C0, 10
        mov     dword [esp+4H], 88                      ; 0546 _ C7. 44 24, 04, 00000058
        mov     dword [esp], eax                        ; 054E _ 89. 04 24
        call    fifo8_put                               ; 0551 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4CH], 88                     ; 0556 _ C7. 45, B4, 00000058
?_004:  mov     eax, dword [sheet_win]                  ; 055D _ A1, 00000000(d)
        mov     ebx, dword [eax+8H]                     ; 0562 _ 8B. 58, 08
        mov     eax, dword [sheet_win]                  ; 0565 _ A1, 00000000(d)
        mov     ecx, dword [eax+4H]                     ; 056A _ 8B. 48, 04
        mov     edx, dword [sheet_win]                  ; 056D _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0573 _ A1, 0000000C(d)
        mov     dword [esp+14H], ebx                    ; 0578 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 057C _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 0580 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0588 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0590 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0594 _ 89. 04 24
        call    sheet_refresh                           ; 0597 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-24H]                    ; 059C _ 8B. 45, DC
        mov     ecx, dword [eax+8H]                     ; 059F _ 8B. 48, 08
        mov     eax, dword [ebp-24H]                    ; 05A2 _ 8B. 45, DC
        mov     edx, dword [eax+4H]                     ; 05A5 _ 8B. 50, 04
        mov     eax, dword [sheet_control]              ; 05A8 _ A1, 0000000C(d)
        mov     dword [esp+14H], ecx                    ; 05AD _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 05B1 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 05B5 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 05BD _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-24H]                    ; 05C5 _ 8B. 55, DC
        mov     dword [esp+4H], edx                     ; 05C8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05CC _ 89. 04 24
        call    sheet_refresh                           ; 05CF _ E8, FFFFFFFC(rel)
        mov     edx, dword [task_console_g]             ; 05D4 _ 8B. 15, 00000000(d)
        mov     eax, dword [task_a]                     ; 05DA _ A1, 00000008(d)
        mov     ecx, dword [ebp-4CH]                    ; 05DF _ 8B. 4D, B4
        mov     dword [esp+8H], ecx                     ; 05E2 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 05E6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05EA _ 89. 04 24
        call    task_send_message                       ; 05ED _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 05F2 _ E9, 0000024A

?_005:  cmp     dword [ebp-50H], 0                      ; 05F7 _ 83. 7D, B0, 00
        jne     ?_006                                   ; 05FB _ 0F 85, 00000178
        mov     eax, dword [ebp-20H]                    ; 0601 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 0604 _ 89. 04 24
        call    transfer_scancode                       ; 0607 _ E8, FFFFFFFC(rel)
        test    al, al                                  ; 060C _ 84. C0
        je      ?_010                                   ; 060E _ 0F 84, 0000022D
        cmp     dword [ebp-58H], 143                    ; 0614 _ 81. 7D, A8, 0000008F
        jg      ?_010                                   ; 061B _ 0F 8F, 00000220
        mov     eax, dword [ebp-58H]                    ; 0621 _ 8B. 45, A8
        lea     ecx, [eax+7H]                           ; 0624 _ 8D. 48, 07
        mov     eax, dword [sheet_win]                  ; 0627 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 062C _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 062F _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 0634 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0636 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 063E _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 0642 _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 064A _ 8B. 4D, A8
        mov     dword [esp+0CH], ecx                    ; 064D _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 0651 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 0659 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 065D _ 89. 04 24
        call    paint_rectangle                         ; 0660 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-58H]                    ; 0665 _ 8B. 45, A8
        lea     ecx, [eax+8H]                           ; 0668 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 066B _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0671 _ A1, 0000000C(d)
        mov     dword [esp+14H], 44                     ; 0676 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 067E _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0682 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 068A _ 8B. 4D, A8
        mov     dword [esp+8H], ecx                     ; 068D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0691 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0695 _ 89. 04 24
        call    sheet_refresh                           ; 0698 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-20H]                    ; 069D _ 8B. 45, E0
        mov     dword [esp], eax                        ; 06A0 _ 89. 04 24
        call    transfer_scancode                       ; 06A3 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-5BH], al                      ; 06A8 _ 88. 45, A5
        movzx   eax, byte [ebp-5BH]                     ; 06AB _ 0F B6. 45, A5
        mov     byte [ebp-5AH], al                      ; 06AF _ 88. 45, A6
        mov     byte [ebp-59H], 0                       ; 06B2 _ C6. 45, A7, 00
        mov     edx, dword [sheet_win]                  ; 06B6 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 06BC _ A1, 0000000C(d)
        mov     dword [esp+14H], 0                      ; 06C1 _ C7. 44 24, 14, 00000000
        lea     ecx, [ebp-5AH]                          ; 06C9 _ 8D. 4D, A6
        mov     dword [esp+10H], ecx                    ; 06CC _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 06D0 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 06D8 _ 8B. 4D, A8
        mov     dword [esp+8H], ecx                     ; 06DB _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06DF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06E3 _ 89. 04 24
        call    paint_string                            ; 06E6 _ E8, FFFFFFFC(rel)
        add     dword [ebp-58H], 8                      ; 06EB _ 83. 45, A8, 08
        mov     dword [ebp-10H], 1                      ; 06EF _ C7. 45, F0, 00000001
        mov     eax, dword [ebp-58H]                    ; 06F6 _ 8B. 45, A8
        lea     ebx, [eax+7H]                           ; 06F9 _ 8D. 58, 07
        mov     eax, dword [ebp-54H]                    ; 06FC _ 8B. 45, AC
        movzx   ecx, al                                 ; 06FF _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 0702 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 0707 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 070A _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 070F _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0711 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 0719 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 071D _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-58H]                    ; 0725 _ 8B. 5D, A8
        mov     dword [esp+0CH], ebx                    ; 0728 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 072C _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0730 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0734 _ 89. 04 24
        call    paint_rectangle                         ; 0737 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-58H]                    ; 073C _ 8B. 45, A8
        lea     ecx, [eax+8H]                           ; 073F _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 0742 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0748 _ A1, 0000000C(d)
        mov     dword [esp+14H], 44                     ; 074D _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 0755 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0759 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 0761 _ 8B. 4D, A8
        mov     dword [esp+8H], ecx                     ; 0764 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0768 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 076C _ 89. 04 24
        call    sheet_refresh                           ; 076F _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0774 _ E9, 000000C8

?_006:  mov     eax, dword [ebp-20H]                    ; 0779 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 077C _ 89. 04 24
        call    is_special_key                          ; 077F _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0784 _ 85. C0
        jne     ?_010                                   ; 0786 _ 0F 85, 000000B5
        mov     eax, dword [ebp-20H]                    ; 078C _ 8B. 45, E0
        movzx   eax, al                                 ; 078F _ 0F B6. C0
        mov     edx, dword [task_console_g]             ; 0792 _ 8B. 15, 00000000(d)
        add     edx, 16                                 ; 0798 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 079B _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 079F _ 89. 14 24
        call    fifo8_put                               ; 07A2 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 07A7 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 07AE _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07B3 _ 85. C0
        jne     ?_010                                   ; 07B5 _ 0F 85, 00000086
        mov     eax, dword [task_a]                     ; 07BB _ A1, 00000008(d)
        mov     dword [esp], eax                        ; 07C0 _ 89. 04 24
        call    task_sleep                              ; 07C3 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 07C8 _ EB, 77

?_007:  mov     dword [esp], mouseinfo                  ; 07CA _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 07D1 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07D6 _ 85. C0
        jz      ?_008                                   ; 07D8 _ 74, 23
        mov     ecx, dword [mouse_sheet]                ; 07DA _ 8B. 0D, 00000014(d)
        mov     edx, dword [back_sheet]                 ; 07E0 _ 8B. 15, 00000010(d)
        mov     eax, dword [sheet_control]              ; 07E6 _ A1, 0000000C(d)
        mov     dword [esp+8H], ecx                     ; 07EB _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 07EF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07F3 _ 89. 04 24
        call    show_mouse_info                         ; 07F6 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 07FB _ EB, 44

?_008:  mov     dword [esp], timerinfo1.1794            ; 07FD _ C7. 04 24, 00000018(d)
        call    fifo8_status                            ; 0804 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0809 _ 85. C0
        jz      ?_009                                   ; 080B _ 74, 13
        call    io_sti                                  ; 080D _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1794            ; 0812 _ C7. 04 24, 00000018(d)
        call    fifo8_get                               ; 0819 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 081E _ EB, 21

?_009:  mov     dword [esp], timerinfo2.1795            ; 0820 _ C7. 04 24, 0000003C(d)
        call    fifo8_status                            ; 0827 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 082C _ 85. C0
        jz      ?_010                                   ; 082E _ 74, 11
        call    io_sti                                  ; 0830 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1795            ; 0835 _ C7. 04 24, 0000003C(d)
        call    fifo8_get                               ; 083C _ E8, FFFFFFFC(rel)
?_010:  mov     dword [esp], timerinfo3.1796            ; 0841 _ C7. 04 24, 00000060(d)
        call    fifo8_status                            ; 0848 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 084D _ 85. C0
        je      ?_014                                   ; 084F _ 0F 84, 000000DB
        mov     dword [esp], timerinfo3.1796            ; 0855 _ C7. 04 24, 00000060(d)
        call    fifo8_get                               ; 085C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0861 _ 89. 45, F4
        call    io_sti                                  ; 0864 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 0869 _ 83. 7D, F4, 00
        jz      ?_011                                   ; 086D _ 74, 24
        mov     dword [esp+8H], 0                       ; 086F _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1796         ; 0877 _ C7. 44 24, 04, 00000060(d)
        mov     eax, dword [ebp-30H]                    ; 087F _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0882 _ 89. 04 24
        call    timer_init                              ; 0885 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-54H], 0                      ; 088A _ C7. 45, AC, 00000000
        jmp     ?_012                                   ; 0891 _ EB, 22

?_011:  mov     dword [esp+8H], 1                       ; 0893 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1796         ; 089B _ C7. 44 24, 04, 00000060(d)
        mov     eax, dword [ebp-30H]                    ; 08A3 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 08A6 _ 89. 04 24
        call    timer_init                              ; 08A9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-54H], 7                      ; 08AE _ C7. 45, AC, 00000007
?_012:  mov     dword [esp+4H], 50                      ; 08B5 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-30H]                    ; 08BD _ 8B. 45, D0
        mov     dword [esp], eax                        ; 08C0 _ 89. 04 24
        call    timer_settime                           ; 08C3 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-50H], 0                      ; 08C8 _ 83. 7D, B0, 00
        jnz     ?_013                                   ; 08CC _ 75, 2F
        mov     edx, dword [sheet_win]                  ; 08CE _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 08D4 _ A1, 0000000C(d)
        mov     ecx, dword [ebp-54H]                    ; 08D9 _ 8B. 4D, AC
        mov     dword [esp+10H], ecx                    ; 08DC _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 08E0 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 08E8 _ 8B. 4D, A8
        mov     dword [esp+8H], ecx                     ; 08EB _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08EF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08F3 _ 89. 04 24
        call    set_cursor                              ; 08F6 _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 08FB _ EB, 33

?_013:  mov     edx, dword [sheet_win]                  ; 08FD _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0903 _ A1, 0000000C(d)
        mov     dword [esp+10H], 7                      ; 0908 _ C7. 44 24, 10, 00000007
        mov     dword [esp+0CH], 28                     ; 0910 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-58H]                    ; 0918 _ 8B. 4D, A8
        mov     dword [esp+8H], ecx                     ; 091B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 091F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0923 _ 89. 04 24
        call    set_cursor                              ; 0926 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 092B _ E9, FFFFFA97

?_014:  jmp     ?_001                                   ; 0930 _ E9, FFFFFA92
; CMain End of function

task_b_main:; Function begin
        push    ebp                                     ; 0935 _ 55
        mov     ebp, esp                                ; 0936 _ 89. E5
        sub     esp, 104                                ; 0938 _ 83. EC, 68
        mov     eax, dword [ebp+8H]                     ; 093B _ 8B. 45, 08
        mov     dword [ebp-4CH], eax                    ; 093E _ 89. 45, B4
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 0941 _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 0947 _ 89. 45, F4
        xor     eax, eax                                ; 094A _ 31. C0
        mov     edx, dword [back_sheet]                 ; 094C _ 8B. 15, 00000010(d)
        mov     eax, dword [sheet_control]              ; 0952 _ A1, 0000000C(d)
        mov     dword [esp+14H], 7                      ; 0957 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_306                  ; 095F _ C7. 44 24, 10, 0000000F(d)
        mov     dword [esp+0CH], 160                    ; 0967 _ C7. 44 24, 0C, 000000A0
        mov     dword [esp+8H], 0                       ; 096F _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0977 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 097B _ 89. 04 24
        call    paint_string                            ; 097E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], 0                      ; 0983 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 098A _ C7. 45, CC, 00000000
        mov     dword [esp+0CH], 0                      ; 0991 _ C7. 44 24, 0C, 00000000
        lea     eax, [ebp-14H]                          ; 0999 _ 8D. 45, EC
        mov     dword [esp+8H], eax                     ; 099C _ 89. 44 24, 08
        mov     dword [esp+4H], 8                       ; 09A0 _ C7. 44 24, 04, 00000008
        lea     eax, [ebp-30H]                          ; 09A8 _ 8D. 45, D0
        mov     dword [esp], eax                        ; 09AB _ 89. 04 24
        call    fifo8_init                              ; 09AE _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 09B3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 09B8 _ 89. 45, C8
        mov     dword [esp+8H], 123                     ; 09BB _ C7. 44 24, 08, 0000007B
        lea     eax, [ebp-30H]                          ; 09C3 _ 8D. 45, D0
        mov     dword [esp+4H], eax                     ; 09C6 _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 09CA _ 8B. 45, C8
        mov     dword [esp], eax                        ; 09CD _ 89. 04 24
        call    timer_init                              ; 09D0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 09D5 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 09DD _ 8B. 45, C8
        mov     dword [esp], eax                        ; 09E0 _ 89. 04 24
        call    timer_settime                           ; 09E3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-40H], 0                      ; 09E8 _ C7. 45, C0, 00000000
        mov     dword [ebp-3CH], 0                      ; 09EF _ C7. 45, C4, 00000000
?_015:  add     dword [ebp-40H], 1                      ; 09F6 _ 83. 45, C0, 01
        call    io_cli                                  ; 09FA _ E8, FFFFFFFC(rel)
        lea     eax, [ebp-30H]                          ; 09FF _ 8D. 45, D0
        mov     dword [esp], eax                        ; 0A02 _ 89. 04 24
        call    fifo8_status                            ; 0A05 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0A0A _ 85. C0
        jnz     ?_016                                   ; 0A0C _ 75, 07
        call    io_sti                                  ; 0A0E _ E8, FFFFFFFC(rel)
        jmp     ?_017                                   ; 0A13 _ EB, 6B

?_016:  lea     eax, [ebp-30H]                          ; 0A15 _ 8D. 45, D0
        mov     dword [esp], eax                        ; 0A18 _ 89. 04 24
        call    fifo8_get                               ; 0A1B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 0A20 _ 89. 45, CC
        call    io_sti                                  ; 0A23 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-34H], 123                    ; 0A28 _ 83. 7D, CC, 7B
        jnz     ?_017                                   ; 0A2C _ 75, 52
        mov     edx, dword [back_sheet]                 ; 0A2E _ 8B. 15, 00000010(d)
        mov     eax, dword [sheet_control]              ; 0A34 _ A1, 0000000C(d)
        mov     dword [esp+14H], 7                      ; 0A39 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_307                  ; 0A41 _ C7. 44 24, 10, 0000001C(d)
        mov     dword [esp+0CH], 176                    ; 0A49 _ C7. 44 24, 0C, 000000B0
        mov     ecx, dword [ebp-3CH]                    ; 0A51 _ 8B. 4D, C4
        mov     dword [esp+8H], ecx                     ; 0A54 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0A58 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0A5C _ 89. 04 24
        call    paint_string                            ; 0A5F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0A64 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 0A6C _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0A6F _ 89. 04 24
        call    timer_settime                           ; 0A72 _ E8, FFFFFFFC(rel)
        add     dword [ebp-3CH], 8                      ; 0A77 _ 83. 45, C4, 08
        jmp     ?_015                                   ; 0A7B _ E9, FFFFFF76

?_017:  jmp     ?_015                                   ; 0A80 _ E9, FFFFFF71
; task_b_main End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0A85 _ 55
        mov     ebp, esp                                ; 0A86 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0A88 _ A1, 00000000(d)
        mov     edx, eax                                ; 0A8D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A8F _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0A92 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0A94 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0A97 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0A9D _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 0AA0 _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 0AA6 _ 5D
        ret                                             ; 0AA7 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0AA8 _ 55
        mov     ebp, esp                                ; 0AA9 _ 89. E5
        sub     esp, 24                                 ; 0AAB _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1812          ; 0AAE _ C7. 44 24, 08, 00000120(d)
        mov     dword [esp+4H], 15                      ; 0AB6 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 0ABE _ C7. 04 24, 00000000
        call    set_palette                             ; 0AC5 _ E8, FFFFFFFC(rel)
        nop                                             ; 0ACA _ 90
        leave                                           ; 0ACB _ C9
        ret                                             ; 0ACC _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0ACD _ 55
        mov     ebp, esp                                ; 0ACE _ 89. E5
        sub     esp, 40                                 ; 0AD0 _ 83. EC, 28
        call    io_load_eflags                          ; 0AD3 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0AD8 _ 89. 45, F0
        call    io_cli                                  ; 0ADB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0AE0 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0AE3 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0AE7 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0AEE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0AF3 _ 8B. 45, 08
        mov     dword [ebp-0CH], eax                    ; 0AF6 _ 89. 45, F4
        jmp     ?_019                                   ; 0AF9 _ EB, 62

?_018:  mov     eax, dword [ebp+10H]                    ; 0AFB _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0AFE _ 0F B6. 00
        shr     al, 2                                   ; 0B01 _ C0. E8, 02
        movzx   eax, al                                 ; 0B04 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0B07 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0B0B _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0B12 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B17 _ 8B. 45, 10
        add     eax, 1                                  ; 0B1A _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0B1D _ 0F B6. 00
        shr     al, 2                                   ; 0B20 _ C0. E8, 02
        movzx   eax, al                                 ; 0B23 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0B26 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0B2A _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0B31 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B36 _ 8B. 45, 10
        add     eax, 2                                  ; 0B39 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0B3C _ 0F B6. 00
        shr     al, 2                                   ; 0B3F _ C0. E8, 02
        movzx   eax, al                                 ; 0B42 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0B45 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0B49 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0B50 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0B55 _ 83. 45, 10, 03
        add     dword [ebp-0CH], 1                      ; 0B59 _ 83. 45, F4, 01
?_019:  mov     eax, dword [ebp-0CH]                    ; 0B5D _ 8B. 45, F4
        cmp     eax, dword [ebp+0CH]                    ; 0B60 _ 3B. 45, 0C
        jle     ?_018                                   ; 0B63 _ 7E, 96
        mov     eax, dword [ebp-10H]                    ; 0B65 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 0B68 _ 89. 04 24
        call    io_store_eflags                         ; 0B6B _ E8, FFFFFFFC(rel)
        nop                                             ; 0B70 _ 90
        leave                                           ; 0B71 _ C9
        ret                                             ; 0B72 _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0B73 _ 55
        mov     ebp, esp                                ; 0B74 _ 89. E5
        sub     esp, 20                                 ; 0B76 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0B79 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0B7C _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0B7F _ 8B. 45, 18
        mov     dword [ebp-8H], eax                     ; 0B82 _ 89. 45, F8
        jmp     ?_023                                   ; 0B85 _ EB, 33

?_020:  mov     eax, dword [ebp+14H]                    ; 0B87 _ 8B. 45, 14
        mov     dword [ebp-4H], eax                     ; 0B8A _ 89. 45, FC
        jmp     ?_022                                   ; 0B8D _ EB, 1F

?_021:  mov     eax, dword [ebp-8H]                     ; 0B8F _ 8B. 45, F8
        imul    eax, dword [ebp+0CH]                    ; 0B92 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B96 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0B98 _ 8B. 45, FC
        add     eax, edx                                ; 0B9B _ 01. D0
        mov     edx, eax                                ; 0B9D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B9F _ 8B. 45, 08
        add     edx, eax                                ; 0BA2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0BA4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0BA8 _ 88. 02
        add     dword [ebp-4H], 1                       ; 0BAA _ 83. 45, FC, 01
?_022:  mov     eax, dword [ebp-4H]                     ; 0BAE _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 0BB1 _ 3B. 45, 1C
        jle     ?_021                                   ; 0BB4 _ 7E, D9
        add     dword [ebp-8H], 1                       ; 0BB6 _ 83. 45, F8, 01
?_023:  mov     eax, dword [ebp-8H]                     ; 0BBA _ 8B. 45, F8
        cmp     eax, dword [ebp+20H]                    ; 0BBD _ 3B. 45, 20
        jle     ?_020                                   ; 0BC0 _ 7E, C5
        leave                                           ; 0BC2 _ C9
        ret                                             ; 0BC3 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0BC4 _ 55
        mov     ebp, esp                                ; 0BC5 _ 89. E5
        push    ebx                                     ; 0BC7 _ 53
        sub     esp, 28                                 ; 0BC8 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 0BCB _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0BCE _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0BD1 _ 8B. 45, 0C
        sub     eax, 1                                  ; 0BD4 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0BD7 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0BDB _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0BDF _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0BE7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0BEF _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0BF7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0BFA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0BFE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C01 _ 89. 04 24
        call    paint_rectangle                         ; 0C04 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C09 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0C0C _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0C0F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0C12 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0C15 _ 8B. 45, 10
        sub     eax, 28                                 ; 0C18 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 0C1B _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0C1F _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0C23 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0C27 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0C2F _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0C37 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C3A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C3E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C41 _ 89. 04 24
        call    paint_rectangle                         ; 0C44 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C49 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0C4C _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0C4F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0C52 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0C55 _ 8B. 45, 10
        sub     eax, 27                                 ; 0C58 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0C5B _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0C5F _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0C63 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0C67 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0C6F _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0C77 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C7A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C7E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C81 _ 89. 04 24
        call    paint_rectangle                         ; 0C84 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C89 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0C8C _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0C8F _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0C92 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0C95 _ 8B. 45, 10
        sub     eax, 26                                 ; 0C98 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0C9B _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0C9F _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0CA3 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0CA7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0CAF _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0CB7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CBA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CBE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CC1 _ 89. 04 24
        call    paint_rectangle                         ; 0CC4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0CC9 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0CCC _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0CCF _ 8B. 45, 10
        sub     eax, 24                                 ; 0CD2 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0CD5 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0CD9 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0CE1 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0CE5 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0CED _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0CF5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CF8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CFC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CFF _ 89. 04 24
        call    paint_rectangle                         ; 0D02 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D07 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0D0A _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0D0D _ 8B. 45, 10
        sub     eax, 24                                 ; 0D10 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0D13 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0D17 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0D1F _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0D23 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 0D2B _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0D33 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D36 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D3A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D3D _ 89. 04 24
        call    paint_rectangle                         ; 0D40 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D45 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0D48 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0D4B _ 8B. 45, 10
        sub     eax, 4                                  ; 0D4E _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0D51 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0D55 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0D5D _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0D61 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0D69 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0D71 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D74 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D78 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D7B _ 89. 04 24
        call    paint_rectangle                         ; 0D7E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D83 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0D86 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0D89 _ 8B. 45, 10
        sub     eax, 23                                 ; 0D8C _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0D8F _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0D93 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0D9B _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0D9F _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0DA7 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0DAF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DB2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DB6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DB9 _ 89. 04 24
        call    paint_rectangle                         ; 0DBC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0DC1 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0DC4 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0DC7 _ 8B. 45, 10
        sub     eax, 3                                  ; 0DCA _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0DCD _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0DD1 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0DD9 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0DDD _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0DE5 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0DED _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DF0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DF4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DF7 _ 89. 04 24
        call    paint_rectangle                         ; 0DFA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0DFF _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0E02 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0E05 _ 8B. 45, 10
        sub     eax, 24                                 ; 0E08 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0E0B _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 0E0F _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0E17 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 0E1B _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0E23 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0E2B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E2E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E32 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E35 _ 89. 04 24
        call    paint_rectangle                         ; 0E38 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E3D _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0E40 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0E43 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0E46 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0E49 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0E4C _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0E4F _ 8B. 45, 0C
        sub     eax, 47                                 ; 0E52 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0E55 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0E59 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0E5D _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0E61 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0E65 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0E6D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E70 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E74 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E77 _ 89. 04 24
        call    paint_rectangle                         ; 0E7A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E7F _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0E82 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0E85 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0E88 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0E8B _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0E8E _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0E91 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0E94 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0E97 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0E9B _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0E9F _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0EA3 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0EA7 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0EAF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EB2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EB6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EB9 _ 89. 04 24
        call    paint_rectangle                         ; 0EBC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0EC1 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0EC4 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0EC7 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0ECA _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0ECD _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0ED0 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0ED3 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0ED6 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0ED9 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0EDD _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0EE1 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0EE5 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0EE9 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0EF1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EF4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EF8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EFB _ 89. 04 24
        call    paint_rectangle                         ; 0EFE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0F03 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0F06 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0F09 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0F0C _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0F0F _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0F12 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0F15 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0F18 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 0F1B _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0F1F _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0F23 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0F27 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0F2B _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0F33 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0F36 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F3A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F3D _ 89. 04 24
        call    paint_rectangle                         ; 0F40 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0F45 _ 83. C4, 1C
        pop     ebx                                     ; 0F48 _ 5B
        pop     ebp                                     ; 0F49 _ 5D
        ret                                             ; 0F4A _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 0F4B _ 55
        mov     ebp, esp                                ; 0F4C _ 89. E5
        sub     esp, 16                                 ; 0F4E _ 83. EC, 10
        movzx   eax, word [?_326]                       ; 0F51 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 0F58 _ 98
        mov     dword [ebp-4H], eax                     ; 0F59 _ 89. 45, FC
        movzx   eax, word [?_327]                       ; 0F5C _ 0F B7. 05, 000000A6(d)
        cwde                                            ; 0F63 _ 98
        mov     dword [ebp-8H], eax                     ; 0F64 _ 89. 45, F8
        mov     eax, dword [ebp-4H]                     ; 0F67 _ 8B. 45, FC
        sub     eax, 16                                 ; 0F6A _ 83. E8, 10
        mov     edx, eax                                ; 0F6D _ 89. C2
        shr     edx, 31                                 ; 0F6F _ C1. EA, 1F
        add     eax, edx                                ; 0F72 _ 01. D0
        sar     eax, 1                                  ; 0F74 _ D1. F8
        mov     dword [mouse_x], eax                    ; 0F76 _ A3, 000001C8(d)
        mov     eax, dword [ebp-8H]                     ; 0F7B _ 8B. 45, F8
        sub     eax, 44                                 ; 0F7E _ 83. E8, 2C
        mov     edx, eax                                ; 0F81 _ 89. C2
        shr     edx, 31                                 ; 0F83 _ C1. EA, 1F
        add     eax, edx                                ; 0F86 _ 01. D0
        sar     eax, 1                                  ; 0F88 _ D1. F8
        mov     dword [mouse_y], eax                    ; 0F8A _ A3, 000001CC(d)
        leave                                           ; 0F8F _ C9
        ret                                             ; 0F90 _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0F91 _ 55
        mov     ebp, esp                                ; 0F92 _ 89. E5
        sub     esp, 20                                 ; 0F94 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 0F97 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 0F9A _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0F9D _ C7. 45, FC, 00000000
        jmp     ?_033                                   ; 0FA4 _ E9, 0000016E

?_024:  mov     edx, dword [ebp-4H]                     ; 0FA9 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 0FAC _ 8B. 45, 18
        add     eax, edx                                ; 0FAF _ 01. D0
        movzx   eax, byte [eax]                         ; 0FB1 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0FB4 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0FB7 _ 0F B6. 45, FB
        test    al, al                                  ; 0FBB _ 84. C0
        jns     ?_025                                   ; 0FBD _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0FBF _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0FC2 _ 8B. 55, 14
        add     eax, edx                                ; 0FC5 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FC7 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FCB _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FCD _ 8B. 45, 10
        add     eax, edx                                ; 0FD0 _ 01. D0
        mov     edx, eax                                ; 0FD2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FD4 _ 8B. 45, 08
        add     edx, eax                                ; 0FD7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0FD9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0FDD _ 88. 02
?_025:  movzx   eax, byte [ebp-5H]                      ; 0FDF _ 0F B6. 45, FB
        and     eax, 40H                                ; 0FE3 _ 83. E0, 40
        test    eax, eax                                ; 0FE6 _ 85. C0
        jz      ?_026                                   ; 0FE8 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0FEA _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0FED _ 8B. 55, 14
        add     eax, edx                                ; 0FF0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FF2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FF6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FF8 _ 8B. 45, 10
        add     eax, edx                                ; 0FFB _ 01. D0
        lea     edx, [eax+1H]                           ; 0FFD _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1000 _ 8B. 45, 08
        add     edx, eax                                ; 1003 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1005 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1009 _ 88. 02
?_026:  movzx   eax, byte [ebp-5H]                      ; 100B _ 0F B6. 45, FB
        and     eax, 20H                                ; 100F _ 83. E0, 20
        test    eax, eax                                ; 1012 _ 85. C0
        jz      ?_027                                   ; 1014 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1016 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1019 _ 8B. 55, 14
        add     eax, edx                                ; 101C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 101E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1022 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1024 _ 8B. 45, 10
        add     eax, edx                                ; 1027 _ 01. D0
        lea     edx, [eax+2H]                           ; 1029 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 102C _ 8B. 45, 08
        add     edx, eax                                ; 102F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1031 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1035 _ 88. 02
?_027:  movzx   eax, byte [ebp-5H]                      ; 1037 _ 0F B6. 45, FB
        and     eax, 10H                                ; 103B _ 83. E0, 10
        test    eax, eax                                ; 103E _ 85. C0
        jz      ?_028                                   ; 1040 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1042 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1045 _ 8B. 55, 14
        add     eax, edx                                ; 1048 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 104A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 104E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1050 _ 8B. 45, 10
        add     eax, edx                                ; 1053 _ 01. D0
        lea     edx, [eax+3H]                           ; 1055 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 1058 _ 8B. 45, 08
        add     edx, eax                                ; 105B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 105D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1061 _ 88. 02
?_028:  movzx   eax, byte [ebp-5H]                      ; 1063 _ 0F B6. 45, FB
        and     eax, 08H                                ; 1067 _ 83. E0, 08
        test    eax, eax                                ; 106A _ 85. C0
        jz      ?_029                                   ; 106C _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 106E _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1071 _ 8B. 55, 14
        add     eax, edx                                ; 1074 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1076 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 107A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 107C _ 8B. 45, 10
        add     eax, edx                                ; 107F _ 01. D0
        lea     edx, [eax+4H]                           ; 1081 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1084 _ 8B. 45, 08
        add     edx, eax                                ; 1087 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1089 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 108D _ 88. 02
?_029:  movzx   eax, byte [ebp-5H]                      ; 108F _ 0F B6. 45, FB
        and     eax, 04H                                ; 1093 _ 83. E0, 04
        test    eax, eax                                ; 1096 _ 85. C0
        jz      ?_030                                   ; 1098 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 109A _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 109D _ 8B. 55, 14
        add     eax, edx                                ; 10A0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10A2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10A6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10A8 _ 8B. 45, 10
        add     eax, edx                                ; 10AB _ 01. D0
        lea     edx, [eax+5H]                           ; 10AD _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 10B0 _ 8B. 45, 08
        add     edx, eax                                ; 10B3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 10B5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 10B9 _ 88. 02
?_030:  movzx   eax, byte [ebp-5H]                      ; 10BB _ 0F B6. 45, FB
        and     eax, 02H                                ; 10BF _ 83. E0, 02
        test    eax, eax                                ; 10C2 _ 85. C0
        jz      ?_031                                   ; 10C4 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 10C6 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 10C9 _ 8B. 55, 14
        add     eax, edx                                ; 10CC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10CE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10D2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10D4 _ 8B. 45, 10
        add     eax, edx                                ; 10D7 _ 01. D0
        lea     edx, [eax+6H]                           ; 10D9 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 10DC _ 8B. 45, 08
        add     edx, eax                                ; 10DF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 10E1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 10E5 _ 88. 02
?_031:  movzx   eax, byte [ebp-5H]                      ; 10E7 _ 0F B6. 45, FB
        and     eax, 01H                                ; 10EB _ 83. E0, 01
        test    eax, eax                                ; 10EE _ 85. C0
        jz      ?_032                                   ; 10F0 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 10F2 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 10F5 _ 8B. 55, 14
        add     eax, edx                                ; 10F8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10FA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10FE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1100 _ 8B. 45, 10
        add     eax, edx                                ; 1103 _ 01. D0
        lea     edx, [eax+7H]                           ; 1105 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 1108 _ 8B. 45, 08
        add     edx, eax                                ; 110B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 110D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1111 _ 88. 02
?_032:  add     dword [ebp-4H], 1                       ; 1113 _ 83. 45, FC, 01
?_033:  cmp     dword [ebp-4H], 15                      ; 1117 _ 83. 7D, FC, 0F
        jle     ?_024                                   ; 111B _ 0F 8E, FFFFFE88
        leave                                           ; 1121 _ C9
        ret                                             ; 1122 _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 1123 _ 55
        mov     ebp, esp                                ; 1124 _ 89. E5
        push    ebx                                     ; 1126 _ 53
        sub     esp, 52                                 ; 1127 _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 112A _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 112D _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 1130 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 1133 _ 89. 45, F4
        jmp     ?_035                                   ; 1136 _ EB, 4B

?_034:  movsx   ecx, byte [ebp-1CH]                     ; 1138 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 113C _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 113F _ 0F B6. 00
        movsx   eax, al                                 ; 1142 _ 0F BE. C0
        shl     eax, 4                                  ; 1145 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 1148 _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 114E _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 1151 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1154 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1157 _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 1159 _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 115D _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 1161 _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 1164 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 1168 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 116B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 116F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1173 _ 89. 04 24
        call    paint_font                              ; 1176 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 117B _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 117F _ 83. 45, 18, 01
?_035:  mov     eax, dword [ebp+18H]                    ; 1183 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 1186 _ 0F B6. 00
        test    al, al                                  ; 1189 _ 84. C0
        jnz     ?_034                                   ; 118B _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 118D _ 8B. 45, 14
        add     eax, 16                                 ; 1190 _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 1193 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 1197 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 119A _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 119E _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 11A1 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 11A5 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 11A8 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 11AC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 11AF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 11B3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 11B6 _ 89. 04 24
        call    sheet_refresh                           ; 11B9 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 11BE _ 83. C4, 34
        pop     ebx                                     ; 11C1 _ 5B
        pop     ebp                                     ; 11C2 _ 5D
        ret                                             ; 11C3 _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 11C4 _ 55
        mov     ebp, esp                                ; 11C5 _ 89. E5
        sub     esp, 20                                 ; 11C7 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 11CA _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 11CD _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 11D0 _ C7. 45, FC, 00000000
        jmp     ?_042                                   ; 11D7 _ E9, 0000009C

?_036:  mov     dword [ebp-8H], 0                       ; 11DC _ C7. 45, F8, 00000000
        jmp     ?_041                                   ; 11E3 _ E9, 00000082

?_037:  mov     eax, dword [ebp-4H]                     ; 11E8 _ 8B. 45, FC
        shl     eax, 4                                  ; 11EB _ C1. E0, 04
        mov     edx, eax                                ; 11EE _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 11F0 _ 8B. 45, F8
        add     eax, edx                                ; 11F3 _ 01. D0
        add     eax, cursor.1880                        ; 11F5 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 11FA _ 0F B6. 00
        cmp     al, 42                                  ; 11FD _ 3C, 2A
        jnz     ?_038                                   ; 11FF _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 1201 _ 8B. 45, FC
        shl     eax, 4                                  ; 1204 _ C1. E0, 04
        mov     edx, eax                                ; 1207 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1209 _ 8B. 45, F8
        add     eax, edx                                ; 120C _ 01. D0
        mov     edx, eax                                ; 120E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1210 _ 8B. 45, 08
        add     eax, edx                                ; 1213 _ 01. D0
        mov     byte [eax], 0                           ; 1215 _ C6. 00, 00
        jmp     ?_040                                   ; 1218 _ EB, 4C

?_038:  mov     eax, dword [ebp-4H]                     ; 121A _ 8B. 45, FC
        shl     eax, 4                                  ; 121D _ C1. E0, 04
        mov     edx, eax                                ; 1220 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1222 _ 8B. 45, F8
        add     eax, edx                                ; 1225 _ 01. D0
        add     eax, cursor.1880                        ; 1227 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 122C _ 0F B6. 00
        cmp     al, 79                                  ; 122F _ 3C, 4F
        jnz     ?_039                                   ; 1231 _ 75, 19
        mov     eax, dword [ebp-4H]                     ; 1233 _ 8B. 45, FC
        shl     eax, 4                                  ; 1236 _ C1. E0, 04
        mov     edx, eax                                ; 1239 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 123B _ 8B. 45, F8
        add     eax, edx                                ; 123E _ 01. D0
        mov     edx, eax                                ; 1240 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1242 _ 8B. 45, 08
        add     eax, edx                                ; 1245 _ 01. D0
        mov     byte [eax], 7                           ; 1247 _ C6. 00, 07
        jmp     ?_040                                   ; 124A _ EB, 1A

?_039:  mov     eax, dword [ebp-4H]                     ; 124C _ 8B. 45, FC
        shl     eax, 4                                  ; 124F _ C1. E0, 04
        mov     edx, eax                                ; 1252 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 1254 _ 8B. 45, F8
        add     eax, edx                                ; 1257 _ 01. D0
        mov     edx, eax                                ; 1259 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 125B _ 8B. 45, 08
        add     edx, eax                                ; 125E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1260 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1264 _ 88. 02
?_040:  add     dword [ebp-8H], 1                       ; 1266 _ 83. 45, F8, 01
?_041:  cmp     dword [ebp-8H], 15                      ; 126A _ 83. 7D, F8, 0F
        jle     ?_037                                   ; 126E _ 0F 8E, FFFFFF74
        add     dword [ebp-4H], 1                       ; 1274 _ 83. 45, FC, 01
?_042:  cmp     dword [ebp-4H], 15                      ; 1278 _ 83. 7D, FC, 0F
        jle     ?_036                                   ; 127C _ 0F 8E, FFFFFF5A
        leave                                           ; 1282 _ C9
        ret                                             ; 1283 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 1284 _ 55
        mov     ebp, esp                                ; 1285 _ 89. E5
        sub     esp, 16                                 ; 1287 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 128A _ C7. 45, FC, 00000000
        jmp     ?_046                                   ; 1291 _ EB, 50

?_043:  mov     dword [ebp-8H], 0                       ; 1293 _ C7. 45, F8, 00000000
        jmp     ?_045                                   ; 129A _ EB, 3B

?_044:  mov     eax, dword [ebp-4H]                     ; 129C _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 129F _ 8B. 55, 14
        add     eax, edx                                ; 12A2 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 12A4 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-8H]                     ; 12A8 _ 8B. 55, F8
        mov     ecx, dword [ebp+10H]                    ; 12AB _ 8B. 4D, 10
        add     edx, ecx                                ; 12AE _ 01. CA
        add     eax, edx                                ; 12B0 _ 01. D0
        mov     edx, eax                                ; 12B2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 12B4 _ 8B. 45, 08
        add     edx, eax                                ; 12B7 _ 01. C2
        mov     eax, dword [ebp-4H]                     ; 12B9 _ 8B. 45, FC
        imul    eax, dword [ebp+18H]                    ; 12BC _ 0F AF. 45, 18
        mov     ecx, eax                                ; 12C0 _ 89. C1
        mov     eax, dword [ebp-8H]                     ; 12C2 _ 8B. 45, F8
        add     eax, ecx                                ; 12C5 _ 01. C8
        mov     ecx, eax                                ; 12C7 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 12C9 _ 8B. 45, 20
        add     eax, ecx                                ; 12CC _ 01. C8
        movzx   eax, byte [eax]                         ; 12CE _ 0F B6. 00
        mov     byte [edx], al                          ; 12D1 _ 88. 02
        add     dword [ebp-8H], 1                       ; 12D3 _ 83. 45, F8, 01
?_045:  mov     eax, dword [ebp-8H]                     ; 12D7 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 12DA _ 3B. 45, 18
        jl      ?_044                                   ; 12DD _ 7C, BD
        add     dword [ebp-4H], 1                       ; 12DF _ 83. 45, FC, 01
?_046:  mov     eax, dword [ebp-4H]                     ; 12E3 _ 8B. 45, FC
        cmp     eax, dword [ebp+1CH]                    ; 12E6 _ 3B. 45, 1C
        jl      ?_043                                   ; 12E9 _ 7C, A8
        leave                                           ; 12EB _ C9
        ret                                             ; 12EC _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 12ED _ 55
        mov     ebp, esp                                ; 12EE _ 89. E5
        sub     esp, 24                                 ; 12F0 _ 83. EC, 18
        mov     dword [esp+0CH], 0                      ; 12F3 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 12FB _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 1303 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 130B _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 1312 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 1317 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], keybuf                  ; 131F _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 1327 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 132F _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 1336 _ E8, FFFFFFFC(rel)
        leave                                           ; 133B _ C9
        ret                                             ; 133C _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 133D _ 55
        mov     ebp, esp                                ; 133E _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 1340 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 1343 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 1346 _ A1, 000001C8(d)
        add     eax, edx                                ; 134B _ 01. D0
        mov     dword [mouse_x], eax                    ; 134D _ A3, 000001C8(d)
        mov     eax, dword [ebp+10H]                    ; 1352 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 1355 _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 1358 _ A1, 000001CC(d)
        add     eax, edx                                ; 135D _ 01. D0
        mov     dword [mouse_y], eax                    ; 135F _ A3, 000001CC(d)
        mov     eax, dword [mouse_x]                    ; 1364 _ A1, 000001C8(d)
        test    eax, eax                                ; 1369 _ 85. C0
        jns     ?_047                                   ; 136B _ 79, 0A
        mov     dword [mouse_x], 0                      ; 136D _ C7. 05, 000001C8(d), 00000000
?_047:  mov     eax, dword [mouse_y]                    ; 1377 _ A1, 000001CC(d)
        test    eax, eax                                ; 137C _ 85. C0
        jns     ?_048                                   ; 137E _ 79, 0A
        mov     dword [mouse_y], 0                      ; 1380 _ C7. 05, 000001CC(d), 00000000
?_048:  movzx   eax, word [?_326]                       ; 138A _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 1391 _ 98
        lea     edx, [eax-10H]                          ; 1392 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 1395 _ A1, 000001C8(d)
        cmp     edx, eax                                ; 139A _ 39. C2
        jge     ?_049                                   ; 139C _ 7D, 10
        movzx   eax, word [?_326]                       ; 139E _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 13A5 _ 98
        sub     eax, 16                                 ; 13A6 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 13A9 _ A3, 000001C8(d)
?_049:  movzx   eax, word [?_326]                       ; 13AE _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 13B5 _ 98
        lea     edx, [eax-10H]                          ; 13B6 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 13B9 _ A1, 000001CC(d)
        cmp     edx, eax                                ; 13BE _ 39. C2
        jge     ?_050                                   ; 13C0 _ 7D, 10
        movzx   eax, word [?_326]                       ; 13C2 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 13C9 _ 98
        sub     eax, 16                                 ; 13CA _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 13CD _ A3, 000001CC(d)
?_050:  pop     ebp                                     ; 13D2 _ 5D
        ret                                             ; 13D3 _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 13D4 _ 55
        mov     ebp, esp                                ; 13D5 _ 89. E5
        sub     esp, 40                                 ; 13D7 _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 13DA _ C6. 45, F7, 00
        call    io_sti                                  ; 13DE _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 13E3 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 13EA _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 13EF _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 13F2 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 13F6 _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 13FA _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 1401 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1406 _ 85. C0
        jz      ?_051                                   ; 1408 _ 74, 77
        mov     dword [esp+8H], mouse_send_info         ; 140A _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 1412 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1415 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1419 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 141C _ 89. 04 24
        call    compute_mouse_position                  ; 141F _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 1424 _ 8B. 15, 000001CC(d)
        mov     eax, dword [mouse_x]                    ; 142A _ A1, 000001C8(d)
        mov     dword [esp+0CH], edx                    ; 142F _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 1433 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 1437 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 143A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 143E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1441 _ 89. 04 24
        call    sheet_slide                             ; 1444 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_send_info+0CH]        ; 1449 _ A1, 0000000C(d)
        and     eax, 01H                                ; 144E _ 83. E0, 01
        test    eax, eax                                ; 1451 _ 85. C0
        jz      ?_051                                   ; 1453 _ 74, 2C
        mov     eax, dword [mouse_y]                    ; 1455 _ A1, 000001CC(d)
        lea     ecx, [eax-8H]                           ; 145A _ 8D. 48, F8
        mov     eax, dword [mouse_x]                    ; 145D _ A1, 000001C8(d)
        lea     edx, [eax-50H]                          ; 1462 _ 8D. 50, B0
        mov     eax, dword [sheet_win]                  ; 1465 _ A1, 000001C4(d)
        mov     dword [esp+0CH], ecx                    ; 146A _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 146E _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1472 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1476 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1479 _ 89. 04 24
        call    sheet_slide                             ; 147C _ E8, FFFFFFFC(rel)
?_051:  leave                                           ; 1481 _ C9
        ret                                             ; 1482 _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 1483 _ 55
        mov     ebp, esp                                ; 1484 _ 89. E5
        sub     esp, 88                                 ; 1486 _ 83. EC, 58
        mov     dword [ebp-0CH], 0                      ; 1489 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 1490 _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 104                    ; 1497 _ C7. 45, EC, 00000068
        mov     eax, dword [screen_info]                ; 149E _ A1, 000000A0(d)
        mov     dword [ebp-18H], eax                    ; 14A3 _ 89. 45, E8
        movzx   eax, word [?_326]                       ; 14A6 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 14AD _ 98
        mov     dword [ebp-1CH], eax                    ; 14AE _ 89. 45, E4
        movzx   eax, word [?_327]                       ; 14B1 _ 0F B7. 05, 000000A6(d)
        cwde                                            ; 14B8 _ 98
        mov     dword [ebp-20H], eax                    ; 14B9 _ 89. 45, E0
        mov     eax, dword [ebp+0CH]                    ; 14BC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 14BF _ 8B. 00
        mov     edx, dword [ebp-20H]                    ; 14C1 _ 8B. 55, E0
        mov     dword [esp+8H], edx                     ; 14C4 _ 89. 54 24, 08
        mov     edx, dword [ebp-1CH]                    ; 14C8 _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 14CB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 14CF _ 89. 04 24
        call    init_desktop                            ; 14D2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 14D7 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_308                  ; 14DF _ C7. 44 24, 10, 0000001E(d)
        mov     eax, dword [ebp-10H]                    ; 14E7 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 14EA _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 14EE _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 14F1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14F5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14F8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14FC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14FF _ 89. 04 24
        call    paint_string                            ; 1502 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 1507 _ 8B. 45, 14
        mov     dword [esp], eax                        ; 150A _ 89. 04 24
        call    intToHexStr                             ; 150D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 1512 _ 89. 45, DC
        mov     dword [esp+14H], 7                      ; 1515 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-24H]                    ; 151D _ 8B. 45, DC
        mov     dword [esp+10H], eax                    ; 1520 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 1524 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 1527 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 152B _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 152E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1532 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1535 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1539 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 153C _ 89. 04 24
        call    paint_string                            ; 153F _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 1544 _ 83. 45, F0, 10
        mov     dword [esp+14H], 7                      ; 1548 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_309                  ; 1550 _ C7. 44 24, 10, 00000028(d)
        mov     eax, dword [ebp-10H]                    ; 1558 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 155B _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 155F _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 1562 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1566 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1569 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 156D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1570 _ 89. 04 24
        call    paint_string                            ; 1573 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1578 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 157B _ 8B. 00
        mov     dword [esp], eax                        ; 157D _ 89. 04 24
        call    intToHexStr                             ; 1580 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 1585 _ 89. 45, D8
        mov     dword [esp+14H], 7                      ; 1588 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-28H]                    ; 1590 _ 8B. 45, D8
        mov     dword [esp+10H], eax                    ; 1593 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 1597 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 159A _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 159E _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 15A1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15A5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 15A8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 15AC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 15AF _ 89. 04 24
        call    paint_string                            ; 15B2 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 15B7 _ 83. 45, F0, 10
        mov     dword [esp+14H], 7                      ; 15BB _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_310                  ; 15C3 _ C7. 44 24, 10, 00000034(d)
        mov     eax, dword [ebp-10H]                    ; 15CB _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 15CE _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 15D2 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 15D5 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15D9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 15DC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 15E0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 15E3 _ 89. 04 24
        call    paint_string                            ; 15E6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 15EB _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 15EE _ 8B. 40, 04
        mov     dword [esp], eax                        ; 15F1 _ 89. 04 24
        call    intToHexStr                             ; 15F4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 15F9 _ 89. 45, D4
        mov     dword [esp+14H], 7                      ; 15FC _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-2CH]                    ; 1604 _ 8B. 45, D4
        mov     dword [esp+10H], eax                    ; 1607 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 160B _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 160E _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 1612 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 1615 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1619 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 161C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1620 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1623 _ 89. 04 24
        call    paint_string                            ; 1626 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 162B _ 83. 45, F0, 10
        mov     dword [esp+14H], 7                      ; 162F _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_311                  ; 1637 _ C7. 44 24, 10, 00000040(d)
        mov     eax, dword [ebp-10H]                    ; 163F _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 1642 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 1646 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 1649 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 164D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1650 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1654 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1657 _ 89. 04 24
        call    paint_string                            ; 165A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 165F _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 1662 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 1665 _ 89. 04 24
        call    intToHexStr                             ; 1668 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 166D _ 89. 45, D0
        mov     dword [esp+14H], 7                      ; 1670 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-30H]                    ; 1678 _ 8B. 45, D0
        mov     dword [esp+10H], eax                    ; 167B _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 167F _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 1682 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 1686 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 1689 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 168D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1690 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1694 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1697 _ 89. 04 24
        call    paint_string                            ; 169A _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 169F _ 83. 45, F0, 10
        mov     dword [esp+14H], 7                      ; 16A3 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_312                  ; 16AB _ C7. 44 24, 10, 0000004C(d)
        mov     eax, dword [ebp-10H]                    ; 16B3 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 16B6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 16BA _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 16BD _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 16C1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 16C4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16C8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16CB _ 89. 04 24
        call    paint_string                            ; 16CE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 16D3 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 16D6 _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 16D9 _ 89. 04 24
        call    intToHexStr                             ; 16DC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 16E1 _ 89. 45, CC
        mov     dword [esp+14H], 7                      ; 16E4 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-34H]                    ; 16EC _ 8B. 45, CC
        mov     dword [esp+10H], eax                    ; 16EF _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 16F3 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 16F6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 16FA _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 16FD _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1701 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1704 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1708 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 170B _ 89. 04 24
        call    paint_string                            ; 170E _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 1713 _ 83. 45, F0, 10
        mov     dword [esp+14H], 7                      ; 1717 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_313                  ; 171F _ C7. 44 24, 10, 00000059(d)
        mov     eax, dword [ebp-10H]                    ; 1727 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 172A _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 172E _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 1731 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1735 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1738 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 173C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 173F _ 89. 04 24
        call    paint_string                            ; 1742 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1747 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 174A _ 8B. 40, 10
        mov     dword [esp], eax                        ; 174D _ 89. 04 24
        call    intToHexStr                             ; 1750 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 1755 _ 89. 45, C8
        mov     dword [esp+14H], 7                      ; 1758 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-38H]                    ; 1760 _ 8B. 45, C8
        mov     dword [esp+10H], eax                    ; 1763 _ 89. 44 24, 10
        mov     eax, dword [ebp-10H]                    ; 1767 _ 8B. 45, F0
        mov     dword [esp+0CH], eax                    ; 176A _ 89. 44 24, 0C
        mov     eax, dword [ebp-14H]                    ; 176E _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 1771 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1775 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1778 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 177C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 177F _ 89. 04 24
        call    paint_string                            ; 1782 _ E8, FFFFFFFC(rel)
        add     dword [ebp-10H], 16                     ; 1787 _ 83. 45, F0, 10
        leave                                           ; 178B _ C9
        ret                                             ; 178C _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 178D _ 55
        mov     ebp, esp                                ; 178E _ 89. E5
        sub     esp, 56                                 ; 1790 _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 1793 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1796 _ 89. 04 24
        call    sheet_alloc                             ; 1799 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 179E _ 89. 45, F4
        mov     eax, dword [memman]                     ; 17A1 _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 17A6 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 17AE _ 89. 04 24
        call    memman_alloc_4k                         ; 17B1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 17B6 _ 89. 45, F0
        mov     dword [esp+10H], 99                     ; 17B9 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 17C1 _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 17C9 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-10H]                    ; 17D1 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 17D4 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 17D8 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 17DB _ 89. 04 24
        call    sheet_setbuf                            ; 17DE _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 17E3 _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 17EB _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 17EE _ 89. 44 24, 08
        mov     eax, dword [ebp-0CH]                    ; 17F2 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 17F5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 17F9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17FC _ 89. 04 24
        call    make_windows                            ; 17FF _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1804 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 180C _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 1814 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 181C _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 1824 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 182C _ 8B. 45, F4
        mov     dword [esp], eax                        ; 182F _ 89. 04 24
        call    make_textbox                            ; 1832 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 1837 _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 183F _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-0CH]                    ; 1847 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 184A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 184E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1851 _ 89. 04 24
        call    sheet_slide                             ; 1854 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 1859 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-0CH]                    ; 1861 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 1864 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1868 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 186B _ 89. 04 24
        call    sheet_updown                            ; 186E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1873 _ 8B. 45, F4
        leave                                           ; 1876 _ C9
        ret                                             ; 1877 _ C3
; message_box End of function

make_textbox:; Function begin
        push    ebp                                     ; 1878 _ 55
        mov     ebp, esp                                ; 1879 _ 89. E5
        push    edi                                     ; 187B _ 57
        push    esi                                     ; 187C _ 56
        push    ebx                                     ; 187D _ 53
        sub     esp, 44                                 ; 187E _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 1881 _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 1884 _ 8B. 55, 0C
        add     eax, edx                                ; 1887 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1889 _ 89. 45, F0
        mov     eax, dword [ebp+18H]                    ; 188C _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 188F _ 8B. 55, 10
        add     eax, edx                                ; 1892 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1894 _ 89. 45, EC
        mov     eax, dword [ebp+10H]                    ; 1897 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 189A _ 8D. 78, FD
        mov     eax, dword [ebp-10H]                    ; 189D _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 18A0 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 18A3 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 18A6 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 18A9 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 18AC _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 18AF _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 18B2 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18B5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18B8 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 18BA _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 18BE _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 18C2 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 18C6 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 18CA _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 18D2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18D6 _ 89. 04 24
        call    paint_rectangle                         ; 18D9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 18DE _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 18E1 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 18E4 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 18E7 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 18EA _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 18ED _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 18F0 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 18F3 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 18F6 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 18F9 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18FC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18FF _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1901 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1905 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1909 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 190D _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 1911 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 1919 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 191D _ 89. 04 24
        call    paint_rectangle                         ; 1920 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 1925 _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 1928 _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 192B _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 192E _ 8D. 70, 01
        mov     eax, dword [ebp-14H]                    ; 1931 _ 8B. 45, EC
        lea     ebx, [eax+2H]                           ; 1934 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 1937 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 193A _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 193D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1940 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1943 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1946 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1948 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 194C _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1950 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1954 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 1958 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 1960 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1964 _ 89. 04 24
        call    paint_rectangle                         ; 1967 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 196C _ 8B. 45, EC
        lea     edi, [eax+2H]                           ; 196F _ 8D. 78, 02
        mov     eax, dword [ebp-10H]                    ; 1972 _ 8B. 45, F0
        lea     esi, [eax+2H]                           ; 1975 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1978 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 197B _ 8D. 58, FD
        mov     eax, dword [ebp-10H]                    ; 197E _ 8B. 45, F0
        lea     ecx, [eax+2H]                           ; 1981 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1984 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1987 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 198A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 198D _ 8B. 00
        mov     dword [esp+18H], edi                    ; 198F _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1993 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1997 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 199B _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 199F _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 19A7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19AB _ 89. 04 24
        call    paint_rectangle                         ; 19AE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 19B3 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 19B6 _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 19B9 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 19BC _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 19BF _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 19C2 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 19C5 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 19C8 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19CB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19CE _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 19D0 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 19D4 _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 19D7 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 19DB _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 19DF _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 19E3 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 19EB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19EF _ 89. 04 24
        call    paint_rectangle                         ; 19F2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 19F7 _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 19FA _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 19FD _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1A00 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 1A03 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 1A06 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 1A09 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A0C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A0F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A12 _ 8B. 00
        mov     ecx, dword [ebp-14H]                    ; 1A14 _ 8B. 4D, EC
        mov     dword [esp+18H], ecx                    ; 1A17 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 1A1B _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 1A1F _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1A23 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 1A27 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1A2F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A33 _ 89. 04 24
        call    paint_rectangle                         ; 1A36 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 1A3B _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 1A3E _ 8D. 48, 01
        mov     eax, dword [ebp-14H]                    ; 1A41 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1A44 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1A47 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 1A4A _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 1A4D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A50 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A53 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A56 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1A58 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-10H]                    ; 1A5C _ 8B. 4D, F0
        mov     dword [esp+14H], ecx                    ; 1A5F _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1A63 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1A67 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 1A6B _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1A73 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A77 _ 89. 04 24
        call    paint_rectangle                         ; 1A7A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 1A7F _ 8B. 45, EC
        lea     edi, [eax+1H]                           ; 1A82 _ 8D. 78, 01
        mov     eax, dword [ebp-10H]                    ; 1A85 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1A88 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1A8B _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1A8E _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1A91 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1A94 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1A97 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A9A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A9D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AA0 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1AA2 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1AA6 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1AAA _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1AAE _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 1AB2 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1ABA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1ABE _ 89. 04 24
        call    paint_rectangle                         ; 1AC1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1AC6 _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 1AC9 _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 1ACC _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 1ACF _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 1AD2 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1AD5 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1AD8 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1ADB _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1ADE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AE1 _ 8B. 00
        mov     ebx, dword [ebp-14H]                    ; 1AE3 _ 8B. 5D, EC
        mov     dword [esp+18H], ebx                    ; 1AE6 _ 89. 5C 24, 18
        mov     ebx, dword [ebp-10H]                    ; 1AEA _ 8B. 5D, F0
        mov     dword [esp+14H], ebx                    ; 1AED _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 1AF1 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 1AF5 _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 1AF9 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1AFD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B01 _ 89. 04 24
        call    paint_rectangle                         ; 1B04 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 1B09 _ 83. C4, 2C
        pop     ebx                                     ; 1B0C _ 5B
        pop     esi                                     ; 1B0D _ 5E
        pop     edi                                     ; 1B0E _ 5F
        pop     ebp                                     ; 1B0F _ 5D
        ret                                             ; 1B10 _ C3
; make_textbox End of function

make_windows:; Function begin
        push    ebp                                     ; 1B11 _ 55
        mov     ebp, esp                                ; 1B12 _ 89. E5
        push    ebx                                     ; 1B14 _ 53
        sub     esp, 52                                 ; 1B15 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 1B18 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1B1B _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 1B1E _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1B21 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 1B24 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 1B27 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1B2A _ 8B. 40, 08
        mov     dword [ebp-10H], eax                    ; 1B2D _ 89. 45, F0
        mov     eax, dword [ebp-0CH]                    ; 1B30 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1B33 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1B36 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B39 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 1B3B _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 1B43 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 1B47 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1B4F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1B57 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 1B5F _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1B62 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B66 _ 89. 04 24
        call    paint_rectangle                         ; 1B69 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1B6E _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1B71 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1B74 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B77 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 1B79 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 1B81 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 1B85 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1B8D _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1B95 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 1B9D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1BA0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BA4 _ 89. 04 24
        call    paint_rectangle                         ; 1BA7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1BAC _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1BAF _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1BB2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BB5 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1BB7 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 1BBB _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 1BC3 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1BCB _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1BD3 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 1BDB _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1BDE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BE2 _ 89. 04 24
        call    paint_rectangle                         ; 1BE5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1BEA _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1BED _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1BF0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BF3 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1BF5 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 1BF9 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 1C01 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1C09 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1C11 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-0CH]                    ; 1C19 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1C1C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C20 _ 89. 04 24
        call    paint_rectangle                         ; 1C23 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1C28 _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 1C2B _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 1C2E _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 1C31 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1C34 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1C37 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1C3A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C3D _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1C3F _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1C43 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 1C47 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 1C4F _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 1C53 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 1C5B _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1C5E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C62 _ 89. 04 24
        call    paint_rectangle                         ; 1C65 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1C6A _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 1C6D _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1C70 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1C73 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1C76 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1C79 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1C7C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C7F _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1C81 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1C85 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 1C89 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 1C91 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 1C95 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 1C9D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1CA0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CA4 _ 89. 04 24
        call    paint_rectangle                         ; 1CA7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1CAC _ 8B. 45, F0
        lea     ecx, [eax-3H]                           ; 1CAF _ 8D. 48, FD
        mov     eax, dword [ebp-0CH]                    ; 1CB2 _ 8B. 45, F4
        lea     edx, [eax-3H]                           ; 1CB5 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1CB8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CBB _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1CBD _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1CC1 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 1CC5 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 1CCD _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 1CD5 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0CH]                    ; 1CDD _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1CE0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CE4 _ 89. 04 24
        call    paint_rectangle                         ; 1CE7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1CEC _ 8B. 45, F4
        lea     edx, [eax-4H]                           ; 1CEF _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1CF2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CF5 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1CF7 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1CFF _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 1D03 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1D0B _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 1D13 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-0CH]                    ; 1D1B _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1D1E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D22 _ 89. 04 24
        call    paint_rectangle                         ; 1D25 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1D2A _ 8B. 45, F0
        lea     ebx, [eax-2H]                           ; 1D2D _ 8D. 58, FE
        mov     eax, dword [ebp-0CH]                    ; 1D30 _ 8B. 45, F4
        lea     ecx, [eax-2H]                           ; 1D33 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1D36 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1D39 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1D3C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D3F _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1D41 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1D45 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1D49 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 1D4D _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 1D55 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-0CH]                    ; 1D5D _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1D60 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D64 _ 89. 04 24
        call    paint_rectangle                         ; 1D67 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1D6C _ 8B. 45, F0
        lea     ebx, [eax-1H]                           ; 1D6F _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1D72 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1D75 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1D78 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1D7B _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1D7E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D81 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1D83 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1D87 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1D8B _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 1D8F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 1D97 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-0CH]                    ; 1D9F _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 1DA2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1DA6 _ 89. 04 24
        call    paint_rectangle                         ; 1DA9 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-1CH]                     ; 1DAE _ 0F BE. 45, E4
        mov     dword [esp+0CH], eax                    ; 1DB2 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 1DB6 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 1DB9 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1DBD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1DC0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1DC4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1DC7 _ 89. 04 24
        call    make_window_title                       ; 1DCA _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 1DCF _ 83. C4, 34
        pop     ebx                                     ; 1DD2 _ 5B
        pop     ebp                                     ; 1DD3 _ 5D
        ret                                             ; 1DD4 _ C3
; make_windows End of function

make_window_title:; Function begin
        push    ebp                                     ; 1DD5 _ 55
        mov     ebp, esp                                ; 1DD6 _ 89. E5
        push    ebx                                     ; 1DD8 _ 53
        sub     esp, 52                                 ; 1DD9 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 1DDC _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1DDF _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 1DE2 _ 80. 7D, E4, 00
        jz      ?_052                                   ; 1DE6 _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 1DE8 _ C6. 45, EE, 07
        mov     byte [ebp-13H], 12                      ; 1DEC _ C6. 45, ED, 0C
        jmp     ?_053                                   ; 1DF0 _ EB, 08

?_052:  mov     byte [ebp-12H], 8                       ; 1DF2 _ C6. 45, EE, 08
        mov     byte [ebp-13H], 15                      ; 1DF6 _ C6. 45, ED, 0F
?_053:  mov     eax, dword [ebp+0CH]                    ; 1DFA _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1DFD _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 1E00 _ 8D. 58, FC
        movzx   eax, byte [ebp-13H]                     ; 1E03 _ 0F B6. 45, ED
        movzx   ecx, al                                 ; 1E07 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 1E0A _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 1E0D _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1E10 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1E13 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1E15 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], ebx                    ; 1E1D _ 89. 5C 24, 14
        mov     dword [esp+10H], 3                      ; 1E21 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1E29 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], ecx                     ; 1E31 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1E35 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E39 _ 89. 04 24
        call    paint_rectangle                         ; 1E3C _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-12H]                     ; 1E41 _ 0F BE. 45, EE
        mov     dword [esp+14H], eax                    ; 1E45 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 1E49 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1E4C _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 1E50 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 1E58 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 1E60 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1E63 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1E67 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1E6A _ 89. 04 24
        call    paint_string                            ; 1E6D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 0                      ; 1E72 _ C7. 45, F0, 00000000
        jmp     ?_061                                   ; 1E79 _ E9, 00000083

?_054:  mov     dword [ebp-0CH], 0                      ; 1E7E _ C7. 45, F4, 00000000
        jmp     ?_060                                   ; 1E85 _ EB, 70

?_055:  mov     eax, dword [ebp-10H]                    ; 1E87 _ 8B. 45, F0
        shl     eax, 4                                  ; 1E8A _ C1. E0, 04
        mov     edx, eax                                ; 1E8D _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 1E8F _ 8B. 45, F4
        add     eax, edx                                ; 1E92 _ 01. D0
        add     eax, closebtn.1967                      ; 1E94 _ 05, 00000260(d)
        movzx   eax, byte [eax]                         ; 1E99 _ 0F B6. 00
        mov     byte [ebp-11H], al                      ; 1E9C _ 88. 45, EF
        cmp     byte [ebp-11H], 64                      ; 1E9F _ 80. 7D, EF, 40
        jnz     ?_056                                   ; 1EA3 _ 75, 06
        mov     byte [ebp-11H], 0                       ; 1EA5 _ C6. 45, EF, 00
        jmp     ?_059                                   ; 1EA9 _ EB, 1C

?_056:  cmp     byte [ebp-11H], 36                      ; 1EAB _ 80. 7D, EF, 24
        jnz     ?_057                                   ; 1EAF _ 75, 06
        mov     byte [ebp-11H], 15                      ; 1EB1 _ C6. 45, EF, 0F
        jmp     ?_059                                   ; 1EB5 _ EB, 10

?_057:  cmp     byte [ebp-11H], 81                      ; 1EB7 _ 80. 7D, EF, 51
        jnz     ?_058                                   ; 1EBB _ 75, 06
        mov     byte [ebp-11H], 8                       ; 1EBD _ C6. 45, EF, 08
        jmp     ?_059                                   ; 1EC1 _ EB, 04

?_058:  mov     byte [ebp-11H], 7                       ; 1EC3 _ C6. 45, EF, 07
?_059:  mov     eax, dword [ebp+0CH]                    ; 1EC7 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1ECA _ 8B. 10
        mov     eax, dword [ebp-10H]                    ; 1ECC _ 8B. 45, F0
        lea     ecx, [eax+5H]                           ; 1ECF _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1ED2 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1ED5 _ 8B. 40, 04
        imul    ecx, eax                                ; 1ED8 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1EDB _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1EDE _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1EE1 _ 8D. 58, EB
        mov     eax, dword [ebp-0CH]                    ; 1EE4 _ 8B. 45, F4
        add     eax, ebx                                ; 1EE7 _ 01. D8
        add     eax, ecx                                ; 1EE9 _ 01. C8
        add     edx, eax                                ; 1EEB _ 01. C2
        movzx   eax, byte [ebp-11H]                     ; 1EED _ 0F B6. 45, EF
        mov     byte [edx], al                          ; 1EF1 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 1EF3 _ 83. 45, F4, 01
?_060:  cmp     dword [ebp-0CH], 15                     ; 1EF7 _ 83. 7D, F4, 0F
        jle     ?_055                                   ; 1EFB _ 7E, 8A
        add     dword [ebp-10H], 1                      ; 1EFD _ 83. 45, F0, 01
?_061:  cmp     dword [ebp-10H], 13                     ; 1F01 _ 83. 7D, F0, 0D
        jle     ?_054                                   ; 1F05 _ 0F 8E, FFFFFF73
        add     esp, 52                                 ; 1F0B _ 83. C4, 34
        pop     ebx                                     ; 1F0E _ 5B
        pop     ebp                                     ; 1F0F _ 5D
        ret                                             ; 1F10 _ C3
; make_window_title End of function

transfer_scancode:; Function begin
        push    ebp                                     ; 1F11 _ 55
        mov     ebp, esp                                ; 1F12 _ 89. E5
        sub     esp, 16                                 ; 1F14 _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 1F17 _ 83. 7D, 08, 2A
        jnz     ?_062                                   ; 1F1B _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1F1D _ A1, 000001D0(d)
        or      eax, 01H                                ; 1F22 _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 1F25 _ A3, 000001D0(d)
?_062:  cmp     dword [ebp+8H], 54                      ; 1F2A _ 83. 7D, 08, 36
        jnz     ?_063                                   ; 1F2E _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1F30 _ A1, 000001D0(d)
        or      eax, 02H                                ; 1F35 _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 1F38 _ A3, 000001D0(d)
?_063:  cmp     dword [ebp+8H], 170                     ; 1F3D _ 81. 7D, 08, 000000AA
        jnz     ?_064                                   ; 1F44 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1F46 _ A1, 000001D0(d)
        and     eax, 0FFFFFFFEH                         ; 1F4B _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 1F4E _ A3, 000001D0(d)
?_064:  cmp     dword [ebp+8H], 182                     ; 1F53 _ 81. 7D, 08, 000000B6
        jnz     ?_065                                   ; 1F5A _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1F5C _ A1, 000001D0(d)
        and     eax, 0FFFFFFFDH                         ; 1F61 _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 1F64 _ A3, 000001D0(d)
?_065:  cmp     dword [ebp+8H], 58                      ; 1F69 _ 83. 7D, 08, 3A
        jnz     ?_067                                   ; 1F6D _ 75, 1F
        mov     eax, dword [caps_lock]                  ; 1F6F _ A1, 000001D4(d)
        test    eax, eax                                ; 1F74 _ 85. C0
        jnz     ?_066                                   ; 1F76 _ 75, 0C
        mov     dword [caps_lock], 1                    ; 1F78 _ C7. 05, 000001D4(d), 00000001
        jmp     ?_067                                   ; 1F82 _ EB, 0A

?_066:  mov     dword [caps_lock], 0                    ; 1F84 _ C7. 05, 000001D4(d), 00000000
?_067:  cmp     dword [ebp+8H], 42                      ; 1F8E _ 83. 7D, 08, 2A
        jz      ?_068                                   ; 1F92 _ 74, 24
        cmp     dword [ebp+8H], 54                      ; 1F94 _ 83. 7D, 08, 36
        jz      ?_068                                   ; 1F98 _ 74, 1E
        cmp     dword [ebp+8H], 170                     ; 1F9A _ 81. 7D, 08, 000000AA
        jz      ?_068                                   ; 1FA1 _ 74, 15
        cmp     dword [ebp+8H], 182                     ; 1FA3 _ 81. 7D, 08, 000000B6
        jz      ?_068                                   ; 1FAA _ 74, 0C
        cmp     dword [ebp+8H], 127                     ; 1FAC _ 83. 7D, 08, 7F
        jg      ?_068                                   ; 1FB0 _ 7F, 06
        cmp     dword [ebp+8H], 58                      ; 1FB2 _ 83. 7D, 08, 3A
        jnz     ?_069                                   ; 1FB6 _ 75, 0A
?_068:  mov     eax, 0                                  ; 1FB8 _ B8, 00000000
        jmp     ?_074                                   ; 1FBD _ E9, 00000089

?_069:  mov     byte [ebp-1H], 0                        ; 1FC2 _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 1FC6 _ A1, 000001D0(d)
        test    eax, eax                                ; 1FCB _ 85. C0
        jnz     ?_071                                   ; 1FCD _ 75, 46
        cmp     dword [ebp+8H], 127                     ; 1FCF _ 83. 7D, 08, 7F
        jg      ?_071                                   ; 1FD3 _ 7F, 40
        mov     eax, dword [ebp+8H]                     ; 1FD5 _ 8B. 45, 08
        add     eax, keytable                           ; 1FD8 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 1FDD _ 0F B6. 00
        test    al, al                                  ; 1FE0 _ 84. C0
        jz      ?_071                                   ; 1FE2 _ 74, 31
        mov     eax, dword [ebp+8H]                     ; 1FE4 _ 8B. 45, 08
        add     eax, keytable                           ; 1FE7 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 1FEC _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 1FEF _ 88. 45, FF
        cmp     byte [ebp-1H], 64                       ; 1FF2 _ 80. 7D, FF, 40
        jle     ?_070                                   ; 1FF6 _ 7E, 1B
        cmp     byte [ebp-1H], 90                       ; 1FF8 _ 80. 7D, FF, 5A
        jg      ?_070                                   ; 1FFC _ 7F, 15
        mov     eax, dword [caps_lock]                  ; 1FFE _ A1, 000001D4(d)
        test    eax, eax                                ; 2003 _ 85. C0
        jnz     ?_070                                   ; 2005 _ 75, 0C
        movzx   eax, byte [ebp-1H]                      ; 2007 _ 0F B6. 45, FF
        add     eax, 32                                 ; 200B _ 83. C0, 20
        mov     byte [ebp-1H], al                       ; 200E _ 88. 45, FF
        jmp     ?_073                                   ; 2011 _ EB, 34

?_070:  jmp     ?_073                                   ; 2013 _ EB, 32

?_071:  mov     eax, dword [key_shift]                  ; 2015 _ A1, 000001D0(d)
        test    eax, eax                                ; 201A _ 85. C0
        jz      ?_072                                   ; 201C _ 74, 25
        cmp     dword [ebp+8H], 83                      ; 201E _ 83. 7D, 08, 53
        jg      ?_072                                   ; 2022 _ 7F, 1F
        mov     eax, dword [ebp+8H]                     ; 2024 _ 8B. 45, 08
        add     eax, keytable_shift                     ; 2027 _ 05, 000000A0(d)
        movzx   eax, byte [eax]                         ; 202C _ 0F B6. 00
        test    al, al                                  ; 202F _ 84. C0
        jz      ?_072                                   ; 2031 _ 74, 10
        mov     eax, dword [ebp+8H]                     ; 2033 _ 8B. 45, 08
        add     eax, keytable_shift                     ; 2036 _ 05, 000000A0(d)
        movzx   eax, byte [eax]                         ; 203B _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 203E _ 88. 45, FF
        jmp     ?_073                                   ; 2041 _ EB, 04

?_072:  mov     byte [ebp-1H], 0                        ; 2043 _ C6. 45, FF, 00
?_073:  movzx   eax, byte [ebp-1H]                      ; 2047 _ 0F B6. 45, FF
?_074:  leave                                           ; 204B _ C9
        ret                                             ; 204C _ C3
; transfer_scancode End of function

is_special_key:; Function begin
        push    ebp                                     ; 204D _ 55
        mov     ebp, esp                                ; 204E _ 89. E5
        sub     esp, 4                                  ; 2050 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 2053 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2056 _ 89. 04 24
        call    transfer_scancode                       ; 2059 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 42                      ; 205E _ 83. 7D, 08, 2A
        jz      ?_075                                   ; 2062 _ 74, 27
        cmp     dword [ebp+8H], 54                      ; 2064 _ 83. 7D, 08, 36
        jz      ?_075                                   ; 2068 _ 74, 21
        cmp     dword [ebp+8H], 170                     ; 206A _ 81. 7D, 08, 000000AA
        jz      ?_075                                   ; 2071 _ 74, 18
        cmp     dword [ebp+8H], 182                     ; 2073 _ 81. 7D, 08, 000000B6
        jz      ?_075                                   ; 207A _ 74, 0F
        cmp     dword [ebp+8H], 58                      ; 207C _ 83. 7D, 08, 3A
        jz      ?_075                                   ; 2080 _ 74, 09
        cmp     dword [ebp+8H], 186                     ; 2082 _ 81. 7D, 08, 000000BA
        jnz     ?_076                                   ; 2089 _ 75, 07
?_075:  mov     eax, 1                                  ; 208B _ B8, 00000001
        jmp     ?_077                                   ; 2090 _ EB, 05

?_076:  mov     eax, 0                                  ; 2092 _ B8, 00000000
?_077:  leave                                           ; 2097 _ C9
        ret                                             ; 2098 _ C3
; is_special_key End of function

console_task:; Function begin
        push    ebp                                     ; 2099 _ 55
        mov     ebp, esp                                ; 209A _ 89. E5
        push    ebx                                     ; 209C _ 53
        sub     esp, 84                                 ; 209D _ 83. EC, 54
        mov     dword [ebp-10H], 78848                  ; 20A0 _ C7. 45, F0, 00013400
        call    task_now                                ; 20A7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 20AC _ 89. 45, EC
        mov     dword [ebp-18H], 16                     ; 20AF _ C7. 45, E8, 00000010
        mov     dword [ebp-1CH], 28                     ; 20B6 _ C7. 45, E4, 0000001C
        mov     dword [ebp-0CH], 0                      ; 20BD _ C7. 45, F4, 00000000
        mov     dword [ebp-20H], 0                      ; 20C4 _ C7. 45, E0, 00000000
        mov     dword [ebp-24H], 0                      ; 20CB _ C7. 45, DC, 00000000
        mov     eax, dword [ebp+8H]                     ; 20D2 _ 8B. 45, 08
        mov     dword [g_Console], eax                  ; 20D5 _ A3, 000000A8(d)
        mov     dword [?_328], 16                       ; 20DA _ C7. 05, 000000AC(d), 00000010
        mov     dword [?_329], 28                       ; 20E4 _ C7. 05, 000000B0(d), 0000001C
        mov     dword [?_330], -1                       ; 20EE _ C7. 05, 000000B4(d), FFFFFFFF
        mov     eax, dword [memman]                     ; 20F8 _ A1, 00000000(d)
        mov     dword [esp+4H], 128                     ; 20FD _ C7. 44 24, 04, 00000080
        mov     dword [esp], eax                        ; 2105 _ 89. 04 24
        call    memman_alloc                            ; 2108 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 210D _ 89. 45, D8
        mov     eax, dword [memman]                     ; 2110 _ A1, 00000000(d)
        mov     dword [esp+4H], 30                      ; 2115 _ C7. 44 24, 04, 0000001E
        mov     dword [esp], eax                        ; 211D _ 89. 04 24
        call    memman_alloc                            ; 2120 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 2125 _ 89. 45, D4
        mov     eax, dword [ebp-14H]                    ; 2128 _ 8B. 45, EC
        lea     edx, [eax+10H]                          ; 212B _ 8D. 50, 10
        mov     eax, dword [ebp-14H]                    ; 212E _ 8B. 45, EC
        mov     dword [esp+0CH], eax                    ; 2131 _ 89. 44 24, 0C
        mov     eax, dword [ebp-28H]                    ; 2135 _ 8B. 45, D8
        mov     dword [esp+8H], eax                     ; 2138 _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 213C _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 2144 _ 89. 14 24
        call    fifo8_init                              ; 2147 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 214C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 2151 _ 89. 45, D0
        mov     eax, dword [ebp-14H]                    ; 2154 _ 8B. 45, EC
        add     eax, 16                                 ; 2157 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 215A _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 2162 _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 2166 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 2169 _ 89. 04 24
        call    timer_init                              ; 216C _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 2171 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-30H]                    ; 2179 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 217C _ 89. 04 24
        call    timer_settime                           ; 217F _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2184 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2189 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_314                  ; 2191 _ C7. 44 24, 10, 00000060(d)
        mov     dword [esp+0CH], 28                     ; 2199 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 21A1 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+8H]                     ; 21A9 _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 21AC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 21B0 _ 89. 04 24
        call    paint_string                            ; 21B3 _ E8, FFFFFFFC(rel)
?_078:  call    io_cli                                  ; 21B8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 21BD _ 8B. 45, EC
        add     eax, 16                                 ; 21C0 _ 83. C0, 10
        mov     dword [esp], eax                        ; 21C3 _ 89. 04 24
        call    fifo8_status                            ; 21C6 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 21CB _ 85. C0
        jnz     ?_079                                   ; 21CD _ 75, 0A
        call    io_sti                                  ; 21CF _ E8, FFFFFFFC(rel)
        jmp     ?_093                                   ; 21D4 _ E9, 00000399

?_079:  mov     eax, dword [ebp-14H]                    ; 21D9 _ 8B. 45, EC
        add     eax, 16                                 ; 21DC _ 83. C0, 10
        mov     dword [esp], eax                        ; 21DF _ 89. 04 24
        call    fifo8_get                               ; 21E2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 21E7 _ 89. 45, CC
        call    io_sti                                  ; 21EA _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-34H], 1                      ; 21EF _ 83. 7D, CC, 01
        jg      ?_082                                   ; 21F3 _ 7F, 6E
        cmp     dword [ebp-0CH], 0                      ; 21F5 _ 83. 7D, F4, 00
        js      ?_082                                   ; 21F9 _ 78, 68
        cmp     dword [ebp-34H], 0                      ; 21FB _ 83. 7D, CC, 00
        jz      ?_080                                   ; 21FF _ 74, 26
        mov     eax, dword [ebp-14H]                    ; 2201 _ 8B. 45, EC
        add     eax, 16                                 ; 2204 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 2207 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 220F _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 2213 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 2216 _ 89. 04 24
        call    timer_init                              ; 2219 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 7                      ; 221E _ C7. 45, F4, 00000007
        jmp     ?_081                                   ; 2225 _ EB, 24

?_080:  mov     eax, dword [ebp-14H]                    ; 2227 _ 8B. 45, EC
        add     eax, 16                                 ; 222A _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 222D _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 2235 _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 2239 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 223C _ 89. 04 24
        call    timer_init                              ; 223F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 2244 _ C7. 45, F4, 00000000
?_081:  mov     dword [esp+4H], 50                      ; 224B _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-30H]                    ; 2253 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 2256 _ 89. 04 24
        call    timer_settime                           ; 2259 _ E8, FFFFFFFC(rel)
        jmp     ?_092                                   ; 225E _ E9, 000002D5

?_082:  cmp     dword [ebp-34H], 87                     ; 2263 _ 83. 7D, CC, 57
        jnz     ?_083                                   ; 2267 _ 75, 3C
        mov     dword [ebp-0CH], 7                      ; 2269 _ C7. 45, F4, 00000007
        mov     eax, dword [ebp-14H]                    ; 2270 _ 8B. 45, EC
        add     eax, 16                                 ; 2273 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 2276 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 227E _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 2282 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 2285 _ 89. 04 24
        call    timer_init                              ; 2288 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 228D _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-30H]                    ; 2295 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 2298 _ 89. 04 24
        call    timer_settime                           ; 229B _ E8, FFFFFFFC(rel)
        jmp     ?_092                                   ; 22A0 _ E9, 00000293

?_083:  cmp     dword [ebp-34H], 88                     ; 22A5 _ 83. 7D, CC, 58
        jnz     ?_084                                   ; 22A9 _ 75, 59
        mov     ecx, dword [?_329]                      ; 22AB _ 8B. 0D, 000000B0(d)
        mov     edx, dword [?_328]                      ; 22B1 _ 8B. 15, 000000AC(d)
        mov     eax, dword [sheet_control]              ; 22B7 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 22BC _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 22C4 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 22C8 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 22CC _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 22CF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 22D3 _ 89. 04 24
        call    set_cursor                              ; 22D6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], -1                     ; 22DB _ C7. 45, F4, FFFFFFFF
        mov     eax, dword [task_main]                  ; 22E2 _ A1, 00000000(d)
        mov     dword [esp+8H], 0                       ; 22E7 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 22EF _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 22F7 _ 89. 04 24
        call    task_run                                ; 22FA _ E8, FFFFFFFC(rel)
        jmp     ?_092                                   ; 22FF _ E9, 00000234

?_084:  cmp     dword [ebp-34H], 14                     ; 2304 _ 83. 7D, CC, 0E
        jne     ?_085                                   ; 2308 _ 0F 85, 00000082
        mov     eax, dword [?_328]                      ; 230E _ A1, 000000AC(d)
        cmp     eax, 16                                 ; 2313 _ 83. F8, 10
        jle     ?_085                                   ; 2316 _ 7E, 78
        mov     ebx, dword [?_329]                      ; 2318 _ 8B. 1D, 000000B0(d)
        mov     ecx, dword [?_328]                      ; 231E _ 8B. 0D, 000000AC(d)
        mov     edx, dword [g_Console]                  ; 2324 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 232A _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 232F _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 2337 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 233B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 233F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2343 _ 89. 04 24
        call    set_cursor                              ; 2346 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_328]                      ; 234B _ A1, 000000AC(d)
        sub     eax, 8                                  ; 2350 _ 83. E8, 08
        mov     dword [?_328], eax                      ; 2353 _ A3, 000000AC(d)
        mov     ebx, dword [?_329]                      ; 2358 _ 8B. 1D, 000000B0(d)
        mov     ecx, dword [?_328]                      ; 235E _ 8B. 0D, 000000AC(d)
        mov     edx, dword [g_Console]                  ; 2364 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 236A _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 236F _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 2377 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 237B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 237F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2383 _ 89. 04 24
        call    set_cursor                              ; 2386 _ E8, FFFFFFFC(rel)
        jmp     ?_092                                   ; 238B _ E9, 000001A8

?_085:  cmp     dword [ebp-34H], 28                     ; 2390 _ 83. 7D, CC, 1C
        jne     ?_091                                   ; 2394 _ 0F 85, 00000131
        mov     ecx, dword [?_329]                      ; 239A _ 8B. 0D, 000000B0(d)
        mov     edx, dword [?_328]                      ; 23A0 _ 8B. 15, 000000AC(d)
        mov     eax, dword [sheet_control]              ; 23A6 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 23AB _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ecx                    ; 23B3 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 23B7 _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 23BB _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 23BE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 23C2 _ 89. 04 24
        call    set_cursor                              ; 23C5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_328]                      ; 23CA _ A1, 000000AC(d)
        lea     edx, [eax+7H]                           ; 23CF _ 8D. 50, 07
        test    eax, eax                                ; 23D2 _ 85. C0
        cmovs   eax, edx                                ; 23D4 _ 0F 48. C2
        sar     eax, 3                                  ; 23D7 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 23DA _ 8D. 50, FE
        mov     eax, dword [ebp-2CH]                    ; 23DD _ 8B. 45, D4
        add     eax, edx                                ; 23E0 _ 01. D0
        mov     byte [eax], 0                           ; 23E2 _ C6. 00, 00
        mov     eax, dword [?_329]                      ; 23E5 _ A1, 000000B0(d)
        mov     edx, dword [ebp+8H]                     ; 23EA _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 23ED _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 23F1 _ 89. 04 24
        call    console_new_line                        ; 23F4 _ E8, FFFFFFFC(rel)
        mov     dword [?_329], eax                      ; 23F9 _ A3, 000000B0(d)
        mov     dword [esp+4H], ?_315                   ; 23FE _ C7. 44 24, 04, 00000062(d)
        mov     eax, dword [ebp-2CH]                    ; 2406 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 2409 _ 89. 04 24
        call    strcmp                                  ; 240C _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 2411 _ 83. F8, 01
        jnz     ?_086                                   ; 2414 _ 75, 10
        mov     eax, dword [ebp+0CH]                    ; 2416 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 2419 _ 89. 04 24
        call    command_mem                             ; 241C _ E8, FFFFFFFC(rel)
        jmp     ?_090                                   ; 2421 _ E9, 00000099

?_086:  mov     dword [esp+4H], ?_316                   ; 2426 _ C7. 44 24, 04, 00000066(d)
        mov     eax, dword [ebp-2CH]                    ; 242E _ 8B. 45, D4
        mov     dword [esp], eax                        ; 2431 _ 89. 04 24
        call    strcmp                                  ; 2434 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 2439 _ 83. F8, 01
        jnz     ?_087                                   ; 243C _ 75, 07
        call    command_cls                             ; 243E _ E8, FFFFFFFC(rel)
        jmp     ?_090                                   ; 2443 _ EB, 7A

?_087:  mov     dword [esp+4H], ?_317                   ; 2445 _ C7. 44 24, 04, 0000006A(d)
        mov     eax, dword [ebp-2CH]                    ; 244D _ 8B. 45, D4
        mov     dword [esp], eax                        ; 2450 _ 89. 04 24
        call    strcmp                                  ; 2453 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 2458 _ 83. F8, 01
        jnz     ?_088                                   ; 245B _ 75, 07
        call    command_dir                             ; 245D _ E8, FFFFFFFC(rel)
        jmp     ?_090                                   ; 2462 _ EB, 5B

?_088:  mov     eax, dword [ebp-2CH]                    ; 2464 _ 8B. 45, D4
        movzx   eax, byte [eax]                         ; 2467 _ 0F B6. 00
        cmp     al, 116                                 ; 246A _ 3C, 74
        jnz     ?_089                                   ; 246C _ 75, 34
        mov     eax, dword [ebp-2CH]                    ; 246E _ 8B. 45, D4
        add     eax, 1                                  ; 2471 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 2474 _ 0F B6. 00
        cmp     al, 121                                 ; 2477 _ 3C, 79
        jnz     ?_089                                   ; 2479 _ 75, 27
        mov     eax, dword [ebp-2CH]                    ; 247B _ 8B. 45, D4
        add     eax, 2                                  ; 247E _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 2481 _ 0F B6. 00
        cmp     al, 112                                 ; 2484 _ 3C, 70
        jnz     ?_089                                   ; 2486 _ 75, 1A
        mov     eax, dword [ebp-2CH]                    ; 2488 _ 8B. 45, D4
        add     eax, 3                                  ; 248B _ 83. C0, 03
        movzx   eax, byte [eax]                         ; 248E _ 0F B6. 00
        cmp     al, 101                                 ; 2491 _ 3C, 65
        jnz     ?_089                                   ; 2493 _ 75, 0D
        mov     eax, dword [ebp-2CH]                    ; 2495 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 2498 _ 89. 04 24
        call    command_type                            ; 249B _ E8, FFFFFFFC(rel)
        jmp     ?_090                                   ; 24A0 _ EB, 1D

?_089:  mov     dword [esp+4H], ?_318                   ; 24A2 _ C7. 44 24, 04, 0000006E(d)
        mov     eax, dword [ebp-2CH]                    ; 24AA _ 8B. 45, D4
        mov     dword [esp], eax                        ; 24AD _ 89. 04 24
        call    strcmp                                  ; 24B0 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 24B5 _ 83. F8, 01
        jnz     ?_090                                   ; 24B8 _ 75, 05
        call    command_hlt                             ; 24BA _ E8, FFFFFFFC(rel)
?_090:  mov     dword [?_328], 16                       ; 24BF _ C7. 05, 000000AC(d), 00000010
        jmp     ?_092                                   ; 24C9 _ EB, 6D

?_091:  mov     eax, dword [ebp-34H]                    ; 24CB _ 8B. 45, CC
        mov     dword [esp], eax                        ; 24CE _ 89. 04 24
        call    transfer_scancode                       ; 24D1 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-35H], al                      ; 24D6 _ 88. 45, CB
        cmp     byte [ebp-35H], 0                       ; 24D9 _ 80. 7D, CB, 00
        jz      ?_092                                   ; 24DD _ 74, 59
        mov     eax, dword [?_328]                      ; 24DF _ A1, 000000AC(d)
        cmp     eax, 239                                ; 24E4 _ 3D, 000000EF
        jg      ?_092                                   ; 24E9 _ 7F, 4D
        mov     eax, dword [?_328]                      ; 24EB _ A1, 000000AC(d)
        lea     edx, [eax+7H]                           ; 24F0 _ 8D. 50, 07
        test    eax, eax                                ; 24F3 _ 85. C0
        cmovs   eax, edx                                ; 24F5 _ 0F 48. C2
        sar     eax, 3                                  ; 24F8 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 24FB _ 8D. 50, FE
        mov     eax, dword [ebp-2CH]                    ; 24FE _ 8B. 45, D4
        add     edx, eax                                ; 2501 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 2503 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 2507 _ 88. 02
        mov     eax, dword [?_328]                      ; 2509 _ A1, 000000AC(d)
        lea     edx, [eax+7H]                           ; 250E _ 8D. 50, 07
        test    eax, eax                                ; 2511 _ 85. C0
        cmovs   eax, edx                                ; 2513 _ 0F 48. C2
        sar     eax, 3                                  ; 2516 _ C1. F8, 03
        lea     edx, [eax-1H]                           ; 2519 _ 8D. 50, FF
        mov     eax, dword [ebp-2CH]                    ; 251C _ 8B. 45, D4
        add     eax, edx                                ; 251F _ 01. D0
        mov     byte [eax], 0                           ; 2521 _ C6. 00, 00
        movsx   eax, byte [ebp-35H]                     ; 2524 _ 0F BE. 45, CB
        mov     dword [esp+4H], 1                       ; 2528 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 2530 _ 89. 04 24
        call    c_console_putchar                       ; 2533 _ E8, FFFFFFFC(rel)
?_092:  cmp     dword [ebp-0CH], 0                      ; 2538 _ 83. 7D, F4, 00
        js      ?_093                                   ; 253C _ 78, 34
        mov     ecx, dword [?_329]                      ; 253E _ 8B. 0D, 000000B0(d)
        mov     edx, dword [?_328]                      ; 2544 _ 8B. 15, 000000AC(d)
        mov     eax, dword [sheet_control]              ; 254A _ A1, 00000000(d)
        mov     ebx, dword [ebp-0CH]                    ; 254F _ 8B. 5D, F4
        mov     dword [esp+10H], ebx                    ; 2552 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2556 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 255A _ 89. 54 24, 08
        mov     edx, dword [ebp+8H]                     ; 255E _ 8B. 55, 08
        mov     dword [esp+4H], edx                     ; 2561 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2565 _ 89. 04 24
        call    set_cursor                              ; 2568 _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 256D _ E9, FFFFFC46

?_093:  jmp     ?_078                                   ; 2572 _ E9, FFFFFC41
; console_task End of function

command_mem:; Function begin
        push    ebp                                     ; 2577 _ 55
        mov     ebp, esp                                ; 2578 _ 89. E5
        push    ebx                                     ; 257A _ 53
        sub     esp, 52                                 ; 257B _ 83. EC, 34
        mov     eax, dword [ebp+8H]                     ; 257E _ 8B. 45, 08
        lea     edx, [eax+3FFH]                         ; 2581 _ 8D. 90, 000003FF
        test    eax, eax                                ; 2587 _ 85. C0
        cmovs   eax, edx                                ; 2589 _ 0F 48. C2
        sar     eax, 10                                 ; 258C _ C1. F8, 0A
        mov     dword [esp], eax                        ; 258F _ 89. 04 24
        call    intToHexStr                             ; 2592 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2597 _ 89. 45, F4
        mov     ecx, dword [?_329]                      ; 259A _ 8B. 0D, 000000B0(d)
        mov     edx, dword [g_Console]                  ; 25A0 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 25A6 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 25AB _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_319                  ; 25B3 _ C7. 44 24, 10, 00000072(d)
        mov     dword [esp+0CH], ecx                    ; 25BB _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 25BF _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 25C7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25CB _ 89. 04 24
        call    paint_string                            ; 25CE _ E8, FFFFFFFC(rel)
        mov     ecx, dword [?_329]                      ; 25D3 _ 8B. 0D, 000000B0(d)
        mov     edx, dword [g_Console]                  ; 25D9 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 25DF _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 25E4 _ C7. 44 24, 14, 00000007
        mov     ebx, dword [ebp-0CH]                    ; 25EC _ 8B. 5D, F4
        mov     dword [esp+10H], ebx                    ; 25EF _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 25F3 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 52                      ; 25F7 _ C7. 44 24, 08, 00000034
        mov     dword [esp+4H], edx                     ; 25FF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2603 _ 89. 04 24
        call    paint_string                            ; 2606 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [?_329]                      ; 260B _ 8B. 0D, 000000B0(d)
        mov     edx, dword [g_Console]                  ; 2611 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 2617 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 261C _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_320                  ; 2624 _ C7. 44 24, 10, 00000078(d)
        mov     dword [esp+0CH], ecx                    ; 262C _ 89. 4C 24, 0C
        mov     dword [esp+8H], 126                     ; 2630 _ C7. 44 24, 08, 0000007E
        mov     dword [esp+4H], edx                     ; 2638 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 263C _ 89. 04 24
        call    paint_string                            ; 263F _ E8, FFFFFFFC(rel)
        mov     edx, dword [g_Console]                  ; 2644 _ 8B. 15, 000000A8(d)
        mov     eax, dword [?_329]                      ; 264A _ A1, 000000B0(d)
        mov     dword [esp+4H], edx                     ; 264F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2653 _ 89. 04 24
        call    console_new_line                        ; 2656 _ E8, FFFFFFFC(rel)
        mov     dword [?_329], eax                      ; 265B _ A3, 000000B0(d)
        add     esp, 52                                 ; 2660 _ 83. C4, 34
        pop     ebx                                     ; 2663 _ 5B
        pop     ebp                                     ; 2664 _ 5D
        ret                                             ; 2665 _ C3
; command_mem End of function

command_cls:; Function begin
        push    ebp                                     ; 2666 _ 55
        mov     ebp, esp                                ; 2667 _ 89. E5
        sub     esp, 56                                 ; 2669 _ 83. EC, 38
        mov     dword [ebp-0CH], 8                      ; 266C _ C7. 45, F4, 00000008
        mov     dword [ebp-10H], 28                     ; 2673 _ C7. 45, F0, 0000001C
        mov     dword [ebp-10H], 28                     ; 267A _ C7. 45, F0, 0000001C
        jmp     ?_097                                   ; 2681 _ EB, 39

?_094:  mov     dword [ebp-0CH], 8                      ; 2683 _ C7. 45, F4, 00000008
        jmp     ?_096                                   ; 268A _ EB, 23

?_095:  mov     eax, dword [g_Console]                  ; 268C _ A1, 000000A8(d)
        mov     edx, dword [eax]                        ; 2691 _ 8B. 10
        mov     eax, dword [g_Console]                  ; 2693 _ A1, 000000A8(d)
        mov     eax, dword [eax+4H]                     ; 2698 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 269B _ 0F AF. 45, F0
        mov     ecx, eax                                ; 269F _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 26A1 _ 8B. 45, F4
        add     eax, ecx                                ; 26A4 _ 01. C8
        add     eax, edx                                ; 26A6 _ 01. D0
        mov     byte [eax], 0                           ; 26A8 _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 26AB _ 83. 45, F4, 01
?_096:  cmp     dword [ebp-0CH], 247                    ; 26AF _ 81. 7D, F4, 000000F7
        jle     ?_095                                   ; 26B6 _ 7E, D4
        add     dword [ebp-10H], 1                      ; 26B8 _ 83. 45, F0, 01
?_097:  cmp     dword [ebp-10H], 155                    ; 26BC _ 81. 7D, F0, 0000009B
        jle     ?_094                                   ; 26C3 _ 7E, BE
        mov     edx, dword [g_Console]                  ; 26C5 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 26CB _ A1, 00000000(d)
        mov     dword [esp+14H], 156                    ; 26D0 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 26D8 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 26E0 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 26E8 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 26F0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 26F4 _ 89. 04 24
        call    sheet_refresh                           ; 26F7 _ E8, FFFFFFFC(rel)
        mov     dword [?_329], 28                       ; 26FC _ C7. 05, 000000B0(d), 0000001C
        mov     edx, dword [g_Console]                  ; 2706 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 270C _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2711 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_314                  ; 2719 _ C7. 44 24, 10, 00000060(d)
        mov     dword [esp+0CH], 28                     ; 2721 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2729 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 2731 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2735 _ 89. 04 24
        call    paint_string                            ; 2738 _ E8, FFFFFFFC(rel)
        leave                                           ; 273D _ C9
        ret                                             ; 273E _ C3
; command_cls End of function

command_dir:; Function begin
        push    ebp                                     ; 273F _ 55
        mov     ebp, esp                                ; 2740 _ 89. E5
        push    ebx                                     ; 2742 _ 53
        sub     esp, 68                                 ; 2743 _ 83. EC, 44
        mov     dword [ebp-0CH], 78848                  ; 2746 _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 274D _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 2752 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 275A _ 89. 04 24
        call    memman_alloc                            ; 275D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 2762 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 2765 _ 8B. 45, E8
        add     eax, 12                                 ; 2768 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 276B _ C6. 00, 00
        jmp     ?_105                                   ; 276E _ E9, 00000129

?_098:  mov     dword [ebp-10H], 0                      ; 2773 _ C7. 45, F0, 00000000
        jmp     ?_101                                   ; 277A _ EB, 2C

?_099:  mov     edx, dword [ebp-0CH]                    ; 277C _ 8B. 55, F4
        mov     eax, dword [ebp-10H]                    ; 277F _ 8B. 45, F0
        add     eax, edx                                ; 2782 _ 01. D0
        movzx   eax, byte [eax]                         ; 2784 _ 0F B6. 00
        test    al, al                                  ; 2787 _ 84. C0
        jz      ?_100                                   ; 2789 _ 74, 1B
        mov     edx, dword [ebp-10H]                    ; 278B _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 278E _ 8B. 45, E8
        add     edx, eax                                ; 2791 _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 2793 _ 8B. 4D, F4
        mov     eax, dword [ebp-10H]                    ; 2796 _ 8B. 45, F0
        add     eax, ecx                                ; 2799 _ 01. C8
        movzx   eax, byte [eax]                         ; 279B _ 0F B6. 00
        mov     byte [edx], al                          ; 279E _ 88. 02
        add     dword [ebp-10H], 1                      ; 27A0 _ 83. 45, F0, 01
        jmp     ?_101                                   ; 27A4 _ EB, 02

?_100:  jmp     ?_102                                   ; 27A6 _ EB, 06

?_101:  cmp     dword [ebp-10H], 7                      ; 27A8 _ 83. 7D, F0, 07
        jle     ?_099                                   ; 27AC _ 7E, CE
?_102:  mov     edx, dword [ebp-10H]                    ; 27AE _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 27B1 _ 8B. 45, E8
        add     eax, edx                                ; 27B4 _ 01. D0
        mov     byte [eax], 46                          ; 27B6 _ C6. 00, 2E
        add     dword [ebp-10H], 1                      ; 27B9 _ 83. 45, F0, 01
        mov     dword [ebp-14H], 0                      ; 27BD _ C7. 45, EC, 00000000
        jmp     ?_104                                   ; 27C4 _ EB, 1E

?_103:  mov     edx, dword [ebp-10H]                    ; 27C6 _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 27C9 _ 8B. 45, E8
        add     edx, eax                                ; 27CC _ 01. C2
        mov     ecx, dword [ebp-0CH]                    ; 27CE _ 8B. 4D, F4
        mov     eax, dword [ebp-14H]                    ; 27D1 _ 8B. 45, EC
        add     eax, ecx                                ; 27D4 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 27D6 _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 27DA _ 88. 02
        add     dword [ebp-10H], 1                      ; 27DC _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 27E0 _ 83. 45, EC, 01
?_104:  cmp     dword [ebp-14H], 2                      ; 27E4 _ 83. 7D, EC, 02
        jle     ?_103                                   ; 27E8 _ 7E, DC
        mov     edx, dword [ebp-10H]                    ; 27EA _ 8B. 55, F0
        mov     eax, dword [ebp-18H]                    ; 27ED _ 8B. 45, E8
        add     eax, edx                                ; 27F0 _ 01. D0
        mov     byte [eax], 0                           ; 27F2 _ C6. 00, 00
        mov     ecx, dword [?_329]                      ; 27F5 _ 8B. 0D, 000000B0(d)
        mov     edx, dword [g_Console]                  ; 27FB _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 2801 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2806 _ C7. 44 24, 14, 00000007
        mov     ebx, dword [ebp-18H]                    ; 280E _ 8B. 5D, E8
        mov     dword [esp+10H], ebx                    ; 2811 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2815 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 16                      ; 2819 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], edx                     ; 2821 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2825 _ 89. 04 24
        call    paint_string                            ; 2828 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], 136                    ; 282D _ C7. 45, E4, 00000088
        mov     eax, dword [ebp-0CH]                    ; 2834 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 2837 _ 8B. 40, 1C
        mov     dword [esp], eax                        ; 283A _ 89. 04 24
        call    intToHexStr                             ; 283D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 2842 _ 89. 45, E0
        mov     ecx, dword [?_329]                      ; 2845 _ 8B. 0D, 000000B0(d)
        mov     edx, dword [g_Console]                  ; 284B _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 2851 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2856 _ C7. 44 24, 14, 00000007
        mov     ebx, dword [ebp-20H]                    ; 285E _ 8B. 5D, E0
        mov     dword [esp+10H], ebx                    ; 2861 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2865 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-1CH]                    ; 2869 _ 8B. 4D, E4
        mov     dword [esp+8H], ecx                     ; 286C _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2870 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2874 _ 89. 04 24
        call    paint_string                            ; 2877 _ E8, FFFFFFFC(rel)
        mov     edx, dword [g_Console]                  ; 287C _ 8B. 15, 000000A8(d)
        mov     eax, dword [?_329]                      ; 2882 _ A1, 000000B0(d)
        mov     dword [esp+4H], edx                     ; 2887 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 288B _ 89. 04 24
        call    console_new_line                        ; 288E _ E8, FFFFFFFC(rel)
        mov     dword [?_329], eax                      ; 2893 _ A3, 000000B0(d)
        add     dword [ebp-0CH], 32                     ; 2898 _ 83. 45, F4, 20
?_105:  mov     eax, dword [ebp-0CH]                    ; 289C _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 289F _ 0F B6. 00
        test    al, al                                  ; 28A2 _ 84. C0
        jne     ?_098                                   ; 28A4 _ 0F 85, FFFFFEC9
        mov     edx, dword [ebp-18H]                    ; 28AA _ 8B. 55, E8
        mov     eax, dword [memman]                     ; 28AD _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 28B2 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 28BA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 28BE _ 89. 04 24
        call    memman_free                             ; 28C1 _ E8, FFFFFFFC(rel)
        add     esp, 68                                 ; 28C6 _ 83. C4, 44
        pop     ebx                                     ; 28C9 _ 5B
        pop     ebp                                     ; 28CA _ 5D
        ret                                             ; 28CB _ C3
; command_dir End of function

command_type:; Function begin
        push    ebp                                     ; 28CC _ 55
        mov     ebp, esp                                ; 28CD _ 89. E5
        push    esi                                     ; 28CF _ 56
        push    ebx                                     ; 28D0 _ 53
        sub     esp, 96                                 ; 28D1 _ 83. EC, 60
        mov     dword [ebp-0CH], 78848                  ; 28D4 _ C7. 45, F4, 00013400
        mov     eax, dword [memman]                     ; 28DB _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 28E0 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 28E8 _ 89. 04 24
        call    memman_alloc                            ; 28EB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 28F0 _ 89. 45, DC
        mov     eax, dword [ebp-24H]                    ; 28F3 _ 8B. 45, DC
        add     eax, 12                                 ; 28F6 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 28F9 _ C6. 00, 00
        mov     dword [ebp-10H], 0                      ; 28FC _ C7. 45, F0, 00000000
        mov     dword [ebp-14H], 5                      ; 2903 _ C7. 45, EC, 00000005
        mov     dword [ebp-14H], 5                      ; 290A _ C7. 45, EC, 00000005
        jmp     ?_108                                   ; 2911 _ EB, 30

?_106:  mov     edx, dword [ebp-14H]                    ; 2913 _ 8B. 55, EC
        mov     eax, dword [ebp+8H]                     ; 2916 _ 8B. 45, 08
        add     eax, edx                                ; 2919 _ 01. D0
        movzx   eax, byte [eax]                         ; 291B _ 0F B6. 00
        test    al, al                                  ; 291E _ 84. C0
        jz      ?_107                                   ; 2920 _ 74, 1F
        mov     edx, dword [ebp-10H]                    ; 2922 _ 8B. 55, F0
        mov     eax, dword [ebp-24H]                    ; 2925 _ 8B. 45, DC
        add     edx, eax                                ; 2928 _ 01. C2
        mov     ecx, dword [ebp-14H]                    ; 292A _ 8B. 4D, EC
        mov     eax, dword [ebp+8H]                     ; 292D _ 8B. 45, 08
        add     eax, ecx                                ; 2930 _ 01. C8
        movzx   eax, byte [eax]                         ; 2932 _ 0F B6. 00
        mov     byte [edx], al                          ; 2935 _ 88. 02
        add     dword [ebp-10H], 1                      ; 2937 _ 83. 45, F0, 01
        add     dword [ebp-14H], 1                      ; 293B _ 83. 45, EC, 01
        jmp     ?_108                                   ; 293F _ EB, 02

?_107:  jmp     ?_109                                   ; 2941 _ EB, 06

?_108:  cmp     dword [ebp-14H], 16                     ; 2943 _ 83. 7D, EC, 10
        jle     ?_106                                   ; 2947 _ 7E, CA
?_109:  mov     edx, dword [ebp-10H]                    ; 2949 _ 8B. 55, F0
        mov     eax, dword [ebp-24H]                    ; 294C _ 8B. 45, DC
        add     eax, edx                                ; 294F _ 01. D0
        mov     byte [eax], 0                           ; 2951 _ C6. 00, 00
        jmp     ?_125                                   ; 2954 _ E9, 00000241

?_110:  mov     byte [ebp-2DH], 0                       ; 2959 _ C6. 45, D3, 00
        mov     dword [ebp-18H], 0                      ; 295D _ C7. 45, E8, 00000000
        jmp     ?_113                                   ; 2964 _ EB, 2C

?_111:  mov     edx, dword [ebp-0CH]                    ; 2966 _ 8B. 55, F4
        mov     eax, dword [ebp-18H]                    ; 2969 _ 8B. 45, E8
        add     eax, edx                                ; 296C _ 01. D0
        movzx   eax, byte [eax]                         ; 296E _ 0F B6. 00
        test    al, al                                  ; 2971 _ 84. C0
        jz      ?_112                                   ; 2973 _ 74, 1B
        mov     edx, dword [ebp-0CH]                    ; 2975 _ 8B. 55, F4
        mov     eax, dword [ebp-18H]                    ; 2978 _ 8B. 45, E8
        add     eax, edx                                ; 297B _ 01. D0
        movzx   eax, byte [eax]                         ; 297D _ 0F B6. 00
        lea     ecx, [ebp-39H]                          ; 2980 _ 8D. 4D, C7
        mov     edx, dword [ebp-18H]                    ; 2983 _ 8B. 55, E8
        add     edx, ecx                                ; 2986 _ 01. CA
        mov     byte [edx], al                          ; 2988 _ 88. 02
        add     dword [ebp-18H], 1                      ; 298A _ 83. 45, E8, 01
        jmp     ?_113                                   ; 298E _ EB, 02

?_112:  jmp     ?_114                                   ; 2990 _ EB, 06

?_113:  cmp     dword [ebp-18H], 7                      ; 2992 _ 83. 7D, E8, 07
        jle     ?_111                                   ; 2996 _ 7E, CE
?_114:  lea     edx, [ebp-39H]                          ; 2998 _ 8D. 55, C7
        mov     eax, dword [ebp-18H]                    ; 299B _ 8B. 45, E8
        add     eax, edx                                ; 299E _ 01. D0
        mov     byte [eax], 46                          ; 29A0 _ C6. 00, 2E
        add     dword [ebp-18H], 1                      ; 29A3 _ 83. 45, E8, 01
        mov     dword [ebp-1CH], 0                      ; 29A7 _ C7. 45, E4, 00000000
        jmp     ?_116                                   ; 29AE _ EB, 1E

?_115:  mov     edx, dword [ebp-0CH]                    ; 29B0 _ 8B. 55, F4
        mov     eax, dword [ebp-1CH]                    ; 29B3 _ 8B. 45, E4
        add     eax, edx                                ; 29B6 _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 29B8 _ 0F B6. 40, 08
        lea     ecx, [ebp-39H]                          ; 29BC _ 8D. 4D, C7
        mov     edx, dword [ebp-18H]                    ; 29BF _ 8B. 55, E8
        add     edx, ecx                                ; 29C2 _ 01. CA
        mov     byte [edx], al                          ; 29C4 _ 88. 02
        add     dword [ebp-18H], 1                      ; 29C6 _ 83. 45, E8, 01
        add     dword [ebp-1CH], 1                      ; 29CA _ 83. 45, E4, 01
?_116:  cmp     dword [ebp-1CH], 2                      ; 29CE _ 83. 7D, E4, 02
        jle     ?_115                                   ; 29D2 _ 7E, DC
        lea     edx, [ebp-39H]                          ; 29D4 _ 8D. 55, C7
        mov     eax, dword [ebp-18H]                    ; 29D7 _ 8B. 45, E8
        add     eax, edx                                ; 29DA _ 01. D0
        mov     byte [eax], 0                           ; 29DC _ C6. 00, 00
        lea     eax, [ebp-39H]                          ; 29DF _ 8D. 45, C7
        mov     dword [esp+4H], eax                     ; 29E2 _ 89. 44 24, 04
        mov     eax, dword [ebp-24H]                    ; 29E6 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 29E9 _ 89. 04 24
        call    strcmp                                  ; 29EC _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 29F1 _ 83. F8, 01
        jne     ?_124                                   ; 29F4 _ 0F 85, 0000019C
        mov     dword [ebp-28H], 88064                  ; 29FA _ C7. 45, D8, 00015800
        mov     eax, dword [ebp-0CH]                    ; 2A01 _ 8B. 45, F4
        movzx   eax, word [eax+1AH]                     ; 2A04 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 2A08 _ 0F B7. C0
        shl     eax, 9                                  ; 2A0B _ C1. E0, 09
        add     dword [ebp-28H], eax                    ; 2A0E _ 01. 45, D8
        mov     eax, dword [ebp-0CH]                    ; 2A11 _ 8B. 45, F4
        mov     eax, dword [eax+1CH]                    ; 2A14 _ 8B. 40, 1C
        mov     dword [ebp-2CH], eax                    ; 2A17 _ 89. 45, D4
        mov     dword [ebp-20H], 0                      ; 2A1A _ C7. 45, E0, 00000000
        mov     dword [?_328], 16                       ; 2A21 _ C7. 05, 000000AC(d), 00000010
        mov     dword [ebp-20H], 0                      ; 2A2B _ C7. 45, E0, 00000000
        jmp     ?_123                                   ; 2A32 _ E9, 00000150

?_117:  mov     edx, dword [ebp-20H]                    ; 2A37 _ 8B. 55, E0
        mov     eax, dword [ebp-28H]                    ; 2A3A _ 8B. 45, D8
        add     eax, edx                                ; 2A3D _ 01. D0
        movzx   eax, byte [eax]                         ; 2A3F _ 0F B6. 00
        mov     byte [ebp-3BH], al                      ; 2A42 _ 88. 45, C5
        mov     byte [ebp-3AH], 0                       ; 2A45 _ C6. 45, C6, 00
        movzx   eax, byte [ebp-3BH]                     ; 2A49 _ 0F B6. 45, C5
        cmp     al, 9                                   ; 2A4D _ 3C, 09
        jnz     ?_120                                   ; 2A4F _ 75, 7E
?_118:  mov     ebx, dword [?_329]                      ; 2A51 _ 8B. 1D, 000000B0(d)
        mov     ecx, dword [?_328]                      ; 2A57 _ 8B. 0D, 000000AC(d)
        mov     edx, dword [g_Console]                  ; 2A5D _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 2A63 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2A68 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_321                  ; 2A70 _ C7. 44 24, 10, 0000007C(d)
        mov     dword [esp+0CH], ebx                    ; 2A78 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2A7C _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2A80 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2A84 _ 89. 04 24
        call    paint_string                            ; 2A87 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_328]                      ; 2A8C _ A1, 000000AC(d)
        add     eax, 8                                  ; 2A91 _ 83. C0, 08
        mov     dword [?_328], eax                      ; 2A94 _ A3, 000000AC(d)
        mov     eax, dword [?_328]                      ; 2A99 _ A1, 000000AC(d)
        cmp     eax, 248                                ; 2A9E _ 3D, 000000F8
        jnz     ?_119                                   ; 2AA3 _ 75, 28
        mov     dword [?_328], 8                        ; 2AA5 _ C7. 05, 000000AC(d), 00000008
        mov     edx, dword [g_Console]                  ; 2AAF _ 8B. 15, 000000A8(d)
        mov     eax, dword [?_329]                      ; 2AB5 _ A1, 000000B0(d)
        mov     dword [esp+4H], edx                     ; 2ABA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2ABE _ 89. 04 24
        call    console_new_line                        ; 2AC1 _ E8, FFFFFFFC(rel)
        mov     dword [?_329], eax                      ; 2AC6 _ A3, 000000B0(d)
        jmp     ?_118                                   ; 2ACB _ EB, 84

?_119:  jmp     ?_118                                   ; 2ACD _ EB, 82

?_120:  movzx   eax, byte [ebp-3BH]                     ; 2ACF _ 0F B6. 45, C5
        cmp     al, 10                                  ; 2AD3 _ 3C, 0A
        jnz     ?_121                                   ; 2AD5 _ 75, 2B
        mov     dword [?_328], 8                        ; 2AD7 _ C7. 05, 000000AC(d), 00000008
        mov     edx, dword [g_Console]                  ; 2AE1 _ 8B. 15, 000000A8(d)
        mov     eax, dword [?_329]                      ; 2AE7 _ A1, 000000B0(d)
        mov     dword [esp+4H], edx                     ; 2AEC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2AF0 _ 89. 04 24
        call    console_new_line                        ; 2AF3 _ E8, FFFFFFFC(rel)
        mov     dword [?_329], eax                      ; 2AF8 _ A3, 000000B0(d)
        jmp     ?_122                                   ; 2AFD _ E9, 00000081

?_121:  movzx   eax, byte [ebp-3BH]                     ; 2B02 _ 0F B6. 45, C5
        cmp     al, 13                                  ; 2B06 _ 3C, 0D
        jz      ?_122                                   ; 2B08 _ 74, 79
        mov     ebx, dword [?_329]                      ; 2B0A _ 8B. 1D, 000000B0(d)
        mov     ecx, dword [?_328]                      ; 2B10 _ 8B. 0D, 000000AC(d)
        mov     edx, dword [g_Console]                  ; 2B16 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 2B1C _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2B21 _ C7. 44 24, 14, 00000007
        lea     esi, [ebp-3BH]                          ; 2B29 _ 8D. 75, C5
        mov     dword [esp+10H], esi                    ; 2B2C _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2B30 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2B34 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2B38 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2B3C _ 89. 04 24
        call    paint_string                            ; 2B3F _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_328]                      ; 2B44 _ A1, 000000AC(d)
        add     eax, 8                                  ; 2B49 _ 83. C0, 08
        mov     dword [?_328], eax                      ; 2B4C _ A3, 000000AC(d)
        mov     eax, dword [?_328]                      ; 2B51 _ A1, 000000AC(d)
        cmp     eax, 248                                ; 2B56 _ 3D, 000000F8
        jnz     ?_122                                   ; 2B5B _ 75, 26
        mov     dword [?_328], 16                       ; 2B5D _ C7. 05, 000000AC(d), 00000010
        mov     edx, dword [g_Console]                  ; 2B67 _ 8B. 15, 000000A8(d)
        mov     eax, dword [?_329]                      ; 2B6D _ A1, 000000B0(d)
        mov     dword [esp+4H], edx                     ; 2B72 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2B76 _ 89. 04 24
        call    console_new_line                        ; 2B79 _ E8, FFFFFFFC(rel)
        mov     dword [?_329], eax                      ; 2B7E _ A3, 000000B0(d)
?_122:  add     dword [ebp-20H], 1                      ; 2B83 _ 83. 45, E0, 01
?_123:  mov     eax, dword [ebp-20H]                    ; 2B87 _ 8B. 45, E0
        cmp     eax, dword [ebp-2CH]                    ; 2B8A _ 3B. 45, D4
        jl      ?_117                                   ; 2B8D _ 0F 8C, FFFFFEA4
        nop                                             ; 2B93 _ 90
        jmp     ?_126                                   ; 2B94 _ EB, 12

?_124:  add     dword [ebp-0CH], 32                     ; 2B96 _ 83. 45, F4, 20
?_125:  mov     eax, dword [ebp-0CH]                    ; 2B9A _ 8B. 45, F4
        movzx   eax, byte [eax]                         ; 2B9D _ 0F B6. 00
        test    al, al                                  ; 2BA0 _ 84. C0
        jne     ?_110                                   ; 2BA2 _ 0F 85, FFFFFDB1
?_126:  mov     edx, dword [g_Console]                  ; 2BA8 _ 8B. 15, 000000A8(d)
        mov     eax, dword [?_329]                      ; 2BAE _ A1, 000000B0(d)
        mov     dword [esp+4H], edx                     ; 2BB3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2BB7 _ 89. 04 24
        call    console_new_line                        ; 2BBA _ E8, FFFFFFFC(rel)
        mov     dword [?_329], eax                      ; 2BBF _ A3, 000000B0(d)
        mov     dword [?_328], 16                       ; 2BC4 _ C7. 05, 000000AC(d), 00000010
        mov     edx, dword [ebp-24H]                    ; 2BCE _ 8B. 55, DC
        mov     eax, dword [memman]                     ; 2BD1 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 2BD6 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 2BDE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2BE2 _ 89. 04 24
        call    memman_free                             ; 2BE5 _ E8, FFFFFFFC(rel)
        add     esp, 96                                 ; 2BEA _ 83. C4, 60
        pop     ebx                                     ; 2BED _ 5B
        pop     esi                                     ; 2BEE _ 5E
        pop     ebp                                     ; 2BEF _ 5D
        ret                                             ; 2BF0 _ C3
; command_type End of function

command_hlt:; Function begin
        push    ebp                                     ; 2BF1 _ 55
        mov     ebp, esp                                ; 2BF2 _ 89. E5
        sub     esp, 40                                 ; 2BF4 _ 83. EC, 28
        mov     dword [esp+4H], buffer                  ; 2BF7 _ C7. 44 24, 04, 000001D8(d)
        mov     dword [esp], ?_322                      ; 2BFF _ C7. 04 24, 0000007E(d)
        call    file_load_content                       ; 2C06 _ E8, FFFFFFFC(rel)
        call    get_addr_gdt                            ; 2C0B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2C10 _ 89. 45, F4
        mov     eax, dword [buffer]                     ; 2C13 _ A1, 000001D8(d)
        mov     edx, dword [ebp-0CH]                    ; 2C18 _ 8B. 55, F4
        add     edx, 152                                ; 2C1B _ 81. C2, 00000098
        mov     dword [esp+0CH], 16536                  ; 2C21 _ C7. 44 24, 0C, 00004098
        mov     dword [esp+8H], eax                     ; 2C29 _ 89. 44 24, 08
        mov     dword [esp+4H], 1048575                 ; 2C2D _ C7. 44 24, 04, 000FFFFF
        mov     dword [esp], edx                        ; 2C35 _ 89. 14 24
        call    segment_descriptor                      ; 2C38 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 152                     ; 2C3D _ C7. 44 24, 04, 00000098
        mov     dword [esp], 0                          ; 2C45 _ C7. 04 24, 00000000
        call    farjmp                                  ; 2C4C _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_333]                      ; 2C51 _ A1, 000001DC(d)
        mov     ecx, eax                                ; 2C56 _ 89. C1
        mov     eax, dword [buffer]                     ; 2C58 _ A1, 000001D8(d)
        mov     edx, eax                                ; 2C5D _ 89. C2
        mov     eax, dword [memman]                     ; 2C5F _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 2C64 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2C68 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2C6C _ 89. 04 24
        call    memman_free_4k                          ; 2C6F _ E8, FFFFFFFC(rel)
        leave                                           ; 2C74 _ C9
        ret                                             ; 2C75 _ C3
; command_hlt End of function

launch_console:; Function begin
        push    ebp                                     ; 2C76 _ 55
        mov     ebp, esp                                ; 2C77 _ 89. E5
        push    ebx                                     ; 2C79 _ 53
        sub     esp, 52                                 ; 2C7A _ 83. EC, 34
        mov     eax, dword [sheet_control]              ; 2C7D _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 2C82 _ 89. 04 24
        call    sheet_alloc                             ; 2C85 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2C8A _ 89. 45, F4
        mov     eax, dword [memman]                     ; 2C8D _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 2C92 _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 2C9A _ 89. 04 24
        call    memman_alloc_4k                         ; 2C9D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2CA2 _ 89. 45, F0
        mov     dword [esp+10H], 99                     ; 2CA5 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 2CAD _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 2CB5 _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-10H]                    ; 2CBD _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2CC0 _ 89. 44 24, 04
        mov     eax, dword [ebp-0CH]                    ; 2CC4 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 2CC7 _ 89. 04 24
        call    sheet_setbuf                            ; 2CCA _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2CCF _ A1, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 2CD4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_323                   ; 2CDC _ C7. 44 24, 08, 00000086(d)
        mov     edx, dword [ebp-0CH]                    ; 2CE4 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2CE7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2CEB _ 89. 04 24
        call    make_windows                            ; 2CEE _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 2CF3 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 2CFB _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 2D03 _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 2D0B _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 2D13 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-0CH]                    ; 2D1B _ 8B. 45, F4
        mov     dword [esp], eax                        ; 2D1E _ 89. 04 24
        call    make_textbox                            ; 2D21 _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 2D26 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 2D2B _ 89. 45, EC
        call    get_code32_addr                         ; 2D2E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 2D33 _ 89. 45, E8
        mov     eax, dword [ebp-14H]                    ; 2D36 _ 8B. 45, EC
        mov     dword [eax+8CH], 0                      ; 2D39 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-14H]                    ; 2D43 _ 8B. 45, EC
        mov     dword [eax+90H], 1073741824             ; 2D46 _ C7. 80, 00000090, 40000000
        mov     eax, console_task                       ; 2D50 _ B8, 00000000(d)
        sub     eax, dword [ebp-18H]                    ; 2D55 _ 2B. 45, E8
        mov     edx, eax                                ; 2D58 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2D5A _ 8B. 45, EC
        mov     dword [eax+4CH], edx                    ; 2D5D _ 89. 50, 4C
        mov     eax, dword [ebp-14H]                    ; 2D60 _ 8B. 45, EC
        mov     dword [eax+74H], 0                      ; 2D63 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-14H]                    ; 2D6A _ 8B. 45, EC
        mov     dword [eax+78H], 8                      ; 2D6D _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-14H]                    ; 2D74 _ 8B. 45, EC
        mov     dword [eax+7CH], 48                     ; 2D77 _ C7. 40, 7C, 00000030
        mov     eax, dword [ebp-14H]                    ; 2D7E _ 8B. 45, EC
        mov     dword [eax+80H], 32                     ; 2D81 _ C7. 80, 00000080, 00000020
        mov     eax, dword [ebp-14H]                    ; 2D8B _ 8B. 45, EC
        mov     dword [eax+84H], 0                      ; 2D8E _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-14H]                    ; 2D98 _ 8B. 45, EC
        mov     dword [eax+88H], 16                     ; 2D9B _ C7. 80, 00000088, 00000010
        mov     eax, dword [ebp-14H]                    ; 2DA5 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 2DA8 _ 8B. 40, 64
        lea     edx, [eax-4H]                           ; 2DAB _ 8D. 50, FC
        mov     eax, dword [ebp-14H]                    ; 2DAE _ 8B. 45, EC
        mov     dword [eax+64H], edx                    ; 2DB1 _ 89. 50, 64
        mov     eax, dword [ebp-14H]                    ; 2DB4 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 2DB7 _ 8B. 40, 64
        add     eax, 4                                  ; 2DBA _ 83. C0, 04
        mov     edx, dword [ebp-0CH]                    ; 2DBD _ 8B. 55, F4
        mov     dword [eax], edx                        ; 2DC0 _ 89. 10
        mov     eax, dword [ebp-14H]                    ; 2DC2 _ 8B. 45, EC
        mov     eax, dword [eax+64H]                    ; 2DC5 _ 8B. 40, 64
        add     eax, 8                                  ; 2DC8 _ 83. C0, 08
        mov     ebx, eax                                ; 2DCB _ 89. C3
        mov     eax, dword [memman]                     ; 2DCD _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 2DD2 _ 89. 04 24
        call    memman_total                            ; 2DD5 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 2DDA _ 89. 03
        mov     dword [esp+8H], 5                       ; 2DDC _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 2DE4 _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-14H]                    ; 2DEC _ 8B. 45, EC
        mov     dword [esp], eax                        ; 2DEF _ 89. 04 24
        call    task_run                                ; 2DF2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2DF7 _ A1, 00000000(d)
        mov     dword [esp+0CH], 4                      ; 2DFC _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 2E04 _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-0CH]                    ; 2E0C _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2E0F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2E13 _ 89. 04 24
        call    sheet_slide                             ; 2E16 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2E1B _ A1, 00000000(d)
        mov     dword [esp+8H], 1                       ; 2E20 _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-0CH]                    ; 2E28 _ 8B. 55, F4
        mov     dword [esp+4H], edx                     ; 2E2B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2E2F _ 89. 04 24
        call    sheet_updown                            ; 2E32 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-14H]                    ; 2E37 _ 8B. 45, EC
        mov     dword [task_console_g], eax             ; 2E3A _ A3, 00000000(d)
        mov     eax, dword [ebp-0CH]                    ; 2E3F _ 8B. 45, F4
        add     esp, 52                                 ; 2E42 _ 83. C4, 34
        pop     ebx                                     ; 2E45 _ 5B
        pop     ebp                                     ; 2E46 _ 5D
        ret                                             ; 2E47 _ C3
; launch_console End of function

set_cursor:; Function begin
        push    ebp                                     ; 2E48 _ 55
        mov     ebp, esp                                ; 2E49 _ 89. E5
        push    esi                                     ; 2E4B _ 56
        push    ebx                                     ; 2E4C _ 53
        sub     esp, 32                                 ; 2E4D _ 83. EC, 20
        mov     eax, dword [ebp+14H]                    ; 2E50 _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 2E53 _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 2E56 _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 2E59 _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 2E5C _ 8B. 45, 18
        movzx   ecx, al                                 ; 2E5F _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 2E62 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 2E65 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2E68 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2E6B _ 8B. 00
        mov     dword [esp+18H], esi                    ; 2E6D _ 89. 74 24, 18
        mov     dword [esp+14H], ebx                    ; 2E71 _ 89. 5C 24, 14
        mov     ebx, dword [ebp+14H]                    ; 2E75 _ 8B. 5D, 14
        mov     dword [esp+10H], ebx                    ; 2E78 _ 89. 5C 24, 10
        mov     ebx, dword [ebp+10H]                    ; 2E7C _ 8B. 5D, 10
        mov     dword [esp+0CH], ebx                    ; 2E7F _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2E83 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2E87 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2E8B _ 89. 04 24
        call    paint_rectangle                         ; 2E8E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 2E93 _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 2E96 _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 2E99 _ 8B. 45, 10
        add     eax, 8                                  ; 2E9C _ 83. C0, 08
        mov     dword [esp+14H], edx                    ; 2E9F _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2EA3 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 2EA7 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 2EAA _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 2EAE _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 2EB1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2EB5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2EB8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2EBC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2EBF _ 89. 04 24
        call    sheet_refresh                           ; 2EC2 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2EC7 _ 83. C4, 20
        pop     ebx                                     ; 2ECA _ 5B
        pop     esi                                     ; 2ECB _ 5E
        pop     ebp                                     ; 2ECC _ 5D
        ret                                             ; 2ECD _ C3
; set_cursor End of function

console_new_line:; Function begin
        push    ebp                                     ; 2ECE _ 55
        mov     ebp, esp                                ; 2ECF _ 89. E5
        push    ebx                                     ; 2ED1 _ 53
        sub     esp, 52                                 ; 2ED2 _ 83. EC, 34
        cmp     dword [ebp+8H], 139                     ; 2ED5 _ 81. 7D, 08, 0000008B
        jg      ?_127                                   ; 2EDC _ 7F, 09
        add     dword [ebp+8H], 16                      ; 2EDE _ 83. 45, 08, 10
        jmp     ?_136                                   ; 2EE2 _ E9, 000000DF

?_127:  mov     dword [ebp-10H], 28                     ; 2EE7 _ C7. 45, F0, 0000001C
        jmp     ?_131                                   ; 2EEE _ EB, 52

?_128:  mov     dword [ebp-0CH], 8                      ; 2EF0 _ C7. 45, F4, 00000008
        jmp     ?_130                                   ; 2EF7 _ EB, 3C

?_129:  mov     eax, dword [ebp+0CH]                    ; 2EF9 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2EFC _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2EFE _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2F01 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 2F04 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 2F08 _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2F0A _ 8B. 45, F4
        add     eax, ecx                                ; 2F0D _ 01. C8
        add     edx, eax                                ; 2F0F _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2F11 _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 2F14 _ 8B. 08
        mov     eax, dword [ebp-10H]                    ; 2F16 _ 8B. 45, F0
        lea     ebx, [eax+10H]                          ; 2F19 _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 2F1C _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2F1F _ 8B. 40, 04
        imul    ebx, eax                                ; 2F22 _ 0F AF. D8
        mov     eax, dword [ebp-0CH]                    ; 2F25 _ 8B. 45, F4
        add     eax, ebx                                ; 2F28 _ 01. D8
        add     eax, ecx                                ; 2F2A _ 01. C8
        movzx   eax, byte [eax]                         ; 2F2C _ 0F B6. 00
        mov     byte [edx], al                          ; 2F2F _ 88. 02
        add     dword [ebp-0CH], 1                      ; 2F31 _ 83. 45, F4, 01
?_130:  cmp     dword [ebp-0CH], 247                    ; 2F35 _ 81. 7D, F4, 000000F7
        jle     ?_129                                   ; 2F3C _ 7E, BB
        add     dword [ebp-10H], 1                      ; 2F3E _ 83. 45, F0, 01
?_131:  cmp     dword [ebp-10H], 139                    ; 2F42 _ 81. 7D, F0, 0000008B
        jle     ?_128                                   ; 2F49 _ 7E, A5
        mov     dword [ebp-10H], 140                    ; 2F4B _ C7. 45, F0, 0000008C
        jmp     ?_135                                   ; 2F52 _ EB, 35

?_132:  mov     dword [ebp-0CH], 8                      ; 2F54 _ C7. 45, F4, 00000008
        jmp     ?_134                                   ; 2F5B _ EB, 1F

?_133:  mov     eax, dword [ebp+0CH]                    ; 2F5D _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2F60 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2F62 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2F65 _ 8B. 40, 04
        imul    eax, dword [ebp-10H]                    ; 2F68 _ 0F AF. 45, F0
        mov     ecx, eax                                ; 2F6C _ 89. C1
        mov     eax, dword [ebp-0CH]                    ; 2F6E _ 8B. 45, F4
        add     eax, ecx                                ; 2F71 _ 01. C8
        add     eax, edx                                ; 2F73 _ 01. D0
        mov     byte [eax], 0                           ; 2F75 _ C6. 00, 00
        add     dword [ebp-0CH], 1                      ; 2F78 _ 83. 45, F4, 01
?_134:  cmp     dword [ebp-0CH], 247                    ; 2F7C _ 81. 7D, F4, 000000F7
        jle     ?_133                                   ; 2F83 _ 7E, D8
        add     dword [ebp-10H], 1                      ; 2F85 _ 83. 45, F0, 01
?_135:  cmp     dword [ebp-10H], 155                    ; 2F89 _ 81. 7D, F0, 0000009B
        jle     ?_132                                   ; 2F90 _ 7E, C2
        mov     eax, dword [sheet_control]              ; 2F92 _ A1, 00000000(d)
        mov     dword [esp+14H], 156                    ; 2F97 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 2F9F _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 2FA7 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2FAF _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 2FB7 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2FBA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2FBE _ 89. 04 24
        call    sheet_refresh                           ; 2FC1 _ E8, FFFFFFFC(rel)
?_136:  mov     eax, dword [sheet_control]              ; 2FC6 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2FCB _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_314                  ; 2FD3 _ C7. 44 24, 10, 00000060(d)
        mov     edx, dword [ebp+8H]                     ; 2FDB _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 2FDE _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 2FE2 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 2FEA _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 2FED _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2FF1 _ 89. 04 24
        call    paint_string                            ; 2FF4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 2FF9 _ 8B. 45, 08
        add     esp, 52                                 ; 2FFC _ 83. C4, 34
        pop     ebx                                     ; 2FFF _ 5B
        pop     ebp                                     ; 3000 _ 5D
        ret                                             ; 3001 _ C3
; console_new_line End of function

strcmp: ; Function begin
        push    ebp                                     ; 3002 _ 55
        mov     ebp, esp                                ; 3003 _ 89. E5
        sub     esp, 16                                 ; 3005 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 3008 _ 83. 7D, 08, 00
        jz      ?_137                                   ; 300C _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 300E _ 83. 7D, 0C, 00
        jnz     ?_138                                   ; 3012 _ 75, 0A
?_137:  mov     eax, 0                                  ; 3014 _ B8, 00000000
        jmp     ?_145                                   ; 3019 _ E9, 00000092

?_138:  mov     dword [ebp-4H], 0                       ; 301E _ C7. 45, FC, 00000000
        jmp     ?_141                                   ; 3025 _ EB, 25

?_139:  mov     edx, dword [ebp-4H]                     ; 3027 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 302A _ 8B. 45, 08
        add     eax, edx                                ; 302D _ 01. D0
        movzx   edx, byte [eax]                         ; 302F _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 3032 _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 3035 _ 8B. 45, 0C
        add     eax, ecx                                ; 3038 _ 01. C8
        movzx   eax, byte [eax]                         ; 303A _ 0F B6. 00
        cmp     dl, al                                  ; 303D _ 38. C2
        jz      ?_140                                   ; 303F _ 74, 07
        mov     eax, 0                                  ; 3041 _ B8, 00000000
        jmp     ?_145                                   ; 3046 _ EB, 68

?_140:  add     dword [ebp-4H], 1                       ; 3048 _ 83. 45, FC, 01
?_141:  mov     edx, dword [ebp-4H]                     ; 304C _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 304F _ 8B. 45, 08
        add     eax, edx                                ; 3052 _ 01. D0
        movzx   eax, byte [eax]                         ; 3054 _ 0F B6. 00
        test    al, al                                  ; 3057 _ 84. C0
        jz      ?_142                                   ; 3059 _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 305B _ 83. 7D, 0C, 00
        jnz     ?_139                                   ; 305F _ 75, C6
?_142:  mov     edx, dword [ebp-4H]                     ; 3061 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 3064 _ 8B. 45, 08
        add     eax, edx                                ; 3067 _ 01. D0
        movzx   eax, byte [eax]                         ; 3069 _ 0F B6. 00
        test    al, al                                  ; 306C _ 84. C0
        jnz     ?_143                                   ; 306E _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 3070 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 3073 _ 8B. 45, 0C
        add     eax, edx                                ; 3076 _ 01. D0
        movzx   eax, byte [eax]                         ; 3078 _ 0F B6. 00
        test    al, al                                  ; 307B _ 84. C0
        jz      ?_143                                   ; 307D _ 74, 07
        mov     eax, 0                                  ; 307F _ B8, 00000000
        jmp     ?_145                                   ; 3084 _ EB, 2A

?_143:  mov     edx, dword [ebp-4H]                     ; 3086 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 3089 _ 8B. 45, 08
        add     eax, edx                                ; 308C _ 01. D0
        movzx   eax, byte [eax]                         ; 308E _ 0F B6. 00
        test    al, al                                  ; 3091 _ 84. C0
        jz      ?_144                                   ; 3093 _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 3095 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 3098 _ 8B. 45, 0C
        add     eax, edx                                ; 309B _ 01. D0
        movzx   eax, byte [eax]                         ; 309D _ 0F B6. 00
        test    al, al                                  ; 30A0 _ 84. C0
        jz      ?_144                                   ; 30A2 _ 74, 07
        mov     eax, 0                                  ; 30A4 _ B8, 00000000
        jmp     ?_145                                   ; 30A9 _ EB, 05

?_144:  mov     eax, 1                                  ; 30AB _ B8, 00000001
?_145:  leave                                           ; 30B0 _ C9
        ret                                             ; 30B1 _ C3
; strcmp End of function

c_console_putchar:; Function begin
        push    ebp                                     ; 30B2 _ 55
        mov     ebp, esp                                ; 30B3 _ 89. E5
        push    ebx                                     ; 30B5 _ 53
        sub     esp, 36                                 ; 30B6 _ 83. EC, 24
        mov     edx, dword [ebp+8H]                     ; 30B9 _ 8B. 55, 08
        mov     eax, dword [ebp+0CH]                    ; 30BC _ 8B. 45, 0C
        mov     byte [ebp-0CH], dl                      ; 30BF _ 88. 55, F4
        mov     byte [ebp-10H], al                      ; 30C2 _ 88. 45, F0
        mov     ebx, dword [?_329]                      ; 30C5 _ 8B. 1D, 000000B0(d)
        mov     ecx, dword [?_328]                      ; 30CB _ 8B. 0D, 000000AC(d)
        mov     edx, dword [g_Console]                  ; 30D1 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 30D7 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 30DC _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 30E4 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 30E8 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 30EC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 30F0 _ 89. 04 24
        call    set_cursor                              ; 30F3 _ E8, FFFFFFFC(rel)
        movzx   eax, byte [ebp-0CH]                     ; 30F8 _ 0F B6. 45, F4
        mov     byte [?_331], al                        ; 30FC _ A2, 000000B8(d)
        mov     byte [?_332], 0                         ; 3101 _ C6. 05, 000000B9(d), 00
        mov     ebx, dword [?_329]                      ; 3108 _ 8B. 1D, 000000B0(d)
        mov     ecx, dword [?_328]                      ; 310E _ 8B. 0D, 000000AC(d)
        mov     edx, dword [g_Console]                  ; 3114 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 311A _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 311F _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_331                  ; 3127 _ C7. 44 24, 10, 000000B8(d)
        mov     dword [esp+0CH], ebx                    ; 312F _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 3133 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 3137 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 313B _ 89. 04 24
        call    paint_string                            ; 313E _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_328]                      ; 3143 _ A1, 000000AC(d)
        add     eax, 8                                  ; 3148 _ 83. C0, 08
        mov     dword [?_328], eax                      ; 314B _ A3, 000000AC(d)
        add     esp, 36                                 ; 3150 _ 83. C4, 24
        pop     ebx                                     ; 3153 _ 5B
        pop     ebp                                     ; 3154 _ 5D
        ret                                             ; 3155 _ C3
; c_console_putchar End of function

c_console_putstr:; Function begin
        push    ebp                                     ; 3156 _ 55
        mov     ebp, esp                                ; 3157 _ 89. E5
        sub     esp, 24                                 ; 3159 _ 83. EC, 18
        jmp     ?_147                                   ; 315C _ EB, 1D

?_146:  mov     eax, dword [ebp+8H]                     ; 315E _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3161 _ 0F B6. 00
        movsx   eax, al                                 ; 3164 _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 3167 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 316F _ 89. 04 24
        call    c_console_putchar                       ; 3172 _ E8, FFFFFFFC(rel)
        add     dword [ebp+8H], 1                       ; 3177 _ 83. 45, 08, 01
?_147:  mov     eax, dword [ebp+8H]                     ; 317B _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 317E _ 0F B6. 00
        test    al, al                                  ; 3181 _ 84. C0
        jnz     ?_146                                   ; 3183 _ 75, D9
        leave                                           ; 3185 _ C9
        ret                                             ; 3186 _ C3
; c_console_putstr End of function

kernel_api:; Function begin
        push    ebp                                     ; 3187 _ 55
        mov     ebp, esp                                ; 3188 _ 89. E5
        sub     esp, 24                                 ; 318A _ 83. EC, 18
        cmp     dword [ebp+1CH], 1                      ; 318D _ 83. 7D, 1C, 01
        jnz     ?_148                                   ; 3191 _ 75, 18
        mov     eax, dword [ebp+24H]                    ; 3193 _ 8B. 45, 24
        movsx   eax, al                                 ; 3196 _ 0F BE. C0
        mov     dword [esp+4H], 1                       ; 3199 _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 31A1 _ 89. 04 24
        call    c_console_putchar                       ; 31A4 _ E8, FFFFFFFC(rel)
        jmp     ?_149                                   ; 31A9 _ EB, 19

?_148:  cmp     dword [ebp+1CH], 2                      ; 31AB _ 83. 7D, 1C, 02
        jnz     ?_149                                   ; 31AF _ 75, 13
        mov     edx, dword [buffer]                     ; 31B1 _ 8B. 15, 000001D8(d)
        mov     eax, dword [ebp+18H]                    ; 31B7 _ 8B. 45, 18
        add     eax, edx                                ; 31BA _ 01. D0
        mov     dword [esp], eax                        ; 31BC _ 89. 04 24
        call    c_console_putstr                        ; 31BF _ E8, FFFFFFFC(rel)
?_149:  leave                                           ; 31C4 _ C9
        ret                                             ; 31C5 _ C3
; kernel_api End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 31C6 _ 55
        mov     ebp, esp                                ; 31C7 _ 89. E5
        sub     esp, 24                                 ; 31C9 _ 83. EC, 18
?_150:  mov     dword [esp], 100                        ; 31CC _ C7. 04 24, 00000064
        call    io_in8                                  ; 31D3 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 31D8 _ 83. E0, 02
        test    eax, eax                                ; 31DB _ 85. C0
        jnz     ?_151                                   ; 31DD _ 75, 02
        jmp     ?_152                                   ; 31DF _ EB, 02

?_151:  jmp     ?_150                                   ; 31E1 _ EB, E9

?_152:  leave                                           ; 31E3 _ C9
        ret                                             ; 31E4 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 31E5 _ 55
        mov     ebp, esp                                ; 31E6 _ 89. E5
        sub     esp, 24                                 ; 31E8 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 31EB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 31F0 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 31F8 _ C7. 04 24, 00000064
        call    io_out8                                 ; 31FF _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 3204 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 3209 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 3211 _ C7. 04 24, 00000060
        call    io_out8                                 ; 3218 _ E8, FFFFFFFC(rel)
        leave                                           ; 321D _ C9
        ret                                             ; 321E _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 321F _ 55
        mov     ebp, esp                                ; 3220 _ 89. E5
        sub     esp, 24                                 ; 3222 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 3225 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 322A _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 3232 _ C7. 04 24, 00000064
        call    io_out8                                 ; 3239 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 323E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 3243 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 324B _ C7. 04 24, 00000060
        call    io_out8                                 ; 3252 _ E8, FFFFFFFC(rel)
        leave                                           ; 3257 _ C9
        ret                                             ; 3258 _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 3259 _ 55
        mov     ebp, esp                                ; 325A _ 89. E5
        sub     esp, 4                                  ; 325C _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 325F _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 3262 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3265 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3268 _ 0F B6. 40, 03
        test    al, al                                  ; 326C _ 84. C0
        jnz     ?_154                                   ; 326E _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 3270 _ 80. 7D, FC, FA
        jnz     ?_153                                   ; 3274 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 3276 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 3279 _ C6. 40, 03, 01
?_153:  mov     eax, 0                                  ; 327D _ B8, 00000000
        jmp     ?_161                                   ; 3282 _ E9, 0000010F

?_154:  mov     eax, dword [ebp+8H]                     ; 3287 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 328A _ 0F B6. 40, 03
        cmp     al, 1                                   ; 328E _ 3C, 01
        jnz     ?_156                                   ; 3290 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 3292 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 3296 _ 25, 000000C8
        cmp     eax, 8                                  ; 329B _ 83. F8, 08
        jnz     ?_155                                   ; 329E _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 32A0 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 32A3 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 32A7 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 32A9 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 32AC _ C6. 40, 03, 02
?_155:  mov     eax, 0                                  ; 32B0 _ B8, 00000000
        jmp     ?_161                                   ; 32B5 _ E9, 000000DC

?_156:  mov     eax, dword [ebp+8H]                     ; 32BA _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 32BD _ 0F B6. 40, 03
        cmp     al, 2                                   ; 32C1 _ 3C, 02
        jnz     ?_157                                   ; 32C3 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 32C5 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 32C8 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 32CC _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 32CF _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 32D2 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 32D6 _ B8, 00000000
        jmp     ?_161                                   ; 32DB _ E9, 000000B6

?_157:  mov     eax, dword [ebp+8H]                     ; 32E0 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 32E3 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 32E7 _ 3C, 03
        jne     ?_160                                   ; 32E9 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 32EF _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 32F2 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 32F6 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 32F9 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 32FC _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 3300 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3303 _ 0F B6. 00
        movzx   eax, al                                 ; 3306 _ 0F B6. C0
        and     eax, 07H                                ; 3309 _ 83. E0, 07
        mov     edx, eax                                ; 330C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 330E _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3311 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3314 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 3317 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 331B _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 331E _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3321 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3324 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 3327 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 332B _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 332E _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3331 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3334 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3337 _ 0F B6. 00
        movzx   eax, al                                 ; 333A _ 0F B6. C0
        and     eax, 10H                                ; 333D _ 83. E0, 10
        test    eax, eax                                ; 3340 _ 85. C0
        jz      ?_158                                   ; 3342 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 3344 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3347 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 334A _ 0D, FFFFFF00
        mov     edx, eax                                ; 334F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3351 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3354 _ 89. 50, 04
?_158:  mov     eax, dword [ebp+8H]                     ; 3357 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 335A _ 0F B6. 00
        movzx   eax, al                                 ; 335D _ 0F B6. C0
        and     eax, 20H                                ; 3360 _ 83. E0, 20
        test    eax, eax                                ; 3363 _ 85. C0
        jz      ?_159                                   ; 3365 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 3367 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 336A _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 336D _ 0D, FFFFFF00
        mov     edx, eax                                ; 3372 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3374 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3377 _ 89. 50, 08
?_159:  mov     eax, dword [ebp+8H]                     ; 337A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 337D _ 8B. 40, 08
        neg     eax                                     ; 3380 _ F7. D8
        mov     edx, eax                                ; 3382 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3384 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3387 _ 89. 50, 08
        mov     eax, 1                                  ; 338A _ B8, 00000001
        jmp     ?_161                                   ; 338F _ EB, 05

?_160:  mov     eax, 4294967295                         ; 3391 _ B8, FFFFFFFF
?_161:  leave                                           ; 3396 _ C9
        ret                                             ; 3397 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 3398 _ 55
        mov     ebp, esp                                ; 3399 _ 89. E5
        sub     esp, 40                                 ; 339B _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 339E _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 33A6 _ C7. 04 24, 00000020
        call    io_out8                                 ; 33AD _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 33B2 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 33BA _ C7. 04 24, 000000A0
        call    io_out8                                 ; 33C1 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 33C6 _ C7. 04 24, 00000060
        call    io_in8                                  ; 33CD _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 33D2 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 33D5 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 33D9 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 33DD _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 33E4 _ E8, FFFFFFFC(rel)
        leave                                           ; 33E9 _ C9
        ret                                             ; 33EA _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 33EB _ 55
        mov     ebp, esp                                ; 33EC _ 89. E5
        sub     esp, 40                                 ; 33EE _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 33F1 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 33F9 _ C7. 04 24, 00000020
        call    io_out8                                 ; 3400 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 3405 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 340D _ C7. 04 24, 000000A0
        call    io_out8                                 ; 3414 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 3419 _ C7. 04 24, 00000060
        call    io_in8                                  ; 3420 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 3425 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 3428 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 342C _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 3430 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 3437 _ E8, FFFFFFFC(rel)
        leave                                           ; 343C _ C9
        ret                                             ; 343D _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 343E _ 55
        mov     ebp, esp                                ; 343F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3441 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3444 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 3447 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3449 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 344C _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 3453 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 3456 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 345D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3460 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 3463 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3466 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3469 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 346C _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 346F _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 3472 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 3479 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 347C _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 347F _ 89. 50, 18
        pop     ebp                                     ; 3482 _ 5D
        ret                                             ; 3483 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 3484 _ 55
        mov     ebp, esp                                ; 3485 _ 89. E5
        sub     esp, 40                                 ; 3487 _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 348A _ 8B. 45, 0C
        mov     byte [ebp-1CH], al                      ; 348D _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 3490 _ 83. 7D, 08, 00
        jnz     ?_162                                   ; 3494 _ 75, 0A
        mov     eax, 4294967295                         ; 3496 _ B8, FFFFFFFF
        jmp     ?_166                                   ; 349B _ E9, 000000B1

?_162:  mov     eax, dword [ebp+8H]                     ; 34A0 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 34A3 _ 8B. 40, 10
        test    eax, eax                                ; 34A6 _ 85. C0
        jnz     ?_163                                   ; 34A8 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 34AA _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 34AD _ 8B. 40, 14
        or      eax, 01H                                ; 34B0 _ 83. C8, 01
        mov     edx, eax                                ; 34B3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34B5 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 34B8 _ 89. 50, 14
        mov     eax, 4294967295                         ; 34BB _ B8, FFFFFFFF
        jmp     ?_166                                   ; 34C0 _ E9, 0000008C

?_163:  mov     eax, dword [ebp+8H]                     ; 34C5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 34C8 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 34CB _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 34CE _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 34D1 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 34D3 _ 8B. 45, F4
        add     edx, eax                                ; 34D6 _ 01. C2
        movzx   eax, byte [ebp-1CH]                     ; 34D8 _ 0F B6. 45, E4
        mov     byte [edx], al                          ; 34DC _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 34DE _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 34E1 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 34E4 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 34E7 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 34EA _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 34ED _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 34F0 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 34F3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 34F6 _ 8B. 40, 0C
        cmp     edx, eax                                ; 34F9 _ 39. C2
        jnz     ?_164                                   ; 34FB _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 34FD _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3500 _ C7. 40, 04, 00000000
?_164:  mov     eax, dword [ebp+8H]                     ; 3507 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 350A _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 350D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3510 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 3513 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 3516 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 3519 _ 8B. 40, 18
        test    eax, eax                                ; 351C _ 85. C0
        jz      ?_165                                   ; 351E _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 3520 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 3523 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 3526 _ 8B. 40, 04
        cmp     eax, 2                                  ; 3529 _ 83. F8, 02
        jz      ?_165                                   ; 352C _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 352E _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 3531 _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 3534 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 353C _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 3544 _ 89. 04 24
        call    task_run                                ; 3547 _ E8, FFFFFFFC(rel)
?_165:  mov     eax, 0                                  ; 354C _ B8, 00000000
?_166:  leave                                           ; 3551 _ C9
        ret                                             ; 3552 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 3553 _ 55
        mov     ebp, esp                                ; 3554 _ 89. E5
        sub     esp, 16                                 ; 3556 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 3559 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 355C _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 355F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3562 _ 8B. 40, 0C
        cmp     edx, eax                                ; 3565 _ 39. C2
        jnz     ?_167                                   ; 3567 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 3569 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 356C _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 3573 _ B8, FFFFFFFF
        jmp     ?_169                                   ; 3578 _ EB, 57

?_167:  mov     eax, dword [ebp+8H]                     ; 357A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 357D _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 3580 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 3583 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 3586 _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 3588 _ 8B. 45, F8
        add     eax, edx                                ; 358B _ 01. D0
        movzx   eax, byte [eax]                         ; 358D _ 0F B6. 00
        movzx   eax, al                                 ; 3590 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 3593 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3596 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3599 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 359C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 359F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 35A2 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 35A5 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 35A8 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 35AB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 35AE _ 8B. 40, 0C
        cmp     edx, eax                                ; 35B1 _ 39. C2
        jnz     ?_168                                   ; 35B3 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 35B5 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 35B8 _ C7. 40, 08, 00000000
?_168:  mov     eax, dword [ebp+8H]                     ; 35BF _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 35C2 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 35C5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 35C8 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 35CB _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 35CE _ 8B. 45, FC
?_169:  leave                                           ; 35D1 _ C9
        ret                                             ; 35D2 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 35D3 _ 55
        mov     ebp, esp                                ; 35D4 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 35D6 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 35D9 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 35DC _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 35DF _ 8B. 40, 10
        sub     edx, eax                                ; 35E2 _ 29. C2
        mov     eax, edx                                ; 35E4 _ 89. D0
        pop     ebp                                     ; 35E6 _ 5D
        ret                                             ; 35E7 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 35E8 _ 55
        mov     ebp, esp                                ; 35E9 _ 89. E5
        sub     esp, 4                                  ; 35EB _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 35EE _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 35F1 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 35F4 _ 80. 7D, FC, 09
        jle     ?_170                                   ; 35F8 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 35FA _ 0F B6. 45, FC
        add     eax, 55                                 ; 35FE _ 83. C0, 37
        jmp     ?_171                                   ; 3601 _ EB, 07

?_170:  movzx   eax, byte [ebp-4H]                      ; 3603 _ 0F B6. 45, FC
        add     eax, 48                                 ; 3607 _ 83. C0, 30
?_171:  leave                                           ; 360A _ C9
        ret                                             ; 360B _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 360C _ 55
        mov     ebp, esp                                ; 360D _ 89. E5
        sub     esp, 24                                 ; 360F _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 3612 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 3615 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 3618 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 361F _ 0F B6. 45, EC
        and     eax, 0FH                                ; 3623 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 3626 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 3629 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 362D _ 89. 04 24
        call    charToHexVal                            ; 3630 _ E8, FFFFFFFC(rel)
        mov     byte [?_325], al                        ; 3635 _ A2, 00000343(d)
        movzx   eax, byte [ebp-14H]                     ; 363A _ 0F B6. 45, EC
        shr     al, 4                                   ; 363E _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 3641 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 3644 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 3648 _ 0F BE. C0
        mov     dword [esp], eax                        ; 364B _ 89. 04 24
        call    charToHexVal                            ; 364E _ E8, FFFFFFFC(rel)
        mov     byte [?_324], al                        ; 3653 _ A2, 00000342(d)
        mov     eax, keyval                             ; 3658 _ B8, 00000340(d)
        leave                                           ; 365D _ C9
        ret                                             ; 365E _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 365F _ 55
        mov     ebp, esp                                ; 3660 _ 89. E5
        sub     esp, 16                                 ; 3662 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 3665 _ C6. 05, 000002E0(d), 30
        mov     byte [?_334], 88                        ; 366C _ C6. 05, 000002E1(d), 58
        mov     byte [?_335], 0                         ; 3673 _ C6. 05, 000002EA(d), 00
        mov     dword [ebp-0CH], 2                      ; 367A _ C7. 45, F4, 00000002
        jmp     ?_173                                   ; 3681 _ EB, 0F

?_172:  mov     eax, dword [ebp-0CH]                    ; 3683 _ 8B. 45, F4
        add     eax, str.1386                           ; 3686 _ 05, 000002E0(d)
        mov     byte [eax], 48                          ; 368B _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 368E _ 83. 45, F4, 01
?_173:  cmp     dword [ebp-0CH], 9                      ; 3692 _ 83. 7D, F4, 09
        jle     ?_172                                   ; 3696 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 3698 _ C7. 45, F8, 00000009
        jmp     ?_177                                   ; 369F _ EB, 40

?_174:  mov     eax, dword [ebp+8H]                     ; 36A1 _ 8B. 45, 08
        and     eax, 0FH                                ; 36A4 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 36A7 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 36AA _ 8B. 45, 08
        shr     eax, 4                                  ; 36AD _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 36B0 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 36B3 _ 83. 7D, FC, 09
        jle     ?_175                                   ; 36B7 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 36B9 _ 8B. 45, FC
        add     eax, 55                                 ; 36BC _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 36BF _ 8B. 55, F8
        add     edx, str.1386                           ; 36C2 _ 81. C2, 000002E0(d)
        mov     byte [edx], al                          ; 36C8 _ 88. 02
        jmp     ?_176                                   ; 36CA _ EB, 11

?_175:  mov     eax, dword [ebp-4H]                     ; 36CC _ 8B. 45, FC
        add     eax, 48                                 ; 36CF _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 36D2 _ 8B. 55, F8
        add     edx, str.1386                           ; 36D5 _ 81. C2, 000002E0(d)
        mov     byte [edx], al                          ; 36DB _ 88. 02
?_176:  sub     dword [ebp-8H], 1                       ; 36DD _ 83. 6D, F8, 01
?_177:  cmp     dword [ebp-8H], 1                       ; 36E1 _ 83. 7D, F8, 01
        jle     ?_178                                   ; 36E5 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 36E7 _ 83. 7D, 08, 00
        jnz     ?_174                                   ; 36EB _ 75, B4
?_178:  mov     eax, str.1386                           ; 36ED _ B8, 000002E0(d)
        leave                                           ; 36F2 _ C9
        ret                                             ; 36F3 _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 36F4 _ 55
        mov     ebp, esp                                ; 36F5 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 36F7 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 36FA _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 3700 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3703 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 370A _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 370D _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 3714 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 3717 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 371E _ 5D
        ret                                             ; 371F _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 3720 _ 55
        mov     ebp, esp                                ; 3721 _ 89. E5
        sub     esp, 16                                 ; 3723 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3726 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 372D _ C7. 45, F8, 00000000
        jmp     ?_180                                   ; 3734 _ EB, 14

?_179:  mov     eax, dword [ebp+8H]                     ; 3736 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3739 _ 8B. 55, F8
        add     edx, 2                                  ; 373C _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 373F _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 3743 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 3746 _ 83. 45, F8, 01
?_180:  mov     eax, dword [ebp+8H]                     ; 374A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 374D _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 374F _ 3B. 45, F8
        ja      ?_179                                   ; 3752 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 3754 _ 8B. 45, FC
        leave                                           ; 3757 _ C9
        ret                                             ; 3758 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 3759 _ 55
        mov     ebp, esp                                ; 375A _ 89. E5
        sub     esp, 16                                 ; 375C _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 375F _ C7. 45, F8, 00000000
        jmp     ?_184                                   ; 3766 _ E9, 00000085

?_181:  mov     eax, dword [ebp+8H]                     ; 376B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 376E _ 8B. 55, F8
        add     edx, 2                                  ; 3771 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3774 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 3778 _ 3B. 45, 0C
        jc      ?_183                                   ; 377B _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 377D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3780 _ 8B. 55, F8
        add     edx, 2                                  ; 3783 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3786 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 3789 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 378C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 378F _ 8B. 55, F8
        add     edx, 2                                  ; 3792 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 3795 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 3798 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 379B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 379E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 37A1 _ 8B. 55, F8
        add     edx, 2                                  ; 37A4 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 37A7 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 37AA _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 37AD _ 8B. 55, F8
        add     edx, 2                                  ; 37B0 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 37B3 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 37B7 _ 2B. 45, 0C
        mov     edx, eax                                ; 37BA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 37BC _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 37BF _ 8B. 4D, F8
        add     ecx, 2                                  ; 37C2 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 37C5 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 37C9 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 37CC _ 8B. 55, F8
        add     edx, 2                                  ; 37CF _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 37D2 _ 8B. 44 D0, 04
        test    eax, eax                                ; 37D6 _ 85. C0
        jnz     ?_182                                   ; 37D8 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 37DA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 37DD _ 8B. 00
        lea     edx, [eax-1H]                           ; 37DF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 37E2 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 37E5 _ 89. 10
?_182:  mov     eax, dword [ebp-4H]                     ; 37E7 _ 8B. 45, FC
        jmp     ?_185                                   ; 37EA _ EB, 17

?_183:  add     dword [ebp-8H], 1                       ; 37EC _ 83. 45, F8, 01
?_184:  mov     eax, dword [ebp+8H]                     ; 37F0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 37F3 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 37F5 _ 3B. 45, F8
        ja      ?_181                                   ; 37F8 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 37FE _ B8, 00000000
?_185:  leave                                           ; 3803 _ C9
        ret                                             ; 3804 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 3805 _ 55
        mov     ebp, esp                                ; 3806 _ 89. E5
        push    ebx                                     ; 3808 _ 53
        sub     esp, 16                                 ; 3809 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 380C _ C7. 45, F4, 00000000
        jmp     ?_188                                   ; 3813 _ EB, 17

?_186:  mov     eax, dword [ebp+8H]                     ; 3815 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3818 _ 8B. 55, F4
        add     edx, 2                                  ; 381B _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 381E _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 3821 _ 3B. 45, 0C
        jbe     ?_187                                   ; 3824 _ 76, 02
        jmp     ?_189                                   ; 3826 _ EB, 0E

?_187:  add     dword [ebp-0CH], 1                      ; 3828 _ 83. 45, F4, 01
?_188:  mov     eax, dword [ebp+8H]                     ; 382C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 382F _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3831 _ 3B. 45, F4
        jg      ?_186                                   ; 3834 _ 7F, DF
?_189:  cmp     dword [ebp-0CH], 0                      ; 3836 _ 83. 7D, F4, 00
        jle     ?_191                                   ; 383A _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 3840 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3843 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3846 _ 8B. 45, 08
        add     edx, 2                                  ; 3849 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 384C _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 384F _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3852 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 3855 _ 8B. 45, 08
        add     ecx, 2                                  ; 3858 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 385B _ 8B. 44 C8, 04
        add     eax, edx                                ; 385F _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 3861 _ 3B. 45, 0C
        jne     ?_191                                   ; 3864 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 386A _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 386D _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 3870 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3873 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3876 _ 8B. 45, 08
        add     edx, 2                                  ; 3879 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 387C _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 3880 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 3883 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3886 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 3889 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 388C _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 3890 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3893 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3895 _ 3B. 45, F4
        jle     ?_190                                   ; 3898 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 389A _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 389D _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 38A0 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 38A3 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 38A6 _ 8B. 55, F4
        add     edx, 2                                  ; 38A9 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 38AC _ 8B. 04 D0
        cmp     ecx, eax                                ; 38AF _ 39. C1
        jnz     ?_190                                   ; 38B1 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 38B3 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 38B6 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 38B9 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 38BC _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 38BF _ 8B. 45, 08
        add     edx, 2                                  ; 38C2 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 38C5 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 38C9 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 38CC _ 8B. 4D, F4
        add     ecx, 2                                  ; 38CF _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 38D2 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 38D6 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 38D9 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 38DC _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 38DF _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 38E3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 38E6 _ 8B. 00
        lea     edx, [eax-1H]                           ; 38E8 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 38EB _ 8B. 45, 08
        mov     dword [eax], edx                        ; 38EE _ 89. 10
?_190:  mov     eax, 0                                  ; 38F0 _ B8, 00000000
        jmp     ?_197                                   ; 38F5 _ E9, 0000011C

?_191:  mov     eax, dword [ebp+8H]                     ; 38FA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 38FD _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 38FF _ 3B. 45, F4
        jle     ?_192                                   ; 3902 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 3904 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 3907 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 390A _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 390D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3910 _ 8B. 55, F4
        add     edx, 2                                  ; 3913 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3916 _ 8B. 04 D0
        cmp     ecx, eax                                ; 3919 _ 39. C1
        jnz     ?_192                                   ; 391B _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 391D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3920 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3923 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3926 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 3929 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 392C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 392F _ 8B. 55, F4
        add     edx, 2                                  ; 3932 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3935 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 3939 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 393C _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 393F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3942 _ 8B. 55, F4
        add     edx, 2                                  ; 3945 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3948 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 394C _ B8, 00000000
        jmp     ?_197                                   ; 3951 _ E9, 000000C0

?_192:  mov     eax, dword [ebp+8H]                     ; 3956 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3959 _ 8B. 00
        cmp     eax, 4095                               ; 395B _ 3D, 00000FFF
        jg      ?_196                                   ; 3960 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 3966 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3969 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 396B _ 89. 45, F8
        jmp     ?_194                                   ; 396E _ EB, 28

?_193:  mov     eax, dword [ebp-8H]                     ; 3970 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 3973 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 3976 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 3979 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 397C _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 397F _ 8B. 45, 08
        add     edx, 2                                  ; 3982 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 3985 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 3988 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 398A _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 398D _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 3990 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 3994 _ 83. 6D, F8, 01
?_194:  mov     eax, dword [ebp-8H]                     ; 3998 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 399B _ 3B. 45, F4
        jg      ?_193                                   ; 399E _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 39A0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 39A3 _ 8B. 00
        lea     edx, [eax+1H]                           ; 39A5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 39A8 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 39AB _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 39AD _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 39B0 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 39B3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 39B6 _ 8B. 00
        cmp     edx, eax                                ; 39B8 _ 39. C2
        jge     ?_195                                   ; 39BA _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 39BC _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 39BF _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 39C1 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 39C4 _ 89. 50, 04
?_195:  mov     eax, dword [ebp+8H]                     ; 39C7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 39CA _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 39CD _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 39D0 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 39D3 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 39D6 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 39D9 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 39DC _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 39DF _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 39E2 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 39E6 _ B8, 00000000
        jmp     ?_197                                   ; 39EB _ EB, 29

?_196:  mov     eax, dword [ebp+8H]                     ; 39ED _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 39F0 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 39F3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 39F6 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 39F9 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 39FC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 39FF _ 8B. 40, 08
        mov     edx, eax                                ; 3A02 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3A04 _ 8B. 45, 10
        add     eax, edx                                ; 3A07 _ 01. D0
        mov     edx, eax                                ; 3A09 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3A0B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3A0E _ 89. 50, 08
        mov     eax, 4294967295                         ; 3A11 _ B8, FFFFFFFF
?_197:  add     esp, 16                                 ; 3A16 _ 83. C4, 10
        pop     ebx                                     ; 3A19 _ 5B
        pop     ebp                                     ; 3A1A _ 5D
        ret                                             ; 3A1B _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 3A1C _ 55
        mov     ebp, esp                                ; 3A1D _ 89. E5
        sub     esp, 24                                 ; 3A1F _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 3A22 _ 8B. 45, 0C
        add     eax, 4095                               ; 3A25 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 3A2A _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 3A2F _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 3A32 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3A35 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3A39 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3A3C _ 89. 04 24
        call    memman_alloc                            ; 3A3F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 3A44 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3A47 _ 8B. 45, FC
        leave                                           ; 3A4A _ C9
        ret                                             ; 3A4B _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 3A4C _ 55
        mov     ebp, esp                                ; 3A4D _ 89. E5
        sub     esp, 28                                 ; 3A4F _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 3A52 _ 8B. 45, 10
        add     eax, 4095                               ; 3A55 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 3A5A _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 3A5F _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 3A62 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 3A65 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3A69 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3A6C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3A70 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3A73 _ 89. 04 24
        call    memman_free                             ; 3A76 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 3A7B _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3A7E _ 8B. 45, FC
        leave                                           ; 3A81 _ C9
        ret                                             ; 3A82 _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 3A83 _ 55
        mov     ebp, esp                                ; 3A84 _ 89. E5
        sub     esp, 40                                 ; 3A86 _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 3A89 _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 3A91 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3A94 _ 89. 04 24
        call    memman_alloc_4k                         ; 3A97 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3A9C _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 3A9F _ 83. 7D, F4, 00
        jnz     ?_198                                   ; 3AA3 _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 3AA5 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 3AA8 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 3AB0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3AB4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3AB7 _ 89. 04 24
        call    memman_free_4k                          ; 3ABA _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3ABF _ B8, 00000000
        jmp     ?_202                                   ; 3AC4 _ E9, 0000009D

?_198:  mov     eax, dword [ebp-0CH]                    ; 3AC9 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 3ACC _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3ACF _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 3AD1 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 3AD4 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 3AD7 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3ADA _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 3ADD _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3AE0 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3AE3 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 3AE6 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 3AED _ C7. 45, F0, 00000000
        jmp     ?_200                                   ; 3AF4 _ EB, 1B

?_199:  mov     eax, dword [ebp-0CH]                    ; 3AF6 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 3AF9 _ 8B. 55, F0
        add     edx, 33                                 ; 3AFC _ 83. C2, 21
        shl     edx, 5                                  ; 3AFF _ C1. E2, 05
        add     eax, edx                                ; 3B02 _ 01. D0
        add     eax, 16                                 ; 3B04 _ 83. C0, 10
        mov     dword [eax], 0                          ; 3B07 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 3B0D _ 83. 45, F0, 01
?_200:  cmp     dword [ebp-10H], 255                    ; 3B11 _ 81. 7D, F0, 000000FF
        jle     ?_199                                   ; 3B18 _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 3B1A _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 3B1D _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 3B21 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3B25 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B28 _ 89. 04 24
        call    memman_alloc_4k                         ; 3B2B _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 3B30 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3B32 _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 3B35 _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 3B38 _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 3B3B _ 8B. 40, 10
        test    eax, eax                                ; 3B3E _ 85. C0
        jnz     ?_201                                   ; 3B40 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 3B42 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 3B45 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 3B4D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3B51 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B54 _ 89. 04 24
        call    memman_free_4k                          ; 3B57 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3B5C _ B8, 00000000
        jmp     ?_202                                   ; 3B61 _ EB, 03

?_201:  mov     eax, dword [ebp-0CH]                    ; 3B63 _ 8B. 45, F4
?_202:  leave                                           ; 3B66 _ C9
        ret                                             ; 3B67 _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 3B68 _ 55
        mov     ebp, esp                                ; 3B69 _ 89. E5
        sub     esp, 16                                 ; 3B6B _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3B6E _ C7. 45, F8, 00000000
        jmp     ?_205                                   ; 3B75 _ EB, 5B

?_203:  mov     eax, dword [ebp+8H]                     ; 3B77 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3B7A _ 8B. 55, F8
        add     edx, 33                                 ; 3B7D _ 83. C2, 21
        shl     edx, 5                                  ; 3B80 _ C1. E2, 05
        add     eax, edx                                ; 3B83 _ 01. D0
        add     eax, 16                                 ; 3B85 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 3B88 _ 8B. 00
        test    eax, eax                                ; 3B8A _ 85. C0
        jnz     ?_204                                   ; 3B8C _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 3B8E _ 8B. 45, F8
        shl     eax, 5                                  ; 3B91 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 3B94 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 3B9A _ 8B. 45, 08
        add     eax, edx                                ; 3B9D _ 01. D0
        add     eax, 4                                  ; 3B9F _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 3BA2 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3BA5 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3BA8 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 3BAB _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 3BAE _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 3BB1 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 3BB5 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 3BB8 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 3BBF _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 3BC2 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 3BC9 _ 8B. 45, FC
        jmp     ?_206                                   ; 3BCC _ EB, 12

?_204:  add     dword [ebp-8H], 1                       ; 3BCE _ 83. 45, F8, 01
?_205:  cmp     dword [ebp-8H], 255                     ; 3BD2 _ 81. 7D, F8, 000000FF
        jle     ?_203                                   ; 3BD9 _ 7E, 9C
        mov     eax, 0                                  ; 3BDB _ B8, 00000000
?_206:  leave                                           ; 3BE0 _ C9
        ret                                             ; 3BE1 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 3BE2 _ 55
        mov     ebp, esp                                ; 3BE3 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3BE5 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3BE8 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3BEB _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3BED _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3BF0 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 3BF3 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3BF6 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 3BF9 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3BFC _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3BFF _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 3C02 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 3C05 _ 89. 50, 14
        pop     ebp                                     ; 3C08 _ 5D
        ret                                             ; 3C09 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 3C0A _ 55
        mov     ebp, esp                                ; 3C0B _ 89. E5
        push    esi                                     ; 3C0D _ 56
        push    ebx                                     ; 3C0E _ 53
        sub     esp, 48                                 ; 3C0F _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 3C12 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3C15 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 3C18 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3C1B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3C1E _ 8B. 40, 0C
        add     eax, 1                                  ; 3C21 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 3C24 _ 3B. 45, 10
        jge     ?_207                                   ; 3C27 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 3C29 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3C2C _ 8B. 40, 0C
        add     eax, 1                                  ; 3C2F _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 3C32 _ 89. 45, 10
?_207:  cmp     dword [ebp+10H], -1                     ; 3C35 _ 83. 7D, 10, FF
        jge     ?_208                                   ; 3C39 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 3C3B _ C7. 45, 10, FFFFFFFF
?_208:  mov     eax, dword [ebp+0CH]                    ; 3C42 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3C45 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 3C48 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 3C4B _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3C4E _ 3B. 45, 10
        jle     ?_215                                   ; 3C51 _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 3C57 _ 83. 7D, 10, 00
        js      ?_211                                   ; 3C5B _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 3C61 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3C64 _ 89. 45, F0
        jmp     ?_210                                   ; 3C67 _ EB, 34

?_209:  mov     eax, dword [ebp-10H]                    ; 3C69 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3C6C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3C6F _ 8B. 45, 08
        add     edx, 4                                  ; 3C72 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3C75 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3C79 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3C7C _ 8B. 4D, F0
        add     ecx, 4                                  ; 3C7F _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3C82 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3C86 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3C89 _ 8B. 55, F0
        add     edx, 4                                  ; 3C8C _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3C8F _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3C93 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3C96 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 3C99 _ 83. 6D, F0, 01
?_210:  mov     eax, dword [ebp-10H]                    ; 3C9D _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3CA0 _ 3B. 45, 10
        jg      ?_209                                   ; 3CA3 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 3CA5 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3CA8 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3CAB _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3CAE _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3CB1 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 3CB5 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3CB8 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3CBB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3CBE _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3CC1 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3CC4 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3CC7 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3CCA _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3CCD _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3CD0 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3CD3 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3CD6 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3CD9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3CDC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3CDF _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3CE2 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 3CE5 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3CE9 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3CED _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3CF1 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3CF5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3CF9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3CFC _ 89. 04 24
        call    sheet_refresh_map                       ; 3CFF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3D04 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3D07 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3D0A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3D0D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3D10 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3D13 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3D16 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3D19 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3D1C _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3D1F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3D22 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3D25 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3D28 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3D2B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3D2E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3D31 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 3D34 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3D38 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3D3C _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3D40 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3D44 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3D48 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3D4B _ 89. 04 24
        call    sheet_refresh_local                     ; 3D4E _ E8, FFFFFFFC(rel)
        jmp     ?_222                                   ; 3D53 _ E9, 0000026C

?_211:  mov     eax, dword [ebp+8H]                     ; 3D58 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3D5B _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 3D5E _ 3B. 45, F4
        jle     ?_214                                   ; 3D61 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 3D63 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3D66 _ 89. 45, F0
        jmp     ?_213                                   ; 3D69 _ EB, 34

?_212:  mov     eax, dword [ebp-10H]                    ; 3D6B _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3D6E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3D71 _ 8B. 45, 08
        add     edx, 4                                  ; 3D74 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3D77 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3D7B _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3D7E _ 8B. 4D, F0
        add     ecx, 4                                  ; 3D81 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3D84 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3D88 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3D8B _ 8B. 55, F0
        add     edx, 4                                  ; 3D8E _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3D91 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3D95 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3D98 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 3D9B _ 83. 45, F0, 01
?_213:  mov     eax, dword [ebp+8H]                     ; 3D9F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3DA2 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 3DA5 _ 3B. 45, F0
        jg      ?_212                                   ; 3DA8 _ 7F, C1
?_214:  mov     eax, dword [ebp+8H]                     ; 3DAA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3DAD _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 3DB0 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3DB3 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3DB6 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3DB9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3DBC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3DBF _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3DC2 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3DC5 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3DC8 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3DCB _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3DCE _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3DD1 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3DD4 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3DD7 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3DDA _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3DDD _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3DE0 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 3DE3 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3DEB _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3DEF _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3DF3 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3DF7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3DFB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3DFE _ 89. 04 24
        call    sheet_refresh_map                       ; 3E01 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3E06 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3E09 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3E0C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3E0F _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3E12 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3E15 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3E18 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3E1B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3E1E _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3E21 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3E24 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3E27 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3E2A _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3E2D _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 3E30 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3E38 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3E3C _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3E40 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3E44 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3E48 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3E4B _ 89. 04 24
        call    sheet_refresh_local                     ; 3E4E _ E8, FFFFFFFC(rel)
        jmp     ?_222                                   ; 3E53 _ E9, 0000016C

?_215:  mov     eax, dword [ebp-0CH]                    ; 3E58 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3E5B _ 3B. 45, 10
        jge     ?_222                                   ; 3E5E _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 3E64 _ 83. 7D, F4, 00
        js      ?_218                                   ; 3E68 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 3E6A _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3E6D _ 89. 45, F0
        jmp     ?_217                                   ; 3E70 _ EB, 34

?_216:  mov     eax, dword [ebp-10H]                    ; 3E72 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3E75 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3E78 _ 8B. 45, 08
        add     edx, 4                                  ; 3E7B _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3E7E _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3E82 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3E85 _ 8B. 4D, F0
        add     ecx, 4                                  ; 3E88 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3E8B _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3E8F _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3E92 _ 8B. 55, F0
        add     edx, 4                                  ; 3E95 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3E98 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3E9C _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3E9F _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 3EA2 _ 83. 45, F0, 01
?_217:  mov     eax, dword [ebp-10H]                    ; 3EA6 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3EA9 _ 3B. 45, 10
        jl      ?_216                                   ; 3EAC _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 3EAE _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3EB1 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3EB4 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3EB7 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3EBA _ 89. 54 88, 04
        jmp     ?_221                                   ; 3EBE _ EB, 6C

?_218:  mov     eax, dword [ebp+8H]                     ; 3EC0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3EC3 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 3EC6 _ 89. 45, F0
        jmp     ?_220                                   ; 3EC9 _ EB, 3A

?_219:  mov     eax, dword [ebp-10H]                    ; 3ECB _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 3ECE _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 3ED1 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3ED4 _ 8B. 55, F0
        add     edx, 4                                  ; 3ED7 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3EDA _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3EDE _ 8B. 45, 08
        add     ecx, 4                                  ; 3EE1 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3EE4 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 3EE8 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3EEB _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3EEE _ 8B. 45, 08
        add     edx, 4                                  ; 3EF1 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3EF4 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3EF8 _ 8B. 55, F0
        add     edx, 1                                  ; 3EFB _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 3EFE _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 3F01 _ 83. 6D, F0, 01
?_220:  mov     eax, dword [ebp-10H]                    ; 3F05 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3F08 _ 3B. 45, 10
        jge     ?_219                                   ; 3F0B _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 3F0D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3F10 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3F13 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3F16 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3F19 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3F1D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3F20 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 3F23 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3F26 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3F29 _ 89. 50, 0C
?_221:  mov     eax, dword [ebp+0CH]                    ; 3F2C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3F2F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3F32 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3F35 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3F38 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3F3B _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3F3E _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3F41 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3F44 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3F47 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3F4A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3F4D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3F50 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3F53 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 3F56 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3F59 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3F5D _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3F61 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3F65 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3F69 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3F6D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3F70 _ 89. 04 24
        call    sheet_refresh_map                       ; 3F73 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3F78 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3F7B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3F7E _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3F81 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3F84 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3F87 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3F8A _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3F8D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3F90 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3F93 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3F96 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3F99 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3F9C _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3F9F _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 3FA2 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3FA5 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3FA9 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3FAD _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3FB1 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3FB5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3FB9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3FBC _ 89. 04 24
        call    sheet_refresh_local                     ; 3FBF _ E8, FFFFFFFC(rel)
?_222:  add     esp, 48                                 ; 3FC4 _ 83. C4, 30
        pop     ebx                                     ; 3FC7 _ 5B
        pop     esi                                     ; 3FC8 _ 5E
        pop     ebp                                     ; 3FC9 _ 5D
        ret                                             ; 3FCA _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 3FCB _ 55
        mov     ebp, esp                                ; 3FCC _ 89. E5
        push    edi                                     ; 3FCE _ 57
        push    esi                                     ; 3FCF _ 56
        push    ebx                                     ; 3FD0 _ 53
        sub     esp, 44                                 ; 3FD1 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 3FD4 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3FD7 _ 8B. 40, 18
        test    eax, eax                                ; 3FDA _ 85. C0
        js      ?_223                                   ; 3FDC _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 3FDE _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3FE1 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 3FE4 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 3FE7 _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 3FEA _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 3FED _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 3FF0 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 3FF3 _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 3FF6 _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 3FF9 _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 3FFC _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 3FFF _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 4002 _ 8B. 55, 14
        add     ecx, edx                                ; 4005 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 4007 _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 400A _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 400D _ 8B. 55, 10
        add     edx, edi                                ; 4010 _ 01. FA
        mov     dword [esp+14H], eax                    ; 4012 _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 4016 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 401A _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 401E _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 4022 _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 4026 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4029 _ 89. 04 24
        call    sheet_refresh_local                     ; 402C _ E8, FFFFFFFC(rel)
?_223:  mov     eax, 0                                  ; 4031 _ B8, 00000000
        add     esp, 44                                 ; 4036 _ 83. C4, 2C
        pop     ebx                                     ; 4039 _ 5B
        pop     esi                                     ; 403A _ 5E
        pop     edi                                     ; 403B _ 5F
        pop     ebp                                     ; 403C _ 5D
        ret                                             ; 403D _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 403E _ 55
        mov     ebp, esp                                ; 403F _ 89. E5
        push    ebx                                     ; 4041 _ 53
        sub     esp, 52                                 ; 4042 _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 4045 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 4048 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 404B _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 404E _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 4051 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 4054 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 4057 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 405A _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 405D _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 4060 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 4063 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 4066 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 4069 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 406C _ 8B. 40, 18
        test    eax, eax                                ; 406F _ 85. C0
        js      ?_224                                   ; 4071 _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 4077 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 407A _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 407D _ 8B. 45, F4
        add     edx, eax                                ; 4080 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4082 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 4085 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 4088 _ 8B. 45, F0
        add     eax, ecx                                ; 408B _ 01. C8
        mov     dword [esp+14H], 0                      ; 408D _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 4095 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 4099 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 409D _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 40A0 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 40A4 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 40A7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 40AB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 40AE _ 89. 04 24
        call    sheet_refresh_map                       ; 40B1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 40B6 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 40B9 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 40BC _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 40BF _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 40C2 _ 8B. 55, 14
        add     ecx, edx                                ; 40C5 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 40C7 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 40CA _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 40CD _ 8B. 55, 10
        add     edx, ebx                                ; 40D0 _ 01. DA
        mov     dword [esp+14H], eax                    ; 40D2 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 40D6 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 40DA _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 40DE _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 40E1 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 40E5 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 40E8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 40EC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 40EF _ 89. 04 24
        call    sheet_refresh_map                       ; 40F2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 40F7 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 40FA _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 40FD _ 8B. 45, F4
        add     edx, eax                                ; 4100 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4102 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 4105 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 4108 _ 8B. 45, F0
        add     eax, ecx                                ; 410B _ 01. C8
        mov     dword [esp+14H], 0                      ; 410D _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 4115 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 4119 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 411D _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 4120 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 4124 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 4127 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 412B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 412E _ 89. 04 24
        call    sheet_refresh_local                     ; 4131 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4136 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4139 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 413C _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 413F _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 4142 _ 8B. 55, 14
        add     ecx, edx                                ; 4145 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 4147 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 414A _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 414D _ 8B. 55, 10
        add     edx, ebx                                ; 4150 _ 01. DA
        mov     dword [esp+14H], eax                    ; 4152 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 4156 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 415A _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 415E _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 4161 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 4165 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 4168 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 416C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 416F _ 89. 04 24
        call    sheet_refresh_local                     ; 4172 _ E8, FFFFFFFC(rel)
?_224:  add     esp, 52                                 ; 4177 _ 83. C4, 34
        pop     ebx                                     ; 417A _ 5B
        pop     ebp                                     ; 417B _ 5D
        ret                                             ; 417C _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 417D _ 55
        mov     ebp, esp                                ; 417E _ 89. E5
        sub     esp, 48                                 ; 4180 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 4183 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4186 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 4188 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 418B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 418E _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 4191 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 4194 _ 83. 7D, 0C, 00
        jns     ?_225                                   ; 4198 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 419A _ C7. 45, 0C, 00000000
?_225:  cmp     dword [ebp+10H], 0                      ; 41A1 _ 83. 7D, 10, 00
        jns     ?_226                                   ; 41A5 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 41A7 _ C7. 45, 10, 00000000
?_226:  mov     eax, dword [ebp+8H]                     ; 41AE _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 41B1 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 41B4 _ 3B. 45, 14
        jge     ?_227                                   ; 41B7 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 41B9 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 41BC _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 41BF _ 89. 45, 14
?_227:  mov     eax, dword [ebp+8H]                     ; 41C2 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 41C5 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 41C8 _ 3B. 45, 18
        jge     ?_228                                   ; 41CB _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 41CD _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 41D0 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 41D3 _ 89. 45, 18
?_228:  mov     eax, dword [ebp+1CH]                    ; 41D6 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 41D9 _ 89. 45, DC
        jmp     ?_235                                   ; 41DC _ E9, 00000119

?_229:  mov     eax, dword [ebp+8H]                     ; 41E1 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 41E4 _ 8B. 55, DC
        add     edx, 4                                  ; 41E7 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 41EA _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 41EE _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 41F1 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 41F4 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 41F6 _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 41F9 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 41FC _ 8B. 45, 08
        add     eax, 1044                               ; 41FF _ 05, 00000414
        sub     edx, eax                                ; 4204 _ 29. C2
        mov     eax, edx                                ; 4206 _ 89. D0
        sar     eax, 5                                  ; 4208 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 420B _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 420E _ C7. 45, E4, 00000000
        jmp     ?_234                                   ; 4215 _ E9, 000000CD

?_230:  mov     eax, dword [ebp-10H]                    ; 421A _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 421D _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 4220 _ 8B. 45, E4
        add     eax, edx                                ; 4223 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4225 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 4228 _ C7. 45, E0, 00000000
        jmp     ?_233                                   ; 422F _ E9, 000000A0

?_231:  mov     eax, dword [ebp-10H]                    ; 4234 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 4237 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 423A _ 8B. 45, E0
        add     eax, edx                                ; 423D _ 01. D0
        mov     dword [ebp-4H], eax                     ; 423F _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 4242 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 4245 _ 3B. 45, FC
        jg      ?_232                                   ; 4248 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 424E _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 4251 _ 3B. 45, 14
        jge     ?_232                                   ; 4254 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 4256 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 4259 _ 3B. 45, F8
        jg      ?_232                                   ; 425C _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 425E _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 4261 _ 3B. 45, 18
        jge     ?_232                                   ; 4264 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 4266 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4269 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 426C _ 0F AF. 45, E4
        mov     edx, eax                                ; 4270 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 4272 _ 8B. 45, E0
        add     eax, edx                                ; 4275 _ 01. D0
        mov     edx, eax                                ; 4277 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 4279 _ 8B. 45, F4
        add     eax, edx                                ; 427C _ 01. D0
        movzx   eax, byte [eax]                         ; 427E _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 4281 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 4284 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 4288 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 428B _ 8B. 40, 14
        cmp     edx, eax                                ; 428E _ 39. C2
        jz      ?_232                                   ; 4290 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 4292 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4295 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 4298 _ 0F AF. 45, F8
        mov     edx, eax                                ; 429C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 429E _ 8B. 45, FC
        add     eax, edx                                ; 42A1 _ 01. D0
        mov     edx, eax                                ; 42A3 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 42A5 _ 8B. 45, EC
        add     eax, edx                                ; 42A8 _ 01. D0
        movzx   eax, byte [eax]                         ; 42AA _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 42AD _ 3A. 45, DA
        jnz     ?_232                                   ; 42B0 _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 42B2 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 42B5 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 42B8 _ 0F AF. 45, F8
        mov     edx, eax                                ; 42BC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 42BE _ 8B. 45, FC
        add     eax, edx                                ; 42C1 _ 01. D0
        mov     edx, eax                                ; 42C3 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 42C5 _ 8B. 45, E8
        add     edx, eax                                ; 42C8 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 42CA _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 42CE _ 88. 02
?_232:  add     dword [ebp-20H], 1                      ; 42D0 _ 83. 45, E0, 01
?_233:  mov     eax, dword [ebp-10H]                    ; 42D4 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 42D7 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 42DA _ 3B. 45, E0
        jg      ?_231                                   ; 42DD _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 42E3 _ 83. 45, E4, 01
?_234:  mov     eax, dword [ebp-10H]                    ; 42E7 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 42EA _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 42ED _ 3B. 45, E4
        jg      ?_230                                   ; 42F0 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 42F6 _ 83. 45, DC, 01
?_235:  mov     eax, dword [ebp+8H]                     ; 42FA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 42FD _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 4300 _ 3B. 45, DC
        jge     ?_229                                   ; 4303 _ 0F 8D, FFFFFED8
        leave                                           ; 4309 _ C9
        ret                                             ; 430A _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 430B _ 55
        mov     ebp, esp                                ; 430C _ 89. E5
        sub     esp, 64                                 ; 430E _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 4311 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4314 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 4316 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 4319 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 431C _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 431F _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 4322 _ 83. 7D, 0C, 00
        jns     ?_236                                   ; 4326 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 4328 _ C7. 45, 0C, 00000000
?_236:  cmp     dword [ebp+10H], 0                      ; 432F _ 83. 7D, 10, 00
        jns     ?_237                                   ; 4333 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 4335 _ C7. 45, 10, 00000000
?_237:  mov     eax, dword [ebp+8H]                     ; 433C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 433F _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 4342 _ 3B. 45, 14
        jge     ?_238                                   ; 4345 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4347 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 434A _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 434D _ 89. 45, 14
?_238:  mov     eax, dword [ebp+8H]                     ; 4350 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4353 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 4356 _ 3B. 45, 18
        jge     ?_239                                   ; 4359 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 435B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 435E _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 4361 _ 89. 45, 18
?_239:  mov     eax, dword [ebp+1CH]                    ; 4364 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 4367 _ 89. 45, CC
        jmp     ?_250                                   ; 436A _ E9, 00000141

?_240:  mov     eax, dword [ebp+8H]                     ; 436F _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 4372 _ 8B. 55, CC
        add     edx, 4                                  ; 4375 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 4378 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 437C _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 437F _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 4382 _ 8B. 45, 08
        add     eax, 1044                               ; 4385 _ 05, 00000414
        sub     edx, eax                                ; 438A _ 29. C2
        mov     eax, edx                                ; 438C _ 89. D0
        sar     eax, 5                                  ; 438E _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 4391 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 4394 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 4397 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 4399 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 439C _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 439F _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 43A2 _ 8B. 55, 0C
        sub     edx, eax                                ; 43A5 _ 29. C2
        mov     eax, edx                                ; 43A7 _ 89. D0
        mov     dword [ebp-30H], eax                    ; 43A9 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 43AC _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 43AF _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 43B2 _ 8B. 55, 10
        sub     edx, eax                                ; 43B5 _ 29. C2
        mov     eax, edx                                ; 43B7 _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 43B9 _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 43BC _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 43BF _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 43C2 _ 8B. 55, 14
        sub     edx, eax                                ; 43C5 _ 29. C2
        mov     eax, edx                                ; 43C7 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 43C9 _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 43CC _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 43CF _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 43D2 _ 8B. 55, 18
        sub     edx, eax                                ; 43D5 _ 29. C2
        mov     eax, edx                                ; 43D7 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 43D9 _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 43DC _ 83. 7D, D0, 00
        jns     ?_241                                   ; 43E0 _ 79, 07
        mov     dword [ebp-30H], 0                      ; 43E2 _ C7. 45, D0, 00000000
?_241:  cmp     dword [ebp-2CH], 0                      ; 43E9 _ 83. 7D, D4, 00
        jns     ?_242                                   ; 43ED _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 43EF _ C7. 45, D4, 00000000
?_242:  mov     eax, dword [ebp-10H]                    ; 43F6 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 43F9 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 43FC _ 3B. 45, D8
        jge     ?_243                                   ; 43FF _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4401 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4404 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 4407 _ 89. 45, D8
?_243:  mov     eax, dword [ebp-10H]                    ; 440A _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 440D _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 4410 _ 3B. 45, DC
        jge     ?_244                                   ; 4413 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4415 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 4418 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 441B _ 89. 45, DC
?_244:  mov     eax, dword [ebp-2CH]                    ; 441E _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 4421 _ 89. 45, E4
        jmp     ?_249                                   ; 4424 _ EB, 7A

?_245:  mov     eax, dword [ebp-10H]                    ; 4426 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 4429 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 442C _ 8B. 45, E4
        add     eax, edx                                ; 442F _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4431 _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 4434 _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 4437 _ 89. 45, E0
        jmp     ?_248                                   ; 443A _ EB, 58

?_246:  mov     eax, dword [ebp-10H]                    ; 443C _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 443F _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 4442 _ 8B. 45, E0
        add     eax, edx                                ; 4445 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 4447 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 444A _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 444D _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 4450 _ 0F AF. 45, E4
        mov     edx, eax                                ; 4454 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 4456 _ 8B. 45, E0
        add     eax, edx                                ; 4459 _ 01. D0
        mov     edx, eax                                ; 445B _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 445D _ 8B. 45, F4
        add     eax, edx                                ; 4460 _ 01. D0
        movzx   eax, byte [eax]                         ; 4462 _ 0F B6. 00
        movzx   edx, al                                 ; 4465 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 4468 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 446B _ 8B. 40, 14
        cmp     edx, eax                                ; 446E _ 39. C2
        jz      ?_247                                   ; 4470 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 4472 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4475 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 4478 _ 0F AF. 45, F8
        mov     edx, eax                                ; 447C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 447E _ 8B. 45, FC
        add     eax, edx                                ; 4481 _ 01. D0
        mov     edx, eax                                ; 4483 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 4485 _ 8B. 45, EC
        add     edx, eax                                ; 4488 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 448A _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 448E _ 88. 02
?_247:  add     dword [ebp-20H], 1                      ; 4490 _ 83. 45, E0, 01
?_248:  mov     eax, dword [ebp-20H]                    ; 4494 _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 4497 _ 3B. 45, D8
        jl      ?_246                                   ; 449A _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 449C _ 83. 45, E4, 01
?_249:  mov     eax, dword [ebp-1CH]                    ; 44A0 _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 44A3 _ 3B. 45, DC
        jl      ?_245                                   ; 44A6 _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 44AC _ 83. 45, CC, 01
?_250:  mov     eax, dword [ebp+8H]                     ; 44B0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 44B3 _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 44B6 _ 3B. 45, CC
        jge     ?_240                                   ; 44B9 _ 0F 8D, FFFFFEB0
        leave                                           ; 44BF _ C9
        ret                                             ; 44C0 _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 44C1 _ 55
        mov     ebp, esp                                ; 44C2 _ 89. E5
        sub     esp, 40                                 ; 44C4 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 44C7 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 44CF _ C7. 04 24, 00000043
        call    io_out8                                 ; 44D6 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 44DB _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 44E3 _ C7. 04 24, 00000040
        call    io_out8                                 ; 44EA _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 44EF _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 44F7 _ C7. 04 24, 00000040
        call    io_out8                                 ; 44FE _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 4503 _ C7. 05, 00000300(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 450D _ C7. 45, F4, 00000000
        jmp     ?_252                                   ; 4514 _ EB, 28

?_251:  mov     eax, dword [ebp-0CH]                    ; 4516 _ 8B. 45, F4
        shl     eax, 4                                  ; 4519 _ C1. E0, 04
        add     eax, timer_control                      ; 451C _ 05, 00000300(d)
        mov     dword [eax+8H], 0                       ; 4521 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 4528 _ 8B. 45, F4
        shl     eax, 4                                  ; 452B _ C1. E0, 04
        add     eax, timer_control                      ; 452E _ 05, 00000300(d)
        mov     dword [eax+0CH], 0                      ; 4533 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 453A _ 83. 45, F4, 01
?_252:  cmp     dword [ebp-0CH], 499                    ; 453E _ 81. 7D, F4, 000001F3
        jle     ?_251                                   ; 4545 _ 7E, CF
        leave                                           ; 4547 _ C9
        ret                                             ; 4548 _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 4549 _ 55
        mov     ebp, esp                                ; 454A _ 89. E5
        mov     eax, timer_control                      ; 454C _ B8, 00000300(d)
        pop     ebp                                     ; 4551 _ 5D
        ret                                             ; 4552 _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 4553 _ 55
        mov     ebp, esp                                ; 4554 _ 89. E5
        sub     esp, 16                                 ; 4556 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4559 _ C7. 45, FC, 00000000
        jmp     ?_255                                   ; 4560 _ EB, 26

?_253:  mov     eax, dword [ebp-4H]                     ; 4562 _ 8B. 45, FC
        shl     eax, 4                                  ; 4565 _ C1. E0, 04
        add     eax, timer_control                      ; 4568 _ 05, 00000300(d)
        mov     eax, dword [eax+8H]                     ; 456D _ 8B. 40, 08
        test    eax, eax                                ; 4570 _ 85. C0
        jnz     ?_254                                   ; 4572 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 4574 _ 8B. 45, FC
        shl     eax, 4                                  ; 4577 _ C1. E0, 04
        add     eax, timer_control                      ; 457A _ 05, 00000300(d)
        add     eax, 4                                  ; 457F _ 83. C0, 04
        jmp     ?_256                                   ; 4582 _ EB, 0D

?_254:  add     dword [ebp-4H], 1                       ; 4584 _ 83. 45, FC, 01
?_255:  cmp     dword [ebp-4H], 499                     ; 4588 _ 81. 7D, FC, 000001F3
        jle     ?_253                                   ; 458F _ 7E, D1
?_256:  leave                                           ; 4591 _ C9
        ret                                             ; 4592 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 4593 _ 55
        mov     ebp, esp                                ; 4594 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4596 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 4599 _ C7. 40, 04, 00000000
        pop     ebp                                     ; 45A0 _ 5D
        ret                                             ; 45A1 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 45A2 _ 55
        mov     ebp, esp                                ; 45A3 _ 89. E5
        sub     esp, 4                                  ; 45A5 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 45A8 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 45AB _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 45AE _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 45B1 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 45B4 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 45B7 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 45BA _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 45BE _ 88. 50, 0C
        leave                                           ; 45C1 _ C9
        ret                                             ; 45C2 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 45C3 _ 55
        mov     ebp, esp                                ; 45C4 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 45C6 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 45C9 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 45CC _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 45CE _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 45D1 _ C7. 40, 04, 00000002
        pop     ebp                                     ; 45D8 _ 5D
        ret                                             ; 45D9 _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 45DA _ 55
        mov     ebp, esp                                ; 45DB _ 89. E5
        sub     esp, 40                                 ; 45DD _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 45E0 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 45E8 _ C7. 04 24, 00000020
        call    io_out8                                 ; 45EF _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 45F4 _ A1, 00000300(d)
        add     eax, 1                                  ; 45F9 _ 83. C0, 01
        mov     dword [timer_control], eax              ; 45FC _ A3, 00000300(d)
        mov     byte [ebp-0DH], 0                       ; 4601 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 4605 _ C7. 45, F4, 00000000
        jmp     ?_260                                   ; 460C _ E9, 000000B0

?_257:  mov     eax, dword [ebp-0CH]                    ; 4611 _ 8B. 45, F4
        shl     eax, 4                                  ; 4614 _ C1. E0, 04
        add     eax, timer_control                      ; 4617 _ 05, 00000300(d)
        mov     eax, dword [eax+8H]                     ; 461C _ 8B. 40, 08
        cmp     eax, 2                                  ; 461F _ 83. F8, 02
        jne     ?_258                                   ; 4622 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 4628 _ 8B. 45, F4
        shl     eax, 4                                  ; 462B _ C1. E0, 04
        add     eax, timer_control                      ; 462E _ 05, 00000300(d)
        mov     eax, dword [eax+4H]                     ; 4633 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 4636 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 4639 _ 8B. 45, F4
        shl     eax, 4                                  ; 463C _ C1. E0, 04
        add     eax, timer_control                      ; 463F _ 05, 00000300(d)
        mov     dword [eax+4H], edx                     ; 4644 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 4647 _ 8B. 45, F4
        shl     eax, 4                                  ; 464A _ C1. E0, 04
        add     eax, timer_control                      ; 464D _ 05, 00000300(d)
        mov     eax, dword [eax+4H]                     ; 4652 _ 8B. 40, 04
        test    eax, eax                                ; 4655 _ 85. C0
        jnz     ?_258                                   ; 4657 _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 4659 _ 8B. 45, F4
        shl     eax, 4                                  ; 465C _ C1. E0, 04
        add     eax, timer_control                      ; 465F _ 05, 00000300(d)
        mov     dword [eax+8H], 1                       ; 4664 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 466B _ 8B. 45, F4
        shl     eax, 4                                  ; 466E _ C1. E0, 04
        add     eax, timer_control                      ; 4671 _ 05, 00000300(d)
        movzx   eax, byte [eax+10H]                     ; 4676 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 467A _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 467D _ 8B. 45, F4
        shl     eax, 4                                  ; 4680 _ C1. E0, 04
        add     eax, timer_control                      ; 4683 _ 05, 00000300(d)
        mov     eax, dword [eax+0CH]                    ; 4688 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 468B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 468F _ 89. 04 24
        call    fifo8_put                               ; 4692 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4697 _ 8B. 45, F4
        shl     eax, 4                                  ; 469A _ C1. E0, 04
        add     eax, timer_control                      ; 469D _ 05, 00000300(d)
        lea     edx, [eax+4H]                           ; 46A2 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 46A5 _ A1, 00000000(d)
        cmp     edx, eax                                ; 46AA _ 39. C2
        jnz     ?_258                                   ; 46AC _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 46AE _ C6. 45, F3, 01
?_258:  cmp     byte [ebp-0DH], 0                       ; 46B2 _ 80. 7D, F3, 00
        jz      ?_259                                   ; 46B6 _ 74, 05
        call    task_switch                             ; 46B8 _ E8, FFFFFFFC(rel)
?_259:  add     dword [ebp-0CH], 1                      ; 46BD _ 83. 45, F4, 01
?_260:  cmp     dword [ebp-0CH], 499                    ; 46C1 _ 81. 7D, F4, 000001F3
        jle     ?_257                                   ; 46C8 _ 0F 8E, FFFFFF43
        leave                                           ; 46CE _ C9
        ret                                             ; 46CF _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 46D0 _ 55
        mov     ebp, esp                                ; 46D1 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 46D3 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_261                                   ; 46DA _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 46DC _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 46E3 _ 8B. 45, 0C
        shr     eax, 12                                 ; 46E6 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 46E9 _ 89. 45, 0C
?_261:  mov     eax, dword [ebp+0CH]                    ; 46EC _ 8B. 45, 0C
        mov     edx, eax                                ; 46EF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 46F1 _ 8B. 45, 08
        mov     word [eax], dx                          ; 46F4 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 46F7 _ 8B. 45, 10
        mov     edx, eax                                ; 46FA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 46FC _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 46FF _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 4703 _ 8B. 45, 10
        sar     eax, 16                                 ; 4706 _ C1. F8, 10
        mov     edx, eax                                ; 4709 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 470B _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 470E _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 4711 _ 8B. 45, 14
        mov     edx, eax                                ; 4714 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4716 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 4719 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 471C _ 8B. 45, 0C
        shr     eax, 16                                 ; 471F _ C1. E8, 10
        and     eax, 0FH                                ; 4722 _ 83. E0, 0F
        mov     edx, eax                                ; 4725 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 4727 _ 8B. 45, 14
        sar     eax, 8                                  ; 472A _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 472D _ 83. E0, F0
        or      eax, edx                                ; 4730 _ 09. D0
        mov     edx, eax                                ; 4732 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4734 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 4737 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 473A _ 8B. 45, 10
        shr     eax, 24                                 ; 473D _ C1. E8, 18
        mov     edx, eax                                ; 4740 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4742 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 4745 _ 88. 50, 07
        pop     ebp                                     ; 4748 _ 5D
        ret                                             ; 4749 _ C3
; segment_descriptor End of function

init_task_level:; Function begin
        push    ebp                                     ; 474A _ 55
        mov     ebp, esp                                ; 474B _ 89. E5
        sub     esp, 16                                 ; 474D _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4750 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp+8H]                     ; 4756 _ 8B. 55, 08
        mov     eax, edx                                ; 4759 _ 89. D0
        shl     eax, 2                                  ; 475B _ C1. E0, 02
        add     eax, edx                                ; 475E _ 01. D0
        shl     eax, 2                                  ; 4760 _ C1. E0, 02
        add     eax, ecx                                ; 4763 _ 01. C8
        add     eax, 8                                  ; 4765 _ 83. C0, 08
        mov     dword [eax], 0                          ; 4768 _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 476E _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp+8H]                     ; 4774 _ 8B. 55, 08
        mov     eax, edx                                ; 4777 _ 89. D0
        shl     eax, 2                                  ; 4779 _ C1. E0, 02
        add     eax, edx                                ; 477C _ 01. D0
        shl     eax, 2                                  ; 477E _ C1. E0, 02
        add     eax, ecx                                ; 4781 _ 01. C8
        add     eax, 12                                 ; 4783 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 4786 _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 478C _ C7. 45, FC, 00000000
        jmp     ?_263                                   ; 4793 _ EB, 21

?_262:  mov     ecx, dword [task_control]               ; 4795 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 479B _ 8B. 55, FC
        mov     eax, edx                                ; 479E _ 89. D0
        add     eax, eax                                ; 47A0 _ 01. C0
        add     eax, edx                                ; 47A2 _ 01. D0
        shl     eax, 3                                  ; 47A4 _ C1. E0, 03
        add     eax, ecx                                ; 47A7 _ 01. C8
        add     eax, 16                                 ; 47A9 _ 83. C0, 10
        mov     dword [eax], 0                          ; 47AC _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 47B2 _ 83. 45, FC, 01
?_263:  cmp     dword [ebp-4H], 2                       ; 47B6 _ 83. 7D, FC, 02
        jle     ?_262                                   ; 47BA _ 7E, D9
        leave                                           ; 47BC _ C9
        ret                                             ; 47BD _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 47BE _ 55
        mov     ebp, esp                                ; 47BF _ 89. E5
        sub     esp, 40                                 ; 47C1 _ 83. EC, 28
        call    get_addr_gdt                            ; 47C4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 47C9 _ 89. 45, F0
        mov     dword [esp+4H], 668                     ; 47CC _ C7. 44 24, 04, 0000029C
        mov     eax, dword [ebp+8H]                     ; 47D4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 47D7 _ 89. 04 24
        call    memman_alloc_4k                         ; 47DA _ E8, FFFFFFFC(rel)
        mov     dword [task_control], eax               ; 47DF _ A3, 00002248(d)
        mov     dword [ebp-14H], 0                      ; 47E4 _ C7. 45, EC, 00000000
        jmp     ?_265                                   ; 47EB _ E9, 00000085

?_264:  mov     edx, dword [task_control]               ; 47F0 _ 8B. 15, 00002248(d)
        mov     eax, dword [ebp-14H]                    ; 47F6 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 47F9 _ 69. C0, 00000094
        add     eax, edx                                ; 47FF _ 01. D0
        add     eax, 72                                 ; 4801 _ 83. C0, 48
        mov     dword [eax], 0                          ; 4804 _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 480A _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp-14H]                    ; 4810 _ 8B. 45, EC
        add     eax, 8                                  ; 4813 _ 83. C0, 08
        lea     edx, [eax*8]                            ; 4816 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 481D _ 8B. 45, EC
        imul    eax, eax, 148                           ; 4820 _ 69. C0, 00000094
        add     eax, ecx                                ; 4826 _ 01. C8
        add     eax, 68                                 ; 4828 _ 83. C0, 44
        mov     dword [eax], edx                        ; 482B _ 89. 10
        mov     eax, dword [task_control]               ; 482D _ A1, 00002248(d)
        mov     edx, dword [ebp-14H]                    ; 4832 _ 8B. 55, EC
        imul    edx, edx, 148                           ; 4835 _ 69. D2, 00000094
        add     edx, 96                                 ; 483B _ 83. C2, 60
        add     eax, edx                                ; 483E _ 01. D0
        add     eax, 16                                 ; 4840 _ 83. C0, 10
        mov     edx, dword [ebp-14H]                    ; 4843 _ 8B. 55, EC
        add     edx, 8                                  ; 4846 _ 83. C2, 08
        lea     ecx, [edx*8]                            ; 4849 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 4850 _ 8B. 55, F0
        add     edx, ecx                                ; 4853 _ 01. CA
        mov     dword [esp+0CH], 137                    ; 4855 _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 485D _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 4861 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 4869 _ 89. 14 24
        call    segment_descriptor                      ; 486C _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 4871 _ 83. 45, EC, 01
?_265:  cmp     dword [ebp-14H], 4                      ; 4875 _ 83. 7D, EC, 04
        jle     ?_264                                   ; 4879 _ 0F 8E, FFFFFF71
        mov     dword [ebp-14H], 0                      ; 487F _ C7. 45, EC, 00000000
        jmp     ?_267                                   ; 4886 _ EB, 0F

?_266:  mov     eax, dword [ebp-14H]                    ; 4888 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 488B _ 89. 04 24
        call    init_task_level                         ; 488E _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 4893 _ 83. 45, EC, 01
?_267:  cmp     dword [ebp-14H], 2                      ; 4897 _ 83. 7D, EC, 02
        jle     ?_266                                   ; 489B _ 7E, EB
        call    task_alloc                              ; 489D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 48A2 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 48A5 _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 48A8 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 48AF _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 48B2 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 48B9 _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 48BC _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 48C3 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 48C6 _ 89. 04 24
        call    task_add                                ; 48C9 _ E8, FFFFFFFC(rel)
        call    task_switch_sub                         ; 48CE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 48D3 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 48D6 _ 8B. 00
        mov     dword [esp], eax                        ; 48D8 _ 89. 04 24
        call    load_tr                                 ; 48DB _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 48E0 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 48E5 _ A3, 00002244(d)
        mov     eax, dword [ebp-0CH]                    ; 48EA _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 48ED _ 8B. 40, 08
        mov     edx, eax                                ; 48F0 _ 89. C2
        mov     eax, dword [task_timer]                 ; 48F2 _ A1, 00002244(d)
        mov     dword [esp+4H], edx                     ; 48F7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 48FB _ 89. 04 24
        call    timer_settime                           ; 48FE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4903 _ 8B. 45, F4
        leave                                           ; 4906 _ C9
        ret                                             ; 4907 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 4908 _ 55
        mov     ebp, esp                                ; 4909 _ 89. E5
        sub     esp, 16                                 ; 490B _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 490E _ C7. 45, F8, 00000000
        jmp     ?_270                                   ; 4915 _ E9, 000000F6

?_268:  mov     edx, dword [task_control]               ; 491A _ 8B. 15, 00002248(d)
        mov     eax, dword [ebp-8H]                     ; 4920 _ 8B. 45, F8
        imul    eax, eax, 148                           ; 4923 _ 69. C0, 00000094
        add     eax, edx                                ; 4929 _ 01. D0
        add     eax, 72                                 ; 492B _ 83. C0, 48
        mov     eax, dword [eax]                        ; 492E _ 8B. 00
        test    eax, eax                                ; 4930 _ 85. C0
        jne     ?_269                                   ; 4932 _ 0F 85, 000000D4
        mov     eax, dword [task_control]               ; 4938 _ A1, 00002248(d)
        mov     edx, dword [ebp-8H]                     ; 493D _ 8B. 55, F8
        imul    edx, edx, 148                           ; 4940 _ 69. D2, 00000094
        add     edx, 64                                 ; 4946 _ 83. C2, 40
        add     eax, edx                                ; 4949 _ 01. D0
        add     eax, 4                                  ; 494B _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 494E _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4951 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 4954 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 495B _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 495E _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 4965 _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 4968 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 496F _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 4972 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 4979 _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 497C _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4983 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 4986 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-8H]                     ; 498D _ 8B. 45, F8
        add     eax, 1                                  ; 4990 _ 83. C0, 01
        shl     eax, 9                                  ; 4993 _ C1. E0, 09
        mov     edx, eax                                ; 4996 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4998 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 499B _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 499E _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 49A1 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-4H]                     ; 49A8 _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 49AB _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 49B2 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 49B5 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 49BC _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 49BF _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 49C6 _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 49C9 _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 49D3 _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 49D6 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 49E0 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 49E3 _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 49ED _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 49F0 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 49FA _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 49FD _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 4A07 _ 8B. 45, FC
        jmp     ?_271                                   ; 4A0A _ EB, 13

?_269:  add     dword [ebp-8H], 1                       ; 4A0C _ 83. 45, F8, 01
?_270:  cmp     dword [ebp-8H], 4                       ; 4A10 _ 83. 7D, F8, 04
        jle     ?_268                                   ; 4A14 _ 0F 8E, FFFFFF00
        mov     eax, 0                                  ; 4A1A _ B8, 00000000
?_271:  leave                                           ; 4A1F _ C9
        ret                                             ; 4A20 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 4A21 _ 55
        mov     ebp, esp                                ; 4A22 _ 89. E5
        sub     esp, 24                                 ; 4A24 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 4A27 _ 83. 7D, 0C, 00
        jns     ?_272                                   ; 4A2B _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 4A2D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4A30 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 4A33 _ 89. 45, 0C
?_272:  cmp     dword [ebp+10H], 0                      ; 4A36 _ 83. 7D, 10, 00
        jle     ?_273                                   ; 4A3A _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 4A3C _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4A3F _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 4A42 _ 89. 50, 08
?_273:  mov     eax, dword [ebp+8H]                     ; 4A45 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4A48 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4A4B _ 83. F8, 02
        jnz     ?_274                                   ; 4A4E _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 4A50 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4A53 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 4A56 _ 3B. 45, 0C
        jz      ?_274                                   ; 4A59 _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 4A5B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4A5E _ 89. 04 24
        call    task_remove                             ; 4A61 _ E8, FFFFFFFC(rel)
?_274:  mov     eax, dword [ebp+8H]                     ; 4A66 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4A69 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4A6C _ 83. F8, 02
        jz      ?_275                                   ; 4A6F _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 4A71 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4A74 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 4A77 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4A7A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4A7D _ 89. 04 24
        call    task_add                                ; 4A80 _ E8, FFFFFFFC(rel)
?_275:  mov     eax, dword [task_control]               ; 4A85 _ A1, 00002248(d)
        mov     dword [eax+4H], 1                       ; 4A8A _ C7. 40, 04, 00000001
        leave                                           ; 4A91 _ C9
        ret                                             ; 4A92 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 4A93 _ 55
        mov     ebp, esp                                ; 4A94 _ 89. E5
        sub     esp, 40                                 ; 4A96 _ 83. EC, 28
        mov     ecx, dword [task_control]               ; 4A99 _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4A9F _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4AA4 _ 8B. 10
        mov     eax, edx                                ; 4AA6 _ 89. D0
        shl     eax, 2                                  ; 4AA8 _ C1. E0, 02
        add     eax, edx                                ; 4AAB _ 01. D0
        shl     eax, 2                                  ; 4AAD _ C1. E0, 02
        add     eax, ecx                                ; 4AB0 _ 01. C8
        add     eax, 8                                  ; 4AB2 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4AB5 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 4AB8 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4ABB _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4ABE _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4AC1 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 4AC5 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 4AC8 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 4ACB _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 4ACE _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 4AD1 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 4AD4 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4AD7 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4ADA _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4ADD _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 4AE0 _ 8B. 00
        cmp     edx, eax                                ; 4AE2 _ 39. C2
        jnz     ?_276                                   ; 4AE4 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 4AE6 _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 4AE9 _ C7. 40, 04, 00000000
?_276:  mov     eax, dword [task_control]               ; 4AF0 _ A1, 00002248(d)
        mov     eax, dword [eax+4H]                     ; 4AF5 _ 8B. 40, 04
        test    eax, eax                                ; 4AF8 _ 85. C0
        jz      ?_277                                   ; 4AFA _ 74, 24
        call    task_switch_sub                         ; 4AFC _ E8, FFFFFFFC(rel)
        mov     ecx, dword [task_control]               ; 4B01 _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4B07 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4B0C _ 8B. 10
        mov     eax, edx                                ; 4B0E _ 89. D0
        shl     eax, 2                                  ; 4B10 _ C1. E0, 02
        add     eax, edx                                ; 4B13 _ 01. D0
        shl     eax, 2                                  ; 4B15 _ C1. E0, 02
        add     eax, ecx                                ; 4B18 _ 01. C8
        add     eax, 8                                  ; 4B1A _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4B1D _ 89. 45, EC
?_277:  mov     eax, dword [ebp-14H]                    ; 4B20 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4B23 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4B26 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4B29 _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 4B2D _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4B30 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 4B33 _ 8B. 40, 08
        mov     edx, eax                                ; 4B36 _ 89. C2
        mov     eax, dword [task_timer]                 ; 4B38 _ A1, 00002244(d)
        mov     dword [esp+4H], edx                     ; 4B3D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4B41 _ 89. 04 24
        call    timer_settime                           ; 4B44 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4B49 _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 4B4C _ 3B. 45, F0
        jz      ?_278                                   ; 4B4F _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 4B51 _ 83. 7D, F4, 00
        jz      ?_278                                   ; 4B55 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4B57 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4B5A _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4B5C _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4B60 _ C7. 04 24, 00000000
        call    farjmp                                  ; 4B67 _ E8, FFFFFFFC(rel)
?_278:  leave                                           ; 4B6C _ C9
        ret                                             ; 4B6D _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 4B6E _ 55
        mov     ebp, esp                                ; 4B6F _ 89. E5
        sub     esp, 40                                 ; 4B71 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 4B74 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 4B7B _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 4B82 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4B85 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4B88 _ 83. F8, 02
        jnz     ?_279                                   ; 4B8B _ 75, 51
        call    task_now                                ; 4B8D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4B92 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 4B95 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4B98 _ 89. 04 24
        call    task_remove                             ; 4B9B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 4BA0 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 4BA7 _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 4BAA _ 3B. 45, F4
        jnz     ?_279                                   ; 4BAD _ 75, 2F
        call    task_switch_sub                         ; 4BAF _ E8, FFFFFFFC(rel)
        call    task_now                                ; 4BB4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4BB9 _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 4BBC _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 4BC3 _ 83. 7D, F4, 00
        jz      ?_279                                   ; 4BC7 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4BC9 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4BCC _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4BCE _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4BD2 _ C7. 04 24, 00000000
        call    farjmp                                  ; 4BD9 _ E8, FFFFFFFC(rel)
?_279:  mov     eax, dword [ebp-10H]                    ; 4BDE _ 8B. 45, F0
        leave                                           ; 4BE1 _ C9
        ret                                             ; 4BE2 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 4BE3 _ 55
        mov     ebp, esp                                ; 4BE4 _ 89. E5
        sub     esp, 16                                 ; 4BE6 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4BE9 _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4BEF _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4BF4 _ 8B. 10
        mov     eax, edx                                ; 4BF6 _ 89. D0
        shl     eax, 2                                  ; 4BF8 _ C1. E0, 02
        add     eax, edx                                ; 4BFB _ 01. D0
        shl     eax, 2                                  ; 4BFD _ C1. E0, 02
        add     eax, ecx                                ; 4C00 _ 01. C8
        add     eax, 8                                  ; 4C02 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4C05 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4C08 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4C0B _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4C0E _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 4C11 _ 8B. 44 90, 08
        leave                                           ; 4C15 _ C9
        ret                                             ; 4C16 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 4C17 _ 55
        mov     ebp, esp                                ; 4C18 _ 89. E5
        sub     esp, 16                                 ; 4C1A _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4C1D _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp+8H]                     ; 4C23 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4C26 _ 8B. 50, 0C
        mov     eax, edx                                ; 4C29 _ 89. D0
        shl     eax, 2                                  ; 4C2B _ C1. E0, 02
        add     eax, edx                                ; 4C2E _ 01. D0
        shl     eax, 2                                  ; 4C30 _ C1. E0, 02
        add     eax, ecx                                ; 4C33 _ 01. C8
        add     eax, 8                                  ; 4C35 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4C38 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4C3B _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 4C3E _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 4C40 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 4C43 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 4C46 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4C4A _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4C4D _ 8B. 00
        lea     edx, [eax+1H]                           ; 4C4F _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4C52 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4C55 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4C57 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4C5A _ C7. 40, 04, 00000002
        leave                                           ; 4C61 _ C9
        ret                                             ; 4C62 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 4C63 _ 55
        mov     ebp, esp                                ; 4C64 _ 89. E5
        sub     esp, 16                                 ; 4C66 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4C69 _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp+8H]                     ; 4C6F _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4C72 _ 8B. 50, 0C
        mov     eax, edx                                ; 4C75 _ 89. D0
        shl     eax, 2                                  ; 4C77 _ C1. E0, 02
        add     eax, edx                                ; 4C7A _ 01. D0
        shl     eax, 2                                  ; 4C7C _ C1. E0, 02
        add     eax, ecx                                ; 4C7F _ 01. C8
        add     eax, 8                                  ; 4C81 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4C84 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 4C87 _ C7. 45, F8, 00000000
        jmp     ?_282                                   ; 4C8E _ EB, 23

?_280:  mov     eax, dword [ebp-4H]                     ; 4C90 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4C93 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 4C96 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 4C9A _ 3B. 45, 08
        jnz     ?_281                                   ; 4C9D _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 4C9F _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4CA2 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 4CA5 _ C7. 44 90, 08, 00000000
        jmp     ?_283                                   ; 4CAD _ EB, 0E

?_281:  add     dword [ebp-8H], 1                       ; 4CAF _ 83. 45, F8, 01
?_282:  mov     eax, dword [ebp-4H]                     ; 4CB3 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4CB6 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4CB8 _ 3B. 45, F8
        jg      ?_280                                   ; 4CBB _ 7F, D3
?_283:  mov     eax, dword [ebp-4H]                     ; 4CBD _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4CC0 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4CC2 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4CC5 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4CC8 _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 4CCA _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4CCD _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 4CD0 _ 3B. 45, F8
        jle     ?_284                                   ; 4CD3 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 4CD5 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4CD8 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 4CDB _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4CDE _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 4CE1 _ 89. 50, 04
?_284:  mov     eax, dword [ebp-4H]                     ; 4CE4 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4CE7 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4CEA _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4CED _ 8B. 00
        cmp     edx, eax                                ; 4CEF _ 39. C2
        jl      ?_285                                   ; 4CF1 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 4CF3 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 4CF6 _ C7. 40, 04, 00000000
?_285:  mov     eax, dword [ebp+8H]                     ; 4CFD _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 4D00 _ C7. 40, 04, 00000001
        jmp     ?_287                                   ; 4D07 _ EB, 1B

?_286:  mov     eax, dword [ebp-8H]                     ; 4D09 _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 4D0C _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4D0F _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 4D12 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4D16 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4D19 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 4D1C _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 4D20 _ 83. 45, F8, 01
?_287:  mov     eax, dword [ebp-4H]                     ; 4D24 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4D27 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4D29 _ 3B. 45, F8
        jg      ?_286                                   ; 4D2C _ 7F, DB
        leave                                           ; 4D2E _ C9
        ret                                             ; 4D2F _ C3
; task_remove End of function

task_switch_sub:; Function begin
        push    ebp                                     ; 4D30 _ 55
        mov     ebp, esp                                ; 4D31 _ 89. E5
        sub     esp, 16                                 ; 4D33 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4D36 _ C7. 45, FC, 00000000
        jmp     ?_290                                   ; 4D3D _ EB, 24

?_288:  mov     ecx, dword [task_control]               ; 4D3F _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 4D45 _ 8B. 55, FC
        mov     eax, edx                                ; 4D48 _ 89. D0
        shl     eax, 2                                  ; 4D4A _ C1. E0, 02
        add     eax, edx                                ; 4D4D _ 01. D0
        shl     eax, 2                                  ; 4D4F _ C1. E0, 02
        add     eax, ecx                                ; 4D52 _ 01. C8
        add     eax, 8                                  ; 4D54 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 4D57 _ 8B. 00
        test    eax, eax                                ; 4D59 _ 85. C0
        jle     ?_289                                   ; 4D5B _ 7E, 02
        jmp     ?_291                                   ; 4D5D _ EB, 0A

?_289:  add     dword [ebp-4H], 1                       ; 4D5F _ 83. 45, FC, 01
?_290:  cmp     dword [ebp-4H], 2                       ; 4D63 _ 83. 7D, FC, 02
        jle     ?_288                                   ; 4D67 _ 7E, D6
?_291:  mov     eax, dword [task_control]               ; 4D69 _ A1, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 4D6E _ 8B. 55, FC
        mov     dword [eax], edx                        ; 4D71 _ 89. 10
        mov     eax, dword [task_control]               ; 4D73 _ A1, 00002248(d)
        mov     dword [eax+4H], 0                       ; 4D78 _ C7. 40, 04, 00000000
        leave                                           ; 4D7F _ C9
        ret                                             ; 4D80 _ C3
; task_switch_sub End of function

task_send_message:; Function begin
        push    ebp                                     ; 4D81 _ 55
        mov     ebp, esp                                ; 4D82 _ 89. E5
        sub     esp, 24                                 ; 4D84 _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 4D87 _ 8B. 45, 10
        movzx   eax, al                                 ; 4D8A _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 4D8D _ 8B. 55, 0C
        add     edx, 16                                 ; 4D90 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 4D93 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 4D97 _ 89. 14 24
        call    fifo8_put                               ; 4D9A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 4D9F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4DA2 _ 89. 04 24
        call    task_sleep                              ; 4DA5 _ E8, FFFFFFFC(rel)
        leave                                           ; 4DAA _ C9
        ret                                             ; 4DAB _ C3
; task_send_message End of function

file_load_content:; Function begin
        push    ebp                                     ; 4DAC _ 55
        mov     ebp, esp                                ; 4DAD _ 89. E5
        sub     esp, 56                                 ; 4DAF _ 83. EC, 38
        mov     dword [ebp-24H], 78848                  ; 4DB2 _ C7. 45, DC, 00013400
        mov     eax, dword [memman]                     ; 4DB9 _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 4DBE _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 4DC6 _ 89. 04 24
        call    memman_alloc                            ; 4DC9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 4DCE _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 4DD1 _ 8B. 45, EC
        add     eax, 12                                 ; 4DD4 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 4DD7 _ C6. 00, 00
        jmp     ?_302                                   ; 4DDA _ E9, 00000129

?_292:  mov     dword [ebp-20H], 0                      ; 4DDF _ C7. 45, E0, 00000000
        jmp     ?_295                                   ; 4DE6 _ EB, 2C

?_293:  mov     edx, dword [ebp-24H]                    ; 4DE8 _ 8B. 55, DC
        mov     eax, dword [ebp-20H]                    ; 4DEB _ 8B. 45, E0
        add     eax, edx                                ; 4DEE _ 01. D0
        movzx   eax, byte [eax]                         ; 4DF0 _ 0F B6. 00
        test    al, al                                  ; 4DF3 _ 84. C0
        jz      ?_294                                   ; 4DF5 _ 74, 1B
        mov     edx, dword [ebp-20H]                    ; 4DF7 _ 8B. 55, E0
        mov     eax, dword [ebp-14H]                    ; 4DFA _ 8B. 45, EC
        add     edx, eax                                ; 4DFD _ 01. C2
        mov     ecx, dword [ebp-24H]                    ; 4DFF _ 8B. 4D, DC
        mov     eax, dword [ebp-20H]                    ; 4E02 _ 8B. 45, E0
        add     eax, ecx                                ; 4E05 _ 01. C8
        movzx   eax, byte [eax]                         ; 4E07 _ 0F B6. 00
        mov     byte [edx], al                          ; 4E0A _ 88. 02
        add     dword [ebp-20H], 1                      ; 4E0C _ 83. 45, E0, 01
        jmp     ?_295                                   ; 4E10 _ EB, 02

?_294:  jmp     ?_296                                   ; 4E12 _ EB, 06

?_295:  cmp     dword [ebp-20H], 7                      ; 4E14 _ 83. 7D, E0, 07
        jle     ?_293                                   ; 4E18 _ 7E, CE
?_296:  mov     dword [ebp-1CH], 0                      ; 4E1A _ C7. 45, E4, 00000000
        mov     edx, dword [ebp-20H]                    ; 4E21 _ 8B. 55, E0
        mov     eax, dword [ebp-14H]                    ; 4E24 _ 8B. 45, EC
        add     eax, edx                                ; 4E27 _ 01. D0
        mov     byte [eax], 46                          ; 4E29 _ C6. 00, 2E
        add     dword [ebp-20H], 1                      ; 4E2C _ 83. 45, E0, 01
        mov     dword [ebp-1CH], 0                      ; 4E30 _ C7. 45, E4, 00000000
        jmp     ?_298                                   ; 4E37 _ EB, 1E

?_297:  mov     edx, dword [ebp-20H]                    ; 4E39 _ 8B. 55, E0
        mov     eax, dword [ebp-14H]                    ; 4E3C _ 8B. 45, EC
        add     edx, eax                                ; 4E3F _ 01. C2
        mov     ecx, dword [ebp-24H]                    ; 4E41 _ 8B. 4D, DC
        mov     eax, dword [ebp-1CH]                    ; 4E44 _ 8B. 45, E4
        add     eax, ecx                                ; 4E47 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 4E49 _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 4E4D _ 88. 02
        add     dword [ebp-20H], 1                      ; 4E4F _ 83. 45, E0, 01
        add     dword [ebp-1CH], 1                      ; 4E53 _ 83. 45, E4, 01
?_298:  cmp     dword [ebp-1CH], 2                      ; 4E57 _ 83. 7D, E4, 02
        jle     ?_297                                   ; 4E5B _ 7E, DC
        mov     edx, dword [ebp-20H]                    ; 4E5D _ 8B. 55, E0
        mov     eax, dword [ebp-14H]                    ; 4E60 _ 8B. 45, EC
        add     eax, edx                                ; 4E63 _ 01. D0
        mov     byte [eax], 0                           ; 4E65 _ C6. 00, 00
        mov     eax, dword [ebp-14H]                    ; 4E68 _ 8B. 45, EC
        mov     dword [esp+4H], eax                     ; 4E6B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4E6F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4E72 _ 89. 04 24
        call    strcmp                                  ; 4E75 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 4E7A _ 83. F8, 01
        jne     ?_301                                   ; 4E7D _ 0F 85, 00000081
        mov     eax, dword [ebp-24H]                    ; 4E83 _ 8B. 45, DC
        mov     edx, dword [eax+1CH]                    ; 4E86 _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 4E89 _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 4E8E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4E92 _ 89. 04 24
        call    memman_alloc_4k                         ; 4E95 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 4E9A _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 4E9C _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 4E9F _ 89. 10
        mov     eax, dword [ebp-24H]                    ; 4EA1 _ 8B. 45, DC
        mov     eax, dword [eax+1CH]                    ; 4EA4 _ 8B. 40, 1C
        mov     edx, eax                                ; 4EA7 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 4EA9 _ 8B. 45, 0C
        mov     dword [eax+4H], edx                     ; 4EAC _ 89. 50, 04
        mov     dword [ebp-10H], 88064                  ; 4EAF _ C7. 45, F0, 00015800
        mov     eax, dword [ebp-24H]                    ; 4EB6 _ 8B. 45, DC
        movzx   eax, word [eax+1AH]                     ; 4EB9 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 4EBD _ 0F B7. C0
        shl     eax, 9                                  ; 4EC0 _ C1. E0, 09
        add     dword [ebp-10H], eax                    ; 4EC3 _ 01. 45, F0
        mov     eax, dword [ebp-24H]                    ; 4EC6 _ 8B. 45, DC
        mov     eax, dword [eax+1CH]                    ; 4EC9 _ 8B. 40, 1C
        mov     dword [ebp-0CH], eax                    ; 4ECC _ 89. 45, F4
        mov     dword [ebp-18H], 0                      ; 4ECF _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 4ED6 _ C7. 45, E8, 00000000
        jmp     ?_300                                   ; 4EDD _ EB, 1B

?_299:  mov     eax, dword [ebp+0CH]                    ; 4EDF _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 4EE2 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 4EE4 _ 8B. 45, E8
        add     edx, eax                                ; 4EE7 _ 01. C2
        mov     ecx, dword [ebp-18H]                    ; 4EE9 _ 8B. 4D, E8
        mov     eax, dword [ebp-10H]                    ; 4EEC _ 8B. 45, F0
        add     eax, ecx                                ; 4EEF _ 01. C8
        movzx   eax, byte [eax]                         ; 4EF1 _ 0F B6. 00
        mov     byte [edx], al                          ; 4EF4 _ 88. 02
        add     dword [ebp-18H], 1                      ; 4EF6 _ 83. 45, E8, 01
?_300:  mov     eax, dword [ebp-18H]                    ; 4EFA _ 8B. 45, E8
        cmp     eax, dword [ebp-0CH]                    ; 4EFD _ 3B. 45, F4
        jl      ?_299                                   ; 4F00 _ 7C, DD
        jmp     ?_303                                   ; 4F02 _ EB, 12

?_301:  add     dword [ebp-24H], 32                     ; 4F04 _ 83. 45, DC, 20
?_302:  mov     eax, dword [ebp-24H]                    ; 4F08 _ 8B. 45, DC
        movzx   eax, byte [eax]                         ; 4F0B _ 0F B6. 00
        test    al, al                                  ; 4F0E _ 84. C0
        jne     ?_292                                   ; 4F10 _ 0F 85, FFFFFEC9
?_303:  mov     edx, dword [ebp-14H]                    ; 4F16 _ 8B. 55, EC
        mov     eax, dword [memman]                     ; 4F19 _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 4F1E _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 4F26 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4F2A _ 89. 04 24
        call    memman_free                             ; 4F2D _ E8, FFFFFFFC(rel)
        leave                                           ; 4F32 _ C9
        ret                                             ; 4F33 _ C3
; file_load_content End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_304:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_305:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0007 _ console.

?_306:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 000F _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0017 _ sk b.

?_307:                                                  ; byte
        db 42H, 00H                                     ; 001C _ B.

?_308:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 001E _ page is:
        db 20H, 00H                                     ; 0026 _  .

?_309:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0028 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0030 _ L: .

?_310:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0034 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003C _ H: .

?_311:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0040 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0048 _ w: .

?_312:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 004C _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0054 _ gh: .

?_313:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0059 _ type: .

?_314:                                                  ; byte
        db 3EH, 00H                                     ; 0060 _ >.

?_315:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 0062 _ mem.

?_316:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 0066 _ cls.

?_317:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 006A _ dir.

?_318:                                                  ; byte
        db 68H, 6CH, 74H, 00H                           ; 006E _ hlt.

?_319:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0072 _ free .

?_320:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 0078 _  KB.

?_321:                                                  ; byte
        db 20H, 00H                                     ; 007C _  .

?_322:                                                  ; byte
        db 68H, 6CH, 74H, 2EH, 65H, 78H, 65H, 00H       ; 007E _ hlt.exe.

?_323:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0086 _ console.


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

table_rgb.1812:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0120 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0128 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0130 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0138 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0140 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0148 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0150 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........

cursor.1880:                                            ; byte
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

closebtn.1967:                                          ; byte
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

?_324:  db 00H                                          ; 0342 _ .

?_325:  db 00H, 00H                                     ; 0343 _ ..


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

timerinfo1.1794:                                        ; byte
        resb    28                                      ; 0018

timerbuf1.1797:                                         ; qword
        resq    1                                       ; 0034

timerinfo2.1795:                                        ; byte
        resb    28                                      ; 003C

timerbuf2.1798:                                         ; qword
        resq    1                                       ; 0058

timerinfo3.1796:                                        ; byte
        resb    28                                      ; 0060

timerbuf3.1799:                                         ; qword
        resq    4                                       ; 007C
        resb    4                                       ; 009C

screen_info:                                            ; qword
        resb    4                                       ; 00A0

?_326:  resw    1                                       ; 00A4

?_327:  resw    1                                       ; 00A6

g_Console:                                              ; byte
        resd    1                                       ; 00A8

?_328:  resd    1                                       ; 00AC

?_329:  resd    1                                       ; 00B0

?_330:  resd    1                                       ; 00B4

?_331:  resb    1                                       ; 00B8

?_332:  resb    7                                       ; 00B9

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

?_333:  resd    1                                       ; 01DC

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

?_334:  resb    9                                       ; 02E1

?_335:  resb    22                                      ; 02EA

timer_control:                                          ; byte
        resd    2001                                    ; 0300

task_timer:                                             ; dword
        resd    1                                       ; 2244

task_control:                                           ; dword
        resd    1                                       ; 2248


