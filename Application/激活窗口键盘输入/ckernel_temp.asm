; Disassembly of file: ckernel.o
; Thu Mar 12 09:40:51 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global CMain: function
global console_task: function
global launch_console: function
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
extern keytable                                         ; byte
extern io_store_eflags                                  ; near
extern mouse_cursor_buf                                 ; byte
extern get_addr_gdt                                     ; near
extern io_cli                                           ; near
extern screen_info                                      ; dword
extern io_in8                                           ; near
extern VRAM_ADDRESS                                     ; dword
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
        mov     dword [esp+8H], timerbuf1.1747          ; 0148 _ C7. 44 24, 08, 00000030(d)
        mov     dword [esp+4H], 8                       ; 0150 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1744            ; 0158 _ C7. 04 24, 00000014(d)
        call    fifo8_init                              ; 015F _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0164 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0169 _ 89. 45, D0
        mov     dword [esp+8H], 1                       ; 016C _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1744         ; 0174 _ C7. 44 24, 04, 00000014(d)
        mov     eax, dword [ebp-30H]                    ; 017C _ 8B. 45, D0
        mov     dword [esp], eax                        ; 017F _ 89. 04 24
        call    timer_init                              ; 0182 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0187 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-30H]                    ; 018F _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0192 _ 89. 04 24
        call    timer_settime                           ; 0195 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 019A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf2.1748          ; 01A2 _ C7. 44 24, 08, 00000054(d)
        mov     dword [esp+4H], 8                       ; 01AA _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1745            ; 01B2 _ C7. 04 24, 00000038(d)
        call    fifo8_init                              ; 01B9 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01BE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 01C3 _ 89. 45, D4
        mov     dword [esp+8H], 1                       ; 01C6 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1745         ; 01CE _ C7. 44 24, 04, 00000038(d)
        mov     eax, dword [ebp-2CH]                    ; 01D6 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 01D9 _ 89. 04 24
        call    timer_init                              ; 01DC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01E1 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-2CH]                    ; 01E9 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 01EC _ 89. 04 24
        call    timer_settime                           ; 01EF _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 01F4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf3.1749          ; 01FC _ C7. 44 24, 08, 00000078(d)
        mov     dword [esp+4H], 8                       ; 0204 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1746            ; 020C _ C7. 04 24, 0000005C(d)
        call    fifo8_init                              ; 0213 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0218 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 021D _ 89. 45, D8
        mov     dword [esp+8H], 1                       ; 0220 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1746         ; 0228 _ C7. 44 24, 04, 0000005C(d)
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
        mov     dword [esp+4H], ?_210                   ; 02D9 _ C7. 44 24, 04, 00000000(d)
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
        mov     dword [esp], timerinfo1.1744            ; 03DB _ C7. 04 24, 00000014(d)
        call    fifo8_status                            ; 03E2 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03E7 _ 01. C3
        mov     dword [esp], timerinfo2.1745            ; 03E9 _ C7. 04 24, 00000038(d)
        call    fifo8_status                            ; 03F0 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03F5 _ 01. C3
        mov     dword [esp], timerinfo3.1746            ; 03F7 _ C7. 04 24, 0000005C(d)
        call    fifo8_status                            ; 03FE _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 0403 _ 01. D8
        test    eax, eax                                ; 0405 _ 85. C0
        jnz     ?_002                                   ; 0407 _ 75, 0A
        call    io_sti                                  ; 0409 _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 040E _ E9, 000004D8

?_002:  mov     dword [esp], keyinfo                    ; 0413 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 041A _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 041F _ 85. C0
        je      ?_007                                   ; 0421 _ 0F 84, 00000305
        call    io_sti                                  ; 0427 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 042C _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0433 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0438 _ 89. 45, E8
        cmp     dword [ebp-18H], 28                     ; 043B _ 83. 7D, E8, 1C
        je      ?_013                                   ; 043F _ 0F 84, 000004A6
        cmp     dword [ebp-18H], 15                     ; 0445 _ 83. 7D, E8, 0F
        jne     ?_005                                   ; 0449 _ 0F 85, 00000128
        cmp     dword [ebp-48H], 0                      ; 044F _ 83. 7D, B8, 00
        jnz     ?_003                                   ; 0453 _ 75, 54
        mov     dword [ebp-48H], 1                      ; 0455 _ C7. 45, B8, 00000001
        mov     edx, dword [sheet_win]                  ; 045C _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0462 _ A1, 00000008(d)
        mov     dword [esp+0CH], 0                      ; 0467 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_210                   ; 046F _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 0477 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 047B _ 89. 04 24
        call    make_window_title                       ; 047E _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 0483 _ A1, 00000008(d)
        mov     dword [esp+0CH], 1                      ; 0488 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_211                   ; 0490 _ C7. 44 24, 08, 00000007(d)
        mov     edx, dword [ebp-1CH]                    ; 0498 _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 049B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 049F _ 89. 04 24
        call    make_window_title                       ; 04A2 _ E8, FFFFFFFC(rel)
        jmp     ?_004                                   ; 04A7 _ EB, 52

?_003:  mov     dword [ebp-48H], 0                      ; 04A9 _ C7. 45, B8, 00000000
        mov     edx, dword [sheet_win]                  ; 04B0 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 04B6 _ A1, 00000008(d)
        mov     dword [esp+0CH], 1                      ; 04BB _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_210                   ; 04C3 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 04CB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04CF _ 89. 04 24
        call    make_window_title                       ; 04D2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 04D7 _ A1, 00000008(d)
        mov     dword [esp+0CH], 0                      ; 04DC _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_211                   ; 04E4 _ C7. 44 24, 08, 00000007(d)
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
        jmp     ?_013                                   ; 0572 _ E9, 00000374

?_005:  cmp     dword [ebp-48H], 0                      ; 0577 _ 83. 7D, B8, 00
        jne     ?_006                                   ; 057B _ 0F 85, 0000017E
        cmp     dword [ebp-18H], 128                    ; 0581 _ 81. 7D, E8, 00000080
        jg      ?_013                                   ; 0588 _ 0F 8F, 0000035D
        mov     eax, dword [ebp-18H]                    ; 058E _ 8B. 45, E8
        add     eax, keytable                           ; 0591 _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 0596 _ 0F B6. 00
        test    al, al                                  ; 0599 _ 84. C0
        je      ?_013                                   ; 059B _ 0F 84, 0000034A
        cmp     dword [ebp-54H], 143                    ; 05A1 _ 81. 7D, AC, 0000008F
        jg      ?_013                                   ; 05A8 _ 0F 8F, 0000033D
        mov     eax, dword [ebp-54H]                    ; 05AE _ 8B. 45, AC
        lea     ecx, [eax+7H]                           ; 05B1 _ 8D. 48, 07
        mov     eax, dword [sheet_win]                  ; 05B4 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 05B9 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 05BC _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 05C1 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 05C3 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 05CB _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 05CF _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-54H]                    ; 05D7 _ 8B. 4D, AC
        mov     dword [esp+0CH], ecx                    ; 05DA _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 05DE _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 05E6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05EA _ 89. 04 24
        call    paint_rectangle                         ; 05ED _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-54H]                    ; 05F2 _ 8B. 45, AC
        lea     ecx, [eax+8H]                           ; 05F5 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 05F8 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 05FE _ A1, 00000008(d)
        mov     dword [esp+14H], 44                     ; 0603 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 060B _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 060F _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-54H]                    ; 0617 _ 8B. 4D, AC
        mov     dword [esp+8H], ecx                     ; 061A _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 061E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0622 _ 89. 04 24
        call    sheet_refresh                           ; 0625 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 062A _ 8B. 45, E8
        add     eax, keytable                           ; 062D _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 0632 _ 0F B6. 00
        mov     byte [ebp-56H], al                      ; 0635 _ 88. 45, AA
        mov     byte [ebp-55H], 0                       ; 0638 _ C6. 45, AB, 00
        mov     edx, dword [sheet_win]                  ; 063C _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0642 _ A1, 00000008(d)
        mov     dword [esp+14H], 0                      ; 0647 _ C7. 44 24, 14, 00000000
        lea     ecx, [ebp-56H]                          ; 064F _ 8D. 4D, AA
        mov     dword [esp+10H], ecx                    ; 0652 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0656 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-54H]                    ; 065E _ 8B. 4D, AC
        mov     dword [esp+8H], ecx                     ; 0661 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0665 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0669 _ 89. 04 24
        call    paint_string                            ; 066C _ E8, FFFFFFFC(rel)
        add     dword [ebp-54H], 8                      ; 0671 _ 83. 45, AC, 08
        mov     dword [ebp-44H], 1                      ; 0675 _ C7. 45, BC, 00000001
        mov     eax, dword [ebp-54H]                    ; 067C _ 8B. 45, AC
        lea     ebx, [eax+7H]                           ; 067F _ 8D. 58, 07
        mov     eax, dword [ebp-50H]                    ; 0682 _ 8B. 45, B0
        movzx   ecx, al                                 ; 0685 _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 0688 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 068D _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 0690 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 0695 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0697 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 069F _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 06A3 _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-54H]                    ; 06AB _ 8B. 5D, AC
        mov     dword [esp+0CH], ebx                    ; 06AE _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 06B2 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06B6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06BA _ 89. 04 24
        call    paint_rectangle                         ; 06BD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-54H]                    ; 06C2 _ 8B. 45, AC
        lea     ecx, [eax+8H]                           ; 06C5 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 06C8 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 06CE _ A1, 00000008(d)
        mov     dword [esp+14H], 44                     ; 06D3 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 06DB _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 06DF _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-54H]                    ; 06E7 _ 8B. 4D, AC
        mov     dword [esp+8H], ecx                     ; 06EA _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06EE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06F2 _ 89. 04 24
        call    sheet_refresh                           ; 06F5 _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 06FA _ E9, 000001EC

?_006:  mov     eax, dword [task_a]                     ; 06FF _ A1, 00000004(d)
        mov     dword [esp], eax                        ; 0704 _ 89. 04 24
        call    task_sleep                              ; 0707 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 070C _ 8B. 45, E8
        movzx   eax, al                                 ; 070F _ 0F B6. C0
        mov     edx, dword [test_console_g]             ; 0712 _ 8B. 15, 00000000(d)
        add     edx, 16                                 ; 0718 _ 83. C2, 10
        mov     dword [esp+4H], eax                     ; 071B _ 89. 44 24, 04
        mov     dword [esp], edx                        ; 071F _ 89. 14 24
        call    fifo8_put                               ; 0722 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0727 _ E9, FFFFFC8E

?_007:  mov     dword [esp], mouseinfo                  ; 072C _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0733 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0738 _ 85. C0
        jz      ?_008                                   ; 073A _ 74, 26
        mov     ecx, dword [mouse_sheet]                ; 073C _ 8B. 0D, 00000010(d)
        mov     edx, dword [back_sheet]                 ; 0742 _ 8B. 15, 0000000C(d)
        mov     eax, dword [sheet_control]              ; 0748 _ A1, 00000008(d)
        mov     dword [esp+8H], ecx                     ; 074D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0751 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0755 _ 89. 04 24
        call    show_mouse_info                         ; 0758 _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 075D _ E9, 00000189

?_008:  mov     dword [esp], timerinfo1.1744            ; 0762 _ C7. 04 24, 00000014(d)
        call    fifo8_status                            ; 0769 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 076E _ 85. C0
        jz      ?_009                                   ; 0770 _ 74, 49
        call    io_sti                                  ; 0772 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1744            ; 0777 _ C7. 04 24, 00000014(d)
        call    fifo8_get                               ; 077E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0783 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-30H]                    ; 078B _ 8B. 45, D0
        mov     dword [esp], eax                        ; 078E _ 89. 04 24
        call    timer_settime                           ; 0791 _ E8, FFFFFFFC(rel)
        add     dword [ebp-4CH], 8                      ; 0796 _ 83. 45, B4, 08
        cmp     dword [ebp-44H], 0                      ; 079A _ 83. 7D, BC, 00
        jne     ?_013                                   ; 079E _ 0F 85, 00000147
        call    io_cli                                  ; 07A4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_a]                     ; 07A9 _ A1, 00000004(d)
        mov     dword [esp], eax                        ; 07AE _ 89. 04 24
        call    task_sleep                              ; 07B1 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 07B6 _ E9, FFFFFBFF

?_009:  mov     dword [esp], timerinfo2.1745            ; 07BB _ C7. 04 24, 00000038(d)
        call    fifo8_status                            ; 07C2 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07C7 _ 85. C0
        jz      ?_010                                   ; 07C9 _ 74, 16
        call    io_sti                                  ; 07CB _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1745            ; 07D0 _ C7. 04 24, 00000038(d)
        call    fifo8_get                               ; 07D7 _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 07DC _ E9, 0000010A

?_010:  mov     dword [esp], timerinfo3.1746            ; 07E1 _ C7. 04 24, 0000005C(d)
        call    fifo8_status                            ; 07E8 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07ED _ 85. C0
        je      ?_013                                   ; 07EF _ 0F 84, 000000F6
        mov     dword [esp], timerinfo3.1746            ; 07F5 _ C7. 04 24, 0000005C(d)
        call    fifo8_get                               ; 07FC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0801 _ 89. 45, F4
        call    io_sti                                  ; 0804 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 0809 _ 83. 7D, F4, 00
        jz      ?_011                                   ; 080D _ 74, 24
        mov     dword [esp+8H], 0                       ; 080F _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1746         ; 0817 _ C7. 44 24, 04, 0000005C(d)
        mov     eax, dword [ebp-28H]                    ; 081F _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0822 _ 89. 04 24
        call    timer_init                              ; 0825 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-50H], 0                      ; 082A _ C7. 45, B0, 00000000
        jmp     ?_012                                   ; 0831 _ EB, 22

?_011:  mov     dword [esp+8H], 1                       ; 0833 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1746         ; 083B _ C7. 44 24, 04, 0000005C(d)
        mov     eax, dword [ebp-28H]                    ; 0843 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0846 _ 89. 04 24
        call    timer_init                              ; 0849 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-50H], 7                      ; 084E _ C7. 45, B0, 00000007
?_012:  mov     dword [esp+4H], 50                      ; 0855 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 085D _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0860 _ 89. 04 24
        call    timer_settime                           ; 0863 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-54H]                    ; 0868 _ 8B. 45, AC
        lea     ebx, [eax+7H]                           ; 086B _ 8D. 58, 07
        mov     eax, dword [ebp-50H]                    ; 086E _ 8B. 45, B0
        movzx   ecx, al                                 ; 0871 _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 0874 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 0879 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 087C _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 0881 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0883 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 088B _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 088F _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-54H]                    ; 0897 _ 8B. 5D, AC
        mov     dword [esp+0CH], ebx                    ; 089A _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 089E _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08A2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08A6 _ 89. 04 24
        call    paint_rectangle                         ; 08A9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-54H]                    ; 08AE _ 8B. 45, AC
        lea     ecx, [eax+8H]                           ; 08B1 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 08B4 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 08BA _ A1, 00000008(d)
        mov     dword [esp+14H], 44                     ; 08BF _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 08C7 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 08CB _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-54H]                    ; 08D3 _ 8B. 4D, AC
        mov     dword [esp+8H], ecx                     ; 08D6 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08DA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08DE _ 89. 04 24
        call    sheet_refresh                           ; 08E1 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 08E6 _ E9, FFFFFACF

?_013:  jmp     ?_001                                   ; 08EB _ E9, FFFFFACA
; CMain End of function

console_task:; Function begin
        push    ebp                                     ; 08F0 _ 55
        mov     ebp, esp                                ; 08F1 _ 89. E5
        push    ebx                                     ; 08F3 _ 53
        sub     esp, 196                                ; 08F4 _ 81. EC, 000000C4
        mov     eax, dword [ebp+8H]                     ; 08FA _ 8B. 45, 08
        mov     dword [ebp-0ACH], eax                   ; 08FD _ 89. 85, FFFFFF54
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 0903 _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 0909 _ 89. 45, F4
        xor     eax, eax                                ; 090C _ 31. C0
        call    task_now                                ; 090E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-98H], eax                    ; 0913 _ 89. 85, FFFFFF68
        mov     dword [ebp-0A0H], 16                    ; 0919 _ C7. 85, FFFFFF60, 00000010
        mov     dword [ebp-9CH], 0                      ; 0923 _ C7. 85, FFFFFF64, 00000000
        mov     eax, dword [ebp-98H]                    ; 092D _ 8B. 85, FFFFFF68
        lea     edx, [eax+10H]                          ; 0933 _ 8D. 50, 10
        mov     eax, dword [ebp-98H]                    ; 0936 _ 8B. 85, FFFFFF68
        mov     dword [esp+0CH], eax                    ; 093C _ 89. 44 24, 0C
        lea     eax, [ebp-8CH]                          ; 0940 _ 8D. 85, FFFFFF74
        mov     dword [esp+8H], eax                     ; 0946 _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 094A _ C7. 44 24, 04, 00000080
        mov     dword [esp], edx                        ; 0952 _ 89. 14 24
        call    fifo8_init                              ; 0955 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 095A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-94H], eax                    ; 095F _ 89. 85, FFFFFF6C
        mov     eax, dword [ebp-98H]                    ; 0965 _ 8B. 85, FFFFFF68
        add     eax, 16                                 ; 096B _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 096E _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 0976 _ 89. 44 24, 04
        mov     eax, dword [ebp-94H]                    ; 097A _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 0980 _ 89. 04 24
        call    timer_init                              ; 0983 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 0988 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-94H]                    ; 0990 _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 0996 _ 89. 04 24
        call    timer_settime                           ; 0999 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 099E _ A1, 00000008(d)
        mov     dword [esp+14H], 7                      ; 09A3 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_212                  ; 09AB _ C7. 44 24, 10, 0000000F(d)
        mov     dword [esp+0CH], 28                     ; 09B3 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 8                       ; 09BB _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-0ACH]                   ; 09C3 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 09C9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 09CD _ 89. 04 24
        call    paint_string                            ; 09D0 _ E8, FFFFFFFC(rel)
?_014:  call    io_cli                                  ; 09D5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-98H]                    ; 09DA _ 8B. 85, FFFFFF68
        add     eax, 16                                 ; 09E0 _ 83. C0, 10
        mov     dword [esp], eax                        ; 09E3 _ 89. 04 24
        call    fifo8_status                            ; 09E6 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 09EB _ 85. C0
        jnz     ?_015                                   ; 09ED _ 75, 07
        call    io_sti                                  ; 09EF _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 09F4 _ EB, DF

?_015:  mov     eax, dword [ebp-98H]                    ; 09F6 _ 8B. 85, FFFFFF68
        add     eax, 16                                 ; 09FC _ 83. C0, 10
        mov     dword [esp], eax                        ; 09FF _ 89. 04 24
        call    fifo8_get                               ; 0A02 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-90H], eax                    ; 0A07 _ 89. 85, FFFFFF70
        call    io_sti                                  ; 0A0D _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-90H], 1                      ; 0A12 _ 83. BD, FFFFFF70, 01
        jg      ?_018                                   ; 0A19 _ 0F 8F, 00000080
        cmp     dword [ebp-90H], 0                      ; 0A1F _ 83. BD, FFFFFF70, 00
        jz      ?_016                                   ; 0A26 _ 74, 2F
        mov     eax, dword [ebp-98H]                    ; 0A28 _ 8B. 85, FFFFFF68
        add     eax, 16                                 ; 0A2E _ 83. C0, 10
        mov     dword [esp+8H], 0                       ; 0A31 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], eax                     ; 0A39 _ 89. 44 24, 04
        mov     eax, dword [ebp-94H]                    ; 0A3D _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 0A43 _ 89. 04 24
        call    timer_init                              ; 0A46 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-9CH], 7                      ; 0A4B _ C7. 85, FFFFFF64, 00000007
        jmp     ?_017                                   ; 0A55 _ EB, 2D

?_016:  mov     eax, dword [ebp-98H]                    ; 0A57 _ 8B. 85, FFFFFF68
        add     eax, 16                                 ; 0A5D _ 83. C0, 10
        mov     dword [esp+8H], 1                       ; 0A60 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], eax                     ; 0A68 _ 89. 44 24, 04
        mov     eax, dword [ebp-94H]                    ; 0A6C _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 0A72 _ 89. 04 24
        call    timer_init                              ; 0A75 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-9CH], 0                      ; 0A7A _ C7. 85, FFFFFF64, 00000000
?_017:  mov     dword [esp+4H], 50                      ; 0A84 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-94H]                    ; 0A8C _ 8B. 85, FFFFFF6C
        mov     dword [esp], eax                        ; 0A92 _ 89. 04 24
        call    timer_settime                           ; 0A95 _ E8, FFFFFFFC(rel)
        jmp     ?_020                                   ; 0A9A _ E9, 00000254

?_018:  cmp     dword [ebp-90H], 14                     ; 0A9F _ 83. BD, FFFFFF70, 0E
        jne     ?_019                                   ; 0AA6 _ 0F 85, 0000012D
        cmp     dword [ebp-0A0H], 8                     ; 0AAC _ 83. BD, FFFFFF60, 08
        jle     ?_019                                   ; 0AB3 _ 0F 8E, 00000120
        mov     eax, dword [ebp-0A0H]                   ; 0AB9 _ 8B. 85, FFFFFF60
        lea     ecx, [eax+7H]                           ; 0ABF _ 8D. 48, 07
        mov     eax, dword [ebp-0ACH]                   ; 0AC2 _ 8B. 85, FFFFFF54
        mov     edx, dword [eax+4H]                     ; 0AC8 _ 8B. 50, 04
        mov     eax, dword [ebp-0ACH]                   ; 0ACB _ 8B. 85, FFFFFF54
        mov     eax, dword [eax]                        ; 0AD1 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0AD3 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 0ADB _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 0ADF _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-0A0H]                   ; 0AE7 _ 8B. 8D, FFFFFF60
        mov     dword [esp+0CH], ecx                    ; 0AED _ 89. 4C 24, 0C
        mov     dword [esp+8H], 0                       ; 0AF1 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0AF9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0AFD _ 89. 04 24
        call    paint_rectangle                         ; 0B00 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0A0H]                   ; 0B05 _ 8B. 85, FFFFFF60
        lea     edx, [eax+8H]                           ; 0B0B _ 8D. 50, 08
        mov     eax, dword [sheet_control]              ; 0B0E _ A1, 00000008(d)
        mov     dword [esp+14H], 44                     ; 0B13 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], edx                    ; 0B1B _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 0B1F _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-0A0H]                   ; 0B27 _ 8B. 95, FFFFFF60
        mov     dword [esp+8H], edx                     ; 0B2D _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 0B31 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 0B37 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0B3B _ 89. 04 24
        call    sheet_refresh                           ; 0B3E _ E8, FFFFFFFC(rel)
        sub     dword [ebp-0A0H], 8                     ; 0B43 _ 83. AD, FFFFFF60, 08
        mov     eax, dword [ebp-0A0H]                   ; 0B4A _ 8B. 85, FFFFFF60
        lea     ecx, [eax+7H]                           ; 0B50 _ 8D. 48, 07
        mov     eax, dword [ebp-0ACH]                   ; 0B53 _ 8B. 85, FFFFFF54
        mov     edx, dword [eax+4H]                     ; 0B59 _ 8B. 50, 04
        mov     eax, dword [ebp-0ACH]                   ; 0B5C _ 8B. 85, FFFFFF54
        mov     eax, dword [eax]                        ; 0B62 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0B64 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 0B6C _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 0B70 _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-0A0H]                   ; 0B78 _ 8B. 8D, FFFFFF60
        mov     dword [esp+0CH], ecx                    ; 0B7E _ 89. 4C 24, 0C
        mov     dword [esp+8H], 0                       ; 0B82 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0B8A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0B8E _ 89. 04 24
        call    paint_rectangle                         ; 0B91 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0A0H]                   ; 0B96 _ 8B. 85, FFFFFF60
        lea     edx, [eax+8H]                           ; 0B9C _ 8D. 50, 08
        mov     eax, dword [sheet_control]              ; 0B9F _ A1, 00000008(d)
        mov     dword [esp+14H], 44                     ; 0BA4 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], edx                    ; 0BAC _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 0BB0 _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-0A0H]                   ; 0BB8 _ 8B. 95, FFFFFF60
        mov     dword [esp+8H], edx                     ; 0BBE _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 0BC2 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 0BC8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0BCC _ 89. 04 24
        call    sheet_refresh                           ; 0BCF _ E8, FFFFFFFC(rel)
        jmp     ?_020                                   ; 0BD4 _ E9, 0000011A

?_019:  cmp     dword [ebp-0A0H], 239                   ; 0BD9 _ 81. BD, FFFFFF60, 000000EF
        jg      ?_020                                   ; 0BE3 _ 0F 8F, 0000010A
        cmp     dword [ebp-90H], 83                     ; 0BE9 _ 83. BD, FFFFFF70, 53
        jg      ?_020                                   ; 0BF0 _ 0F 8F, 000000FD
        mov     eax, dword [ebp-90H]                    ; 0BF6 _ 8B. 85, FFFFFF70
        add     eax, keytable                           ; 0BFC _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 0C01 _ 0F B6. 00
        test    al, al                                  ; 0C04 _ 84. C0
        je      ?_020                                   ; 0C06 _ 0F 84, 000000E7
        mov     eax, dword [ebp-0A0H]                   ; 0C0C _ 8B. 85, FFFFFF60
        lea     ecx, [eax+7H]                           ; 0C12 _ 8D. 48, 07
        mov     eax, dword [ebp-0ACH]                   ; 0C15 _ 8B. 85, FFFFFF54
        mov     edx, dword [eax+4H]                     ; 0C1B _ 8B. 50, 04
        mov     eax, dword [ebp-0ACH]                   ; 0C1E _ 8B. 85, FFFFFF54
        mov     eax, dword [eax]                        ; 0C24 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0C26 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 0C2E _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 0C32 _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-0A0H]                   ; 0C3A _ 8B. 8D, FFFFFF60
        mov     dword [esp+0CH], ecx                    ; 0C40 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 0                       ; 0C44 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0C4C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C50 _ 89. 04 24
        call    paint_rectangle                         ; 0C53 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0A0H]                   ; 0C58 _ 8B. 85, FFFFFF60
        lea     edx, [eax+8H]                           ; 0C5E _ 8D. 50, 08
        mov     eax, dword [sheet_control]              ; 0C61 _ A1, 00000008(d)
        mov     dword [esp+14H], 44                     ; 0C66 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], edx                    ; 0C6E _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 0C72 _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-0A0H]                   ; 0C7A _ 8B. 95, FFFFFF60
        mov     dword [esp+8H], edx                     ; 0C80 _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 0C84 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 0C8A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C8E _ 89. 04 24
        call    sheet_refresh                           ; 0C91 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-90H]                    ; 0C96 _ 8B. 85, FFFFFF70
        add     eax, keytable                           ; 0C9C _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 0CA1 _ 0F B6. 00
        mov     byte [ebp-0A2H], al                     ; 0CA4 _ 88. 85, FFFFFF5E
        mov     byte [ebp-0A1H], 0                      ; 0CAA _ C6. 85, FFFFFF5F, 00
        mov     eax, dword [sheet_control]              ; 0CB1 _ A1, 00000008(d)
        mov     dword [esp+14H], 7                      ; 0CB6 _ C7. 44 24, 14, 00000007
        lea     edx, [ebp-0A2H]                         ; 0CBE _ 8D. 95, FFFFFF5E
        mov     dword [esp+10H], edx                    ; 0CC4 _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 0CC8 _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-0A0H]                   ; 0CD0 _ 8B. 95, FFFFFF60
        mov     dword [esp+8H], edx                     ; 0CD6 _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 0CDA _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 0CE0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0CE4 _ 89. 04 24
        call    paint_string                            ; 0CE7 _ E8, FFFFFFFC(rel)
        add     dword [ebp-0A0H], 8                     ; 0CEC _ 83. 85, FFFFFF60, 08
?_020:  mov     eax, dword [ebp-0A0H]                   ; 0CF3 _ 8B. 85, FFFFFF60
        lea     ebx, [eax+7H]                           ; 0CF9 _ 8D. 58, 07
        mov     eax, dword [ebp-9CH]                    ; 0CFC _ 8B. 85, FFFFFF64
        movzx   ecx, al                                 ; 0D02 _ 0F B6. C8
        mov     eax, dword [ebp-0ACH]                   ; 0D05 _ 8B. 85, FFFFFF54
        mov     edx, dword [eax+4H]                     ; 0D0B _ 8B. 50, 04
        mov     eax, dword [ebp-0ACH]                   ; 0D0E _ 8B. 85, FFFFFF54
        mov     eax, dword [eax]                        ; 0D14 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0D16 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 0D1E _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 0D22 _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-0A0H]                   ; 0D2A _ 8B. 9D, FFFFFF60
        mov     dword [esp+0CH], ebx                    ; 0D30 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 0D34 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0D38 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0D3C _ 89. 04 24
        call    paint_rectangle                         ; 0D3F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0A0H]                   ; 0D44 _ 8B. 85, FFFFFF60
        lea     edx, [eax+8H]                           ; 0D4A _ 8D. 50, 08
        mov     eax, dword [sheet_control]              ; 0D4D _ A1, 00000008(d)
        mov     dword [esp+14H], 44                     ; 0D52 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], edx                    ; 0D5A _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 0D5E _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-0A0H]                   ; 0D66 _ 8B. 95, FFFFFF60
        mov     dword [esp+8H], edx                     ; 0D6C _ 89. 54 24, 08
        mov     edx, dword [ebp-0ACH]                   ; 0D70 _ 8B. 95, FFFFFF54
        mov     dword [esp+4H], edx                     ; 0D76 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0D7A _ 89. 04 24
        call    sheet_refresh                           ; 0D7D _ E8, FFFFFFFC(rel)
        jmp     ?_014                                   ; 0D82 _ E9, FFFFFC4E
; console_task End of function

launch_console:; Function begin
        push    ebp                                     ; 0D87 _ 55
        mov     ebp, esp                                ; 0D88 _ 89. E5
        sub     esp, 56                                 ; 0D8A _ 83. EC, 38
        mov     eax, dword [sheet_control]              ; 0D8D _ A1, 00000008(d)
        mov     dword [esp], eax                        ; 0D92 _ 89. 04 24
        call    sheet_alloc                             ; 0D95 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0D9A _ 89. 45, E8
        mov     eax, dword [memman]                     ; 0D9D _ A1, 00000004(d)
        mov     dword [esp+4H], 42240                   ; 0DA2 _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 0DAA _ 89. 04 24
        call    memman_alloc_4k                         ; 0DAD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0DB2 _ 89. 45, EC
        mov     dword [esp+10H], 99                     ; 0DB5 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 0DBD _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 0DC5 _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-14H]                    ; 0DCD _ 8B. 45, EC
        mov     dword [esp+4H], eax                     ; 0DD0 _ 89. 44 24, 04
        mov     eax, dword [ebp-18H]                    ; 0DD4 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 0DD7 _ 89. 04 24
        call    sheet_setbuf                            ; 0DDA _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 0DDF _ A1, 00000008(d)
        mov     dword [esp+0CH], 0                      ; 0DE4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_211                   ; 0DEC _ C7. 44 24, 08, 00000007(d)
        mov     edx, dword [ebp-18H]                    ; 0DF4 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 0DF7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0DFB _ 89. 04 24
        call    make_windows                            ; 0DFE _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 0E03 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 0E0B _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 0E13 _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 0E1B _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 0E23 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-18H]                    ; 0E2B _ 8B. 45, E8
        mov     dword [esp], eax                        ; 0E2E _ 89. 04 24
        call    make_textbox                            ; 0E31 _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 0E36 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0E3B _ 89. 45, F0
        call    get_code32_addr                         ; 0E3E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0E43 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 0E46 _ 8B. 45, F0
        mov     dword [eax+8CH], 0                      ; 0E49 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-10H]                    ; 0E53 _ 8B. 45, F0
        mov     dword [eax+90H], 1073741824             ; 0E56 _ C7. 80, 00000090, 40000000
        mov     eax, console_task                       ; 0E60 _ B8, 00000000(d)
        sub     eax, dword [ebp-0CH]                    ; 0E65 _ 2B. 45, F4
        mov     edx, eax                                ; 0E68 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 0E6A _ 8B. 45, F0
        mov     dword [eax+4CH], edx                    ; 0E6D _ 89. 50, 4C
        mov     eax, dword [ebp-10H]                    ; 0E70 _ 8B. 45, F0
        mov     dword [eax+74H], 0                      ; 0E73 _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-10H]                    ; 0E7A _ 8B. 45, F0
        mov     dword [eax+78H], 8                      ; 0E7D _ C7. 40, 78, 00000008
        mov     eax, dword [ebp-10H]                    ; 0E84 _ 8B. 45, F0
        mov     dword [eax+7CH], 48                     ; 0E87 _ C7. 40, 7C, 00000030
        mov     eax, dword [ebp-10H]                    ; 0E8E _ 8B. 45, F0
        mov     dword [eax+80H], 32                     ; 0E91 _ C7. 80, 00000080, 00000020
        mov     eax, dword [ebp-10H]                    ; 0E9B _ 8B. 45, F0
        mov     dword [eax+84H], 0                      ; 0E9E _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-10H]                    ; 0EA8 _ 8B. 45, F0
        mov     dword [eax+88H], 16                     ; 0EAB _ C7. 80, 00000088, 00000010
        mov     eax, dword [ebp-10H]                    ; 0EB5 _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 0EB8 _ 8B. 40, 64
        lea     edx, [eax-4H]                           ; 0EBB _ 8D. 50, FC
        mov     eax, dword [ebp-10H]                    ; 0EBE _ 8B. 45, F0
        mov     dword [eax+64H], edx                    ; 0EC1 _ 89. 50, 64
        mov     eax, dword [ebp-10H]                    ; 0EC4 _ 8B. 45, F0
        mov     eax, dword [eax+64H]                    ; 0EC7 _ 8B. 40, 64
        add     eax, 4                                  ; 0ECA _ 83. C0, 04
        mov     edx, dword [ebp-18H]                    ; 0ECD _ 8B. 55, E8
        mov     dword [eax], edx                        ; 0ED0 _ 89. 10
        mov     dword [esp+8H], 5                       ; 0ED2 _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 0EDA _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-10H]                    ; 0EE2 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 0EE5 _ 89. 04 24
        call    task_run                                ; 0EE8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 0EED _ A1, 00000008(d)
        mov     dword [esp+0CH], 4                      ; 0EF2 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 0EFA _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-18H]                    ; 0F02 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 0F05 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0F09 _ 89. 04 24
        call    sheet_slide                             ; 0F0C _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 0F11 _ A1, 00000008(d)
        mov     dword [esp+8H], 1                       ; 0F16 _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-18H]                    ; 0F1E _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 0F21 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0F25 _ 89. 04 24
        call    sheet_updown                            ; 0F28 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 0F2D _ 8B. 45, F0
        mov     dword [test_console_g], eax             ; 0F30 _ A3, 00000000(d)
        mov     eax, dword [ebp-18H]                    ; 0F35 _ 8B. 45, E8
        leave                                           ; 0F38 _ C9
        ret                                             ; 0F39 _ C3
; launch_console End of function

task_b_main:; Function begin
        push    ebp                                     ; 0F3A _ 55
        mov     ebp, esp                                ; 0F3B _ 89. E5
        sub     esp, 104                                ; 0F3D _ 83. EC, 68
        mov     eax, dword [ebp+8H]                     ; 0F40 _ 8B. 45, 08
        mov     dword [ebp-4CH], eax                    ; 0F43 _ 89. 45, B4
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 0F46 _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 0F4C _ 89. 45, F4
        xor     eax, eax                                ; 0F4F _ 31. C0
        mov     edx, dword [back_sheet]                 ; 0F51 _ 8B. 15, 0000000C(d)
        mov     eax, dword [sheet_control]              ; 0F57 _ A1, 00000008(d)
        mov     dword [esp+14H], 7                      ; 0F5C _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_213                  ; 0F64 _ C7. 44 24, 10, 00000011(d)
        mov     dword [esp+0CH], 160                    ; 0F6C _ C7. 44 24, 0C, 000000A0
        mov     dword [esp+8H], 0                       ; 0F74 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0F7C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0F80 _ 89. 04 24
        call    paint_string                            ; 0F83 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], 0                      ; 0F88 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 0F8F _ C7. 45, CC, 00000000
        mov     dword [esp+0CH], 0                      ; 0F96 _ C7. 44 24, 0C, 00000000
        lea     eax, [ebp-14H]                          ; 0F9E _ 8D. 45, EC
        mov     dword [esp+8H], eax                     ; 0FA1 _ 89. 44 24, 08
        mov     dword [esp+4H], 8                       ; 0FA5 _ C7. 44 24, 04, 00000008
        lea     eax, [ebp-30H]                          ; 0FAD _ 8D. 45, D0
        mov     dword [esp], eax                        ; 0FB0 _ 89. 04 24
        call    fifo8_init                              ; 0FB3 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0FB8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 0FBD _ 89. 45, C8
        mov     dword [esp+8H], 123                     ; 0FC0 _ C7. 44 24, 08, 0000007B
        lea     eax, [ebp-30H]                          ; 0FC8 _ 8D. 45, D0
        mov     dword [esp+4H], eax                     ; 0FCB _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 0FCF _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0FD2 _ 89. 04 24
        call    timer_init                              ; 0FD5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0FDA _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 0FE2 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0FE5 _ 89. 04 24
        call    timer_settime                           ; 0FE8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-40H], 0                      ; 0FED _ C7. 45, C0, 00000000
        mov     dword [ebp-3CH], 0                      ; 0FF4 _ C7. 45, C4, 00000000
?_021:  add     dword [ebp-40H], 1                      ; 0FFB _ 83. 45, C0, 01
        call    io_cli                                  ; 0FFF _ E8, FFFFFFFC(rel)
        lea     eax, [ebp-30H]                          ; 1004 _ 8D. 45, D0
        mov     dword [esp], eax                        ; 1007 _ 89. 04 24
        call    fifo8_status                            ; 100A _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 100F _ 85. C0
        jnz     ?_022                                   ; 1011 _ 75, 07
        call    io_sti                                  ; 1013 _ E8, FFFFFFFC(rel)
        jmp     ?_023                                   ; 1018 _ EB, 6B

?_022:  lea     eax, [ebp-30H]                          ; 101A _ 8D. 45, D0
        mov     dword [esp], eax                        ; 101D _ 89. 04 24
        call    fifo8_get                               ; 1020 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 1025 _ 89. 45, CC
        call    io_sti                                  ; 1028 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-34H], 123                    ; 102D _ 83. 7D, CC, 7B
        jnz     ?_023                                   ; 1031 _ 75, 52
        mov     edx, dword [back_sheet]                 ; 1033 _ 8B. 15, 0000000C(d)
        mov     eax, dword [sheet_control]              ; 1039 _ A1, 00000008(d)
        mov     dword [esp+14H], 7                      ; 103E _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_214                  ; 1046 _ C7. 44 24, 10, 0000001E(d)
        mov     dword [esp+0CH], 176                    ; 104E _ C7. 44 24, 0C, 000000B0
        mov     ecx, dword [ebp-3CH]                    ; 1056 _ 8B. 4D, C4
        mov     dword [esp+8H], ecx                     ; 1059 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 105D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1061 _ 89. 04 24
        call    paint_string                            ; 1064 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 1069 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 1071 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 1074 _ 89. 04 24
        call    timer_settime                           ; 1077 _ E8, FFFFFFFC(rel)
        add     dword [ebp-3CH], 8                      ; 107C _ 83. 45, C4, 08
        jmp     ?_021                                   ; 1080 _ E9, FFFFFF76

?_023:  jmp     ?_021                                   ; 1085 _ E9, FFFFFF71
; task_b_main End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 108A _ 55
        mov     ebp, esp                                ; 108B _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 108D _ A1, 00000000(d)
        mov     edx, eax                                ; 1092 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1094 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1097 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1099 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 109C _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 10A2 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 10A5 _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 10AB _ 5D
        ret                                             ; 10AC _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 10AD _ 55
        mov     ebp, esp                                ; 10AE _ 89. E5
        sub     esp, 24                                 ; 10B0 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1739          ; 10B3 _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 15                      ; 10BB _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 10C3 _ C7. 04 24, 00000000
        call    set_palette                             ; 10CA _ E8, FFFFFFFC(rel)
        nop                                             ; 10CF _ 90
        leave                                           ; 10D0 _ C9
        ret                                             ; 10D1 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 10D2 _ 55
        mov     ebp, esp                                ; 10D3 _ 89. E5
        sub     esp, 40                                 ; 10D5 _ 83. EC, 28
        call    io_load_eflags                          ; 10D8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 10DD _ 89. 45, F4
        call    io_cli                                  ; 10E0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 10E5 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 10E8 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 10EC _ C7. 04 24, 000003C8
        call    io_out8                                 ; 10F3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 10F8 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 10FB _ 89. 45, F0
        jmp     ?_025                                   ; 10FE _ EB, 62

?_024:  mov     eax, dword [ebp+10H]                    ; 1100 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 1103 _ 0F B6. 00
        shr     al, 2                                   ; 1106 _ C0. E8, 02
        movzx   eax, al                                 ; 1109 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 110C _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 1110 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 1117 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 111C _ 8B. 45, 10
        add     eax, 1                                  ; 111F _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 1122 _ 0F B6. 00
        shr     al, 2                                   ; 1125 _ C0. E8, 02
        movzx   eax, al                                 ; 1128 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 112B _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 112F _ C7. 04 24, 000003C9
        call    io_out8                                 ; 1136 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 113B _ 8B. 45, 10
        add     eax, 2                                  ; 113E _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 1141 _ 0F B6. 00
        shr     al, 2                                   ; 1144 _ C0. E8, 02
        movzx   eax, al                                 ; 1147 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 114A _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 114E _ C7. 04 24, 000003C9
        call    io_out8                                 ; 1155 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 115A _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 115E _ 83. 45, F0, 01
?_025:  mov     eax, dword [ebp-10H]                    ; 1162 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 1165 _ 3B. 45, 0C
        jle     ?_024                                   ; 1168 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 116A _ 8B. 45, F4
        mov     dword [esp], eax                        ; 116D _ 89. 04 24
        call    io_store_eflags                         ; 1170 _ E8, FFFFFFFC(rel)
        nop                                             ; 1175 _ 90
        leave                                           ; 1176 _ C9
        ret                                             ; 1177 _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 1178 _ 55
        mov     ebp, esp                                ; 1179 _ 89. E5
        sub     esp, 20                                 ; 117B _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 117E _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 1181 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 1184 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 1187 _ 89. 45, FC
        jmp     ?_029                                   ; 118A _ EB, 33

?_026:  mov     eax, dword [ebp+14H]                    ; 118C _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 118F _ 89. 45, F8
        jmp     ?_028                                   ; 1192 _ EB, 1F

?_027:  mov     eax, dword [ebp-4H]                     ; 1194 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 1197 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 119B _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 119D _ 8B. 45, F8
        add     eax, edx                                ; 11A0 _ 01. D0
        mov     edx, eax                                ; 11A2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 11A4 _ 8B. 45, 08
        add     edx, eax                                ; 11A7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 11A9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 11AD _ 88. 02
        add     dword [ebp-8H], 1                       ; 11AF _ 83. 45, F8, 01
?_028:  mov     eax, dword [ebp-8H]                     ; 11B3 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 11B6 _ 3B. 45, 1C
        jle     ?_027                                   ; 11B9 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 11BB _ 83. 45, FC, 01
?_029:  mov     eax, dword [ebp-4H]                     ; 11BF _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 11C2 _ 3B. 45, 20
        jle     ?_026                                   ; 11C5 _ 7E, C5
        leave                                           ; 11C7 _ C9
        ret                                             ; 11C8 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 11C9 _ 55
        mov     ebp, esp                                ; 11CA _ 89. E5
        push    ebx                                     ; 11CC _ 53
        sub     esp, 28                                 ; 11CD _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 11D0 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 11D3 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 11D6 _ 8B. 45, 0C
        sub     eax, 1                                  ; 11D9 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 11DC _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 11E0 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 11E4 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 11EC _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 11F4 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 11FC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 11FF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1203 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1206 _ 89. 04 24
        call    paint_rectangle                         ; 1209 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 120E _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 1211 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 1214 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1217 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 121A _ 8B. 45, 10
        sub     eax, 28                                 ; 121D _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 1220 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1224 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 1228 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 122C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1234 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 123C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 123F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1243 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1246 _ 89. 04 24
        call    paint_rectangle                         ; 1249 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 124E _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 1251 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 1254 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1257 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 125A _ 8B. 45, 10
        sub     eax, 27                                 ; 125D _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 1260 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1264 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 1268 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 126C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 1274 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 127C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 127F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1283 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1286 _ 89. 04 24
        call    paint_rectangle                         ; 1289 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 128E _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 1291 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 1294 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 1297 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 129A _ 8B. 45, 10
        sub     eax, 26                                 ; 129D _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 12A0 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 12A4 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 12A8 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 12AC _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 12B4 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 12BC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 12BF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 12C3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 12C6 _ 89. 04 24
        call    paint_rectangle                         ; 12C9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 12CE _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 12D1 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 12D4 _ 8B. 45, 10
        sub     eax, 24                                 ; 12D7 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 12DA _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 12DE _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 12E6 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 12EA _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 12F2 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 12FA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 12FD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1301 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1304 _ 89. 04 24
        call    paint_rectangle                         ; 1307 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 130C _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 130F _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 1312 _ 8B. 45, 10
        sub     eax, 24                                 ; 1315 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 1318 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 131C _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 1324 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 1328 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 1330 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 1338 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 133B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 133F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1342 _ 89. 04 24
        call    paint_rectangle                         ; 1345 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 134A _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 134D _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 1350 _ 8B. 45, 10
        sub     eax, 4                                  ; 1353 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 1356 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 135A _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 1362 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 1366 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 136E _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 1376 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1379 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 137D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1380 _ 89. 04 24
        call    paint_rectangle                         ; 1383 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1388 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 138B _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 138E _ 8B. 45, 10
        sub     eax, 23                                 ; 1391 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 1394 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 1398 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 13A0 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 13A4 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 13AC _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 13B4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 13B7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13BB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13BE _ 89. 04 24
        call    paint_rectangle                         ; 13C1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 13C6 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 13C9 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 13CC _ 8B. 45, 10
        sub     eax, 3                                  ; 13CF _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 13D2 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 13D6 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 13DE _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 13E2 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 13EA _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 13F2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 13F5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13F9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13FC _ 89. 04 24
        call    paint_rectangle                         ; 13FF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1404 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 1407 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 140A _ 8B. 45, 10
        sub     eax, 24                                 ; 140D _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 1410 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 1414 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 141C _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 1420 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 1428 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 1430 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1433 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1437 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 143A _ 89. 04 24
        call    paint_rectangle                         ; 143D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1442 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 1445 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 1448 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 144B _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 144E _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1451 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 1454 _ 8B. 45, 0C
        sub     eax, 47                                 ; 1457 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 145A _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 145E _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1462 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 1466 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 146A _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 1472 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1475 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1479 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 147C _ 89. 04 24
        call    paint_rectangle                         ; 147F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1484 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 1487 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 148A _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 148D _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 1490 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 1493 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 1496 _ 8B. 45, 0C
        sub     eax, 47                                 ; 1499 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 149C _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 14A0 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 14A4 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 14A8 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 14AC _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 14B4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14B7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14BB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14BE _ 89. 04 24
        call    paint_rectangle                         ; 14C1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 14C6 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 14C9 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 14CC _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 14CF _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 14D2 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 14D5 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 14D8 _ 8B. 45, 0C
        sub     eax, 47                                 ; 14DB _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 14DE _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 14E2 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 14E6 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 14EA _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 14EE _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 14F6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14F9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14FD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1500 _ 89. 04 24
        call    paint_rectangle                         ; 1503 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1508 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 150B _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 150E _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1511 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 1514 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 1517 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 151A _ 8B. 45, 0C
        sub     eax, 3                                  ; 151D _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 1520 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1524 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1528 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 152C _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 1530 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 1538 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 153B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 153F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1542 _ 89. 04 24
        call    paint_rectangle                         ; 1545 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 154A _ 83. C4, 1C
        pop     ebx                                     ; 154D _ 5B
        pop     ebp                                     ; 154E _ 5D
        ret                                             ; 154F _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 1550 _ 55
        mov     ebp, esp                                ; 1551 _ 89. E5
        sub     esp, 16                                 ; 1553 _ 83. EC, 10
        movzx   eax, word [?_223]                       ; 1556 _ 0F B7. 05, 00000084(d)
        cwde                                            ; 155D _ 98
        mov     dword [ebp-8H], eax                     ; 155E _ 89. 45, F8
        movzx   eax, word [?_224]                       ; 1561 _ 0F B7. 05, 00000086(d)
        cwde                                            ; 1568 _ 98
        mov     dword [ebp-4H], eax                     ; 1569 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 156C _ 8B. 45, F8
        sub     eax, 16                                 ; 156F _ 83. E8, 10
        mov     edx, eax                                ; 1572 _ 89. C2
        shr     edx, 31                                 ; 1574 _ C1. EA, 1F
        add     eax, edx                                ; 1577 _ 01. D0
        sar     eax, 1                                  ; 1579 _ D1. F8
        mov     dword [mouse_x], eax                    ; 157B _ A3, 000001A8(d)
        mov     eax, dword [ebp-4H]                     ; 1580 _ 8B. 45, FC
        sub     eax, 44                                 ; 1583 _ 83. E8, 2C
        mov     edx, eax                                ; 1586 _ 89. C2
        shr     edx, 31                                 ; 1588 _ C1. EA, 1F
        add     eax, edx                                ; 158B _ 01. D0
        sar     eax, 1                                  ; 158D _ D1. F8
        mov     dword [mouse_y], eax                    ; 158F _ A3, 000001AC(d)
        leave                                           ; 1594 _ C9
        ret                                             ; 1595 _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 1596 _ 55
        mov     ebp, esp                                ; 1597 _ 89. E5
        sub     esp, 20                                 ; 1599 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 159C _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 159F _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 15A2 _ C7. 45, FC, 00000000
        jmp     ?_039                                   ; 15A9 _ E9, 0000016E

?_030:  mov     edx, dword [ebp-4H]                     ; 15AE _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 15B1 _ 8B. 45, 18
        add     eax, edx                                ; 15B4 _ 01. D0
        movzx   eax, byte [eax]                         ; 15B6 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 15B9 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 15BC _ 0F B6. 45, FB
        test    al, al                                  ; 15C0 _ 84. C0
        jns     ?_031                                   ; 15C2 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 15C4 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 15C7 _ 8B. 55, 14
        add     eax, edx                                ; 15CA _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 15CC _ 0F AF. 45, 0C
        mov     edx, eax                                ; 15D0 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 15D2 _ 8B. 45, 10
        add     eax, edx                                ; 15D5 _ 01. D0
        mov     edx, eax                                ; 15D7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 15D9 _ 8B. 45, 08
        add     edx, eax                                ; 15DC _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 15DE _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 15E2 _ 88. 02
?_031:  movzx   eax, byte [ebp-5H]                      ; 15E4 _ 0F B6. 45, FB
        and     eax, 40H                                ; 15E8 _ 83. E0, 40
        test    eax, eax                                ; 15EB _ 85. C0
        jz      ?_032                                   ; 15ED _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 15EF _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 15F2 _ 8B. 55, 14
        add     eax, edx                                ; 15F5 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 15F7 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 15FB _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 15FD _ 8B. 45, 10
        add     eax, edx                                ; 1600 _ 01. D0
        lea     edx, [eax+1H]                           ; 1602 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1605 _ 8B. 45, 08
        add     edx, eax                                ; 1608 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 160A _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 160E _ 88. 02
?_032:  movzx   eax, byte [ebp-5H]                      ; 1610 _ 0F B6. 45, FB
        and     eax, 20H                                ; 1614 _ 83. E0, 20
        test    eax, eax                                ; 1617 _ 85. C0
        jz      ?_033                                   ; 1619 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 161B _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 161E _ 8B. 55, 14
        add     eax, edx                                ; 1621 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1623 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1627 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1629 _ 8B. 45, 10
        add     eax, edx                                ; 162C _ 01. D0
        lea     edx, [eax+2H]                           ; 162E _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1631 _ 8B. 45, 08
        add     edx, eax                                ; 1634 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1636 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 163A _ 88. 02
?_033:  movzx   eax, byte [ebp-5H]                      ; 163C _ 0F B6. 45, FB
        and     eax, 10H                                ; 1640 _ 83. E0, 10
        test    eax, eax                                ; 1643 _ 85. C0
        jz      ?_034                                   ; 1645 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1647 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 164A _ 8B. 55, 14
        add     eax, edx                                ; 164D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 164F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1653 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1655 _ 8B. 45, 10
        add     eax, edx                                ; 1658 _ 01. D0
        lea     edx, [eax+3H]                           ; 165A _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 165D _ 8B. 45, 08
        add     edx, eax                                ; 1660 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1662 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1666 _ 88. 02
?_034:  movzx   eax, byte [ebp-5H]                      ; 1668 _ 0F B6. 45, FB
        and     eax, 08H                                ; 166C _ 83. E0, 08
        test    eax, eax                                ; 166F _ 85. C0
        jz      ?_035                                   ; 1671 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1673 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1676 _ 8B. 55, 14
        add     eax, edx                                ; 1679 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 167B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 167F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1681 _ 8B. 45, 10
        add     eax, edx                                ; 1684 _ 01. D0
        lea     edx, [eax+4H]                           ; 1686 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1689 _ 8B. 45, 08
        add     edx, eax                                ; 168C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 168E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1692 _ 88. 02
?_035:  movzx   eax, byte [ebp-5H]                      ; 1694 _ 0F B6. 45, FB
        and     eax, 04H                                ; 1698 _ 83. E0, 04
        test    eax, eax                                ; 169B _ 85. C0
        jz      ?_036                                   ; 169D _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 169F _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 16A2 _ 8B. 55, 14
        add     eax, edx                                ; 16A5 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 16A7 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 16AB _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 16AD _ 8B. 45, 10
        add     eax, edx                                ; 16B0 _ 01. D0
        lea     edx, [eax+5H]                           ; 16B2 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 16B5 _ 8B. 45, 08
        add     edx, eax                                ; 16B8 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 16BA _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 16BE _ 88. 02
?_036:  movzx   eax, byte [ebp-5H]                      ; 16C0 _ 0F B6. 45, FB
        and     eax, 02H                                ; 16C4 _ 83. E0, 02
        test    eax, eax                                ; 16C7 _ 85. C0
        jz      ?_037                                   ; 16C9 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 16CB _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 16CE _ 8B. 55, 14
        add     eax, edx                                ; 16D1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 16D3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 16D7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 16D9 _ 8B. 45, 10
        add     eax, edx                                ; 16DC _ 01. D0
        lea     edx, [eax+6H]                           ; 16DE _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 16E1 _ 8B. 45, 08
        add     edx, eax                                ; 16E4 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 16E6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 16EA _ 88. 02
?_037:  movzx   eax, byte [ebp-5H]                      ; 16EC _ 0F B6. 45, FB
        and     eax, 01H                                ; 16F0 _ 83. E0, 01
        test    eax, eax                                ; 16F3 _ 85. C0
        jz      ?_038                                   ; 16F5 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 16F7 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 16FA _ 8B. 55, 14
        add     eax, edx                                ; 16FD _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 16FF _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1703 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1705 _ 8B. 45, 10
        add     eax, edx                                ; 1708 _ 01. D0
        lea     edx, [eax+7H]                           ; 170A _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 170D _ 8B. 45, 08
        add     edx, eax                                ; 1710 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1712 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1716 _ 88. 02
?_038:  add     dword [ebp-4H], 1                       ; 1718 _ 83. 45, FC, 01
?_039:  cmp     dword [ebp-4H], 15                      ; 171C _ 83. 7D, FC, 0F
        jle     ?_030                                   ; 1720 _ 0F 8E, FFFFFE88
        leave                                           ; 1726 _ C9
        ret                                             ; 1727 _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 1728 _ 55
        mov     ebp, esp                                ; 1729 _ 89. E5
        push    ebx                                     ; 172B _ 53
        sub     esp, 52                                 ; 172C _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 172F _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 1732 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 1735 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 1738 _ 89. 45, F4
        jmp     ?_041                                   ; 173B _ EB, 4B

?_040:  movsx   ecx, byte [ebp-1CH]                     ; 173D _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 1741 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 1744 _ 0F B6. 00
        movsx   eax, al                                 ; 1747 _ 0F BE. C0
        shl     eax, 4                                  ; 174A _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 174D _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 1753 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 1756 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1759 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 175C _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 175E _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 1762 _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 1766 _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 1769 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 176D _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 1770 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1774 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1778 _ 89. 04 24
        call    paint_font                              ; 177B _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 1780 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 1784 _ 83. 45, 18, 01
?_041:  mov     eax, dword [ebp+18H]                    ; 1788 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 178B _ 0F B6. 00
        test    al, al                                  ; 178E _ 84. C0
        jnz     ?_040                                   ; 1790 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 1792 _ 8B. 45, 14
        add     eax, 16                                 ; 1795 _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 1798 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 179C _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 179F _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 17A3 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 17A6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 17AA _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 17AD _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 17B1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 17B4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 17B8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17BB _ 89. 04 24
        call    sheet_refresh                           ; 17BE _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 17C3 _ 83. C4, 34
        pop     ebx                                     ; 17C6 _ 5B
        pop     ebp                                     ; 17C7 _ 5D
        ret                                             ; 17C8 _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 17C9 _ 55
        mov     ebp, esp                                ; 17CA _ 89. E5
        sub     esp, 20                                 ; 17CC _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 17CF _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 17D2 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 17D5 _ C7. 45, F8, 00000000
        jmp     ?_048                                   ; 17DC _ E9, 0000009C

?_042:  mov     dword [ebp-4H], 0                       ; 17E1 _ C7. 45, FC, 00000000
        jmp     ?_047                                   ; 17E8 _ E9, 00000082

?_043:  mov     eax, dword [ebp-8H]                     ; 17ED _ 8B. 45, F8
        shl     eax, 4                                  ; 17F0 _ C1. E0, 04
        mov     edx, eax                                ; 17F3 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 17F5 _ 8B. 45, FC
        add     eax, edx                                ; 17F8 _ 01. D0
        add     eax, cursor.1807                        ; 17FA _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 17FF _ 0F B6. 00
        cmp     al, 42                                  ; 1802 _ 3C, 2A
        jnz     ?_044                                   ; 1804 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 1806 _ 8B. 45, F8
        shl     eax, 4                                  ; 1809 _ C1. E0, 04
        mov     edx, eax                                ; 180C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 180E _ 8B. 45, FC
        add     eax, edx                                ; 1811 _ 01. D0
        mov     edx, eax                                ; 1813 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1815 _ 8B. 45, 08
        add     eax, edx                                ; 1818 _ 01. D0
        mov     byte [eax], 0                           ; 181A _ C6. 00, 00
        jmp     ?_046                                   ; 181D _ EB, 4C

?_044:  mov     eax, dword [ebp-8H]                     ; 181F _ 8B. 45, F8
        shl     eax, 4                                  ; 1822 _ C1. E0, 04
        mov     edx, eax                                ; 1825 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1827 _ 8B. 45, FC
        add     eax, edx                                ; 182A _ 01. D0
        add     eax, cursor.1807                        ; 182C _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 1831 _ 0F B6. 00
        cmp     al, 79                                  ; 1834 _ 3C, 4F
        jnz     ?_045                                   ; 1836 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 1838 _ 8B. 45, F8
        shl     eax, 4                                  ; 183B _ C1. E0, 04
        mov     edx, eax                                ; 183E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1840 _ 8B. 45, FC
        add     eax, edx                                ; 1843 _ 01. D0
        mov     edx, eax                                ; 1845 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1847 _ 8B. 45, 08
        add     eax, edx                                ; 184A _ 01. D0
        mov     byte [eax], 7                           ; 184C _ C6. 00, 07
        jmp     ?_046                                   ; 184F _ EB, 1A

?_045:  mov     eax, dword [ebp-8H]                     ; 1851 _ 8B. 45, F8
        shl     eax, 4                                  ; 1854 _ C1. E0, 04
        mov     edx, eax                                ; 1857 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1859 _ 8B. 45, FC
        add     eax, edx                                ; 185C _ 01. D0
        mov     edx, eax                                ; 185E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1860 _ 8B. 45, 08
        add     edx, eax                                ; 1863 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1865 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1869 _ 88. 02
?_046:  add     dword [ebp-4H], 1                       ; 186B _ 83. 45, FC, 01
?_047:  cmp     dword [ebp-4H], 15                      ; 186F _ 83. 7D, FC, 0F
        jle     ?_043                                   ; 1873 _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 1879 _ 83. 45, F8, 01
?_048:  cmp     dword [ebp-8H], 15                      ; 187D _ 83. 7D, F8, 0F
        jle     ?_042                                   ; 1881 _ 0F 8E, FFFFFF5A
        leave                                           ; 1887 _ C9
        ret                                             ; 1888 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 1889 _ 55
        mov     ebp, esp                                ; 188A _ 89. E5
        sub     esp, 16                                 ; 188C _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 188F _ C7. 45, F8, 00000000
        jmp     ?_052                                   ; 1896 _ EB, 50

?_049:  mov     dword [ebp-4H], 0                       ; 1898 _ C7. 45, FC, 00000000
        jmp     ?_051                                   ; 189F _ EB, 3B

?_050:  mov     eax, dword [ebp-8H]                     ; 18A1 _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 18A4 _ 8B. 55, 14
        add     eax, edx                                ; 18A7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 18A9 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 18AD _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 18B0 _ 8B. 4D, 10
        add     edx, ecx                                ; 18B3 _ 01. CA
        add     eax, edx                                ; 18B5 _ 01. D0
        mov     edx, eax                                ; 18B7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 18B9 _ 8B. 45, 08
        add     edx, eax                                ; 18BC _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 18BE _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 18C1 _ 0F AF. 45, 18
        mov     ecx, eax                                ; 18C5 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 18C7 _ 8B. 45, FC
        add     eax, ecx                                ; 18CA _ 01. C8
        mov     ecx, eax                                ; 18CC _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 18CE _ 8B. 45, 20
        add     eax, ecx                                ; 18D1 _ 01. C8
        movzx   eax, byte [eax]                         ; 18D3 _ 0F B6. 00
        mov     byte [edx], al                          ; 18D6 _ 88. 02
        add     dword [ebp-4H], 1                       ; 18D8 _ 83. 45, FC, 01
?_051:  mov     eax, dword [ebp-4H]                     ; 18DC _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 18DF _ 3B. 45, 18
        jl      ?_050                                   ; 18E2 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 18E4 _ 83. 45, F8, 01
?_052:  mov     eax, dword [ebp-8H]                     ; 18E8 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 18EB _ 3B. 45, 1C
        jl      ?_049                                   ; 18EE _ 7C, A8
        leave                                           ; 18F0 _ C9
        ret                                             ; 18F1 _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 18F2 _ 55
        mov     ebp, esp                                ; 18F3 _ 89. E5
        sub     esp, 24                                 ; 18F5 _ 83. EC, 18
        mov     dword [esp+0CH], 0                      ; 18F8 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 1900 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 1908 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 1910 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 1917 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 191C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], keybuf                  ; 1924 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 192C _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 1934 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 193B _ E8, FFFFFFFC(rel)
        leave                                           ; 1940 _ C9
        ret                                             ; 1941 _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 1942 _ 55
        mov     ebp, esp                                ; 1943 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 1945 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 1948 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 194B _ A1, 000001A8(d)
        add     eax, edx                                ; 1950 _ 01. D0
        mov     dword [mouse_x], eax                    ; 1952 _ A3, 000001A8(d)
        mov     eax, dword [ebp+10H]                    ; 1957 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 195A _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 195D _ A1, 000001AC(d)
        add     eax, edx                                ; 1962 _ 01. D0
        mov     dword [mouse_y], eax                    ; 1964 _ A3, 000001AC(d)
        mov     eax, dword [mouse_x]                    ; 1969 _ A1, 000001A8(d)
        test    eax, eax                                ; 196E _ 85. C0
        jns     ?_053                                   ; 1970 _ 79, 0A
        mov     dword [mouse_x], 0                      ; 1972 _ C7. 05, 000001A8(d), 00000000
?_053:  mov     eax, dword [mouse_y]                    ; 197C _ A1, 000001AC(d)
        test    eax, eax                                ; 1981 _ 85. C0
        jns     ?_054                                   ; 1983 _ 79, 0A
        mov     dword [mouse_y], 0                      ; 1985 _ C7. 05, 000001AC(d), 00000000
?_054:  movzx   eax, word [?_223]                       ; 198F _ 0F B7. 05, 00000084(d)
        cwde                                            ; 1996 _ 98
        lea     edx, [eax-10H]                          ; 1997 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 199A _ A1, 000001A8(d)
        cmp     edx, eax                                ; 199F _ 39. C2
        jge     ?_055                                   ; 19A1 _ 7D, 10
        movzx   eax, word [?_223]                       ; 19A3 _ 0F B7. 05, 00000084(d)
        cwde                                            ; 19AA _ 98
        sub     eax, 16                                 ; 19AB _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 19AE _ A3, 000001A8(d)
?_055:  movzx   eax, word [?_223]                       ; 19B3 _ 0F B7. 05, 00000084(d)
        cwde                                            ; 19BA _ 98
        lea     edx, [eax-10H]                          ; 19BB _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 19BE _ A1, 000001AC(d)
        cmp     edx, eax                                ; 19C3 _ 39. C2
        jge     ?_056                                   ; 19C5 _ 7D, 10
        movzx   eax, word [?_223]                       ; 19C7 _ 0F B7. 05, 00000084(d)
        cwde                                            ; 19CE _ 98
        sub     eax, 16                                 ; 19CF _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 19D2 _ A3, 000001AC(d)
?_056:  pop     ebp                                     ; 19D7 _ 5D
        ret                                             ; 19D8 _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 19D9 _ 55
        mov     ebp, esp                                ; 19DA _ 89. E5
        sub     esp, 40                                 ; 19DC _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 19DF _ C6. 45, F7, 00
        call    io_sti                                  ; 19E3 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 19E8 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 19EF _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 19F4 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 19F7 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 19FB _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 19FF _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 1A06 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1A0B _ 85. C0
        jz      ?_057                                   ; 1A0D _ 74, 77
        mov     dword [esp+8H], mouse_send_info         ; 1A0F _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 1A17 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1A1A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1A1E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1A21 _ 89. 04 24
        call    compute_mouse_position                  ; 1A24 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 1A29 _ 8B. 15, 000001AC(d)
        mov     eax, dword [mouse_x]                    ; 1A2F _ A1, 000001A8(d)
        mov     dword [esp+0CH], edx                    ; 1A34 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 1A38 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 1A3C _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 1A3F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1A43 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1A46 _ 89. 04 24
        call    sheet_slide                             ; 1A49 _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_send_info+0CH]        ; 1A4E _ A1, 0000000C(d)
        and     eax, 01H                                ; 1A53 _ 83. E0, 01
        test    eax, eax                                ; 1A56 _ 85. C0
        jz      ?_057                                   ; 1A58 _ 74, 2C
        mov     eax, dword [mouse_y]                    ; 1A5A _ A1, 000001AC(d)
        lea     ecx, [eax-8H]                           ; 1A5F _ 8D. 48, F8
        mov     eax, dword [mouse_x]                    ; 1A62 _ A1, 000001A8(d)
        lea     edx, [eax-50H]                          ; 1A67 _ 8D. 50, B0
        mov     eax, dword [sheet_win]                  ; 1A6A _ A1, 000001A4(d)
        mov     dword [esp+0CH], ecx                    ; 1A6F _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1A73 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 1A77 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1A7B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1A7E _ 89. 04 24
        call    sheet_slide                             ; 1A81 _ E8, FFFFFFFC(rel)
?_057:  leave                                           ; 1A86 _ C9
        ret                                             ; 1A87 _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 1A88 _ 55
        mov     ebp, esp                                ; 1A89 _ 89. E5
        sub     esp, 88                                 ; 1A8B _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 1A8E _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 1A95 _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 1A9C _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 1AA3 _ A1, 00000080(d)
        mov     dword [ebp-2CH], eax                    ; 1AA8 _ 89. 45, D4
        movzx   eax, word [?_223]                       ; 1AAB _ 0F B7. 05, 00000084(d)
        cwde                                            ; 1AB2 _ 98
        mov     dword [ebp-28H], eax                    ; 1AB3 _ 89. 45, D8
        movzx   eax, word [?_224]                       ; 1AB6 _ 0F B7. 05, 00000086(d)
        cwde                                            ; 1ABD _ 98
        mov     dword [ebp-24H], eax                    ; 1ABE _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 1AC1 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1AC4 _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 1AC6 _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 1AC9 _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 1ACD _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 1AD0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1AD4 _ 89. 04 24
        call    init_desktop                            ; 1AD7 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1ADC _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_215                  ; 1AE4 _ C7. 44 24, 10, 00000020(d)
        mov     eax, dword [ebp-34H]                    ; 1AEC _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1AEF _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1AF3 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1AF6 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1AFA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1AFD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1B01 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1B04 _ 89. 04 24
        call    paint_string                            ; 1B07 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 1B0C _ 8B. 45, 14
        mov     dword [esp], eax                        ; 1B0F _ 89. 04 24
        call    intToHexStr                             ; 1B12 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 1B17 _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 1B1A _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 1B22 _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 1B25 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1B29 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1B2C _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1B30 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1B33 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1B37 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1B3A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1B3E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1B41 _ 89. 04 24
        call    paint_string                            ; 1B44 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1B49 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1B4D _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_216                  ; 1B55 _ C7. 44 24, 10, 0000002A(d)
        mov     eax, dword [ebp-34H]                    ; 1B5D _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1B60 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1B64 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1B67 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1B6B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1B6E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1B72 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1B75 _ 89. 04 24
        call    paint_string                            ; 1B78 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1B7D _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1B80 _ 8B. 00
        mov     dword [esp], eax                        ; 1B82 _ 89. 04 24
        call    intToHexStr                             ; 1B85 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 1B8A _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 1B8D _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 1B95 _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 1B98 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1B9C _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1B9F _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1BA3 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1BA6 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1BAA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1BAD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1BB1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1BB4 _ 89. 04 24
        call    paint_string                            ; 1BB7 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1BBC _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1BC0 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_217                  ; 1BC8 _ C7. 44 24, 10, 00000036(d)
        mov     eax, dword [ebp-34H]                    ; 1BD0 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1BD3 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1BD7 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1BDA _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1BDE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1BE1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1BE5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1BE8 _ 89. 04 24
        call    paint_string                            ; 1BEB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1BF0 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 1BF3 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 1BF6 _ 89. 04 24
        call    intToHexStr                             ; 1BF9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1BFE _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 1C01 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 1C09 _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 1C0C _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1C10 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1C13 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1C17 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1C1A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1C1E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1C21 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1C25 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1C28 _ 89. 04 24
        call    paint_string                            ; 1C2B _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1C30 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1C34 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_218                  ; 1C3C _ C7. 44 24, 10, 00000042(d)
        mov     eax, dword [ebp-34H]                    ; 1C44 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1C47 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1C4B _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1C4E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1C52 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1C55 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1C59 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1C5C _ 89. 04 24
        call    paint_string                            ; 1C5F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1C64 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 1C67 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 1C6A _ 89. 04 24
        call    intToHexStr                             ; 1C6D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1C72 _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 1C75 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 1C7D _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 1C80 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1C84 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1C87 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1C8B _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1C8E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1C92 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1C95 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1C99 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1C9C _ 89. 04 24
        call    paint_string                            ; 1C9F _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1CA4 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1CA8 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_219                  ; 1CB0 _ C7. 44 24, 10, 0000004E(d)
        mov     eax, dword [ebp-34H]                    ; 1CB8 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1CBB _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1CBF _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1CC2 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1CC6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1CC9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1CCD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1CD0 _ 89. 04 24
        call    paint_string                            ; 1CD3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1CD8 _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 1CDB _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 1CDE _ 89. 04 24
        call    intToHexStr                             ; 1CE1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1CE6 _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 1CE9 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 1CF1 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 1CF4 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1CF8 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1CFB _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1CFF _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1D02 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1D06 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1D09 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1D0D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1D10 _ 89. 04 24
        call    paint_string                            ; 1D13 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1D18 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1D1C _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_220                  ; 1D24 _ C7. 44 24, 10, 0000005B(d)
        mov     eax, dword [ebp-34H]                    ; 1D2C _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1D2F _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1D33 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1D36 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1D3A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1D3D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1D41 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1D44 _ 89. 04 24
        call    paint_string                            ; 1D47 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1D4C _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 1D4F _ 8B. 40, 10
        mov     dword [esp], eax                        ; 1D52 _ 89. 04 24
        call    intToHexStr                             ; 1D55 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1D5A _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 1D5D _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 1D65 _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 1D68 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1D6C _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1D6F _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1D73 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1D76 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1D7A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1D7D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1D81 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1D84 _ 89. 04 24
        call    paint_string                            ; 1D87 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1D8C _ 83. 45, CC, 10
        leave                                           ; 1D90 _ C9
        ret                                             ; 1D91 _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 1D92 _ 55
        mov     ebp, esp                                ; 1D93 _ 89. E5
        sub     esp, 56                                 ; 1D95 _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 1D98 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1D9B _ 89. 04 24
        call    sheet_alloc                             ; 1D9E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1DA3 _ 89. 45, F0
        mov     eax, dword [memman]                     ; 1DA6 _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 1DAB _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 1DB3 _ 89. 04 24
        call    memman_alloc_4k                         ; 1DB6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1DBB _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 1DBE _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 1DC6 _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 1DCE _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 1DD6 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 1DD9 _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 1DDD _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1DE0 _ 89. 04 24
        call    sheet_setbuf                            ; 1DE3 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 1DE8 _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 1DF0 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 1DF3 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 1DF7 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1DFA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1DFE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1E01 _ 89. 04 24
        call    make_windows                            ; 1E04 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1E09 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 1E11 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 1E19 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 1E21 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 1E29 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-10H]                    ; 1E31 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1E34 _ 89. 04 24
        call    make_textbox                            ; 1E37 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 1E3C _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 1E44 _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-10H]                    ; 1E4C _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1E4F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1E53 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1E56 _ 89. 04 24
        call    sheet_slide                             ; 1E59 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 1E5E _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 1E66 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1E69 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1E6D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1E70 _ 89. 04 24
        call    sheet_updown                            ; 1E73 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1E78 _ 8B. 45, F0
        leave                                           ; 1E7B _ C9
        ret                                             ; 1E7C _ C3
; message_box End of function

make_textbox:; Function begin
        push    ebp                                     ; 1E7D _ 55
        mov     ebp, esp                                ; 1E7E _ 89. E5
        push    edi                                     ; 1E80 _ 57
        push    esi                                     ; 1E81 _ 56
        push    ebx                                     ; 1E82 _ 53
        sub     esp, 44                                 ; 1E83 _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 1E86 _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 1E89 _ 8B. 55, 0C
        add     eax, edx                                ; 1E8C _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1E8E _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 1E91 _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 1E94 _ 8B. 55, 10
        add     eax, edx                                ; 1E97 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1E99 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1E9C _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 1E9F _ 8D. 78, FD
        mov     eax, dword [ebp-14H]                    ; 1EA2 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1EA5 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1EA8 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1EAB _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1EAE _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1EB1 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1EB4 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1EB7 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1EBA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1EBD _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1EBF _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1EC3 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1EC7 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1ECB _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 1ECF _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 1ED7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1EDB _ 89. 04 24
        call    paint_rectangle                         ; 1EDE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1EE3 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1EE6 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 1EE9 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 1EEC _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 1EEF _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1EF2 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1EF5 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1EF8 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1EFB _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1EFE _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1F01 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F04 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1F06 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1F0A _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1F0E _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1F12 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 1F16 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 1F1E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1F22 _ 89. 04 24
        call    paint_rectangle                         ; 1F25 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1F2A _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 1F2D _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 1F30 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1F33 _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 1F36 _ 8B. 45, F0
        lea     ebx, [eax+2H]                           ; 1F39 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 1F3C _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1F3F _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1F42 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1F45 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1F48 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F4B _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1F4D _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1F51 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1F55 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1F59 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 1F5D _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 1F65 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1F69 _ 89. 04 24
        call    paint_rectangle                         ; 1F6C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1F71 _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 1F74 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 1F77 _ 8B. 45, EC
        lea     esi, [eax+2H]                           ; 1F7A _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1F7D _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1F80 _ 8D. 58, FD
        mov     eax, dword [ebp-14H]                    ; 1F83 _ 8B. 45, EC
        lea     ecx, [eax+2H]                           ; 1F86 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1F89 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1F8C _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1F8F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F92 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1F94 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1F98 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1F9C _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1FA0 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 1FA4 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 1FAC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1FB0 _ 89. 04 24
        call    paint_rectangle                         ; 1FB3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1FB8 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 1FBB _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 1FBE _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1FC1 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 1FC4 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1FC7 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 1FCA _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1FCD _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1FD0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1FD3 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1FD5 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 1FD9 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 1FDC _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1FE0 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1FE4 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 1FE8 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 1FF0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1FF4 _ 89. 04 24
        call    paint_rectangle                         ; 1FF7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 1FFC _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 1FFF _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 2002 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 2005 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 2008 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 200B _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 200E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2011 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2014 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2017 _ 8B. 00
        mov     ecx, dword [ebp-10H]                    ; 2019 _ 8B. 4D, F0
        mov     dword [esp+18H], ecx                    ; 201C _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 2020 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 2024 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2028 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 202C _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 2034 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2038 _ 89. 04 24
        call    paint_rectangle                         ; 203B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2040 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 2043 _ 8D. 48, 01
        mov     eax, dword [ebp-10H]                    ; 2046 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 2049 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 204C _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 204F _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 2052 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2055 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2058 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 205B _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 205D _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 2061 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 2064 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 2068 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 206C _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 2070 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 2078 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 207C _ 89. 04 24
        call    paint_rectangle                         ; 207F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2084 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 2087 _ 8D. 78, 01
        mov     eax, dword [ebp-14H]                    ; 208A _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 208D _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 2090 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 2093 _ 8D. 58, FE
        mov     eax, dword [ebp-14H]                    ; 2096 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 2099 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 209C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 209F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 20A2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 20A5 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 20A7 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 20AB _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 20AF _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 20B3 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 20B7 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 20BF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 20C3 _ 89. 04 24
        call    paint_rectangle                         ; 20C6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 20CB _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 20CE _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 20D1 _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 20D4 _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 20D7 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 20DA _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 20DD _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 20E0 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 20E3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 20E6 _ 8B. 00
        mov     ebx, dword [ebp-10H]                    ; 20E8 _ 8B. 5D, F0
        mov     dword [esp+18H], ebx                    ; 20EB _ 89. 5C 24, 18
        mov     ebx, dword [ebp-14H]                    ; 20EF _ 8B. 5D, EC
        mov     dword [esp+14H], ebx                    ; 20F2 _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 20F6 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 20FA _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 20FE _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2102 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2106 _ 89. 04 24
        call    paint_rectangle                         ; 2109 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 210E _ 83. C4, 2C
        pop     ebx                                     ; 2111 _ 5B
        pop     esi                                     ; 2112 _ 5E
        pop     edi                                     ; 2113 _ 5F
        pop     ebp                                     ; 2114 _ 5D
        ret                                             ; 2115 _ C3
; make_textbox End of function

make_windows:; Function begin
        push    ebp                                     ; 2116 _ 55
        mov     ebp, esp                                ; 2117 _ 89. E5
        push    ebx                                     ; 2119 _ 53
        sub     esp, 52                                 ; 211A _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 211D _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 2120 _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 2123 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2126 _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 2129 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 212C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 212F _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 2132 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2135 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 2138 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 213B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 213E _ 8B. 00
        mov     dword [esp+18H], 0                      ; 2140 _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 2148 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 214C _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 2154 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 215C _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 2164 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 2167 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 216B _ 89. 04 24
        call    paint_rectangle                         ; 216E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 2173 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 2176 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 2179 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 217C _ 8B. 00
        mov     dword [esp+18H], 1                      ; 217E _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 2186 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 218A _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 2192 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 219A _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 21A2 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 21A5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 21A9 _ 89. 04 24
        call    paint_rectangle                         ; 21AC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 21B1 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 21B4 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 21B7 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 21BA _ 8B. 00
        mov     dword [esp+18H], edx                    ; 21BC _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 21C0 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 21C8 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 21D0 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 21D8 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 21E0 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 21E3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 21E7 _ 89. 04 24
        call    paint_rectangle                         ; 21EA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 21EF _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 21F2 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 21F5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 21F8 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 21FA _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 21FE _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 2206 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 220E _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 2216 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 221E _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 2221 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2225 _ 89. 04 24
        call    paint_rectangle                         ; 2228 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 222D _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 2230 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 2233 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 2236 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 2239 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 223C _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 223F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2242 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 2244 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 2248 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 224C _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 2254 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 2258 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 2260 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 2263 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2267 _ 89. 04 24
        call    paint_rectangle                         ; 226A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 226F _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 2272 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 2275 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 2278 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 227B _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 227E _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 2281 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2284 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 2286 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 228A _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 228E _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 2296 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 229A _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 22A2 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 22A5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 22A9 _ 89. 04 24
        call    paint_rectangle                         ; 22AC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 22B1 _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 22B4 _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 22B7 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 22BA _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 22BD _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 22C0 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 22C2 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 22C6 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 22CA _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 22D2 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 22DA _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 22E2 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 22E5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 22E9 _ 89. 04 24
        call    paint_rectangle                         ; 22EC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 22F1 _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 22F4 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 22F7 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 22FA _ 8B. 00
        mov     dword [esp+18H], 20                     ; 22FC _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 2304 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 2308 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 2310 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 2318 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 2320 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 2323 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2327 _ 89. 04 24
        call    paint_rectangle                         ; 232A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 232F _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 2332 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 2335 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 2338 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 233B _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 233E _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 2341 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2344 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 2346 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 234A _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 234E _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 2352 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 235A _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 2362 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 2365 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2369 _ 89. 04 24
        call    paint_rectangle                         ; 236C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 2371 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 2374 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 2377 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 237A _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 237D _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2380 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 2383 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2386 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 2388 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 238C _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 2390 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 2394 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 239C _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 23A4 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 23A7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 23AB _ 89. 04 24
        call    paint_rectangle                         ; 23AE _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-1CH]                     ; 23B3 _ 0F BE. 45, E4
        mov     dword [esp+0CH], eax                    ; 23B7 _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 23BB _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 23BE _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 23C2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 23C5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 23C9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 23CC _ 89. 04 24
        call    make_window_title                       ; 23CF _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 23D4 _ 83. C4, 34
        pop     ebx                                     ; 23D7 _ 5B
        pop     ebp                                     ; 23D8 _ 5D
        ret                                             ; 23D9 _ C3
; make_windows End of function

make_window_title:; Function begin
        push    ebp                                     ; 23DA _ 55
        mov     ebp, esp                                ; 23DB _ 89. E5
        push    ebx                                     ; 23DD _ 53
        sub     esp, 52                                 ; 23DE _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 23E1 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 23E4 _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 23E7 _ 80. 7D, E4, 00
        jz      ?_058                                   ; 23EB _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 23ED _ C6. 45, EE, 07
        mov     byte [ebp-11H], 12                      ; 23F1 _ C6. 45, EF, 0C
        jmp     ?_059                                   ; 23F5 _ EB, 08

?_058:  mov     byte [ebp-12H], 8                       ; 23F7 _ C6. 45, EE, 08
        mov     byte [ebp-11H], 15                      ; 23FB _ C6. 45, EF, 0F
?_059:  mov     eax, dword [ebp+0CH]                    ; 23FF _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2402 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 2405 _ 8D. 58, FC
        movzx   eax, byte [ebp-11H]                     ; 2408 _ 0F B6. 45, EF
        movzx   ecx, al                                 ; 240C _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 240F _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 2412 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 2415 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 2418 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 241A _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], ebx                    ; 2422 _ 89. 5C 24, 14
        mov     dword [esp+10H], 3                      ; 2426 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 242E _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], ecx                     ; 2436 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 243A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 243E _ 89. 04 24
        call    paint_rectangle                         ; 2441 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-12H]                     ; 2446 _ 0F BE. 45, EE
        mov     dword [esp+14H], eax                    ; 244A _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 244E _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 2451 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 2455 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 245D _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 2465 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2468 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 246C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 246F _ 89. 04 24
        call    paint_string                            ; 2472 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 2477 _ C7. 45, F4, 00000000
        jmp     ?_067                                   ; 247E _ E9, 00000083

?_060:  mov     dword [ebp-10H], 0                      ; 2483 _ C7. 45, F0, 00000000
        jmp     ?_066                                   ; 248A _ EB, 70

?_061:  mov     eax, dword [ebp-0CH]                    ; 248C _ 8B. 45, F4
        shl     eax, 4                                  ; 248F _ C1. E0, 04
        mov     edx, eax                                ; 2492 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 2494 _ 8B. 45, F0
        add     eax, edx                                ; 2497 _ 01. D0
        add     eax, closebtn.1894                      ; 2499 _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 249E _ 0F B6. 00
        mov     byte [ebp-13H], al                      ; 24A1 _ 88. 45, ED
        cmp     byte [ebp-13H], 64                      ; 24A4 _ 80. 7D, ED, 40
        jnz     ?_062                                   ; 24A8 _ 75, 06
        mov     byte [ebp-13H], 0                       ; 24AA _ C6. 45, ED, 00
        jmp     ?_065                                   ; 24AE _ EB, 1C

?_062:  cmp     byte [ebp-13H], 36                      ; 24B0 _ 80. 7D, ED, 24
        jnz     ?_063                                   ; 24B4 _ 75, 06
        mov     byte [ebp-13H], 15                      ; 24B6 _ C6. 45, ED, 0F
        jmp     ?_065                                   ; 24BA _ EB, 10

?_063:  cmp     byte [ebp-13H], 81                      ; 24BC _ 80. 7D, ED, 51
        jnz     ?_064                                   ; 24C0 _ 75, 06
        mov     byte [ebp-13H], 8                       ; 24C2 _ C6. 45, ED, 08
        jmp     ?_065                                   ; 24C6 _ EB, 04

?_064:  mov     byte [ebp-13H], 7                       ; 24C8 _ C6. 45, ED, 07
?_065:  mov     eax, dword [ebp+0CH]                    ; 24CC _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 24CF _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 24D1 _ 8B. 45, F4
        lea     ecx, [eax+5H]                           ; 24D4 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 24D7 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 24DA _ 8B. 40, 04
        imul    ecx, eax                                ; 24DD _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 24E0 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 24E3 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 24E6 _ 8D. 58, EB
        mov     eax, dword [ebp-10H]                    ; 24E9 _ 8B. 45, F0
        add     eax, ebx                                ; 24EC _ 01. D8
        add     eax, ecx                                ; 24EE _ 01. C8
        add     edx, eax                                ; 24F0 _ 01. C2
        movzx   eax, byte [ebp-13H]                     ; 24F2 _ 0F B6. 45, ED
        mov     byte [edx], al                          ; 24F6 _ 88. 02
        add     dword [ebp-10H], 1                      ; 24F8 _ 83. 45, F0, 01
?_066:  cmp     dword [ebp-10H], 15                     ; 24FC _ 83. 7D, F0, 0F
        jle     ?_061                                   ; 2500 _ 7E, 8A
        add     dword [ebp-0CH], 1                      ; 2502 _ 83. 45, F4, 01
?_067:  cmp     dword [ebp-0CH], 13                     ; 2506 _ 83. 7D, F4, 0D
        jle     ?_060                                   ; 250A _ 0F 8E, FFFFFF73
        add     esp, 52                                 ; 2510 _ 83. C4, 34
        pop     ebx                                     ; 2513 _ 5B
        pop     ebp                                     ; 2514 _ 5D
        ret                                             ; 2515 _ C3
; make_window_title End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 2516 _ 55
        mov     ebp, esp                                ; 2517 _ 89. E5
        sub     esp, 24                                 ; 2519 _ 83. EC, 18
?_068:  mov     dword [esp], 100                        ; 251C _ C7. 04 24, 00000064
        call    io_in8                                  ; 2523 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 2528 _ 83. E0, 02
        test    eax, eax                                ; 252B _ 85. C0
        jnz     ?_069                                   ; 252D _ 75, 02
        jmp     ?_070                                   ; 252F _ EB, 02

?_069:  jmp     ?_068                                   ; 2531 _ EB, E9

?_070:  leave                                           ; 2533 _ C9
        ret                                             ; 2534 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 2535 _ 55
        mov     ebp, esp                                ; 2536 _ 89. E5
        sub     esp, 24                                 ; 2538 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 253B _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 2540 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 2548 _ C7. 04 24, 00000064
        call    io_out8                                 ; 254F _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 2554 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 2559 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 2561 _ C7. 04 24, 00000060
        call    io_out8                                 ; 2568 _ E8, FFFFFFFC(rel)
        leave                                           ; 256D _ C9
        ret                                             ; 256E _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 256F _ 55
        mov     ebp, esp                                ; 2570 _ 89. E5
        sub     esp, 24                                 ; 2572 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2575 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 257A _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 2582 _ C7. 04 24, 00000064
        call    io_out8                                 ; 2589 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 258E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 2593 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 259B _ C7. 04 24, 00000060
        call    io_out8                                 ; 25A2 _ E8, FFFFFFFC(rel)
        leave                                           ; 25A7 _ C9
        ret                                             ; 25A8 _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 25A9 _ 55
        mov     ebp, esp                                ; 25AA _ 89. E5
        sub     esp, 4                                  ; 25AC _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 25AF _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 25B2 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 25B5 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 25B8 _ 0F B6. 40, 03
        test    al, al                                  ; 25BC _ 84. C0
        jnz     ?_072                                   ; 25BE _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 25C0 _ 80. 7D, FC, FA
        jnz     ?_071                                   ; 25C4 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 25C6 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 25C9 _ C6. 40, 03, 01
?_071:  mov     eax, 0                                  ; 25CD _ B8, 00000000
        jmp     ?_079                                   ; 25D2 _ E9, 0000010F

?_072:  mov     eax, dword [ebp+8H]                     ; 25D7 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 25DA _ 0F B6. 40, 03
        cmp     al, 1                                   ; 25DE _ 3C, 01
        jnz     ?_074                                   ; 25E0 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 25E2 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 25E6 _ 25, 000000C8
        cmp     eax, 8                                  ; 25EB _ 83. F8, 08
        jnz     ?_073                                   ; 25EE _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 25F0 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 25F3 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 25F7 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 25F9 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 25FC _ C6. 40, 03, 02
?_073:  mov     eax, 0                                  ; 2600 _ B8, 00000000
        jmp     ?_079                                   ; 2605 _ E9, 000000DC

?_074:  mov     eax, dword [ebp+8H]                     ; 260A _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 260D _ 0F B6. 40, 03
        cmp     al, 2                                   ; 2611 _ 3C, 02
        jnz     ?_075                                   ; 2613 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 2615 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2618 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 261C _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 261F _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 2622 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 2626 _ B8, 00000000
        jmp     ?_079                                   ; 262B _ E9, 000000B6

?_075:  mov     eax, dword [ebp+8H]                     ; 2630 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2633 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 2637 _ 3C, 03
        jne     ?_078                                   ; 2639 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 263F _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2642 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 2646 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 2649 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 264C _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 2650 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2653 _ 0F B6. 00
        movzx   eax, al                                 ; 2656 _ 0F B6. C0
        and     eax, 07H                                ; 2659 _ 83. E0, 07
        mov     edx, eax                                ; 265C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 265E _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2661 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2664 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 2667 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 266B _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 266E _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2671 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2674 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 2677 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 267B _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 267E _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2681 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2684 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2687 _ 0F B6. 00
        movzx   eax, al                                 ; 268A _ 0F B6. C0
        and     eax, 10H                                ; 268D _ 83. E0, 10
        test    eax, eax                                ; 2690 _ 85. C0
        jz      ?_076                                   ; 2692 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2694 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2697 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 269A _ 0D, FFFFFF00
        mov     edx, eax                                ; 269F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 26A1 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 26A4 _ 89. 50, 04
?_076:  mov     eax, dword [ebp+8H]                     ; 26A7 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 26AA _ 0F B6. 00
        movzx   eax, al                                 ; 26AD _ 0F B6. C0
        and     eax, 20H                                ; 26B0 _ 83. E0, 20
        test    eax, eax                                ; 26B3 _ 85. C0
        jz      ?_077                                   ; 26B5 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 26B7 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 26BA _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 26BD _ 0D, FFFFFF00
        mov     edx, eax                                ; 26C2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 26C4 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 26C7 _ 89. 50, 08
?_077:  mov     eax, dword [ebp+8H]                     ; 26CA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 26CD _ 8B. 40, 08
        neg     eax                                     ; 26D0 _ F7. D8
        mov     edx, eax                                ; 26D2 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 26D4 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 26D7 _ 89. 50, 08
        mov     eax, 1                                  ; 26DA _ B8, 00000001
        jmp     ?_079                                   ; 26DF _ EB, 05

?_078:  mov     eax, 4294967295                         ; 26E1 _ B8, FFFFFFFF
?_079:  leave                                           ; 26E6 _ C9
        ret                                             ; 26E7 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 26E8 _ 55
        mov     ebp, esp                                ; 26E9 _ 89. E5
        sub     esp, 40                                 ; 26EB _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 26EE _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 26F6 _ C7. 04 24, 00000020
        call    io_out8                                 ; 26FD _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 2702 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 270A _ C7. 04 24, 000000A0
        call    io_out8                                 ; 2711 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 2716 _ C7. 04 24, 00000060
        call    io_in8                                  ; 271D _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 2722 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 2725 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 2729 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 272D _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 2734 _ E8, FFFFFFFC(rel)
        leave                                           ; 2739 _ C9
        ret                                             ; 273A _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 273B _ 55
        mov     ebp, esp                                ; 273C _ 89. E5
        sub     esp, 40                                 ; 273E _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 2741 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 2749 _ C7. 04 24, 00000020
        call    io_out8                                 ; 2750 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 2755 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 275D _ C7. 04 24, 000000A0
        call    io_out8                                 ; 2764 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 2769 _ C7. 04 24, 00000060
        call    io_in8                                  ; 2770 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 2775 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 2778 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 277C _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 2780 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 2787 _ E8, FFFFFFFC(rel)
        leave                                           ; 278C _ C9
        ret                                             ; 278D _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 278E _ 55
        mov     ebp, esp                                ; 278F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2791 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2794 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 2797 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2799 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 279C _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 27A3 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 27A6 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 27AD _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 27B0 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 27B3 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 27B6 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 27B9 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 27BC _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 27BF _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 27C2 _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 27C9 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 27CC _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 27CF _ 89. 50, 18
        pop     ebp                                     ; 27D2 _ 5D
        ret                                             ; 27D3 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 27D4 _ 55
        mov     ebp, esp                                ; 27D5 _ 89. E5
        sub     esp, 40                                 ; 27D7 _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 27DA _ 8B. 45, 0C
        mov     byte [ebp-1CH], al                      ; 27DD _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 27E0 _ 83. 7D, 08, 00
        jnz     ?_080                                   ; 27E4 _ 75, 0A
        mov     eax, 4294967295                         ; 27E6 _ B8, FFFFFFFF
        jmp     ?_084                                   ; 27EB _ E9, 000000B1

?_080:  mov     eax, dword [ebp+8H]                     ; 27F0 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 27F3 _ 8B. 40, 10
        test    eax, eax                                ; 27F6 _ 85. C0
        jnz     ?_081                                   ; 27F8 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 27FA _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 27FD _ 8B. 40, 14
        or      eax, 01H                                ; 2800 _ 83. C8, 01
        mov     edx, eax                                ; 2803 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2805 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 2808 _ 89. 50, 14
        mov     eax, 4294967295                         ; 280B _ B8, FFFFFFFF
        jmp     ?_084                                   ; 2810 _ E9, 0000008C

?_081:  mov     eax, dword [ebp+8H]                     ; 2815 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2818 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 281B _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 281E _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2821 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 2823 _ 8B. 45, F4
        add     edx, eax                                ; 2826 _ 01. C2
        movzx   eax, byte [ebp-1CH]                     ; 2828 _ 0F B6. 45, E4
        mov     byte [edx], al                          ; 282C _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 282E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2831 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 2834 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2837 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 283A _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 283D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2840 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2843 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2846 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2849 _ 39. C2
        jnz     ?_082                                   ; 284B _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 284D _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2850 _ C7. 40, 04, 00000000
?_082:  mov     eax, dword [ebp+8H]                     ; 2857 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 285A _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 285D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2860 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2863 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 2866 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2869 _ 8B. 40, 18
        test    eax, eax                                ; 286C _ 85. C0
        jz      ?_083                                   ; 286E _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 2870 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2873 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 2876 _ 8B. 40, 04
        cmp     eax, 2                                  ; 2879 _ 83. F8, 02
        jz      ?_083                                   ; 287C _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 287E _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 2881 _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 2884 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 288C _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 2894 _ 89. 04 24
        call    task_run                                ; 2897 _ E8, FFFFFFFC(rel)
?_083:  mov     eax, 0                                  ; 289C _ B8, 00000000
?_084:  leave                                           ; 28A1 _ C9
        ret                                             ; 28A2 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 28A3 _ 55
        mov     ebp, esp                                ; 28A4 _ 89. E5
        sub     esp, 16                                 ; 28A6 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 28A9 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 28AC _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 28AF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 28B2 _ 8B. 40, 0C
        cmp     edx, eax                                ; 28B5 _ 39. C2
        jnz     ?_085                                   ; 28B7 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 28B9 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 28BC _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 28C3 _ B8, FFFFFFFF
        jmp     ?_087                                   ; 28C8 _ EB, 57

?_085:  mov     eax, dword [ebp+8H]                     ; 28CA _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 28CD _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 28D0 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 28D3 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 28D6 _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 28D8 _ 8B. 45, F8
        add     eax, edx                                ; 28DB _ 01. D0
        movzx   eax, byte [eax]                         ; 28DD _ 0F B6. 00
        movzx   eax, al                                 ; 28E0 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 28E3 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 28E6 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 28E9 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 28EC _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 28EF _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 28F2 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 28F5 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 28F8 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 28FB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 28FE _ 8B. 40, 0C
        cmp     edx, eax                                ; 2901 _ 39. C2
        jnz     ?_086                                   ; 2903 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2905 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2908 _ C7. 40, 08, 00000000
?_086:  mov     eax, dword [ebp+8H]                     ; 290F _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2912 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2915 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2918 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 291B _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 291E _ 8B. 45, FC
?_087:  leave                                           ; 2921 _ C9
        ret                                             ; 2922 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 2923 _ 55
        mov     ebp, esp                                ; 2924 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2926 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 2929 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 292C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 292F _ 8B. 40, 10
        sub     edx, eax                                ; 2932 _ 29. C2
        mov     eax, edx                                ; 2934 _ 89. D0
        pop     ebp                                     ; 2936 _ 5D
        ret                                             ; 2937 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 2938 _ 55
        mov     ebp, esp                                ; 2939 _ 89. E5
        sub     esp, 4                                  ; 293B _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 293E _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 2941 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 2944 _ 80. 7D, FC, 09
        jle     ?_088                                   ; 2948 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 294A _ 0F B6. 45, FC
        add     eax, 55                                 ; 294E _ 83. C0, 37
        jmp     ?_089                                   ; 2951 _ EB, 07

?_088:  movzx   eax, byte [ebp-4H]                      ; 2953 _ 0F B6. 45, FC
        add     eax, 48                                 ; 2957 _ 83. C0, 30
?_089:  leave                                           ; 295A _ C9
        ret                                             ; 295B _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 295C _ 55
        mov     ebp, esp                                ; 295D _ 89. E5
        sub     esp, 24                                 ; 295F _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 2962 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 2965 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 2968 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 296F _ 0F B6. 45, EC
        and     eax, 0FH                                ; 2973 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 2976 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 2979 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 297D _ 89. 04 24
        call    charToHexVal                            ; 2980 _ E8, FFFFFFFC(rel)
        mov     byte [?_222], al                        ; 2985 _ A2, 000002A3(d)
        movzx   eax, byte [ebp-14H]                     ; 298A _ 0F B6. 45, EC
        shr     al, 4                                   ; 298E _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 2991 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 2994 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 2998 _ 0F BE. C0
        mov     dword [esp], eax                        ; 299B _ 89. 04 24
        call    charToHexVal                            ; 299E _ E8, FFFFFFFC(rel)
        mov     byte [?_221], al                        ; 29A3 _ A2, 000002A2(d)
        mov     eax, keyval                             ; 29A8 _ B8, 000002A0(d)
        leave                                           ; 29AD _ C9
        ret                                             ; 29AE _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 29AF _ 55
        mov     ebp, esp                                ; 29B0 _ 89. E5
        sub     esp, 16                                 ; 29B2 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 29B5 _ C6. 05, 000002A0(d), 30
        mov     byte [?_225], 88                        ; 29BC _ C6. 05, 000002A1(d), 58
        mov     byte [?_226], 0                         ; 29C3 _ C6. 05, 000002AA(d), 00
        mov     dword [ebp-0CH], 2                      ; 29CA _ C7. 45, F4, 00000002
        jmp     ?_091                                   ; 29D1 _ EB, 0F

?_090:  mov     eax, dword [ebp-0CH]                    ; 29D3 _ 8B. 45, F4
        add     eax, str.1386                           ; 29D6 _ 05, 000002A0(d)
        mov     byte [eax], 48                          ; 29DB _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 29DE _ 83. 45, F4, 01
?_091:  cmp     dword [ebp-0CH], 9                      ; 29E2 _ 83. 7D, F4, 09
        jle     ?_090                                   ; 29E6 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 29E8 _ C7. 45, F8, 00000009
        jmp     ?_095                                   ; 29EF _ EB, 40

?_092:  mov     eax, dword [ebp+8H]                     ; 29F1 _ 8B. 45, 08
        and     eax, 0FH                                ; 29F4 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 29F7 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 29FA _ 8B. 45, 08
        shr     eax, 4                                  ; 29FD _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 2A00 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 2A03 _ 83. 7D, FC, 09
        jle     ?_093                                   ; 2A07 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 2A09 _ 8B. 45, FC
        add     eax, 55                                 ; 2A0C _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 2A0F _ 8B. 55, F8
        add     edx, str.1386                           ; 2A12 _ 81. C2, 000002A0(d)
        mov     byte [edx], al                          ; 2A18 _ 88. 02
        jmp     ?_094                                   ; 2A1A _ EB, 11

?_093:  mov     eax, dword [ebp-4H]                     ; 2A1C _ 8B. 45, FC
        add     eax, 48                                 ; 2A1F _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 2A22 _ 8B. 55, F8
        add     edx, str.1386                           ; 2A25 _ 81. C2, 000002A0(d)
        mov     byte [edx], al                          ; 2A2B _ 88. 02
?_094:  sub     dword [ebp-8H], 1                       ; 2A2D _ 83. 6D, F8, 01
?_095:  cmp     dword [ebp-8H], 1                       ; 2A31 _ 83. 7D, F8, 01
        jle     ?_096                                   ; 2A35 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 2A37 _ 83. 7D, 08, 00
        jnz     ?_092                                   ; 2A3B _ 75, B4
?_096:  mov     eax, str.1386                           ; 2A3D _ B8, 000002A0(d)
        leave                                           ; 2A42 _ C9
        ret                                             ; 2A43 _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 2A44 _ 55
        mov     ebp, esp                                ; 2A45 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2A47 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 2A4A _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 2A50 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2A53 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2A5A _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2A5D _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2A64 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 2A67 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 2A6E _ 5D
        ret                                             ; 2A6F _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 2A70 _ 55
        mov     ebp, esp                                ; 2A71 _ 89. E5
        sub     esp, 16                                 ; 2A73 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2A76 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 2A7D _ C7. 45, F8, 00000000
        jmp     ?_098                                   ; 2A84 _ EB, 14

?_097:  mov     eax, dword [ebp+8H]                     ; 2A86 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2A89 _ 8B. 55, F8
        add     edx, 2                                  ; 2A8C _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2A8F _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 2A93 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 2A96 _ 83. 45, F8, 01
?_098:  mov     eax, dword [ebp+8H]                     ; 2A9A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2A9D _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 2A9F _ 3B. 45, F8
        ja      ?_097                                   ; 2AA2 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 2AA4 _ 8B. 45, FC
        leave                                           ; 2AA7 _ C9
        ret                                             ; 2AA8 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 2AA9 _ 55
        mov     ebp, esp                                ; 2AAA _ 89. E5
        sub     esp, 16                                 ; 2AAC _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2AAF _ C7. 45, F8, 00000000
        jmp     ?_102                                   ; 2AB6 _ E9, 00000085

?_099:  mov     eax, dword [ebp+8H]                     ; 2ABB _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2ABE _ 8B. 55, F8
        add     edx, 2                                  ; 2AC1 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2AC4 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 2AC8 _ 3B. 45, 0C
        jc      ?_101                                   ; 2ACB _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 2ACD _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2AD0 _ 8B. 55, F8
        add     edx, 2                                  ; 2AD3 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2AD6 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 2AD9 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2ADC _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2ADF _ 8B. 55, F8
        add     edx, 2                                  ; 2AE2 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2AE5 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 2AE8 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 2AEB _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2AEE _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2AF1 _ 8B. 55, F8
        add     edx, 2                                  ; 2AF4 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 2AF7 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 2AFA _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2AFD _ 8B. 55, F8
        add     edx, 2                                  ; 2B00 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2B03 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 2B07 _ 2B. 45, 0C
        mov     edx, eax                                ; 2B0A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2B0C _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 2B0F _ 8B. 4D, F8
        add     ecx, 2                                  ; 2B12 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 2B15 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 2B19 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2B1C _ 8B. 55, F8
        add     edx, 2                                  ; 2B1F _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2B22 _ 8B. 44 D0, 04
        test    eax, eax                                ; 2B26 _ 85. C0
        jnz     ?_100                                   ; 2B28 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 2B2A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2B2D _ 8B. 00
        lea     edx, [eax-1H]                           ; 2B2F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2B32 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2B35 _ 89. 10
?_100:  mov     eax, dword [ebp-4H]                     ; 2B37 _ 8B. 45, FC
        jmp     ?_103                                   ; 2B3A _ EB, 17

?_101:  add     dword [ebp-8H], 1                       ; 2B3C _ 83. 45, F8, 01
?_102:  mov     eax, dword [ebp+8H]                     ; 2B40 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2B43 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 2B45 _ 3B. 45, F8
        ja      ?_099                                   ; 2B48 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 2B4E _ B8, 00000000
?_103:  leave                                           ; 2B53 _ C9
        ret                                             ; 2B54 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 2B55 _ 55
        mov     ebp, esp                                ; 2B56 _ 89. E5
        push    ebx                                     ; 2B58 _ 53
        sub     esp, 16                                 ; 2B59 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 2B5C _ C7. 45, F4, 00000000
        jmp     ?_106                                   ; 2B63 _ EB, 17

?_104:  mov     eax, dword [ebp+8H]                     ; 2B65 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2B68 _ 8B. 55, F4
        add     edx, 2                                  ; 2B6B _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2B6E _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 2B71 _ 3B. 45, 0C
        jbe     ?_105                                   ; 2B74 _ 76, 02
        jmp     ?_107                                   ; 2B76 _ EB, 0E

?_105:  add     dword [ebp-0CH], 1                      ; 2B78 _ 83. 45, F4, 01
?_106:  mov     eax, dword [ebp+8H]                     ; 2B7C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2B7F _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2B81 _ 3B. 45, F4
        jg      ?_104                                   ; 2B84 _ 7F, DF
?_107:  cmp     dword [ebp-0CH], 0                      ; 2B86 _ 83. 7D, F4, 00
        jle     ?_109                                   ; 2B8A _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 2B90 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2B93 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2B96 _ 8B. 45, 08
        add     edx, 2                                  ; 2B99 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2B9C _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 2B9F _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 2BA2 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 2BA5 _ 8B. 45, 08
        add     ecx, 2                                  ; 2BA8 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 2BAB _ 8B. 44 C8, 04
        add     eax, edx                                ; 2BAF _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 2BB1 _ 3B. 45, 0C
        jne     ?_109                                   ; 2BB4 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 2BBA _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 2BBD _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2BC0 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2BC3 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2BC6 _ 8B. 45, 08
        add     edx, 2                                  ; 2BC9 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2BCC _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2BD0 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2BD3 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2BD6 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 2BD9 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2BDC _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2BE0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2BE3 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2BE5 _ 3B. 45, F4
        jle     ?_108                                   ; 2BE8 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 2BEA _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 2BED _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 2BF0 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2BF3 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2BF6 _ 8B. 55, F4
        add     edx, 2                                  ; 2BF9 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2BFC _ 8B. 04 D0
        cmp     ecx, eax                                ; 2BFF _ 39. C1
        jnz     ?_108                                   ; 2C01 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 2C03 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 2C06 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2C09 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2C0C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2C0F _ 8B. 45, 08
        add     edx, 2                                  ; 2C12 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2C15 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 2C19 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 2C1C _ 8B. 4D, F4
        add     ecx, 2                                  ; 2C1F _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 2C22 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 2C26 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2C29 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 2C2C _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2C2F _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2C33 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2C36 _ 8B. 00
        lea     edx, [eax-1H]                           ; 2C38 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2C3B _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2C3E _ 89. 10
?_108:  mov     eax, 0                                  ; 2C40 _ B8, 00000000
        jmp     ?_115                                   ; 2C45 _ E9, 0000011C

?_109:  mov     eax, dword [ebp+8H]                     ; 2C4A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2C4D _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2C4F _ 3B. 45, F4
        jle     ?_110                                   ; 2C52 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 2C54 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 2C57 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 2C5A _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2C5D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2C60 _ 8B. 55, F4
        add     edx, 2                                  ; 2C63 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2C66 _ 8B. 04 D0
        cmp     ecx, eax                                ; 2C69 _ 39. C1
        jnz     ?_110                                   ; 2C6B _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 2C6D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2C70 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2C73 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2C76 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2C79 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 2C7C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2C7F _ 8B. 55, F4
        add     edx, 2                                  ; 2C82 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2C85 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2C89 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2C8C _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2C8F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2C92 _ 8B. 55, F4
        add     edx, 2                                  ; 2C95 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2C98 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 2C9C _ B8, 00000000
        jmp     ?_115                                   ; 2CA1 _ E9, 000000C0

?_110:  mov     eax, dword [ebp+8H]                     ; 2CA6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2CA9 _ 8B. 00
        cmp     eax, 4095                               ; 2CAB _ 3D, 00000FFF
        jg      ?_114                                   ; 2CB0 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 2CB6 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2CB9 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 2CBB _ 89. 45, F8
        jmp     ?_112                                   ; 2CBE _ EB, 28

?_111:  mov     eax, dword [ebp-8H]                     ; 2CC0 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 2CC3 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 2CC6 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 2CC9 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 2CCC _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 2CCF _ 8B. 45, 08
        add     edx, 2                                  ; 2CD2 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 2CD5 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 2CD8 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 2CDA _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 2CDD _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 2CE0 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 2CE4 _ 83. 6D, F8, 01
?_112:  mov     eax, dword [ebp-8H]                     ; 2CE8 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 2CEB _ 3B. 45, F4
        jg      ?_111                                   ; 2CEE _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 2CF0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2CF3 _ 8B. 00
        lea     edx, [eax+1H]                           ; 2CF5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2CF8 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2CFB _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2CFD _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2D00 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2D03 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2D06 _ 8B. 00
        cmp     edx, eax                                ; 2D08 _ 39. C2
        jge     ?_113                                   ; 2D0A _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 2D0C _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2D0F _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2D11 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2D14 _ 89. 50, 04
?_113:  mov     eax, dword [ebp+8H]                     ; 2D17 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2D1A _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2D1D _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2D20 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2D23 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 2D26 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2D29 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2D2C _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 2D2F _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 2D32 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 2D36 _ B8, 00000000
        jmp     ?_115                                   ; 2D3B _ EB, 29

?_114:  mov     eax, dword [ebp+8H]                     ; 2D3D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2D40 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 2D43 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2D46 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2D49 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2D4C _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2D4F _ 8B. 40, 08
        mov     edx, eax                                ; 2D52 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2D54 _ 8B. 45, 10
        add     eax, edx                                ; 2D57 _ 01. D0
        mov     edx, eax                                ; 2D59 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2D5B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2D5E _ 89. 50, 08
        mov     eax, 4294967295                         ; 2D61 _ B8, FFFFFFFF
?_115:  add     esp, 16                                 ; 2D66 _ 83. C4, 10
        pop     ebx                                     ; 2D69 _ 5B
        pop     ebp                                     ; 2D6A _ 5D
        ret                                             ; 2D6B _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 2D6C _ 55
        mov     ebp, esp                                ; 2D6D _ 89. E5
        sub     esp, 24                                 ; 2D6F _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 2D72 _ 8B. 45, 0C
        add     eax, 4095                               ; 2D75 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2D7A _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 2D7F _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 2D82 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2D85 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2D89 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2D8C _ 89. 04 24
        call    memman_alloc                            ; 2D8F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 2D94 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2D97 _ 8B. 45, FC
        leave                                           ; 2D9A _ C9
        ret                                             ; 2D9B _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 2D9C _ 55
        mov     ebp, esp                                ; 2D9D _ 89. E5
        sub     esp, 28                                 ; 2D9F _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 2DA2 _ 8B. 45, 10
        add     eax, 4095                               ; 2DA5 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2DAA _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 2DAF _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 2DB2 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 2DB5 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2DB9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2DBC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2DC0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2DC3 _ 89. 04 24
        call    memman_free                             ; 2DC6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 2DCB _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2DCE _ 8B. 45, FC
        leave                                           ; 2DD1 _ C9
        ret                                             ; 2DD2 _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 2DD3 _ 55
        mov     ebp, esp                                ; 2DD4 _ 89. E5
        sub     esp, 40                                 ; 2DD6 _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 2DD9 _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 2DE1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2DE4 _ 89. 04 24
        call    memman_alloc_4k                         ; 2DE7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2DEC _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 2DEF _ 83. 7D, F4, 00
        jnz     ?_116                                   ; 2DF3 _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 2DF5 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 2DF8 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 2E00 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E04 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E07 _ 89. 04 24
        call    memman_free_4k                          ; 2E0A _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 2E0F _ B8, 00000000
        jmp     ?_120                                   ; 2E14 _ E9, 0000009D

?_116:  mov     eax, dword [ebp-0CH]                    ; 2E19 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 2E1C _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2E1F _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 2E21 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 2E24 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 2E27 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 2E2A _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 2E2D _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 2E30 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2E33 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 2E36 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 2E3D _ C7. 45, F0, 00000000
        jmp     ?_118                                   ; 2E44 _ EB, 1B

?_117:  mov     eax, dword [ebp-0CH]                    ; 2E46 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 2E49 _ 8B. 55, F0
        add     edx, 33                                 ; 2E4C _ 83. C2, 21
        shl     edx, 5                                  ; 2E4F _ C1. E2, 05
        add     eax, edx                                ; 2E52 _ 01. D0
        add     eax, 16                                 ; 2E54 _ 83. C0, 10
        mov     dword [eax], 0                          ; 2E57 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 2E5D _ 83. 45, F0, 01
?_118:  cmp     dword [ebp-10H], 255                    ; 2E61 _ 81. 7D, F0, 000000FF
        jle     ?_117                                   ; 2E68 _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 2E6A _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 2E6D _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 2E71 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2E75 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2E78 _ 89. 04 24
        call    memman_alloc_4k                         ; 2E7B _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 2E80 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2E82 _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 2E85 _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 2E88 _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 2E8B _ 8B. 40, 10
        test    eax, eax                                ; 2E8E _ 85. C0
        jnz     ?_119                                   ; 2E90 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 2E92 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 2E95 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 2E9D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2EA1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2EA4 _ 89. 04 24
        call    memman_free_4k                          ; 2EA7 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 2EAC _ B8, 00000000
        jmp     ?_120                                   ; 2EB1 _ EB, 03

?_119:  mov     eax, dword [ebp-0CH]                    ; 2EB3 _ 8B. 45, F4
?_120:  leave                                           ; 2EB6 _ C9
        ret                                             ; 2EB7 _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 2EB8 _ 55
        mov     ebp, esp                                ; 2EB9 _ 89. E5
        sub     esp, 16                                 ; 2EBB _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2EBE _ C7. 45, F8, 00000000
        jmp     ?_123                                   ; 2EC5 _ EB, 5B

?_121:  mov     eax, dword [ebp+8H]                     ; 2EC7 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2ECA _ 8B. 55, F8
        add     edx, 33                                 ; 2ECD _ 83. C2, 21
        shl     edx, 5                                  ; 2ED0 _ C1. E2, 05
        add     eax, edx                                ; 2ED3 _ 01. D0
        add     eax, 16                                 ; 2ED5 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 2ED8 _ 8B. 00
        test    eax, eax                                ; 2EDA _ 85. C0
        jnz     ?_122                                   ; 2EDC _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 2EDE _ 8B. 45, F8
        shl     eax, 5                                  ; 2EE1 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 2EE4 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 2EEA _ 8B. 45, 08
        add     eax, edx                                ; 2EED _ 01. D0
        add     eax, 4                                  ; 2EEF _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 2EF2 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2EF5 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2EF8 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 2EFB _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 2EFE _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 2F01 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 2F05 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 2F08 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 2F0F _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 2F12 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 2F19 _ 8B. 45, FC
        jmp     ?_124                                   ; 2F1C _ EB, 12

?_122:  add     dword [ebp-8H], 1                       ; 2F1E _ 83. 45, F8, 01
?_123:  cmp     dword [ebp-8H], 255                     ; 2F22 _ 81. 7D, F8, 000000FF
        jle     ?_121                                   ; 2F29 _ 7E, 9C
        mov     eax, 0                                  ; 2F2B _ B8, 00000000
?_124:  leave                                           ; 2F30 _ C9
        ret                                             ; 2F31 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 2F32 _ 55
        mov     ebp, esp                                ; 2F33 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2F35 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2F38 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2F3B _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2F3D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2F40 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 2F43 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2F46 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2F49 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 2F4C _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2F4F _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 2F52 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 2F55 _ 89. 50, 14
        pop     ebp                                     ; 2F58 _ 5D
        ret                                             ; 2F59 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 2F5A _ 55
        mov     ebp, esp                                ; 2F5B _ 89. E5
        push    esi                                     ; 2F5D _ 56
        push    ebx                                     ; 2F5E _ 53
        sub     esp, 48                                 ; 2F5F _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 2F62 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2F65 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 2F68 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 2F6B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2F6E _ 8B. 40, 0C
        add     eax, 1                                  ; 2F71 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 2F74 _ 3B. 45, 10
        jge     ?_125                                   ; 2F77 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 2F79 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2F7C _ 8B. 40, 0C
        add     eax, 1                                  ; 2F7F _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 2F82 _ 89. 45, 10
?_125:  cmp     dword [ebp+10H], -1                     ; 2F85 _ 83. 7D, 10, FF
        jge     ?_126                                   ; 2F89 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 2F8B _ C7. 45, 10, FFFFFFFF
?_126:  mov     eax, dword [ebp+0CH]                    ; 2F92 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2F95 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 2F98 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 2F9B _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2F9E _ 3B. 45, 10
        jle     ?_133                                   ; 2FA1 _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 2FA7 _ 83. 7D, 10, 00
        js      ?_129                                   ; 2FAB _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 2FB1 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2FB4 _ 89. 45, F0
        jmp     ?_128                                   ; 2FB7 _ EB, 34

?_127:  mov     eax, dword [ebp-10H]                    ; 2FB9 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 2FBC _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2FBF _ 8B. 45, 08
        add     edx, 4                                  ; 2FC2 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2FC5 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2FC9 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2FCC _ 8B. 4D, F0
        add     ecx, 4                                  ; 2FCF _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2FD2 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2FD6 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2FD9 _ 8B. 55, F0
        add     edx, 4                                  ; 2FDC _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2FDF _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2FE3 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2FE6 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2FE9 _ 83. 6D, F0, 01
?_128:  mov     eax, dword [ebp-10H]                    ; 2FED _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2FF0 _ 3B. 45, 10
        jg      ?_127                                   ; 2FF3 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 2FF5 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2FF8 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2FFB _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2FFE _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3001 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 3005 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3008 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 300B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 300E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3011 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3014 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3017 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 301A _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 301D _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3020 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3023 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3026 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3029 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 302C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 302F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3032 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 3035 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3039 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 303D _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3041 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3045 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3049 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 304C _ 89. 04 24
        call    sheet_refresh_map                       ; 304F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 3054 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 3057 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 305A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 305D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3060 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3063 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3066 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3069 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 306C _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 306F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3072 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3075 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3078 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 307B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 307E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3081 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 3084 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 3088 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 308C _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3090 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3094 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3098 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 309B _ 89. 04 24
        call    sheet_refresh_local                     ; 309E _ E8, FFFFFFFC(rel)
        jmp     ?_140                                   ; 30A3 _ E9, 0000026C

?_129:  mov     eax, dword [ebp+8H]                     ; 30A8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 30AB _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 30AE _ 3B. 45, F4
        jle     ?_132                                   ; 30B1 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 30B3 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 30B6 _ 89. 45, F0
        jmp     ?_131                                   ; 30B9 _ EB, 34

?_130:  mov     eax, dword [ebp-10H]                    ; 30BB _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 30BE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 30C1 _ 8B. 45, 08
        add     edx, 4                                  ; 30C4 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 30C7 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 30CB _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 30CE _ 8B. 4D, F0
        add     ecx, 4                                  ; 30D1 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 30D4 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 30D8 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 30DB _ 8B. 55, F0
        add     edx, 4                                  ; 30DE _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 30E1 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 30E5 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 30E8 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 30EB _ 83. 45, F0, 01
?_131:  mov     eax, dword [ebp+8H]                     ; 30EF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 30F2 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 30F5 _ 3B. 45, F0
        jg      ?_130                                   ; 30F8 _ 7F, C1
?_132:  mov     eax, dword [ebp+8H]                     ; 30FA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 30FD _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 3100 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 3103 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3106 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3109 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 310C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 310F _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3112 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3115 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3118 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 311B _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 311E _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3121 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3124 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3127 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 312A _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 312D _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3130 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 3133 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 313B _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 313F _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3143 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3147 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 314B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 314E _ 89. 04 24
        call    sheet_refresh_map                       ; 3151 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3156 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3159 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 315C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 315F _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 3162 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3165 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3168 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 316B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 316E _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 3171 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 3174 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3177 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 317A _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 317D _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 3180 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 3188 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 318C _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 3190 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3194 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3198 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 319B _ 89. 04 24
        call    sheet_refresh_local                     ; 319E _ E8, FFFFFFFC(rel)
        jmp     ?_140                                   ; 31A3 _ E9, 0000016C

?_133:  mov     eax, dword [ebp-0CH]                    ; 31A8 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 31AB _ 3B. 45, 10
        jge     ?_140                                   ; 31AE _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 31B4 _ 83. 7D, F4, 00
        js      ?_136                                   ; 31B8 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 31BA _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 31BD _ 89. 45, F0
        jmp     ?_135                                   ; 31C0 _ EB, 34

?_134:  mov     eax, dword [ebp-10H]                    ; 31C2 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 31C5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 31C8 _ 8B. 45, 08
        add     edx, 4                                  ; 31CB _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 31CE _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 31D2 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 31D5 _ 8B. 4D, F0
        add     ecx, 4                                  ; 31D8 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 31DB _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 31DF _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 31E2 _ 8B. 55, F0
        add     edx, 4                                  ; 31E5 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 31E8 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 31EC _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 31EF _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 31F2 _ 83. 45, F0, 01
?_135:  mov     eax, dword [ebp-10H]                    ; 31F6 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 31F9 _ 3B. 45, 10
        jl      ?_134                                   ; 31FC _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 31FE _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3201 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3204 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3207 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 320A _ 89. 54 88, 04
        jmp     ?_139                                   ; 320E _ EB, 6C

?_136:  mov     eax, dword [ebp+8H]                     ; 3210 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3213 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 3216 _ 89. 45, F0
        jmp     ?_138                                   ; 3219 _ EB, 3A

?_137:  mov     eax, dword [ebp-10H]                    ; 321B _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 321E _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 3221 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 3224 _ 8B. 55, F0
        add     edx, 4                                  ; 3227 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 322A _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 322E _ 8B. 45, 08
        add     ecx, 4                                  ; 3231 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 3234 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 3238 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 323B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 323E _ 8B. 45, 08
        add     edx, 4                                  ; 3241 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3244 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 3248 _ 8B. 55, F0
        add     edx, 1                                  ; 324B _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 324E _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 3251 _ 83. 6D, F0, 01
?_138:  mov     eax, dword [ebp-10H]                    ; 3255 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 3258 _ 3B. 45, 10
        jge     ?_137                                   ; 325B _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 325D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3260 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 3263 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 3266 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 3269 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 326D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3270 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 3273 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 3276 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 3279 _ 89. 50, 0C
?_139:  mov     eax, dword [ebp+0CH]                    ; 327C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 327F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3282 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 3285 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3288 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 328B _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 328E _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 3291 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 3294 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3297 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 329A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 329D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 32A0 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 32A3 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 32A6 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 32A9 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 32AD _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 32B1 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 32B5 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 32B9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 32BD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 32C0 _ 89. 04 24
        call    sheet_refresh_map                       ; 32C3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 32C8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 32CB _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 32CE _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 32D1 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 32D4 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 32D7 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 32DA _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 32DD _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 32E0 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 32E3 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 32E6 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 32E9 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 32EC _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 32EF _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 32F2 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 32F5 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 32F9 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 32FD _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3301 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3305 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3309 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 330C _ 89. 04 24
        call    sheet_refresh_local                     ; 330F _ E8, FFFFFFFC(rel)
?_140:  add     esp, 48                                 ; 3314 _ 83. C4, 30
        pop     ebx                                     ; 3317 _ 5B
        pop     esi                                     ; 3318 _ 5E
        pop     ebp                                     ; 3319 _ 5D
        ret                                             ; 331A _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 331B _ 55
        mov     ebp, esp                                ; 331C _ 89. E5
        push    edi                                     ; 331E _ 57
        push    esi                                     ; 331F _ 56
        push    ebx                                     ; 3320 _ 53
        sub     esp, 44                                 ; 3321 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 3324 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3327 _ 8B. 40, 18
        test    eax, eax                                ; 332A _ 85. C0
        js      ?_141                                   ; 332C _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 332E _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3331 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 3334 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 3337 _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 333A _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 333D _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 3340 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 3343 _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 3346 _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 3349 _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 334C _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 334F _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 3352 _ 8B. 55, 14
        add     ecx, edx                                ; 3355 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 3357 _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 335A _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 335D _ 8B. 55, 10
        add     edx, edi                                ; 3360 _ 01. FA
        mov     dword [esp+14H], eax                    ; 3362 _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 3366 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 336A _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 336E _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 3372 _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 3376 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3379 _ 89. 04 24
        call    sheet_refresh_local                     ; 337C _ E8, FFFFFFFC(rel)
?_141:  mov     eax, 0                                  ; 3381 _ B8, 00000000
        add     esp, 44                                 ; 3386 _ 83. C4, 2C
        pop     ebx                                     ; 3389 _ 5B
        pop     esi                                     ; 338A _ 5E
        pop     edi                                     ; 338B _ 5F
        pop     ebp                                     ; 338C _ 5D
        ret                                             ; 338D _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 338E _ 55
        mov     ebp, esp                                ; 338F _ 89. E5
        push    ebx                                     ; 3391 _ 53
        sub     esp, 52                                 ; 3392 _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 3395 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3398 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 339B _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 339E _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 33A1 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 33A4 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 33A7 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 33AA _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 33AD _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 33B0 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 33B3 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 33B6 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 33B9 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 33BC _ 8B. 40, 18
        test    eax, eax                                ; 33BF _ 85. C0
        js      ?_142                                   ; 33C1 _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 33C7 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 33CA _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 33CD _ 8B. 45, F4
        add     edx, eax                                ; 33D0 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 33D2 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 33D5 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 33D8 _ 8B. 45, F0
        add     eax, ecx                                ; 33DB _ 01. C8
        mov     dword [esp+14H], 0                      ; 33DD _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 33E5 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 33E9 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 33ED _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 33F0 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 33F4 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 33F7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 33FB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 33FE _ 89. 04 24
        call    sheet_refresh_map                       ; 3401 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3406 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3409 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 340C _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 340F _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 3412 _ 8B. 55, 14
        add     ecx, edx                                ; 3415 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 3417 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 341A _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 341D _ 8B. 55, 10
        add     edx, ebx                                ; 3420 _ 01. DA
        mov     dword [esp+14H], eax                    ; 3422 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 3426 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 342A _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 342E _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 3431 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 3435 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 3438 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 343C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 343F _ 89. 04 24
        call    sheet_refresh_map                       ; 3442 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3447 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 344A _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 344D _ 8B. 45, F4
        add     edx, eax                                ; 3450 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 3452 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 3455 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 3458 _ 8B. 45, F0
        add     eax, ecx                                ; 345B _ 01. C8
        mov     dword [esp+14H], 0                      ; 345D _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 3465 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 3469 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 346D _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 3470 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 3474 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 3477 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 347B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 347E _ 89. 04 24
        call    sheet_refresh_local                     ; 3481 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3486 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3489 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 348C _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 348F _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 3492 _ 8B. 55, 14
        add     ecx, edx                                ; 3495 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 3497 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 349A _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 349D _ 8B. 55, 10
        add     edx, ebx                                ; 34A0 _ 01. DA
        mov     dword [esp+14H], eax                    ; 34A2 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 34A6 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 34AA _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 34AE _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 34B1 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 34B5 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 34B8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 34BC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 34BF _ 89. 04 24
        call    sheet_refresh_local                     ; 34C2 _ E8, FFFFFFFC(rel)
?_142:  add     esp, 52                                 ; 34C7 _ 83. C4, 34
        pop     ebx                                     ; 34CA _ 5B
        pop     ebp                                     ; 34CB _ 5D
        ret                                             ; 34CC _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 34CD _ 55
        mov     ebp, esp                                ; 34CE _ 89. E5
        sub     esp, 48                                 ; 34D0 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 34D3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 34D6 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 34D8 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 34DB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 34DE _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 34E1 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 34E4 _ 83. 7D, 0C, 00
        jns     ?_143                                   ; 34E8 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 34EA _ C7. 45, 0C, 00000000
?_143:  cmp     dword [ebp+10H], 0                      ; 34F1 _ 83. 7D, 10, 00
        jns     ?_144                                   ; 34F5 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 34F7 _ C7. 45, 10, 00000000
?_144:  mov     eax, dword [ebp+8H]                     ; 34FE _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3501 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 3504 _ 3B. 45, 14
        jge     ?_145                                   ; 3507 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3509 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 350C _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 350F _ 89. 45, 14
?_145:  mov     eax, dword [ebp+8H]                     ; 3512 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3515 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 3518 _ 3B. 45, 18
        jge     ?_146                                   ; 351B _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 351D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3520 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 3523 _ 89. 45, 18
?_146:  mov     eax, dword [ebp+1CH]                    ; 3526 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 3529 _ 89. 45, DC
        jmp     ?_153                                   ; 352C _ E9, 00000119

?_147:  mov     eax, dword [ebp+8H]                     ; 3531 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 3534 _ 8B. 55, DC
        add     edx, 4                                  ; 3537 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 353A _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 353E _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 3541 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 3544 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 3546 _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 3549 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 354C _ 8B. 45, 08
        add     eax, 1044                               ; 354F _ 05, 00000414
        sub     edx, eax                                ; 3554 _ 29. C2
        mov     eax, edx                                ; 3556 _ 89. D0
        sar     eax, 5                                  ; 3558 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 355B _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 355E _ C7. 45, E4, 00000000
        jmp     ?_152                                   ; 3565 _ E9, 000000CD

?_148:  mov     eax, dword [ebp-10H]                    ; 356A _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 356D _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 3570 _ 8B. 45, E4
        add     eax, edx                                ; 3573 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 3575 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 3578 _ C7. 45, E0, 00000000
        jmp     ?_151                                   ; 357F _ E9, 000000A0

?_149:  mov     eax, dword [ebp-10H]                    ; 3584 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 3587 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 358A _ 8B. 45, E0
        add     eax, edx                                ; 358D _ 01. D0
        mov     dword [ebp-4H], eax                     ; 358F _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 3592 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 3595 _ 3B. 45, FC
        jg      ?_150                                   ; 3598 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 359E _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 35A1 _ 3B. 45, 14
        jge     ?_150                                   ; 35A4 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 35A6 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 35A9 _ 3B. 45, F8
        jg      ?_150                                   ; 35AC _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 35AE _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 35B1 _ 3B. 45, 18
        jge     ?_150                                   ; 35B4 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 35B6 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 35B9 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 35BC _ 0F AF. 45, E4
        mov     edx, eax                                ; 35C0 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 35C2 _ 8B. 45, E0
        add     eax, edx                                ; 35C5 _ 01. D0
        mov     edx, eax                                ; 35C7 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 35C9 _ 8B. 45, F4
        add     eax, edx                                ; 35CC _ 01. D0
        movzx   eax, byte [eax]                         ; 35CE _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 35D1 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 35D4 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 35D8 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 35DB _ 8B. 40, 14
        cmp     edx, eax                                ; 35DE _ 39. C2
        jz      ?_150                                   ; 35E0 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 35E2 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 35E5 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 35E8 _ 0F AF. 45, F8
        mov     edx, eax                                ; 35EC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 35EE _ 8B. 45, FC
        add     eax, edx                                ; 35F1 _ 01. D0
        mov     edx, eax                                ; 35F3 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 35F5 _ 8B. 45, EC
        add     eax, edx                                ; 35F8 _ 01. D0
        movzx   eax, byte [eax]                         ; 35FA _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 35FD _ 3A. 45, DA
        jnz     ?_150                                   ; 3600 _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 3602 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3605 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 3608 _ 0F AF. 45, F8
        mov     edx, eax                                ; 360C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 360E _ 8B. 45, FC
        add     eax, edx                                ; 3611 _ 01. D0
        mov     edx, eax                                ; 3613 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 3615 _ 8B. 45, E8
        add     edx, eax                                ; 3618 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 361A _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 361E _ 88. 02
?_150:  add     dword [ebp-20H], 1                      ; 3620 _ 83. 45, E0, 01
?_151:  mov     eax, dword [ebp-10H]                    ; 3624 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3627 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 362A _ 3B. 45, E0
        jg      ?_149                                   ; 362D _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 3633 _ 83. 45, E4, 01
?_152:  mov     eax, dword [ebp-10H]                    ; 3637 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 363A _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 363D _ 3B. 45, E4
        jg      ?_148                                   ; 3640 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 3646 _ 83. 45, DC, 01
?_153:  mov     eax, dword [ebp+8H]                     ; 364A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 364D _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 3650 _ 3B. 45, DC
        jge     ?_147                                   ; 3653 _ 0F 8D, FFFFFED8
        leave                                           ; 3659 _ C9
        ret                                             ; 365A _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 365B _ 55
        mov     ebp, esp                                ; 365C _ 89. E5
        sub     esp, 64                                 ; 365E _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 3661 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3664 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 3666 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 3669 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 366C _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 366F _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 3672 _ 83. 7D, 0C, 00
        jns     ?_154                                   ; 3676 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 3678 _ C7. 45, 0C, 00000000
?_154:  cmp     dword [ebp+10H], 0                      ; 367F _ 83. 7D, 10, 00
        jns     ?_155                                   ; 3683 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 3685 _ C7. 45, 10, 00000000
?_155:  mov     eax, dword [ebp+8H]                     ; 368C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 368F _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 3692 _ 3B. 45, 14
        jge     ?_156                                   ; 3695 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3697 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 369A _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 369D _ 89. 45, 14
?_156:  mov     eax, dword [ebp+8H]                     ; 36A0 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 36A3 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 36A6 _ 3B. 45, 18
        jge     ?_157                                   ; 36A9 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 36AB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 36AE _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 36B1 _ 89. 45, 18
?_157:  mov     eax, dword [ebp+1CH]                    ; 36B4 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 36B7 _ 89. 45, CC
        jmp     ?_168                                   ; 36BA _ E9, 00000141

?_158:  mov     eax, dword [ebp+8H]                     ; 36BF _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 36C2 _ 8B. 55, CC
        add     edx, 4                                  ; 36C5 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 36C8 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 36CC _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 36CF _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 36D2 _ 8B. 45, 08
        add     eax, 1044                               ; 36D5 _ 05, 00000414
        sub     edx, eax                                ; 36DA _ 29. C2
        mov     eax, edx                                ; 36DC _ 89. D0
        sar     eax, 5                                  ; 36DE _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 36E1 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 36E4 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 36E7 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 36E9 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 36EC _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 36EF _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 36F2 _ 8B. 55, 0C
        sub     edx, eax                                ; 36F5 _ 29. C2
        mov     eax, edx                                ; 36F7 _ 89. D0
        mov     dword [ebp-30H], eax                    ; 36F9 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 36FC _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 36FF _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 3702 _ 8B. 55, 10
        sub     edx, eax                                ; 3705 _ 29. C2
        mov     eax, edx                                ; 3707 _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 3709 _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 370C _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 370F _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 3712 _ 8B. 55, 14
        sub     edx, eax                                ; 3715 _ 29. C2
        mov     eax, edx                                ; 3717 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 3719 _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 371C _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 371F _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 3722 _ 8B. 55, 18
        sub     edx, eax                                ; 3725 _ 29. C2
        mov     eax, edx                                ; 3727 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 3729 _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 372C _ 83. 7D, D0, 00
        jns     ?_159                                   ; 3730 _ 79, 07
        mov     dword [ebp-30H], 0                      ; 3732 _ C7. 45, D0, 00000000
?_159:  cmp     dword [ebp-2CH], 0                      ; 3739 _ 83. 7D, D4, 00
        jns     ?_160                                   ; 373D _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 373F _ C7. 45, D4, 00000000
?_160:  mov     eax, dword [ebp-10H]                    ; 3746 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3749 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 374C _ 3B. 45, D8
        jge     ?_161                                   ; 374F _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 3751 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3754 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 3757 _ 89. 45, D8
?_161:  mov     eax, dword [ebp-10H]                    ; 375A _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 375D _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 3760 _ 3B. 45, DC
        jge     ?_162                                   ; 3763 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 3765 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 3768 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 376B _ 89. 45, DC
?_162:  mov     eax, dword [ebp-2CH]                    ; 376E _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 3771 _ 89. 45, E4
        jmp     ?_167                                   ; 3774 _ EB, 7A

?_163:  mov     eax, dword [ebp-10H]                    ; 3776 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 3779 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 377C _ 8B. 45, E4
        add     eax, edx                                ; 377F _ 01. D0
        mov     dword [ebp-8H], eax                     ; 3781 _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 3784 _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 3787 _ 89. 45, E0
        jmp     ?_166                                   ; 378A _ EB, 58

?_164:  mov     eax, dword [ebp-10H]                    ; 378C _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 378F _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 3792 _ 8B. 45, E0
        add     eax, edx                                ; 3795 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 3797 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 379A _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 379D _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 37A0 _ 0F AF. 45, E4
        mov     edx, eax                                ; 37A4 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 37A6 _ 8B. 45, E0
        add     eax, edx                                ; 37A9 _ 01. D0
        mov     edx, eax                                ; 37AB _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 37AD _ 8B. 45, F4
        add     eax, edx                                ; 37B0 _ 01. D0
        movzx   eax, byte [eax]                         ; 37B2 _ 0F B6. 00
        movzx   edx, al                                 ; 37B5 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 37B8 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 37BB _ 8B. 40, 14
        cmp     edx, eax                                ; 37BE _ 39. C2
        jz      ?_165                                   ; 37C0 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 37C2 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 37C5 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 37C8 _ 0F AF. 45, F8
        mov     edx, eax                                ; 37CC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 37CE _ 8B. 45, FC
        add     eax, edx                                ; 37D1 _ 01. D0
        mov     edx, eax                                ; 37D3 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 37D5 _ 8B. 45, EC
        add     edx, eax                                ; 37D8 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 37DA _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 37DE _ 88. 02
?_165:  add     dword [ebp-20H], 1                      ; 37E0 _ 83. 45, E0, 01
?_166:  mov     eax, dword [ebp-20H]                    ; 37E4 _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 37E7 _ 3B. 45, D8
        jl      ?_164                                   ; 37EA _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 37EC _ 83. 45, E4, 01
?_167:  mov     eax, dword [ebp-1CH]                    ; 37F0 _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 37F3 _ 3B. 45, DC
        jl      ?_163                                   ; 37F6 _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 37FC _ 83. 45, CC, 01
?_168:  mov     eax, dword [ebp+8H]                     ; 3800 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3803 _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 3806 _ 3B. 45, CC
        jge     ?_158                                   ; 3809 _ 0F 8D, FFFFFEB0
        leave                                           ; 380F _ C9
        ret                                             ; 3810 _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 3811 _ 55
        mov     ebp, esp                                ; 3812 _ 89. E5
        sub     esp, 40                                 ; 3814 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 3817 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 381F _ C7. 04 24, 00000043
        call    io_out8                                 ; 3826 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 382B _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 3833 _ C7. 04 24, 00000040
        call    io_out8                                 ; 383A _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 383F _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 3847 _ C7. 04 24, 00000040
        call    io_out8                                 ; 384E _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 3853 _ C7. 05, 000002C0(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 385D _ C7. 45, F4, 00000000
        jmp     ?_170                                   ; 3864 _ EB, 28

?_169:  mov     eax, dword [ebp-0CH]                    ; 3866 _ 8B. 45, F4
        shl     eax, 4                                  ; 3869 _ C1. E0, 04
        add     eax, timer_control                      ; 386C _ 05, 000002C0(d)
        mov     dword [eax+8H], 0                       ; 3871 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 3878 _ 8B. 45, F4
        shl     eax, 4                                  ; 387B _ C1. E0, 04
        add     eax, timer_control                      ; 387E _ 05, 000002C0(d)
        mov     dword [eax+0CH], 0                      ; 3883 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 388A _ 83. 45, F4, 01
?_170:  cmp     dword [ebp-0CH], 499                    ; 388E _ 81. 7D, F4, 000001F3
        jle     ?_169                                   ; 3895 _ 7E, CF
        leave                                           ; 3897 _ C9
        ret                                             ; 3898 _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 3899 _ 55
        mov     ebp, esp                                ; 389A _ 89. E5
        mov     eax, timer_control                      ; 389C _ B8, 000002C0(d)
        pop     ebp                                     ; 38A1 _ 5D
        ret                                             ; 38A2 _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 38A3 _ 55
        mov     ebp, esp                                ; 38A4 _ 89. E5
        sub     esp, 16                                 ; 38A6 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 38A9 _ C7. 45, FC, 00000000
        jmp     ?_173                                   ; 38B0 _ EB, 26

?_171:  mov     eax, dword [ebp-4H]                     ; 38B2 _ 8B. 45, FC
        shl     eax, 4                                  ; 38B5 _ C1. E0, 04
        add     eax, timer_control                      ; 38B8 _ 05, 000002C0(d)
        mov     eax, dword [eax+8H]                     ; 38BD _ 8B. 40, 08
        test    eax, eax                                ; 38C0 _ 85. C0
        jnz     ?_172                                   ; 38C2 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 38C4 _ 8B. 45, FC
        shl     eax, 4                                  ; 38C7 _ C1. E0, 04
        add     eax, timer_control                      ; 38CA _ 05, 000002C0(d)
        add     eax, 4                                  ; 38CF _ 83. C0, 04
        jmp     ?_174                                   ; 38D2 _ EB, 0D

?_172:  add     dword [ebp-4H], 1                       ; 38D4 _ 83. 45, FC, 01
?_173:  cmp     dword [ebp-4H], 499                     ; 38D8 _ 81. 7D, FC, 000001F3
        jle     ?_171                                   ; 38DF _ 7E, D1
?_174:  leave                                           ; 38E1 _ C9
        ret                                             ; 38E2 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 38E3 _ 55
        mov     ebp, esp                                ; 38E4 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 38E6 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 38E9 _ C7. 40, 04, 00000000
        pop     ebp                                     ; 38F0 _ 5D
        ret                                             ; 38F1 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 38F2 _ 55
        mov     ebp, esp                                ; 38F3 _ 89. E5
        sub     esp, 4                                  ; 38F5 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 38F8 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 38FB _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 38FE _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3901 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 3904 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3907 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 390A _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 390E _ 88. 50, 0C
        leave                                           ; 3911 _ C9
        ret                                             ; 3912 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 3913 _ 55
        mov     ebp, esp                                ; 3914 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3916 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3919 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 391C _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 391E _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 3921 _ C7. 40, 04, 00000002
        pop     ebp                                     ; 3928 _ 5D
        ret                                             ; 3929 _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 392A _ 55
        mov     ebp, esp                                ; 392B _ 89. E5
        sub     esp, 40                                 ; 392D _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 3930 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 3938 _ C7. 04 24, 00000020
        call    io_out8                                 ; 393F _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 3944 _ A1, 000002C0(d)
        add     eax, 1                                  ; 3949 _ 83. C0, 01
        mov     dword [timer_control], eax              ; 394C _ A3, 000002C0(d)
        mov     byte [ebp-0DH], 0                       ; 3951 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 3955 _ C7. 45, F4, 00000000
        jmp     ?_178                                   ; 395C _ E9, 000000B0

?_175:  mov     eax, dword [ebp-0CH]                    ; 3961 _ 8B. 45, F4
        shl     eax, 4                                  ; 3964 _ C1. E0, 04
        add     eax, timer_control                      ; 3967 _ 05, 000002C0(d)
        mov     eax, dword [eax+8H]                     ; 396C _ 8B. 40, 08
        cmp     eax, 2                                  ; 396F _ 83. F8, 02
        jne     ?_176                                   ; 3972 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 3978 _ 8B. 45, F4
        shl     eax, 4                                  ; 397B _ C1. E0, 04
        add     eax, timer_control                      ; 397E _ 05, 000002C0(d)
        mov     eax, dword [eax+4H]                     ; 3983 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 3986 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 3989 _ 8B. 45, F4
        shl     eax, 4                                  ; 398C _ C1. E0, 04
        add     eax, timer_control                      ; 398F _ 05, 000002C0(d)
        mov     dword [eax+4H], edx                     ; 3994 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 3997 _ 8B. 45, F4
        shl     eax, 4                                  ; 399A _ C1. E0, 04
        add     eax, timer_control                      ; 399D _ 05, 000002C0(d)
        mov     eax, dword [eax+4H]                     ; 39A2 _ 8B. 40, 04
        test    eax, eax                                ; 39A5 _ 85. C0
        jnz     ?_176                                   ; 39A7 _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 39A9 _ 8B. 45, F4
        shl     eax, 4                                  ; 39AC _ C1. E0, 04
        add     eax, timer_control                      ; 39AF _ 05, 000002C0(d)
        mov     dword [eax+8H], 1                       ; 39B4 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 39BB _ 8B. 45, F4
        shl     eax, 4                                  ; 39BE _ C1. E0, 04
        add     eax, timer_control                      ; 39C1 _ 05, 000002C0(d)
        movzx   eax, byte [eax+10H]                     ; 39C6 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 39CA _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 39CD _ 8B. 45, F4
        shl     eax, 4                                  ; 39D0 _ C1. E0, 04
        add     eax, timer_control                      ; 39D3 _ 05, 000002C0(d)
        mov     eax, dword [eax+0CH]                    ; 39D8 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 39DB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 39DF _ 89. 04 24
        call    fifo8_put                               ; 39E2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 39E7 _ 8B. 45, F4
        shl     eax, 4                                  ; 39EA _ C1. E0, 04
        add     eax, timer_control                      ; 39ED _ 05, 000002C0(d)
        lea     edx, [eax+4H]                           ; 39F2 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 39F5 _ A1, 00000000(d)
        cmp     edx, eax                                ; 39FA _ 39. C2
        jnz     ?_176                                   ; 39FC _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 39FE _ C6. 45, F3, 01
?_176:  cmp     byte [ebp-0DH], 0                       ; 3A02 _ 80. 7D, F3, 00
        jz      ?_177                                   ; 3A06 _ 74, 05
        call    task_switch                             ; 3A08 _ E8, FFFFFFFC(rel)
?_177:  add     dword [ebp-0CH], 1                      ; 3A0D _ 83. 45, F4, 01
?_178:  cmp     dword [ebp-0CH], 499                    ; 3A11 _ 81. 7D, F4, 000001F3
        jle     ?_175                                   ; 3A18 _ 0F 8E, FFFFFF43
        leave                                           ; 3A1E _ C9
        ret                                             ; 3A1F _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 3A20 _ 55
        mov     ebp, esp                                ; 3A21 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 3A23 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_179                                   ; 3A2A _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 3A2C _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 3A33 _ 8B. 45, 0C
        shr     eax, 12                                 ; 3A36 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 3A39 _ 89. 45, 0C
?_179:  mov     eax, dword [ebp+0CH]                    ; 3A3C _ 8B. 45, 0C
        mov     edx, eax                                ; 3A3F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3A41 _ 8B. 45, 08
        mov     word [eax], dx                          ; 3A44 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 3A47 _ 8B. 45, 10
        mov     edx, eax                                ; 3A4A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3A4C _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 3A4F _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 3A53 _ 8B. 45, 10
        sar     eax, 16                                 ; 3A56 _ C1. F8, 10
        mov     edx, eax                                ; 3A59 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3A5B _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 3A5E _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 3A61 _ 8B. 45, 14
        mov     edx, eax                                ; 3A64 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3A66 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 3A69 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 3A6C _ 8B. 45, 0C
        shr     eax, 16                                 ; 3A6F _ C1. E8, 10
        and     eax, 0FH                                ; 3A72 _ 83. E0, 0F
        mov     edx, eax                                ; 3A75 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 3A77 _ 8B. 45, 14
        sar     eax, 8                                  ; 3A7A _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 3A7D _ 83. E0, F0
        or      eax, edx                                ; 3A80 _ 09. D0
        mov     edx, eax                                ; 3A82 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3A84 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 3A87 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 3A8A _ 8B. 45, 10
        shr     eax, 24                                 ; 3A8D _ C1. E8, 18
        mov     edx, eax                                ; 3A90 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3A92 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 3A95 _ 88. 50, 07
        pop     ebp                                     ; 3A98 _ 5D
        ret                                             ; 3A99 _ C3
; segment_descriptor End of function

init_task_level:; Function begin
        push    ebp                                     ; 3A9A _ 55
        mov     ebp, esp                                ; 3A9B _ 89. E5
        sub     esp, 16                                 ; 3A9D _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 3AA0 _ 8B. 0D, 00002208(d)
        mov     edx, dword [ebp+8H]                     ; 3AA6 _ 8B. 55, 08
        mov     eax, edx                                ; 3AA9 _ 89. D0
        shl     eax, 2                                  ; 3AAB _ C1. E0, 02
        add     eax, edx                                ; 3AAE _ 01. D0
        shl     eax, 2                                  ; 3AB0 _ C1. E0, 02
        add     eax, ecx                                ; 3AB3 _ 01. C8
        add     eax, 8                                  ; 3AB5 _ 83. C0, 08
        mov     dword [eax], 0                          ; 3AB8 _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 3ABE _ 8B. 0D, 00002208(d)
        mov     edx, dword [ebp+8H]                     ; 3AC4 _ 8B. 55, 08
        mov     eax, edx                                ; 3AC7 _ 89. D0
        shl     eax, 2                                  ; 3AC9 _ C1. E0, 02
        add     eax, edx                                ; 3ACC _ 01. D0
        shl     eax, 2                                  ; 3ACE _ C1. E0, 02
        add     eax, ecx                                ; 3AD1 _ 01. C8
        add     eax, 12                                 ; 3AD3 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 3AD6 _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 3ADC _ C7. 45, FC, 00000000
        jmp     ?_181                                   ; 3AE3 _ EB, 21

?_180:  mov     ecx, dword [task_control]               ; 3AE5 _ 8B. 0D, 00002208(d)
        mov     edx, dword [ebp-4H]                     ; 3AEB _ 8B. 55, FC
        mov     eax, edx                                ; 3AEE _ 89. D0
        add     eax, eax                                ; 3AF0 _ 01. C0
        add     eax, edx                                ; 3AF2 _ 01. D0
        shl     eax, 3                                  ; 3AF4 _ C1. E0, 03
        add     eax, ecx                                ; 3AF7 _ 01. C8
        add     eax, 16                                 ; 3AF9 _ 83. C0, 10
        mov     dword [eax], 0                          ; 3AFC _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 3B02 _ 83. 45, FC, 01
?_181:  cmp     dword [ebp-4H], 2                       ; 3B06 _ 83. 7D, FC, 02
        jle     ?_180                                   ; 3B0A _ 7E, D9
        leave                                           ; 3B0C _ C9
        ret                                             ; 3B0D _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 3B0E _ 55
        mov     ebp, esp                                ; 3B0F _ 89. E5
        sub     esp, 40                                 ; 3B11 _ 83. EC, 28
        call    get_addr_gdt                            ; 3B14 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3B19 _ 89. 45, F0
        mov     dword [esp+4H], 668                     ; 3B1C _ C7. 44 24, 04, 0000029C
        mov     eax, dword [ebp+8H]                     ; 3B24 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B27 _ 89. 04 24
        call    memman_alloc_4k                         ; 3B2A _ E8, FFFFFFFC(rel)
        mov     dword [task_control], eax               ; 3B2F _ A3, 00002208(d)
        mov     dword [ebp-14H], 0                      ; 3B34 _ C7. 45, EC, 00000000
        jmp     ?_183                                   ; 3B3B _ E9, 00000085

?_182:  mov     edx, dword [task_control]               ; 3B40 _ 8B. 15, 00002208(d)
        mov     eax, dword [ebp-14H]                    ; 3B46 _ 8B. 45, EC
        imul    eax, eax, 148                           ; 3B49 _ 69. C0, 00000094
        add     eax, edx                                ; 3B4F _ 01. D0
        add     eax, 72                                 ; 3B51 _ 83. C0, 48
        mov     dword [eax], 0                          ; 3B54 _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 3B5A _ 8B. 0D, 00002208(d)
        mov     eax, dword [ebp-14H]                    ; 3B60 _ 8B. 45, EC
        add     eax, 8                                  ; 3B63 _ 83. C0, 08
        lea     edx, [eax*8]                            ; 3B66 _ 8D. 14 C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 3B6D _ 8B. 45, EC
        imul    eax, eax, 148                           ; 3B70 _ 69. C0, 00000094
        add     eax, ecx                                ; 3B76 _ 01. C8
        add     eax, 68                                 ; 3B78 _ 83. C0, 44
        mov     dword [eax], edx                        ; 3B7B _ 89. 10
        mov     eax, dword [task_control]               ; 3B7D _ A1, 00002208(d)
        mov     edx, dword [ebp-14H]                    ; 3B82 _ 8B. 55, EC
        imul    edx, edx, 148                           ; 3B85 _ 69. D2, 00000094
        add     edx, 96                                 ; 3B8B _ 83. C2, 60
        add     eax, edx                                ; 3B8E _ 01. D0
        add     eax, 16                                 ; 3B90 _ 83. C0, 10
        mov     edx, dword [ebp-14H]                    ; 3B93 _ 8B. 55, EC
        add     edx, 8                                  ; 3B96 _ 83. C2, 08
        lea     ecx, [edx*8]                            ; 3B99 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 3BA0 _ 8B. 55, F0
        add     edx, ecx                                ; 3BA3 _ 01. CA
        mov     dword [esp+0CH], 137                    ; 3BA5 _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 3BAD _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 3BB1 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 3BB9 _ 89. 14 24
        call    segment_descriptor                      ; 3BBC _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 3BC1 _ 83. 45, EC, 01
?_183:  cmp     dword [ebp-14H], 4                      ; 3BC5 _ 83. 7D, EC, 04
        jle     ?_182                                   ; 3BC9 _ 0F 8E, FFFFFF71
        mov     dword [ebp-14H], 0                      ; 3BCF _ C7. 45, EC, 00000000
        jmp     ?_185                                   ; 3BD6 _ EB, 0F

?_184:  mov     eax, dword [ebp-14H]                    ; 3BD8 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 3BDB _ 89. 04 24
        call    init_task_level                         ; 3BDE _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 3BE3 _ 83. 45, EC, 01
?_185:  cmp     dword [ebp-14H], 2                      ; 3BE7 _ 83. 7D, EC, 02
        jle     ?_184                                   ; 3BEB _ 7E, EB
        call    task_alloc                              ; 3BED _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3BF2 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 3BF5 _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 3BF8 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 3BFF _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 3C02 _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 3C09 _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 3C0C _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 3C13 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 3C16 _ 89. 04 24
        call    task_add                                ; 3C19 _ E8, FFFFFFFC(rel)
        call    task_switch_sub                         ; 3C1E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3C23 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 3C26 _ 8B. 00
        mov     dword [esp], eax                        ; 3C28 _ 89. 04 24
        call    load_tr                                 ; 3C2B _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 3C30 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 3C35 _ A3, 00002204(d)
        mov     eax, dword [ebp-0CH]                    ; 3C3A _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 3C3D _ 8B. 40, 08
        mov     edx, eax                                ; 3C40 _ 89. C2
        mov     eax, dword [task_timer]                 ; 3C42 _ A1, 00002204(d)
        mov     dword [esp+4H], edx                     ; 3C47 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3C4B _ 89. 04 24
        call    timer_settime                           ; 3C4E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3C53 _ 8B. 45, F4
        leave                                           ; 3C56 _ C9
        ret                                             ; 3C57 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 3C58 _ 55
        mov     ebp, esp                                ; 3C59 _ 89. E5
        sub     esp, 16                                 ; 3C5B _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3C5E _ C7. 45, F8, 00000000
        jmp     ?_188                                   ; 3C65 _ E9, 000000F6

?_186:  mov     edx, dword [task_control]               ; 3C6A _ 8B. 15, 00002208(d)
        mov     eax, dword [ebp-8H]                     ; 3C70 _ 8B. 45, F8
        imul    eax, eax, 148                           ; 3C73 _ 69. C0, 00000094
        add     eax, edx                                ; 3C79 _ 01. D0
        add     eax, 72                                 ; 3C7B _ 83. C0, 48
        mov     eax, dword [eax]                        ; 3C7E _ 8B. 00
        test    eax, eax                                ; 3C80 _ 85. C0
        jne     ?_187                                   ; 3C82 _ 0F 85, 000000D4
        mov     eax, dword [task_control]               ; 3C88 _ A1, 00002208(d)
        mov     edx, dword [ebp-8H]                     ; 3C8D _ 8B. 55, F8
        imul    edx, edx, 148                           ; 3C90 _ 69. D2, 00000094
        add     edx, 64                                 ; 3C96 _ 83. C2, 40
        add     eax, edx                                ; 3C99 _ 01. D0
        add     eax, 4                                  ; 3C9B _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 3C9E _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3CA1 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 3CA4 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 3CAB _ 8B. 45, FC
        mov     dword [eax+50H], 514                    ; 3CAE _ C7. 40, 50, 00000202
        mov     eax, dword [ebp-4H]                     ; 3CB5 _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 3CB8 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 3CBF _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 3CC2 _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 3CC9 _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 3CCC _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 3CD3 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 3CD6 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-8H]                     ; 3CDD _ 8B. 45, F8
        add     eax, 1                                  ; 3CE0 _ 83. C0, 01
        shl     eax, 9                                  ; 3CE3 _ C1. E0, 09
        mov     edx, eax                                ; 3CE6 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3CE8 _ 8B. 45, FC
        mov     dword [eax+64H], edx                    ; 3CEB _ 89. 50, 64
        mov     eax, dword [ebp-4H]                     ; 3CEE _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 3CF1 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-4H]                     ; 3CF8 _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 3CFB _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 3D02 _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 3D05 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 3D0C _ 8B. 45, FC
        mov     dword [eax+74H], 0                      ; 3D0F _ C7. 40, 74, 00000000
        mov     eax, dword [ebp-4H]                     ; 3D16 _ 8B. 45, FC
        mov     dword [eax+80H], 0                      ; 3D19 _ C7. 80, 00000080, 00000000
        mov     eax, dword [ebp-4H]                     ; 3D23 _ 8B. 45, FC
        mov     dword [eax+84H], 0                      ; 3D26 _ C7. 80, 00000084, 00000000
        mov     eax, dword [ebp-4H]                     ; 3D30 _ 8B. 45, FC
        mov     dword [eax+88H], 0                      ; 3D33 _ C7. 80, 00000088, 00000000
        mov     eax, dword [ebp-4H]                     ; 3D3D _ 8B. 45, FC
        mov     dword [eax+8CH], 0                      ; 3D40 _ C7. 80, 0000008C, 00000000
        mov     eax, dword [ebp-4H]                     ; 3D4A _ 8B. 45, FC
        mov     dword [eax+90H], 1073741824             ; 3D4D _ C7. 80, 00000090, 40000000
        mov     eax, dword [ebp-4H]                     ; 3D57 _ 8B. 45, FC
        jmp     ?_189                                   ; 3D5A _ EB, 13

?_187:  add     dword [ebp-8H], 1                       ; 3D5C _ 83. 45, F8, 01
?_188:  cmp     dword [ebp-8H], 4                       ; 3D60 _ 83. 7D, F8, 04
        jle     ?_186                                   ; 3D64 _ 0F 8E, FFFFFF00
        mov     eax, 0                                  ; 3D6A _ B8, 00000000
?_189:  leave                                           ; 3D6F _ C9
        ret                                             ; 3D70 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 3D71 _ 55
        mov     ebp, esp                                ; 3D72 _ 89. E5
        sub     esp, 24                                 ; 3D74 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 3D77 _ 83. 7D, 0C, 00
        jns     ?_190                                   ; 3D7B _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 3D7D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3D80 _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 3D83 _ 89. 45, 0C
?_190:  cmp     dword [ebp+10H], 0                      ; 3D86 _ 83. 7D, 10, 00
        jle     ?_191                                   ; 3D8A _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 3D8C _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3D8F _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 3D92 _ 89. 50, 08
?_191:  mov     eax, dword [ebp+8H]                     ; 3D95 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3D98 _ 8B. 40, 04
        cmp     eax, 2                                  ; 3D9B _ 83. F8, 02
        jnz     ?_192                                   ; 3D9E _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 3DA0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3DA3 _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 3DA6 _ 3B. 45, 0C
        jz      ?_192                                   ; 3DA9 _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 3DAB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3DAE _ 89. 04 24
        call    task_remove                             ; 3DB1 _ E8, FFFFFFFC(rel)
?_192:  mov     eax, dword [ebp+8H]                     ; 3DB6 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3DB9 _ 8B. 40, 04
        cmp     eax, 2                                  ; 3DBC _ 83. F8, 02
        jz      ?_193                                   ; 3DBF _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 3DC1 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3DC4 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 3DC7 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3DCA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3DCD _ 89. 04 24
        call    task_add                                ; 3DD0 _ E8, FFFFFFFC(rel)
?_193:  mov     eax, dword [task_control]               ; 3DD5 _ A1, 00002208(d)
        mov     dword [eax+4H], 1                       ; 3DDA _ C7. 40, 04, 00000001
        leave                                           ; 3DE1 _ C9
        ret                                             ; 3DE2 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 3DE3 _ 55
        mov     ebp, esp                                ; 3DE4 _ 89. E5
        sub     esp, 40                                 ; 3DE6 _ 83. EC, 28
        mov     ecx, dword [task_control]               ; 3DE9 _ 8B. 0D, 00002208(d)
        mov     eax, dword [task_control]               ; 3DEF _ A1, 00002208(d)
        mov     edx, dword [eax]                        ; 3DF4 _ 8B. 10
        mov     eax, edx                                ; 3DF6 _ 89. D0
        shl     eax, 2                                  ; 3DF8 _ C1. E0, 02
        add     eax, edx                                ; 3DFB _ 01. D0
        shl     eax, 2                                  ; 3DFD _ C1. E0, 02
        add     eax, ecx                                ; 3E00 _ 01. C8
        add     eax, 8                                  ; 3E02 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 3E05 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 3E08 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 3E0B _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 3E0E _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 3E11 _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 3E15 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 3E18 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 3E1B _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 3E1E _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 3E21 _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 3E24 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 3E27 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 3E2A _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 3E2D _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 3E30 _ 8B. 00
        cmp     edx, eax                                ; 3E32 _ 39. C2
        jnz     ?_194                                   ; 3E34 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 3E36 _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 3E39 _ C7. 40, 04, 00000000
?_194:  mov     eax, dword [task_control]               ; 3E40 _ A1, 00002208(d)
        mov     eax, dword [eax+4H]                     ; 3E45 _ 8B. 40, 04
        test    eax, eax                                ; 3E48 _ 85. C0
        jz      ?_195                                   ; 3E4A _ 74, 24
        call    task_switch_sub                         ; 3E4C _ E8, FFFFFFFC(rel)
        mov     ecx, dword [task_control]               ; 3E51 _ 8B. 0D, 00002208(d)
        mov     eax, dword [task_control]               ; 3E57 _ A1, 00002208(d)
        mov     edx, dword [eax]                        ; 3E5C _ 8B. 10
        mov     eax, edx                                ; 3E5E _ 89. D0
        shl     eax, 2                                  ; 3E60 _ C1. E0, 02
        add     eax, edx                                ; 3E63 _ 01. D0
        shl     eax, 2                                  ; 3E65 _ C1. E0, 02
        add     eax, ecx                                ; 3E68 _ 01. C8
        add     eax, 8                                  ; 3E6A _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 3E6D _ 89. 45, EC
?_195:  mov     eax, dword [ebp-14H]                    ; 3E70 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 3E73 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 3E76 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 3E79 _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 3E7D _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 3E80 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 3E83 _ 8B. 40, 08
        mov     edx, eax                                ; 3E86 _ 89. C2
        mov     eax, dword [task_timer]                 ; 3E88 _ A1, 00002204(d)
        mov     dword [esp+4H], edx                     ; 3E8D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3E91 _ 89. 04 24
        call    timer_settime                           ; 3E94 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3E99 _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 3E9C _ 3B. 45, F0
        jz      ?_196                                   ; 3E9F _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 3EA1 _ 83. 7D, F4, 00
        jz      ?_196                                   ; 3EA5 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 3EA7 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 3EAA _ 8B. 00
        mov     dword [esp+4H], eax                     ; 3EAC _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 3EB0 _ C7. 04 24, 00000000
        call    farjmp                                  ; 3EB7 _ E8, FFFFFFFC(rel)
?_196:  leave                                           ; 3EBC _ C9
        ret                                             ; 3EBD _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 3EBE _ 55
        mov     ebp, esp                                ; 3EBF _ 89. E5
        sub     esp, 40                                 ; 3EC1 _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 3EC4 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 3ECB _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 3ED2 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3ED5 _ 8B. 40, 04
        cmp     eax, 2                                  ; 3ED8 _ 83. F8, 02
        jnz     ?_197                                   ; 3EDB _ 75, 51
        call    task_now                                ; 3EDD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3EE2 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3EE5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3EE8 _ 89. 04 24
        call    task_remove                             ; 3EEB _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 3EF0 _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 3EF7 _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 3EFA _ 3B. 45, F4
        jnz     ?_197                                   ; 3EFD _ 75, 2F
        call    task_switch_sub                         ; 3EFF _ E8, FFFFFFFC(rel)
        call    task_now                                ; 3F04 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3F09 _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 3F0C _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 3F13 _ 83. 7D, F4, 00
        jz      ?_197                                   ; 3F17 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 3F19 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 3F1C _ 8B. 00
        mov     dword [esp+4H], eax                     ; 3F1E _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 3F22 _ C7. 04 24, 00000000
        call    farjmp                                  ; 3F29 _ E8, FFFFFFFC(rel)
?_197:  mov     eax, dword [ebp-10H]                    ; 3F2E _ 8B. 45, F0
        leave                                           ; 3F31 _ C9
        ret                                             ; 3F32 _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 3F33 _ 55
        mov     ebp, esp                                ; 3F34 _ 89. E5
        sub     esp, 16                                 ; 3F36 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 3F39 _ 8B. 0D, 00002208(d)
        mov     eax, dword [task_control]               ; 3F3F _ A1, 00002208(d)
        mov     edx, dword [eax]                        ; 3F44 _ 8B. 10
        mov     eax, edx                                ; 3F46 _ 89. D0
        shl     eax, 2                                  ; 3F48 _ C1. E0, 02
        add     eax, edx                                ; 3F4B _ 01. D0
        shl     eax, 2                                  ; 3F4D _ C1. E0, 02
        add     eax, ecx                                ; 3F50 _ 01. C8
        add     eax, 8                                  ; 3F52 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 3F55 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3F58 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 3F5B _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 3F5E _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 3F61 _ 8B. 44 90, 08
        leave                                           ; 3F65 _ C9
        ret                                             ; 3F66 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 3F67 _ 55
        mov     ebp, esp                                ; 3F68 _ 89. E5
        sub     esp, 16                                 ; 3F6A _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 3F6D _ 8B. 0D, 00002208(d)
        mov     eax, dword [ebp+8H]                     ; 3F73 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 3F76 _ 8B. 50, 0C
        mov     eax, edx                                ; 3F79 _ 89. D0
        shl     eax, 2                                  ; 3F7B _ C1. E0, 02
        add     eax, edx                                ; 3F7E _ 01. D0
        shl     eax, 2                                  ; 3F80 _ C1. E0, 02
        add     eax, ecx                                ; 3F83 _ 01. C8
        add     eax, 8                                  ; 3F85 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 3F88 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3F8B _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 3F8E _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 3F90 _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 3F93 _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 3F96 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 3F9A _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 3F9D _ 8B. 00
        lea     edx, [eax+1H]                           ; 3F9F _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 3FA2 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 3FA5 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3FA7 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 3FAA _ C7. 40, 04, 00000002
        leave                                           ; 3FB1 _ C9
        ret                                             ; 3FB2 _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 3FB3 _ 55
        mov     ebp, esp                                ; 3FB4 _ 89. E5
        sub     esp, 16                                 ; 3FB6 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 3FB9 _ 8B. 0D, 00002208(d)
        mov     eax, dword [ebp+8H]                     ; 3FBF _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 3FC2 _ 8B. 50, 0C
        mov     eax, edx                                ; 3FC5 _ 89. D0
        shl     eax, 2                                  ; 3FC7 _ C1. E0, 02
        add     eax, edx                                ; 3FCA _ 01. D0
        shl     eax, 2                                  ; 3FCC _ C1. E0, 02
        add     eax, ecx                                ; 3FCF _ 01. C8
        add     eax, 8                                  ; 3FD1 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 3FD4 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 3FD7 _ C7. 45, F8, 00000000
        jmp     ?_200                                   ; 3FDE _ EB, 23

?_198:  mov     eax, dword [ebp-4H]                     ; 3FE0 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 3FE3 _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 3FE6 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 3FEA _ 3B. 45, 08
        jnz     ?_199                                   ; 3FED _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 3FEF _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 3FF2 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 3FF5 _ C7. 44 90, 08, 00000000
        jmp     ?_201                                   ; 3FFD _ EB, 0E

?_199:  add     dword [ebp-8H], 1                       ; 3FFF _ 83. 45, F8, 01
?_200:  mov     eax, dword [ebp-4H]                     ; 4003 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4006 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4008 _ 3B. 45, F8
        jg      ?_198                                   ; 400B _ 7F, D3
?_201:  mov     eax, dword [ebp-4H]                     ; 400D _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4010 _ 8B. 00
        lea     edx, [eax-1H]                           ; 4012 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 4015 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 4018 _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 401A _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 401D _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 4020 _ 3B. 45, F8
        jle     ?_202                                   ; 4023 _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 4025 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 4028 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 402B _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 402E _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 4031 _ 89. 50, 04
?_202:  mov     eax, dword [ebp-4H]                     ; 4034 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 4037 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 403A _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 403D _ 8B. 00
        cmp     edx, eax                                ; 403F _ 39. C2
        jl      ?_203                                   ; 4041 _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 4043 _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 4046 _ C7. 40, 04, 00000000
?_203:  mov     eax, dword [ebp+8H]                     ; 404D _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 4050 _ C7. 40, 04, 00000001
        jmp     ?_205                                   ; 4057 _ EB, 1B

?_204:  mov     eax, dword [ebp-8H]                     ; 4059 _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 405C _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 405F _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 4062 _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 4066 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 4069 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 406C _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 4070 _ 83. 45, F8, 01
?_205:  mov     eax, dword [ebp-4H]                     ; 4074 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 4077 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 4079 _ 3B. 45, F8
        jg      ?_204                                   ; 407C _ 7F, DB
        leave                                           ; 407E _ C9
        ret                                             ; 407F _ C3
; task_remove End of function

task_switch_sub:; Function begin
        push    ebp                                     ; 4080 _ 55
        mov     ebp, esp                                ; 4081 _ 89. E5
        sub     esp, 16                                 ; 4083 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 4086 _ C7. 45, FC, 00000000
        jmp     ?_208                                   ; 408D _ EB, 24

?_206:  mov     ecx, dword [task_control]               ; 408F _ 8B. 0D, 00002208(d)
        mov     edx, dword [ebp-4H]                     ; 4095 _ 8B. 55, FC
        mov     eax, edx                                ; 4098 _ 89. D0
        shl     eax, 2                                  ; 409A _ C1. E0, 02
        add     eax, edx                                ; 409D _ 01. D0
        shl     eax, 2                                  ; 409F _ C1. E0, 02
        add     eax, ecx                                ; 40A2 _ 01. C8
        add     eax, 8                                  ; 40A4 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 40A7 _ 8B. 00
        test    eax, eax                                ; 40A9 _ 85. C0
        jle     ?_207                                   ; 40AB _ 7E, 02
        jmp     ?_209                                   ; 40AD _ EB, 0A

?_207:  add     dword [ebp-4H], 1                       ; 40AF _ 83. 45, FC, 01
?_208:  cmp     dword [ebp-4H], 2                       ; 40B3 _ 83. 7D, FC, 02
        jle     ?_206                                   ; 40B7 _ 7E, D6
?_209:  mov     eax, dword [task_control]               ; 40B9 _ A1, 00002208(d)
        mov     edx, dword [ebp-4H]                     ; 40BE _ 8B. 55, FC
        mov     dword [eax], edx                        ; 40C1 _ 89. 10
        mov     eax, dword [task_control]               ; 40C3 _ A1, 00002208(d)
        mov     dword [eax+4H], 0                       ; 40C8 _ C7. 40, 04, 00000000
        leave                                           ; 40CF _ C9
        ret                                             ; 40D0 _ C3
; task_switch_sub End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_210:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_211:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0007 _ console.

?_212:                                                  ; byte
        db 3EH, 00H                                     ; 000F _ >.

?_213:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 0011 _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0019 _ sk b.

?_214:                                                  ; byte
        db 42H, 00H                                     ; 001E _ B.

?_215:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0020 _ page is:
        db 20H, 00H                                     ; 0028 _  .

?_216:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 002A _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0032 _ L: .

?_217:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0036 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003E _ H: .

?_218:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0042 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 004A _ w: .

?_219:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 004E _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0056 _ gh: .

?_220:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 005B _ type: .


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
        db 2CH, 00H, 00H, 5CH, 5AH, 58H, 43H, 56H       ; 0048 _ ,..\ZXCV
        db 42H, 4EH, 4DH, 2CH, 2EH, 2FH, 00H, 00H       ; 0050 _ BNM,./..
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0060 _ ........
        db 00H, 00H, 2DH, 00H, 00H, 2BH, 00H, 00H       ; 0068 _ ..-..+..
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0070 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ ........

table_rgb.1739:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0080 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0088 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0090 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0098 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 00A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 00A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

cursor.1807:                                            ; byte
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00C0 _ *.......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00C8 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00D0 _ **......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00D8 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00E0 _ *O*.....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00E8 _ ........
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 00F0 _ *OO*....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00F8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 0100 _ *OOO*...
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0108 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 0110 _ *OOOO*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0118 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 0120 _ *OOOOO*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0128 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH       ; 0130 _ *OOOOOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0138 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0140 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0148 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 2AH       ; 0150 _ *OOOO***
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0158 _ **......
        db 2AH, 4FH, 4FH, 2AH, 4FH, 2AH, 2EH, 2EH       ; 0160 _ *OO*O*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0168 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 0170 _ *O*.*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0178 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 0180 _ **..*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0188 _ ........
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0190 _ *....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0198 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 01A0 _ .....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01A8 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2EH       ; 01B0 _ ......*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 01B8 _ ........

closebtn.1894:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 01C0 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 01C8 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 01D0 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01D8 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 01E0 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01E8 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 01F0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 01F8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 0200 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 0208 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 0210 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0218 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 0220 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0228 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 0230 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0238 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 0240 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 0248 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0250 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0258 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0260 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0268 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0270 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0278 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0280 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0288 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0290 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0298 _ @@@@@@@@

keyval:                                                 ; byte
        db 30H, 58H                                     ; 02A0 _ 0X

?_221:  db 00H                                          ; 02A2 _ .

?_222:  db 00H, 00H                                     ; 02A3 _ ..


SECTION .bss    align=32 noexecute                      ; section number 4, bss

test_console_g:                                         ; dword
        resd    1                                       ; 0000

task_a: resd    1                                       ; 0004

sheet_control:                                          ; dword
        resd    1                                       ; 0008

back_sheet:                                             ; dword
        resd    1                                       ; 000C

mouse_sheet:                                            ; dword
        resd    1                                       ; 0010

timerinfo1.1744:                                        ; byte
        resb    28                                      ; 0014

timerbuf1.1747:                                         ; qword
        resq    1                                       ; 0030

timerinfo2.1745:                                        ; byte
        resb    28                                      ; 0038

timerbuf2.1748:                                         ; qword
        resq    1                                       ; 0054

timerinfo3.1746:                                        ; byte
        resb    28                                      ; 005C

timerbuf3.1749:                                         ; qword
        resq    1                                       ; 0078

screen_info:                                            ; qword
        resb    4                                       ; 0080

?_223:  resw    1                                       ; 0084

?_224:  resw    13                                      ; 0086

mouse_cursor_buf:                                       ; byte
        resb    256                                     ; 00A0

back_buf: resd  1                                       ; 01A0

sheet_win:                                              ; dword
        resd    1                                       ; 01A4

mouse_x: resd   1                                       ; 01A8

mouse_y: resd   1                                       ; 01AC

mouse_send_info:                                        ; oword
        resb    16                                      ; 01B0

keyinfo:                                                ; byte
        resb    32                                      ; 01C0

keybuf:                                                 ; yword
        resb    32                                      ; 01E0

mouseinfo:                                              ; byte
        resb    32                                      ; 0200

mousebuf:                                               ; byte
        resb    128                                     ; 0220

str.1386:                                               ; byte
        resb    1                                       ; 02A0

?_225:  resb    9                                       ; 02A1

?_226:  resb    22                                      ; 02AA

timer_control:                                          ; byte
        resd    2001                                    ; 02C0

task_timer:                                             ; dword
        resd    1                                       ; 2204

task_control:                                           ; dword
        resd    1                                       ; 2208


