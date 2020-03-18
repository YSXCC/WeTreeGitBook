; Disassembly of file: ckernel.o
; Wed Mar 18 10:55:25 2020
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
        mov     dword [esp+8H], timerbuf1.1769          ; 014B _ C7. 44 24, 08, 00000034(d)
        mov     dword [esp+4H], 8                       ; 0153 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1766            ; 015B _ C7. 04 24, 00000018(d)
        call    fifo8_init                              ; 0162 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0167 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 016C _ 89. 45, C8
        mov     dword [esp+8H], 1                       ; 016F _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1766         ; 0177 _ C7. 44 24, 04, 00000018(d)
        mov     eax, dword [ebp-38H]                    ; 017F _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0182 _ 89. 04 24
        call    timer_init                              ; 0185 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 018A _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 0192 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0195 _ 89. 04 24
        call    timer_settime                           ; 0198 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 019D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf2.1770          ; 01A5 _ C7. 44 24, 08, 00000058(d)
        mov     dword [esp+4H], 8                       ; 01AD _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1767            ; 01B5 _ C7. 04 24, 0000003C(d)
        call    fifo8_init                              ; 01BC _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01C1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 01C6 _ 89. 45, CC
        mov     dword [esp+8H], 1                       ; 01C9 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1767         ; 01D1 _ C7. 44 24, 04, 0000003C(d)
        mov     eax, dword [ebp-34H]                    ; 01D9 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 01DC _ 89. 04 24
        call    timer_init                              ; 01DF _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01E4 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-34H]                    ; 01EC _ 8B. 45, CC
        mov     dword [esp], eax                        ; 01EF _ 89. 04 24
        call    timer_settime                           ; 01F2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 01F7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf3.1771          ; 01FF _ C7. 44 24, 08, 0000007C(d)
        mov     dword [esp+4H], 8                       ; 0207 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1768            ; 020F _ C7. 04 24, 00000060(d)
        call    fifo8_init                              ; 0216 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 021B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0220 _ 89. 45, D0
        mov     dword [esp+8H], 1                       ; 0223 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1768         ; 022B _ C7. 44 24, 04, 00000060(d)
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
        mov     dword [esp], timerinfo1.1766            ; 03E8 _ C7. 04 24, 00000018(d)
        call    fifo8_status                            ; 03EF _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03F4 _ 01. C3
        mov     dword [esp], timerinfo2.1767            ; 03F6 _ C7. 04 24, 0000003C(d)
        call    fifo8_status                            ; 03FD _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0402 _ 01. C3
        mov     dword [esp], timerinfo3.1768            ; 0404 _ C7. 04 24, 00000060(d)
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

?_008:  mov     dword [esp], timerinfo1.1766            ; 07FD _ C7. 04 24, 00000018(d)
        call    fifo8_status                            ; 0804 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0809 _ 85. C0
        jz      ?_009                                   ; 080B _ 74, 13
        call    io_sti                                  ; 080D _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1766            ; 0812 _ C7. 04 24, 00000018(d)
        call    fifo8_get                               ; 0819 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 081E _ EB, 21

?_009:  mov     dword [esp], timerinfo2.1767            ; 0820 _ C7. 04 24, 0000003C(d)
        call    fifo8_status                            ; 0827 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 082C _ 85. C0
        jz      ?_010                                   ; 082E _ 74, 11
        call    io_sti                                  ; 0830 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1767            ; 0835 _ C7. 04 24, 0000003C(d)
        call    fifo8_get                               ; 083C _ E8, FFFFFFFC(rel)
?_010:  mov     dword [esp], timerinfo3.1768            ; 0841 _ C7. 04 24, 00000060(d)
        call    fifo8_status                            ; 0848 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 084D _ 85. C0
        je      ?_014                                   ; 084F _ 0F 84, 000000DB
        mov     dword [esp], timerinfo3.1768            ; 0855 _ C7. 04 24, 00000060(d)
        call    fifo8_get                               ; 085C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0861 _ 89. 45, F4
        call    io_sti                                  ; 0864 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 0869 _ 83. 7D, F4, 00
        jz      ?_011                                   ; 086D _ 74, 24
        mov     dword [esp+8H], 0                       ; 086F _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1768         ; 0877 _ C7. 44 24, 04, 00000060(d)
        mov     eax, dword [ebp-30H]                    ; 087F _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0882 _ 89. 04 24
        call    timer_init                              ; 0885 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-54H], 0                      ; 088A _ C7. 45, AC, 00000000
        jmp     ?_012                                   ; 0891 _ EB, 22

?_011:  mov     dword [esp+8H], 1                       ; 0893 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1768         ; 089B _ C7. 44 24, 04, 00000060(d)
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
        mov     dword [esp+8H], table_rgb.1782          ; 0AAE _ C7. 44 24, 08, 00000120(d)
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
        add     eax, cursor.1850                        ; 11F5 _ 05, 00000160(d)
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
        add     eax, cursor.1850                        ; 1227 _ 05, 00000160(d)
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
        add     eax, closebtn.1937                      ; 1E94 _ 05, 00000260(d)
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
        sub     esp, 328                                ; 209C _ 81. EC, 00000148
        mov     eax, dword [ebp+8H]                     ; 20A2 _ 8B. 45, 08
        mov     dword [ebp-12CH], eax                   ; 20A5 _ 89. 85, FFFFFED4
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 20AB _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 20B1 _ 89. 45, F4
        xor     eax, eax                                ; 20B4 _ 31. C0
        mov     dword [ebp-124H], 78848                 ; 20B6 _ C7. 85, FFFFFEDC, 00013400
        call    task_now                                ; 20C0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0F0H], eax                   ; 20C5 _ 89. 85, FFFFFF10
        mov     dword [ebp-120H], 16                    ; 20CB _ C7. 85, FFFFFEE0, 00000010
        mov     dword [ebp-11CH], 28                    ; 20D5 _ C7. 85, FFFFFEE4, 0000001C
        mov     dword [ebp-118H], 0                     ; 20DF _ C7. 85, FFFFFEE8, 00000000
        mov     dword [ebp-114H], 0                     ; 20E9 _ C7. 85, FFFFFEEC, 00000000
        mov     dword [ebp-110H], 0                     ; 20F3 _ C7. 85, FFFFFEF0, 00000000
        mov     eax, dword [ebp-0F0H]                   ; 20FD _ 8B. 85, FFFFFF10
        lea     edx, [eax+10H]                          ; 2103 _ 8D. 50, 10
        mov     eax, dword [ebp-0F0H]                   ; 2106 _ 8B. 85, FFFFFF10
        mov     dword [esp+0CH], eax                    ; 210C _ 89. 44 24, 0C
        lea     eax, [ebp-8CH]                          ; 2110 _ 8D. 85, FFFFFF74
        mov     dword [esp+8H], eax                     ; 2116 _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 211A _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 2122 _ 89. 14 24
        call    fifo8_init                              ; 2125 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 212A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0ECH], eax                   ; 212F _ 89. 85, FFFFFF14
        mov     eax, dword [ebp-0F0H]                   ; 2135 _ 8B. 85, FFFFFF10
        add     eax, 16                                 ; 213B _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 213E _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 2146 _ 89. 44 24, 04
        mov     eax, dword [ebp-0ECH]                   ; 214A _ 8B. 85, FFFFFF14
        mov     dword [esp], eax                        ; 2150 _ 89. 04 24
        call    timer_init                              ; 2153 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 2158 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0ECH]                   ; 2160 _ 8B. 85, FFFFFF14
        mov     dword [esp], eax                        ; 2166 _ 89. 04 24
        call    timer_settime                           ; 2169 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 216E _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2173 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_306                  ; 217B _ C7. 44 24, 10, 00000060(d)
        mov     dword [esp+0CH], 28                     ; 2183 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 218B _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-12CH]                   ; 2193 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 2199 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 219D _ 89. 04 24
        call    paint_string                            ; 21A0 _ E8, FFFFFFFC(rel)
?_078:  call    io_cli                                  ; 21A5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0F0H]                   ; 21AA _ 8B. 85, FFFFFF10
        add     eax, 16                                 ; 21B0 _ 83. C0, 10
        mov     dword [esp], eax                        ; 21B3 _ 89. 04 24
        call    fifo8_status                            ; 21B6 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 21BB _ 85. C0
        jnz     ?_079                                   ; 21BD _ 75, 0A
        call    io_sti                                  ; 21BF _ E8, FFFFFFFC(rel)
        jmp     ?_122                                   ; 21C4 _ E9, 00000B1F

?_079:  mov     eax, dword [ebp-0F0H]                   ; 21C9 _ 8B. 85, FFFFFF10
        add     eax, 16                                 ; 21CF _ 83. C0, 10
        mov     dword [esp], eax                        ; 21D2 _ 89. 04 24
        call    fifo8_get                               ; 21D5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0E8H], eax                   ; 21DA _ 89. 85, FFFFFF18
        call    io_sti                                  ; 21E0 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0E8H], 1                     ; 21E5 _ 83. BD, FFFFFF18, 01
        jg      ?_082                                   ; 21EC _ 0F 8F, 0000008D
        cmp     dword [ebp-118H], 0                     ; 21F2 _ 83. BD, FFFFFEE8, 00
        js      ?_082                                   ; 21F9 _ 0F 88, 00000080
        cmp     dword [ebp-0E8H], 0                     ; 21FF _ 83. BD, FFFFFF18, 00
        jz      ?_080                                   ; 2206 _ 74, 2F
        mov     eax, dword [ebp-0F0H]                   ; 2208 _ 8B. 85, FFFFFF10
        add     eax, 16                                 ; 220E _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 2211 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 2219 _ 89. 44 24, 04
        mov     eax, dword [ebp-0ECH]                   ; 221D _ 8B. 85, FFFFFF14
        mov     dword [esp], eax                        ; 2223 _ 89. 04 24
        call    timer_init                              ; 2226 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-118H], 7                     ; 222B _ C7. 85, FFFFFEE8, 00000007
        jmp     ?_081                                   ; 2235 _ EB, 2D

?_080:  mov     eax, dword [ebp-0F0H]                   ; 2237 _ 8B. 85, FFFFFF10
        add     eax, 16                                 ; 223D _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 2240 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 2248 _ 89. 44 24, 04
        mov     eax, dword [ebp-0ECH]                   ; 224C _ 8B. 85, FFFFFF14
        mov     dword [esp], eax                        ; 2252 _ 89. 04 24
        call    timer_init                              ; 2255 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-118H], 0                     ; 225A _ C7. 85, FFFFFEE8, 00000000
?_081:  mov     dword [esp+4H], 50                      ; 2264 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0ECH]                   ; 226C _ 8B. 85, FFFFFF14
        mov     dword [esp], eax                        ; 2272 _ 89. 04 24
        call    timer_settime                           ; 2275 _ E8, FFFFFFFC(rel)
        jmp     ?_121                                   ; 227A _ E9, 00000A26

?_082:  cmp     dword [ebp-0E8H], 87                    ; 227F _ 83. BD, FFFFFF18, 57
        jnz     ?_083                                   ; 2286 _ 75, 48
        mov     dword [ebp-118H], 7                     ; 2288 _ C7. 85, FFFFFEE8, 00000007
        mov     eax, dword [ebp-0F0H]                   ; 2292 _ 8B. 85, FFFFFF10
        add     eax, 16                                 ; 2298 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 229B _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 22A3 _ 89. 44 24, 04
        mov     eax, dword [ebp-0ECH]                   ; 22A7 _ 8B. 85, FFFFFF14
        mov     dword [esp], eax                        ; 22AD _ 89. 04 24
        call    timer_init                              ; 22B0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 22B5 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0ECH]                   ; 22BD _ 8B. 85, FFFFFF14
        mov     dword [esp], eax                        ; 22C3 _ 89. 04 24
        call    timer_settime                           ; 22C6 _ E8, FFFFFFFC(rel)
        jmp     ?_121                                   ; 22CB _ E9, 000009D5

?_083:  cmp     dword [ebp-0E8H], 88                    ; 22D0 _ 83. BD, FFFFFF18, 58
        jnz     ?_084                                   ; 22D7 _ 75, 5F
        mov     eax, dword [sheet_control]              ; 22D9 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 22DE _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-11CH]                   ; 22E6 _ 8B. 95, FFFFFEE4
        mov     dword [esp+0CH], edx                    ; 22EC _ 89. 54 24, 0C
        mov     edx, dword [ebp-120H]                   ; 22F0 _ 8B. 95, FFFFFEE0
        mov     dword [esp+8H], edx                     ; 22F6 _ 89. 54 24, 08
        mov     edx, dword [ebp-12CH]                   ; 22FA _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 2300 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2304 _ 89. 04 24
        call    set_cursor                              ; 2307 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-118H], -1                    ; 230C _ C7. 85, FFFFFEE8, FFFFFFFF
        mov     eax, dword [task_main]                  ; 2316 _ A1, 00000000(d)
        mov     dword [esp+8H], 0                       ; 231B _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 2323 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 232B _ 89. 04 24
        call    task_run                                ; 232E _ E8, FFFFFFFC(rel)
        jmp     ?_121                                   ; 2333 _ E9, 0000096D

?_084:  cmp     dword [ebp-0E8H], 28                    ; 2338 _ 83. BD, FFFFFF18, 1C
        jne     ?_119                                   ; 233F _ 0F 85, 000007FE
        mov     eax, dword [sheet_control]              ; 2345 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 234A _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-11CH]                   ; 2352 _ 8B. 95, FFFFFEE4
        mov     dword [esp+0CH], edx                    ; 2358 _ 89. 54 24, 0C
        mov     edx, dword [ebp-120H]                   ; 235C _ 8B. 95, FFFFFEE0
        mov     dword [esp+8H], edx                     ; 2362 _ 89. 54 24, 08
        mov     edx, dword [ebp-12CH]                   ; 2366 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 236C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2370 _ 89. 04 24
        call    set_cursor                              ; 2373 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-120H]                   ; 2378 _ 8B. 85, FFFFFEE0
        lea     edx, [eax+7H]                           ; 237E _ 8D. 50, 07
        test    eax, eax                                ; 2381 _ 85. C0
        cmovs   eax, edx                                ; 2383 _ 0F 48. C2
        sar     eax, 3                                  ; 2386 _ C1. F8, 03
        sub     eax, 2                                  ; 2389 _ 83. E8, 02
        mov     byte [ebp+eax-0AAH], 0                  ; 238C _ C6. 84 05, FFFFFF56, 00
        mov     eax, dword [ebp-12CH]                   ; 2394 _ 8B. 85, FFFFFED4
        mov     dword [esp+4H], eax                     ; 239A _ 89. 44 24, 04
        mov     eax, dword [ebp-11CH]                   ; 239E _ 8B. 85, FFFFFEE4
        mov     dword [esp], eax                        ; 23A4 _ 89. 04 24
        call    console_new_line                        ; 23A7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-11CH], eax                   ; 23AC _ 89. 85, FFFFFEE4
        mov     dword [esp+4H], ?_307                   ; 23B2 _ C7. 44 24, 04, 00000062(d)
        lea     eax, [ebp-0AAH]                         ; 23BA _ 8D. 85, FFFFFF56
        mov     dword [esp], eax                        ; 23C0 _ 89. 04 24
        call    strcmp                                  ; 23C3 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 23C8 _ 83. F8, 01
        jne     ?_085                                   ; 23CB _ 0F 85, 000000EF
        mov     eax, dword [ebp+0CH]                    ; 23D1 _ 8B. 45, 0C
        lea     edx, [eax+3FFH]                         ; 23D4 _ 8D. 90, 000003FF
        test    eax, eax                                ; 23DA _ 85. C0
        cmovs   eax, edx                                ; 23DC _ 0F 48. C2
        sar     eax, 10                                 ; 23DF _ C1. F8, 0A
        mov     dword [esp], eax                        ; 23E2 _ 89. 04 24
        call    intToHexStr                             ; 23E5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0E4H], eax                   ; 23EA _ 89. 85, FFFFFF1C
        mov     eax, dword [sheet_control]              ; 23F0 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 23F5 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_308                  ; 23FD _ C7. 44 24, 10, 00000066(d)
        mov     edx, dword [ebp-11CH]                   ; 2405 _ 8B. 95, FFFFFEE4
        mov     dword [esp+0CH], edx                    ; 240B _ 89. 54 24, 0C
        mov     dword [esp+8H], 16                      ; 240F _ C7. 44 24, 08, 00000010
        mov     edx, dword [ebp-12CH]                   ; 2417 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 241D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2421 _ 89. 04 24
        call    paint_string                            ; 2424 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2429 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 242E _ C7. 44 24, 14, 00000007
        mov     edx, dword [ebp-0E4H]                   ; 2436 _ 8B. 95, FFFFFF1C
        mov     dword [esp+10H], edx                    ; 243C _ 89. 54 24, 10
        mov     edx, dword [ebp-11CH]                   ; 2440 _ 8B. 95, FFFFFEE4
        mov     dword [esp+0CH], edx                    ; 2446 _ 89. 54 24, 0C
        mov     dword [esp+8H], 52                      ; 244A _ C7. 44 24, 08, 00000034
        mov     edx, dword [ebp-12CH]                   ; 2452 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 2458 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 245C _ 89. 04 24
        call    paint_string                            ; 245F _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2464 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2469 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_309                  ; 2471 _ C7. 44 24, 10, 0000006C(d)
        mov     edx, dword [ebp-11CH]                   ; 2479 _ 8B. 95, FFFFFEE4
        mov     dword [esp+0CH], edx                    ; 247F _ 89. 54 24, 0C
        mov     dword [esp+8H], 126                     ; 2483 _ C7. 44 24, 08, 0000007E
        mov     edx, dword [ebp-12CH]                   ; 248B _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 2491 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2495 _ 89. 04 24
        call    paint_string                            ; 2498 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-12CH]                   ; 249D _ 8B. 85, FFFFFED4
        mov     dword [esp+4H], eax                     ; 24A3 _ 89. 44 24, 04
        mov     eax, dword [ebp-11CH]                   ; 24A7 _ 8B. 85, FFFFFEE4
        mov     dword [esp], eax                        ; 24AD _ 89. 04 24
        call    console_new_line                        ; 24B0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-11CH], eax                   ; 24B5 _ 89. 85, FFFFFEE4
        jmp     ?_118                                   ; 24BB _ E9, 00000674

?_085:  mov     dword [esp+4H], ?_310                   ; 24C0 _ C7. 44 24, 04, 00000070(d)
        lea     eax, [ebp-0AAH]                         ; 24C8 _ 8D. 85, FFFFFF56
        mov     dword [esp], eax                        ; 24CE _ 89. 04 24
        call    strcmp                                  ; 24D1 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 24D6 _ 83. F8, 01
        jne     ?_090                                   ; 24D9 _ 0F 85, 000000E2
        mov     dword [ebp-110H], 28                    ; 24DF _ C7. 85, FFFFFEF0, 0000001C
        jmp     ?_089                                   ; 24E9 _ EB, 4D

?_086:  mov     dword [ebp-114H], 8                     ; 24EB _ C7. 85, FFFFFEEC, 00000008
        jmp     ?_088                                   ; 24F5 _ EB, 2E

?_087:  mov     eax, dword [ebp-12CH]                   ; 24F7 _ 8B. 85, FFFFFED4
        mov     edx, dword [eax]                        ; 24FD _ 8B. 10
        mov     eax, dword [ebp-12CH]                   ; 24FF _ 8B. 85, FFFFFED4
        mov     eax, dword [eax+4H]                     ; 2505 _ 8B. 40, 04
        imul    eax, dword [ebp-110H]                   ; 2508 _ 0F AF. 85, FFFFFEF0
        mov     ecx, eax                                ; 250F _ 89. C1
        mov     eax, dword [ebp-114H]                   ; 2511 _ 8B. 85, FFFFFEEC
        add     eax, ecx                                ; 2517 _ 01. C8
        add     eax, edx                                ; 2519 _ 01. D0
        mov     byte [eax], 0                           ; 251B _ C6. 00, 00
        add     dword [ebp-114H], 1                     ; 251E _ 83. 85, FFFFFEEC, 01
?_088:  cmp     dword [ebp-114H], 247                   ; 2525 _ 81. BD, FFFFFEEC, 000000F7
        jle     ?_087                                   ; 252F _ 7E, C6
        add     dword [ebp-110H], 1                     ; 2531 _ 83. 85, FFFFFEF0, 01
?_089:  cmp     dword [ebp-110H], 155                   ; 2538 _ 81. BD, FFFFFEF0, 0000009B
        jle     ?_086                                   ; 2542 _ 7E, A7
        mov     eax, dword [sheet_control]              ; 2544 _ A1, 00000000(d)
        mov     dword [esp+14H], 156                    ; 2549 _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 2551 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 2559 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2561 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-12CH]                   ; 2569 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 256F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2573 _ 89. 04 24
        call    sheet_refresh                           ; 2576 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-11CH], 28                    ; 257B _ C7. 85, FFFFFEE4, 0000001C
        mov     eax, dword [sheet_control]              ; 2585 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 258A _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_306                  ; 2592 _ C7. 44 24, 10, 00000060(d)
        mov     dword [esp+0CH], 28                     ; 259A _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 25A2 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-12CH]                   ; 25AA _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 25B0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25B4 _ 89. 04 24
        call    paint_string                            ; 25B7 _ E8, FFFFFFFC(rel)
        jmp     ?_118                                   ; 25BC _ E9, 00000573

?_090:  mov     dword [esp+4H], ?_311                   ; 25C1 _ C7. 44 24, 04, 00000074(d)
        lea     eax, [ebp-0AAH]                         ; 25C9 _ 8D. 85, FFFFFF56
        mov     dword [esp], eax                        ; 25CF _ 89. 04 24
        call    strcmp                                  ; 25D2 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 25D7 _ 83. F8, 01
        jne     ?_099                                   ; 25DA _ 0F 85, 000001AE
        jmp     ?_098                                   ; 25E0 _ E9, 00000189

?_091:  mov     byte [ebp-0ABH], 0                      ; 25E5 _ C6. 85, FFFFFF55, 00
        mov     dword [ebp-10CH], 0                     ; 25EC _ C7. 85, FFFFFEF4, 00000000
        jmp     ?_094                                   ; 25F6 _ EB, 41

?_092:  mov     edx, dword [ebp-124H]                   ; 25F8 _ 8B. 95, FFFFFEDC
        mov     eax, dword [ebp-10CH]                   ; 25FE _ 8B. 85, FFFFFEF4
        add     eax, edx                                ; 2604 _ 01. D0
        movzx   eax, byte [eax]                         ; 2606 _ 0F B6. 00
        test    al, al                                  ; 2609 _ 84. C0
        jz      ?_093                                   ; 260B _ 74, 2A
        mov     edx, dword [ebp-124H]                   ; 260D _ 8B. 95, FFFFFEDC
        mov     eax, dword [ebp-10CH]                   ; 2613 _ 8B. 85, FFFFFEF4
        add     eax, edx                                ; 2619 _ 01. D0
        movzx   eax, byte [eax]                         ; 261B _ 0F B6. 00
        lea     ecx, [ebp-0B7H]                         ; 261E _ 8D. 8D, FFFFFF49
        mov     edx, dword [ebp-10CH]                   ; 2624 _ 8B. 95, FFFFFEF4
        add     edx, ecx                                ; 262A _ 01. CA
        mov     byte [edx], al                          ; 262C _ 88. 02
        add     dword [ebp-10CH], 1                     ; 262E _ 83. 85, FFFFFEF4, 01
        jmp     ?_094                                   ; 2635 _ EB, 02

?_093:  jmp     ?_095                                   ; 2637 _ EB, 09

?_094:  cmp     dword [ebp-10CH], 7                     ; 2639 _ 83. BD, FFFFFEF4, 07
        jle     ?_092                                   ; 2640 _ 7E, B6
?_095:  lea     edx, [ebp-0B7H]                         ; 2642 _ 8D. 95, FFFFFF49
        mov     eax, dword [ebp-10CH]                   ; 2648 _ 8B. 85, FFFFFEF4
        add     eax, edx                                ; 264E _ 01. D0
        mov     byte [eax], 46                          ; 2650 _ C6. 00, 2E
        add     dword [ebp-10CH], 1                     ; 2653 _ 83. 85, FFFFFEF4, 01
        mov     dword [ebp-108H], 0                     ; 265A _ C7. 85, FFFFFEF8, 00000000
        jmp     ?_097                                   ; 2664 _ EB, 30

?_096:  mov     edx, dword [ebp-124H]                   ; 2666 _ 8B. 95, FFFFFEDC
        mov     eax, dword [ebp-108H]                   ; 266C _ 8B. 85, FFFFFEF8
        add     eax, edx                                ; 2672 _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 2674 _ 0F B6. 40, 08
        lea     ecx, [ebp-0B7H]                         ; 2678 _ 8D. 8D, FFFFFF49
        mov     edx, dword [ebp-10CH]                   ; 267E _ 8B. 95, FFFFFEF4
        add     edx, ecx                                ; 2684 _ 01. CA
        mov     byte [edx], al                          ; 2686 _ 88. 02
        add     dword [ebp-10CH], 1                     ; 2688 _ 83. 85, FFFFFEF4, 01
        add     dword [ebp-108H], 1                     ; 268F _ 83. 85, FFFFFEF8, 01
?_097:  cmp     dword [ebp-108H], 2                     ; 2696 _ 83. BD, FFFFFEF8, 02
        jle     ?_096                                   ; 269D _ 7E, C7
        lea     edx, [ebp-0B7H]                         ; 269F _ 8D. 95, FFFFFF49
        mov     eax, dword [ebp-10CH]                   ; 26A5 _ 8B. 85, FFFFFEF4
        add     eax, edx                                ; 26AB _ 01. D0
        mov     byte [eax], 0                           ; 26AD _ C6. 00, 00
        mov     eax, dword [sheet_control]              ; 26B0 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 26B5 _ C7. 44 24, 14, 00000007
        lea     edx, [ebp-0B7H]                         ; 26BD _ 8D. 95, FFFFFF49
        mov     dword [esp+10H], edx                    ; 26C3 _ 89. 54 24, 10
        mov     edx, dword [ebp-11CH]                   ; 26C7 _ 8B. 95, FFFFFEE4
        mov     dword [esp+0CH], edx                    ; 26CD _ 89. 54 24, 0C
        mov     dword [esp+8H], 16                      ; 26D1 _ C7. 44 24, 08, 00000010
        mov     edx, dword [ebp-12CH]                   ; 26D9 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 26DF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 26E3 _ 89. 04 24
        call    paint_string                            ; 26E6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0E0H], 136                   ; 26EB _ C7. 85, FFFFFF20, 00000088
        mov     eax, dword [ebp-124H]                   ; 26F5 _ 8B. 85, FFFFFEDC
        mov     eax, dword [eax+1CH]                    ; 26FB _ 8B. 40, 1C
        mov     dword [esp], eax                        ; 26FE _ 89. 04 24
        call    intToHexStr                             ; 2701 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0DCH], eax                   ; 2706 _ 89. 85, FFFFFF24
        mov     eax, dword [sheet_control]              ; 270C _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2711 _ C7. 44 24, 14, 00000007
        mov     edx, dword [ebp-0DCH]                   ; 2719 _ 8B. 95, FFFFFF24
        mov     dword [esp+10H], edx                    ; 271F _ 89. 54 24, 10
        mov     edx, dword [ebp-11CH]                   ; 2723 _ 8B. 95, FFFFFEE4
        mov     dword [esp+0CH], edx                    ; 2729 _ 89. 54 24, 0C
        mov     edx, dword [ebp-0E0H]                   ; 272D _ 8B. 95, FFFFFF20
        mov     dword [esp+8H], edx                     ; 2733 _ 89. 54 24, 08
        mov     edx, dword [ebp-12CH]                   ; 2737 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 273D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2741 _ 89. 04 24
        call    paint_string                            ; 2744 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-12CH]                   ; 2749 _ 8B. 85, FFFFFED4
        mov     dword [esp+4H], eax                     ; 274F _ 89. 44 24, 04
        mov     eax, dword [ebp-11CH]                   ; 2753 _ 8B. 85, FFFFFEE4
        mov     dword [esp], eax                        ; 2759 _ 89. 04 24
        call    console_new_line                        ; 275C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-11CH], eax                   ; 2761 _ 89. 85, FFFFFEE4
        add     dword [ebp-124H], 32                    ; 2767 _ 83. 85, FFFFFEDC, 20
?_098:  mov     eax, dword [ebp-124H]                   ; 276E _ 8B. 85, FFFFFEDC
        movzx   eax, byte [eax]                         ; 2774 _ 0F B6. 00
        test    al, al                                  ; 2777 _ 84. C0
        jne     ?_091                                   ; 2779 _ 0F 85, FFFFFE66
        mov     dword [ebp-124H], 78848                 ; 277F _ C7. 85, FFFFFEDC, 00013400
        jmp     ?_118                                   ; 2789 _ E9, 000003A6

?_099:  movzx   eax, byte [ebp-0AAH]                    ; 278E _ 0F B6. 85, FFFFFF56
        cmp     al, 116                                 ; 2795 _ 3C, 74
        jne     ?_117                                   ; 2797 _ 0F 85, 000002F0
        movzx   eax, byte [ebp-0A9H]                    ; 279D _ 0F B6. 85, FFFFFF57
        cmp     al, 121                                 ; 27A4 _ 3C, 79
        jne     ?_117                                   ; 27A6 _ 0F 85, 000002E1
        movzx   eax, byte [ebp-0A8H]                    ; 27AC _ 0F B6. 85, FFFFFF58
        cmp     al, 112                                 ; 27B3 _ 3C, 70
        jne     ?_117                                   ; 27B5 _ 0F 85, 000002D2
        movzx   eax, byte [ebp-0A7H]                    ; 27BB _ 0F B6. 85, FFFFFF59
        cmp     al, 101                                 ; 27C2 _ 3C, 65
        jne     ?_117                                   ; 27C4 _ 0F 85, 000002C3
        mov     byte [ebp-0B8H], 0                      ; 27CA _ C6. 85, FFFFFF48, 00
        mov     dword [ebp-104H], 0                     ; 27D1 _ C7. 85, FFFFFEFC, 00000000
        mov     dword [ebp-100H], 5                     ; 27DB _ C7. 85, FFFFFF00, 00000005
        jmp     ?_102                                   ; 27E5 _ EB, 48

?_100:  lea     edx, [ebp-0AAH]                         ; 27E7 _ 8D. 95, FFFFFF56
        mov     eax, dword [ebp-100H]                   ; 27ED _ 8B. 85, FFFFFF00
        add     eax, edx                                ; 27F3 _ 01. D0
        movzx   eax, byte [eax]                         ; 27F5 _ 0F B6. 00
        test    al, al                                  ; 27F8 _ 84. C0
        jz      ?_101                                   ; 27FA _ 74, 31
        lea     edx, [ebp-0AAH]                         ; 27FC _ 8D. 95, FFFFFF56
        mov     eax, dword [ebp-100H]                   ; 2802 _ 8B. 85, FFFFFF00
        add     eax, edx                                ; 2808 _ 01. D0
        movzx   eax, byte [eax]                         ; 280A _ 0F B6. 00
        lea     ecx, [ebp-0C4H]                         ; 280D _ 8D. 8D, FFFFFF3C
        mov     edx, dword [ebp-104H]                   ; 2813 _ 8B. 95, FFFFFEFC
        add     edx, ecx                                ; 2819 _ 01. CA
        mov     byte [edx], al                          ; 281B _ 88. 02
        add     dword [ebp-104H], 1                     ; 281D _ 83. 85, FFFFFEFC, 01
        add     dword [ebp-100H], 1                     ; 2824 _ 83. 85, FFFFFF00, 01
        jmp     ?_102                                   ; 282B _ EB, 02

?_101:  jmp     ?_103                                   ; 282D _ EB, 09

?_102:  cmp     dword [ebp-100H], 16                    ; 282F _ 83. BD, FFFFFF00, 10
        jle     ?_100                                   ; 2836 _ 7E, AF
?_103:  lea     edx, [ebp-0C4H]                         ; 2838 _ 8D. 95, FFFFFF3C
        mov     eax, dword [ebp-104H]                   ; 283E _ 8B. 85, FFFFFEFC
        add     eax, edx                                ; 2844 _ 01. D0
        mov     byte [eax], 0                           ; 2846 _ C6. 00, 00
        jmp     ?_115                                   ; 2849 _ E9, 000001F7

?_104:  mov     byte [ebp-0ABH], 0                      ; 284E _ C6. 85, FFFFFF55, 00
        mov     dword [ebp-0FCH], 0                     ; 2855 _ C7. 85, FFFFFF04, 00000000
        jmp     ?_107                                   ; 285F _ EB, 41

?_105:  mov     edx, dword [ebp-124H]                   ; 2861 _ 8B. 95, FFFFFEDC
        mov     eax, dword [ebp-0FCH]                   ; 2867 _ 8B. 85, FFFFFF04
        add     eax, edx                                ; 286D _ 01. D0
        movzx   eax, byte [eax]                         ; 286F _ 0F B6. 00
        test    al, al                                  ; 2872 _ 84. C0
        jz      ?_106                                   ; 2874 _ 74, 2A
        mov     edx, dword [ebp-124H]                   ; 2876 _ 8B. 95, FFFFFEDC
        mov     eax, dword [ebp-0FCH]                   ; 287C _ 8B. 85, FFFFFF04
        add     eax, edx                                ; 2882 _ 01. D0
        movzx   eax, byte [eax]                         ; 2884 _ 0F B6. 00
        lea     ecx, [ebp-0B7H]                         ; 2887 _ 8D. 8D, FFFFFF49
        mov     edx, dword [ebp-0FCH]                   ; 288D _ 8B. 95, FFFFFF04
        add     edx, ecx                                ; 2893 _ 01. CA
        mov     byte [edx], al                          ; 2895 _ 88. 02
        add     dword [ebp-0FCH], 1                     ; 2897 _ 83. 85, FFFFFF04, 01
        jmp     ?_107                                   ; 289E _ EB, 02

?_106:  jmp     ?_108                                   ; 28A0 _ EB, 09

?_107:  cmp     dword [ebp-0FCH], 7                     ; 28A2 _ 83. BD, FFFFFF04, 07
        jle     ?_105                                   ; 28A9 _ 7E, B6
?_108:  lea     edx, [ebp-0B7H]                         ; 28AB _ 8D. 95, FFFFFF49
        mov     eax, dword [ebp-0FCH]                   ; 28B1 _ 8B. 85, FFFFFF04
        add     eax, edx                                ; 28B7 _ 01. D0
        mov     byte [eax], 46                          ; 28B9 _ C6. 00, 2E
        add     dword [ebp-0FCH], 1                     ; 28BC _ 83. 85, FFFFFF04, 01
        mov     dword [ebp-0F8H], 0                     ; 28C3 _ C7. 85, FFFFFF08, 00000000
        jmp     ?_110                                   ; 28CD _ EB, 30

?_109:  mov     edx, dword [ebp-124H]                   ; 28CF _ 8B. 95, FFFFFEDC
        mov     eax, dword [ebp-0F8H]                   ; 28D5 _ 8B. 85, FFFFFF08
        add     eax, edx                                ; 28DB _ 01. D0
        movzx   eax, byte [eax+8H]                      ; 28DD _ 0F B6. 40, 08
        lea     ecx, [ebp-0B7H]                         ; 28E1 _ 8D. 8D, FFFFFF49
        mov     edx, dword [ebp-0FCH]                   ; 28E7 _ 8B. 95, FFFFFF04
        add     edx, ecx                                ; 28ED _ 01. CA
        mov     byte [edx], al                          ; 28EF _ 88. 02
        add     dword [ebp-0FCH], 1                     ; 28F1 _ 83. 85, FFFFFF04, 01
        add     dword [ebp-0F8H], 1                     ; 28F8 _ 83. 85, FFFFFF08, 01
?_110:  cmp     dword [ebp-0F8H], 2                     ; 28FF _ 83. BD, FFFFFF08, 02
        jle     ?_109                                   ; 2906 _ 7E, C7
        lea     edx, [ebp-0B7H]                         ; 2908 _ 8D. 95, FFFFFF49
        mov     eax, dword [ebp-0FCH]                   ; 290E _ 8B. 85, FFFFFF04
        add     eax, edx                                ; 2914 _ 01. D0
        mov     byte [eax], 0                           ; 2916 _ C6. 00, 00
        lea     eax, [ebp-0B7H]                         ; 2919 _ 8D. 85, FFFFFF49
        mov     dword [esp+4H], eax                     ; 291F _ 89. 44 24, 04
        lea     eax, [ebp-0C4H]                         ; 2923 _ 8D. 85, FFFFFF3C
        mov     dword [esp], eax                        ; 2929 _ 89. 04 24
        call    strcmp                                  ; 292C _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 2931 _ 83. F8, 01
        jne     ?_114                                   ; 2934 _ 0F 85, 00000104
        mov     dword [ebp-0D8H], 88064                 ; 293A _ C7. 85, FFFFFF28, 00015800
        mov     eax, dword [ebp-124H]                   ; 2944 _ 8B. 85, FFFFFEDC
        movzx   eax, word [eax+1AH]                     ; 294A _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 294E _ 0F B7. C0
        shl     eax, 9                                  ; 2951 _ C1. E0, 09
        add     dword [ebp-0D8H], eax                   ; 2954 _ 01. 85, FFFFFF28
        mov     eax, dword [ebp-124H]                   ; 295A _ 8B. 85, FFFFFEDC
        mov     eax, dword [eax+1CH]                    ; 2960 _ 8B. 40, 1C
        mov     dword [ebp-0D4H], eax                   ; 2963 _ 89. 85, FFFFFF2C
        mov     dword [ebp-0F4H], 0                     ; 2969 _ C7. 85, FFFFFF0C, 00000000
        mov     dword [ebp-120H], 16                    ; 2973 _ C7. 85, FFFFFEE0, 00000010
        mov     dword [ebp-0F4H], 0                     ; 297D _ C7. 85, FFFFFF0C, 00000000
        jmp     ?_113                                   ; 2987 _ E9, 0000009D

?_111:  mov     edx, dword [ebp-0F4H]                   ; 298C _ 8B. 95, FFFFFF0C
        mov     eax, dword [ebp-0D8H]                   ; 2992 _ 8B. 85, FFFFFF28
        add     eax, edx                                ; 2998 _ 01. D0
        movzx   eax, byte [eax]                         ; 299A _ 0F B6. 00
        mov     byte [ebp-0CCH], al                     ; 299D _ 88. 85, FFFFFF34
        mov     byte [ebp-0CBH], 0                      ; 29A3 _ C6. 85, FFFFFF35, 00
        mov     eax, dword [sheet_control]              ; 29AA _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 29AF _ C7. 44 24, 14, 00000007
        lea     edx, [ebp-0CCH]                         ; 29B7 _ 8D. 95, FFFFFF34
        mov     dword [esp+10H], edx                    ; 29BD _ 89. 54 24, 10
        mov     edx, dword [ebp-11CH]                   ; 29C1 _ 8B. 95, FFFFFEE4
        mov     dword [esp+0CH], edx                    ; 29C7 _ 89. 54 24, 0C
        mov     edx, dword [ebp-120H]                   ; 29CB _ 8B. 95, FFFFFEE0
        mov     dword [esp+8H], edx                     ; 29D1 _ 89. 54 24, 08
        mov     edx, dword [ebp-12CH]                   ; 29D5 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 29DB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 29DF _ 89. 04 24
        call    paint_string                            ; 29E2 _ E8, FFFFFFFC(rel)
        add     dword [ebp-120H], 8                     ; 29E7 _ 83. 85, FFFFFEE0, 08
        cmp     dword [ebp-120H], 248                   ; 29EE _ 81. BD, FFFFFEE0, 000000F8
        jnz     ?_112                                   ; 29F8 _ 75, 28
        mov     dword [ebp-120H], 16                    ; 29FA _ C7. 85, FFFFFEE0, 00000010
        mov     eax, dword [ebp-12CH]                   ; 2A04 _ 8B. 85, FFFFFED4
        mov     dword [esp+4H], eax                     ; 2A0A _ 89. 44 24, 04
        mov     eax, dword [ebp-11CH]                   ; 2A0E _ 8B. 85, FFFFFEE4
        mov     dword [esp], eax                        ; 2A14 _ 89. 04 24
        call    console_new_line                        ; 2A17 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-11CH], eax                   ; 2A1C _ 89. 85, FFFFFEE4
?_112:  add     dword [ebp-0F4H], 1                     ; 2A22 _ 83. 85, FFFFFF0C, 01
?_113:  mov     eax, dword [ebp-0F4H]                   ; 2A29 _ 8B. 85, FFFFFF0C
        cmp     eax, dword [ebp-0D4H]                   ; 2A2F _ 3B. 85, FFFFFF2C
        jl      ?_111                                   ; 2A35 _ 0F 8C, FFFFFF51
        nop                                             ; 2A3B _ 90
        jmp     ?_116                                   ; 2A3C _ EB, 18

?_114:  add     dword [ebp-124H], 32                    ; 2A3E _ 83. 85, FFFFFEDC, 20
?_115:  mov     eax, dword [ebp-124H]                   ; 2A45 _ 8B. 85, FFFFFEDC
        movzx   eax, byte [eax]                         ; 2A4B _ 0F B6. 00
        test    al, al                                  ; 2A4E _ 84. C0
        jne     ?_104                                   ; 2A50 _ 0F 85, FFFFFDF8
?_116:  mov     eax, dword [ebp-12CH]                   ; 2A56 _ 8B. 85, FFFFFED4
        mov     dword [esp+4H], eax                     ; 2A5C _ 89. 44 24, 04
        mov     eax, dword [ebp-11CH]                   ; 2A60 _ 8B. 85, FFFFFEE4
        mov     dword [esp], eax                        ; 2A66 _ 89. 04 24
        call    console_new_line                        ; 2A69 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-11CH], eax                   ; 2A6E _ 89. 85, FFFFFEE4
        mov     dword [ebp-120H], 16                    ; 2A74 _ C7. 85, FFFFFEE0, 00000010
        mov     dword [ebp-124H], 78848                 ; 2A7E _ C7. 85, FFFFFEDC, 00013400
        jmp     ?_118                                   ; 2A88 _ E9, 000000A7

?_117:  mov     dword [esp+4H], ?_312                   ; 2A8D _ C7. 44 24, 04, 00000078(d)
        lea     eax, [ebp-0AAH]                         ; 2A95 _ 8D. 85, FFFFFF56
        mov     dword [esp], eax                        ; 2A9B _ 89. 04 24
        call    strcmp                                  ; 2A9E _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 2AA3 _ 83. F8, 01
        jne     ?_118                                   ; 2AA6 _ 0F 85, 00000088
        lea     eax, [ebp-0CCH]                         ; 2AAC _ 8D. 85, FFFFFF34
        mov     dword [esp+4H], eax                     ; 2AB2 _ 89. 44 24, 04
        mov     dword [esp], ?_313                      ; 2AB6 _ C7. 04 24, 0000007C(d)
        call    file_load_content                       ; 2ABD _ E8, FFFFFFFC(rel)
        call    get_addr_gdt                            ; 2AC2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0D0H], eax                   ; 2AC7 _ 89. 85, FFFFFF30
        mov     eax, dword [ebp-0CCH]                   ; 2ACD _ 8B. 85, FFFFFF34
        mov     edx, dword [ebp-0D0H]                   ; 2AD3 _ 8B. 95, FFFFFF30
        add     edx, 152                                ; 2AD9 _ 81. C2, 00000098
        mov     dword [esp+0CH], 16538                  ; 2ADF _ C7. 44 24, 0C, 0000409A
        mov     dword [esp+8H], eax                     ; 2AE7 _ 89. 44 24, 08
        mov     dword [esp+4H], 1048575                 ; 2AEB _ C7. 44 24, 04, 000FFFFF
        mov     dword [esp], edx                        ; 2AF3 _ 89. 14 24
        call    segment_descriptor                      ; 2AF6 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 152                     ; 2AFB _ C7. 44 24, 04, 00000098
        mov     dword [esp], 0                          ; 2B03 _ C7. 04 24, 00000000
        call    farjmp                                  ; 2B0A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0C8H]                   ; 2B0F _ 8B. 85, FFFFFF38
        mov     ecx, eax                                ; 2B15 _ 89. C1
        mov     eax, dword [ebp-0CCH]                   ; 2B17 _ 8B. 85, FFFFFF34
        mov     edx, eax                                ; 2B1D _ 89. C2
        mov     eax, dword [memman]                     ; 2B1F _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 2B24 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2B28 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2B2C _ 89. 04 24
        call    memman_free_4k                          ; 2B2F _ E8, FFFFFFFC(rel)
?_118:  mov     dword [ebp-120H], 16                    ; 2B34 _ C7. 85, FFFFFEE0, 00000010
        jmp     ?_121                                   ; 2B3E _ E9, 00000162

?_119:  cmp     dword [ebp-0E8H], 14                    ; 2B43 _ 83. BD, FFFFFF18, 0E
        jnz     ?_120                                   ; 2B4A _ 75, 7B
        cmp     dword [ebp-120H], 16                    ; 2B4C _ 83. BD, FFFFFEE0, 10
        jle     ?_120                                   ; 2B53 _ 7E, 72
        mov     eax, dword [sheet_control]              ; 2B55 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 2B5A _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-11CH]                   ; 2B62 _ 8B. 95, FFFFFEE4
        mov     dword [esp+0CH], edx                    ; 2B68 _ 89. 54 24, 0C
        mov     edx, dword [ebp-120H]                   ; 2B6C _ 8B. 95, FFFFFEE0
        mov     dword [esp+8H], edx                     ; 2B72 _ 89. 54 24, 08
        mov     edx, dword [ebp-12CH]                   ; 2B76 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 2B7C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2B80 _ 89. 04 24
        call    set_cursor                              ; 2B83 _ E8, FFFFFFFC(rel)
        sub     dword [ebp-120H], 8                     ; 2B88 _ 83. AD, FFFFFEE0, 08
        mov     eax, dword [sheet_control]              ; 2B8F _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 2B94 _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-11CH]                   ; 2B9C _ 8B. 95, FFFFFEE4
        mov     dword [esp+0CH], edx                    ; 2BA2 _ 89. 54 24, 0C
        mov     edx, dword [ebp-120H]                   ; 2BA6 _ 8B. 95, FFFFFEE0
        mov     dword [esp+8H], edx                     ; 2BAC _ 89. 54 24, 08
        mov     edx, dword [ebp-12CH]                   ; 2BB0 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 2BB6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2BBA _ 89. 04 24
        call    set_cursor                              ; 2BBD _ E8, FFFFFFFC(rel)
        jmp     ?_121                                   ; 2BC2 _ E9, 000000DE

?_120:  mov     eax, dword [ebp-0E8H]                   ; 2BC7 _ 8B. 85, FFFFFF18
        mov     dword [esp], eax                        ; 2BCD _ 89. 04 24
        call    transfer_scancode                       ; 2BD0 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-125H], al                     ; 2BD5 _ 88. 85, FFFFFEDB
        cmp     byte [ebp-125H], 0                      ; 2BDB _ 80. BD, FFFFFEDB, 00
        je      ?_121                                   ; 2BE2 _ 0F 84, 000000BD
        cmp     dword [ebp-120H], 239                   ; 2BE8 _ 81. BD, FFFFFEE0, 000000EF
        jg      ?_121                                   ; 2BF2 _ 0F 8F, 000000AD
        mov     eax, dword [sheet_control]              ; 2BF8 _ A1, 00000000(d)
        mov     dword [esp+10H], 0                      ; 2BFD _ C7. 44 24, 10, 00000000
        mov     edx, dword [ebp-11CH]                   ; 2C05 _ 8B. 95, FFFFFEE4
        mov     dword [esp+0CH], edx                    ; 2C0B _ 89. 54 24, 0C
        mov     edx, dword [ebp-120H]                   ; 2C0F _ 8B. 95, FFFFFEE0
        mov     dword [esp+8H], edx                     ; 2C15 _ 89. 54 24, 08
        mov     edx, dword [ebp-12CH]                   ; 2C19 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 2C1F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2C23 _ 89. 04 24
        call    set_cursor                              ; 2C26 _ E8, FFFFFFFC(rel)
        movzx   eax, byte [ebp-125H]                    ; 2C2B _ 0F B6. 85, FFFFFEDB
        mov     byte [ebp-0CCH], al                     ; 2C32 _ 88. 85, FFFFFF34
        mov     byte [ebp-0CBH], 0                      ; 2C38 _ C6. 85, FFFFFF35, 00
        mov     eax, dword [ebp-120H]                   ; 2C3F _ 8B. 85, FFFFFEE0
        lea     edx, [eax+7H]                           ; 2C45 _ 8D. 50, 07
        test    eax, eax                                ; 2C48 _ 85. C0
        cmovs   eax, edx                                ; 2C4A _ 0F 48. C2
        sar     eax, 3                                  ; 2C4D _ C1. F8, 03
        lea     edx, [eax-2H]                           ; 2C50 _ 8D. 50, FE
        movzx   eax, byte [ebp-125H]                    ; 2C53 _ 0F B6. 85, FFFFFEDB
        mov     byte [ebp+edx-0AAH], al                 ; 2C5A _ 88. 84 15, FFFFFF56
        mov     eax, dword [sheet_control]              ; 2C61 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2C66 _ C7. 44 24, 14, 00000007
        lea     edx, [ebp-0CCH]                         ; 2C6E _ 8D. 95, FFFFFF34
        mov     dword [esp+10H], edx                    ; 2C74 _ 89. 54 24, 10
        mov     edx, dword [ebp-11CH]                   ; 2C78 _ 8B. 95, FFFFFEE4
        mov     dword [esp+0CH], edx                    ; 2C7E _ 89. 54 24, 0C
        mov     edx, dword [ebp-120H]                   ; 2C82 _ 8B. 95, FFFFFEE0
        mov     dword [esp+8H], edx                     ; 2C88 _ 89. 54 24, 08
        mov     edx, dword [ebp-12CH]                   ; 2C8C _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 2C92 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2C96 _ 89. 04 24
        call    paint_string                            ; 2C99 _ E8, FFFFFFFC(rel)
        add     dword [ebp-120H], 8                     ; 2C9E _ 83. 85, FFFFFEE0, 08
?_121:  cmp     dword [ebp-118H], 0                     ; 2CA5 _ 83. BD, FFFFFEE8, 00
        js      ?_122                                   ; 2CAC _ 78, 3A
        mov     eax, dword [sheet_control]              ; 2CAE _ A1, 00000000(d)
        mov     edx, dword [ebp-118H]                   ; 2CB3 _ 8B. 95, FFFFFEE8
        mov     dword [esp+10H], edx                    ; 2CB9 _ 89. 54 24, 10
        mov     edx, dword [ebp-11CH]                   ; 2CBD _ 8B. 95, FFFFFEE4
        mov     dword [esp+0CH], edx                    ; 2CC3 _ 89. 54 24, 0C
        mov     edx, dword [ebp-120H]                   ; 2CC7 _ 8B. 95, FFFFFEE0
        mov     dword [esp+8H], edx                     ; 2CCD _ 89. 54 24, 08
        mov     edx, dword [ebp-12CH]                   ; 2CD1 _ 8B. 95, FFFFFED4
        mov     dword [esp+4H], edx                     ; 2CD7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2CDB _ 89. 04 24
        call    set_cursor                              ; 2CDE _ E8, FFFFFFFC(rel)
        jmp     ?_078                                   ; 2CE3 _ E9, FFFFF4BD

?_122:  jmp     ?_078                                   ; 2CE8 _ E9, FFFFF4B8
; console_task End of function

launch_console:; Function begin
        push    ebp                                     ; 2CED _ 55
        mov     ebp, esp                                ; 2CEE _ 89. E5
        push    ebx                                     ; 2CF0 _ 53
        sub     esp, 52                                 ; 2CF1 _ 83. EC, 34
        mov     eax, dword [sheet_control]              ; 2CF4 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 2CF9 _ 89. 04 24
        call    sheet_alloc                             ; 2CFC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 2D01 _ 89. 45, E8
        mov     eax, dword [memman]                     ; 2D04 _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 2D09 _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 2D11 _ 89. 04 24
        call    memman_alloc_4k                         ; 2D14 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 2D19 _ 89. 45, EC
        mov     dword [esp+10H], 99                     ; 2D1C _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 2D24 _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 2D2C _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-14H]                    ; 2D34 _ 8B. 45, EC
        mov     dword [esp+4H], eax                     ; 2D37 _ 89. 44 24, 04
        mov     eax, dword [ebp-18H]                    ; 2D3B _ 8B. 45, E8
        mov     dword [esp], eax                        ; 2D3E _ 89. 04 24
        call    sheet_setbuf                            ; 2D41 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2D46 _ A1, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 2D4B _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_314                   ; 2D53 _ C7. 44 24, 08, 00000084(d)
        mov     edx, dword [ebp-18H]                    ; 2D5B _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2D5E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2D62 _ 89. 04 24
        call    make_windows                            ; 2D65 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 2D6A _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 2D72 _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 2D7A _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 2D82 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 2D8A _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-18H]                    ; 2D92 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 2D95 _ 89. 04 24
        call    make_textbox                            ; 2D98 _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 2D9D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 2DA2 _ 89. 45, F0
        call    get_code32_addr                         ; 2DA5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2DAA _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2DAD _ 8B. 45, F0
        mov     dword [eax+8CH], 0                      ; 2DB0 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-10H]                    ; 2DBA _ 8B. 45, F0
        mov     dword [eax+90H], 1073741824             ; 2DBD _ C7. 80, 00000090, 40000000
        mov     eax, console_task                       ; 2DC7 _ B8, 00000000(d)
        sub     eax, dword [ebp-0CH]                    ; 2DCC _ 2B. 45, F4
        mov     edx, eax                                ; 2DCF _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 2DD1 _ 8B. 45, F0
        mov     dword [eax+4CH], edx                    ; 2DD4 _ 89. 50, 4C
        mov     eax, dword [ebp-10H]                    ; 2DD7 _ 8B. 45, F0
        mov     dword [eax+74H], 0                      ; 2DDA _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-10H]                    ; 2DE1 _ 8B. 45, F0
        mov     dword [eax+78H], 8                      ; 2DE4 _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-10H]                    ; 2DEB _ 8B. 45, F0
        mov     dword [eax+7CH], 48                     ; 2DEE _ C7. 40, 7C, 00000030
        mov     eax, dword [ebp-10H]                    ; 2DF5 _ 8B. 45, F0
        mov     dword [eax+80H], 32                     ; 2DF8 _ C7. 80, 00000080, 00000020
        mov     eax, dword [ebp-10H]                    ; 2E02 _ 8B. 45, F0
        mov     dword [eax+84H], 0                      ; 2E05 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-10H]                    ; 2E0F _ 8B. 45, F0
        mov     dword [eax+88H], 16                     ; 2E12 _ C7. 80, 00000088, 00000010
        mov     eax, dword [ebp-10H]                    ; 2E1C _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 2E1F _ 8B. 40, 64
        lea     edx, [eax-4H]                           ; 2E22 _ 8D. 50, FC
        mov     eax, dword [ebp-10H]                    ; 2E25 _ 8B. 45, F0
        mov     dword [eax+64H], edx                    ; 2E28 _ 89. 50, 64
        mov     eax, dword [ebp-10H]                    ; 2E2B _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 2E2E _ 8B. 40, 64
        add     eax, 4                                  ; 2E31 _ 83. C0, 04
        mov     edx, dword [ebp-18H]                    ; 2E34 _ 8B. 55, E8
        mov     dword [eax], edx                        ; 2E37 _ 89. 10
        mov     eax, dword [ebp-10H]                    ; 2E39 _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 2E3C _ 8B. 40, 64
        add     eax, 8                                  ; 2E3F _ 83. C0, 08
        mov     ebx, eax                                ; 2E42 _ 89. C3
        mov     eax, dword [memman]                     ; 2E44 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 2E49 _ 89. 04 24
        call    memman_total                            ; 2E4C _ E8, FFFFFFFC(rel)
        mov     dword [ebx], eax                        ; 2E51 _ 89. 03
        mov     dword [esp+8H], 5                       ; 2E53 _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 2E5B _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-10H]                    ; 2E63 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 2E66 _ 89. 04 24
        call    task_run                                ; 2E69 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2E6E _ A1, 00000000(d)
        mov     dword [esp+0CH], 4                      ; 2E73 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 2E7B _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-18H]                    ; 2E83 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2E86 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2E8A _ 89. 04 24
        call    sheet_slide                             ; 2E8D _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2E92 _ A1, 00000000(d)
        mov     dword [esp+8H], 1                       ; 2E97 _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-18H]                    ; 2E9F _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2EA2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2EA6 _ 89. 04 24
        call    sheet_updown                            ; 2EA9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2EAE _ 8B. 45, F0
        mov     dword [task_console_g], eax             ; 2EB1 _ A3, 00000000(d)
        mov     eax, dword [ebp-18H]                    ; 2EB6 _ 8B. 45, E8
        add     esp, 52                                 ; 2EB9 _ 83. C4, 34
        pop     ebx                                     ; 2EBC _ 5B
        pop     ebp                                     ; 2EBD _ 5D
        ret                                             ; 2EBE _ C3
; launch_console End of function

set_cursor:; Function begin
        push    ebp                                     ; 2EBF _ 55
        mov     ebp, esp                                ; 2EC0 _ 89. E5
        push    esi                                     ; 2EC2 _ 56
        push    ebx                                     ; 2EC3 _ 53
        sub     esp, 32                                 ; 2EC4 _ 83. EC, 20
        mov     eax, dword [ebp+14H]                    ; 2EC7 _ 8B. 45, 14
        lea     esi, [eax+0FH]                          ; 2ECA _ 8D. 70, 0F
        mov     eax, dword [ebp+10H]                    ; 2ECD _ 8B. 45, 10
        lea     ebx, [eax+7H]                           ; 2ED0 _ 8D. 58, 07
        mov     eax, dword [ebp+18H]                    ; 2ED3 _ 8B. 45, 18
        movzx   ecx, al                                 ; 2ED6 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 2ED9 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 2EDC _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2EDF _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2EE2 _ 8B. 00
        mov     dword [esp+18H], esi                    ; 2EE4 _ 89. 74 24, 18
        mov     dword [esp+14H], ebx                    ; 2EE8 _ 89. 5C 24, 14
        mov     ebx, dword [ebp+14H]                    ; 2EEC _ 8B. 5D, 14
        mov     dword [esp+10H], ebx                    ; 2EEF _ 89. 5C 24, 10
        mov     ebx, dword [ebp+10H]                    ; 2EF3 _ 8B. 5D, 10
        mov     dword [esp+0CH], ebx                    ; 2EF6 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2EFA _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2EFE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2F02 _ 89. 04 24
        call    paint_rectangle                         ; 2F05 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 2F0A _ 8B. 45, 14
        lea     edx, [eax+10H]                          ; 2F0D _ 8D. 50, 10
        mov     eax, dword [ebp+10H]                    ; 2F10 _ 8B. 45, 10
        add     eax, 8                                  ; 2F13 _ 83. C0, 08
        mov     dword [esp+14H], edx                    ; 2F16 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 2F1A _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 2F1E _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 2F21 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 2F25 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 2F28 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2F2C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2F2F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F33 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F36 _ 89. 04 24
        call    sheet_refresh                           ; 2F39 _ E8, FFFFFFFC(rel)
        add     esp, 32                                 ; 2F3E _ 83. C4, 20
        pop     ebx                                     ; 2F41 _ 5B
        pop     esi                                     ; 2F42 _ 5E
        pop     ebp                                     ; 2F43 _ 5D
        ret                                             ; 2F44 _ C3
; set_cursor End of function

console_new_line:; Function begin
        push    ebp                                     ; 2F45 _ 55
        mov     ebp, esp                                ; 2F46 _ 89. E5
        push    ebx                                     ; 2F48 _ 53
        sub     esp, 52                                 ; 2F49 _ 83. EC, 34
        cmp     dword [ebp+8H], 139                     ; 2F4C _ 81. 7D, 08, 0000008B
        jg      ?_123                                   ; 2F53 _ 7F, 09
        add     dword [ebp+8H], 16                      ; 2F55 _ 83. 45, 08, 10
        jmp     ?_132                                   ; 2F59 _ E9, 000000DF

?_123:  mov     dword [ebp-0CH], 28                     ; 2F5E _ C7. 45, F4, 0000001C
        jmp     ?_127                                   ; 2F65 _ EB, 52

?_124:  mov     dword [ebp-10H], 8                      ; 2F67 _ C7. 45, F0, 00000008
        jmp     ?_126                                   ; 2F6E _ EB, 3C

?_125:  mov     eax, dword [ebp+0CH]                    ; 2F70 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2F73 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2F75 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2F78 _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2F7B _ 0F AF. 45, F4
        mov     ecx, eax                                ; 2F7F _ 89. C1
        mov     eax, dword [ebp-10H]                    ; 2F81 _ 8B. 45, F0
        add     eax, ecx                                ; 2F84 _ 01. C8
        add     edx, eax                                ; 2F86 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2F88 _ 8B. 45, 0C
        mov     ecx, dword [eax]                        ; 2F8B _ 8B. 08
        mov     eax, dword [ebp-0CH]                    ; 2F8D _ 8B. 45, F4
        lea     ebx, [eax+10H]                          ; 2F90 _ 8D. 58, 10
        mov     eax, dword [ebp+0CH]                    ; 2F93 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2F96 _ 8B. 40, 04
        imul    ebx, eax                                ; 2F99 _ 0F AF. D8
        mov     eax, dword [ebp-10H]                    ; 2F9C _ 8B. 45, F0
        add     eax, ebx                                ; 2F9F _ 01. D8
        add     eax, ecx                                ; 2FA1 _ 01. C8
        movzx   eax, byte [eax]                         ; 2FA3 _ 0F B6. 00
        mov     byte [edx], al                          ; 2FA6 _ 88. 02
        add     dword [ebp-10H], 1                      ; 2FA8 _ 83. 45, F0, 01
?_126:  cmp     dword [ebp-10H], 247                    ; 2FAC _ 81. 7D, F0, 000000F7
        jle     ?_125                                   ; 2FB3 _ 7E, BB
        add     dword [ebp-0CH], 1                      ; 2FB5 _ 83. 45, F4, 01
?_127:  cmp     dword [ebp-0CH], 139                    ; 2FB9 _ 81. 7D, F4, 0000008B
        jle     ?_124                                   ; 2FC0 _ 7E, A5
        mov     dword [ebp-0CH], 140                    ; 2FC2 _ C7. 45, F4, 0000008C
        jmp     ?_131                                   ; 2FC9 _ EB, 35

?_128:  mov     dword [ebp-10H], 8                      ; 2FCB _ C7. 45, F0, 00000008
        jmp     ?_130                                   ; 2FD2 _ EB, 1F

?_129:  mov     eax, dword [ebp+0CH]                    ; 2FD4 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 2FD7 _ 8B. 10
        mov     eax, dword [ebp+0CH]                    ; 2FD9 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2FDC _ 8B. 40, 04
        imul    eax, dword [ebp-0CH]                    ; 2FDF _ 0F AF. 45, F4
        mov     ecx, eax                                ; 2FE3 _ 89. C1
        mov     eax, dword [ebp-10H]                    ; 2FE5 _ 8B. 45, F0
        add     eax, ecx                                ; 2FE8 _ 01. C8
        add     eax, edx                                ; 2FEA _ 01. D0
        mov     byte [eax], 0                           ; 2FEC _ C6. 00, 00
        add     dword [ebp-10H], 1                      ; 2FEF _ 83. 45, F0, 01
?_130:  cmp     dword [ebp-10H], 247                    ; 2FF3 _ 81. 7D, F0, 000000F7
        jle     ?_129                                   ; 2FFA _ 7E, D8
        add     dword [ebp-0CH], 1                      ; 2FFC _ 83. 45, F4, 01
?_131:  cmp     dword [ebp-0CH], 155                    ; 3000 _ 81. 7D, F4, 0000009B
        jle     ?_128                                   ; 3007 _ 7E, C2
        mov     eax, dword [sheet_control]              ; 3009 _ A1, 00000000(d)
        mov     dword [esp+14H], 156                    ; 300E _ C7. 44 24, 14, 0000009C
        mov     dword [esp+10H], 248                    ; 3016 _ C7. 44 24, 10, 000000F8
        mov     dword [esp+0CH], 28                     ; 301E _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 3026 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 302E _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 3031 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3035 _ 89. 04 24
        call    sheet_refresh                           ; 3038 _ E8, FFFFFFFC(rel)
?_132:  mov     eax, dword [sheet_control]              ; 303D _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 3042 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_306                  ; 304A _ C7. 44 24, 10, 00000060(d)
        mov     edx, dword [ebp+8H]                     ; 3052 _ 8B. 55, 08
        mov     dword [esp+0CH], edx                    ; 3055 _ 89. 54 24, 0C
        mov     dword [esp+8H], 8                       ; 3059 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp+0CH]                    ; 3061 _ 8B. 55, 0C
        mov     dword [esp+4H], edx                     ; 3064 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3068 _ 89. 04 24
        call    paint_string                            ; 306B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 3070 _ 8B. 45, 08
        add     esp, 52                                 ; 3073 _ 83. C4, 34
        pop     ebx                                     ; 3076 _ 5B
        pop     ebp                                     ; 3077 _ 5D
        ret                                             ; 3078 _ C3
; console_new_line End of function

strcmp: ; Function begin
        push    ebp                                     ; 3079 _ 55
        mov     ebp, esp                                ; 307A _ 89. E5
        sub     esp, 16                                 ; 307C _ 83. EC, 10
        cmp     dword [ebp+8H], 0                       ; 307F _ 83. 7D, 08, 00
        jz      ?_133                                   ; 3083 _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 3085 _ 83. 7D, 0C, 00
        jnz     ?_134                                   ; 3089 _ 75, 0A
?_133:  mov     eax, 0                                  ; 308B _ B8, 00000000
        jmp     ?_141                                   ; 3090 _ E9, 00000092

?_134:  mov     dword [ebp-4H], 0                       ; 3095 _ C7. 45, FC, 00000000
        jmp     ?_137                                   ; 309C _ EB, 25

?_135:  mov     edx, dword [ebp-4H]                     ; 309E _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 30A1 _ 8B. 45, 08
        add     eax, edx                                ; 30A4 _ 01. D0
        movzx   edx, byte [eax]                         ; 30A6 _ 0F B6. 10
        mov     ecx, dword [ebp-4H]                     ; 30A9 _ 8B. 4D, FC
        mov     eax, dword [ebp+0CH]                    ; 30AC _ 8B. 45, 0C
        add     eax, ecx                                ; 30AF _ 01. C8
        movzx   eax, byte [eax]                         ; 30B1 _ 0F B6. 00
        cmp     dl, al                                  ; 30B4 _ 38. C2
        jz      ?_136                                   ; 30B6 _ 74, 07
        mov     eax, 0                                  ; 30B8 _ B8, 00000000
        jmp     ?_141                                   ; 30BD _ EB, 68

?_136:  add     dword [ebp-4H], 1                       ; 30BF _ 83. 45, FC, 01
?_137:  mov     edx, dword [ebp-4H]                     ; 30C3 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 30C6 _ 8B. 45, 08
        add     eax, edx                                ; 30C9 _ 01. D0
        movzx   eax, byte [eax]                         ; 30CB _ 0F B6. 00
        test    al, al                                  ; 30CE _ 84. C0
        jz      ?_138                                   ; 30D0 _ 74, 06
        cmp     dword [ebp+0CH], 0                      ; 30D2 _ 83. 7D, 0C, 00
        jnz     ?_135                                   ; 30D6 _ 75, C6
?_138:  mov     edx, dword [ebp-4H]                     ; 30D8 _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 30DB _ 8B. 45, 08
        add     eax, edx                                ; 30DE _ 01. D0
        movzx   eax, byte [eax]                         ; 30E0 _ 0F B6. 00
        test    al, al                                  ; 30E3 _ 84. C0
        jnz     ?_139                                   ; 30E5 _ 75, 16
        mov     edx, dword [ebp-4H]                     ; 30E7 _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 30EA _ 8B. 45, 0C
        add     eax, edx                                ; 30ED _ 01. D0
        movzx   eax, byte [eax]                         ; 30EF _ 0F B6. 00
        test    al, al                                  ; 30F2 _ 84. C0
        jz      ?_139                                   ; 30F4 _ 74, 07
        mov     eax, 0                                  ; 30F6 _ B8, 00000000
        jmp     ?_141                                   ; 30FB _ EB, 2A

?_139:  mov     edx, dword [ebp-4H]                     ; 30FD _ 8B. 55, FC
        mov     eax, dword [ebp+8H]                     ; 3100 _ 8B. 45, 08
        add     eax, edx                                ; 3103 _ 01. D0
        movzx   eax, byte [eax]                         ; 3105 _ 0F B6. 00
        test    al, al                                  ; 3108 _ 84. C0
        jz      ?_140                                   ; 310A _ 74, 16
        mov     edx, dword [ebp-4H]                     ; 310C _ 8B. 55, FC
        mov     eax, dword [ebp+0CH]                    ; 310F _ 8B. 45, 0C
        add     eax, edx                                ; 3112 _ 01. D0
        movzx   eax, byte [eax]                         ; 3114 _ 0F B6. 00
        test    al, al                                  ; 3117 _ 84. C0
        jz      ?_140                                   ; 3119 _ 74, 07
        mov     eax, 0                                  ; 311B _ B8, 00000000
        jmp     ?_141                                   ; 3120 _ EB, 05

?_140:  mov     eax, 1                                  ; 3122 _ B8, 00000001
?_141:  leave                                           ; 3127 _ C9
        ret                                             ; 3128 _ C3
; strcmp End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 3129 _ 55
        mov     ebp, esp                                ; 312A _ 89. E5
        sub     esp, 24                                 ; 312C _ 83. EC, 18
?_142:  mov     dword [esp], 100                        ; 312F _ C7. 04 24, 00000064
        call    io_in8                                  ; 3136 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 313B _ 83. E0, 02
        test    eax, eax                                ; 313E _ 85. C0
        jnz     ?_143                                   ; 3140 _ 75, 02
        jmp     ?_144                                   ; 3142 _ EB, 02

?_143:  jmp     ?_142                                   ; 3144 _ EB, E9

?_144:  leave                                           ; 3146 _ C9
        ret                                             ; 3147 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 3148 _ 55
        mov     ebp, esp                                ; 3149 _ 89. E5
        sub     esp, 24                                 ; 314B _ 83. EC, 18
        call    wait_KBC_sendready                      ; 314E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 3153 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 315B _ C7. 04 24, 00000064
        call    io_out8                                 ; 3162 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 3167 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 316C _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 3174 _ C7. 04 24, 00000060
        call    io_out8                                 ; 317B _ E8, FFFFFFFC(rel)
        leave                                           ; 3180 _ C9
        ret                                             ; 3181 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 3182 _ 55
        mov     ebp, esp                                ; 3183 _ 89. E5
        sub     esp, 24                                 ; 3185 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 3188 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 318D _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 3195 _ C7. 04 24, 00000064
        call    io_out8                                 ; 319C _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 31A1 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 31A6 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 31AE _ C7. 04 24, 00000060
        call    io_out8                                 ; 31B5 _ E8, FFFFFFFC(rel)
        leave                                           ; 31BA _ C9
        ret                                             ; 31BB _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 31BC _ 55
        mov     ebp, esp                                ; 31BD _ 89. E5
        sub     esp, 4                                  ; 31BF _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 31C2 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 31C5 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 31C8 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 31CB _ 0F B6. 40, 03
        test    al, al                                  ; 31CF _ 84. C0
        jnz     ?_146                                   ; 31D1 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 31D3 _ 80. 7D, FC, FA
        jnz     ?_145                                   ; 31D7 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 31D9 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 31DC _ C6. 40, 03, 01
?_145:  mov     eax, 0                                  ; 31E0 _ B8, 00000000
        jmp     ?_153                                   ; 31E5 _ E9, 0000010F

?_146:  mov     eax, dword [ebp+8H]                     ; 31EA _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 31ED _ 0F B6. 40, 03
        cmp     al, 1                                   ; 31F1 _ 3C, 01
        jnz     ?_148                                   ; 31F3 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 31F5 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 31F9 _ 25, 000000C8
        cmp     eax, 8                                  ; 31FE _ 83. F8, 08
        jnz     ?_147                                   ; 3201 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 3203 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3206 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 320A _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 320C _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 320F _ C6. 40, 03, 02
?_147:  mov     eax, 0                                  ; 3213 _ B8, 00000000
        jmp     ?_153                                   ; 3218 _ E9, 000000DC

?_148:  mov     eax, dword [ebp+8H]                     ; 321D _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3220 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 3224 _ 3C, 02
        jnz     ?_149                                   ; 3226 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 3228 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 322B _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 322F _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3232 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 3235 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 3239 _ B8, 00000000
        jmp     ?_153                                   ; 323E _ E9, 000000B6

?_149:  mov     eax, dword [ebp+8H]                     ; 3243 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 3246 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 324A _ 3C, 03
        jne     ?_152                                   ; 324C _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 3252 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3255 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 3259 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 325C _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 325F _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 3263 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 3266 _ 0F B6. 00
        movzx   eax, al                                 ; 3269 _ 0F B6. C0
        and     eax, 07H                                ; 326C _ 83. E0, 07
        mov     edx, eax                                ; 326F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3271 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3274 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3277 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 327A _ 0F B6. 40, 01
        movzx   edx, al                                 ; 327E _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 3281 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3284 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3287 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 328A _ 0F B6. 40, 02
        movzx   edx, al                                 ; 328E _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 3291 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3294 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3297 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 329A _ 0F B6. 00
        movzx   eax, al                                 ; 329D _ 0F B6. C0
        and     eax, 10H                                ; 32A0 _ 83. E0, 10
        test    eax, eax                                ; 32A3 _ 85. C0
        jz      ?_150                                   ; 32A5 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 32A7 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 32AA _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 32AD _ 0D, FFFFFF00
        mov     edx, eax                                ; 32B2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 32B4 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 32B7 _ 89. 50, 04
?_150:  mov     eax, dword [ebp+8H]                     ; 32BA _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 32BD _ 0F B6. 00
        movzx   eax, al                                 ; 32C0 _ 0F B6. C0
        and     eax, 20H                                ; 32C3 _ 83. E0, 20
        test    eax, eax                                ; 32C6 _ 85. C0
        jz      ?_151                                   ; 32C8 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 32CA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 32CD _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 32D0 _ 0D, FFFFFF00
        mov     edx, eax                                ; 32D5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 32D7 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 32DA _ 89. 50, 08
?_151:  mov     eax, dword [ebp+8H]                     ; 32DD _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 32E0 _ 8B. 40, 08
        neg     eax                                     ; 32E3 _ F7. D8
        mov     edx, eax                                ; 32E5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 32E7 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 32EA _ 89. 50, 08
        mov     eax, 1                                  ; 32ED _ B8, 00000001
        jmp     ?_153                                   ; 32F2 _ EB, 05

?_152:  mov     eax, 4294967295                         ; 32F4 _ B8, FFFFFFFF
?_153:  leave                                           ; 32F9 _ C9
        ret                                             ; 32FA _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 32FB _ 55
        mov     ebp, esp                                ; 32FC _ 89. E5
        sub     esp, 40                                 ; 32FE _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 3301 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 3309 _ C7. 04 24, 00000020
        call    io_out8                                 ; 3310 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 3315 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 331D _ C7. 04 24, 000000A0
        call    io_out8                                 ; 3324 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 3329 _ C7. 04 24, 00000060
        call    io_in8                                  ; 3330 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 3335 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 3338 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 333C _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 3340 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 3347 _ E8, FFFFFFFC(rel)
        leave                                           ; 334C _ C9
        ret                                             ; 334D _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 334E _ 55
        mov     ebp, esp                                ; 334F _ 89. E5
        sub     esp, 40                                 ; 3351 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 3354 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 335C _ C7. 04 24, 00000020
        call    io_out8                                 ; 3363 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 3368 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 3370 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 3377 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 337C _ C7. 04 24, 00000060
        call    io_in8                                  ; 3383 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 3388 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 338B _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 338F _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 3393 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 339A _ E8, FFFFFFFC(rel)
        leave                                           ; 339F _ C9
        ret                                             ; 33A0 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 33A1 _ 55
        mov     ebp, esp                                ; 33A2 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 33A4 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 33A7 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 33AA _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 33AC _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 33AF _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 33B6 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 33B9 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 33C0 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 33C3 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 33C6 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 33C9 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 33CC _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 33CF _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 33D2 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 33D5 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 33DC _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 33DF _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 33E2 _ 89. 50, 18
        pop     ebp                                     ; 33E5 _ 5D
        ret                                             ; 33E6 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 33E7 _ 55
        mov     ebp, esp                                ; 33E8 _ 89. E5
        sub     esp, 40                                 ; 33EA _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 33ED _ 8B. 45, 0C
        mov     byte [ebp-1CH], al                      ; 33F0 _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 33F3 _ 83. 7D, 08, 00
        jnz     ?_154                                   ; 33F7 _ 75, 0A
        mov     eax, 4294967295                         ; 33F9 _ B8, FFFFFFFF
        jmp     ?_158                                   ; 33FE _ E9, 000000B1

?_154:  mov     eax, dword [ebp+8H]                     ; 3403 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3406 _ 8B. 40, 10
        test    eax, eax                                ; 3409 _ 85. C0
        jnz     ?_155                                   ; 340B _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 340D _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 3410 _ 8B. 40, 14
        or      eax, 01H                                ; 3413 _ 83. C8, 01
        mov     edx, eax                                ; 3416 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3418 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 341B _ 89. 50, 14
        mov     eax, 4294967295                         ; 341E _ B8, FFFFFFFF
        jmp     ?_158                                   ; 3423 _ E9, 0000008C

?_155:  mov     eax, dword [ebp+8H]                     ; 3428 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 342B _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 342E _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3431 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 3434 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 3436 _ 8B. 45, F4
        add     edx, eax                                ; 3439 _ 01. C2
        movzx   eax, byte [ebp-1CH]                     ; 343B _ 0F B6. 45, E4
        mov     byte [edx], al                          ; 343F _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 3441 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3444 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 3447 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 344A _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 344D _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3450 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3453 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3456 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3459 _ 8B. 40, 0C
        cmp     edx, eax                                ; 345C _ 39. C2
        jnz     ?_156                                   ; 345E _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 3460 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3463 _ C7. 40, 04, 00000000
?_156:  mov     eax, dword [ebp+8H]                     ; 346A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 346D _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 3470 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3473 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 3476 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 3479 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 347C _ 8B. 40, 18
        test    eax, eax                                ; 347F _ 85. C0
        jz      ?_157                                   ; 3481 _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 3483 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 3486 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 3489 _ 8B. 40, 04
        cmp     eax, 2                                  ; 348C _ 83. F8, 02
        jz      ?_157                                   ; 348F _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 3491 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 3494 _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 3497 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 349F _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 34A7 _ 89. 04 24
        call    task_run                                ; 34AA _ E8, FFFFFFFC(rel)
?_157:  mov     eax, 0                                  ; 34AF _ B8, 00000000
?_158:  leave                                           ; 34B4 _ C9
        ret                                             ; 34B5 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 34B6 _ 55
        mov     ebp, esp                                ; 34B7 _ 89. E5
        sub     esp, 16                                 ; 34B9 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 34BC _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 34BF _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 34C2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 34C5 _ 8B. 40, 0C
        cmp     edx, eax                                ; 34C8 _ 39. C2
        jnz     ?_159                                   ; 34CA _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 34CC _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 34CF _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 34D6 _ B8, FFFFFFFF
        jmp     ?_161                                   ; 34DB _ EB, 57

?_159:  mov     eax, dword [ebp+8H]                     ; 34DD _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 34E0 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 34E3 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 34E6 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 34E9 _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 34EB _ 8B. 45, F8
        add     eax, edx                                ; 34EE _ 01. D0
        movzx   eax, byte [eax]                         ; 34F0 _ 0F B6. 00
        movzx   eax, al                                 ; 34F3 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 34F6 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 34F9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 34FC _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 34FF _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3502 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3505 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3508 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 350B _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 350E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3511 _ 8B. 40, 0C
        cmp     edx, eax                                ; 3514 _ 39. C2
        jnz     ?_160                                   ; 3516 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 3518 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 351B _ C7. 40, 08, 00000000
?_160:  mov     eax, dword [ebp+8H]                     ; 3522 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3525 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 3528 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 352B _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 352E _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 3531 _ 8B. 45, FC
?_161:  leave                                           ; 3534 _ C9
        ret                                             ; 3535 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 3536 _ 55
        mov     ebp, esp                                ; 3537 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3539 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 353C _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 353F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3542 _ 8B. 40, 10
        sub     edx, eax                                ; 3545 _ 29. C2
        mov     eax, edx                                ; 3547 _ 89. D0
        pop     ebp                                     ; 3549 _ 5D
        ret                                             ; 354A _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 354B _ 55
        mov     ebp, esp                                ; 354C _ 89. E5
        sub     esp, 4                                  ; 354E _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 3551 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 3554 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 3557 _ 80. 7D, FC, 09
        jle     ?_162                                   ; 355B _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 355D _ 0F B6. 45, FC
        add     eax, 55                                 ; 3561 _ 83. C0, 37
        jmp     ?_163                                   ; 3564 _ EB, 07

?_162:  movzx   eax, byte [ebp-4H]                      ; 3566 _ 0F B6. 45, FC
        add     eax, 48                                 ; 356A _ 83. C0, 30
?_163:  leave                                           ; 356D _ C9
        ret                                             ; 356E _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 356F _ 55
        mov     ebp, esp                                ; 3570 _ 89. E5
        sub     esp, 24                                 ; 3572 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 3575 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 3578 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 357B _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 3582 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 3586 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 3589 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 358C _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 3590 _ 89. 04 24
        call    charToHexVal                            ; 3593 _ E8, FFFFFFFC(rel)
        mov     byte [?_316], al                        ; 3598 _ A2, 00000343(d)
        movzx   eax, byte [ebp-14H]                     ; 359D _ 0F B6. 45, EC
        shr     al, 4                                   ; 35A1 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 35A4 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 35A7 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 35AB _ 0F BE. C0
        mov     dword [esp], eax                        ; 35AE _ 89. 04 24
        call    charToHexVal                            ; 35B1 _ E8, FFFFFFFC(rel)
        mov     byte [?_315], al                        ; 35B6 _ A2, 00000342(d)
        mov     eax, keyval                             ; 35BB _ B8, 00000340(d)
        leave                                           ; 35C0 _ C9
        ret                                             ; 35C1 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 35C2 _ 55
        mov     ebp, esp                                ; 35C3 _ 89. E5
        sub     esp, 16                                 ; 35C5 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 35C8 _ C6. 05, 000002E0(d), 30
        mov     byte [?_319], 88                        ; 35CF _ C6. 05, 000002E1(d), 58
        mov     byte [?_320], 0                         ; 35D6 _ C6. 05, 000002EA(d), 00
        mov     dword [ebp-0CH], 2                      ; 35DD _ C7. 45, F4, 00000002
        jmp     ?_165                                   ; 35E4 _ EB, 0F

?_164:  mov     eax, dword [ebp-0CH]                    ; 35E6 _ 8B. 45, F4
        add     eax, str.1386                           ; 35E9 _ 05, 000002E0(d)
        mov     byte [eax], 48                          ; 35EE _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 35F1 _ 83. 45, F4, 01
?_165:  cmp     dword [ebp-0CH], 9                      ; 35F5 _ 83. 7D, F4, 09
        jle     ?_164                                   ; 35F9 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 35FB _ C7. 45, F8, 00000009
        jmp     ?_169                                   ; 3602 _ EB, 40

?_166:  mov     eax, dword [ebp+8H]                     ; 3604 _ 8B. 45, 08
        and     eax, 0FH                                ; 3607 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 360A _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 360D _ 8B. 45, 08
        shr     eax, 4                                  ; 3610 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 3613 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 3616 _ 83. 7D, FC, 09
        jle     ?_167                                   ; 361A _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 361C _ 8B. 45, FC
        add     eax, 55                                 ; 361F _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 3622 _ 8B. 55, F8
        add     edx, str.1386                           ; 3625 _ 81. C2, 000002E0(d)
        mov     byte [edx], al                          ; 362B _ 88. 02
        jmp     ?_168                                   ; 362D _ EB, 11

?_167:  mov     eax, dword [ebp-4H]                     ; 362F _ 8B. 45, FC
        add     eax, 48                                 ; 3632 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 3635 _ 8B. 55, F8
        add     edx, str.1386                           ; 3638 _ 81. C2, 000002E0(d)
        mov     byte [edx], al                          ; 363E _ 88. 02
?_168:  sub     dword [ebp-8H], 1                       ; 3640 _ 83. 6D, F8, 01
?_169:  cmp     dword [ebp-8H], 1                       ; 3644 _ 83. 7D, F8, 01
        jle     ?_170                                   ; 3648 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 364A _ 83. 7D, 08, 00
        jnz     ?_166                                   ; 364E _ 75, B4
?_170:  mov     eax, str.1386                           ; 3650 _ B8, 000002E0(d)
        leave                                           ; 3655 _ C9
        ret                                             ; 3656 _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 3657 _ 55
        mov     ebp, esp                                ; 3658 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 365A _ 8B. 45, 08
        mov     dword [eax], 0                          ; 365D _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 3663 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3666 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 366D _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 3670 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 3677 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 367A _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 3681 _ 5D
        ret                                             ; 3682 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 3683 _ 55
        mov     ebp, esp                                ; 3684 _ 89. E5
        sub     esp, 16                                 ; 3686 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3689 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 3690 _ C7. 45, F8, 00000000
        jmp     ?_172                                   ; 3697 _ EB, 14

?_171:  mov     eax, dword [ebp+8H]                     ; 3699 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 369C _ 8B. 55, F8
        add     edx, 2                                  ; 369F _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 36A2 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 36A6 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 36A9 _ 83. 45, F8, 01
?_172:  mov     eax, dword [ebp+8H]                     ; 36AD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 36B0 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 36B2 _ 3B. 45, F8
        ja      ?_171                                   ; 36B5 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 36B7 _ 8B. 45, FC
        leave                                           ; 36BA _ C9
        ret                                             ; 36BB _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 36BC _ 55
        mov     ebp, esp                                ; 36BD _ 89. E5
        sub     esp, 16                                 ; 36BF _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 36C2 _ C7. 45, F8, 00000000
        jmp     ?_176                                   ; 36C9 _ E9, 00000085

?_173:  mov     eax, dword [ebp+8H]                     ; 36CE _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 36D1 _ 8B. 55, F8
        add     edx, 2                                  ; 36D4 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 36D7 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 36DB _ 3B. 45, 0C
        jc      ?_175                                   ; 36DE _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 36E0 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 36E3 _ 8B. 55, F8
        add     edx, 2                                  ; 36E6 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 36E9 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 36EC _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 36EF _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 36F2 _ 8B. 55, F8
        add     edx, 2                                  ; 36F5 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 36F8 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 36FB _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 36FE _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3701 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3704 _ 8B. 55, F8
        add     edx, 2                                  ; 3707 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 370A _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 370D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3710 _ 8B. 55, F8
        add     edx, 2                                  ; 3713 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3716 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 371A _ 2B. 45, 0C
        mov     edx, eax                                ; 371D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 371F _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 3722 _ 8B. 4D, F8
        add     ecx, 2                                  ; 3725 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 3728 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 372C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 372F _ 8B. 55, F8
        add     edx, 2                                  ; 3732 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 3735 _ 8B. 44 D0, 04
        test    eax, eax                                ; 3739 _ 85. C0
        jnz     ?_174                                   ; 373B _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 373D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3740 _ 8B. 00
        lea     edx, [eax-1H]                           ; 3742 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3745 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3748 _ 89. 10
?_174:  mov     eax, dword [ebp-4H]                     ; 374A _ 8B. 45, FC
        jmp     ?_177                                   ; 374D _ EB, 17

?_175:  add     dword [ebp-8H], 1                       ; 374F _ 83. 45, F8, 01
?_176:  mov     eax, dword [ebp+8H]                     ; 3753 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3756 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3758 _ 3B. 45, F8
        ja      ?_173                                   ; 375B _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 3761 _ B8, 00000000
?_177:  leave                                           ; 3766 _ C9
        ret                                             ; 3767 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 3768 _ 55
        mov     ebp, esp                                ; 3769 _ 89. E5
        push    ebx                                     ; 376B _ 53
        sub     esp, 16                                 ; 376C _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 376F _ C7. 45, F4, 00000000
        jmp     ?_180                                   ; 3776 _ EB, 17

?_178:  mov     eax, dword [ebp+8H]                     ; 3778 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 377B _ 8B. 55, F4
        add     edx, 2                                  ; 377E _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3781 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 3784 _ 3B. 45, 0C
        jbe     ?_179                                   ; 3787 _ 76, 02
        jmp     ?_181                                   ; 3789 _ EB, 0E

?_179:  add     dword [ebp-0CH], 1                      ; 378B _ 83. 45, F4, 01
?_180:  mov     eax, dword [ebp+8H]                     ; 378F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3792 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3794 _ 3B. 45, F4
        jg      ?_178                                   ; 3797 _ 7F, DF
?_181:  cmp     dword [ebp-0CH], 0                      ; 3799 _ 83. 7D, F4, 00
        jle     ?_183                                   ; 379D _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 37A3 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 37A6 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 37A9 _ 8B. 45, 08
        add     edx, 2                                  ; 37AC _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 37AF _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 37B2 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 37B5 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 37B8 _ 8B. 45, 08
        add     ecx, 2                                  ; 37BB _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 37BE _ 8B. 44 C8, 04
        add     eax, edx                                ; 37C2 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 37C4 _ 3B. 45, 0C
        jne     ?_183                                   ; 37C7 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 37CD _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 37D0 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 37D3 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 37D6 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 37D9 _ 8B. 45, 08
        add     edx, 2                                  ; 37DC _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 37DF _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 37E3 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 37E6 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 37E9 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 37EC _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 37EF _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 37F3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 37F6 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 37F8 _ 3B. 45, F4
        jle     ?_182                                   ; 37FB _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 37FD _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 3800 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 3803 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3806 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3809 _ 8B. 55, F4
        add     edx, 2                                  ; 380C _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 380F _ 8B. 04 D0
        cmp     ecx, eax                                ; 3812 _ 39. C1
        jnz     ?_182                                   ; 3814 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 3816 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 3819 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 381C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 381F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3822 _ 8B. 45, 08
        add     edx, 2                                  ; 3825 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3828 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 382C _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 382F _ 8B. 4D, F4
        add     ecx, 2                                  ; 3832 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 3835 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 3839 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 383C _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 383F _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 3842 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 3846 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3849 _ 8B. 00
        lea     edx, [eax-1H]                           ; 384B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 384E _ 8B. 45, 08
        mov     dword [eax], edx                        ; 3851 _ 89. 10
?_182:  mov     eax, 0                                  ; 3853 _ B8, 00000000
        jmp     ?_189                                   ; 3858 _ E9, 0000011C

?_183:  mov     eax, dword [ebp+8H]                     ; 385D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3860 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 3862 _ 3B. 45, F4
        jle     ?_184                                   ; 3865 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 3867 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 386A _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 386D _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 3870 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3873 _ 8B. 55, F4
        add     edx, 2                                  ; 3876 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 3879 _ 8B. 04 D0
        cmp     ecx, eax                                ; 387C _ 39. C1
        jnz     ?_184                                   ; 387E _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 3880 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3883 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3886 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3889 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 388C _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 388F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 3892 _ 8B. 55, F4
        add     edx, 2                                  ; 3895 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 3898 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 389C _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 389F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 38A2 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 38A5 _ 8B. 55, F4
        add     edx, 2                                  ; 38A8 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 38AB _ 89. 4C D0, 04
        mov     eax, 0                                  ; 38AF _ B8, 00000000
        jmp     ?_189                                   ; 38B4 _ E9, 000000C0

?_184:  mov     eax, dword [ebp+8H]                     ; 38B9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 38BC _ 8B. 00
        cmp     eax, 4095                               ; 38BE _ 3D, 00000FFF
        jg      ?_188                                   ; 38C3 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 38C9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 38CC _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 38CE _ 89. 45, F8
        jmp     ?_186                                   ; 38D1 _ EB, 28

?_185:  mov     eax, dword [ebp-8H]                     ; 38D3 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 38D6 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 38D9 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 38DC _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 38DF _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 38E2 _ 8B. 45, 08
        add     edx, 2                                  ; 38E5 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 38E8 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 38EB _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 38ED _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 38F0 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 38F3 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 38F7 _ 83. 6D, F8, 01
?_186:  mov     eax, dword [ebp-8H]                     ; 38FB _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 38FE _ 3B. 45, F4
        jg      ?_185                                   ; 3901 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 3903 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3906 _ 8B. 00
        lea     edx, [eax+1H]                           ; 3908 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 390B _ 8B. 45, 08
        mov     dword [eax], edx                        ; 390E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3910 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 3913 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3916 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3919 _ 8B. 00
        cmp     edx, eax                                ; 391B _ 39. C2
        jge     ?_187                                   ; 391D _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 391F _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 3922 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 3924 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 3927 _ 89. 50, 04
?_187:  mov     eax, dword [ebp+8H]                     ; 392A _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 392D _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 3930 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 3933 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 3936 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 3939 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 393C _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 393F _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 3942 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 3945 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 3949 _ B8, 00000000
        jmp     ?_189                                   ; 394E _ EB, 29

?_188:  mov     eax, dword [ebp+8H]                     ; 3950 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3953 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 3956 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3959 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 395C _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 395F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3962 _ 8B. 40, 08
        mov     edx, eax                                ; 3965 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 3967 _ 8B. 45, 10
        add     eax, edx                                ; 396A _ 01. D0
        mov     edx, eax                                ; 396C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 396E _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 3971 _ 89. 50, 08
        mov     eax, 4294967295                         ; 3974 _ B8, FFFFFFFF
?_189:  add     esp, 16                                 ; 3979 _ 83. C4, 10
        pop     ebx                                     ; 397C _ 5B
        pop     ebp                                     ; 397D _ 5D
        ret                                             ; 397E _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 397F _ 55
        mov     ebp, esp                                ; 3980 _ 89. E5
        sub     esp, 24                                 ; 3982 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 3985 _ 8B. 45, 0C
        add     eax, 4095                               ; 3988 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 398D _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 3992 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 3995 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 3998 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 399C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 399F _ 89. 04 24
        call    memman_alloc                            ; 39A2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 39A7 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 39AA _ 8B. 45, FC
        leave                                           ; 39AD _ C9
        ret                                             ; 39AE _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 39AF _ 55
        mov     ebp, esp                                ; 39B0 _ 89. E5
        sub     esp, 28                                 ; 39B2 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 39B5 _ 8B. 45, 10
        add     eax, 4095                               ; 39B8 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 39BD _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 39C2 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 39C5 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 39C8 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 39CC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 39CF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 39D3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 39D6 _ 89. 04 24
        call    memman_free                             ; 39D9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 39DE _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 39E1 _ 8B. 45, FC
        leave                                           ; 39E4 _ C9
        ret                                             ; 39E5 _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 39E6 _ 55
        mov     ebp, esp                                ; 39E7 _ 89. E5
        sub     esp, 40                                 ; 39E9 _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 39EC _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 39F4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 39F7 _ 89. 04 24
        call    memman_alloc_4k                         ; 39FA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 39FF _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 3A02 _ 83. 7D, F4, 00
        jnz     ?_190                                   ; 3A06 _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 3A08 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 3A0B _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 3A13 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3A17 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3A1A _ 89. 04 24
        call    memman_free_4k                          ; 3A1D _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3A22 _ B8, 00000000
        jmp     ?_194                                   ; 3A27 _ E9, 0000009D

?_190:  mov     eax, dword [ebp-0CH]                    ; 3A2C _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 3A2F _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3A32 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 3A34 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 3A37 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 3A3A _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3A3D _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 3A40 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3A43 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3A46 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 3A49 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 3A50 _ C7. 45, F0, 00000000
        jmp     ?_192                                   ; 3A57 _ EB, 1B

?_191:  mov     eax, dword [ebp-0CH]                    ; 3A59 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 3A5C _ 8B. 55, F0
        add     edx, 33                                 ; 3A5F _ 83. C2, 21
        shl     edx, 5                                  ; 3A62 _ C1. E2, 05
        add     eax, edx                                ; 3A65 _ 01. D0
        add     eax, 16                                 ; 3A67 _ 83. C0, 10
        mov     dword [eax], 0                          ; 3A6A _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 3A70 _ 83. 45, F0, 01
?_192:  cmp     dword [ebp-10H], 255                    ; 3A74 _ 81. 7D, F0, 000000FF
        jle     ?_191                                   ; 3A7B _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 3A7D _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 3A80 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 3A84 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3A88 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3A8B _ 89. 04 24
        call    memman_alloc_4k                         ; 3A8E _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 3A93 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3A95 _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 3A98 _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 3A9B _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 3A9E _ 8B. 40, 10
        test    eax, eax                                ; 3AA1 _ 85. C0
        jnz     ?_193                                   ; 3AA3 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 3AA5 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 3AA8 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 3AB0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3AB4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3AB7 _ 89. 04 24
        call    memman_free_4k                          ; 3ABA _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3ABF _ B8, 00000000
        jmp     ?_194                                   ; 3AC4 _ EB, 03

?_193:  mov     eax, dword [ebp-0CH]                    ; 3AC6 _ 8B. 45, F4
?_194:  leave                                           ; 3AC9 _ C9
        ret                                             ; 3ACA _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 3ACB _ 55
        mov     ebp, esp                                ; 3ACC _ 89. E5
        sub     esp, 16                                 ; 3ACE _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3AD1 _ C7. 45, F8, 00000000
        jmp     ?_197                                   ; 3AD8 _ EB, 5B

?_195:  mov     eax, dword [ebp+8H]                     ; 3ADA _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3ADD _ 8B. 55, F8
        add     edx, 33                                 ; 3AE0 _ 83. C2, 21
        shl     edx, 5                                  ; 3AE3 _ C1. E2, 05
        add     eax, edx                                ; 3AE6 _ 01. D0
        add     eax, 16                                 ; 3AE8 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 3AEB _ 8B. 00
        test    eax, eax                                ; 3AED _ 85. C0
        jnz     ?_196                                   ; 3AEF _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 3AF1 _ 8B. 45, F8
        shl     eax, 5                                  ; 3AF4 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 3AF7 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 3AFD _ 8B. 45, 08
        add     eax, edx                                ; 3B00 _ 01. D0
        add     eax, 4                                  ; 3B02 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 3B05 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3B08 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3B0B _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 3B0E _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 3B11 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 3B14 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 3B18 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 3B1B _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 3B22 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 3B25 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 3B2C _ 8B. 45, FC
        jmp     ?_198                                   ; 3B2F _ EB, 12

?_196:  add     dword [ebp-8H], 1                       ; 3B31 _ 83. 45, F8, 01
?_197:  cmp     dword [ebp-8H], 255                     ; 3B35 _ 81. 7D, F8, 000000FF
        jle     ?_195                                   ; 3B3C _ 7E, 9C
        mov     eax, 0                                  ; 3B3E _ B8, 00000000
?_198:  leave                                           ; 3B43 _ C9
        ret                                             ; 3B44 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 3B45 _ 55
        mov     ebp, esp                                ; 3B46 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3B48 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3B4B _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3B4E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3B50 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3B53 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 3B56 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3B59 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 3B5C _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3B5F _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3B62 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 3B65 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 3B68 _ 89. 50, 14
        pop     ebp                                     ; 3B6B _ 5D
        ret                                             ; 3B6C _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 3B6D _ 55
        mov     ebp, esp                                ; 3B6E _ 89. E5
        push    esi                                     ; 3B70 _ 56
        push    ebx                                     ; 3B71 _ 53
        sub     esp, 48                                 ; 3B72 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 3B75 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3B78 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 3B7B _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3B7E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3B81 _ 8B. 40, 0C
        add     eax, 1                                  ; 3B84 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 3B87 _ 3B. 45, 10
        jge     ?_199                                   ; 3B8A _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 3B8C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3B8F _ 8B. 40, 0C
        add     eax, 1                                  ; 3B92 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 3B95 _ 89. 45, 10
?_199:  cmp     dword [ebp+10H], -1                     ; 3B98 _ 83. 7D, 10, FF
        jge     ?_200                                   ; 3B9C _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 3B9E _ C7. 45, 10, FFFFFFFF
?_200:  mov     eax, dword [ebp+0CH]                    ; 3BA5 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3BA8 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 3BAB _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 3BAE _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3BB1 _ 3B. 45, 10
        jle     ?_207                                   ; 3BB4 _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 3BBA _ 83. 7D, 10, 00
        js      ?_203                                   ; 3BBE _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 3BC4 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3BC7 _ 89. 45, F0
        jmp     ?_202                                   ; 3BCA _ EB, 34

?_201:  mov     eax, dword [ebp-10H]                    ; 3BCC _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3BCF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3BD2 _ 8B. 45, 08
        add     edx, 4                                  ; 3BD5 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3BD8 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3BDC _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3BDF _ 8B. 4D, F0
        add     ecx, 4                                  ; 3BE2 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3BE5 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3BE9 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3BEC _ 8B. 55, F0
        add     edx, 4                                  ; 3BEF _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3BF2 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3BF6 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3BF9 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 3BFC _ 83. 6D, F0, 01
?_202:  mov     eax, dword [ebp-10H]                    ; 3C00 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3C03 _ 3B. 45, 10
        jg      ?_201                                   ; 3C06 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 3C08 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3C0B _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3C0E _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3C11 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3C14 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 3C18 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3C1B _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3C1E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3C21 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3C24 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3C27 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3C2A _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3C2D _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3C30 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3C33 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3C36 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3C39 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3C3C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3C3F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3C42 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3C45 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 3C48 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3C4C _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3C50 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3C54 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3C58 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3C5C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C5F _ 89. 04 24
        call    sheet_refresh_map                       ; 3C62 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3C67 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3C6A _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3C6D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3C70 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3C73 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3C76 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3C79 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3C7C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3C7F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3C82 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3C85 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3C88 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3C8B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3C8E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3C91 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3C94 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 3C97 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3C9B _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3C9F _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3CA3 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3CA7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3CAB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3CAE _ 89. 04 24
        call    sheet_refresh_local                     ; 3CB1 _ E8, FFFFFFFC(rel)
        jmp     ?_214                                   ; 3CB6 _ E9, 0000026C

?_203:  mov     eax, dword [ebp+8H]                     ; 3CBB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3CBE _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 3CC1 _ 3B. 45, F4
        jle     ?_206                                   ; 3CC4 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 3CC6 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3CC9 _ 89. 45, F0
        jmp     ?_205                                   ; 3CCC _ EB, 34

?_204:  mov     eax, dword [ebp-10H]                    ; 3CCE _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3CD1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3CD4 _ 8B. 45, 08
        add     edx, 4                                  ; 3CD7 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3CDA _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3CDE _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3CE1 _ 8B. 4D, F0
        add     ecx, 4                                  ; 3CE4 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3CE7 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3CEB _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3CEE _ 8B. 55, F0
        add     edx, 4                                  ; 3CF1 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3CF4 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3CF8 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3CFB _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 3CFE _ 83. 45, F0, 01
?_205:  mov     eax, dword [ebp+8H]                     ; 3D02 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3D05 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 3D08 _ 3B. 45, F0
        jg      ?_204                                   ; 3D0B _ 7F, C1
?_206:  mov     eax, dword [ebp+8H]                     ; 3D0D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3D10 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 3D13 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3D16 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3D19 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3D1C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3D1F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3D22 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3D25 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3D28 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3D2B _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3D2E _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3D31 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3D34 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3D37 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3D3A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3D3D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3D40 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3D43 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 3D46 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3D4E _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3D52 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3D56 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3D5A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3D5E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3D61 _ 89. 04 24
        call    sheet_refresh_map                       ; 3D64 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3D69 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3D6C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3D6F _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3D72 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3D75 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3D78 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3D7B _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3D7E _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3D81 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3D84 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3D87 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3D8A _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3D8D _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3D90 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 3D93 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3D9B _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3D9F _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3DA3 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3DA7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3DAB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3DAE _ 89. 04 24
        call    sheet_refresh_local                     ; 3DB1 _ E8, FFFFFFFC(rel)
        jmp     ?_214                                   ; 3DB6 _ E9, 0000016C

?_207:  mov     eax, dword [ebp-0CH]                    ; 3DBB _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3DBE _ 3B. 45, 10
        jge     ?_214                                   ; 3DC1 _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 3DC7 _ 83. 7D, F4, 00
        js      ?_210                                   ; 3DCB _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 3DCD _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3DD0 _ 89. 45, F0
        jmp     ?_209                                   ; 3DD3 _ EB, 34

?_208:  mov     eax, dword [ebp-10H]                    ; 3DD5 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3DD8 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3DDB _ 8B. 45, 08
        add     edx, 4                                  ; 3DDE _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3DE1 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3DE5 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3DE8 _ 8B. 4D, F0
        add     ecx, 4                                  ; 3DEB _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3DEE _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3DF2 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3DF5 _ 8B. 55, F0
        add     edx, 4                                  ; 3DF8 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3DFB _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3DFF _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3E02 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 3E05 _ 83. 45, F0, 01
?_209:  mov     eax, dword [ebp-10H]                    ; 3E09 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3E0C _ 3B. 45, 10
        jl      ?_208                                   ; 3E0F _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 3E11 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3E14 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3E17 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3E1A _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3E1D _ 89. 54 88, 04
        jmp     ?_213                                   ; 3E21 _ EB, 6C

?_210:  mov     eax, dword [ebp+8H]                     ; 3E23 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3E26 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 3E29 _ 89. 45, F0
        jmp     ?_212                                   ; 3E2C _ EB, 3A

?_211:  mov     eax, dword [ebp-10H]                    ; 3E2E _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 3E31 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 3E34 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3E37 _ 8B. 55, F0
        add     edx, 4                                  ; 3E3A _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3E3D _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3E41 _ 8B. 45, 08
        add     ecx, 4                                  ; 3E44 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3E47 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 3E4B _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3E4E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3E51 _ 8B. 45, 08
        add     edx, 4                                  ; 3E54 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3E57 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3E5B _ 8B. 55, F0
        add     edx, 1                                  ; 3E5E _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 3E61 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 3E64 _ 83. 6D, F0, 01
?_212:  mov     eax, dword [ebp-10H]                    ; 3E68 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3E6B _ 3B. 45, 10
        jge     ?_211                                   ; 3E6E _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 3E70 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3E73 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3E76 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3E79 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3E7C _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3E80 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3E83 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 3E86 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3E89 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3E8C _ 89. 50, 0C
?_213:  mov     eax, dword [ebp+0CH]                    ; 3E8F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3E92 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3E95 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3E98 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3E9B _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3E9E _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3EA1 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3EA4 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3EA7 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3EAA _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3EAD _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3EB0 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3EB3 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3EB6 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 3EB9 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3EBC _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3EC0 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3EC4 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3EC8 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3ECC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3ED0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3ED3 _ 89. 04 24
        call    sheet_refresh_map                       ; 3ED6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3EDB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3EDE _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3EE1 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3EE4 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3EE7 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3EEA _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3EED _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3EF0 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3EF3 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3EF6 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3EF9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3EFC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3EFF _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3F02 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 3F05 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3F08 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3F0C _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3F10 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3F14 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3F18 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3F1C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3F1F _ 89. 04 24
        call    sheet_refresh_local                     ; 3F22 _ E8, FFFFFFFC(rel)
?_214:  add     esp, 48                                 ; 3F27 _ 83. C4, 30
        pop     ebx                                     ; 3F2A _ 5B
        pop     esi                                     ; 3F2B _ 5E
        pop     ebp                                     ; 3F2C _ 5D
        ret                                             ; 3F2D _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 3F2E _ 55
        mov     ebp, esp                                ; 3F2F _ 89. E5
        push    edi                                     ; 3F31 _ 57
        push    esi                                     ; 3F32 _ 56
        push    ebx                                     ; 3F33 _ 53
        sub     esp, 44                                 ; 3F34 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 3F37 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3F3A _ 8B. 40, 18
        test    eax, eax                                ; 3F3D _ 85. C0
        js      ?_215                                   ; 3F3F _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 3F41 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3F44 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 3F47 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 3F4A _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 3F4D _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 3F50 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 3F53 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 3F56 _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 3F59 _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 3F5C _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 3F5F _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 3F62 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 3F65 _ 8B. 55, 14
        add     ecx, edx                                ; 3F68 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 3F6A _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 3F6D _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 3F70 _ 8B. 55, 10
        add     edx, edi                                ; 3F73 _ 01. FA
        mov     dword [esp+14H], eax                    ; 3F75 _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 3F79 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3F7D _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 3F81 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 3F85 _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 3F89 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3F8C _ 89. 04 24
        call    sheet_refresh_local                     ; 3F8F _ E8, FFFFFFFC(rel)
?_215:  mov     eax, 0                                  ; 3F94 _ B8, 00000000
        add     esp, 44                                 ; 3F99 _ 83. C4, 2C
        pop     ebx                                     ; 3F9C _ 5B
        pop     esi                                     ; 3F9D _ 5E
        pop     edi                                     ; 3F9E _ 5F
        pop     ebp                                     ; 3F9F _ 5D
        ret                                             ; 3FA0 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 3FA1 _ 55
        mov     ebp, esp                                ; 3FA2 _ 89. E5
        push    ebx                                     ; 3FA4 _ 53
        sub     esp, 52                                 ; 3FA5 _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 3FA8 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3FAB _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 3FAE _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 3FB1 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 3FB4 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 3FB7 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 3FBA _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3FBD _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 3FC0 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3FC3 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 3FC6 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 3FC9 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3FCC _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3FCF _ 8B. 40, 18
        test    eax, eax                                ; 3FD2 _ 85. C0
        js      ?_216                                   ; 3FD4 _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 3FDA _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 3FDD _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3FE0 _ 8B. 45, F4
        add     edx, eax                                ; 3FE3 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 3FE5 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 3FE8 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 3FEB _ 8B. 45, F0
        add     eax, ecx                                ; 3FEE _ 01. C8
        mov     dword [esp+14H], 0                      ; 3FF0 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 3FF8 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 3FFC _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 4000 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 4003 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 4007 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 400A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 400E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4011 _ 89. 04 24
        call    sheet_refresh_map                       ; 4014 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4019 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 401C _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 401F _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 4022 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 4025 _ 8B. 55, 14
        add     ecx, edx                                ; 4028 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 402A _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 402D _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 4030 _ 8B. 55, 10
        add     edx, ebx                                ; 4033 _ 01. DA
        mov     dword [esp+14H], eax                    ; 4035 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 4039 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 403D _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 4041 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 4044 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 4048 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 404B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 404F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4052 _ 89. 04 24
        call    sheet_refresh_map                       ; 4055 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 405A _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 405D _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 4060 _ 8B. 45, F4
        add     edx, eax                                ; 4063 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 4065 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 4068 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 406B _ 8B. 45, F0
        add     eax, ecx                                ; 406E _ 01. C8
        mov     dword [esp+14H], 0                      ; 4070 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 4078 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 407C _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 4080 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 4083 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 4087 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 408A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 408E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4091 _ 89. 04 24
        call    sheet_refresh_local                     ; 4094 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 4099 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 409C _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 409F _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 40A2 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 40A5 _ 8B. 55, 14
        add     ecx, edx                                ; 40A8 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 40AA _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 40AD _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 40B0 _ 8B. 55, 10
        add     edx, ebx                                ; 40B3 _ 01. DA
        mov     dword [esp+14H], eax                    ; 40B5 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 40B9 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 40BD _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 40C1 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 40C4 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 40C8 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 40CB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 40CF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 40D2 _ 89. 04 24
        call    sheet_refresh_local                     ; 40D5 _ E8, FFFFFFFC(rel)
?_216:  add     esp, 52                                 ; 40DA _ 83. C4, 34
        pop     ebx                                     ; 40DD _ 5B
        pop     ebp                                     ; 40DE _ 5D
        ret                                             ; 40DF _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 40E0 _ 55
        mov     ebp, esp                                ; 40E1 _ 89. E5
        sub     esp, 48                                 ; 40E3 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 40E6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 40E9 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 40EB _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 40EE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 40F1 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 40F4 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 40F7 _ 83. 7D, 0C, 00
        jns     ?_217                                   ; 40FB _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 40FD _ C7. 45, 0C, 00000000
?_217:  cmp     dword [ebp+10H], 0                      ; 4104 _ 83. 7D, 10, 00
        jns     ?_218                                   ; 4108 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 410A _ C7. 45, 10, 00000000
?_218:  mov     eax, dword [ebp+8H]                     ; 4111 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4114 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 4117 _ 3B. 45, 14
        jge     ?_219                                   ; 411A _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 411C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 411F _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 4122 _ 89. 45, 14
?_219:  mov     eax, dword [ebp+8H]                     ; 4125 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4128 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 412B _ 3B. 45, 18
        jge     ?_220                                   ; 412E _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 4130 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 4133 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 4136 _ 89. 45, 18
?_220:  mov     eax, dword [ebp+1CH]                    ; 4139 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 413C _ 89. 45, DC
        jmp     ?_227                                   ; 413F _ E9, 00000119

?_221:  mov     eax, dword [ebp+8H]                     ; 4144 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 4147 _ 8B. 55, DC
        add     edx, 4                                  ; 414A _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 414D _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 4151 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 4154 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 4157 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 4159 _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 415C _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 415F _ 8B. 45, 08
        add     eax, 1044                               ; 4162 _ 05, 00000414
        sub     edx, eax                                ; 4167 _ 29. C2
        mov     eax, edx                                ; 4169 _ 89. D0
        sar     eax, 5                                  ; 416B _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 416E _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 4171 _ C7. 45, E4, 00000000
        jmp     ?_226                                   ; 4178 _ E9, 000000CD

?_222:  mov     eax, dword [ebp-10H]                    ; 417D _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 4180 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 4183 _ 8B. 45, E4
        add     eax, edx                                ; 4186 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4188 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 418B _ C7. 45, E0, 00000000
        jmp     ?_225                                   ; 4192 _ E9, 000000A0

?_223:  mov     eax, dword [ebp-10H]                    ; 4197 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 419A _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 419D _ 8B. 45, E0
        add     eax, edx                                ; 41A0 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 41A2 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 41A5 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 41A8 _ 3B. 45, FC
        jg      ?_224                                   ; 41AB _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 41B1 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 41B4 _ 3B. 45, 14
        jge     ?_224                                   ; 41B7 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 41B9 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 41BC _ 3B. 45, F8
        jg      ?_224                                   ; 41BF _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 41C1 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 41C4 _ 3B. 45, 18
        jge     ?_224                                   ; 41C7 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 41C9 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 41CC _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 41CF _ 0F AF. 45, E4
        mov     edx, eax                                ; 41D3 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 41D5 _ 8B. 45, E0
        add     eax, edx                                ; 41D8 _ 01. D0
        mov     edx, eax                                ; 41DA _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 41DC _ 8B. 45, F4
        add     eax, edx                                ; 41DF _ 01. D0
        movzx   eax, byte [eax]                         ; 41E1 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 41E4 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 41E7 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 41EB _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 41EE _ 8B. 40, 14
        cmp     edx, eax                                ; 41F1 _ 39. C2
        jz      ?_224                                   ; 41F3 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 41F5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 41F8 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 41FB _ 0F AF. 45, F8
        mov     edx, eax                                ; 41FF _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4201 _ 8B. 45, FC
        add     eax, edx                                ; 4204 _ 01. D0
        mov     edx, eax                                ; 4206 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 4208 _ 8B. 45, EC
        add     eax, edx                                ; 420B _ 01. D0
        movzx   eax, byte [eax]                         ; 420D _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 4210 _ 3A. 45, DA
        jnz     ?_224                                   ; 4213 _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 4215 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4218 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 421B _ 0F AF. 45, F8
        mov     edx, eax                                ; 421F _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 4221 _ 8B. 45, FC
        add     eax, edx                                ; 4224 _ 01. D0
        mov     edx, eax                                ; 4226 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 4228 _ 8B. 45, E8
        add     edx, eax                                ; 422B _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 422D _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 4231 _ 88. 02
?_224:  add     dword [ebp-20H], 1                      ; 4233 _ 83. 45, E0, 01
?_225:  mov     eax, dword [ebp-10H]                    ; 4237 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 423A _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 423D _ 3B. 45, E0
        jg      ?_223                                   ; 4240 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 4246 _ 83. 45, E4, 01
?_226:  mov     eax, dword [ebp-10H]                    ; 424A _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 424D _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 4250 _ 3B. 45, E4
        jg      ?_222                                   ; 4253 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 4259 _ 83. 45, DC, 01
?_227:  mov     eax, dword [ebp+8H]                     ; 425D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4260 _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 4263 _ 3B. 45, DC
        jge     ?_221                                   ; 4266 _ 0F 8D, FFFFFED8
        leave                                           ; 426C _ C9
        ret                                             ; 426D _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 426E _ 55
        mov     ebp, esp                                ; 426F _ 89. E5
        sub     esp, 64                                 ; 4271 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 4274 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 4277 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 4279 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 427C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 427F _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 4282 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 4285 _ 83. 7D, 0C, 00
        jns     ?_228                                   ; 4289 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 428B _ C7. 45, 0C, 00000000
?_228:  cmp     dword [ebp+10H], 0                      ; 4292 _ 83. 7D, 10, 00
        jns     ?_229                                   ; 4296 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 4298 _ C7. 45, 10, 00000000
?_229:  mov     eax, dword [ebp+8H]                     ; 429F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 42A2 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 42A5 _ 3B. 45, 14
        jge     ?_230                                   ; 42A8 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 42AA _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 42AD _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 42B0 _ 89. 45, 14
?_230:  mov     eax, dword [ebp+8H]                     ; 42B3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 42B6 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 42B9 _ 3B. 45, 18
        jge     ?_231                                   ; 42BC _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 42BE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 42C1 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 42C4 _ 89. 45, 18
?_231:  mov     eax, dword [ebp+1CH]                    ; 42C7 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 42CA _ 89. 45, CC
        jmp     ?_242                                   ; 42CD _ E9, 00000141

?_232:  mov     eax, dword [ebp+8H]                     ; 42D2 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 42D5 _ 8B. 55, CC
        add     edx, 4                                  ; 42D8 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 42DB _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 42DF _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 42E2 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 42E5 _ 8B. 45, 08
        add     eax, 1044                               ; 42E8 _ 05, 00000414
        sub     edx, eax                                ; 42ED _ 29. C2
        mov     eax, edx                                ; 42EF _ 89. D0
        sar     eax, 5                                  ; 42F1 _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 42F4 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 42F7 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 42FA _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 42FC _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 42FF _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4302 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 4305 _ 8B. 55, 0C
        sub     edx, eax                                ; 4308 _ 29. C2
        mov     eax, edx                                ; 430A _ 89. D0
        mov     dword [ebp-30H], eax                    ; 430C _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 430F _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 4312 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 4315 _ 8B. 55, 10
        sub     edx, eax                                ; 4318 _ 29. C2
        mov     eax, edx                                ; 431A _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 431C _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 431F _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 4322 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 4325 _ 8B. 55, 14
        sub     edx, eax                                ; 4328 _ 29. C2
        mov     eax, edx                                ; 432A _ 89. D0
        mov     dword [ebp-28H], eax                    ; 432C _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 432F _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 4332 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 4335 _ 8B. 55, 18
        sub     edx, eax                                ; 4338 _ 29. C2
        mov     eax, edx                                ; 433A _ 89. D0
        mov     dword [ebp-24H], eax                    ; 433C _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 433F _ 83. 7D, D0, 00
        jns     ?_233                                   ; 4343 _ 79, 07
        mov     dword [ebp-30H], 0                      ; 4345 _ C7. 45, D0, 00000000
?_233:  cmp     dword [ebp-2CH], 0                      ; 434C _ 83. 7D, D4, 00
        jns     ?_234                                   ; 4350 _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 4352 _ C7. 45, D4, 00000000
?_234:  mov     eax, dword [ebp-10H]                    ; 4359 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 435C _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 435F _ 3B. 45, D8
        jge     ?_235                                   ; 4362 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4364 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 4367 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 436A _ 89. 45, D8
?_235:  mov     eax, dword [ebp-10H]                    ; 436D _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 4370 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 4373 _ 3B. 45, DC
        jge     ?_236                                   ; 4376 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 4378 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 437B _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 437E _ 89. 45, DC
?_236:  mov     eax, dword [ebp-2CH]                    ; 4381 _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 4384 _ 89. 45, E4
        jmp     ?_241                                   ; 4387 _ EB, 7A

?_237:  mov     eax, dword [ebp-10H]                    ; 4389 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 438C _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 438F _ 8B. 45, E4
        add     eax, edx                                ; 4392 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 4394 _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 4397 _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 439A _ 89. 45, E0
        jmp     ?_240                                   ; 439D _ EB, 58

?_238:  mov     eax, dword [ebp-10H]                    ; 439F _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 43A2 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 43A5 _ 8B. 45, E0
        add     eax, edx                                ; 43A8 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 43AA _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 43AD _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 43B0 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 43B3 _ 0F AF. 45, E4
        mov     edx, eax                                ; 43B7 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 43B9 _ 8B. 45, E0
        add     eax, edx                                ; 43BC _ 01. D0
        mov     edx, eax                                ; 43BE _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 43C0 _ 8B. 45, F4
        add     eax, edx                                ; 43C3 _ 01. D0
        movzx   eax, byte [eax]                         ; 43C5 _ 0F B6. 00
        movzx   edx, al                                 ; 43C8 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 43CB _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 43CE _ 8B. 40, 14
        cmp     edx, eax                                ; 43D1 _ 39. C2
        jz      ?_239                                   ; 43D3 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 43D5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 43D8 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 43DB _ 0F AF. 45, F8
        mov     edx, eax                                ; 43DF _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 43E1 _ 8B. 45, FC
        add     eax, edx                                ; 43E4 _ 01. D0
        mov     edx, eax                                ; 43E6 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 43E8 _ 8B. 45, EC
        add     edx, eax                                ; 43EB _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 43ED _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 43F1 _ 88. 02
?_239:  add     dword [ebp-20H], 1                      ; 43F3 _ 83. 45, E0, 01
?_240:  mov     eax, dword [ebp-20H]                    ; 43F7 _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 43FA _ 3B. 45, D8
        jl      ?_238                                   ; 43FD _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 43FF _ 83. 45, E4, 01
?_241:  mov     eax, dword [ebp-1CH]                    ; 4403 _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 4406 _ 3B. 45, DC
        jl      ?_237                                   ; 4409 _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 440F _ 83. 45, CC, 01
?_242:  mov     eax, dword [ebp+8H]                     ; 4413 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4416 _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 4419 _ 3B. 45, CC
        jge     ?_232                                   ; 441C _ 0F 8D, FFFFFEB0
        leave                                           ; 4422 _ C9
        ret                                             ; 4423 _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 4424 _ 55
        mov     ebp, esp                                ; 4425 _ 89. E5
        sub     esp, 40                                 ; 4427 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 442A _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 4432 _ C7. 04 24, 00000043
        call    io_out8                                 ; 4439 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 443E _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 4446 _ C7. 04 24, 00000040
        call    io_out8                                 ; 444D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 4452 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 445A _ C7. 04 24, 00000040
        call    io_out8                                 ; 4461 _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 4466 _ C7. 05, 00000300(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 4470 _ C7. 45, F4, 00000000
        jmp     ?_244                                   ; 4477 _ EB, 28

?_243:  mov     eax, dword [ebp-0CH]                    ; 4479 _ 8B. 45, F4
        shl     eax, 4                                  ; 447C _ C1. E0, 04
        add     eax, timer_control                      ; 447F _ 05, 00000300(d)
        mov     dword [eax+8H], 0                       ; 4484 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 448B _ 8B. 45, F4
        shl     eax, 4                                  ; 448E _ C1. E0, 04
        add     eax, timer_control                      ; 4491 _ 05, 00000300(d)
        mov     dword [eax+0CH], 0                      ; 4496 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 449D _ 83. 45, F4, 01
?_244:  cmp     dword [ebp-0CH], 499                    ; 44A1 _ 81. 7D, F4, 000001F3
        jle     ?_243                                   ; 44A8 _ 7E, CF
        leave                                           ; 44AA _ C9
        ret                                             ; 44AB _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 44AC _ 55
        mov     ebp, esp                                ; 44AD _ 89. E5
        mov     eax, timer_control                      ; 44AF _ B8, 00000300(d)
        pop     ebp                                     ; 44B4 _ 5D
        ret                                             ; 44B5 _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 44B6 _ 55
        mov     ebp, esp                                ; 44B7 _ 89. E5
        sub     esp, 16                                 ; 44B9 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 44BC _ C7. 45, FC, 00000000
        jmp     ?_247                                   ; 44C3 _ EB, 26

?_245:  mov     eax, dword [ebp-4H]                     ; 44C5 _ 8B. 45, FC
        shl     eax, 4                                  ; 44C8 _ C1. E0, 04
        add     eax, timer_control                      ; 44CB _ 05, 00000300(d)
        mov     eax, dword [eax+8H]                     ; 44D0 _ 8B. 40, 08
        test    eax, eax                                ; 44D3 _ 85. C0
        jnz     ?_246                                   ; 44D5 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 44D7 _ 8B. 45, FC
        shl     eax, 4                                  ; 44DA _ C1. E0, 04
        add     eax, timer_control                      ; 44DD _ 05, 00000300(d)
        add     eax, 4                                  ; 44E2 _ 83. C0, 04
        jmp     ?_248                                   ; 44E5 _ EB, 0D

?_246:  add     dword [ebp-4H], 1                       ; 44E7 _ 83. 45, FC, 01
?_247:  cmp     dword [ebp-4H], 499                     ; 44EB _ 81. 7D, FC, 000001F3
        jle     ?_245                                   ; 44F2 _ 7E, D1
?_248:  leave                                           ; 44F4 _ C9
        ret                                             ; 44F5 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 44F6 _ 55
        mov     ebp, esp                                ; 44F7 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 44F9 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 44FC _ C7. 40, 04, 00000000
        pop     ebp                                     ; 4503 _ 5D
        ret                                             ; 4504 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 4505 _ 55
        mov     ebp, esp                                ; 4506 _ 89. E5
        sub     esp, 4                                  ; 4508 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 450B _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 450E _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 4511 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 4514 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 4517 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 451A _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 451D _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 4521 _ 88. 50, 0C
        leave                                           ; 4524 _ C9
        ret                                             ; 4525 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 4526 _ 55
        mov     ebp, esp                                ; 4527 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 4529 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 452C _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 452F _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4531 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4534 _ C7. 40, 04, 00000002
        pop     ebp                                     ; 453B _ 5D
        ret                                             ; 453C _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 453D _ 55
        mov     ebp, esp                                ; 453E _ 89. E5
        sub     esp, 40                                 ; 4540 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 4543 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 454B _ C7. 04 24, 00000020
        call    io_out8                                 ; 4552 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 4557 _ A1, 00000300(d)
        add     eax, 1                                  ; 455C _ 83. C0, 01
        mov     dword [timer_control], eax              ; 455F _ A3, 00000300(d)
        mov     byte [ebp-0DH], 0                       ; 4564 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 4568 _ C7. 45, F4, 00000000
        jmp     ?_252                                   ; 456F _ E9, 000000B0

?_249:  mov     eax, dword [ebp-0CH]                    ; 4574 _ 8B. 45, F4
        shl     eax, 4                                  ; 4577 _ C1. E0, 04
        add     eax, timer_control                      ; 457A _ 05, 00000300(d)
        mov     eax, dword [eax+8H]                     ; 457F _ 8B. 40, 08
        cmp     eax, 2                                  ; 4582 _ 83. F8, 02
        jne     ?_250                                   ; 4585 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 458B _ 8B. 45, F4
        shl     eax, 4                                  ; 458E _ C1. E0, 04
        add     eax, timer_control                      ; 4591 _ 05, 00000300(d)
        mov     eax, dword [eax+4H]                     ; 4596 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 4599 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 459C _ 8B. 45, F4
        shl     eax, 4                                  ; 459F _ C1. E0, 04
        add     eax, timer_control                      ; 45A2 _ 05, 00000300(d)
        mov     dword [eax+4H], edx                     ; 45A7 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 45AA _ 8B. 45, F4
        shl     eax, 4                                  ; 45AD _ C1. E0, 04
        add     eax, timer_control                      ; 45B0 _ 05, 00000300(d)
        mov     eax, dword [eax+4H]                     ; 45B5 _ 8B. 40, 04
        test    eax, eax                                ; 45B8 _ 85. C0
        jnz     ?_250                                   ; 45BA _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 45BC _ 8B. 45, F4
        shl     eax, 4                                  ; 45BF _ C1. E0, 04
        add     eax, timer_control                      ; 45C2 _ 05, 00000300(d)
        mov     dword [eax+8H], 1                       ; 45C7 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 45CE _ 8B. 45, F4
        shl     eax, 4                                  ; 45D1 _ C1. E0, 04
        add     eax, timer_control                      ; 45D4 _ 05, 00000300(d)
        movzx   eax, byte [eax+10H]                     ; 45D9 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 45DD _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 45E0 _ 8B. 45, F4
        shl     eax, 4                                  ; 45E3 _ C1. E0, 04
        add     eax, timer_control                      ; 45E6 _ 05, 00000300(d)
        mov     eax, dword [eax+0CH]                    ; 45EB _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 45EE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 45F2 _ 89. 04 24
        call    fifo8_put                               ; 45F5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 45FA _ 8B. 45, F4
        shl     eax, 4                                  ; 45FD _ C1. E0, 04
        add     eax, timer_control                      ; 4600 _ 05, 00000300(d)
        lea     edx, [eax+4H]                           ; 4605 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 4608 _ A1, 00000000(d)
        cmp     edx, eax                                ; 460D _ 39. C2
        jnz     ?_250                                   ; 460F _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 4611 _ C6. 45, F3, 01
?_250:  cmp     byte [ebp-0DH], 0                       ; 4615 _ 80. 7D, F3, 00
        jz      ?_251                                   ; 4619 _ 74, 05
        call    task_switch                             ; 461B _ E8, FFFFFFFC(rel)
?_251:  add     dword [ebp-0CH], 1                      ; 4620 _ 83. 45, F4, 01
?_252:  cmp     dword [ebp-0CH], 499                    ; 4624 _ 81. 7D, F4, 000001F3
        jle     ?_249                                   ; 462B _ 0F 8E, FFFFFF43
        leave                                           ; 4631 _ C9
        ret                                             ; 4632 _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 4633 _ 55
        mov     ebp, esp                                ; 4634 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 4636 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_253                                   ; 463D _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 463F _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 4646 _ 8B. 45, 0C
        shr     eax, 12                                 ; 4649 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 464C _ 89. 45, 0C
?_253:  mov     eax, dword [ebp+0CH]                    ; 464F _ 8B. 45, 0C
        mov     edx, eax                                ; 4652 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4654 _ 8B. 45, 08
        mov     word [eax], dx                          ; 4657 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 465A _ 8B. 45, 10
        mov     edx, eax                                ; 465D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 465F _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 4662 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 4666 _ 8B. 45, 10
        sar     eax, 16                                 ; 4669 _ C1. F8, 10
        mov     edx, eax                                ; 466C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 466E _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 4671 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 4674 _ 8B. 45, 14
        mov     edx, eax                                ; 4677 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4679 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 467C _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 467F _ 8B. 45, 0C
        shr     eax, 16                                 ; 4682 _ C1. E8, 10
        and     eax, 0FH                                ; 4685 _ 83. E0, 0F
        mov     edx, eax                                ; 4688 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 468A _ 8B. 45, 14
        sar     eax, 8                                  ; 468D _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 4690 _ 83. E0, F0
        or      eax, edx                                ; 4693 _ 09. D0
        mov     edx, eax                                ; 4695 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 4697 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 469A _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 469D _ 8B. 45, 10
        shr     eax, 24                                 ; 46A0 _ C1. E8, 18
        mov     edx, eax                                ; 46A3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 46A5 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 46A8 _ 88. 50, 07
        pop     ebp                                     ; 46AB _ 5D
        ret                                             ; 46AC _ C3
; segment_descriptor End of function

init_task_level:; Function begin
        push    ebp                                     ; 46AD _ 55
        mov     ebp, esp                                ; 46AE _ 89. E5
        sub     esp, 16                                 ; 46B0 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 46B3 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp+8H]                     ; 46B9 _ 8B. 55, 08
        mov     eax, edx                                ; 46BC _ 89. D0
        shl     eax, 2                                  ; 46BE _ C1. E0, 02
        add     eax, edx                                ; 46C1 _ 01. D0
        shl     eax, 2                                  ; 46C3 _ C1. E0, 02
        add     eax, ecx                                ; 46C6 _ 01. C8
        add     eax, 8                                  ; 46C8 _ 83. C0, 08
        mov     dword [eax], 0                          ; 46CB _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 46D1 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp+8H]                     ; 46D7 _ 8B. 55, 08
        mov     eax, edx                                ; 46DA _ 89. D0
        shl     eax, 2                                  ; 46DC _ C1. E0, 02
        add     eax, edx                                ; 46DF _ 01. D0
        shl     eax, 2                                  ; 46E1 _ C1. E0, 02
        add     eax, ecx                                ; 46E4 _ 01. C8
        add     eax, 12                                 ; 46E6 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 46E9 _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 46EF _ C7. 45, FC, 00000000
        jmp     ?_255                                   ; 46F6 _ EB, 21

?_254:  mov     ecx, dword [task_control]               ; 46F8 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 46FE _ 8B. 55, FC
        mov     eax, edx                                ; 4701 _ 89. D0
        add     eax, eax                                ; 4703 _ 01. C0
        add     eax, edx                                ; 4705 _ 01. D0
        shl     eax, 3                                  ; 4707 _ C1. E0, 03
        add     eax, ecx                                ; 470A _ 01. C8
        add     eax, 16                                 ; 470C _ 83. C0, 10
        mov     dword [eax], 0                          ; 470F _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 4715 _ 83. 45, FC, 01
?_255:  cmp     dword [ebp-4H], 2                       ; 4719 _ 83. 7D, FC, 02
        jle     ?_254                                   ; 471D _ 7E, D9
        leave                                           ; 471F _ C9
        ret                                             ; 4720 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 4721 _ 55
        mov     ebp, esp                                ; 4722 _ 89. E5
        sub     esp, 40                                 ; 4724 _ 83. EC, 28
        call    get_addr_gdt                            ; 4727 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 472C _ 89. 45, F0
        mov     dword [esp+4H], 668                     ; 472F _ C7. 44 24, 04, 0000029C
        mov     eax, dword [ebp+8H]                     ; 4737 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 473A _ 89. 04 24
        call    memman_alloc_4k                         ; 473D _ E8, FFFFFFFC(rel)
        mov     dword [task_control], eax               ; 4742 _ A3, 00002248(d)
        mov     dword [ebp-14H], 0                      ; 4747 _ C7. 45, EC, 00000000
        jmp     ?_257                                   ; 474E _ E9, 00000085

?_256:  mov     edx, dword [task_control]               ; 4753 _ 8B. 15, 00002248(d)
        mov     eax, dword [ebp-14H]                    ; 4759 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 475C _ 69. C0, 00000094
        add     eax, edx                                ; 4762 _ 01. D0
        add     eax, 72                                 ; 4764 _ 83. C0, 48
        mov     dword [eax], 0                          ; 4767 _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 476D _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp-14H]                    ; 4773 _ 8B. 45, EC
        add     eax, 8                                  ; 4776 _ 83. C0, 08
        lea     edx, [eax*8]                            ; 4779 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 4780 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 4783 _ 69. C0, 00000094
        add     eax, ecx                                ; 4789 _ 01. C8
        add     eax, 68                                 ; 478B _ 83. C0, 44
        mov     dword [eax], edx                        ; 478E _ 89. 10
        mov     eax, dword [task_control]               ; 4790 _ A1, 00002248(d)
        mov     edx, dword [ebp-14H]                    ; 4795 _ 8B. 55, EC
        imul    edx, edx, 148                           ; 4798 _ 69. D2, 00000094
        add     edx, 96                                 ; 479E _ 83. C2, 60
        add     eax, edx                                ; 47A1 _ 01. D0
        add     eax, 16                                 ; 47A3 _ 83. C0, 10
        mov     edx, dword [ebp-14H]                    ; 47A6 _ 8B. 55, EC
        add     edx, 8                                  ; 47A9 _ 83. C2, 08
        lea     ecx, [edx*8]                            ; 47AC _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 47B3 _ 8B. 55, F0
        add     edx, ecx                                ; 47B6 _ 01. CA
        mov     dword [esp+0CH], 137                    ; 47B8 _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 47C0 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 47C4 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 47CC _ 89. 14 24
        call    segment_descriptor                      ; 47CF _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 47D4 _ 83. 45, EC, 01
?_257:  cmp     dword [ebp-14H], 4                      ; 47D8 _ 83. 7D, EC, 04
        jle     ?_256                                   ; 47DC _ 0F 8E, FFFFFF71
        mov     dword [ebp-14H], 0                      ; 47E2 _ C7. 45, EC, 00000000
        jmp     ?_259                                   ; 47E9 _ EB, 0F

?_258:  mov     eax, dword [ebp-14H]                    ; 47EB _ 8B. 45, EC
        mov     dword [esp], eax                        ; 47EE _ 89. 04 24
        call    init_task_level                         ; 47F1 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 47F6 _ 83. 45, EC, 01
?_259:  cmp     dword [ebp-14H], 2                      ; 47FA _ 83. 7D, EC, 02
        jle     ?_258                                   ; 47FE _ 7E, EB
        call    task_alloc                              ; 4800 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4805 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4808 _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 480B _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 4812 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 4815 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 481C _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 481F _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 4826 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 4829 _ 89. 04 24
        call    task_add                                ; 482C _ E8, FFFFFFFC(rel)
        call    task_switch_sub                         ; 4831 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4836 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4839 _ 8B. 00
        mov     dword [esp], eax                        ; 483B _ 89. 04 24
        call    load_tr                                 ; 483E _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 4843 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 4848 _ A3, 00002244(d)
        mov     eax, dword [ebp-0CH]                    ; 484D _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 4850 _ 8B. 40, 08
        mov     edx, eax                                ; 4853 _ 89. C2
        mov     eax, dword [task_timer]                 ; 4855 _ A1, 00002244(d)
        mov     dword [esp+4H], edx                     ; 485A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 485E _ 89. 04 24
        call    timer_settime                           ; 4861 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4866 _ 8B. 45, F4
        leave                                           ; 4869 _ C9
        ret                                             ; 486A _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 486B _ 55
        mov     ebp, esp                                ; 486C _ 89. E5
        sub     esp, 16                                 ; 486E _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 4871 _ C7. 45, F8, 00000000
        jmp     ?_262                                   ; 4878 _ E9, 000000F6

?_260:  mov     edx, dword [task_control]               ; 487D _ 8B. 15, 00002248(d)
        mov     eax, dword [ebp-8H]                     ; 4883 _ 8B. 45, F8
        imul    eax, eax, 148                           ; 4886 _ 69. C0, 00000094
        add     eax, edx                                ; 488C _ 01. D0
        add     eax, 72                                 ; 488E _ 83. C0, 48
        mov     eax, dword [eax]                        ; 4891 _ 8B. 00
        test    eax, eax                                ; 4893 _ 85. C0
        jne     ?_261                                   ; 4895 _ 0F 85, 000000D4
        mov     eax, dword [task_control]               ; 489B _ A1, 00002248(d)
        mov     edx, dword [ebp-8H]                     ; 48A0 _ 8B. 55, F8
        imul    edx, edx, 148                           ; 48A3 _ 69. D2, 00000094
        add     edx, 64                                 ; 48A9 _ 83. C2, 40
        add     eax, edx                                ; 48AC _ 01. D0
        add     eax, 4                                  ; 48AE _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 48B1 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 48B4 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 48B7 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 48BE _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 48C1 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 48C8 _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 48CB _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 48D2 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 48D5 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 48DC _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 48DF _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 48E6 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 48E9 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-8H]                     ; 48F0 _ 8B. 45, F8
        add     eax, 1                                  ; 48F3 _ 83. C0, 01
        shl     eax, 9                                  ; 48F6 _ C1. E0, 09
        mov     edx, eax                                ; 48F9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 48FB _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 48FE _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 4901 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 4904 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-4H]                     ; 490B _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 490E _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 4915 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 4918 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 491F _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 4922 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 4929 _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 492C _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 4936 _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 4939 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 4943 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 4946 _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 4950 _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 4953 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 495D _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 4960 _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 496A _ 8B. 45, FC
        jmp     ?_263                                   ; 496D _ EB, 13

?_261:  add     dword [ebp-8H], 1                       ; 496F _ 83. 45, F8, 01
?_262:  cmp     dword [ebp-8H], 4                       ; 4973 _ 83. 7D, F8, 04
        jle     ?_260                                   ; 4977 _ 0F 8E, FFFFFF00
        mov     eax, 0                                  ; 497D _ B8, 00000000
?_263:  leave                                           ; 4982 _ C9
        ret                                             ; 4983 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 4984 _ 55
        mov     ebp, esp                                ; 4985 _ 89. E5
        sub     esp, 24                                 ; 4987 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 498A _ 83. 7D, 0C, 00
        jns     ?_264                                   ; 498E _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 4990 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 4993 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 4996 _ 89. 45, 0C
?_264:  cmp     dword [ebp+10H], 0                      ; 4999 _ 83. 7D, 10, 00
        jle     ?_265                                   ; 499D _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 499F _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 49A2 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 49A5 _ 89. 50, 08
?_265:  mov     eax, dword [ebp+8H]                     ; 49A8 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 49AB _ 8B. 40, 04
        cmp     eax, 2                                  ; 49AE _ 83. F8, 02
        jnz     ?_266                                   ; 49B1 _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 49B3 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 49B6 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 49B9 _ 3B. 45, 0C
        jz      ?_266                                   ; 49BC _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 49BE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 49C1 _ 89. 04 24
        call    task_remove                             ; 49C4 _ E8, FFFFFFFC(rel)
?_266:  mov     eax, dword [ebp+8H]                     ; 49C9 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 49CC _ 8B. 40, 04
        cmp     eax, 2                                  ; 49CF _ 83. F8, 02
        jz      ?_267                                   ; 49D2 _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 49D4 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 49D7 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 49DA _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 49DD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 49E0 _ 89. 04 24
        call    task_add                                ; 49E3 _ E8, FFFFFFFC(rel)
?_267:  mov     eax, dword [task_control]               ; 49E8 _ A1, 00002248(d)
        mov     dword [eax+4H], 1                       ; 49ED _ C7. 40, 04, 00000001
        leave                                           ; 49F4 _ C9
        ret                                             ; 49F5 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 49F6 _ 55
        mov     ebp, esp                                ; 49F7 _ 89. E5
        sub     esp, 40                                 ; 49F9 _ 83. EC, 28
        mov     ecx, dword [task_control]               ; 49FC _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4A02 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4A07 _ 8B. 10
        mov     eax, edx                                ; 4A09 _ 89. D0
        shl     eax, 2                                  ; 4A0B _ C1. E0, 02
        add     eax, edx                                ; 4A0E _ 01. D0
        shl     eax, 2                                  ; 4A10 _ C1. E0, 02
        add     eax, ecx                                ; 4A13 _ 01. C8
        add     eax, 8                                  ; 4A15 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4A18 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 4A1B _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4A1E _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4A21 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4A24 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 4A28 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 4A2B _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 4A2E _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 4A31 _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 4A34 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 4A37 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4A3A _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4A3D _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4A40 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 4A43 _ 8B. 00
        cmp     edx, eax                                ; 4A45 _ 39. C2
        jnz     ?_268                                   ; 4A47 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 4A49 _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 4A4C _ C7. 40, 04, 00000000
?_268:  mov     eax, dword [task_control]               ; 4A53 _ A1, 00002248(d)
        mov     eax, dword [eax+4H]                     ; 4A58 _ 8B. 40, 04
        test    eax, eax                                ; 4A5B _ 85. C0
        jz      ?_269                                   ; 4A5D _ 74, 24
        call    task_switch_sub                         ; 4A5F _ E8, FFFFFFFC(rel)
        mov     ecx, dword [task_control]               ; 4A64 _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4A6A _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4A6F _ 8B. 10
        mov     eax, edx                                ; 4A71 _ 89. D0
        shl     eax, 2                                  ; 4A73 _ C1. E0, 02
        add     eax, edx                                ; 4A76 _ 01. D0
        shl     eax, 2                                  ; 4A78 _ C1. E0, 02
        add     eax, ecx                                ; 4A7B _ 01. C8
        add     eax, 8                                  ; 4A7D _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4A80 _ 89. 45, EC
?_269:  mov     eax, dword [ebp-14H]                    ; 4A83 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 4A86 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4A89 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4A8C _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 4A90 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 4A93 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 4A96 _ 8B. 40, 08
        mov     edx, eax                                ; 4A99 _ 89. C2
        mov     eax, dword [task_timer]                 ; 4A9B _ A1, 00002244(d)
        mov     dword [esp+4H], edx                     ; 4AA0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4AA4 _ 89. 04 24
        call    timer_settime                           ; 4AA7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4AAC _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 4AAF _ 3B. 45, F0
        jz      ?_270                                   ; 4AB2 _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 4AB4 _ 83. 7D, F4, 00
        jz      ?_270                                   ; 4AB8 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4ABA _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4ABD _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4ABF _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4AC3 _ C7. 04 24, 00000000
        call    farjmp                                  ; 4ACA _ E8, FFFFFFFC(rel)
?_270:  leave                                           ; 4ACF _ C9
        ret                                             ; 4AD0 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 4AD1 _ 55
        mov     ebp, esp                                ; 4AD2 _ 89. E5
        sub     esp, 40                                 ; 4AD4 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 4AD7 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 4ADE _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 4AE5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4AE8 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4AEB _ 83. F8, 02
        jnz     ?_271                                   ; 4AEE _ 75, 51
        call    task_now                                ; 4AF0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4AF5 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 4AF8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4AFB _ 89. 04 24
        call    task_remove                             ; 4AFE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 4B03 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 4B0A _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 4B0D _ 3B. 45, F4
        jnz     ?_271                                   ; 4B10 _ 75, 2F
        call    task_switch_sub                         ; 4B12 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 4B17 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 4B1C _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 4B1F _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 4B26 _ 83. 7D, F4, 00
        jz      ?_271                                   ; 4B2A _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4B2C _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4B2F _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4B31 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 4B35 _ C7. 04 24, 00000000
        call    farjmp                                  ; 4B3C _ E8, FFFFFFFC(rel)
?_271:  mov     eax, dword [ebp-10H]                    ; 4B41 _ 8B. 45, F0
        leave                                           ; 4B44 _ C9
        ret                                             ; 4B45 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 4B46 _ 55
        mov     ebp, esp                                ; 4B47 _ 89. E5
        sub     esp, 16                                 ; 4B49 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4B4C _ 8B. 0D, 00002248(d)
        mov     eax, dword [task_control]               ; 4B52 _ A1, 00002248(d)
        mov     edx, dword [eax]                        ; 4B57 _ 8B. 10
        mov     eax, edx                                ; 4B59 _ 89. D0
        shl     eax, 2                                  ; 4B5B _ C1. E0, 02
        add     eax, edx                                ; 4B5E _ 01. D0
        shl     eax, 2                                  ; 4B60 _ C1. E0, 02
        add     eax, ecx                                ; 4B63 _ 01. C8
        add     eax, 8                                  ; 4B65 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4B68 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4B6B _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4B6E _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4B71 _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 4B74 _ 8B. 44 90, 08
        leave                                           ; 4B78 _ C9
        ret                                             ; 4B79 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 4B7A _ 55
        mov     ebp, esp                                ; 4B7B _ 89. E5
        sub     esp, 16                                 ; 4B7D _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4B80 _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp+8H]                     ; 4B86 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4B89 _ 8B. 50, 0C
        mov     eax, edx                                ; 4B8C _ 89. D0
        shl     eax, 2                                  ; 4B8E _ C1. E0, 02
        add     eax, edx                                ; 4B91 _ 01. D0
        shl     eax, 2                                  ; 4B93 _ C1. E0, 02
        add     eax, ecx                                ; 4B96 _ 01. C8
        add     eax, 8                                  ; 4B98 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4B9B _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4B9E _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 4BA1 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 4BA3 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 4BA6 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 4BA9 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4BAD _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4BB0 _ 8B. 00
        lea     edx, [eax+1H]                           ; 4BB2 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4BB5 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4BB8 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4BBA _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4BBD _ C7. 40, 04, 00000002
        leave                                           ; 4BC4 _ C9
        ret                                             ; 4BC5 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 4BC6 _ 55
        mov     ebp, esp                                ; 4BC7 _ 89. E5
        sub     esp, 16                                 ; 4BC9 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4BCC _ 8B. 0D, 00002248(d)
        mov     eax, dword [ebp+8H]                     ; 4BD2 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4BD5 _ 8B. 50, 0C
        mov     eax, edx                                ; 4BD8 _ 89. D0
        shl     eax, 2                                  ; 4BDA _ C1. E0, 02
        add     eax, edx                                ; 4BDD _ 01. D0
        shl     eax, 2                                  ; 4BDF _ C1. E0, 02
        add     eax, ecx                                ; 4BE2 _ 01. C8
        add     eax, 8                                  ; 4BE4 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4BE7 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 4BEA _ C7. 45, F8, 00000000
        jmp     ?_274                                   ; 4BF1 _ EB, 23

?_272:  mov     eax, dword [ebp-4H]                     ; 4BF3 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4BF6 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 4BF9 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 4BFD _ 3B. 45, 08
        jnz     ?_273                                   ; 4C00 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 4C02 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4C05 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 4C08 _ C7. 44 90, 08, 00000000
        jmp     ?_275                                   ; 4C10 _ EB, 0E

?_273:  add     dword [ebp-8H], 1                       ; 4C12 _ 83. 45, F8, 01
?_274:  mov     eax, dword [ebp-4H]                     ; 4C16 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4C19 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4C1B _ 3B. 45, F8
        jg      ?_272                                   ; 4C1E _ 7F, D3
?_275:  mov     eax, dword [ebp-4H]                     ; 4C20 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4C23 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4C25 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4C28 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4C2B _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 4C2D _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4C30 _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 4C33 _ 3B. 45, F8
        jle     ?_276                                   ; 4C36 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 4C38 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4C3B _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 4C3E _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4C41 _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 4C44 _ 89. 50, 04
?_276:  mov     eax, dword [ebp-4H]                     ; 4C47 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4C4A _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4C4D _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4C50 _ 8B. 00
        cmp     edx, eax                                ; 4C52 _ 39. C2
        jl      ?_277                                   ; 4C54 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 4C56 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 4C59 _ C7. 40, 04, 00000000
?_277:  mov     eax, dword [ebp+8H]                     ; 4C60 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 4C63 _ C7. 40, 04, 00000001
        jmp     ?_279                                   ; 4C6A _ EB, 1B

?_278:  mov     eax, dword [ebp-8H]                     ; 4C6C _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 4C6F _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4C72 _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 4C75 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4C79 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4C7C _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 4C7F _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 4C83 _ 83. 45, F8, 01
?_279:  mov     eax, dword [ebp-4H]                     ; 4C87 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4C8A _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4C8C _ 3B. 45, F8
        jg      ?_278                                   ; 4C8F _ 7F, DB
        leave                                           ; 4C91 _ C9
        ret                                             ; 4C92 _ C3
; task_remove End of function

task_switch_sub:; Function begin
        push    ebp                                     ; 4C93 _ 55
        mov     ebp, esp                                ; 4C94 _ 89. E5
        sub     esp, 16                                 ; 4C96 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4C99 _ C7. 45, FC, 00000000
        jmp     ?_282                                   ; 4CA0 _ EB, 24

?_280:  mov     ecx, dword [task_control]               ; 4CA2 _ 8B. 0D, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 4CA8 _ 8B. 55, FC
        mov     eax, edx                                ; 4CAB _ 89. D0
        shl     eax, 2                                  ; 4CAD _ C1. E0, 02
        add     eax, edx                                ; 4CB0 _ 01. D0
        shl     eax, 2                                  ; 4CB2 _ C1. E0, 02
        add     eax, ecx                                ; 4CB5 _ 01. C8
        add     eax, 8                                  ; 4CB7 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 4CBA _ 8B. 00
        test    eax, eax                                ; 4CBC _ 85. C0
        jle     ?_281                                   ; 4CBE _ 7E, 02
        jmp     ?_283                                   ; 4CC0 _ EB, 0A

?_281:  add     dword [ebp-4H], 1                       ; 4CC2 _ 83. 45, FC, 01
?_282:  cmp     dword [ebp-4H], 2                       ; 4CC6 _ 83. 7D, FC, 02
        jle     ?_280                                   ; 4CCA _ 7E, D6
?_283:  mov     eax, dword [task_control]               ; 4CCC _ A1, 00002248(d)
        mov     edx, dword [ebp-4H]                     ; 4CD1 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 4CD4 _ 89. 10
        mov     eax, dword [task_control]               ; 4CD6 _ A1, 00002248(d)
        mov     dword [eax+4H], 0                       ; 4CDB _ C7. 40, 04, 00000000
        leave                                           ; 4CE2 _ C9
        ret                                             ; 4CE3 _ C3
; task_switch_sub End of function

task_send_message:; Function begin
        push    ebp                                     ; 4CE4 _ 55
        mov     ebp, esp                                ; 4CE5 _ 89. E5
        sub     esp, 24                                 ; 4CE7 _ 83. EC, 18
        mov     eax, dword [ebp+10H]                    ; 4CEA _ 8B. 45, 10
        movzx   eax, al                                 ; 4CED _ 0F B6. C0
        mov     edx, dword [ebp+0CH]                    ; 4CF0 _ 8B. 55, 0C
        add     edx, 16                                 ; 4CF3 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 4CF6 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 4CFA _ 89. 14 24
        call    fifo8_put                               ; 4CFD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 4D02 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4D05 _ 89. 04 24
        call    task_sleep                              ; 4D08 _ E8, FFFFFFFC(rel)
        leave                                           ; 4D0D _ C9
        ret                                             ; 4D0E _ C3
; task_send_message End of function

file_load_content:; Function begin
        push    ebp                                     ; 4D0F _ 55
        mov     ebp, esp                                ; 4D10 _ 89. E5
        sub     esp, 56                                 ; 4D12 _ 83. EC, 38
        mov     dword [ebp-24H], 78848                  ; 4D15 _ C7. 45, DC, 00013400
        mov     eax, dword [memman]                     ; 4D1C _ A1, 00000000(d)
        mov     dword [esp+4H], 13                      ; 4D21 _ C7. 44 24, 04, 0000000D
        mov     dword [esp], eax                        ; 4D29 _ 89. 04 24
        call    memman_alloc                            ; 4D2C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 4D31 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 4D34 _ 8B. 45, EC
        add     eax, 12                                 ; 4D37 _ 83. C0, 0C
        mov     byte [eax], 0                           ; 4D3A _ C6. 00, 00
        jmp     ?_294                                   ; 4D3D _ E9, 00000129

?_284:  mov     dword [ebp-20H], 0                      ; 4D42 _ C7. 45, E0, 00000000
        jmp     ?_287                                   ; 4D49 _ EB, 2C

?_285:  mov     edx, dword [ebp-24H]                    ; 4D4B _ 8B. 55, DC
        mov     eax, dword [ebp-20H]                    ; 4D4E _ 8B. 45, E0
        add     eax, edx                                ; 4D51 _ 01. D0
        movzx   eax, byte [eax]                         ; 4D53 _ 0F B6. 00
        test    al, al                                  ; 4D56 _ 84. C0
        jz      ?_286                                   ; 4D58 _ 74, 1B
        mov     edx, dword [ebp-20H]                    ; 4D5A _ 8B. 55, E0
        mov     eax, dword [ebp-14H]                    ; 4D5D _ 8B. 45, EC
        add     edx, eax                                ; 4D60 _ 01. C2
        mov     ecx, dword [ebp-24H]                    ; 4D62 _ 8B. 4D, DC
        mov     eax, dword [ebp-20H]                    ; 4D65 _ 8B. 45, E0
        add     eax, ecx                                ; 4D68 _ 01. C8
        movzx   eax, byte [eax]                         ; 4D6A _ 0F B6. 00
        mov     byte [edx], al                          ; 4D6D _ 88. 02
        add     dword [ebp-20H], 1                      ; 4D6F _ 83. 45, E0, 01
        jmp     ?_287                                   ; 4D73 _ EB, 02

?_286:  jmp     ?_288                                   ; 4D75 _ EB, 06

?_287:  cmp     dword [ebp-20H], 7                      ; 4D77 _ 83. 7D, E0, 07
        jle     ?_285                                   ; 4D7B _ 7E, CE
?_288:  mov     dword [ebp-1CH], 0                      ; 4D7D _ C7. 45, E4, 00000000
        mov     edx, dword [ebp-20H]                    ; 4D84 _ 8B. 55, E0
        mov     eax, dword [ebp-14H]                    ; 4D87 _ 8B. 45, EC
        add     eax, edx                                ; 4D8A _ 01. D0
        mov     byte [eax], 46                          ; 4D8C _ C6. 00, 2E
        add     dword [ebp-20H], 1                      ; 4D8F _ 83. 45, E0, 01
        mov     dword [ebp-1CH], 0                      ; 4D93 _ C7. 45, E4, 00000000
        jmp     ?_290                                   ; 4D9A _ EB, 1E

?_289:  mov     edx, dword [ebp-20H]                    ; 4D9C _ 8B. 55, E0
        mov     eax, dword [ebp-14H]                    ; 4D9F _ 8B. 45, EC
        add     edx, eax                                ; 4DA2 _ 01. C2
        mov     ecx, dword [ebp-24H]                    ; 4DA4 _ 8B. 4D, DC
        mov     eax, dword [ebp-1CH]                    ; 4DA7 _ 8B. 45, E4
        add     eax, ecx                                ; 4DAA _ 01. C8
        movzx   eax, byte [eax+8H]                      ; 4DAC _ 0F B6. 40, 08
        mov     byte [edx], al                          ; 4DB0 _ 88. 02
        add     dword [ebp-20H], 1                      ; 4DB2 _ 83. 45, E0, 01
        add     dword [ebp-1CH], 1                      ; 4DB6 _ 83. 45, E4, 01
?_290:  cmp     dword [ebp-1CH], 2                      ; 4DBA _ 83. 7D, E4, 02
        jle     ?_289                                   ; 4DBE _ 7E, DC
        mov     edx, dword [ebp-20H]                    ; 4DC0 _ 8B. 55, E0
        mov     eax, dword [ebp-14H]                    ; 4DC3 _ 8B. 45, EC
        add     eax, edx                                ; 4DC6 _ 01. D0
        mov     byte [eax], 0                           ; 4DC8 _ C6. 00, 00
        mov     eax, dword [ebp-14H]                    ; 4DCB _ 8B. 45, EC
        mov     dword [esp+4H], eax                     ; 4DCE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 4DD2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4DD5 _ 89. 04 24
        call    strcmp                                  ; 4DD8 _ E8, FFFFFFFC(rel)
        cmp     eax, 1                                  ; 4DDD _ 83. F8, 01
        jne     ?_293                                   ; 4DE0 _ 0F 85, 00000081
        mov     eax, dword [ebp-24H]                    ; 4DE6 _ 8B. 45, DC
        mov     edx, dword [eax+1CH]                    ; 4DE9 _ 8B. 50, 1C
        mov     eax, dword [memman]                     ; 4DEC _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 4DF1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4DF5 _ 89. 04 24
        call    memman_alloc_4k                         ; 4DF8 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 4DFD _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 4DFF _ 8B. 45, 0C
        mov     dword [eax], edx                        ; 4E02 _ 89. 10
        mov     eax, dword [ebp-24H]                    ; 4E04 _ 8B. 45, DC
        mov     eax, dword [eax+1CH]                    ; 4E07 _ 8B. 40, 1C
        mov     edx, eax                                ; 4E0A _ 89. C2
        mov     eax, dword [ebp+0CH]                    ; 4E0C _ 8B. 45, 0C
        mov     dword [eax+4H], edx                     ; 4E0F _ 89. 50, 04
        mov     dword [ebp-10H], 88064                  ; 4E12 _ C7. 45, F0, 00015800
        mov     eax, dword [ebp-24H]                    ; 4E19 _ 8B. 45, DC
        movzx   eax, word [eax+1AH]                     ; 4E1C _ 0F B7. 40, 1A
        movzx   eax, ax                                 ; 4E20 _ 0F B7. C0
        shl     eax, 9                                  ; 4E23 _ C1. E0, 09
        add     dword [ebp-10H], eax                    ; 4E26 _ 01. 45, F0
        mov     eax, dword [ebp-24H]                    ; 4E29 _ 8B. 45, DC
        mov     eax, dword [eax+1CH]                    ; 4E2C _ 8B. 40, 1C
        mov     dword [ebp-0CH], eax                    ; 4E2F _ 89. 45, F4
        mov     dword [ebp-18H], 0                      ; 4E32 _ C7. 45, E8, 00000000
        mov     dword [ebp-18H], 0                      ; 4E39 _ C7. 45, E8, 00000000
        jmp     ?_292                                   ; 4E40 _ EB, 1B

?_291:  mov     eax, dword [ebp+0CH]                    ; 4E42 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 4E45 _ 8B. 10
        mov     eax, dword [ebp-18H]                    ; 4E47 _ 8B. 45, E8
        add     edx, eax                                ; 4E4A _ 01. C2
        mov     ecx, dword [ebp-18H]                    ; 4E4C _ 8B. 4D, E8
        mov     eax, dword [ebp-10H]                    ; 4E4F _ 8B. 45, F0
        add     eax, ecx                                ; 4E52 _ 01. C8
        movzx   eax, byte [eax]                         ; 4E54 _ 0F B6. 00
        mov     byte [edx], al                          ; 4E57 _ 88. 02
        add     dword [ebp-18H], 1                      ; 4E59 _ 83. 45, E8, 01
?_292:  mov     eax, dword [ebp-18H]                    ; 4E5D _ 8B. 45, E8
        cmp     eax, dword [ebp-0CH]                    ; 4E60 _ 3B. 45, F4
        jl      ?_291                                   ; 4E63 _ 7C, DD
        jmp     ?_295                                   ; 4E65 _ EB, 12

?_293:  add     dword [ebp-24H], 32                     ; 4E67 _ 83. 45, DC, 20
?_294:  mov     eax, dword [ebp-24H]                    ; 4E6B _ 8B. 45, DC
        movzx   eax, byte [eax]                         ; 4E6E _ 0F B6. 00
        test    al, al                                  ; 4E71 _ 84. C0
        jne     ?_284                                   ; 4E73 _ 0F 85, FFFFFEC9
?_295:  mov     edx, dword [ebp-14H]                    ; 4E79 _ 8B. 55, EC
        mov     eax, dword [memman]                     ; 4E7C _ A1, 00000000(d)
        mov     dword [esp+8H], 13                      ; 4E81 _ C7. 44 24, 08, 0000000D
        mov     dword [esp+4H], edx                     ; 4E89 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 4E8D _ 89. 04 24
        call    memman_free                             ; 4E90 _ E8, FFFFFFFC(rel)
        leave                                           ; 4E95 _ C9
        ret                                             ; 4E96 _ C3
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

table_rgb.1782:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0120 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0128 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0130 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0138 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0140 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0148 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0150 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........

cursor.1850:                                            ; byte
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

closebtn.1937:                                          ; byte
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

timerinfo1.1766:                                        ; byte
        resb    28                                      ; 0018

timerbuf1.1769:                                         ; qword
        resq    1                                       ; 0034

timerinfo2.1767:                                        ; byte
        resb    28                                      ; 003C

timerbuf2.1770:                                         ; qword
        resq    1                                       ; 0058

timerinfo3.1768:                                        ; byte
        resb    28                                      ; 0060

timerbuf3.1771:                                         ; qword
        resq    4                                       ; 007C
        resb    4                                       ; 009C

screen_info:                                            ; qword
        resb    4                                       ; 00A0

?_317:  resw    1                                       ; 00A4

?_318:  resw    13                                      ; 00A6

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

?_319:  resb    9                                       ; 02E1

?_320:  resb    22                                      ; 02EA

timer_control:                                          ; byte
        resd    2001                                    ; 0300

task_timer:                                             ; dword
        resd    1                                       ; 2244

task_control:                                           ; dword
        resd    1                                       ; 2248


