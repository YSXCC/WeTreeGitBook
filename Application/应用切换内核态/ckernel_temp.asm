; Disassembly of file: ckernel.o
; Wed Mar 18 17:15:59 2020
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
global launch_console: function
global set_cursor: function
global console_new_line: function
global strcmp: function
global c_console_putchar: function
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
extern back_sheet                                       ; dword
extern io_in8                                           ; near
extern VRAM_ADDRESS                                     ; dword
extern task_console_g                                   ; dword
extern mouseinfo                                        ; byte
extern systemFont                                       ; byte
extern sheet_win                                        ; dword
extern asm_console_putchar                              ; byte
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
        mov     dword [esp+8H], timerbuf1.1779          ; 014B _ C7. 44 24, 08, 00000034(d)
        mov     dword [esp+4H], 8                       ; 0153 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1776            ; 015B _ C7. 04 24, 00000018(d)
        call    fifo8_init                              ; 0162 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0167 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 016C _ 89. 45, C8
        mov     dword [esp+8H], 1                       ; 016F _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1776         ; 0177 _ C7. 44 24, 04, 00000018(d)
        mov     eax, dword [ebp-38H]                    ; 017F _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0182 _ 89. 04 24
        call    timer_init                              ; 0185 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 018A _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 0192 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0195 _ 89. 04 24
        call    timer_settime                           ; 0198 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 019D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf2.1780          ; 01A5 _ C7. 44 24, 08, 00000058(d)
        mov     dword [esp+4H], 8                       ; 01AD _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1777            ; 01B5 _ C7. 04 24, 0000003C(d)
        call    fifo8_init                              ; 01BC _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01C1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 01C6 _ 89. 45, CC
        mov     dword [esp+8H], 1                       ; 01C9 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1777         ; 01D1 _ C7. 44 24, 04, 0000003C(d)
        mov     eax, dword [ebp-34H]                    ; 01D9 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 01DC _ 89. 04 24
        call    timer_init                              ; 01DF _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01E4 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-34H]                    ; 01EC _ 8B. 45, CC
        mov     dword [esp], eax                        ; 01EF _ 89. 04 24
        call    timer_settime                           ; 01F2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 01F7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf3.1781          ; 01FF _ C7. 44 24, 08, 0000007C(d)
        mov     dword [esp+4H], 8                       ; 0207 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1778            ; 020F _ C7. 04 24, 00000060(d)
        call    fifo8_init                              ; 0216 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 021B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0220 _ 89. 45, D0
        mov     dword [esp+8H], 1                       ; 0223 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1778         ; 022B _ C7. 44 24, 04, 00000060(d)
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
        mov     dword [esp+4H], ?_296                   ; 02DC _ C7. 44 24, 04, 00000000(d)
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
        mov     dword [esp], timerinfo1.1776            ; 03E8 _ C7. 04 24, 00000018(d)
        call    fifo8_status                            ; 03EF _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03F4 _ 01. C3
        mov     dword [esp], timerinfo2.1777            ; 03F6 _ C7. 04 24, 0000003C(d)
        call    fifo8_status                            ; 03FD _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0402 _ 01. C3
        mov     dword [esp], timerinfo3.1778            ; 0404 _ C7. 04 24, 00000060(d)
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
        mov     dword [esp+8H], ?_296                   ; 047D _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 0485 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0489 _ 89. 04 24
        call    make_window_title                       ; 048C _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 0491 _ A1, 0000000C(d)
        mov     dword [esp+0CH], 1                      ; 0496 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_297                   ; 049E _ C7. 44 24, 08, 00000007(d)
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
        mov     dword [esp+8H], ?_296                   ; 0506 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 050E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0512 _ 89. 04 24
        call    make_window_title                       ; 0515 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 051A _ A1, 0000000C(d)
        mov     dword [esp+0CH], 0                      ; 051F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_297                   ; 0527 _ C7. 44 24, 08, 00000007(d)
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

?_008:  mov     dword [esp], timerinfo1.1776            ; 07FD _ C7. 04 24, 00000018(d)
        call    fifo8_status                            ; 0804 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0809 _ 85. C0
        jz      ?_009                                   ; 080B _ 74, 13
        call    io_sti                                  ; 080D _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1776            ; 0812 _ C7. 04 24, 00000018(d)
        call    fifo8_get                               ; 0819 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 081E _ EB, 21

?_009:  mov     dword [esp], timerinfo2.1777            ; 0820 _ C7. 04 24, 0000003C(d)
        call    fifo8_status                            ; 0827 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 082C _ 85. C0
        jz      ?_010                                   ; 082E _ 74, 11
        call    io_sti                                  ; 0830 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1777            ; 0835 _ C7. 04 24, 0000003C(d)
        call    fifo8_get                               ; 083C _ E8, FFFFFFFC(rel)
?_010:  mov     dword [esp], timerinfo3.1778            ; 0841 _ C7. 04 24, 00000060(d)
        call    fifo8_status                            ; 0848 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 084D _ 85. C0
        je      ?_014                                   ; 084F _ 0F 84, 000000DB
        mov     dword [esp], timerinfo3.1778            ; 0855 _ C7. 04 24, 00000060(d)
        call    fifo8_get                               ; 085C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0861 _ 89. 45, F4
        call    io_sti                                  ; 0864 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 0869 _ 83. 7D, F4, 00
        jz      ?_011                                   ; 086D _ 74, 24
        mov     dword [esp+8H], 0                       ; 086F _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1778         ; 0877 _ C7. 44 24, 04, 00000060(d)
        mov     eax, dword [ebp-30H]                    ; 087F _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0882 _ 89. 04 24
        call    timer_init                              ; 0885 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-54H], 0                      ; 088A _ C7. 45, AC, 00000000
        jmp     ?_012                                   ; 0891 _ EB, 22

?_011:  mov     dword [esp+8H], 1                       ; 0893 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1778         ; 089B _ C7. 44 24, 04, 00000060(d)
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
        mov     dword [esp+10H], ?_298                  ; 095F _ C7. 44 24, 10, 0000000F(d)
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
        mov     dword [esp+10H], ?_299                  ; 0A41 _ C7. 44 24, 10, 0000001C(d)
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
        mov     dword [esp+8H], table_rgb.1794          ; 0AAE _ C7. 44 24, 08, 00000120(d)
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
        mov     dword [ebp-0CH], eax                    ; 0AD8 _ 89. 45, F4
        call    io_cli                                  ; 0ADB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0AE0 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0AE3 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0AE7 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0AEE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0AF3 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0AF6 _ 89. 45, F0
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
        add     dword [ebp-10H], 1                      ; 0B59 _ 83. 45, F0, 01
?_019:  mov     eax, dword [ebp-10H]                    ; 0B5D _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0B60 _ 3B. 45, 0C
        jle     ?_018                                   ; 0B63 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0B65 _ 8B. 45, F4
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
        mov     dword [ebp-4H], eax                     ; 0B82 _ 89. 45, FC
        jmp     ?_023                                   ; 0B85 _ EB, 33

?_020:  mov     eax, dword [ebp+14H]                    ; 0B87 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0B8A _ 89. 45, F8
        jmp     ?_022                                   ; 0B8D _ EB, 1F

?_021:  mov     eax, dword [ebp-4H]                     ; 0B8F _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0B92 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B96 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0B98 _ 8B. 45, F8
        add     eax, edx                                ; 0B9B _ 01. D0
        mov     edx, eax                                ; 0B9D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B9F _ 8B. 45, 08
        add     edx, eax                                ; 0BA2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0BA4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0BA8 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0BAA _ 83. 45, F8, 01
?_022:  mov     eax, dword [ebp-8H]                     ; 0BAE _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0BB1 _ 3B. 45, 1C
        jle     ?_021                                   ; 0BB4 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0BB6 _ 83. 45, FC, 01
?_023:  mov     eax, dword [ebp-4H]                     ; 0BBA _ 8B. 45, FC
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
        movzx   eax, word [?_317]                       ; 0F51 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 0F58 _ 98
        mov     dword [ebp-8H], eax                     ; 0F59 _ 89. 45, F8
        movzx   eax, word [?_318]                       ; 0F5C _ 0F B7. 05, 000000A6(d)
        cwde                                            ; 0F63 _ 98
        mov     dword [ebp-4H], eax                     ; 0F64 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 0F67 _ 8B. 45, F8
        sub     eax, 16                                 ; 0F6A _ 83. E8, 10
        mov     edx, eax                                ; 0F6D _ 89. C2
        shr     edx, 31                                 ; 0F6F _ C1. EA, 1F
        add     eax, edx                                ; 0F72 _ 01. D0
        sar     eax, 1                                  ; 0F74 _ D1. F8
        mov     dword [mouse_x], eax                    ; 0F76 _ A3, 000001C8(d)
        mov     eax, dword [ebp-4H]                     ; 0F7B _ 8B. 45, FC
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
        mov     dword [ebp-8H], 0                       ; 11D0 _ C7. 45, F8, 00000000
        jmp     ?_042                                   ; 11D7 _ E9, 0000009C

?_036:  mov     dword [ebp-4H], 0                       ; 11DC _ C7. 45, FC, 00000000
        jmp     ?_041                                   ; 11E3 _ E9, 00000082

?_037:  mov     eax, dword [ebp-8H]                     ; 11E8 _ 8B. 45, F8
        shl     eax, 4                                  ; 11EB _ C1. E0, 04
        mov     edx, eax                                ; 11EE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11F0 _ 8B. 45, FC
        add     eax, edx                                ; 11F3 _ 01. D0
        add     eax, cursor.1862                        ; 11F5 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 11FA _ 0F B6. 00
        cmp     al, 42                                  ; 11FD _ 3C, 2A
        jnz     ?_038                                   ; 11FF _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 1201 _ 8B. 45, F8
        shl     eax, 4                                  ; 1204 _ C1. E0, 04
        mov     edx, eax                                ; 1207 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1209 _ 8B. 45, FC
        add     eax, edx                                ; 120C _ 01. D0
        mov     edx, eax                                ; 120E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1210 _ 8B. 45, 08
        add     eax, edx                                ; 1213 _ 01. D0
        mov     byte [eax], 0                           ; 1215 _ C6. 00, 00
        jmp     ?_040                                   ; 1218 _ EB, 4C

?_038:  mov     eax, dword [ebp-8H]                     ; 121A _ 8B. 45, F8
        shl     eax, 4                                  ; 121D _ C1. E0, 04
        mov     edx, eax                                ; 1220 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1222 _ 8B. 45, FC
        add     eax, edx                                ; 1225 _ 01. D0
        add     eax, cursor.1862                        ; 1227 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 122C _ 0F B6. 00
        cmp     al, 79                                  ; 122F _ 3C, 4F
        jnz     ?_039                                   ; 1231 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 1233 _ 8B. 45, F8
        shl     eax, 4                                  ; 1236 _ C1. E0, 04
        mov     edx, eax                                ; 1239 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 123B _ 8B. 45, FC
        add     eax, edx                                ; 123E _ 01. D0
        mov     edx, eax                                ; 1240 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1242 _ 8B. 45, 08
        add     eax, edx                                ; 1245 _ 01. D0
        mov     byte [eax], 7                           ; 1247 _ C6. 00, 07
        jmp     ?_040                                   ; 124A _ EB, 1A

?_039:  mov     eax, dword [ebp-8H]                     ; 124C _ 8B. 45, F8
        shl     eax, 4                                  ; 124F _ C1. E0, 04
        mov     edx, eax                                ; 1252 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1254 _ 8B. 45, FC
        add     eax, edx                                ; 1257 _ 01. D0
        mov     edx, eax                                ; 1259 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 125B _ 8B. 45, 08
        add     edx, eax                                ; 125E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1260 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1264 _ 88. 02
?_040:  add     dword [ebp-4H], 1                       ; 1266 _ 83. 45, FC, 01
?_041:  cmp     dword [ebp-4H], 15                      ; 126A _ 83. 7D, FC, 0F
        jle     ?_037                                   ; 126E _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 1274 _ 83. 45, F8, 01
?_042:  cmp     dword [ebp-8H], 15                      ; 1278 _ 83. 7D, F8, 0F
        jle     ?_036                                   ; 127C _ 0F 8E, FFFFFF5A
        leave                                           ; 1282 _ C9
        ret                                             ; 1283 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 1284 _ 55
        mov     ebp, esp                                ; 1285 _ 89. E5
        sub     esp, 16                                 ; 1287 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 128A _ C7. 45, F8, 00000000
        jmp     ?_046                                   ; 1291 _ EB, 50

?_043:  mov     dword [ebp-4H], 0                       ; 1293 _ C7. 45, FC, 00000000
        jmp     ?_045                                   ; 129A _ EB, 3B

?_044:  mov     eax, dword [ebp-8H]                     ; 129C _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 129F _ 8B. 55, 14
        add     eax, edx                                ; 12A2 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 12A4 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 12A8 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 12AB _ 8B. 4D, 10
        add     edx, ecx                                ; 12AE _ 01. CA
        add     eax, edx                                ; 12B0 _ 01. D0
        mov     edx, eax                                ; 12B2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 12B4 _ 8B. 45, 08
        add     edx, eax                                ; 12B7 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 12B9 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 12BC _ 0F AF. 45, 18
        mov     ecx, eax                                ; 12C0 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 12C2 _ 8B. 45, FC
        add     eax, ecx                                ; 12C5 _ 01. C8
        mov     ecx, eax                                ; 12C7 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 12C9 _ 8B. 45, 20
        add     eax, ecx                                ; 12CC _ 01. C8
        movzx   eax, byte [eax]                         ; 12CE _ 0F B6. 00
        mov     byte [edx], al                          ; 12D1 _ 88. 02
        add     dword [ebp-4H], 1                       ; 12D3 _ 83. 45, FC, 01
?_045:  mov     eax, dword [ebp-4H]                     ; 12D7 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 12DA _ 3B. 45, 18
        jl      ?_044                                   ; 12DD _ 7C, BD
        add     dword [ebp-8H], 1                       ; 12DF _ 83. 45, F8, 01
?_046:  mov     eax, dword [ebp-8H]                     ; 12E3 _ 8B. 45, F8
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
?_048:  movzx   eax, word [?_317]                       ; 138A _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 1391 _ 98
        lea     edx, [eax-10H]                          ; 1392 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 1395 _ A1, 000001C8(d)
        cmp     edx, eax                                ; 139A _ 39. C2
        jge     ?_049                                   ; 139C _ 7D, 10
        movzx   eax, word [?_317]                       ; 139E _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 13A5 _ 98
        sub     eax, 16                                 ; 13A6 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 13A9 _ A3, 000001C8(d)
?_049:  movzx   eax, word [?_317]                       ; 13AE _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 13B5 _ 98
        lea     edx, [eax-10H]                          ; 13B6 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 13B9 _ A1, 000001CC(d)
        cmp     edx, eax                                ; 13BE _ 39. C2
        jge     ?_050                                   ; 13C0 _ 7D, 10
        movzx   eax, word [?_317]                       ; 13C2 _ 0F B7. 05, 000000A4(d)
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
        mov     dword [ebp-38H], 0                      ; 1489 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 1490 _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 1497 _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 149E _ A1, 000000A0(d)
        mov     dword [ebp-2CH], eax                    ; 14A3 _ 89. 45, D4
        movzx   eax, word [?_317]                       ; 14A6 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 14AD _ 98
        mov     dword [ebp-28H], eax                    ; 14AE _ 89. 45, D8
        movzx   eax, word [?_318]                       ; 14B1 _ 0F B7. 05, 000000A6(d)
        cwde                                            ; 14B8 _ 98
        mov     dword [ebp-24H], eax                    ; 14B9 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 14BC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 14BF _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 14C1 _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 14C4 _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 14C8 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 14CB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 14CF _ 89. 04 24
        call    init_desktop                            ; 14D2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 14D7 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_300                  ; 14DF _ C7. 44 24, 10, 0000001E(d)
        mov     eax, dword [ebp-34H]                    ; 14E7 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 14EA _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 14EE _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 14F1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14F5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14F8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14FC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14FF _ 89. 04 24
        call    paint_string                            ; 1502 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 1507 _ 8B. 45, 14
        mov     dword [esp], eax                        ; 150A _ 89. 04 24
        call    intToHexStr                             ; 150D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 1512 _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 1515 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 151D _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 1520 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1524 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1527 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 152B _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 152E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1532 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1535 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1539 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 153C _ 89. 04 24
        call    paint_string                            ; 153F _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1544 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1548 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_301                  ; 1550 _ C7. 44 24, 10, 00000028(d)
        mov     eax, dword [ebp-34H]                    ; 1558 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 155B _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 155F _ 8B. 45, C8
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
        mov     dword [ebp-1CH], eax                    ; 1585 _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 1588 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 1590 _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 1593 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1597 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 159A _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 159E _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 15A1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15A5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 15A8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 15AC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 15AF _ 89. 04 24
        call    paint_string                            ; 15B2 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 15B7 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 15BB _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_302                  ; 15C3 _ C7. 44 24, 10, 00000034(d)
        mov     eax, dword [ebp-34H]                    ; 15CB _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 15CE _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 15D2 _ 8B. 45, C8
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
        mov     dword [ebp-18H], eax                    ; 15F9 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 15FC _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 1604 _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 1607 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 160B _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 160E _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1612 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1615 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1619 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 161C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1620 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1623 _ 89. 04 24
        call    paint_string                            ; 1626 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 162B _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 162F _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_303                  ; 1637 _ C7. 44 24, 10, 00000040(d)
        mov     eax, dword [ebp-34H]                    ; 163F _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1642 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1646 _ 8B. 45, C8
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
        mov     dword [ebp-14H], eax                    ; 166D _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 1670 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 1678 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 167B _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 167F _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1682 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1686 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1689 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 168D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1690 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1694 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1697 _ 89. 04 24
        call    paint_string                            ; 169A _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 169F _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 16A3 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_304                  ; 16AB _ C7. 44 24, 10, 0000004C(d)
        mov     eax, dword [ebp-34H]                    ; 16B3 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 16B6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 16BA _ 8B. 45, C8
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
        mov     dword [ebp-10H], eax                    ; 16E1 _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 16E4 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 16EC _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 16EF _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 16F3 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 16F6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 16FA _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 16FD _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1701 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1704 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1708 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 170B _ 89. 04 24
        call    paint_string                            ; 170E _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1713 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1717 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_305                  ; 171F _ C7. 44 24, 10, 00000059(d)
        mov     eax, dword [ebp-34H]                    ; 1727 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 172A _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 172E _ 8B. 45, C8
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
        mov     dword [ebp-0CH], eax                    ; 1755 _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 1758 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 1760 _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 1763 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1767 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 176A _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 176E _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1771 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1775 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1778 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 177C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 177F _ 89. 04 24
        call    paint_string                            ; 1782 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1787 _ 83. 45, CC, 10
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
        mov     dword [ebp-10H], eax                    ; 179E _ 89. 45, F0
        mov     eax, dword [memman]                     ; 17A1 _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 17A6 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 17AE _ 89. 04 24
        call    memman_alloc_4k                         ; 17B1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 17B6 _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 17B9 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 17C1 _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 17C9 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 17D1 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 17D4 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 17D8 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 17DB _ 89. 04 24
        call    sheet_setbuf                            ; 17DE _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 17E3 _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 17EB _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 17EE _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 17F2 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 17F5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 17F9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17FC _ 89. 04 24
        call    make_windows                            ; 17FF _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1804 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 180C _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 1814 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 181C _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 1824 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-10H]                    ; 182C _ 8B. 45, F0
        mov     dword [esp], eax                        ; 182F _ 89. 04 24
        call    make_textbox                            ; 1832 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 1837 _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 183F _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-10H]                    ; 1847 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 184A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 184E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1851 _ 89. 04 24
        call    sheet_slide                             ; 1854 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 1859 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 1861 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1864 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1868 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 186B _ 89. 04 24
        call    sheet_updown                            ; 186E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1873 _ 8B. 45, F0
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
        mov     dword [ebp-14H], eax                    ; 1889 _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 188C _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 188F _ 8B. 55, 10
        add     eax, edx                                ; 1892 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1894 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1897 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 189A _ 8D. 78, FD
        mov     eax, dword [ebp-14H]                    ; 189D _ 8B. 45, EC
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
        mov     eax, dword [ebp-10H]                    ; 18DE _ 8B. 45, F0
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
        mov     eax, dword [ebp-10H]                    ; 1925 _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 1928 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 192B _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 192E _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 1931 _ 8B. 45, F0
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
        mov     eax, dword [ebp-10H]                    ; 196C _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 196F _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 1972 _ 8B. 45, EC
        lea     esi, [eax+2H]                           ; 1975 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1978 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 197B _ 8D. 58, FD
        mov     eax, dword [ebp-14H]                    ; 197E _ 8B. 45, EC
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
        mov     ecx, dword [ebp-14H]                    ; 19D4 _ 8B. 4D, EC
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
        mov     ecx, dword [ebp-10H]                    ; 1A14 _ 8B. 4D, F0
        mov     dword [esp+18H], ecx                    ; 1A17 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 1A1B _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 1A1F _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1A23 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 1A27 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1A2F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A33 _ 89. 04 24
        call    paint_rectangle                         ; 1A36 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1A3B _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1A3E _ 8D. 48, 01
        mov     eax, dword [ebp-10H]                    ; 1A41 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1A44 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1A47 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 1A4A _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 1A4D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A50 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A53 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A56 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1A58 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 1A5C _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 1A5F _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1A63 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1A67 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 1A6B _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1A73 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A77 _ 89. 04 24
        call    paint_rectangle                         ; 1A7A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1A7F _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1A82 _ 8D. 78, 01
        mov     eax, dword [ebp-14H]                    ; 1A85 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1A88 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1A8B _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1A8E _ 8D. 58, FE
        mov     eax, dword [ebp-14H]                    ; 1A91 _ 8B. 45, EC
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
        mov     ebx, dword [ebp-10H]                    ; 1AE3 _ 8B. 5D, F0
        mov     dword [esp+18H], ebx                    ; 1AE6 _ 89. 5C 24, 18
        mov     ebx, dword [ebp-14H]                    ; 1AEA _ 8B. 5D, EC
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
        mov     dword [ebp-10H], eax                    ; 1B24 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1B27 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1B2A _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 1B2D _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 1B30 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1B33 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1B36 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B39 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 1B3B _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 1B43 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 1B47 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1B4F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1B57 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1B5F _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B62 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B66 _ 89. 04 24
        call    paint_rectangle                         ; 1B69 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1B6E _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1B71 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1B74 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B77 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 1B79 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 1B81 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 1B85 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1B8D _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1B95 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1B9D _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1BA0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BA4 _ 89. 04 24
        call    paint_rectangle                         ; 1BA7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1BAC _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1BAF _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1BB2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BB5 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1BB7 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 1BBB _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 1BC3 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1BCB _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1BD3 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1BDB _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1BDE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BE2 _ 89. 04 24
        call    paint_rectangle                         ; 1BE5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1BEA _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1BED _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1BF0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BF3 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1BF5 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 1BF9 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 1C01 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1C09 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1C11 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1C19 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C1C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C20 _ 89. 04 24
        call    paint_rectangle                         ; 1C23 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1C28 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1C2B _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1C2E _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1C31 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1C34 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1C37 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1C3A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C3D _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1C3F _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1C43 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 1C47 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 1C4F _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 1C53 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1C5B _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C5E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C62 _ 89. 04 24
        call    paint_rectangle                         ; 1C65 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1C6A _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1C6D _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1C70 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1C73 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1C76 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1C79 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1C7C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C7F _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1C81 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1C85 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 1C89 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 1C91 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 1C95 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1C9D _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1CA0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CA4 _ 89. 04 24
        call    paint_rectangle                         ; 1CA7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1CAC _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1CAF _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1CB2 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1CB5 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1CB8 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CBB _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1CBD _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1CC1 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 1CC5 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 1CCD _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 1CD5 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1CDD _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1CE0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CE4 _ 89. 04 24
        call    paint_rectangle                         ; 1CE7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1CEC _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1CEF _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1CF2 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CF5 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1CF7 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1CFF _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 1D03 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1D0B _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 1D13 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 1D1B _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D1E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D22 _ 89. 04 24
        call    paint_rectangle                         ; 1D25 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1D2A _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1D2D _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1D30 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1D33 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1D36 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1D39 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1D3C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D3F _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1D41 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1D45 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1D49 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 1D4D _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 1D55 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1D5D _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D60 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D64 _ 89. 04 24
        call    paint_rectangle                         ; 1D67 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1D6C _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1D6F _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1D72 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1D75 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1D78 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1D7B _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1D7E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D81 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1D83 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1D87 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1D8B _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 1D8F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 1D97 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1D9F _ 8B. 55, F0
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
        mov     byte [ebp-11H], 12                      ; 1DEC _ C6. 45, EF, 0C
        jmp     ?_053                                   ; 1DF0 _ EB, 08

?_052:  mov     byte [ebp-12H], 8                       ; 1DF2 _ C6. 45, EE, 08
        mov     byte [ebp-11H], 15                      ; 1DF6 _ C6. 45, EF, 0F
?_053:  mov     eax, dword [ebp+0CH]                    ; 1DFA _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1DFD _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 1E00 _ 8D. 58, FC
        movzx   eax, byte [ebp-11H]                     ; 1E03 _ 0F B6. 45, EF
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
        mov     dword [ebp-0CH], 0                      ; 1E72 _ C7. 45, F4, 00000000
        jmp     ?_061                                   ; 1E79 _ E9, 00000083

?_054:  mov     dword [ebp-10H], 0                      ; 1E7E _ C7. 45, F0, 00000000
        jmp     ?_060                                   ; 1E85 _ EB, 70

?_055:  mov     eax, dword [ebp-0CH]                    ; 1E87 _ 8B. 45, F4
        shl     eax, 4                                  ; 1E8A _ C1. E0, 04
        mov     edx, eax                                ; 1E8D _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 1E8F _ 8B. 45, F0
        add     eax, edx                                ; 1E92 _ 01. D0
        add     eax, closebtn.1949                      ; 1E94 _ 05, 00000260(d)
        movzx   eax, byte [eax]                         ; 1E99 _ 0F B6. 00
        mov     byte [ebp-13H], al                      ; 1E9C _ 88. 45, ED
        cmp     byte [ebp-13H], 64                      ; 1E9F _ 80. 7D, ED, 40
        jnz     ?_056                                   ; 1EA3 _ 75, 06
        mov     byte [ebp-13H], 0                       ; 1EA5 _ C6. 45, ED, 00
        jmp     ?_059                                   ; 1EA9 _ EB, 1C

?_056:  cmp     byte [ebp-13H], 36                      ; 1EAB _ 80. 7D, ED, 24
        jnz     ?_057                                   ; 1EAF _ 75, 06
        mov     byte [ebp-13H], 15                      ; 1EB1 _ C6. 45, ED, 0F
        jmp     ?_059                                   ; 1EB5 _ EB, 10

?_057:  cmp     byte [ebp-13H], 81                      ; 1EB7 _ 80. 7D, ED, 51
        jnz     ?_058                                   ; 1EBB _ 75, 06
        mov     byte [ebp-13H], 8                       ; 1EBD _ C6. 45, ED, 08
        jmp     ?_059                                   ; 1EC1 _ EB, 04

?_058:  mov     byte [ebp-13H], 7                       ; 1EC3 _ C6. 45, ED, 07
?_059:  mov     eax, dword [ebp+0CH]                    ; 1EC7 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1ECA _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 1ECC _ 8B. 45, F4
        lea     ecx, [eax+5H]                           ; 1ECF _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1ED2 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1ED5 _ 8B. 40, 04
        imul    ecx, eax                                ; 1ED8 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1EDB _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1EDE _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1EE1 _ 8D. 58, EB
        mov     eax, dword [ebp-10H]                    ; 1EE4 _ 8B. 45, F0
        add     eax, ebx                                ; 1EE7 _ 01. D8
        add     eax, ecx                                ; 1EE9 _ 01. C8
        add     edx, eax                                ; 1EEB _ 01. C2
        movzx   eax, byte [ebp-13H]                     ; 1EED _ 0F B6. 45, ED
        mov     byte [edx], al                          ; 1EF1 _ 88. 02
        add     dword [ebp-10H], 1                      ; 1EF3 _ 83. 45, F0, 01
?_060:  cmp     dword [ebp-10H], 15                     ; 1EF7 _ 83. 7D, F0, 0F
        jle     ?_055                                   ; 1EFB _ 7E, 8A
        add     dword [ebp-0CH], 1                      ; 1EFD _ 83. 45, F4, 01
?_061:  cmp     dword [ebp-0CH], 13                     ; 1F01 _ 83. 7D, F4, 0D
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
        sub     esp, 344                                ; 209C _ 81. EC, 00000158
        mov     eax, dword [ebp+8H]                     ; 20A2 _ 8B. 45, 08
        mov     dword [ebp-13CH], eax                   ; 20A5 _ 89. 85, FFFFFEC4
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 20AB _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 20B1 _ 89. 45, F4
        xor     eax, eax                                ; 20B4 _ 31. C0
        mov     dword [ebp-12CH], 78848                 ; 20B6 _ C7. 85, FFFFFED4, 00013400
        call    task_now                                ; 20C0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0F8H], eax                   ; 20C5 _ 89. 85, FFFFFF08
        mov     dword [ebp-128H], 16                    ; 20CB _ C7. 85, FFFFFED8, 00000010
        mov     dword [ebp-124H], 28                    ; 20D5 _ C7. 85, FFFFFEDC, 0000001C
        mov     dword [ebp-120H], 0                     ; 20DF _ C7. 85, FFFFFEE0, 00000000
        mov     dword [ebp-11CH], 0                     ; 20E9 _ C7. 85, FFFFFEE4, 00000000
        mov     dword [ebp-118H], 0                     ; 20F3 _ C7. 85, FFFFFEE8, 00000000
        mov     eax, dword [ebp-13CH]                   ; 20FD _ 8B. 85, FFFFFEC4
        mov     dword [g_Console], eax                  ; 2103 _ A3, 000000A8(d)
        mov     dword [?_319], 8                        ; 2108 _ C7. 05, 000000AC(d), 00000008
        mov     dword [?_320], 28                       ; 2112 _ C7. 05, 000000B0(d), 0000001C
        mov     dword [?_321], -1                       ; 211C _ C7. 05, 000000B4(d), FFFFFFFF
        mov     eax, dword [ebp-0F8H]                   ; 2126 _ 8B. 85, FFFFFF08
        lea     edx, [eax+10H]                          ; 212C _ 8D. 50, 10
        mov     eax, dword [ebp-0F8H]                   ; 212F _ 8B. 85, FFFFFF08
        mov     dword [esp+0CH], eax                    ; 2135 _ 89. 44 24, 0C
        lea     eax, [ebp-8CH]                          ; 2139 _ 8D. 85, FFFFFF74
        mov     dword [esp+8H], eax                     ; 213F _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 2143 _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 214B _ 89. 14 24
        call    fifo8_init                              ; 214E _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 2153 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0F4H], eax                   ; 2158 _ 89. 85, FFFFFF0C
        mov     eax, dword [ebp-0F8H]                   ; 215E _ 8B. 85, FFFFFF08
        add     eax, 16                                 ; 2164 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 2167 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 216F _ 89. 44 24, 04
        mov     eax, dword [ebp-0F4H]                   ; 2173 _ 8B. 85, FFFFFF0C
        mov     dword [esp], eax                        ; 2179 _ 89. 04 24
        call    timer_init                              ; 217C _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 2181 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0F4H]                   ; 2189 _ 8B. 85, FFFFFF0C
        mov     dword [esp], eax                        ; 218F _ 89. 04 24
        call    timer_settime                           ; 2192 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2197 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 219C _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_306                  ; 21A4 _ C7. 44 24, 10, 00000060(d)
        mov     dword [esp+0CH], 28                     ; 21AC _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 21B4 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-13CH]                   ; 21BC _ 8B. 95, FFFFFEC4
        mov     dword [esp+4H], edx                     ; 21C2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 21C6 _ 89. 04 24
        call    paint_string                            ; 21C9 _ E8, FFFFFFFC(rel)
?_078:  call    io_cli                                  ; 21CE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0F8H]                   ; 21D3 _ 8B. 85, FFFFFF08
        add     eax, 16                                 ; 21D9 _ 83. C0, 10
        mov     dword [esp], eax                        ; 21DC _ 89. 04 24
        call    fifo8_status                            ; 21DF _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 21E4 _ 85. C0
        jnz     ?_079                                   ; 21E6 _ 75, 0A
        call    io_sti                                  ; 21E8 _ E8, FFFFFFFC(rel)
        jmp     ?_122                                   ; 21ED _ E9, 00000B31

?_079:  mov     eax, dword [ebp-0F8H]                   ; 21F2 _ 8B. 85, FFFFFF08
        add     eax, 16                                 ; 21F8 _ 83. C0, 10
        mov     dword [esp], eax                        ; 21FB _ 89. 04 24
        call    fifo8_get                               ; 21FE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0F0H], eax                   ; 2203 _ 89. 85, FFFFFF10
        call    io_sti                                  ; 2209 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0F0H], 1                     ; 220E _ 83. BD, FFFFFF10, 01
        jg      ?_082                                   ; 2215 _ 0F 8F, 0000008D
        cmp     dword [ebp-120H], 0                     ; 221B _ 83. BD, FFFFFEE0, 00
        js      ?_082                                   ; 2222 _ 0F 88, 00000080
        cmp     dword [ebp-0F0H], 0                     ; 2228 _ 83. BD, FFFFFF10, 00
        jz      ?_080                                   ; 222F _ 74, 2F
        mov     eax, dword [ebp-0F8H]                   ; 2231 _ 8B. 85, FFFFFF08
        add     eax, 16                                 ; 2237 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 223A _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 2242 _ 89. 44 24, 04
        mov     eax, dword [ebp-0F4H]                   ; 2246 _ 8B. 85, FFFFFF0C
        mov     dword [esp], eax                        ; 224C _ 89. 04 24
        call    timer_init                              ; 224F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-120H], 7                     ; 2254 _ C7. 85, FFFFFEE0, 00000007
        jmp     ?_081                                   ; 225E _ EB, 2D

?_080:  mov     eax, dword [ebp-0F8H]                   ; 2260 _ 8B. 85, FFFFFF08
        add     eax, 16                                 ; 2266 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 2269 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 2271 _ 89. 44 24, 04
        mov     eax, dword [ebp-0F4H]                   ; 2275 _ 8B. 85, FFFFFF0C
        mov     dword [esp], eax                        ; 227B _ 89. 04 24
        call    timer_init                              ; 227E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-120H], 0                     ; 2283 _ C7. 85, FFFFFEE0, 00000000
?_081:  mov     dword [esp+4H], 50                      ; 228D _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0F4H]                   ; 2295 _ 8B. 85, FFFFFF0C
        mov     dword [esp], eax                        ; 229B _ 89. 04 24
        call    timer_settime                           ; 229E _ E8, FFFFFFFC(rel)
        jmp     ?_121                                   ; 22A3 _ E9, 00000A38

?_082:  cmp     dword [ebp-0F0H], 87                    ; 22A8 _ 83. BD, FFFFFF10, 57
        jnz     ?_083                                   ; 22AF _ 75, 48
        mov     dword [ebp-120H], 7                     ; 22B1 _ C7. 85, FFFFFEE0, 00000007
        mov     eax, dword [ebp-0F8H]                   ; 22BB _ 8B. 85, FFFFFF08
        add     eax, 16                                 ; 22C1 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 22C4 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 22CC _ 89. 44 24, 04
        mov     eax, dword [ebp-0F4H]                   ; 22D0 _ 8B. 85, FFFFFF0C
        mov     dword [esp], eax                        ; 22D6 _ 89. 04 24
        call    timer_init                              ; 22D9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 22DE _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0F4H]                   ; 22E6 _ 8B. 85, FFFFFF0C
        mov     dword [esp], eax                        ; 22EC _ 89. 04 24
        call    timer_settime                           ; 22EF _ E8, FFFFFFFC(rel)
        jmp     ?_121                                   ; 22F4 _ E9, 000009E7

?_083:  cmp     dword [ebp-0F0H], 88                    ; 22F9 _ 83. BD, FFFFFF10, 58
        jnz     ?_084                                   ; 2300 _ 75, 5F
        mov     eax, dword [sheet_control]              ; 2302 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 2307 _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-124H]                   ; 230F _ 8B. 95, FFFFFEDC
        mov     dword [esp+0CH], edx                    ; 2315 _ 89. 54 24, 0C
        mov     edx, dword [ebp-128H]                   ; 2319 _ 8B. 95, FFFFFED8
        mov     dword [esp+8H], edx                     ; 231F _ 89. 54 24, 08
        mov     edx, dword [ebp-13CH]                   ; 2323 _ 8B. 95, FFFFFEC4
        mov     dword [esp+4H], edx                     ; 2329 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 232D _ 89. 04 24
        call    set_cursor                              ; 2330 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-120H], -1                    ; 2335 _ C7. 85, FFFFFEE0, FFFFFFFF
        mov     eax, dword [task_main]                  ; 233F _ A1, 00000000(d)
        mov     dword [esp+8H], 0                       ; 2344 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 234C _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 2354 _ 89. 04 24
        call    task_run                                ; 2357 _ E8, FFFFFFFC(rel)
        jmp     ?_121                                   ; 235C _ E9, 0000097F

?_084:  cmp     dword [ebp-0F0H], 28                    ; 2361 _ 83. BD, FFFFFF10, 1C
        jne     ?_119                                   ; 2368 _ 0F 85, 00000860
        mov     eax, dword [sheet_control]              ; 236E _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 2373 _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-124H]                   ; 237B _ 8B. 95, FFFFFEDC
        mov     dword [esp+0CH], edx                    ; 2381 _ 89. 54 24, 0C
        mov     edx, dword [ebp-128H]                   ; 2385 _ 8B. 95, FFFFFED8
        mov     dword [esp+8H], edx                     ; 238B _ 89. 54 24, 08
        mov     edx, dword [ebp-13CH]                   ; 238F _ 8B. 95, FFFFFEC4
        mov     dword [esp+4H], edx                     ; 2395 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2399 _ 89. 04 24
        call    set_cursor                              ; 239C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-128H]                   ; 23A1 _ 8B. 85, FFFFFED8
        lea     edx, [eax+7H]                           ; 23A7 _ 8D. 50, 07
        test    eax, eax                                ; 23AA _ 85. C0
        cmovs   eax, edx                                ; 23AC _ 0F 48. C2
        sar     eax, 3                                  ; 23AF _ C1. F8, 03
        sub     eax, 2                                  ; 23B2 _ 83. E8, 02
        mov     byte [ebp+eax-0AAH], 0                  ; 23B5 _ C6. 84 05, FFFFFF56, 00
        mov     eax, dword [ebp-13CH]                   ; 23BD _ 8B. 85, FFFFFEC4
        mov     dword [esp+4H], eax                     ; 23C3 _ 89. 44 24, 04
        mov     eax, dword [ebp-124H]                   ; 23C7 _ 8B. 85, FFFFFEDC
        mov     dword [esp], eax                        ; 23CD _ 89. 04 24
        call    console_new_line                        ; 23D0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-124H], eax                   ; 23D5 _ 89. 85, FFFFFEDC
        mov     dword [esp+4H], ?_307                   ; 23DB _ C7. 44 24, 04, 00000062(d)
        lea     eax, [ebp-0AAH]                         ; 23E3 _ 8D. 85, FFFFFF56
        mov     dword [esp], eax                        ; 23E9 _ 89. 04 24
        call    strcmp                                  ; 23EC _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 23F1 _ 83. F8, 01
        jne     ?_085                                   ; 23F4 _ 0F 85, 000000EF
        mov     eax, dword [ebp+0CH]                    ; 23FA _ 8B. 45, 0C
        lea     edx, [eax+3FFH]                         ; 23FD _ 8D. 90, 000003FF
        test    eax, eax                                ; 2403 _ 85. C0
        cmovs   eax, edx                                ; 2405 _ 0F 48. C2
        sar     eax, 10                                 ; 2408 _ C1. F8, 0A
        mov     dword [esp], eax                        ; 240B _ 89. 04 24
        call    intToHexStr                             ; 240E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0ECH], eax                   ; 2413 _ 89. 85, FFFFFF14
        mov     eax, dword [sheet_control]              ; 2419 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 241E _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_308                  ; 2426 _ C7. 44 24, 10, 00000066(d)
        mov     edx, dword [ebp-124H]                   ; 242E _ 8B. 95, FFFFFEDC
        mov     dword [esp+0CH], edx                    ; 2434 _ 89. 54 24, 0C
        mov     dword [esp+8H], 16                      ; 2438 _ C7. 44 24, 08, 00000010
        mov     edx, dword [ebp-13CH]                   ; 2440 _ 8B. 95, FFFFFEC4
        mov     dword [esp+4H], edx                     ; 2446 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 244A _ 89. 04 24
        call    paint_string                            ; 244D _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2452 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2457 _ C7. 44 24, 14, 00000007
        mov     edx, dword [ebp-0ECH]                   ; 245F _ 8B. 95, FFFFFF14
        mov     dword [esp+10H], edx                    ; 2465 _ 89. 54 24, 10
        mov     edx, dword [ebp-124H]                   ; 2469 _ 8B. 95, FFFFFEDC
        mov     dword [esp+0CH], edx                    ; 246F _ 89. 54 24, 0C
        mov     dword [esp+8H], 52                      ; 2473 _ C7. 44 24, 08, 00000034
        mov     edx, dword [ebp-13CH]                   ; 247B _ 8B. 95, FFFFFEC4
        mov     dword [esp+4H], edx                     ; 2481 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2485 _ 89. 04 24
        call    paint_string                            ; 2488 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 248D _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2492 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_309                  ; 249A _ C7. 44 24, 10, 0000006C(d)
        mov     edx, dword [ebp-124H]                   ; 24A2 _ 8B. 95, FFFFFEDC
        mov     dword [esp+0CH], edx                    ; 24A8 _ 89. 54 24, 0C
        mov     dword [esp+8H], 126                     ; 24AC _ C7. 44 24, 08, 0000007E
        mov     edx, dword [ebp-13CH]                   ; 24B4 _ 8B. 95, FFFFFEC4
        mov     dword [esp+4H], edx                     ; 24BA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 24BE _ 89. 04 24
        call    paint_string                            ; 24C1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-13CH]                   ; 24C6 _ 8B. 85, FFFFFEC4
        mov     dword [esp+4H], eax                     ; 24CC _ 89. 44 24, 04
        mov     eax, dword [ebp-124H]                   ; 24D0 _ 8B. 85, FFFFFEDC
        mov     dword [esp], eax                        ; 24D6 _ 89. 04 24
        call    console_new_line                        ; 24D9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-124H], eax                   ; 24DE _ 89. 85, FFFFFEDC
        jmp     ?_118                                   ; 24E4 _ E9, 000006D6

?_085:  mov     dword [esp+4H], ?_310                   ; 24E9 _ C7. 44 24, 04, 00000070(d)
        lea     eax, [ebp-0AAH]                         ; 24F1 _ 8D. 85, FFFFFF56
        mov     dword [esp], eax                        ; 24F7 _ 89. 04 24
        call    strcmp                                  ; 24FA _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 24FF _ 83. F8, 01
        jne     ?_090                                   ; 2502 _ 0F 85, 000000E2
        mov     dword [ebp-118H], 28                    ; 2508 _ C7. 85, FFFFFEE8, 0000001C
        jmp     ?_089                                   ; 2512 _ EB, 4D

?_086:  mov     dword [ebp-11CH], 8                     ; 2514 _ C7. 85, FFFFFEE4, 00000008
        jmp     ?_088                                   ; 251E _ EB, 2E

?_087:  mov     eax, dword [ebp-13CH]                   ; 2520 _ 8B. 85, FFFFFEC4
        mov     edx, dword [eax]                        ; 2526 _ 8B. 10
        mov     eax, dword [ebp-13CH]                   ; 2528 _ 8B. 85, FFFFFEC4
        mov     eax, dword [eax+4H]                     ; 252E _ 8B. 40, 04
        imul    eax, dword [ebp-118H]                   ; 2531 _ 0F AF. 85, FFFFFEE8
        mov     ecx, eax                                ; 2538 _ 89. C1
        mov     eax, dword [ebp-11CH]                   ; 253A _ 8B. 85, FFFFFEE4
        add     eax, ecx                                ; 2540 _ 01. C8
        add     eax, edx                                ; 2542 _ 01. D0
        mov     byte [eax], 0                           ; 2544 _ C6. 00, 00
        add     dword [ebp-11CH], 1                     ; 2547 _ 83. 85, FFFFFEE4, 01
?_088:  cmp     dword [ebp-11CH], 247                   ; 254E _ 81. BD, FFFFFEE4, 000000F7
        jle     ?_087                                   ; 2558 _ 7E, C6
        add     dword [ebp-118H], 1                     ; 255A _ 83. 85, FFFFFEE8, 01
?_089:  cmp     dword [ebp-118H], 155                   ; 2561 _ 81. BD, FFFFFEE8, 0000009B
        jle     ?_086                                   ; 256B _ 7E, A7
        mov     eax, dword [sheet_control]              ; 256D _ A1, 00000000(d)
        mov     dword [esp+14H], 156                    ; 2572 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 257A _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 2582 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 258A _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-13CH]                   ; 2592 _ 8B. 95, FFFFFEC4
        mov     dword [esp+4H], edx                     ; 2598 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 259C _ 89. 04 24
        call    sheet_refresh                           ; 259F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-124H], 28                    ; 25A4 _ C7. 85, FFFFFEDC, 0000001C
        mov     eax, dword [sheet_control]              ; 25AE _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 25B3 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_306                  ; 25BB _ C7. 44 24, 10, 00000060(d)
        mov     dword [esp+0CH], 28                     ; 25C3 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 25CB _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-13CH]                   ; 25D3 _ 8B. 95, FFFFFEC4
        mov     dword [esp+4H], edx                     ; 25D9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25DD _ 89. 04 24
        call    paint_string                            ; 25E0 _ E8, FFFFFFFC(rel)
        jmp     ?_118                                   ; 25E5 _ E9, 000005D5

?_090:  mov     dword [esp+4H], ?_311                   ; 25EA _ C7. 44 24, 04, 00000074(d)
        lea     eax, [ebp-0AAH]                         ; 25F2 _ 8D. 85, FFFFFF56
        mov     dword [esp], eax                        ; 25F8 _ 89. 04 24
        call    strcmp                                  ; 25FB _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 2600 _ 83. F8, 01
        jne     ?_099                                   ; 2603 _ 0F 85, 000001AE
        jmp     ?_098                                   ; 2609 _ E9, 00000189

?_091:  mov     byte [ebp-0ABH], 0                      ; 260E _ C6. 85, FFFFFF55, 00
        mov     dword [ebp-114H], 0                     ; 2615 _ C7. 85, FFFFFEEC, 00000000
        jmp     ?_094                                   ; 261F _ EB, 41

?_092:  mov     edx, dword [ebp-12CH]                   ; 2621 _ 8B. 95, FFFFFED4
        mov     eax, dword [ebp-114H]                   ; 2627 _ 8B. 85, FFFFFEEC
        add     eax, edx                                ; 262D _ 01. D0
        movzx   eax, byte [eax]                         ; 262F _ 0F B6. 00
        test    al, al                                  ; 2632 _ 84. C0
        jz      ?_093                                   ; 2634 _ 74, 2A
        mov     edx, dword [ebp-12CH]                   ; 2636 _ 8B. 95, FFFFFED4
        mov     eax, dword [ebp-114H]                   ; 263C _ 8B. 85, FFFFFEEC
        add     eax, edx                                ; 2642 _ 01. D0
        movzx   eax, byte [eax]                         ; 2644 _ 0F B6. 00
        lea     ecx, [ebp-0B7H]                         ; 2647 _ 8D. 8D, FFFFFF49
        mov     edx, dword [ebp-114H]                   ; 264D _ 8B. 95, FFFFFEEC
        add     edx, ecx                                ; 2653 _ 01. CA
        mov     byte [edx], al                          ; 2655 _ 88. 02
        add     dword [ebp-114H], 1                     ; 2657 _ 83. 85, FFFFFEEC, 01
        jmp     ?_094                                   ; 265E _ EB, 02

?_093:  jmp     ?_095                                   ; 2660 _ EB, 09

?_094:  cmp     dword [ebp-114H], 7                     ; 2662 _ 83. BD, FFFFFEEC, 07
        jle     ?_092                                   ; 2669 _ 7E, B6
?_095:  lea     edx, [ebp-0B7H]                         ; 266B _ 8D. 95, FFFFFF49
        mov     eax, dword [ebp-114H]                   ; 2671 _ 8B. 85, FFFFFEEC
        add     eax, edx                                ; 2677 _ 01. D0
        mov     byte [eax], 46                          ; 2679 _ C6. 00, 2E
        add     dword [ebp-114H], 1                     ; 267C _ 83. 85, FFFFFEEC, 01
        mov     dword [ebp-110H], 0                     ; 2683 _ C7. 85, FFFFFEF0, 00000000
        jmp     ?_097                                   ; 268D _ EB, 30

?_096:  mov     edx, dword [ebp-12CH]                   ; 268F _ 8B. 95, FFFFFED4
        mov     eax, dword [ebp-110H]                   ; 2695 _ 8B. 85, FFFFFEF0
        add     eax, edx                                ; 269B _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 269D _ 0F B6. 40, 08
        lea     ecx, [ebp-0B7H]                         ; 26A1 _ 8D. 8D, FFFFFF49
        mov     edx, dword [ebp-114H]                   ; 26A7 _ 8B. 95, FFFFFEEC
        add     edx, ecx                                ; 26AD _ 01. CA
        mov     byte [edx], al                          ; 26AF _ 88. 02
        add     dword [ebp-114H], 1                     ; 26B1 _ 83. 85, FFFFFEEC, 01
        add     dword [ebp-110H], 1                     ; 26B8 _ 83. 85, FFFFFEF0, 01
?_097:  cmp     dword [ebp-110H], 2                     ; 26BF _ 83. BD, FFFFFEF0, 02
        jle     ?_096                                   ; 26C6 _ 7E, C7
        lea     edx, [ebp-0B7H]                         ; 26C8 _ 8D. 95, FFFFFF49
        mov     eax, dword [ebp-114H]                   ; 26CE _ 8B. 85, FFFFFEEC
        add     eax, edx                                ; 26D4 _ 01. D0
        mov     byte [eax], 0                           ; 26D6 _ C6. 00, 00
        mov     eax, dword [sheet_control]              ; 26D9 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 26DE _ C7. 44 24, 14, 00000007
        lea     edx, [ebp-0B7H]                         ; 26E6 _ 8D. 95, FFFFFF49
        mov     dword [esp+10H], edx                    ; 26EC _ 89. 54 24, 10
        mov     edx, dword [ebp-124H]                   ; 26F0 _ 8B. 95, FFFFFEDC
        mov     dword [esp+0CH], edx                    ; 26F6 _ 89. 54 24, 0C
        mov     dword [esp+8H], 16                      ; 26FA _ C7. 44 24, 08, 00000010
        mov     edx, dword [ebp-13CH]                   ; 2702 _ 8B. 95, FFFFFEC4
        mov     dword [esp+4H], edx                     ; 2708 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 270C _ 89. 04 24
        call    paint_string                            ; 270F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0E8H], 136                   ; 2714 _ C7. 85, FFFFFF18, 00000088
        mov     eax, dword [ebp-12CH]                   ; 271E _ 8B. 85, FFFFFED4
        mov     eax, dword [eax+1CH]                    ; 2724 _ 8B. 40, 1C
        mov     dword [esp], eax                        ; 2727 _ 89. 04 24
        call    intToHexStr                             ; 272A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0E4H], eax                   ; 272F _ 89. 85, FFFFFF1C
        mov     eax, dword [sheet_control]              ; 2735 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 273A _ C7. 44 24, 14, 00000007
        mov     edx, dword [ebp-0E4H]                   ; 2742 _ 8B. 95, FFFFFF1C
        mov     dword [esp+10H], edx                    ; 2748 _ 89. 54 24, 10
        mov     edx, dword [ebp-124H]                   ; 274C _ 8B. 95, FFFFFEDC
        mov     dword [esp+0CH], edx                    ; 2752 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0E8H]                   ; 2756 _ 8B. 95, FFFFFF18
        mov     dword [esp+8H], edx                     ; 275C _ 89. 54 24, 08
        mov     edx, dword [ebp-13CH]                   ; 2760 _ 8B. 95, FFFFFEC4
        mov     dword [esp+4H], edx                     ; 2766 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 276A _ 89. 04 24
        call    paint_string                            ; 276D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-13CH]                   ; 2772 _ 8B. 85, FFFFFEC4
        mov     dword [esp+4H], eax                     ; 2778 _ 89. 44 24, 04
        mov     eax, dword [ebp-124H]                   ; 277C _ 8B. 85, FFFFFEDC
        mov     dword [esp], eax                        ; 2782 _ 89. 04 24
        call    console_new_line                        ; 2785 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-124H], eax                   ; 278A _ 89. 85, FFFFFEDC
        add     dword [ebp-12CH], 32                    ; 2790 _ 83. 85, FFFFFED4, 20
?_098:  mov     eax, dword [ebp-12CH]                   ; 2797 _ 8B. 85, FFFFFED4
        movzx   eax, byte [eax]                         ; 279D _ 0F B6. 00
        test    al, al                                  ; 27A0 _ 84. C0
        jne     ?_091                                   ; 27A2 _ 0F 85, FFFFFE66
        mov     dword [ebp-12CH], 78848                 ; 27A8 _ C7. 85, FFFFFED4, 00013400
        jmp     ?_118                                   ; 27B2 _ E9, 00000408

?_099:  movzx   eax, byte [ebp-0AAH]                    ; 27B7 _ 0F B6. 85, FFFFFF56
        cmp     al, 116                                 ; 27BE _ 3C, 74
        jne     ?_117                                   ; 27C0 _ 0F 85, 000002F0
        movzx   eax, byte [ebp-0A9H]                    ; 27C6 _ 0F B6. 85, FFFFFF57
        cmp     al, 121                                 ; 27CD _ 3C, 79
        jne     ?_117                                   ; 27CF _ 0F 85, 000002E1
        movzx   eax, byte [ebp-0A8H]                    ; 27D5 _ 0F B6. 85, FFFFFF58
        cmp     al, 112                                 ; 27DC _ 3C, 70
        jne     ?_117                                   ; 27DE _ 0F 85, 000002D2
        movzx   eax, byte [ebp-0A7H]                    ; 27E4 _ 0F B6. 85, FFFFFF59
        cmp     al, 101                                 ; 27EB _ 3C, 65
        jne     ?_117                                   ; 27ED _ 0F 85, 000002C3
        mov     byte [ebp-0B8H], 0                      ; 27F3 _ C6. 85, FFFFFF48, 00
        mov     dword [ebp-10CH], 0                     ; 27FA _ C7. 85, FFFFFEF4, 00000000
        mov     dword [ebp-108H], 5                     ; 2804 _ C7. 85, FFFFFEF8, 00000005
        jmp     ?_102                                   ; 280E _ EB, 48

?_100:  lea     edx, [ebp-0AAH]                         ; 2810 _ 8D. 95, FFFFFF56
        mov     eax, dword [ebp-108H]                   ; 2816 _ 8B. 85, FFFFFEF8
        add     eax, edx                                ; 281C _ 01. D0
        movzx   eax, byte [eax]                         ; 281E _ 0F B6. 00
        test    al, al                                  ; 2821 _ 84. C0
        jz      ?_101                                   ; 2823 _ 74, 31
        lea     edx, [ebp-0AAH]                         ; 2825 _ 8D. 95, FFFFFF56
        mov     eax, dword [ebp-108H]                   ; 282B _ 8B. 85, FFFFFEF8
        add     eax, edx                                ; 2831 _ 01. D0
        movzx   eax, byte [eax]                         ; 2833 _ 0F B6. 00
        lea     ecx, [ebp-0C4H]                         ; 2836 _ 8D. 8D, FFFFFF3C
        mov     edx, dword [ebp-10CH]                   ; 283C _ 8B. 95, FFFFFEF4
        add     edx, ecx                                ; 2842 _ 01. CA
        mov     byte [edx], al                          ; 2844 _ 88. 02
        add     dword [ebp-10CH], 1                     ; 2846 _ 83. 85, FFFFFEF4, 01
        add     dword [ebp-108H], 1                     ; 284D _ 83. 85, FFFFFEF8, 01
        jmp     ?_102                                   ; 2854 _ EB, 02

?_101:  jmp     ?_103                                   ; 2856 _ EB, 09

?_102:  cmp     dword [ebp-108H], 16                    ; 2858 _ 83. BD, FFFFFEF8, 10
        jle     ?_100                                   ; 285F _ 7E, AF
?_103:  lea     edx, [ebp-0C4H]                         ; 2861 _ 8D. 95, FFFFFF3C
        mov     eax, dword [ebp-10CH]                   ; 2867 _ 8B. 85, FFFFFEF4
        add     eax, edx                                ; 286D _ 01. D0
        mov     byte [eax], 0                           ; 286F _ C6. 00, 00
        jmp     ?_115                                   ; 2872 _ E9, 000001F7

?_104:  mov     byte [ebp-0ABH], 0                      ; 2877 _ C6. 85, FFFFFF55, 00
        mov     dword [ebp-104H], 0                     ; 287E _ C7. 85, FFFFFEFC, 00000000
        jmp     ?_107                                   ; 2888 _ EB, 41

?_105:  mov     edx, dword [ebp-12CH]                   ; 288A _ 8B. 95, FFFFFED4
        mov     eax, dword [ebp-104H]                   ; 2890 _ 8B. 85, FFFFFEFC
        add     eax, edx                                ; 2896 _ 01. D0
        movzx   eax, byte [eax]                         ; 2898 _ 0F B6. 00
        test    al, al                                  ; 289B _ 84. C0
        jz      ?_106                                   ; 289D _ 74, 2A
        mov     edx, dword [ebp-12CH]                   ; 289F _ 8B. 95, FFFFFED4
        mov     eax, dword [ebp-104H]                   ; 28A5 _ 8B. 85, FFFFFEFC
        add     eax, edx                                ; 28AB _ 01. D0
        movzx   eax, byte [eax]                         ; 28AD _ 0F B6. 00
        lea     ecx, [ebp-0B7H]                         ; 28B0 _ 8D. 8D, FFFFFF49
        mov     edx, dword [ebp-104H]                   ; 28B6 _ 8B. 95, FFFFFEFC
        add     edx, ecx                                ; 28BC _ 01. CA
        mov     byte [edx], al                          ; 28BE _ 88. 02
        add     dword [ebp-104H], 1                     ; 28C0 _ 83. 85, FFFFFEFC, 01
        jmp     ?_107                                   ; 28C7 _ EB, 02

?_106:  jmp     ?_108                                   ; 28C9 _ EB, 09

?_107:  cmp     dword [ebp-104H], 7                     ; 28CB _ 83. BD, FFFFFEFC, 07
        jle     ?_105                                   ; 28D2 _ 7E, B6
?_108:  lea     edx, [ebp-0B7H]                         ; 28D4 _ 8D. 95, FFFFFF49
        mov     eax, dword [ebp-104H]                   ; 28DA _ 8B. 85, FFFFFEFC
        add     eax, edx                                ; 28E0 _ 01. D0
        mov     byte [eax], 46                          ; 28E2 _ C6. 00, 2E
        add     dword [ebp-104H], 1                     ; 28E5 _ 83. 85, FFFFFEFC, 01
        mov     dword [ebp-100H], 0                     ; 28EC _ C7. 85, FFFFFF00, 00000000
        jmp     ?_110                                   ; 28F6 _ EB, 30

?_109:  mov     edx, dword [ebp-12CH]                   ; 28F8 _ 8B. 95, FFFFFED4
        mov     eax, dword [ebp-100H]                   ; 28FE _ 8B. 85, FFFFFF00
        add     eax, edx                                ; 2904 _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 2906 _ 0F B6. 40, 08
        lea     ecx, [ebp-0B7H]                         ; 290A _ 8D. 8D, FFFFFF49
        mov     edx, dword [ebp-104H]                   ; 2910 _ 8B. 95, FFFFFEFC
        add     edx, ecx                                ; 2916 _ 01. CA
        mov     byte [edx], al                          ; 2918 _ 88. 02
        add     dword [ebp-104H], 1                     ; 291A _ 83. 85, FFFFFEFC, 01
        add     dword [ebp-100H], 1                     ; 2921 _ 83. 85, FFFFFF00, 01
?_110:  cmp     dword [ebp-100H], 2                     ; 2928 _ 83. BD, FFFFFF00, 02
        jle     ?_109                                   ; 292F _ 7E, C7
        lea     edx, [ebp-0B7H]                         ; 2931 _ 8D. 95, FFFFFF49
        mov     eax, dword [ebp-104H]                   ; 2937 _ 8B. 85, FFFFFEFC
        add     eax, edx                                ; 293D _ 01. D0
        mov     byte [eax], 0                           ; 293F _ C6. 00, 00
        lea     eax, [ebp-0B7H]                         ; 2942 _ 8D. 85, FFFFFF49
        mov     dword [esp+4H], eax                     ; 2948 _ 89. 44 24, 04
        lea     eax, [ebp-0C4H]                         ; 294C _ 8D. 85, FFFFFF3C
        mov     dword [esp], eax                        ; 2952 _ 89. 04 24
        call    strcmp                                  ; 2955 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 295A _ 83. F8, 01
        jne     ?_114                                   ; 295D _ 0F 85, 00000104
        mov     dword [ebp-0E0H], 88064                 ; 2963 _ C7. 85, FFFFFF20, 00015800
        mov     eax, dword [ebp-12CH]                   ; 296D _ 8B. 85, FFFFFED4
        movzx   eax, word [eax+1AH]                     ; 2973 _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 2977 _ 0F B7. C0
        shl     eax, 9                                  ; 297A _ C1. E0, 09
        add     dword [ebp-0E0H], eax                   ; 297D _ 01. 85, FFFFFF20
        mov     eax, dword [ebp-12CH]                   ; 2983 _ 8B. 85, FFFFFED4
        mov     eax, dword [eax+1CH]                    ; 2989 _ 8B. 40, 1C
        mov     dword [ebp-0DCH], eax                   ; 298C _ 89. 85, FFFFFF24
        mov     dword [ebp-0FCH], 0                     ; 2992 _ C7. 85, FFFFFF04, 00000000
        mov     dword [ebp-128H], 16                    ; 299C _ C7. 85, FFFFFED8, 00000010
        mov     dword [ebp-0FCH], 0                     ; 29A6 _ C7. 85, FFFFFF04, 00000000
        jmp     ?_113                                   ; 29B0 _ E9, 0000009D

?_111:  mov     edx, dword [ebp-0FCH]                   ; 29B5 _ 8B. 95, FFFFFF04
        mov     eax, dword [ebp-0E0H]                   ; 29BB _ 8B. 85, FFFFFF20
        add     eax, edx                                ; 29C1 _ 01. D0
        movzx   eax, byte [eax]                         ; 29C3 _ 0F B6. 00
        mov     byte [ebp-0CCH], al                     ; 29C6 _ 88. 85, FFFFFF34
        mov     byte [ebp-0CBH], 0                      ; 29CC _ C6. 85, FFFFFF35, 00
        mov     eax, dword [sheet_control]              ; 29D3 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 29D8 _ C7. 44 24, 14, 00000007
        lea     edx, [ebp-0CCH]                         ; 29E0 _ 8D. 95, FFFFFF34
        mov     dword [esp+10H], edx                    ; 29E6 _ 89. 54 24, 10
        mov     edx, dword [ebp-124H]                   ; 29EA _ 8B. 95, FFFFFEDC
        mov     dword [esp+0CH], edx                    ; 29F0 _ 89. 54 24, 0C
        mov     edx, dword [ebp-128H]                   ; 29F4 _ 8B. 95, FFFFFED8
        mov     dword [esp+8H], edx                     ; 29FA _ 89. 54 24, 08
        mov     edx, dword [ebp-13CH]                   ; 29FE _ 8B. 95, FFFFFEC4
        mov     dword [esp+4H], edx                     ; 2A04 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2A08 _ 89. 04 24
        call    paint_string                            ; 2A0B _ E8, FFFFFFFC(rel)
        add     dword [ebp-128H], 8                     ; 2A10 _ 83. 85, FFFFFED8, 08
        cmp     dword [ebp-128H], 248                   ; 2A17 _ 81. BD, FFFFFED8, 000000F8
        jnz     ?_112                                   ; 2A21 _ 75, 28
        mov     dword [ebp-128H], 16                    ; 2A23 _ C7. 85, FFFFFED8, 00000010
        mov     eax, dword [ebp-13CH]                   ; 2A2D _ 8B. 85, FFFFFEC4
        mov     dword [esp+4H], eax                     ; 2A33 _ 89. 44 24, 04
        mov     eax, dword [ebp-124H]                   ; 2A37 _ 8B. 85, FFFFFEDC
        mov     dword [esp], eax                        ; 2A3D _ 89. 04 24
        call    console_new_line                        ; 2A40 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-124H], eax                   ; 2A45 _ 89. 85, FFFFFEDC
?_112:  add     dword [ebp-0FCH], 1                     ; 2A4B _ 83. 85, FFFFFF04, 01
?_113:  mov     eax, dword [ebp-0FCH]                   ; 2A52 _ 8B. 85, FFFFFF04
        cmp     eax, dword [ebp-0DCH]                   ; 2A58 _ 3B. 85, FFFFFF24
        jl      ?_111                                   ; 2A5E _ 0F 8C, FFFFFF51
        nop                                             ; 2A64 _ 90
        jmp     ?_116                                   ; 2A65 _ EB, 18

?_114:  add     dword [ebp-12CH], 32                    ; 2A67 _ 83. 85, FFFFFED4, 20
?_115:  mov     eax, dword [ebp-12CH]                   ; 2A6E _ 8B. 85, FFFFFED4
        movzx   eax, byte [eax]                         ; 2A74 _ 0F B6. 00
        test    al, al                                  ; 2A77 _ 84. C0
        jne     ?_104                                   ; 2A79 _ 0F 85, FFFFFDF8
?_116:  mov     eax, dword [ebp-13CH]                   ; 2A7F _ 8B. 85, FFFFFEC4
        mov     dword [esp+4H], eax                     ; 2A85 _ 89. 44 24, 04
        mov     eax, dword [ebp-124H]                   ; 2A89 _ 8B. 85, FFFFFEDC
        mov     dword [esp], eax                        ; 2A8F _ 89. 04 24
        call    console_new_line                        ; 2A92 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-124H], eax                   ; 2A97 _ 89. 85, FFFFFEDC
        mov     dword [ebp-128H], 16                    ; 2A9D _ C7. 85, FFFFFED8, 00000010
        mov     dword [ebp-12CH], 78848                 ; 2AA7 _ C7. 85, FFFFFED4, 00013400
        jmp     ?_118                                   ; 2AB1 _ E9, 00000109

?_117:  mov     dword [esp+4H], ?_312                   ; 2AB6 _ C7. 44 24, 04, 00000078(d)
        lea     eax, [ebp-0AAH]                         ; 2ABE _ 8D. 85, FFFFFF56
        mov     dword [esp], eax                        ; 2AC4 _ 89. 04 24
        call    strcmp                                  ; 2AC7 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 2ACC _ 83. F8, 01
        jne     ?_118                                   ; 2ACF _ 0F 85, 000000EA
        lea     eax, [ebp-0CCH]                         ; 2AD5 _ 8D. 85, FFFFFF34
        mov     dword [esp+4H], eax                     ; 2ADB _ 89. 44 24, 04
        mov     dword [esp], ?_313                      ; 2ADF _ C7. 04 24, 0000007C(d)
        call    file_load_content                       ; 2AE6 _ E8, FFFFFFFC(rel)
        call    get_addr_gdt                            ; 2AEB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0D8H], eax                   ; 2AF0 _ 89. 85, FFFFFF28
        mov     eax, dword [ebp-0CCH]                   ; 2AF6 _ 8B. 85, FFFFFF34
        mov     edx, dword [ebp-0D8H]                   ; 2AFC _ 8B. 95, FFFFFF28
        add     edx, 152                                ; 2B02 _ 81. C2, 00000098
        mov     dword [esp+0CH], 16538                  ; 2B08 _ C7. 44 24, 0C, 0000409A
        mov     dword [esp+8H], eax                     ; 2B10 _ 89. 44 24, 08
        mov     dword [esp+4H], 1048575                 ; 2B14 _ C7. 44 24, 04, 000FFFFF
        mov     dword [esp], edx                        ; 2B1C _ 89. 14 24
        call    segment_descriptor                      ; 2B1F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 152                     ; 2B24 _ C7. 44 24, 04, 00000098
        mov     dword [esp], 0                          ; 2B2C _ C7. 04 24, 00000000
        call    farjmp                                  ; 2B33 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0D4H], asm_console_putchar   ; 2B38 _ C7. 85, FFFFFF2C, 00000000(d)
        call    get_code32_addr                         ; 2B42 _ E8, FFFFFFFC(rel)
        sub     dword [ebp-0D4H], eax                   ; 2B47 _ 29. 85, FFFFFF2C
        mov     eax, dword [ebp-0D4H]                   ; 2B4D _ 8B. 85, FFFFFF2C
        mov     dword [esp], eax                        ; 2B53 _ 89. 04 24
        call    intToHexStr                             ; 2B56 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0D0H], eax                   ; 2B5B _ 89. 85, FFFFFF30
        mov     edx, dword [back_sheet]                 ; 2B61 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 2B67 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2B6C _ C7. 44 24, 14, 00000007
        mov     ecx, dword [ebp-0D0H]                   ; 2B74 _ 8B. 8D, FFFFFF30
        mov     dword [esp+10H], ecx                    ; 2B7A _ 89. 4C 24, 10
        mov     dword [esp+0CH], 176                    ; 2B7E _ C7. 44 24, 0C, 000000B0
        mov     dword [esp+8H], 0                       ; 2B86 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 2B8E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2B92 _ 89. 04 24
        call    paint_string                            ; 2B95 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0C8H]                   ; 2B9A _ 8B. 85, FFFFFF38
        mov     ecx, eax                                ; 2BA0 _ 89. C1
        mov     eax, dword [ebp-0CCH]                   ; 2BA2 _ 8B. 85, FFFFFF34
        mov     edx, eax                                ; 2BA8 _ 89. C2
        mov     eax, dword [memman]                     ; 2BAA _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 2BAF _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2BB3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2BB7 _ 89. 04 24
        call    memman_free_4k                          ; 2BBA _ E8, FFFFFFFC(rel)
?_118:  mov     dword [ebp-128H], 16                    ; 2BBF _ C7. 85, FFFFFED8, 00000010
        jmp     ?_121                                   ; 2BC9 _ E9, 00000112

?_119:  cmp     dword [ebp-0F0H], 14                    ; 2BCE _ 83. BD, FFFFFF10, 0E
        jnz     ?_120                                   ; 2BD5 _ 75, 7B
        cmp     dword [ebp-128H], 16                    ; 2BD7 _ 83. BD, FFFFFED8, 10
        jle     ?_120                                   ; 2BDE _ 7E, 72
        mov     eax, dword [sheet_control]              ; 2BE0 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 2BE5 _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-124H]                   ; 2BED _ 8B. 95, FFFFFEDC
        mov     dword [esp+0CH], edx                    ; 2BF3 _ 89. 54 24, 0C
        mov     edx, dword [ebp-128H]                   ; 2BF7 _ 8B. 95, FFFFFED8
        mov     dword [esp+8H], edx                     ; 2BFD _ 89. 54 24, 08
        mov     edx, dword [ebp-13CH]                   ; 2C01 _ 8B. 95, FFFFFEC4
        mov     dword [esp+4H], edx                     ; 2C07 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2C0B _ 89. 04 24
        call    set_cursor                              ; 2C0E _ E8, FFFFFFFC(rel)
        sub     dword [ebp-128H], 8                     ; 2C13 _ 83. AD, FFFFFED8, 08
        mov     eax, dword [sheet_control]              ; 2C1A _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 2C1F _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-124H]                   ; 2C27 _ 8B. 95, FFFFFEDC
        mov     dword [esp+0CH], edx                    ; 2C2D _ 89. 54 24, 0C
        mov     edx, dword [ebp-128H]                   ; 2C31 _ 8B. 95, FFFFFED8
        mov     dword [esp+8H], edx                     ; 2C37 _ 89. 54 24, 08
        mov     edx, dword [ebp-13CH]                   ; 2C3B _ 8B. 95, FFFFFEC4
        mov     dword [esp+4H], edx                     ; 2C41 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2C45 _ 89. 04 24
        call    set_cursor                              ; 2C48 _ E8, FFFFFFFC(rel)
        jmp     ?_121                                   ; 2C4D _ E9, 0000008E

?_120:  mov     eax, dword [ebp-0F0H]                   ; 2C52 _ 8B. 85, FFFFFF10
        mov     dword [esp], eax                        ; 2C58 _ 89. 04 24
        call    transfer_scancode                       ; 2C5B _ E8, FFFFFFFC(rel)
        mov     byte [ebp-12DH], al                     ; 2C60 _ 88. 85, FFFFFED3
        cmp     byte [ebp-12DH], 0                      ; 2C66 _ 80. BD, FFFFFED3, 00
        jz      ?_121                                   ; 2C6D _ 74, 71
        cmp     dword [ebp-128H], 239                   ; 2C6F _ 81. BD, FFFFFED8, 000000EF
        jg      ?_121                                   ; 2C79 _ 7F, 65
        mov     eax, dword [ebp-128H]                   ; 2C7B _ 8B. 85, FFFFFED8
        mov     dword [?_319], eax                      ; 2C81 _ A3, 000000AC(d)
        mov     eax, dword [ebp-124H]                   ; 2C86 _ 8B. 85, FFFFFEDC
        mov     dword [?_320], eax                      ; 2C8C _ A3, 000000B0(d)
        mov     eax, dword [ebp-128H]                   ; 2C91 _ 8B. 85, FFFFFED8
        lea     edx, [eax+7H]                           ; 2C97 _ 8D. 50, 07
        test    eax, eax                                ; 2C9A _ 85. C0
        cmovs   eax, edx                                ; 2C9C _ 0F 48. C2
        sar     eax, 3                                  ; 2C9F _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 2CA2 _ 8D. 50, FE
        movzx   eax, byte [ebp-12DH]                    ; 2CA5 _ 0F B6. 85, FFFFFED3
        mov     byte [ebp+edx-0AAH], al                 ; 2CAC _ 88. 84 15, FFFFFF56
        movsx   eax, byte [ebp-12DH]                    ; 2CB3 _ 0F BE. 85, FFFFFED3
        mov     dword [esp+4H], 1                       ; 2CBA _ C7. 44 24, 04, 00000001
        mov     dword [esp], eax                        ; 2CC2 _ 89. 04 24
        call    c_console_putchar                       ; 2CC5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_319]                      ; 2CCA _ A1, 000000AC(d)
        mov     dword [ebp-128H], eax                   ; 2CCF _ 89. 85, FFFFFED8
        mov     eax, dword [?_320]                      ; 2CD5 _ A1, 000000B0(d)
        mov     dword [ebp-124H], eax                   ; 2CDA _ 89. 85, FFFFFEDC
?_121:  cmp     dword [ebp-120H], 0                     ; 2CE0 _ 83. BD, FFFFFEE0, 00
        js      ?_122                                   ; 2CE7 _ 78, 3A
        mov     eax, dword [sheet_control]              ; 2CE9 _ A1, 00000000(d)
        mov     edx, dword [ebp-120H]                   ; 2CEE _ 8B. 95, FFFFFEE0
        mov     dword [esp+10H], edx                    ; 2CF4 _ 89. 54 24, 10
        mov     edx, dword [ebp-124H]                   ; 2CF8 _ 8B. 95, FFFFFEDC
        mov     dword [esp+0CH], edx                    ; 2CFE _ 89. 54 24, 0C
        mov     edx, dword [ebp-128H]                   ; 2D02 _ 8B. 95, FFFFFED8
        mov     dword [esp+8H], edx                     ; 2D08 _ 89. 54 24, 08
        mov     edx, dword [ebp-13CH]                   ; 2D0C _ 8B. 95, FFFFFEC4
        mov     dword [esp+4H], edx                     ; 2D12 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2D16 _ 89. 04 24
        call    set_cursor                              ; 2D19 _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 2D1E _ E9, FFFFF4AB

?_122:  jmp     ?_078                                   ; 2D23 _ E9, FFFFF4A6
; console_task End of function

launch_console:; Function begin
        push    ebp                                     ; 2D28 _ 55
        mov     ebp, esp                                ; 2D29 _ 89. E5
        push    ebx                                     ; 2D2B _ 53
        sub     esp, 52                                 ; 2D2C _ 83. EC, 34
        mov     eax, dword [sheet_control]              ; 2D2F _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 2D34 _ 89. 04 24
        call    sheet_alloc                             ; 2D37 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 2D3C _ 89. 45, E8
        mov     eax, dword [memman]                     ; 2D3F _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 2D44 _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 2D4C _ 89. 04 24
        call    memman_alloc_4k                         ; 2D4F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 2D54 _ 89. 45, EC
        mov     dword [esp+10H], 99                     ; 2D57 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 2D5F _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 2D67 _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-14H]                    ; 2D6F _ 8B. 45, EC
        mov     dword [esp+4H], eax                     ; 2D72 _ 89. 44 24, 04
        mov     eax, dword [ebp-18H]                    ; 2D76 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 2D79 _ 89. 04 24
        call    sheet_setbuf                            ; 2D7C _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2D81 _ A1, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 2D86 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_314                   ; 2D8E _ C7. 44 24, 08, 00000084(d)
        mov     edx, dword [ebp-18H]                    ; 2D96 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2D99 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2D9D _ 89. 04 24
        call    make_windows                            ; 2DA0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 2DA5 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 2DAD _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 2DB5 _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 2DBD _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 2DC5 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-18H]                    ; 2DCD _ 8B. 45, E8
        mov     dword [esp], eax                        ; 2DD0 _ 89. 04 24
        call    make_textbox                            ; 2DD3 _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 2DD8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2DDD _ 89. 45, F0
        call    get_code32_addr                         ; 2DE0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2DE5 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2DE8 _ 8B. 45, F0
        mov     dword [eax+8CH], 0                      ; 2DEB _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-10H]                    ; 2DF5 _ 8B. 45, F0
        mov     dword [eax+90H], 1073741824             ; 2DF8 _ C7. 80, 00000090, 40000000
        mov     eax, console_task                       ; 2E02 _ B8, 00000000(d)
        sub     eax, dword [ebp-0CH]                    ; 2E07 _ 2B. 45, F4
        mov     edx, eax                                ; 2E0A _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 2E0C _ 8B. 45, F0
        mov     dword [eax+4CH], edx                    ; 2E0F _ 89. 50, 4C
        mov     eax, dword [ebp-10H]                    ; 2E12 _ 8B. 45, F0
        mov     dword [eax+74H], 0                      ; 2E15 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-10H]                    ; 2E1C _ 8B. 45, F0
        mov     dword [eax+78H], 8                      ; 2E1F _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-10H]                    ; 2E26 _ 8B. 45, F0
        mov     dword [eax+7CH], 48                     ; 2E29 _ C7. 40, 7C, 00000030
        mov     eax, dword [ebp-10H]                    ; 2E30 _ 8B. 45, F0
        mov     dword [eax+80H], 32                     ; 2E33 _ C7. 80, 00000080, 00000020
        mov     eax, dword [ebp-10H]                    ; 2E3D _ 8B. 45, F0
        mov     dword [eax+84H], 0                      ; 2E40 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-10H]                    ; 2E4A _ 8B. 45, F0
        mov     dword [eax+88H], 16                     ; 2E4D _ C7. 80, 00000088, 00000010
        mov     eax, dword [ebp-10H]                    ; 2E57 _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 2E5A _ 8B. 40, 64
        lea     edx, [eax-4H]                           ; 2E5D _ 8D. 50, FC
        mov     eax, dword [ebp-10H]                    ; 2E60 _ 8B. 45, F0
        mov     dword [eax+64H], edx                    ; 2E63 _ 89. 50, 64
        mov     eax, dword [ebp-10H]                    ; 2E66 _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 2E69 _ 8B. 40, 64
        add     eax, 4                                  ; 2E6C _ 83. C0, 04
        mov     edx, dword [ebp-18H]                    ; 2E6F _ 8B. 55, E8
        mov     dword [eax], edx                        ; 2E72 _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 2E74 _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 2E77 _ 8B. 40, 64
        add     eax, 8                                  ; 2E7A _ 83. C0, 08
        mov     ebx, eax                                ; 2E7D _ 89. C3
        mov     eax, dword [memman]                     ; 2E7F _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 2E84 _ 89. 04 24
        call    memman_total                            ; 2E87 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 2E8C _ 89. 03
        mov     dword [esp+8H], 5                       ; 2E8E _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 2E96 _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-10H]                    ; 2E9E _ 8B. 45, F0
        mov     dword [esp], eax                        ; 2EA1 _ 89. 04 24
        call    task_run                                ; 2EA4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2EA9 _ A1, 00000000(d)
        mov     dword [esp+0CH], 4                      ; 2EAE _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 2EB6 _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-18H]                    ; 2EBE _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2EC1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2EC5 _ 89. 04 24
        call    sheet_slide                             ; 2EC8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2ECD _ A1, 00000000(d)
        mov     dword [esp+8H], 1                       ; 2ED2 _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-18H]                    ; 2EDA _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2EDD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2EE1 _ 89. 04 24
        call    sheet_updown                            ; 2EE4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2EE9 _ 8B. 45, F0
        mov     dword [task_console_g], eax             ; 2EEC _ A3, 00000000(d)
        mov     eax, dword [ebp-18H]                    ; 2EF1 _ 8B. 45, E8
        add     esp, 52                                 ; 2EF4 _ 83. C4, 34
        pop     ebx                                     ; 2EF7 _ 5B
        pop     ebp                                     ; 2EF8 _ 5D
        ret                                             ; 2EF9 _ C3
; launch_console End of function

set_cursor:; Function begin
        push    ebp                                     ; 2EFA _ 55
        mov     ebp, esp                                ; 2EFB _ 89. E5
        push    esi                                     ; 2EFD _ 56
        push    ebx                                     ; 2EFE _ 53
        sub     esp, 32                                 ; 2EFF _ 83. EC, 20
        mov     eax, dword [ebp+14H]                    ; 2F02 _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 2F05 _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 2F08 _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 2F0B _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 2F0E _ 8B. 45, 18
        movzx   ecx, al                                 ; 2F11 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 2F14 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 2F17 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2F1A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2F1D _ 8B. 00
        mov     dword [esp+18H], esi                    ; 2F1F _ 89. 74 24, 18
        mov     dword [esp+14H], ebx                    ; 2F23 _ 89. 5C 24, 14
        mov     ebx, dword [ebp+14H]                    ; 2F27 _ 8B. 5D, 14
        mov     dword [esp+10H], ebx                    ; 2F2A _ 89. 5C 24, 10
        mov     ebx, dword [ebp+10H]                    ; 2F2E _ 8B. 5D, 10
        mov     dword [esp+0CH], ebx                    ; 2F31 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2F35 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2F39 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2F3D _ 89. 04 24
        call    paint_rectangle                         ; 2F40 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 2F45 _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 2F48 _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 2F4B _ 8B. 45, 10
        add     eax, 8                                  ; 2F4E _ 83. C0, 08
        mov     dword [esp+14H], edx                    ; 2F51 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2F55 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 2F59 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 2F5C _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 2F60 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 2F63 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2F67 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2F6A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F6E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F71 _ 89. 04 24
        call    sheet_refresh                           ; 2F74 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2F79 _ 83. C4, 20
        pop     ebx                                     ; 2F7C _ 5B
        pop     esi                                     ; 2F7D _ 5E
        pop     ebp                                     ; 2F7E _ 5D
        ret                                             ; 2F7F _ C3
; set_cursor End of function

console_new_line:; Function begin
        push    ebp                                     ; 2F80 _ 55
        mov     ebp, esp                                ; 2F81 _ 89. E5
        push    ebx                                     ; 2F83 _ 53
        sub     esp, 52                                 ; 2F84 _ 83. EC, 34
        cmp     dword [ebp+8H], 139                     ; 2F87 _ 81. 7D, 08, 0000008B
        jg      ?_123                                   ; 2F8E _ 7F, 09
        add     dword [ebp+8H], 16                      ; 2F90 _ 83. 45, 08, 10
        jmp     ?_132                                   ; 2F94 _ E9, 000000DF

?_123:  mov     dword [ebp-0CH], 28                     ; 2F99 _ C7. 45, F4, 0000001C
        jmp     ?_127                                   ; 2FA0 _ EB, 52

?_124:  mov     dword [ebp-10H], 8                      ; 2FA2 _ C7. 45, F0, 00000008
        jmp     ?_126                                   ; 2FA9 _ EB, 3C

?_125:  mov     eax, dword [ebp+0CH]                    ; 2FAB _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2FAE _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2FB0 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2FB3 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2FB6 _ 0F AF. 45, F4
        mov     ecx, eax                                ; 2FBA _ 89. C1
        mov     eax, dword [ebp-10H]                    ; 2FBC _ 8B. 45, F0
        add     eax, ecx                                ; 2FBF _ 01. C8
        add     edx, eax                                ; 2FC1 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2FC3 _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 2FC6 _ 8B. 08
        mov     eax, dword [ebp-0CH]                    ; 2FC8 _ 8B. 45, F4
        lea     ebx, [eax+10H]                          ; 2FCB _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 2FCE _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2FD1 _ 8B. 40, 04
        imul    ebx, eax                                ; 2FD4 _ 0F AF. D8
        mov     eax, dword [ebp-10H]                    ; 2FD7 _ 8B. 45, F0
        add     eax, ebx                                ; 2FDA _ 01. D8
        add     eax, ecx                                ; 2FDC _ 01. C8
        movzx   eax, byte [eax]                         ; 2FDE _ 0F B6. 00
        mov     byte [edx], al                          ; 2FE1 _ 88. 02
        add     dword [ebp-10H], 1                      ; 2FE3 _ 83. 45, F0, 01
?_126:  cmp     dword [ebp-10H], 247                    ; 2FE7 _ 81. 7D, F0, 000000F7
        jle     ?_125                                   ; 2FEE _ 7E, BB
        add     dword [ebp-0CH], 1                      ; 2FF0 _ 83. 45, F4, 01
?_127:  cmp     dword [ebp-0CH], 139                    ; 2FF4 _ 81. 7D, F4, 0000008B
        jle     ?_124                                   ; 2FFB _ 7E, A5
        mov     dword [ebp-0CH], 140                    ; 2FFD _ C7. 45, F4, 0000008C
        jmp     ?_131                                   ; 3004 _ EB, 35

?_128:  mov     dword [ebp-10H], 8                      ; 3006 _ C7. 45, F0, 00000008
        jmp     ?_130                                   ; 300D _ EB, 1F

?_129:  mov     eax, dword [ebp+0CH]                    ; 300F _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 3012 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 3014 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3017 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 301A _ 0F AF. 45, F4
        mov     ecx, eax                                ; 301E _ 89. C1
        mov     eax, dword [ebp-10H]                    ; 3020 _ 8B. 45, F0
        add     eax, ecx                                ; 3023 _ 01. C8
        add     eax, edx                                ; 3025 _ 01. D0
        mov     byte [eax], 0                           ; 3027 _ C6. 00, 00
        add     dword [ebp-10H], 1                      ; 302A _ 83. 45, F0, 01
?_130:  cmp     dword [ebp-10H], 247                    ; 302E _ 81. 7D, F0, 000000F7
        jle     ?_129                                   ; 3035 _ 7E, D8
        add     dword [ebp-0CH], 1                      ; 3037 _ 83. 45, F4, 01
?_131:  cmp     dword [ebp-0CH], 155                    ; 303B _ 81. 7D, F4, 0000009B
        jle     ?_128                                   ; 3042 _ 7E, C2
        mov     eax, dword [sheet_control]              ; 3044 _ A1, 00000000(d)
        mov     dword [esp+14H], 156                    ; 3049 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 3051 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 3059 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 3061 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 3069 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 306C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3070 _ 89. 04 24
        call    sheet_refresh                           ; 3073 _ E8, FFFFFFFC(rel)
?_132:  mov     eax, dword [sheet_control]              ; 3078 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 307D _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_306                  ; 3085 _ C7. 44 24, 10, 00000060(d)
        mov     edx, dword [ebp+8H]                     ; 308D _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 3090 _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 3094 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 309C _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 309F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 30A3 _ 89. 04 24
        call    paint_string                            ; 30A6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 30AB _ 8B. 45, 08
        add     esp, 52                                 ; 30AE _ 83. C4, 34
        pop     ebx                                     ; 30B1 _ 5B
        pop     ebp                                     ; 30B2 _ 5D
        ret                                             ; 30B3 _ C3
; console_new_line End of function

strcmp: ; Function begin
        push    ebp                                     ; 30B4 _ 55
        mov     ebp, esp                                ; 30B5 _ 89. E5
        sub     esp, 16                                 ; 30B7 _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 30BA _ 83. 7D, 08, 00
        jz      ?_133                                   ; 30BE _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 30C0 _ 83. 7D, 0C, 00
        jnz     ?_134                                   ; 30C4 _ 75, 0A
?_133:  mov     eax, 0                                  ; 30C6 _ B8, 00000000
        jmp     ?_141                                   ; 30CB _ E9, 00000092

?_134:  mov     dword [ebp-4H], 0                       ; 30D0 _ C7. 45, FC, 00000000
        jmp     ?_137                                   ; 30D7 _ EB, 25

?_135:  mov     edx, dword [ebp-4H]                     ; 30D9 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 30DC _ 8B. 45, 08
        add     eax, edx                                ; 30DF _ 01. D0
        movzx   edx, byte [eax]                         ; 30E1 _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 30E4 _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 30E7 _ 8B. 45, 0C
        add     eax, ecx                                ; 30EA _ 01. C8
        movzx   eax, byte [eax]                         ; 30EC _ 0F B6. 00
        cmp     dl, al                                  ; 30EF _ 38. C2
        jz      ?_136                                   ; 30F1 _ 74, 07
        mov     eax, 0                                  ; 30F3 _ B8, 00000000
        jmp     ?_141                                   ; 30F8 _ EB, 68

?_136:  add     dword [ebp-4H], 1                       ; 30FA _ 83. 45, FC, 01
?_137:  mov     edx, dword [ebp-4H]                     ; 30FE _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 3101 _ 8B. 45, 08
        add     eax, edx                                ; 3104 _ 01. D0
        movzx   eax, byte [eax]                         ; 3106 _ 0F B6. 00
        test    al, al                                  ; 3109 _ 84. C0
        jz      ?_138                                   ; 310B _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 310D _ 83. 7D, 0C, 00
        jnz     ?_135                                   ; 3111 _ 75, C6
?_138:  mov     edx, dword [ebp-4H]                     ; 3113 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 3116 _ 8B. 45, 08
        add     eax, edx                                ; 3119 _ 01. D0
        movzx   eax, byte [eax]                         ; 311B _ 0F B6. 00
        test    al, al                                  ; 311E _ 84. C0
        jnz     ?_139                                   ; 3120 _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 3122 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 3125 _ 8B. 45, 0C
        add     eax, edx                                ; 3128 _ 01. D0
        movzx   eax, byte [eax]                         ; 312A _ 0F B6. 00
        test    al, al                                  ; 312D _ 84. C0
        jz      ?_139                                   ; 312F _ 74, 07
        mov     eax, 0                                  ; 3131 _ B8, 00000000
        jmp     ?_141                                   ; 3136 _ EB, 2A

?_139:  mov     edx, dword [ebp-4H]                     ; 3138 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 313B _ 8B. 45, 08
        add     eax, edx                                ; 313E _ 01. D0
        movzx   eax, byte [eax]                         ; 3140 _ 0F B6. 00
        test    al, al                                  ; 3143 _ 84. C0
        jz      ?_140                                   ; 3145 _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 3147 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 314A _ 8B. 45, 0C
        add     eax, edx                                ; 314D _ 01. D0
        movzx   eax, byte [eax]                         ; 314F _ 0F B6. 00
        test    al, al                                  ; 3152 _ 84. C0
        jz      ?_140                                   ; 3154 _ 74, 07
        mov     eax, 0                                  ; 3156 _ B8, 00000000
        jmp     ?_141                                   ; 315B _ EB, 05

?_140:  mov     eax, 1                                  ; 315D _ B8, 00000001
?_141:  leave                                           ; 3162 _ C9
        ret                                             ; 3163 _ C3
; strcmp End of function

c_console_putchar:; Function begin
        push    ebp                                     ; 3164 _ 55
        mov     ebp, esp                                ; 3165 _ 89. E5
        push    ebx                                     ; 3167 _ 53
        sub     esp, 36                                 ; 3168 _ 83. EC, 24
        mov     edx, dword [ebp+8H]                     ; 316B _ 8B. 55, 08
        mov     eax, dword [ebp+0CH]                    ; 316E _ 8B. 45, 0C
        mov     byte [ebp-0CH], dl                      ; 3171 _ 88. 55, F4
        mov     byte [ebp-10H], al                      ; 3174 _ 88. 45, F0
        mov     ebx, dword [?_320]                      ; 3177 _ 8B. 1D, 000000B0(d)
        mov     ecx, dword [?_319]                      ; 317D _ 8B. 0D, 000000AC(d)
        mov     edx, dword [g_Console]                  ; 3183 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 3189 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 318E _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], ebx                    ; 3196 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 319A _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 319E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 31A2 _ 89. 04 24
        call    set_cursor                              ; 31A5 _ E8, FFFFFFFC(rel)
        movzx   eax, byte [ebp-0CH]                     ; 31AA _ 0F B6. 45, F4
        mov     byte [?_322], al                        ; 31AE _ A2, 000000B8(d)
        mov     byte [?_323], 0                         ; 31B3 _ C6. 05, 000000B9(d), 00
        mov     ebx, dword [?_320]                      ; 31BA _ 8B. 1D, 000000B0(d)
        mov     ecx, dword [?_319]                      ; 31C0 _ 8B. 0D, 000000AC(d)
        mov     edx, dword [g_Console]                  ; 31C6 _ 8B. 15, 000000A8(d)
        mov     eax, dword [sheet_control]              ; 31CC _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 31D1 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_322                  ; 31D9 _ C7. 44 24, 10, 000000B8(d)
        mov     dword [esp+0CH], ebx                    ; 31E1 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 31E5 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 31E9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 31ED _ 89. 04 24
        call    paint_string                            ; 31F0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [?_319]                      ; 31F5 _ A1, 000000AC(d)
        add     eax, 8                                  ; 31FA _ 83. C0, 08
        mov     dword [?_319], eax                      ; 31FD _ A3, 000000AC(d)
        add     esp, 36                                 ; 3202 _ 83. C4, 24
        pop     ebx                                     ; 3205 _ 5B
        pop     ebp                                     ; 3206 _ 5D
        ret                                             ; 3207 _ C3
; c_console_putchar End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 3208 _ 55
        mov     ebp, esp                                ; 3209 _ 89. E5
        sub     esp, 24                                 ; 320B _ 83. EC, 18
?_142:  mov     dword [esp], 100                        ; 320E _ C7. 04 24, 00000064
        call    io_in8                                  ; 3215 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 321A _ 83. E0, 02
        test    eax, eax                                ; 321D _ 85. C0
        jnz     ?_143                                   ; 321F _ 75, 02
        jmp     ?_144                                   ; 3221 _ EB, 02

?_143:  jmp     ?_142                                   ; 3223 _ EB, E9

?_144:  leave                                           ; 3225 _ C9
        ret                                             ; 3226 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 3227 _ 55
        mov     ebp, esp                                ; 3228 _ 89. E5
        sub     esp, 24                                 ; 322A _ 83. EC, 18
        call    wait_KBC_sendready                      ; 322D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 3232 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 323A _ C7. 04 24, 00000064
        call    io_out8                                 ; 3241 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 3246 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 324B _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 3253 _ C7. 04 24, 00000060
        call    io_out8                                 ; 325A _ E8, FFFFFFFC(rel)
        leave                                           ; 325F _ C9
        ret                                             ; 3260 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 3261 _ 55
        mov     ebp, esp                                ; 3262 _ 89. E5
        sub     esp, 24                                 ; 3264 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 3267 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 326C _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 3274 _ C7. 04 24, 00000064
        call    io_out8                                 ; 327B _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 3280 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 3285 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 328D _ C7. 04 24, 00000060
        call    io_out8                                 ; 3294 _ E8, FFFFFFFC(rel)
        leave                                           ; 3299 _ C9
        ret                                             ; 329A _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 329B _ 55
        mov     ebp, esp                                ; 329C _ 89. E5
        sub     esp, 4                                  ; 329E _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 32A1 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 32A4 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 32A7 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 32AA _ 0F B6. 40, 03
        test    al, al                                  ; 32AE _ 84. C0
        jnz     ?_146                                   ; 32B0 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 32B2 _ 80. 7D, FC, FA
        jnz     ?_145                                   ; 32B6 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 32B8 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 32BB _ C6. 40, 03, 01
?_145:  mov     eax, 0                                  ; 32BF _ B8, 00000000
        jmp     ?_153                                   ; 32C4 _ E9, 0000010F

?_146:  mov     eax, dword [ebp+8H]                     ; 32C9 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 32CC _ 0F B6. 40, 03
        cmp     al, 1                                   ; 32D0 _ 3C, 01
        jnz     ?_148                                   ; 32D2 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 32D4 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 32D8 _ 25, 000000C8
        cmp     eax, 8                                  ; 32DD _ 83. F8, 08
        jnz     ?_147                                   ; 32E0 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 32E2 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 32E5 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 32E9 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 32EB _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 32EE _ C6. 40, 03, 02
?_147:  mov     eax, 0                                  ; 32F2 _ B8, 00000000
        jmp     ?_153                                   ; 32F7 _ E9, 000000DC

?_148:  mov     eax, dword [ebp+8H]                     ; 32FC _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 32FF _ 0F B6. 40, 03
        cmp     al, 2                                   ; 3303 _ 3C, 02
        jnz     ?_149                                   ; 3305 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 3307 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 330A _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 330E _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3311 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 3314 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 3318 _ B8, 00000000
        jmp     ?_153                                   ; 331D _ E9, 000000B6

?_149:  mov     eax, dword [ebp+8H]                     ; 3322 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3325 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 3329 _ 3C, 03
        jne     ?_152                                   ; 332B _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 3331 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3334 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 3338 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 333B _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 333E _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 3342 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3345 _ 0F B6. 00
        movzx   eax, al                                 ; 3348 _ 0F B6. C0
        and     eax, 07H                                ; 334B _ 83. E0, 07
        mov     edx, eax                                ; 334E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3350 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3353 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3356 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 3359 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 335D _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 3360 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3363 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3366 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 3369 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 336D _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 3370 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3373 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3376 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3379 _ 0F B6. 00
        movzx   eax, al                                 ; 337C _ 0F B6. C0
        and     eax, 10H                                ; 337F _ 83. E0, 10
        test    eax, eax                                ; 3382 _ 85. C0
        jz      ?_150                                   ; 3384 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 3386 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3389 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 338C _ 0D, FFFFFF00
        mov     edx, eax                                ; 3391 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3393 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3396 _ 89. 50, 04
?_150:  mov     eax, dword [ebp+8H]                     ; 3399 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 339C _ 0F B6. 00
        movzx   eax, al                                 ; 339F _ 0F B6. C0
        and     eax, 20H                                ; 33A2 _ 83. E0, 20
        test    eax, eax                                ; 33A5 _ 85. C0
        jz      ?_151                                   ; 33A7 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 33A9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 33AC _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 33AF _ 0D, FFFFFF00
        mov     edx, eax                                ; 33B4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 33B6 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 33B9 _ 89. 50, 08
?_151:  mov     eax, dword [ebp+8H]                     ; 33BC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 33BF _ 8B. 40, 08
        neg     eax                                     ; 33C2 _ F7. D8
        mov     edx, eax                                ; 33C4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 33C6 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 33C9 _ 89. 50, 08
        mov     eax, 1                                  ; 33CC _ B8, 00000001
        jmp     ?_153                                   ; 33D1 _ EB, 05

?_152:  mov     eax, 4294967295                         ; 33D3 _ B8, FFFFFFFF
?_153:  leave                                           ; 33D8 _ C9
        ret                                             ; 33D9 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 33DA _ 55
        mov     ebp, esp                                ; 33DB _ 89. E5
        sub     esp, 40                                 ; 33DD _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 33E0 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 33E8 _ C7. 04 24, 00000020
        call    io_out8                                 ; 33EF _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 33F4 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 33FC _ C7. 04 24, 000000A0
        call    io_out8                                 ; 3403 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 3408 _ C7. 04 24, 00000060
        call    io_in8                                  ; 340F _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 3414 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 3417 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 341B _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 341F _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 3426 _ E8, FFFFFFFC(rel)
        leave                                           ; 342B _ C9
        ret                                             ; 342C _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 342D _ 55
        mov     ebp, esp                                ; 342E _ 89. E5
        sub     esp, 40                                 ; 3430 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 3433 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 343B _ C7. 04 24, 00000020
        call    io_out8                                 ; 3442 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 3447 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 344F _ C7. 04 24, 000000A0
        call    io_out8                                 ; 3456 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 345B _ C7. 04 24, 00000060
        call    io_in8                                  ; 3462 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 3467 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 346A _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 346E _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 3472 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 3479 _ E8, FFFFFFFC(rel)
        leave                                           ; 347E _ C9
        ret                                             ; 347F _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 3480 _ 55
        mov     ebp, esp                                ; 3481 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3483 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3486 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 3489 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 348B _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 348E _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 3495 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 3498 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 349F _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 34A2 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 34A5 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 34A8 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 34AB _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 34AE _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 34B1 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 34B4 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 34BB _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 34BE _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 34C1 _ 89. 50, 18
        pop     ebp                                     ; 34C4 _ 5D
        ret                                             ; 34C5 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 34C6 _ 55
        mov     ebp, esp                                ; 34C7 _ 89. E5
        sub     esp, 40                                 ; 34C9 _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 34CC _ 8B. 45, 0C
        mov     byte [ebp-1CH], al                      ; 34CF _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 34D2 _ 83. 7D, 08, 00
        jnz     ?_154                                   ; 34D6 _ 75, 0A
        mov     eax, 4294967295                         ; 34D8 _ B8, FFFFFFFF
        jmp     ?_158                                   ; 34DD _ E9, 000000B1

?_154:  mov     eax, dword [ebp+8H]                     ; 34E2 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 34E5 _ 8B. 40, 10
        test    eax, eax                                ; 34E8 _ 85. C0
        jnz     ?_155                                   ; 34EA _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 34EC _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 34EF _ 8B. 40, 14
        or      eax, 01H                                ; 34F2 _ 83. C8, 01
        mov     edx, eax                                ; 34F5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 34F7 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 34FA _ 89. 50, 14
        mov     eax, 4294967295                         ; 34FD _ B8, FFFFFFFF
        jmp     ?_158                                   ; 3502 _ E9, 0000008C

?_155:  mov     eax, dword [ebp+8H]                     ; 3507 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 350A _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 350D _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3510 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 3513 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 3515 _ 8B. 45, F4
        add     edx, eax                                ; 3518 _ 01. C2
        movzx   eax, byte [ebp-1CH]                     ; 351A _ 0F B6. 45, E4
        mov     byte [edx], al                          ; 351E _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 3520 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3523 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 3526 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3529 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 352C _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 352F _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3532 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3535 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3538 _ 8B. 40, 0C
        cmp     edx, eax                                ; 353B _ 39. C2
        jnz     ?_156                                   ; 353D _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 353F _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3542 _ C7. 40, 04, 00000000
?_156:  mov     eax, dword [ebp+8H]                     ; 3549 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 354C _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 354F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3552 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 3555 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 3558 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 355B _ 8B. 40, 18
        test    eax, eax                                ; 355E _ 85. C0
        jz      ?_157                                   ; 3560 _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 3562 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 3565 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 3568 _ 8B. 40, 04
        cmp     eax, 2                                  ; 356B _ 83. F8, 02
        jz      ?_157                                   ; 356E _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 3570 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 3573 _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 3576 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 357E _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 3586 _ 89. 04 24
        call    task_run                                ; 3589 _ E8, FFFFFFFC(rel)
?_157:  mov     eax, 0                                  ; 358E _ B8, 00000000
?_158:  leave                                           ; 3593 _ C9
        ret                                             ; 3594 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 3595 _ 55
        mov     ebp, esp                                ; 3596 _ 89. E5
        sub     esp, 16                                 ; 3598 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 359B _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 359E _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 35A1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 35A4 _ 8B. 40, 0C
        cmp     edx, eax                                ; 35A7 _ 39. C2
        jnz     ?_159                                   ; 35A9 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 35AB _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 35AE _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 35B5 _ B8, FFFFFFFF
        jmp     ?_161                                   ; 35BA _ EB, 57

?_159:  mov     eax, dword [ebp+8H]                     ; 35BC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 35BF _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 35C2 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 35C5 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 35C8 _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 35CA _ 8B. 45, F8
        add     eax, edx                                ; 35CD _ 01. D0
        movzx   eax, byte [eax]                         ; 35CF _ 0F B6. 00
        movzx   eax, al                                 ; 35D2 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 35D5 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 35D8 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 35DB _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 35DE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 35E1 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 35E4 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 35E7 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 35EA _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 35ED _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 35F0 _ 8B. 40, 0C
        cmp     edx, eax                                ; 35F3 _ 39. C2
        jnz     ?_160                                   ; 35F5 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 35F7 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 35FA _ C7. 40, 08, 00000000
?_160:  mov     eax, dword [ebp+8H]                     ; 3601 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3604 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 3607 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 360A _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 360D _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 3610 _ 8B. 45, FC
?_161:  leave                                           ; 3613 _ C9
        ret                                             ; 3614 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 3615 _ 55
        mov     ebp, esp                                ; 3616 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3618 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 361B _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 361E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3621 _ 8B. 40, 10
        sub     edx, eax                                ; 3624 _ 29. C2
        mov     eax, edx                                ; 3626 _ 89. D0
        pop     ebp                                     ; 3628 _ 5D
        ret                                             ; 3629 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 362A _ 55
        mov     ebp, esp                                ; 362B _ 89. E5
        sub     esp, 4                                  ; 362D _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 3630 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 3633 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 3636 _ 80. 7D, FC, 09
        jle     ?_162                                   ; 363A _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 363C _ 0F B6. 45, FC
        add     eax, 55                                 ; 3640 _ 83. C0, 37
        jmp     ?_163                                   ; 3643 _ EB, 07

?_162:  movzx   eax, byte [ebp-4H]                      ; 3645 _ 0F B6. 45, FC
        add     eax, 48                                 ; 3649 _ 83. C0, 30
?_163:  leave                                           ; 364C _ C9
        ret                                             ; 364D _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 364E _ 55
        mov     ebp, esp                                ; 364F _ 89. E5
        sub     esp, 24                                 ; 3651 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 3654 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 3657 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 365A _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 3661 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 3665 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 3668 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 366B _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 366F _ 89. 04 24
        call    charToHexVal                            ; 3672 _ E8, FFFFFFFC(rel)
        mov     byte [?_316], al                        ; 3677 _ A2, 00000343(d)
        movzx   eax, byte [ebp-14H]                     ; 367C _ 0F B6. 45, EC
        shr     al, 4                                   ; 3680 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 3683 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 3686 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 368A _ 0F BE. C0
        mov     dword [esp], eax                        ; 368D _ 89. 04 24
        call    charToHexVal                            ; 3690 _ E8, FFFFFFFC(rel)
        mov     byte [?_315], al                        ; 3695 _ A2, 00000342(d)
        mov     eax, keyval                             ; 369A _ B8, 00000340(d)
        leave                                           ; 369F _ C9
        ret                                             ; 36A0 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 36A1 _ 55
        mov     ebp, esp                                ; 36A2 _ 89. E5
        sub     esp, 16                                 ; 36A4 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 36A7 _ C6. 05, 000002E0(d), 30
        mov     byte [?_324], 88                        ; 36AE _ C6. 05, 000002E1(d), 58
        mov     byte [?_325], 0                         ; 36B5 _ C6. 05, 000002EA(d), 00
        mov     dword [ebp-0CH], 2                      ; 36BC _ C7. 45, F4, 00000002
        jmp     ?_165                                   ; 36C3 _ EB, 0F

?_164:  mov     eax, dword [ebp-0CH]                    ; 36C5 _ 8B. 45, F4
        add     eax, str.1386                           ; 36C8 _ 05, 000002E0(d)
        mov     byte [eax], 48                          ; 36CD _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 36D0 _ 83. 45, F4, 01
?_165:  cmp     dword [ebp-0CH], 9                      ; 36D4 _ 83. 7D, F4, 09
        jle     ?_164                                   ; 36D8 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 36DA _ C7. 45, F8, 00000009
        jmp     ?_169                                   ; 36E1 _ EB, 40

?_166:  mov     eax, dword [ebp+8H]                     ; 36E3 _ 8B. 45, 08
        and     eax, 0FH                                ; 36E6 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 36E9 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 36EC _ 8B. 45, 08
        shr     eax, 4                                  ; 36EF _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 36F2 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 36F5 _ 83. 7D, FC, 09
        jle     ?_167                                   ; 36F9 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 36FB _ 8B. 45, FC
        add     eax, 55                                 ; 36FE _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 3701 _ 8B. 55, F8
        add     edx, str.1386                           ; 3704 _ 81. C2, 000002E0(d)
        mov     byte [edx], al                          ; 370A _ 88. 02
        jmp     ?_168                                   ; 370C _ EB, 11

?_167:  mov     eax, dword [ebp-4H]                     ; 370E _ 8B. 45, FC
        add     eax, 48                                 ; 3711 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 3714 _ 8B. 55, F8
        add     edx, str.1386                           ; 3717 _ 81. C2, 000002E0(d)
        mov     byte [edx], al                          ; 371D _ 88. 02
?_168:  sub     dword [ebp-8H], 1                       ; 371F _ 83. 6D, F8, 01
?_169:  cmp     dword [ebp-8H], 1                       ; 3723 _ 83. 7D, F8, 01
        jle     ?_170                                   ; 3727 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 3729 _ 83. 7D, 08, 00
        jnz     ?_166                                   ; 372D _ 75, B4
?_170:  mov     eax, str.1386                           ; 372F _ B8, 000002E0(d)
        leave                                           ; 3734 _ C9
        ret                                             ; 3735 _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 3736 _ 55
        mov     ebp, esp                                ; 3737 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3739 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 373C _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 3742 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3745 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 374C _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 374F _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 3756 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 3759 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 3760 _ 5D
        ret                                             ; 3761 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 3762 _ 55
        mov     ebp, esp                                ; 3763 _ 89. E5
        sub     esp, 16                                 ; 3765 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3768 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 376F _ C7. 45, F8, 00000000
        jmp     ?_172                                   ; 3776 _ EB, 14

?_171:  mov     eax, dword [ebp+8H]                     ; 3778 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 377B _ 8B. 55, F8
        add     edx, 2                                  ; 377E _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3781 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 3785 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 3788 _ 83. 45, F8, 01
?_172:  mov     eax, dword [ebp+8H]                     ; 378C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 378F _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3791 _ 3B. 45, F8
        ja      ?_171                                   ; 3794 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 3796 _ 8B. 45, FC
        leave                                           ; 3799 _ C9
        ret                                             ; 379A _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 379B _ 55
        mov     ebp, esp                                ; 379C _ 89. E5
        sub     esp, 16                                 ; 379E _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 37A1 _ C7. 45, F8, 00000000
        jmp     ?_176                                   ; 37A8 _ E9, 00000085

?_173:  mov     eax, dword [ebp+8H]                     ; 37AD _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 37B0 _ 8B. 55, F8
        add     edx, 2                                  ; 37B3 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 37B6 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 37BA _ 3B. 45, 0C
        jc      ?_175                                   ; 37BD _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 37BF _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 37C2 _ 8B. 55, F8
        add     edx, 2                                  ; 37C5 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 37C8 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 37CB _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 37CE _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 37D1 _ 8B. 55, F8
        add     edx, 2                                  ; 37D4 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 37D7 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 37DA _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 37DD _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 37E0 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 37E3 _ 8B. 55, F8
        add     edx, 2                                  ; 37E6 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 37E9 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 37EC _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 37EF _ 8B. 55, F8
        add     edx, 2                                  ; 37F2 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 37F5 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 37F9 _ 2B. 45, 0C
        mov     edx, eax                                ; 37FC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 37FE _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 3801 _ 8B. 4D, F8
        add     ecx, 2                                  ; 3804 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 3807 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 380B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 380E _ 8B. 55, F8
        add     edx, 2                                  ; 3811 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3814 _ 8B. 44 D0, 04
        test    eax, eax                                ; 3818 _ 85. C0
        jnz     ?_174                                   ; 381A _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 381C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 381F _ 8B. 00
        lea     edx, [eax-1H]                           ; 3821 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3824 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3827 _ 89. 10
?_174:  mov     eax, dword [ebp-4H]                     ; 3829 _ 8B. 45, FC
        jmp     ?_177                                   ; 382C _ EB, 17

?_175:  add     dword [ebp-8H], 1                       ; 382E _ 83. 45, F8, 01
?_176:  mov     eax, dword [ebp+8H]                     ; 3832 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3835 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3837 _ 3B. 45, F8
        ja      ?_173                                   ; 383A _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 3840 _ B8, 00000000
?_177:  leave                                           ; 3845 _ C9
        ret                                             ; 3846 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 3847 _ 55
        mov     ebp, esp                                ; 3848 _ 89. E5
        push    ebx                                     ; 384A _ 53
        sub     esp, 16                                 ; 384B _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 384E _ C7. 45, F4, 00000000
        jmp     ?_180                                   ; 3855 _ EB, 17

?_178:  mov     eax, dword [ebp+8H]                     ; 3857 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 385A _ 8B. 55, F4
        add     edx, 2                                  ; 385D _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3860 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 3863 _ 3B. 45, 0C
        jbe     ?_179                                   ; 3866 _ 76, 02
        jmp     ?_181                                   ; 3868 _ EB, 0E

?_179:  add     dword [ebp-0CH], 1                      ; 386A _ 83. 45, F4, 01
?_180:  mov     eax, dword [ebp+8H]                     ; 386E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3871 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3873 _ 3B. 45, F4
        jg      ?_178                                   ; 3876 _ 7F, DF
?_181:  cmp     dword [ebp-0CH], 0                      ; 3878 _ 83. 7D, F4, 00
        jle     ?_183                                   ; 387C _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 3882 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 3885 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3888 _ 8B. 45, 08
        add     edx, 2                                  ; 388B _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 388E _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 3891 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 3894 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 3897 _ 8B. 45, 08
        add     ecx, 2                                  ; 389A _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 389D _ 8B. 44 C8, 04
        add     eax, edx                                ; 38A1 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 38A3 _ 3B. 45, 0C
        jne     ?_183                                   ; 38A6 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 38AC _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 38AF _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 38B2 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 38B5 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 38B8 _ 8B. 45, 08
        add     edx, 2                                  ; 38BB _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 38BE _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 38C2 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 38C5 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 38C8 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 38CB _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 38CE _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 38D2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 38D5 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 38D7 _ 3B. 45, F4
        jle     ?_182                                   ; 38DA _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 38DC _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 38DF _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 38E2 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 38E5 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 38E8 _ 8B. 55, F4
        add     edx, 2                                  ; 38EB _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 38EE _ 8B. 04 D0
        cmp     ecx, eax                                ; 38F1 _ 39. C1
        jnz     ?_182                                   ; 38F3 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 38F5 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 38F8 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 38FB _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 38FE _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3901 _ 8B. 45, 08
        add     edx, 2                                  ; 3904 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3907 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 390B _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 390E _ 8B. 4D, F4
        add     ecx, 2                                  ; 3911 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 3914 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 3918 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 391B _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 391E _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3921 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 3925 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3928 _ 8B. 00
        lea     edx, [eax-1H]                           ; 392A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 392D _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3930 _ 89. 10
?_182:  mov     eax, 0                                  ; 3932 _ B8, 00000000
        jmp     ?_189                                   ; 3937 _ E9, 0000011C

?_183:  mov     eax, dword [ebp+8H]                     ; 393C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 393F _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3941 _ 3B. 45, F4
        jle     ?_184                                   ; 3944 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 3946 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 3949 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 394C _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 394F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3952 _ 8B. 55, F4
        add     edx, 2                                  ; 3955 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3958 _ 8B. 04 D0
        cmp     ecx, eax                                ; 395B _ 39. C1
        jnz     ?_184                                   ; 395D _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 395F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3962 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3965 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3968 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 396B _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 396E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3971 _ 8B. 55, F4
        add     edx, 2                                  ; 3974 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3977 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 397B _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 397E _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3981 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3984 _ 8B. 55, F4
        add     edx, 2                                  ; 3987 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 398A _ 89. 4C D0, 04
        mov     eax, 0                                  ; 398E _ B8, 00000000
        jmp     ?_189                                   ; 3993 _ E9, 000000C0

?_184:  mov     eax, dword [ebp+8H]                     ; 3998 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 399B _ 8B. 00
        cmp     eax, 4095                               ; 399D _ 3D, 00000FFF
        jg      ?_188                                   ; 39A2 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 39A8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 39AB _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 39AD _ 89. 45, F8
        jmp     ?_186                                   ; 39B0 _ EB, 28

?_185:  mov     eax, dword [ebp-8H]                     ; 39B2 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 39B5 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 39B8 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 39BB _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 39BE _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 39C1 _ 8B. 45, 08
        add     edx, 2                                  ; 39C4 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 39C7 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 39CA _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 39CC _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 39CF _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 39D2 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 39D6 _ 83. 6D, F8, 01
?_186:  mov     eax, dword [ebp-8H]                     ; 39DA _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 39DD _ 3B. 45, F4
        jg      ?_185                                   ; 39E0 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 39E2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 39E5 _ 8B. 00
        lea     edx, [eax+1H]                           ; 39E7 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 39EA _ 8B. 45, 08
        mov     dword [eax], edx                        ; 39ED _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 39EF _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 39F2 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 39F5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 39F8 _ 8B. 00
        cmp     edx, eax                                ; 39FA _ 39. C2
        jge     ?_187                                   ; 39FC _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 39FE _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 3A01 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 3A03 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3A06 _ 89. 50, 04
?_187:  mov     eax, dword [ebp+8H]                     ; 3A09 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3A0C _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3A0F _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3A12 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 3A15 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 3A18 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3A1B _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3A1E _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 3A21 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 3A24 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 3A28 _ B8, 00000000
        jmp     ?_189                                   ; 3A2D _ EB, 29

?_188:  mov     eax, dword [ebp+8H]                     ; 3A2F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3A32 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 3A35 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3A38 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3A3B _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3A3E _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3A41 _ 8B. 40, 08
        mov     edx, eax                                ; 3A44 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3A46 _ 8B. 45, 10
        add     eax, edx                                ; 3A49 _ 01. D0
        mov     edx, eax                                ; 3A4B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3A4D _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3A50 _ 89. 50, 08
        mov     eax, 4294967295                         ; 3A53 _ B8, FFFFFFFF
?_189:  add     esp, 16                                 ; 3A58 _ 83. C4, 10
        pop     ebx                                     ; 3A5B _ 5B
        pop     ebp                                     ; 3A5C _ 5D
        ret                                             ; 3A5D _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 3A5E _ 55
        mov     ebp, esp                                ; 3A5F _ 89. E5
        sub     esp, 24                                 ; 3A61 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 3A64 _ 8B. 45, 0C
        add     eax, 4095                               ; 3A67 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 3A6C _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 3A71 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 3A74 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3A77 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3A7B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3A7E _ 89. 04 24
        call    memman_alloc                            ; 3A81 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 3A86 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3A89 _ 8B. 45, FC
        leave                                           ; 3A8C _ C9
        ret                                             ; 3A8D _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 3A8E _ 55
        mov     ebp, esp                                ; 3A8F _ 89. E5
        sub     esp, 28                                 ; 3A91 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 3A94 _ 8B. 45, 10
        add     eax, 4095                               ; 3A97 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 3A9C _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 3AA1 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 3AA4 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 3AA7 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 3AAB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3AAE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3AB2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3AB5 _ 89. 04 24
        call    memman_free                             ; 3AB8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 3ABD _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3AC0 _ 8B. 45, FC
        leave                                           ; 3AC3 _ C9
        ret                                             ; 3AC4 _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 3AC5 _ 55
        mov     ebp, esp                                ; 3AC6 _ 89. E5
        sub     esp, 40                                 ; 3AC8 _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 3ACB _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 3AD3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3AD6 _ 89. 04 24
        call    memman_alloc_4k                         ; 3AD9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3ADE _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 3AE1 _ 83. 7D, F4, 00
        jnz     ?_190                                   ; 3AE5 _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 3AE7 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 3AEA _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 3AF2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3AF6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3AF9 _ 89. 04 24
        call    memman_free_4k                          ; 3AFC _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3B01 _ B8, 00000000
        jmp     ?_194                                   ; 3B06 _ E9, 0000009D

?_190:  mov     eax, dword [ebp-0CH]                    ; 3B0B _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 3B0E _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3B11 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 3B13 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 3B16 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 3B19 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3B1C _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 3B1F _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3B22 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3B25 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 3B28 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 3B2F _ C7. 45, F0, 00000000
        jmp     ?_192                                   ; 3B36 _ EB, 1B

?_191:  mov     eax, dword [ebp-0CH]                    ; 3B38 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 3B3B _ 8B. 55, F0
        add     edx, 33                                 ; 3B3E _ 83. C2, 21
        shl     edx, 5                                  ; 3B41 _ C1. E2, 05
        add     eax, edx                                ; 3B44 _ 01. D0
        add     eax, 16                                 ; 3B46 _ 83. C0, 10
        mov     dword [eax], 0                          ; 3B49 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 3B4F _ 83. 45, F0, 01
?_192:  cmp     dword [ebp-10H], 255                    ; 3B53 _ 81. 7D, F0, 000000FF
        jle     ?_191                                   ; 3B5A _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 3B5C _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 3B5F _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 3B63 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3B67 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B6A _ 89. 04 24
        call    memman_alloc_4k                         ; 3B6D _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 3B72 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3B74 _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 3B77 _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 3B7A _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 3B7D _ 8B. 40, 10
        test    eax, eax                                ; 3B80 _ 85. C0
        jnz     ?_193                                   ; 3B82 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 3B84 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 3B87 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 3B8F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3B93 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B96 _ 89. 04 24
        call    memman_free_4k                          ; 3B99 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3B9E _ B8, 00000000
        jmp     ?_194                                   ; 3BA3 _ EB, 03

?_193:  mov     eax, dword [ebp-0CH]                    ; 3BA5 _ 8B. 45, F4
?_194:  leave                                           ; 3BA8 _ C9
        ret                                             ; 3BA9 _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 3BAA _ 55
        mov     ebp, esp                                ; 3BAB _ 89. E5
        sub     esp, 16                                 ; 3BAD _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3BB0 _ C7. 45, F8, 00000000
        jmp     ?_197                                   ; 3BB7 _ EB, 5B

?_195:  mov     eax, dword [ebp+8H]                     ; 3BB9 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3BBC _ 8B. 55, F8
        add     edx, 33                                 ; 3BBF _ 83. C2, 21
        shl     edx, 5                                  ; 3BC2 _ C1. E2, 05
        add     eax, edx                                ; 3BC5 _ 01. D0
        add     eax, 16                                 ; 3BC7 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 3BCA _ 8B. 00
        test    eax, eax                                ; 3BCC _ 85. C0
        jnz     ?_196                                   ; 3BCE _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 3BD0 _ 8B. 45, F8
        shl     eax, 5                                  ; 3BD3 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 3BD6 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 3BDC _ 8B. 45, 08
        add     eax, edx                                ; 3BDF _ 01. D0
        add     eax, 4                                  ; 3BE1 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 3BE4 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3BE7 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3BEA _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 3BED _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 3BF0 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 3BF3 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 3BF7 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 3BFA _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 3C01 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 3C04 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 3C0B _ 8B. 45, FC
        jmp     ?_198                                   ; 3C0E _ EB, 12

?_196:  add     dword [ebp-8H], 1                       ; 3C10 _ 83. 45, F8, 01
?_197:  cmp     dword [ebp-8H], 255                     ; 3C14 _ 81. 7D, F8, 000000FF
        jle     ?_195                                   ; 3C1B _ 7E, 9C
        mov     eax, 0                                  ; 3C1D _ B8, 00000000
?_198:  leave                                           ; 3C22 _ C9
        ret                                             ; 3C23 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 3C24 _ 55
        mov     ebp, esp                                ; 3C25 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3C27 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3C2A _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3C2D _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3C2F _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3C32 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 3C35 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3C38 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 3C3B _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3C3E _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3C41 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 3C44 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 3C47 _ 89. 50, 14
        pop     ebp                                     ; 3C4A _ 5D
        ret                                             ; 3C4B _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 3C4C _ 55
        mov     ebp, esp                                ; 3C4D _ 89. E5
        push    esi                                     ; 3C4F _ 56
        push    ebx                                     ; 3C50 _ 53
        sub     esp, 48                                 ; 3C51 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 3C54 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3C57 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 3C5A _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3C5D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3C60 _ 8B. 40, 0C
        add     eax, 1                                  ; 3C63 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 3C66 _ 3B. 45, 10
        jge     ?_199                                   ; 3C69 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 3C6B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3C6E _ 8B. 40, 0C
        add     eax, 1                                  ; 3C71 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 3C74 _ 89. 45, 10
?_199:  cmp     dword [ebp+10H], -1                     ; 3C77 _ 83. 7D, 10, FF
        jge     ?_200                                   ; 3C7B _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 3C7D _ C7. 45, 10, FFFFFFFF
?_200:  mov     eax, dword [ebp+0CH]                    ; 3C84 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3C87 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 3C8A _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 3C8D _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3C90 _ 3B. 45, 10
        jle     ?_207                                   ; 3C93 _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 3C99 _ 83. 7D, 10, 00
        js      ?_203                                   ; 3C9D _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 3CA3 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3CA6 _ 89. 45, F0
        jmp     ?_202                                   ; 3CA9 _ EB, 34

?_201:  mov     eax, dword [ebp-10H]                    ; 3CAB _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3CAE _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3CB1 _ 8B. 45, 08
        add     edx, 4                                  ; 3CB4 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3CB7 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3CBB _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3CBE _ 8B. 4D, F0
        add     ecx, 4                                  ; 3CC1 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3CC4 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3CC8 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3CCB _ 8B. 55, F0
        add     edx, 4                                  ; 3CCE _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3CD1 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3CD5 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3CD8 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 3CDB _ 83. 6D, F0, 01
?_202:  mov     eax, dword [ebp-10H]                    ; 3CDF _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3CE2 _ 3B. 45, 10
        jg      ?_201                                   ; 3CE5 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 3CE7 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3CEA _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3CED _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3CF0 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3CF3 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 3CF7 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3CFA _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3CFD _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3D00 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3D03 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3D06 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3D09 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3D0C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3D0F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3D12 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3D15 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3D18 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3D1B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3D1E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3D21 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3D24 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 3D27 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3D2B _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3D2F _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3D33 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3D37 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3D3B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3D3E _ 89. 04 24
        call    sheet_refresh_map                       ; 3D41 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3D46 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3D49 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3D4C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3D4F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3D52 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3D55 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3D58 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3D5B _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3D5E _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3D61 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3D64 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3D67 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3D6A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3D6D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3D70 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3D73 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 3D76 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3D7A _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3D7E _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3D82 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3D86 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3D8A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3D8D _ 89. 04 24
        call    sheet_refresh_local                     ; 3D90 _ E8, FFFFFFFC(rel)
        jmp     ?_214                                   ; 3D95 _ E9, 0000026C

?_203:  mov     eax, dword [ebp+8H]                     ; 3D9A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3D9D _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 3DA0 _ 3B. 45, F4
        jle     ?_206                                   ; 3DA3 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 3DA5 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3DA8 _ 89. 45, F0
        jmp     ?_205                                   ; 3DAB _ EB, 34

?_204:  mov     eax, dword [ebp-10H]                    ; 3DAD _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3DB0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3DB3 _ 8B. 45, 08
        add     edx, 4                                  ; 3DB6 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3DB9 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3DBD _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3DC0 _ 8B. 4D, F0
        add     ecx, 4                                  ; 3DC3 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3DC6 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3DCA _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3DCD _ 8B. 55, F0
        add     edx, 4                                  ; 3DD0 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3DD3 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3DD7 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3DDA _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 3DDD _ 83. 45, F0, 01
?_205:  mov     eax, dword [ebp+8H]                     ; 3DE1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3DE4 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 3DE7 _ 3B. 45, F0
        jg      ?_204                                   ; 3DEA _ 7F, C1
?_206:  mov     eax, dword [ebp+8H]                     ; 3DEC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3DEF _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 3DF2 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3DF5 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3DF8 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3DFB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3DFE _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3E01 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3E04 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3E07 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3E0A _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3E0D _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3E10 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3E13 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3E16 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3E19 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3E1C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3E1F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3E22 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 3E25 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3E2D _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3E31 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3E35 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3E39 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3E3D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3E40 _ 89. 04 24
        call    sheet_refresh_map                       ; 3E43 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3E48 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3E4B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3E4E _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3E51 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3E54 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3E57 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3E5A _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3E5D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3E60 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3E63 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3E66 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3E69 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3E6C _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3E6F _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 3E72 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3E7A _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3E7E _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3E82 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3E86 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3E8A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3E8D _ 89. 04 24
        call    sheet_refresh_local                     ; 3E90 _ E8, FFFFFFFC(rel)
        jmp     ?_214                                   ; 3E95 _ E9, 0000016C

?_207:  mov     eax, dword [ebp-0CH]                    ; 3E9A _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3E9D _ 3B. 45, 10
        jge     ?_214                                   ; 3EA0 _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 3EA6 _ 83. 7D, F4, 00
        js      ?_210                                   ; 3EAA _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 3EAC _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3EAF _ 89. 45, F0
        jmp     ?_209                                   ; 3EB2 _ EB, 34

?_208:  mov     eax, dword [ebp-10H]                    ; 3EB4 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3EB7 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3EBA _ 8B. 45, 08
        add     edx, 4                                  ; 3EBD _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3EC0 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3EC4 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3EC7 _ 8B. 4D, F0
        add     ecx, 4                                  ; 3ECA _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3ECD _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3ED1 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3ED4 _ 8B. 55, F0
        add     edx, 4                                  ; 3ED7 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3EDA _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3EDE _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3EE1 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 3EE4 _ 83. 45, F0, 01
?_209:  mov     eax, dword [ebp-10H]                    ; 3EE8 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3EEB _ 3B. 45, 10
        jl      ?_208                                   ; 3EEE _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 3EF0 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3EF3 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3EF6 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3EF9 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3EFC _ 89. 54 88, 04
        jmp     ?_213                                   ; 3F00 _ EB, 6C

?_210:  mov     eax, dword [ebp+8H]                     ; 3F02 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3F05 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 3F08 _ 89. 45, F0
        jmp     ?_212                                   ; 3F0B _ EB, 3A

?_211:  mov     eax, dword [ebp-10H]                    ; 3F0D _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 3F10 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 3F13 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3F16 _ 8B. 55, F0
        add     edx, 4                                  ; 3F19 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3F1C _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3F20 _ 8B. 45, 08
        add     ecx, 4                                  ; 3F23 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3F26 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 3F2A _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3F2D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3F30 _ 8B. 45, 08
        add     edx, 4                                  ; 3F33 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3F36 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3F3A _ 8B. 55, F0
        add     edx, 1                                  ; 3F3D _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 3F40 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 3F43 _ 83. 6D, F0, 01
?_212:  mov     eax, dword [ebp-10H]                    ; 3F47 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3F4A _ 3B. 45, 10
        jge     ?_211                                   ; 3F4D _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 3F4F _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3F52 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3F55 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3F58 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3F5B _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3F5F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3F62 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 3F65 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3F68 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3F6B _ 89. 50, 0C
?_213:  mov     eax, dword [ebp+0CH]                    ; 3F6E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3F71 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3F74 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3F77 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3F7A _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3F7D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3F80 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3F83 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3F86 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3F89 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3F8C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3F8F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3F92 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3F95 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 3F98 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3F9B _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3F9F _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3FA3 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3FA7 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3FAB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3FAF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3FB2 _ 89. 04 24
        call    sheet_refresh_map                       ; 3FB5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3FBA _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3FBD _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3FC0 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3FC3 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3FC6 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3FC9 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3FCC _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3FCF _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3FD2 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3FD5 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3FD8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3FDB _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3FDE _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3FE1 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 3FE4 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3FE7 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3FEB _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3FEF _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3FF3 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3FF7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3FFB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3FFE _ 89. 04 24
        call    sheet_refresh_local                     ; 4001 _ E8, FFFFFFFC(rel)
?_214:  add     esp, 48                                 ; 4006 _ 83. C4, 30
        pop     ebx                                     ; 4009 _ 5B
        pop     esi                                     ; 400A _ 5E
        pop     ebp                                     ; 400B _ 5D
        ret                                             ; 400C _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 400D _ 55
        mov     ebp, esp                                ; 400E _ 89. E5
        push    edi                                     ; 4010 _ 57
        push    esi                                     ; 4011 _ 56
        push    ebx                                     ; 4012 _ 53
        sub     esp, 44                                 ; 4013 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 4016 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4019 _ 8B. 40, 18
        test    eax, eax                                ; 401C _ 85. C0
        js      ?_215                                   ; 401E _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 4020 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 4023 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 4026 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 4029 _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 402C _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 402F _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 4032 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 4035 _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 4038 _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 403B _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 403E _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 4041 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 4044 _ 8B. 55, 14
        add     ecx, edx                                ; 4047 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 4049 _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 404C _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 404F _ 8B. 55, 10
        add     edx, edi                                ; 4052 _ 01. FA
        mov     dword [esp+14H], eax                    ; 4054 _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 4058 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 405C _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 4060 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 4064 _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 4068 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 406B _ 89. 04 24
        call    sheet_refresh_local                     ; 406E _ E8, FFFFFFFC(rel)
?_215:  mov     eax, 0                                  ; 4073 _ B8, 00000000
        add     esp, 44                                 ; 4078 _ 83. C4, 2C
        pop     ebx                                     ; 407B _ 5B
        pop     esi                                     ; 407C _ 5E
        pop     edi                                     ; 407D _ 5F
        pop     ebp                                     ; 407E _ 5D
        ret                                             ; 407F _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 4080 _ 55
        mov     ebp, esp                                ; 4081 _ 89. E5
        push    ebx                                     ; 4083 _ 53
        sub     esp, 52                                 ; 4084 _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 4087 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 408A _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 408D _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 4090 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 4093 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 4096 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 4099 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 409C _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 409F _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 40A2 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 40A5 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 40A8 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 40AB _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 40AE _ 8B. 40, 18
        test    eax, eax                                ; 40B1 _ 85. C0
        js      ?_216                                   ; 40B3 _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 40B9 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 40BC _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 40BF _ 8B. 45, F4
        add     edx, eax                                ; 40C2 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 40C4 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 40C7 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 40CA _ 8B. 45, F0
        add     eax, ecx                                ; 40CD _ 01. C8
        mov     dword [esp+14H], 0                      ; 40CF _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 40D7 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 40DB _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 40DF _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 40E2 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 40E6 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 40E9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 40ED _ 8B. 45, 08
        mov     dword [esp], eax                        ; 40F0 _ 89. 04 24
        call    sheet_refresh_map                       ; 40F3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 40F8 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 40FB _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 40FE _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 4101 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 4104 _ 8B. 55, 14
        add     ecx, edx                                ; 4107 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 4109 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 410C _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 410F _ 8B. 55, 10
        add     edx, ebx                                ; 4112 _ 01. DA
        mov     dword [esp+14H], eax                    ; 4114 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 4118 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 411C _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 4120 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 4123 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 4127 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 412A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 412E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4131 _ 89. 04 24
        call    sheet_refresh_map                       ; 4134 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4139 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 413C _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 413F _ 8B. 45, F4
        add     edx, eax                                ; 4142 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4144 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 4147 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 414A _ 8B. 45, F0
        add     eax, ecx                                ; 414D _ 01. C8
        mov     dword [esp+14H], 0                      ; 414F _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 4157 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 415B _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 415F _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 4162 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 4166 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 4169 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 416D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4170 _ 89. 04 24
        call    sheet_refresh_local                     ; 4173 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4178 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 417B _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 417E _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 4181 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 4184 _ 8B. 55, 14
        add     ecx, edx                                ; 4187 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 4189 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 418C _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 418F _ 8B. 55, 10
        add     edx, ebx                                ; 4192 _ 01. DA
        mov     dword [esp+14H], eax                    ; 4194 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 4198 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 419C _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 41A0 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 41A3 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 41A7 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 41AA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 41AE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 41B1 _ 89. 04 24
        call    sheet_refresh_local                     ; 41B4 _ E8, FFFFFFFC(rel)
?_216:  add     esp, 52                                 ; 41B9 _ 83. C4, 34
        pop     ebx                                     ; 41BC _ 5B
        pop     ebp                                     ; 41BD _ 5D
        ret                                             ; 41BE _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 41BF _ 55
        mov     ebp, esp                                ; 41C0 _ 89. E5
        sub     esp, 48                                 ; 41C2 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 41C5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 41C8 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 41CA _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 41CD _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 41D0 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 41D3 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 41D6 _ 83. 7D, 0C, 00
        jns     ?_217                                   ; 41DA _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 41DC _ C7. 45, 0C, 00000000
?_217:  cmp     dword [ebp+10H], 0                      ; 41E3 _ 83. 7D, 10, 00
        jns     ?_218                                   ; 41E7 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 41E9 _ C7. 45, 10, 00000000
?_218:  mov     eax, dword [ebp+8H]                     ; 41F0 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 41F3 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 41F6 _ 3B. 45, 14
        jge     ?_219                                   ; 41F9 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 41FB _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 41FE _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 4201 _ 89. 45, 14
?_219:  mov     eax, dword [ebp+8H]                     ; 4204 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4207 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 420A _ 3B. 45, 18
        jge     ?_220                                   ; 420D _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 420F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4212 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 4215 _ 89. 45, 18
?_220:  mov     eax, dword [ebp+1CH]                    ; 4218 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 421B _ 89. 45, DC
        jmp     ?_227                                   ; 421E _ E9, 00000119

?_221:  mov     eax, dword [ebp+8H]                     ; 4223 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 4226 _ 8B. 55, DC
        add     edx, 4                                  ; 4229 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 422C _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 4230 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 4233 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 4236 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 4238 _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 423B _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 423E _ 8B. 45, 08
        add     eax, 1044                               ; 4241 _ 05, 00000414
        sub     edx, eax                                ; 4246 _ 29. C2
        mov     eax, edx                                ; 4248 _ 89. D0
        sar     eax, 5                                  ; 424A _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 424D _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 4250 _ C7. 45, E4, 00000000
        jmp     ?_226                                   ; 4257 _ E9, 000000CD

?_222:  mov     eax, dword [ebp-10H]                    ; 425C _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 425F _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 4262 _ 8B. 45, E4
        add     eax, edx                                ; 4265 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4267 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 426A _ C7. 45, E0, 00000000
        jmp     ?_225                                   ; 4271 _ E9, 000000A0

?_223:  mov     eax, dword [ebp-10H]                    ; 4276 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 4279 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 427C _ 8B. 45, E0
        add     eax, edx                                ; 427F _ 01. D0
        mov     dword [ebp-4H], eax                     ; 4281 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 4284 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 4287 _ 3B. 45, FC
        jg      ?_224                                   ; 428A _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 4290 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 4293 _ 3B. 45, 14
        jge     ?_224                                   ; 4296 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 4298 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 429B _ 3B. 45, F8
        jg      ?_224                                   ; 429E _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 42A0 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 42A3 _ 3B. 45, 18
        jge     ?_224                                   ; 42A6 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 42A8 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 42AB _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 42AE _ 0F AF. 45, E4
        mov     edx, eax                                ; 42B2 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 42B4 _ 8B. 45, E0
        add     eax, edx                                ; 42B7 _ 01. D0
        mov     edx, eax                                ; 42B9 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 42BB _ 8B. 45, F4
        add     eax, edx                                ; 42BE _ 01. D0
        movzx   eax, byte [eax]                         ; 42C0 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 42C3 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 42C6 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 42CA _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 42CD _ 8B. 40, 14
        cmp     edx, eax                                ; 42D0 _ 39. C2
        jz      ?_224                                   ; 42D2 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 42D4 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 42D7 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 42DA _ 0F AF. 45, F8
        mov     edx, eax                                ; 42DE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 42E0 _ 8B. 45, FC
        add     eax, edx                                ; 42E3 _ 01. D0
        mov     edx, eax                                ; 42E5 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 42E7 _ 8B. 45, EC
        add     eax, edx                                ; 42EA _ 01. D0
        movzx   eax, byte [eax]                         ; 42EC _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 42EF _ 3A. 45, DA
        jnz     ?_224                                   ; 42F2 _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 42F4 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 42F7 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 42FA _ 0F AF. 45, F8
        mov     edx, eax                                ; 42FE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4300 _ 8B. 45, FC
        add     eax, edx                                ; 4303 _ 01. D0
        mov     edx, eax                                ; 4305 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 4307 _ 8B. 45, E8
        add     edx, eax                                ; 430A _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 430C _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 4310 _ 88. 02
?_224:  add     dword [ebp-20H], 1                      ; 4312 _ 83. 45, E0, 01
?_225:  mov     eax, dword [ebp-10H]                    ; 4316 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4319 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 431C _ 3B. 45, E0
        jg      ?_223                                   ; 431F _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 4325 _ 83. 45, E4, 01
?_226:  mov     eax, dword [ebp-10H]                    ; 4329 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 432C _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 432F _ 3B. 45, E4
        jg      ?_222                                   ; 4332 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 4338 _ 83. 45, DC, 01
?_227:  mov     eax, dword [ebp+8H]                     ; 433C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 433F _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 4342 _ 3B. 45, DC
        jge     ?_221                                   ; 4345 _ 0F 8D, FFFFFED8
        leave                                           ; 434B _ C9
        ret                                             ; 434C _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 434D _ 55
        mov     ebp, esp                                ; 434E _ 89. E5
        sub     esp, 64                                 ; 4350 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 4353 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4356 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 4358 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 435B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 435E _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 4361 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 4364 _ 83. 7D, 0C, 00
        jns     ?_228                                   ; 4368 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 436A _ C7. 45, 0C, 00000000
?_228:  cmp     dword [ebp+10H], 0                      ; 4371 _ 83. 7D, 10, 00
        jns     ?_229                                   ; 4375 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 4377 _ C7. 45, 10, 00000000
?_229:  mov     eax, dword [ebp+8H]                     ; 437E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4381 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 4384 _ 3B. 45, 14
        jge     ?_230                                   ; 4387 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4389 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 438C _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 438F _ 89. 45, 14
?_230:  mov     eax, dword [ebp+8H]                     ; 4392 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4395 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 4398 _ 3B. 45, 18
        jge     ?_231                                   ; 439B _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 439D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 43A0 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 43A3 _ 89. 45, 18
?_231:  mov     eax, dword [ebp+1CH]                    ; 43A6 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 43A9 _ 89. 45, CC
        jmp     ?_242                                   ; 43AC _ E9, 00000141

?_232:  mov     eax, dword [ebp+8H]                     ; 43B1 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 43B4 _ 8B. 55, CC
        add     edx, 4                                  ; 43B7 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 43BA _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 43BE _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 43C1 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 43C4 _ 8B. 45, 08
        add     eax, 1044                               ; 43C7 _ 05, 00000414
        sub     edx, eax                                ; 43CC _ 29. C2
        mov     eax, edx                                ; 43CE _ 89. D0
        sar     eax, 5                                  ; 43D0 _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 43D3 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 43D6 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 43D9 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 43DB _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 43DE _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 43E1 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 43E4 _ 8B. 55, 0C
        sub     edx, eax                                ; 43E7 _ 29. C2
        mov     eax, edx                                ; 43E9 _ 89. D0
        mov     dword [ebp-30H], eax                    ; 43EB _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 43EE _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 43F1 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 43F4 _ 8B. 55, 10
        sub     edx, eax                                ; 43F7 _ 29. C2
        mov     eax, edx                                ; 43F9 _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 43FB _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 43FE _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4401 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 4404 _ 8B. 55, 14
        sub     edx, eax                                ; 4407 _ 29. C2
        mov     eax, edx                                ; 4409 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 440B _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 440E _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 4411 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 4414 _ 8B. 55, 18
        sub     edx, eax                                ; 4417 _ 29. C2
        mov     eax, edx                                ; 4419 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 441B _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 441E _ 83. 7D, D0, 00
        jns     ?_233                                   ; 4422 _ 79, 07
        mov     dword [ebp-30H], 0                      ; 4424 _ C7. 45, D0, 00000000
?_233:  cmp     dword [ebp-2CH], 0                      ; 442B _ 83. 7D, D4, 00
        jns     ?_234                                   ; 442F _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 4431 _ C7. 45, D4, 00000000
?_234:  mov     eax, dword [ebp-10H]                    ; 4438 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 443B _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 443E _ 3B. 45, D8
        jge     ?_235                                   ; 4441 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4443 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4446 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 4449 _ 89. 45, D8
?_235:  mov     eax, dword [ebp-10H]                    ; 444C _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 444F _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 4452 _ 3B. 45, DC
        jge     ?_236                                   ; 4455 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4457 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 445A _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 445D _ 89. 45, DC
?_236:  mov     eax, dword [ebp-2CH]                    ; 4460 _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 4463 _ 89. 45, E4
        jmp     ?_241                                   ; 4466 _ EB, 7A

?_237:  mov     eax, dword [ebp-10H]                    ; 4468 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 446B _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 446E _ 8B. 45, E4
        add     eax, edx                                ; 4471 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4473 _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 4476 _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 4479 _ 89. 45, E0
        jmp     ?_240                                   ; 447C _ EB, 58

?_238:  mov     eax, dword [ebp-10H]                    ; 447E _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 4481 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 4484 _ 8B. 45, E0
        add     eax, edx                                ; 4487 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 4489 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 448C _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 448F _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 4492 _ 0F AF. 45, E4
        mov     edx, eax                                ; 4496 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 4498 _ 8B. 45, E0
        add     eax, edx                                ; 449B _ 01. D0
        mov     edx, eax                                ; 449D _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 449F _ 8B. 45, F4
        add     eax, edx                                ; 44A2 _ 01. D0
        movzx   eax, byte [eax]                         ; 44A4 _ 0F B6. 00
        movzx   edx, al                                 ; 44A7 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 44AA _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 44AD _ 8B. 40, 14
        cmp     edx, eax                                ; 44B0 _ 39. C2
        jz      ?_239                                   ; 44B2 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 44B4 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 44B7 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 44BA _ 0F AF. 45, F8
        mov     edx, eax                                ; 44BE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 44C0 _ 8B. 45, FC
        add     eax, edx                                ; 44C3 _ 01. D0
        mov     edx, eax                                ; 44C5 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 44C7 _ 8B. 45, EC
        add     edx, eax                                ; 44CA _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 44CC _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 44D0 _ 88. 02
?_239:  add     dword [ebp-20H], 1                      ; 44D2 _ 83. 45, E0, 01
?_240:  mov     eax, dword [ebp-20H]                    ; 44D6 _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 44D9 _ 3B. 45, D8
        jl      ?_238                                   ; 44DC _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 44DE _ 83. 45, E4, 01
?_241:  mov     eax, dword [ebp-1CH]                    ; 44E2 _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 44E5 _ 3B. 45, DC
        jl      ?_237                                   ; 44E8 _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 44EE _ 83. 45, CC, 01
?_242:  mov     eax, dword [ebp+8H]                     ; 44F2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 44F5 _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 44F8 _ 3B. 45, CC
        jge     ?_232                                   ; 44FB _ 0F 8D, FFFFFEB0
        leave                                           ; 4501 _ C9
        ret                                             ; 4502 _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 4503 _ 55
        mov     ebp, esp                                ; 4504 _ 89. E5
        sub     esp, 40                                 ; 4506 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 4509 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 4511 _ C7. 04 24, 00000043
        call    io_out8                                 ; 4518 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 451D _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 4525 _ C7. 04 24, 00000040
        call    io_out8                                 ; 452C _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 4531 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 4539 _ C7. 04 24, 00000040
        call    io_out8                                 ; 4540 _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 4545 _ C7. 05, 00000300(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 454F _ C7. 45, F4, 00000000
        jmp     ?_244                                   ; 4556 _ EB, 28

?_243:  mov     eax, dword [ebp-0CH]                    ; 4558 _ 8B. 45, F4
        shl     eax, 4                                  ; 455B _ C1. E0, 04
        add     eax, timer_control                      ; 455E _ 05, 00000300(d)
        mov     dword [eax+8H], 0                       ; 4563 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 456A _ 8B. 45, F4
        shl     eax, 4                                  ; 456D _ C1. E0, 04
        add     eax, timer_control                      ; 4570 _ 05, 00000300(d)
        mov     dword [eax+0CH], 0                      ; 4575 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 457C _ 83. 45, F4, 01
?_244:  cmp     dword [ebp-0CH], 499                    ; 4580 _ 81. 7D, F4, 000001F3
        jle     ?_243                                   ; 4587 _ 7E, CF
        leave                                           ; 4589 _ C9
        ret                                             ; 458A _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 458B _ 55
        mov     ebp, esp                                ; 458C _ 89. E5
        mov     eax, timer_control                      ; 458E _ B8, 00000300(d)
        pop     ebp                                     ; 4593 _ 5D
        ret                                             ; 4594 _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 4595 _ 55
        mov     ebp, esp                                ; 4596 _ 89. E5
        sub     esp, 16                                 ; 4598 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 459B _ C7. 45, FC, 00000000
        jmp     ?_247                                   ; 45A2 _ EB, 26

?_245:  mov     eax, dword [ebp-4H]                     ; 45A4 _ 8B. 45, FC
        shl     eax, 4                                  ; 45A7 _ C1. E0, 04
        add     eax, timer_control                      ; 45AA _ 05, 00000300(d)
        mov     eax, dword [eax+8H]                     ; 45AF _ 8B. 40, 08
        test    eax, eax                                ; 45B2 _ 85. C0
        jnz     ?_246                                   ; 45B4 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 45B6 _ 8B. 45, FC
        shl     eax, 4                                  ; 45B9 _ C1. E0, 04
        add     eax, timer_control                      ; 45BC _ 05, 00000300(d)
        add     eax, 4                                  ; 45C1 _ 83. C0, 04
        jmp     ?_248                                   ; 45C4 _ EB, 0D

?_246:  add     dword [ebp-4H], 1                       ; 45C6 _ 83. 45, FC, 01
?_247:  cmp     dword [ebp-4H], 499                     ; 45CA _ 81. 7D, FC, 000001F3
        jle     ?_245                                   ; 45D1 _ 7E, D1
?_248:  leave                                           ; 45D3 _ C9
        ret                                             ; 45D4 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 45D5 _ 55
        mov     ebp, esp                                ; 45D6 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 45D8 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 45DB _ C7. 40, 04, 00000000
        pop     ebp                                     ; 45E2 _ 5D
        ret                                             ; 45E3 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 45E4 _ 55
        mov     ebp, esp                                ; 45E5 _ 89. E5
        sub     esp, 4                                  ; 45E7 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 45EA _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 45ED _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 45F0 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 45F3 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 45F6 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 45F9 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 45FC _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 4600 _ 88. 50, 0C
        leave                                           ; 4603 _ C9
        ret                                             ; 4604 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 4605 _ 55
        mov     ebp, esp                                ; 4606 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4608 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 460B _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 460E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4610 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4613 _ C7. 40, 04, 00000002
        pop     ebp                                     ; 461A _ 5D
        ret                                             ; 461B _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 461C _ 55
        mov     ebp, esp                                ; 461D _ 89. E5
        sub     esp, 40                                 ; 461F _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 4622 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 462A _ C7. 04 24, 00000020
        call    io_out8                                 ; 4631 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 4636 _ A1, 00000300(d)
        add     eax, 1                                  ; 463B _ 83. C0, 01
        mov     dword [timer_control], eax              ; 463E _ A3, 00000300(d)
        mov     byte [ebp-0DH], 0                       ; 4643 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 4647 _ C7. 45, F4, 00000000
        jmp     ?_252                                   ; 464E _ E9, 000000B0

?_249:  mov     eax, dword [ebp-0CH]                    ; 4653 _ 8B. 45, F4
        shl     eax, 4                                  ; 4656 _ C1. E0, 04
        add     eax, timer_control                      ; 4659 _ 05, 00000300(d)
        mov     eax, dword [eax+8H]                     ; 465E _ 8B. 40, 08
        cmp     eax, 2                                  ; 4661 _ 83. F8, 02
        jne     ?_250                                   ; 4664 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 466A _ 8B. 45, F4
        shl     eax, 4                                  ; 466D _ C1. E0, 04
        add     eax, timer_control                      ; 4670 _ 05, 00000300(d)
        mov     eax, dword [eax+4H]                     ; 4675 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 4678 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 467B _ 8B. 45, F4
        shl     eax, 4                                  ; 467E _ C1. E0, 04
        add     eax, timer_control                      ; 4681 _ 05, 00000300(d)
        mov     dword [eax+4H], edx                     ; 4686 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 4689 _ 8B. 45, F4
        shl     eax, 4                                  ; 468C _ C1. E0, 04
        add     eax, timer_control                      ; 468F _ 05, 00000300(d)
        mov     eax, dword [eax+4H]                     ; 4694 _ 8B. 40, 04
        test    eax, eax                                ; 4697 _ 85. C0
        jnz     ?_250                                   ; 4699 _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 469B _ 8B. 45, F4
        shl     eax, 4                                  ; 469E _ C1. E0, 04
        add     eax, timer_control                      ; 46A1 _ 05, 00000300(d)
        mov     dword [eax+8H], 1                       ; 46A6 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 46AD _ 8B. 45, F4
        shl     eax, 4                                  ; 46B0 _ C1. E0, 04
        add     eax, timer_control                      ; 46B3 _ 05, 00000300(d)
        movzx   eax, byte [eax+10H]                     ; 46B8 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 46BC _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 46BF _ 8B. 45, F4
        shl     eax, 4                                  ; 46C2 _ C1. E0, 04
        add     eax, timer_control                      ; 46C5 _ 05, 00000300(d)
        mov     eax, dword [eax+0CH]                    ; 46CA _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 46CD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 46D1 _ 89. 04 24
        call    fifo8_put                               ; 46D4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 46D9 _ 8B. 45, F4
        shl     eax, 4                                  ; 46DC _ C1. E0, 04
        add     eax, timer_control                      ; 46DF _ 05, 00000300(d)
        lea     edx, [eax+4H]                           ; 46E4 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 46E7 _ A1, 00000000(d)
        cmp     edx, eax                                ; 46EC _ 39. C2
        jnz     ?_250                                   ; 46EE _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 46F0 _ C6. 45, F3, 01
?_250:  cmp     byte [ebp-0DH], 0                       ; 46F4 _ 80. 7D, F3, 00
        jz      ?_251                                   ; 46F8 _ 74, 05
        call    task_switch                             ; 46FA _ E8, FFFFFFFC(rel)
?_251:  add     dword [ebp-0CH], 1                      ; 46FF _ 83. 45, F4, 01
?_252:  cmp     dword [ebp-0CH], 499                    ; 4703 _ 81. 7D, F4, 000001F3
        jle     ?_249                                   ; 470A _ 0F 8E, FFFFFF43
        leave                                           ; 4710 _ C9
        ret                                             ; 4711 _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 4712 _ 55
        mov     ebp, esp                                ; 4713 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 4715 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_253                                   ; 471C _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 471E _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 4725 _ 8B. 45, 0C
        shr     eax, 12                                 ; 4728 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 472B _ 89. 45, 0C
?_253:  mov     eax, dword [ebp+0CH]                    ; 472E _ 8B. 45, 0C
        mov     edx, eax                                ; 4731 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4733 _ 8B. 45, 08
        mov     word [eax], dx                          ; 4736 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 4739 _ 8B. 45, 10
        mov     edx, eax                                ; 473C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 473E _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 4741 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 4745 _ 8B. 45, 10
        sar     eax, 16                                 ; 4748 _ C1. F8, 10
        mov     edx, eax                                ; 474B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 474D _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 4750 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 4753 _ 8B. 45, 14
        mov     edx, eax                                ; 4756 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4758 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 475B _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 475E _ 8B. 45, 0C
        shr     eax, 16                                 ; 4761 _ C1. E8, 10
        and     eax, 0FH                                ; 4764 _ 83. E0, 0F
        mov     edx, eax                                ; 4767 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 4769 _ 8B. 45, 14
        sar     eax, 8                                  ; 476C _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 476F _ 83. E0, F0
        or      eax, edx                                ; 4772 _ 09. D0
        mov     edx, eax                                ; 4774 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4776 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 4779 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 477C _ 8B. 45, 10
        shr     eax, 24                                 ; 477F _ C1. E8, 18
        mov     edx, eax                                ; 4782 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4784 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 4787 _ 88. 50, 07
        pop     ebp                                     ; 478A _ 5D
        ret                                             ; 478B _ C3
; segment_descriptor End of function

init_task_level:; Function begin
        push    ebp                                     ; 478C _ 55
        mov     ebp, esp                                ; 478D _ 89. E5
        sub     esp, 16                                 ; 478F _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4792 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp+8H]                     ; 4798 _ 8B. 55, 08
        mov     eax, edx                                ; 479B _ 89. D0
        shl     eax, 2                                  ; 479D _ C1. E0, 02
        add     eax, edx                                ; 47A0 _ 01. D0
        shl     eax, 2                                  ; 47A2 _ C1. E0, 02
        add     eax, ecx                                ; 47A5 _ 01. C8
        add     eax, 8                                  ; 47A7 _ 83. C0, 08
        mov     dword [eax], 0                          ; 47AA _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 47B0 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp+8H]                     ; 47B6 _ 8B. 55, 08
        mov     eax, edx                                ; 47B9 _ 89. D0
        shl     eax, 2                                  ; 47BB _ C1. E0, 02
        add     eax, edx                                ; 47BE _ 01. D0
        shl     eax, 2                                  ; 47C0 _ C1. E0, 02
        add     eax, ecx                                ; 47C3 _ 01. C8
        add     eax, 12                                 ; 47C5 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 47C8 _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 47CE _ C7. 45, FC, 00000000
        jmp     ?_255                                   ; 47D5 _ EB, 21

?_254:  mov     ecx, dword [task_control]               ; 47D7 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 47DD _ 8B. 55, FC
        mov     eax, edx                                ; 47E0 _ 89. D0
        add     eax, eax                                ; 47E2 _ 01. C0
        add     eax, edx                                ; 47E4 _ 01. D0
        shl     eax, 3                                  ; 47E6 _ C1. E0, 03
        add     eax, ecx                                ; 47E9 _ 01. C8
        add     eax, 16                                 ; 47EB _ 83. C0, 10
        mov     dword [eax], 0                          ; 47EE _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 47F4 _ 83. 45, FC, 01
?_255:  cmp     dword [ebp-4H], 2                       ; 47F8 _ 83. 7D, FC, 02
        jle     ?_254                                   ; 47FC _ 7E, D9
        leave                                           ; 47FE _ C9
        ret                                             ; 47FF _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 4800 _ 55
        mov     ebp, esp                                ; 4801 _ 89. E5
        sub     esp, 40                                 ; 4803 _ 83. EC, 28
        call    get_addr_gdt                            ; 4806 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 480B _ 89. 45, F0
        mov     dword [esp+4H], 668                     ; 480E _ C7. 44 24, 04, 0000029C
        mov     eax, dword [ebp+8H]                     ; 4816 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4819 _ 89. 04 24
        call    memman_alloc_4k                         ; 481C _ E8, FFFFFFFC(rel)
        mov     dword [task_control], eax               ; 4821 _ A3, 00002248(d)
        mov     dword [ebp-14H], 0                      ; 4826 _ C7. 45, EC, 00000000
        jmp     ?_257                                   ; 482D _ E9, 00000085

?_256:  mov     edx, dword [task_control]               ; 4832 _ 8B. 15, 00002248(d)
        mov     eax, dword [ebp-14H]                    ; 4838 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 483B _ 69. C0, 00000094
        add     eax, edx                                ; 4841 _ 01. D0
        add     eax, 72                                 ; 4843 _ 83. C0, 48
        mov     dword [eax], 0                          ; 4846 _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 484C _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp-14H]                    ; 4852 _ 8B. 45, EC
        add     eax, 8                                  ; 4855 _ 83. C0, 08
        lea     edx, [eax*8]                            ; 4858 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 485F _ 8B. 45, EC
        imul    eax, eax, 148                           ; 4862 _ 69. C0, 00000094
        add     eax, ecx                                ; 4868 _ 01. C8
        add     eax, 68                                 ; 486A _ 83. C0, 44
        mov     dword [eax], edx                        ; 486D _ 89. 10
        mov     eax, dword [task_control]               ; 486F _ A1, 00002248(d)
        mov     edx, dword [ebp-14H]                    ; 4874 _ 8B. 55, EC
        imul    edx, edx, 148                           ; 4877 _ 69. D2, 00000094
        add     edx, 96                                 ; 487D _ 83. C2, 60
        add     eax, edx                                ; 4880 _ 01. D0
        add     eax, 16                                 ; 4882 _ 83. C0, 10
        mov     edx, dword [ebp-14H]                    ; 4885 _ 8B. 55, EC
        add     edx, 8                                  ; 4888 _ 83. C2, 08
        lea     ecx, [edx*8]                            ; 488B _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 4892 _ 8B. 55, F0
        add     edx, ecx                                ; 4895 _ 01. CA
        mov     dword [esp+0CH], 137                    ; 4897 _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 489F _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 48A3 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 48AB _ 89. 14 24
        call    segment_descriptor                      ; 48AE _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 48B3 _ 83. 45, EC, 01
?_257:  cmp     dword [ebp-14H], 4                      ; 48B7 _ 83. 7D, EC, 04
        jle     ?_256                                   ; 48BB _ 0F 8E, FFFFFF71
        mov     dword [ebp-14H], 0                      ; 48C1 _ C7. 45, EC, 00000000
        jmp     ?_259                                   ; 48C8 _ EB, 0F

?_258:  mov     eax, dword [ebp-14H]                    ; 48CA _ 8B. 45, EC
        mov     dword [esp], eax                        ; 48CD _ 89. 04 24
        call    init_task_level                         ; 48D0 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 48D5 _ 83. 45, EC, 01
?_259:  cmp     dword [ebp-14H], 2                      ; 48D9 _ 83. 7D, EC, 02
        jle     ?_258                                   ; 48DD _ 7E, EB
        call    task_alloc                              ; 48DF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 48E4 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 48E7 _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 48EA _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 48F1 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 48F4 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 48FB _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 48FE _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 4905 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 4908 _ 89. 04 24
        call    task_add                                ; 490B _ E8, FFFFFFFC(rel)
        call    task_switch_sub                         ; 4910 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4915 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4918 _ 8B. 00
        mov     dword [esp], eax                        ; 491A _ 89. 04 24
        call    load_tr                                 ; 491D _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 4922 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 4927 _ A3, 00002244(d)
        mov     eax, dword [ebp-0CH]                    ; 492C _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 492F _ 8B. 40, 08
        mov     edx, eax                                ; 4932 _ 89. C2
        mov     eax, dword [task_timer]                 ; 4934 _ A1, 00002244(d)
        mov     dword [esp+4H], edx                     ; 4939 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 493D _ 89. 04 24
        call    timer_settime                           ; 4940 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4945 _ 8B. 45, F4
        leave                                           ; 4948 _ C9
        ret                                             ; 4949 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 494A _ 55
        mov     ebp, esp                                ; 494B _ 89. E5
        sub     esp, 16                                 ; 494D _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 4950 _ C7. 45, F8, 00000000
        jmp     ?_262                                   ; 4957 _ E9, 000000F6

?_260:  mov     edx, dword [task_control]               ; 495C _ 8B. 15, 00002248(d)
        mov     eax, dword [ebp-8H]                     ; 4962 _ 8B. 45, F8
        imul    eax, eax, 148                           ; 4965 _ 69. C0, 00000094
        add     eax, edx                                ; 496B _ 01. D0
        add     eax, 72                                 ; 496D _ 83. C0, 48
        mov     eax, dword [eax]                        ; 4970 _ 8B. 00
        test    eax, eax                                ; 4972 _ 85. C0
        jne     ?_261                                   ; 4974 _ 0F 85, 000000D4
        mov     eax, dword [task_control]               ; 497A _ A1, 00002248(d)
        mov     edx, dword [ebp-8H]                     ; 497F _ 8B. 55, F8
        imul    edx, edx, 148                           ; 4982 _ 69. D2, 00000094
        add     edx, 64                                 ; 4988 _ 83. C2, 40
        add     eax, edx                                ; 498B _ 01. D0
        add     eax, 4                                  ; 498D _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 4990 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4993 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 4996 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 499D _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 49A0 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 49A7 _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 49AA _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 49B1 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 49B4 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 49BB _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 49BE _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 49C5 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 49C8 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-8H]                     ; 49CF _ 8B. 45, F8
        add     eax, 1                                  ; 49D2 _ 83. C0, 01
        shl     eax, 9                                  ; 49D5 _ C1. E0, 09
        mov     edx, eax                                ; 49D8 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 49DA _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 49DD _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 49E0 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 49E3 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-4H]                     ; 49EA _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 49ED _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 49F4 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 49F7 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 49FE _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 4A01 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A08 _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 4A0B _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A15 _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 4A18 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A22 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 4A25 _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A2F _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 4A32 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4A3C _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 4A3F _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 4A49 _ 8B. 45, FC
        jmp     ?_263                                   ; 4A4C _ EB, 13

?_261:  add     dword [ebp-8H], 1                       ; 4A4E _ 83. 45, F8, 01
?_262:  cmp     dword [ebp-8H], 4                       ; 4A52 _ 83. 7D, F8, 04
        jle     ?_260                                   ; 4A56 _ 0F 8E, FFFFFF00
        mov     eax, 0                                  ; 4A5C _ B8, 00000000
?_263:  leave                                           ; 4A61 _ C9
        ret                                             ; 4A62 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 4A63 _ 55
        mov     ebp, esp                                ; 4A64 _ 89. E5
        sub     esp, 24                                 ; 4A66 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 4A69 _ 83. 7D, 0C, 00
        jns     ?_264                                   ; 4A6D _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 4A6F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4A72 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 4A75 _ 89. 45, 0C
?_264:  cmp     dword [ebp+10H], 0                      ; 4A78 _ 83. 7D, 10, 00
        jle     ?_265                                   ; 4A7C _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 4A7E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4A81 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 4A84 _ 89. 50, 08
?_265:  mov     eax, dword [ebp+8H]                     ; 4A87 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4A8A _ 8B. 40, 04
        cmp     eax, 2                                  ; 4A8D _ 83. F8, 02
        jnz     ?_266                                   ; 4A90 _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 4A92 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4A95 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 4A98 _ 3B. 45, 0C
        jz      ?_266                                   ; 4A9B _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 4A9D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4AA0 _ 89. 04 24
        call    task_remove                             ; 4AA3 _ E8, FFFFFFFC(rel)
?_266:  mov     eax, dword [ebp+8H]                     ; 4AA8 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4AAB _ 8B. 40, 04
        cmp     eax, 2                                  ; 4AAE _ 83. F8, 02
        jz      ?_267                                   ; 4AB1 _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 4AB3 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4AB6 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 4AB9 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 4ABC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4ABF _ 89. 04 24
        call    task_add                                ; 4AC2 _ E8, FFFFFFFC(rel)
?_267:  mov     eax, dword [task_control]               ; 4AC7 _ A1, 00002248(d)
        mov     dword [eax+4H], 1                       ; 4ACC _ C7. 40, 04, 00000001
        leave                                           ; 4AD3 _ C9
        ret                                             ; 4AD4 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 4AD5 _ 55
        mov     ebp, esp                                ; 4AD6 _ 89. E5
        sub     esp, 40                                 ; 4AD8 _ 83. EC, 28
        mov     ecx, dword [task_control]               ; 4ADB _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4AE1 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4AE6 _ 8B. 10
        mov     eax, edx                                ; 4AE8 _ 89. D0
        shl     eax, 2                                  ; 4AEA _ C1. E0, 02
        add     eax, edx                                ; 4AED _ 01. D0
        shl     eax, 2                                  ; 4AEF _ C1. E0, 02
        add     eax, ecx                                ; 4AF2 _ 01. C8
        add     eax, 8                                  ; 4AF4 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4AF7 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 4AFA _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4AFD _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4B00 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4B03 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 4B07 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 4B0A _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 4B0D _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 4B10 _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 4B13 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 4B16 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4B19 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4B1C _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4B1F _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 4B22 _ 8B. 00
        cmp     edx, eax                                ; 4B24 _ 39. C2
        jnz     ?_268                                   ; 4B26 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 4B28 _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 4B2B _ C7. 40, 04, 00000000
?_268:  mov     eax, dword [task_control]               ; 4B32 _ A1, 00002248(d)
        mov     eax, dword [eax+4H]                     ; 4B37 _ 8B. 40, 04
        test    eax, eax                                ; 4B3A _ 85. C0
        jz      ?_269                                   ; 4B3C _ 74, 24
        call    task_switch_sub                         ; 4B3E _ E8, FFFFFFFC(rel)
        mov     ecx, dword [task_control]               ; 4B43 _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4B49 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4B4E _ 8B. 10
        mov     eax, edx                                ; 4B50 _ 89. D0
        shl     eax, 2                                  ; 4B52 _ C1. E0, 02
        add     eax, edx                                ; 4B55 _ 01. D0
        shl     eax, 2                                  ; 4B57 _ C1. E0, 02
        add     eax, ecx                                ; 4B5A _ 01. C8
        add     eax, 8                                  ; 4B5C _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4B5F _ 89. 45, EC
?_269:  mov     eax, dword [ebp-14H]                    ; 4B62 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4B65 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4B68 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4B6B _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 4B6F _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4B72 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 4B75 _ 8B. 40, 08
        mov     edx, eax                                ; 4B78 _ 89. C2
        mov     eax, dword [task_timer]                 ; 4B7A _ A1, 00002244(d)
        mov     dword [esp+4H], edx                     ; 4B7F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4B83 _ 89. 04 24
        call    timer_settime                           ; 4B86 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4B8B _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 4B8E _ 3B. 45, F0
        jz      ?_270                                   ; 4B91 _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 4B93 _ 83. 7D, F4, 00
        jz      ?_270                                   ; 4B97 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4B99 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4B9C _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4B9E _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4BA2 _ C7. 04 24, 00000000
        call    farjmp                                  ; 4BA9 _ E8, FFFFFFFC(rel)
?_270:  leave                                           ; 4BAE _ C9
        ret                                             ; 4BAF _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 4BB0 _ 55
        mov     ebp, esp                                ; 4BB1 _ 89. E5
        sub     esp, 40                                 ; 4BB3 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 4BB6 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 4BBD _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 4BC4 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4BC7 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4BCA _ 83. F8, 02
        jnz     ?_271                                   ; 4BCD _ 75, 51
        call    task_now                                ; 4BCF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4BD4 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 4BD7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4BDA _ 89. 04 24
        call    task_remove                             ; 4BDD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 4BE2 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 4BE9 _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 4BEC _ 3B. 45, F4
        jnz     ?_271                                   ; 4BEF _ 75, 2F
        call    task_switch_sub                         ; 4BF1 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 4BF6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4BFB _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 4BFE _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 4C05 _ 83. 7D, F4, 00
        jz      ?_271                                   ; 4C09 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4C0B _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4C0E _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4C10 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4C14 _ C7. 04 24, 00000000
        call    farjmp                                  ; 4C1B _ E8, FFFFFFFC(rel)
?_271:  mov     eax, dword [ebp-10H]                    ; 4C20 _ 8B. 45, F0
        leave                                           ; 4C23 _ C9
        ret                                             ; 4C24 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 4C25 _ 55
        mov     ebp, esp                                ; 4C26 _ 89. E5
        sub     esp, 16                                 ; 4C28 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4C2B _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4C31 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4C36 _ 8B. 10
        mov     eax, edx                                ; 4C38 _ 89. D0
        shl     eax, 2                                  ; 4C3A _ C1. E0, 02
        add     eax, edx                                ; 4C3D _ 01. D0
        shl     eax, 2                                  ; 4C3F _ C1. E0, 02
        add     eax, ecx                                ; 4C42 _ 01. C8
        add     eax, 8                                  ; 4C44 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4C47 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4C4A _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4C4D _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4C50 _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 4C53 _ 8B. 44 90, 08
        leave                                           ; 4C57 _ C9
        ret                                             ; 4C58 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 4C59 _ 55
        mov     ebp, esp                                ; 4C5A _ 89. E5
        sub     esp, 16                                 ; 4C5C _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4C5F _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp+8H]                     ; 4C65 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4C68 _ 8B. 50, 0C
        mov     eax, edx                                ; 4C6B _ 89. D0
        shl     eax, 2                                  ; 4C6D _ C1. E0, 02
        add     eax, edx                                ; 4C70 _ 01. D0
        shl     eax, 2                                  ; 4C72 _ C1. E0, 02
        add     eax, ecx                                ; 4C75 _ 01. C8
        add     eax, 8                                  ; 4C77 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4C7A _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4C7D _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 4C80 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 4C82 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 4C85 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 4C88 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4C8C _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4C8F _ 8B. 00
        lea     edx, [eax+1H]                           ; 4C91 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4C94 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4C97 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4C99 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4C9C _ C7. 40, 04, 00000002
        leave                                           ; 4CA3 _ C9
        ret                                             ; 4CA4 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 4CA5 _ 55
        mov     ebp, esp                                ; 4CA6 _ 89. E5
        sub     esp, 16                                 ; 4CA8 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4CAB _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp+8H]                     ; 4CB1 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4CB4 _ 8B. 50, 0C
        mov     eax, edx                                ; 4CB7 _ 89. D0
        shl     eax, 2                                  ; 4CB9 _ C1. E0, 02
        add     eax, edx                                ; 4CBC _ 01. D0
        shl     eax, 2                                  ; 4CBE _ C1. E0, 02
        add     eax, ecx                                ; 4CC1 _ 01. C8
        add     eax, 8                                  ; 4CC3 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4CC6 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 4CC9 _ C7. 45, F8, 00000000
        jmp     ?_274                                   ; 4CD0 _ EB, 23

?_272:  mov     eax, dword [ebp-4H]                     ; 4CD2 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4CD5 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 4CD8 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 4CDC _ 3B. 45, 08
        jnz     ?_273                                   ; 4CDF _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 4CE1 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4CE4 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 4CE7 _ C7. 44 90, 08, 00000000
        jmp     ?_275                                   ; 4CEF _ EB, 0E

?_273:  add     dword [ebp-8H], 1                       ; 4CF1 _ 83. 45, F8, 01
?_274:  mov     eax, dword [ebp-4H]                     ; 4CF5 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4CF8 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4CFA _ 3B. 45, F8
        jg      ?_272                                   ; 4CFD _ 7F, D3
?_275:  mov     eax, dword [ebp-4H]                     ; 4CFF _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4D02 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4D04 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4D07 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4D0A _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 4D0C _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4D0F _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 4D12 _ 3B. 45, F8
        jle     ?_276                                   ; 4D15 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 4D17 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4D1A _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 4D1D _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4D20 _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 4D23 _ 89. 50, 04
?_276:  mov     eax, dword [ebp-4H]                     ; 4D26 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4D29 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4D2C _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4D2F _ 8B. 00
        cmp     edx, eax                                ; 4D31 _ 39. C2
        jl      ?_277                                   ; 4D33 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 4D35 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 4D38 _ C7. 40, 04, 00000000
?_277:  mov     eax, dword [ebp+8H]                     ; 4D3F _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 4D42 _ C7. 40, 04, 00000001
        jmp     ?_279                                   ; 4D49 _ EB, 1B

?_278:  mov     eax, dword [ebp-8H]                     ; 4D4B _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 4D4E _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4D51 _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 4D54 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4D58 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4D5B _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 4D5E _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 4D62 _ 83. 45, F8, 01
?_279:  mov     eax, dword [ebp-4H]                     ; 4D66 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4D69 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4D6B _ 3B. 45, F8
        jg      ?_278                                   ; 4D6E _ 7F, DB
        leave                                           ; 4D70 _ C9
        ret                                             ; 4D71 _ C3
; task_remove End of function

task_switch_sub:; Function begin
        push    ebp                                     ; 4D72 _ 55
        mov     ebp, esp                                ; 4D73 _ 89. E5
        sub     esp, 16                                 ; 4D75 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4D78 _ C7. 45, FC, 00000000
        jmp     ?_282                                   ; 4D7F _ EB, 24

?_280:  mov     ecx, dword [task_control]               ; 4D81 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 4D87 _ 8B. 55, FC
        mov     eax, edx                                ; 4D8A _ 89. D0
        shl     eax, 2                                  ; 4D8C _ C1. E0, 02
        add     eax, edx                                ; 4D8F _ 01. D0
        shl     eax, 2                                  ; 4D91 _ C1. E0, 02
        add     eax, ecx                                ; 4D94 _ 01. C8
        add     eax, 8                                  ; 4D96 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 4D99 _ 8B. 00
        test    eax, eax                                ; 4D9B _ 85. C0
        jle     ?_281                                   ; 4D9D _ 7E, 02
        jmp     ?_283                                   ; 4D9F _ EB, 0A

?_281:  add     dword [ebp-4H], 1                       ; 4DA1 _ 83. 45, FC, 01
?_282:  cmp     dword [ebp-4H], 2                       ; 4DA5 _ 83. 7D, FC, 02
        jle     ?_280                                   ; 4DA9 _ 7E, D6
?_283:  mov     eax, dword [task_control]               ; 4DAB _ A1, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 4DB0 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 4DB3 _ 89. 10
        mov     eax, dword [task_control]               ; 4DB5 _ A1, 00002248(d)
        mov     dword [eax+4H], 0                       ; 4DBA _ C7. 40, 04, 00000000
        leave                                           ; 4DC1 _ C9
        ret                                             ; 4DC2 _ C3
; task_switch_sub End of function

task_send_message:; Function begin
        push    ebp                                     ; 4DC3 _ 55
        mov     ebp, esp                                ; 4DC4 _ 89. E5
        sub     esp, 24                                 ; 4DC6 _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 4DC9 _ 8B. 45, 10
        movzx   eax, al                                 ; 4DCC _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 4DCF _ 8B. 55, 0C
        add     edx, 16                                 ; 4DD2 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 4DD5 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 4DD9 _ 89. 14 24
        call    fifo8_put                               ; 4DDC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 4DE1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4DE4 _ 89. 04 24
        call    task_sleep                              ; 4DE7 _ E8, FFFFFFFC(rel)
        leave                                           ; 4DEC _ C9
        ret                                             ; 4DED _ C3
; task_send_message End of function

file_load_content:; Function begin
        push    ebp                                     ; 4DEE _ 55
        mov     ebp, esp                                ; 4DEF _ 89. E5
        sub     esp, 56                                 ; 4DF1 _ 83. EC, 38
        mov     dword [ebp-24H], 78848                  ; 4DF4 _ C7. 45, DC, 00013400
        mov     eax, dword [memman]                     ; 4DFB _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 4E00 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 4E08 _ 89. 04 24
        call    memman_alloc                            ; 4E0B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 4E10 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 4E13 _ 8B. 45, EC
        add     eax, 12                                 ; 4E16 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 4E19 _ C6. 00, 00
        jmp     ?_294                                   ; 4E1C _ E9, 00000129

?_284:  mov     dword [ebp-20H], 0                      ; 4E21 _ C7. 45, E0, 00000000
        jmp     ?_287                                   ; 4E28 _ EB, 2C

?_285:  mov     edx, dword [ebp-24H]                    ; 4E2A _ 8B. 55, DC
        mov     eax, dword [ebp-20H]                    ; 4E2D _ 8B. 45, E0
        add     eax, edx                                ; 4E30 _ 01. D0
        movzx   eax, byte [eax]                         ; 4E32 _ 0F B6. 00
        test    al, al                                  ; 4E35 _ 84. C0
        jz      ?_286                                   ; 4E37 _ 74, 1B
        mov     edx, dword [ebp-20H]                    ; 4E39 _ 8B. 55, E0
        mov     eax, dword [ebp-14H]                    ; 4E3C _ 8B. 45, EC
        add     edx, eax                                ; 4E3F _ 01. C2
        mov     ecx, dword [ebp-24H]                    ; 4E41 _ 8B. 4D, DC
        mov     eax, dword [ebp-20H]                    ; 4E44 _ 8B. 45, E0
        add     eax, ecx                                ; 4E47 _ 01. C8
        movzx   eax, byte [eax]                         ; 4E49 _ 0F B6. 00
        mov     byte [edx], al                          ; 4E4C _ 88. 02
        add     dword [ebp-20H], 1                      ; 4E4E _ 83. 45, E0, 01
        jmp     ?_287                                   ; 4E52 _ EB, 02

?_286:  jmp     ?_288                                   ; 4E54 _ EB, 06

?_287:  cmp     dword [ebp-20H], 7                      ; 4E56 _ 83. 7D, E0, 07
        jle     ?_285                                   ; 4E5A _ 7E, CE
?_288:  mov     dword [ebp-1CH], 0                      ; 4E5C _ C7. 45, E4, 00000000
        mov     edx, dword [ebp-20H]                    ; 4E63 _ 8B. 55, E0
        mov     eax, dword [ebp-14H]                    ; 4E66 _ 8B. 45, EC
        add     eax, edx                                ; 4E69 _ 01. D0
        mov     byte [eax], 46                          ; 4E6B _ C6. 00, 2E
        add     dword [ebp-20H], 1                      ; 4E6E _ 83. 45, E0, 01
        mov     dword [ebp-1CH], 0                      ; 4E72 _ C7. 45, E4, 00000000
        jmp     ?_290                                   ; 4E79 _ EB, 1E

?_289:  mov     edx, dword [ebp-20H]                    ; 4E7B _ 8B. 55, E0
        mov     eax, dword [ebp-14H]                    ; 4E7E _ 8B. 45, EC
        add     edx, eax                                ; 4E81 _ 01. C2
        mov     ecx, dword [ebp-24H]                    ; 4E83 _ 8B. 4D, DC
        mov     eax, dword [ebp-1CH]                    ; 4E86 _ 8B. 45, E4
        add     eax, ecx                                ; 4E89 _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 4E8B _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 4E8F _ 88. 02
        add     dword [ebp-20H], 1                      ; 4E91 _ 83. 45, E0, 01
        add     dword [ebp-1CH], 1                      ; 4E95 _ 83. 45, E4, 01
?_290:  cmp     dword [ebp-1CH], 2                      ; 4E99 _ 83. 7D, E4, 02
        jle     ?_289                                   ; 4E9D _ 7E, DC
        mov     edx, dword [ebp-20H]                    ; 4E9F _ 8B. 55, E0
        mov     eax, dword [ebp-14H]                    ; 4EA2 _ 8B. 45, EC
        add     eax, edx                                ; 4EA5 _ 01. D0
        mov     byte [eax], 0                           ; 4EA7 _ C6. 00, 00
        mov     eax, dword [ebp-14H]                    ; 4EAA _ 8B. 45, EC
        mov     dword [esp+4H], eax                     ; 4EAD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4EB1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4EB4 _ 89. 04 24
        call    strcmp                                  ; 4EB7 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 4EBC _ 83. F8, 01
        jne     ?_293                                   ; 4EBF _ 0F 85, 00000081
        mov     eax, dword [ebp-24H]                    ; 4EC5 _ 8B. 45, DC
        mov     edx, dword [eax+1CH]                    ; 4EC8 _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 4ECB _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 4ED0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4ED4 _ 89. 04 24
        call    memman_alloc_4k                         ; 4ED7 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 4EDC _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 4EDE _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 4EE1 _ 89. 10
        mov     eax, dword [ebp-24H]                    ; 4EE3 _ 8B. 45, DC
        mov     eax, dword [eax+1CH]                    ; 4EE6 _ 8B. 40, 1C
        mov     edx, eax                                ; 4EE9 _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 4EEB _ 8B. 45, 0C
        mov     dword [eax+4H], edx                     ; 4EEE _ 89. 50, 04
        mov     dword [ebp-10H], 88064                  ; 4EF1 _ C7. 45, F0, 00015800
        mov     eax, dword [ebp-24H]                    ; 4EF8 _ 8B. 45, DC
        movzx   eax, word [eax+1AH]                     ; 4EFB _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 4EFF _ 0F B7. C0
        shl     eax, 9                                  ; 4F02 _ C1. E0, 09
        add     dword [ebp-10H], eax                    ; 4F05 _ 01. 45, F0
        mov     eax, dword [ebp-24H]                    ; 4F08 _ 8B. 45, DC
        mov     eax, dword [eax+1CH]                    ; 4F0B _ 8B. 40, 1C
        mov     dword [ebp-0CH], eax                    ; 4F0E _ 89. 45, F4
        mov     dword [ebp-18H], 0                      ; 4F11 _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 4F18 _ C7. 45, E8, 00000000
        jmp     ?_292                                   ; 4F1F _ EB, 1B

?_291:  mov     eax, dword [ebp+0CH]                    ; 4F21 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 4F24 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 4F26 _ 8B. 45, E8
        add     edx, eax                                ; 4F29 _ 01. C2
        mov     ecx, dword [ebp-18H]                    ; 4F2B _ 8B. 4D, E8
        mov     eax, dword [ebp-10H]                    ; 4F2E _ 8B. 45, F0
        add     eax, ecx                                ; 4F31 _ 01. C8
        movzx   eax, byte [eax]                         ; 4F33 _ 0F B6. 00
        mov     byte [edx], al                          ; 4F36 _ 88. 02
        add     dword [ebp-18H], 1                      ; 4F38 _ 83. 45, E8, 01
?_292:  mov     eax, dword [ebp-18H]                    ; 4F3C _ 8B. 45, E8
        cmp     eax, dword [ebp-0CH]                    ; 4F3F _ 3B. 45, F4
        jl      ?_291                                   ; 4F42 _ 7C, DD
        jmp     ?_295                                   ; 4F44 _ EB, 12

?_293:  add     dword [ebp-24H], 32                     ; 4F46 _ 83. 45, DC, 20
?_294:  mov     eax, dword [ebp-24H]                    ; 4F4A _ 8B. 45, DC
        movzx   eax, byte [eax]                         ; 4F4D _ 0F B6. 00
        test    al, al                                  ; 4F50 _ 84. C0
        jne     ?_284                                   ; 4F52 _ 0F 85, FFFFFEC9
?_295:  mov     edx, dword [ebp-14H]                    ; 4F58 _ 8B. 55, EC
        mov     eax, dword [memman]                     ; 4F5B _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 4F60 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 4F68 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4F6C _ 89. 04 24
        call    memman_free                             ; 4F6F _ E8, FFFFFFFC(rel)
        leave                                           ; 4F74 _ C9
        ret                                             ; 4F75 _ C3
; file_load_content End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_296:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_297:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0007 _ console.

?_298:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 000F _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0017 _ sk b.

?_299:                                                  ; byte
        db 42H, 00H                                     ; 001C _ B.

?_300:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 001E _ page is:
        db 20H, 00H                                     ; 0026 _  .

?_301:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0028 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0030 _ L: .

?_302:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0034 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003C _ H: .

?_303:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0040 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0048 _ w: .

?_304:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 004C _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0054 _ gh: .

?_305:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0059 _ type: .

?_306:                                                  ; byte
        db 3EH, 00H                                     ; 0060 _ >.

?_307:                                                  ; byte
        db 6DH, 65H, 6DH, 00H                           ; 0062 _ mem.

?_308:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0066 _ free .

?_309:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 006C _  KB.

?_310:                                                  ; byte
        db 63H, 6CH, 73H, 00H                           ; 0070 _ cls.

?_311:                                                  ; byte
        db 64H, 69H, 72H, 00H                           ; 0074 _ dir.

?_312:                                                  ; byte
        db 68H, 6CH, 74H, 00H                           ; 0078 _ hlt.

?_313:                                                  ; byte
        db 68H, 6CH, 74H, 2EH, 65H, 78H, 65H, 00H       ; 007C _ hlt.exe.

?_314:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0084 _ console.


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

table_rgb.1794:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0120 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0128 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0130 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0138 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0140 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0148 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0150 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........

cursor.1862:                                            ; byte
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

closebtn.1949:                                          ; byte
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

?_315:  db 00H                                          ; 0342 _ .

?_316:  db 00H, 00H                                     ; 0343 _ ..


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

timerinfo1.1776:                                        ; byte
        resb    28                                      ; 0018

timerbuf1.1779:                                         ; qword
        resq    1                                       ; 0034

timerinfo2.1777:                                        ; byte
        resb    28                                      ; 003C

timerbuf2.1780:                                         ; qword
        resq    1                                       ; 0058

timerinfo3.1778:                                        ; byte
        resb    28                                      ; 0060

timerbuf3.1781:                                         ; qword
        resq    4                                       ; 007C
        resb    4                                       ; 009C

screen_info:                                            ; qword
        resb    4                                       ; 00A0

?_317:  resw    1                                       ; 00A4

?_318:  resw    1                                       ; 00A6

g_Console:                                              ; byte
        resd    1                                       ; 00A8

?_319:  resd    1                                       ; 00AC

?_320:  resd    1                                       ; 00B0

?_321:  resd    1                                       ; 00B4

?_322:  resb    1                                       ; 00B8

?_323:  resb    7                                       ; 00B9

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

mouse_send_info:                                        ; oword
        resb    40                                      ; 01D8

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

?_324:  resb    9                                       ; 02E1

?_325:  resb    22                                      ; 02EA

timer_control:                                          ; byte
        resd    2001                                    ; 0300

task_timer:                                             ; dword
        resd    1                                       ; 2244

task_control:                                           ; dword
        resd    1                                       ; 2248


