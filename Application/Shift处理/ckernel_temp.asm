; Disassembly of file: ckernel.o
; Thu Mar 12 11:54:22 2020
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
        mov     dword [esp+8H], timerbuf1.1749          ; 0148 _ C7. 44 24, 08, 00000030(d)
        mov     dword [esp+4H], 8                       ; 0150 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1746            ; 0158 _ C7. 04 24, 00000014(d)
        call    fifo8_init                              ; 015F _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0164 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0169 _ 89. 45, D0
        mov     dword [esp+8H], 1                       ; 016C _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1746         ; 0174 _ C7. 44 24, 04, 00000014(d)
        mov     eax, dword [ebp-30H]                    ; 017C _ 8B. 45, D0
        mov     dword [esp], eax                        ; 017F _ 89. 04 24
        call    timer_init                              ; 0182 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0187 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-30H]                    ; 018F _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0192 _ 89. 04 24
        call    timer_settime                           ; 0195 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 019A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf2.1750          ; 01A2 _ C7. 44 24, 08, 00000054(d)
        mov     dword [esp+4H], 8                       ; 01AA _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1747            ; 01B2 _ C7. 04 24, 00000038(d)
        call    fifo8_init                              ; 01B9 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01BE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 01C3 _ 89. 45, D4
        mov     dword [esp+8H], 1                       ; 01C6 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1747         ; 01CE _ C7. 44 24, 04, 00000038(d)
        mov     eax, dword [ebp-2CH]                    ; 01D6 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 01D9 _ 89. 04 24
        call    timer_init                              ; 01DC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01E1 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-2CH]                    ; 01E9 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 01EC _ 89. 04 24
        call    timer_settime                           ; 01EF _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 01F4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf3.1751          ; 01FC _ C7. 44 24, 08, 00000078(d)
        mov     dword [esp+4H], 8                       ; 0204 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1748            ; 020C _ C7. 04 24, 0000005C(d)
        call    fifo8_init                              ; 0213 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0218 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 021D _ 89. 45, D8
        mov     dword [esp+8H], 1                       ; 0220 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1748         ; 0228 _ C7. 44 24, 04, 0000005C(d)
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
        mov     dword [esp+4H], ?_220                   ; 02D9 _ C7. 44 24, 04, 00000000(d)
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
        mov     dword [esp], timerinfo1.1746            ; 03DB _ C7. 04 24, 00000014(d)
        call    fifo8_status                            ; 03E2 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03E7 _ 01. C3
        mov     dword [esp], timerinfo2.1747            ; 03E9 _ C7. 04 24, 00000038(d)
        call    fifo8_status                            ; 03F0 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03F5 _ 01. C3
        mov     dword [esp], timerinfo3.1748            ; 03F7 _ C7. 04 24, 0000005C(d)
        call    fifo8_status                            ; 03FE _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 0403 _ 01. D8
        test    eax, eax                                ; 0405 _ 85. C0
        jnz     ?_002                                   ; 0407 _ 75, 0A
        call    io_sti                                  ; 0409 _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 040E _ E9, 000004D2

?_002:  mov     dword [esp], keyinfo                    ; 0413 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 041A _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 041F _ 85. C0
        je      ?_007                                   ; 0421 _ 0F 84, 000002FF
        call    io_sti                                  ; 0427 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 042C _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0433 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0438 _ 89. 45, E8
        cmp     dword [ebp-18H], 28                     ; 043B _ 83. 7D, E8, 1C
        je      ?_013                                   ; 043F _ 0F 84, 000004A0
        cmp     dword [ebp-18H], 15                     ; 0445 _ 83. 7D, E8, 0F
        jne     ?_005                                   ; 0449 _ 0F 85, 00000128
        cmp     dword [ebp-48H], 0                      ; 044F _ 83. 7D, B8, 00
        jnz     ?_003                                   ; 0453 _ 75, 54
        mov     dword [ebp-48H], 1                      ; 0455 _ C7. 45, B8, 00000001
        mov     edx, dword [sheet_win]                  ; 045C _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0462 _ A1, 00000008(d)
        mov     dword [esp+0CH], 0                      ; 0467 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_220                   ; 046F _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 0477 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 047B _ 89. 04 24
        call    make_window_title                       ; 047E _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 0483 _ A1, 00000008(d)
        mov     dword [esp+0CH], 1                      ; 0488 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_221                   ; 0490 _ C7. 44 24, 08, 00000007(d)
        mov     edx, dword [ebp-1CH]                    ; 0498 _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 049B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 049F _ 89. 04 24
        call    make_window_title                       ; 04A2 _ E8, FFFFFFFC(rel)
        jmp     ?_004                                   ; 04A7 _ EB, 52

?_003:  mov     dword [ebp-48H], 0                      ; 04A9 _ C7. 45, B8, 00000000
        mov     edx, dword [sheet_win]                  ; 04B0 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 04B6 _ A1, 00000008(d)
        mov     dword [esp+0CH], 1                      ; 04BB _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_220                   ; 04C3 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 04CB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04CF _ 89. 04 24
        call    make_window_title                       ; 04D2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 04D7 _ A1, 00000008(d)
        mov     dword [esp+0CH], 0                      ; 04DC _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_221                   ; 04E4 _ C7. 44 24, 08, 00000007(d)
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
        jmp     ?_013                                   ; 0572 _ E9, 0000036E

?_005:  cmp     dword [ebp-48H], 0                      ; 0577 _ 83. 7D, B8, 00
        jne     ?_006                                   ; 057B _ 0F 85, 00000178
        mov     eax, dword [ebp-18H]                    ; 0581 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 0584 _ 89. 04 24
        call    transfer_scancode                       ; 0587 _ E8, FFFFFFFC(rel)
        test    al, al                                  ; 058C _ 84. C0
        je      ?_013                                   ; 058E _ 0F 84, 00000351
        cmp     dword [ebp-54H], 143                    ; 0594 _ 81. 7D, AC, 0000008F
        jg      ?_013                                   ; 059B _ 0F 8F, 00000344
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
        jmp     ?_013                                   ; 06F4 _ E9, 000001EC

?_006:  mov     eax, dword [task_a]                     ; 06F9 _ A1, 00000004(d)
        mov     dword [esp], eax                        ; 06FE _ 89. 04 24
        call    task_sleep                              ; 0701 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 0706 _ 8B. 45, E8
        movzx   eax, al                                 ; 0709 _ 0F B6. C0
        mov     edx, dword [task_console_g]             ; 070C _ 8B. 15, 00000000(d)
        add     edx, 16                                 ; 0712 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 0715 _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 0719 _ 89. 14 24
        call    fifo8_put                               ; 071C _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0721 _ E9, FFFFFC94

?_007:  mov     dword [esp], mouseinfo                  ; 0726 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 072D _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0732 _ 85. C0
        jz      ?_008                                   ; 0734 _ 74, 26
        mov     ecx, dword [mouse_sheet]                ; 0736 _ 8B. 0D, 00000010(d)
        mov     edx, dword [back_sheet]                 ; 073C _ 8B. 15, 0000000C(d)
        mov     eax, dword [sheet_control]              ; 0742 _ A1, 00000008(d)
        mov     dword [esp+8H], ecx                     ; 0747 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 074B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 074F _ 89. 04 24
        call    show_mouse_info                         ; 0752 _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 0757 _ E9, 00000189

?_008:  mov     dword [esp], timerinfo1.1746            ; 075C _ C7. 04 24, 00000014(d)
        call    fifo8_status                            ; 0763 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0768 _ 85. C0
        jz      ?_009                                   ; 076A _ 74, 49
        call    io_sti                                  ; 076C _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1746            ; 0771 _ C7. 04 24, 00000014(d)
        call    fifo8_get                               ; 0778 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 077D _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-30H]                    ; 0785 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0788 _ 89. 04 24
        call    timer_settime                           ; 078B _ E8, FFFFFFFC(rel)
        add     dword [ebp-4CH], 8                      ; 0790 _ 83. 45, B4, 08
        cmp     dword [ebp-44H], 0                      ; 0794 _ 83. 7D, BC, 00
        jne     ?_013                                   ; 0798 _ 0F 85, 00000147
        call    io_cli                                  ; 079E _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_a]                     ; 07A3 _ A1, 00000004(d)
        mov     dword [esp], eax                        ; 07A8 _ 89. 04 24
        call    task_sleep                              ; 07AB _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 07B0 _ E9, FFFFFC05

?_009:  mov     dword [esp], timerinfo2.1747            ; 07B5 _ C7. 04 24, 00000038(d)
        call    fifo8_status                            ; 07BC _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07C1 _ 85. C0
        jz      ?_010                                   ; 07C3 _ 74, 16
        call    io_sti                                  ; 07C5 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1747            ; 07CA _ C7. 04 24, 00000038(d)
        call    fifo8_get                               ; 07D1 _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 07D6 _ E9, 0000010A

?_010:  mov     dword [esp], timerinfo3.1748            ; 07DB _ C7. 04 24, 0000005C(d)
        call    fifo8_status                            ; 07E2 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07E7 _ 85. C0
        je      ?_013                                   ; 07E9 _ 0F 84, 000000F6
        mov     dword [esp], timerinfo3.1748            ; 07EF _ C7. 04 24, 0000005C(d)
        call    fifo8_get                               ; 07F6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 07FB _ 89. 45, F4
        call    io_sti                                  ; 07FE _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 0803 _ 83. 7D, F4, 00
        jz      ?_011                                   ; 0807 _ 74, 24
        mov     dword [esp+8H], 0                       ; 0809 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1748         ; 0811 _ C7. 44 24, 04, 0000005C(d)
        mov     eax, dword [ebp-28H]                    ; 0819 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 081C _ 89. 04 24
        call    timer_init                              ; 081F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-50H], 0                      ; 0824 _ C7. 45, B0, 00000000
        jmp     ?_012                                   ; 082B _ EB, 22

?_011:  mov     dword [esp+8H], 1                       ; 082D _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1748         ; 0835 _ C7. 44 24, 04, 0000005C(d)
        mov     eax, dword [ebp-28H]                    ; 083D _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0840 _ 89. 04 24
        call    timer_init                              ; 0843 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-50H], 7                      ; 0848 _ C7. 45, B0, 00000007
?_012:  mov     dword [esp+4H], 50                      ; 084F _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 0857 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 085A _ 89. 04 24
        call    timer_settime                           ; 085D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-54H]                    ; 0862 _ 8B. 45, AC
        lea     ebx, [eax+7H]                           ; 0865 _ 8D. 58, 07
        mov     eax, dword [ebp-50H]                    ; 0868 _ 8B. 45, B0
        movzx   ecx, al                                 ; 086B _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 086E _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 0873 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 0876 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 087B _ 8B. 00
        mov     dword [esp+18H], 43                     ; 087D _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 0885 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 0889 _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-54H]                    ; 0891 _ 8B. 5D, AC
        mov     dword [esp+0CH], ebx                    ; 0894 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 0898 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 089C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08A0 _ 89. 04 24
        call    paint_rectangle                         ; 08A3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-54H]                    ; 08A8 _ 8B. 45, AC
        lea     ecx, [eax+8H]                           ; 08AB _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 08AE _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 08B4 _ A1, 00000008(d)
        mov     dword [esp+14H], 44                     ; 08B9 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 08C1 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 08C5 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-54H]                    ; 08CD _ 8B. 4D, AC
        mov     dword [esp+8H], ecx                     ; 08D0 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08D4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08D8 _ 89. 04 24
        call    sheet_refresh                           ; 08DB _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 08E0 _ E9, FFFFFAD5

?_013:  jmp     ?_001                                   ; 08E5 _ E9, FFFFFAD0
; CMain End of function

task_b_main:; Function begin
        push    ebp                                     ; 08EA _ 55
        mov     ebp, esp                                ; 08EB _ 89. E5
        sub     esp, 104                                ; 08ED _ 83. EC, 68
        mov     eax, dword [ebp+8H]                     ; 08F0 _ 8B. 45, 08
        mov     dword [ebp-4CH], eax                    ; 08F3 _ 89. 45, B4
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 08F6 _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 08FC _ 89. 45, F4
        xor     eax, eax                                ; 08FF _ 31. C0
        mov     edx, dword [back_sheet]                 ; 0901 _ 8B. 15, 0000000C(d)
        mov     eax, dword [sheet_control]              ; 0907 _ A1, 00000008(d)
        mov     dword [esp+14H], 7                      ; 090C _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_222                  ; 0914 _ C7. 44 24, 10, 0000000F(d)
        mov     dword [esp+0CH], 160                    ; 091C _ C7. 44 24, 0C, 000000A0
        mov     dword [esp+8H], 0                       ; 0924 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 092C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0930 _ 89. 04 24
        call    paint_string                            ; 0933 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], 0                      ; 0938 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 093F _ C7. 45, CC, 00000000
        mov     dword [esp+0CH], 0                      ; 0946 _ C7. 44 24, 0C, 00000000
        lea     eax, [ebp-14H]                          ; 094E _ 8D. 45, EC
        mov     dword [esp+8H], eax                     ; 0951 _ 89. 44 24, 08
        mov     dword [esp+4H], 8                       ; 0955 _ C7. 44 24, 04, 00000008
        lea     eax, [ebp-30H]                          ; 095D _ 8D. 45, D0
        mov     dword [esp], eax                        ; 0960 _ 89. 04 24
        call    fifo8_init                              ; 0963 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0968 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 096D _ 89. 45, C8
        mov     dword [esp+8H], 123                     ; 0970 _ C7. 44 24, 08, 0000007B
        lea     eax, [ebp-30H]                          ; 0978 _ 8D. 45, D0
        mov     dword [esp+4H], eax                     ; 097B _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 097F _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0982 _ 89. 04 24
        call    timer_init                              ; 0985 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 098A _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 0992 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0995 _ 89. 04 24
        call    timer_settime                           ; 0998 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-40H], 0                      ; 099D _ C7. 45, C0, 00000000
        mov     dword [ebp-3CH], 0                      ; 09A4 _ C7. 45, C4, 00000000
?_014:  add     dword [ebp-40H], 1                      ; 09AB _ 83. 45, C0, 01
        call    io_cli                                  ; 09AF _ E8, FFFFFFFC(rel)
        lea     eax, [ebp-30H]                          ; 09B4 _ 8D. 45, D0
        mov     dword [esp], eax                        ; 09B7 _ 89. 04 24
        call    fifo8_status                            ; 09BA _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 09BF _ 85. C0
        jnz     ?_015                                   ; 09C1 _ 75, 07
        call    io_sti                                  ; 09C3 _ E8, FFFFFFFC(rel)
        jmp     ?_016                                   ; 09C8 _ EB, 6B

?_015:  lea     eax, [ebp-30H]                          ; 09CA _ 8D. 45, D0
        mov     dword [esp], eax                        ; 09CD _ 89. 04 24
        call    fifo8_get                               ; 09D0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 09D5 _ 89. 45, CC
        call    io_sti                                  ; 09D8 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-34H], 123                    ; 09DD _ 83. 7D, CC, 7B
        jnz     ?_016                                   ; 09E1 _ 75, 52
        mov     edx, dword [back_sheet]                 ; 09E3 _ 8B. 15, 0000000C(d)
        mov     eax, dword [sheet_control]              ; 09E9 _ A1, 00000008(d)
        mov     dword [esp+14H], 7                      ; 09EE _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_223                  ; 09F6 _ C7. 44 24, 10, 0000001C(d)
        mov     dword [esp+0CH], 176                    ; 09FE _ C7. 44 24, 0C, 000000B0
        mov     ecx, dword [ebp-3CH]                    ; 0A06 _ 8B. 4D, C4
        mov     dword [esp+8H], ecx                     ; 0A09 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0A0D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0A11 _ 89. 04 24
        call    paint_string                            ; 0A14 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0A19 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 0A21 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0A24 _ 89. 04 24
        call    timer_settime                           ; 0A27 _ E8, FFFFFFFC(rel)
        add     dword [ebp-3CH], 8                      ; 0A2C _ 83. 45, C4, 08
        jmp     ?_014                                   ; 0A30 _ E9, FFFFFF76

?_016:  jmp     ?_014                                   ; 0A35 _ E9, FFFFFF71
; task_b_main End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0A3A _ 55
        mov     ebp, esp                                ; 0A3B _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0A3D _ A1, 00000000(d)
        mov     edx, eax                                ; 0A42 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A44 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0A47 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0A49 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0A4C _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0A52 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 0A55 _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 0A5B _ 5D
        ret                                             ; 0A5C _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0A5D _ 55
        mov     ebp, esp                                ; 0A5E _ 89. E5
        sub     esp, 24                                 ; 0A60 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1744          ; 0A63 _ C7. 44 24, 08, 00000120(d)
        mov     dword [esp+4H], 15                      ; 0A6B _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 0A73 _ C7. 04 24, 00000000
        call    set_palette                             ; 0A7A _ E8, FFFFFFFC(rel)
        nop                                             ; 0A7F _ 90
        leave                                           ; 0A80 _ C9
        ret                                             ; 0A81 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0A82 _ 55
        mov     ebp, esp                                ; 0A83 _ 89. E5
        sub     esp, 40                                 ; 0A85 _ 83. EC, 28
        call    io_load_eflags                          ; 0A88 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0A8D _ 89. 45, F4
        call    io_cli                                  ; 0A90 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0A95 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0A98 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0A9C _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0AA3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0AA8 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0AAB _ 89. 45, F0
        jmp     ?_018                                   ; 0AAE _ EB, 62

?_017:  mov     eax, dword [ebp+10H]                    ; 0AB0 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0AB3 _ 0F B6. 00
        shr     al, 2                                   ; 0AB6 _ C0. E8, 02
        movzx   eax, al                                 ; 0AB9 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0ABC _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0AC0 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0AC7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0ACC _ 8B. 45, 10
        add     eax, 1                                  ; 0ACF _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0AD2 _ 0F B6. 00
        shr     al, 2                                   ; 0AD5 _ C0. E8, 02
        movzx   eax, al                                 ; 0AD8 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0ADB _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0ADF _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0AE6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0AEB _ 8B. 45, 10
        add     eax, 2                                  ; 0AEE _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0AF1 _ 0F B6. 00
        shr     al, 2                                   ; 0AF4 _ C0. E8, 02
        movzx   eax, al                                 ; 0AF7 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0AFA _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0AFE _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0B05 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0B0A _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0B0E _ 83. 45, F0, 01
?_018:  mov     eax, dword [ebp-10H]                    ; 0B12 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0B15 _ 3B. 45, 0C
        jle     ?_017                                   ; 0B18 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0B1A _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0B1D _ 89. 04 24
        call    io_store_eflags                         ; 0B20 _ E8, FFFFFFFC(rel)
        nop                                             ; 0B25 _ 90
        leave                                           ; 0B26 _ C9
        ret                                             ; 0B27 _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0B28 _ 55
        mov     ebp, esp                                ; 0B29 _ 89. E5
        sub     esp, 20                                 ; 0B2B _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0B2E _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0B31 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0B34 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0B37 _ 89. 45, FC
        jmp     ?_022                                   ; 0B3A _ EB, 33

?_019:  mov     eax, dword [ebp+14H]                    ; 0B3C _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0B3F _ 89. 45, F8
        jmp     ?_021                                   ; 0B42 _ EB, 1F

?_020:  mov     eax, dword [ebp-4H]                     ; 0B44 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0B47 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B4B _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0B4D _ 8B. 45, F8
        add     eax, edx                                ; 0B50 _ 01. D0
        mov     edx, eax                                ; 0B52 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B54 _ 8B. 45, 08
        add     edx, eax                                ; 0B57 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0B59 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0B5D _ 88. 02
        add     dword [ebp-8H], 1                       ; 0B5F _ 83. 45, F8, 01
?_021:  mov     eax, dword [ebp-8H]                     ; 0B63 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0B66 _ 3B. 45, 1C
        jle     ?_020                                   ; 0B69 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0B6B _ 83. 45, FC, 01
?_022:  mov     eax, dword [ebp-4H]                     ; 0B6F _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0B72 _ 3B. 45, 20
        jle     ?_019                                   ; 0B75 _ 7E, C5
        leave                                           ; 0B77 _ C9
        ret                                             ; 0B78 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0B79 _ 55
        mov     ebp, esp                                ; 0B7A _ 89. E5
        push    ebx                                     ; 0B7C _ 53
        sub     esp, 28                                 ; 0B7D _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 0B80 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0B83 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0B86 _ 8B. 45, 0C
        sub     eax, 1                                  ; 0B89 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0B8C _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0B90 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0B94 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0B9C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0BA4 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0BAC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0BAF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0BB3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0BB6 _ 89. 04 24
        call    paint_rectangle                         ; 0BB9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0BBE _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0BC1 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0BC4 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0BC7 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0BCA _ 8B. 45, 10
        sub     eax, 28                                 ; 0BCD _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 0BD0 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0BD4 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0BD8 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0BDC _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0BE4 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0BEC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0BEF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0BF3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0BF6 _ 89. 04 24
        call    paint_rectangle                         ; 0BF9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0BFE _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0C01 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0C04 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0C07 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0C0A _ 8B. 45, 10
        sub     eax, 27                                 ; 0C0D _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0C10 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0C14 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0C18 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0C1C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0C24 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0C2C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C2F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C33 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C36 _ 89. 04 24
        call    paint_rectangle                         ; 0C39 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C3E _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0C41 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0C44 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0C47 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0C4A _ 8B. 45, 10
        sub     eax, 26                                 ; 0C4D _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0C50 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0C54 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0C58 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0C5C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0C64 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0C6C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C6F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C73 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C76 _ 89. 04 24
        call    paint_rectangle                         ; 0C79 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C7E _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0C81 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0C84 _ 8B. 45, 10
        sub     eax, 24                                 ; 0C87 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0C8A _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0C8E _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0C96 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0C9A _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0CA2 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0CAA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CAD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CB1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CB4 _ 89. 04 24
        call    paint_rectangle                         ; 0CB7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0CBC _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0CBF _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0CC2 _ 8B. 45, 10
        sub     eax, 24                                 ; 0CC5 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0CC8 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0CCC _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0CD4 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0CD8 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 0CE0 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0CE8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CEB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CEF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CF2 _ 89. 04 24
        call    paint_rectangle                         ; 0CF5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0CFA _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0CFD _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0D00 _ 8B. 45, 10
        sub     eax, 4                                  ; 0D03 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0D06 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0D0A _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0D12 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0D16 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0D1E _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0D26 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D29 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D2D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D30 _ 89. 04 24
        call    paint_rectangle                         ; 0D33 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D38 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0D3B _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0D3E _ 8B. 45, 10
        sub     eax, 23                                 ; 0D41 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0D44 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0D48 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0D50 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0D54 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0D5C _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0D64 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D67 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D6B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D6E _ 89. 04 24
        call    paint_rectangle                         ; 0D71 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D76 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0D79 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0D7C _ 8B. 45, 10
        sub     eax, 3                                  ; 0D7F _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0D82 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0D86 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0D8E _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0D92 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0D9A _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0DA2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DA5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DA9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DAC _ 89. 04 24
        call    paint_rectangle                         ; 0DAF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0DB4 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0DB7 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0DBA _ 8B. 45, 10
        sub     eax, 24                                 ; 0DBD _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0DC0 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 0DC4 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0DCC _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 0DD0 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0DD8 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0DE0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DE3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DE7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DEA _ 89. 04 24
        call    paint_rectangle                         ; 0DED _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0DF2 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0DF5 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0DF8 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0DFB _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0DFE _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0E01 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0E04 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0E07 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0E0A _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0E0E _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0E12 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0E16 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0E1A _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0E22 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E25 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E29 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E2C _ 89. 04 24
        call    paint_rectangle                         ; 0E2F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E34 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0E37 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0E3A _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0E3D _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0E40 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0E43 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0E46 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0E49 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0E4C _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0E50 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0E54 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0E58 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0E5C _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0E64 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E67 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E6B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E6E _ 89. 04 24
        call    paint_rectangle                         ; 0E71 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E76 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0E79 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0E7C _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0E7F _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0E82 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0E85 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0E88 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0E8B _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0E8E _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0E92 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0E96 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0E9A _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0E9E _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0EA6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EA9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EAD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EB0 _ 89. 04 24
        call    paint_rectangle                         ; 0EB3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0EB8 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0EBB _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0EBE _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0EC1 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0EC4 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0EC7 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0ECA _ 8B. 45, 0C
        sub     eax, 3                                  ; 0ECD _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 0ED0 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0ED4 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0ED8 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0EDC _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0EE0 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0EE8 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EEB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EEF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EF2 _ 89. 04 24
        call    paint_rectangle                         ; 0EF5 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0EFA _ 83. C4, 1C
        pop     ebx                                     ; 0EFD _ 5B
        pop     ebp                                     ; 0EFE _ 5D
        ret                                             ; 0EFF _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 0F00 _ 55
        mov     ebp, esp                                ; 0F01 _ 89. E5
        sub     esp, 16                                 ; 0F03 _ 83. EC, 10
        movzx   eax, word [?_234]                       ; 0F06 _ 0F B7. 05, 00000084(d)
        cwde                                            ; 0F0D _ 98
        mov     dword [ebp-8H], eax                     ; 0F0E _ 89. 45, F8
        movzx   eax, word [?_235]                       ; 0F11 _ 0F B7. 05, 00000086(d)
        cwde                                            ; 0F18 _ 98
        mov     dword [ebp-4H], eax                     ; 0F19 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 0F1C _ 8B. 45, F8
        sub     eax, 16                                 ; 0F1F _ 83. E8, 10
        mov     edx, eax                                ; 0F22 _ 89. C2
        shr     edx, 31                                 ; 0F24 _ C1. EA, 1F
        add     eax, edx                                ; 0F27 _ 01. D0
        sar     eax, 1                                  ; 0F29 _ D1. F8
        mov     dword [mouse_x], eax                    ; 0F2B _ A3, 000001A8(d)
        mov     eax, dword [ebp-4H]                     ; 0F30 _ 8B. 45, FC
        sub     eax, 44                                 ; 0F33 _ 83. E8, 2C
        mov     edx, eax                                ; 0F36 _ 89. C2
        shr     edx, 31                                 ; 0F38 _ C1. EA, 1F
        add     eax, edx                                ; 0F3B _ 01. D0
        sar     eax, 1                                  ; 0F3D _ D1. F8
        mov     dword [mouse_y], eax                    ; 0F3F _ A3, 000001AC(d)
        leave                                           ; 0F44 _ C9
        ret                                             ; 0F45 _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0F46 _ 55
        mov     ebp, esp                                ; 0F47 _ 89. E5
        sub     esp, 20                                 ; 0F49 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 0F4C _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 0F4F _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0F52 _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 0F59 _ E9, 0000016E

?_023:  mov     edx, dword [ebp-4H]                     ; 0F5E _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 0F61 _ 8B. 45, 18
        add     eax, edx                                ; 0F64 _ 01. D0
        movzx   eax, byte [eax]                         ; 0F66 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0F69 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0F6C _ 0F B6. 45, FB
        test    al, al                                  ; 0F70 _ 84. C0
        jns     ?_024                                   ; 0F72 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0F74 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0F77 _ 8B. 55, 14
        add     eax, edx                                ; 0F7A _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0F7C _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0F80 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0F82 _ 8B. 45, 10
        add     eax, edx                                ; 0F85 _ 01. D0
        mov     edx, eax                                ; 0F87 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F89 _ 8B. 45, 08
        add     edx, eax                                ; 0F8C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0F8E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0F92 _ 88. 02
?_024:  movzx   eax, byte [ebp-5H]                      ; 0F94 _ 0F B6. 45, FB
        and     eax, 40H                                ; 0F98 _ 83. E0, 40
        test    eax, eax                                ; 0F9B _ 85. C0
        jz      ?_025                                   ; 0F9D _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0F9F _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0FA2 _ 8B. 55, 14
        add     eax, edx                                ; 0FA5 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FA7 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FAB _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FAD _ 8B. 45, 10
        add     eax, edx                                ; 0FB0 _ 01. D0
        lea     edx, [eax+1H]                           ; 0FB2 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0FB5 _ 8B. 45, 08
        add     edx, eax                                ; 0FB8 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0FBA _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0FBE _ 88. 02
?_025:  movzx   eax, byte [ebp-5H]                      ; 0FC0 _ 0F B6. 45, FB
        and     eax, 20H                                ; 0FC4 _ 83. E0, 20
        test    eax, eax                                ; 0FC7 _ 85. C0
        jz      ?_026                                   ; 0FC9 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0FCB _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0FCE _ 8B. 55, 14
        add     eax, edx                                ; 0FD1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FD3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FD7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FD9 _ 8B. 45, 10
        add     eax, edx                                ; 0FDC _ 01. D0
        lea     edx, [eax+2H]                           ; 0FDE _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0FE1 _ 8B. 45, 08
        add     edx, eax                                ; 0FE4 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0FE6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0FEA _ 88. 02
?_026:  movzx   eax, byte [ebp-5H]                      ; 0FEC _ 0F B6. 45, FB
        and     eax, 10H                                ; 0FF0 _ 83. E0, 10
        test    eax, eax                                ; 0FF3 _ 85. C0
        jz      ?_027                                   ; 0FF5 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0FF7 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0FFA _ 8B. 55, 14
        add     eax, edx                                ; 0FFD _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FFF _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1003 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1005 _ 8B. 45, 10
        add     eax, edx                                ; 1008 _ 01. D0
        lea     edx, [eax+3H]                           ; 100A _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 100D _ 8B. 45, 08
        add     edx, eax                                ; 1010 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1012 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1016 _ 88. 02
?_027:  movzx   eax, byte [ebp-5H]                      ; 1018 _ 0F B6. 45, FB
        and     eax, 08H                                ; 101C _ 83. E0, 08
        test    eax, eax                                ; 101F _ 85. C0
        jz      ?_028                                   ; 1021 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1023 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1026 _ 8B. 55, 14
        add     eax, edx                                ; 1029 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 102B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 102F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1031 _ 8B. 45, 10
        add     eax, edx                                ; 1034 _ 01. D0
        lea     edx, [eax+4H]                           ; 1036 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1039 _ 8B. 45, 08
        add     edx, eax                                ; 103C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 103E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1042 _ 88. 02
?_028:  movzx   eax, byte [ebp-5H]                      ; 1044 _ 0F B6. 45, FB
        and     eax, 04H                                ; 1048 _ 83. E0, 04
        test    eax, eax                                ; 104B _ 85. C0
        jz      ?_029                                   ; 104D _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 104F _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1052 _ 8B. 55, 14
        add     eax, edx                                ; 1055 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1057 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 105B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 105D _ 8B. 45, 10
        add     eax, edx                                ; 1060 _ 01. D0
        lea     edx, [eax+5H]                           ; 1062 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 1065 _ 8B. 45, 08
        add     edx, eax                                ; 1068 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 106A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 106E _ 88. 02
?_029:  movzx   eax, byte [ebp-5H]                      ; 1070 _ 0F B6. 45, FB
        and     eax, 02H                                ; 1074 _ 83. E0, 02
        test    eax, eax                                ; 1077 _ 85. C0
        jz      ?_030                                   ; 1079 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 107B _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 107E _ 8B. 55, 14
        add     eax, edx                                ; 1081 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1083 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1087 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1089 _ 8B. 45, 10
        add     eax, edx                                ; 108C _ 01. D0
        lea     edx, [eax+6H]                           ; 108E _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 1091 _ 8B. 45, 08
        add     edx, eax                                ; 1094 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1096 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 109A _ 88. 02
?_030:  movzx   eax, byte [ebp-5H]                      ; 109C _ 0F B6. 45, FB
        and     eax, 01H                                ; 10A0 _ 83. E0, 01
        test    eax, eax                                ; 10A3 _ 85. C0
        jz      ?_031                                   ; 10A5 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 10A7 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 10AA _ 8B. 55, 14
        add     eax, edx                                ; 10AD _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10AF _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10B3 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10B5 _ 8B. 45, 10
        add     eax, edx                                ; 10B8 _ 01. D0
        lea     edx, [eax+7H]                           ; 10BA _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 10BD _ 8B. 45, 08
        add     edx, eax                                ; 10C0 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 10C2 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 10C6 _ 88. 02
?_031:  add     dword [ebp-4H], 1                       ; 10C8 _ 83. 45, FC, 01
?_032:  cmp     dword [ebp-4H], 15                      ; 10CC _ 83. 7D, FC, 0F
        jle     ?_023                                   ; 10D0 _ 0F 8E, FFFFFE88
        leave                                           ; 10D6 _ C9
        ret                                             ; 10D7 _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 10D8 _ 55
        mov     ebp, esp                                ; 10D9 _ 89. E5
        push    ebx                                     ; 10DB _ 53
        sub     esp, 52                                 ; 10DC _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 10DF _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 10E2 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 10E5 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 10E8 _ 89. 45, F4
        jmp     ?_034                                   ; 10EB _ EB, 4B

?_033:  movsx   ecx, byte [ebp-1CH]                     ; 10ED _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 10F1 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 10F4 _ 0F B6. 00
        movsx   eax, al                                 ; 10F7 _ 0F BE. C0
        shl     eax, 4                                  ; 10FA _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 10FD _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 1103 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 1106 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1109 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 110C _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 110E _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 1112 _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 1116 _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 1119 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 111D _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 1120 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1124 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1128 _ 89. 04 24
        call    paint_font                              ; 112B _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 1130 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 1134 _ 83. 45, 18, 01
?_034:  mov     eax, dword [ebp+18H]                    ; 1138 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 113B _ 0F B6. 00
        test    al, al                                  ; 113E _ 84. C0
        jnz     ?_033                                   ; 1140 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 1142 _ 8B. 45, 14
        add     eax, 16                                 ; 1145 _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 1148 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 114C _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 114F _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 1153 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 1156 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 115A _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 115D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1161 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1164 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1168 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 116B _ 89. 04 24
        call    sheet_refresh                           ; 116E _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 1173 _ 83. C4, 34
        pop     ebx                                     ; 1176 _ 5B
        pop     ebp                                     ; 1177 _ 5D
        ret                                             ; 1178 _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 1179 _ 55
        mov     ebp, esp                                ; 117A _ 89. E5
        sub     esp, 20                                 ; 117C _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 117F _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 1182 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 1185 _ C7. 45, F8, 00000000
        jmp     ?_041                                   ; 118C _ E9, 0000009C

?_035:  mov     dword [ebp-4H], 0                       ; 1191 _ C7. 45, FC, 00000000
        jmp     ?_040                                   ; 1198 _ E9, 00000082

?_036:  mov     eax, dword [ebp-8H]                     ; 119D _ 8B. 45, F8
        shl     eax, 4                                  ; 11A0 _ C1. E0, 04
        mov     edx, eax                                ; 11A3 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11A5 _ 8B. 45, FC
        add     eax, edx                                ; 11A8 _ 01. D0
        add     eax, cursor.1812                        ; 11AA _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 11AF _ 0F B6. 00
        cmp     al, 42                                  ; 11B2 _ 3C, 2A
        jnz     ?_037                                   ; 11B4 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 11B6 _ 8B. 45, F8
        shl     eax, 4                                  ; 11B9 _ C1. E0, 04
        mov     edx, eax                                ; 11BC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11BE _ 8B. 45, FC
        add     eax, edx                                ; 11C1 _ 01. D0
        mov     edx, eax                                ; 11C3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 11C5 _ 8B. 45, 08
        add     eax, edx                                ; 11C8 _ 01. D0
        mov     byte [eax], 0                           ; 11CA _ C6. 00, 00
        jmp     ?_039                                   ; 11CD _ EB, 4C

?_037:  mov     eax, dword [ebp-8H]                     ; 11CF _ 8B. 45, F8
        shl     eax, 4                                  ; 11D2 _ C1. E0, 04
        mov     edx, eax                                ; 11D5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11D7 _ 8B. 45, FC
        add     eax, edx                                ; 11DA _ 01. D0
        add     eax, cursor.1812                        ; 11DC _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 11E1 _ 0F B6. 00
        cmp     al, 79                                  ; 11E4 _ 3C, 4F
        jnz     ?_038                                   ; 11E6 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 11E8 _ 8B. 45, F8
        shl     eax, 4                                  ; 11EB _ C1. E0, 04
        mov     edx, eax                                ; 11EE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11F0 _ 8B. 45, FC
        add     eax, edx                                ; 11F3 _ 01. D0
        mov     edx, eax                                ; 11F5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 11F7 _ 8B. 45, 08
        add     eax, edx                                ; 11FA _ 01. D0
        mov     byte [eax], 7                           ; 11FC _ C6. 00, 07
        jmp     ?_039                                   ; 11FF _ EB, 1A

?_038:  mov     eax, dword [ebp-8H]                     ; 1201 _ 8B. 45, F8
        shl     eax, 4                                  ; 1204 _ C1. E0, 04
        mov     edx, eax                                ; 1207 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1209 _ 8B. 45, FC
        add     eax, edx                                ; 120C _ 01. D0
        mov     edx, eax                                ; 120E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1210 _ 8B. 45, 08
        add     edx, eax                                ; 1213 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1215 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1219 _ 88. 02
?_039:  add     dword [ebp-4H], 1                       ; 121B _ 83. 45, FC, 01
?_040:  cmp     dword [ebp-4H], 15                      ; 121F _ 83. 7D, FC, 0F
        jle     ?_036                                   ; 1223 _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 1229 _ 83. 45, F8, 01
?_041:  cmp     dword [ebp-8H], 15                      ; 122D _ 83. 7D, F8, 0F
        jle     ?_035                                   ; 1231 _ 0F 8E, FFFFFF5A
        leave                                           ; 1237 _ C9
        ret                                             ; 1238 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 1239 _ 55
        mov     ebp, esp                                ; 123A _ 89. E5
        sub     esp, 16                                 ; 123C _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 123F _ C7. 45, F8, 00000000
        jmp     ?_045                                   ; 1246 _ EB, 50

?_042:  mov     dword [ebp-4H], 0                       ; 1248 _ C7. 45, FC, 00000000
        jmp     ?_044                                   ; 124F _ EB, 3B

?_043:  mov     eax, dword [ebp-8H]                     ; 1251 _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 1254 _ 8B. 55, 14
        add     eax, edx                                ; 1257 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1259 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 125D _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 1260 _ 8B. 4D, 10
        add     edx, ecx                                ; 1263 _ 01. CA
        add     eax, edx                                ; 1265 _ 01. D0
        mov     edx, eax                                ; 1267 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1269 _ 8B. 45, 08
        add     edx, eax                                ; 126C _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 126E _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 1271 _ 0F AF. 45, 18
        mov     ecx, eax                                ; 1275 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 1277 _ 8B. 45, FC
        add     eax, ecx                                ; 127A _ 01. C8
        mov     ecx, eax                                ; 127C _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 127E _ 8B. 45, 20
        add     eax, ecx                                ; 1281 _ 01. C8
        movzx   eax, byte [eax]                         ; 1283 _ 0F B6. 00
        mov     byte [edx], al                          ; 1286 _ 88. 02
        add     dword [ebp-4H], 1                       ; 1288 _ 83. 45, FC, 01
?_044:  mov     eax, dword [ebp-4H]                     ; 128C _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 128F _ 3B. 45, 18
        jl      ?_043                                   ; 1292 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 1294 _ 83. 45, F8, 01
?_045:  mov     eax, dword [ebp-8H]                     ; 1298 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 129B _ 3B. 45, 1C
        jl      ?_042                                   ; 129E _ 7C, A8
        leave                                           ; 12A0 _ C9
        ret                                             ; 12A1 _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 12A2 _ 55
        mov     ebp, esp                                ; 12A3 _ 89. E5
        sub     esp, 24                                 ; 12A5 _ 83. EC, 18
        mov     dword [esp+0CH], 0                      ; 12A8 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 12B0 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 12B8 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 12C0 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 12C7 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 12CC _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], keybuf                  ; 12D4 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 12DC _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 12E4 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 12EB _ E8, FFFFFFFC(rel)
        leave                                           ; 12F0 _ C9
        ret                                             ; 12F1 _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 12F2 _ 55
        mov     ebp, esp                                ; 12F3 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 12F5 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 12F8 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 12FB _ A1, 000001A8(d)
        add     eax, edx                                ; 1300 _ 01. D0
        mov     dword [mouse_x], eax                    ; 1302 _ A3, 000001A8(d)
        mov     eax, dword [ebp+10H]                    ; 1307 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 130A _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 130D _ A1, 000001AC(d)
        add     eax, edx                                ; 1312 _ 01. D0
        mov     dword [mouse_y], eax                    ; 1314 _ A3, 000001AC(d)
        mov     eax, dword [mouse_x]                    ; 1319 _ A1, 000001A8(d)
        test    eax, eax                                ; 131E _ 85. C0
        jns     ?_046                                   ; 1320 _ 79, 0A
        mov     dword [mouse_x], 0                      ; 1322 _ C7. 05, 000001A8(d), 00000000
?_046:  mov     eax, dword [mouse_y]                    ; 132C _ A1, 000001AC(d)
        test    eax, eax                                ; 1331 _ 85. C0
        jns     ?_047                                   ; 1333 _ 79, 0A
        mov     dword [mouse_y], 0                      ; 1335 _ C7. 05, 000001AC(d), 00000000
?_047:  movzx   eax, word [?_234]                       ; 133F _ 0F B7. 05, 00000084(d)
        cwde                                            ; 1346 _ 98
        lea     edx, [eax-10H]                          ; 1347 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 134A _ A1, 000001A8(d)
        cmp     edx, eax                                ; 134F _ 39. C2
        jge     ?_048                                   ; 1351 _ 7D, 10
        movzx   eax, word [?_234]                       ; 1353 _ 0F B7. 05, 00000084(d)
        cwde                                            ; 135A _ 98
        sub     eax, 16                                 ; 135B _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 135E _ A3, 000001A8(d)
?_048:  movzx   eax, word [?_234]                       ; 1363 _ 0F B7. 05, 00000084(d)
        cwde                                            ; 136A _ 98
        lea     edx, [eax-10H]                          ; 136B _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 136E _ A1, 000001AC(d)
        cmp     edx, eax                                ; 1373 _ 39. C2
        jge     ?_049                                   ; 1375 _ 7D, 10
        movzx   eax, word [?_234]                       ; 1377 _ 0F B7. 05, 00000084(d)
        cwde                                            ; 137E _ 98
        sub     eax, 16                                 ; 137F _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 1382 _ A3, 000001AC(d)
?_049:  pop     ebp                                     ; 1387 _ 5D
        ret                                             ; 1388 _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 1389 _ 55
        mov     ebp, esp                                ; 138A _ 89. E5
        sub     esp, 40                                 ; 138C _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 138F _ C6. 45, F7, 00
        call    io_sti                                  ; 1393 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 1398 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 139F _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 13A4 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 13A7 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 13AB _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 13AF _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 13B6 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 13BB _ 85. C0
        jz      ?_050                                   ; 13BD _ 74, 77
        mov     dword [esp+8H], mouse_send_info         ; 13BF _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 13C7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 13CA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13CE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13D1 _ 89. 04 24
        call    compute_mouse_position                  ; 13D4 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 13D9 _ 8B. 15, 000001AC(d)
        mov     eax, dword [mouse_x]                    ; 13DF _ A1, 000001A8(d)
        mov     dword [esp+0CH], edx                    ; 13E4 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 13E8 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 13EC _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 13EF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13F3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13F6 _ 89. 04 24
        call    sheet_slide                             ; 13F9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_send_info+0CH]        ; 13FE _ A1, 0000000C(d)
        and     eax, 01H                                ; 1403 _ 83. E0, 01
        test    eax, eax                                ; 1406 _ 85. C0
        jz      ?_050                                   ; 1408 _ 74, 2C
        mov     eax, dword [mouse_y]                    ; 140A _ A1, 000001AC(d)
        lea     ecx, [eax-8H]                           ; 140F _ 8D. 48, F8
        mov     eax, dword [mouse_x]                    ; 1412 _ A1, 000001A8(d)
        lea     edx, [eax-50H]                          ; 1417 _ 8D. 50, B0
        mov     eax, dword [sheet_win]                  ; 141A _ A1, 000001A4(d)
        mov     dword [esp+0CH], ecx                    ; 141F _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1423 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1427 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 142B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 142E _ 89. 04 24
        call    sheet_slide                             ; 1431 _ E8, FFFFFFFC(rel)
?_050:  leave                                           ; 1436 _ C9
        ret                                             ; 1437 _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 1438 _ 55
        mov     ebp, esp                                ; 1439 _ 89. E5
        sub     esp, 88                                 ; 143B _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 143E _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 1445 _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 144C _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 1453 _ A1, 00000080(d)
        mov     dword [ebp-2CH], eax                    ; 1458 _ 89. 45, D4
        movzx   eax, word [?_234]                       ; 145B _ 0F B7. 05, 00000084(d)
        cwde                                            ; 1462 _ 98
        mov     dword [ebp-28H], eax                    ; 1463 _ 89. 45, D8
        movzx   eax, word [?_235]                       ; 1466 _ 0F B7. 05, 00000086(d)
        cwde                                            ; 146D _ 98
        mov     dword [ebp-24H], eax                    ; 146E _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 1471 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1474 _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 1476 _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 1479 _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 147D _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 1480 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1484 _ 89. 04 24
        call    init_desktop                            ; 1487 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 148C _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_224                  ; 1494 _ C7. 44 24, 10, 0000001E(d)
        mov     eax, dword [ebp-34H]                    ; 149C _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 149F _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 14A3 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 14A6 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14AA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14AD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14B1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14B4 _ 89. 04 24
        call    paint_string                            ; 14B7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 14BC _ 8B. 45, 14
        mov     dword [esp], eax                        ; 14BF _ 89. 04 24
        call    intToHexStr                             ; 14C2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 14C7 _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 14CA _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 14D2 _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 14D5 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 14D9 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 14DC _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 14E0 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 14E3 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14E7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14EA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14EE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14F1 _ 89. 04 24
        call    paint_string                            ; 14F4 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 14F9 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 14FD _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_225                  ; 1505 _ C7. 44 24, 10, 00000028(d)
        mov     eax, dword [ebp-34H]                    ; 150D _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1510 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1514 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1517 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 151B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 151E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1522 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1525 _ 89. 04 24
        call    paint_string                            ; 1528 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 152D _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1530 _ 8B. 00
        mov     dword [esp], eax                        ; 1532 _ 89. 04 24
        call    intToHexStr                             ; 1535 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 153A _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 153D _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 1545 _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 1548 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 154C _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 154F _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1553 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1556 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 155A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 155D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1561 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1564 _ 89. 04 24
        call    paint_string                            ; 1567 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 156C _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1570 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_226                  ; 1578 _ C7. 44 24, 10, 00000034(d)
        mov     eax, dword [ebp-34H]                    ; 1580 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1583 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1587 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 158A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 158E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1591 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1595 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1598 _ 89. 04 24
        call    paint_string                            ; 159B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 15A0 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 15A3 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 15A6 _ 89. 04 24
        call    intToHexStr                             ; 15A9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 15AE _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 15B1 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 15B9 _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 15BC _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 15C0 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 15C3 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 15C7 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 15CA _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15CE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 15D1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 15D5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 15D8 _ 89. 04 24
        call    paint_string                            ; 15DB _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 15E0 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 15E4 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_227                  ; 15EC _ C7. 44 24, 10, 00000040(d)
        mov     eax, dword [ebp-34H]                    ; 15F4 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 15F7 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 15FB _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 15FE _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1602 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1605 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1609 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 160C _ 89. 04 24
        call    paint_string                            ; 160F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1614 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 1617 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 161A _ 89. 04 24
        call    intToHexStr                             ; 161D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1622 _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 1625 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 162D _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 1630 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1634 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1637 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 163B _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 163E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1642 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1645 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1649 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 164C _ 89. 04 24
        call    paint_string                            ; 164F _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1654 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1658 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_228                  ; 1660 _ C7. 44 24, 10, 0000004C(d)
        mov     eax, dword [ebp-34H]                    ; 1668 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 166B _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 166F _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1672 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1676 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1679 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 167D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1680 _ 89. 04 24
        call    paint_string                            ; 1683 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1688 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 168B _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 168E _ 89. 04 24
        call    intToHexStr                             ; 1691 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1696 _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 1699 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 16A1 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 16A4 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 16A8 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 16AB _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 16AF _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 16B2 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 16B6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 16B9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16BD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16C0 _ 89. 04 24
        call    paint_string                            ; 16C3 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 16C8 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 16CC _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_229                  ; 16D4 _ C7. 44 24, 10, 00000059(d)
        mov     eax, dword [ebp-34H]                    ; 16DC _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 16DF _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 16E3 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 16E6 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 16EA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 16ED _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16F1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16F4 _ 89. 04 24
        call    paint_string                            ; 16F7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 16FC _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 16FF _ 8B. 40, 10
        mov     dword [esp], eax                        ; 1702 _ 89. 04 24
        call    intToHexStr                             ; 1705 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 170A _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 170D _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 1715 _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 1718 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 171C _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 171F _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1723 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1726 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 172A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 172D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1731 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1734 _ 89. 04 24
        call    paint_string                            ; 1737 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 173C _ 83. 45, CC, 10
        leave                                           ; 1740 _ C9
        ret                                             ; 1741 _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 1742 _ 55
        mov     ebp, esp                                ; 1743 _ 89. E5
        sub     esp, 56                                 ; 1745 _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 1748 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 174B _ 89. 04 24
        call    sheet_alloc                             ; 174E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1753 _ 89. 45, F0
        mov     eax, dword [memman]                     ; 1756 _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 175B _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 1763 _ 89. 04 24
        call    memman_alloc_4k                         ; 1766 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 176B _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 176E _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 1776 _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 177E _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 1786 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 1789 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 178D _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1790 _ 89. 04 24
        call    sheet_setbuf                            ; 1793 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 1798 _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 17A0 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 17A3 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 17A7 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 17AA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 17AE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17B1 _ 89. 04 24
        call    make_windows                            ; 17B4 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 17B9 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 17C1 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 17C9 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 17D1 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 17D9 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-10H]                    ; 17E1 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 17E4 _ 89. 04 24
        call    make_textbox                            ; 17E7 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 17EC _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 17F4 _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-10H]                    ; 17FC _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 17FF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1803 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1806 _ 89. 04 24
        call    sheet_slide                             ; 1809 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 180E _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 1816 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1819 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 181D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1820 _ 89. 04 24
        call    sheet_updown                            ; 1823 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1828 _ 8B. 45, F0
        leave                                           ; 182B _ C9
        ret                                             ; 182C _ C3
; message_box End of function

make_textbox:; Function begin
        push    ebp                                     ; 182D _ 55
        mov     ebp, esp                                ; 182E _ 89. E5
        push    edi                                     ; 1830 _ 57
        push    esi                                     ; 1831 _ 56
        push    ebx                                     ; 1832 _ 53
        sub     esp, 44                                 ; 1833 _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 1836 _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 1839 _ 8B. 55, 0C
        add     eax, edx                                ; 183C _ 01. D0
        mov     dword [ebp-14H], eax                    ; 183E _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 1841 _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 1844 _ 8B. 55, 10
        add     eax, edx                                ; 1847 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1849 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 184C _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 184F _ 8D. 78, FD
        mov     eax, dword [ebp-14H]                    ; 1852 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1855 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1858 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 185B _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 185E _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1861 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1864 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1867 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 186A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 186D _ 8B. 00
        mov     dword [esp+18H], edi                    ; 186F _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1873 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1877 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 187B _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 187F _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 1887 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 188B _ 89. 04 24
        call    paint_rectangle                         ; 188E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1893 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1896 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 1899 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 189C _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 189F _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 18A2 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 18A5 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 18A8 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 18AB _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 18AE _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18B1 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18B4 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 18B6 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 18BA _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 18BE _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 18C2 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 18C6 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 18CE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18D2 _ 89. 04 24
        call    paint_rectangle                         ; 18D5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 18DA _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 18DD _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 18E0 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 18E3 _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 18E6 _ 8B. 45, F0
        lea     ebx, [eax+2H]                           ; 18E9 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 18EC _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 18EF _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 18F2 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 18F5 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18F8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18FB _ 8B. 00
        mov     dword [esp+18H], edi                    ; 18FD _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1901 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1905 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1909 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 190D _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 1915 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1919 _ 89. 04 24
        call    paint_rectangle                         ; 191C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1921 _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 1924 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 1927 _ 8B. 45, EC
        lea     esi, [eax+2H]                           ; 192A _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 192D _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1930 _ 8D. 58, FD
        mov     eax, dword [ebp-14H]                    ; 1933 _ 8B. 45, EC
        lea     ecx, [eax+2H]                           ; 1936 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1939 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 193C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 193F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1942 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1944 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1948 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 194C _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1950 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 1954 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 195C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1960 _ 89. 04 24
        call    paint_rectangle                         ; 1963 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1968 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 196B _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 196E _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1971 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 1974 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1977 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 197A _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 197D _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1980 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1983 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1985 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 1989 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 198C _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1990 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1994 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 1998 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 19A0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19A4 _ 89. 04 24
        call    paint_rectangle                         ; 19A7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 19AC _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 19AF _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 19B2 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 19B5 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 19B8 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 19BB _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 19BE _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 19C1 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19C4 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19C7 _ 8B. 00
        mov     ecx, dword [ebp-10H]                    ; 19C9 _ 8B. 4D, F0
        mov     dword [esp+18H], ecx                    ; 19CC _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 19D0 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 19D4 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 19D8 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 19DC _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 19E4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19E8 _ 89. 04 24
        call    paint_rectangle                         ; 19EB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 19F0 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 19F3 _ 8D. 48, 01
        mov     eax, dword [ebp-10H]                    ; 19F6 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 19F9 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 19FC _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 19FF _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 1A02 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A05 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A08 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A0B _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1A0D _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 1A11 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 1A14 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1A18 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1A1C _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 1A20 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1A28 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A2C _ 89. 04 24
        call    paint_rectangle                         ; 1A2F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1A34 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1A37 _ 8D. 78, 01
        mov     eax, dword [ebp-14H]                    ; 1A3A _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1A3D _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1A40 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1A43 _ 8D. 58, FE
        mov     eax, dword [ebp-14H]                    ; 1A46 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 1A49 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1A4C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A4F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A52 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A55 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1A57 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1A5B _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1A5F _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1A63 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 1A67 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1A6F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A73 _ 89. 04 24
        call    paint_rectangle                         ; 1A76 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1A7B _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 1A7E _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 1A81 _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 1A84 _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 1A87 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1A8A _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1A8D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A90 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A93 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A96 _ 8B. 00
        mov     ebx, dword [ebp-10H]                    ; 1A98 _ 8B. 5D, F0
        mov     dword [esp+18H], ebx                    ; 1A9B _ 89. 5C 24, 18
        mov     ebx, dword [ebp-14H]                    ; 1A9F _ 8B. 5D, EC
        mov     dword [esp+14H], ebx                    ; 1AA2 _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 1AA6 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 1AAA _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 1AAE _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1AB2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1AB6 _ 89. 04 24
        call    paint_rectangle                         ; 1AB9 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 1ABE _ 83. C4, 2C
        pop     ebx                                     ; 1AC1 _ 5B
        pop     esi                                     ; 1AC2 _ 5E
        pop     edi                                     ; 1AC3 _ 5F
        pop     ebp                                     ; 1AC4 _ 5D
        ret                                             ; 1AC5 _ C3
; make_textbox End of function

make_windows:; Function begin
        push    ebp                                     ; 1AC6 _ 55
        mov     ebp, esp                                ; 1AC7 _ 89. E5
        push    ebx                                     ; 1AC9 _ 53
        sub     esp, 52                                 ; 1ACA _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 1ACD _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1AD0 _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 1AD3 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1AD6 _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 1AD9 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1ADC _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1ADF _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 1AE2 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 1AE5 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1AE8 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1AEB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1AEE _ 8B. 00
        mov     dword [esp+18H], 0                      ; 1AF0 _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 1AF8 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 1AFC _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1B04 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1B0C _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1B14 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B17 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B1B _ 89. 04 24
        call    paint_rectangle                         ; 1B1E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1B23 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1B26 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1B29 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B2C _ 8B. 00
        mov     dword [esp+18H], 1                      ; 1B2E _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 1B36 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 1B3A _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1B42 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1B4A _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1B52 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B55 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B59 _ 89. 04 24
        call    paint_rectangle                         ; 1B5C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1B61 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1B64 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1B67 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B6A _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1B6C _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 1B70 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 1B78 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1B80 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1B88 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1B90 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B93 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B97 _ 89. 04 24
        call    paint_rectangle                         ; 1B9A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1B9F _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1BA2 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1BA5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BA8 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1BAA _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 1BAE _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 1BB6 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1BBE _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1BC6 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1BCE _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1BD1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BD5 _ 89. 04 24
        call    paint_rectangle                         ; 1BD8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1BDD _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1BE0 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1BE3 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1BE6 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1BE9 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1BEC _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1BEF _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BF2 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1BF4 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1BF8 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 1BFC _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 1C04 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 1C08 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1C10 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C13 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C17 _ 89. 04 24
        call    paint_rectangle                         ; 1C1A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1C1F _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1C22 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1C25 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1C28 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1C2B _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1C2E _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1C31 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C34 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1C36 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1C3A _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 1C3E _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 1C46 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 1C4A _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1C52 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C55 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C59 _ 89. 04 24
        call    paint_rectangle                         ; 1C5C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1C61 _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1C64 _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1C67 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1C6A _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1C6D _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C70 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1C72 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1C76 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 1C7A _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 1C82 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 1C8A _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1C92 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C95 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C99 _ 89. 04 24
        call    paint_rectangle                         ; 1C9C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1CA1 _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1CA4 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1CA7 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CAA _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1CAC _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1CB4 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 1CB8 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1CC0 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 1CC8 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 1CD0 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1CD3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CD7 _ 89. 04 24
        call    paint_rectangle                         ; 1CDA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1CDF _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1CE2 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1CE5 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1CE8 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1CEB _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1CEE _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1CF1 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CF4 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1CF6 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1CFA _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1CFE _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 1D02 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 1D0A _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1D12 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D15 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D19 _ 89. 04 24
        call    paint_rectangle                         ; 1D1C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1D21 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1D24 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1D27 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1D2A _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1D2D _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1D30 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1D33 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D36 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1D38 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1D3C _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1D40 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 1D44 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 1D4C _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1D54 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D57 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D5B _ 89. 04 24
        call    paint_rectangle                         ; 1D5E _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-1CH]                     ; 1D63 _ 0F BE. 45, E4
        mov     dword [esp+0CH], eax                    ; 1D67 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 1D6B _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 1D6E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1D72 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1D75 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1D79 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1D7C _ 89. 04 24
        call    make_window_title                       ; 1D7F _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 1D84 _ 83. C4, 34
        pop     ebx                                     ; 1D87 _ 5B
        pop     ebp                                     ; 1D88 _ 5D
        ret                                             ; 1D89 _ C3
; make_windows End of function

make_window_title:; Function begin
        push    ebp                                     ; 1D8A _ 55
        mov     ebp, esp                                ; 1D8B _ 89. E5
        push    ebx                                     ; 1D8D _ 53
        sub     esp, 52                                 ; 1D8E _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 1D91 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1D94 _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 1D97 _ 80. 7D, E4, 00
        jz      ?_051                                   ; 1D9B _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 1D9D _ C6. 45, EE, 07
        mov     byte [ebp-11H], 12                      ; 1DA1 _ C6. 45, EF, 0C
        jmp     ?_052                                   ; 1DA5 _ EB, 08

?_051:  mov     byte [ebp-12H], 8                       ; 1DA7 _ C6. 45, EE, 08
        mov     byte [ebp-11H], 15                      ; 1DAB _ C6. 45, EF, 0F
?_052:  mov     eax, dword [ebp+0CH]                    ; 1DAF _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1DB2 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 1DB5 _ 8D. 58, FC
        movzx   eax, byte [ebp-11H]                     ; 1DB8 _ 0F B6. 45, EF
        movzx   ecx, al                                 ; 1DBC _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 1DBF _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 1DC2 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1DC5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1DC8 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1DCA _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], ebx                    ; 1DD2 _ 89. 5C 24, 14
        mov     dword [esp+10H], 3                      ; 1DD6 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1DDE _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], ecx                     ; 1DE6 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1DEA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1DEE _ 89. 04 24
        call    paint_rectangle                         ; 1DF1 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-12H]                     ; 1DF6 _ 0F BE. 45, EE
        mov     dword [esp+14H], eax                    ; 1DFA _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 1DFE _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1E01 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 1E05 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 1E0D _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 1E15 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1E18 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1E1C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1E1F _ 89. 04 24
        call    paint_string                            ; 1E22 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 1E27 _ C7. 45, F4, 00000000
        jmp     ?_060                                   ; 1E2E _ E9, 00000083

?_053:  mov     dword [ebp-10H], 0                      ; 1E33 _ C7. 45, F0, 00000000
        jmp     ?_059                                   ; 1E3A _ EB, 70

?_054:  mov     eax, dword [ebp-0CH]                    ; 1E3C _ 8B. 45, F4
        shl     eax, 4                                  ; 1E3F _ C1. E0, 04
        mov     edx, eax                                ; 1E42 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 1E44 _ 8B. 45, F0
        add     eax, edx                                ; 1E47 _ 01. D0
        add     eax, closebtn.1899                      ; 1E49 _ 05, 00000260(d)
        movzx   eax, byte [eax]                         ; 1E4E _ 0F B6. 00
        mov     byte [ebp-13H], al                      ; 1E51 _ 88. 45, ED
        cmp     byte [ebp-13H], 64                      ; 1E54 _ 80. 7D, ED, 40
        jnz     ?_055                                   ; 1E58 _ 75, 06
        mov     byte [ebp-13H], 0                       ; 1E5A _ C6. 45, ED, 00
        jmp     ?_058                                   ; 1E5E _ EB, 1C

?_055:  cmp     byte [ebp-13H], 36                      ; 1E60 _ 80. 7D, ED, 24
        jnz     ?_056                                   ; 1E64 _ 75, 06
        mov     byte [ebp-13H], 15                      ; 1E66 _ C6. 45, ED, 0F
        jmp     ?_058                                   ; 1E6A _ EB, 10

?_056:  cmp     byte [ebp-13H], 81                      ; 1E6C _ 80. 7D, ED, 51
        jnz     ?_057                                   ; 1E70 _ 75, 06
        mov     byte [ebp-13H], 8                       ; 1E72 _ C6. 45, ED, 08
        jmp     ?_058                                   ; 1E76 _ EB, 04

?_057:  mov     byte [ebp-13H], 7                       ; 1E78 _ C6. 45, ED, 07
?_058:  mov     eax, dword [ebp+0CH]                    ; 1E7C _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1E7F _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 1E81 _ 8B. 45, F4
        lea     ecx, [eax+5H]                           ; 1E84 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1E87 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1E8A _ 8B. 40, 04
        imul    ecx, eax                                ; 1E8D _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1E90 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1E93 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1E96 _ 8D. 58, EB
        mov     eax, dword [ebp-10H]                    ; 1E99 _ 8B. 45, F0
        add     eax, ebx                                ; 1E9C _ 01. D8
        add     eax, ecx                                ; 1E9E _ 01. C8
        add     edx, eax                                ; 1EA0 _ 01. C2
        movzx   eax, byte [ebp-13H]                     ; 1EA2 _ 0F B6. 45, ED
        mov     byte [edx], al                          ; 1EA6 _ 88. 02
        add     dword [ebp-10H], 1                      ; 1EA8 _ 83. 45, F0, 01
?_059:  cmp     dword [ebp-10H], 15                     ; 1EAC _ 83. 7D, F0, 0F
        jle     ?_054                                   ; 1EB0 _ 7E, 8A
        add     dword [ebp-0CH], 1                      ; 1EB2 _ 83. 45, F4, 01
?_060:  cmp     dword [ebp-0CH], 13                     ; 1EB6 _ 83. 7D, F4, 0D
        jle     ?_053                                   ; 1EBA _ 0F 8E, FFFFFF73
        add     esp, 52                                 ; 1EC0 _ 83. C4, 34
        pop     ebx                                     ; 1EC3 _ 5B
        pop     ebp                                     ; 1EC4 _ 5D
        ret                                             ; 1EC5 _ C3
; make_window_title End of function

transfer_scancode:; Function begin
        push    ebp                                     ; 1EC6 _ 55
        mov     ebp, esp                                ; 1EC7 _ 89. E5
        sub     esp, 16                                 ; 1EC9 _ 83. EC, 10
        cmp     dword [ebp+8H], 42                      ; 1ECC _ 83. 7D, 08, 2A
        jnz     ?_061                                   ; 1ED0 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1ED2 _ A1, 000001B0(d)
        or      eax, 01H                                ; 1ED7 _ 83. C8, 01
        mov     dword [key_shift], eax                  ; 1EDA _ A3, 000001B0(d)
?_061:  cmp     dword [ebp+8H], 54                      ; 1EDF _ 83. 7D, 08, 36
        jnz     ?_062                                   ; 1EE3 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1EE5 _ A1, 000001B0(d)
        or      eax, 02H                                ; 1EEA _ 83. C8, 02
        mov     dword [key_shift], eax                  ; 1EED _ A3, 000001B0(d)
?_062:  cmp     dword [ebp+8H], 170                     ; 1EF2 _ 81. 7D, 08, 000000AA
        jnz     ?_063                                   ; 1EF9 _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1EFB _ A1, 000001B0(d)
        and     eax, 0FFFFFFFEH                         ; 1F00 _ 83. E0, FE
        mov     dword [key_shift], eax                  ; 1F03 _ A3, 000001B0(d)
?_063:  cmp     dword [ebp+8H], 182                     ; 1F08 _ 81. 7D, 08, 000000B6
        jnz     ?_064                                   ; 1F0F _ 75, 0D
        mov     eax, dword [key_shift]                  ; 1F11 _ A1, 000001B0(d)
        and     eax, 0FFFFFFFDH                         ; 1F16 _ 83. E0, FD
        mov     dword [key_shift], eax                  ; 1F19 _ A3, 000001B0(d)
?_064:  cmp     dword [ebp+8H], 42                      ; 1F1E _ 83. 7D, 08, 2A
        jz      ?_065                                   ; 1F22 _ 74, 1E
        cmp     dword [ebp+8H], 54                      ; 1F24 _ 83. 7D, 08, 36
        jz      ?_065                                   ; 1F28 _ 74, 18
        cmp     dword [ebp+8H], 170                     ; 1F2A _ 81. 7D, 08, 000000AA
        jz      ?_065                                   ; 1F31 _ 74, 0F
        cmp     dword [ebp+8H], 182                     ; 1F33 _ 81. 7D, 08, 000000B6
        jz      ?_065                                   ; 1F3A _ 74, 06
        cmp     dword [ebp+8H], 127                     ; 1F3C _ 83. 7D, 08, 7F
        jle     ?_066                                   ; 1F40 _ 7E, 07
?_065:  mov     eax, 0                                  ; 1F42 _ B8, 00000000
        jmp     ?_070                                   ; 1F47 _ EB, 68

?_066:  mov     byte [ebp-1H], 0                        ; 1F49 _ C6. 45, FF, 00
        mov     eax, dword [key_shift]                  ; 1F4D _ A1, 000001B0(d)
        test    eax, eax                                ; 1F52 _ 85. C0
        jnz     ?_067                                   ; 1F54 _ 75, 25
        cmp     dword [ebp+8H], 127                     ; 1F56 _ 83. 7D, 08, 7F
        jg      ?_067                                   ; 1F5A _ 7F, 1F
        mov     eax, dword [ebp+8H]                     ; 1F5C _ 8B. 45, 08
        add     eax, keytable                           ; 1F5F _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 1F64 _ 0F B6. 00
        test    al, al                                  ; 1F67 _ 84. C0
        jz      ?_067                                   ; 1F69 _ 74, 10
        mov     eax, dword [ebp+8H]                     ; 1F6B _ 8B. 45, 08
        add     eax, keytable                           ; 1F6E _ 05, 00000020(d)
        movzx   eax, byte [eax]                         ; 1F73 _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 1F76 _ 88. 45, FF
        jmp     ?_069                                   ; 1F79 _ EB, 32

?_067:  mov     eax, dword [key_shift]                  ; 1F7B _ A1, 000001B0(d)
        test    eax, eax                                ; 1F80 _ 85. C0
        jz      ?_068                                   ; 1F82 _ 74, 25
        cmp     dword [ebp+8H], 127                     ; 1F84 _ 83. 7D, 08, 7F
        jg      ?_068                                   ; 1F88 _ 7F, 1F
        mov     eax, dword [ebp+8H]                     ; 1F8A _ 8B. 45, 08
        add     eax, keytable_shift                     ; 1F8D _ 05, 000000A0(d)
        movzx   eax, byte [eax]                         ; 1F92 _ 0F B6. 00
        test    al, al                                  ; 1F95 _ 84. C0
        jz      ?_068                                   ; 1F97 _ 74, 10
        mov     eax, dword [ebp+8H]                     ; 1F99 _ 8B. 45, 08
        add     eax, keytable_shift                     ; 1F9C _ 05, 000000A0(d)
        movzx   eax, byte [eax]                         ; 1FA1 _ 0F B6. 00
        mov     byte [ebp-1H], al                       ; 1FA4 _ 88. 45, FF
        jmp     ?_069                                   ; 1FA7 _ EB, 04

?_068:  mov     byte [ebp-1H], 0                        ; 1FA9 _ C6. 45, FF, 00
?_069:  movzx   eax, byte [ebp-1H]                      ; 1FAD _ 0F B6. 45, FF
?_070:  leave                                           ; 1FB1 _ C9
        ret                                             ; 1FB2 _ C3
; transfer_scancode End of function

console_task:; Function begin
        push    ebp                                     ; 1FB3 _ 55
        mov     ebp, esp                                ; 1FB4 _ 89. E5
        push    ebx                                     ; 1FB6 _ 53
        sub     esp, 196                                ; 1FB7 _ 81. EC, 000000C4
        mov     eax, dword [ebp+8H]                     ; 1FBD _ 8B. 45, 08
        mov     dword [ebp-0ACH], eax                   ; 1FC0 _ 89. 85, FFFFFF54
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 1FC6 _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 1FCC _ 89. 45, F4
        xor     eax, eax                                ; 1FCF _ 31. C0
        call    task_now                                ; 1FD1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-98H], eax                    ; 1FD6 _ 89. 85, FFFFFF68
        mov     dword [ebp-0A0H], 16                    ; 1FDC _ C7. 85, FFFFFF60, 00000010
        mov     dword [ebp-9CH], 0                      ; 1FE6 _ C7. 85, FFFFFF64, 00000000
        mov     eax, dword [ebp-98H]                    ; 1FF0 _ 8B. 85, FFFFFF68
        lea     edx, [eax+10H]                          ; 1FF6 _ 8D. 50, 10
        mov     eax, dword [ebp-98H]                    ; 1FF9 _ 8B. 85, FFFFFF68
        mov     dword [esp+0CH], eax                    ; 1FFF _ 89. 44 24, 0C
        lea     eax, [ebp-8CH]                          ; 2003 _ 8D. 85, FFFFFF74
        mov     dword [esp+8H], eax                     ; 2009 _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 200D _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 2015 _ 89. 14 24
        call    fifo8_init                              ; 2018 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 201D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-94H], eax                    ; 2022 _ 89. 85, FFFFFF6C
        mov     eax, dword [ebp-98H]                    ; 2028 _ 8B. 85, FFFFFF68
        add     eax, 16                                 ; 202E _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 2031 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 2039 _ 89. 44 24, 04
        mov     eax, dword [ebp-94H]                    ; 203D _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 2043 _ 89. 04 24
        call    timer_init                              ; 2046 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 204B _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-94H]                    ; 2053 _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 2059 _ 89. 04 24
        call    timer_settime                           ; 205C _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2061 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 2066 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_230                  ; 206E _ C7. 44 24, 10, 00000060(d)
        mov     dword [esp+0CH], 28                     ; 2076 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 207E _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0ACH]                   ; 2086 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 208C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2090 _ 89. 04 24
        call    paint_string                            ; 2093 _ E8, FFFFFFFC(rel)
?_071:  call    io_cli                                  ; 2098 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-98H]                    ; 209D _ 8B. 85, FFFFFF68
        add     eax, 16                                 ; 20A3 _ 83. C0, 10
        mov     dword [esp], eax                        ; 20A6 _ 89. 04 24
        call    fifo8_status                            ; 20A9 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 20AE _ 85. C0
        jnz     ?_072                                   ; 20B0 _ 75, 07
        call    io_sti                                  ; 20B2 _ E8, FFFFFFFC(rel)
        jmp     ?_071                                   ; 20B7 _ EB, DF

?_072:  mov     eax, dword [ebp-98H]                    ; 20B9 _ 8B. 85, FFFFFF68
        add     eax, 16                                 ; 20BF _ 83. C0, 10
        mov     dword [esp], eax                        ; 20C2 _ 89. 04 24
        call    fifo8_get                               ; 20C5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-90H], eax                    ; 20CA _ 89. 85, FFFFFF70
        call    io_sti                                  ; 20D0 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-90H], 1                      ; 20D5 _ 83. BD, FFFFFF70, 01
        jg      ?_075                                   ; 20DC _ 0F 8F, 00000080
        cmp     dword [ebp-90H], 0                      ; 20E2 _ 83. BD, FFFFFF70, 00
        jz      ?_073                                   ; 20E9 _ 74, 2F
        mov     eax, dword [ebp-98H]                    ; 20EB _ 8B. 85, FFFFFF68
        add     eax, 16                                 ; 20F1 _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 20F4 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 20FC _ 89. 44 24, 04
        mov     eax, dword [ebp-94H]                    ; 2100 _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 2106 _ 89. 04 24
        call    timer_init                              ; 2109 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-9CH], 7                      ; 210E _ C7. 85, FFFFFF64, 00000007
        jmp     ?_074                                   ; 2118 _ EB, 2D

?_073:  mov     eax, dword [ebp-98H]                    ; 211A _ 8B. 85, FFFFFF68
        add     eax, 16                                 ; 2120 _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 2123 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 212B _ 89. 44 24, 04
        mov     eax, dword [ebp-94H]                    ; 212F _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 2135 _ 89. 04 24
        call    timer_init                              ; 2138 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-9CH], 0                      ; 213D _ C7. 85, FFFFFF64, 00000000
?_074:  mov     dword [esp+4H], 50                      ; 2147 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-94H]                    ; 214F _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 2155 _ 89. 04 24
        call    timer_settime                           ; 2158 _ E8, FFFFFFFC(rel)
        jmp     ?_077                                   ; 215D _ E9, 00000247

?_075:  cmp     dword [ebp-90H], 14                     ; 2162 _ 83. BD, FFFFFF70, 0E
        jne     ?_076                                   ; 2169 _ 0F 85, 0000012D
        cmp     dword [ebp-0A0H], 16                    ; 216F _ 83. BD, FFFFFF60, 10
        jle     ?_076                                   ; 2176 _ 0F 8E, 00000120
        mov     eax, dword [ebp-0A0H]                   ; 217C _ 8B. 85, FFFFFF60
        lea     ecx, [eax+7H]                           ; 2182 _ 8D. 48, 07
        mov     eax, dword [ebp-0ACH]                   ; 2185 _ 8B. 85, FFFFFF54
        mov     edx, dword [eax+4H]                     ; 218B _ 8B. 50, 04
        mov     eax, dword [ebp-0ACH]                   ; 218E _ 8B. 85, FFFFFF54
        mov     eax, dword [eax]                        ; 2194 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 2196 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 219E _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 21A2 _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-0A0H]                   ; 21AA _ 8B. 8D, FFFFFF60
        mov     dword [esp+0CH], ecx                    ; 21B0 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 0                       ; 21B4 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 21BC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 21C0 _ 89. 04 24
        call    paint_rectangle                         ; 21C3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0A0H]                   ; 21C8 _ 8B. 85, FFFFFF60
        lea     edx, [eax+8H]                           ; 21CE _ 8D. 50, 08
        mov     eax, dword [sheet_control]              ; 21D1 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 21D6 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], edx                    ; 21DE _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 21E2 _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-0A0H]                   ; 21EA _ 8B. 95, FFFFFF60
        mov     dword [esp+8H], edx                     ; 21F0 _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 21F4 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 21FA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 21FE _ 89. 04 24
        call    sheet_refresh                           ; 2201 _ E8, FFFFFFFC(rel)
        sub     dword [ebp-0A0H], 8                     ; 2206 _ 83. AD, FFFFFF60, 08
        mov     eax, dword [ebp-0A0H]                   ; 220D _ 8B. 85, FFFFFF60
        lea     ecx, [eax+7H]                           ; 2213 _ 8D. 48, 07
        mov     eax, dword [ebp-0ACH]                   ; 2216 _ 8B. 85, FFFFFF54
        mov     edx, dword [eax+4H]                     ; 221C _ 8B. 50, 04
        mov     eax, dword [ebp-0ACH]                   ; 221F _ 8B. 85, FFFFFF54
        mov     eax, dword [eax]                        ; 2225 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 2227 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 222F _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 2233 _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-0A0H]                   ; 223B _ 8B. 8D, FFFFFF60
        mov     dword [esp+0CH], ecx                    ; 2241 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 0                       ; 2245 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 224D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2251 _ 89. 04 24
        call    paint_rectangle                         ; 2254 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0A0H]                   ; 2259 _ 8B. 85, FFFFFF60
        lea     edx, [eax+8H]                           ; 225F _ 8D. 50, 08
        mov     eax, dword [sheet_control]              ; 2262 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 2267 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], edx                    ; 226F _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 2273 _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-0A0H]                   ; 227B _ 8B. 95, FFFFFF60
        mov     dword [esp+8H], edx                     ; 2281 _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 2285 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 228B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 228F _ 89. 04 24
        call    sheet_refresh                           ; 2292 _ E8, FFFFFFFC(rel)
        jmp     ?_077                                   ; 2297 _ E9, 0000010D

?_076:  mov     eax, dword [ebp-90H]                    ; 229C _ 8B. 85, FFFFFF70
        mov     dword [esp], eax                        ; 22A2 _ 89. 04 24
        call    transfer_scancode                       ; 22A5 _ E8, FFFFFFFC(rel)
        test    al, al                                  ; 22AA _ 84. C0
        je      ?_077                                   ; 22AC _ 0F 84, 000000F7
        cmp     dword [ebp-0A0H], 239                   ; 22B2 _ 81. BD, FFFFFF60, 000000EF
        jg      ?_077                                   ; 22BC _ 0F 8F, 000000E7
        mov     eax, dword [ebp-0A0H]                   ; 22C2 _ 8B. 85, FFFFFF60
        lea     ecx, [eax+7H]                           ; 22C8 _ 8D. 48, 07
        mov     eax, dword [ebp-0ACH]                   ; 22CB _ 8B. 85, FFFFFF54
        mov     edx, dword [eax+4H]                     ; 22D1 _ 8B. 50, 04
        mov     eax, dword [ebp-0ACH]                   ; 22D4 _ 8B. 85, FFFFFF54
        mov     eax, dword [eax]                        ; 22DA _ 8B. 00
        mov     dword [esp+18H], 43                     ; 22DC _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 22E4 _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 22E8 _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-0A0H]                   ; 22F0 _ 8B. 8D, FFFFFF60
        mov     dword [esp+0CH], ecx                    ; 22F6 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 0                       ; 22FA _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 2302 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2306 _ 89. 04 24
        call    paint_rectangle                         ; 2309 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0A0H]                   ; 230E _ 8B. 85, FFFFFF60
        lea     edx, [eax+8H]                           ; 2314 _ 8D. 50, 08
        mov     eax, dword [sheet_control]              ; 2317 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 231C _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], edx                    ; 2324 _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 2328 _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-0A0H]                   ; 2330 _ 8B. 95, FFFFFF60
        mov     dword [esp+8H], edx                     ; 2336 _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 233A _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 2340 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2344 _ 89. 04 24
        call    sheet_refresh                           ; 2347 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-90H]                    ; 234C _ 8B. 85, FFFFFF70
        mov     dword [esp], eax                        ; 2352 _ 89. 04 24
        call    transfer_scancode                       ; 2355 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-0A2H], al                     ; 235A _ 88. 85, FFFFFF5E
        mov     byte [ebp-0A1H], 0                      ; 2360 _ C6. 85, FFFFFF5F, 00
        mov     eax, dword [sheet_control]              ; 2367 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 236C _ C7. 44 24, 14, 00000007
        lea     edx, [ebp-0A2H]                         ; 2374 _ 8D. 95, FFFFFF5E
        mov     dword [esp+10H], edx                    ; 237A _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 237E _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-0A0H]                   ; 2386 _ 8B. 95, FFFFFF60
        mov     dword [esp+8H], edx                     ; 238C _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 2390 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 2396 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 239A _ 89. 04 24
        call    paint_string                            ; 239D _ E8, FFFFFFFC(rel)
        add     dword [ebp-0A0H], 8                     ; 23A2 _ 83. 85, FFFFFF60, 08
?_077:  mov     eax, dword [ebp-0A0H]                   ; 23A9 _ 8B. 85, FFFFFF60
        lea     ebx, [eax+7H]                           ; 23AF _ 8D. 58, 07
        mov     eax, dword [ebp-9CH]                    ; 23B2 _ 8B. 85, FFFFFF64
        movzx   ecx, al                                 ; 23B8 _ 0F B6. C8
        mov     eax, dword [ebp-0ACH]                   ; 23BB _ 8B. 85, FFFFFF54
        mov     edx, dword [eax+4H]                     ; 23C1 _ 8B. 50, 04
        mov     eax, dword [ebp-0ACH]                   ; 23C4 _ 8B. 85, FFFFFF54
        mov     eax, dword [eax]                        ; 23CA _ 8B. 00
        mov     dword [esp+18H], 43                     ; 23CC _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 23D4 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 23D8 _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-0A0H]                   ; 23E0 _ 8B. 9D, FFFFFF60
        mov     dword [esp+0CH], ebx                    ; 23E6 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 23EA _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 23EE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 23F2 _ 89. 04 24
        call    paint_rectangle                         ; 23F5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0A0H]                   ; 23FA _ 8B. 85, FFFFFF60
        lea     edx, [eax+8H]                           ; 2400 _ 8D. 50, 08
        mov     eax, dword [sheet_control]              ; 2403 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 2408 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], edx                    ; 2410 _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 2414 _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-0A0H]                   ; 241C _ 8B. 95, FFFFFF60
        mov     dword [esp+8H], edx                     ; 2422 _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 2426 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 242C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2430 _ 89. 04 24
        call    sheet_refresh                           ; 2433 _ E8, FFFFFFFC(rel)
        jmp     ?_071                                   ; 2438 _ E9, FFFFFC5B
; console_task End of function

launch_console:; Function begin
        push    ebp                                     ; 243D _ 55
        mov     ebp, esp                                ; 243E _ 89. E5
        sub     esp, 56                                 ; 2440 _ 83. EC, 38
        mov     eax, dword [sheet_control]              ; 2443 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 2448 _ 89. 04 24
        call    sheet_alloc                             ; 244B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 2450 _ 89. 45, E8
        mov     eax, dword [memman]                     ; 2453 _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 2458 _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 2460 _ 89. 04 24
        call    memman_alloc_4k                         ; 2463 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 2468 _ 89. 45, EC
        mov     dword [esp+10H], 99                     ; 246B _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 2473 _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 247B _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-14H]                    ; 2483 _ 8B. 45, EC
        mov     dword [esp+4H], eax                     ; 2486 _ 89. 44 24, 04
        mov     eax, dword [ebp-18H]                    ; 248A _ 8B. 45, E8
        mov     dword [esp], eax                        ; 248D _ 89. 04 24
        call    sheet_setbuf                            ; 2490 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2495 _ A1, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 249A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_231                   ; 24A2 _ C7. 44 24, 08, 00000062(d)
        mov     edx, dword [ebp-18H]                    ; 24AA _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 24AD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 24B1 _ 89. 04 24
        call    make_windows                            ; 24B4 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 24B9 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 24C1 _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 24C9 _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 24D1 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 24D9 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-18H]                    ; 24E1 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 24E4 _ 89. 04 24
        call    make_textbox                            ; 24E7 _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 24EC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 24F1 _ 89. 45, F0
        call    get_code32_addr                         ; 24F4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 24F9 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 24FC _ 8B. 45, F0
        mov     dword [eax+8CH], 0                      ; 24FF _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-10H]                    ; 2509 _ 8B. 45, F0
        mov     dword [eax+90H], 1073741824             ; 250C _ C7. 80, 00000090, 40000000
        mov     eax, console_task                       ; 2516 _ B8, 00000000(d)
        sub     eax, dword [ebp-0CH]                    ; 251B _ 2B. 45, F4
        mov     edx, eax                                ; 251E _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 2520 _ 8B. 45, F0
        mov     dword [eax+4CH], edx                    ; 2523 _ 89. 50, 4C
        mov     eax, dword [ebp-10H]                    ; 2526 _ 8B. 45, F0
        mov     dword [eax+74H], 0                      ; 2529 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-10H]                    ; 2530 _ 8B. 45, F0
        mov     dword [eax+78H], 8                      ; 2533 _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-10H]                    ; 253A _ 8B. 45, F0
        mov     dword [eax+7CH], 48                     ; 253D _ C7. 40, 7C, 00000030
        mov     eax, dword [ebp-10H]                    ; 2544 _ 8B. 45, F0
        mov     dword [eax+80H], 32                     ; 2547 _ C7. 80, 00000080, 00000020
        mov     eax, dword [ebp-10H]                    ; 2551 _ 8B. 45, F0
        mov     dword [eax+84H], 0                      ; 2554 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-10H]                    ; 255E _ 8B. 45, F0
        mov     dword [eax+88H], 16                     ; 2561 _ C7. 80, 00000088, 00000010
        mov     eax, dword [ebp-10H]                    ; 256B _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 256E _ 8B. 40, 64
        lea     edx, [eax-4H]                           ; 2571 _ 8D. 50, FC
        mov     eax, dword [ebp-10H]                    ; 2574 _ 8B. 45, F0
        mov     dword [eax+64H], edx                    ; 2577 _ 89. 50, 64
        mov     eax, dword [ebp-10H]                    ; 257A _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 257D _ 8B. 40, 64
        add     eax, 4                                  ; 2580 _ 83. C0, 04
        mov     edx, dword [ebp-18H]                    ; 2583 _ 8B. 55, E8
        mov     dword [eax], edx                        ; 2586 _ 89. 10
        mov     dword [esp+8H], 5                       ; 2588 _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 2590 _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-10H]                    ; 2598 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 259B _ 89. 04 24
        call    task_run                                ; 259E _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 25A3 _ A1, 00000000(d)
        mov     dword [esp+0CH], 4                      ; 25A8 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 25B0 _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-18H]                    ; 25B8 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 25BB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25BF _ 89. 04 24
        call    sheet_slide                             ; 25C2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 25C7 _ A1, 00000000(d)
        mov     dword [esp+8H], 1                       ; 25CC _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-18H]                    ; 25D4 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 25D7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 25DB _ 89. 04 24
        call    sheet_updown                            ; 25DE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 25E3 _ 8B. 45, F0
        mov     dword [task_console_g], eax             ; 25E6 _ A3, 00000000(d)
        mov     eax, dword [ebp-18H]                    ; 25EB _ 8B. 45, E8
        leave                                           ; 25EE _ C9
        ret                                             ; 25EF _ C3
; launch_console End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 25F0 _ 55
        mov     ebp, esp                                ; 25F1 _ 89. E5
        sub     esp, 24                                 ; 25F3 _ 83. EC, 18
?_078:  mov     dword [esp], 100                        ; 25F6 _ C7. 04 24, 00000064
        call    io_in8                                  ; 25FD _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 2602 _ 83. E0, 02
        test    eax, eax                                ; 2605 _ 85. C0
        jnz     ?_079                                   ; 2607 _ 75, 02
        jmp     ?_080                                   ; 2609 _ EB, 02

?_079:  jmp     ?_078                                   ; 260B _ EB, E9

?_080:  leave                                           ; 260D _ C9
        ret                                             ; 260E _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 260F _ 55
        mov     ebp, esp                                ; 2610 _ 89. E5
        sub     esp, 24                                 ; 2612 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2615 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 261A _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 2622 _ C7. 04 24, 00000064
        call    io_out8                                 ; 2629 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 262E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 2633 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 263B _ C7. 04 24, 00000060
        call    io_out8                                 ; 2642 _ E8, FFFFFFFC(rel)
        leave                                           ; 2647 _ C9
        ret                                             ; 2648 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 2649 _ 55
        mov     ebp, esp                                ; 264A _ 89. E5
        sub     esp, 24                                 ; 264C _ 83. EC, 18
        call    wait_KBC_sendready                      ; 264F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 2654 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 265C _ C7. 04 24, 00000064
        call    io_out8                                 ; 2663 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2668 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 266D _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 2675 _ C7. 04 24, 00000060
        call    io_out8                                 ; 267C _ E8, FFFFFFFC(rel)
        leave                                           ; 2681 _ C9
        ret                                             ; 2682 _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 2683 _ 55
        mov     ebp, esp                                ; 2684 _ 89. E5
        sub     esp, 4                                  ; 2686 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 2689 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 268C _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 268F _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2692 _ 0F B6. 40, 03
        test    al, al                                  ; 2696 _ 84. C0
        jnz     ?_082                                   ; 2698 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 269A _ 80. 7D, FC, FA
        jnz     ?_081                                   ; 269E _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 26A0 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 26A3 _ C6. 40, 03, 01
?_081:  mov     eax, 0                                  ; 26A7 _ B8, 00000000
        jmp     ?_089                                   ; 26AC _ E9, 0000010F

?_082:  mov     eax, dword [ebp+8H]                     ; 26B1 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 26B4 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 26B8 _ 3C, 01
        jnz     ?_084                                   ; 26BA _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 26BC _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 26C0 _ 25, 000000C8
        cmp     eax, 8                                  ; 26C5 _ 83. F8, 08
        jnz     ?_083                                   ; 26C8 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 26CA _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 26CD _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 26D1 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 26D3 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 26D6 _ C6. 40, 03, 02
?_083:  mov     eax, 0                                  ; 26DA _ B8, 00000000
        jmp     ?_089                                   ; 26DF _ E9, 000000DC

?_084:  mov     eax, dword [ebp+8H]                     ; 26E4 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 26E7 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 26EB _ 3C, 02
        jnz     ?_085                                   ; 26ED _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 26EF _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 26F2 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 26F6 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 26F9 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 26FC _ C6. 40, 03, 03
        mov     eax, 0                                  ; 2700 _ B8, 00000000
        jmp     ?_089                                   ; 2705 _ E9, 000000B6

?_085:  mov     eax, dword [ebp+8H]                     ; 270A _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 270D _ 0F B6. 40, 03
        cmp     al, 3                                   ; 2711 _ 3C, 03
        jne     ?_088                                   ; 2713 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 2719 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 271C _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 2720 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 2723 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2726 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 272A _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 272D _ 0F B6. 00
        movzx   eax, al                                 ; 2730 _ 0F B6. C0
        and     eax, 07H                                ; 2733 _ 83. E0, 07
        mov     edx, eax                                ; 2736 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2738 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 273B _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 273E _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 2741 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 2745 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2748 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 274B _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 274E _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 2751 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 2755 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 2758 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 275B _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 275E _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2761 _ 0F B6. 00
        movzx   eax, al                                 ; 2764 _ 0F B6. C0
        and     eax, 10H                                ; 2767 _ 83. E0, 10
        test    eax, eax                                ; 276A _ 85. C0
        jz      ?_086                                   ; 276C _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 276E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2771 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 2774 _ 0D, FFFFFF00
        mov     edx, eax                                ; 2779 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 277B _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 277E _ 89. 50, 04
?_086:  mov     eax, dword [ebp+8H]                     ; 2781 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2784 _ 0F B6. 00
        movzx   eax, al                                 ; 2787 _ 0F B6. C0
        and     eax, 20H                                ; 278A _ 83. E0, 20
        test    eax, eax                                ; 278D _ 85. C0
        jz      ?_087                                   ; 278F _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2791 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2794 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 2797 _ 0D, FFFFFF00
        mov     edx, eax                                ; 279C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 279E _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 27A1 _ 89. 50, 08
?_087:  mov     eax, dword [ebp+8H]                     ; 27A4 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 27A7 _ 8B. 40, 08
        neg     eax                                     ; 27AA _ F7. D8
        mov     edx, eax                                ; 27AC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 27AE _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 27B1 _ 89. 50, 08
        mov     eax, 1                                  ; 27B4 _ B8, 00000001
        jmp     ?_089                                   ; 27B9 _ EB, 05

?_088:  mov     eax, 4294967295                         ; 27BB _ B8, FFFFFFFF
?_089:  leave                                           ; 27C0 _ C9
        ret                                             ; 27C1 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 27C2 _ 55
        mov     ebp, esp                                ; 27C3 _ 89. E5
        sub     esp, 40                                 ; 27C5 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 27C8 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 27D0 _ C7. 04 24, 00000020
        call    io_out8                                 ; 27D7 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 27DC _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 27E4 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 27EB _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 27F0 _ C7. 04 24, 00000060
        call    io_in8                                  ; 27F7 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 27FC _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 27FF _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 2803 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 2807 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 280E _ E8, FFFFFFFC(rel)
        leave                                           ; 2813 _ C9
        ret                                             ; 2814 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 2815 _ 55
        mov     ebp, esp                                ; 2816 _ 89. E5
        sub     esp, 40                                 ; 2818 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 281B _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 2823 _ C7. 04 24, 00000020
        call    io_out8                                 ; 282A _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 282F _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 2837 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 283E _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 2843 _ C7. 04 24, 00000060
        call    io_in8                                  ; 284A _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 284F _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 2852 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 2856 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 285A _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 2861 _ E8, FFFFFFFC(rel)
        leave                                           ; 2866 _ C9
        ret                                             ; 2867 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 2868 _ 55
        mov     ebp, esp                                ; 2869 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 286B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 286E _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2871 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2873 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2876 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 287D _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2880 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2887 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 288A _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 288D _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2890 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2893 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2896 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2899 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 289C _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 28A3 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 28A6 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 28A9 _ 89. 50, 18
        pop     ebp                                     ; 28AC _ 5D
        ret                                             ; 28AD _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 28AE _ 55
        mov     ebp, esp                                ; 28AF _ 89. E5
        sub     esp, 40                                 ; 28B1 _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 28B4 _ 8B. 45, 0C
        mov     byte [ebp-1CH], al                      ; 28B7 _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 28BA _ 83. 7D, 08, 00
        jnz     ?_090                                   ; 28BE _ 75, 0A
        mov     eax, 4294967295                         ; 28C0 _ B8, FFFFFFFF
        jmp     ?_094                                   ; 28C5 _ E9, 000000B1

?_090:  mov     eax, dword [ebp+8H]                     ; 28CA _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 28CD _ 8B. 40, 10
        test    eax, eax                                ; 28D0 _ 85. C0
        jnz     ?_091                                   ; 28D2 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 28D4 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 28D7 _ 8B. 40, 14
        or      eax, 01H                                ; 28DA _ 83. C8, 01
        mov     edx, eax                                ; 28DD _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 28DF _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 28E2 _ 89. 50, 14
        mov     eax, 4294967295                         ; 28E5 _ B8, FFFFFFFF
        jmp     ?_094                                   ; 28EA _ E9, 0000008C

?_091:  mov     eax, dword [ebp+8H]                     ; 28EF _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 28F2 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 28F5 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 28F8 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 28FB _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 28FD _ 8B. 45, F4
        add     edx, eax                                ; 2900 _ 01. C2
        movzx   eax, byte [ebp-1CH]                     ; 2902 _ 0F B6. 45, E4
        mov     byte [edx], al                          ; 2906 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 2908 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 290B _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 290E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2911 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2914 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2917 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 291A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 291D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2920 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2923 _ 39. C2
        jnz     ?_092                                   ; 2925 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2927 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 292A _ C7. 40, 04, 00000000
?_092:  mov     eax, dword [ebp+8H]                     ; 2931 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2934 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2937 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 293A _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 293D _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2940 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2943 _ 8B. 40, 18
        test    eax, eax                                ; 2946 _ 85. C0
        jz      ?_093                                   ; 2948 _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 294A _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 294D _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 2950 _ 8B. 40, 04
        cmp     eax, 2                                  ; 2953 _ 83. F8, 02
        jz      ?_093                                   ; 2956 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 2958 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 295B _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 295E _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 2966 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 296E _ 89. 04 24
        call    task_run                                ; 2971 _ E8, FFFFFFFC(rel)
?_093:  mov     eax, 0                                  ; 2976 _ B8, 00000000
?_094:  leave                                           ; 297B _ C9
        ret                                             ; 297C _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 297D _ 55
        mov     ebp, esp                                ; 297E _ 89. E5
        sub     esp, 16                                 ; 2980 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 2983 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 2986 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2989 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 298C _ 8B. 40, 0C
        cmp     edx, eax                                ; 298F _ 39. C2
        jnz     ?_095                                   ; 2991 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 2993 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2996 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 299D _ B8, FFFFFFFF
        jmp     ?_097                                   ; 29A2 _ EB, 57

?_095:  mov     eax, dword [ebp+8H]                     ; 29A4 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 29A7 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 29AA _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 29AD _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 29B0 _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 29B2 _ 8B. 45, F8
        add     eax, edx                                ; 29B5 _ 01. D0
        movzx   eax, byte [eax]                         ; 29B7 _ 0F B6. 00
        movzx   eax, al                                 ; 29BA _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 29BD _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 29C0 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 29C3 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 29C6 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 29C9 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 29CC _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 29CF _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 29D2 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 29D5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 29D8 _ 8B. 40, 0C
        cmp     edx, eax                                ; 29DB _ 39. C2
        jnz     ?_096                                   ; 29DD _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 29DF _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 29E2 _ C7. 40, 08, 00000000
?_096:  mov     eax, dword [ebp+8H]                     ; 29E9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 29EC _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 29EF _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 29F2 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 29F5 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 29F8 _ 8B. 45, FC
?_097:  leave                                           ; 29FB _ C9
        ret                                             ; 29FC _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 29FD _ 55
        mov     ebp, esp                                ; 29FE _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2A00 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 2A03 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2A06 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2A09 _ 8B. 40, 10
        sub     edx, eax                                ; 2A0C _ 29. C2
        mov     eax, edx                                ; 2A0E _ 89. D0
        pop     ebp                                     ; 2A10 _ 5D
        ret                                             ; 2A11 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 2A12 _ 55
        mov     ebp, esp                                ; 2A13 _ 89. E5
        sub     esp, 4                                  ; 2A15 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 2A18 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 2A1B _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 2A1E _ 80. 7D, FC, 09
        jle     ?_098                                   ; 2A22 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 2A24 _ 0F B6. 45, FC
        add     eax, 55                                 ; 2A28 _ 83. C0, 37
        jmp     ?_099                                   ; 2A2B _ EB, 07

?_098:  movzx   eax, byte [ebp-4H]                      ; 2A2D _ 0F B6. 45, FC
        add     eax, 48                                 ; 2A31 _ 83. C0, 30
?_099:  leave                                           ; 2A34 _ C9
        ret                                             ; 2A35 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 2A36 _ 55
        mov     ebp, esp                                ; 2A37 _ 89. E5
        sub     esp, 24                                 ; 2A39 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 2A3C _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 2A3F _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 2A42 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 2A49 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 2A4D _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 2A50 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 2A53 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 2A57 _ 89. 04 24
        call    charToHexVal                            ; 2A5A _ E8, FFFFFFFC(rel)
        mov     byte [?_233], al                        ; 2A5F _ A2, 00000343(d)
        movzx   eax, byte [ebp-14H]                     ; 2A64 _ 0F B6. 45, EC
        shr     al, 4                                   ; 2A68 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 2A6B _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 2A6E _ 0F B6. 45, EC
        movsx   eax, al                                 ; 2A72 _ 0F BE. C0
        mov     dword [esp], eax                        ; 2A75 _ 89. 04 24
        call    charToHexVal                            ; 2A78 _ E8, FFFFFFFC(rel)
        mov     byte [?_232], al                        ; 2A7D _ A2, 00000342(d)
        mov     eax, keyval                             ; 2A82 _ B8, 00000340(d)
        leave                                           ; 2A87 _ C9
        ret                                             ; 2A88 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 2A89 _ 55
        mov     ebp, esp                                ; 2A8A _ 89. E5
        sub     esp, 16                                 ; 2A8C _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 2A8F _ C6. 05, 000002C0(d), 30
        mov     byte [?_236], 88                        ; 2A96 _ C6. 05, 000002C1(d), 58
        mov     byte [?_237], 0                         ; 2A9D _ C6. 05, 000002CA(d), 00
        mov     dword [ebp-0CH], 2                      ; 2AA4 _ C7. 45, F4, 00000002
        jmp     ?_101                                   ; 2AAB _ EB, 0F

?_100:  mov     eax, dword [ebp-0CH]                    ; 2AAD _ 8B. 45, F4
        add     eax, str.1386                           ; 2AB0 _ 05, 000002C0(d)
        mov     byte [eax], 48                          ; 2AB5 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 2AB8 _ 83. 45, F4, 01
?_101:  cmp     dword [ebp-0CH], 9                      ; 2ABC _ 83. 7D, F4, 09
        jle     ?_100                                   ; 2AC0 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 2AC2 _ C7. 45, F8, 00000009
        jmp     ?_105                                   ; 2AC9 _ EB, 40

?_102:  mov     eax, dword [ebp+8H]                     ; 2ACB _ 8B. 45, 08
        and     eax, 0FH                                ; 2ACE _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 2AD1 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2AD4 _ 8B. 45, 08
        shr     eax, 4                                  ; 2AD7 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 2ADA _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 2ADD _ 83. 7D, FC, 09
        jle     ?_103                                   ; 2AE1 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 2AE3 _ 8B. 45, FC
        add     eax, 55                                 ; 2AE6 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 2AE9 _ 8B. 55, F8
        add     edx, str.1386                           ; 2AEC _ 81. C2, 000002C0(d)
        mov     byte [edx], al                          ; 2AF2 _ 88. 02
        jmp     ?_104                                   ; 2AF4 _ EB, 11

?_103:  mov     eax, dword [ebp-4H]                     ; 2AF6 _ 8B. 45, FC
        add     eax, 48                                 ; 2AF9 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 2AFC _ 8B. 55, F8
        add     edx, str.1386                           ; 2AFF _ 81. C2, 000002C0(d)
        mov     byte [edx], al                          ; 2B05 _ 88. 02
?_104:  sub     dword [ebp-8H], 1                       ; 2B07 _ 83. 6D, F8, 01
?_105:  cmp     dword [ebp-8H], 1                       ; 2B0B _ 83. 7D, F8, 01
        jle     ?_106                                   ; 2B0F _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 2B11 _ 83. 7D, 08, 00
        jnz     ?_102                                   ; 2B15 _ 75, B4
?_106:  mov     eax, str.1386                           ; 2B17 _ B8, 000002C0(d)
        leave                                           ; 2B1C _ C9
        ret                                             ; 2B1D _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 2B1E _ 55
        mov     ebp, esp                                ; 2B1F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2B21 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 2B24 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 2B2A _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2B2D _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2B34 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2B37 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2B3E _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 2B41 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 2B48 _ 5D
        ret                                             ; 2B49 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 2B4A _ 55
        mov     ebp, esp                                ; 2B4B _ 89. E5
        sub     esp, 16                                 ; 2B4D _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2B50 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 2B57 _ C7. 45, F8, 00000000
        jmp     ?_108                                   ; 2B5E _ EB, 14

?_107:  mov     eax, dword [ebp+8H]                     ; 2B60 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2B63 _ 8B. 55, F8
        add     edx, 2                                  ; 2B66 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2B69 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 2B6D _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 2B70 _ 83. 45, F8, 01
?_108:  mov     eax, dword [ebp+8H]                     ; 2B74 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2B77 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 2B79 _ 3B. 45, F8
        ja      ?_107                                   ; 2B7C _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 2B7E _ 8B. 45, FC
        leave                                           ; 2B81 _ C9
        ret                                             ; 2B82 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 2B83 _ 55
        mov     ebp, esp                                ; 2B84 _ 89. E5
        sub     esp, 16                                 ; 2B86 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2B89 _ C7. 45, F8, 00000000
        jmp     ?_112                                   ; 2B90 _ E9, 00000085

?_109:  mov     eax, dword [ebp+8H]                     ; 2B95 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2B98 _ 8B. 55, F8
        add     edx, 2                                  ; 2B9B _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2B9E _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 2BA2 _ 3B. 45, 0C
        jc      ?_111                                   ; 2BA5 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 2BA7 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2BAA _ 8B. 55, F8
        add     edx, 2                                  ; 2BAD _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2BB0 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 2BB3 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2BB6 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2BB9 _ 8B. 55, F8
        add     edx, 2                                  ; 2BBC _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2BBF _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 2BC2 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 2BC5 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2BC8 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2BCB _ 8B. 55, F8
        add     edx, 2                                  ; 2BCE _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 2BD1 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 2BD4 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2BD7 _ 8B. 55, F8
        add     edx, 2                                  ; 2BDA _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2BDD _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 2BE1 _ 2B. 45, 0C
        mov     edx, eax                                ; 2BE4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2BE6 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 2BE9 _ 8B. 4D, F8
        add     ecx, 2                                  ; 2BEC _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 2BEF _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 2BF3 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2BF6 _ 8B. 55, F8
        add     edx, 2                                  ; 2BF9 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2BFC _ 8B. 44 D0, 04
        test    eax, eax                                ; 2C00 _ 85. C0
        jnz     ?_110                                   ; 2C02 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 2C04 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2C07 _ 8B. 00
        lea     edx, [eax-1H]                           ; 2C09 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2C0C _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2C0F _ 89. 10
?_110:  mov     eax, dword [ebp-4H]                     ; 2C11 _ 8B. 45, FC
        jmp     ?_113                                   ; 2C14 _ EB, 17

?_111:  add     dword [ebp-8H], 1                       ; 2C16 _ 83. 45, F8, 01
?_112:  mov     eax, dword [ebp+8H]                     ; 2C1A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2C1D _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 2C1F _ 3B. 45, F8
        ja      ?_109                                   ; 2C22 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 2C28 _ B8, 00000000
?_113:  leave                                           ; 2C2D _ C9
        ret                                             ; 2C2E _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 2C2F _ 55
        mov     ebp, esp                                ; 2C30 _ 89. E5
        push    ebx                                     ; 2C32 _ 53
        sub     esp, 16                                 ; 2C33 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 2C36 _ C7. 45, F4, 00000000
        jmp     ?_116                                   ; 2C3D _ EB, 17

?_114:  mov     eax, dword [ebp+8H]                     ; 2C3F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2C42 _ 8B. 55, F4
        add     edx, 2                                  ; 2C45 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2C48 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 2C4B _ 3B. 45, 0C
        jbe     ?_115                                   ; 2C4E _ 76, 02
        jmp     ?_117                                   ; 2C50 _ EB, 0E

?_115:  add     dword [ebp-0CH], 1                      ; 2C52 _ 83. 45, F4, 01
?_116:  mov     eax, dword [ebp+8H]                     ; 2C56 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2C59 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2C5B _ 3B. 45, F4
        jg      ?_114                                   ; 2C5E _ 7F, DF
?_117:  cmp     dword [ebp-0CH], 0                      ; 2C60 _ 83. 7D, F4, 00
        jle     ?_119                                   ; 2C64 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 2C6A _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2C6D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2C70 _ 8B. 45, 08
        add     edx, 2                                  ; 2C73 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2C76 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 2C79 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 2C7C _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 2C7F _ 8B. 45, 08
        add     ecx, 2                                  ; 2C82 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 2C85 _ 8B. 44 C8, 04
        add     eax, edx                                ; 2C89 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 2C8B _ 3B. 45, 0C
        jne     ?_119                                   ; 2C8E _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 2C94 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 2C97 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2C9A _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2C9D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2CA0 _ 8B. 45, 08
        add     edx, 2                                  ; 2CA3 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2CA6 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2CAA _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2CAD _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2CB0 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 2CB3 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2CB6 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2CBA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2CBD _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2CBF _ 3B. 45, F4
        jle     ?_118                                   ; 2CC2 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 2CC4 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 2CC7 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 2CCA _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2CCD _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2CD0 _ 8B. 55, F4
        add     edx, 2                                  ; 2CD3 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2CD6 _ 8B. 04 D0
        cmp     ecx, eax                                ; 2CD9 _ 39. C1
        jnz     ?_118                                   ; 2CDB _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 2CDD _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 2CE0 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2CE3 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2CE6 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2CE9 _ 8B. 45, 08
        add     edx, 2                                  ; 2CEC _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2CEF _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 2CF3 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 2CF6 _ 8B. 4D, F4
        add     ecx, 2                                  ; 2CF9 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 2CFC _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 2D00 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2D03 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 2D06 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2D09 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2D0D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2D10 _ 8B. 00
        lea     edx, [eax-1H]                           ; 2D12 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2D15 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2D18 _ 89. 10
?_118:  mov     eax, 0                                  ; 2D1A _ B8, 00000000
        jmp     ?_125                                   ; 2D1F _ E9, 0000011C

?_119:  mov     eax, dword [ebp+8H]                     ; 2D24 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2D27 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2D29 _ 3B. 45, F4
        jle     ?_120                                   ; 2D2C _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 2D2E _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 2D31 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 2D34 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2D37 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2D3A _ 8B. 55, F4
        add     edx, 2                                  ; 2D3D _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2D40 _ 8B. 04 D0
        cmp     ecx, eax                                ; 2D43 _ 39. C1
        jnz     ?_120                                   ; 2D45 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 2D47 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2D4A _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2D4D _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2D50 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2D53 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 2D56 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2D59 _ 8B. 55, F4
        add     edx, 2                                  ; 2D5C _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2D5F _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2D63 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2D66 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2D69 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2D6C _ 8B. 55, F4
        add     edx, 2                                  ; 2D6F _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2D72 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 2D76 _ B8, 00000000
        jmp     ?_125                                   ; 2D7B _ E9, 000000C0

?_120:  mov     eax, dword [ebp+8H]                     ; 2D80 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2D83 _ 8B. 00
        cmp     eax, 4095                               ; 2D85 _ 3D, 00000FFF
        jg      ?_124                                   ; 2D8A _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 2D90 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2D93 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 2D95 _ 89. 45, F8
        jmp     ?_122                                   ; 2D98 _ EB, 28

?_121:  mov     eax, dword [ebp-8H]                     ; 2D9A _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 2D9D _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 2DA0 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 2DA3 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 2DA6 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 2DA9 _ 8B. 45, 08
        add     edx, 2                                  ; 2DAC _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 2DAF _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 2DB2 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 2DB4 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 2DB7 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 2DBA _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 2DBE _ 83. 6D, F8, 01
?_122:  mov     eax, dword [ebp-8H]                     ; 2DC2 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 2DC5 _ 3B. 45, F4
        jg      ?_121                                   ; 2DC8 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 2DCA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2DCD _ 8B. 00
        lea     edx, [eax+1H]                           ; 2DCF _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2DD2 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2DD5 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2DD7 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2DDA _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2DDD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2DE0 _ 8B. 00
        cmp     edx, eax                                ; 2DE2 _ 39. C2
        jge     ?_123                                   ; 2DE4 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 2DE6 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2DE9 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2DEB _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2DEE _ 89. 50, 04
?_123:  mov     eax, dword [ebp+8H]                     ; 2DF1 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2DF4 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2DF7 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2DFA _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2DFD _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 2E00 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2E03 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2E06 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 2E09 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 2E0C _ 89. 54 C8, 04
        mov     eax, 0                                  ; 2E10 _ B8, 00000000
        jmp     ?_125                                   ; 2E15 _ EB, 29

?_124:  mov     eax, dword [ebp+8H]                     ; 2E17 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2E1A _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 2E1D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2E20 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2E23 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2E26 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2E29 _ 8B. 40, 08
        mov     edx, eax                                ; 2E2C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2E2E _ 8B. 45, 10
        add     eax, edx                                ; 2E31 _ 01. D0
        mov     edx, eax                                ; 2E33 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2E35 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2E38 _ 89. 50, 08
        mov     eax, 4294967295                         ; 2E3B _ B8, FFFFFFFF
?_125:  add     esp, 16                                 ; 2E40 _ 83. C4, 10
        pop     ebx                                     ; 2E43 _ 5B
        pop     ebp                                     ; 2E44 _ 5D
        ret                                             ; 2E45 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 2E46 _ 55
        mov     ebp, esp                                ; 2E47 _ 89. E5
        sub     esp, 24                                 ; 2E49 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 2E4C _ 8B. 45, 0C
        add     eax, 4095                               ; 2E4F _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2E54 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 2E59 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 2E5C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2E5F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E63 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E66 _ 89. 04 24
        call    memman_alloc                            ; 2E69 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 2E6E _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2E71 _ 8B. 45, FC
        leave                                           ; 2E74 _ C9
        ret                                             ; 2E75 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 2E76 _ 55
        mov     ebp, esp                                ; 2E77 _ 89. E5
        sub     esp, 28                                 ; 2E79 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 2E7C _ 8B. 45, 10
        add     eax, 4095                               ; 2E7F _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2E84 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 2E89 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 2E8C _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 2E8F _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2E93 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2E96 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E9A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E9D _ 89. 04 24
        call    memman_free                             ; 2EA0 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 2EA5 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2EA8 _ 8B. 45, FC
        leave                                           ; 2EAB _ C9
        ret                                             ; 2EAC _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 2EAD _ 55
        mov     ebp, esp                                ; 2EAE _ 89. E5
        sub     esp, 40                                 ; 2EB0 _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 2EB3 _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 2EBB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2EBE _ 89. 04 24
        call    memman_alloc_4k                         ; 2EC1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2EC6 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 2EC9 _ 83. 7D, F4, 00
        jnz     ?_126                                   ; 2ECD _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 2ECF _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 2ED2 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 2EDA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2EDE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2EE1 _ 89. 04 24
        call    memman_free_4k                          ; 2EE4 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 2EE9 _ B8, 00000000
        jmp     ?_130                                   ; 2EEE _ E9, 0000009D

?_126:  mov     eax, dword [ebp-0CH]                    ; 2EF3 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 2EF6 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2EF9 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 2EFB _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 2EFE _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 2F01 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 2F04 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 2F07 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 2F0A _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2F0D _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 2F10 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 2F17 _ C7. 45, F0, 00000000
        jmp     ?_128                                   ; 2F1E _ EB, 1B

?_127:  mov     eax, dword [ebp-0CH]                    ; 2F20 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 2F23 _ 8B. 55, F0
        add     edx, 33                                 ; 2F26 _ 83. C2, 21
        shl     edx, 5                                  ; 2F29 _ C1. E2, 05
        add     eax, edx                                ; 2F2C _ 01. D0
        add     eax, 16                                 ; 2F2E _ 83. C0, 10
        mov     dword [eax], 0                          ; 2F31 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 2F37 _ 83. 45, F0, 01
?_128:  cmp     dword [ebp-10H], 255                    ; 2F3B _ 81. 7D, F0, 000000FF
        jle     ?_127                                   ; 2F42 _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 2F44 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 2F47 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 2F4B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F4F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F52 _ 89. 04 24
        call    memman_alloc_4k                         ; 2F55 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 2F5A _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2F5C _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 2F5F _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 2F62 _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 2F65 _ 8B. 40, 10
        test    eax, eax                                ; 2F68 _ 85. C0
        jnz     ?_129                                   ; 2F6A _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 2F6C _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 2F6F _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 2F77 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2F7B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2F7E _ 89. 04 24
        call    memman_free_4k                          ; 2F81 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 2F86 _ B8, 00000000
        jmp     ?_130                                   ; 2F8B _ EB, 03

?_129:  mov     eax, dword [ebp-0CH]                    ; 2F8D _ 8B. 45, F4
?_130:  leave                                           ; 2F90 _ C9
        ret                                             ; 2F91 _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 2F92 _ 55
        mov     ebp, esp                                ; 2F93 _ 89. E5
        sub     esp, 16                                 ; 2F95 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2F98 _ C7. 45, F8, 00000000
        jmp     ?_133                                   ; 2F9F _ EB, 5B

?_131:  mov     eax, dword [ebp+8H]                     ; 2FA1 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2FA4 _ 8B. 55, F8
        add     edx, 33                                 ; 2FA7 _ 83. C2, 21
        shl     edx, 5                                  ; 2FAA _ C1. E2, 05
        add     eax, edx                                ; 2FAD _ 01. D0
        add     eax, 16                                 ; 2FAF _ 83. C0, 10
        mov     eax, dword [eax]                        ; 2FB2 _ 8B. 00
        test    eax, eax                                ; 2FB4 _ 85. C0
        jnz     ?_132                                   ; 2FB6 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 2FB8 _ 8B. 45, F8
        shl     eax, 5                                  ; 2FBB _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 2FBE _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 2FC4 _ 8B. 45, 08
        add     eax, edx                                ; 2FC7 _ 01. D0
        add     eax, 4                                  ; 2FC9 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 2FCC _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2FCF _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2FD2 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 2FD5 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 2FD8 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 2FDB _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 2FDF _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 2FE2 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 2FE9 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 2FEC _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 2FF3 _ 8B. 45, FC
        jmp     ?_134                                   ; 2FF6 _ EB, 12

?_132:  add     dword [ebp-8H], 1                       ; 2FF8 _ 83. 45, F8, 01
?_133:  cmp     dword [ebp-8H], 255                     ; 2FFC _ 81. 7D, F8, 000000FF
        jle     ?_131                                   ; 3003 _ 7E, 9C
        mov     eax, 0                                  ; 3005 _ B8, 00000000
?_134:  leave                                           ; 300A _ C9
        ret                                             ; 300B _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 300C _ 55
        mov     ebp, esp                                ; 300D _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 300F _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3012 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3015 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3017 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 301A _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 301D _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 3020 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 3023 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 3026 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3029 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 302C _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 302F _ 89. 50, 14
        pop     ebp                                     ; 3032 _ 5D
        ret                                             ; 3033 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 3034 _ 55
        mov     ebp, esp                                ; 3035 _ 89. E5
        push    esi                                     ; 3037 _ 56
        push    ebx                                     ; 3038 _ 53
        sub     esp, 48                                 ; 3039 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 303C _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 303F _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 3042 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3045 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3048 _ 8B. 40, 0C
        add     eax, 1                                  ; 304B _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 304E _ 3B. 45, 10
        jge     ?_135                                   ; 3051 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 3053 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3056 _ 8B. 40, 0C
        add     eax, 1                                  ; 3059 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 305C _ 89. 45, 10
?_135:  cmp     dword [ebp+10H], -1                     ; 305F _ 83. 7D, 10, FF
        jge     ?_136                                   ; 3063 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 3065 _ C7. 45, 10, FFFFFFFF
?_136:  mov     eax, dword [ebp+0CH]                    ; 306C _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 306F _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 3072 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 3075 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3078 _ 3B. 45, 10
        jle     ?_143                                   ; 307B _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 3081 _ 83. 7D, 10, 00
        js      ?_139                                   ; 3085 _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 308B _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 308E _ 89. 45, F0
        jmp     ?_138                                   ; 3091 _ EB, 34

?_137:  mov     eax, dword [ebp-10H]                    ; 3093 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 3096 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3099 _ 8B. 45, 08
        add     edx, 4                                  ; 309C _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 309F _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 30A3 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 30A6 _ 8B. 4D, F0
        add     ecx, 4                                  ; 30A9 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 30AC _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 30B0 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 30B3 _ 8B. 55, F0
        add     edx, 4                                  ; 30B6 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 30B9 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 30BD _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 30C0 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 30C3 _ 83. 6D, F0, 01
?_138:  mov     eax, dword [ebp-10H]                    ; 30C7 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 30CA _ 3B. 45, 10
        jg      ?_137                                   ; 30CD _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 30CF _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 30D2 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 30D5 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 30D8 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 30DB _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 30DF _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 30E2 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 30E5 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 30E8 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 30EB _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 30EE _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 30F1 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 30F4 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 30F7 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 30FA _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 30FD _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3100 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3103 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3106 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3109 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 310C _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 310F _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3113 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3117 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 311B _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 311F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3123 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3126 _ 89. 04 24
        call    sheet_refresh_map                       ; 3129 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 312E _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3131 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 3134 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3137 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 313A _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 313D _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3140 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3143 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3146 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3149 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 314C _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 314F _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3152 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3155 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3158 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 315B _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 315E _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3162 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3166 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 316A _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 316E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3172 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3175 _ 89. 04 24
        call    sheet_refresh_local                     ; 3178 _ E8, FFFFFFFC(rel)
        jmp     ?_150                                   ; 317D _ E9, 0000026C

?_139:  mov     eax, dword [ebp+8H]                     ; 3182 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3185 _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 3188 _ 3B. 45, F4
        jle     ?_142                                   ; 318B _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 318D _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3190 _ 89. 45, F0
        jmp     ?_141                                   ; 3193 _ EB, 34

?_140:  mov     eax, dword [ebp-10H]                    ; 3195 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3198 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 319B _ 8B. 45, 08
        add     edx, 4                                  ; 319E _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 31A1 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 31A5 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 31A8 _ 8B. 4D, F0
        add     ecx, 4                                  ; 31AB _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 31AE _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 31B2 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 31B5 _ 8B. 55, F0
        add     edx, 4                                  ; 31B8 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 31BB _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 31BF _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 31C2 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 31C5 _ 83. 45, F0, 01
?_141:  mov     eax, dword [ebp+8H]                     ; 31C9 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 31CC _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 31CF _ 3B. 45, F0
        jg      ?_140                                   ; 31D2 _ 7F, C1
?_142:  mov     eax, dword [ebp+8H]                     ; 31D4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 31D7 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 31DA _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 31DD _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 31E0 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 31E3 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 31E6 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 31E9 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 31EC _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 31EF _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 31F2 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 31F5 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 31F8 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 31FB _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 31FE _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3201 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3204 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3207 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 320A _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 320D _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3215 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3219 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 321D _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3221 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3225 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3228 _ 89. 04 24
        call    sheet_refresh_map                       ; 322B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3230 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3233 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3236 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3239 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 323C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 323F _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3242 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3245 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3248 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 324B _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 324E _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3251 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3254 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3257 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 325A _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3262 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 3266 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 326A _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 326E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3272 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3275 _ 89. 04 24
        call    sheet_refresh_local                     ; 3278 _ E8, FFFFFFFC(rel)
        jmp     ?_150                                   ; 327D _ E9, 0000016C

?_143:  mov     eax, dword [ebp-0CH]                    ; 3282 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 3285 _ 3B. 45, 10
        jge     ?_150                                   ; 3288 _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 328E _ 83. 7D, F4, 00
        js      ?_146                                   ; 3292 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 3294 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 3297 _ 89. 45, F0
        jmp     ?_145                                   ; 329A _ EB, 34

?_144:  mov     eax, dword [ebp-10H]                    ; 329C _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 329F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 32A2 _ 8B. 45, 08
        add     edx, 4                                  ; 32A5 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 32A8 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 32AC _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 32AF _ 8B. 4D, F0
        add     ecx, 4                                  ; 32B2 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 32B5 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 32B9 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 32BC _ 8B. 55, F0
        add     edx, 4                                  ; 32BF _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 32C2 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 32C6 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 32C9 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 32CC _ 83. 45, F0, 01
?_145:  mov     eax, dword [ebp-10H]                    ; 32D0 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 32D3 _ 3B. 45, 10
        jl      ?_144                                   ; 32D6 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 32D8 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 32DB _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 32DE _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 32E1 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 32E4 _ 89. 54 88, 04
        jmp     ?_149                                   ; 32E8 _ EB, 6C

?_146:  mov     eax, dword [ebp+8H]                     ; 32EA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 32ED _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 32F0 _ 89. 45, F0
        jmp     ?_148                                   ; 32F3 _ EB, 3A

?_147:  mov     eax, dword [ebp-10H]                    ; 32F5 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 32F8 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 32FB _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 32FE _ 8B. 55, F0
        add     edx, 4                                  ; 3301 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 3304 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 3308 _ 8B. 45, 08
        add     ecx, 4                                  ; 330B _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 330E _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 3312 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 3315 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3318 _ 8B. 45, 08
        add     edx, 4                                  ; 331B _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 331E _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3322 _ 8B. 55, F0
        add     edx, 1                                  ; 3325 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 3328 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 332B _ 83. 6D, F0, 01
?_148:  mov     eax, dword [ebp-10H]                    ; 332F _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3332 _ 3B. 45, 10
        jge     ?_147                                   ; 3335 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 3337 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 333A _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 333D _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3340 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3343 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 3347 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 334A _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 334D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3350 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3353 _ 89. 50, 0C
?_149:  mov     eax, dword [ebp+0CH]                    ; 3356 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3359 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 335C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 335F _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3362 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3365 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3368 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 336B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 336E _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3371 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3374 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3377 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 337A _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 337D _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 3380 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3383 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3387 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 338B _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 338F _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3393 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3397 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 339A _ 89. 04 24
        call    sheet_refresh_map                       ; 339D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 33A2 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 33A5 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 33A8 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 33AB _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 33AE _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 33B1 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 33B4 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 33B7 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 33BA _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 33BD _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 33C0 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 33C3 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 33C6 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 33C9 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 33CC _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 33CF _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 33D3 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 33D7 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 33DB _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 33DF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 33E3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 33E6 _ 89. 04 24
        call    sheet_refresh_local                     ; 33E9 _ E8, FFFFFFFC(rel)
?_150:  add     esp, 48                                 ; 33EE _ 83. C4, 30
        pop     ebx                                     ; 33F1 _ 5B
        pop     esi                                     ; 33F2 _ 5E
        pop     ebp                                     ; 33F3 _ 5D
        ret                                             ; 33F4 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 33F5 _ 55
        mov     ebp, esp                                ; 33F6 _ 89. E5
        push    edi                                     ; 33F8 _ 57
        push    esi                                     ; 33F9 _ 56
        push    ebx                                     ; 33FA _ 53
        sub     esp, 44                                 ; 33FB _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 33FE _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3401 _ 8B. 40, 18
        test    eax, eax                                ; 3404 _ 85. C0
        js      ?_151                                   ; 3406 _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 3408 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 340B _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 340E _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 3411 _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 3414 _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 3417 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 341A _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 341D _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 3420 _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 3423 _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 3426 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 3429 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 342C _ 8B. 55, 14
        add     ecx, edx                                ; 342F _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 3431 _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 3434 _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 3437 _ 8B. 55, 10
        add     edx, edi                                ; 343A _ 01. FA
        mov     dword [esp+14H], eax                    ; 343C _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 3440 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 3444 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 3448 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 344C _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 3450 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3453 _ 89. 04 24
        call    sheet_refresh_local                     ; 3456 _ E8, FFFFFFFC(rel)
?_151:  mov     eax, 0                                  ; 345B _ B8, 00000000
        add     esp, 44                                 ; 3460 _ 83. C4, 2C
        pop     ebx                                     ; 3463 _ 5B
        pop     esi                                     ; 3464 _ 5E
        pop     edi                                     ; 3465 _ 5F
        pop     ebp                                     ; 3466 _ 5D
        ret                                             ; 3467 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 3468 _ 55
        mov     ebp, esp                                ; 3469 _ 89. E5
        push    ebx                                     ; 346B _ 53
        sub     esp, 52                                 ; 346C _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 346F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3472 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 3475 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 3478 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 347B _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 347E _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 3481 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3484 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 3487 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 348A _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 348D _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 3490 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3493 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3496 _ 8B. 40, 18
        test    eax, eax                                ; 3499 _ 85. C0
        js      ?_152                                   ; 349B _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 34A1 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 34A4 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 34A7 _ 8B. 45, F4
        add     edx, eax                                ; 34AA _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 34AC _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 34AF _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 34B2 _ 8B. 45, F0
        add     eax, ecx                                ; 34B5 _ 01. C8
        mov     dword [esp+14H], 0                      ; 34B7 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 34BF _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 34C3 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 34C7 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 34CA _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 34CE _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 34D1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 34D5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 34D8 _ 89. 04 24
        call    sheet_refresh_map                       ; 34DB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 34E0 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 34E3 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 34E6 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 34E9 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 34EC _ 8B. 55, 14
        add     ecx, edx                                ; 34EF _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 34F1 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 34F4 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 34F7 _ 8B. 55, 10
        add     edx, ebx                                ; 34FA _ 01. DA
        mov     dword [esp+14H], eax                    ; 34FC _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 3500 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 3504 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 3508 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 350B _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 350F _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 3512 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3516 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3519 _ 89. 04 24
        call    sheet_refresh_map                       ; 351C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3521 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 3524 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 3527 _ 8B. 45, F4
        add     edx, eax                                ; 352A _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 352C _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 352F _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 3532 _ 8B. 45, F0
        add     eax, ecx                                ; 3535 _ 01. C8
        mov     dword [esp+14H], 0                      ; 3537 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 353F _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 3543 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 3547 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 354A _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 354E _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 3551 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3555 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3558 _ 89. 04 24
        call    sheet_refresh_local                     ; 355B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3560 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3563 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 3566 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 3569 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 356C _ 8B. 55, 14
        add     ecx, edx                                ; 356F _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 3571 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 3574 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 3577 _ 8B. 55, 10
        add     edx, ebx                                ; 357A _ 01. DA
        mov     dword [esp+14H], eax                    ; 357C _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 3580 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 3584 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 3588 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 358B _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 358F _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 3592 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3596 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3599 _ 89. 04 24
        call    sheet_refresh_local                     ; 359C _ E8, FFFFFFFC(rel)
?_152:  add     esp, 52                                 ; 35A1 _ 83. C4, 34
        pop     ebx                                     ; 35A4 _ 5B
        pop     ebp                                     ; 35A5 _ 5D
        ret                                             ; 35A6 _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 35A7 _ 55
        mov     ebp, esp                                ; 35A8 _ 89. E5
        sub     esp, 48                                 ; 35AA _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 35AD _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 35B0 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 35B2 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 35B5 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 35B8 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 35BB _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 35BE _ 83. 7D, 0C, 00
        jns     ?_153                                   ; 35C2 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 35C4 _ C7. 45, 0C, 00000000
?_153:  cmp     dword [ebp+10H], 0                      ; 35CB _ 83. 7D, 10, 00
        jns     ?_154                                   ; 35CF _ 79, 07
        mov     dword [ebp+10H], 0                      ; 35D1 _ C7. 45, 10, 00000000
?_154:  mov     eax, dword [ebp+8H]                     ; 35D8 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 35DB _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 35DE _ 3B. 45, 14
        jge     ?_155                                   ; 35E1 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 35E3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 35E6 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 35E9 _ 89. 45, 14
?_155:  mov     eax, dword [ebp+8H]                     ; 35EC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 35EF _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 35F2 _ 3B. 45, 18
        jge     ?_156                                   ; 35F5 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 35F7 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 35FA _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 35FD _ 89. 45, 18
?_156:  mov     eax, dword [ebp+1CH]                    ; 3600 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 3603 _ 89. 45, DC
        jmp     ?_163                                   ; 3606 _ E9, 00000119

?_157:  mov     eax, dword [ebp+8H]                     ; 360B _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 360E _ 8B. 55, DC
        add     edx, 4                                  ; 3611 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3614 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 3618 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 361B _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 361E _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 3620 _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 3623 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 3626 _ 8B. 45, 08
        add     eax, 1044                               ; 3629 _ 05, 00000414
        sub     edx, eax                                ; 362E _ 29. C2
        mov     eax, edx                                ; 3630 _ 89. D0
        sar     eax, 5                                  ; 3632 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 3635 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 3638 _ C7. 45, E4, 00000000
        jmp     ?_162                                   ; 363F _ E9, 000000CD

?_158:  mov     eax, dword [ebp-10H]                    ; 3644 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 3647 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 364A _ 8B. 45, E4
        add     eax, edx                                ; 364D _ 01. D0
        mov     dword [ebp-8H], eax                     ; 364F _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 3652 _ C7. 45, E0, 00000000
        jmp     ?_161                                   ; 3659 _ E9, 000000A0

?_159:  mov     eax, dword [ebp-10H]                    ; 365E _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 3661 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 3664 _ 8B. 45, E0
        add     eax, edx                                ; 3667 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 3669 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 366C _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 366F _ 3B. 45, FC
        jg      ?_160                                   ; 3672 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 3678 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 367B _ 3B. 45, 14
        jge     ?_160                                   ; 367E _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 3680 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 3683 _ 3B. 45, F8
        jg      ?_160                                   ; 3686 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 3688 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 368B _ 3B. 45, 18
        jge     ?_160                                   ; 368E _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 3690 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3693 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 3696 _ 0F AF. 45, E4
        mov     edx, eax                                ; 369A _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 369C _ 8B. 45, E0
        add     eax, edx                                ; 369F _ 01. D0
        mov     edx, eax                                ; 36A1 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 36A3 _ 8B. 45, F4
        add     eax, edx                                ; 36A6 _ 01. D0
        movzx   eax, byte [eax]                         ; 36A8 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 36AB _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 36AE _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 36B2 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 36B5 _ 8B. 40, 14
        cmp     edx, eax                                ; 36B8 _ 39. C2
        jz      ?_160                                   ; 36BA _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 36BC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 36BF _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 36C2 _ 0F AF. 45, F8
        mov     edx, eax                                ; 36C6 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 36C8 _ 8B. 45, FC
        add     eax, edx                                ; 36CB _ 01. D0
        mov     edx, eax                                ; 36CD _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 36CF _ 8B. 45, EC
        add     eax, edx                                ; 36D2 _ 01. D0
        movzx   eax, byte [eax]                         ; 36D4 _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 36D7 _ 3A. 45, DA
        jnz     ?_160                                   ; 36DA _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 36DC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 36DF _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 36E2 _ 0F AF. 45, F8
        mov     edx, eax                                ; 36E6 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 36E8 _ 8B. 45, FC
        add     eax, edx                                ; 36EB _ 01. D0
        mov     edx, eax                                ; 36ED _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 36EF _ 8B. 45, E8
        add     edx, eax                                ; 36F2 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 36F4 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 36F8 _ 88. 02
?_160:  add     dword [ebp-20H], 1                      ; 36FA _ 83. 45, E0, 01
?_161:  mov     eax, dword [ebp-10H]                    ; 36FE _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3701 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 3704 _ 3B. 45, E0
        jg      ?_159                                   ; 3707 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 370D _ 83. 45, E4, 01
?_162:  mov     eax, dword [ebp-10H]                    ; 3711 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 3714 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 3717 _ 3B. 45, E4
        jg      ?_158                                   ; 371A _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 3720 _ 83. 45, DC, 01
?_163:  mov     eax, dword [ebp+8H]                     ; 3724 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3727 _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 372A _ 3B. 45, DC
        jge     ?_157                                   ; 372D _ 0F 8D, FFFFFED8
        leave                                           ; 3733 _ C9
        ret                                             ; 3734 _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 3735 _ 55
        mov     ebp, esp                                ; 3736 _ 89. E5
        sub     esp, 64                                 ; 3738 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 373B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 373E _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 3740 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 3743 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 3746 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 3749 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 374C _ 83. 7D, 0C, 00
        jns     ?_164                                   ; 3750 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 3752 _ C7. 45, 0C, 00000000
?_164:  cmp     dword [ebp+10H], 0                      ; 3759 _ 83. 7D, 10, 00
        jns     ?_165                                   ; 375D _ 79, 07
        mov     dword [ebp+10H], 0                      ; 375F _ C7. 45, 10, 00000000
?_165:  mov     eax, dword [ebp+8H]                     ; 3766 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3769 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 376C _ 3B. 45, 14
        jge     ?_166                                   ; 376F _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3771 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3774 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 3777 _ 89. 45, 14
?_166:  mov     eax, dword [ebp+8H]                     ; 377A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 377D _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 3780 _ 3B. 45, 18
        jge     ?_167                                   ; 3783 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3785 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3788 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 378B _ 89. 45, 18
?_167:  mov     eax, dword [ebp+1CH]                    ; 378E _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 3791 _ 89. 45, CC
        jmp     ?_178                                   ; 3794 _ E9, 00000141

?_168:  mov     eax, dword [ebp+8H]                     ; 3799 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 379C _ 8B. 55, CC
        add     edx, 4                                  ; 379F _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 37A2 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 37A6 _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 37A9 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 37AC _ 8B. 45, 08
        add     eax, 1044                               ; 37AF _ 05, 00000414
        sub     edx, eax                                ; 37B4 _ 29. C2
        mov     eax, edx                                ; 37B6 _ 89. D0
        sar     eax, 5                                  ; 37B8 _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 37BB _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 37BE _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 37C1 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 37C3 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 37C6 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 37C9 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 37CC _ 8B. 55, 0C
        sub     edx, eax                                ; 37CF _ 29. C2
        mov     eax, edx                                ; 37D1 _ 89. D0
        mov     dword [ebp-30H], eax                    ; 37D3 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 37D6 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 37D9 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 37DC _ 8B. 55, 10
        sub     edx, eax                                ; 37DF _ 29. C2
        mov     eax, edx                                ; 37E1 _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 37E3 _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 37E6 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 37E9 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 37EC _ 8B. 55, 14
        sub     edx, eax                                ; 37EF _ 29. C2
        mov     eax, edx                                ; 37F1 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 37F3 _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 37F6 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 37F9 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 37FC _ 8B. 55, 18
        sub     edx, eax                                ; 37FF _ 29. C2
        mov     eax, edx                                ; 3801 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 3803 _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 3806 _ 83. 7D, D0, 00
        jns     ?_169                                   ; 380A _ 79, 07
        mov     dword [ebp-30H], 0                      ; 380C _ C7. 45, D0, 00000000
?_169:  cmp     dword [ebp-2CH], 0                      ; 3813 _ 83. 7D, D4, 00
        jns     ?_170                                   ; 3817 _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 3819 _ C7. 45, D4, 00000000
?_170:  mov     eax, dword [ebp-10H]                    ; 3820 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3823 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 3826 _ 3B. 45, D8
        jge     ?_171                                   ; 3829 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 382B _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 382E _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 3831 _ 89. 45, D8
?_171:  mov     eax, dword [ebp-10H]                    ; 3834 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 3837 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 383A _ 3B. 45, DC
        jge     ?_172                                   ; 383D _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 383F _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 3842 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 3845 _ 89. 45, DC
?_172:  mov     eax, dword [ebp-2CH]                    ; 3848 _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 384B _ 89. 45, E4
        jmp     ?_177                                   ; 384E _ EB, 7A

?_173:  mov     eax, dword [ebp-10H]                    ; 3850 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 3853 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 3856 _ 8B. 45, E4
        add     eax, edx                                ; 3859 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 385B _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 385E _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 3861 _ 89. 45, E0
        jmp     ?_176                                   ; 3864 _ EB, 58

?_174:  mov     eax, dword [ebp-10H]                    ; 3866 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 3869 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 386C _ 8B. 45, E0
        add     eax, edx                                ; 386F _ 01. D0
        mov     dword [ebp-4H], eax                     ; 3871 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 3874 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3877 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 387A _ 0F AF. 45, E4
        mov     edx, eax                                ; 387E _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 3880 _ 8B. 45, E0
        add     eax, edx                                ; 3883 _ 01. D0
        mov     edx, eax                                ; 3885 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3887 _ 8B. 45, F4
        add     eax, edx                                ; 388A _ 01. D0
        movzx   eax, byte [eax]                         ; 388C _ 0F B6. 00
        movzx   edx, al                                 ; 388F _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 3892 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 3895 _ 8B. 40, 14
        cmp     edx, eax                                ; 3898 _ 39. C2
        jz      ?_175                                   ; 389A _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 389C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 389F _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 38A2 _ 0F AF. 45, F8
        mov     edx, eax                                ; 38A6 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 38A8 _ 8B. 45, FC
        add     eax, edx                                ; 38AB _ 01. D0
        mov     edx, eax                                ; 38AD _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 38AF _ 8B. 45, EC
        add     edx, eax                                ; 38B2 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 38B4 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 38B8 _ 88. 02
?_175:  add     dword [ebp-20H], 1                      ; 38BA _ 83. 45, E0, 01
?_176:  mov     eax, dword [ebp-20H]                    ; 38BE _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 38C1 _ 3B. 45, D8
        jl      ?_174                                   ; 38C4 _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 38C6 _ 83. 45, E4, 01
?_177:  mov     eax, dword [ebp-1CH]                    ; 38CA _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 38CD _ 3B. 45, DC
        jl      ?_173                                   ; 38D0 _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 38D6 _ 83. 45, CC, 01
?_178:  mov     eax, dword [ebp+8H]                     ; 38DA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 38DD _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 38E0 _ 3B. 45, CC
        jge     ?_168                                   ; 38E3 _ 0F 8D, FFFFFEB0
        leave                                           ; 38E9 _ C9
        ret                                             ; 38EA _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 38EB _ 55
        mov     ebp, esp                                ; 38EC _ 89. E5
        sub     esp, 40                                 ; 38EE _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 38F1 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 38F9 _ C7. 04 24, 00000043
        call    io_out8                                 ; 3900 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 3905 _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 390D _ C7. 04 24, 00000040
        call    io_out8                                 ; 3914 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 3919 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 3921 _ C7. 04 24, 00000040
        call    io_out8                                 ; 3928 _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 392D _ C7. 05, 000002E0(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 3937 _ C7. 45, F4, 00000000
        jmp     ?_180                                   ; 393E _ EB, 28

?_179:  mov     eax, dword [ebp-0CH]                    ; 3940 _ 8B. 45, F4
        shl     eax, 4                                  ; 3943 _ C1. E0, 04
        add     eax, timer_control                      ; 3946 _ 05, 000002E0(d)
        mov     dword [eax+8H], 0                       ; 394B _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 3952 _ 8B. 45, F4
        shl     eax, 4                                  ; 3955 _ C1. E0, 04
        add     eax, timer_control                      ; 3958 _ 05, 000002E0(d)
        mov     dword [eax+0CH], 0                      ; 395D _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 3964 _ 83. 45, F4, 01
?_180:  cmp     dword [ebp-0CH], 499                    ; 3968 _ 81. 7D, F4, 000001F3
        jle     ?_179                                   ; 396F _ 7E, CF
        leave                                           ; 3971 _ C9
        ret                                             ; 3972 _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 3973 _ 55
        mov     ebp, esp                                ; 3974 _ 89. E5
        mov     eax, timer_control                      ; 3976 _ B8, 000002E0(d)
        pop     ebp                                     ; 397B _ 5D
        ret                                             ; 397C _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 397D _ 55
        mov     ebp, esp                                ; 397E _ 89. E5
        sub     esp, 16                                 ; 3980 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3983 _ C7. 45, FC, 00000000
        jmp     ?_183                                   ; 398A _ EB, 26

?_181:  mov     eax, dword [ebp-4H]                     ; 398C _ 8B. 45, FC
        shl     eax, 4                                  ; 398F _ C1. E0, 04
        add     eax, timer_control                      ; 3992 _ 05, 000002E0(d)
        mov     eax, dword [eax+8H]                     ; 3997 _ 8B. 40, 08
        test    eax, eax                                ; 399A _ 85. C0
        jnz     ?_182                                   ; 399C _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 399E _ 8B. 45, FC
        shl     eax, 4                                  ; 39A1 _ C1. E0, 04
        add     eax, timer_control                      ; 39A4 _ 05, 000002E0(d)
        add     eax, 4                                  ; 39A9 _ 83. C0, 04
        jmp     ?_184                                   ; 39AC _ EB, 0D

?_182:  add     dword [ebp-4H], 1                       ; 39AE _ 83. 45, FC, 01
?_183:  cmp     dword [ebp-4H], 499                     ; 39B2 _ 81. 7D, FC, 000001F3
        jle     ?_181                                   ; 39B9 _ 7E, D1
?_184:  leave                                           ; 39BB _ C9
        ret                                             ; 39BC _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 39BD _ 55
        mov     ebp, esp                                ; 39BE _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 39C0 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 39C3 _ C7. 40, 04, 00000000
        pop     ebp                                     ; 39CA _ 5D
        ret                                             ; 39CB _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 39CC _ 55
        mov     ebp, esp                                ; 39CD _ 89. E5
        sub     esp, 4                                  ; 39CF _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 39D2 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 39D5 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 39D8 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 39DB _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 39DE _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 39E1 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 39E4 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 39E8 _ 88. 50, 0C
        leave                                           ; 39EB _ C9
        ret                                             ; 39EC _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 39ED _ 55
        mov     ebp, esp                                ; 39EE _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 39F0 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 39F3 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 39F6 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 39F8 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 39FB _ C7. 40, 04, 00000002
        pop     ebp                                     ; 3A02 _ 5D
        ret                                             ; 3A03 _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 3A04 _ 55
        mov     ebp, esp                                ; 3A05 _ 89. E5
        sub     esp, 40                                 ; 3A07 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 3A0A _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 3A12 _ C7. 04 24, 00000020
        call    io_out8                                 ; 3A19 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 3A1E _ A1, 000002E0(d)
        add     eax, 1                                  ; 3A23 _ 83. C0, 01
        mov     dword [timer_control], eax              ; 3A26 _ A3, 000002E0(d)
        mov     byte [ebp-0DH], 0                       ; 3A2B _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 3A2F _ C7. 45, F4, 00000000
        jmp     ?_188                                   ; 3A36 _ E9, 000000B0

?_185:  mov     eax, dword [ebp-0CH]                    ; 3A3B _ 8B. 45, F4
        shl     eax, 4                                  ; 3A3E _ C1. E0, 04
        add     eax, timer_control                      ; 3A41 _ 05, 000002E0(d)
        mov     eax, dword [eax+8H]                     ; 3A46 _ 8B. 40, 08
        cmp     eax, 2                                  ; 3A49 _ 83. F8, 02
        jne     ?_186                                   ; 3A4C _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 3A52 _ 8B. 45, F4
        shl     eax, 4                                  ; 3A55 _ C1. E0, 04
        add     eax, timer_control                      ; 3A58 _ 05, 000002E0(d)
        mov     eax, dword [eax+4H]                     ; 3A5D _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 3A60 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 3A63 _ 8B. 45, F4
        shl     eax, 4                                  ; 3A66 _ C1. E0, 04
        add     eax, timer_control                      ; 3A69 _ 05, 000002E0(d)
        mov     dword [eax+4H], edx                     ; 3A6E _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3A71 _ 8B. 45, F4
        shl     eax, 4                                  ; 3A74 _ C1. E0, 04
        add     eax, timer_control                      ; 3A77 _ 05, 000002E0(d)
        mov     eax, dword [eax+4H]                     ; 3A7C _ 8B. 40, 04
        test    eax, eax                                ; 3A7F _ 85. C0
        jnz     ?_186                                   ; 3A81 _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 3A83 _ 8B. 45, F4
        shl     eax, 4                                  ; 3A86 _ C1. E0, 04
        add     eax, timer_control                      ; 3A89 _ 05, 000002E0(d)
        mov     dword [eax+8H], 1                       ; 3A8E _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 3A95 _ 8B. 45, F4
        shl     eax, 4                                  ; 3A98 _ C1. E0, 04
        add     eax, timer_control                      ; 3A9B _ 05, 000002E0(d)
        movzx   eax, byte [eax+10H]                     ; 3AA0 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 3AA4 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 3AA7 _ 8B. 45, F4
        shl     eax, 4                                  ; 3AAA _ C1. E0, 04
        add     eax, timer_control                      ; 3AAD _ 05, 000002E0(d)
        mov     eax, dword [eax+0CH]                    ; 3AB2 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 3AB5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3AB9 _ 89. 04 24
        call    fifo8_put                               ; 3ABC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3AC1 _ 8B. 45, F4
        shl     eax, 4                                  ; 3AC4 _ C1. E0, 04
        add     eax, timer_control                      ; 3AC7 _ 05, 000002E0(d)
        lea     edx, [eax+4H]                           ; 3ACC _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 3ACF _ A1, 00000000(d)
        cmp     edx, eax                                ; 3AD4 _ 39. C2
        jnz     ?_186                                   ; 3AD6 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 3AD8 _ C6. 45, F3, 01
?_186:  cmp     byte [ebp-0DH], 0                       ; 3ADC _ 80. 7D, F3, 00
        jz      ?_187                                   ; 3AE0 _ 74, 05
        call    task_switch                             ; 3AE2 _ E8, FFFFFFFC(rel)
?_187:  add     dword [ebp-0CH], 1                      ; 3AE7 _ 83. 45, F4, 01
?_188:  cmp     dword [ebp-0CH], 499                    ; 3AEB _ 81. 7D, F4, 000001F3
        jle     ?_185                                   ; 3AF2 _ 0F 8E, FFFFFF43
        leave                                           ; 3AF8 _ C9
        ret                                             ; 3AF9 _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 3AFA _ 55
        mov     ebp, esp                                ; 3AFB _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 3AFD _ 81. 7D, 0C, 000FFFFF
        jbe     ?_189                                   ; 3B04 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 3B06 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 3B0D _ 8B. 45, 0C
        shr     eax, 12                                 ; 3B10 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 3B13 _ 89. 45, 0C
?_189:  mov     eax, dword [ebp+0CH]                    ; 3B16 _ 8B. 45, 0C
        mov     edx, eax                                ; 3B19 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3B1B _ 8B. 45, 08
        mov     word [eax], dx                          ; 3B1E _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 3B21 _ 8B. 45, 10
        mov     edx, eax                                ; 3B24 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3B26 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 3B29 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 3B2D _ 8B. 45, 10
        sar     eax, 16                                 ; 3B30 _ C1. F8, 10
        mov     edx, eax                                ; 3B33 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3B35 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 3B38 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 3B3B _ 8B. 45, 14
        mov     edx, eax                                ; 3B3E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3B40 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 3B43 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 3B46 _ 8B. 45, 0C
        shr     eax, 16                                 ; 3B49 _ C1. E8, 10
        and     eax, 0FH                                ; 3B4C _ 83. E0, 0F
        mov     edx, eax                                ; 3B4F _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 3B51 _ 8B. 45, 14
        sar     eax, 8                                  ; 3B54 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 3B57 _ 83. E0, F0
        or      eax, edx                                ; 3B5A _ 09. D0
        mov     edx, eax                                ; 3B5C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3B5E _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 3B61 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 3B64 _ 8B. 45, 10
        shr     eax, 24                                 ; 3B67 _ C1. E8, 18
        mov     edx, eax                                ; 3B6A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3B6C _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 3B6F _ 88. 50, 07
        pop     ebp                                     ; 3B72 _ 5D
        ret                                             ; 3B73 _ C3
; segment_descriptor End of function

init_task_level:; Function begin
        push    ebp                                     ; 3B74 _ 55
        mov     ebp, esp                                ; 3B75 _ 89. E5
        sub     esp, 16                                 ; 3B77 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 3B7A _ 8B. 0D, 00002228(d)
        mov     edx, dword [ebp+8H]                     ; 3B80 _ 8B. 55, 08
        mov     eax, edx                                ; 3B83 _ 89. D0
        shl     eax, 2                                  ; 3B85 _ C1. E0, 02
        add     eax, edx                                ; 3B88 _ 01. D0
        shl     eax, 2                                  ; 3B8A _ C1. E0, 02
        add     eax, ecx                                ; 3B8D _ 01. C8
        add     eax, 8                                  ; 3B8F _ 83. C0, 08
        mov     dword [eax], 0                          ; 3B92 _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 3B98 _ 8B. 0D, 00002228(d)
        mov     edx, dword [ebp+8H]                     ; 3B9E _ 8B. 55, 08
        mov     eax, edx                                ; 3BA1 _ 89. D0
        shl     eax, 2                                  ; 3BA3 _ C1. E0, 02
        add     eax, edx                                ; 3BA6 _ 01. D0
        shl     eax, 2                                  ; 3BA8 _ C1. E0, 02
        add     eax, ecx                                ; 3BAB _ 01. C8
        add     eax, 12                                 ; 3BAD _ 83. C0, 0C
        mov     dword [eax], 0                          ; 3BB0 _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 3BB6 _ C7. 45, FC, 00000000
        jmp     ?_191                                   ; 3BBD _ EB, 21

?_190:  mov     ecx, dword [task_control]               ; 3BBF _ 8B. 0D, 00002228(d)
        mov     edx, dword [ebp-4H]                     ; 3BC5 _ 8B. 55, FC
        mov     eax, edx                                ; 3BC8 _ 89. D0
        add     eax, eax                                ; 3BCA _ 01. C0
        add     eax, edx                                ; 3BCC _ 01. D0
        shl     eax, 3                                  ; 3BCE _ C1. E0, 03
        add     eax, ecx                                ; 3BD1 _ 01. C8
        add     eax, 16                                 ; 3BD3 _ 83. C0, 10
        mov     dword [eax], 0                          ; 3BD6 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 3BDC _ 83. 45, FC, 01
?_191:  cmp     dword [ebp-4H], 2                       ; 3BE0 _ 83. 7D, FC, 02
        jle     ?_190                                   ; 3BE4 _ 7E, D9
        leave                                           ; 3BE6 _ C9
        ret                                             ; 3BE7 _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 3BE8 _ 55
        mov     ebp, esp                                ; 3BE9 _ 89. E5
        sub     esp, 40                                 ; 3BEB _ 83. EC, 28
        call    get_addr_gdt                            ; 3BEE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3BF3 _ 89. 45, F0
        mov     dword [esp+4H], 668                     ; 3BF6 _ C7. 44 24, 04, 0000029C
        mov     eax, dword [ebp+8H]                     ; 3BFE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C01 _ 89. 04 24
        call    memman_alloc_4k                         ; 3C04 _ E8, FFFFFFFC(rel)
        mov     dword [task_control], eax               ; 3C09 _ A3, 00002228(d)
        mov     dword [ebp-14H], 0                      ; 3C0E _ C7. 45, EC, 00000000
        jmp     ?_193                                   ; 3C15 _ E9, 00000085

?_192:  mov     edx, dword [task_control]               ; 3C1A _ 8B. 15, 00002228(d)
        mov     eax, dword [ebp-14H]                    ; 3C20 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 3C23 _ 69. C0, 00000094
        add     eax, edx                                ; 3C29 _ 01. D0
        add     eax, 72                                 ; 3C2B _ 83. C0, 48
        mov     dword [eax], 0                          ; 3C2E _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 3C34 _ 8B. 0D, 00002228(d)
        mov     eax, dword [ebp-14H]                    ; 3C3A _ 8B. 45, EC
        add     eax, 8                                  ; 3C3D _ 83. C0, 08
        lea     edx, [eax*8]                            ; 3C40 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 3C47 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 3C4A _ 69. C0, 00000094
        add     eax, ecx                                ; 3C50 _ 01. C8
        add     eax, 68                                 ; 3C52 _ 83. C0, 44
        mov     dword [eax], edx                        ; 3C55 _ 89. 10
        mov     eax, dword [task_control]               ; 3C57 _ A1, 00002228(d)
        mov     edx, dword [ebp-14H]                    ; 3C5C _ 8B. 55, EC
        imul    edx, edx, 148                           ; 3C5F _ 69. D2, 00000094
        add     edx, 96                                 ; 3C65 _ 83. C2, 60
        add     eax, edx                                ; 3C68 _ 01. D0
        add     eax, 16                                 ; 3C6A _ 83. C0, 10
        mov     edx, dword [ebp-14H]                    ; 3C6D _ 8B. 55, EC
        add     edx, 8                                  ; 3C70 _ 83. C2, 08
        lea     ecx, [edx*8]                            ; 3C73 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 3C7A _ 8B. 55, F0
        add     edx, ecx                                ; 3C7D _ 01. CA
        mov     dword [esp+0CH], 137                    ; 3C7F _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 3C87 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 3C8B _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 3C93 _ 89. 14 24
        call    segment_descriptor                      ; 3C96 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 3C9B _ 83. 45, EC, 01
?_193:  cmp     dword [ebp-14H], 4                      ; 3C9F _ 83. 7D, EC, 04
        jle     ?_192                                   ; 3CA3 _ 0F 8E, FFFFFF71
        mov     dword [ebp-14H], 0                      ; 3CA9 _ C7. 45, EC, 00000000
        jmp     ?_195                                   ; 3CB0 _ EB, 0F

?_194:  mov     eax, dword [ebp-14H]                    ; 3CB2 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 3CB5 _ 89. 04 24
        call    init_task_level                         ; 3CB8 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 3CBD _ 83. 45, EC, 01
?_195:  cmp     dword [ebp-14H], 2                      ; 3CC1 _ 83. 7D, EC, 02
        jle     ?_194                                   ; 3CC5 _ 7E, EB
        call    task_alloc                              ; 3CC7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3CCC _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 3CCF _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 3CD2 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 3CD9 _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 3CDC _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 3CE3 _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 3CE6 _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 3CED _ 8B. 45, F4
        mov     dword [esp], eax                        ; 3CF0 _ 89. 04 24
        call    task_add                                ; 3CF3 _ E8, FFFFFFFC(rel)
        call    task_switch_sub                         ; 3CF8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3CFD _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 3D00 _ 8B. 00
        mov     dword [esp], eax                        ; 3D02 _ 89. 04 24
        call    load_tr                                 ; 3D05 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 3D0A _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 3D0F _ A3, 00002224(d)
        mov     eax, dword [ebp-0CH]                    ; 3D14 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 3D17 _ 8B. 40, 08
        mov     edx, eax                                ; 3D1A _ 89. C2
        mov     eax, dword [task_timer]                 ; 3D1C _ A1, 00002224(d)
        mov     dword [esp+4H], edx                     ; 3D21 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3D25 _ 89. 04 24
        call    timer_settime                           ; 3D28 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3D2D _ 8B. 45, F4
        leave                                           ; 3D30 _ C9
        ret                                             ; 3D31 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 3D32 _ 55
        mov     ebp, esp                                ; 3D33 _ 89. E5
        sub     esp, 16                                 ; 3D35 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3D38 _ C7. 45, F8, 00000000
        jmp     ?_198                                   ; 3D3F _ E9, 000000F6

?_196:  mov     edx, dword [task_control]               ; 3D44 _ 8B. 15, 00002228(d)
        mov     eax, dword [ebp-8H]                     ; 3D4A _ 8B. 45, F8
        imul    eax, eax, 148                           ; 3D4D _ 69. C0, 00000094
        add     eax, edx                                ; 3D53 _ 01. D0
        add     eax, 72                                 ; 3D55 _ 83. C0, 48
        mov     eax, dword [eax]                        ; 3D58 _ 8B. 00
        test    eax, eax                                ; 3D5A _ 85. C0
        jne     ?_197                                   ; 3D5C _ 0F 85, 000000D4
        mov     eax, dword [task_control]               ; 3D62 _ A1, 00002228(d)
        mov     edx, dword [ebp-8H]                     ; 3D67 _ 8B. 55, F8
        imul    edx, edx, 148                           ; 3D6A _ 69. D2, 00000094
        add     edx, 64                                 ; 3D70 _ 83. C2, 40
        add     eax, edx                                ; 3D73 _ 01. D0
        add     eax, 4                                  ; 3D75 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 3D78 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3D7B _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 3D7E _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 3D85 _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 3D88 _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 3D8F _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 3D92 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 3D99 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 3D9C _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 3DA3 _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 3DA6 _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 3DAD _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 3DB0 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-8H]                     ; 3DB7 _ 8B. 45, F8
        add     eax, 1                                  ; 3DBA _ 83. C0, 01
        shl     eax, 9                                  ; 3DBD _ C1. E0, 09
        mov     edx, eax                                ; 3DC0 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3DC2 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 3DC5 _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 3DC8 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 3DCB _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-4H]                     ; 3DD2 _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 3DD5 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 3DDC _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 3DDF _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 3DE6 _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 3DE9 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 3DF0 _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 3DF3 _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 3DFD _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 3E00 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 3E0A _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 3E0D _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 3E17 _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 3E1A _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 3E24 _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 3E27 _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 3E31 _ 8B. 45, FC
        jmp     ?_199                                   ; 3E34 _ EB, 13

?_197:  add     dword [ebp-8H], 1                       ; 3E36 _ 83. 45, F8, 01
?_198:  cmp     dword [ebp-8H], 4                       ; 3E3A _ 83. 7D, F8, 04
        jle     ?_196                                   ; 3E3E _ 0F 8E, FFFFFF00
        mov     eax, 0                                  ; 3E44 _ B8, 00000000
?_199:  leave                                           ; 3E49 _ C9
        ret                                             ; 3E4A _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 3E4B _ 55
        mov     ebp, esp                                ; 3E4C _ 89. E5
        sub     esp, 24                                 ; 3E4E _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 3E51 _ 83. 7D, 0C, 00
        jns     ?_200                                   ; 3E55 _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 3E57 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3E5A _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 3E5D _ 89. 45, 0C
?_200:  cmp     dword [ebp+10H], 0                      ; 3E60 _ 83. 7D, 10, 00
        jle     ?_201                                   ; 3E64 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 3E66 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3E69 _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 3E6C _ 89. 50, 08
?_201:  mov     eax, dword [ebp+8H]                     ; 3E6F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3E72 _ 8B. 40, 04
        cmp     eax, 2                                  ; 3E75 _ 83. F8, 02
        jnz     ?_202                                   ; 3E78 _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 3E7A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3E7D _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 3E80 _ 3B. 45, 0C
        jz      ?_202                                   ; 3E83 _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 3E85 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3E88 _ 89. 04 24
        call    task_remove                             ; 3E8B _ E8, FFFFFFFC(rel)
?_202:  mov     eax, dword [ebp+8H]                     ; 3E90 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3E93 _ 8B. 40, 04
        cmp     eax, 2                                  ; 3E96 _ 83. F8, 02
        jz      ?_203                                   ; 3E99 _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 3E9B _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3E9E _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 3EA1 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3EA4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3EA7 _ 89. 04 24
        call    task_add                                ; 3EAA _ E8, FFFFFFFC(rel)
?_203:  mov     eax, dword [task_control]               ; 3EAF _ A1, 00002228(d)
        mov     dword [eax+4H], 1                       ; 3EB4 _ C7. 40, 04, 00000001
        leave                                           ; 3EBB _ C9
        ret                                             ; 3EBC _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 3EBD _ 55
        mov     ebp, esp                                ; 3EBE _ 89. E5
        sub     esp, 40                                 ; 3EC0 _ 83. EC, 28
        mov     ecx, dword [task_control]               ; 3EC3 _ 8B. 0D, 00002228(d)
        mov     eax, dword [task_control]               ; 3EC9 _ A1, 00002228(d)
        mov     edx, dword [eax]                        ; 3ECE _ 8B. 10
        mov     eax, edx                                ; 3ED0 _ 89. D0
        shl     eax, 2                                  ; 3ED2 _ C1. E0, 02
        add     eax, edx                                ; 3ED5 _ 01. D0
        shl     eax, 2                                  ; 3ED7 _ C1. E0, 02
        add     eax, ecx                                ; 3EDA _ 01. C8
        add     eax, 8                                  ; 3EDC _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 3EDF _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 3EE2 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 3EE5 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 3EE8 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 3EEB _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 3EEF _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 3EF2 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 3EF5 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 3EF8 _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 3EFB _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 3EFE _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 3F01 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 3F04 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 3F07 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 3F0A _ 8B. 00
        cmp     edx, eax                                ; 3F0C _ 39. C2
        jnz     ?_204                                   ; 3F0E _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 3F10 _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 3F13 _ C7. 40, 04, 00000000
?_204:  mov     eax, dword [task_control]               ; 3F1A _ A1, 00002228(d)
        mov     eax, dword [eax+4H]                     ; 3F1F _ 8B. 40, 04
        test    eax, eax                                ; 3F22 _ 85. C0
        jz      ?_205                                   ; 3F24 _ 74, 24
        call    task_switch_sub                         ; 3F26 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [task_control]               ; 3F2B _ 8B. 0D, 00002228(d)
        mov     eax, dword [task_control]               ; 3F31 _ A1, 00002228(d)
        mov     edx, dword [eax]                        ; 3F36 _ 8B. 10
        mov     eax, edx                                ; 3F38 _ 89. D0
        shl     eax, 2                                  ; 3F3A _ C1. E0, 02
        add     eax, edx                                ; 3F3D _ 01. D0
        shl     eax, 2                                  ; 3F3F _ C1. E0, 02
        add     eax, ecx                                ; 3F42 _ 01. C8
        add     eax, 8                                  ; 3F44 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 3F47 _ 89. 45, EC
?_205:  mov     eax, dword [ebp-14H]                    ; 3F4A _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 3F4D _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 3F50 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 3F53 _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 3F57 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 3F5A _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 3F5D _ 8B. 40, 08
        mov     edx, eax                                ; 3F60 _ 89. C2
        mov     eax, dword [task_timer]                 ; 3F62 _ A1, 00002224(d)
        mov     dword [esp+4H], edx                     ; 3F67 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3F6B _ 89. 04 24
        call    timer_settime                           ; 3F6E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3F73 _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 3F76 _ 3B. 45, F0
        jz      ?_206                                   ; 3F79 _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 3F7B _ 83. 7D, F4, 00
        jz      ?_206                                   ; 3F7F _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 3F81 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 3F84 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 3F86 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 3F8A _ C7. 04 24, 00000000
        call    farjmp                                  ; 3F91 _ E8, FFFFFFFC(rel)
?_206:  leave                                           ; 3F96 _ C9
        ret                                             ; 3F97 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 3F98 _ 55
        mov     ebp, esp                                ; 3F99 _ 89. E5
        sub     esp, 40                                 ; 3F9B _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 3F9E _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 3FA5 _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 3FAC _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3FAF _ 8B. 40, 04
        cmp     eax, 2                                  ; 3FB2 _ 83. F8, 02
        jnz     ?_207                                   ; 3FB5 _ 75, 51
        call    task_now                                ; 3FB7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3FBC _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3FBF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3FC2 _ 89. 04 24
        call    task_remove                             ; 3FC5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 3FCA _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 3FD1 _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 3FD4 _ 3B. 45, F4
        jnz     ?_207                                   ; 3FD7 _ 75, 2F
        call    task_switch_sub                         ; 3FD9 _ E8, FFFFFFFC(rel)
        call    task_now                                ; 3FDE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3FE3 _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 3FE6 _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 3FED _ 83. 7D, F4, 00
        jz      ?_207                                   ; 3FF1 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 3FF3 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 3FF6 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 3FF8 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 3FFC _ C7. 04 24, 00000000
        call    farjmp                                  ; 4003 _ E8, FFFFFFFC(rel)
?_207:  mov     eax, dword [ebp-10H]                    ; 4008 _ 8B. 45, F0
        leave                                           ; 400B _ C9
        ret                                             ; 400C _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 400D _ 55
        mov     ebp, esp                                ; 400E _ 89. E5
        sub     esp, 16                                 ; 4010 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4013 _ 8B. 0D, 00002228(d)
        mov     eax, dword [task_control]               ; 4019 _ A1, 00002228(d)
        mov     edx, dword [eax]                        ; 401E _ 8B. 10
        mov     eax, edx                                ; 4020 _ 89. D0
        shl     eax, 2                                  ; 4022 _ C1. E0, 02
        add     eax, edx                                ; 4025 _ 01. D0
        shl     eax, 2                                  ; 4027 _ C1. E0, 02
        add     eax, ecx                                ; 402A _ 01. C8
        add     eax, 8                                  ; 402C _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 402F _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4032 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4035 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4038 _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 403B _ 8B. 44 90, 08
        leave                                           ; 403F _ C9
        ret                                             ; 4040 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 4041 _ 55
        mov     ebp, esp                                ; 4042 _ 89. E5
        sub     esp, 16                                 ; 4044 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4047 _ 8B. 0D, 00002228(d)
        mov     eax, dword [ebp+8H]                     ; 404D _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 4050 _ 8B. 50, 0C
        mov     eax, edx                                ; 4053 _ 89. D0
        shl     eax, 2                                  ; 4055 _ C1. E0, 02
        add     eax, edx                                ; 4058 _ 01. D0
        shl     eax, 2                                  ; 405A _ C1. E0, 02
        add     eax, ecx                                ; 405D _ 01. C8
        add     eax, 8                                  ; 405F _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 4062 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 4065 _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 4068 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 406A _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 406D _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 4070 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4074 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4077 _ 8B. 00
        lea     edx, [eax+1H]                           ; 4079 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 407C _ 8B. 45, FC
        mov     dword [eax], edx                        ; 407F _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 4081 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 4084 _ C7. 40, 04, 00000002
        leave                                           ; 408B _ C9
        ret                                             ; 408C _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 408D _ 55
        mov     ebp, esp                                ; 408E _ 89. E5
        sub     esp, 16                                 ; 4090 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 4093 _ 8B. 0D, 00002228(d)
        mov     eax, dword [ebp+8H]                     ; 4099 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 409C _ 8B. 50, 0C
        mov     eax, edx                                ; 409F _ 89. D0
        shl     eax, 2                                  ; 40A1 _ C1. E0, 02
        add     eax, edx                                ; 40A4 _ 01. D0
        shl     eax, 2                                  ; 40A6 _ C1. E0, 02
        add     eax, ecx                                ; 40A9 _ 01. C8
        add     eax, 8                                  ; 40AB _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 40AE _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 40B1 _ C7. 45, F8, 00000000
        jmp     ?_210                                   ; 40B8 _ EB, 23

?_208:  mov     eax, dword [ebp-4H]                     ; 40BA _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 40BD _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 40C0 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 40C4 _ 3B. 45, 08
        jnz     ?_209                                   ; 40C7 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 40C9 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 40CC _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 40CF _ C7. 44 90, 08, 00000000
        jmp     ?_211                                   ; 40D7 _ EB, 0E

?_209:  add     dword [ebp-8H], 1                       ; 40D9 _ 83. 45, F8, 01
?_210:  mov     eax, dword [ebp-4H]                     ; 40DD _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 40E0 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 40E2 _ 3B. 45, F8
        jg      ?_208                                   ; 40E5 _ 7F, D3
?_211:  mov     eax, dword [ebp-4H]                     ; 40E7 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 40EA _ 8B. 00
        lea     edx, [eax-1H]                           ; 40EC _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 40EF _ 8B. 45, FC
        mov     dword [eax], edx                        ; 40F2 _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 40F4 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 40F7 _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 40FA _ 3B. 45, F8
        jle     ?_212                                   ; 40FD _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 40FF _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4102 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 4105 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4108 _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 410B _ 89. 50, 04
?_212:  mov     eax, dword [ebp-4H]                     ; 410E _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4111 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 4114 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4117 _ 8B. 00
        cmp     edx, eax                                ; 4119 _ 39. C2
        jl      ?_213                                   ; 411B _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 411D _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 4120 _ C7. 40, 04, 00000000
?_213:  mov     eax, dword [ebp+8H]                     ; 4127 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 412A _ C7. 40, 04, 00000001
        jmp     ?_215                                   ; 4131 _ EB, 1B

?_214:  mov     eax, dword [ebp-8H]                     ; 4133 _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 4136 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 4139 _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 413C _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4140 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4143 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 4146 _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 414A _ 83. 45, F8, 01
?_215:  mov     eax, dword [ebp-4H]                     ; 414E _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4151 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4153 _ 3B. 45, F8
        jg      ?_214                                   ; 4156 _ 7F, DB
        leave                                           ; 4158 _ C9
        ret                                             ; 4159 _ C3
; task_remove End of function

task_switch_sub:; Function begin
        push    ebp                                     ; 415A _ 55
        mov     ebp, esp                                ; 415B _ 89. E5
        sub     esp, 16                                 ; 415D _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4160 _ C7. 45, FC, 00000000
        jmp     ?_218                                   ; 4167 _ EB, 24

?_216:  mov     ecx, dword [task_control]               ; 4169 _ 8B. 0D, 00002228(d)
        mov     edx, dword [ebp-4H]                     ; 416F _ 8B. 55, FC
        mov     eax, edx                                ; 4172 _ 89. D0
        shl     eax, 2                                  ; 4174 _ C1. E0, 02
        add     eax, edx                                ; 4177 _ 01. D0
        shl     eax, 2                                  ; 4179 _ C1. E0, 02
        add     eax, ecx                                ; 417C _ 01. C8
        add     eax, 8                                  ; 417E _ 83. C0, 08
        mov     eax, dword [eax]                        ; 4181 _ 8B. 00
        test    eax, eax                                ; 4183 _ 85. C0
        jle     ?_217                                   ; 4185 _ 7E, 02
        jmp     ?_219                                   ; 4187 _ EB, 0A

?_217:  add     dword [ebp-4H], 1                       ; 4189 _ 83. 45, FC, 01
?_218:  cmp     dword [ebp-4H], 2                       ; 418D _ 83. 7D, FC, 02
        jle     ?_216                                   ; 4191 _ 7E, D6
?_219:  mov     eax, dword [task_control]               ; 4193 _ A1, 00002228(d)
        mov     edx, dword [ebp-4H]                     ; 4198 _ 8B. 55, FC
        mov     dword [eax], edx                        ; 419B _ 89. 10
        mov     eax, dword [task_control]               ; 419D _ A1, 00002228(d)
        mov     dword [eax+4H], 0                       ; 41A2 _ C7. 40, 04, 00000000
        leave                                           ; 41A9 _ C9
        ret                                             ; 41AA _ C3
; task_switch_sub End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_220:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_221:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0007 _ console.

?_222:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 000F _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0017 _ sk b.

?_223:                                                  ; byte
        db 42H, 00H                                     ; 001C _ B.

?_224:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 001E _ page is:
        db 20H, 00H                                     ; 0026 _  .

?_225:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0028 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0030 _ L: .

?_226:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0034 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003C _ H: .

?_227:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0040 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0048 _ w: .

?_228:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 004C _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0054 _ gh: .

?_229:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0059 _ type: .

?_230:                                                  ; byte
        db 3EH, 00H                                     ; 0060 _ >.

?_231:                                                  ; byte
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

table_rgb.1744:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0120 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0128 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0130 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0138 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0140 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0148 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0150 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........

cursor.1812:                                            ; byte
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

closebtn.1899:                                          ; byte
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

?_232:  db 00H                                          ; 0342 _ .

?_233:  db 00H, 00H                                     ; 0343 _ ..


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

timerinfo1.1746:                                        ; byte
        resb    28                                      ; 0014

timerbuf1.1749:                                         ; qword
        resq    1                                       ; 0030

timerinfo2.1747:                                        ; byte
        resb    28                                      ; 0038

timerbuf2.1750:                                         ; qword
        resq    1                                       ; 0054

timerinfo3.1748:                                        ; byte
        resb    28                                      ; 005C

timerbuf3.1751:                                         ; qword
        resq    1                                       ; 0078

screen_info:                                            ; qword
        resb    4                                       ; 0080

?_234:  resw    1                                       ; 0084

?_235:  resw    13                                      ; 0086

mouse_cursor_buf:                                       ; byte
        resb    256                                     ; 00A0

back_buf: resd  1                                       ; 01A0

sheet_win:                                              ; dword
        resd    1                                       ; 01A4

mouse_x: resd   1                                       ; 01A8

mouse_y: resd   1                                       ; 01AC

key_shift:                                              ; dword
        resd    1                                       ; 01B0

mouse_send_info:                                        ; oword
        resb    44                                      ; 01B4

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

?_236:  resb    9                                       ; 02C1

?_237:  resb    22                                      ; 02CA

timer_control:                                          ; byte
        resd    2001                                    ; 02E0

task_timer:                                             ; dword
        resd    1                                       ; 2224

task_control:                                           ; dword
        resd    1                                       ; 2228


