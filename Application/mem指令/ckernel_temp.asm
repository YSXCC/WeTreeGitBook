; Disassembly of file: ckernel.o
; Sun Mar 15 10:23:06 2020
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
        mov     dword [esp+8H], timerbuf1.1766          ; 014B _ C7. 44 24, 08, 00000034(d)
        mov     dword [esp+4H], 8                       ; 0153 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1763            ; 015B _ C7. 04 24, 00000018(d)
        call    fifo8_init                              ; 0162 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0167 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 016C _ 89. 45, C8
        mov     dword [esp+8H], 1                       ; 016F _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1763         ; 0177 _ C7. 44 24, 04, 00000018(d)
        mov     eax, dword [ebp-38H]                    ; 017F _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0182 _ 89. 04 24
        call    timer_init                              ; 0185 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 018A _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 0192 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0195 _ 89. 04 24
        call    timer_settime                           ; 0198 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 019D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf2.1767          ; 01A5 _ C7. 44 24, 08, 00000058(d)
        mov     dword [esp+4H], 8                       ; 01AD _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1764            ; 01B5 _ C7. 04 24, 0000003C(d)
        call    fifo8_init                              ; 01BC _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01C1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 01C6 _ 89. 45, CC
        mov     dword [esp+8H], 1                       ; 01C9 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1764         ; 01D1 _ C7. 44 24, 04, 0000003C(d)
        mov     eax, dword [ebp-34H]                    ; 01D9 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 01DC _ 89. 04 24
        call    timer_init                              ; 01DF _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01E4 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-34H]                    ; 01EC _ 8B. 45, CC
        mov     dword [esp], eax                        ; 01EF _ 89. 04 24
        call    timer_settime                           ; 01F2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 01F7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf3.1768          ; 01FF _ C7. 44 24, 08, 0000007C(d)
        mov     dword [esp+4H], 8                       ; 0207 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1765            ; 020F _ C7. 04 24, 00000060(d)
        call    fifo8_init                              ; 0216 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 021B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0220 _ 89. 45, D0
        mov     dword [esp+8H], 1                       ; 0223 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1765         ; 022B _ C7. 44 24, 04, 00000060(d)
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
        mov     dword [esp+4H], ?_242                   ; 02DC _ C7. 44 24, 04, 00000000(d)
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
        mov     dword [esp], timerinfo1.1763            ; 03E8 _ C7. 04 24, 00000018(d)
        call    fifo8_status                            ; 03EF _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03F4 _ 01. C3
        mov     dword [esp], timerinfo2.1764            ; 03F6 _ C7. 04 24, 0000003C(d)
        call    fifo8_status                            ; 03FD _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0402 _ 01. C3
        mov     dword [esp], timerinfo3.1765            ; 0404 _ C7. 04 24, 00000060(d)
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
        mov     dword [esp+8H], ?_242                   ; 047D _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 0485 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0489 _ 89. 04 24
        call    make_window_title                       ; 048C _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 0491 _ A1, 0000000C(d)
        mov     dword [esp+0CH], 1                      ; 0496 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_243                   ; 049E _ C7. 44 24, 08, 00000007(d)
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
        mov     dword [esp+8H], ?_242                   ; 0506 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 050E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0512 _ 89. 04 24
        call    make_window_title                       ; 0515 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 051A _ A1, 0000000C(d)
        mov     dword [esp+0CH], 0                      ; 051F _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_243                   ; 0527 _ C7. 44 24, 08, 00000007(d)
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

?_008:  mov     dword [esp], timerinfo1.1763            ; 07FD _ C7. 04 24, 00000018(d)
        call    fifo8_status                            ; 0804 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0809 _ 85. C0
        jz      ?_009                                   ; 080B _ 74, 13
        call    io_sti                                  ; 080D _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1763            ; 0812 _ C7. 04 24, 00000018(d)
        call    fifo8_get                               ; 0819 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 081E _ EB, 21

?_009:  mov     dword [esp], timerinfo2.1764            ; 0820 _ C7. 04 24, 0000003C(d)
        call    fifo8_status                            ; 0827 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 082C _ 85. C0
        jz      ?_010                                   ; 082E _ 74, 11
        call    io_sti                                  ; 0830 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1764            ; 0835 _ C7. 04 24, 0000003C(d)
        call    fifo8_get                               ; 083C _ E8, FFFFFFFC(rel)
?_010:  mov     dword [esp], timerinfo3.1765            ; 0841 _ C7. 04 24, 00000060(d)
        call    fifo8_status                            ; 0848 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 084D _ 85. C0
        je      ?_014                                   ; 084F _ 0F 84, 000000DB
        mov     dword [esp], timerinfo3.1765            ; 0855 _ C7. 04 24, 00000060(d)
        call    fifo8_get                               ; 085C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0861 _ 89. 45, F4
        call    io_sti                                  ; 0864 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 0869 _ 83. 7D, F4, 00
        jz      ?_011                                   ; 086D _ 74, 24
        mov     dword [esp+8H], 0                       ; 086F _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1765         ; 0877 _ C7. 44 24, 04, 00000060(d)
        mov     eax, dword [ebp-30H]                    ; 087F _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0882 _ 89. 04 24
        call    timer_init                              ; 0885 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-54H], 0                      ; 088A _ C7. 45, AC, 00000000
        jmp     ?_012                                   ; 0891 _ EB, 22

?_011:  mov     dword [esp+8H], 1                       ; 0893 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1765         ; 089B _ C7. 44 24, 04, 00000060(d)
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
        mov     dword [esp+10H], ?_244                  ; 095F _ C7. 44 24, 10, 0000000F(d)
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
        mov     dword [esp+10H], ?_245                  ; 0A41 _ C7. 44 24, 10, 0000001C(d)
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
        mov     dword [esp+8H], table_rgb.1762          ; 0AAE _ C7. 44 24, 08, 00000120(d)
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
        movzx   eax, word [?_258]                       ; 0F51 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 0F58 _ 98
        mov     dword [ebp-8H], eax                     ; 0F59 _ 89. 45, F8
        movzx   eax, word [?_259]                       ; 0F5C _ 0F B7. 05, 000000A6(d)
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
        add     eax, cursor.1830                        ; 11F5 _ 05, 00000160(d)
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
        add     eax, cursor.1830                        ; 1227 _ 05, 00000160(d)
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
?_048:  movzx   eax, word [?_258]                       ; 138A _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 1391 _ 98
        lea     edx, [eax-10H]                          ; 1392 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 1395 _ A1, 000001C8(d)
        cmp     edx, eax                                ; 139A _ 39. C2
        jge     ?_049                                   ; 139C _ 7D, 10
        movzx   eax, word [?_258]                       ; 139E _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 13A5 _ 98
        sub     eax, 16                                 ; 13A6 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 13A9 _ A3, 000001C8(d)
?_049:  movzx   eax, word [?_258]                       ; 13AE _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 13B5 _ 98
        lea     edx, [eax-10H]                          ; 13B6 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 13B9 _ A1, 000001CC(d)
        cmp     edx, eax                                ; 13BE _ 39. C2
        jge     ?_050                                   ; 13C0 _ 7D, 10
        movzx   eax, word [?_258]                       ; 13C2 _ 0F B7. 05, 000000A4(d)
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
        movzx   eax, word [?_258]                       ; 14A6 _ 0F B7. 05, 000000A4(d)
        cwde                                            ; 14AD _ 98
        mov     dword [ebp-28H], eax                    ; 14AE _ 89. 45, D8
        movzx   eax, word [?_259]                       ; 14B1 _ 0F B7. 05, 000000A6(d)
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
        mov     dword [esp+10H], ?_246                  ; 14DF _ C7. 44 24, 10, 0000001E(d)
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
        mov     dword [esp+10H], ?_247                  ; 1550 _ C7. 44 24, 10, 00000028(d)
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
        mov     dword [esp+10H], ?_248                  ; 15C3 _ C7. 44 24, 10, 00000034(d)
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
        mov     dword [esp+10H], ?_249                  ; 1637 _ C7. 44 24, 10, 00000040(d)
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
        mov     dword [esp+10H], ?_250                  ; 16AB _ C7. 44 24, 10, 0000004C(d)
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
        mov     dword [esp+10H], ?_251                  ; 171F _ C7. 44 24, 10, 00000059(d)
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
        add     eax, closebtn.1917                      ; 1E94 _ 05, 00000260(d)
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
        sub     esp, 248                                ; 209C _ 81. EC, 000000F8
        mov     eax, dword [ebp+8H]                     ; 20A2 _ 8B. 45, 08
        mov     dword [ebp-0DCH], eax                   ; 20A5 _ 89. 85, FFFFFF24
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 20AB _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 20B1 _ 89. 45, F4
        xor     eax, eax                                ; 20B4 _ 31. C0
        call    task_now                                ; 20B6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0BCH], eax                   ; 20BB _ 89. 85, FFFFFF44
        mov     dword [ebp-0C8H], 16                    ; 20C1 _ C7. 85, FFFFFF38, 00000010
        mov     dword [ebp-0C4H], 28                    ; 20CB _ C7. 85, FFFFFF3C, 0000001C
        mov     dword [ebp-0C0H], 0                     ; 20D5 _ C7. 85, FFFFFF40, 00000000
        mov     eax, dword [ebp-0BCH]                   ; 20DF _ 8B. 85, FFFFFF44
        lea     edx, [eax+10H]                          ; 20E5 _ 8D. 50, 10
        mov     eax, dword [ebp-0BCH]                   ; 20E8 _ 8B. 85, FFFFFF44
        mov     dword [esp+0CH], eax                    ; 20EE _ 89. 44 24, 0C
        lea     eax, [ebp-8CH]                          ; 20F2 _ 8D. 85, FFFFFF74
        mov     dword [esp+8H], eax                     ; 20F8 _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 20FC _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 2104 _ 89. 14 24
        call    fifo8_init                              ; 2107 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 210C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0B8H], eax                   ; 2111 _ 89. 85, FFFFFF48
        mov     eax, dword [ebp-0BCH]                   ; 2117 _ 8B. 85, FFFFFF44
        add     eax, 16                                 ; 211D _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 2120 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 2128 _ 89. 44 24, 04
        mov     eax, dword [ebp-0B8H]                   ; 212C _ 8B. 85, FFFFFF48
        mov     dword [esp], eax                        ; 2132 _ 89. 04 24
        call    timer_init                              ; 2135 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 213A _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0B8H]                   ; 2142 _ 8B. 85, FFFFFF48
        mov     dword [esp], eax                        ; 2148 _ 89. 04 24
        call    timer_settime                           ; 214B _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2150 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2155 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_252                  ; 215D _ C7. 44 24, 10, 00000060(d)
        mov     dword [esp+0CH], 28                     ; 2165 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 216D _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0DCH]                   ; 2175 _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 217B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 217F _ 89. 04 24
        call    paint_string                            ; 2182 _ E8, FFFFFFFC(rel)
?_078:  call    io_cli                                  ; 2187 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0BCH]                   ; 218C _ 8B. 85, FFFFFF44
        add     eax, 16                                 ; 2192 _ 83. C0, 10
        mov     dword [esp], eax                        ; 2195 _ 89. 04 24
        call    fifo8_status                            ; 2198 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 219D _ 85. C0
        jnz     ?_079                                   ; 219F _ 75, 0A
        call    io_sti                                  ; 21A1 _ E8, FFFFFFFC(rel)
        jmp     ?_089                                   ; 21A6 _ E9, 000004C3

?_079:  mov     eax, dword [ebp-0BCH]                   ; 21AB _ 8B. 85, FFFFFF44
        add     eax, 16                                 ; 21B1 _ 83. C0, 10
        mov     dword [esp], eax                        ; 21B4 _ 89. 04 24
        call    fifo8_get                               ; 21B7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0B4H], eax                   ; 21BC _ 89. 85, FFFFFF4C
        call    io_sti                                  ; 21C2 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0B4H], 1                     ; 21C7 _ 83. BD, FFFFFF4C, 01
        jg      ?_082                                   ; 21CE _ 0F 8F, 0000008D
        cmp     dword [ebp-0C0H], 0                     ; 21D4 _ 83. BD, FFFFFF40, 00
        js      ?_082                                   ; 21DB _ 0F 88, 00000080
        cmp     dword [ebp-0B4H], 0                     ; 21E1 _ 83. BD, FFFFFF4C, 00
        jz      ?_080                                   ; 21E8 _ 74, 2F
        mov     eax, dword [ebp-0BCH]                   ; 21EA _ 8B. 85, FFFFFF44
        add     eax, 16                                 ; 21F0 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 21F3 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 21FB _ 89. 44 24, 04
        mov     eax, dword [ebp-0B8H]                   ; 21FF _ 8B. 85, FFFFFF48
        mov     dword [esp], eax                        ; 2205 _ 89. 04 24
        call    timer_init                              ; 2208 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0C0H], 7                     ; 220D _ C7. 85, FFFFFF40, 00000007
        jmp     ?_081                                   ; 2217 _ EB, 2D

?_080:  mov     eax, dword [ebp-0BCH]                   ; 2219 _ 8B. 85, FFFFFF44
        add     eax, 16                                 ; 221F _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 2222 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 222A _ 89. 44 24, 04
        mov     eax, dword [ebp-0B8H]                   ; 222E _ 8B. 85, FFFFFF48
        mov     dword [esp], eax                        ; 2234 _ 89. 04 24
        call    timer_init                              ; 2237 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0C0H], 0                     ; 223C _ C7. 85, FFFFFF40, 00000000
?_081:  mov     dword [esp+4H], 50                      ; 2246 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0B8H]                   ; 224E _ 8B. 85, FFFFFF48
        mov     dword [esp], eax                        ; 2254 _ 89. 04 24
        call    timer_settime                           ; 2257 _ E8, FFFFFFFC(rel)
        jmp     ?_088                                   ; 225C _ E9, 000003CA

?_082:  cmp     dword [ebp-0B4H], 87                    ; 2261 _ 83. BD, FFFFFF4C, 57
        jnz     ?_083                                   ; 2268 _ 75, 48
        mov     dword [ebp-0C0H], 7                     ; 226A _ C7. 85, FFFFFF40, 00000007
        mov     eax, dword [ebp-0BCH]                   ; 2274 _ 8B. 85, FFFFFF44
        add     eax, 16                                 ; 227A _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 227D _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 2285 _ 89. 44 24, 04
        mov     eax, dword [ebp-0B8H]                   ; 2289 _ 8B. 85, FFFFFF48
        mov     dword [esp], eax                        ; 228F _ 89. 04 24
        call    timer_init                              ; 2292 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 2297 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0B8H]                   ; 229F _ 8B. 85, FFFFFF48
        mov     dword [esp], eax                        ; 22A5 _ 89. 04 24
        call    timer_settime                           ; 22A8 _ E8, FFFFFFFC(rel)
        jmp     ?_088                                   ; 22AD _ E9, 00000379

?_083:  cmp     dword [ebp-0B4H], 88                    ; 22B2 _ 83. BD, FFFFFF4C, 58
        jnz     ?_084                                   ; 22B9 _ 75, 5F
        mov     eax, dword [sheet_control]              ; 22BB _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 22C0 _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-0C4H]                   ; 22C8 _ 8B. 95, FFFFFF3C
        mov     dword [esp+0CH], edx                    ; 22CE _ 89. 54 24, 0C
        mov     edx, dword [ebp-0C8H]                   ; 22D2 _ 8B. 95, FFFFFF38
        mov     dword [esp+8H], edx                     ; 22D8 _ 89. 54 24, 08
        mov     edx, dword [ebp-0DCH]                   ; 22DC _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 22E2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 22E6 _ 89. 04 24
        call    set_cursor                              ; 22E9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0C0H], -1                    ; 22EE _ C7. 85, FFFFFF40, FFFFFFFF
        mov     eax, dword [task_main]                  ; 22F8 _ A1, 00000000(d)
        mov     dword [esp+8H], 0                       ; 22FD _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 2305 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 230D _ 89. 04 24
        call    task_run                                ; 2310 _ E8, FFFFFFFC(rel)
        jmp     ?_088                                   ; 2315 _ E9, 00000311

?_084:  cmp     dword [ebp-0B4H], 28                    ; 231A _ 83. BD, FFFFFF4C, 1C
        jne     ?_086                                   ; 2321 _ 0F 85, 000001A2
        mov     eax, dword [sheet_control]              ; 2327 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 232C _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-0C4H]                   ; 2334 _ 8B. 95, FFFFFF3C
        mov     dword [esp+0CH], edx                    ; 233A _ 89. 54 24, 0C
        mov     edx, dword [ebp-0C8H]                   ; 233E _ 8B. 95, FFFFFF38
        mov     dword [esp+8H], edx                     ; 2344 _ 89. 54 24, 08
        mov     edx, dword [ebp-0DCH]                   ; 2348 _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 234E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2352 _ 89. 04 24
        call    set_cursor                              ; 2355 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0C8H]                   ; 235A _ 8B. 85, FFFFFF38
        lea     edx, [eax+7H]                           ; 2360 _ 8D. 50, 07
        test    eax, eax                                ; 2363 _ 85. C0
        cmovs   eax, edx                                ; 2365 _ 0F 48. C2
        sar     eax, 3                                  ; 2368 _ C1. F8, 03
        sub     eax, 2                                  ; 236B _ 83. E8, 02
        mov     byte [ebp+eax-0AAH], 0                  ; 236E _ C6. 84 05, FFFFFF56, 00
        mov     eax, dword [ebp-0DCH]                   ; 2376 _ 8B. 85, FFFFFF24
        mov     dword [esp+4H], eax                     ; 237C _ 89. 44 24, 04
        mov     eax, dword [ebp-0C4H]                   ; 2380 _ 8B. 85, FFFFFF3C
        mov     dword [esp], eax                        ; 2386 _ 89. 04 24
        call    console_new_line                        ; 2389 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0C4H], eax                   ; 238E _ 89. 85, FFFFFF3C
        movzx   eax, byte [ebp-0AAH]                    ; 2394 _ 0F B6. 85, FFFFFF56
        cmp     al, 109                                 ; 239B _ 3C, 6D
        jne     ?_085                                   ; 239D _ 0F 85, 00000117
        movzx   eax, byte [ebp-0A9H]                    ; 23A3 _ 0F B6. 85, FFFFFF57
        cmp     al, 101                                 ; 23AA _ 3C, 65
        jne     ?_085                                   ; 23AC _ 0F 85, 00000108
        movzx   eax, byte [ebp-0A8H]                    ; 23B2 _ 0F B6. 85, FFFFFF58
        cmp     al, 109                                 ; 23B9 _ 3C, 6D
        jne     ?_085                                   ; 23BB _ 0F 85, 000000F9
        movzx   eax, byte [ebp-0A7H]                    ; 23C1 _ 0F B6. 85, FFFFFF59
        test    al, al                                  ; 23C8 _ 84. C0
        jne     ?_085                                   ; 23CA _ 0F 85, 000000EA
        mov     eax, dword [ebp+0CH]                    ; 23D0 _ 8B. 45, 0C
        lea     edx, [eax+3FFH]                         ; 23D3 _ 8D. 90, 000003FF
        test    eax, eax                                ; 23D9 _ 85. C0
        cmovs   eax, edx                                ; 23DB _ 0F 48. C2
        sar     eax, 10                                 ; 23DE _ C1. F8, 0A
        mov     dword [esp], eax                        ; 23E1 _ 89. 04 24
        call    intToHexStr                             ; 23E4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0B0H], eax                   ; 23E9 _ 89. 85, FFFFFF50
        mov     eax, dword [sheet_control]              ; 23EF _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 23F4 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_253                  ; 23FC _ C7. 44 24, 10, 00000062(d)
        mov     edx, dword [ebp-0C4H]                   ; 2404 _ 8B. 95, FFFFFF3C
        mov     dword [esp+0CH], edx                    ; 240A _ 89. 54 24, 0C
        mov     dword [esp+8H], 16                      ; 240E _ C7. 44 24, 08, 00000010
        mov     edx, dword [ebp-0DCH]                   ; 2416 _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 241C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2420 _ 89. 04 24
        call    paint_string                            ; 2423 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2428 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 242D _ C7. 44 24, 14, 00000007
        mov     edx, dword [ebp-0B0H]                   ; 2435 _ 8B. 95, FFFFFF50
        mov     dword [esp+10H], edx                    ; 243B _ 89. 54 24, 10
        mov     edx, dword [ebp-0C4H]                   ; 243F _ 8B. 95, FFFFFF3C
        mov     dword [esp+0CH], edx                    ; 2445 _ 89. 54 24, 0C
        mov     dword [esp+8H], 52                      ; 2449 _ C7. 44 24, 08, 00000034
        mov     edx, dword [ebp-0DCH]                   ; 2451 _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 2457 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 245B _ 89. 04 24
        call    paint_string                            ; 245E _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2463 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2468 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_254                  ; 2470 _ C7. 44 24, 10, 00000068(d)
        mov     edx, dword [ebp-0C4H]                   ; 2478 _ 8B. 95, FFFFFF3C
        mov     dword [esp+0CH], edx                    ; 247E _ 89. 54 24, 0C
        mov     dword [esp+8H], 126                     ; 2482 _ C7. 44 24, 08, 0000007E
        mov     edx, dword [ebp-0DCH]                   ; 248A _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 2490 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2494 _ 89. 04 24
        call    paint_string                            ; 2497 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0DCH]                   ; 249C _ 8B. 85, FFFFFF24
        mov     dword [esp+4H], eax                     ; 24A2 _ 89. 44 24, 04
        mov     eax, dword [ebp-0C4H]                   ; 24A6 _ 8B. 85, FFFFFF3C
        mov     dword [esp], eax                        ; 24AC _ 89. 04 24
        call    console_new_line                        ; 24AF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0C4H], eax                   ; 24B4 _ 89. 85, FFFFFF3C
?_085:  mov     dword [ebp-0C8H], 16                    ; 24BA _ C7. 85, FFFFFF38, 00000010
        jmp     ?_088                                   ; 24C4 _ E9, 00000162

?_086:  cmp     dword [ebp-0B4H], 14                    ; 24C9 _ 83. BD, FFFFFF4C, 0E
        jnz     ?_087                                   ; 24D0 _ 75, 7B
        cmp     dword [ebp-0C8H], 16                    ; 24D2 _ 83. BD, FFFFFF38, 10
        jle     ?_087                                   ; 24D9 _ 7E, 72
        mov     eax, dword [sheet_control]              ; 24DB _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 24E0 _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-0C4H]                   ; 24E8 _ 8B. 95, FFFFFF3C
        mov     dword [esp+0CH], edx                    ; 24EE _ 89. 54 24, 0C
        mov     edx, dword [ebp-0C8H]                   ; 24F2 _ 8B. 95, FFFFFF38
        mov     dword [esp+8H], edx                     ; 24F8 _ 89. 54 24, 08
        mov     edx, dword [ebp-0DCH]                   ; 24FC _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 2502 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2506 _ 89. 04 24
        call    set_cursor                              ; 2509 _ E8, FFFFFFFC(rel)
        sub     dword [ebp-0C8H], 8                     ; 250E _ 83. AD, FFFFFF38, 08
        mov     eax, dword [sheet_control]              ; 2515 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 251A _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-0C4H]                   ; 2522 _ 8B. 95, FFFFFF3C
        mov     dword [esp+0CH], edx                    ; 2528 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0C8H]                   ; 252C _ 8B. 95, FFFFFF38
        mov     dword [esp+8H], edx                     ; 2532 _ 89. 54 24, 08
        mov     edx, dword [ebp-0DCH]                   ; 2536 _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 253C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2540 _ 89. 04 24
        call    set_cursor                              ; 2543 _ E8, FFFFFFFC(rel)
        jmp     ?_088                                   ; 2548 _ E9, 000000DE

?_087:  mov     eax, dword [ebp-0B4H]                   ; 254D _ 8B. 85, FFFFFF4C
        mov     dword [esp], eax                        ; 2553 _ 89. 04 24
        call    transfer_scancode                       ; 2556 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-0CBH], al                     ; 255B _ 88. 85, FFFFFF35
        cmp     byte [ebp-0CBH], 0                      ; 2561 _ 80. BD, FFFFFF35, 00
        je      ?_088                                   ; 2568 _ 0F 84, 000000BD
        cmp     dword [ebp-0C8H], 239                   ; 256E _ 81. BD, FFFFFF38, 000000EF
        jg      ?_088                                   ; 2578 _ 0F 8F, 000000AD
        mov     eax, dword [sheet_control]              ; 257E _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 2583 _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-0C4H]                   ; 258B _ 8B. 95, FFFFFF3C
        mov     dword [esp+0CH], edx                    ; 2591 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0C8H]                   ; 2595 _ 8B. 95, FFFFFF38
        mov     dword [esp+8H], edx                     ; 259B _ 89. 54 24, 08
        mov     edx, dword [ebp-0DCH]                   ; 259F _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 25A5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25A9 _ 89. 04 24
        call    set_cursor                              ; 25AC _ E8, FFFFFFFC(rel)
        movzx   eax, byte [ebp-0CBH]                    ; 25B1 _ 0F B6. 85, FFFFFF35
        mov     byte [ebp-0CAH], al                     ; 25B8 _ 88. 85, FFFFFF36
        mov     byte [ebp-0C9H], 0                      ; 25BE _ C6. 85, FFFFFF37, 00
        mov     eax, dword [ebp-0C8H]                   ; 25C5 _ 8B. 85, FFFFFF38
        lea     edx, [eax+7H]                           ; 25CB _ 8D. 50, 07
        test    eax, eax                                ; 25CE _ 85. C0
        cmovs   eax, edx                                ; 25D0 _ 0F 48. C2
        sar     eax, 3                                  ; 25D3 _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 25D6 _ 8D. 50, FE
        movzx   eax, byte [ebp-0CBH]                    ; 25D9 _ 0F B6. 85, FFFFFF35
        mov     byte [ebp+edx-0AAH], al                 ; 25E0 _ 88. 84 15, FFFFFF56
        mov     eax, dword [sheet_control]              ; 25E7 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 25EC _ C7. 44 24, 14, 00000007
        lea     edx, [ebp-0CAH]                         ; 25F4 _ 8D. 95, FFFFFF36
        mov     dword [esp+10H], edx                    ; 25FA _ 89. 54 24, 10
        mov     edx, dword [ebp-0C4H]                   ; 25FE _ 8B. 95, FFFFFF3C
        mov     dword [esp+0CH], edx                    ; 2604 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0C8H]                   ; 2608 _ 8B. 95, FFFFFF38
        mov     dword [esp+8H], edx                     ; 260E _ 89. 54 24, 08
        mov     edx, dword [ebp-0DCH]                   ; 2612 _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 2618 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 261C _ 89. 04 24
        call    paint_string                            ; 261F _ E8, FFFFFFFC(rel)
        add     dword [ebp-0C8H], 8                     ; 2624 _ 83. 85, FFFFFF38, 08
?_088:  cmp     dword [ebp-0C0H], 0                     ; 262B _ 83. BD, FFFFFF40, 00
        js      ?_089                                   ; 2632 _ 78, 3A
        mov     eax, dword [sheet_control]              ; 2634 _ A1, 00000000(d)
        mov     edx, dword [ebp-0C0H]                   ; 2639 _ 8B. 95, FFFFFF40
        mov     dword [esp+10H], edx                    ; 263F _ 89. 54 24, 10
        mov     edx, dword [ebp-0C4H]                   ; 2643 _ 8B. 95, FFFFFF3C
        mov     dword [esp+0CH], edx                    ; 2649 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0C8H]                   ; 264D _ 8B. 95, FFFFFF38
        mov     dword [esp+8H], edx                     ; 2653 _ 89. 54 24, 08
        mov     edx, dword [ebp-0DCH]                   ; 2657 _ 8B. 95, FFFFFF24
        mov     dword [esp+4H], edx                     ; 265D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2661 _ 89. 04 24
        call    set_cursor                              ; 2664 _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 2669 _ E9, FFFFFB19

?_089:  jmp     ?_078                                   ; 266E _ E9, FFFFFB14
; console_task End of function

launch_console:; Function begin
        push    ebp                                     ; 2673 _ 55
        mov     ebp, esp                                ; 2674 _ 89. E5
        push    ebx                                     ; 2676 _ 53
        sub     esp, 52                                 ; 2677 _ 83. EC, 34
        mov     eax, dword [sheet_control]              ; 267A _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 267F _ 89. 04 24
        call    sheet_alloc                             ; 2682 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 2687 _ 89. 45, E8
        mov     eax, dword [memman]                     ; 268A _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 268F _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 2697 _ 89. 04 24
        call    memman_alloc_4k                         ; 269A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 269F _ 89. 45, EC
        mov     dword [esp+10H], 99                     ; 26A2 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 26AA _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 26B2 _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-14H]                    ; 26BA _ 8B. 45, EC
        mov     dword [esp+4H], eax                     ; 26BD _ 89. 44 24, 04
        mov     eax, dword [ebp-18H]                    ; 26C1 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 26C4 _ 89. 04 24
        call    sheet_setbuf                            ; 26C7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 26CC _ A1, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 26D1 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_255                   ; 26D9 _ C7. 44 24, 08, 0000006C(d)
        mov     edx, dword [ebp-18H]                    ; 26E1 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 26E4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 26E8 _ 89. 04 24
        call    make_windows                            ; 26EB _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 26F0 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 26F8 _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 2700 _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 2708 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 2710 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-18H]                    ; 2718 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 271B _ 89. 04 24
        call    make_textbox                            ; 271E _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 2723 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2728 _ 89. 45, F0
        call    get_code32_addr                         ; 272B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2730 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2733 _ 8B. 45, F0
        mov     dword [eax+8CH], 0                      ; 2736 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-10H]                    ; 2740 _ 8B. 45, F0
        mov     dword [eax+90H], 1073741824             ; 2743 _ C7. 80, 00000090, 40000000
        mov     eax, console_task                       ; 274D _ B8, 00000000(d)
        sub     eax, dword [ebp-0CH]                    ; 2752 _ 2B. 45, F4
        mov     edx, eax                                ; 2755 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 2757 _ 8B. 45, F0
        mov     dword [eax+4CH], edx                    ; 275A _ 89. 50, 4C
        mov     eax, dword [ebp-10H]                    ; 275D _ 8B. 45, F0
        mov     dword [eax+74H], 0                      ; 2760 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-10H]                    ; 2767 _ 8B. 45, F0
        mov     dword [eax+78H], 8                      ; 276A _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-10H]                    ; 2771 _ 8B. 45, F0
        mov     dword [eax+7CH], 48                     ; 2774 _ C7. 40, 7C, 00000030
        mov     eax, dword [ebp-10H]                    ; 277B _ 8B. 45, F0
        mov     dword [eax+80H], 32                     ; 277E _ C7. 80, 00000080, 00000020
        mov     eax, dword [ebp-10H]                    ; 2788 _ 8B. 45, F0
        mov     dword [eax+84H], 0                      ; 278B _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-10H]                    ; 2795 _ 8B. 45, F0
        mov     dword [eax+88H], 16                     ; 2798 _ C7. 80, 00000088, 00000010
        mov     eax, dword [ebp-10H]                    ; 27A2 _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 27A5 _ 8B. 40, 64
        lea     edx, [eax-4H]                           ; 27A8 _ 8D. 50, FC
        mov     eax, dword [ebp-10H]                    ; 27AB _ 8B. 45, F0
        mov     dword [eax+64H], edx                    ; 27AE _ 89. 50, 64
        mov     eax, dword [ebp-10H]                    ; 27B1 _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 27B4 _ 8B. 40, 64
        add     eax, 4                                  ; 27B7 _ 83. C0, 04
        mov     edx, dword [ebp-18H]                    ; 27BA _ 8B. 55, E8
        mov     dword [eax], edx                        ; 27BD _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 27BF _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 27C2 _ 8B. 40, 64
        add     eax, 8                                  ; 27C5 _ 83. C0, 08
        mov     ebx, eax                                ; 27C8 _ 89. C3
        mov     eax, dword [memman]                     ; 27CA _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 27CF _ 89. 04 24
        call    memman_total                            ; 27D2 _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 27D7 _ 89. 03
        mov     dword [esp+8H], 5                       ; 27D9 _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 27E1 _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-10H]                    ; 27E9 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 27EC _ 89. 04 24
        call    task_run                                ; 27EF _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 27F4 _ A1, 00000000(d)
        mov     dword [esp+0CH], 4                      ; 27F9 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 2801 _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-18H]                    ; 2809 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 280C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2810 _ 89. 04 24
        call    sheet_slide                             ; 2813 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2818 _ A1, 00000000(d)
        mov     dword [esp+8H], 1                       ; 281D _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-18H]                    ; 2825 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2828 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 282C _ 89. 04 24
        call    sheet_updown                            ; 282F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2834 _ 8B. 45, F0
        mov     dword [task_console_g], eax             ; 2837 _ A3, 00000000(d)
        mov     eax, dword [ebp-18H]                    ; 283C _ 8B. 45, E8
        add     esp, 52                                 ; 283F _ 83. C4, 34
        pop     ebx                                     ; 2842 _ 5B
        pop     ebp                                     ; 2843 _ 5D
        ret                                             ; 2844 _ C3
; launch_console End of function

set_cursor:; Function begin
        push    ebp                                     ; 2845 _ 55
        mov     ebp, esp                                ; 2846 _ 89. E5
        push    esi                                     ; 2848 _ 56
        push    ebx                                     ; 2849 _ 53
        sub     esp, 32                                 ; 284A _ 83. EC, 20
        mov     eax, dword [ebp+14H]                    ; 284D _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 2850 _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 2853 _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 2856 _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 2859 _ 8B. 45, 18
        movzx   ecx, al                                 ; 285C _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 285F _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 2862 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2865 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2868 _ 8B. 00
        mov     dword [esp+18H], esi                    ; 286A _ 89. 74 24, 18
        mov     dword [esp+14H], ebx                    ; 286E _ 89. 5C 24, 14
        mov     ebx, dword [ebp+14H]                    ; 2872 _ 8B. 5D, 14
        mov     dword [esp+10H], ebx                    ; 2875 _ 89. 5C 24, 10
        mov     ebx, dword [ebp+10H]                    ; 2879 _ 8B. 5D, 10
        mov     dword [esp+0CH], ebx                    ; 287C _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2880 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2884 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2888 _ 89. 04 24
        call    paint_rectangle                         ; 288B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 2890 _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 2893 _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 2896 _ 8B. 45, 10
        add     eax, 8                                  ; 2899 _ 83. C0, 08
        mov     dword [esp+14H], edx                    ; 289C _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 28A0 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 28A4 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 28A7 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 28AB _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 28AE _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 28B2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 28B5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 28B9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 28BC _ 89. 04 24
        call    sheet_refresh                           ; 28BF _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 28C4 _ 83. C4, 20
        pop     ebx                                     ; 28C7 _ 5B
        pop     esi                                     ; 28C8 _ 5E
        pop     ebp                                     ; 28C9 _ 5D
        ret                                             ; 28CA _ C3
; set_cursor End of function

console_new_line:; Function begin
        push    ebp                                     ; 28CB _ 55
        mov     ebp, esp                                ; 28CC _ 89. E5
        push    ebx                                     ; 28CE _ 53
        sub     esp, 52                                 ; 28CF _ 83. EC, 34
        cmp     dword [ebp+8H], 139                     ; 28D2 _ 81. 7D, 08, 0000008B
        jg      ?_090                                   ; 28D9 _ 7F, 09
        add     dword [ebp+8H], 16                      ; 28DB _ 83. 45, 08, 10
        jmp     ?_099                                   ; 28DF _ E9, 000000DF

?_090:  mov     dword [ebp-0CH], 28                     ; 28E4 _ C7. 45, F4, 0000001C
        jmp     ?_094                                   ; 28EB _ EB, 52

?_091:  mov     dword [ebp-10H], 8                      ; 28ED _ C7. 45, F0, 00000008
        jmp     ?_093                                   ; 28F4 _ EB, 3C

?_092:  mov     eax, dword [ebp+0CH]                    ; 28F6 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 28F9 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 28FB _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 28FE _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2901 _ 0F AF. 45, F4
        mov     ecx, eax                                ; 2905 _ 89. C1
        mov     eax, dword [ebp-10H]                    ; 2907 _ 8B. 45, F0
        add     eax, ecx                                ; 290A _ 01. C8
        add     edx, eax                                ; 290C _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 290E _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 2911 _ 8B. 08
        mov     eax, dword [ebp-0CH]                    ; 2913 _ 8B. 45, F4
        lea     ebx, [eax+10H]                          ; 2916 _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 2919 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 291C _ 8B. 40, 04
        imul    ebx, eax                                ; 291F _ 0F AF. D8
        mov     eax, dword [ebp-10H]                    ; 2922 _ 8B. 45, F0
        add     eax, ebx                                ; 2925 _ 01. D8
        add     eax, ecx                                ; 2927 _ 01. C8
        movzx   eax, byte [eax]                         ; 2929 _ 0F B6. 00
        mov     byte [edx], al                          ; 292C _ 88. 02
        add     dword [ebp-10H], 1                      ; 292E _ 83. 45, F0, 01
?_093:  cmp     dword [ebp-10H], 247                    ; 2932 _ 81. 7D, F0, 000000F7
        jle     ?_092                                   ; 2939 _ 7E, BB
        add     dword [ebp-0CH], 1                      ; 293B _ 83. 45, F4, 01
?_094:  cmp     dword [ebp-0CH], 139                    ; 293F _ 81. 7D, F4, 0000008B
        jle     ?_091                                   ; 2946 _ 7E, A5
        mov     dword [ebp-0CH], 140                    ; 2948 _ C7. 45, F4, 0000008C
        jmp     ?_098                                   ; 294F _ EB, 35

?_095:  mov     dword [ebp-10H], 8                      ; 2951 _ C7. 45, F0, 00000008
        jmp     ?_097                                   ; 2958 _ EB, 1F

?_096:  mov     eax, dword [ebp+0CH]                    ; 295A _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 295D _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 295F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2962 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2965 _ 0F AF. 45, F4
        mov     ecx, eax                                ; 2969 _ 89. C1
        mov     eax, dword [ebp-10H]                    ; 296B _ 8B. 45, F0
        add     eax, ecx                                ; 296E _ 01. C8
        add     eax, edx                                ; 2970 _ 01. D0
        mov     byte [eax], 0                           ; 2972 _ C6. 00, 00
        add     dword [ebp-10H], 1                      ; 2975 _ 83. 45, F0, 01
?_097:  cmp     dword [ebp-10H], 247                    ; 2979 _ 81. 7D, F0, 000000F7
        jle     ?_096                                   ; 2980 _ 7E, D8
        add     dword [ebp-0CH], 1                      ; 2982 _ 83. 45, F4, 01
?_098:  cmp     dword [ebp-0CH], 155                    ; 2986 _ 81. 7D, F4, 0000009B
        jle     ?_095                                   ; 298D _ 7E, C2
        mov     eax, dword [sheet_control]              ; 298F _ A1, 00000000(d)
        mov     dword [esp+14H], 156                    ; 2994 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 299C _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 29A4 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 29AC _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 29B4 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 29B7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 29BB _ 89. 04 24
        call    sheet_refresh                           ; 29BE _ E8, FFFFFFFC(rel)
?_099:  mov     eax, dword [sheet_control]              ; 29C3 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 29C8 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_252                  ; 29D0 _ C7. 44 24, 10, 00000060(d)
        mov     edx, dword [ebp+8H]                     ; 29D8 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 29DB _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 29DF _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 29E7 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 29EA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 29EE _ 89. 04 24
        call    paint_string                            ; 29F1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 29F6 _ 8B. 45, 08
        add     esp, 52                                 ; 29F9 _ 83. C4, 34
        pop     ebx                                     ; 29FC _ 5B
        pop     ebp                                     ; 29FD _ 5D
        ret                                             ; 29FE _ C3
; console_new_line End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 29FF _ 55
        mov     ebp, esp                                ; 2A00 _ 89. E5
        sub     esp, 24                                 ; 2A02 _ 83. EC, 18
?_100:  mov     dword [esp], 100                        ; 2A05 _ C7. 04 24, 00000064
        call    io_in8                                  ; 2A0C _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 2A11 _ 83. E0, 02
        test    eax, eax                                ; 2A14 _ 85. C0
        jnz     ?_101                                   ; 2A16 _ 75, 02
        jmp     ?_102                                   ; 2A18 _ EB, 02

?_101:  jmp     ?_100                                   ; 2A1A _ EB, E9

?_102:  leave                                           ; 2A1C _ C9
        ret                                             ; 2A1D _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 2A1E _ 55
        mov     ebp, esp                                ; 2A1F _ 89. E5
        sub     esp, 24                                 ; 2A21 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2A24 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 2A29 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 2A31 _ C7. 04 24, 00000064
        call    io_out8                                 ; 2A38 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2A3D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 2A42 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 2A4A _ C7. 04 24, 00000060
        call    io_out8                                 ; 2A51 _ E8, FFFFFFFC(rel)
        leave                                           ; 2A56 _ C9
        ret                                             ; 2A57 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 2A58 _ 55
        mov     ebp, esp                                ; 2A59 _ 89. E5
        sub     esp, 24                                 ; 2A5B _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2A5E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 2A63 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 2A6B _ C7. 04 24, 00000064
        call    io_out8                                 ; 2A72 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2A77 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 2A7C _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 2A84 _ C7. 04 24, 00000060
        call    io_out8                                 ; 2A8B _ E8, FFFFFFFC(rel)
        leave                                           ; 2A90 _ C9
        ret                                             ; 2A91 _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 2A92 _ 55
        mov     ebp, esp                                ; 2A93 _ 89. E5
        sub     esp, 4                                  ; 2A95 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 2A98 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 2A9B _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2A9E _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2AA1 _ 0F B6. 40, 03
        test    al, al                                  ; 2AA5 _ 84. C0
        jnz     ?_104                                   ; 2AA7 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 2AA9 _ 80. 7D, FC, FA
        jnz     ?_103                                   ; 2AAD _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 2AAF _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2AB2 _ C6. 40, 03, 01
?_103:  mov     eax, 0                                  ; 2AB6 _ B8, 00000000
        jmp     ?_111                                   ; 2ABB _ E9, 0000010F

?_104:  mov     eax, dword [ebp+8H]                     ; 2AC0 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2AC3 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 2AC7 _ 3C, 01
        jnz     ?_106                                   ; 2AC9 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 2ACB _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 2ACF _ 25, 000000C8
        cmp     eax, 8                                  ; 2AD4 _ 83. F8, 08
        jnz     ?_105                                   ; 2AD7 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 2AD9 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2ADC _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 2AE0 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 2AE2 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 2AE5 _ C6. 40, 03, 02
?_105:  mov     eax, 0                                  ; 2AE9 _ B8, 00000000
        jmp     ?_111                                   ; 2AEE _ E9, 000000DC

?_106:  mov     eax, dword [ebp+8H]                     ; 2AF3 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2AF6 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 2AFA _ 3C, 02
        jnz     ?_107                                   ; 2AFC _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 2AFE _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2B01 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 2B05 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2B08 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 2B0B _ C6. 40, 03, 03
        mov     eax, 0                                  ; 2B0F _ B8, 00000000
        jmp     ?_111                                   ; 2B14 _ E9, 000000B6

?_107:  mov     eax, dword [ebp+8H]                     ; 2B19 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2B1C _ 0F B6. 40, 03
        cmp     al, 3                                   ; 2B20 _ 3C, 03
        jne     ?_110                                   ; 2B22 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 2B28 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2B2B _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 2B2F _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 2B32 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2B35 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 2B39 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2B3C _ 0F B6. 00
        movzx   eax, al                                 ; 2B3F _ 0F B6. C0
        and     eax, 07H                                ; 2B42 _ 83. E0, 07
        mov     edx, eax                                ; 2B45 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2B47 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2B4A _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2B4D _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 2B50 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 2B54 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2B57 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2B5A _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2B5D _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 2B60 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 2B64 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2B67 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2B6A _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2B6D _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2B70 _ 0F B6. 00
        movzx   eax, al                                 ; 2B73 _ 0F B6. C0
        and     eax, 10H                                ; 2B76 _ 83. E0, 10
        test    eax, eax                                ; 2B79 _ 85. C0
        jz      ?_108                                   ; 2B7B _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2B7D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2B80 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 2B83 _ 0D, FFFFFF00
        mov     edx, eax                                ; 2B88 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2B8A _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2B8D _ 89. 50, 04
?_108:  mov     eax, dword [ebp+8H]                     ; 2B90 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2B93 _ 0F B6. 00
        movzx   eax, al                                 ; 2B96 _ 0F B6. C0
        and     eax, 20H                                ; 2B99 _ 83. E0, 20
        test    eax, eax                                ; 2B9C _ 85. C0
        jz      ?_109                                   ; 2B9E _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2BA0 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2BA3 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 2BA6 _ 0D, FFFFFF00
        mov     edx, eax                                ; 2BAB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2BAD _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2BB0 _ 89. 50, 08
?_109:  mov     eax, dword [ebp+8H]                     ; 2BB3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2BB6 _ 8B. 40, 08
        neg     eax                                     ; 2BB9 _ F7. D8
        mov     edx, eax                                ; 2BBB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2BBD _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2BC0 _ 89. 50, 08
        mov     eax, 1                                  ; 2BC3 _ B8, 00000001
        jmp     ?_111                                   ; 2BC8 _ EB, 05

?_110:  mov     eax, 4294967295                         ; 2BCA _ B8, FFFFFFFF
?_111:  leave                                           ; 2BCF _ C9
        ret                                             ; 2BD0 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 2BD1 _ 55
        mov     ebp, esp                                ; 2BD2 _ 89. E5
        sub     esp, 40                                 ; 2BD4 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 2BD7 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 2BDF _ C7. 04 24, 00000020
        call    io_out8                                 ; 2BE6 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 2BEB _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 2BF3 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 2BFA _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 2BFF _ C7. 04 24, 00000060
        call    io_in8                                  ; 2C06 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 2C0B _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 2C0E _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 2C12 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 2C16 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 2C1D _ E8, FFFFFFFC(rel)
        leave                                           ; 2C22 _ C9
        ret                                             ; 2C23 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 2C24 _ 55
        mov     ebp, esp                                ; 2C25 _ 89. E5
        sub     esp, 40                                 ; 2C27 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 2C2A _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 2C32 _ C7. 04 24, 00000020
        call    io_out8                                 ; 2C39 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 2C3E _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 2C46 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 2C4D _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 2C52 _ C7. 04 24, 00000060
        call    io_in8                                  ; 2C59 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 2C5E _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 2C61 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 2C65 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 2C69 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 2C70 _ E8, FFFFFFFC(rel)
        leave                                           ; 2C75 _ C9
        ret                                             ; 2C76 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 2C77 _ 55
        mov     ebp, esp                                ; 2C78 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2C7A _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2C7D _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2C80 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2C82 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2C85 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2C8C _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2C8F _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2C96 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2C99 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 2C9C _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2C9F _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2CA2 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2CA5 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2CA8 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2CAB _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 2CB2 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2CB5 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 2CB8 _ 89. 50, 18
        pop     ebp                                     ; 2CBB _ 5D
        ret                                             ; 2CBC _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 2CBD _ 55
        mov     ebp, esp                                ; 2CBE _ 89. E5
        sub     esp, 40                                 ; 2CC0 _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 2CC3 _ 8B. 45, 0C
        mov     byte [ebp-1CH], al                      ; 2CC6 _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 2CC9 _ 83. 7D, 08, 00
        jnz     ?_112                                   ; 2CCD _ 75, 0A
        mov     eax, 4294967295                         ; 2CCF _ B8, FFFFFFFF
        jmp     ?_116                                   ; 2CD4 _ E9, 000000B1

?_112:  mov     eax, dword [ebp+8H]                     ; 2CD9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2CDC _ 8B. 40, 10
        test    eax, eax                                ; 2CDF _ 85. C0
        jnz     ?_113                                   ; 2CE1 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 2CE3 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 2CE6 _ 8B. 40, 14
        or      eax, 01H                                ; 2CE9 _ 83. C8, 01
        mov     edx, eax                                ; 2CEC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2CEE _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 2CF1 _ 89. 50, 14
        mov     eax, 4294967295                         ; 2CF4 _ B8, FFFFFFFF
        jmp     ?_116                                   ; 2CF9 _ E9, 0000008C

?_113:  mov     eax, dword [ebp+8H]                     ; 2CFE _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2D01 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 2D04 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 2D07 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2D0A _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 2D0C _ 8B. 45, F4
        add     edx, eax                                ; 2D0F _ 01. C2
        movzx   eax, byte [ebp-1CH]                     ; 2D11 _ 0F B6. 45, E4
        mov     byte [edx], al                          ; 2D15 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 2D17 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2D1A _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 2D1D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2D20 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2D23 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2D26 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2D29 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2D2C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2D2F _ 8B. 40, 0C
        cmp     edx, eax                                ; 2D32 _ 39. C2
        jnz     ?_114                                   ; 2D34 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2D36 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2D39 _ C7. 40, 04, 00000000
?_114:  mov     eax, dword [ebp+8H]                     ; 2D40 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2D43 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2D46 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2D49 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2D4C _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2D4F _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2D52 _ 8B. 40, 18
        test    eax, eax                                ; 2D55 _ 85. C0
        jz      ?_115                                   ; 2D57 _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 2D59 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2D5C _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 2D5F _ 8B. 40, 04
        cmp     eax, 2                                  ; 2D62 _ 83. F8, 02
        jz      ?_115                                   ; 2D65 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 2D67 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2D6A _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 2D6D _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 2D75 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 2D7D _ 89. 04 24
        call    task_run                                ; 2D80 _ E8, FFFFFFFC(rel)
?_115:  mov     eax, 0                                  ; 2D85 _ B8, 00000000
?_116:  leave                                           ; 2D8A _ C9
        ret                                             ; 2D8B _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2D8C _ 55
        mov     ebp, esp                                ; 2D8D _ 89. E5
        sub     esp, 16                                 ; 2D8F _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 2D92 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 2D95 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2D98 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2D9B _ 8B. 40, 0C
        cmp     edx, eax                                ; 2D9E _ 39. C2
        jnz     ?_117                                   ; 2DA0 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 2DA2 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2DA5 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 2DAC _ B8, FFFFFFFF
        jmp     ?_119                                   ; 2DB1 _ EB, 57

?_117:  mov     eax, dword [ebp+8H]                     ; 2DB3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2DB6 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 2DB9 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 2DBC _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2DBF _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 2DC1 _ 8B. 45, F8
        add     eax, edx                                ; 2DC4 _ 01. D0
        movzx   eax, byte [eax]                         ; 2DC6 _ 0F B6. 00
        movzx   eax, al                                 ; 2DC9 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2DCC _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2DCF _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2DD2 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2DD5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2DD8 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2DDB _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2DDE _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 2DE1 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2DE4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2DE7 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2DEA _ 39. C2
        jnz     ?_118                                   ; 2DEC _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2DEE _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2DF1 _ C7. 40, 08, 00000000
?_118:  mov     eax, dword [ebp+8H]                     ; 2DF8 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2DFB _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2DFE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2E01 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2E04 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 2E07 _ 8B. 45, FC
?_119:  leave                                           ; 2E0A _ C9
        ret                                             ; 2E0B _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 2E0C _ 55
        mov     ebp, esp                                ; 2E0D _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2E0F _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 2E12 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2E15 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2E18 _ 8B. 40, 10
        sub     edx, eax                                ; 2E1B _ 29. C2
        mov     eax, edx                                ; 2E1D _ 89. D0
        pop     ebp                                     ; 2E1F _ 5D
        ret                                             ; 2E20 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 2E21 _ 55
        mov     ebp, esp                                ; 2E22 _ 89. E5
        sub     esp, 4                                  ; 2E24 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 2E27 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 2E2A _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 2E2D _ 80. 7D, FC, 09
        jle     ?_120                                   ; 2E31 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 2E33 _ 0F B6. 45, FC
        add     eax, 55                                 ; 2E37 _ 83. C0, 37
        jmp     ?_121                                   ; 2E3A _ EB, 07

?_120:  movzx   eax, byte [ebp-4H]                      ; 2E3C _ 0F B6. 45, FC
        add     eax, 48                                 ; 2E40 _ 83. C0, 30
?_121:  leave                                           ; 2E43 _ C9
        ret                                             ; 2E44 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 2E45 _ 55
        mov     ebp, esp                                ; 2E46 _ 89. E5
        sub     esp, 24                                 ; 2E48 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 2E4B _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 2E4E _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 2E51 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 2E58 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 2E5C _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 2E5F _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 2E62 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 2E66 _ 89. 04 24
        call    charToHexVal                            ; 2E69 _ E8, FFFFFFFC(rel)
        mov     byte [?_257], al                        ; 2E6E _ A2, 00000343(d)
        movzx   eax, byte [ebp-14H]                     ; 2E73 _ 0F B6. 45, EC
        shr     al, 4                                   ; 2E77 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 2E7A _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 2E7D _ 0F B6. 45, EC
        movsx   eax, al                                 ; 2E81 _ 0F BE. C0
        mov     dword [esp], eax                        ; 2E84 _ 89. 04 24
        call    charToHexVal                            ; 2E87 _ E8, FFFFFFFC(rel)
        mov     byte [?_256], al                        ; 2E8C _ A2, 00000342(d)
        mov     eax, keyval                             ; 2E91 _ B8, 00000340(d)
        leave                                           ; 2E96 _ C9
        ret                                             ; 2E97 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 2E98 _ 55
        mov     ebp, esp                                ; 2E99 _ 89. E5
        sub     esp, 16                                 ; 2E9B _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 2E9E _ C6. 05, 000002E0(d), 30
        mov     byte [?_260], 88                        ; 2EA5 _ C6. 05, 000002E1(d), 58
        mov     byte [?_261], 0                         ; 2EAC _ C6. 05, 000002EA(d), 00
        mov     dword [ebp-0CH], 2                      ; 2EB3 _ C7. 45, F4, 00000002
        jmp     ?_123                                   ; 2EBA _ EB, 0F

?_122:  mov     eax, dword [ebp-0CH]                    ; 2EBC _ 8B. 45, F4
        add     eax, str.1386                           ; 2EBF _ 05, 000002E0(d)
        mov     byte [eax], 48                          ; 2EC4 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 2EC7 _ 83. 45, F4, 01
?_123:  cmp     dword [ebp-0CH], 9                      ; 2ECB _ 83. 7D, F4, 09
        jle     ?_122                                   ; 2ECF _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 2ED1 _ C7. 45, F8, 00000009
        jmp     ?_127                                   ; 2ED8 _ EB, 40

?_124:  mov     eax, dword [ebp+8H]                     ; 2EDA _ 8B. 45, 08
        and     eax, 0FH                                ; 2EDD _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 2EE0 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2EE3 _ 8B. 45, 08
        shr     eax, 4                                  ; 2EE6 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 2EE9 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 2EEC _ 83. 7D, FC, 09
        jle     ?_125                                   ; 2EF0 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 2EF2 _ 8B. 45, FC
        add     eax, 55                                 ; 2EF5 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 2EF8 _ 8B. 55, F8
        add     edx, str.1386                           ; 2EFB _ 81. C2, 000002E0(d)
        mov     byte [edx], al                          ; 2F01 _ 88. 02
        jmp     ?_126                                   ; 2F03 _ EB, 11

?_125:  mov     eax, dword [ebp-4H]                     ; 2F05 _ 8B. 45, FC
        add     eax, 48                                 ; 2F08 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 2F0B _ 8B. 55, F8
        add     edx, str.1386                           ; 2F0E _ 81. C2, 000002E0(d)
        mov     byte [edx], al                          ; 2F14 _ 88. 02
?_126:  sub     dword [ebp-8H], 1                       ; 2F16 _ 83. 6D, F8, 01
?_127:  cmp     dword [ebp-8H], 1                       ; 2F1A _ 83. 7D, F8, 01
        jle     ?_128                                   ; 2F1E _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 2F20 _ 83. 7D, 08, 00
        jnz     ?_124                                   ; 2F24 _ 75, B4
?_128:  mov     eax, str.1386                           ; 2F26 _ B8, 000002E0(d)
        leave                                           ; 2F2B _ C9
        ret                                             ; 2F2C _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 2F2D _ 55
        mov     ebp, esp                                ; 2F2E _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2F30 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 2F33 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 2F39 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2F3C _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2F43 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2F46 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2F4D _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 2F50 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 2F57 _ 5D
        ret                                             ; 2F58 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 2F59 _ 55
        mov     ebp, esp                                ; 2F5A _ 89. E5
        sub     esp, 16                                 ; 2F5C _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2F5F _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 2F66 _ C7. 45, F8, 00000000
        jmp     ?_130                                   ; 2F6D _ EB, 14

?_129:  mov     eax, dword [ebp+8H]                     ; 2F6F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2F72 _ 8B. 55, F8
        add     edx, 2                                  ; 2F75 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2F78 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 2F7C _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 2F7F _ 83. 45, F8, 01
?_130:  mov     eax, dword [ebp+8H]                     ; 2F83 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2F86 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 2F88 _ 3B. 45, F8
        ja      ?_129                                   ; 2F8B _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 2F8D _ 8B. 45, FC
        leave                                           ; 2F90 _ C9
        ret                                             ; 2F91 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 2F92 _ 55
        mov     ebp, esp                                ; 2F93 _ 89. E5
        sub     esp, 16                                 ; 2F95 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2F98 _ C7. 45, F8, 00000000
        jmp     ?_134                                   ; 2F9F _ E9, 00000085

?_131:  mov     eax, dword [ebp+8H]                     ; 2FA4 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2FA7 _ 8B. 55, F8
        add     edx, 2                                  ; 2FAA _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2FAD _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 2FB1 _ 3B. 45, 0C
        jc      ?_133                                   ; 2FB4 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 2FB6 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2FB9 _ 8B. 55, F8
        add     edx, 2                                  ; 2FBC _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2FBF _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 2FC2 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2FC5 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2FC8 _ 8B. 55, F8
        add     edx, 2                                  ; 2FCB _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2FCE _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 2FD1 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 2FD4 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2FD7 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2FDA _ 8B. 55, F8
        add     edx, 2                                  ; 2FDD _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 2FE0 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 2FE3 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2FE6 _ 8B. 55, F8
        add     edx, 2                                  ; 2FE9 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2FEC _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 2FF0 _ 2B. 45, 0C
        mov     edx, eax                                ; 2FF3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2FF5 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 2FF8 _ 8B. 4D, F8
        add     ecx, 2                                  ; 2FFB _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 2FFE _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 3002 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3005 _ 8B. 55, F8
        add     edx, 2                                  ; 3008 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 300B _ 8B. 44 D0, 04
        test    eax, eax                                ; 300F _ 85. C0
        jnz     ?_132                                   ; 3011 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 3013 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3016 _ 8B. 00
        lea     edx, [eax-1H]                           ; 3018 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 301B _ 8B. 45, 08
        mov     dword [eax], edx                        ; 301E _ 89. 10
?_132:  mov     eax, dword [ebp-4H]                     ; 3020 _ 8B. 45, FC
        jmp     ?_135                                   ; 3023 _ EB, 17

?_133:  add     dword [ebp-8H], 1                       ; 3025 _ 83. 45, F8, 01
?_134:  mov     eax, dword [ebp+8H]                     ; 3029 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 302C _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 302E _ 3B. 45, F8
        ja      ?_131                                   ; 3031 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 3037 _ B8, 00000000
?_135:  leave                                           ; 303C _ C9
        ret                                             ; 303D _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 303E _ 55
        mov     ebp, esp                                ; 303F _ 89. E5
        push    ebx                                     ; 3041 _ 53
        sub     esp, 16                                 ; 3042 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 3045 _ C7. 45, F4, 00000000
        jmp     ?_138                                   ; 304C _ EB, 17

?_136:  mov     eax, dword [ebp+8H]                     ; 304E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3051 _ 8B. 55, F4
        add     edx, 2                                  ; 3054 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3057 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 305A _ 3B. 45, 0C
        jbe     ?_137                                   ; 305D _ 76, 02
        jmp     ?_139                                   ; 305F _ EB, 0E

?_137:  add     dword [ebp-0CH], 1                      ; 3061 _ 83. 45, F4, 01
?_138:  mov     eax, dword [ebp+8H]                     ; 3065 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3068 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 306A _ 3B. 45, F4
        jg      ?_136                                   ; 306D _ 7F, DF
?_139:  cmp     dword [ebp-0CH], 0                      ; 306F _ 83. 7D, F4, 00
        jle     ?_141                                   ; 3073 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 3079 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 307C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 307F _ 8B. 45, 08
        add     edx, 2                                  ; 3082 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 3085 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 3088 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 308B _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 308E _ 8B. 45, 08
        add     ecx, 2                                  ; 3091 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 3094 _ 8B. 44 C8, 04
        add     eax, edx                                ; 3098 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 309A _ 3B. 45, 0C
        jne     ?_141                                   ; 309D _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 30A3 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 30A6 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 30A9 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 30AC _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 30AF _ 8B. 45, 08
        add     edx, 2                                  ; 30B2 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 30B5 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 30B9 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 30BC _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 30BF _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 30C2 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 30C5 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 30C9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 30CC _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 30CE _ 3B. 45, F4
        jle     ?_140                                   ; 30D1 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 30D3 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 30D6 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 30D9 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 30DC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 30DF _ 8B. 55, F4
        add     edx, 2                                  ; 30E2 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 30E5 _ 8B. 04 D0
        cmp     ecx, eax                                ; 30E8 _ 39. C1
        jnz     ?_140                                   ; 30EA _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 30EC _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 30EF _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 30F2 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 30F5 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 30F8 _ 8B. 45, 08
        add     edx, 2                                  ; 30FB _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 30FE _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 3102 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 3105 _ 8B. 4D, F4
        add     ecx, 2                                  ; 3108 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 310B _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 310F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3112 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 3115 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3118 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 311C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 311F _ 8B. 00
        lea     edx, [eax-1H]                           ; 3121 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3124 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3127 _ 89. 10
?_140:  mov     eax, 0                                  ; 3129 _ B8, 00000000
        jmp     ?_147                                   ; 312E _ E9, 0000011C

?_141:  mov     eax, dword [ebp+8H]                     ; 3133 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3136 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3138 _ 3B. 45, F4
        jle     ?_142                                   ; 313B _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 313D _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 3140 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 3143 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3146 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3149 _ 8B. 55, F4
        add     edx, 2                                  ; 314C _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 314F _ 8B. 04 D0
        cmp     ecx, eax                                ; 3152 _ 39. C1
        jnz     ?_142                                   ; 3154 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 3156 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3159 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 315C _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 315F _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 3162 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 3165 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3168 _ 8B. 55, F4
        add     edx, 2                                  ; 316B _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 316E _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 3172 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 3175 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3178 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 317B _ 8B. 55, F4
        add     edx, 2                                  ; 317E _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3181 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 3185 _ B8, 00000000
        jmp     ?_147                                   ; 318A _ E9, 000000C0

?_142:  mov     eax, dword [ebp+8H]                     ; 318F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3192 _ 8B. 00
        cmp     eax, 4095                               ; 3194 _ 3D, 00000FFF
        jg      ?_146                                   ; 3199 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 319F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 31A2 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 31A4 _ 89. 45, F8
        jmp     ?_144                                   ; 31A7 _ EB, 28

?_143:  mov     eax, dword [ebp-8H]                     ; 31A9 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 31AC _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 31AF _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 31B2 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 31B5 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 31B8 _ 8B. 45, 08
        add     edx, 2                                  ; 31BB _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 31BE _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 31C1 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 31C3 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 31C6 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 31C9 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 31CD _ 83. 6D, F8, 01
?_144:  mov     eax, dword [ebp-8H]                     ; 31D1 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 31D4 _ 3B. 45, F4
        jg      ?_143                                   ; 31D7 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 31D9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 31DC _ 8B. 00
        lea     edx, [eax+1H]                           ; 31DE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 31E1 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 31E4 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 31E6 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 31E9 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 31EC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 31EF _ 8B. 00
        cmp     edx, eax                                ; 31F1 _ 39. C2
        jge     ?_145                                   ; 31F3 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 31F5 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 31F8 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 31FA _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 31FD _ 89. 50, 04
?_145:  mov     eax, dword [ebp+8H]                     ; 3200 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3203 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3206 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3209 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 320C _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 320F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3212 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3215 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 3218 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 321B _ 89. 54 C8, 04
        mov     eax, 0                                  ; 321F _ B8, 00000000
        jmp     ?_147                                   ; 3224 _ EB, 29

?_146:  mov     eax, dword [ebp+8H]                     ; 3226 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3229 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 322C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 322F _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3232 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3235 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3238 _ 8B. 40, 08
        mov     edx, eax                                ; 323B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 323D _ 8B. 45, 10
        add     eax, edx                                ; 3240 _ 01. D0
        mov     edx, eax                                ; 3242 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3244 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3247 _ 89. 50, 08
        mov     eax, 4294967295                         ; 324A _ B8, FFFFFFFF
?_147:  add     esp, 16                                 ; 324F _ 83. C4, 10
        pop     ebx                                     ; 3252 _ 5B
        pop     ebp                                     ; 3253 _ 5D
        ret                                             ; 3254 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 3255 _ 55
        mov     ebp, esp                                ; 3256 _ 89. E5
        sub     esp, 24                                 ; 3258 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 325B _ 8B. 45, 0C
        add     eax, 4095                               ; 325E _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 3263 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 3268 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 326B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 326E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3272 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3275 _ 89. 04 24
        call    memman_alloc                            ; 3278 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 327D _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3280 _ 8B. 45, FC
        leave                                           ; 3283 _ C9
        ret                                             ; 3284 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 3285 _ 55
        mov     ebp, esp                                ; 3286 _ 89. E5
        sub     esp, 28                                 ; 3288 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 328B _ 8B. 45, 10
        add     eax, 4095                               ; 328E _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 3293 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 3298 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 329B _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 329E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 32A2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 32A5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 32A9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 32AC _ 89. 04 24
        call    memman_free                             ; 32AF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 32B4 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 32B7 _ 8B. 45, FC
        leave                                           ; 32BA _ C9
        ret                                             ; 32BB _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 32BC _ 55
        mov     ebp, esp                                ; 32BD _ 89. E5
        sub     esp, 40                                 ; 32BF _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 32C2 _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 32CA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 32CD _ 89. 04 24
        call    memman_alloc_4k                         ; 32D0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 32D5 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 32D8 _ 83. 7D, F4, 00
        jnz     ?_148                                   ; 32DC _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 32DE _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 32E1 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 32E9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 32ED _ 8B. 45, 08
        mov     dword [esp], eax                        ; 32F0 _ 89. 04 24
        call    memman_free_4k                          ; 32F3 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 32F8 _ B8, 00000000
        jmp     ?_152                                   ; 32FD _ E9, 0000009D

?_148:  mov     eax, dword [ebp-0CH]                    ; 3302 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 3305 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3308 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 330A _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 330D _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 3310 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3313 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 3316 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3319 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 331C _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 331F _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 3326 _ C7. 45, F0, 00000000
        jmp     ?_150                                   ; 332D _ EB, 1B

?_149:  mov     eax, dword [ebp-0CH]                    ; 332F _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 3332 _ 8B. 55, F0
        add     edx, 33                                 ; 3335 _ 83. C2, 21
        shl     edx, 5                                  ; 3338 _ C1. E2, 05
        add     eax, edx                                ; 333B _ 01. D0
        add     eax, 16                                 ; 333D _ 83. C0, 10
        mov     dword [eax], 0                          ; 3340 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 3346 _ 83. 45, F0, 01
?_150:  cmp     dword [ebp-10H], 255                    ; 334A _ 81. 7D, F0, 000000FF
        jle     ?_149                                   ; 3351 _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 3353 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 3356 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 335A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 335E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3361 _ 89. 04 24
        call    memman_alloc_4k                         ; 3364 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 3369 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 336B _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 336E _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 3371 _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 3374 _ 8B. 40, 10
        test    eax, eax                                ; 3377 _ 85. C0
        jnz     ?_151                                   ; 3379 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 337B _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 337E _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 3386 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 338A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 338D _ 89. 04 24
        call    memman_free_4k                          ; 3390 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3395 _ B8, 00000000
        jmp     ?_152                                   ; 339A _ EB, 03

?_151:  mov     eax, dword [ebp-0CH]                    ; 339C _ 8B. 45, F4
?_152:  leave                                           ; 339F _ C9
        ret                                             ; 33A0 _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 33A1 _ 55
        mov     ebp, esp                                ; 33A2 _ 89. E5
        sub     esp, 16                                 ; 33A4 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 33A7 _ C7. 45, F8, 00000000
        jmp     ?_155                                   ; 33AE _ EB, 5B

?_153:  mov     eax, dword [ebp+8H]                     ; 33B0 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 33B3 _ 8B. 55, F8
        add     edx, 33                                 ; 33B6 _ 83. C2, 21
        shl     edx, 5                                  ; 33B9 _ C1. E2, 05
        add     eax, edx                                ; 33BC _ 01. D0
        add     eax, 16                                 ; 33BE _ 83. C0, 10
        mov     eax, dword [eax]                        ; 33C1 _ 8B. 00
        test    eax, eax                                ; 33C3 _ 85. C0
        jnz     ?_154                                   ; 33C5 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 33C7 _ 8B. 45, F8
        shl     eax, 5                                  ; 33CA _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 33CD _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 33D3 _ 8B. 45, 08
        add     eax, edx                                ; 33D6 _ 01. D0
        add     eax, 4                                  ; 33D8 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 33DB _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 33DE _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 33E1 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 33E4 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 33E7 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 33EA _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 33EE _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 33F1 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 33F8 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 33FB _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 3402 _ 8B. 45, FC
        jmp     ?_156                                   ; 3405 _ EB, 12

?_154:  add     dword [ebp-8H], 1                       ; 3407 _ 83. 45, F8, 01
?_155:  cmp     dword [ebp-8H], 255                     ; 340B _ 81. 7D, F8, 000000FF
        jle     ?_153                                   ; 3412 _ 7E, 9C
        mov     eax, 0                                  ; 3414 _ B8, 00000000
?_156:  leave                                           ; 3419 _ C9
        ret                                             ; 341A _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 341B _ 55
        mov     ebp, esp                                ; 341C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 341E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3421 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3424 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3426 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3429 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 342C _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 342F _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 3432 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3435 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3438 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 343B _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 343E _ 89. 50, 14
        pop     ebp                                     ; 3441 _ 5D
        ret                                             ; 3442 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 3443 _ 55
        mov     ebp, esp                                ; 3444 _ 89. E5
        push    esi                                     ; 3446 _ 56
        push    ebx                                     ; 3447 _ 53
        sub     esp, 48                                 ; 3448 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 344B _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 344E _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 3451 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3454 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3457 _ 8B. 40, 0C
        add     eax, 1                                  ; 345A _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 345D _ 3B. 45, 10
        jge     ?_157                                   ; 3460 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 3462 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3465 _ 8B. 40, 0C
        add     eax, 1                                  ; 3468 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 346B _ 89. 45, 10
?_157:  cmp     dword [ebp+10H], -1                     ; 346E _ 83. 7D, 10, FF
        jge     ?_158                                   ; 3472 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 3474 _ C7. 45, 10, FFFFFFFF
?_158:  mov     eax, dword [ebp+0CH]                    ; 347B _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 347E _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 3481 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 3484 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3487 _ 3B. 45, 10
        jle     ?_165                                   ; 348A _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 3490 _ 83. 7D, 10, 00
        js      ?_161                                   ; 3494 _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 349A _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 349D _ 89. 45, F0
        jmp     ?_160                                   ; 34A0 _ EB, 34

?_159:  mov     eax, dword [ebp-10H]                    ; 34A2 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 34A5 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 34A8 _ 8B. 45, 08
        add     edx, 4                                  ; 34AB _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 34AE _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 34B2 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 34B5 _ 8B. 4D, F0
        add     ecx, 4                                  ; 34B8 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 34BB _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 34BF _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 34C2 _ 8B. 55, F0
        add     edx, 4                                  ; 34C5 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 34C8 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 34CC _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 34CF _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 34D2 _ 83. 6D, F0, 01
?_160:  mov     eax, dword [ebp-10H]                    ; 34D6 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 34D9 _ 3B. 45, 10
        jg      ?_159                                   ; 34DC _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 34DE _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 34E1 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 34E4 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 34E7 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 34EA _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 34EE _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 34F1 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 34F4 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 34F7 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 34FA _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 34FD _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3500 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3503 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3506 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3509 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 350C _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 350F _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3512 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3515 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3518 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 351B _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 351E _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3522 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3526 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 352A _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 352E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3532 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3535 _ 89. 04 24
        call    sheet_refresh_map                       ; 3538 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 353D _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3540 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3543 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3546 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3549 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 354C _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 354F _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3552 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3555 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3558 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 355B _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 355E _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3561 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3564 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3567 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 356A _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 356D _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3571 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3575 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3579 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 357D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3581 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3584 _ 89. 04 24
        call    sheet_refresh_local                     ; 3587 _ E8, FFFFFFFC(rel)
        jmp     ?_172                                   ; 358C _ E9, 0000026C

?_161:  mov     eax, dword [ebp+8H]                     ; 3591 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3594 _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 3597 _ 3B. 45, F4
        jle     ?_164                                   ; 359A _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 359C _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 359F _ 89. 45, F0
        jmp     ?_163                                   ; 35A2 _ EB, 34

?_162:  mov     eax, dword [ebp-10H]                    ; 35A4 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 35A7 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 35AA _ 8B. 45, 08
        add     edx, 4                                  ; 35AD _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 35B0 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 35B4 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 35B7 _ 8B. 4D, F0
        add     ecx, 4                                  ; 35BA _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 35BD _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 35C1 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 35C4 _ 8B. 55, F0
        add     edx, 4                                  ; 35C7 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 35CA _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 35CE _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 35D1 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 35D4 _ 83. 45, F0, 01
?_163:  mov     eax, dword [ebp+8H]                     ; 35D8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 35DB _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 35DE _ 3B. 45, F0
        jg      ?_162                                   ; 35E1 _ 7F, C1
?_164:  mov     eax, dword [ebp+8H]                     ; 35E3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 35E6 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 35E9 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 35EC _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 35EF _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 35F2 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 35F5 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 35F8 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 35FB _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 35FE _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3601 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3604 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3607 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 360A _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 360D _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3610 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3613 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3616 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3619 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 361C _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3624 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3628 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 362C _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3630 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3634 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3637 _ 89. 04 24
        call    sheet_refresh_map                       ; 363A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 363F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3642 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3645 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3648 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 364B _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 364E _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3651 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3654 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3657 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 365A _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 365D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3660 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3663 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3666 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 3669 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3671 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3675 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3679 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 367D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3681 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3684 _ 89. 04 24
        call    sheet_refresh_local                     ; 3687 _ E8, FFFFFFFC(rel)
        jmp     ?_172                                   ; 368C _ E9, 0000016C

?_165:  mov     eax, dword [ebp-0CH]                    ; 3691 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3694 _ 3B. 45, 10
        jge     ?_172                                   ; 3697 _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 369D _ 83. 7D, F4, 00
        js      ?_168                                   ; 36A1 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 36A3 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 36A6 _ 89. 45, F0
        jmp     ?_167                                   ; 36A9 _ EB, 34

?_166:  mov     eax, dword [ebp-10H]                    ; 36AB _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 36AE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 36B1 _ 8B. 45, 08
        add     edx, 4                                  ; 36B4 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 36B7 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 36BB _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 36BE _ 8B. 4D, F0
        add     ecx, 4                                  ; 36C1 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 36C4 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 36C8 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 36CB _ 8B. 55, F0
        add     edx, 4                                  ; 36CE _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 36D1 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 36D5 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 36D8 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 36DB _ 83. 45, F0, 01
?_167:  mov     eax, dword [ebp-10H]                    ; 36DF _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 36E2 _ 3B. 45, 10
        jl      ?_166                                   ; 36E5 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 36E7 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 36EA _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 36ED _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 36F0 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 36F3 _ 89. 54 88, 04
        jmp     ?_171                                   ; 36F7 _ EB, 6C

?_168:  mov     eax, dword [ebp+8H]                     ; 36F9 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 36FC _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 36FF _ 89. 45, F0
        jmp     ?_170                                   ; 3702 _ EB, 3A

?_169:  mov     eax, dword [ebp-10H]                    ; 3704 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 3707 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 370A _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 370D _ 8B. 55, F0
        add     edx, 4                                  ; 3710 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3713 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3717 _ 8B. 45, 08
        add     ecx, 4                                  ; 371A _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 371D _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 3721 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3724 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3727 _ 8B. 45, 08
        add     edx, 4                                  ; 372A _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 372D _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3731 _ 8B. 55, F0
        add     edx, 1                                  ; 3734 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 3737 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 373A _ 83. 6D, F0, 01
?_170:  mov     eax, dword [ebp-10H]                    ; 373E _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3741 _ 3B. 45, 10
        jge     ?_169                                   ; 3744 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 3746 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3749 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 374C _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 374F _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3752 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3756 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3759 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 375C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 375F _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3762 _ 89. 50, 0C
?_171:  mov     eax, dword [ebp+0CH]                    ; 3765 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3768 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 376B _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 376E _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3771 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3774 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3777 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 377A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 377D _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3780 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3783 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3786 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3789 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 378C _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 378F _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3792 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3796 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 379A _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 379E _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 37A2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 37A6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 37A9 _ 89. 04 24
        call    sheet_refresh_map                       ; 37AC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 37B1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 37B4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 37B7 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 37BA _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 37BD _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 37C0 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 37C3 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 37C6 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 37C9 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 37CC _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 37CF _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 37D2 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 37D5 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 37D8 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 37DB _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 37DE _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 37E2 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 37E6 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 37EA _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 37EE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 37F2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 37F5 _ 89. 04 24
        call    sheet_refresh_local                     ; 37F8 _ E8, FFFFFFFC(rel)
?_172:  add     esp, 48                                 ; 37FD _ 83. C4, 30
        pop     ebx                                     ; 3800 _ 5B
        pop     esi                                     ; 3801 _ 5E
        pop     ebp                                     ; 3802 _ 5D
        ret                                             ; 3803 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 3804 _ 55
        mov     ebp, esp                                ; 3805 _ 89. E5
        push    edi                                     ; 3807 _ 57
        push    esi                                     ; 3808 _ 56
        push    ebx                                     ; 3809 _ 53
        sub     esp, 44                                 ; 380A _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 380D _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3810 _ 8B. 40, 18
        test    eax, eax                                ; 3813 _ 85. C0
        js      ?_173                                   ; 3815 _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 3817 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 381A _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 381D _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 3820 _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 3823 _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 3826 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 3829 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 382C _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 382F _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 3832 _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 3835 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 3838 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 383B _ 8B. 55, 14
        add     ecx, edx                                ; 383E _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 3840 _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 3843 _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 3846 _ 8B. 55, 10
        add     edx, edi                                ; 3849 _ 01. FA
        mov     dword [esp+14H], eax                    ; 384B _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 384F _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3853 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 3857 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 385B _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 385F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3862 _ 89. 04 24
        call    sheet_refresh_local                     ; 3865 _ E8, FFFFFFFC(rel)
?_173:  mov     eax, 0                                  ; 386A _ B8, 00000000
        add     esp, 44                                 ; 386F _ 83. C4, 2C
        pop     ebx                                     ; 3872 _ 5B
        pop     esi                                     ; 3873 _ 5E
        pop     edi                                     ; 3874 _ 5F
        pop     ebp                                     ; 3875 _ 5D
        ret                                             ; 3876 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 3877 _ 55
        mov     ebp, esp                                ; 3878 _ 89. E5
        push    ebx                                     ; 387A _ 53
        sub     esp, 52                                 ; 387B _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 387E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3881 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 3884 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 3887 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 388A _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 388D _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 3890 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3893 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 3896 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3899 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 389C _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 389F _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 38A2 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 38A5 _ 8B. 40, 18
        test    eax, eax                                ; 38A8 _ 85. C0
        js      ?_174                                   ; 38AA _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 38B0 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 38B3 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 38B6 _ 8B. 45, F4
        add     edx, eax                                ; 38B9 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 38BB _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 38BE _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 38C1 _ 8B. 45, F0
        add     eax, ecx                                ; 38C4 _ 01. C8
        mov     dword [esp+14H], 0                      ; 38C6 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 38CE _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 38D2 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 38D6 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 38D9 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 38DD _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 38E0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 38E4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 38E7 _ 89. 04 24
        call    sheet_refresh_map                       ; 38EA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 38EF _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 38F2 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 38F5 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 38F8 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 38FB _ 8B. 55, 14
        add     ecx, edx                                ; 38FE _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 3900 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 3903 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 3906 _ 8B. 55, 10
        add     edx, ebx                                ; 3909 _ 01. DA
        mov     dword [esp+14H], eax                    ; 390B _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 390F _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 3913 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 3917 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 391A _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 391E _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 3921 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3925 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3928 _ 89. 04 24
        call    sheet_refresh_map                       ; 392B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3930 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 3933 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3936 _ 8B. 45, F4
        add     edx, eax                                ; 3939 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 393B _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 393E _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 3941 _ 8B. 45, F0
        add     eax, ecx                                ; 3944 _ 01. C8
        mov     dword [esp+14H], 0                      ; 3946 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 394E _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 3952 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3956 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3959 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 395D _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 3960 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3964 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3967 _ 89. 04 24
        call    sheet_refresh_local                     ; 396A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 396F _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3972 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 3975 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 3978 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 397B _ 8B. 55, 14
        add     ecx, edx                                ; 397E _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 3980 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 3983 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 3986 _ 8B. 55, 10
        add     edx, ebx                                ; 3989 _ 01. DA
        mov     dword [esp+14H], eax                    ; 398B _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 398F _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 3993 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 3997 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 399A _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 399E _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 39A1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 39A5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 39A8 _ 89. 04 24
        call    sheet_refresh_local                     ; 39AB _ E8, FFFFFFFC(rel)
?_174:  add     esp, 52                                 ; 39B0 _ 83. C4, 34
        pop     ebx                                     ; 39B3 _ 5B
        pop     ebp                                     ; 39B4 _ 5D
        ret                                             ; 39B5 _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 39B6 _ 55
        mov     ebp, esp                                ; 39B7 _ 89. E5
        sub     esp, 48                                 ; 39B9 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 39BC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 39BF _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 39C1 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 39C4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 39C7 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 39CA _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 39CD _ 83. 7D, 0C, 00
        jns     ?_175                                   ; 39D1 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 39D3 _ C7. 45, 0C, 00000000
?_175:  cmp     dword [ebp+10H], 0                      ; 39DA _ 83. 7D, 10, 00
        jns     ?_176                                   ; 39DE _ 79, 07
        mov     dword [ebp+10H], 0                      ; 39E0 _ C7. 45, 10, 00000000
?_176:  mov     eax, dword [ebp+8H]                     ; 39E7 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 39EA _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 39ED _ 3B. 45, 14
        jge     ?_177                                   ; 39F0 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 39F2 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 39F5 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 39F8 _ 89. 45, 14
?_177:  mov     eax, dword [ebp+8H]                     ; 39FB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 39FE _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 3A01 _ 3B. 45, 18
        jge     ?_178                                   ; 3A04 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3A06 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3A09 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 3A0C _ 89. 45, 18
?_178:  mov     eax, dword [ebp+1CH]                    ; 3A0F _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 3A12 _ 89. 45, DC
        jmp     ?_185                                   ; 3A15 _ E9, 00000119

?_179:  mov     eax, dword [ebp+8H]                     ; 3A1A _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 3A1D _ 8B. 55, DC
        add     edx, 4                                  ; 3A20 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3A23 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 3A27 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 3A2A _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 3A2D _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 3A2F _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 3A32 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 3A35 _ 8B. 45, 08
        add     eax, 1044                               ; 3A38 _ 05, 00000414
        sub     edx, eax                                ; 3A3D _ 29. C2
        mov     eax, edx                                ; 3A3F _ 89. D0
        sar     eax, 5                                  ; 3A41 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 3A44 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 3A47 _ C7. 45, E4, 00000000
        jmp     ?_184                                   ; 3A4E _ E9, 000000CD

?_180:  mov     eax, dword [ebp-10H]                    ; 3A53 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 3A56 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 3A59 _ 8B. 45, E4
        add     eax, edx                                ; 3A5C _ 01. D0
        mov     dword [ebp-8H], eax                     ; 3A5E _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 3A61 _ C7. 45, E0, 00000000
        jmp     ?_183                                   ; 3A68 _ E9, 000000A0

?_181:  mov     eax, dword [ebp-10H]                    ; 3A6D _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 3A70 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 3A73 _ 8B. 45, E0
        add     eax, edx                                ; 3A76 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 3A78 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 3A7B _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 3A7E _ 3B. 45, FC
        jg      ?_182                                   ; 3A81 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 3A87 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 3A8A _ 3B. 45, 14
        jge     ?_182                                   ; 3A8D _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 3A8F _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 3A92 _ 3B. 45, F8
        jg      ?_182                                   ; 3A95 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 3A97 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 3A9A _ 3B. 45, 18
        jge     ?_182                                   ; 3A9D _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 3A9F _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3AA2 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 3AA5 _ 0F AF. 45, E4
        mov     edx, eax                                ; 3AA9 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 3AAB _ 8B. 45, E0
        add     eax, edx                                ; 3AAE _ 01. D0
        mov     edx, eax                                ; 3AB0 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3AB2 _ 8B. 45, F4
        add     eax, edx                                ; 3AB5 _ 01. D0
        movzx   eax, byte [eax]                         ; 3AB7 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 3ABA _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 3ABD _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 3AC1 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 3AC4 _ 8B. 40, 14
        cmp     edx, eax                                ; 3AC7 _ 39. C2
        jz      ?_182                                   ; 3AC9 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 3ACB _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3ACE _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 3AD1 _ 0F AF. 45, F8
        mov     edx, eax                                ; 3AD5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3AD7 _ 8B. 45, FC
        add     eax, edx                                ; 3ADA _ 01. D0
        mov     edx, eax                                ; 3ADC _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 3ADE _ 8B. 45, EC
        add     eax, edx                                ; 3AE1 _ 01. D0
        movzx   eax, byte [eax]                         ; 3AE3 _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 3AE6 _ 3A. 45, DA
        jnz     ?_182                                   ; 3AE9 _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 3AEB _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3AEE _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 3AF1 _ 0F AF. 45, F8
        mov     edx, eax                                ; 3AF5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3AF7 _ 8B. 45, FC
        add     eax, edx                                ; 3AFA _ 01. D0
        mov     edx, eax                                ; 3AFC _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 3AFE _ 8B. 45, E8
        add     edx, eax                                ; 3B01 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 3B03 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 3B07 _ 88. 02
?_182:  add     dword [ebp-20H], 1                      ; 3B09 _ 83. 45, E0, 01
?_183:  mov     eax, dword [ebp-10H]                    ; 3B0D _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3B10 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 3B13 _ 3B. 45, E0
        jg      ?_181                                   ; 3B16 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 3B1C _ 83. 45, E4, 01
?_184:  mov     eax, dword [ebp-10H]                    ; 3B20 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 3B23 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 3B26 _ 3B. 45, E4
        jg      ?_180                                   ; 3B29 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 3B2F _ 83. 45, DC, 01
?_185:  mov     eax, dword [ebp+8H]                     ; 3B33 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3B36 _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 3B39 _ 3B. 45, DC
        jge     ?_179                                   ; 3B3C _ 0F 8D, FFFFFED8
        leave                                           ; 3B42 _ C9
        ret                                             ; 3B43 _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 3B44 _ 55
        mov     ebp, esp                                ; 3B45 _ 89. E5
        sub     esp, 64                                 ; 3B47 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 3B4A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3B4D _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 3B4F _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 3B52 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3B55 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 3B58 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 3B5B _ 83. 7D, 0C, 00
        jns     ?_186                                   ; 3B5F _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 3B61 _ C7. 45, 0C, 00000000
?_186:  cmp     dword [ebp+10H], 0                      ; 3B68 _ 83. 7D, 10, 00
        jns     ?_187                                   ; 3B6C _ 79, 07
        mov     dword [ebp+10H], 0                      ; 3B6E _ C7. 45, 10, 00000000
?_187:  mov     eax, dword [ebp+8H]                     ; 3B75 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3B78 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 3B7B _ 3B. 45, 14
        jge     ?_188                                   ; 3B7E _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3B80 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3B83 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 3B86 _ 89. 45, 14
?_188:  mov     eax, dword [ebp+8H]                     ; 3B89 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3B8C _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 3B8F _ 3B. 45, 18
        jge     ?_189                                   ; 3B92 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3B94 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3B97 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 3B9A _ 89. 45, 18
?_189:  mov     eax, dword [ebp+1CH]                    ; 3B9D _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 3BA0 _ 89. 45, CC
        jmp     ?_200                                   ; 3BA3 _ E9, 00000141

?_190:  mov     eax, dword [ebp+8H]                     ; 3BA8 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 3BAB _ 8B. 55, CC
        add     edx, 4                                  ; 3BAE _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3BB1 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 3BB5 _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 3BB8 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 3BBB _ 8B. 45, 08
        add     eax, 1044                               ; 3BBE _ 05, 00000414
        sub     edx, eax                                ; 3BC3 _ 29. C2
        mov     eax, edx                                ; 3BC5 _ 89. D0
        sar     eax, 5                                  ; 3BC7 _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 3BCA _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 3BCD _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 3BD0 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 3BD2 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 3BD5 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 3BD8 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 3BDB _ 8B. 55, 0C
        sub     edx, eax                                ; 3BDE _ 29. C2
        mov     eax, edx                                ; 3BE0 _ 89. D0
        mov     dword [ebp-30H], eax                    ; 3BE2 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 3BE5 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 3BE8 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 3BEB _ 8B. 55, 10
        sub     edx, eax                                ; 3BEE _ 29. C2
        mov     eax, edx                                ; 3BF0 _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 3BF2 _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 3BF5 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 3BF8 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 3BFB _ 8B. 55, 14
        sub     edx, eax                                ; 3BFE _ 29. C2
        mov     eax, edx                                ; 3C00 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 3C02 _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 3C05 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 3C08 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 3C0B _ 8B. 55, 18
        sub     edx, eax                                ; 3C0E _ 29. C2
        mov     eax, edx                                ; 3C10 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 3C12 _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 3C15 _ 83. 7D, D0, 00
        jns     ?_191                                   ; 3C19 _ 79, 07
        mov     dword [ebp-30H], 0                      ; 3C1B _ C7. 45, D0, 00000000
?_191:  cmp     dword [ebp-2CH], 0                      ; 3C22 _ 83. 7D, D4, 00
        jns     ?_192                                   ; 3C26 _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 3C28 _ C7. 45, D4, 00000000
?_192:  mov     eax, dword [ebp-10H]                    ; 3C2F _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3C32 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 3C35 _ 3B. 45, D8
        jge     ?_193                                   ; 3C38 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 3C3A _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3C3D _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 3C40 _ 89. 45, D8
?_193:  mov     eax, dword [ebp-10H]                    ; 3C43 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 3C46 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 3C49 _ 3B. 45, DC
        jge     ?_194                                   ; 3C4C _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 3C4E _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 3C51 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 3C54 _ 89. 45, DC
?_194:  mov     eax, dword [ebp-2CH]                    ; 3C57 _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 3C5A _ 89. 45, E4
        jmp     ?_199                                   ; 3C5D _ EB, 7A

?_195:  mov     eax, dword [ebp-10H]                    ; 3C5F _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 3C62 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 3C65 _ 8B. 45, E4
        add     eax, edx                                ; 3C68 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 3C6A _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 3C6D _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 3C70 _ 89. 45, E0
        jmp     ?_198                                   ; 3C73 _ EB, 58

?_196:  mov     eax, dword [ebp-10H]                    ; 3C75 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 3C78 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 3C7B _ 8B. 45, E0
        add     eax, edx                                ; 3C7E _ 01. D0
        mov     dword [ebp-4H], eax                     ; 3C80 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 3C83 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3C86 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 3C89 _ 0F AF. 45, E4
        mov     edx, eax                                ; 3C8D _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 3C8F _ 8B. 45, E0
        add     eax, edx                                ; 3C92 _ 01. D0
        mov     edx, eax                                ; 3C94 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3C96 _ 8B. 45, F4
        add     eax, edx                                ; 3C99 _ 01. D0
        movzx   eax, byte [eax]                         ; 3C9B _ 0F B6. 00
        movzx   edx, al                                 ; 3C9E _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 3CA1 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 3CA4 _ 8B. 40, 14
        cmp     edx, eax                                ; 3CA7 _ 39. C2
        jz      ?_197                                   ; 3CA9 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 3CAB _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3CAE _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 3CB1 _ 0F AF. 45, F8
        mov     edx, eax                                ; 3CB5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3CB7 _ 8B. 45, FC
        add     eax, edx                                ; 3CBA _ 01. D0
        mov     edx, eax                                ; 3CBC _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 3CBE _ 8B. 45, EC
        add     edx, eax                                ; 3CC1 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 3CC3 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 3CC7 _ 88. 02
?_197:  add     dword [ebp-20H], 1                      ; 3CC9 _ 83. 45, E0, 01
?_198:  mov     eax, dword [ebp-20H]                    ; 3CCD _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 3CD0 _ 3B. 45, D8
        jl      ?_196                                   ; 3CD3 _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 3CD5 _ 83. 45, E4, 01
?_199:  mov     eax, dword [ebp-1CH]                    ; 3CD9 _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 3CDC _ 3B. 45, DC
        jl      ?_195                                   ; 3CDF _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 3CE5 _ 83. 45, CC, 01
?_200:  mov     eax, dword [ebp+8H]                     ; 3CE9 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3CEC _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 3CEF _ 3B. 45, CC
        jge     ?_190                                   ; 3CF2 _ 0F 8D, FFFFFEB0
        leave                                           ; 3CF8 _ C9
        ret                                             ; 3CF9 _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 3CFA _ 55
        mov     ebp, esp                                ; 3CFB _ 89. E5
        sub     esp, 40                                 ; 3CFD _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 3D00 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 3D08 _ C7. 04 24, 00000043
        call    io_out8                                 ; 3D0F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 3D14 _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 3D1C _ C7. 04 24, 00000040
        call    io_out8                                 ; 3D23 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 3D28 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 3D30 _ C7. 04 24, 00000040
        call    io_out8                                 ; 3D37 _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 3D3C _ C7. 05, 00000300(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 3D46 _ C7. 45, F4, 00000000
        jmp     ?_202                                   ; 3D4D _ EB, 28

?_201:  mov     eax, dword [ebp-0CH]                    ; 3D4F _ 8B. 45, F4
        shl     eax, 4                                  ; 3D52 _ C1. E0, 04
        add     eax, timer_control                      ; 3D55 _ 05, 00000300(d)
        mov     dword [eax+8H], 0                       ; 3D5A _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 3D61 _ 8B. 45, F4
        shl     eax, 4                                  ; 3D64 _ C1. E0, 04
        add     eax, timer_control                      ; 3D67 _ 05, 00000300(d)
        mov     dword [eax+0CH], 0                      ; 3D6C _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 3D73 _ 83. 45, F4, 01
?_202:  cmp     dword [ebp-0CH], 499                    ; 3D77 _ 81. 7D, F4, 000001F3
        jle     ?_201                                   ; 3D7E _ 7E, CF
        leave                                           ; 3D80 _ C9
        ret                                             ; 3D81 _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 3D82 _ 55
        mov     ebp, esp                                ; 3D83 _ 89. E5
        mov     eax, timer_control                      ; 3D85 _ B8, 00000300(d)
        pop     ebp                                     ; 3D8A _ 5D
        ret                                             ; 3D8B _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 3D8C _ 55
        mov     ebp, esp                                ; 3D8D _ 89. E5
        sub     esp, 16                                 ; 3D8F _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3D92 _ C7. 45, FC, 00000000
        jmp     ?_205                                   ; 3D99 _ EB, 26

?_203:  mov     eax, dword [ebp-4H]                     ; 3D9B _ 8B. 45, FC
        shl     eax, 4                                  ; 3D9E _ C1. E0, 04
        add     eax, timer_control                      ; 3DA1 _ 05, 00000300(d)
        mov     eax, dword [eax+8H]                     ; 3DA6 _ 8B. 40, 08
        test    eax, eax                                ; 3DA9 _ 85. C0
        jnz     ?_204                                   ; 3DAB _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 3DAD _ 8B. 45, FC
        shl     eax, 4                                  ; 3DB0 _ C1. E0, 04
        add     eax, timer_control                      ; 3DB3 _ 05, 00000300(d)
        add     eax, 4                                  ; 3DB8 _ 83. C0, 04
        jmp     ?_206                                   ; 3DBB _ EB, 0D

?_204:  add     dword [ebp-4H], 1                       ; 3DBD _ 83. 45, FC, 01
?_205:  cmp     dword [ebp-4H], 499                     ; 3DC1 _ 81. 7D, FC, 000001F3
        jle     ?_203                                   ; 3DC8 _ 7E, D1
?_206:  leave                                           ; 3DCA _ C9
        ret                                             ; 3DCB _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 3DCC _ 55
        mov     ebp, esp                                ; 3DCD _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3DCF _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3DD2 _ C7. 40, 04, 00000000
        pop     ebp                                     ; 3DD9 _ 5D
        ret                                             ; 3DDA _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 3DDB _ 55
        mov     ebp, esp                                ; 3DDC _ 89. E5
        sub     esp, 4                                  ; 3DDE _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 3DE1 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 3DE4 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3DE7 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3DEA _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 3DED _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3DF0 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3DF3 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 3DF7 _ 88. 50, 0C
        leave                                           ; 3DFA _ C9
        ret                                             ; 3DFB _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 3DFC _ 55
        mov     ebp, esp                                ; 3DFD _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3DFF _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3E02 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3E05 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3E07 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 3E0A _ C7. 40, 04, 00000002
        pop     ebp                                     ; 3E11 _ 5D
        ret                                             ; 3E12 _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 3E13 _ 55
        mov     ebp, esp                                ; 3E14 _ 89. E5
        sub     esp, 40                                 ; 3E16 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 3E19 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 3E21 _ C7. 04 24, 00000020
        call    io_out8                                 ; 3E28 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 3E2D _ A1, 00000300(d)
        add     eax, 1                                  ; 3E32 _ 83. C0, 01
        mov     dword [timer_control], eax              ; 3E35 _ A3, 00000300(d)
        mov     byte [ebp-0DH], 0                       ; 3E3A _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 3E3E _ C7. 45, F4, 00000000
        jmp     ?_210                                   ; 3E45 _ E9, 000000B0

?_207:  mov     eax, dword [ebp-0CH]                    ; 3E4A _ 8B. 45, F4
        shl     eax, 4                                  ; 3E4D _ C1. E0, 04
        add     eax, timer_control                      ; 3E50 _ 05, 00000300(d)
        mov     eax, dword [eax+8H]                     ; 3E55 _ 8B. 40, 08
        cmp     eax, 2                                  ; 3E58 _ 83. F8, 02
        jne     ?_208                                   ; 3E5B _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 3E61 _ 8B. 45, F4
        shl     eax, 4                                  ; 3E64 _ C1. E0, 04
        add     eax, timer_control                      ; 3E67 _ 05, 00000300(d)
        mov     eax, dword [eax+4H]                     ; 3E6C _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 3E6F _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 3E72 _ 8B. 45, F4
        shl     eax, 4                                  ; 3E75 _ C1. E0, 04
        add     eax, timer_control                      ; 3E78 _ 05, 00000300(d)
        mov     dword [eax+4H], edx                     ; 3E7D _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3E80 _ 8B. 45, F4
        shl     eax, 4                                  ; 3E83 _ C1. E0, 04
        add     eax, timer_control                      ; 3E86 _ 05, 00000300(d)
        mov     eax, dword [eax+4H]                     ; 3E8B _ 8B. 40, 04
        test    eax, eax                                ; 3E8E _ 85. C0
        jnz     ?_208                                   ; 3E90 _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 3E92 _ 8B. 45, F4
        shl     eax, 4                                  ; 3E95 _ C1. E0, 04
        add     eax, timer_control                      ; 3E98 _ 05, 00000300(d)
        mov     dword [eax+8H], 1                       ; 3E9D _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 3EA4 _ 8B. 45, F4
        shl     eax, 4                                  ; 3EA7 _ C1. E0, 04
        add     eax, timer_control                      ; 3EAA _ 05, 00000300(d)
        movzx   eax, byte [eax+10H]                     ; 3EAF _ 0F B6. 40, 10
        movzx   edx, al                                 ; 3EB3 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 3EB6 _ 8B. 45, F4
        shl     eax, 4                                  ; 3EB9 _ C1. E0, 04
        add     eax, timer_control                      ; 3EBC _ 05, 00000300(d)
        mov     eax, dword [eax+0CH]                    ; 3EC1 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 3EC4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3EC8 _ 89. 04 24
        call    fifo8_put                               ; 3ECB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3ED0 _ 8B. 45, F4
        shl     eax, 4                                  ; 3ED3 _ C1. E0, 04
        add     eax, timer_control                      ; 3ED6 _ 05, 00000300(d)
        lea     edx, [eax+4H]                           ; 3EDB _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 3EDE _ A1, 00000000(d)
        cmp     edx, eax                                ; 3EE3 _ 39. C2
        jnz     ?_208                                   ; 3EE5 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 3EE7 _ C6. 45, F3, 01
?_208:  cmp     byte [ebp-0DH], 0                       ; 3EEB _ 80. 7D, F3, 00
        jz      ?_209                                   ; 3EEF _ 74, 05
        call    task_switch                             ; 3EF1 _ E8, FFFFFFFC(rel)
?_209:  add     dword [ebp-0CH], 1                      ; 3EF6 _ 83. 45, F4, 01
?_210:  cmp     dword [ebp-0CH], 499                    ; 3EFA _ 81. 7D, F4, 000001F3
        jle     ?_207                                   ; 3F01 _ 0F 8E, FFFFFF43
        leave                                           ; 3F07 _ C9
        ret                                             ; 3F08 _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 3F09 _ 55
        mov     ebp, esp                                ; 3F0A _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 3F0C _ 81. 7D, 0C, 000FFFFF
        jbe     ?_211                                   ; 3F13 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 3F15 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 3F1C _ 8B. 45, 0C
        shr     eax, 12                                 ; 3F1F _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 3F22 _ 89. 45, 0C
?_211:  mov     eax, dword [ebp+0CH]                    ; 3F25 _ 8B. 45, 0C
        mov     edx, eax                                ; 3F28 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3F2A _ 8B. 45, 08
        mov     word [eax], dx                          ; 3F2D _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 3F30 _ 8B. 45, 10
        mov     edx, eax                                ; 3F33 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3F35 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 3F38 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 3F3C _ 8B. 45, 10
        sar     eax, 16                                 ; 3F3F _ C1. F8, 10
        mov     edx, eax                                ; 3F42 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3F44 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 3F47 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 3F4A _ 8B. 45, 14
        mov     edx, eax                                ; 3F4D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3F4F _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 3F52 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 3F55 _ 8B. 45, 0C
        shr     eax, 16                                 ; 3F58 _ C1. E8, 10
        and     eax, 0FH                                ; 3F5B _ 83. E0, 0F
        mov     edx, eax                                ; 3F5E _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 3F60 _ 8B. 45, 14
        sar     eax, 8                                  ; 3F63 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 3F66 _ 83. E0, F0
        or      eax, edx                                ; 3F69 _ 09. D0
        mov     edx, eax                                ; 3F6B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3F6D _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 3F70 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 3F73 _ 8B. 45, 10
        shr     eax, 24                                 ; 3F76 _ C1. E8, 18
        mov     edx, eax                                ; 3F79 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3F7B _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 3F7E _ 88. 50, 07
        pop     ebp                                     ; 3F81 _ 5D
        ret                                             ; 3F82 _ C3
; segment_descriptor End of function

init_task_level:; Function begin
        push    ebp                                     ; 3F83 _ 55
        mov     ebp, esp                                ; 3F84 _ 89. E5
        sub     esp, 16                                 ; 3F86 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 3F89 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp+8H]                     ; 3F8F _ 8B. 55, 08
        mov     eax, edx                                ; 3F92 _ 89. D0
        shl     eax, 2                                  ; 3F94 _ C1. E0, 02
        add     eax, edx                                ; 3F97 _ 01. D0
        shl     eax, 2                                  ; 3F99 _ C1. E0, 02
        add     eax, ecx                                ; 3F9C _ 01. C8
        add     eax, 8                                  ; 3F9E _ 83. C0, 08
        mov     dword [eax], 0                          ; 3FA1 _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 3FA7 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp+8H]                     ; 3FAD _ 8B. 55, 08
        mov     eax, edx                                ; 3FB0 _ 89. D0
        shl     eax, 2                                  ; 3FB2 _ C1. E0, 02
        add     eax, edx                                ; 3FB5 _ 01. D0
        shl     eax, 2                                  ; 3FB7 _ C1. E0, 02
        add     eax, ecx                                ; 3FBA _ 01. C8
        add     eax, 12                                 ; 3FBC _ 83. C0, 0C
        mov     dword [eax], 0                          ; 3FBF _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 3FC5 _ C7. 45, FC, 00000000
        jmp     ?_213                                   ; 3FCC _ EB, 21

?_212:  mov     ecx, dword [task_control]               ; 3FCE _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 3FD4 _ 8B. 55, FC
        mov     eax, edx                                ; 3FD7 _ 89. D0
        add     eax, eax                                ; 3FD9 _ 01. C0
        add     eax, edx                                ; 3FDB _ 01. D0
        shl     eax, 3                                  ; 3FDD _ C1. E0, 03
        add     eax, ecx                                ; 3FE0 _ 01. C8
        add     eax, 16                                 ; 3FE2 _ 83. C0, 10
        mov     dword [eax], 0                          ; 3FE5 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 3FEB _ 83. 45, FC, 01
?_213:  cmp     dword [ebp-4H], 2                       ; 3FEF _ 83. 7D, FC, 02
        jle     ?_212                                   ; 3FF3 _ 7E, D9
        leave                                           ; 3FF5 _ C9
        ret                                             ; 3FF6 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 3FF7 _ 55
        mov     ebp, esp                                ; 3FF8 _ 89. E5
        sub     esp, 40                                 ; 3FFA _ 83. EC, 28
        call    get_addr_gdt                            ; 3FFD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 4002 _ 89. 45, F0
        mov     dword [esp+4H], 668                     ; 4005 _ C7. 44 24, 04, 0000029C
        mov     eax, dword [ebp+8H]                     ; 400D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4010 _ 89. 04 24
        call    memman_alloc_4k                         ; 4013 _ E8, FFFFFFFC(rel)
        mov     dword [task_control], eax               ; 4018 _ A3, 00002248(d)
        mov     dword [ebp-14H], 0                      ; 401D _ C7. 45, EC, 00000000
        jmp     ?_215                                   ; 4024 _ E9, 00000085

?_214:  mov     edx, dword [task_control]               ; 4029 _ 8B. 15, 00002248(d)
        mov     eax, dword [ebp-14H]                    ; 402F _ 8B. 45, EC
        imul    eax, eax, 148                           ; 4032 _ 69. C0, 00000094
        add     eax, edx                                ; 4038 _ 01. D0
        add     eax, 72                                 ; 403A _ 83. C0, 48
        mov     dword [eax], 0                          ; 403D _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 4043 _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp-14H]                    ; 4049 _ 8B. 45, EC
        add     eax, 8                                  ; 404C _ 83. C0, 08
        lea     edx, [eax*8]                            ; 404F _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 4056 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 4059 _ 69. C0, 00000094
        add     eax, ecx                                ; 405F _ 01. C8
        add     eax, 68                                 ; 4061 _ 83. C0, 44
        mov     dword [eax], edx                        ; 4064 _ 89. 10
        mov     eax, dword [task_control]               ; 4066 _ A1, 00002248(d)
        mov     edx, dword [ebp-14H]                    ; 406B _ 8B. 55, EC
        imul    edx, edx, 148                           ; 406E _ 69. D2, 00000094
        add     edx, 96                                 ; 4074 _ 83. C2, 60
        add     eax, edx                                ; 4077 _ 01. D0
        add     eax, 16                                 ; 4079 _ 83. C0, 10
        mov     edx, dword [ebp-14H]                    ; 407C _ 8B. 55, EC
        add     edx, 8                                  ; 407F _ 83. C2, 08
        lea     ecx, [edx*8]                            ; 4082 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 4089 _ 8B. 55, F0
        add     edx, ecx                                ; 408C _ 01. CA
        mov     dword [esp+0CH], 137                    ; 408E _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 4096 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 409A _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 40A2 _ 89. 14 24
        call    segment_descriptor                      ; 40A5 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 40AA _ 83. 45, EC, 01
?_215:  cmp     dword [ebp-14H], 4                      ; 40AE _ 83. 7D, EC, 04
        jle     ?_214                                   ; 40B2 _ 0F 8E, FFFFFF71
        mov     dword [ebp-14H], 0                      ; 40B8 _ C7. 45, EC, 00000000
        jmp     ?_217                                   ; 40BF _ EB, 0F

?_216:  mov     eax, dword [ebp-14H]                    ; 40C1 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 40C4 _ 89. 04 24
        call    init_task_level                         ; 40C7 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 40CC _ 83. 45, EC, 01
?_217:  cmp     dword [ebp-14H], 2                      ; 40D0 _ 83. 7D, EC, 02
        jle     ?_216                                   ; 40D4 _ 7E, EB
        call    task_alloc                              ; 40D6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 40DB _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 40DE _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 40E1 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 40E8 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 40EB _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 40F2 _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 40F5 _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 40FC _ 8B. 45, F4
        mov     dword [esp], eax                        ; 40FF _ 89. 04 24
        call    task_add                                ; 4102 _ E8, FFFFFFFC(rel)
        call    task_switch_sub                         ; 4107 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 410C _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 410F _ 8B. 00
        mov     dword [esp], eax                        ; 4111 _ 89. 04 24
        call    load_tr                                 ; 4114 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 4119 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 411E _ A3, 00002244(d)
        mov     eax, dword [ebp-0CH]                    ; 4123 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 4126 _ 8B. 40, 08
        mov     edx, eax                                ; 4129 _ 89. C2
        mov     eax, dword [task_timer]                 ; 412B _ A1, 00002244(d)
        mov     dword [esp+4H], edx                     ; 4130 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4134 _ 89. 04 24
        call    timer_settime                           ; 4137 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 413C _ 8B. 45, F4
        leave                                           ; 413F _ C9
        ret                                             ; 4140 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 4141 _ 55
        mov     ebp, esp                                ; 4142 _ 89. E5
        sub     esp, 16                                 ; 4144 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 4147 _ C7. 45, F8, 00000000
        jmp     ?_220                                   ; 414E _ E9, 000000F6

?_218:  mov     edx, dword [task_control]               ; 4153 _ 8B. 15, 00002248(d)
        mov     eax, dword [ebp-8H]                     ; 4159 _ 8B. 45, F8
        imul    eax, eax, 148                           ; 415C _ 69. C0, 00000094
        add     eax, edx                                ; 4162 _ 01. D0
        add     eax, 72                                 ; 4164 _ 83. C0, 48
        mov     eax, dword [eax]                        ; 4167 _ 8B. 00
        test    eax, eax                                ; 4169 _ 85. C0
        jne     ?_219                                   ; 416B _ 0F 85, 000000D4
        mov     eax, dword [task_control]               ; 4171 _ A1, 00002248(d)
        mov     edx, dword [ebp-8H]                     ; 4176 _ 8B. 55, F8
        imul    edx, edx, 148                           ; 4179 _ 69. D2, 00000094
        add     edx, 64                                 ; 417F _ 83. C2, 40
        add     eax, edx                                ; 4182 _ 01. D0
        add     eax, 4                                  ; 4184 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 4187 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 418A _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 418D _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 4194 _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 4197 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 419E _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 41A1 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 41A8 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 41AB _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 41B2 _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 41B5 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 41BC _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 41BF _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-8H]                     ; 41C6 _ 8B. 45, F8
        add     eax, 1                                  ; 41C9 _ 83. C0, 01
        shl     eax, 9                                  ; 41CC _ C1. E0, 09
        mov     edx, eax                                ; 41CF _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 41D1 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 41D4 _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 41D7 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 41DA _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-4H]                     ; 41E1 _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 41E4 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 41EB _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 41EE _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 41F5 _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 41F8 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 41FF _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 4202 _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 420C _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 420F _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 4219 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 421C _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 4226 _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 4229 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4233 _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 4236 _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 4240 _ 8B. 45, FC
        jmp     ?_221                                   ; 4243 _ EB, 13

?_219:  add     dword [ebp-8H], 1                       ; 4245 _ 83. 45, F8, 01
?_220:  cmp     dword [ebp-8H], 4                       ; 4249 _ 83. 7D, F8, 04
        jle     ?_218                                   ; 424D _ 0F 8E, FFFFFF00
        mov     eax, 0                                  ; 4253 _ B8, 00000000
?_221:  leave                                           ; 4258 _ C9
        ret                                             ; 4259 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 425A _ 55
        mov     ebp, esp                                ; 425B _ 89. E5
        sub     esp, 24                                 ; 425D _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 4260 _ 83. 7D, 0C, 00
        jns     ?_222                                   ; 4264 _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 4266 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4269 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 426C _ 89. 45, 0C
?_222:  cmp     dword [ebp+10H], 0                      ; 426F _ 83. 7D, 10, 00
        jle     ?_223                                   ; 4273 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 4275 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 4278 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 427B _ 89. 50, 08
?_223:  mov     eax, dword [ebp+8H]                     ; 427E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4281 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4284 _ 83. F8, 02
        jnz     ?_224                                   ; 4287 _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 4289 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 428C _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 428F _ 3B. 45, 0C
        jz      ?_224                                   ; 4292 _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 4294 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4297 _ 89. 04 24
        call    task_remove                             ; 429A _ E8, FFFFFFFC(rel)
?_224:  mov     eax, dword [ebp+8H]                     ; 429F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 42A2 _ 8B. 40, 04
        cmp     eax, 2                                  ; 42A5 _ 83. F8, 02
        jz      ?_225                                   ; 42A8 _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 42AA _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 42AD _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 42B0 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 42B3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 42B6 _ 89. 04 24
        call    task_add                                ; 42B9 _ E8, FFFFFFFC(rel)
?_225:  mov     eax, dword [task_control]               ; 42BE _ A1, 00002248(d)
        mov     dword [eax+4H], 1                       ; 42C3 _ C7. 40, 04, 00000001
        leave                                           ; 42CA _ C9
        ret                                             ; 42CB _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 42CC _ 55
        mov     ebp, esp                                ; 42CD _ 89. E5
        sub     esp, 40                                 ; 42CF _ 83. EC, 28
        mov     ecx, dword [task_control]               ; 42D2 _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 42D8 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 42DD _ 8B. 10
        mov     eax, edx                                ; 42DF _ 89. D0
        shl     eax, 2                                  ; 42E1 _ C1. E0, 02
        add     eax, edx                                ; 42E4 _ 01. D0
        shl     eax, 2                                  ; 42E6 _ C1. E0, 02
        add     eax, ecx                                ; 42E9 _ 01. C8
        add     eax, 8                                  ; 42EB _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 42EE _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 42F1 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 42F4 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 42F7 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 42FA _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 42FE _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 4301 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 4304 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 4307 _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 430A _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 430D _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4310 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4313 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4316 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 4319 _ 8B. 00
        cmp     edx, eax                                ; 431B _ 39. C2
        jnz     ?_226                                   ; 431D _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 431F _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 4322 _ C7. 40, 04, 00000000
?_226:  mov     eax, dword [task_control]               ; 4329 _ A1, 00002248(d)
        mov     eax, dword [eax+4H]                     ; 432E _ 8B. 40, 04
        test    eax, eax                                ; 4331 _ 85. C0
        jz      ?_227                                   ; 4333 _ 74, 24
        call    task_switch_sub                         ; 4335 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [task_control]               ; 433A _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4340 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4345 _ 8B. 10
        mov     eax, edx                                ; 4347 _ 89. D0
        shl     eax, 2                                  ; 4349 _ C1. E0, 02
        add     eax, edx                                ; 434C _ 01. D0
        shl     eax, 2                                  ; 434E _ C1. E0, 02
        add     eax, ecx                                ; 4351 _ 01. C8
        add     eax, 8                                  ; 4353 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4356 _ 89. 45, EC
?_227:  mov     eax, dword [ebp-14H]                    ; 4359 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 435C _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 435F _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4362 _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 4366 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4369 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 436C _ 8B. 40, 08
        mov     edx, eax                                ; 436F _ 89. C2
        mov     eax, dword [task_timer]                 ; 4371 _ A1, 00002244(d)
        mov     dword [esp+4H], edx                     ; 4376 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 437A _ 89. 04 24
        call    timer_settime                           ; 437D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4382 _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 4385 _ 3B. 45, F0
        jz      ?_228                                   ; 4388 _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 438A _ 83. 7D, F4, 00
        jz      ?_228                                   ; 438E _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4390 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4393 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4395 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4399 _ C7. 04 24, 00000000
        call    farjmp                                  ; 43A0 _ E8, FFFFFFFC(rel)
?_228:  leave                                           ; 43A5 _ C9
        ret                                             ; 43A6 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 43A7 _ 55
        mov     ebp, esp                                ; 43A8 _ 89. E5
        sub     esp, 40                                 ; 43AA _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 43AD _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 43B4 _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 43BB _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 43BE _ 8B. 40, 04
        cmp     eax, 2                                  ; 43C1 _ 83. F8, 02
        jnz     ?_229                                   ; 43C4 _ 75, 51
        call    task_now                                ; 43C6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 43CB _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 43CE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 43D1 _ 89. 04 24
        call    task_remove                             ; 43D4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 43D9 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 43E0 _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 43E3 _ 3B. 45, F4
        jnz     ?_229                                   ; 43E6 _ 75, 2F
        call    task_switch_sub                         ; 43E8 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 43ED _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 43F2 _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 43F5 _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 43FC _ 83. 7D, F4, 00
        jz      ?_229                                   ; 4400 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4402 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4405 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4407 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 440B _ C7. 04 24, 00000000
        call    farjmp                                  ; 4412 _ E8, FFFFFFFC(rel)
?_229:  mov     eax, dword [ebp-10H]                    ; 4417 _ 8B. 45, F0
        leave                                           ; 441A _ C9
        ret                                             ; 441B _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 441C _ 55
        mov     ebp, esp                                ; 441D _ 89. E5
        sub     esp, 16                                 ; 441F _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4422 _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4428 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 442D _ 8B. 10
        mov     eax, edx                                ; 442F _ 89. D0
        shl     eax, 2                                  ; 4431 _ C1. E0, 02
        add     eax, edx                                ; 4434 _ 01. D0
        shl     eax, 2                                  ; 4436 _ C1. E0, 02
        add     eax, ecx                                ; 4439 _ 01. C8
        add     eax, 8                                  ; 443B _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 443E _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4441 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4444 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4447 _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 444A _ 8B. 44 90, 08
        leave                                           ; 444E _ C9
        ret                                             ; 444F _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 4450 _ 55
        mov     ebp, esp                                ; 4451 _ 89. E5
        sub     esp, 16                                 ; 4453 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4456 _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp+8H]                     ; 445C _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 445F _ 8B. 50, 0C
        mov     eax, edx                                ; 4462 _ 89. D0
        shl     eax, 2                                  ; 4464 _ C1. E0, 02
        add     eax, edx                                ; 4467 _ 01. D0
        shl     eax, 2                                  ; 4469 _ C1. E0, 02
        add     eax, ecx                                ; 446C _ 01. C8
        add     eax, 8                                  ; 446E _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4471 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4474 _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 4477 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 4479 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 447C _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 447F _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4483 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4486 _ 8B. 00
        lea     edx, [eax+1H]                           ; 4488 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 448B _ 8B. 45, FC
        mov     dword [eax], edx                        ; 448E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4490 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4493 _ C7. 40, 04, 00000002
        leave                                           ; 449A _ C9
        ret                                             ; 449B _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 449C _ 55
        mov     ebp, esp                                ; 449D _ 89. E5
        sub     esp, 16                                 ; 449F _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 44A2 _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp+8H]                     ; 44A8 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 44AB _ 8B. 50, 0C
        mov     eax, edx                                ; 44AE _ 89. D0
        shl     eax, 2                                  ; 44B0 _ C1. E0, 02
        add     eax, edx                                ; 44B3 _ 01. D0
        shl     eax, 2                                  ; 44B5 _ C1. E0, 02
        add     eax, ecx                                ; 44B8 _ 01. C8
        add     eax, 8                                  ; 44BA _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 44BD _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 44C0 _ C7. 45, F8, 00000000
        jmp     ?_232                                   ; 44C7 _ EB, 23

?_230:  mov     eax, dword [ebp-4H]                     ; 44C9 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 44CC _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 44CF _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 44D3 _ 3B. 45, 08
        jnz     ?_231                                   ; 44D6 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 44D8 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 44DB _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 44DE _ C7. 44 90, 08, 00000000
        jmp     ?_233                                   ; 44E6 _ EB, 0E

?_231:  add     dword [ebp-8H], 1                       ; 44E8 _ 83. 45, F8, 01
?_232:  mov     eax, dword [ebp-4H]                     ; 44EC _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 44EF _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 44F1 _ 3B. 45, F8
        jg      ?_230                                   ; 44F4 _ 7F, D3
?_233:  mov     eax, dword [ebp-4H]                     ; 44F6 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 44F9 _ 8B. 00
        lea     edx, [eax-1H]                           ; 44FB _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 44FE _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4501 _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 4503 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4506 _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 4509 _ 3B. 45, F8
        jle     ?_234                                   ; 450C _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 450E _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4511 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 4514 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4517 _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 451A _ 89. 50, 04
?_234:  mov     eax, dword [ebp-4H]                     ; 451D _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4520 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4523 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4526 _ 8B. 00
        cmp     edx, eax                                ; 4528 _ 39. C2
        jl      ?_235                                   ; 452A _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 452C _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 452F _ C7. 40, 04, 00000000
?_235:  mov     eax, dword [ebp+8H]                     ; 4536 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 4539 _ C7. 40, 04, 00000001
        jmp     ?_237                                   ; 4540 _ EB, 1B

?_236:  mov     eax, dword [ebp-8H]                     ; 4542 _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 4545 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4548 _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 454B _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 454F _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4552 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 4555 _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 4559 _ 83. 45, F8, 01
?_237:  mov     eax, dword [ebp-4H]                     ; 455D _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4560 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4562 _ 3B. 45, F8
        jg      ?_236                                   ; 4565 _ 7F, DB
        leave                                           ; 4567 _ C9
        ret                                             ; 4568 _ C3
; task_remove End of function

task_switch_sub:; Function begin
        push    ebp                                     ; 4569 _ 55
        mov     ebp, esp                                ; 456A _ 89. E5
        sub     esp, 16                                 ; 456C _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 456F _ C7. 45, FC, 00000000
        jmp     ?_240                                   ; 4576 _ EB, 24

?_238:  mov     ecx, dword [task_control]               ; 4578 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 457E _ 8B. 55, FC
        mov     eax, edx                                ; 4581 _ 89. D0
        shl     eax, 2                                  ; 4583 _ C1. E0, 02
        add     eax, edx                                ; 4586 _ 01. D0
        shl     eax, 2                                  ; 4588 _ C1. E0, 02
        add     eax, ecx                                ; 458B _ 01. C8
        add     eax, 8                                  ; 458D _ 83. C0, 08
        mov     eax, dword [eax]                        ; 4590 _ 8B. 00
        test    eax, eax                                ; 4592 _ 85. C0
        jle     ?_239                                   ; 4594 _ 7E, 02
        jmp     ?_241                                   ; 4596 _ EB, 0A

?_239:  add     dword [ebp-4H], 1                       ; 4598 _ 83. 45, FC, 01
?_240:  cmp     dword [ebp-4H], 2                       ; 459C _ 83. 7D, FC, 02
        jle     ?_238                                   ; 45A0 _ 7E, D6
?_241:  mov     eax, dword [task_control]               ; 45A2 _ A1, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 45A7 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 45AA _ 89. 10
        mov     eax, dword [task_control]               ; 45AC _ A1, 00002248(d)
        mov     dword [eax+4H], 0                       ; 45B1 _ C7. 40, 04, 00000000
        leave                                           ; 45B8 _ C9
        ret                                             ; 45B9 _ C3
; task_switch_sub End of function

task_send_message:; Function begin
        push    ebp                                     ; 45BA _ 55
        mov     ebp, esp                                ; 45BB _ 89. E5
        sub     esp, 24                                 ; 45BD _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 45C0 _ 8B. 45, 10
        movzx   eax, al                                 ; 45C3 _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 45C6 _ 8B. 55, 0C
        add     edx, 16                                 ; 45C9 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 45CC _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 45D0 _ 89. 14 24
        call    fifo8_put                               ; 45D3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 45D8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 45DB _ 89. 04 24
        call    task_sleep                              ; 45DE _ E8, FFFFFFFC(rel)
        leave                                           ; 45E3 _ C9
        ret                                             ; 45E4 _ C3
; task_send_message End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_242:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_243:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0007 _ console.

?_244:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 000F _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0017 _ sk b.

?_245:                                                  ; byte
        db 42H, 00H                                     ; 001C _ B.

?_246:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 001E _ page is:
        db 20H, 00H                                     ; 0026 _  .

?_247:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0028 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0030 _ L: .

?_248:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0034 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003C _ H: .

?_249:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0040 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0048 _ w: .

?_250:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 004C _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0054 _ gh: .

?_251:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0059 _ type: .

?_252:                                                  ; byte
        db 3EH, 00H                                     ; 0060 _ >.

?_253:                                                  ; byte
        db 66H, 72H, 65H, 65H, 20H, 00H                 ; 0062 _ free .

?_254:                                                  ; byte
        db 20H, 4BH, 42H, 00H                           ; 0068 _  KB.

?_255:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 006C _ console.


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
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........
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

table_rgb.1762:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0120 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0128 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0130 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0138 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0140 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0148 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0150 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........

cursor.1830:                                            ; byte
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

closebtn.1917:                                          ; byte
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

?_256:  db 00H                                          ; 0342 _ .

?_257:  db 00H, 00H                                     ; 0343 _ ..


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

timerinfo1.1763:                                        ; byte
        resb    28                                      ; 0018

timerbuf1.1766:                                         ; qword
        resq    1                                       ; 0034

timerinfo2.1764:                                        ; byte
        resb    28                                      ; 003C

timerbuf2.1767:                                         ; qword
        resq    1                                       ; 0058

timerinfo3.1765:                                        ; byte
        resb    28                                      ; 0060

timerbuf3.1768:                                         ; qword
        resq    4                                       ; 007C
        resb    4                                       ; 009C

screen_info:                                            ; qword
        resb    4                                       ; 00A0

?_258:  resw    1                                       ; 00A4

?_259:  resw    13                                      ; 00A6

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

?_260:  resb    9                                       ; 02E1

?_261:  resb    22                                      ; 02EA

timer_control:                                          ; byte
        resd    2001                                    ; 0300

task_timer:                                             ; dword
        resd    1                                       ; 2244

task_control:                                           ; dword
        resd    1                                       ; 2248


