; Disassembly of file: ckernel.o
; Fri Mar 13 10:04:22 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


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

extern task_timer                                       ; dword
extern mouse_y                                          ; dword
extern keyinfo                                          ; dword
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
        sub     esp, 116                                ; 0004 _ 83. EC, 74
        mov     dword [esp], screen_info                ; 0007 _ C7. 04 24, 00000000(d)
        call    init_screeninfo                         ; 000E _ E8, FFFFFFFC(rel)
        mov     eax, dword [screen_info]                ; 0013 _ A1, 00000000(d)
        mov     dword [ebp-40H], eax                    ; 0018 _ 89. 45, C0
        movzx   eax, word [screen_info+4H]              ; 001B _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0022 _ 98
        mov     dword [ebp-3CH], eax                    ; 0023 _ 89. 45, C4
        movzx   eax, word [screen_info+6H]              ; 0026 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 002D _ 98
        mov     dword [ebp-38H], eax                    ; 002E _ 89. 45, C8
        mov     eax, dword [memman]                     ; 0031 _ A1, 00000004(d)
        mov     dword [esp], eax                        ; 0036 _ 89. 04 24
        call    memman_init                             ; 0039 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 003E _ A1, 00000004(d)
        mov     dword [esp+8H], 1072594944              ; 0043 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 17301504                ; 004B _ C7. 44 24, 04, 01080000
        mov     dword [esp], eax                        ; 0053 _ 89. 04 24
        call    memman_free                             ; 0056 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 005B _ A1, 00000004(d)
        mov     edx, dword [ebp-38H]                    ; 0060 _ 8B. 55, C8
        mov     dword [esp+0CH], edx                    ; 0063 _ 89. 54 24, 0C
        mov     edx, dword [ebp-3CH]                    ; 0067 _ 8B. 55, C4
        mov     dword [esp+8H], edx                     ; 006A _ 89. 54 24, 08
        mov     edx, dword [ebp-40H]                    ; 006E _ 8B. 55, C0
        mov     dword [esp+4H], edx                     ; 0071 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0075 _ 89. 04 24
        call    sheet_control_init                      ; 0078 _ E8, FFFFFFFC(rel)
        mov     dword [sheet_control], eax              ; 007D _ A3, 00000008(d)
        mov     eax, dword [sheet_control]              ; 0082 _ A1, 00000008(d)
        mov     dword [esp], eax                        ; 0087 _ 89. 04 24
        call    sheet_alloc                             ; 008A _ E8, FFFFFFFC(rel)
        mov     dword [back_sheet], eax                 ; 008F _ A3, 0000000C(d)
        mov     eax, dword [sheet_control]              ; 0094 _ A1, 00000008(d)
        mov     dword [esp], eax                        ; 0099 _ 89. 04 24
        call    sheet_alloc                             ; 009C _ E8, FFFFFFFC(rel)
        mov     dword [mouse_sheet], eax                ; 00A1 _ A3, 00000010(d)
        mov     eax, dword [ebp-3CH]                    ; 00A6 _ 8B. 45, C4
        imul    eax, dword [ebp-38H]                    ; 00A9 _ 0F AF. 45, C8
        mov     edx, eax                                ; 00AD _ 89. C2
        mov     eax, dword [memman]                     ; 00AF _ A1, 00000004(d)
        mov     dword [esp+4H], edx                     ; 00B4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00B8 _ 89. 04 24
        call    memman_alloc_4k                         ; 00BB _ E8, FFFFFFFC(rel)
        mov     dword [back_buf], eax                   ; 00C0 _ A3, 00000000(d)
        mov     edx, dword [back_buf]                   ; 00C5 _ 8B. 15, 00000000(d)
        mov     eax, dword [back_sheet]                 ; 00CB _ A1, 0000000C(d)
        mov     dword [esp+10H], 99                     ; 00D0 _ C7. 44 24, 10, 00000063
        mov     ecx, dword [ebp-38H]                    ; 00D8 _ 8B. 4D, C8
        mov     dword [esp+0CH], ecx                    ; 00DB _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-3CH]                    ; 00DF _ 8B. 4D, C4
        mov     dword [esp+8H], ecx                     ; 00E2 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 00E6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00EA _ 89. 04 24
        call    sheet_setbuf                            ; 00ED _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_sheet]                ; 00F2 _ A1, 00000010(d)
        mov     dword [esp+10H], 99                     ; 00F7 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 16                     ; 00FF _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 16                      ; 0107 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], mouse_cursor_buf        ; 010F _ C7. 44 24, 04, 00000000(d)
        mov     dword [esp], eax                        ; 0117 _ 89. 04 24
        call    sheet_setbuf                            ; 011A _ E8, FFFFFFFC(rel)
        call    init_mouse_position                     ; 011F _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 0124 _ E8, FFFFFFFC(rel)
        call    init_fifo_buf                           ; 0129 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 012E _ E8, FFFFFFFC(rel)
        call    get_timer_control                       ; 0133 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 0138 _ 89. 45, CC
        call    init_time_port                          ; 013B _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0140 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf1.1751          ; 0148 _ C7. 44 24, 08, 00000030(d)
        mov     dword [esp+4H], 8                       ; 0150 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1748            ; 0158 _ C7. 04 24, 00000014(d)
        call    fifo8_init                              ; 015F _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0164 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0169 _ 89. 45, D0
        mov     dword [esp+8H], 1                       ; 016C _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1748         ; 0174 _ C7. 44 24, 04, 00000014(d)
        mov     eax, dword [ebp-30H]                    ; 017C _ 8B. 45, D0
        mov     dword [esp], eax                        ; 017F _ 89. 04 24
        call    timer_init                              ; 0182 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0187 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-30H]                    ; 018F _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0192 _ 89. 04 24
        call    timer_settime                           ; 0195 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 019A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf2.1752          ; 01A2 _ C7. 44 24, 08, 00000054(d)
        mov     dword [esp+4H], 8                       ; 01AA _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1749            ; 01B2 _ C7. 04 24, 00000038(d)
        call    fifo8_init                              ; 01B9 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01BE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 01C3 _ 89. 45, D4
        mov     dword [esp+8H], 1                       ; 01C6 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1749         ; 01CE _ C7. 44 24, 04, 00000038(d)
        mov     eax, dword [ebp-2CH]                    ; 01D6 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 01D9 _ 89. 04 24
        call    timer_init                              ; 01DC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01E1 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-2CH]                    ; 01E9 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 01EC _ 89. 04 24
        call    timer_settime                           ; 01EF _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 01F4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf3.1753          ; 01FC _ C7. 44 24, 08, 00000078(d)
        mov     dword [esp+4H], 8                       ; 0204 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1750            ; 020C _ C7. 04 24, 0000005C(d)
        call    fifo8_init                              ; 0213 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0218 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 021D _ 89. 45, D8
        mov     dword [esp+8H], 1                       ; 0220 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1750         ; 0228 _ C7. 44 24, 04, 0000005C(d)
        mov     eax, dword [ebp-28H]                    ; 0230 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0233 _ 89. 04 24
        call    timer_init                              ; 0236 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 023B _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 0243 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0246 _ 89. 04 24
        call    timer_settime                           ; 0249 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 024E _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 0253 _ A1, 00000000(d)
        mov     edx, dword [ebp-38H]                    ; 0258 _ 8B. 55, C8
        mov     dword [esp+8H], edx                     ; 025B _ 89. 54 24, 08
        mov     edx, dword [ebp-3CH]                    ; 025F _ 8B. 55, C4
        mov     dword [esp+4H], edx                     ; 0262 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0266 _ 89. 04 24
        call    init_desktop                            ; 0269 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 99                      ; 026E _ C7. 44 24, 04, 00000063
        mov     dword [esp], mouse_cursor_buf           ; 0276 _ C7. 04 24, 00000000(d)
        call    init_mouse_cursor                       ; 027D _ E8, FFFFFFFC(rel)
        mov     edx, dword [back_sheet]                 ; 0282 _ 8B. 15, 0000000C(d)
        mov     eax, dword [sheet_control]              ; 0288 _ A1, 00000008(d)
        mov     dword [esp+0CH], 0                      ; 028D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0295 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 029D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 02A1 _ 89. 04 24
        call    sheet_slide                             ; 02A4 _ E8, FFFFFFFC(rel)
        mov     ebx, dword [mouse_y]                    ; 02A9 _ 8B. 1D, 00000000(d)
        mov     ecx, dword [mouse_x]                    ; 02AF _ 8B. 0D, 00000000(d)
        mov     edx, dword [mouse_sheet]                ; 02B5 _ 8B. 15, 00000010(d)
        mov     eax, dword [sheet_control]              ; 02BB _ A1, 00000008(d)
        mov     dword [esp+0CH], ebx                    ; 02C0 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 02C4 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 02C8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 02CC _ 89. 04 24
        call    sheet_slide                             ; 02CF _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 02D4 _ A1, 00000008(d)
        mov     dword [esp+4H], ?_226                   ; 02D9 _ C7. 44 24, 04, 00000000(d)
        mov     dword [esp], eax                        ; 02E1 _ 89. 04 24
        call    message_box                             ; 02E4 _ E8, FFFFFFFC(rel)
        mov     dword [sheet_win], eax                  ; 02E9 _ A3, 00000000(d)
        mov     edx, dword [back_sheet]                 ; 02EE _ 8B. 15, 0000000C(d)
        mov     eax, dword [sheet_control]              ; 02F4 _ A1, 00000008(d)
        mov     dword [esp+8H], 0                       ; 02F9 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0301 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0305 _ 89. 04 24
        call    sheet_updown                            ; 0308 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_sheet]                ; 030D _ 8B. 15, 00000010(d)
        mov     eax, dword [sheet_control]              ; 0313 _ A1, 00000008(d)
        mov     dword [esp+8H], 100                     ; 0318 _ C7. 44 24, 08, 00000064
        mov     dword [esp+4H], edx                     ; 0320 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0324 _ 89. 04 24
        call    sheet_updown                            ; 0327 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 032C _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 0331 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 0336 _ 89. 45, DC
        call    get_addr_gdt                            ; 0339 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 033E _ 89. 45, E0
        mov     eax, dword [memman]                     ; 0341 _ A1, 00000004(d)
        mov     dword [esp], eax                        ; 0346 _ 89. 04 24
        call    task_init                               ; 0349 _ E8, FFFFFFFC(rel)
        mov     dword [task_a], eax                     ; 034E _ A3, 00000004(d)
        mov     eax, dword [task_a]                     ; 0353 _ A1, 00000004(d)
        mov     dword [keyinfo+18H], eax                ; 0358 _ A3, 00000018(d)
        mov     eax, dword [task_a]                     ; 035D _ A1, 00000004(d)
        mov     dword [esp+8H], 0                       ; 0362 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], 0                       ; 036A _ C7. 44 24, 04, 00000000
        mov     dword [esp], eax                        ; 0372 _ 89. 04 24
        call    task_run                                ; 0375 _ E8, FFFFFFFC(rel)
        call    launch_console                          ; 037A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 037F _ 89. 45, E4
        mov     dword [ebp-18H], 0                      ; 0382 _ C7. 45, E8, 00000000
        mov     dword [ebp-14H], 0                      ; 0389 _ C7. 45, EC, 00000000
        mov     dword [ebp-10H], 0                      ; 0390 _ C7. 45, F0, 00000000
        mov     dword [ebp-54H], 8                      ; 0397 _ C7. 45, AC, 00000008
        mov     dword [ebp-50H], 7                      ; 039E _ C7. 45, B0, 00000007
        mov     dword [ebp-4CH], 0                      ; 03A5 _ C7. 45, B4, 00000000
        mov     dword [ebp-48H], 0                      ; 03AC _ C7. 45, B8, 00000000
        mov     dword [ebp-44H], 0                      ; 03B3 _ C7. 45, BC, 00000000
?_001:  call    io_cli                                  ; 03BA _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 03BF _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 03C6 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 03CB _ 89. C3
        mov     dword [esp], mouseinfo                  ; 03CD _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 03D4 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03D9 _ 01. C3
        mov     dword [esp], timerinfo1.1748            ; 03DB _ C7. 04 24, 00000014(d)
        call    fifo8_status                            ; 03E2 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03E7 _ 01. C3
        mov     dword [esp], timerinfo2.1749            ; 03E9 _ C7. 04 24, 00000038(d)
        call    fifo8_status                            ; 03F0 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03F5 _ 01. C3
        mov     dword [esp], timerinfo3.1750            ; 03F7 _ C7. 04 24, 0000005C(d)
        call    fifo8_status                            ; 03FE _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 0403 _ 01. D8
        test    eax, eax                                ; 0405 _ 85. C0
        jnz     ?_002                                   ; 0407 _ 75, 0A
        call    io_sti                                  ; 0409 _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 040E _ E9, 000004F9

?_002:  mov     dword [esp], keyinfo                    ; 0413 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 041A _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 041F _ 85. C0
        je      ?_007                                   ; 0421 _ 0F 84, 00000326
        call    io_sti                                  ; 0427 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 042C _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0433 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0438 _ 89. 45, E8
        cmp     dword [ebp-18H], 28                     ; 043B _ 83. 7D, E8, 1C
        je      ?_013                                   ; 043F _ 0F 84, 000004C7
        cmp     dword [ebp-18H], 15                     ; 0445 _ 83. 7D, E8, 0F
        jne     ?_005                                   ; 0449 _ 0F 85, 00000128
        cmp     dword [ebp-48H], 0                      ; 044F _ 83. 7D, B8, 00
        jnz     ?_003                                   ; 0453 _ 75, 54
        mov     dword [ebp-48H], 1                      ; 0455 _ C7. 45, B8, 00000001
        mov     edx, dword [sheet_win]                  ; 045C _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0462 _ A1, 00000008(d)
        mov     dword [esp+0CH], 0                      ; 0467 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_226                   ; 046F _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 0477 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 047B _ 89. 04 24
        call    make_window_title                       ; 047E _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 0483 _ A1, 00000008(d)
        mov     dword [esp+0CH], 1                      ; 0488 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_227                   ; 0490 _ C7. 44 24, 08, 00000007(d)
        mov     edx, dword [ebp-1CH]                    ; 0498 _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 049B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 049F _ 89. 04 24
        call    make_window_title                       ; 04A2 _ E8, FFFFFFFC(rel)
        jmp     ?_004                                   ; 04A7 _ EB, 52

?_003:  mov     dword [ebp-48H], 0                      ; 04A9 _ C7. 45, B8, 00000000
        mov     edx, dword [sheet_win]                  ; 04B0 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 04B6 _ A1, 00000008(d)
        mov     dword [esp+0CH], 1                      ; 04BB _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_226                   ; 04C3 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 04CB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04CF _ 89. 04 24
        call    make_window_title                       ; 04D2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 04D7 _ A1, 00000008(d)
        mov     dword [esp+0CH], 0                      ; 04DC _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_227                   ; 04E4 _ C7. 44 24, 08, 00000007(d)
        mov     edx, dword [ebp-1CH]                    ; 04EC _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 04EF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04F3 _ 89. 04 24
        call    make_window_title                       ; 04F6 _ E8, FFFFFFFC(rel)
?_004:  mov     eax, dword [sheet_win]                  ; 04FB _ A1, 00000000(d)
        mov     ebx, dword [eax+8H]                     ; 0500 _ 8B. 58, 08
        mov     eax, dword [sheet_win]                  ; 0503 _ A1, 00000000(d)
        mov     ecx, dword [eax+4H]                     ; 0508 _ 8B. 48, 04
        mov     edx, dword [sheet_win]                  ; 050B _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0511 _ A1, 00000008(d)
        mov     dword [esp+14H], ebx                    ; 0516 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 051A _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 051E _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0526 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 052E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0532 _ 89. 04 24
        call    sheet_refresh                           ; 0535 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 053A _ 8B. 45, E4
        mov     ecx, dword [eax+8H]                     ; 053D _ 8B. 48, 08
        mov     eax, dword [ebp-1CH]                    ; 0540 _ 8B. 45, E4
        mov     edx, dword [eax+4H]                     ; 0543 _ 8B. 50, 04
        mov     eax, dword [sheet_control]              ; 0546 _ A1, 00000008(d)
        mov     dword [esp+14H], ecx                    ; 054B _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 054F _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 0553 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 055B _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-1CH]                    ; 0563 _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 0566 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 056A _ 89. 04 24
        call    sheet_refresh                           ; 056D _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 0572 _ E9, 00000395

?_005:  cmp     dword [ebp-48H], 0                      ; 0577 _ 83. 7D, B8, 00
        jne     ?_006                                   ; 057B _ 0F 85, 00000178
        mov     eax, dword [ebp-18H]                    ; 0581 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 0584 _ 89. 04 24
        call    transfer_scancode                       ; 0587 _ E8, FFFFFFFC(rel)
        test    al, al                                  ; 058C _ 84. C0
        je      ?_013                                   ; 058E _ 0F 84, 00000378
        cmp     dword [ebp-54H], 143                    ; 0594 _ 81. 7D, AC, 0000008F
        jg      ?_013                                   ; 059B _ 0F 8F, 0000036B
        mov     eax, dword [ebp-54H]                    ; 05A1 _ 8B. 45, AC
        lea     ecx, [eax+7H]                           ; 05A4 _ 8D. 48, 07
        mov     eax, dword [sheet_win]                  ; 05A7 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 05AC _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 05AF _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 05B4 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 05B6 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 05BE _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 05C2 _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-54H]                    ; 05CA _ 8B. 4D, AC
        mov     dword [esp+0CH], ecx                    ; 05CD _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 05D1 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 05D9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05DD _ 89. 04 24
        call    paint_rectangle                         ; 05E0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-54H]                    ; 05E5 _ 8B. 45, AC
        lea     ecx, [eax+8H]                           ; 05E8 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 05EB _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 05F1 _ A1, 00000008(d)
        mov     dword [esp+14H], 44                     ; 05F6 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 05FE _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0602 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-54H]                    ; 060A _ 8B. 4D, AC
        mov     dword [esp+8H], ecx                     ; 060D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0611 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0615 _ 89. 04 24
        call    sheet_refresh                           ; 0618 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 061D _ 8B. 45, E8
        mov     dword [esp], eax                        ; 0620 _ 89. 04 24
        call    transfer_scancode                       ; 0623 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-57H], al                      ; 0628 _ 88. 45, A9
        movzx   eax, byte [ebp-57H]                     ; 062B _ 0F B6. 45, A9
        mov     byte [ebp-56H], al                      ; 062F _ 88. 45, AA
        mov     byte [ebp-55H], 0                       ; 0632 _ C6. 45, AB, 00
        mov     edx, dword [sheet_win]                  ; 0636 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 063C _ A1, 00000008(d)
        mov     dword [esp+14H], 0                      ; 0641 _ C7. 44 24, 14, 00000000
        lea     ecx, [ebp-56H]                          ; 0649 _ 8D. 4D, AA
        mov     dword [esp+10H], ecx                    ; 064C _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0650 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-54H]                    ; 0658 _ 8B. 4D, AC
        mov     dword [esp+8H], ecx                     ; 065B _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 065F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0663 _ 89. 04 24
        call    paint_string                            ; 0666 _ E8, FFFFFFFC(rel)
        add     dword [ebp-54H], 8                      ; 066B _ 83. 45, AC, 08
        mov     dword [ebp-44H], 1                      ; 066F _ C7. 45, BC, 00000001
        mov     eax, dword [ebp-54H]                    ; 0676 _ 8B. 45, AC
        lea     ebx, [eax+7H]                           ; 0679 _ 8D. 58, 07
        mov     eax, dword [ebp-50H]                    ; 067C _ 8B. 45, B0
        movzx   ecx, al                                 ; 067F _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 0682 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 0687 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 068A _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 068F _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0691 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 0699 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 069D _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-54H]                    ; 06A5 _ 8B. 5D, AC
        mov     dword [esp+0CH], ebx                    ; 06A8 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 06AC _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06B0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06B4 _ 89. 04 24
        call    paint_rectangle                         ; 06B7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-54H]                    ; 06BC _ 8B. 45, AC
        lea     ecx, [eax+8H]                           ; 06BF _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 06C2 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 06C8 _ A1, 00000008(d)
        mov     dword [esp+14H], 44                     ; 06CD _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 06D5 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 06D9 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-54H]                    ; 06E1 _ 8B. 4D, AC
        mov     dword [esp+8H], ecx                     ; 06E4 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06E8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06EC _ 89. 04 24
        call    sheet_refresh                           ; 06EF _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 06F4 _ E9, 00000213

?_006:  mov     eax, dword [ebp-18H]                    ; 06F9 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 06FC _ 89. 04 24
        call    is_special_key                          ; 06FF _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0704 _ 85. C0
        jne     ?_013                                   ; 0706 _ 0F 85, 00000200
        mov     eax, dword [ebp-18H]                    ; 070C _ 8B. 45, E8
        movzx   eax, al                                 ; 070F _ 0F B6. C0
        mov     edx, dword [task_console_g]             ; 0712 _ 8B. 15, 00000000(d)
        add     edx, 16                                 ; 0718 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 071B _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 071F _ 89. 14 24
        call    fifo8_put                               ; 0722 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0727 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 072E _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0733 _ 85. C0
        jne     ?_013                                   ; 0735 _ 0F 85, 000001D1
        mov     eax, dword [task_a]                     ; 073B _ A1, 00000004(d)
        mov     dword [esp], eax                        ; 0740 _ 89. 04 24
        call    task_sleep                              ; 0743 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0748 _ E9, FFFFFC6D

?_007:  mov     dword [esp], mouseinfo                  ; 074D _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0754 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0759 _ 85. C0
        jz      ?_008                                   ; 075B _ 74, 26
        mov     ecx, dword [mouse_sheet]                ; 075D _ 8B. 0D, 00000010(d)
        mov     edx, dword [back_sheet]                 ; 0763 _ 8B. 15, 0000000C(d)
        mov     eax, dword [sheet_control]              ; 0769 _ A1, 00000008(d)
        mov     dword [esp+8H], ecx                     ; 076E _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0772 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0776 _ 89. 04 24
        call    show_mouse_info                         ; 0779 _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 077E _ E9, 00000189

?_008:  mov     dword [esp], timerinfo1.1748            ; 0783 _ C7. 04 24, 00000014(d)
        call    fifo8_status                            ; 078A _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 078F _ 85. C0
        jz      ?_009                                   ; 0791 _ 74, 49
        call    io_sti                                  ; 0793 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1748            ; 0798 _ C7. 04 24, 00000014(d)
        call    fifo8_get                               ; 079F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 07A4 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-30H]                    ; 07AC _ 8B. 45, D0
        mov     dword [esp], eax                        ; 07AF _ 89. 04 24
        call    timer_settime                           ; 07B2 _ E8, FFFFFFFC(rel)
        add     dword [ebp-4CH], 8                      ; 07B7 _ 83. 45, B4, 08
        cmp     dword [ebp-44H], 0                      ; 07BB _ 83. 7D, BC, 00
        jne     ?_013                                   ; 07BF _ 0F 85, 00000147
        call    io_cli                                  ; 07C5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_a]                     ; 07CA _ A1, 00000004(d)
        mov     dword [esp], eax                        ; 07CF _ 89. 04 24
        call    task_sleep                              ; 07D2 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 07D7 _ E9, FFFFFBDE

?_009:  mov     dword [esp], timerinfo2.1749            ; 07DC _ C7. 04 24, 00000038(d)
        call    fifo8_status                            ; 07E3 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07E8 _ 85. C0
        jz      ?_010                                   ; 07EA _ 74, 16
        call    io_sti                                  ; 07EC _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1749            ; 07F1 _ C7. 04 24, 00000038(d)
        call    fifo8_get                               ; 07F8 _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 07FD _ E9, 0000010A

?_010:  mov     dword [esp], timerinfo3.1750            ; 0802 _ C7. 04 24, 0000005C(d)
        call    fifo8_status                            ; 0809 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 080E _ 85. C0
        je      ?_013                                   ; 0810 _ 0F 84, 000000F6
        mov     dword [esp], timerinfo3.1750            ; 0816 _ C7. 04 24, 0000005C(d)
        call    fifo8_get                               ; 081D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0822 _ 89. 45, F4
        call    io_sti                                  ; 0825 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 082A _ 83. 7D, F4, 00
        jz      ?_011                                   ; 082E _ 74, 24
        mov     dword [esp+8H], 0                       ; 0830 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1750         ; 0838 _ C7. 44 24, 04, 0000005C(d)
        mov     eax, dword [ebp-28H]                    ; 0840 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0843 _ 89. 04 24
        call    timer_init                              ; 0846 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-50H], 0                      ; 084B _ C7. 45, B0, 00000000
        jmp     ?_012                                   ; 0852 _ EB, 22

?_011:  mov     dword [esp+8H], 1                       ; 0854 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1750         ; 085C _ C7. 44 24, 04, 0000005C(d)
        mov     eax, dword [ebp-28H]                    ; 0864 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0867 _ 89. 04 24
        call    timer_init                              ; 086A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-50H], 7                      ; 086F _ C7. 45, B0, 00000007
?_012:  mov     dword [esp+4H], 50                      ; 0876 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 087E _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0881 _ 89. 04 24
        call    timer_settime                           ; 0884 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-54H]                    ; 0889 _ 8B. 45, AC
        lea     ebx, [eax+7H]                           ; 088C _ 8D. 58, 07
        mov     eax, dword [ebp-50H]                    ; 088F _ 8B. 45, B0
        movzx   ecx, al                                 ; 0892 _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 0895 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 089A _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 089D _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 08A2 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 08A4 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 08AC _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 08B0 _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-54H]                    ; 08B8 _ 8B. 5D, AC
        mov     dword [esp+0CH], ebx                    ; 08BB _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 08BF _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08C3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08C7 _ 89. 04 24
        call    paint_rectangle                         ; 08CA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-54H]                    ; 08CF _ 8B. 45, AC
        lea     ecx, [eax+8H]                           ; 08D2 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 08D5 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 08DB _ A1, 00000008(d)
        mov     dword [esp+14H], 44                     ; 08E0 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 08E8 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 08EC _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-54H]                    ; 08F4 _ 8B. 4D, AC
        mov     dword [esp+8H], ecx                     ; 08F7 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08FB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08FF _ 89. 04 24
        call    sheet_refresh                           ; 0902 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0907 _ E9, FFFFFAAE

?_013:  jmp     ?_001                                   ; 090C _ E9, FFFFFAA9
; CMain End of function

task_b_main:; Function begin
        push    ebp                                     ; 0911 _ 55
        mov     ebp, esp                                ; 0912 _ 89. E5
        sub     esp, 104                                ; 0914 _ 83. EC, 68
        mov     eax, dword [ebp+8H]                     ; 0917 _ 8B. 45, 08
        mov     dword [ebp-4CH], eax                    ; 091A _ 89. 45, B4
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 091D _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 0923 _ 89. 45, F4
        xor     eax, eax                                ; 0926 _ 31. C0
        mov     edx, dword [back_sheet]                 ; 0928 _ 8B. 15, 0000000C(d)
        mov     eax, dword [sheet_control]              ; 092E _ A1, 00000008(d)
        mov     dword [esp+14H], 7                      ; 0933 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_228                  ; 093B _ C7. 44 24, 10, 0000000F(d)
        mov     dword [esp+0CH], 160                    ; 0943 _ C7. 44 24, 0C, 000000A0
        mov     dword [esp+8H], 0                       ; 094B _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0953 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0957 _ 89. 04 24
        call    paint_string                            ; 095A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], 0                      ; 095F _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 0966 _ C7. 45, CC, 00000000
        mov     dword [esp+0CH], 0                      ; 096D _ C7. 44 24, 0C, 00000000
        lea     eax, [ebp-14H]                          ; 0975 _ 8D. 45, EC
        mov     dword [esp+8H], eax                     ; 0978 _ 89. 44 24, 08
        mov     dword [esp+4H], 8                       ; 097C _ C7. 44 24, 04, 00000008
        lea     eax, [ebp-30H]                          ; 0984 _ 8D. 45, D0
        mov     dword [esp], eax                        ; 0987 _ 89. 04 24
        call    fifo8_init                              ; 098A _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 098F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 0994 _ 89. 45, C8
        mov     dword [esp+8H], 123                     ; 0997 _ C7. 44 24, 08, 0000007B
        lea     eax, [ebp-30H]                          ; 099F _ 8D. 45, D0
        mov     dword [esp+4H], eax                     ; 09A2 _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 09A6 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 09A9 _ 89. 04 24
        call    timer_init                              ; 09AC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 09B1 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 09B9 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 09BC _ 89. 04 24
        call    timer_settime                           ; 09BF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-40H], 0                      ; 09C4 _ C7. 45, C0, 00000000
        mov     dword [ebp-3CH], 0                      ; 09CB _ C7. 45, C4, 00000000
?_014:  add     dword [ebp-40H], 1                      ; 09D2 _ 83. 45, C0, 01
        call    io_cli                                  ; 09D6 _ E8, FFFFFFFC(rel)
        lea     eax, [ebp-30H]                          ; 09DB _ 8D. 45, D0
        mov     dword [esp], eax                        ; 09DE _ 89. 04 24
        call    fifo8_status                            ; 09E1 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 09E6 _ 85. C0
        jnz     ?_015                                   ; 09E8 _ 75, 07
        call    io_sti                                  ; 09EA _ E8, FFFFFFFC(rel)
        jmp     ?_016                                   ; 09EF _ EB, 6B

?_015:  lea     eax, [ebp-30H]                          ; 09F1 _ 8D. 45, D0
        mov     dword [esp], eax                        ; 09F4 _ 89. 04 24
        call    fifo8_get                               ; 09F7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 09FC _ 89. 45, CC
        call    io_sti                                  ; 09FF _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-34H], 123                    ; 0A04 _ 83. 7D, CC, 7B
        jnz     ?_016                                   ; 0A08 _ 75, 52
        mov     edx, dword [back_sheet]                 ; 0A0A _ 8B. 15, 0000000C(d)
        mov     eax, dword [sheet_control]              ; 0A10 _ A1, 00000008(d)
        mov     dword [esp+14H], 7                      ; 0A15 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_229                  ; 0A1D _ C7. 44 24, 10, 0000001C(d)
        mov     dword [esp+0CH], 176                    ; 0A25 _ C7. 44 24, 0C, 000000B0
        mov     ecx, dword [ebp-3CH]                    ; 0A2D _ 8B. 4D, C4
        mov     dword [esp+8H], ecx                     ; 0A30 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0A34 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0A38 _ 89. 04 24
        call    paint_string                            ; 0A3B _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0A40 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 0A48 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0A4B _ 89. 04 24
        call    timer_settime                           ; 0A4E _ E8, FFFFFFFC(rel)
        add     dword [ebp-3CH], 8                      ; 0A53 _ 83. 45, C4, 08
        jmp     ?_014                                   ; 0A57 _ E9, FFFFFF76

?_016:  jmp     ?_014                                   ; 0A5C _ E9, FFFFFF71
; task_b_main End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0A61 _ 55
        mov     ebp, esp                                ; 0A62 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0A64 _ A1, 00000000(d)
        mov     edx, eax                                ; 0A69 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A6B _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0A6E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0A70 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0A73 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0A79 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 0A7C _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 0A82 _ 5D
        ret                                             ; 0A83 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0A84 _ 55
        mov     ebp, esp                                ; 0A85 _ 89. E5
        sub     esp, 24                                 ; 0A87 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1747          ; 0A8A _ C7. 44 24, 08, 00000120(d)
        mov     dword [esp+4H], 15                      ; 0A92 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 0A9A _ C7. 04 24, 00000000
        call    set_palette                             ; 0AA1 _ E8, FFFFFFFC(rel)
        nop                                             ; 0AA6 _ 90
        leave                                           ; 0AA7 _ C9
        ret                                             ; 0AA8 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0AA9 _ 55
        mov     ebp, esp                                ; 0AAA _ 89. E5
        sub     esp, 40                                 ; 0AAC _ 83. EC, 28
        call    io_load_eflags                          ; 0AAF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0AB4 _ 89. 45, F4
        call    io_cli                                  ; 0AB7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0ABC _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0ABF _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0AC3 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0ACA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0ACF _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0AD2 _ 89. 45, F0
        jmp     ?_018                                   ; 0AD5 _ EB, 62

?_017:  mov     eax, dword [ebp+10H]                    ; 0AD7 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0ADA _ 0F B6. 00
        shr     al, 2                                   ; 0ADD _ C0. E8, 02
        movzx   eax, al                                 ; 0AE0 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0AE3 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0AE7 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0AEE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0AF3 _ 8B. 45, 10
        add     eax, 1                                  ; 0AF6 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0AF9 _ 0F B6. 00
        shr     al, 2                                   ; 0AFC _ C0. E8, 02
        movzx   eax, al                                 ; 0AFF _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0B02 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0B06 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0B0D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B12 _ 8B. 45, 10
        add     eax, 2                                  ; 0B15 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0B18 _ 0F B6. 00
        shr     al, 2                                   ; 0B1B _ C0. E8, 02
        movzx   eax, al                                 ; 0B1E _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0B21 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0B25 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0B2C _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0B31 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0B35 _ 83. 45, F0, 01
?_018:  mov     eax, dword [ebp-10H]                    ; 0B39 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0B3C _ 3B. 45, 0C
        jle     ?_017                                   ; 0B3F _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0B41 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0B44 _ 89. 04 24
        call    io_store_eflags                         ; 0B47 _ E8, FFFFFFFC(rel)
        nop                                             ; 0B4C _ 90
        leave                                           ; 0B4D _ C9
        ret                                             ; 0B4E _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0B4F _ 55
        mov     ebp, esp                                ; 0B50 _ 89. E5
        sub     esp, 20                                 ; 0B52 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0B55 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0B58 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0B5B _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0B5E _ 89. 45, FC
        jmp     ?_022                                   ; 0B61 _ EB, 33

?_019:  mov     eax, dword [ebp+14H]                    ; 0B63 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0B66 _ 89. 45, F8
        jmp     ?_021                                   ; 0B69 _ EB, 1F

?_020:  mov     eax, dword [ebp-4H]                     ; 0B6B _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0B6E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B72 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0B74 _ 8B. 45, F8
        add     eax, edx                                ; 0B77 _ 01. D0
        mov     edx, eax                                ; 0B79 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B7B _ 8B. 45, 08
        add     edx, eax                                ; 0B7E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0B80 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0B84 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0B86 _ 83. 45, F8, 01
?_021:  mov     eax, dword [ebp-8H]                     ; 0B8A _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0B8D _ 3B. 45, 1C
        jle     ?_020                                   ; 0B90 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0B92 _ 83. 45, FC, 01
?_022:  mov     eax, dword [ebp-4H]                     ; 0B96 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0B99 _ 3B. 45, 20
        jle     ?_019                                   ; 0B9C _ 7E, C5
        leave                                           ; 0B9E _ C9
        ret                                             ; 0B9F _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0BA0 _ 55
        mov     ebp, esp                                ; 0BA1 _ 89. E5
        push    ebx                                     ; 0BA3 _ 53
        sub     esp, 28                                 ; 0BA4 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 0BA7 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0BAA _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0BAD _ 8B. 45, 0C
        sub     eax, 1                                  ; 0BB0 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0BB3 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0BB7 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0BBB _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0BC3 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0BCB _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0BD3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0BD6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0BDA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0BDD _ 89. 04 24
        call    paint_rectangle                         ; 0BE0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0BE5 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0BE8 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0BEB _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0BEE _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0BF1 _ 8B. 45, 10
        sub     eax, 28                                 ; 0BF4 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 0BF7 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0BFB _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0BFF _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0C03 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0C0B _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0C13 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C16 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C1A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C1D _ 89. 04 24
        call    paint_rectangle                         ; 0C20 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C25 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0C28 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0C2B _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0C2E _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0C31 _ 8B. 45, 10
        sub     eax, 27                                 ; 0C34 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0C37 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0C3B _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0C3F _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0C43 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0C4B _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0C53 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C56 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C5A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C5D _ 89. 04 24
        call    paint_rectangle                         ; 0C60 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C65 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0C68 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0C6B _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0C6E _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0C71 _ 8B. 45, 10
        sub     eax, 26                                 ; 0C74 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0C77 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0C7B _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0C7F _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0C83 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0C8B _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0C93 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C96 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C9A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C9D _ 89. 04 24
        call    paint_rectangle                         ; 0CA0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0CA5 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0CA8 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0CAB _ 8B. 45, 10
        sub     eax, 24                                 ; 0CAE _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0CB1 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0CB5 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0CBD _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0CC1 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0CC9 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0CD1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CD4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CD8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CDB _ 89. 04 24
        call    paint_rectangle                         ; 0CDE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0CE3 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0CE6 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0CE9 _ 8B. 45, 10
        sub     eax, 24                                 ; 0CEC _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0CEF _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0CF3 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0CFB _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0CFF _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 0D07 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0D0F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D12 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D16 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D19 _ 89. 04 24
        call    paint_rectangle                         ; 0D1C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D21 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0D24 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0D27 _ 8B. 45, 10
        sub     eax, 4                                  ; 0D2A _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0D2D _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0D31 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0D39 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0D3D _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0D45 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0D4D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D50 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D54 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D57 _ 89. 04 24
        call    paint_rectangle                         ; 0D5A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D5F _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0D62 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0D65 _ 8B. 45, 10
        sub     eax, 23                                 ; 0D68 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0D6B _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0D6F _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0D77 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0D7B _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0D83 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0D8B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D8E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D92 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D95 _ 89. 04 24
        call    paint_rectangle                         ; 0D98 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D9D _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0DA0 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0DA3 _ 8B. 45, 10
        sub     eax, 3                                  ; 0DA6 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0DA9 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0DAD _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0DB5 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0DB9 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0DC1 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0DC9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DCC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DD0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DD3 _ 89. 04 24
        call    paint_rectangle                         ; 0DD6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0DDB _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0DDE _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0DE1 _ 8B. 45, 10
        sub     eax, 24                                 ; 0DE4 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0DE7 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 0DEB _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0DF3 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 0DF7 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0DFF _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0E07 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E0A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E0E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E11 _ 89. 04 24
        call    paint_rectangle                         ; 0E14 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E19 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0E1C _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0E1F _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0E22 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0E25 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0E28 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0E2B _ 8B. 45, 0C
        sub     eax, 47                                 ; 0E2E _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0E31 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0E35 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0E39 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0E3D _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0E41 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0E49 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E4C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E50 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E53 _ 89. 04 24
        call    paint_rectangle                         ; 0E56 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E5B _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0E5E _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0E61 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0E64 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0E67 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0E6A _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0E6D _ 8B. 45, 0C
        sub     eax, 47                                 ; 0E70 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0E73 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0E77 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0E7B _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0E7F _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0E83 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0E8B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E8E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E92 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E95 _ 89. 04 24
        call    paint_rectangle                         ; 0E98 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E9D _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0EA0 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0EA3 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0EA6 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0EA9 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0EAC _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0EAF _ 8B. 45, 0C
        sub     eax, 47                                 ; 0EB2 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0EB5 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0EB9 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0EBD _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0EC1 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0EC5 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0ECD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0ED0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0ED4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0ED7 _ 89. 04 24
        call    paint_rectangle                         ; 0EDA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0EDF _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0EE2 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0EE5 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0EE8 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0EEB _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0EEE _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0EF1 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0EF4 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 0EF7 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0EFB _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0EFF _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0F03 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0F07 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0F0F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0F12 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F16 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F19 _ 89. 04 24
        call    paint_rectangle                         ; 0F1C _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0F21 _ 83. C4, 1C
        pop     ebx                                     ; 0F24 _ 5B
        pop     ebp                                     ; 0F25 _ 5D
        ret                                             ; 0F26 _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 0F27 _ 55
        mov     ebp, esp                                ; 0F28 _ 89. E5
        sub     esp, 16                                 ; 0F2A _ 83. EC, 10
        movzx   eax, word [?_240]                       ; 0F2D _ 0F B7. 05, 00000084(d)
        cwde                                            ; 0F34 _ 98
        mov     dword [ebp-8H], eax                     ; 0F35 _ 89. 45, F8
        movzx   eax, word [?_241]                       ; 0F38 _ 0F B7. 05, 00000086(d)
        cwde                                            ; 0F3F _ 98
        mov     dword [ebp-4H], eax                     ; 0F40 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 0F43 _ 8B. 45, F8
        sub     eax, 16                                 ; 0F46 _ 83. E8, 10
        mov     edx, eax                                ; 0F49 _ 89. C2
        shr     edx, 31                                 ; 0F4B _ C1. EA, 1F
        add     eax, edx                                ; 0F4E _ 01. D0
        sar     eax, 1                                  ; 0F50 _ D1. F8
        mov     dword [mouse_x], eax                    ; 0F52 _ A3, 000001A8(d)
        mov     eax, dword [ebp-4H]                     ; 0F57 _ 8B. 45, FC
        sub     eax, 44                                 ; 0F5A _ 83. E8, 2C
        mov     edx, eax                                ; 0F5D _ 89. C2
        shr     edx, 31                                 ; 0F5F _ C1. EA, 1F
        add     eax, edx                                ; 0F62 _ 01. D0
        sar     eax, 1                                  ; 0F64 _ D1. F8
        mov     dword [mouse_y], eax                    ; 0F66 _ A3, 000001AC(d)
        leave                                           ; 0F6B _ C9
        ret                                             ; 0F6C _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0F6D _ 55
        mov     ebp, esp                                ; 0F6E _ 89. E5
        sub     esp, 20                                 ; 0F70 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 0F73 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 0F76 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0F79 _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 0F80 _ E9, 0000016E

?_023:  mov     edx, dword [ebp-4H]                     ; 0F85 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 0F88 _ 8B. 45, 18
        add     eax, edx                                ; 0F8B _ 01. D0
        movzx   eax, byte [eax]                         ; 0F8D _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0F90 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0F93 _ 0F B6. 45, FB
        test    al, al                                  ; 0F97 _ 84. C0
        jns     ?_024                                   ; 0F99 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0F9B _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0F9E _ 8B. 55, 14
        add     eax, edx                                ; 0FA1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FA3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FA7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FA9 _ 8B. 45, 10
        add     eax, edx                                ; 0FAC _ 01. D0
        mov     edx, eax                                ; 0FAE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0FB0 _ 8B. 45, 08
        add     edx, eax                                ; 0FB3 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0FB5 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0FB9 _ 88. 02
?_024:  movzx   eax, byte [ebp-5H]                      ; 0FBB _ 0F B6. 45, FB
        and     eax, 40H                                ; 0FBF _ 83. E0, 40
        test    eax, eax                                ; 0FC2 _ 85. C0
        jz      ?_025                                   ; 0FC4 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0FC6 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0FC9 _ 8B. 55, 14
        add     eax, edx                                ; 0FCC _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FCE _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FD2 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FD4 _ 8B. 45, 10
        add     eax, edx                                ; 0FD7 _ 01. D0
        lea     edx, [eax+1H]                           ; 0FD9 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0FDC _ 8B. 45, 08
        add     edx, eax                                ; 0FDF _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0FE1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0FE5 _ 88. 02
?_025:  movzx   eax, byte [ebp-5H]                      ; 0FE7 _ 0F B6. 45, FB
        and     eax, 20H                                ; 0FEB _ 83. E0, 20
        test    eax, eax                                ; 0FEE _ 85. C0
        jz      ?_026                                   ; 0FF0 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0FF2 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0FF5 _ 8B. 55, 14
        add     eax, edx                                ; 0FF8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FFA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FFE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1000 _ 8B. 45, 10
        add     eax, edx                                ; 1003 _ 01. D0
        lea     edx, [eax+2H]                           ; 1005 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1008 _ 8B. 45, 08
        add     edx, eax                                ; 100B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 100D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1011 _ 88. 02
?_026:  movzx   eax, byte [ebp-5H]                      ; 1013 _ 0F B6. 45, FB
        and     eax, 10H                                ; 1017 _ 83. E0, 10
        test    eax, eax                                ; 101A _ 85. C0
        jz      ?_027                                   ; 101C _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 101E _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1021 _ 8B. 55, 14
        add     eax, edx                                ; 1024 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1026 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 102A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 102C _ 8B. 45, 10
        add     eax, edx                                ; 102F _ 01. D0
        lea     edx, [eax+3H]                           ; 1031 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 1034 _ 8B. 45, 08
        add     edx, eax                                ; 1037 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1039 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 103D _ 88. 02
?_027:  movzx   eax, byte [ebp-5H]                      ; 103F _ 0F B6. 45, FB
        and     eax, 08H                                ; 1043 _ 83. E0, 08
        test    eax, eax                                ; 1046 _ 85. C0
        jz      ?_028                                   ; 1048 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 104A _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 104D _ 8B. 55, 14
        add     eax, edx                                ; 1050 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1052 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1056 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1058 _ 8B. 45, 10
        add     eax, edx                                ; 105B _ 01. D0
        lea     edx, [eax+4H]                           ; 105D _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1060 _ 8B. 45, 08
        add     edx, eax                                ; 1063 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1065 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1069 _ 88. 02
?_028:  movzx   eax, byte [ebp-5H]                      ; 106B _ 0F B6. 45, FB
        and     eax, 04H                                ; 106F _ 83. E0, 04
        test    eax, eax                                ; 1072 _ 85. C0
        jz      ?_029                                   ; 1074 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1076 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1079 _ 8B. 55, 14
        add     eax, edx                                ; 107C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 107E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1082 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1084 _ 8B. 45, 10
        add     eax, edx                                ; 1087 _ 01. D0
        lea     edx, [eax+5H]                           ; 1089 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 108C _ 8B. 45, 08
        add     edx, eax                                ; 108F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1091 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1095 _ 88. 02
?_029:  movzx   eax, byte [ebp-5H]                      ; 1097 _ 0F B6. 45, FB
        and     eax, 02H                                ; 109B _ 83. E0, 02
        test    eax, eax                                ; 109E _ 85. C0
        jz      ?_030                                   ; 10A0 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 10A2 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 10A5 _ 8B. 55, 14
        add     eax, edx                                ; 10A8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10AA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10AE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10B0 _ 8B. 45, 10
        add     eax, edx                                ; 10B3 _ 01. D0
        lea     edx, [eax+6H]                           ; 10B5 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 10B8 _ 8B. 45, 08
        add     edx, eax                                ; 10BB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 10BD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 10C1 _ 88. 02
?_030:  movzx   eax, byte [ebp-5H]                      ; 10C3 _ 0F B6. 45, FB
        and     eax, 01H                                ; 10C7 _ 83. E0, 01
        test    eax, eax                                ; 10CA _ 85. C0
        jz      ?_031                                   ; 10CC _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 10CE _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 10D1 _ 8B. 55, 14
        add     eax, edx                                ; 10D4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10D6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10DA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10DC _ 8B. 45, 10
        add     eax, edx                                ; 10DF _ 01. D0
        lea     edx, [eax+7H]                           ; 10E1 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 10E4 _ 8B. 45, 08
        add     edx, eax                                ; 10E7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 10E9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 10ED _ 88. 02
?_031:  add     dword [ebp-4H], 1                       ; 10EF _ 83. 45, FC, 01
?_032:  cmp     dword [ebp-4H], 15                      ; 10F3 _ 83. 7D, FC, 0F
        jle     ?_023                                   ; 10F7 _ 0F 8E, FFFFFE88
        leave                                           ; 10FD _ C9
        ret                                             ; 10FE _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 10FF _ 55
        mov     ebp, esp                                ; 1100 _ 89. E5
        push    ebx                                     ; 1102 _ 53
        sub     esp, 52                                 ; 1103 _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 1106 _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 1109 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 110C _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 110F _ 89. 45, F4
        jmp     ?_034                                   ; 1112 _ EB, 4B

?_033:  movsx   ecx, byte [ebp-1CH]                     ; 1114 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 1118 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 111B _ 0F B6. 00
        movsx   eax, al                                 ; 111E _ 0F BE. C0
        shl     eax, 4                                  ; 1121 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 1124 _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 112A _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 112D _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1130 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1133 _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 1135 _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 1139 _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 113D _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 1140 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 1144 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 1147 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 114B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 114F _ 89. 04 24
        call    paint_font                              ; 1152 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 1157 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 115B _ 83. 45, 18, 01
?_034:  mov     eax, dword [ebp+18H]                    ; 115F _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 1162 _ 0F B6. 00
        test    al, al                                  ; 1165 _ 84. C0
        jnz     ?_033                                   ; 1167 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 1169 _ 8B. 45, 14
        add     eax, 16                                 ; 116C _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 116F _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 1173 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1176 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 117A _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 117D _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 1181 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 1184 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1188 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 118B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 118F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1192 _ 89. 04 24
        call    sheet_refresh                           ; 1195 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 119A _ 83. C4, 34
        pop     ebx                                     ; 119D _ 5B
        pop     ebp                                     ; 119E _ 5D
        ret                                             ; 119F _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 11A0 _ 55
        mov     ebp, esp                                ; 11A1 _ 89. E5
        sub     esp, 20                                 ; 11A3 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 11A6 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 11A9 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 11AC _ C7. 45, F8, 00000000
        jmp     ?_041                                   ; 11B3 _ E9, 0000009C

?_035:  mov     dword [ebp-4H], 0                       ; 11B8 _ C7. 45, FC, 00000000
        jmp     ?_040                                   ; 11BF _ E9, 00000082

?_036:  mov     eax, dword [ebp-8H]                     ; 11C4 _ 8B. 45, F8
        shl     eax, 4                                  ; 11C7 _ C1. E0, 04
        mov     edx, eax                                ; 11CA _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11CC _ 8B. 45, FC
        add     eax, edx                                ; 11CF _ 01. D0
        add     eax, cursor.1815                        ; 11D1 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 11D6 _ 0F B6. 00
        cmp     al, 42                                  ; 11D9 _ 3C, 2A
        jnz     ?_037                                   ; 11DB _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 11DD _ 8B. 45, F8
        shl     eax, 4                                  ; 11E0 _ C1. E0, 04
        mov     edx, eax                                ; 11E3 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11E5 _ 8B. 45, FC
        add     eax, edx                                ; 11E8 _ 01. D0
        mov     edx, eax                                ; 11EA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 11EC _ 8B. 45, 08
        add     eax, edx                                ; 11EF _ 01. D0
        mov     byte [eax], 0                           ; 11F1 _ C6. 00, 00
        jmp     ?_039                                   ; 11F4 _ EB, 4C

?_037:  mov     eax, dword [ebp-8H]                     ; 11F6 _ 8B. 45, F8
        shl     eax, 4                                  ; 11F9 _ C1. E0, 04
        mov     edx, eax                                ; 11FC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11FE _ 8B. 45, FC
        add     eax, edx                                ; 1201 _ 01. D0
        add     eax, cursor.1815                        ; 1203 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 1208 _ 0F B6. 00
        cmp     al, 79                                  ; 120B _ 3C, 4F
        jnz     ?_038                                   ; 120D _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 120F _ 8B. 45, F8
        shl     eax, 4                                  ; 1212 _ C1. E0, 04
        mov     edx, eax                                ; 1215 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1217 _ 8B. 45, FC
        add     eax, edx                                ; 121A _ 01. D0
        mov     edx, eax                                ; 121C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 121E _ 8B. 45, 08
        add     eax, edx                                ; 1221 _ 01. D0
        mov     byte [eax], 7                           ; 1223 _ C6. 00, 07
        jmp     ?_039                                   ; 1226 _ EB, 1A

?_038:  mov     eax, dword [ebp-8H]                     ; 1228 _ 8B. 45, F8
        shl     eax, 4                                  ; 122B _ C1. E0, 04
        mov     edx, eax                                ; 122E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1230 _ 8B. 45, FC
        add     eax, edx                                ; 1233 _ 01. D0
        mov     edx, eax                                ; 1235 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1237 _ 8B. 45, 08
        add     edx, eax                                ; 123A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 123C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1240 _ 88. 02
?_039:  add     dword [ebp-4H], 1                       ; 1242 _ 83. 45, FC, 01
?_040:  cmp     dword [ebp-4H], 15                      ; 1246 _ 83. 7D, FC, 0F
        jle     ?_036                                   ; 124A _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 1250 _ 83. 45, F8, 01
?_041:  cmp     dword [ebp-8H], 15                      ; 1254 _ 83. 7D, F8, 0F
        jle     ?_035                                   ; 1258 _ 0F 8E, FFFFFF5A
        leave                                           ; 125E _ C9
        ret                                             ; 125F _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 1260 _ 55
        mov     ebp, esp                                ; 1261 _ 89. E5
        sub     esp, 16                                 ; 1263 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1266 _ C7. 45, F8, 00000000
        jmp     ?_045                                   ; 126D _ EB, 50

?_042:  mov     dword [ebp-4H], 0                       ; 126F _ C7. 45, FC, 00000000
        jmp     ?_044                                   ; 1276 _ EB, 3B

?_043:  mov     eax, dword [ebp-8H]                     ; 1278 _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 127B _ 8B. 55, 14
        add     eax, edx                                ; 127E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1280 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 1284 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 1287 _ 8B. 4D, 10
        add     edx, ecx                                ; 128A _ 01. CA
        add     eax, edx                                ; 128C _ 01. D0
        mov     edx, eax                                ; 128E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1290 _ 8B. 45, 08
        add     edx, eax                                ; 1293 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 1295 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 1298 _ 0F AF. 45, 18
        mov     ecx, eax                                ; 129C _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 129E _ 8B. 45, FC
        add     eax, ecx                                ; 12A1 _ 01. C8
        mov     ecx, eax                                ; 12A3 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 12A5 _ 8B. 45, 20
        add     eax, ecx                                ; 12A8 _ 01. C8
        movzx   eax, byte [eax]                         ; 12AA _ 0F B6. 00
        mov     byte [edx], al                          ; 12AD _ 88. 02
        add     dword [ebp-4H], 1                       ; 12AF _ 83. 45, FC, 01
?_044:  mov     eax, dword [ebp-4H]                     ; 12B3 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 12B6 _ 3B. 45, 18
        jl      ?_043                                   ; 12B9 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 12BB _ 83. 45, F8, 01
?_045:  mov     eax, dword [ebp-8H]                     ; 12BF _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 12C2 _ 3B. 45, 1C
        jl      ?_042                                   ; 12C5 _ 7C, A8
        leave                                           ; 12C7 _ C9
        ret                                             ; 12C8 _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 12C9 _ 55
        mov     ebp, esp                                ; 12CA _ 89. E5
        sub     esp, 24                                 ; 12CC _ 83. EC, 18
        mov     dword [esp+0CH], 0                      ; 12CF _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 12D7 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 12DF _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 12E7 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 12EE _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 12F3 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], keybuf                  ; 12FB _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 1303 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 130B _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 1312 _ E8, FFFFFFFC(rel)
        leave                                           ; 1317 _ C9
        ret                                             ; 1318 _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 1319 _ 55
        mov     ebp, esp                                ; 131A _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 131C _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 131F _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 1322 _ A1, 000001A8(d)
        add     eax, edx                                ; 1327 _ 01. D0
        mov     dword [mouse_x], eax                    ; 1329 _ A3, 000001A8(d)
        mov     eax, dword [ebp+10H]                    ; 132E _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 1331 _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 1334 _ A1, 000001AC(d)
        add     eax, edx                                ; 1339 _ 01. D0
        mov     dword [mouse_y], eax                    ; 133B _ A3, 000001AC(d)
        mov     eax, dword [mouse_x]                    ; 1340 _ A1, 000001A8(d)
        test    eax, eax                                ; 1345 _ 85. C0
        jns     ?_046                                   ; 1347 _ 79, 0A
        mov     dword [mouse_x], 0                      ; 1349 _ C7. 05, 000001A8(d), 00000000
?_046:  mov     eax, dword [mouse_y]                    ; 1353 _ A1, 000001AC(d)
        test    eax, eax                                ; 1358 _ 85. C0
        jns     ?_047                                   ; 135A _ 79, 0A
        mov     dword [mouse_y], 0                      ; 135C _ C7. 05, 000001AC(d), 00000000
?_047:  movzx   eax, word [?_240]                       ; 1366 _ 0F B7. 05, 00000084(d)
        cwde                                            ; 136D _ 98
        lea     edx, [eax-10H]                          ; 136E _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 1371 _ A1, 000001A8(d)
        cmp     edx, eax                                ; 1376 _ 39. C2
        jge     ?_048                                   ; 1378 _ 7D, 10
        movzx   eax, word [?_240]                       ; 137A _ 0F B7. 05, 00000084(d)
        cwde                                            ; 1381 _ 98
        sub     eax, 16                                 ; 1382 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 1385 _ A3, 000001A8(d)
?_048:  movzx   eax, word [?_240]                       ; 138A _ 0F B7. 05, 00000084(d)
        cwde                                            ; 1391 _ 98
        lea     edx, [eax-10H]                          ; 1392 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 1395 _ A1, 000001AC(d)
        cmp     edx, eax                                ; 139A _ 39. C2
        jge     ?_049                                   ; 139C _ 7D, 10
        movzx   eax, word [?_240]                       ; 139E _ 0F B7. 05, 00000084(d)
        cwde                                            ; 13A5 _ 98
        sub     eax, 16                                 ; 13A6 _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 13A9 _ A3, 000001AC(d)
?_049:  pop     ebp                                     ; 13AE _ 5D
        ret                                             ; 13AF _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 13B0 _ 55
        mov     ebp, esp                                ; 13B1 _ 89. E5
        sub     esp, 40                                 ; 13B3 _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 13B6 _ C6. 45, F7, 00
        call    io_sti                                  ; 13BA _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 13BF _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 13C6 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 13CB _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 13CE _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 13D2 _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 13D6 _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 13DD _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 13E2 _ 85. C0
        jz      ?_050                                   ; 13E4 _ 74, 77
        mov     dword [esp+8H], mouse_send_info         ; 13E6 _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 13EE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 13F1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13F5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13F8 _ 89. 04 24
        call    compute_mouse_position                  ; 13FB _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 1400 _ 8B. 15, 000001AC(d)
        mov     eax, dword [mouse_x]                    ; 1406 _ A1, 000001A8(d)
        mov     dword [esp+0CH], edx                    ; 140B _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 140F _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 1413 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 1416 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 141A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 141D _ 89. 04 24
        call    sheet_slide                             ; 1420 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_send_info+0CH]        ; 1425 _ A1, 0000000C(d)
        and     eax, 01H                                ; 142A _ 83. E0, 01
        test    eax, eax                                ; 142D _ 85. C0
        jz      ?_050                                   ; 142F _ 74, 2C
        mov     eax, dword [mouse_y]                    ; 1431 _ A1, 000001AC(d)
        lea     ecx, [eax-8H]                           ; 1436 _ 8D. 48, F8
        mov     eax, dword [mouse_x]                    ; 1439 _ A1, 000001A8(d)
        lea     edx, [eax-50H]                          ; 143E _ 8D. 50, B0
        mov     eax, dword [sheet_win]                  ; 1441 _ A1, 000001A4(d)
        mov     dword [esp+0CH], ecx                    ; 1446 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 144A _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 144E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1452 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1455 _ 89. 04 24
        call    sheet_slide                             ; 1458 _ E8, FFFFFFFC(rel)
?_050:  leave                                           ; 145D _ C9
        ret                                             ; 145E _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 145F _ 55
        mov     ebp, esp                                ; 1460 _ 89. E5
        sub     esp, 88                                 ; 1462 _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 1465 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 146C _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 1473 _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 147A _ A1, 00000080(d)
        mov     dword [ebp-2CH], eax                    ; 147F _ 89. 45, D4
        movzx   eax, word [?_240]                       ; 1482 _ 0F B7. 05, 00000084(d)
        cwde                                            ; 1489 _ 98
        mov     dword [ebp-28H], eax                    ; 148A _ 89. 45, D8
        movzx   eax, word [?_241]                       ; 148D _ 0F B7. 05, 00000086(d)
        cwde                                            ; 1494 _ 98
        mov     dword [ebp-24H], eax                    ; 1495 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 1498 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 149B _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 149D _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 14A0 _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 14A4 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 14A7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 14AB _ 89. 04 24
        call    init_desktop                            ; 14AE _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 14B3 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_230                  ; 14BB _ C7. 44 24, 10, 0000001E(d)
        mov     eax, dword [ebp-34H]                    ; 14C3 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 14C6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 14CA _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 14CD _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14D1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14D4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14D8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14DB _ 89. 04 24
        call    paint_string                            ; 14DE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 14E3 _ 8B. 45, 14
        mov     dword [esp], eax                        ; 14E6 _ 89. 04 24
        call    intToHexStr                             ; 14E9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 14EE _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 14F1 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 14F9 _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 14FC _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1500 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1503 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1507 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 150A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 150E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1511 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1515 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1518 _ 89. 04 24
        call    paint_string                            ; 151B _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1520 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1524 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_231                  ; 152C _ C7. 44 24, 10, 00000028(d)
        mov     eax, dword [ebp-34H]                    ; 1534 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1537 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 153B _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 153E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1542 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1545 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1549 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 154C _ 89. 04 24
        call    paint_string                            ; 154F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1554 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1557 _ 8B. 00
        mov     dword [esp], eax                        ; 1559 _ 89. 04 24
        call    intToHexStr                             ; 155C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 1561 _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 1564 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 156C _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 156F _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1573 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1576 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 157A _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 157D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1581 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1584 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1588 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 158B _ 89. 04 24
        call    paint_string                            ; 158E _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1593 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1597 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_232                  ; 159F _ C7. 44 24, 10, 00000034(d)
        mov     eax, dword [ebp-34H]                    ; 15A7 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 15AA _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 15AE _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 15B1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15B5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 15B8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 15BC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 15BF _ 89. 04 24
        call    paint_string                            ; 15C2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 15C7 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 15CA _ 8B. 40, 04
        mov     dword [esp], eax                        ; 15CD _ 89. 04 24
        call    intToHexStr                             ; 15D0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 15D5 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 15D8 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 15E0 _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 15E3 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 15E7 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 15EA _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 15EE _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 15F1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15F5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 15F8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 15FC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 15FF _ 89. 04 24
        call    paint_string                            ; 1602 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1607 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 160B _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_233                  ; 1613 _ C7. 44 24, 10, 00000040(d)
        mov     eax, dword [ebp-34H]                    ; 161B _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 161E _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1622 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1625 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1629 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 162C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1630 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1633 _ 89. 04 24
        call    paint_string                            ; 1636 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 163B _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 163E _ 8B. 40, 08
        mov     dword [esp], eax                        ; 1641 _ 89. 04 24
        call    intToHexStr                             ; 1644 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1649 _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 164C _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 1654 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 1657 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 165B _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 165E _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1662 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1665 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1669 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 166C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1670 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1673 _ 89. 04 24
        call    paint_string                            ; 1676 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 167B _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 167F _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_234                  ; 1687 _ C7. 44 24, 10, 0000004C(d)
        mov     eax, dword [ebp-34H]                    ; 168F _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1692 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1696 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1699 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 169D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 16A0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16A4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16A7 _ 89. 04 24
        call    paint_string                            ; 16AA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 16AF _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 16B2 _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 16B5 _ 89. 04 24
        call    intToHexStr                             ; 16B8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 16BD _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 16C0 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 16C8 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 16CB _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 16CF _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 16D2 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 16D6 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 16D9 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 16DD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 16E0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16E4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16E7 _ 89. 04 24
        call    paint_string                            ; 16EA _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 16EF _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 16F3 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_235                  ; 16FB _ C7. 44 24, 10, 00000059(d)
        mov     eax, dword [ebp-34H]                    ; 1703 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1706 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 170A _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 170D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1711 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1714 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1718 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 171B _ 89. 04 24
        call    paint_string                            ; 171E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1723 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 1726 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 1729 _ 89. 04 24
        call    intToHexStr                             ; 172C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1731 _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 1734 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 173C _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 173F _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1743 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1746 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 174A _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 174D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1751 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1754 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1758 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 175B _ 89. 04 24
        call    paint_string                            ; 175E _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1763 _ 83. 45, CC, 10
        leave                                           ; 1767 _ C9
        ret                                             ; 1768 _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 1769 _ 55
        mov     ebp, esp                                ; 176A _ 89. E5
        sub     esp, 56                                 ; 176C _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 176F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1772 _ 89. 04 24
        call    sheet_alloc                             ; 1775 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 177A _ 89. 45, F0
        mov     eax, dword [memman]                     ; 177D _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 1782 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 178A _ 89. 04 24
        call    memman_alloc_4k                         ; 178D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1792 _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 1795 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 179D _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 17A5 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 17AD _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 17B0 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 17B4 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 17B7 _ 89. 04 24
        call    sheet_setbuf                            ; 17BA _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 17BF _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 17C7 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 17CA _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 17CE _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 17D1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 17D5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17D8 _ 89. 04 24
        call    make_windows                            ; 17DB _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 17E0 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 17E8 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 17F0 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 17F8 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 1800 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-10H]                    ; 1808 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 180B _ 89. 04 24
        call    make_textbox                            ; 180E _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 1813 _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 181B _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-10H]                    ; 1823 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1826 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 182A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 182D _ 89. 04 24
        call    sheet_slide                             ; 1830 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 1835 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 183D _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1840 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1844 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1847 _ 89. 04 24
        call    sheet_updown                            ; 184A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 184F _ 8B. 45, F0
        leave                                           ; 1852 _ C9
        ret                                             ; 1853 _ C3
; message_box End of function

make_textbox:; Function begin
        push    ebp                                     ; 1854 _ 55
        mov     ebp, esp                                ; 1855 _ 89. E5
        push    edi                                     ; 1857 _ 57
        push    esi                                     ; 1858 _ 56
        push    ebx                                     ; 1859 _ 53
        sub     esp, 44                                 ; 185A _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 185D _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 1860 _ 8B. 55, 0C
        add     eax, edx                                ; 1863 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1865 _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 1868 _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 186B _ 8B. 55, 10
        add     eax, edx                                ; 186E _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1870 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1873 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 1876 _ 8D. 78, FD
        mov     eax, dword [ebp-14H]                    ; 1879 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 187C _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 187F _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1882 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1885 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1888 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 188B _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 188E _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1891 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1894 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1896 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 189A _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 189E _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 18A2 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 18A6 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 18AE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18B2 _ 89. 04 24
        call    paint_rectangle                         ; 18B5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 18BA _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 18BD _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 18C0 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 18C3 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 18C6 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 18C9 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 18CC _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 18CF _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 18D2 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 18D5 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18D8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18DB _ 8B. 00
        mov     dword [esp+18H], edi                    ; 18DD _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 18E1 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 18E5 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 18E9 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 18ED _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 18F5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18F9 _ 89. 04 24
        call    paint_rectangle                         ; 18FC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1901 _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 1904 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 1907 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 190A _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 190D _ 8B. 45, F0
        lea     ebx, [eax+2H]                           ; 1910 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 1913 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1916 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1919 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 191C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 191F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1922 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1924 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1928 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 192C _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1930 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 1934 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 193C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1940 _ 89. 04 24
        call    paint_rectangle                         ; 1943 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1948 _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 194B _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 194E _ 8B. 45, EC
        lea     esi, [eax+2H]                           ; 1951 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1954 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1957 _ 8D. 58, FD
        mov     eax, dword [ebp-14H]                    ; 195A _ 8B. 45, EC
        lea     ecx, [eax+2H]                           ; 195D _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1960 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1963 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1966 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1969 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 196B _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 196F _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1973 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1977 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 197B _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 1983 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1987 _ 89. 04 24
        call    paint_rectangle                         ; 198A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 198F _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 1992 _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 1995 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1998 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 199B _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 199E _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 19A1 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 19A4 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19A7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19AA _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 19AC _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 19B0 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 19B3 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 19B7 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 19BB _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 19BF _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 19C7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19CB _ 89. 04 24
        call    paint_rectangle                         ; 19CE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 19D3 _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 19D6 _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 19D9 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 19DC _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 19DF _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 19E2 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 19E5 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 19E8 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19EB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19EE _ 8B. 00
        mov     ecx, dword [ebp-10H]                    ; 19F0 _ 8B. 4D, F0
        mov     dword [esp+18H], ecx                    ; 19F3 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 19F7 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 19FB _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 19FF _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 1A03 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1A0B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A0F _ 89. 04 24
        call    paint_rectangle                         ; 1A12 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1A17 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1A1A _ 8D. 48, 01
        mov     eax, dword [ebp-10H]                    ; 1A1D _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1A20 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1A23 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 1A26 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 1A29 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A2C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A2F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A32 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1A34 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 1A38 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 1A3B _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1A3F _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1A43 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 1A47 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1A4F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A53 _ 89. 04 24
        call    paint_rectangle                         ; 1A56 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1A5B _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1A5E _ 8D. 78, 01
        mov     eax, dword [ebp-14H]                    ; 1A61 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1A64 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1A67 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1A6A _ 8D. 58, FE
        mov     eax, dword [ebp-14H]                    ; 1A6D _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 1A70 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1A73 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A76 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A79 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A7C _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1A7E _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1A82 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1A86 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1A8A _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 1A8E _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1A96 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A9A _ 89. 04 24
        call    paint_rectangle                         ; 1A9D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1AA2 _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 1AA5 _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 1AA8 _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 1AAB _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 1AAE _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1AB1 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1AB4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1AB7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1ABA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1ABD _ 8B. 00
        mov     ebx, dword [ebp-10H]                    ; 1ABF _ 8B. 5D, F0
        mov     dword [esp+18H], ebx                    ; 1AC2 _ 89. 5C 24, 18
        mov     ebx, dword [ebp-14H]                    ; 1AC6 _ 8B. 5D, EC
        mov     dword [esp+14H], ebx                    ; 1AC9 _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 1ACD _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 1AD1 _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 1AD5 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1AD9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1ADD _ 89. 04 24
        call    paint_rectangle                         ; 1AE0 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 1AE5 _ 83. C4, 2C
        pop     ebx                                     ; 1AE8 _ 5B
        pop     esi                                     ; 1AE9 _ 5E
        pop     edi                                     ; 1AEA _ 5F
        pop     ebp                                     ; 1AEB _ 5D
        ret                                             ; 1AEC _ C3
; make_textbox End of function

make_windows:; Function begin
        push    ebp                                     ; 1AED _ 55
        mov     ebp, esp                                ; 1AEE _ 89. E5
        push    ebx                                     ; 1AF0 _ 53
        sub     esp, 52                                 ; 1AF1 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 1AF4 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1AF7 _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 1AFA _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1AFD _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 1B00 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1B03 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1B06 _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 1B09 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 1B0C _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1B0F _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1B12 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B15 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 1B17 _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 1B1F _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 1B23 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1B2B _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1B33 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1B3B _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B3E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B42 _ 89. 04 24
        call    paint_rectangle                         ; 1B45 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1B4A _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1B4D _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1B50 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B53 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 1B55 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 1B5D _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 1B61 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1B69 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1B71 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1B79 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B7C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B80 _ 89. 04 24
        call    paint_rectangle                         ; 1B83 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1B88 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1B8B _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1B8E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B91 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1B93 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 1B97 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 1B9F _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1BA7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1BAF _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1BB7 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1BBA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BBE _ 89. 04 24
        call    paint_rectangle                         ; 1BC1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1BC6 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1BC9 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1BCC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BCF _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1BD1 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 1BD5 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 1BDD _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1BE5 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1BED _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1BF5 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1BF8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BFC _ 89. 04 24
        call    paint_rectangle                         ; 1BFF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1C04 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1C07 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1C0A _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1C0D _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1C10 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1C13 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1C16 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C19 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1C1B _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1C1F _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 1C23 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 1C2B _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 1C2F _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1C37 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C3A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C3E _ 89. 04 24
        call    paint_rectangle                         ; 1C41 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1C46 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1C49 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1C4C _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1C4F _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1C52 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1C55 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1C58 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C5B _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1C5D _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1C61 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 1C65 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 1C6D _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 1C71 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1C79 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C7C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C80 _ 89. 04 24
        call    paint_rectangle                         ; 1C83 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1C88 _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1C8B _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1C8E _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1C91 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1C94 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C97 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1C99 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1C9D _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 1CA1 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 1CA9 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 1CB1 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1CB9 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1CBC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CC0 _ 89. 04 24
        call    paint_rectangle                         ; 1CC3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1CC8 _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1CCB _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1CCE _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CD1 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1CD3 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1CDB _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 1CDF _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1CE7 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 1CEF _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 1CF7 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1CFA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CFE _ 89. 04 24
        call    paint_rectangle                         ; 1D01 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1D06 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1D09 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1D0C _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1D0F _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1D12 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1D15 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1D18 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D1B _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1D1D _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1D21 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1D25 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 1D29 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 1D31 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1D39 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D3C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D40 _ 89. 04 24
        call    paint_rectangle                         ; 1D43 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1D48 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1D4B _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1D4E _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1D51 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1D54 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1D57 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1D5A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D5D _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1D5F _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1D63 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1D67 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 1D6B _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 1D73 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1D7B _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D7E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D82 _ 89. 04 24
        call    paint_rectangle                         ; 1D85 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-1CH]                     ; 1D8A _ 0F BE. 45, E4
        mov     dword [esp+0CH], eax                    ; 1D8E _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 1D92 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 1D95 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1D99 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1D9C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1DA0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1DA3 _ 89. 04 24
        call    make_window_title                       ; 1DA6 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 1DAB _ 83. C4, 34
        pop     ebx                                     ; 1DAE _ 5B
        pop     ebp                                     ; 1DAF _ 5D
        ret                                             ; 1DB0 _ C3
; make_windows End of function

make_window_title:; Function begin
        push    ebp                                     ; 1DB1 _ 55
        mov     ebp, esp                                ; 1DB2 _ 89. E5
        push    ebx                                     ; 1DB4 _ 53
        sub     esp, 52                                 ; 1DB5 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 1DB8 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1DBB _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 1DBE _ 80. 7D, E4, 00
        jz      ?_051                                   ; 1DC2 _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 1DC4 _ C6. 45, EE, 07
        mov     byte [ebp-11H], 12                      ; 1DC8 _ C6. 45, EF, 0C
        jmp     ?_052                                   ; 1DCC _ EB, 08

?_051:  mov     byte [ebp-12H], 8                       ; 1DCE _ C6. 45, EE, 08
        mov     byte [ebp-11H], 15                      ; 1DD2 _ C6. 45, EF, 0F
?_052:  mov     eax, dword [ebp+0CH]                    ; 1DD6 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1DD9 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 1DDC _ 8D. 58, FC
        movzx   eax, byte [ebp-11H]                     ; 1DDF _ 0F B6. 45, EF
        movzx   ecx, al                                 ; 1DE3 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 1DE6 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 1DE9 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1DEC _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1DEF _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1DF1 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], ebx                    ; 1DF9 _ 89. 5C 24, 14
        mov     dword [esp+10H], 3                      ; 1DFD _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1E05 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], ecx                     ; 1E0D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1E11 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E15 _ 89. 04 24
        call    paint_rectangle                         ; 1E18 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-12H]                     ; 1E1D _ 0F BE. 45, EE
        mov     dword [esp+14H], eax                    ; 1E21 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 1E25 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1E28 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 1E2C _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 1E34 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 1E3C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1E3F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1E43 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1E46 _ 89. 04 24
        call    paint_string                            ; 1E49 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 1E4E _ C7. 45, F4, 00000000
        jmp     ?_060                                   ; 1E55 _ E9, 00000083

?_053:  mov     dword [ebp-10H], 0                      ; 1E5A _ C7. 45, F0, 00000000
        jmp     ?_059                                   ; 1E61 _ EB, 70

?_054:  mov     eax, dword [ebp-0CH]                    ; 1E63 _ 8B. 45, F4
        shl     eax, 4                                  ; 1E66 _ C1. E0, 04
        mov     edx, eax                                ; 1E69 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 1E6B _ 8B. 45, F0
        add     eax, edx                                ; 1E6E _ 01. D0
        add     eax, closebtn.1902                      ; 1E70 _ 05, 00000260(d)
        movzx   eax, byte [eax]                         ; 1E75 _ 0F B6. 00
        mov     byte [ebp-13H], al                      ; 1E78 _ 88. 45, ED
        cmp     byte [ebp-13H], 64                      ; 1E7B _ 80. 7D, ED, 40
        jnz     ?_055                                   ; 1E7F _ 75, 06
        mov     byte [ebp-13H], 0                       ; 1E81 _ C6. 45, ED, 00
        jmp     ?_058                                   ; 1E85 _ EB, 1C

?_055:  cmp     byte [ebp-13H], 36                      ; 1E87 _ 80. 7D, ED, 24
        jnz     ?_056                                   ; 1E8B _ 75, 06
        mov     byte [ebp-13H], 15                      ; 1E8D _ C6. 45, ED, 0F
        jmp     ?_058                                   ; 1E91 _ EB, 10

?_056:  cmp     byte [ebp-13H], 81                      ; 1E93 _ 80. 7D, ED, 51
        jnz     ?_057                                   ; 1E97 _ 75, 06
        mov     byte [ebp-13H], 8                       ; 1E99 _ C6. 45, ED, 08
        jmp     ?_058                                   ; 1E9D _ EB, 04

?_057:  mov     byte [ebp-13H], 7                       ; 1E9F _ C6. 45, ED, 07
?_058:  mov     eax, dword [ebp+0CH]                    ; 1EA3 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1EA6 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 1EA8 _ 8B. 45, F4
        lea     ecx, [eax+5H]                           ; 1EAB _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1EAE _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1EB1 _ 8B. 40, 04
        imul    ecx, eax                                ; 1EB4 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1EB7 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1EBA _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1EBD _ 8D. 58, EB
        mov     eax, dword [ebp-10H]                    ; 1EC0 _ 8B. 45, F0
        add     eax, ebx                                ; 1EC3 _ 01. D8
        add     eax, ecx                                ; 1EC5 _ 01. C8
        add     edx, eax                                ; 1EC7 _ 01. C2
        movzx   eax, byte [ebp-13H]                     ; 1EC9 _ 0F B6. 45, ED
        mov     byte [edx], al                          ; 1ECD _ 88. 02
        add     dword [ebp-10H], 1                      ; 1ECF _ 83. 45, F0, 01
?_059:  cmp     dword [ebp-10H], 15                     ; 1ED3 _ 83. 7D, F0, 0F
        jle     ?_054                                   ; 1ED7 _ 7E, 8A
        add     dword [ebp-0CH], 1                      ; 1ED9 _ 83. 45, F4, 01
?_060:  cmp     dword [ebp-0CH], 13                     ; 1EDD _ 83. 7D, F4, 0D
        jle     ?_053                                   ; 1EE1 _ 0F 8E, FFFFFF73
        add     esp, 52                                 ; 1EE7 _ 83. C4, 34
        pop     ebx                                     ; 1EEA _ 5B
        pop     ebp                                     ; 1EEB _ 5D
        ret                                             ; 1EEC _ C3
; make_window_title End of function

transfer_scancode:; Function begin
        push    ebp                                     ; 1EED _ 55
        mov     ebp, esp                                ; 1EEE _ 89. E5
        sub     esp, 16                                 ; 1EF0 _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 1EF3 _ 83. 7D, 08, 2A
        jnz     ?_061                                   ; 1EF7 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1EF9 _ A1, 000001B0(d)
        or      eax, 01H                                ; 1EFE _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 1F01 _ A3, 000001B0(d)
?_061:  cmp     dword [ebp+8H], 54                      ; 1F06 _ 83. 7D, 08, 36
        jnz     ?_062                                   ; 1F0A _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1F0C _ A1, 000001B0(d)
        or      eax, 02H                                ; 1F11 _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 1F14 _ A3, 000001B0(d)
?_062:  cmp     dword [ebp+8H], 170                     ; 1F19 _ 81. 7D, 08, 000000AA
        jnz     ?_063                                   ; 1F20 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1F22 _ A1, 000001B0(d)
        and     eax, 0FFFFFFFEH                         ; 1F27 _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 1F2A _ A3, 000001B0(d)
?_063:  cmp     dword [ebp+8H], 182                     ; 1F2F _ 81. 7D, 08, 000000B6
        jnz     ?_064                                   ; 1F36 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1F38 _ A1, 000001B0(d)
        and     eax, 0FFFFFFFDH                         ; 1F3D _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 1F40 _ A3, 000001B0(d)
?_064:  cmp     dword [ebp+8H], 58                      ; 1F45 _ 83. 7D, 08, 3A
        jnz     ?_066                                   ; 1F49 _ 75, 1F
        mov     eax, dword [caps_lock]                  ; 1F4B _ A1, 000001B4(d)
        test    eax, eax                                ; 1F50 _ 85. C0
        jnz     ?_065                                   ; 1F52 _ 75, 0C
        mov     dword [caps_lock], 1                    ; 1F54 _ C7. 05, 000001B4(d), 00000001
        jmp     ?_066                                   ; 1F5E _ EB, 0A

?_065:  mov     dword [caps_lock], 0                    ; 1F60 _ C7. 05, 000001B4(d), 00000000
?_066:  cmp     dword [ebp+8H], 42                      ; 1F6A _ 83. 7D, 08, 2A
        jz      ?_067                                   ; 1F6E _ 74, 24
        cmp     dword [ebp+8H], 54                      ; 1F70 _ 83. 7D, 08, 36
        jz      ?_067                                   ; 1F74 _ 74, 1E
        cmp     dword [ebp+8H], 170                     ; 1F76 _ 81. 7D, 08, 000000AA
        jz      ?_067                                   ; 1F7D _ 74, 15
        cmp     dword [ebp+8H], 182                     ; 1F7F _ 81. 7D, 08, 000000B6
        jz      ?_067                                   ; 1F86 _ 74, 0C
        cmp     dword [ebp+8H], 127                     ; 1F88 _ 83. 7D, 08, 7F
        jg      ?_067                                   ; 1F8C _ 7F, 06
        cmp     dword [ebp+8H], 58                      ; 1F8E _ 83. 7D, 08, 3A
        jnz     ?_068                                   ; 1F92 _ 75, 0A
?_067:  mov     eax, 0                                  ; 1F94 _ B8, 00000000
        jmp     ?_073                                   ; 1F99 _ E9, 00000089

?_068:  mov     byte [ebp-1H], 0                        ; 1F9E _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 1FA2 _ A1, 000001B0(d)
        test    eax, eax                                ; 1FA7 _ 85. C0
        jnz     ?_070                                   ; 1FA9 _ 75, 46
        cmp     dword [ebp+8H], 127                     ; 1FAB _ 83. 7D, 08, 7F
        jg      ?_070                                   ; 1FAF _ 7F, 40
        mov     eax, dword [ebp+8H]                     ; 1FB1 _ 8B. 45, 08
        add     eax, keytable                           ; 1FB4 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 1FB9 _ 0F B6. 00
        test    al, al                                  ; 1FBC _ 84. C0
        jz      ?_070                                   ; 1FBE _ 74, 31
        mov     eax, dword [ebp+8H]                     ; 1FC0 _ 8B. 45, 08
        add     eax, keytable                           ; 1FC3 _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 1FC8 _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 1FCB _ 88. 45, FF
        cmp     byte [ebp-1H], 64                       ; 1FCE _ 80. 7D, FF, 40
        jle     ?_069                                   ; 1FD2 _ 7E, 1B
        cmp     byte [ebp-1H], 90                       ; 1FD4 _ 80. 7D, FF, 5A
        jg      ?_069                                   ; 1FD8 _ 7F, 15
        mov     eax, dword [caps_lock]                  ; 1FDA _ A1, 000001B4(d)
        test    eax, eax                                ; 1FDF _ 85. C0
        jnz     ?_069                                   ; 1FE1 _ 75, 0C
        movzx   eax, byte [ebp-1H]                      ; 1FE3 _ 0F B6. 45, FF
        add     eax, 32                                 ; 1FE7 _ 83. C0, 20
        mov     byte [ebp-1H], al                       ; 1FEA _ 88. 45, FF
        jmp     ?_072                                   ; 1FED _ EB, 34

?_069:  jmp     ?_072                                   ; 1FEF _ EB, 32

?_070:  mov     eax, dword [key_shift]                  ; 1FF1 _ A1, 000001B0(d)
        test    eax, eax                                ; 1FF6 _ 85. C0
        jz      ?_071                                   ; 1FF8 _ 74, 25
        cmp     dword [ebp+8H], 127                     ; 1FFA _ 83. 7D, 08, 7F
        jg      ?_071                                   ; 1FFE _ 7F, 1F
        mov     eax, dword [ebp+8H]                     ; 2000 _ 8B. 45, 08
        add     eax, keytable_shift                     ; 2003 _ 05, 000000A0(d)
        movzx   eax, byte [eax]                         ; 2008 _ 0F B6. 00
        test    al, al                                  ; 200B _ 84. C0
        jz      ?_071                                   ; 200D _ 74, 10
        mov     eax, dword [ebp+8H]                     ; 200F _ 8B. 45, 08
        add     eax, keytable_shift                     ; 2012 _ 05, 000000A0(d)
        movzx   eax, byte [eax]                         ; 2017 _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 201A _ 88. 45, FF
        jmp     ?_072                                   ; 201D _ EB, 04

?_071:  mov     byte [ebp-1H], 0                        ; 201F _ C6. 45, FF, 00
?_072:  movzx   eax, byte [ebp-1H]                      ; 2023 _ 0F B6. 45, FF
?_073:  leave                                           ; 2027 _ C9
        ret                                             ; 2028 _ C3
; transfer_scancode End of function

is_special_key:; Function begin
        push    ebp                                     ; 2029 _ 55
        mov     ebp, esp                                ; 202A _ 89. E5
        sub     esp, 4                                  ; 202C _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 202F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2032 _ 89. 04 24
        call    transfer_scancode                       ; 2035 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp+8H], 42                      ; 203A _ 83. 7D, 08, 2A
        jz      ?_074                                   ; 203E _ 74, 27
        cmp     dword [ebp+8H], 54                      ; 2040 _ 83. 7D, 08, 36
        jz      ?_074                                   ; 2044 _ 74, 21
        cmp     dword [ebp+8H], 170                     ; 2046 _ 81. 7D, 08, 000000AA
        jz      ?_074                                   ; 204D _ 74, 18
        cmp     dword [ebp+8H], 182                     ; 204F _ 81. 7D, 08, 000000B6
        jz      ?_074                                   ; 2056 _ 74, 0F
        cmp     dword [ebp+8H], 58                      ; 2058 _ 83. 7D, 08, 3A
        jz      ?_074                                   ; 205C _ 74, 09
        cmp     dword [ebp+8H], 186                     ; 205E _ 81. 7D, 08, 000000BA
        jnz     ?_075                                   ; 2065 _ 75, 07
?_074:  mov     eax, 1                                  ; 2067 _ B8, 00000001
        jmp     ?_076                                   ; 206C _ EB, 05

?_075:  mov     eax, 0                                  ; 206E _ B8, 00000000
?_076:  leave                                           ; 2073 _ C9
        ret                                             ; 2074 _ C3
; is_special_key End of function

console_task:; Function begin
        push    ebp                                     ; 2075 _ 55
        mov     ebp, esp                                ; 2076 _ 89. E5
        push    ebx                                     ; 2078 _ 53
        sub     esp, 196                                ; 2079 _ 81. EC, 000000C4
        mov     eax, dword [ebp+8H]                     ; 207F _ 8B. 45, 08
        mov     dword [ebp-0ACH], eax                   ; 2082 _ 89. 85, FFFFFF54
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 2088 _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 208E _ 89. 45, F4
        xor     eax, eax                                ; 2091 _ 31. C0
        call    task_now                                ; 2093 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-98H], eax                    ; 2098 _ 89. 85, FFFFFF68
        mov     dword [ebp-0A0H], 16                    ; 209E _ C7. 85, FFFFFF60, 00000010
        mov     dword [ebp-9CH], 0                      ; 20A8 _ C7. 85, FFFFFF64, 00000000
        mov     eax, dword [ebp-98H]                    ; 20B2 _ 8B. 85, FFFFFF68
        lea     edx, [eax+10H]                          ; 20B8 _ 8D. 50, 10
        mov     eax, dword [ebp-98H]                    ; 20BB _ 8B. 85, FFFFFF68
        mov     dword [esp+0CH], eax                    ; 20C1 _ 89. 44 24, 0C
        lea     eax, [ebp-8CH]                          ; 20C5 _ 8D. 85, FFFFFF74
        mov     dword [esp+8H], eax                     ; 20CB _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 20CF _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 20D7 _ 89. 14 24
        call    fifo8_init                              ; 20DA _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 20DF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-94H], eax                    ; 20E4 _ 89. 85, FFFFFF6C
        mov     eax, dword [ebp-98H]                    ; 20EA _ 8B. 85, FFFFFF68
        add     eax, 16                                 ; 20F0 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 20F3 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 20FB _ 89. 44 24, 04
        mov     eax, dword [ebp-94H]                    ; 20FF _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 2105 _ 89. 04 24
        call    timer_init                              ; 2108 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 210D _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-94H]                    ; 2115 _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 211B _ 89. 04 24
        call    timer_settime                           ; 211E _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2123 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2128 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_236                  ; 2130 _ C7. 44 24, 10, 00000060(d)
        mov     dword [esp+0CH], 28                     ; 2138 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 2140 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0ACH]                   ; 2148 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 214E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2152 _ 89. 04 24
        call    paint_string                            ; 2155 _ E8, FFFFFFFC(rel)
?_077:  call    io_cli                                  ; 215A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-98H]                    ; 215F _ 8B. 85, FFFFFF68
        add     eax, 16                                 ; 2165 _ 83. C0, 10
        mov     dword [esp], eax                        ; 2168 _ 89. 04 24
        call    fifo8_status                            ; 216B _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 2170 _ 85. C0
        jnz     ?_078                                   ; 2172 _ 75, 07
        call    io_sti                                  ; 2174 _ E8, FFFFFFFC(rel)
        jmp     ?_077                                   ; 2179 _ EB, DF

?_078:  mov     eax, dword [ebp-98H]                    ; 217B _ 8B. 85, FFFFFF68
        add     eax, 16                                 ; 2181 _ 83. C0, 10
        mov     dword [esp], eax                        ; 2184 _ 89. 04 24
        call    fifo8_get                               ; 2187 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-90H], eax                    ; 218C _ 89. 85, FFFFFF70
        call    io_sti                                  ; 2192 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-90H], 1                      ; 2197 _ 83. BD, FFFFFF70, 01
        jg      ?_081                                   ; 219E _ 0F 8F, 00000080
        cmp     dword [ebp-90H], 0                      ; 21A4 _ 83. BD, FFFFFF70, 00
        jz      ?_079                                   ; 21AB _ 74, 2F
        mov     eax, dword [ebp-98H]                    ; 21AD _ 8B. 85, FFFFFF68
        add     eax, 16                                 ; 21B3 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 21B6 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 21BE _ 89. 44 24, 04
        mov     eax, dword [ebp-94H]                    ; 21C2 _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 21C8 _ 89. 04 24
        call    timer_init                              ; 21CB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-9CH], 7                      ; 21D0 _ C7. 85, FFFFFF64, 00000007
        jmp     ?_080                                   ; 21DA _ EB, 2D

?_079:  mov     eax, dword [ebp-98H]                    ; 21DC _ 8B. 85, FFFFFF68
        add     eax, 16                                 ; 21E2 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 21E5 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 21ED _ 89. 44 24, 04
        mov     eax, dword [ebp-94H]                    ; 21F1 _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 21F7 _ 89. 04 24
        call    timer_init                              ; 21FA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-9CH], 0                      ; 21FF _ C7. 85, FFFFFF64, 00000000
?_080:  mov     dword [esp+4H], 50                      ; 2209 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-94H]                    ; 2211 _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 2217 _ 89. 04 24
        call    timer_settime                           ; 221A _ E8, FFFFFFFC(rel)
        jmp     ?_083                                   ; 221F _ E9, 00000247

?_081:  cmp     dword [ebp-90H], 14                     ; 2224 _ 83. BD, FFFFFF70, 0E
        jne     ?_082                                   ; 222B _ 0F 85, 0000012D
        cmp     dword [ebp-0A0H], 16                    ; 2231 _ 83. BD, FFFFFF60, 10
        jle     ?_082                                   ; 2238 _ 0F 8E, 00000120
        mov     eax, dword [ebp-0A0H]                   ; 223E _ 8B. 85, FFFFFF60
        lea     ecx, [eax+7H]                           ; 2244 _ 8D. 48, 07
        mov     eax, dword [ebp-0ACH]                   ; 2247 _ 8B. 85, FFFFFF54
        mov     edx, dword [eax+4H]                     ; 224D _ 8B. 50, 04
        mov     eax, dword [ebp-0ACH]                   ; 2250 _ 8B. 85, FFFFFF54
        mov     eax, dword [eax]                        ; 2256 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 2258 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 2260 _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 2264 _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-0A0H]                   ; 226C _ 8B. 8D, FFFFFF60
        mov     dword [esp+0CH], ecx                    ; 2272 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 0                       ; 2276 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 227E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2282 _ 89. 04 24
        call    paint_rectangle                         ; 2285 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0A0H]                   ; 228A _ 8B. 85, FFFFFF60
        lea     edx, [eax+8H]                           ; 2290 _ 8D. 50, 08
        mov     eax, dword [sheet_control]              ; 2293 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 2298 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], edx                    ; 22A0 _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 22A4 _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-0A0H]                   ; 22AC _ 8B. 95, FFFFFF60
        mov     dword [esp+8H], edx                     ; 22B2 _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 22B6 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 22BC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 22C0 _ 89. 04 24
        call    sheet_refresh                           ; 22C3 _ E8, FFFFFFFC(rel)
        sub     dword [ebp-0A0H], 8                     ; 22C8 _ 83. AD, FFFFFF60, 08
        mov     eax, dword [ebp-0A0H]                   ; 22CF _ 8B. 85, FFFFFF60
        lea     ecx, [eax+7H]                           ; 22D5 _ 8D. 48, 07
        mov     eax, dword [ebp-0ACH]                   ; 22D8 _ 8B. 85, FFFFFF54
        mov     edx, dword [eax+4H]                     ; 22DE _ 8B. 50, 04
        mov     eax, dword [ebp-0ACH]                   ; 22E1 _ 8B. 85, FFFFFF54
        mov     eax, dword [eax]                        ; 22E7 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 22E9 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 22F1 _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 22F5 _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-0A0H]                   ; 22FD _ 8B. 8D, FFFFFF60
        mov     dword [esp+0CH], ecx                    ; 2303 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 0                       ; 2307 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 230F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2313 _ 89. 04 24
        call    paint_rectangle                         ; 2316 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0A0H]                   ; 231B _ 8B. 85, FFFFFF60
        lea     edx, [eax+8H]                           ; 2321 _ 8D. 50, 08
        mov     eax, dword [sheet_control]              ; 2324 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 2329 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], edx                    ; 2331 _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 2335 _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-0A0H]                   ; 233D _ 8B. 95, FFFFFF60
        mov     dword [esp+8H], edx                     ; 2343 _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 2347 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 234D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2351 _ 89. 04 24
        call    sheet_refresh                           ; 2354 _ E8, FFFFFFFC(rel)
        jmp     ?_083                                   ; 2359 _ E9, 0000010D

?_082:  mov     eax, dword [ebp-90H]                    ; 235E _ 8B. 85, FFFFFF70
        mov     dword [esp], eax                        ; 2364 _ 89. 04 24
        call    transfer_scancode                       ; 2367 _ E8, FFFFFFFC(rel)
        test    al, al                                  ; 236C _ 84. C0
        je      ?_083                                   ; 236E _ 0F 84, 000000F7
        cmp     dword [ebp-0A0H], 239                   ; 2374 _ 81. BD, FFFFFF60, 000000EF
        jg      ?_083                                   ; 237E _ 0F 8F, 000000E7
        mov     eax, dword [ebp-0A0H]                   ; 2384 _ 8B. 85, FFFFFF60
        lea     ecx, [eax+7H]                           ; 238A _ 8D. 48, 07
        mov     eax, dword [ebp-0ACH]                   ; 238D _ 8B. 85, FFFFFF54
        mov     edx, dword [eax+4H]                     ; 2393 _ 8B. 50, 04
        mov     eax, dword [ebp-0ACH]                   ; 2396 _ 8B. 85, FFFFFF54
        mov     eax, dword [eax]                        ; 239C _ 8B. 00
        mov     dword [esp+18H], 43                     ; 239E _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 23A6 _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 23AA _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-0A0H]                   ; 23B2 _ 8B. 8D, FFFFFF60
        mov     dword [esp+0CH], ecx                    ; 23B8 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 0                       ; 23BC _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 23C4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 23C8 _ 89. 04 24
        call    paint_rectangle                         ; 23CB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0A0H]                   ; 23D0 _ 8B. 85, FFFFFF60
        lea     edx, [eax+8H]                           ; 23D6 _ 8D. 50, 08
        mov     eax, dword [sheet_control]              ; 23D9 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 23DE _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], edx                    ; 23E6 _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 23EA _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-0A0H]                   ; 23F2 _ 8B. 95, FFFFFF60
        mov     dword [esp+8H], edx                     ; 23F8 _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 23FC _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 2402 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2406 _ 89. 04 24
        call    sheet_refresh                           ; 2409 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-90H]                    ; 240E _ 8B. 85, FFFFFF70
        mov     dword [esp], eax                        ; 2414 _ 89. 04 24
        call    transfer_scancode                       ; 2417 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-0A2H], al                     ; 241C _ 88. 85, FFFFFF5E
        mov     byte [ebp-0A1H], 0                      ; 2422 _ C6. 85, FFFFFF5F, 00
        mov     eax, dword [sheet_control]              ; 2429 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 242E _ C7. 44 24, 14, 00000007
        lea     edx, [ebp-0A2H]                         ; 2436 _ 8D. 95, FFFFFF5E
        mov     dword [esp+10H], edx                    ; 243C _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 2440 _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-0A0H]                   ; 2448 _ 8B. 95, FFFFFF60
        mov     dword [esp+8H], edx                     ; 244E _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 2452 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 2458 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 245C _ 89. 04 24
        call    paint_string                            ; 245F _ E8, FFFFFFFC(rel)
        add     dword [ebp-0A0H], 8                     ; 2464 _ 83. 85, FFFFFF60, 08
?_083:  mov     eax, dword [ebp-0A0H]                   ; 246B _ 8B. 85, FFFFFF60
        lea     ebx, [eax+7H]                           ; 2471 _ 8D. 58, 07
        mov     eax, dword [ebp-9CH]                    ; 2474 _ 8B. 85, FFFFFF64
        movzx   ecx, al                                 ; 247A _ 0F B6. C8
        mov     eax, dword [ebp-0ACH]                   ; 247D _ 8B. 85, FFFFFF54
        mov     edx, dword [eax+4H]                     ; 2483 _ 8B. 50, 04
        mov     eax, dword [ebp-0ACH]                   ; 2486 _ 8B. 85, FFFFFF54
        mov     eax, dword [eax]                        ; 248C _ 8B. 00
        mov     dword [esp+18H], 43                     ; 248E _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 2496 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 249A _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-0A0H]                   ; 24A2 _ 8B. 9D, FFFFFF60
        mov     dword [esp+0CH], ebx                    ; 24A8 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 24AC _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 24B0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 24B4 _ 89. 04 24
        call    paint_rectangle                         ; 24B7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0A0H]                   ; 24BC _ 8B. 85, FFFFFF60
        lea     edx, [eax+8H]                           ; 24C2 _ 8D. 50, 08
        mov     eax, dword [sheet_control]              ; 24C5 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 24CA _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], edx                    ; 24D2 _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 24D6 _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-0A0H]                   ; 24DE _ 8B. 95, FFFFFF60
        mov     dword [esp+8H], edx                     ; 24E4 _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 24E8 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 24EE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 24F2 _ 89. 04 24
        call    sheet_refresh                           ; 24F5 _ E8, FFFFFFFC(rel)
        jmp     ?_077                                   ; 24FA _ E9, FFFFFC5B
; console_task End of function

launch_console:; Function begin
        push    ebp                                     ; 24FF _ 55
        mov     ebp, esp                                ; 2500 _ 89. E5
        sub     esp, 56                                 ; 2502 _ 83. EC, 38
        mov     eax, dword [sheet_control]              ; 2505 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 250A _ 89. 04 24
        call    sheet_alloc                             ; 250D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 2512 _ 89. 45, E8
        mov     eax, dword [memman]                     ; 2515 _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 251A _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 2522 _ 89. 04 24
        call    memman_alloc_4k                         ; 2525 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 252A _ 89. 45, EC
        mov     dword [esp+10H], 99                     ; 252D _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 2535 _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 253D _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-14H]                    ; 2545 _ 8B. 45, EC
        mov     dword [esp+4H], eax                     ; 2548 _ 89. 44 24, 04
        mov     eax, dword [ebp-18H]                    ; 254C _ 8B. 45, E8
        mov     dword [esp], eax                        ; 254F _ 89. 04 24
        call    sheet_setbuf                            ; 2552 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2557 _ A1, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 255C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_237                   ; 2564 _ C7. 44 24, 08, 00000062(d)
        mov     edx, dword [ebp-18H]                    ; 256C _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 256F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2573 _ 89. 04 24
        call    make_windows                            ; 2576 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 257B _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 2583 _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 258B _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 2593 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 259B _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-18H]                    ; 25A3 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 25A6 _ 89. 04 24
        call    make_textbox                            ; 25A9 _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 25AE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 25B3 _ 89. 45, F0
        call    get_code32_addr                         ; 25B6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 25BB _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 25BE _ 8B. 45, F0
        mov     dword [eax+8CH], 0                      ; 25C1 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-10H]                    ; 25CB _ 8B. 45, F0
        mov     dword [eax+90H], 1073741824             ; 25CE _ C7. 80, 00000090, 40000000
        mov     eax, console_task                       ; 25D8 _ B8, 00000000(d)
        sub     eax, dword [ebp-0CH]                    ; 25DD _ 2B. 45, F4
        mov     edx, eax                                ; 25E0 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 25E2 _ 8B. 45, F0
        mov     dword [eax+4CH], edx                    ; 25E5 _ 89. 50, 4C
        mov     eax, dword [ebp-10H]                    ; 25E8 _ 8B. 45, F0
        mov     dword [eax+74H], 0                      ; 25EB _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-10H]                    ; 25F2 _ 8B. 45, F0
        mov     dword [eax+78H], 8                      ; 25F5 _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-10H]                    ; 25FC _ 8B. 45, F0
        mov     dword [eax+7CH], 48                     ; 25FF _ C7. 40, 7C, 00000030
        mov     eax, dword [ebp-10H]                    ; 2606 _ 8B. 45, F0
        mov     dword [eax+80H], 32                     ; 2609 _ C7. 80, 00000080, 00000020
        mov     eax, dword [ebp-10H]                    ; 2613 _ 8B. 45, F0
        mov     dword [eax+84H], 0                      ; 2616 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-10H]                    ; 2620 _ 8B. 45, F0
        mov     dword [eax+88H], 16                     ; 2623 _ C7. 80, 00000088, 00000010
        mov     eax, dword [ebp-10H]                    ; 262D _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 2630 _ 8B. 40, 64
        lea     edx, [eax-4H]                           ; 2633 _ 8D. 50, FC
        mov     eax, dword [ebp-10H]                    ; 2636 _ 8B. 45, F0
        mov     dword [eax+64H], edx                    ; 2639 _ 89. 50, 64
        mov     eax, dword [ebp-10H]                    ; 263C _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 263F _ 8B. 40, 64
        add     eax, 4                                  ; 2642 _ 83. C0, 04
        mov     edx, dword [ebp-18H]                    ; 2645 _ 8B. 55, E8
        mov     dword [eax], edx                        ; 2648 _ 89. 10
        mov     dword [esp+8H], 5                       ; 264A _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 2652 _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-10H]                    ; 265A _ 8B. 45, F0
        mov     dword [esp], eax                        ; 265D _ 89. 04 24
        call    task_run                                ; 2660 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2665 _ A1, 00000000(d)
        mov     dword [esp+0CH], 4                      ; 266A _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 2672 _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-18H]                    ; 267A _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 267D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2681 _ 89. 04 24
        call    sheet_slide                             ; 2684 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2689 _ A1, 00000000(d)
        mov     dword [esp+8H], 1                       ; 268E _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-18H]                    ; 2696 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2699 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 269D _ 89. 04 24
        call    sheet_updown                            ; 26A0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 26A5 _ 8B. 45, F0
        mov     dword [task_console_g], eax             ; 26A8 _ A3, 00000000(d)
        mov     eax, dword [ebp-18H]                    ; 26AD _ 8B. 45, E8
        leave                                           ; 26B0 _ C9
        ret                                             ; 26B1 _ C3
; launch_console End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 26B2 _ 55
        mov     ebp, esp                                ; 26B3 _ 89. E5
        sub     esp, 24                                 ; 26B5 _ 83. EC, 18
?_084:  mov     dword [esp], 100                        ; 26B8 _ C7. 04 24, 00000064
        call    io_in8                                  ; 26BF _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 26C4 _ 83. E0, 02
        test    eax, eax                                ; 26C7 _ 85. C0
        jnz     ?_085                                   ; 26C9 _ 75, 02
        jmp     ?_086                                   ; 26CB _ EB, 02

?_085:  jmp     ?_084                                   ; 26CD _ EB, E9

?_086:  leave                                           ; 26CF _ C9
        ret                                             ; 26D0 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 26D1 _ 55
        mov     ebp, esp                                ; 26D2 _ 89. E5
        sub     esp, 24                                 ; 26D4 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 26D7 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 26DC _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 26E4 _ C7. 04 24, 00000064
        call    io_out8                                 ; 26EB _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 26F0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 26F5 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 26FD _ C7. 04 24, 00000060
        call    io_out8                                 ; 2704 _ E8, FFFFFFFC(rel)
        leave                                           ; 2709 _ C9
        ret                                             ; 270A _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 270B _ 55
        mov     ebp, esp                                ; 270C _ 89. E5
        sub     esp, 24                                 ; 270E _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2711 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 2716 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 271E _ C7. 04 24, 00000064
        call    io_out8                                 ; 2725 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 272A _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 272F _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 2737 _ C7. 04 24, 00000060
        call    io_out8                                 ; 273E _ E8, FFFFFFFC(rel)
        leave                                           ; 2743 _ C9
        ret                                             ; 2744 _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 2745 _ 55
        mov     ebp, esp                                ; 2746 _ 89. E5
        sub     esp, 4                                  ; 2748 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 274B _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 274E _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2751 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2754 _ 0F B6. 40, 03
        test    al, al                                  ; 2758 _ 84. C0
        jnz     ?_088                                   ; 275A _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 275C _ 80. 7D, FC, FA
        jnz     ?_087                                   ; 2760 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 2762 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2765 _ C6. 40, 03, 01
?_087:  mov     eax, 0                                  ; 2769 _ B8, 00000000
        jmp     ?_095                                   ; 276E _ E9, 0000010F

?_088:  mov     eax, dword [ebp+8H]                     ; 2773 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2776 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 277A _ 3C, 01
        jnz     ?_090                                   ; 277C _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 277E _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 2782 _ 25, 000000C8
        cmp     eax, 8                                  ; 2787 _ 83. F8, 08
        jnz     ?_089                                   ; 278A _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 278C _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 278F _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 2793 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 2795 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 2798 _ C6. 40, 03, 02
?_089:  mov     eax, 0                                  ; 279C _ B8, 00000000
        jmp     ?_095                                   ; 27A1 _ E9, 000000DC

?_090:  mov     eax, dword [ebp+8H]                     ; 27A6 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 27A9 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 27AD _ 3C, 02
        jnz     ?_091                                   ; 27AF _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 27B1 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 27B4 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 27B8 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 27BB _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 27BE _ C6. 40, 03, 03
        mov     eax, 0                                  ; 27C2 _ B8, 00000000
        jmp     ?_095                                   ; 27C7 _ E9, 000000B6

?_091:  mov     eax, dword [ebp+8H]                     ; 27CC _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 27CF _ 0F B6. 40, 03
        cmp     al, 3                                   ; 27D3 _ 3C, 03
        jne     ?_094                                   ; 27D5 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 27DB _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 27DE _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 27E2 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 27E5 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 27E8 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 27EC _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 27EF _ 0F B6. 00
        movzx   eax, al                                 ; 27F2 _ 0F B6. C0
        and     eax, 07H                                ; 27F5 _ 83. E0, 07
        mov     edx, eax                                ; 27F8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 27FA _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 27FD _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2800 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 2803 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 2807 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 280A _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 280D _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2810 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 2813 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 2817 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 281A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 281D _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2820 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2823 _ 0F B6. 00
        movzx   eax, al                                 ; 2826 _ 0F B6. C0
        and     eax, 10H                                ; 2829 _ 83. E0, 10
        test    eax, eax                                ; 282C _ 85. C0
        jz      ?_092                                   ; 282E _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2830 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2833 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 2836 _ 0D, FFFFFF00
        mov     edx, eax                                ; 283B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 283D _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2840 _ 89. 50, 04
?_092:  mov     eax, dword [ebp+8H]                     ; 2843 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2846 _ 0F B6. 00
        movzx   eax, al                                 ; 2849 _ 0F B6. C0
        and     eax, 20H                                ; 284C _ 83. E0, 20
        test    eax, eax                                ; 284F _ 85. C0
        jz      ?_093                                   ; 2851 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2853 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2856 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 2859 _ 0D, FFFFFF00
        mov     edx, eax                                ; 285E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2860 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2863 _ 89. 50, 08
?_093:  mov     eax, dword [ebp+8H]                     ; 2866 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2869 _ 8B. 40, 08
        neg     eax                                     ; 286C _ F7. D8
        mov     edx, eax                                ; 286E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2870 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2873 _ 89. 50, 08
        mov     eax, 1                                  ; 2876 _ B8, 00000001
        jmp     ?_095                                   ; 287B _ EB, 05

?_094:  mov     eax, 4294967295                         ; 287D _ B8, FFFFFFFF
?_095:  leave                                           ; 2882 _ C9
        ret                                             ; 2883 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 2884 _ 55
        mov     ebp, esp                                ; 2885 _ 89. E5
        sub     esp, 40                                 ; 2887 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 288A _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 2892 _ C7. 04 24, 00000020
        call    io_out8                                 ; 2899 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 289E _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 28A6 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 28AD _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 28B2 _ C7. 04 24, 00000060
        call    io_in8                                  ; 28B9 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 28BE _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 28C1 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 28C5 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 28C9 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 28D0 _ E8, FFFFFFFC(rel)
        leave                                           ; 28D5 _ C9
        ret                                             ; 28D6 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 28D7 _ 55
        mov     ebp, esp                                ; 28D8 _ 89. E5
        sub     esp, 40                                 ; 28DA _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 28DD _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 28E5 _ C7. 04 24, 00000020
        call    io_out8                                 ; 28EC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 28F1 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 28F9 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 2900 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 2905 _ C7. 04 24, 00000060
        call    io_in8                                  ; 290C _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 2911 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 2914 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 2918 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 291C _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 2923 _ E8, FFFFFFFC(rel)
        leave                                           ; 2928 _ C9
        ret                                             ; 2929 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 292A _ 55
        mov     ebp, esp                                ; 292B _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 292D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2930 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2933 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2935 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2938 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 293F _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2942 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2949 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 294C _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 294F _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2952 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2955 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2958 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 295B _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 295E _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 2965 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2968 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 296B _ 89. 50, 18
        pop     ebp                                     ; 296E _ 5D
        ret                                             ; 296F _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 2970 _ 55
        mov     ebp, esp                                ; 2971 _ 89. E5
        sub     esp, 40                                 ; 2973 _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 2976 _ 8B. 45, 0C
        mov     byte [ebp-1CH], al                      ; 2979 _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 297C _ 83. 7D, 08, 00
        jnz     ?_096                                   ; 2980 _ 75, 0A
        mov     eax, 4294967295                         ; 2982 _ B8, FFFFFFFF
        jmp     ?_100                                   ; 2987 _ E9, 000000B1

?_096:  mov     eax, dword [ebp+8H]                     ; 298C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 298F _ 8B. 40, 10
        test    eax, eax                                ; 2992 _ 85. C0
        jnz     ?_097                                   ; 2994 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 2996 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 2999 _ 8B. 40, 14
        or      eax, 01H                                ; 299C _ 83. C8, 01
        mov     edx, eax                                ; 299F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 29A1 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 29A4 _ 89. 50, 14
        mov     eax, 4294967295                         ; 29A7 _ B8, FFFFFFFF
        jmp     ?_100                                   ; 29AC _ E9, 0000008C

?_097:  mov     eax, dword [ebp+8H]                     ; 29B1 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 29B4 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 29B7 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 29BA _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 29BD _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 29BF _ 8B. 45, F4
        add     edx, eax                                ; 29C2 _ 01. C2
        movzx   eax, byte [ebp-1CH]                     ; 29C4 _ 0F B6. 45, E4
        mov     byte [edx], al                          ; 29C8 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 29CA _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 29CD _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 29D0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 29D3 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 29D6 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 29D9 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 29DC _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 29DF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 29E2 _ 8B. 40, 0C
        cmp     edx, eax                                ; 29E5 _ 39. C2
        jnz     ?_098                                   ; 29E7 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 29E9 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 29EC _ C7. 40, 04, 00000000
?_098:  mov     eax, dword [ebp+8H]                     ; 29F3 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 29F6 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 29F9 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 29FC _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 29FF _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2A02 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2A05 _ 8B. 40, 18
        test    eax, eax                                ; 2A08 _ 85. C0
        jz      ?_099                                   ; 2A0A _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 2A0C _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2A0F _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 2A12 _ 8B. 40, 04
        cmp     eax, 2                                  ; 2A15 _ 83. F8, 02
        jz      ?_099                                   ; 2A18 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 2A1A _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2A1D _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 2A20 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 2A28 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 2A30 _ 89. 04 24
        call    task_run                                ; 2A33 _ E8, FFFFFFFC(rel)
?_099:  mov     eax, 0                                  ; 2A38 _ B8, 00000000
?_100:  leave                                           ; 2A3D _ C9
        ret                                             ; 2A3E _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2A3F _ 55
        mov     ebp, esp                                ; 2A40 _ 89. E5
        sub     esp, 16                                 ; 2A42 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 2A45 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 2A48 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2A4B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2A4E _ 8B. 40, 0C
        cmp     edx, eax                                ; 2A51 _ 39. C2
        jnz     ?_101                                   ; 2A53 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 2A55 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2A58 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 2A5F _ B8, FFFFFFFF
        jmp     ?_103                                   ; 2A64 _ EB, 57

?_101:  mov     eax, dword [ebp+8H]                     ; 2A66 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2A69 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 2A6C _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 2A6F _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2A72 _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 2A74 _ 8B. 45, F8
        add     eax, edx                                ; 2A77 _ 01. D0
        movzx   eax, byte [eax]                         ; 2A79 _ 0F B6. 00
        movzx   eax, al                                 ; 2A7C _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2A7F _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2A82 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2A85 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2A88 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2A8B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2A8E _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2A91 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 2A94 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2A97 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2A9A _ 8B. 40, 0C
        cmp     edx, eax                                ; 2A9D _ 39. C2
        jnz     ?_102                                   ; 2A9F _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2AA1 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2AA4 _ C7. 40, 08, 00000000
?_102:  mov     eax, dword [ebp+8H]                     ; 2AAB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2AAE _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2AB1 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2AB4 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2AB7 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 2ABA _ 8B. 45, FC
?_103:  leave                                           ; 2ABD _ C9
        ret                                             ; 2ABE _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 2ABF _ 55
        mov     ebp, esp                                ; 2AC0 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2AC2 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 2AC5 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2AC8 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2ACB _ 8B. 40, 10
        sub     edx, eax                                ; 2ACE _ 29. C2
        mov     eax, edx                                ; 2AD0 _ 89. D0
        pop     ebp                                     ; 2AD2 _ 5D
        ret                                             ; 2AD3 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 2AD4 _ 55
        mov     ebp, esp                                ; 2AD5 _ 89. E5
        sub     esp, 4                                  ; 2AD7 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 2ADA _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 2ADD _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 2AE0 _ 80. 7D, FC, 09
        jle     ?_104                                   ; 2AE4 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 2AE6 _ 0F B6. 45, FC
        add     eax, 55                                 ; 2AEA _ 83. C0, 37
        jmp     ?_105                                   ; 2AED _ EB, 07

?_104:  movzx   eax, byte [ebp-4H]                      ; 2AEF _ 0F B6. 45, FC
        add     eax, 48                                 ; 2AF3 _ 83. C0, 30
?_105:  leave                                           ; 2AF6 _ C9
        ret                                             ; 2AF7 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 2AF8 _ 55
        mov     ebp, esp                                ; 2AF9 _ 89. E5
        sub     esp, 24                                 ; 2AFB _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 2AFE _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 2B01 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 2B04 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 2B0B _ 0F B6. 45, EC
        and     eax, 0FH                                ; 2B0F _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 2B12 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 2B15 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 2B19 _ 89. 04 24
        call    charToHexVal                            ; 2B1C _ E8, FFFFFFFC(rel)
        mov     byte [?_239], al                        ; 2B21 _ A2, 00000343(d)
        movzx   eax, byte [ebp-14H]                     ; 2B26 _ 0F B6. 45, EC
        shr     al, 4                                   ; 2B2A _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 2B2D _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 2B30 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 2B34 _ 0F BE. C0
        mov     dword [esp], eax                        ; 2B37 _ 89. 04 24
        call    charToHexVal                            ; 2B3A _ E8, FFFFFFFC(rel)
        mov     byte [?_238], al                        ; 2B3F _ A2, 00000342(d)
        mov     eax, keyval                             ; 2B44 _ B8, 00000340(d)
        leave                                           ; 2B49 _ C9
        ret                                             ; 2B4A _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 2B4B _ 55
        mov     ebp, esp                                ; 2B4C _ 89. E5
        sub     esp, 16                                 ; 2B4E _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 2B51 _ C6. 05, 000002C0(d), 30
        mov     byte [?_242], 88                        ; 2B58 _ C6. 05, 000002C1(d), 58
        mov     byte [?_243], 0                         ; 2B5F _ C6. 05, 000002CA(d), 00
        mov     dword [ebp-0CH], 2                      ; 2B66 _ C7. 45, F4, 00000002
        jmp     ?_107                                   ; 2B6D _ EB, 0F

?_106:  mov     eax, dword [ebp-0CH]                    ; 2B6F _ 8B. 45, F4
        add     eax, str.1386                           ; 2B72 _ 05, 000002C0(d)
        mov     byte [eax], 48                          ; 2B77 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 2B7A _ 83. 45, F4, 01
?_107:  cmp     dword [ebp-0CH], 9                      ; 2B7E _ 83. 7D, F4, 09
        jle     ?_106                                   ; 2B82 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 2B84 _ C7. 45, F8, 00000009
        jmp     ?_111                                   ; 2B8B _ EB, 40

?_108:  mov     eax, dword [ebp+8H]                     ; 2B8D _ 8B. 45, 08
        and     eax, 0FH                                ; 2B90 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 2B93 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2B96 _ 8B. 45, 08
        shr     eax, 4                                  ; 2B99 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 2B9C _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 2B9F _ 83. 7D, FC, 09
        jle     ?_109                                   ; 2BA3 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 2BA5 _ 8B. 45, FC
        add     eax, 55                                 ; 2BA8 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 2BAB _ 8B. 55, F8
        add     edx, str.1386                           ; 2BAE _ 81. C2, 000002C0(d)
        mov     byte [edx], al                          ; 2BB4 _ 88. 02
        jmp     ?_110                                   ; 2BB6 _ EB, 11

?_109:  mov     eax, dword [ebp-4H]                     ; 2BB8 _ 8B. 45, FC
        add     eax, 48                                 ; 2BBB _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 2BBE _ 8B. 55, F8
        add     edx, str.1386                           ; 2BC1 _ 81. C2, 000002C0(d)
        mov     byte [edx], al                          ; 2BC7 _ 88. 02
?_110:  sub     dword [ebp-8H], 1                       ; 2BC9 _ 83. 6D, F8, 01
?_111:  cmp     dword [ebp-8H], 1                       ; 2BCD _ 83. 7D, F8, 01
        jle     ?_112                                   ; 2BD1 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 2BD3 _ 83. 7D, 08, 00
        jnz     ?_108                                   ; 2BD7 _ 75, B4
?_112:  mov     eax, str.1386                           ; 2BD9 _ B8, 000002C0(d)
        leave                                           ; 2BDE _ C9
        ret                                             ; 2BDF _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 2BE0 _ 55
        mov     ebp, esp                                ; 2BE1 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2BE3 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 2BE6 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 2BEC _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2BEF _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2BF6 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2BF9 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2C00 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 2C03 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 2C0A _ 5D
        ret                                             ; 2C0B _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 2C0C _ 55
        mov     ebp, esp                                ; 2C0D _ 89. E5
        sub     esp, 16                                 ; 2C0F _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2C12 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 2C19 _ C7. 45, F8, 00000000
        jmp     ?_114                                   ; 2C20 _ EB, 14

?_113:  mov     eax, dword [ebp+8H]                     ; 2C22 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2C25 _ 8B. 55, F8
        add     edx, 2                                  ; 2C28 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2C2B _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 2C2F _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 2C32 _ 83. 45, F8, 01
?_114:  mov     eax, dword [ebp+8H]                     ; 2C36 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2C39 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 2C3B _ 3B. 45, F8
        ja      ?_113                                   ; 2C3E _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 2C40 _ 8B. 45, FC
        leave                                           ; 2C43 _ C9
        ret                                             ; 2C44 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 2C45 _ 55
        mov     ebp, esp                                ; 2C46 _ 89. E5
        sub     esp, 16                                 ; 2C48 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2C4B _ C7. 45, F8, 00000000
        jmp     ?_118                                   ; 2C52 _ E9, 00000085

?_115:  mov     eax, dword [ebp+8H]                     ; 2C57 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2C5A _ 8B. 55, F8
        add     edx, 2                                  ; 2C5D _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2C60 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 2C64 _ 3B. 45, 0C
        jc      ?_117                                   ; 2C67 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 2C69 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2C6C _ 8B. 55, F8
        add     edx, 2                                  ; 2C6F _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2C72 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 2C75 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2C78 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2C7B _ 8B. 55, F8
        add     edx, 2                                  ; 2C7E _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2C81 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 2C84 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 2C87 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2C8A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2C8D _ 8B. 55, F8
        add     edx, 2                                  ; 2C90 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 2C93 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 2C96 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2C99 _ 8B. 55, F8
        add     edx, 2                                  ; 2C9C _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2C9F _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 2CA3 _ 2B. 45, 0C
        mov     edx, eax                                ; 2CA6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2CA8 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 2CAB _ 8B. 4D, F8
        add     ecx, 2                                  ; 2CAE _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 2CB1 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 2CB5 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2CB8 _ 8B. 55, F8
        add     edx, 2                                  ; 2CBB _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2CBE _ 8B. 44 D0, 04
        test    eax, eax                                ; 2CC2 _ 85. C0
        jnz     ?_116                                   ; 2CC4 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 2CC6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2CC9 _ 8B. 00
        lea     edx, [eax-1H]                           ; 2CCB _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2CCE _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2CD1 _ 89. 10
?_116:  mov     eax, dword [ebp-4H]                     ; 2CD3 _ 8B. 45, FC
        jmp     ?_119                                   ; 2CD6 _ EB, 17

?_117:  add     dword [ebp-8H], 1                       ; 2CD8 _ 83. 45, F8, 01
?_118:  mov     eax, dword [ebp+8H]                     ; 2CDC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2CDF _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 2CE1 _ 3B. 45, F8
        ja      ?_115                                   ; 2CE4 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 2CEA _ B8, 00000000
?_119:  leave                                           ; 2CEF _ C9
        ret                                             ; 2CF0 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 2CF1 _ 55
        mov     ebp, esp                                ; 2CF2 _ 89. E5
        push    ebx                                     ; 2CF4 _ 53
        sub     esp, 16                                 ; 2CF5 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 2CF8 _ C7. 45, F4, 00000000
        jmp     ?_122                                   ; 2CFF _ EB, 17

?_120:  mov     eax, dword [ebp+8H]                     ; 2D01 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2D04 _ 8B. 55, F4
        add     edx, 2                                  ; 2D07 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2D0A _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 2D0D _ 3B. 45, 0C
        jbe     ?_121                                   ; 2D10 _ 76, 02
        jmp     ?_123                                   ; 2D12 _ EB, 0E

?_121:  add     dword [ebp-0CH], 1                      ; 2D14 _ 83. 45, F4, 01
?_122:  mov     eax, dword [ebp+8H]                     ; 2D18 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2D1B _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2D1D _ 3B. 45, F4
        jg      ?_120                                   ; 2D20 _ 7F, DF
?_123:  cmp     dword [ebp-0CH], 0                      ; 2D22 _ 83. 7D, F4, 00
        jle     ?_125                                   ; 2D26 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 2D2C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2D2F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2D32 _ 8B. 45, 08
        add     edx, 2                                  ; 2D35 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2D38 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 2D3B _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 2D3E _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 2D41 _ 8B. 45, 08
        add     ecx, 2                                  ; 2D44 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 2D47 _ 8B. 44 C8, 04
        add     eax, edx                                ; 2D4B _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 2D4D _ 3B. 45, 0C
        jne     ?_125                                   ; 2D50 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 2D56 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 2D59 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2D5C _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2D5F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2D62 _ 8B. 45, 08
        add     edx, 2                                  ; 2D65 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2D68 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2D6C _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2D6F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2D72 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 2D75 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2D78 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2D7C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2D7F _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2D81 _ 3B. 45, F4
        jle     ?_124                                   ; 2D84 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 2D86 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 2D89 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 2D8C _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2D8F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2D92 _ 8B. 55, F4
        add     edx, 2                                  ; 2D95 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2D98 _ 8B. 04 D0
        cmp     ecx, eax                                ; 2D9B _ 39. C1
        jnz     ?_124                                   ; 2D9D _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 2D9F _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 2DA2 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2DA5 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2DA8 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2DAB _ 8B. 45, 08
        add     edx, 2                                  ; 2DAE _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2DB1 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 2DB5 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 2DB8 _ 8B. 4D, F4
        add     ecx, 2                                  ; 2DBB _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 2DBE _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 2DC2 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2DC5 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 2DC8 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2DCB _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2DCF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2DD2 _ 8B. 00
        lea     edx, [eax-1H]                           ; 2DD4 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2DD7 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2DDA _ 89. 10
?_124:  mov     eax, 0                                  ; 2DDC _ B8, 00000000
        jmp     ?_131                                   ; 2DE1 _ E9, 0000011C

?_125:  mov     eax, dword [ebp+8H]                     ; 2DE6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2DE9 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2DEB _ 3B. 45, F4
        jle     ?_126                                   ; 2DEE _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 2DF0 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 2DF3 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 2DF6 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2DF9 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2DFC _ 8B. 55, F4
        add     edx, 2                                  ; 2DFF _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2E02 _ 8B. 04 D0
        cmp     ecx, eax                                ; 2E05 _ 39. C1
        jnz     ?_126                                   ; 2E07 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 2E09 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2E0C _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2E0F _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2E12 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2E15 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 2E18 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2E1B _ 8B. 55, F4
        add     edx, 2                                  ; 2E1E _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2E21 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2E25 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2E28 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2E2B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2E2E _ 8B. 55, F4
        add     edx, 2                                  ; 2E31 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2E34 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 2E38 _ B8, 00000000
        jmp     ?_131                                   ; 2E3D _ E9, 000000C0

?_126:  mov     eax, dword [ebp+8H]                     ; 2E42 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2E45 _ 8B. 00
        cmp     eax, 4095                               ; 2E47 _ 3D, 00000FFF
        jg      ?_130                                   ; 2E4C _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 2E52 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2E55 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 2E57 _ 89. 45, F8
        jmp     ?_128                                   ; 2E5A _ EB, 28

?_127:  mov     eax, dword [ebp-8H]                     ; 2E5C _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 2E5F _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 2E62 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 2E65 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 2E68 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 2E6B _ 8B. 45, 08
        add     edx, 2                                  ; 2E6E _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 2E71 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 2E74 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 2E76 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 2E79 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 2E7C _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 2E80 _ 83. 6D, F8, 01
?_128:  mov     eax, dword [ebp-8H]                     ; 2E84 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 2E87 _ 3B. 45, F4
        jg      ?_127                                   ; 2E8A _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 2E8C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2E8F _ 8B. 00
        lea     edx, [eax+1H]                           ; 2E91 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2E94 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2E97 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2E99 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2E9C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2E9F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2EA2 _ 8B. 00
        cmp     edx, eax                                ; 2EA4 _ 39. C2
        jge     ?_129                                   ; 2EA6 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 2EA8 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2EAB _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2EAD _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2EB0 _ 89. 50, 04
?_129:  mov     eax, dword [ebp+8H]                     ; 2EB3 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2EB6 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2EB9 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2EBC _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2EBF _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 2EC2 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2EC5 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2EC8 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 2ECB _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 2ECE _ 89. 54 C8, 04
        mov     eax, 0                                  ; 2ED2 _ B8, 00000000
        jmp     ?_131                                   ; 2ED7 _ EB, 29

?_130:  mov     eax, dword [ebp+8H]                     ; 2ED9 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2EDC _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 2EDF _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2EE2 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2EE5 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2EE8 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2EEB _ 8B. 40, 08
        mov     edx, eax                                ; 2EEE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2EF0 _ 8B. 45, 10
        add     eax, edx                                ; 2EF3 _ 01. D0
        mov     edx, eax                                ; 2EF5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2EF7 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2EFA _ 89. 50, 08
        mov     eax, 4294967295                         ; 2EFD _ B8, FFFFFFFF
?_131:  add     esp, 16                                 ; 2F02 _ 83. C4, 10
        pop     ebx                                     ; 2F05 _ 5B
        pop     ebp                                     ; 2F06 _ 5D
        ret                                             ; 2F07 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 2F08 _ 55
        mov     ebp, esp                                ; 2F09 _ 89. E5
        sub     esp, 24                                 ; 2F0B _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 2F0E _ 8B. 45, 0C
        add     eax, 4095                               ; 2F11 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2F16 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 2F1B _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 2F1E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2F21 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F25 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F28 _ 89. 04 24
        call    memman_alloc                            ; 2F2B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 2F30 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2F33 _ 8B. 45, FC
        leave                                           ; 2F36 _ C9
        ret                                             ; 2F37 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 2F38 _ 55
        mov     ebp, esp                                ; 2F39 _ 89. E5
        sub     esp, 28                                 ; 2F3B _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 2F3E _ 8B. 45, 10
        add     eax, 4095                               ; 2F41 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2F46 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 2F4B _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 2F4E _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 2F51 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2F55 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2F58 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F5C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F5F _ 89. 04 24
        call    memman_free                             ; 2F62 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 2F67 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2F6A _ 8B. 45, FC
        leave                                           ; 2F6D _ C9
        ret                                             ; 2F6E _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 2F6F _ 55
        mov     ebp, esp                                ; 2F70 _ 89. E5
        sub     esp, 40                                 ; 2F72 _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 2F75 _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 2F7D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F80 _ 89. 04 24
        call    memman_alloc_4k                         ; 2F83 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2F88 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 2F8B _ 83. 7D, F4, 00
        jnz     ?_132                                   ; 2F8F _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 2F91 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 2F94 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 2F9C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2FA0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2FA3 _ 89. 04 24
        call    memman_free_4k                          ; 2FA6 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 2FAB _ B8, 00000000
        jmp     ?_136                                   ; 2FB0 _ E9, 0000009D

?_132:  mov     eax, dword [ebp-0CH]                    ; 2FB5 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 2FB8 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2FBB _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 2FBD _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 2FC0 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 2FC3 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 2FC6 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 2FC9 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 2FCC _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2FCF _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 2FD2 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 2FD9 _ C7. 45, F0, 00000000
        jmp     ?_134                                   ; 2FE0 _ EB, 1B

?_133:  mov     eax, dword [ebp-0CH]                    ; 2FE2 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 2FE5 _ 8B. 55, F0
        add     edx, 33                                 ; 2FE8 _ 83. C2, 21
        shl     edx, 5                                  ; 2FEB _ C1. E2, 05
        add     eax, edx                                ; 2FEE _ 01. D0
        add     eax, 16                                 ; 2FF0 _ 83. C0, 10
        mov     dword [eax], 0                          ; 2FF3 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 2FF9 _ 83. 45, F0, 01
?_134:  cmp     dword [ebp-10H], 255                    ; 2FFD _ 81. 7D, F0, 000000FF
        jle     ?_133                                   ; 3004 _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 3006 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 3009 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 300D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3011 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3014 _ 89. 04 24
        call    memman_alloc_4k                         ; 3017 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 301C _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 301E _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 3021 _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 3024 _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 3027 _ 8B. 40, 10
        test    eax, eax                                ; 302A _ 85. C0
        jnz     ?_135                                   ; 302C _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 302E _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 3031 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 3039 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 303D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3040 _ 89. 04 24
        call    memman_free_4k                          ; 3043 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 3048 _ B8, 00000000
        jmp     ?_136                                   ; 304D _ EB, 03

?_135:  mov     eax, dword [ebp-0CH]                    ; 304F _ 8B. 45, F4
?_136:  leave                                           ; 3052 _ C9
        ret                                             ; 3053 _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 3054 _ 55
        mov     ebp, esp                                ; 3055 _ 89. E5
        sub     esp, 16                                 ; 3057 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 305A _ C7. 45, F8, 00000000
        jmp     ?_139                                   ; 3061 _ EB, 5B

?_137:  mov     eax, dword [ebp+8H]                     ; 3063 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3066 _ 8B. 55, F8
        add     edx, 33                                 ; 3069 _ 83. C2, 21
        shl     edx, 5                                  ; 306C _ C1. E2, 05
        add     eax, edx                                ; 306F _ 01. D0
        add     eax, 16                                 ; 3071 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 3074 _ 8B. 00
        test    eax, eax                                ; 3076 _ 85. C0
        jnz     ?_138                                   ; 3078 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 307A _ 8B. 45, F8
        shl     eax, 5                                  ; 307D _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 3080 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 3086 _ 8B. 45, 08
        add     eax, edx                                ; 3089 _ 01. D0
        add     eax, 4                                  ; 308B _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 308E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3091 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 3094 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 3097 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 309A _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 309D _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 30A1 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 30A4 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 30AB _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 30AE _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 30B5 _ 8B. 45, FC
        jmp     ?_140                                   ; 30B8 _ EB, 12

?_138:  add     dword [ebp-8H], 1                       ; 30BA _ 83. 45, F8, 01
?_139:  cmp     dword [ebp-8H], 255                     ; 30BE _ 81. 7D, F8, 000000FF
        jle     ?_137                                   ; 30C5 _ 7E, 9C
        mov     eax, 0                                  ; 30C7 _ B8, 00000000
?_140:  leave                                           ; 30CC _ C9
        ret                                             ; 30CD _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 30CE _ 55
        mov     ebp, esp                                ; 30CF _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 30D1 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 30D4 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 30D7 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 30D9 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 30DC _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 30DF _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 30E2 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 30E5 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 30E8 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 30EB _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 30EE _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 30F1 _ 89. 50, 14
        pop     ebp                                     ; 30F4 _ 5D
        ret                                             ; 30F5 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 30F6 _ 55
        mov     ebp, esp                                ; 30F7 _ 89. E5
        push    esi                                     ; 30F9 _ 56
        push    ebx                                     ; 30FA _ 53
        sub     esp, 48                                 ; 30FB _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 30FE _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3101 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 3104 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3107 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 310A _ 8B. 40, 0C
        add     eax, 1                                  ; 310D _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 3110 _ 3B. 45, 10
        jge     ?_141                                   ; 3113 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 3115 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3118 _ 8B. 40, 0C
        add     eax, 1                                  ; 311B _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 311E _ 89. 45, 10
?_141:  cmp     dword [ebp+10H], -1                     ; 3121 _ 83. 7D, 10, FF
        jge     ?_142                                   ; 3125 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 3127 _ C7. 45, 10, FFFFFFFF
?_142:  mov     eax, dword [ebp+0CH]                    ; 312E _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3131 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 3134 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 3137 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 313A _ 3B. 45, 10
        jle     ?_149                                   ; 313D _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 3143 _ 83. 7D, 10, 00
        js      ?_145                                   ; 3147 _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 314D _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3150 _ 89. 45, F0
        jmp     ?_144                                   ; 3153 _ EB, 34

?_143:  mov     eax, dword [ebp-10H]                    ; 3155 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3158 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 315B _ 8B. 45, 08
        add     edx, 4                                  ; 315E _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3161 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3165 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3168 _ 8B. 4D, F0
        add     ecx, 4                                  ; 316B _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 316E _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3172 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3175 _ 8B. 55, F0
        add     edx, 4                                  ; 3178 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 317B _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 317F _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3182 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 3185 _ 83. 6D, F0, 01
?_144:  mov     eax, dword [ebp-10H]                    ; 3189 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 318C _ 3B. 45, 10
        jg      ?_143                                   ; 318F _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 3191 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3194 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3197 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 319A _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 319D _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 31A1 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 31A4 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 31A7 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 31AA _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 31AD _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 31B0 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 31B3 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 31B6 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 31B9 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 31BC _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 31BF _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 31C2 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 31C5 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 31C8 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 31CB _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 31CE _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 31D1 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 31D5 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 31D9 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 31DD _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 31E1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 31E5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 31E8 _ 89. 04 24
        call    sheet_refresh_map                       ; 31EB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 31F0 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 31F3 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 31F6 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 31F9 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 31FC _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 31FF _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3202 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3205 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3208 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 320B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 320E _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3211 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3214 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3217 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 321A _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 321D _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 3220 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3224 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3228 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 322C _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3230 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3234 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3237 _ 89. 04 24
        call    sheet_refresh_local                     ; 323A _ E8, FFFFFFFC(rel)
        jmp     ?_156                                   ; 323F _ E9, 0000026C

?_145:  mov     eax, dword [ebp+8H]                     ; 3244 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3247 _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 324A _ 3B. 45, F4
        jle     ?_148                                   ; 324D _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 324F _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3252 _ 89. 45, F0
        jmp     ?_147                                   ; 3255 _ EB, 34

?_146:  mov     eax, dword [ebp-10H]                    ; 3257 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 325A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 325D _ 8B. 45, 08
        add     edx, 4                                  ; 3260 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3263 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3267 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 326A _ 8B. 4D, F0
        add     ecx, 4                                  ; 326D _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3270 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3274 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3277 _ 8B. 55, F0
        add     edx, 4                                  ; 327A _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 327D _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3281 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 3284 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 3287 _ 83. 45, F0, 01
?_147:  mov     eax, dword [ebp+8H]                     ; 328B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 328E _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 3291 _ 3B. 45, F0
        jg      ?_146                                   ; 3294 _ 7F, C1
?_148:  mov     eax, dword [ebp+8H]                     ; 3296 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3299 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 329C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 329F _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 32A2 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 32A5 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 32A8 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 32AB _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 32AE _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 32B1 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 32B4 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 32B7 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 32BA _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 32BD _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 32C0 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 32C3 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 32C6 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 32C9 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 32CC _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 32CF _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 32D7 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 32DB _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 32DF _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 32E3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 32E7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 32EA _ 89. 04 24
        call    sheet_refresh_map                       ; 32ED _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 32F2 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 32F5 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 32F8 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 32FB _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 32FE _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3301 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3304 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3307 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 330A _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 330D _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3310 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3313 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3316 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3319 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 331C _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3324 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3328 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 332C _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3330 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3334 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3337 _ 89. 04 24
        call    sheet_refresh_local                     ; 333A _ E8, FFFFFFFC(rel)
        jmp     ?_156                                   ; 333F _ E9, 0000016C

?_149:  mov     eax, dword [ebp-0CH]                    ; 3344 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3347 _ 3B. 45, 10
        jge     ?_156                                   ; 334A _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 3350 _ 83. 7D, F4, 00
        js      ?_152                                   ; 3354 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 3356 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3359 _ 89. 45, F0
        jmp     ?_151                                   ; 335C _ EB, 34

?_150:  mov     eax, dword [ebp-10H]                    ; 335E _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3361 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3364 _ 8B. 45, 08
        add     edx, 4                                  ; 3367 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 336A _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 336E _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 3371 _ 8B. 4D, F0
        add     ecx, 4                                  ; 3374 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3377 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 337B _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 337E _ 8B. 55, F0
        add     edx, 4                                  ; 3381 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3384 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3388 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 338B _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 338E _ 83. 45, F0, 01
?_151:  mov     eax, dword [ebp-10H]                    ; 3392 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3395 _ 3B. 45, 10
        jl      ?_150                                   ; 3398 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 339A _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 339D _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 33A0 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 33A3 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 33A6 _ 89. 54 88, 04
        jmp     ?_155                                   ; 33AA _ EB, 6C

?_152:  mov     eax, dword [ebp+8H]                     ; 33AC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 33AF _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 33B2 _ 89. 45, F0
        jmp     ?_154                                   ; 33B5 _ EB, 3A

?_153:  mov     eax, dword [ebp-10H]                    ; 33B7 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 33BA _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 33BD _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 33C0 _ 8B. 55, F0
        add     edx, 4                                  ; 33C3 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 33C6 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 33CA _ 8B. 45, 08
        add     ecx, 4                                  ; 33CD _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 33D0 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 33D4 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 33D7 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 33DA _ 8B. 45, 08
        add     edx, 4                                  ; 33DD _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 33E0 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 33E4 _ 8B. 55, F0
        add     edx, 1                                  ; 33E7 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 33EA _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 33ED _ 83. 6D, F0, 01
?_154:  mov     eax, dword [ebp-10H]                    ; 33F1 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 33F4 _ 3B. 45, 10
        jge     ?_153                                   ; 33F7 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 33F9 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 33FC _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 33FF _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3402 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3405 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3409 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 340C _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 340F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3412 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3415 _ 89. 50, 0C
?_155:  mov     eax, dword [ebp+0CH]                    ; 3418 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 341B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 341E _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3421 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3424 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3427 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 342A _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 342D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3430 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3433 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3436 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3439 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 343C _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 343F _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 3442 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3445 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3449 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 344D _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3451 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3455 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3459 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 345C _ 89. 04 24
        call    sheet_refresh_map                       ; 345F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3464 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3467 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 346A _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 346D _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3470 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3473 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3476 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3479 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 347C _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 347F _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3482 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3485 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3488 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 348B _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 348E _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3491 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3495 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3499 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 349D _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 34A1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 34A5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 34A8 _ 89. 04 24
        call    sheet_refresh_local                     ; 34AB _ E8, FFFFFFFC(rel)
?_156:  add     esp, 48                                 ; 34B0 _ 83. C4, 30
        pop     ebx                                     ; 34B3 _ 5B
        pop     esi                                     ; 34B4 _ 5E
        pop     ebp                                     ; 34B5 _ 5D
        ret                                             ; 34B6 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 34B7 _ 55
        mov     ebp, esp                                ; 34B8 _ 89. E5
        push    edi                                     ; 34BA _ 57
        push    esi                                     ; 34BB _ 56
        push    ebx                                     ; 34BC _ 53
        sub     esp, 44                                 ; 34BD _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 34C0 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 34C3 _ 8B. 40, 18
        test    eax, eax                                ; 34C6 _ 85. C0
        js      ?_157                                   ; 34C8 _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 34CA _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 34CD _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 34D0 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 34D3 _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 34D6 _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 34D9 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 34DC _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 34DF _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 34E2 _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 34E5 _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 34E8 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 34EB _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 34EE _ 8B. 55, 14
        add     ecx, edx                                ; 34F1 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 34F3 _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 34F6 _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 34F9 _ 8B. 55, 10
        add     edx, edi                                ; 34FC _ 01. FA
        mov     dword [esp+14H], eax                    ; 34FE _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 3502 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3506 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 350A _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 350E _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 3512 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3515 _ 89. 04 24
        call    sheet_refresh_local                     ; 3518 _ E8, FFFFFFFC(rel)
?_157:  mov     eax, 0                                  ; 351D _ B8, 00000000
        add     esp, 44                                 ; 3522 _ 83. C4, 2C
        pop     ebx                                     ; 3525 _ 5B
        pop     esi                                     ; 3526 _ 5E
        pop     edi                                     ; 3527 _ 5F
        pop     ebp                                     ; 3528 _ 5D
        ret                                             ; 3529 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 352A _ 55
        mov     ebp, esp                                ; 352B _ 89. E5
        push    ebx                                     ; 352D _ 53
        sub     esp, 52                                 ; 352E _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 3531 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3534 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 3537 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 353A _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 353D _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 3540 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 3543 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3546 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 3549 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 354C _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 354F _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 3552 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3555 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3558 _ 8B. 40, 18
        test    eax, eax                                ; 355B _ 85. C0
        js      ?_158                                   ; 355D _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 3563 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 3566 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3569 _ 8B. 45, F4
        add     edx, eax                                ; 356C _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 356E _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 3571 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 3574 _ 8B. 45, F0
        add     eax, ecx                                ; 3577 _ 01. C8
        mov     dword [esp+14H], 0                      ; 3579 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 3581 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 3585 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3589 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 358C _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 3590 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 3593 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3597 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 359A _ 89. 04 24
        call    sheet_refresh_map                       ; 359D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 35A2 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 35A5 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 35A8 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 35AB _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 35AE _ 8B. 55, 14
        add     ecx, edx                                ; 35B1 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 35B3 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 35B6 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 35B9 _ 8B. 55, 10
        add     edx, ebx                                ; 35BC _ 01. DA
        mov     dword [esp+14H], eax                    ; 35BE _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 35C2 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 35C6 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 35CA _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 35CD _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 35D1 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 35D4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 35D8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 35DB _ 89. 04 24
        call    sheet_refresh_map                       ; 35DE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 35E3 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 35E6 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 35E9 _ 8B. 45, F4
        add     edx, eax                                ; 35EC _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 35EE _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 35F1 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 35F4 _ 8B. 45, F0
        add     eax, ecx                                ; 35F7 _ 01. C8
        mov     dword [esp+14H], 0                      ; 35F9 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 3601 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 3605 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3609 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 360C _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 3610 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 3613 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3617 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 361A _ 89. 04 24
        call    sheet_refresh_local                     ; 361D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3622 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3625 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 3628 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 362B _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 362E _ 8B. 55, 14
        add     ecx, edx                                ; 3631 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 3633 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 3636 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 3639 _ 8B. 55, 10
        add     edx, ebx                                ; 363C _ 01. DA
        mov     dword [esp+14H], eax                    ; 363E _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 3642 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 3646 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 364A _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 364D _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 3651 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 3654 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3658 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 365B _ 89. 04 24
        call    sheet_refresh_local                     ; 365E _ E8, FFFFFFFC(rel)
?_158:  add     esp, 52                                 ; 3663 _ 83. C4, 34
        pop     ebx                                     ; 3666 _ 5B
        pop     ebp                                     ; 3667 _ 5D
        ret                                             ; 3668 _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 3669 _ 55
        mov     ebp, esp                                ; 366A _ 89. E5
        sub     esp, 48                                 ; 366C _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 366F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3672 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 3674 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 3677 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 367A _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 367D _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 3680 _ 83. 7D, 0C, 00
        jns     ?_159                                   ; 3684 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 3686 _ C7. 45, 0C, 00000000
?_159:  cmp     dword [ebp+10H], 0                      ; 368D _ 83. 7D, 10, 00
        jns     ?_160                                   ; 3691 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 3693 _ C7. 45, 10, 00000000
?_160:  mov     eax, dword [ebp+8H]                     ; 369A _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 369D _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 36A0 _ 3B. 45, 14
        jge     ?_161                                   ; 36A3 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 36A5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 36A8 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 36AB _ 89. 45, 14
?_161:  mov     eax, dword [ebp+8H]                     ; 36AE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 36B1 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 36B4 _ 3B. 45, 18
        jge     ?_162                                   ; 36B7 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 36B9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 36BC _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 36BF _ 89. 45, 18
?_162:  mov     eax, dword [ebp+1CH]                    ; 36C2 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 36C5 _ 89. 45, DC
        jmp     ?_169                                   ; 36C8 _ E9, 00000119

?_163:  mov     eax, dword [ebp+8H]                     ; 36CD _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 36D0 _ 8B. 55, DC
        add     edx, 4                                  ; 36D3 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 36D6 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 36DA _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 36DD _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 36E0 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 36E2 _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 36E5 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 36E8 _ 8B. 45, 08
        add     eax, 1044                               ; 36EB _ 05, 00000414
        sub     edx, eax                                ; 36F0 _ 29. C2
        mov     eax, edx                                ; 36F2 _ 89. D0
        sar     eax, 5                                  ; 36F4 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 36F7 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 36FA _ C7. 45, E4, 00000000
        jmp     ?_168                                   ; 3701 _ E9, 000000CD

?_164:  mov     eax, dword [ebp-10H]                    ; 3706 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 3709 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 370C _ 8B. 45, E4
        add     eax, edx                                ; 370F _ 01. D0
        mov     dword [ebp-8H], eax                     ; 3711 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 3714 _ C7. 45, E0, 00000000
        jmp     ?_167                                   ; 371B _ E9, 000000A0

?_165:  mov     eax, dword [ebp-10H]                    ; 3720 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 3723 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 3726 _ 8B. 45, E0
        add     eax, edx                                ; 3729 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 372B _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 372E _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 3731 _ 3B. 45, FC
        jg      ?_166                                   ; 3734 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 373A _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 373D _ 3B. 45, 14
        jge     ?_166                                   ; 3740 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 3742 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 3745 _ 3B. 45, F8
        jg      ?_166                                   ; 3748 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 374A _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 374D _ 3B. 45, 18
        jge     ?_166                                   ; 3750 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 3752 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3755 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 3758 _ 0F AF. 45, E4
        mov     edx, eax                                ; 375C _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 375E _ 8B. 45, E0
        add     eax, edx                                ; 3761 _ 01. D0
        mov     edx, eax                                ; 3763 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3765 _ 8B. 45, F4
        add     eax, edx                                ; 3768 _ 01. D0
        movzx   eax, byte [eax]                         ; 376A _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 376D _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 3770 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 3774 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 3777 _ 8B. 40, 14
        cmp     edx, eax                                ; 377A _ 39. C2
        jz      ?_166                                   ; 377C _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 377E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3781 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 3784 _ 0F AF. 45, F8
        mov     edx, eax                                ; 3788 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 378A _ 8B. 45, FC
        add     eax, edx                                ; 378D _ 01. D0
        mov     edx, eax                                ; 378F _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 3791 _ 8B. 45, EC
        add     eax, edx                                ; 3794 _ 01. D0
        movzx   eax, byte [eax]                         ; 3796 _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 3799 _ 3A. 45, DA
        jnz     ?_166                                   ; 379C _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 379E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 37A1 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 37A4 _ 0F AF. 45, F8
        mov     edx, eax                                ; 37A8 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 37AA _ 8B. 45, FC
        add     eax, edx                                ; 37AD _ 01. D0
        mov     edx, eax                                ; 37AF _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 37B1 _ 8B. 45, E8
        add     edx, eax                                ; 37B4 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 37B6 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 37BA _ 88. 02
?_166:  add     dword [ebp-20H], 1                      ; 37BC _ 83. 45, E0, 01
?_167:  mov     eax, dword [ebp-10H]                    ; 37C0 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 37C3 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 37C6 _ 3B. 45, E0
        jg      ?_165                                   ; 37C9 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 37CF _ 83. 45, E4, 01
?_168:  mov     eax, dword [ebp-10H]                    ; 37D3 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 37D6 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 37D9 _ 3B. 45, E4
        jg      ?_164                                   ; 37DC _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 37E2 _ 83. 45, DC, 01
?_169:  mov     eax, dword [ebp+8H]                     ; 37E6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 37E9 _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 37EC _ 3B. 45, DC
        jge     ?_163                                   ; 37EF _ 0F 8D, FFFFFED8
        leave                                           ; 37F5 _ C9
        ret                                             ; 37F6 _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 37F7 _ 55
        mov     ebp, esp                                ; 37F8 _ 89. E5
        sub     esp, 64                                 ; 37FA _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 37FD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3800 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 3802 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 3805 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3808 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 380B _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 380E _ 83. 7D, 0C, 00
        jns     ?_170                                   ; 3812 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 3814 _ C7. 45, 0C, 00000000
?_170:  cmp     dword [ebp+10H], 0                      ; 381B _ 83. 7D, 10, 00
        jns     ?_171                                   ; 381F _ 79, 07
        mov     dword [ebp+10H], 0                      ; 3821 _ C7. 45, 10, 00000000
?_171:  mov     eax, dword [ebp+8H]                     ; 3828 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 382B _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 382E _ 3B. 45, 14
        jge     ?_172                                   ; 3831 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3833 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3836 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 3839 _ 89. 45, 14
?_172:  mov     eax, dword [ebp+8H]                     ; 383C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 383F _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 3842 _ 3B. 45, 18
        jge     ?_173                                   ; 3845 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3847 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 384A _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 384D _ 89. 45, 18
?_173:  mov     eax, dword [ebp+1CH]                    ; 3850 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 3853 _ 89. 45, CC
        jmp     ?_184                                   ; 3856 _ E9, 00000141

?_174:  mov     eax, dword [ebp+8H]                     ; 385B _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 385E _ 8B. 55, CC
        add     edx, 4                                  ; 3861 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3864 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 3868 _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 386B _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 386E _ 8B. 45, 08
        add     eax, 1044                               ; 3871 _ 05, 00000414
        sub     edx, eax                                ; 3876 _ 29. C2
        mov     eax, edx                                ; 3878 _ 89. D0
        sar     eax, 5                                  ; 387A _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 387D _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 3880 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 3883 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 3885 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 3888 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 388B _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 388E _ 8B. 55, 0C
        sub     edx, eax                                ; 3891 _ 29. C2
        mov     eax, edx                                ; 3893 _ 89. D0
        mov     dword [ebp-30H], eax                    ; 3895 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 3898 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 389B _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 389E _ 8B. 55, 10
        sub     edx, eax                                ; 38A1 _ 29. C2
        mov     eax, edx                                ; 38A3 _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 38A5 _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 38A8 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 38AB _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 38AE _ 8B. 55, 14
        sub     edx, eax                                ; 38B1 _ 29. C2
        mov     eax, edx                                ; 38B3 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 38B5 _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 38B8 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 38BB _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 38BE _ 8B. 55, 18
        sub     edx, eax                                ; 38C1 _ 29. C2
        mov     eax, edx                                ; 38C3 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 38C5 _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 38C8 _ 83. 7D, D0, 00
        jns     ?_175                                   ; 38CC _ 79, 07
        mov     dword [ebp-30H], 0                      ; 38CE _ C7. 45, D0, 00000000
?_175:  cmp     dword [ebp-2CH], 0                      ; 38D5 _ 83. 7D, D4, 00
        jns     ?_176                                   ; 38D9 _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 38DB _ C7. 45, D4, 00000000
?_176:  mov     eax, dword [ebp-10H]                    ; 38E2 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 38E5 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 38E8 _ 3B. 45, D8
        jge     ?_177                                   ; 38EB _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 38ED _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 38F0 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 38F3 _ 89. 45, D8
?_177:  mov     eax, dword [ebp-10H]                    ; 38F6 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 38F9 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 38FC _ 3B. 45, DC
        jge     ?_178                                   ; 38FF _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 3901 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 3904 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 3907 _ 89. 45, DC
?_178:  mov     eax, dword [ebp-2CH]                    ; 390A _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 390D _ 89. 45, E4
        jmp     ?_183                                   ; 3910 _ EB, 7A

?_179:  mov     eax, dword [ebp-10H]                    ; 3912 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 3915 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 3918 _ 8B. 45, E4
        add     eax, edx                                ; 391B _ 01. D0
        mov     dword [ebp-8H], eax                     ; 391D _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 3920 _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 3923 _ 89. 45, E0
        jmp     ?_182                                   ; 3926 _ EB, 58

?_180:  mov     eax, dword [ebp-10H]                    ; 3928 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 392B _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 392E _ 8B. 45, E0
        add     eax, edx                                ; 3931 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 3933 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 3936 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3939 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 393C _ 0F AF. 45, E4
        mov     edx, eax                                ; 3940 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 3942 _ 8B. 45, E0
        add     eax, edx                                ; 3945 _ 01. D0
        mov     edx, eax                                ; 3947 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3949 _ 8B. 45, F4
        add     eax, edx                                ; 394C _ 01. D0
        movzx   eax, byte [eax]                         ; 394E _ 0F B6. 00
        movzx   edx, al                                 ; 3951 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 3954 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 3957 _ 8B. 40, 14
        cmp     edx, eax                                ; 395A _ 39. C2
        jz      ?_181                                   ; 395C _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 395E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3961 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 3964 _ 0F AF. 45, F8
        mov     edx, eax                                ; 3968 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 396A _ 8B. 45, FC
        add     eax, edx                                ; 396D _ 01. D0
        mov     edx, eax                                ; 396F _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 3971 _ 8B. 45, EC
        add     edx, eax                                ; 3974 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 3976 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 397A _ 88. 02
?_181:  add     dword [ebp-20H], 1                      ; 397C _ 83. 45, E0, 01
?_182:  mov     eax, dword [ebp-20H]                    ; 3980 _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 3983 _ 3B. 45, D8
        jl      ?_180                                   ; 3986 _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 3988 _ 83. 45, E4, 01
?_183:  mov     eax, dword [ebp-1CH]                    ; 398C _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 398F _ 3B. 45, DC
        jl      ?_179                                   ; 3992 _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 3998 _ 83. 45, CC, 01
?_184:  mov     eax, dword [ebp+8H]                     ; 399C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 399F _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 39A2 _ 3B. 45, CC
        jge     ?_174                                   ; 39A5 _ 0F 8D, FFFFFEB0
        leave                                           ; 39AB _ C9
        ret                                             ; 39AC _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 39AD _ 55
        mov     ebp, esp                                ; 39AE _ 89. E5
        sub     esp, 40                                 ; 39B0 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 39B3 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 39BB _ C7. 04 24, 00000043
        call    io_out8                                 ; 39C2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 39C7 _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 39CF _ C7. 04 24, 00000040
        call    io_out8                                 ; 39D6 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 39DB _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 39E3 _ C7. 04 24, 00000040
        call    io_out8                                 ; 39EA _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 39EF _ C7. 05, 000002E0(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 39F9 _ C7. 45, F4, 00000000
        jmp     ?_186                                   ; 3A00 _ EB, 28

?_185:  mov     eax, dword [ebp-0CH]                    ; 3A02 _ 8B. 45, F4
        shl     eax, 4                                  ; 3A05 _ C1. E0, 04
        add     eax, timer_control                      ; 3A08 _ 05, 000002E0(d)
        mov     dword [eax+8H], 0                       ; 3A0D _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 3A14 _ 8B. 45, F4
        shl     eax, 4                                  ; 3A17 _ C1. E0, 04
        add     eax, timer_control                      ; 3A1A _ 05, 000002E0(d)
        mov     dword [eax+0CH], 0                      ; 3A1F _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 3A26 _ 83. 45, F4, 01
?_186:  cmp     dword [ebp-0CH], 499                    ; 3A2A _ 81. 7D, F4, 000001F3
        jle     ?_185                                   ; 3A31 _ 7E, CF
        leave                                           ; 3A33 _ C9
        ret                                             ; 3A34 _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 3A35 _ 55
        mov     ebp, esp                                ; 3A36 _ 89. E5
        mov     eax, timer_control                      ; 3A38 _ B8, 000002E0(d)
        pop     ebp                                     ; 3A3D _ 5D
        ret                                             ; 3A3E _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 3A3F _ 55
        mov     ebp, esp                                ; 3A40 _ 89. E5
        sub     esp, 16                                 ; 3A42 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3A45 _ C7. 45, FC, 00000000
        jmp     ?_189                                   ; 3A4C _ EB, 26

?_187:  mov     eax, dword [ebp-4H]                     ; 3A4E _ 8B. 45, FC
        shl     eax, 4                                  ; 3A51 _ C1. E0, 04
        add     eax, timer_control                      ; 3A54 _ 05, 000002E0(d)
        mov     eax, dword [eax+8H]                     ; 3A59 _ 8B. 40, 08
        test    eax, eax                                ; 3A5C _ 85. C0
        jnz     ?_188                                   ; 3A5E _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 3A60 _ 8B. 45, FC
        shl     eax, 4                                  ; 3A63 _ C1. E0, 04
        add     eax, timer_control                      ; 3A66 _ 05, 000002E0(d)
        add     eax, 4                                  ; 3A6B _ 83. C0, 04
        jmp     ?_190                                   ; 3A6E _ EB, 0D

?_188:  add     dword [ebp-4H], 1                       ; 3A70 _ 83. 45, FC, 01
?_189:  cmp     dword [ebp-4H], 499                     ; 3A74 _ 81. 7D, FC, 000001F3
        jle     ?_187                                   ; 3A7B _ 7E, D1
?_190:  leave                                           ; 3A7D _ C9
        ret                                             ; 3A7E _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 3A7F _ 55
        mov     ebp, esp                                ; 3A80 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3A82 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3A85 _ C7. 40, 04, 00000000
        pop     ebp                                     ; 3A8C _ 5D
        ret                                             ; 3A8D _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 3A8E _ 55
        mov     ebp, esp                                ; 3A8F _ 89. E5
        sub     esp, 4                                  ; 3A91 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 3A94 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 3A97 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3A9A _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3A9D _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 3AA0 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3AA3 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3AA6 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 3AAA _ 88. 50, 0C
        leave                                           ; 3AAD _ C9
        ret                                             ; 3AAE _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 3AAF _ 55
        mov     ebp, esp                                ; 3AB0 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3AB2 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3AB5 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3AB8 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3ABA _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 3ABD _ C7. 40, 04, 00000002
        pop     ebp                                     ; 3AC4 _ 5D
        ret                                             ; 3AC5 _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 3AC6 _ 55
        mov     ebp, esp                                ; 3AC7 _ 89. E5
        sub     esp, 40                                 ; 3AC9 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 3ACC _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 3AD4 _ C7. 04 24, 00000020
        call    io_out8                                 ; 3ADB _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 3AE0 _ A1, 000002E0(d)
        add     eax, 1                                  ; 3AE5 _ 83. C0, 01
        mov     dword [timer_control], eax              ; 3AE8 _ A3, 000002E0(d)
        mov     byte [ebp-0DH], 0                       ; 3AED _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 3AF1 _ C7. 45, F4, 00000000
        jmp     ?_194                                   ; 3AF8 _ E9, 000000B0

?_191:  mov     eax, dword [ebp-0CH]                    ; 3AFD _ 8B. 45, F4
        shl     eax, 4                                  ; 3B00 _ C1. E0, 04
        add     eax, timer_control                      ; 3B03 _ 05, 000002E0(d)
        mov     eax, dword [eax+8H]                     ; 3B08 _ 8B. 40, 08
        cmp     eax, 2                                  ; 3B0B _ 83. F8, 02
        jne     ?_192                                   ; 3B0E _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 3B14 _ 8B. 45, F4
        shl     eax, 4                                  ; 3B17 _ C1. E0, 04
        add     eax, timer_control                      ; 3B1A _ 05, 000002E0(d)
        mov     eax, dword [eax+4H]                     ; 3B1F _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 3B22 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 3B25 _ 8B. 45, F4
        shl     eax, 4                                  ; 3B28 _ C1. E0, 04
        add     eax, timer_control                      ; 3B2B _ 05, 000002E0(d)
        mov     dword [eax+4H], edx                     ; 3B30 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3B33 _ 8B. 45, F4
        shl     eax, 4                                  ; 3B36 _ C1. E0, 04
        add     eax, timer_control                      ; 3B39 _ 05, 000002E0(d)
        mov     eax, dword [eax+4H]                     ; 3B3E _ 8B. 40, 04
        test    eax, eax                                ; 3B41 _ 85. C0
        jnz     ?_192                                   ; 3B43 _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 3B45 _ 8B. 45, F4
        shl     eax, 4                                  ; 3B48 _ C1. E0, 04
        add     eax, timer_control                      ; 3B4B _ 05, 000002E0(d)
        mov     dword [eax+8H], 1                       ; 3B50 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 3B57 _ 8B. 45, F4
        shl     eax, 4                                  ; 3B5A _ C1. E0, 04
        add     eax, timer_control                      ; 3B5D _ 05, 000002E0(d)
        movzx   eax, byte [eax+10H]                     ; 3B62 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 3B66 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 3B69 _ 8B. 45, F4
        shl     eax, 4                                  ; 3B6C _ C1. E0, 04
        add     eax, timer_control                      ; 3B6F _ 05, 000002E0(d)
        mov     eax, dword [eax+0CH]                    ; 3B74 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 3B77 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3B7B _ 89. 04 24
        call    fifo8_put                               ; 3B7E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3B83 _ 8B. 45, F4
        shl     eax, 4                                  ; 3B86 _ C1. E0, 04
        add     eax, timer_control                      ; 3B89 _ 05, 000002E0(d)
        lea     edx, [eax+4H]                           ; 3B8E _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 3B91 _ A1, 00000000(d)
        cmp     edx, eax                                ; 3B96 _ 39. C2
        jnz     ?_192                                   ; 3B98 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 3B9A _ C6. 45, F3, 01
?_192:  cmp     byte [ebp-0DH], 0                       ; 3B9E _ 80. 7D, F3, 00
        jz      ?_193                                   ; 3BA2 _ 74, 05
        call    task_switch                             ; 3BA4 _ E8, FFFFFFFC(rel)
?_193:  add     dword [ebp-0CH], 1                      ; 3BA9 _ 83. 45, F4, 01
?_194:  cmp     dword [ebp-0CH], 499                    ; 3BAD _ 81. 7D, F4, 000001F3
        jle     ?_191                                   ; 3BB4 _ 0F 8E, FFFFFF43
        leave                                           ; 3BBA _ C9
        ret                                             ; 3BBB _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 3BBC _ 55
        mov     ebp, esp                                ; 3BBD _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 3BBF _ 81. 7D, 0C, 000FFFFF
        jbe     ?_195                                   ; 3BC6 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 3BC8 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 3BCF _ 8B. 45, 0C
        shr     eax, 12                                 ; 3BD2 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 3BD5 _ 89. 45, 0C
?_195:  mov     eax, dword [ebp+0CH]                    ; 3BD8 _ 8B. 45, 0C
        mov     edx, eax                                ; 3BDB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3BDD _ 8B. 45, 08
        mov     word [eax], dx                          ; 3BE0 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 3BE3 _ 8B. 45, 10
        mov     edx, eax                                ; 3BE6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3BE8 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 3BEB _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 3BEF _ 8B. 45, 10
        sar     eax, 16                                 ; 3BF2 _ C1. F8, 10
        mov     edx, eax                                ; 3BF5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3BF7 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 3BFA _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 3BFD _ 8B. 45, 14
        mov     edx, eax                                ; 3C00 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3C02 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 3C05 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 3C08 _ 8B. 45, 0C
        shr     eax, 16                                 ; 3C0B _ C1. E8, 10
        and     eax, 0FH                                ; 3C0E _ 83. E0, 0F
        mov     edx, eax                                ; 3C11 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 3C13 _ 8B. 45, 14
        sar     eax, 8                                  ; 3C16 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 3C19 _ 83. E0, F0
        or      eax, edx                                ; 3C1C _ 09. D0
        mov     edx, eax                                ; 3C1E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3C20 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 3C23 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 3C26 _ 8B. 45, 10
        shr     eax, 24                                 ; 3C29 _ C1. E8, 18
        mov     edx, eax                                ; 3C2C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3C2E _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 3C31 _ 88. 50, 07
        pop     ebp                                     ; 3C34 _ 5D
        ret                                             ; 3C35 _ C3
; segment_descriptor End of function

init_task_level:; Function begin
        push    ebp                                     ; 3C36 _ 55
        mov     ebp, esp                                ; 3C37 _ 89. E5
        sub     esp, 16                                 ; 3C39 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 3C3C _ 8B. 0D, 00002228(d)
        mov     edx, dword [ebp+8H]                     ; 3C42 _ 8B. 55, 08
        mov     eax, edx                                ; 3C45 _ 89. D0
        shl     eax, 2                                  ; 3C47 _ C1. E0, 02
        add     eax, edx                                ; 3C4A _ 01. D0
        shl     eax, 2                                  ; 3C4C _ C1. E0, 02
        add     eax, ecx                                ; 3C4F _ 01. C8
        add     eax, 8                                  ; 3C51 _ 83. C0, 08
        mov     dword [eax], 0                          ; 3C54 _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 3C5A _ 8B. 0D, 00002228(d)
        mov     edx, dword [ebp+8H]                     ; 3C60 _ 8B. 55, 08
        mov     eax, edx                                ; 3C63 _ 89. D0
        shl     eax, 2                                  ; 3C65 _ C1. E0, 02
        add     eax, edx                                ; 3C68 _ 01. D0
        shl     eax, 2                                  ; 3C6A _ C1. E0, 02
        add     eax, ecx                                ; 3C6D _ 01. C8
        add     eax, 12                                 ; 3C6F _ 83. C0, 0C
        mov     dword [eax], 0                          ; 3C72 _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 3C78 _ C7. 45, FC, 00000000
        jmp     ?_197                                   ; 3C7F _ EB, 21

?_196:  mov     ecx, dword [task_control]               ; 3C81 _ 8B. 0D, 00002228(d)
        mov     edx, dword [ebp-4H]                     ; 3C87 _ 8B. 55, FC
        mov     eax, edx                                ; 3C8A _ 89. D0
        add     eax, eax                                ; 3C8C _ 01. C0
        add     eax, edx                                ; 3C8E _ 01. D0
        shl     eax, 3                                  ; 3C90 _ C1. E0, 03
        add     eax, ecx                                ; 3C93 _ 01. C8
        add     eax, 16                                 ; 3C95 _ 83. C0, 10
        mov     dword [eax], 0                          ; 3C98 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 3C9E _ 83. 45, FC, 01
?_197:  cmp     dword [ebp-4H], 2                       ; 3CA2 _ 83. 7D, FC, 02
        jle     ?_196                                   ; 3CA6 _ 7E, D9
        leave                                           ; 3CA8 _ C9
        ret                                             ; 3CA9 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 3CAA _ 55
        mov     ebp, esp                                ; 3CAB _ 89. E5
        sub     esp, 40                                 ; 3CAD _ 83. EC, 28
        call    get_addr_gdt                            ; 3CB0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3CB5 _ 89. 45, F0
        mov     dword [esp+4H], 668                     ; 3CB8 _ C7. 44 24, 04, 0000029C
        mov     eax, dword [ebp+8H]                     ; 3CC0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3CC3 _ 89. 04 24
        call    memman_alloc_4k                         ; 3CC6 _ E8, FFFFFFFC(rel)
        mov     dword [task_control], eax               ; 3CCB _ A3, 00002228(d)
        mov     dword [ebp-14H], 0                      ; 3CD0 _ C7. 45, EC, 00000000
        jmp     ?_199                                   ; 3CD7 _ E9, 00000085

?_198:  mov     edx, dword [task_control]               ; 3CDC _ 8B. 15, 00002228(d)
        mov     eax, dword [ebp-14H]                    ; 3CE2 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 3CE5 _ 69. C0, 00000094
        add     eax, edx                                ; 3CEB _ 01. D0
        add     eax, 72                                 ; 3CED _ 83. C0, 48
        mov     dword [eax], 0                          ; 3CF0 _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 3CF6 _ 8B. 0D, 00002228(d)
        mov     eax, dword [ebp-14H]                    ; 3CFC _ 8B. 45, EC
        add     eax, 8                                  ; 3CFF _ 83. C0, 08
        lea     edx, [eax*8]                            ; 3D02 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 3D09 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 3D0C _ 69. C0, 00000094
        add     eax, ecx                                ; 3D12 _ 01. C8
        add     eax, 68                                 ; 3D14 _ 83. C0, 44
        mov     dword [eax], edx                        ; 3D17 _ 89. 10
        mov     eax, dword [task_control]               ; 3D19 _ A1, 00002228(d)
        mov     edx, dword [ebp-14H]                    ; 3D1E _ 8B. 55, EC
        imul    edx, edx, 148                           ; 3D21 _ 69. D2, 00000094
        add     edx, 96                                 ; 3D27 _ 83. C2, 60
        add     eax, edx                                ; 3D2A _ 01. D0
        add     eax, 16                                 ; 3D2C _ 83. C0, 10
        mov     edx, dword [ebp-14H]                    ; 3D2F _ 8B. 55, EC
        add     edx, 8                                  ; 3D32 _ 83. C2, 08
        lea     ecx, [edx*8]                            ; 3D35 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 3D3C _ 8B. 55, F0
        add     edx, ecx                                ; 3D3F _ 01. CA
        mov     dword [esp+0CH], 137                    ; 3D41 _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 3D49 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 3D4D _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 3D55 _ 89. 14 24
        call    segment_descriptor                      ; 3D58 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 3D5D _ 83. 45, EC, 01
?_199:  cmp     dword [ebp-14H], 4                      ; 3D61 _ 83. 7D, EC, 04
        jle     ?_198                                   ; 3D65 _ 0F 8E, FFFFFF71
        mov     dword [ebp-14H], 0                      ; 3D6B _ C7. 45, EC, 00000000
        jmp     ?_201                                   ; 3D72 _ EB, 0F

?_200:  mov     eax, dword [ebp-14H]                    ; 3D74 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 3D77 _ 89. 04 24
        call    init_task_level                         ; 3D7A _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 3D7F _ 83. 45, EC, 01
?_201:  cmp     dword [ebp-14H], 2                      ; 3D83 _ 83. 7D, EC, 02
        jle     ?_200                                   ; 3D87 _ 7E, EB
        call    task_alloc                              ; 3D89 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3D8E _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 3D91 _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 3D94 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 3D9B _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 3D9E _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 3DA5 _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 3DA8 _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 3DAF _ 8B. 45, F4
        mov     dword [esp], eax                        ; 3DB2 _ 89. 04 24
        call    task_add                                ; 3DB5 _ E8, FFFFFFFC(rel)
        call    task_switch_sub                         ; 3DBA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3DBF _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 3DC2 _ 8B. 00
        mov     dword [esp], eax                        ; 3DC4 _ 89. 04 24
        call    load_tr                                 ; 3DC7 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 3DCC _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 3DD1 _ A3, 00002224(d)
        mov     eax, dword [ebp-0CH]                    ; 3DD6 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 3DD9 _ 8B. 40, 08
        mov     edx, eax                                ; 3DDC _ 89. C2
        mov     eax, dword [task_timer]                 ; 3DDE _ A1, 00002224(d)
        mov     dword [esp+4H], edx                     ; 3DE3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3DE7 _ 89. 04 24
        call    timer_settime                           ; 3DEA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3DEF _ 8B. 45, F4
        leave                                           ; 3DF2 _ C9
        ret                                             ; 3DF3 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 3DF4 _ 55
        mov     ebp, esp                                ; 3DF5 _ 89. E5
        sub     esp, 16                                 ; 3DF7 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3DFA _ C7. 45, F8, 00000000
        jmp     ?_204                                   ; 3E01 _ E9, 000000F6

?_202:  mov     edx, dword [task_control]               ; 3E06 _ 8B. 15, 00002228(d)
        mov     eax, dword [ebp-8H]                     ; 3E0C _ 8B. 45, F8
        imul    eax, eax, 148                           ; 3E0F _ 69. C0, 00000094
        add     eax, edx                                ; 3E15 _ 01. D0
        add     eax, 72                                 ; 3E17 _ 83. C0, 48
        mov     eax, dword [eax]                        ; 3E1A _ 8B. 00
        test    eax, eax                                ; 3E1C _ 85. C0
        jne     ?_203                                   ; 3E1E _ 0F 85, 000000D4
        mov     eax, dword [task_control]               ; 3E24 _ A1, 00002228(d)
        mov     edx, dword [ebp-8H]                     ; 3E29 _ 8B. 55, F8
        imul    edx, edx, 148                           ; 3E2C _ 69. D2, 00000094
        add     edx, 64                                 ; 3E32 _ 83. C2, 40
        add     eax, edx                                ; 3E35 _ 01. D0
        add     eax, 4                                  ; 3E37 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 3E3A _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3E3D _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 3E40 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 3E47 _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 3E4A _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 3E51 _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 3E54 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 3E5B _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 3E5E _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 3E65 _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 3E68 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 3E6F _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 3E72 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-8H]                     ; 3E79 _ 8B. 45, F8
        add     eax, 1                                  ; 3E7C _ 83. C0, 01
        shl     eax, 9                                  ; 3E7F _ C1. E0, 09
        mov     edx, eax                                ; 3E82 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3E84 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 3E87 _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 3E8A _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 3E8D _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-4H]                     ; 3E94 _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 3E97 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 3E9E _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 3EA1 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 3EA8 _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 3EAB _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 3EB2 _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 3EB5 _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 3EBF _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 3EC2 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 3ECC _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 3ECF _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 3ED9 _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 3EDC _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 3EE6 _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 3EE9 _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 3EF3 _ 8B. 45, FC
        jmp     ?_205                                   ; 3EF6 _ EB, 13

?_203:  add     dword [ebp-8H], 1                       ; 3EF8 _ 83. 45, F8, 01
?_204:  cmp     dword [ebp-8H], 4                       ; 3EFC _ 83. 7D, F8, 04
        jle     ?_202                                   ; 3F00 _ 0F 8E, FFFFFF00
        mov     eax, 0                                  ; 3F06 _ B8, 00000000
?_205:  leave                                           ; 3F0B _ C9
        ret                                             ; 3F0C _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 3F0D _ 55
        mov     ebp, esp                                ; 3F0E _ 89. E5
        sub     esp, 24                                 ; 3F10 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 3F13 _ 83. 7D, 0C, 00
        jns     ?_206                                   ; 3F17 _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 3F19 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3F1C _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 3F1F _ 89. 45, 0C
?_206:  cmp     dword [ebp+10H], 0                      ; 3F22 _ 83. 7D, 10, 00
        jle     ?_207                                   ; 3F26 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 3F28 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3F2B _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 3F2E _ 89. 50, 08
?_207:  mov     eax, dword [ebp+8H]                     ; 3F31 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3F34 _ 8B. 40, 04
        cmp     eax, 2                                  ; 3F37 _ 83. F8, 02
        jnz     ?_208                                   ; 3F3A _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 3F3C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3F3F _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 3F42 _ 3B. 45, 0C
        jz      ?_208                                   ; 3F45 _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 3F47 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3F4A _ 89. 04 24
        call    task_remove                             ; 3F4D _ E8, FFFFFFFC(rel)
?_208:  mov     eax, dword [ebp+8H]                     ; 3F52 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3F55 _ 8B. 40, 04
        cmp     eax, 2                                  ; 3F58 _ 83. F8, 02
        jz      ?_209                                   ; 3F5B _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 3F5D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3F60 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 3F63 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3F66 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3F69 _ 89. 04 24
        call    task_add                                ; 3F6C _ E8, FFFFFFFC(rel)
?_209:  mov     eax, dword [task_control]               ; 3F71 _ A1, 00002228(d)
        mov     dword [eax+4H], 1                       ; 3F76 _ C7. 40, 04, 00000001
        leave                                           ; 3F7D _ C9
        ret                                             ; 3F7E _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 3F7F _ 55
        mov     ebp, esp                                ; 3F80 _ 89. E5
        sub     esp, 40                                 ; 3F82 _ 83. EC, 28
        mov     ecx, dword [task_control]               ; 3F85 _ 8B. 0D, 00002228(d)
        mov     eax, dword [task_control]               ; 3F8B _ A1, 00002228(d)
        mov     edx, dword [eax]                        ; 3F90 _ 8B. 10
        mov     eax, edx                                ; 3F92 _ 89. D0
        shl     eax, 2                                  ; 3F94 _ C1. E0, 02
        add     eax, edx                                ; 3F97 _ 01. D0
        shl     eax, 2                                  ; 3F99 _ C1. E0, 02
        add     eax, ecx                                ; 3F9C _ 01. C8
        add     eax, 8                                  ; 3F9E _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 3FA1 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 3FA4 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 3FA7 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 3FAA _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 3FAD _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 3FB1 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 3FB4 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 3FB7 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 3FBA _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 3FBD _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 3FC0 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 3FC3 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 3FC6 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 3FC9 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 3FCC _ 8B. 00
        cmp     edx, eax                                ; 3FCE _ 39. C2
        jnz     ?_210                                   ; 3FD0 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 3FD2 _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 3FD5 _ C7. 40, 04, 00000000
?_210:  mov     eax, dword [task_control]               ; 3FDC _ A1, 00002228(d)
        mov     eax, dword [eax+4H]                     ; 3FE1 _ 8B. 40, 04
        test    eax, eax                                ; 3FE4 _ 85. C0
        jz      ?_211                                   ; 3FE6 _ 74, 24
        call    task_switch_sub                         ; 3FE8 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [task_control]               ; 3FED _ 8B. 0D, 00002228(d)
        mov     eax, dword [task_control]               ; 3FF3 _ A1, 00002228(d)
        mov     edx, dword [eax]                        ; 3FF8 _ 8B. 10
        mov     eax, edx                                ; 3FFA _ 89. D0
        shl     eax, 2                                  ; 3FFC _ C1. E0, 02
        add     eax, edx                                ; 3FFF _ 01. D0
        shl     eax, 2                                  ; 4001 _ C1. E0, 02
        add     eax, ecx                                ; 4004 _ 01. C8
        add     eax, 8                                  ; 4006 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 4009 _ 89. 45, EC
?_211:  mov     eax, dword [ebp-14H]                    ; 400C _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 400F _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 4012 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 4015 _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 4019 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 401C _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 401F _ 8B. 40, 08
        mov     edx, eax                                ; 4022 _ 89. C2
        mov     eax, dword [task_timer]                 ; 4024 _ A1, 00002224(d)
        mov     dword [esp+4H], edx                     ; 4029 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 402D _ 89. 04 24
        call    timer_settime                           ; 4030 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 4035 _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 4038 _ 3B. 45, F0
        jz      ?_212                                   ; 403B _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 403D _ 83. 7D, F4, 00
        jz      ?_212                                   ; 4041 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 4043 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 4046 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 4048 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 404C _ C7. 04 24, 00000000
        call    farjmp                                  ; 4053 _ E8, FFFFFFFC(rel)
?_212:  leave                                           ; 4058 _ C9
        ret                                             ; 4059 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 405A _ 55
        mov     ebp, esp                                ; 405B _ 89. E5
        sub     esp, 40                                 ; 405D _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 4060 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 4067 _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 406E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 4071 _ 8B. 40, 04
        cmp     eax, 2                                  ; 4074 _ 83. F8, 02
        jnz     ?_213                                   ; 4077 _ 75, 51
        call    task_now                                ; 4079 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 407E _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 4081 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 4084 _ 89. 04 24
        call    task_remove                             ; 4087 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 408C _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 4093 _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 4096 _ 3B. 45, F4
        jnz     ?_213                                   ; 4099 _ 75, 2F
        call    task_switch_sub                         ; 409B _ E8, FFFFFFFC(rel)
        call    task_now                                ; 40A0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 40A5 _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 40A8 _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 40AF _ 83. 7D, F4, 00
        jz      ?_213                                   ; 40B3 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 40B5 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 40B8 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 40BA _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 40BE _ C7. 04 24, 00000000
        call    farjmp                                  ; 40C5 _ E8, FFFFFFFC(rel)
?_213:  mov     eax, dword [ebp-10H]                    ; 40CA _ 8B. 45, F0
        leave                                           ; 40CD _ C9
        ret                                             ; 40CE _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 40CF _ 55
        mov     ebp, esp                                ; 40D0 _ 89. E5
        sub     esp, 16                                 ; 40D2 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 40D5 _ 8B. 0D, 00002228(d)
        mov     eax, dword [task_control]               ; 40DB _ A1, 00002228(d)
        mov     edx, dword [eax]                        ; 40E0 _ 8B. 10
        mov     eax, edx                                ; 40E2 _ 89. D0
        shl     eax, 2                                  ; 40E4 _ C1. E0, 02
        add     eax, edx                                ; 40E7 _ 01. D0
        shl     eax, 2                                  ; 40E9 _ C1. E0, 02
        add     eax, ecx                                ; 40EC _ 01. C8
        add     eax, 8                                  ; 40EE _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 40F1 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 40F4 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 40F7 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 40FA _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 40FD _ 8B. 44 90, 08
        leave                                           ; 4101 _ C9
        ret                                             ; 4102 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 4103 _ 55
        mov     ebp, esp                                ; 4104 _ 89. E5
        sub     esp, 16                                 ; 4106 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4109 _ 8B. 0D, 00002228(d)
        mov     eax, dword [ebp+8H]                     ; 410F _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4112 _ 8B. 50, 0C
        mov     eax, edx                                ; 4115 _ 89. D0
        shl     eax, 2                                  ; 4117 _ C1. E0, 02
        add     eax, edx                                ; 411A _ 01. D0
        shl     eax, 2                                  ; 411C _ C1. E0, 02
        add     eax, ecx                                ; 411F _ 01. C8
        add     eax, 8                                  ; 4121 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4124 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4127 _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 412A _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 412C _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 412F _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 4132 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4136 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4139 _ 8B. 00
        lea     edx, [eax+1H]                           ; 413B _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 413E _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4141 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4143 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4146 _ C7. 40, 04, 00000002
        leave                                           ; 414D _ C9
        ret                                             ; 414E _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 414F _ 55
        mov     ebp, esp                                ; 4150 _ 89. E5
        sub     esp, 16                                 ; 4152 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4155 _ 8B. 0D, 00002228(d)
        mov     eax, dword [ebp+8H]                     ; 415B _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 415E _ 8B. 50, 0C
        mov     eax, edx                                ; 4161 _ 89. D0
        shl     eax, 2                                  ; 4163 _ C1. E0, 02
        add     eax, edx                                ; 4166 _ 01. D0
        shl     eax, 2                                  ; 4168 _ C1. E0, 02
        add     eax, ecx                                ; 416B _ 01. C8
        add     eax, 8                                  ; 416D _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4170 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 4173 _ C7. 45, F8, 00000000
        jmp     ?_216                                   ; 417A _ EB, 23

?_214:  mov     eax, dword [ebp-4H]                     ; 417C _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 417F _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 4182 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 4186 _ 3B. 45, 08
        jnz     ?_215                                   ; 4189 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 418B _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 418E _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 4191 _ C7. 44 90, 08, 00000000
        jmp     ?_217                                   ; 4199 _ EB, 0E

?_215:  add     dword [ebp-8H], 1                       ; 419B _ 83. 45, F8, 01
?_216:  mov     eax, dword [ebp-4H]                     ; 419F _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 41A2 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 41A4 _ 3B. 45, F8
        jg      ?_214                                   ; 41A7 _ 7F, D3
?_217:  mov     eax, dword [ebp-4H]                     ; 41A9 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 41AC _ 8B. 00
        lea     edx, [eax-1H]                           ; 41AE _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 41B1 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 41B4 _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 41B6 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 41B9 _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 41BC _ 3B. 45, F8
        jle     ?_218                                   ; 41BF _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 41C1 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 41C4 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 41C7 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 41CA _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 41CD _ 89. 50, 04
?_218:  mov     eax, dword [ebp-4H]                     ; 41D0 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 41D3 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 41D6 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 41D9 _ 8B. 00
        cmp     edx, eax                                ; 41DB _ 39. C2
        jl      ?_219                                   ; 41DD _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 41DF _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 41E2 _ C7. 40, 04, 00000000
?_219:  mov     eax, dword [ebp+8H]                     ; 41E9 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 41EC _ C7. 40, 04, 00000001
        jmp     ?_221                                   ; 41F3 _ EB, 1B

?_220:  mov     eax, dword [ebp-8H]                     ; 41F5 _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 41F8 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 41FB _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 41FE _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4202 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4205 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 4208 _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 420C _ 83. 45, F8, 01
?_221:  mov     eax, dword [ebp-4H]                     ; 4210 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4213 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4215 _ 3B. 45, F8
        jg      ?_220                                   ; 4218 _ 7F, DB
        leave                                           ; 421A _ C9
        ret                                             ; 421B _ C3
; task_remove End of function

task_switch_sub:; Function begin
        push    ebp                                     ; 421C _ 55
        mov     ebp, esp                                ; 421D _ 89. E5
        sub     esp, 16                                 ; 421F _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4222 _ C7. 45, FC, 00000000
        jmp     ?_224                                   ; 4229 _ EB, 24

?_222:  mov     ecx, dword [task_control]               ; 422B _ 8B. 0D, 00002228(d)
        mov     edx, dword [ebp-4H]                     ; 4231 _ 8B. 55, FC
        mov     eax, edx                                ; 4234 _ 89. D0
        shl     eax, 2                                  ; 4236 _ C1. E0, 02
        add     eax, edx                                ; 4239 _ 01. D0
        shl     eax, 2                                  ; 423B _ C1. E0, 02
        add     eax, ecx                                ; 423E _ 01. C8
        add     eax, 8                                  ; 4240 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 4243 _ 8B. 00
        test    eax, eax                                ; 4245 _ 85. C0
        jle     ?_223                                   ; 4247 _ 7E, 02
        jmp     ?_225                                   ; 4249 _ EB, 0A

?_223:  add     dword [ebp-4H], 1                       ; 424B _ 83. 45, FC, 01
?_224:  cmp     dword [ebp-4H], 2                       ; 424F _ 83. 7D, FC, 02
        jle     ?_222                                   ; 4253 _ 7E, D6
?_225:  mov     eax, dword [task_control]               ; 4255 _ A1, 00002228(d)
        mov     edx, dword [ebp-4H]                     ; 425A _ 8B. 55, FC
        mov     dword [eax], edx                        ; 425D _ 89. 10
        mov     eax, dword [task_control]               ; 425F _ A1, 00002228(d)
        mov     dword [eax+4H], 0                       ; 4264 _ C7. 40, 04, 00000000
        leave                                           ; 426B _ C9
        ret                                             ; 426C _ C3
; task_switch_sub End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_226:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_227:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0007 _ console.

?_228:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 000F _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0017 _ sk b.

?_229:                                                  ; byte
        db 42H, 00H                                     ; 001C _ B.

?_230:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 001E _ page is:
        db 20H, 00H                                     ; 0026 _  .

?_231:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0028 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0030 _ L: .

?_232:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0034 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003C _ H: .

?_233:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0040 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0048 _ w: .

?_234:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 004C _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0054 _ gh: .

?_235:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0059 _ type: .

?_236:                                                  ; byte
        db 3EH, 00H                                     ; 0060 _ >.

?_237:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0062 _ console.


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

table_rgb.1747:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0120 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0128 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0130 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0138 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0140 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0148 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0150 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........

cursor.1815:                                            ; byte
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

closebtn.1902:                                          ; byte
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

?_238:  db 00H                                          ; 0342 _ .

?_239:  db 00H, 00H                                     ; 0343 _ ..


SECTION .bss    align=32 noexecute                      ; section number 4, bss

task_console_g:                                         ; dword
        resd    1                                       ; 0000

task_a: resd    1                                       ; 0004

sheet_control:                                          ; dword
        resd    1                                       ; 0008

back_sheet:                                             ; dword
        resd    1                                       ; 000C

mouse_sheet:                                            ; dword
        resd    1                                       ; 0010

timerinfo1.1748:                                        ; byte
        resb    28                                      ; 0014

timerbuf1.1751:                                         ; qword
        resq    1                                       ; 0030

timerinfo2.1749:                                        ; byte
        resb    28                                      ; 0038

timerbuf2.1752:                                         ; qword
        resq    1                                       ; 0054

timerinfo3.1750:                                        ; byte
        resb    28                                      ; 005C

timerbuf3.1753:                                         ; qword
        resq    1                                       ; 0078

screen_info:                                            ; qword
        resb    4                                       ; 0080

?_240:  resw    1                                       ; 0084

?_241:  resw    13                                      ; 0086

mouse_cursor_buf:                                       ; byte
        resb    256                                     ; 00A0

back_buf: resd  1                                       ; 01A0

sheet_win:                                              ; dword
        resd    1                                       ; 01A4

mouse_x: resd   1                                       ; 01A8

mouse_y: resd   1                                       ; 01AC

key_shift:                                              ; dword
        resd    1                                       ; 01B0

caps_lock:                                              ; dword
        resd    1                                       ; 01B4

mouse_send_info:                                        ; oword
        resb    40                                      ; 01B8

keyinfo:                                                ; byte
        resb    32                                      ; 01E0

keybuf:                                                 ; yword
        resb    32                                      ; 0200

mouseinfo:                                              ; byte
        resb    32                                      ; 0220

mousebuf:                                               ; byte
        resb    128                                     ; 0240

str.1386:                                               ; byte
        resb    1                                       ; 02C0

?_242:  resb    9                                       ; 02C1

?_243:  resb    22                                      ; 02CA

timer_control:                                          ; byte
        resd    2001                                    ; 02E0

task_timer:                                             ; dword
        resd    1                                       ; 2224

task_control:                                           ; dword
        resd    1                                       ; 2228


