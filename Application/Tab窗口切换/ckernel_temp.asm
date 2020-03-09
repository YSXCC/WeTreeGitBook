; Disassembly of file: ckernel.o
; Mon Mar  9 11:28:39 2020
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
extern keytable                                         ; byte
extern io_store_eflags                                  ; near
extern mouse_cursor_buf                                 ; byte
extern get_addr_gdt                                     ; near
extern io_cli                                           ; near
extern sheet_control                                    ; dword
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
        mov     eax, dword [memman]                     ; 0031 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0036 _ 89. 04 24
        call    memman_init                             ; 0039 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 003E _ A1, 00000000(d)
        mov     dword [esp+8H], 1072594944              ; 0043 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 17301504                ; 004B _ C7. 44 24, 04, 01080000
        mov     dword [esp], eax                        ; 0053 _ 89. 04 24
        call    memman_free                             ; 0056 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 005B _ A1, 00000000(d)
        mov     edx, dword [ebp-38H]                    ; 0060 _ 8B. 55, C8
        mov     dword [esp+0CH], edx                    ; 0063 _ 89. 54 24, 0C
        mov     edx, dword [ebp-3CH]                    ; 0067 _ 8B. 55, C4
        mov     dword [esp+8H], edx                     ; 006A _ 89. 54 24, 08
        mov     edx, dword [ebp-40H]                    ; 006E _ 8B. 55, C0
        mov     dword [esp+4H], edx                     ; 0071 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0075 _ 89. 04 24
        call    sheet_control_init                      ; 0078 _ E8, FFFFFFFC(rel)
        mov     dword [sheet_control], eax              ; 007D _ A3, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0082 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0087 _ 89. 04 24
        call    sheet_alloc                             ; 008A _ E8, FFFFFFFC(rel)
        mov     dword [back_sheet], eax                 ; 008F _ A3, 00000004(d)
        mov     eax, dword [sheet_control]              ; 0094 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0099 _ 89. 04 24
        call    sheet_alloc                             ; 009C _ E8, FFFFFFFC(rel)
        mov     dword [mouse_sheet], eax                ; 00A1 _ A3, 00000008(d)
        mov     eax, dword [ebp-3CH]                    ; 00A6 _ 8B. 45, C4
        imul    eax, dword [ebp-38H]                    ; 00A9 _ 0F AF. 45, C8
        mov     edx, eax                                ; 00AD _ 89. C2
        mov     eax, dword [memman]                     ; 00AF _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 00B4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00B8 _ 89. 04 24
        call    memman_alloc_4k                         ; 00BB _ E8, FFFFFFFC(rel)
        mov     dword [back_buf], eax                   ; 00C0 _ A3, 00000000(d)
        mov     edx, dword [back_buf]                   ; 00C5 _ 8B. 15, 00000000(d)
        mov     eax, dword [back_sheet]                 ; 00CB _ A1, 00000004(d)
        mov     dword [esp+10H], 99                     ; 00D0 _ C7. 44 24, 10, 00000063
        mov     ecx, dword [ebp-38H]                    ; 00D8 _ 8B. 4D, C8
        mov     dword [esp+0CH], ecx                    ; 00DB _ 89. 4C 24, 0C
        mov     ecx, dword [ebp-3CH]                    ; 00DF _ 8B. 4D, C4
        mov     dword [esp+8H], ecx                     ; 00E2 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 00E6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00EA _ 89. 04 24
        call    sheet_setbuf                            ; 00ED _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_sheet]                ; 00F2 _ A1, 00000008(d)
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
        mov     dword [esp+8H], timerbuf1.1742          ; 0148 _ C7. 44 24, 08, 00000028(d)
        mov     dword [esp+4H], 8                       ; 0150 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1739            ; 0158 _ C7. 04 24, 0000000C(d)
        call    fifo8_init                              ; 015F _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0164 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0169 _ 89. 45, D0
        mov     dword [esp+8H], 1                       ; 016C _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1739         ; 0174 _ C7. 44 24, 04, 0000000C(d)
        mov     eax, dword [ebp-30H]                    ; 017C _ 8B. 45, D0
        mov     dword [esp], eax                        ; 017F _ 89. 04 24
        call    timer_init                              ; 0182 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0187 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-30H]                    ; 018F _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0192 _ 89. 04 24
        call    timer_settime                           ; 0195 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 019A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf2.1743          ; 01A2 _ C7. 44 24, 08, 0000004C(d)
        mov     dword [esp+4H], 8                       ; 01AA _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1740            ; 01B2 _ C7. 04 24, 00000030(d)
        call    fifo8_init                              ; 01B9 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01BE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 01C3 _ 89. 45, D4
        mov     dword [esp+8H], 1                       ; 01C6 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1740         ; 01CE _ C7. 44 24, 04, 00000030(d)
        mov     eax, dword [ebp-2CH]                    ; 01D6 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 01D9 _ 89. 04 24
        call    timer_init                              ; 01DC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01E1 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-2CH]                    ; 01E9 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 01EC _ 89. 04 24
        call    timer_settime                           ; 01EF _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 01F4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], timerbuf3.1744          ; 01FC _ C7. 44 24, 08, 00000070(d)
        mov     dword [esp+4H], 8                       ; 0204 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1741            ; 020C _ C7. 04 24, 00000054(d)
        call    fifo8_init                              ; 0213 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0218 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 021D _ 89. 45, D8
        mov     dword [esp+8H], 1                       ; 0220 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1741         ; 0228 _ C7. 44 24, 04, 00000054(d)
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
        mov     edx, dword [back_sheet]                 ; 0282 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 0288 _ A1, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 028D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0295 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 029D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 02A1 _ 89. 04 24
        call    sheet_slide                             ; 02A4 _ E8, FFFFFFFC(rel)
        mov     ebx, dword [mouse_y]                    ; 02A9 _ 8B. 1D, 00000000(d)
        mov     ecx, dword [mouse_x]                    ; 02AF _ 8B. 0D, 00000000(d)
        mov     edx, dword [mouse_sheet]                ; 02B5 _ 8B. 15, 00000008(d)
        mov     eax, dword [sheet_control]              ; 02BB _ A1, 00000000(d)
        mov     dword [esp+0CH], ebx                    ; 02C0 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 02C4 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 02C8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 02CC _ 89. 04 24
        call    sheet_slide                             ; 02CF _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 02D4 _ A1, 00000000(d)
        mov     dword [esp+4H], ?_208                   ; 02D9 _ C7. 44 24, 04, 00000000(d)
        mov     dword [esp], eax                        ; 02E1 _ 89. 04 24
        call    message_box                             ; 02E4 _ E8, FFFFFFFC(rel)
        mov     dword [sheet_win], eax                  ; 02E9 _ A3, 00000000(d)
        mov     edx, dword [back_sheet]                 ; 02EE _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 02F4 _ A1, 00000000(d)
        mov     dword [esp+8H], 0                       ; 02F9 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0301 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0305 _ 89. 04 24
        call    sheet_updown                            ; 0308 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_sheet]                ; 030D _ 8B. 15, 00000008(d)
        mov     eax, dword [sheet_control]              ; 0313 _ A1, 00000000(d)
        mov     dword [esp+8H], 100                     ; 0318 _ C7. 44 24, 08, 00000064
        mov     dword [esp+4H], edx                     ; 0320 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0324 _ 89. 04 24
        call    sheet_updown                            ; 0327 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 032C _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 0331 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 0336 _ 89. 45, DC
        call    get_addr_gdt                            ; 0339 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 033E _ 89. 45, E0
        mov     eax, dword [memman]                     ; 0341 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0346 _ 89. 04 24
        call    task_init                               ; 0349 _ E8, FFFFFFFC(rel)
        mov     dword [task_a.1752], eax                ; 034E _ A3, 00000078(d)
        mov     eax, dword [task_a.1752]                ; 0353 _ A1, 00000078(d)
        mov     dword [keyinfo+18H], eax                ; 0358 _ A3, 00000018(d)
        mov     eax, dword [task_a.1752]                ; 035D _ A1, 00000078(d)
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
        mov     dword [esp], timerinfo1.1739            ; 03DB _ C7. 04 24, 0000000C(d)
        call    fifo8_status                            ; 03E2 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03E7 _ 01. C3
        mov     dword [esp], timerinfo2.1740            ; 03E9 _ C7. 04 24, 00000030(d)
        call    fifo8_status                            ; 03F0 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03F5 _ 01. C3
        mov     dword [esp], timerinfo3.1741            ; 03F7 _ C7. 04 24, 00000054(d)
        call    fifo8_status                            ; 03FE _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 0403 _ 01. D8
        test    eax, eax                                ; 0405 _ 85. C0
        jnz     ?_002                                   ; 0407 _ 75, 0A
        call    io_sti                                  ; 0409 _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 040E _ E9, 000004E6

?_002:  mov     dword [esp], keyinfo                    ; 0413 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 041A _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 041F _ 85. C0
        je      ?_007                                   ; 0421 _ 0F 84, 000002CF
        call    io_sti                                  ; 0427 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 042C _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0433 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0438 _ 89. 45, E8
        cmp     dword [ebp-18H], 128                    ; 043B _ 81. 7D, E8, 00000080
        jle     ?_003                                   ; 0442 _ 7E, 05
        jmp     ?_013                                   ; 0444 _ E9, 000004B0

?_003:  cmp     dword [ebp-18H], 28                     ; 0449 _ 83. 7D, E8, 1C
        je      ?_013                                   ; 044D _ 0F 84, 000004A6
        cmp     dword [ebp-18H], 15                     ; 0453 _ 83. 7D, E8, 0F
        jne     ?_006                                   ; 0457 _ 0F 85, 00000128
        cmp     dword [ebp-48H], 0                      ; 045D _ 83. 7D, B8, 00
        jnz     ?_004                                   ; 0461 _ 75, 54
        mov     dword [ebp-48H], 1                      ; 0463 _ C7. 45, B8, 00000001
        mov     edx, dword [sheet_win]                  ; 046A _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0470 _ A1, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 0475 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_208                   ; 047D _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 0485 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0489 _ 89. 04 24
        call    make_window_title                       ; 048C _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 0491 _ A1, 00000000(d)
        mov     dword [esp+0CH], 1                      ; 0496 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_209                   ; 049E _ C7. 44 24, 08, 00000007(d)
        mov     edx, dword [ebp-1CH]                    ; 04A6 _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 04A9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04AD _ 89. 04 24
        call    make_window_title                       ; 04B0 _ E8, FFFFFFFC(rel)
        jmp     ?_005                                   ; 04B5 _ EB, 52

?_004:  mov     dword [ebp-48H], 0                      ; 04B7 _ C7. 45, B8, 00000000
        mov     edx, dword [sheet_win]                  ; 04BE _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 04C4 _ A1, 00000000(d)
        mov     dword [esp+0CH], 1                      ; 04C9 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], ?_208                   ; 04D1 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], edx                     ; 04D9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04DD _ 89. 04 24
        call    make_window_title                       ; 04E0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 04E5 _ A1, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 04EA _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_209                   ; 04F2 _ C7. 44 24, 08, 00000007(d)
        mov     edx, dword [ebp-1CH]                    ; 04FA _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 04FD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0501 _ 89. 04 24
        call    make_window_title                       ; 0504 _ E8, FFFFFFFC(rel)
?_005:  mov     eax, dword [sheet_win]                  ; 0509 _ A1, 00000000(d)
        mov     ebx, dword [eax+8H]                     ; 050E _ 8B. 58, 08
        mov     eax, dword [sheet_win]                  ; 0511 _ A1, 00000000(d)
        mov     ecx, dword [eax+4H]                     ; 0516 _ 8B. 48, 04
        mov     edx, dword [sheet_win]                  ; 0519 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 051F _ A1, 00000000(d)
        mov     dword [esp+14H], ebx                    ; 0524 _ 89. 5C 24, 14
        mov     dword [esp+10H], ecx                    ; 0528 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 0                      ; 052C _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0534 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 053C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0540 _ 89. 04 24
        call    sheet_refresh                           ; 0543 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-1CH]                    ; 0548 _ 8B. 45, E4
        mov     ecx, dword [eax+8H]                     ; 054B _ 8B. 48, 08
        mov     eax, dword [ebp-1CH]                    ; 054E _ 8B. 45, E4
        mov     edx, dword [eax+4H]                     ; 0551 _ 8B. 50, 04
        mov     eax, dword [sheet_control]              ; 0554 _ A1, 00000000(d)
        mov     dword [esp+14H], ecx                    ; 0559 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 055D _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 0561 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0569 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-1CH]                    ; 0571 _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 0574 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0578 _ 89. 04 24
        call    sheet_refresh                           ; 057B _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 0580 _ E9, 00000374

?_006:  mov     eax, dword [ebp-18H]                    ; 0585 _ 8B. 45, E8
        add     eax, keytable                           ; 0588 _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 058D _ 0F B6. 00
        test    al, al                                  ; 0590 _ 84. C0
        je      ?_013                                   ; 0592 _ 0F 84, 00000361
        cmp     dword [ebp-54H], 143                    ; 0598 _ 81. 7D, AC, 0000008F
        jg      ?_013                                   ; 059F _ 0F 8F, 00000354
        mov     eax, dword [ebp-54H]                    ; 05A5 _ 8B. 45, AC
        lea     ecx, [eax+7H]                           ; 05A8 _ 8D. 48, 07
        mov     eax, dword [sheet_win]                  ; 05AB _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 05B0 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 05B3 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 05B8 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 05BA _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 05C2 _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 05C6 _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-54H]                    ; 05CE _ 8B. 4D, AC
        mov     dword [esp+0CH], ecx                    ; 05D1 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 05D5 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 05DD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05E1 _ 89. 04 24
        call    paint_rectangle                         ; 05E4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-54H]                    ; 05E9 _ 8B. 45, AC
        lea     ecx, [eax+8H]                           ; 05EC _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 05EF _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 05F5 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 05FA _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 0602 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0606 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-54H]                    ; 060E _ 8B. 4D, AC
        mov     dword [esp+8H], ecx                     ; 0611 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0615 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0619 _ 89. 04 24
        call    sheet_refresh                           ; 061C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 0621 _ 8B. 45, E8
        add     eax, keytable                           ; 0624 _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 0629 _ 0F B6. 00
        mov     byte [ebp-56H], al                      ; 062C _ 88. 45, AA
        mov     byte [ebp-55H], 0                       ; 062F _ C6. 45, AB, 00
        mov     edx, dword [sheet_win]                  ; 0633 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0639 _ A1, 00000000(d)
        mov     dword [esp+14H], 0                      ; 063E _ C7. 44 24, 14, 00000000
        lea     ecx, [ebp-56H]                          ; 0646 _ 8D. 4D, AA
        mov     dword [esp+10H], ecx                    ; 0649 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 064D _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-54H]                    ; 0655 _ 8B. 4D, AC
        mov     dword [esp+8H], ecx                     ; 0658 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 065C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0660 _ 89. 04 24
        call    paint_string                            ; 0663 _ E8, FFFFFFFC(rel)
        add     dword [ebp-54H], 8                      ; 0668 _ 83. 45, AC, 08
        mov     dword [ebp-44H], 1                      ; 066C _ C7. 45, BC, 00000001
        mov     eax, dword [ebp-54H]                    ; 0673 _ 8B. 45, AC
        lea     ebx, [eax+7H]                           ; 0676 _ 8D. 58, 07
        mov     eax, dword [ebp-50H]                    ; 0679 _ 8B. 45, B0
        movzx   ecx, al                                 ; 067C _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 067F _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 0684 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 0687 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 068C _ 8B. 00
        mov     dword [esp+18H], 43                     ; 068E _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 0696 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 069A _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-54H]                    ; 06A2 _ 8B. 5D, AC
        mov     dword [esp+0CH], ebx                    ; 06A5 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 06A9 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06AD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06B1 _ 89. 04 24
        call    paint_rectangle                         ; 06B4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-54H]                    ; 06B9 _ 8B. 45, AC
        lea     ecx, [eax+8H]                           ; 06BC _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 06BF _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 06C5 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 06CA _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 06D2 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 06D6 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-54H]                    ; 06DE _ 8B. 4D, AC
        mov     dword [esp+8H], ecx                     ; 06E1 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06E5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06E9 _ 89. 04 24
        call    sheet_refresh                           ; 06EC _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 06F1 _ E9, FFFFFCC4

?_007:  mov     dword [esp], mouseinfo                  ; 06F6 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 06FD _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0702 _ 85. C0
        jz      ?_008                                   ; 0704 _ 74, 26
        mov     ecx, dword [mouse_sheet]                ; 0706 _ 8B. 0D, 00000008(d)
        mov     edx, dword [back_sheet]                 ; 070C _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 0712 _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 0717 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 071B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 071F _ 89. 04 24
        call    show_mouse_info                         ; 0722 _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 0727 _ E9, 000001CD

?_008:  mov     dword [esp], timerinfo1.1739            ; 072C _ C7. 04 24, 0000000C(d)
        call    fifo8_status                            ; 0733 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0738 _ 85. C0
        je      ?_009                                   ; 073A _ 0F 84, 00000089
        call    io_sti                                  ; 0740 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1739            ; 0745 _ C7. 04 24, 0000000C(d)
        call    fifo8_get                               ; 074C _ E8, FFFFFFFC(rel)
        mov     edx, dword [back_sheet]                 ; 0751 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 0757 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 075C _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_210                  ; 0764 _ C7. 44 24, 10, 0000000F(d)
        mov     dword [esp+0CH], 144                    ; 076C _ C7. 44 24, 0C, 00000090
        mov     ecx, dword [ebp-4CH]                    ; 0774 _ 8B. 4D, B4
        mov     dword [esp+8H], ecx                     ; 0777 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 077B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 077F _ 89. 04 24
        call    paint_string                            ; 0782 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0787 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-30H]                    ; 078F _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0792 _ 89. 04 24
        call    timer_settime                           ; 0795 _ E8, FFFFFFFC(rel)
        add     dword [ebp-4CH], 8                      ; 079A _ 83. 45, B4, 08
        cmp     dword [ebp-4CH], 40                     ; 079E _ 83. 7D, B4, 28
        jle     ?_013                                   ; 07A2 _ 0F 8E, 00000151
        cmp     dword [ebp-44H], 0                      ; 07A8 _ 83. 7D, BC, 00
        jne     ?_013                                   ; 07AC _ 0F 85, 00000147
        call    io_cli                                  ; 07B2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_a.1752]                ; 07B7 _ A1, 00000078(d)
        mov     dword [esp], eax                        ; 07BC _ 89. 04 24
        call    task_sleep                              ; 07BF _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 07C4 _ E9, FFFFFBF1

?_009:  mov     dword [esp], timerinfo2.1740            ; 07C9 _ C7. 04 24, 00000030(d)
        call    fifo8_status                            ; 07D0 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07D5 _ 85. C0
        jz      ?_010                                   ; 07D7 _ 74, 16
        call    io_sti                                  ; 07D9 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1740            ; 07DE _ C7. 04 24, 00000030(d)
        call    fifo8_get                               ; 07E5 _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 07EA _ E9, 0000010A

?_010:  mov     dword [esp], timerinfo3.1741            ; 07EF _ C7. 04 24, 00000054(d)
        call    fifo8_status                            ; 07F6 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 07FB _ 85. C0
        je      ?_013                                   ; 07FD _ 0F 84, 000000F6
        mov     dword [esp], timerinfo3.1741            ; 0803 _ C7. 04 24, 00000054(d)
        call    fifo8_get                               ; 080A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 080F _ 89. 45, F4
        call    io_sti                                  ; 0812 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 0817 _ 83. 7D, F4, 00
        jz      ?_011                                   ; 081B _ 74, 24
        mov     dword [esp+8H], 0                       ; 081D _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1741         ; 0825 _ C7. 44 24, 04, 00000054(d)
        mov     eax, dword [ebp-28H]                    ; 082D _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0830 _ 89. 04 24
        call    timer_init                              ; 0833 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-50H], 0                      ; 0838 _ C7. 45, B0, 00000000
        jmp     ?_012                                   ; 083F _ EB, 22

?_011:  mov     dword [esp+8H], 1                       ; 0841 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1741         ; 0849 _ C7. 44 24, 04, 00000054(d)
        mov     eax, dword [ebp-28H]                    ; 0851 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0854 _ 89. 04 24
        call    timer_init                              ; 0857 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-50H], 7                      ; 085C _ C7. 45, B0, 00000007
?_012:  mov     dword [esp+4H], 50                      ; 0863 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 086B _ 8B. 45, D8
        mov     dword [esp], eax                        ; 086E _ 89. 04 24
        call    timer_settime                           ; 0871 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-54H]                    ; 0876 _ 8B. 45, AC
        lea     ebx, [eax+7H]                           ; 0879 _ 8D. 58, 07
        mov     eax, dword [ebp-50H]                    ; 087C _ 8B. 45, B0
        movzx   ecx, al                                 ; 087F _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 0882 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 0887 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 088A _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 088F _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0891 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 0899 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 089D _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-54H]                    ; 08A5 _ 8B. 5D, AC
        mov     dword [esp+0CH], ebx                    ; 08A8 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 08AC _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08B0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08B4 _ 89. 04 24
        call    paint_rectangle                         ; 08B7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-54H]                    ; 08BC _ 8B. 45, AC
        lea     ecx, [eax+8H]                           ; 08BF _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 08C2 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 08C8 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 08CD _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 08D5 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 08D9 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-54H]                    ; 08E1 _ 8B. 4D, AC
        mov     dword [esp+8H], ecx                     ; 08E4 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08E8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08EC _ 89. 04 24
        call    sheet_refresh                           ; 08EF _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 08F4 _ E9, FFFFFAC1

?_013:  jmp     ?_001                                   ; 08F9 _ E9, FFFFFABC
; CMain End of function

task_b_main:; Function begin
        push    ebp                                     ; 08FE _ 55
        mov     ebp, esp                                ; 08FF _ 89. E5
        sub     esp, 104                                ; 0901 _ 83. EC, 68
        mov     eax, dword [ebp+8H]                     ; 0904 _ 8B. 45, 08
        mov     dword [ebp-4CH], eax                    ; 0907 _ 89. 45, B4
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 090A _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 0910 _ 89. 45, F4
        xor     eax, eax                                ; 0913 _ 31. C0
        mov     edx, dword [back_sheet]                 ; 0915 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 091B _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0920 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_211                  ; 0928 _ C7. 44 24, 10, 00000011(d)
        mov     dword [esp+0CH], 160                    ; 0930 _ C7. 44 24, 0C, 000000A0
        mov     dword [esp+8H], 0                       ; 0938 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0940 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0944 _ 89. 04 24
        call    paint_string                            ; 0947 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], 0                      ; 094C _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 0953 _ C7. 45, CC, 00000000
        mov     dword [esp+0CH], 0                      ; 095A _ C7. 44 24, 0C, 00000000
        lea     eax, [ebp-14H]                          ; 0962 _ 8D. 45, EC
        mov     dword [esp+8H], eax                     ; 0965 _ 89. 44 24, 08
        mov     dword [esp+4H], 8                       ; 0969 _ C7. 44 24, 04, 00000008
        lea     eax, [ebp-30H]                          ; 0971 _ 8D. 45, D0
        mov     dword [esp], eax                        ; 0974 _ 89. 04 24
        call    fifo8_init                              ; 0977 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 097C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 0981 _ 89. 45, C8
        mov     dword [esp+8H], 123                     ; 0984 _ C7. 44 24, 08, 0000007B
        lea     eax, [ebp-30H]                          ; 098C _ 8D. 45, D0
        mov     dword [esp+4H], eax                     ; 098F _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 0993 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0996 _ 89. 04 24
        call    timer_init                              ; 0999 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 099E _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 09A6 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 09A9 _ 89. 04 24
        call    timer_settime                           ; 09AC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-40H], 0                      ; 09B1 _ C7. 45, C0, 00000000
        mov     dword [ebp-3CH], 0                      ; 09B8 _ C7. 45, C4, 00000000
?_014:  add     dword [ebp-40H], 1                      ; 09BF _ 83. 45, C0, 01
        call    io_cli                                  ; 09C3 _ E8, FFFFFFFC(rel)
        lea     eax, [ebp-30H]                          ; 09C8 _ 8D. 45, D0
        mov     dword [esp], eax                        ; 09CB _ 89. 04 24
        call    fifo8_status                            ; 09CE _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 09D3 _ 85. C0
        jnz     ?_015                                   ; 09D5 _ 75, 07
        call    io_sti                                  ; 09D7 _ E8, FFFFFFFC(rel)
        jmp     ?_016                                   ; 09DC _ EB, 6B

?_015:  lea     eax, [ebp-30H]                          ; 09DE _ 8D. 45, D0
        mov     dword [esp], eax                        ; 09E1 _ 89. 04 24
        call    fifo8_get                               ; 09E4 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 09E9 _ 89. 45, CC
        call    io_sti                                  ; 09EC _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-34H], 123                    ; 09F1 _ 83. 7D, CC, 7B
        jnz     ?_016                                   ; 09F5 _ 75, 52
        mov     edx, dword [back_sheet]                 ; 09F7 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 09FD _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0A02 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_212                  ; 0A0A _ C7. 44 24, 10, 0000001E(d)
        mov     dword [esp+0CH], 176                    ; 0A12 _ C7. 44 24, 0C, 000000B0
        mov     ecx, dword [ebp-3CH]                    ; 0A1A _ 8B. 4D, C4
        mov     dword [esp+8H], ecx                     ; 0A1D _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0A21 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0A25 _ 89. 04 24
        call    paint_string                            ; 0A28 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0A2D _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-38H]                    ; 0A35 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0A38 _ 89. 04 24
        call    timer_settime                           ; 0A3B _ E8, FFFFFFFC(rel)
        add     dword [ebp-3CH], 8                      ; 0A40 _ 83. 45, C4, 08
        jmp     ?_014                                   ; 0A44 _ E9, FFFFFF76

?_016:  jmp     ?_014                                   ; 0A49 _ E9, FFFFFF71
; task_b_main End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0A4E _ 55
        mov     ebp, esp                                ; 0A4F _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0A51 _ A1, 00000000(d)
        mov     edx, eax                                ; 0A56 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A58 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0A5B _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0A5D _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0A60 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0A66 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 0A69 _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 0A6F _ 5D
        ret                                             ; 0A70 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0A71 _ 55
        mov     ebp, esp                                ; 0A72 _ 89. E5
        sub     esp, 24                                 ; 0A74 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1737          ; 0A77 _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 15                      ; 0A7F _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 0A87 _ C7. 04 24, 00000000
        call    set_palette                             ; 0A8E _ E8, FFFFFFFC(rel)
        nop                                             ; 0A93 _ 90
        leave                                           ; 0A94 _ C9
        ret                                             ; 0A95 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0A96 _ 55
        mov     ebp, esp                                ; 0A97 _ 89. E5
        sub     esp, 40                                 ; 0A99 _ 83. EC, 28
        call    io_load_eflags                          ; 0A9C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0AA1 _ 89. 45, F4
        call    io_cli                                  ; 0AA4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0AA9 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0AAC _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0AB0 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0AB7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0ABC _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0ABF _ 89. 45, F0
        jmp     ?_018                                   ; 0AC2 _ EB, 62

?_017:  mov     eax, dword [ebp+10H]                    ; 0AC4 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0AC7 _ 0F B6. 00
        shr     al, 2                                   ; 0ACA _ C0. E8, 02
        movzx   eax, al                                 ; 0ACD _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0AD0 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0AD4 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0ADB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0AE0 _ 8B. 45, 10
        add     eax, 1                                  ; 0AE3 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0AE6 _ 0F B6. 00
        shr     al, 2                                   ; 0AE9 _ C0. E8, 02
        movzx   eax, al                                 ; 0AEC _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0AEF _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0AF3 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0AFA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0AFF _ 8B. 45, 10
        add     eax, 2                                  ; 0B02 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 0B05 _ 0F B6. 00
        shr     al, 2                                   ; 0B08 _ C0. E8, 02
        movzx   eax, al                                 ; 0B0B _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0B0E _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0B12 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0B19 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0B1E _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0B22 _ 83. 45, F0, 01
?_018:  mov     eax, dword [ebp-10H]                    ; 0B26 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0B29 _ 3B. 45, 0C
        jle     ?_017                                   ; 0B2C _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0B2E _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0B31 _ 89. 04 24
        call    io_store_eflags                         ; 0B34 _ E8, FFFFFFFC(rel)
        nop                                             ; 0B39 _ 90
        leave                                           ; 0B3A _ C9
        ret                                             ; 0B3B _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0B3C _ 55
        mov     ebp, esp                                ; 0B3D _ 89. E5
        sub     esp, 20                                 ; 0B3F _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0B42 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0B45 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0B48 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0B4B _ 89. 45, FC
        jmp     ?_022                                   ; 0B4E _ EB, 33

?_019:  mov     eax, dword [ebp+14H]                    ; 0B50 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0B53 _ 89. 45, F8
        jmp     ?_021                                   ; 0B56 _ EB, 1F

?_020:  mov     eax, dword [ebp-4H]                     ; 0B58 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0B5B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B5F _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0B61 _ 8B. 45, F8
        add     eax, edx                                ; 0B64 _ 01. D0
        mov     edx, eax                                ; 0B66 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B68 _ 8B. 45, 08
        add     edx, eax                                ; 0B6B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0B6D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0B71 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0B73 _ 83. 45, F8, 01
?_021:  mov     eax, dword [ebp-8H]                     ; 0B77 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0B7A _ 3B. 45, 1C
        jle     ?_020                                   ; 0B7D _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0B7F _ 83. 45, FC, 01
?_022:  mov     eax, dword [ebp-4H]                     ; 0B83 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0B86 _ 3B. 45, 20
        jle     ?_019                                   ; 0B89 _ 7E, C5
        leave                                           ; 0B8B _ C9
        ret                                             ; 0B8C _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0B8D _ 55
        mov     ebp, esp                                ; 0B8E _ 89. E5
        push    ebx                                     ; 0B90 _ 53
        sub     esp, 28                                 ; 0B91 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 0B94 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0B97 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0B9A _ 8B. 45, 0C
        sub     eax, 1                                  ; 0B9D _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0BA0 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0BA4 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0BA8 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0BB0 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0BB8 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0BC0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0BC3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0BC7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0BCA _ 89. 04 24
        call    paint_rectangle                         ; 0BCD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0BD2 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0BD5 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0BD8 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0BDB _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0BDE _ 8B. 45, 10
        sub     eax, 28                                 ; 0BE1 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 0BE4 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0BE8 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0BEC _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0BF0 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0BF8 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0C00 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C03 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C07 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C0A _ 89. 04 24
        call    paint_rectangle                         ; 0C0D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C12 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0C15 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0C18 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0C1B _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0C1E _ 8B. 45, 10
        sub     eax, 27                                 ; 0C21 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0C24 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0C28 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0C2C _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0C30 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0C38 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0C40 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C43 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C47 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C4A _ 89. 04 24
        call    paint_rectangle                         ; 0C4D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C52 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0C55 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0C58 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0C5B _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0C5E _ 8B. 45, 10
        sub     eax, 26                                 ; 0C61 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0C64 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0C68 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0C6C _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0C70 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0C78 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0C80 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C83 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C87 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C8A _ 89. 04 24
        call    paint_rectangle                         ; 0C8D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C92 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0C95 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0C98 _ 8B. 45, 10
        sub     eax, 24                                 ; 0C9B _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0C9E _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0CA2 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0CAA _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0CAE _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0CB6 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0CBE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CC1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CC5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CC8 _ 89. 04 24
        call    paint_rectangle                         ; 0CCB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0CD0 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0CD3 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0CD6 _ 8B. 45, 10
        sub     eax, 24                                 ; 0CD9 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0CDC _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0CE0 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0CE8 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0CEC _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 0CF4 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0CFC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CFF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D03 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D06 _ 89. 04 24
        call    paint_rectangle                         ; 0D09 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D0E _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0D11 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0D14 _ 8B. 45, 10
        sub     eax, 4                                  ; 0D17 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0D1A _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0D1E _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0D26 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0D2A _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0D32 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0D3A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D3D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D41 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D44 _ 89. 04 24
        call    paint_rectangle                         ; 0D47 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D4C _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0D4F _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0D52 _ 8B. 45, 10
        sub     eax, 23                                 ; 0D55 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0D58 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0D5C _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0D64 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0D68 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0D70 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0D78 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D7B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D7F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D82 _ 89. 04 24
        call    paint_rectangle                         ; 0D85 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D8A _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0D8D _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0D90 _ 8B. 45, 10
        sub     eax, 3                                  ; 0D93 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0D96 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0D9A _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0DA2 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0DA6 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0DAE _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0DB6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DB9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DBD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DC0 _ 89. 04 24
        call    paint_rectangle                         ; 0DC3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0DC8 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0DCB _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0DCE _ 8B. 45, 10
        sub     eax, 24                                 ; 0DD1 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0DD4 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 0DD8 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0DE0 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 0DE4 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0DEC _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0DF4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DF7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DFB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DFE _ 89. 04 24
        call    paint_rectangle                         ; 0E01 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E06 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0E09 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0E0C _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0E0F _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0E12 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0E15 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0E18 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0E1B _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0E1E _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0E22 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0E26 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0E2A _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0E2E _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0E36 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E39 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E3D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E40 _ 89. 04 24
        call    paint_rectangle                         ; 0E43 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E48 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0E4B _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0E4E _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0E51 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0E54 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0E57 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0E5A _ 8B. 45, 0C
        sub     eax, 47                                 ; 0E5D _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0E60 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0E64 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0E68 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0E6C _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0E70 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0E78 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E7B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E7F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E82 _ 89. 04 24
        call    paint_rectangle                         ; 0E85 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0E8A _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0E8D _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0E90 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0E93 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0E96 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0E99 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0E9C _ 8B. 45, 0C
        sub     eax, 47                                 ; 0E9F _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0EA2 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0EA6 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0EAA _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0EAE _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0EB2 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0EBA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EBD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0EC1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0EC4 _ 89. 04 24
        call    paint_rectangle                         ; 0EC7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0ECC _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0ECF _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0ED2 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0ED5 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0ED8 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0EDB _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0EDE _ 8B. 45, 0C
        sub     eax, 3                                  ; 0EE1 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 0EE4 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0EE8 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0EEC _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0EF0 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0EF4 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0EFC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0EFF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F03 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F06 _ 89. 04 24
        call    paint_rectangle                         ; 0F09 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0F0E _ 83. C4, 1C
        pop     ebx                                     ; 0F11 _ 5B
        pop     ebp                                     ; 0F12 _ 5D
        ret                                             ; 0F13 _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 0F14 _ 55
        mov     ebp, esp                                ; 0F15 _ 89. E5
        sub     esp, 16                                 ; 0F17 _ 83. EC, 10
        movzx   eax, word [?_222]                       ; 0F1A _ 0F B7. 05, 00000184(d)
        cwde                                            ; 0F21 _ 98
        mov     dword [ebp-8H], eax                     ; 0F22 _ 89. 45, F8
        movzx   eax, word [?_223]                       ; 0F25 _ 0F B7. 05, 00000186(d)
        cwde                                            ; 0F2C _ 98
        mov     dword [ebp-4H], eax                     ; 0F2D _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 0F30 _ 8B. 45, F8
        sub     eax, 16                                 ; 0F33 _ 83. E8, 10
        mov     edx, eax                                ; 0F36 _ 89. C2
        shr     edx, 31                                 ; 0F38 _ C1. EA, 1F
        add     eax, edx                                ; 0F3B _ 01. D0
        sar     eax, 1                                  ; 0F3D _ D1. F8
        mov     dword [mouse_x], eax                    ; 0F3F _ A3, 000002A8(d)
        mov     eax, dword [ebp-4H]                     ; 0F44 _ 8B. 45, FC
        sub     eax, 44                                 ; 0F47 _ 83. E8, 2C
        mov     edx, eax                                ; 0F4A _ 89. C2
        shr     edx, 31                                 ; 0F4C _ C1. EA, 1F
        add     eax, edx                                ; 0F4F _ 01. D0
        sar     eax, 1                                  ; 0F51 _ D1. F8
        mov     dword [mouse_y], eax                    ; 0F53 _ A3, 000002AC(d)
        leave                                           ; 0F58 _ C9
        ret                                             ; 0F59 _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0F5A _ 55
        mov     ebp, esp                                ; 0F5B _ 89. E5
        sub     esp, 20                                 ; 0F5D _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 0F60 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 0F63 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0F66 _ C7. 45, FC, 00000000
        jmp     ?_032                                   ; 0F6D _ E9, 0000016E

?_023:  mov     edx, dword [ebp-4H]                     ; 0F72 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 0F75 _ 8B. 45, 18
        add     eax, edx                                ; 0F78 _ 01. D0
        movzx   eax, byte [eax]                         ; 0F7A _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0F7D _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0F80 _ 0F B6. 45, FB
        test    al, al                                  ; 0F84 _ 84. C0
        jns     ?_024                                   ; 0F86 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0F88 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0F8B _ 8B. 55, 14
        add     eax, edx                                ; 0F8E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0F90 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0F94 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0F96 _ 8B. 45, 10
        add     eax, edx                                ; 0F99 _ 01. D0
        mov     edx, eax                                ; 0F9B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F9D _ 8B. 45, 08
        add     edx, eax                                ; 0FA0 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0FA2 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0FA6 _ 88. 02
?_024:  movzx   eax, byte [ebp-5H]                      ; 0FA8 _ 0F B6. 45, FB
        and     eax, 40H                                ; 0FAC _ 83. E0, 40
        test    eax, eax                                ; 0FAF _ 85. C0
        jz      ?_025                                   ; 0FB1 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0FB3 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0FB6 _ 8B. 55, 14
        add     eax, edx                                ; 0FB9 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FBB _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FBF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FC1 _ 8B. 45, 10
        add     eax, edx                                ; 0FC4 _ 01. D0
        lea     edx, [eax+1H]                           ; 0FC6 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0FC9 _ 8B. 45, 08
        add     edx, eax                                ; 0FCC _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0FCE _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0FD2 _ 88. 02
?_025:  movzx   eax, byte [ebp-5H]                      ; 0FD4 _ 0F B6. 45, FB
        and     eax, 20H                                ; 0FD8 _ 83. E0, 20
        test    eax, eax                                ; 0FDB _ 85. C0
        jz      ?_026                                   ; 0FDD _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0FDF _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0FE2 _ 8B. 55, 14
        add     eax, edx                                ; 0FE5 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0FE7 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0FEB _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0FED _ 8B. 45, 10
        add     eax, edx                                ; 0FF0 _ 01. D0
        lea     edx, [eax+2H]                           ; 0FF2 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0FF5 _ 8B. 45, 08
        add     edx, eax                                ; 0FF8 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0FFA _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0FFE _ 88. 02
?_026:  movzx   eax, byte [ebp-5H]                      ; 1000 _ 0F B6. 45, FB
        and     eax, 10H                                ; 1004 _ 83. E0, 10
        test    eax, eax                                ; 1007 _ 85. C0
        jz      ?_027                                   ; 1009 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 100B _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 100E _ 8B. 55, 14
        add     eax, edx                                ; 1011 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1013 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1017 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1019 _ 8B. 45, 10
        add     eax, edx                                ; 101C _ 01. D0
        lea     edx, [eax+3H]                           ; 101E _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 1021 _ 8B. 45, 08
        add     edx, eax                                ; 1024 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1026 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 102A _ 88. 02
?_027:  movzx   eax, byte [ebp-5H]                      ; 102C _ 0F B6. 45, FB
        and     eax, 08H                                ; 1030 _ 83. E0, 08
        test    eax, eax                                ; 1033 _ 85. C0
        jz      ?_028                                   ; 1035 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1037 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 103A _ 8B. 55, 14
        add     eax, edx                                ; 103D _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 103F _ 0F AF. 45, 0C
        mov     edx, eax                                ; 1043 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1045 _ 8B. 45, 10
        add     eax, edx                                ; 1048 _ 01. D0
        lea     edx, [eax+4H]                           ; 104A _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 104D _ 8B. 45, 08
        add     edx, eax                                ; 1050 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1052 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1056 _ 88. 02
?_028:  movzx   eax, byte [ebp-5H]                      ; 1058 _ 0F B6. 45, FB
        and     eax, 04H                                ; 105C _ 83. E0, 04
        test    eax, eax                                ; 105F _ 85. C0
        jz      ?_029                                   ; 1061 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 1063 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1066 _ 8B. 55, 14
        add     eax, edx                                ; 1069 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 106B _ 0F AF. 45, 0C
        mov     edx, eax                                ; 106F _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1071 _ 8B. 45, 10
        add     eax, edx                                ; 1074 _ 01. D0
        lea     edx, [eax+5H]                           ; 1076 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 1079 _ 8B. 45, 08
        add     edx, eax                                ; 107C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 107E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1082 _ 88. 02
?_029:  movzx   eax, byte [ebp-5H]                      ; 1084 _ 0F B6. 45, FB
        and     eax, 02H                                ; 1088 _ 83. E0, 02
        test    eax, eax                                ; 108B _ 85. C0
        jz      ?_030                                   ; 108D _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 108F _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 1092 _ 8B. 55, 14
        add     eax, edx                                ; 1095 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 1097 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 109B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 109D _ 8B. 45, 10
        add     eax, edx                                ; 10A0 _ 01. D0
        lea     edx, [eax+6H]                           ; 10A2 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 10A5 _ 8B. 45, 08
        add     edx, eax                                ; 10A8 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 10AA _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 10AE _ 88. 02
?_030:  movzx   eax, byte [ebp-5H]                      ; 10B0 _ 0F B6. 45, FB
        and     eax, 01H                                ; 10B4 _ 83. E0, 01
        test    eax, eax                                ; 10B7 _ 85. C0
        jz      ?_031                                   ; 10B9 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 10BB _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 10BE _ 8B. 55, 14
        add     eax, edx                                ; 10C1 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 10C3 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 10C7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 10C9 _ 8B. 45, 10
        add     eax, edx                                ; 10CC _ 01. D0
        lea     edx, [eax+7H]                           ; 10CE _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 10D1 _ 8B. 45, 08
        add     edx, eax                                ; 10D4 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 10D6 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 10DA _ 88. 02
?_031:  add     dword [ebp-4H], 1                       ; 10DC _ 83. 45, FC, 01
?_032:  cmp     dword [ebp-4H], 15                      ; 10E0 _ 83. 7D, FC, 0F
        jle     ?_023                                   ; 10E4 _ 0F 8E, FFFFFE88
        leave                                           ; 10EA _ C9
        ret                                             ; 10EB _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 10EC _ 55
        mov     ebp, esp                                ; 10ED _ 89. E5
        push    ebx                                     ; 10EF _ 53
        sub     esp, 52                                 ; 10F0 _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 10F3 _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 10F6 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 10F9 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 10FC _ 89. 45, F4
        jmp     ?_034                                   ; 10FF _ EB, 4B

?_033:  movsx   ecx, byte [ebp-1CH]                     ; 1101 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 1105 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 1108 _ 0F B6. 00
        movsx   eax, al                                 ; 110B _ 0F BE. C0
        shl     eax, 4                                  ; 110E _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 1111 _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 1117 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 111A _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 111D _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1120 _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 1122 _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 1126 _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 112A _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 112D _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 1131 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 1134 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1138 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 113C _ 89. 04 24
        call    paint_font                              ; 113F _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 1144 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 1148 _ 83. 45, 18, 01
?_034:  mov     eax, dword [ebp+18H]                    ; 114C _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 114F _ 0F B6. 00
        test    al, al                                  ; 1152 _ 84. C0
        jnz     ?_033                                   ; 1154 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 1156 _ 8B. 45, 14
        add     eax, 16                                 ; 1159 _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 115C _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 1160 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1163 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 1167 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 116A _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 116E _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 1171 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1175 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1178 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 117C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 117F _ 89. 04 24
        call    sheet_refresh                           ; 1182 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 1187 _ 83. C4, 34
        pop     ebx                                     ; 118A _ 5B
        pop     ebp                                     ; 118B _ 5D
        ret                                             ; 118C _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 118D _ 55
        mov     ebp, esp                                ; 118E _ 89. E5
        sub     esp, 20                                 ; 1190 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1193 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 1196 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 1199 _ C7. 45, F8, 00000000
        jmp     ?_041                                   ; 11A0 _ E9, 0000009C

?_035:  mov     dword [ebp-4H], 0                       ; 11A5 _ C7. 45, FC, 00000000
        jmp     ?_040                                   ; 11AC _ E9, 00000082

?_036:  mov     eax, dword [ebp-8H]                     ; 11B1 _ 8B. 45, F8
        shl     eax, 4                                  ; 11B4 _ C1. E0, 04
        mov     edx, eax                                ; 11B7 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11B9 _ 8B. 45, FC
        add     eax, edx                                ; 11BC _ 01. D0
        add     eax, cursor.1805                        ; 11BE _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 11C3 _ 0F B6. 00
        cmp     al, 42                                  ; 11C6 _ 3C, 2A
        jnz     ?_037                                   ; 11C8 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 11CA _ 8B. 45, F8
        shl     eax, 4                                  ; 11CD _ C1. E0, 04
        mov     edx, eax                                ; 11D0 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11D2 _ 8B. 45, FC
        add     eax, edx                                ; 11D5 _ 01. D0
        mov     edx, eax                                ; 11D7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 11D9 _ 8B. 45, 08
        add     eax, edx                                ; 11DC _ 01. D0
        mov     byte [eax], 0                           ; 11DE _ C6. 00, 00
        jmp     ?_039                                   ; 11E1 _ EB, 4C

?_037:  mov     eax, dword [ebp-8H]                     ; 11E3 _ 8B. 45, F8
        shl     eax, 4                                  ; 11E6 _ C1. E0, 04
        mov     edx, eax                                ; 11E9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 11EB _ 8B. 45, FC
        add     eax, edx                                ; 11EE _ 01. D0
        add     eax, cursor.1805                        ; 11F0 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 11F5 _ 0F B6. 00
        cmp     al, 79                                  ; 11F8 _ 3C, 4F
        jnz     ?_038                                   ; 11FA _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 11FC _ 8B. 45, F8
        shl     eax, 4                                  ; 11FF _ C1. E0, 04
        mov     edx, eax                                ; 1202 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1204 _ 8B. 45, FC
        add     eax, edx                                ; 1207 _ 01. D0
        mov     edx, eax                                ; 1209 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 120B _ 8B. 45, 08
        add     eax, edx                                ; 120E _ 01. D0
        mov     byte [eax], 7                           ; 1210 _ C6. 00, 07
        jmp     ?_039                                   ; 1213 _ EB, 1A

?_038:  mov     eax, dword [ebp-8H]                     ; 1215 _ 8B. 45, F8
        shl     eax, 4                                  ; 1218 _ C1. E0, 04
        mov     edx, eax                                ; 121B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 121D _ 8B. 45, FC
        add     eax, edx                                ; 1220 _ 01. D0
        mov     edx, eax                                ; 1222 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1224 _ 8B. 45, 08
        add     edx, eax                                ; 1227 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1229 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 122D _ 88. 02
?_039:  add     dword [ebp-4H], 1                       ; 122F _ 83. 45, FC, 01
?_040:  cmp     dword [ebp-4H], 15                      ; 1233 _ 83. 7D, FC, 0F
        jle     ?_036                                   ; 1237 _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 123D _ 83. 45, F8, 01
?_041:  cmp     dword [ebp-8H], 15                      ; 1241 _ 83. 7D, F8, 0F
        jle     ?_035                                   ; 1245 _ 0F 8E, FFFFFF5A
        leave                                           ; 124B _ C9
        ret                                             ; 124C _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 124D _ 55
        mov     ebp, esp                                ; 124E _ 89. E5
        sub     esp, 16                                 ; 1250 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1253 _ C7. 45, F8, 00000000
        jmp     ?_045                                   ; 125A _ EB, 50

?_042:  mov     dword [ebp-4H], 0                       ; 125C _ C7. 45, FC, 00000000
        jmp     ?_044                                   ; 1263 _ EB, 3B

?_043:  mov     eax, dword [ebp-8H]                     ; 1265 _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 1268 _ 8B. 55, 14
        add     eax, edx                                ; 126B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 126D _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 1271 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 1274 _ 8B. 4D, 10
        add     edx, ecx                                ; 1277 _ 01. CA
        add     eax, edx                                ; 1279 _ 01. D0
        mov     edx, eax                                ; 127B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 127D _ 8B. 45, 08
        add     edx, eax                                ; 1280 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 1282 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 1285 _ 0F AF. 45, 18
        mov     ecx, eax                                ; 1289 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 128B _ 8B. 45, FC
        add     eax, ecx                                ; 128E _ 01. C8
        mov     ecx, eax                                ; 1290 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 1292 _ 8B. 45, 20
        add     eax, ecx                                ; 1295 _ 01. C8
        movzx   eax, byte [eax]                         ; 1297 _ 0F B6. 00
        mov     byte [edx], al                          ; 129A _ 88. 02
        add     dword [ebp-4H], 1                       ; 129C _ 83. 45, FC, 01
?_044:  mov     eax, dword [ebp-4H]                     ; 12A0 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 12A3 _ 3B. 45, 18
        jl      ?_043                                   ; 12A6 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 12A8 _ 83. 45, F8, 01
?_045:  mov     eax, dword [ebp-8H]                     ; 12AC _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 12AF _ 3B. 45, 1C
        jl      ?_042                                   ; 12B2 _ 7C, A8
        leave                                           ; 12B4 _ C9
        ret                                             ; 12B5 _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 12B6 _ 55
        mov     ebp, esp                                ; 12B7 _ 89. E5
        sub     esp, 24                                 ; 12B9 _ 83. EC, 18
        mov     dword [esp+0CH], 0                      ; 12BC _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], mousebuf                ; 12C4 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 12CC _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 12D4 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 12DB _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 12E0 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], keybuf                  ; 12E8 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 12F0 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 12F8 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 12FF _ E8, FFFFFFFC(rel)
        leave                                           ; 1304 _ C9
        ret                                             ; 1305 _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 1306 _ 55
        mov     ebp, esp                                ; 1307 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 1309 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 130C _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 130F _ A1, 000002A8(d)
        add     eax, edx                                ; 1314 _ 01. D0
        mov     dword [mouse_x], eax                    ; 1316 _ A3, 000002A8(d)
        mov     eax, dword [ebp+10H]                    ; 131B _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 131E _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 1321 _ A1, 000002AC(d)
        add     eax, edx                                ; 1326 _ 01. D0
        mov     dword [mouse_y], eax                    ; 1328 _ A3, 000002AC(d)
        mov     eax, dword [mouse_x]                    ; 132D _ A1, 000002A8(d)
        test    eax, eax                                ; 1332 _ 85. C0
        jns     ?_046                                   ; 1334 _ 79, 0A
        mov     dword [mouse_x], 0                      ; 1336 _ C7. 05, 000002A8(d), 00000000
?_046:  mov     eax, dword [mouse_y]                    ; 1340 _ A1, 000002AC(d)
        test    eax, eax                                ; 1345 _ 85. C0
        jns     ?_047                                   ; 1347 _ 79, 0A
        mov     dword [mouse_y], 0                      ; 1349 _ C7. 05, 000002AC(d), 00000000
?_047:  movzx   eax, word [?_222]                       ; 1353 _ 0F B7. 05, 00000184(d)
        cwde                                            ; 135A _ 98
        lea     edx, [eax-10H]                          ; 135B _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 135E _ A1, 000002A8(d)
        cmp     edx, eax                                ; 1363 _ 39. C2
        jge     ?_048                                   ; 1365 _ 7D, 10
        movzx   eax, word [?_222]                       ; 1367 _ 0F B7. 05, 00000184(d)
        cwde                                            ; 136E _ 98
        sub     eax, 16                                 ; 136F _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 1372 _ A3, 000002A8(d)
?_048:  movzx   eax, word [?_222]                       ; 1377 _ 0F B7. 05, 00000184(d)
        cwde                                            ; 137E _ 98
        lea     edx, [eax-10H]                          ; 137F _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 1382 _ A1, 000002AC(d)
        cmp     edx, eax                                ; 1387 _ 39. C2
        jge     ?_049                                   ; 1389 _ 7D, 10
        movzx   eax, word [?_222]                       ; 138B _ 0F B7. 05, 00000184(d)
        cwde                                            ; 1392 _ 98
        sub     eax, 16                                 ; 1393 _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 1396 _ A3, 000002AC(d)
?_049:  pop     ebp                                     ; 139B _ 5D
        ret                                             ; 139C _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 139D _ 55
        mov     ebp, esp                                ; 139E _ 89. E5
        sub     esp, 40                                 ; 13A0 _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 13A3 _ C6. 45, F7, 00
        call    io_sti                                  ; 13A7 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 13AC _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 13B3 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 13B8 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 13BB _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 13BF _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 13C3 _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 13CA _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 13CF _ 85. C0
        jz      ?_050                                   ; 13D1 _ 74, 77
        mov     dword [esp+8H], mouse_send_info         ; 13D3 _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 13DB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 13DE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13E2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13E5 _ 89. 04 24
        call    compute_mouse_position                  ; 13E8 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 13ED _ 8B. 15, 000002AC(d)
        mov     eax, dword [mouse_x]                    ; 13F3 _ A1, 000002A8(d)
        mov     dword [esp+0CH], edx                    ; 13F8 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 13FC _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 1400 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 1403 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1407 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 140A _ 89. 04 24
        call    sheet_slide                             ; 140D _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_send_info+0CH]        ; 1412 _ A1, 0000000C(d)
        and     eax, 01H                                ; 1417 _ 83. E0, 01
        test    eax, eax                                ; 141A _ 85. C0
        jz      ?_050                                   ; 141C _ 74, 2C
        mov     eax, dword [mouse_y]                    ; 141E _ A1, 000002AC(d)
        lea     ecx, [eax-8H]                           ; 1423 _ 8D. 48, F8
        mov     eax, dword [mouse_x]                    ; 1426 _ A1, 000002A8(d)
        lea     edx, [eax-50H]                          ; 142B _ 8D. 50, B0
        mov     eax, dword [sheet_win]                  ; 142E _ A1, 000002A4(d)
        mov     dword [esp+0CH], ecx                    ; 1433 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1437 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 143B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 143F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1442 _ 89. 04 24
        call    sheet_slide                             ; 1445 _ E8, FFFFFFFC(rel)
?_050:  leave                                           ; 144A _ C9
        ret                                             ; 144B _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 144C _ 55
        mov     ebp, esp                                ; 144D _ 89. E5
        sub     esp, 88                                 ; 144F _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 1452 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 1459 _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 1460 _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 1467 _ A1, 00000180(d)
        mov     dword [ebp-2CH], eax                    ; 146C _ 89. 45, D4
        movzx   eax, word [?_222]                       ; 146F _ 0F B7. 05, 00000184(d)
        cwde                                            ; 1476 _ 98
        mov     dword [ebp-28H], eax                    ; 1477 _ 89. 45, D8
        movzx   eax, word [?_223]                       ; 147A _ 0F B7. 05, 00000186(d)
        cwde                                            ; 1481 _ 98
        mov     dword [ebp-24H], eax                    ; 1482 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 1485 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1488 _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 148A _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 148D _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 1491 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 1494 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1498 _ 89. 04 24
        call    init_desktop                            ; 149B _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 14A0 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_213                  ; 14A8 _ C7. 44 24, 10, 00000020(d)
        mov     eax, dword [ebp-34H]                    ; 14B0 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 14B3 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 14B7 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 14BA _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14BE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14C1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14C5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14C8 _ 89. 04 24
        call    paint_string                            ; 14CB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 14D0 _ 8B. 45, 14
        mov     dword [esp], eax                        ; 14D3 _ 89. 04 24
        call    intToHexStr                             ; 14D6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 14DB _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 14DE _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 14E6 _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 14E9 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 14ED _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 14F0 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 14F4 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 14F7 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14FB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14FE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1502 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1505 _ 89. 04 24
        call    paint_string                            ; 1508 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 150D _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1511 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_214                  ; 1519 _ C7. 44 24, 10, 0000002A(d)
        mov     eax, dword [ebp-34H]                    ; 1521 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1524 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1528 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 152B _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 152F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1532 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1536 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1539 _ 89. 04 24
        call    paint_string                            ; 153C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1541 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1544 _ 8B. 00
        mov     dword [esp], eax                        ; 1546 _ 89. 04 24
        call    intToHexStr                             ; 1549 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 154E _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 1551 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 1559 _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 155C _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1560 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1563 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1567 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 156A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 156E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1571 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1575 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1578 _ 89. 04 24
        call    paint_string                            ; 157B _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1580 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1584 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_215                  ; 158C _ C7. 44 24, 10, 00000036(d)
        mov     eax, dword [ebp-34H]                    ; 1594 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1597 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 159B _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 159E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15A2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 15A5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 15A9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 15AC _ 89. 04 24
        call    paint_string                            ; 15AF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 15B4 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 15B7 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 15BA _ 89. 04 24
        call    intToHexStr                             ; 15BD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 15C2 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 15C5 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 15CD _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 15D0 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 15D4 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 15D7 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 15DB _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 15DE _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15E2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 15E5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 15E9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 15EC _ 89. 04 24
        call    paint_string                            ; 15EF _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 15F4 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 15F8 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_216                  ; 1600 _ C7. 44 24, 10, 00000042(d)
        mov     eax, dword [ebp-34H]                    ; 1608 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 160B _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 160F _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1612 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1616 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1619 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 161D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1620 _ 89. 04 24
        call    paint_string                            ; 1623 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1628 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 162B _ 8B. 40, 08
        mov     dword [esp], eax                        ; 162E _ 89. 04 24
        call    intToHexStr                             ; 1631 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1636 _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 1639 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 1641 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 1644 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1648 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 164B _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 164F _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1652 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1656 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1659 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 165D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1660 _ 89. 04 24
        call    paint_string                            ; 1663 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1668 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 166C _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_217                  ; 1674 _ C7. 44 24, 10, 0000004E(d)
        mov     eax, dword [ebp-34H]                    ; 167C _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 167F _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1683 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1686 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 168A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 168D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1691 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1694 _ 89. 04 24
        call    paint_string                            ; 1697 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 169C _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 169F _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 16A2 _ 89. 04 24
        call    intToHexStr                             ; 16A5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 16AA _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 16AD _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 16B5 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 16B8 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 16BC _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 16BF _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 16C3 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 16C6 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 16CA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 16CD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16D1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16D4 _ 89. 04 24
        call    paint_string                            ; 16D7 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 16DC _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 16E0 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_218                  ; 16E8 _ C7. 44 24, 10, 0000005B(d)
        mov     eax, dword [ebp-34H]                    ; 16F0 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 16F3 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 16F7 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 16FA _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 16FE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1701 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1705 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1708 _ 89. 04 24
        call    paint_string                            ; 170B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1710 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 1713 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 1716 _ 89. 04 24
        call    intToHexStr                             ; 1719 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 171E _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 1721 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 1729 _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 172C _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1730 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1733 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1737 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 173A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 173E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1741 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1745 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1748 _ 89. 04 24
        call    paint_string                            ; 174B _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1750 _ 83. 45, CC, 10
        leave                                           ; 1754 _ C9
        ret                                             ; 1755 _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 1756 _ 55
        mov     ebp, esp                                ; 1757 _ 89. E5
        sub     esp, 56                                 ; 1759 _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 175C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 175F _ 89. 04 24
        call    sheet_alloc                             ; 1762 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1767 _ 89. 45, F0
        mov     eax, dword [memman]                     ; 176A _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 176F _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 1777 _ 89. 04 24
        call    memman_alloc_4k                         ; 177A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 177F _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 1782 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 178A _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 1792 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 179A _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 179D _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 17A1 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 17A4 _ 89. 04 24
        call    sheet_setbuf                            ; 17A7 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 1                      ; 17AC _ C7. 44 24, 0C, 00000001
        mov     eax, dword [ebp+0CH]                    ; 17B4 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 17B7 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 17BB _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 17BE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 17C2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 17C5 _ 89. 04 24
        call    make_windows                            ; 17C8 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 17CD _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 17D5 _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 17DD _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 17E5 _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 17ED _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-10H]                    ; 17F5 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 17F8 _ 89. 04 24
        call    make_textbox                            ; 17FB _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 172                    ; 1800 _ C7. 44 24, 0C, 000000AC
        mov     dword [esp+8H], 260                     ; 1808 _ C7. 44 24, 08, 00000104
        mov     eax, dword [ebp-10H]                    ; 1810 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1813 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1817 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 181A _ 89. 04 24
        call    sheet_slide                             ; 181D _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 1822 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 182A _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 182D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1831 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1834 _ 89. 04 24
        call    sheet_updown                            ; 1837 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 183C _ 8B. 45, F0
        leave                                           ; 183F _ C9
        ret                                             ; 1840 _ C3
; message_box End of function

make_textbox:; Function begin
        push    ebp                                     ; 1841 _ 55
        mov     ebp, esp                                ; 1842 _ 89. E5
        push    edi                                     ; 1844 _ 57
        push    esi                                     ; 1845 _ 56
        push    ebx                                     ; 1846 _ 53
        sub     esp, 44                                 ; 1847 _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 184A _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 184D _ 8B. 55, 0C
        add     eax, edx                                ; 1850 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1852 _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 1855 _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 1858 _ 8B. 55, 10
        add     eax, edx                                ; 185B _ 01. D0
        mov     dword [ebp-10H], eax                    ; 185D _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1860 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 1863 _ 8D. 78, FD
        mov     eax, dword [ebp-14H]                    ; 1866 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1869 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 186C _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 186F _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1872 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 1875 _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 1878 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 187B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 187E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1881 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1883 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1887 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 188B _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 188F _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 1893 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 189B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 189F _ 89. 04 24
        call    paint_rectangle                         ; 18A2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 18A7 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 18AA _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 18AD _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 18B0 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 18B3 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 18B6 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 18B9 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 18BC _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 18BF _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 18C2 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18C5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18C8 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 18CA _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 18CE _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 18D2 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 18D6 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 18DA _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 18E2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18E6 _ 89. 04 24
        call    paint_rectangle                         ; 18E9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 18EE _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 18F1 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 18F4 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 18F7 _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 18FA _ 8B. 45, F0
        lea     ebx, [eax+2H]                           ; 18FD _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 1900 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1903 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1906 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1909 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 190C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 190F _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1911 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1915 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1919 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 191D _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 1921 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 1929 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 192D _ 89. 04 24
        call    paint_rectangle                         ; 1930 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1935 _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 1938 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 193B _ 8B. 45, EC
        lea     esi, [eax+2H]                           ; 193E _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1941 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1944 _ 8D. 58, FD
        mov     eax, dword [ebp-14H]                    ; 1947 _ 8B. 45, EC
        lea     ecx, [eax+2H]                           ; 194A _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 194D _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1950 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1953 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1956 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1958 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 195C _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1960 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1964 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 1968 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 1970 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1974 _ 89. 04 24
        call    paint_rectangle                         ; 1977 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 197C _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 197F _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 1982 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 1985 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 1988 _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 198B _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 198E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1991 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1994 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1997 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1999 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 199D _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 19A0 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 19A4 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 19A8 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 19AC _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 19B4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19B8 _ 89. 04 24
        call    paint_rectangle                         ; 19BB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 19C0 _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 19C3 _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 19C6 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 19C9 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 19CC _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 19CF _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 19D2 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 19D5 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 19D8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 19DB _ 8B. 00
        mov     ecx, dword [ebp-10H]                    ; 19DD _ 8B. 4D, F0
        mov     dword [esp+18H], ecx                    ; 19E0 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 19E4 _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 19E8 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 19EC _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 19F0 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 19F8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19FC _ 89. 04 24
        call    paint_rectangle                         ; 19FF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1A04 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 1A07 _ 8D. 48, 01
        mov     eax, dword [ebp-10H]                    ; 1A0A _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 1A0D _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 1A10 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 1A13 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 1A16 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A19 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A1C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A1F _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1A21 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 1A25 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 1A28 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1A2C _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1A30 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 1A34 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1A3C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A40 _ 89. 04 24
        call    paint_rectangle                         ; 1A43 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1A48 _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1A4B _ 8D. 78, 01
        mov     eax, dword [ebp-14H]                    ; 1A4E _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1A51 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1A54 _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 1A57 _ 8D. 58, FE
        mov     eax, dword [ebp-14H]                    ; 1A5A _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 1A5D _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1A60 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A63 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A66 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1A69 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1A6B _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1A6F _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1A73 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1A77 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 1A7B _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1A83 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A87 _ 89. 04 24
        call    paint_rectangle                         ; 1A8A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1A8F _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 1A92 _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 1A95 _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 1A98 _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 1A9B _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1A9E _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1AA1 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1AA4 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1AA7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1AAA _ 8B. 00
        mov     ebx, dword [ebp-10H]                    ; 1AAC _ 8B. 5D, F0
        mov     dword [esp+18H], ebx                    ; 1AAF _ 89. 5C 24, 18
        mov     ebx, dword [ebp-14H]                    ; 1AB3 _ 8B. 5D, EC
        mov     dword [esp+14H], ebx                    ; 1AB6 _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 1ABA _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 1ABE _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 1AC2 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1AC6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1ACA _ 89. 04 24
        call    paint_rectangle                         ; 1ACD _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 1AD2 _ 83. C4, 2C
        pop     ebx                                     ; 1AD5 _ 5B
        pop     esi                                     ; 1AD6 _ 5E
        pop     edi                                     ; 1AD7 _ 5F
        pop     ebp                                     ; 1AD8 _ 5D
        ret                                             ; 1AD9 _ C3
; make_textbox End of function

make_windows:; Function begin
        push    ebp                                     ; 1ADA _ 55
        mov     ebp, esp                                ; 1ADB _ 89. E5
        push    ebx                                     ; 1ADD _ 53
        sub     esp, 52                                 ; 1ADE _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 1AE1 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1AE4 _ 88. 45, E4
        mov     eax, dword [ebp+0CH]                    ; 1AE7 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1AEA _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 1AED _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 1AF0 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 1AF3 _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 1AF6 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 1AF9 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1AFC _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1AFF _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B02 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 1B04 _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 1B0C _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 1B10 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1B18 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1B20 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1B28 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B2B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B2F _ 89. 04 24
        call    paint_rectangle                         ; 1B32 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1B37 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1B3A _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1B3D _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B40 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 1B42 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 1B4A _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 1B4E _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1B56 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1B5E _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1B66 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B69 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B6D _ 89. 04 24
        call    paint_rectangle                         ; 1B70 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1B75 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1B78 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1B7B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B7E _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1B80 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 1B84 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 1B8C _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1B94 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1B9C _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1BA4 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1BA7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BAB _ 89. 04 24
        call    paint_rectangle                         ; 1BAE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1BB3 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1BB6 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1BB9 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BBC _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1BBE _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 1BC2 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 1BCA _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1BD2 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1BDA _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1BE2 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1BE5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BE9 _ 89. 04 24
        call    paint_rectangle                         ; 1BEC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1BF1 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1BF4 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1BF7 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1BFA _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1BFD _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1C00 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1C03 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C06 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1C08 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1C0C _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 1C10 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 1C18 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 1C1C _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1C24 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C27 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C2B _ 89. 04 24
        call    paint_rectangle                         ; 1C2E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1C33 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1C36 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1C39 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1C3C _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1C3F _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1C42 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1C45 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C48 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1C4A _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1C4E _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 1C52 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 1C5A _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 1C5E _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1C66 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C69 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C6D _ 89. 04 24
        call    paint_rectangle                         ; 1C70 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1C75 _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1C78 _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1C7B _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1C7E _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1C81 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1C84 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1C86 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1C8A _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 1C8E _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 1C96 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 1C9E _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1CA6 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1CA9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CAD _ 89. 04 24
        call    paint_rectangle                         ; 1CB0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1CB5 _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1CB8 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1CBB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1CBE _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1CC0 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1CC8 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 1CCC _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1CD4 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 1CDC _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 1CE4 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1CE7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1CEB _ 89. 04 24
        call    paint_rectangle                         ; 1CEE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1CF3 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1CF6 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1CF9 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1CFC _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1CFF _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1D02 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1D05 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D08 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1D0A _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1D0E _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1D12 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 1D16 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 1D1E _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1D26 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D29 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D2D _ 89. 04 24
        call    paint_rectangle                         ; 1D30 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1D35 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1D38 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1D3B _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1D3E _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1D41 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1D44 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1D47 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1D4A _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1D4C _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1D50 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1D54 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 1D58 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 1D60 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1D68 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1D6B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1D6F _ 89. 04 24
        call    paint_rectangle                         ; 1D72 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-1CH]                     ; 1D77 _ 0F BE. 45, E4
        mov     dword [esp+0CH], eax                    ; 1D7B _ 89. 44 24, 0C
        mov     eax, dword [ebp+10H]                    ; 1D7F _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 1D82 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1D86 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1D89 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1D8D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1D90 _ 89. 04 24
        call    make_window_title                       ; 1D93 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 1D98 _ 83. C4, 34
        pop     ebx                                     ; 1D9B _ 5B
        pop     ebp                                     ; 1D9C _ 5D
        ret                                             ; 1D9D _ C3
; make_windows End of function

make_window_title:; Function begin
        push    ebp                                     ; 1D9E _ 55
        mov     ebp, esp                                ; 1D9F _ 89. E5
        push    ebx                                     ; 1DA1 _ 53
        sub     esp, 52                                 ; 1DA2 _ 83. EC, 34
        mov     eax, dword [ebp+14H]                    ; 1DA5 _ 8B. 45, 14
        mov     byte [ebp-1CH], al                      ; 1DA8 _ 88. 45, E4
        cmp     byte [ebp-1CH], 0                       ; 1DAB _ 80. 7D, E4, 00
        jz      ?_051                                   ; 1DAF _ 74, 0A
        mov     byte [ebp-12H], 7                       ; 1DB1 _ C6. 45, EE, 07
        mov     byte [ebp-11H], 12                      ; 1DB5 _ C6. 45, EF, 0C
        jmp     ?_052                                   ; 1DB9 _ EB, 08

?_051:  mov     byte [ebp-12H], 8                       ; 1DBB _ C6. 45, EE, 08
        mov     byte [ebp-11H], 15                      ; 1DBF _ C6. 45, EF, 0F
?_052:  mov     eax, dword [ebp+0CH]                    ; 1DC3 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1DC6 _ 8B. 40, 04
        lea     ebx, [eax-4H]                           ; 1DC9 _ 8D. 58, FC
        movzx   eax, byte [ebp-11H]                     ; 1DCC _ 0F B6. 45, EF
        movzx   ecx, al                                 ; 1DD0 _ 0F B6. C8
        mov     eax, dword [ebp+0CH]                    ; 1DD3 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 1DD6 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 1DD9 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1DDC _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1DDE _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], ebx                    ; 1DE6 _ 89. 5C 24, 14
        mov     dword [esp+10H], 3                      ; 1DEA _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1DF2 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], ecx                     ; 1DFA _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1DFE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1E02 _ 89. 04 24
        call    paint_rectangle                         ; 1E05 _ E8, FFFFFFFC(rel)
        movsx   eax, byte [ebp-12H]                     ; 1E0A _ 0F BE. 45, EE
        mov     dword [esp+14H], eax                    ; 1E0E _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 1E12 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1E15 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 1E19 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 1E21 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 1E29 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1E2C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1E30 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1E33 _ 89. 04 24
        call    paint_string                            ; 1E36 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], 0                      ; 1E3B _ C7. 45, F4, 00000000
        jmp     ?_060                                   ; 1E42 _ E9, 00000083

?_053:  mov     dword [ebp-10H], 0                      ; 1E47 _ C7. 45, F0, 00000000
        jmp     ?_059                                   ; 1E4E _ EB, 70

?_054:  mov     eax, dword [ebp-0CH]                    ; 1E50 _ 8B. 45, F4
        shl     eax, 4                                  ; 1E53 _ C1. E0, 04
        mov     edx, eax                                ; 1E56 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 1E58 _ 8B. 45, F0
        add     eax, edx                                ; 1E5B _ 01. D0
        add     eax, closebtn.1892                      ; 1E5D _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 1E62 _ 0F B6. 00
        mov     byte [ebp-13H], al                      ; 1E65 _ 88. 45, ED
        cmp     byte [ebp-13H], 64                      ; 1E68 _ 80. 7D, ED, 40
        jnz     ?_055                                   ; 1E6C _ 75, 06
        mov     byte [ebp-13H], 0                       ; 1E6E _ C6. 45, ED, 00
        jmp     ?_058                                   ; 1E72 _ EB, 1C

?_055:  cmp     byte [ebp-13H], 36                      ; 1E74 _ 80. 7D, ED, 24
        jnz     ?_056                                   ; 1E78 _ 75, 06
        mov     byte [ebp-13H], 15                      ; 1E7A _ C6. 45, ED, 0F
        jmp     ?_058                                   ; 1E7E _ EB, 10

?_056:  cmp     byte [ebp-13H], 81                      ; 1E80 _ 80. 7D, ED, 51
        jnz     ?_057                                   ; 1E84 _ 75, 06
        mov     byte [ebp-13H], 8                       ; 1E86 _ C6. 45, ED, 08
        jmp     ?_058                                   ; 1E8A _ EB, 04

?_057:  mov     byte [ebp-13H], 7                       ; 1E8C _ C6. 45, ED, 07
?_058:  mov     eax, dword [ebp+0CH]                    ; 1E90 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1E93 _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 1E95 _ 8B. 45, F4
        lea     ecx, [eax+5H]                           ; 1E98 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1E9B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1E9E _ 8B. 40, 04
        imul    ecx, eax                                ; 1EA1 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1EA4 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1EA7 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1EAA _ 8D. 58, EB
        mov     eax, dword [ebp-10H]                    ; 1EAD _ 8B. 45, F0
        add     eax, ebx                                ; 1EB0 _ 01. D8
        add     eax, ecx                                ; 1EB2 _ 01. C8
        add     edx, eax                                ; 1EB4 _ 01. C2
        movzx   eax, byte [ebp-13H]                     ; 1EB6 _ 0F B6. 45, ED
        mov     byte [edx], al                          ; 1EBA _ 88. 02
        add     dword [ebp-10H], 1                      ; 1EBC _ 83. 45, F0, 01
?_059:  cmp     dword [ebp-10H], 15                     ; 1EC0 _ 83. 7D, F0, 0F
        jle     ?_054                                   ; 1EC4 _ 7E, 8A
        add     dword [ebp-0CH], 1                      ; 1EC6 _ 83. 45, F4, 01
?_060:  cmp     dword [ebp-0CH], 13                     ; 1ECA _ 83. 7D, F4, 0D
        jle     ?_053                                   ; 1ECE _ 0F 8E, FFFFFF73
        add     esp, 52                                 ; 1ED4 _ 83. C4, 34
        pop     ebx                                     ; 1ED7 _ 5B
        pop     ebp                                     ; 1ED8 _ 5D
        ret                                             ; 1ED9 _ C3
; make_window_title End of function

console_task:; Function begin
        push    ebp                                     ; 1EDA _ 55
        mov     ebp, esp                                ; 1EDB _ 89. E5
        push    ebx                                     ; 1EDD _ 53
        sub     esp, 228                                ; 1EDE _ 81. EC, 000000E4
        mov     eax, dword [ebp+8H]                     ; 1EE4 _ 8B. 45, 08
        mov     dword [ebp-0CCH], eax                   ; 1EE7 _ 89. 85, FFFFFF34
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 1EED _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 1EF3 _ 89. 45, F4
        xor     eax, eax                                ; 1EF6 _ 31. C0
        call    task_now                                ; 1EF8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0B8H], eax                   ; 1EFD _ 89. 85, FFFFFF48
        mov     dword [ebp-0B4H], 8                     ; 1F03 _ C7. 85, FFFFFF4C, 00000008
        mov     dword [ebp-0BCH], 0                     ; 1F0D _ C7. 85, FFFFFF44, 00000000
        mov     eax, dword [ebp-0B8H]                   ; 1F17 _ 8B. 85, FFFFFF48
        mov     dword [esp+0CH], eax                    ; 1F1D _ 89. 44 24, 0C
        lea     eax, [ebp-8CH]                          ; 1F21 _ 8D. 85, FFFFFF74
        mov     dword [esp+8H], eax                     ; 1F27 _ 89. 44 24, 08
        mov     dword [esp+4H], 128                     ; 1F2B _ C7. 44 24, 04, 00000080
        lea     eax, [ebp-0A8H]                         ; 1F33 _ 8D. 85, FFFFFF58
        mov     dword [esp], eax                        ; 1F39 _ 89. 04 24
        call    fifo8_init                              ; 1F3C _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 1F41 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0B0H], eax                   ; 1F46 _ 89. 85, FFFFFF50
        mov     dword [esp+8H], 1                       ; 1F4C _ C7. 44 24, 08, 00000001
        lea     eax, [ebp-0A8H]                         ; 1F54 _ 8D. 85, FFFFFF58
        mov     dword [esp+4H], eax                     ; 1F5A _ 89. 44 24, 04
        mov     eax, dword [ebp-0B0H]                   ; 1F5E _ 8B. 85, FFFFFF50
        mov     dword [esp], eax                        ; 1F64 _ 89. 04 24
        call    timer_init                              ; 1F67 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 1F6C _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0B0H]                   ; 1F74 _ 8B. 85, FFFFFF50
        mov     dword [esp], eax                        ; 1F7A _ 89. 04 24
        call    timer_settime                           ; 1F7D _ E8, FFFFFFFC(rel)
?_061:  call    io_cli                                  ; 1F82 _ E8, FFFFFFFC(rel)
        lea     eax, [ebp-0A8H]                         ; 1F87 _ 8D. 85, FFFFFF58
        mov     dword [esp], eax                        ; 1F8D _ 89. 04 24
        call    fifo8_status                            ; 1F90 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1F95 _ 85. C0
        jnz     ?_062                                   ; 1F97 _ 75, 0A
        call    io_sti                                  ; 1F99 _ E8, FFFFFFFC(rel)
        jmp     ?_065                                   ; 1F9E _ E9, 0000012F

?_062:  lea     eax, [ebp-0A8H]                         ; 1FA3 _ 8D. 85, FFFFFF58
        mov     dword [esp], eax                        ; 1FA9 _ 89. 04 24
        call    fifo8_get                               ; 1FAC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0ACH], eax                   ; 1FB1 _ 89. 85, FFFFFF54
        call    io_sti                                  ; 1FB7 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0ACH], 1                     ; 1FBC _ 83. BD, FFFFFF54, 01
        jg      ?_065                                   ; 1FC3 _ 0F 8F, 00000109
        cmp     dword [ebp-0ACH], 0                     ; 1FC9 _ 83. BD, FFFFFF54, 00
        jz      ?_063                                   ; 1FD0 _ 74, 2C
        mov     dword [esp+8H], 0                       ; 1FD2 _ C7. 44 24, 08, 00000000
        lea     eax, [ebp-0A8H]                         ; 1FDA _ 8D. 85, FFFFFF58
        mov     dword [esp+4H], eax                     ; 1FE0 _ 89. 44 24, 04
        mov     eax, dword [ebp-0B0H]                   ; 1FE4 _ 8B. 85, FFFFFF50
        mov     dword [esp], eax                        ; 1FEA _ 89. 04 24
        call    timer_init                              ; 1FED _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0BCH], 7                     ; 1FF2 _ C7. 85, FFFFFF44, 00000007
        jmp     ?_064                                   ; 1FFC _ EB, 2A

?_063:  mov     dword [esp+8H], 1                       ; 1FFE _ C7. 44 24, 08, 00000001
        lea     eax, [ebp-0A8H]                         ; 2006 _ 8D. 85, FFFFFF58
        mov     dword [esp+4H], eax                     ; 200C _ 89. 44 24, 04
        mov     eax, dword [ebp-0B0H]                   ; 2010 _ 8B. 85, FFFFFF50
        mov     dword [esp], eax                        ; 2016 _ 89. 04 24
        call    timer_init                              ; 2019 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0BCH], 0                     ; 201E _ C7. 85, FFFFFF44, 00000000
?_064:  mov     dword [esp+4H], 50                      ; 2028 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-0B0H]                   ; 2030 _ 8B. 85, FFFFFF50
        mov     dword [esp], eax                        ; 2036 _ 89. 04 24
        call    timer_settime                           ; 2039 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0B4H]                   ; 203E _ 8B. 85, FFFFFF4C
        lea     ebx, [eax+7H]                           ; 2044 _ 8D. 58, 07
        mov     eax, dword [ebp-0BCH]                   ; 2047 _ 8B. 85, FFFFFF44
        movzx   ecx, al                                 ; 204D _ 0F B6. C8
        mov     eax, dword [ebp-0CCH]                   ; 2050 _ 8B. 85, FFFFFF34
        mov     edx, dword [eax+4H]                     ; 2056 _ 8B. 50, 04
        mov     eax, dword [ebp-0CCH]                   ; 2059 _ 8B. 85, FFFFFF34
        mov     eax, dword [eax]                        ; 205F _ 8B. 00
        mov     dword [esp+18H], 43                     ; 2061 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 2069 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 206D _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-0B4H]                   ; 2075 _ 8B. 9D, FFFFFF4C
        mov     dword [esp+0CH], ebx                    ; 207B _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 207F _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2083 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2087 _ 89. 04 24
        call    paint_rectangle                         ; 208A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0B4H]                   ; 208F _ 8B. 85, FFFFFF4C
        lea     edx, [eax+8H]                           ; 2095 _ 8D. 50, 08
        mov     eax, dword [sheet_control]              ; 2098 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 209D _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], edx                    ; 20A5 _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 20A9 _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-0B4H]                   ; 20B1 _ 8B. 95, FFFFFF4C
        mov     dword [esp+8H], edx                     ; 20B7 _ 89. 54 24, 08
        mov     edx, dword [ebp-0CCH]                   ; 20BB _ 8B. 95, FFFFFF34
        mov     dword [esp+4H], edx                     ; 20C1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 20C5 _ 89. 04 24
        call    sheet_refresh                           ; 20C8 _ E8, FFFFFFFC(rel)
        jmp     ?_061                                   ; 20CD _ E9, FFFFFEB0

?_065:  jmp     ?_061                                   ; 20D2 _ E9, FFFFFEAB
; console_task End of function

launch_console:; Function begin
        push    ebp                                     ; 20D7 _ 55
        mov     ebp, esp                                ; 20D8 _ 89. E5
        sub     esp, 56                                 ; 20DA _ 83. EC, 38
        mov     eax, dword [sheet_control]              ; 20DD _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 20E2 _ 89. 04 24
        call    sheet_alloc                             ; 20E5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 20EA _ 89. 45, E8
        mov     eax, dword [memman]                     ; 20ED _ A1, 00000000(d)
        mov     dword [esp+4H], 42240                   ; 20F2 _ C7. 44 24, 04, 0000A500
        mov     dword [esp], eax                        ; 20FA _ 89. 04 24
        call    memman_alloc_4k                         ; 20FD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 2102 _ 89. 45, EC
        mov     dword [esp+10H], 99                     ; 2105 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 165                    ; 210D _ C7. 44 24, 0C, 000000A5
        mov     dword [esp+8H], 256                     ; 2115 _ C7. 44 24, 08, 00000100
        mov     eax, dword [ebp-14H]                    ; 211D _ 8B. 45, EC
        mov     dword [esp+4H], eax                     ; 2120 _ 89. 44 24, 04
        mov     eax, dword [ebp-18H]                    ; 2124 _ 8B. 45, E8
        mov     dword [esp], eax                        ; 2127 _ 89. 04 24
        call    sheet_setbuf                            ; 212A _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 212F _ A1, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 2134 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], ?_219                   ; 213C _ C7. 44 24, 08, 00000062(d)
        mov     edx, dword [ebp-18H]                    ; 2144 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2147 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 214B _ 89. 04 24
        call    make_windows                            ; 214E _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 2153 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 128                    ; 215B _ C7. 44 24, 10, 00000080
        mov     dword [esp+0CH], 240                    ; 2163 _ C7. 44 24, 0C, 000000F0
        mov     dword [esp+8H], 28                      ; 216B _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 2173 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-18H]                    ; 217B _ 8B. 45, E8
        mov     dword [esp], eax                        ; 217E _ 89. 04 24
        call    make_textbox                            ; 2181 _ E8, FFFFFFFC(rel)
        call    task_alloc                              ; 2186 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 218B _ 89. 45, F0
        call    get_code32_addr                         ; 218E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2193 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2196 _ 8B. 45, F0
        mov     dword [eax+70H], 0                      ; 2199 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-10H]                    ; 21A0 _ 8B. 45, F0
        mov     dword [eax+74H], 1073741824             ; 21A3 _ C7. 40, 74, 40000000
        mov     eax, console_task                       ; 21AA _ B8, 00000000(d)
        sub     eax, dword [ebp-0CH]                    ; 21AF _ 2B. 45, F4
        mov     edx, eax                                ; 21B2 _ 89. C2
        mov     eax, dword [ebp-10H]                    ; 21B4 _ 8B. 45, F0
        mov     dword [eax+30H], edx                    ; 21B7 _ 89. 50, 30
        mov     eax, dword [ebp-10H]                    ; 21BA _ 8B. 45, F0
        mov     dword [eax+58H], 0                      ; 21BD _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-10H]                    ; 21C4 _ 8B. 45, F0
        mov     dword [eax+5CH], 8                      ; 21C7 _ C7. 40, 5C, 00000008
        mov     eax, dword [ebp-10H]                    ; 21CE _ 8B. 45, F0
        mov     dword [eax+60H], 48                     ; 21D1 _ C7. 40, 60, 00000030
        mov     eax, dword [ebp-10H]                    ; 21D8 _ 8B. 45, F0
        mov     dword [eax+64H], 32                     ; 21DB _ C7. 40, 64, 00000020
        mov     eax, dword [ebp-10H]                    ; 21E2 _ 8B. 45, F0
        mov     dword [eax+68H], 0                      ; 21E5 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-10H]                    ; 21EC _ 8B. 45, F0
        mov     dword [eax+6CH], 16                     ; 21EF _ C7. 40, 6C, 00000010
        mov     eax, dword [ebp-10H]                    ; 21F6 _ 8B. 45, F0
        mov     eax, dword [eax+48H]                    ; 21F9 _ 8B. 40, 48
        lea     edx, [eax-4H]                           ; 21FC _ 8D. 50, FC
        mov     eax, dword [ebp-10H]                    ; 21FF _ 8B. 45, F0
        mov     dword [eax+48H], edx                    ; 2202 _ 89. 50, 48
        mov     eax, dword [ebp-10H]                    ; 2205 _ 8B. 45, F0
        mov     eax, dword [eax+48H]                    ; 2208 _ 8B. 40, 48
        add     eax, 4                                  ; 220B _ 83. C0, 04
        mov     edx, dword [ebp-18H]                    ; 220E _ 8B. 55, E8
        mov     dword [eax], edx                        ; 2211 _ 89. 10
        mov     dword [esp+8H], 5                       ; 2213 _ C7. 44 24, 08, 00000005
        mov     dword [esp+4H], 1                       ; 221B _ C7. 44 24, 04, 00000001
        mov     eax, dword [ebp-10H]                    ; 2223 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 2226 _ 89. 04 24
        call    task_run                                ; 2229 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 222E _ A1, 00000000(d)
        mov     dword [esp+0CH], 4                      ; 2233 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 32                      ; 223B _ C7. 44 24, 08, 00000020
        mov     edx, dword [ebp-18H]                    ; 2243 _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2246 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 224A _ 89. 04 24
        call    sheet_slide                             ; 224D _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 2252 _ A1, 00000000(d)
        mov     dword [esp+8H], 1                       ; 2257 _ C7. 44 24, 08, 00000001
        mov     edx, dword [ebp-18H]                    ; 225F _ 8B. 55, E8
        mov     dword [esp+4H], edx                     ; 2262 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2266 _ 89. 04 24
        call    sheet_updown                            ; 2269 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 226E _ 8B. 45, E8
        leave                                           ; 2271 _ C9
        ret                                             ; 2272 _ C3
; launch_console End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 2273 _ 55
        mov     ebp, esp                                ; 2274 _ 89. E5
        sub     esp, 24                                 ; 2276 _ 83. EC, 18
?_066:  mov     dword [esp], 100                        ; 2279 _ C7. 04 24, 00000064
        call    io_in8                                  ; 2280 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 2285 _ 83. E0, 02
        test    eax, eax                                ; 2288 _ 85. C0
        jnz     ?_067                                   ; 228A _ 75, 02
        jmp     ?_068                                   ; 228C _ EB, 02

?_067:  jmp     ?_066                                   ; 228E _ EB, E9

?_068:  leave                                           ; 2290 _ C9
        ret                                             ; 2291 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 2292 _ 55
        mov     ebp, esp                                ; 2293 _ 89. E5
        sub     esp, 24                                 ; 2295 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 2298 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 229D _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 22A5 _ C7. 04 24, 00000064
        call    io_out8                                 ; 22AC _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 22B1 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 22B6 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 22BE _ C7. 04 24, 00000060
        call    io_out8                                 ; 22C5 _ E8, FFFFFFFC(rel)
        leave                                           ; 22CA _ C9
        ret                                             ; 22CB _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 22CC _ 55
        mov     ebp, esp                                ; 22CD _ 89. E5
        sub     esp, 24                                 ; 22CF _ 83. EC, 18
        call    wait_KBC_sendready                      ; 22D2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 22D7 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 22DF _ C7. 04 24, 00000064
        call    io_out8                                 ; 22E6 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 22EB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 22F0 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 22F8 _ C7. 04 24, 00000060
        call    io_out8                                 ; 22FF _ E8, FFFFFFFC(rel)
        leave                                           ; 2304 _ C9
        ret                                             ; 2305 _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 2306 _ 55
        mov     ebp, esp                                ; 2307 _ 89. E5
        sub     esp, 4                                  ; 2309 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 230C _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 230F _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2312 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2315 _ 0F B6. 40, 03
        test    al, al                                  ; 2319 _ 84. C0
        jnz     ?_070                                   ; 231B _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 231D _ 80. 7D, FC, FA
        jnz     ?_069                                   ; 2321 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 2323 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 2326 _ C6. 40, 03, 01
?_069:  mov     eax, 0                                  ; 232A _ B8, 00000000
        jmp     ?_077                                   ; 232F _ E9, 0000010F

?_070:  mov     eax, dword [ebp+8H]                     ; 2334 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2337 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 233B _ 3C, 01
        jnz     ?_072                                   ; 233D _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 233F _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 2343 _ 25, 000000C8
        cmp     eax, 8                                  ; 2348 _ 83. F8, 08
        jnz     ?_071                                   ; 234B _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 234D _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2350 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 2354 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 2356 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 2359 _ C6. 40, 03, 02
?_071:  mov     eax, 0                                  ; 235D _ B8, 00000000
        jmp     ?_077                                   ; 2362 _ E9, 000000DC

?_072:  mov     eax, dword [ebp+8H]                     ; 2367 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 236A _ 0F B6. 40, 03
        cmp     al, 2                                   ; 236E _ 3C, 02
        jnz     ?_073                                   ; 2370 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 2372 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2375 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 2379 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 237C _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 237F _ C6. 40, 03, 03
        mov     eax, 0                                  ; 2383 _ B8, 00000000
        jmp     ?_077                                   ; 2388 _ E9, 000000B6

?_073:  mov     eax, dword [ebp+8H]                     ; 238D _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 2390 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 2394 _ 3C, 03
        jne     ?_076                                   ; 2396 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 239C _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 239F _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 23A3 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 23A6 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 23A9 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 23AD _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 23B0 _ 0F B6. 00
        movzx   eax, al                                 ; 23B3 _ 0F B6. C0
        and     eax, 07H                                ; 23B6 _ 83. E0, 07
        mov     edx, eax                                ; 23B9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 23BB _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 23BE _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 23C1 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 23C4 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 23C8 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 23CB _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 23CE _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 23D1 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 23D4 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 23D8 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 23DB _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 23DE _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 23E1 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 23E4 _ 0F B6. 00
        movzx   eax, al                                 ; 23E7 _ 0F B6. C0
        and     eax, 10H                                ; 23EA _ 83. E0, 10
        test    eax, eax                                ; 23ED _ 85. C0
        jz      ?_074                                   ; 23EF _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 23F1 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 23F4 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 23F7 _ 0D, FFFFFF00
        mov     edx, eax                                ; 23FC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 23FE _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2401 _ 89. 50, 04
?_074:  mov     eax, dword [ebp+8H]                     ; 2404 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 2407 _ 0F B6. 00
        movzx   eax, al                                 ; 240A _ 0F B6. C0
        and     eax, 20H                                ; 240D _ 83. E0, 20
        test    eax, eax                                ; 2410 _ 85. C0
        jz      ?_075                                   ; 2412 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 2414 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2417 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 241A _ 0D, FFFFFF00
        mov     edx, eax                                ; 241F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2421 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2424 _ 89. 50, 08
?_075:  mov     eax, dword [ebp+8H]                     ; 2427 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 242A _ 8B. 40, 08
        neg     eax                                     ; 242D _ F7. D8
        mov     edx, eax                                ; 242F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2431 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2434 _ 89. 50, 08
        mov     eax, 1                                  ; 2437 _ B8, 00000001
        jmp     ?_077                                   ; 243C _ EB, 05

?_076:  mov     eax, 4294967295                         ; 243E _ B8, FFFFFFFF
?_077:  leave                                           ; 2443 _ C9
        ret                                             ; 2444 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 2445 _ 55
        mov     ebp, esp                                ; 2446 _ 89. E5
        sub     esp, 40                                 ; 2448 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 244B _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 2453 _ C7. 04 24, 00000020
        call    io_out8                                 ; 245A _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 245F _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 2467 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 246E _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 2473 _ C7. 04 24, 00000060
        call    io_in8                                  ; 247A _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 247F _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 2482 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 2486 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 248A _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 2491 _ E8, FFFFFFFC(rel)
        leave                                           ; 2496 _ C9
        ret                                             ; 2497 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 2498 _ 55
        mov     ebp, esp                                ; 2499 _ 89. E5
        sub     esp, 40                                 ; 249B _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 249E _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 24A6 _ C7. 04 24, 00000020
        call    io_out8                                 ; 24AD _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 24B2 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 24BA _ C7. 04 24, 000000A0
        call    io_out8                                 ; 24C1 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 24C6 _ C7. 04 24, 00000060
        call    io_in8                                  ; 24CD _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 24D2 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 24D5 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 24D9 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 24DD _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 24E4 _ E8, FFFFFFFC(rel)
        leave                                           ; 24E9 _ C9
        ret                                             ; 24EA _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 24EB _ 55
        mov     ebp, esp                                ; 24EC _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 24EE _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 24F1 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 24F4 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 24F6 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 24F9 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 2500 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2503 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 250A _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 250D _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 2510 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2513 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2516 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 2519 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 251C _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 251F _ C7. 40, 14, 00000000
        mov     eax, dword [ebp+8H]                     ; 2526 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2529 _ 8B. 55, 14
        mov     dword [eax+18H], edx                    ; 252C _ 89. 50, 18
        pop     ebp                                     ; 252F _ 5D
        ret                                             ; 2530 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 2531 _ 55
        mov     ebp, esp                                ; 2532 _ 89. E5
        sub     esp, 40                                 ; 2534 _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 2537 _ 8B. 45, 0C
        mov     byte [ebp-1CH], al                      ; 253A _ 88. 45, E4
        cmp     dword [ebp+8H], 0                       ; 253D _ 83. 7D, 08, 00
        jnz     ?_078                                   ; 2541 _ 75, 0A
        mov     eax, 4294967295                         ; 2543 _ B8, FFFFFFFF
        jmp     ?_082                                   ; 2548 _ E9, 000000B1

?_078:  mov     eax, dword [ebp+8H]                     ; 254D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2550 _ 8B. 40, 10
        test    eax, eax                                ; 2553 _ 85. C0
        jnz     ?_079                                   ; 2555 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 2557 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 255A _ 8B. 40, 14
        or      eax, 01H                                ; 255D _ 83. C8, 01
        mov     edx, eax                                ; 2560 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2562 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 2565 _ 89. 50, 14
        mov     eax, 4294967295                         ; 2568 _ B8, FFFFFFFF
        jmp     ?_082                                   ; 256D _ E9, 0000008C

?_079:  mov     eax, dword [ebp+8H]                     ; 2572 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2575 _ 8B. 40, 04
        mov     dword [ebp-0CH], eax                    ; 2578 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 257B _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 257E _ 8B. 10
        mov     eax, dword [ebp-0CH]                    ; 2580 _ 8B. 45, F4
        add     edx, eax                                ; 2583 _ 01. C2
        movzx   eax, byte [ebp-1CH]                     ; 2585 _ 0F B6. 45, E4
        mov     byte [edx], al                          ; 2589 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 258B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 258E _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 2591 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2594 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2597 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 259A _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 259D _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 25A0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 25A3 _ 8B. 40, 0C
        cmp     edx, eax                                ; 25A6 _ 39. C2
        jnz     ?_080                                   ; 25A8 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 25AA _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 25AD _ C7. 40, 04, 00000000
?_080:  mov     eax, dword [ebp+8H]                     ; 25B4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 25B7 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 25BA _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 25BD _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 25C0 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 25C3 _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 25C6 _ 8B. 40, 18
        test    eax, eax                                ; 25C9 _ 85. C0
        jz      ?_081                                   ; 25CB _ 74, 2C
        mov     eax, dword [ebp+8H]                     ; 25CD _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 25D0 _ 8B. 40, 18
        mov     eax, dword [eax+4H]                     ; 25D3 _ 8B. 40, 04
        cmp     eax, 2                                  ; 25D6 _ 83. F8, 02
        jz      ?_081                                   ; 25D9 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 25DB _ 8B. 45, 08
        mov     eax, dword [eax+18H]                    ; 25DE _ 8B. 40, 18
        mov     dword [esp+8H], 0                       ; 25E1 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], -1                      ; 25E9 _ C7. 44 24, 04, FFFFFFFF
        mov     dword [esp], eax                        ; 25F1 _ 89. 04 24
        call    task_run                                ; 25F4 _ E8, FFFFFFFC(rel)
?_081:  mov     eax, 0                                  ; 25F9 _ B8, 00000000
?_082:  leave                                           ; 25FE _ C9
        ret                                             ; 25FF _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2600 _ 55
        mov     ebp, esp                                ; 2601 _ 89. E5
        sub     esp, 16                                 ; 2603 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 2606 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 2609 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 260C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 260F _ 8B. 40, 0C
        cmp     edx, eax                                ; 2612 _ 39. C2
        jnz     ?_083                                   ; 2614 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 2616 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 2619 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 2620 _ B8, FFFFFFFF
        jmp     ?_085                                   ; 2625 _ EB, 57

?_083:  mov     eax, dword [ebp+8H]                     ; 2627 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 262A _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 262D _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 2630 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2633 _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 2635 _ 8B. 45, F8
        add     eax, edx                                ; 2638 _ 01. D0
        movzx   eax, byte [eax]                         ; 263A _ 0F B6. 00
        movzx   eax, al                                 ; 263D _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2640 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2643 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2646 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 2649 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 264C _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 264F _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2652 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 2655 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2658 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 265B _ 8B. 40, 0C
        cmp     edx, eax                                ; 265E _ 39. C2
        jnz     ?_084                                   ; 2660 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2662 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2665 _ C7. 40, 08, 00000000
?_084:  mov     eax, dword [ebp+8H]                     ; 266C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 266F _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 2672 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2675 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2678 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 267B _ 8B. 45, FC
?_085:  leave                                           ; 267E _ C9
        ret                                             ; 267F _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 2680 _ 55
        mov     ebp, esp                                ; 2681 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2683 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 2686 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2689 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 268C _ 8B. 40, 10
        sub     edx, eax                                ; 268F _ 29. C2
        mov     eax, edx                                ; 2691 _ 89. D0
        pop     ebp                                     ; 2693 _ 5D
        ret                                             ; 2694 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 2695 _ 55
        mov     ebp, esp                                ; 2696 _ 89. E5
        sub     esp, 4                                  ; 2698 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 269B _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 269E _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 26A1 _ 80. 7D, FC, 09
        jle     ?_086                                   ; 26A5 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 26A7 _ 0F B6. 45, FC
        add     eax, 55                                 ; 26AB _ 83. C0, 37
        jmp     ?_087                                   ; 26AE _ EB, 07

?_086:  movzx   eax, byte [ebp-4H]                      ; 26B0 _ 0F B6. 45, FC
        add     eax, 48                                 ; 26B4 _ 83. C0, 30
?_087:  leave                                           ; 26B7 _ C9
        ret                                             ; 26B8 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 26B9 _ 55
        mov     ebp, esp                                ; 26BA _ 89. E5
        sub     esp, 24                                 ; 26BC _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 26BF _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 26C2 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 26C5 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 26CC _ 0F B6. 45, EC
        and     eax, 0FH                                ; 26D0 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 26D3 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 26D6 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 26DA _ 89. 04 24
        call    charToHexVal                            ; 26DD _ E8, FFFFFFFC(rel)
        mov     byte [?_221], al                        ; 26E2 _ A2, 000002A3(d)
        movzx   eax, byte [ebp-14H]                     ; 26E7 _ 0F B6. 45, EC
        shr     al, 4                                   ; 26EB _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 26EE _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 26F1 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 26F5 _ 0F BE. C0
        mov     dword [esp], eax                        ; 26F8 _ 89. 04 24
        call    charToHexVal                            ; 26FB _ E8, FFFFFFFC(rel)
        mov     byte [?_220], al                        ; 2700 _ A2, 000002A2(d)
        mov     eax, keyval                             ; 2705 _ B8, 000002A0(d)
        leave                                           ; 270A _ C9
        ret                                             ; 270B _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 270C _ 55
        mov     ebp, esp                                ; 270D _ 89. E5
        sub     esp, 16                                 ; 270F _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 2712 _ C6. 05, 000003A0(d), 30
        mov     byte [?_224], 88                        ; 2719 _ C6. 05, 000003A1(d), 58
        mov     byte [?_225], 0                         ; 2720 _ C6. 05, 000003AA(d), 00
        mov     dword [ebp-0CH], 2                      ; 2727 _ C7. 45, F4, 00000002
        jmp     ?_089                                   ; 272E _ EB, 0F

?_088:  mov     eax, dword [ebp-0CH]                    ; 2730 _ 8B. 45, F4
        add     eax, str.1386                           ; 2733 _ 05, 000003A0(d)
        mov     byte [eax], 48                          ; 2738 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 273B _ 83. 45, F4, 01
?_089:  cmp     dword [ebp-0CH], 9                      ; 273F _ 83. 7D, F4, 09
        jle     ?_088                                   ; 2743 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 2745 _ C7. 45, F8, 00000009
        jmp     ?_093                                   ; 274C _ EB, 40

?_090:  mov     eax, dword [ebp+8H]                     ; 274E _ 8B. 45, 08
        and     eax, 0FH                                ; 2751 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 2754 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2757 _ 8B. 45, 08
        shr     eax, 4                                  ; 275A _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 275D _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 2760 _ 83. 7D, FC, 09
        jle     ?_091                                   ; 2764 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 2766 _ 8B. 45, FC
        add     eax, 55                                 ; 2769 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 276C _ 8B. 55, F8
        add     edx, str.1386                           ; 276F _ 81. C2, 000003A0(d)
        mov     byte [edx], al                          ; 2775 _ 88. 02
        jmp     ?_092                                   ; 2777 _ EB, 11

?_091:  mov     eax, dword [ebp-4H]                     ; 2779 _ 8B. 45, FC
        add     eax, 48                                 ; 277C _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 277F _ 8B. 55, F8
        add     edx, str.1386                           ; 2782 _ 81. C2, 000003A0(d)
        mov     byte [edx], al                          ; 2788 _ 88. 02
?_092:  sub     dword [ebp-8H], 1                       ; 278A _ 83. 6D, F8, 01
?_093:  cmp     dword [ebp-8H], 1                       ; 278E _ 83. 7D, F8, 01
        jle     ?_094                                   ; 2792 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 2794 _ 83. 7D, 08, 00
        jnz     ?_090                                   ; 2798 _ 75, B4
?_094:  mov     eax, str.1386                           ; 279A _ B8, 000003A0(d)
        leave                                           ; 279F _ C9
        ret                                             ; 27A0 _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 27A1 _ 55
        mov     ebp, esp                                ; 27A2 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 27A4 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 27A7 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 27AD _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 27B0 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 27B7 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 27BA _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 27C1 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 27C4 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 27CB _ 5D
        ret                                             ; 27CC _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 27CD _ 55
        mov     ebp, esp                                ; 27CE _ 89. E5
        sub     esp, 16                                 ; 27D0 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 27D3 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 27DA _ C7. 45, F8, 00000000
        jmp     ?_096                                   ; 27E1 _ EB, 14

?_095:  mov     eax, dword [ebp+8H]                     ; 27E3 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 27E6 _ 8B. 55, F8
        add     edx, 2                                  ; 27E9 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 27EC _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 27F0 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 27F3 _ 83. 45, F8, 01
?_096:  mov     eax, dword [ebp+8H]                     ; 27F7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 27FA _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 27FC _ 3B. 45, F8
        ja      ?_095                                   ; 27FF _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 2801 _ 8B. 45, FC
        leave                                           ; 2804 _ C9
        ret                                             ; 2805 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 2806 _ 55
        mov     ebp, esp                                ; 2807 _ 89. E5
        sub     esp, 16                                 ; 2809 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 280C _ C7. 45, F8, 00000000
        jmp     ?_100                                   ; 2813 _ E9, 00000085

?_097:  mov     eax, dword [ebp+8H]                     ; 2818 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 281B _ 8B. 55, F8
        add     edx, 2                                  ; 281E _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2821 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 2825 _ 3B. 45, 0C
        jc      ?_099                                   ; 2828 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 282A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 282D _ 8B. 55, F8
        add     edx, 2                                  ; 2830 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2833 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 2836 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2839 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 283C _ 8B. 55, F8
        add     edx, 2                                  ; 283F _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2842 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 2845 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 2848 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 284B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 284E _ 8B. 55, F8
        add     edx, 2                                  ; 2851 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 2854 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 2857 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 285A _ 8B. 55, F8
        add     edx, 2                                  ; 285D _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2860 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 2864 _ 2B. 45, 0C
        mov     edx, eax                                ; 2867 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2869 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 286C _ 8B. 4D, F8
        add     ecx, 2                                  ; 286F _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 2872 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 2876 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2879 _ 8B. 55, F8
        add     edx, 2                                  ; 287C _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 287F _ 8B. 44 D0, 04
        test    eax, eax                                ; 2883 _ 85. C0
        jnz     ?_098                                   ; 2885 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 2887 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 288A _ 8B. 00
        lea     edx, [eax-1H]                           ; 288C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 288F _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2892 _ 89. 10
?_098:  mov     eax, dword [ebp-4H]                     ; 2894 _ 8B. 45, FC
        jmp     ?_101                                   ; 2897 _ EB, 17

?_099:  add     dword [ebp-8H], 1                       ; 2899 _ 83. 45, F8, 01
?_100:  mov     eax, dword [ebp+8H]                     ; 289D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 28A0 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 28A2 _ 3B. 45, F8
        ja      ?_097                                   ; 28A5 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 28AB _ B8, 00000000
?_101:  leave                                           ; 28B0 _ C9
        ret                                             ; 28B1 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 28B2 _ 55
        mov     ebp, esp                                ; 28B3 _ 89. E5
        push    ebx                                     ; 28B5 _ 53
        sub     esp, 16                                 ; 28B6 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 28B9 _ C7. 45, F4, 00000000
        jmp     ?_104                                   ; 28C0 _ EB, 17

?_102:  mov     eax, dword [ebp+8H]                     ; 28C2 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 28C5 _ 8B. 55, F4
        add     edx, 2                                  ; 28C8 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 28CB _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 28CE _ 3B. 45, 0C
        jbe     ?_103                                   ; 28D1 _ 76, 02
        jmp     ?_105                                   ; 28D3 _ EB, 0E

?_103:  add     dword [ebp-0CH], 1                      ; 28D5 _ 83. 45, F4, 01
?_104:  mov     eax, dword [ebp+8H]                     ; 28D9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 28DC _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 28DE _ 3B. 45, F4
        jg      ?_102                                   ; 28E1 _ 7F, DF
?_105:  cmp     dword [ebp-0CH], 0                      ; 28E3 _ 83. 7D, F4, 00
        jle     ?_107                                   ; 28E7 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 28ED _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 28F0 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 28F3 _ 8B. 45, 08
        add     edx, 2                                  ; 28F6 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 28F9 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 28FC _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 28FF _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 2902 _ 8B. 45, 08
        add     ecx, 2                                  ; 2905 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 2908 _ 8B. 44 C8, 04
        add     eax, edx                                ; 290C _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 290E _ 3B. 45, 0C
        jne     ?_107                                   ; 2911 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 2917 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 291A _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 291D _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2920 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2923 _ 8B. 45, 08
        add     edx, 2                                  ; 2926 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2929 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 292D _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2930 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2933 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 2936 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2939 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 293D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2940 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2942 _ 3B. 45, F4
        jle     ?_106                                   ; 2945 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 2947 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 294A _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 294D _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2950 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2953 _ 8B. 55, F4
        add     edx, 2                                  ; 2956 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2959 _ 8B. 04 D0
        cmp     ecx, eax                                ; 295C _ 39. C1
        jnz     ?_106                                   ; 295E _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 2960 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 2963 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2966 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2969 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 296C _ 8B. 45, 08
        add     edx, 2                                  ; 296F _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2972 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 2976 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 2979 _ 8B. 4D, F4
        add     ecx, 2                                  ; 297C _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 297F _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 2983 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2986 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 2989 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 298C _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2990 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2993 _ 8B. 00
        lea     edx, [eax-1H]                           ; 2995 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2998 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 299B _ 89. 10
?_106:  mov     eax, 0                                  ; 299D _ B8, 00000000
        jmp     ?_113                                   ; 29A2 _ E9, 0000011C

?_107:  mov     eax, dword [ebp+8H]                     ; 29A7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 29AA _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 29AC _ 3B. 45, F4
        jle     ?_108                                   ; 29AF _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 29B1 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 29B4 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 29B7 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 29BA _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 29BD _ 8B. 55, F4
        add     edx, 2                                  ; 29C0 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 29C3 _ 8B. 04 D0
        cmp     ecx, eax                                ; 29C6 _ 39. C1
        jnz     ?_108                                   ; 29C8 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 29CA _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 29CD _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 29D0 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 29D3 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 29D6 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 29D9 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 29DC _ 8B. 55, F4
        add     edx, 2                                  ; 29DF _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 29E2 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 29E6 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 29E9 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 29EC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 29EF _ 8B. 55, F4
        add     edx, 2                                  ; 29F2 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 29F5 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 29F9 _ B8, 00000000
        jmp     ?_113                                   ; 29FE _ E9, 000000C0

?_108:  mov     eax, dword [ebp+8H]                     ; 2A03 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2A06 _ 8B. 00
        cmp     eax, 4095                               ; 2A08 _ 3D, 00000FFF
        jg      ?_112                                   ; 2A0D _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 2A13 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2A16 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 2A18 _ 89. 45, F8
        jmp     ?_110                                   ; 2A1B _ EB, 28

?_109:  mov     eax, dword [ebp-8H]                     ; 2A1D _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 2A20 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 2A23 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 2A26 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 2A29 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 2A2C _ 8B. 45, 08
        add     edx, 2                                  ; 2A2F _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 2A32 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 2A35 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 2A37 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 2A3A _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 2A3D _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 2A41 _ 83. 6D, F8, 01
?_110:  mov     eax, dword [ebp-8H]                     ; 2A45 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 2A48 _ 3B. 45, F4
        jg      ?_109                                   ; 2A4B _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 2A4D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2A50 _ 8B. 00
        lea     edx, [eax+1H]                           ; 2A52 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2A55 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 2A58 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2A5A _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2A5D _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2A60 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2A63 _ 8B. 00
        cmp     edx, eax                                ; 2A65 _ 39. C2
        jge     ?_111                                   ; 2A67 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 2A69 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2A6C _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 2A6E _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 2A71 _ 89. 50, 04
?_111:  mov     eax, dword [ebp+8H]                     ; 2A74 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2A77 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2A7A _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2A7D _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2A80 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 2A83 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2A86 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2A89 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 2A8C _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 2A8F _ 89. 54 C8, 04
        mov     eax, 0                                  ; 2A93 _ B8, 00000000
        jmp     ?_113                                   ; 2A98 _ EB, 29

?_112:  mov     eax, dword [ebp+8H]                     ; 2A9A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2A9D _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 2AA0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2AA3 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2AA6 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 2AA9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2AAC _ 8B. 40, 08
        mov     edx, eax                                ; 2AAF _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2AB1 _ 8B. 45, 10
        add     eax, edx                                ; 2AB4 _ 01. D0
        mov     edx, eax                                ; 2AB6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 2AB8 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2ABB _ 89. 50, 08
        mov     eax, 4294967295                         ; 2ABE _ B8, FFFFFFFF
?_113:  add     esp, 16                                 ; 2AC3 _ 83. C4, 10
        pop     ebx                                     ; 2AC6 _ 5B
        pop     ebp                                     ; 2AC7 _ 5D
        ret                                             ; 2AC8 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 2AC9 _ 55
        mov     ebp, esp                                ; 2ACA _ 89. E5
        sub     esp, 24                                 ; 2ACC _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 2ACF _ 8B. 45, 0C
        add     eax, 4095                               ; 2AD2 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2AD7 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 2ADC _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 2ADF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2AE2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2AE6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2AE9 _ 89. 04 24
        call    memman_alloc                            ; 2AEC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 2AF1 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2AF4 _ 8B. 45, FC
        leave                                           ; 2AF7 _ C9
        ret                                             ; 2AF8 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 2AF9 _ 55
        mov     ebp, esp                                ; 2AFA _ 89. E5
        sub     esp, 28                                 ; 2AFC _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 2AFF _ 8B. 45, 10
        add     eax, 4095                               ; 2B02 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2B07 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 2B0C _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 2B0F _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 2B12 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2B16 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2B19 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B1D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B20 _ 89. 04 24
        call    memman_free                             ; 2B23 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 2B28 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2B2B _ 8B. 45, FC
        leave                                           ; 2B2E _ C9
        ret                                             ; 2B2F _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 2B30 _ 55
        mov     ebp, esp                                ; 2B31 _ 89. E5
        sub     esp, 40                                 ; 2B33 _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 2B36 _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 2B3E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B41 _ 89. 04 24
        call    memman_alloc_4k                         ; 2B44 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2B49 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 2B4C _ 83. 7D, F4, 00
        jnz     ?_114                                   ; 2B50 _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 2B52 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 2B55 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 2B5D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B61 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B64 _ 89. 04 24
        call    memman_free_4k                          ; 2B67 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 2B6C _ B8, 00000000
        jmp     ?_118                                   ; 2B71 _ E9, 0000009D

?_114:  mov     eax, dword [ebp-0CH]                    ; 2B76 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 2B79 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2B7C _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 2B7E _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 2B81 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 2B84 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 2B87 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 2B8A _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 2B8D _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2B90 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 2B93 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 2B9A _ C7. 45, F0, 00000000
        jmp     ?_116                                   ; 2BA1 _ EB, 1B

?_115:  mov     eax, dword [ebp-0CH]                    ; 2BA3 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 2BA6 _ 8B. 55, F0
        add     edx, 33                                 ; 2BA9 _ 83. C2, 21
        shl     edx, 5                                  ; 2BAC _ C1. E2, 05
        add     eax, edx                                ; 2BAF _ 01. D0
        add     eax, 16                                 ; 2BB1 _ 83. C0, 10
        mov     dword [eax], 0                          ; 2BB4 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 2BBA _ 83. 45, F0, 01
?_116:  cmp     dword [ebp-10H], 255                    ; 2BBE _ 81. 7D, F0, 000000FF
        jle     ?_115                                   ; 2BC5 _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 2BC7 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 2BCA _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 2BCE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2BD2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2BD5 _ 89. 04 24
        call    memman_alloc_4k                         ; 2BD8 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 2BDD _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2BDF _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 2BE2 _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 2BE5 _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 2BE8 _ 8B. 40, 10
        test    eax, eax                                ; 2BEB _ 85. C0
        jnz     ?_117                                   ; 2BED _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 2BEF _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 2BF2 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 2BFA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2BFE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C01 _ 89. 04 24
        call    memman_free_4k                          ; 2C04 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 2C09 _ B8, 00000000
        jmp     ?_118                                   ; 2C0E _ EB, 03

?_117:  mov     eax, dword [ebp-0CH]                    ; 2C10 _ 8B. 45, F4
?_118:  leave                                           ; 2C13 _ C9
        ret                                             ; 2C14 _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 2C15 _ 55
        mov     ebp, esp                                ; 2C16 _ 89. E5
        sub     esp, 16                                 ; 2C18 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2C1B _ C7. 45, F8, 00000000
        jmp     ?_121                                   ; 2C22 _ EB, 5B

?_119:  mov     eax, dword [ebp+8H]                     ; 2C24 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2C27 _ 8B. 55, F8
        add     edx, 33                                 ; 2C2A _ 83. C2, 21
        shl     edx, 5                                  ; 2C2D _ C1. E2, 05
        add     eax, edx                                ; 2C30 _ 01. D0
        add     eax, 16                                 ; 2C32 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 2C35 _ 8B. 00
        test    eax, eax                                ; 2C37 _ 85. C0
        jnz     ?_120                                   ; 2C39 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 2C3B _ 8B. 45, F8
        shl     eax, 5                                  ; 2C3E _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 2C41 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 2C47 _ 8B. 45, 08
        add     eax, edx                                ; 2C4A _ 01. D0
        add     eax, 4                                  ; 2C4C _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 2C4F _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2C52 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2C55 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 2C58 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 2C5B _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 2C5E _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 2C62 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 2C65 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 2C6C _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 2C6F _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 2C76 _ 8B. 45, FC
        jmp     ?_122                                   ; 2C79 _ EB, 12

?_120:  add     dword [ebp-8H], 1                       ; 2C7B _ 83. 45, F8, 01
?_121:  cmp     dword [ebp-8H], 255                     ; 2C7F _ 81. 7D, F8, 000000FF
        jle     ?_119                                   ; 2C86 _ 7E, 9C
        mov     eax, 0                                  ; 2C88 _ B8, 00000000
?_122:  leave                                           ; 2C8D _ C9
        ret                                             ; 2C8E _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 2C8F _ 55
        mov     ebp, esp                                ; 2C90 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2C92 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2C95 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2C98 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2C9A _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2C9D _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 2CA0 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2CA3 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2CA6 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 2CA9 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2CAC _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 2CAF _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 2CB2 _ 89. 50, 14
        pop     ebp                                     ; 2CB5 _ 5D
        ret                                             ; 2CB6 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 2CB7 _ 55
        mov     ebp, esp                                ; 2CB8 _ 89. E5
        push    esi                                     ; 2CBA _ 56
        push    ebx                                     ; 2CBB _ 53
        sub     esp, 48                                 ; 2CBC _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 2CBF _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2CC2 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 2CC5 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 2CC8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2CCB _ 8B. 40, 0C
        add     eax, 1                                  ; 2CCE _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 2CD1 _ 3B. 45, 10
        jge     ?_123                                   ; 2CD4 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 2CD6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2CD9 _ 8B. 40, 0C
        add     eax, 1                                  ; 2CDC _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 2CDF _ 89. 45, 10
?_123:  cmp     dword [ebp+10H], -1                     ; 2CE2 _ 83. 7D, 10, FF
        jge     ?_124                                   ; 2CE6 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 2CE8 _ C7. 45, 10, FFFFFFFF
?_124:  mov     eax, dword [ebp+0CH]                    ; 2CEF _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2CF2 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 2CF5 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 2CF8 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2CFB _ 3B. 45, 10
        jle     ?_131                                   ; 2CFE _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 2D04 _ 83. 7D, 10, 00
        js      ?_127                                   ; 2D08 _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 2D0E _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2D11 _ 89. 45, F0
        jmp     ?_126                                   ; 2D14 _ EB, 34

?_125:  mov     eax, dword [ebp-10H]                    ; 2D16 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 2D19 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2D1C _ 8B. 45, 08
        add     edx, 4                                  ; 2D1F _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2D22 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2D26 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2D29 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2D2C _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2D2F _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2D33 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2D36 _ 8B. 55, F0
        add     edx, 4                                  ; 2D39 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2D3C _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2D40 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2D43 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2D46 _ 83. 6D, F0, 01
?_126:  mov     eax, dword [ebp-10H]                    ; 2D4A _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2D4D _ 3B. 45, 10
        jg      ?_125                                   ; 2D50 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 2D52 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2D55 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2D58 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2D5B _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2D5E _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 2D62 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2D65 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2D68 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2D6B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2D6E _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2D71 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2D74 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2D77 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2D7A _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2D7D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2D80 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2D83 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2D86 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2D89 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2D8C _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2D8F _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 2D92 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 2D96 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2D9A _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2D9E _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2DA2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2DA6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2DA9 _ 89. 04 24
        call    sheet_refresh_map                       ; 2DAC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2DB1 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2DB4 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2DB7 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2DBA _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2DBD _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2DC0 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2DC3 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2DC6 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2DC9 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2DCC _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2DCF _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2DD2 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2DD5 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2DD8 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2DDB _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2DDE _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 2DE1 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 2DE5 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2DE9 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2DED _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2DF1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2DF5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2DF8 _ 89. 04 24
        call    sheet_refresh_local                     ; 2DFB _ E8, FFFFFFFC(rel)
        jmp     ?_138                                   ; 2E00 _ E9, 0000026C

?_127:  mov     eax, dword [ebp+8H]                     ; 2E05 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2E08 _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 2E0B _ 3B. 45, F4
        jle     ?_130                                   ; 2E0E _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 2E10 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2E13 _ 89. 45, F0
        jmp     ?_129                                   ; 2E16 _ EB, 34

?_128:  mov     eax, dword [ebp-10H]                    ; 2E18 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2E1B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2E1E _ 8B. 45, 08
        add     edx, 4                                  ; 2E21 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2E24 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2E28 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2E2B _ 8B. 4D, F0
        add     ecx, 4                                  ; 2E2E _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2E31 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2E35 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2E38 _ 8B. 55, F0
        add     edx, 4                                  ; 2E3B _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2E3E _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2E42 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2E45 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2E48 _ 83. 45, F0, 01
?_129:  mov     eax, dword [ebp+8H]                     ; 2E4C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2E4F _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 2E52 _ 3B. 45, F0
        jg      ?_128                                   ; 2E55 _ 7F, C1
?_130:  mov     eax, dword [ebp+8H]                     ; 2E57 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2E5A _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 2E5D _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2E60 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2E63 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2E66 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2E69 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2E6C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2E6F _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2E72 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2E75 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2E78 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2E7B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2E7E _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2E81 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2E84 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2E87 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2E8A _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2E8D _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 2E90 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 2E98 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2E9C _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2EA0 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2EA4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2EA8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2EAB _ 89. 04 24
        call    sheet_refresh_map                       ; 2EAE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2EB3 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2EB6 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2EB9 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2EBC _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2EBF _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2EC2 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2EC5 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2EC8 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2ECB _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2ECE _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2ED1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2ED4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2ED7 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2EDA _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 2EDD _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 2EE5 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2EE9 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2EED _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2EF1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2EF5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2EF8 _ 89. 04 24
        call    sheet_refresh_local                     ; 2EFB _ E8, FFFFFFFC(rel)
        jmp     ?_138                                   ; 2F00 _ E9, 0000016C

?_131:  mov     eax, dword [ebp-0CH]                    ; 2F05 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2F08 _ 3B. 45, 10
        jge     ?_138                                   ; 2F0B _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 2F11 _ 83. 7D, F4, 00
        js      ?_134                                   ; 2F15 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 2F17 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2F1A _ 89. 45, F0
        jmp     ?_133                                   ; 2F1D _ EB, 34

?_132:  mov     eax, dword [ebp-10H]                    ; 2F1F _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2F22 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2F25 _ 8B. 45, 08
        add     edx, 4                                  ; 2F28 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2F2B _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2F2F _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2F32 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2F35 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2F38 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2F3C _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2F3F _ 8B. 55, F0
        add     edx, 4                                  ; 2F42 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2F45 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2F49 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2F4C _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2F4F _ 83. 45, F0, 01
?_133:  mov     eax, dword [ebp-10H]                    ; 2F53 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2F56 _ 3B. 45, 10
        jl      ?_132                                   ; 2F59 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 2F5B _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2F5E _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2F61 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2F64 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2F67 _ 89. 54 88, 04
        jmp     ?_137                                   ; 2F6B _ EB, 6C

?_134:  mov     eax, dword [ebp+8H]                     ; 2F6D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2F70 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2F73 _ 89. 45, F0
        jmp     ?_136                                   ; 2F76 _ EB, 3A

?_135:  mov     eax, dword [ebp-10H]                    ; 2F78 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 2F7B _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 2F7E _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2F81 _ 8B. 55, F0
        add     edx, 4                                  ; 2F84 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2F87 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2F8B _ 8B. 45, 08
        add     ecx, 4                                  ; 2F8E _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2F91 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 2F95 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2F98 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2F9B _ 8B. 45, 08
        add     edx, 4                                  ; 2F9E _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2FA1 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2FA5 _ 8B. 55, F0
        add     edx, 1                                  ; 2FA8 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 2FAB _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2FAE _ 83. 6D, F0, 01
?_136:  mov     eax, dword [ebp-10H]                    ; 2FB2 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2FB5 _ 3B. 45, 10
        jge     ?_135                                   ; 2FB8 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 2FBA _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2FBD _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2FC0 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2FC3 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2FC6 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2FCA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2FCD _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 2FD0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2FD3 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2FD6 _ 89. 50, 0C
?_137:  mov     eax, dword [ebp+0CH]                    ; 2FD9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2FDC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2FDF _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2FE2 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 2FE5 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2FE8 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2FEB _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2FEE _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2FF1 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2FF4 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2FF7 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2FFA _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2FFD _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 3000 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 3003 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3006 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 300A _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 300E _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 3012 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3016 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 301A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 301D _ 89. 04 24
        call    sheet_refresh_map                       ; 3020 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3025 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3028 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 302B _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 302E _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 3031 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 3034 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 3037 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 303A _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 303D _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 3040 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 3043 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 3046 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3049 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 304C _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 304F _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 3052 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 3056 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 305A _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 305E _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 3062 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3066 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3069 _ 89. 04 24
        call    sheet_refresh_local                     ; 306C _ E8, FFFFFFFC(rel)
?_138:  add     esp, 48                                 ; 3071 _ 83. C4, 30
        pop     ebx                                     ; 3074 _ 5B
        pop     esi                                     ; 3075 _ 5E
        pop     ebp                                     ; 3076 _ 5D
        ret                                             ; 3077 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 3078 _ 55
        mov     ebp, esp                                ; 3079 _ 89. E5
        push    edi                                     ; 307B _ 57
        push    esi                                     ; 307C _ 56
        push    ebx                                     ; 307D _ 53
        sub     esp, 44                                 ; 307E _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 3081 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3084 _ 8B. 40, 18
        test    eax, eax                                ; 3087 _ 85. C0
        js      ?_139                                   ; 3089 _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 308B _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 308E _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 3091 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 3094 _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 3097 _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 309A _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 309D _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 30A0 _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 30A3 _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 30A6 _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 30A9 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 30AC _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 30AF _ 8B. 55, 14
        add     ecx, edx                                ; 30B2 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 30B4 _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 30B7 _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 30BA _ 8B. 55, 10
        add     edx, edi                                ; 30BD _ 01. FA
        mov     dword [esp+14H], eax                    ; 30BF _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 30C3 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 30C7 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 30CB _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 30CF _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 30D3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 30D6 _ 89. 04 24
        call    sheet_refresh_local                     ; 30D9 _ E8, FFFFFFFC(rel)
?_139:  mov     eax, 0                                  ; 30DE _ B8, 00000000
        add     esp, 44                                 ; 30E3 _ 83. C4, 2C
        pop     ebx                                     ; 30E6 _ 5B
        pop     esi                                     ; 30E7 _ 5E
        pop     edi                                     ; 30E8 _ 5F
        pop     ebp                                     ; 30E9 _ 5D
        ret                                             ; 30EA _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 30EB _ 55
        mov     ebp, esp                                ; 30EC _ 89. E5
        push    ebx                                     ; 30EE _ 53
        sub     esp, 52                                 ; 30EF _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 30F2 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 30F5 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 30F8 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 30FB _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 30FE _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 3101 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 3104 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 3107 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 310A _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 310D _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 3110 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 3113 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 3116 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3119 _ 8B. 40, 18
        test    eax, eax                                ; 311C _ 85. C0
        js      ?_140                                   ; 311E _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 3124 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 3127 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 312A _ 8B. 45, F4
        add     edx, eax                                ; 312D _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 312F _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 3132 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 3135 _ 8B. 45, F0
        add     eax, ecx                                ; 3138 _ 01. C8
        mov     dword [esp+14H], 0                      ; 313A _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 3142 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 3146 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 314A _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 314D _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 3151 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 3154 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3158 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 315B _ 89. 04 24
        call    sheet_refresh_map                       ; 315E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 3163 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 3166 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 3169 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 316C _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 316F _ 8B. 55, 14
        add     ecx, edx                                ; 3172 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 3174 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 3177 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 317A _ 8B. 55, 10
        add     edx, ebx                                ; 317D _ 01. DA
        mov     dword [esp+14H], eax                    ; 317F _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 3183 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 3187 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 318B _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 318E _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 3192 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 3195 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3199 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 319C _ 89. 04 24
        call    sheet_refresh_map                       ; 319F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 31A4 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 31A7 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 31AA _ 8B. 45, F4
        add     edx, eax                                ; 31AD _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 31AF _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 31B2 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 31B5 _ 8B. 45, F0
        add     eax, ecx                                ; 31B8 _ 01. C8
        mov     dword [esp+14H], 0                      ; 31BA _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 31C2 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 31C6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 31CA _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 31CD _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 31D1 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 31D4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 31D8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 31DB _ 89. 04 24
        call    sheet_refresh_local                     ; 31DE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 31E3 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 31E6 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 31E9 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 31EC _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 31EF _ 8B. 55, 14
        add     ecx, edx                                ; 31F2 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 31F4 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 31F7 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 31FA _ 8B. 55, 10
        add     edx, ebx                                ; 31FD _ 01. DA
        mov     dword [esp+14H], eax                    ; 31FF _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 3203 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 3207 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 320B _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 320E _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 3212 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 3215 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 3219 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 321C _ 89. 04 24
        call    sheet_refresh_local                     ; 321F _ E8, FFFFFFFC(rel)
?_140:  add     esp, 52                                 ; 3224 _ 83. C4, 34
        pop     ebx                                     ; 3227 _ 5B
        pop     ebp                                     ; 3228 _ 5D
        ret                                             ; 3229 _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 322A _ 55
        mov     ebp, esp                                ; 322B _ 89. E5
        sub     esp, 48                                 ; 322D _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 3230 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 3233 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 3235 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 3238 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 323B _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 323E _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 3241 _ 83. 7D, 0C, 00
        jns     ?_141                                   ; 3245 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 3247 _ C7. 45, 0C, 00000000
?_141:  cmp     dword [ebp+10H], 0                      ; 324E _ 83. 7D, 10, 00
        jns     ?_142                                   ; 3252 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 3254 _ C7. 45, 10, 00000000
?_142:  mov     eax, dword [ebp+8H]                     ; 325B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 325E _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 3261 _ 3B. 45, 14
        jge     ?_143                                   ; 3264 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3266 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3269 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 326C _ 89. 45, 14
?_143:  mov     eax, dword [ebp+8H]                     ; 326F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3272 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 3275 _ 3B. 45, 18
        jge     ?_144                                   ; 3278 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 327A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 327D _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 3280 _ 89. 45, 18
?_144:  mov     eax, dword [ebp+1CH]                    ; 3283 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 3286 _ 89. 45, DC
        jmp     ?_151                                   ; 3289 _ E9, 00000119

?_145:  mov     eax, dword [ebp+8H]                     ; 328E _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 3291 _ 8B. 55, DC
        add     edx, 4                                  ; 3294 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3297 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 329B _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 329E _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 32A1 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 32A3 _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 32A6 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 32A9 _ 8B. 45, 08
        add     eax, 1044                               ; 32AC _ 05, 00000414
        sub     edx, eax                                ; 32B1 _ 29. C2
        mov     eax, edx                                ; 32B3 _ 89. D0
        sar     eax, 5                                  ; 32B5 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 32B8 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 32BB _ C7. 45, E4, 00000000
        jmp     ?_150                                   ; 32C2 _ E9, 000000CD

?_146:  mov     eax, dword [ebp-10H]                    ; 32C7 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 32CA _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 32CD _ 8B. 45, E4
        add     eax, edx                                ; 32D0 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 32D2 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 32D5 _ C7. 45, E0, 00000000
        jmp     ?_149                                   ; 32DC _ E9, 000000A0

?_147:  mov     eax, dword [ebp-10H]                    ; 32E1 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 32E4 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 32E7 _ 8B. 45, E0
        add     eax, edx                                ; 32EA _ 01. D0
        mov     dword [ebp-4H], eax                     ; 32EC _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 32EF _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 32F2 _ 3B. 45, FC
        jg      ?_148                                   ; 32F5 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 32FB _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 32FE _ 3B. 45, 14
        jge     ?_148                                   ; 3301 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 3303 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 3306 _ 3B. 45, F8
        jg      ?_148                                   ; 3309 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 330B _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 330E _ 3B. 45, 18
        jge     ?_148                                   ; 3311 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 3313 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3316 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 3319 _ 0F AF. 45, E4
        mov     edx, eax                                ; 331D _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 331F _ 8B. 45, E0
        add     eax, edx                                ; 3322 _ 01. D0
        mov     edx, eax                                ; 3324 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 3326 _ 8B. 45, F4
        add     eax, edx                                ; 3329 _ 01. D0
        movzx   eax, byte [eax]                         ; 332B _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 332E _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 3331 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 3335 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 3338 _ 8B. 40, 14
        cmp     edx, eax                                ; 333B _ 39. C2
        jz      ?_148                                   ; 333D _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 333F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3342 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 3345 _ 0F AF. 45, F8
        mov     edx, eax                                ; 3349 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 334B _ 8B. 45, FC
        add     eax, edx                                ; 334E _ 01. D0
        mov     edx, eax                                ; 3350 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 3352 _ 8B. 45, EC
        add     eax, edx                                ; 3355 _ 01. D0
        movzx   eax, byte [eax]                         ; 3357 _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 335A _ 3A. 45, DA
        jnz     ?_148                                   ; 335D _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 335F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3362 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 3365 _ 0F AF. 45, F8
        mov     edx, eax                                ; 3369 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 336B _ 8B. 45, FC
        add     eax, edx                                ; 336E _ 01. D0
        mov     edx, eax                                ; 3370 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 3372 _ 8B. 45, E8
        add     edx, eax                                ; 3375 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 3377 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 337B _ 88. 02
?_148:  add     dword [ebp-20H], 1                      ; 337D _ 83. 45, E0, 01
?_149:  mov     eax, dword [ebp-10H]                    ; 3381 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 3384 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 3387 _ 3B. 45, E0
        jg      ?_147                                   ; 338A _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 3390 _ 83. 45, E4, 01
?_150:  mov     eax, dword [ebp-10H]                    ; 3394 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 3397 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 339A _ 3B. 45, E4
        jg      ?_146                                   ; 339D _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 33A3 _ 83. 45, DC, 01
?_151:  mov     eax, dword [ebp+8H]                     ; 33A7 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 33AA _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 33AD _ 3B. 45, DC
        jge     ?_145                                   ; 33B0 _ 0F 8D, FFFFFED8
        leave                                           ; 33B6 _ C9
        ret                                             ; 33B7 _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 33B8 _ 55
        mov     ebp, esp                                ; 33B9 _ 89. E5
        sub     esp, 64                                 ; 33BB _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 33BE _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 33C1 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 33C3 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 33C6 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 33C9 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 33CC _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 33CF _ 83. 7D, 0C, 00
        jns     ?_152                                   ; 33D3 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 33D5 _ C7. 45, 0C, 00000000
?_152:  cmp     dword [ebp+10H], 0                      ; 33DC _ 83. 7D, 10, 00
        jns     ?_153                                   ; 33E0 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 33E2 _ C7. 45, 10, 00000000
?_153:  mov     eax, dword [ebp+8H]                     ; 33E9 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 33EC _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 33EF _ 3B. 45, 14
        jge     ?_154                                   ; 33F2 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 33F4 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 33F7 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 33FA _ 89. 45, 14
?_154:  mov     eax, dword [ebp+8H]                     ; 33FD _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 3400 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 3403 _ 3B. 45, 18
        jge     ?_155                                   ; 3406 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 3408 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 340B _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 340E _ 89. 45, 18
?_155:  mov     eax, dword [ebp+1CH]                    ; 3411 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 3414 _ 89. 45, CC
        jmp     ?_166                                   ; 3417 _ E9, 00000141

?_156:  mov     eax, dword [ebp+8H]                     ; 341C _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 341F _ 8B. 55, CC
        add     edx, 4                                  ; 3422 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 3425 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 3429 _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 342C _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 342F _ 8B. 45, 08
        add     eax, 1044                               ; 3432 _ 05, 00000414
        sub     edx, eax                                ; 3437 _ 29. C2
        mov     eax, edx                                ; 3439 _ 89. D0
        sar     eax, 5                                  ; 343B _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 343E _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 3441 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 3444 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 3446 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 3449 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 344C _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 344F _ 8B. 55, 0C
        sub     edx, eax                                ; 3452 _ 29. C2
        mov     eax, edx                                ; 3454 _ 89. D0
        mov     dword [ebp-30H], eax                    ; 3456 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 3459 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 345C _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 345F _ 8B. 55, 10
        sub     edx, eax                                ; 3462 _ 29. C2
        mov     eax, edx                                ; 3464 _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 3466 _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 3469 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 346C _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 346F _ 8B. 55, 14
        sub     edx, eax                                ; 3472 _ 29. C2
        mov     eax, edx                                ; 3474 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 3476 _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 3479 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 347C _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 347F _ 8B. 55, 18
        sub     edx, eax                                ; 3482 _ 29. C2
        mov     eax, edx                                ; 3484 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 3486 _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 3489 _ 83. 7D, D0, 00
        jns     ?_157                                   ; 348D _ 79, 07
        mov     dword [ebp-30H], 0                      ; 348F _ C7. 45, D0, 00000000
?_157:  cmp     dword [ebp-2CH], 0                      ; 3496 _ 83. 7D, D4, 00
        jns     ?_158                                   ; 349A _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 349C _ C7. 45, D4, 00000000
?_158:  mov     eax, dword [ebp-10H]                    ; 34A3 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 34A6 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 34A9 _ 3B. 45, D8
        jge     ?_159                                   ; 34AC _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 34AE _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 34B1 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 34B4 _ 89. 45, D8
?_159:  mov     eax, dword [ebp-10H]                    ; 34B7 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 34BA _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 34BD _ 3B. 45, DC
        jge     ?_160                                   ; 34C0 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 34C2 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 34C5 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 34C8 _ 89. 45, DC
?_160:  mov     eax, dword [ebp-2CH]                    ; 34CB _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 34CE _ 89. 45, E4
        jmp     ?_165                                   ; 34D1 _ EB, 7A

?_161:  mov     eax, dword [ebp-10H]                    ; 34D3 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 34D6 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 34D9 _ 8B. 45, E4
        add     eax, edx                                ; 34DC _ 01. D0
        mov     dword [ebp-8H], eax                     ; 34DE _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 34E1 _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 34E4 _ 89. 45, E0
        jmp     ?_164                                   ; 34E7 _ EB, 58

?_162:  mov     eax, dword [ebp-10H]                    ; 34E9 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 34EC _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 34EF _ 8B. 45, E0
        add     eax, edx                                ; 34F2 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 34F4 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 34F7 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 34FA _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 34FD _ 0F AF. 45, E4
        mov     edx, eax                                ; 3501 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 3503 _ 8B. 45, E0
        add     eax, edx                                ; 3506 _ 01. D0
        mov     edx, eax                                ; 3508 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 350A _ 8B. 45, F4
        add     eax, edx                                ; 350D _ 01. D0
        movzx   eax, byte [eax]                         ; 350F _ 0F B6. 00
        movzx   edx, al                                 ; 3512 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 3515 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 3518 _ 8B. 40, 14
        cmp     edx, eax                                ; 351B _ 39. C2
        jz      ?_163                                   ; 351D _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 351F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3522 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 3525 _ 0F AF. 45, F8
        mov     edx, eax                                ; 3529 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 352B _ 8B. 45, FC
        add     eax, edx                                ; 352E _ 01. D0
        mov     edx, eax                                ; 3530 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 3532 _ 8B. 45, EC
        add     edx, eax                                ; 3535 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 3537 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 353B _ 88. 02
?_163:  add     dword [ebp-20H], 1                      ; 353D _ 83. 45, E0, 01
?_164:  mov     eax, dword [ebp-20H]                    ; 3541 _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 3544 _ 3B. 45, D8
        jl      ?_162                                   ; 3547 _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 3549 _ 83. 45, E4, 01
?_165:  mov     eax, dword [ebp-1CH]                    ; 354D _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 3550 _ 3B. 45, DC
        jl      ?_161                                   ; 3553 _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 3559 _ 83. 45, CC, 01
?_166:  mov     eax, dword [ebp+8H]                     ; 355D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3560 _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 3563 _ 3B. 45, CC
        jge     ?_156                                   ; 3566 _ 0F 8D, FFFFFEB0
        leave                                           ; 356C _ C9
        ret                                             ; 356D _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 356E _ 55
        mov     ebp, esp                                ; 356F _ 89. E5
        sub     esp, 40                                 ; 3571 _ 83. EC, 28
        mov     dword [esp+4H], 52                      ; 3574 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 357C _ C7. 04 24, 00000043
        call    io_out8                                 ; 3583 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 3588 _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 3590 _ C7. 04 24, 00000040
        call    io_out8                                 ; 3597 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 359C _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 35A4 _ C7. 04 24, 00000040
        call    io_out8                                 ; 35AB _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 35B0 _ C7. 05, 000003C0(d), 00000000
        mov     dword [ebp-0CH], 0                      ; 35BA _ C7. 45, F4, 00000000
        jmp     ?_168                                   ; 35C1 _ EB, 28

?_167:  mov     eax, dword [ebp-0CH]                    ; 35C3 _ 8B. 45, F4
        shl     eax, 4                                  ; 35C6 _ C1. E0, 04
        add     eax, timer_control                      ; 35C9 _ 05, 000003C0(d)
        mov     dword [eax+8H], 0                       ; 35CE _ C7. 40, 08, 00000000
        mov     eax, dword [ebp-0CH]                    ; 35D5 _ 8B. 45, F4
        shl     eax, 4                                  ; 35D8 _ C1. E0, 04
        add     eax, timer_control                      ; 35DB _ 05, 000003C0(d)
        mov     dword [eax+0CH], 0                      ; 35E0 _ C7. 40, 0C, 00000000
        add     dword [ebp-0CH], 1                      ; 35E7 _ 83. 45, F4, 01
?_168:  cmp     dword [ebp-0CH], 499                    ; 35EB _ 81. 7D, F4, 000001F3
        jle     ?_167                                   ; 35F2 _ 7E, CF
        leave                                           ; 35F4 _ C9
        ret                                             ; 35F5 _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 35F6 _ 55
        mov     ebp, esp                                ; 35F7 _ 89. E5
        mov     eax, timer_control                      ; 35F9 _ B8, 000003C0(d)
        pop     ebp                                     ; 35FE _ 5D
        ret                                             ; 35FF _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 3600 _ 55
        mov     ebp, esp                                ; 3601 _ 89. E5
        sub     esp, 16                                 ; 3603 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3606 _ C7. 45, FC, 00000000
        jmp     ?_171                                   ; 360D _ EB, 26

?_169:  mov     eax, dword [ebp-4H]                     ; 360F _ 8B. 45, FC
        shl     eax, 4                                  ; 3612 _ C1. E0, 04
        add     eax, timer_control                      ; 3615 _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 361A _ 8B. 40, 08
        test    eax, eax                                ; 361D _ 85. C0
        jnz     ?_170                                   ; 361F _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 3621 _ 8B. 45, FC
        shl     eax, 4                                  ; 3624 _ C1. E0, 04
        add     eax, timer_control                      ; 3627 _ 05, 000003C0(d)
        add     eax, 4                                  ; 362C _ 83. C0, 04
        jmp     ?_172                                   ; 362F _ EB, 0D

?_170:  add     dword [ebp-4H], 1                       ; 3631 _ 83. 45, FC, 01
?_171:  cmp     dword [ebp-4H], 499                     ; 3635 _ 81. 7D, FC, 000001F3
        jle     ?_169                                   ; 363C _ 7E, D1
?_172:  leave                                           ; 363E _ C9
        ret                                             ; 363F _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 3640 _ 55
        mov     ebp, esp                                ; 3641 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3643 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 3646 _ C7. 40, 04, 00000000
        pop     ebp                                     ; 364D _ 5D
        ret                                             ; 364E _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 364F _ 55
        mov     ebp, esp                                ; 3650 _ 89. E5
        sub     esp, 4                                  ; 3652 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 3655 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 3658 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 365B _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 365E _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 3661 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 3664 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 3667 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 366B _ 88. 50, 0C
        leave                                           ; 366E _ C9
        ret                                             ; 366F _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 3670 _ 55
        mov     ebp, esp                                ; 3671 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3673 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3676 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3679 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 367B _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 367E _ C7. 40, 04, 00000002
        pop     ebp                                     ; 3685 _ 5D
        ret                                             ; 3686 _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 3687 _ 55
        mov     ebp, esp                                ; 3688 _ 89. E5
        sub     esp, 40                                 ; 368A _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 368D _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 3695 _ C7. 04 24, 00000020
        call    io_out8                                 ; 369C _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 36A1 _ A1, 000003C0(d)
        add     eax, 1                                  ; 36A6 _ 83. C0, 01
        mov     dword [timer_control], eax              ; 36A9 _ A3, 000003C0(d)
        mov     byte [ebp-0DH], 0                       ; 36AE _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 36B2 _ C7. 45, F4, 00000000
        jmp     ?_176                                   ; 36B9 _ E9, 000000B0

?_173:  mov     eax, dword [ebp-0CH]                    ; 36BE _ 8B. 45, F4
        shl     eax, 4                                  ; 36C1 _ C1. E0, 04
        add     eax, timer_control                      ; 36C4 _ 05, 000003C0(d)
        mov     eax, dword [eax+8H]                     ; 36C9 _ 8B. 40, 08
        cmp     eax, 2                                  ; 36CC _ 83. F8, 02
        jne     ?_174                                   ; 36CF _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 36D5 _ 8B. 45, F4
        shl     eax, 4                                  ; 36D8 _ C1. E0, 04
        add     eax, timer_control                      ; 36DB _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 36E0 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 36E3 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 36E6 _ 8B. 45, F4
        shl     eax, 4                                  ; 36E9 _ C1. E0, 04
        add     eax, timer_control                      ; 36EC _ 05, 000003C0(d)
        mov     dword [eax+4H], edx                     ; 36F1 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 36F4 _ 8B. 45, F4
        shl     eax, 4                                  ; 36F7 _ C1. E0, 04
        add     eax, timer_control                      ; 36FA _ 05, 000003C0(d)
        mov     eax, dword [eax+4H]                     ; 36FF _ 8B. 40, 04
        test    eax, eax                                ; 3702 _ 85. C0
        jnz     ?_174                                   ; 3704 _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 3706 _ 8B. 45, F4
        shl     eax, 4                                  ; 3709 _ C1. E0, 04
        add     eax, timer_control                      ; 370C _ 05, 000003C0(d)
        mov     dword [eax+8H], 1                       ; 3711 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 3718 _ 8B. 45, F4
        shl     eax, 4                                  ; 371B _ C1. E0, 04
        add     eax, timer_control                      ; 371E _ 05, 000003C0(d)
        movzx   eax, byte [eax+10H]                     ; 3723 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 3727 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 372A _ 8B. 45, F4
        shl     eax, 4                                  ; 372D _ C1. E0, 04
        add     eax, timer_control                      ; 3730 _ 05, 000003C0(d)
        mov     eax, dword [eax+0CH]                    ; 3735 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 3738 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 373C _ 89. 04 24
        call    fifo8_put                               ; 373F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3744 _ 8B. 45, F4
        shl     eax, 4                                  ; 3747 _ C1. E0, 04
        add     eax, timer_control                      ; 374A _ 05, 000003C0(d)
        lea     edx, [eax+4H]                           ; 374F _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 3752 _ A1, 00000000(d)
        cmp     edx, eax                                ; 3757 _ 39. C2
        jnz     ?_174                                   ; 3759 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 375B _ C6. 45, F3, 01
?_174:  cmp     byte [ebp-0DH], 0                       ; 375F _ 80. 7D, F3, 00
        jz      ?_175                                   ; 3763 _ 74, 05
        call    task_switch                             ; 3765 _ E8, FFFFFFFC(rel)
?_175:  add     dword [ebp-0CH], 1                      ; 376A _ 83. 45, F4, 01
?_176:  cmp     dword [ebp-0CH], 499                    ; 376E _ 81. 7D, F4, 000001F3
        jle     ?_173                                   ; 3775 _ 0F 8E, FFFFFF43
        leave                                           ; 377B _ C9
        ret                                             ; 377C _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 377D _ 55
        mov     ebp, esp                                ; 377E _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 3780 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_177                                   ; 3787 _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 3789 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 3790 _ 8B. 45, 0C
        shr     eax, 12                                 ; 3793 _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 3796 _ 89. 45, 0C
?_177:  mov     eax, dword [ebp+0CH]                    ; 3799 _ 8B. 45, 0C
        mov     edx, eax                                ; 379C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 379E _ 8B. 45, 08
        mov     word [eax], dx                          ; 37A1 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 37A4 _ 8B. 45, 10
        mov     edx, eax                                ; 37A7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 37A9 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 37AC _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 37B0 _ 8B. 45, 10
        sar     eax, 16                                 ; 37B3 _ C1. F8, 10
        mov     edx, eax                                ; 37B6 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 37B8 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 37BB _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 37BE _ 8B. 45, 14
        mov     edx, eax                                ; 37C1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 37C3 _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 37C6 _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 37C9 _ 8B. 45, 0C
        shr     eax, 16                                 ; 37CC _ C1. E8, 10
        and     eax, 0FH                                ; 37CF _ 83. E0, 0F
        mov     edx, eax                                ; 37D2 _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 37D4 _ 8B. 45, 14
        sar     eax, 8                                  ; 37D7 _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 37DA _ 83. E0, F0
        or      eax, edx                                ; 37DD _ 09. D0
        mov     edx, eax                                ; 37DF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 37E1 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 37E4 _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 37E7 _ 8B. 45, 10
        shr     eax, 24                                 ; 37EA _ C1. E8, 18
        mov     edx, eax                                ; 37ED _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 37EF _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 37F2 _ 88. 50, 07
        pop     ebp                                     ; 37F5 _ 5D
        ret                                             ; 37F6 _ C3
; segment_descriptor End of function

init_task_level:; Function begin
        push    ebp                                     ; 37F7 _ 55
        mov     ebp, esp                                ; 37F8 _ 89. E5
        sub     esp, 16                                 ; 37FA _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 37FD _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp+8H]                     ; 3803 _ 8B. 55, 08
        mov     eax, edx                                ; 3806 _ 89. D0
        shl     eax, 2                                  ; 3808 _ C1. E0, 02
        add     eax, edx                                ; 380B _ 01. D0
        shl     eax, 2                                  ; 380D _ C1. E0, 02
        add     eax, ecx                                ; 3810 _ 01. C8
        add     eax, 8                                  ; 3812 _ 83. C0, 08
        mov     dword [eax], 0                          ; 3815 _ C7. 00, 00000000
        mov     ecx, dword [task_control]               ; 381B _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp+8H]                     ; 3821 _ 8B. 55, 08
        mov     eax, edx                                ; 3824 _ 89. D0
        shl     eax, 2                                  ; 3826 _ C1. E0, 02
        add     eax, edx                                ; 3829 _ 01. D0
        shl     eax, 2                                  ; 382B _ C1. E0, 02
        add     eax, ecx                                ; 382E _ 01. C8
        add     eax, 12                                 ; 3830 _ 83. C0, 0C
        mov     dword [eax], 0                          ; 3833 _ C7. 00, 00000000
        mov     dword [ebp-4H], 0                       ; 3839 _ C7. 45, FC, 00000000
        jmp     ?_179                                   ; 3840 _ EB, 21

?_178:  mov     ecx, dword [task_control]               ; 3842 _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 3848 _ 8B. 55, FC
        mov     eax, edx                                ; 384B _ 89. D0
        add     eax, eax                                ; 384D _ 01. C0
        add     eax, edx                                ; 384F _ 01. D0
        shl     eax, 3                                  ; 3851 _ C1. E0, 03
        add     eax, ecx                                ; 3854 _ 01. C8
        add     eax, 16                                 ; 3856 _ 83. C0, 10
        mov     dword [eax], 0                          ; 3859 _ C7. 00, 00000000
        add     dword [ebp-4H], 1                       ; 385F _ 83. 45, FC, 01
?_179:  cmp     dword [ebp-4H], 2                       ; 3863 _ 83. 7D, FC, 02
        jle     ?_178                                   ; 3867 _ 7E, D9
        leave                                           ; 3869 _ C9
        ret                                             ; 386A _ C3
; init_task_level End of function

task_init:; Function begin
        push    ebp                                     ; 386B _ 55
        mov     ebp, esp                                ; 386C _ 89. E5
        push    ebx                                     ; 386E _ 53
        sub     esp, 36                                 ; 386F _ 83. EC, 24
        call    get_addr_gdt                            ; 3872 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 3877 _ 89. 45, F0
        mov     dword [esp+4H], 668                     ; 387A _ C7. 44 24, 04, 0000029C
        mov     eax, dword [ebp+8H]                     ; 3882 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3885 _ 89. 04 24
        call    memman_alloc_4k                         ; 3888 _ E8, FFFFFFFC(rel)
        mov     dword [task_control], eax               ; 388D _ A3, 00002308(d)
        mov     dword [ebp-14H], 0                      ; 3892 _ C7. 45, EC, 00000000
        jmp     ?_181                                   ; 3899 _ E9, 00000094

?_180:  mov     ecx, dword [task_control]               ; 389E _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 38A4 _ 8B. 45, EC
        shl     eax, 3                                  ; 38A7 _ C1. E0, 03
        mov     edx, eax                                ; 38AA _ 89. C2
        shl     edx, 4                                  ; 38AC _ C1. E2, 04
        sub     edx, eax                                ; 38AF _ 29. C2
        lea     eax, [ecx+edx]                          ; 38B1 _ 8D. 04 11
        add     eax, 72                                 ; 38B4 _ 83. C0, 48
        mov     dword [eax], 0                          ; 38B7 _ C7. 00, 00000000
        mov     ebx, dword [task_control]               ; 38BD _ 8B. 1D, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 38C3 _ 8B. 45, EC
        add     eax, 8                                  ; 38C6 _ 83. C0, 08
        lea     ecx, [eax*8]                            ; 38C9 _ 8D. 0C C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 38D0 _ 8B. 45, EC
        shl     eax, 3                                  ; 38D3 _ C1. E0, 03
        mov     edx, eax                                ; 38D6 _ 89. C2
        shl     edx, 4                                  ; 38D8 _ C1. E2, 04
        sub     edx, eax                                ; 38DB _ 29. C2
        lea     eax, [ebx+edx]                          ; 38DD _ 8D. 04 13
        add     eax, 68                                 ; 38E0 _ 83. C0, 44
        mov     dword [eax], ecx                        ; 38E3 _ 89. 08
        mov     ecx, dword [task_control]               ; 38E5 _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-14H]                    ; 38EB _ 8B. 45, EC
        shl     eax, 3                                  ; 38EE _ C1. E0, 03
        mov     edx, eax                                ; 38F1 _ 89. C2
        shl     edx, 4                                  ; 38F3 _ C1. E2, 04
        sub     edx, eax                                ; 38F6 _ 29. C2
        lea     eax, [edx+50H]                          ; 38F8 _ 8D. 42, 50
        add     eax, ecx                                ; 38FB _ 01. C8
        add     eax, 4                                  ; 38FD _ 83. C0, 04
        mov     edx, dword [ebp-14H]                    ; 3900 _ 8B. 55, EC
        add     edx, 8                                  ; 3903 _ 83. C2, 08
        lea     ecx, [edx*8]                            ; 3906 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 390D _ 8B. 55, F0
        add     edx, ecx                                ; 3910 _ 01. CA
        mov     dword [esp+0CH], 137                    ; 3912 _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 391A _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 391E _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 3926 _ 89. 14 24
        call    segment_descriptor                      ; 3929 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 392E _ 83. 45, EC, 01
?_181:  cmp     dword [ebp-14H], 4                      ; 3932 _ 83. 7D, EC, 04
        jle     ?_180                                   ; 3936 _ 0F 8E, FFFFFF62
        mov     dword [ebp-14H], 0                      ; 393C _ C7. 45, EC, 00000000
        jmp     ?_183                                   ; 3943 _ EB, 0F

?_182:  mov     eax, dword [ebp-14H]                    ; 3945 _ 8B. 45, EC
        mov     dword [esp], eax                        ; 3948 _ 89. 04 24
        call    init_task_level                         ; 394B _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 3950 _ 83. 45, EC, 01
?_183:  cmp     dword [ebp-14H], 2                      ; 3954 _ 83. 7D, EC, 02
        jle     ?_182                                   ; 3958 _ 7E, EB
        call    task_alloc                              ; 395A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 395F _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 3962 _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 3965 _ C7. 40, 04, 00000002
        mov     eax, dword [ebp-0CH]                    ; 396C _ 8B. 45, F4
        mov     dword [eax+8H], 100                     ; 396F _ C7. 40, 08, 00000064
        mov     eax, dword [ebp-0CH]                    ; 3976 _ 8B. 45, F4
        mov     dword [eax+0CH], 0                      ; 3979 _ C7. 40, 0C, 00000000
        mov     eax, dword [ebp-0CH]                    ; 3980 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 3983 _ 89. 04 24
        call    task_add                                ; 3986 _ E8, FFFFFFFC(rel)
        call    task_switch_sub                         ; 398B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3990 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 3993 _ 8B. 00
        mov     dword [esp], eax                        ; 3995 _ 89. 04 24
        call    load_tr                                 ; 3998 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 399D _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 39A2 _ A3, 00002304(d)
        mov     eax, dword [ebp-0CH]                    ; 39A7 _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 39AA _ 8B. 40, 08
        mov     edx, eax                                ; 39AD _ 89. C2
        mov     eax, dword [task_timer]                 ; 39AF _ A1, 00002304(d)
        mov     dword [esp+4H], edx                     ; 39B4 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 39B8 _ 89. 04 24
        call    timer_settime                           ; 39BB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 39C0 _ 8B. 45, F4
        add     esp, 36                                 ; 39C3 _ 83. C4, 24
        pop     ebx                                     ; 39C6 _ 5B
        pop     ebp                                     ; 39C7 _ 5D
        ret                                             ; 39C8 _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 39C9 _ 55
        mov     ebp, esp                                ; 39CA _ 89. E5
        sub     esp, 16                                 ; 39CC _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 39CF _ C7. 45, F8, 00000000
        jmp     ?_186                                   ; 39D6 _ E9, 000000F1

?_184:  mov     ecx, dword [task_control]               ; 39DB _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-8H]                     ; 39E1 _ 8B. 45, F8
        shl     eax, 3                                  ; 39E4 _ C1. E0, 03
        mov     edx, eax                                ; 39E7 _ 89. C2
        shl     edx, 4                                  ; 39E9 _ C1. E2, 04
        sub     edx, eax                                ; 39EC _ 29. C2
        lea     eax, [ecx+edx]                          ; 39EE _ 8D. 04 11
        add     eax, 72                                 ; 39F1 _ 83. C0, 48
        mov     eax, dword [eax]                        ; 39F4 _ 8B. 00
        test    eax, eax                                ; 39F6 _ 85. C0
        jne     ?_185                                   ; 39F8 _ 0F 85, 000000CA
        mov     ecx, dword [task_control]               ; 39FE _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp-8H]                     ; 3A04 _ 8B. 45, F8
        shl     eax, 3                                  ; 3A07 _ C1. E0, 03
        mov     edx, eax                                ; 3A0A _ 89. C2
        shl     edx, 4                                  ; 3A0C _ C1. E2, 04
        sub     edx, eax                                ; 3A0F _ 29. C2
        lea     eax, [edx+40H]                          ; 3A11 _ 8D. 42, 40
        add     eax, ecx                                ; 3A14 _ 01. C8
        add     eax, 4                                  ; 3A16 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 3A19 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3A1C _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 3A1F _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 3A26 _ 8B. 45, FC
        mov     dword [eax+34H], 514                    ; 3A29 _ C7. 40, 34, 00000202
        mov     eax, dword [ebp-4H]                     ; 3A30 _ 8B. 45, FC
        mov     dword [eax+38H], 0                      ; 3A33 _ C7. 40, 38, 00000000
        mov     eax, dword [ebp-4H]                     ; 3A3A _ 8B. 45, FC
        mov     dword [eax+3CH], 0                      ; 3A3D _ C7. 40, 3C, 00000000
        mov     eax, dword [ebp-4H]                     ; 3A44 _ 8B. 45, FC
        mov     dword [eax+40H], 0                      ; 3A47 _ C7. 40, 40, 00000000
        mov     eax, dword [ebp-4H]                     ; 3A4E _ 8B. 45, FC
        mov     dword [eax+44H], 0                      ; 3A51 _ C7. 40, 44, 00000000
        mov     eax, dword [ebp-8H]                     ; 3A58 _ 8B. 45, F8
        add     eax, 1                                  ; 3A5B _ 83. C0, 01
        shl     eax, 9                                  ; 3A5E _ C1. E0, 09
        mov     edx, eax                                ; 3A61 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 3A63 _ 8B. 45, FC
        mov     dword [eax+48H], edx                    ; 3A66 _ 89. 50, 48
        mov     eax, dword [ebp-4H]                     ; 3A69 _ 8B. 45, FC
        mov     dword [eax+4CH], 0                      ; 3A6C _ C7. 40, 4C, 00000000
        mov     eax, dword [ebp-4H]                     ; 3A73 _ 8B. 45, FC
        mov     dword [eax+50H], 0                      ; 3A76 _ C7. 40, 50, 00000000
        mov     eax, dword [ebp-4H]                     ; 3A7D _ 8B. 45, FC
        mov     dword [eax+54H], 0                      ; 3A80 _ C7. 40, 54, 00000000
        mov     eax, dword [ebp-4H]                     ; 3A87 _ 8B. 45, FC
        mov     dword [eax+58H], 0                      ; 3A8A _ C7. 40, 58, 00000000
        mov     eax, dword [ebp-4H]                     ; 3A91 _ 8B. 45, FC
        mov     dword [eax+64H], 0                      ; 3A94 _ C7. 40, 64, 00000000
        mov     eax, dword [ebp-4H]                     ; 3A9B _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 3A9E _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-4H]                     ; 3AA5 _ 8B. 45, FC
        mov     dword [eax+6CH], 0                      ; 3AA8 _ C7. 40, 6C, 00000000
        mov     eax, dword [ebp-4H]                     ; 3AAF _ 8B. 45, FC
        mov     dword [eax+70H], 0                      ; 3AB2 _ C7. 40, 70, 00000000
        mov     eax, dword [ebp-4H]                     ; 3AB9 _ 8B. 45, FC
        mov     dword [eax+74H], 1073741824             ; 3ABC _ C7. 40, 74, 40000000
        mov     eax, dword [ebp-4H]                     ; 3AC3 _ 8B. 45, FC
        jmp     ?_187                                   ; 3AC6 _ EB, 13

?_185:  add     dword [ebp-8H], 1                       ; 3AC8 _ 83. 45, F8, 01
?_186:  cmp     dword [ebp-8H], 4                       ; 3ACC _ 83. 7D, F8, 04
        jle     ?_184                                   ; 3AD0 _ 0F 8E, FFFFFF05
        mov     eax, 0                                  ; 3AD6 _ B8, 00000000
?_187:  leave                                           ; 3ADB _ C9
        ret                                             ; 3ADC _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 3ADD _ 55
        mov     ebp, esp                                ; 3ADE _ 89. E5
        sub     esp, 24                                 ; 3AE0 _ 83. EC, 18
        cmp     dword [ebp+0CH], 0                      ; 3AE3 _ 83. 7D, 0C, 00
        jns     ?_188                                   ; 3AE7 _ 79, 09
        mov     eax, dword [ebp+8H]                     ; 3AE9 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3AEC _ 8B. 40, 0C
        mov     dword [ebp+0CH], eax                    ; 3AEF _ 89. 45, 0C
?_188:  cmp     dword [ebp+10H], 0                      ; 3AF2 _ 83. 7D, 10, 00
        jle     ?_189                                   ; 3AF6 _ 7E, 09
        mov     eax, dword [ebp+8H]                     ; 3AF8 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 3AFB _ 8B. 55, 10
        mov     dword [eax+8H], edx                     ; 3AFE _ 89. 50, 08
?_189:  mov     eax, dword [ebp+8H]                     ; 3B01 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3B04 _ 8B. 40, 04
        cmp     eax, 2                                  ; 3B07 _ 83. F8, 02
        jnz     ?_190                                   ; 3B0A _ 75, 16
        mov     eax, dword [ebp+8H]                     ; 3B0C _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 3B0F _ 8B. 40, 0C
        cmp     eax, dword [ebp+0CH]                    ; 3B12 _ 3B. 45, 0C
        jz      ?_190                                   ; 3B15 _ 74, 0B
        mov     eax, dword [ebp+8H]                     ; 3B17 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B1A _ 89. 04 24
        call    task_remove                             ; 3B1D _ E8, FFFFFFFC(rel)
?_190:  mov     eax, dword [ebp+8H]                     ; 3B22 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3B25 _ 8B. 40, 04
        cmp     eax, 2                                  ; 3B28 _ 83. F8, 02
        jz      ?_191                                   ; 3B2B _ 74, 14
        mov     eax, dword [ebp+8H]                     ; 3B2D _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3B30 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 3B33 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 3B36 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3B39 _ 89. 04 24
        call    task_add                                ; 3B3C _ E8, FFFFFFFC(rel)
?_191:  mov     eax, dword [task_control]               ; 3B41 _ A1, 00002308(d)
        mov     dword [eax+4H], 1                       ; 3B46 _ C7. 40, 04, 00000001
        leave                                           ; 3B4D _ C9
        ret                                             ; 3B4E _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 3B4F _ 55
        mov     ebp, esp                                ; 3B50 _ 89. E5
        sub     esp, 40                                 ; 3B52 _ 83. EC, 28
        mov     ecx, dword [task_control]               ; 3B55 _ 8B. 0D, 00002308(d)
        mov     eax, dword [task_control]               ; 3B5B _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 3B60 _ 8B. 10
        mov     eax, edx                                ; 3B62 _ 89. D0
        shl     eax, 2                                  ; 3B64 _ C1. E0, 02
        add     eax, edx                                ; 3B67 _ 01. D0
        shl     eax, 2                                  ; 3B69 _ C1. E0, 02
        add     eax, ecx                                ; 3B6C _ 01. C8
        add     eax, 8                                  ; 3B6E _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 3B71 _ 89. 45, EC
        mov     eax, dword [ebp-14H]                    ; 3B74 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 3B77 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 3B7A _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 3B7D _ 8B. 44 90, 08
        mov     dword [ebp-10H], eax                    ; 3B81 _ 89. 45, F0
        mov     eax, dword [ebp-14H]                    ; 3B84 _ 8B. 45, EC
        mov     eax, dword [eax+4H]                     ; 3B87 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 3B8A _ 8D. 50, 01
        mov     eax, dword [ebp-14H]                    ; 3B8D _ 8B. 45, EC
        mov     dword [eax+4H], edx                     ; 3B90 _ 89. 50, 04
        mov     eax, dword [ebp-14H]                    ; 3B93 _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 3B96 _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 3B99 _ 8B. 45, EC
        mov     eax, dword [eax]                        ; 3B9C _ 8B. 00
        cmp     edx, eax                                ; 3B9E _ 39. C2
        jnz     ?_192                                   ; 3BA0 _ 75, 0A
        mov     eax, dword [ebp-14H]                    ; 3BA2 _ 8B. 45, EC
        mov     dword [eax+4H], 0                       ; 3BA5 _ C7. 40, 04, 00000000
?_192:  mov     eax, dword [task_control]               ; 3BAC _ A1, 00002308(d)
        mov     eax, dword [eax+4H]                     ; 3BB1 _ 8B. 40, 04
        test    eax, eax                                ; 3BB4 _ 85. C0
        jz      ?_193                                   ; 3BB6 _ 74, 24
        call    task_switch_sub                         ; 3BB8 _ E8, FFFFFFFC(rel)
        mov     ecx, dword [task_control]               ; 3BBD _ 8B. 0D, 00002308(d)
        mov     eax, dword [task_control]               ; 3BC3 _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 3BC8 _ 8B. 10
        mov     eax, edx                                ; 3BCA _ 89. D0
        shl     eax, 2                                  ; 3BCC _ C1. E0, 02
        add     eax, edx                                ; 3BCF _ 01. D0
        shl     eax, 2                                  ; 3BD1 _ C1. E0, 02
        add     eax, ecx                                ; 3BD4 _ 01. C8
        add     eax, 8                                  ; 3BD6 _ 83. C0, 08
        mov     dword [ebp-14H], eax                    ; 3BD9 _ 89. 45, EC
?_193:  mov     eax, dword [ebp-14H]                    ; 3BDC _ 8B. 45, EC
        mov     edx, dword [eax+4H]                     ; 3BDF _ 8B. 50, 04
        mov     eax, dword [ebp-14H]                    ; 3BE2 _ 8B. 45, EC
        mov     eax, dword [eax+edx*4+8H]               ; 3BE5 _ 8B. 44 90, 08
        mov     dword [ebp-0CH], eax                    ; 3BE9 _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 3BEC _ 8B. 45, F4
        mov     eax, dword [eax+8H]                     ; 3BEF _ 8B. 40, 08
        mov     edx, eax                                ; 3BF2 _ 89. C2
        mov     eax, dword [task_timer]                 ; 3BF4 _ A1, 00002304(d)
        mov     dword [esp+4H], edx                     ; 3BF9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3BFD _ 89. 04 24
        call    timer_settime                           ; 3C00 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3C05 _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 3C08 _ 3B. 45, F0
        jz      ?_194                                   ; 3C0B _ 74, 1B
        cmp     dword [ebp-0CH], 0                      ; 3C0D _ 83. 7D, F4, 00
        jz      ?_194                                   ; 3C11 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 3C13 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 3C16 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 3C18 _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 3C1C _ C7. 04 24, 00000000
        call    farjmp                                  ; 3C23 _ E8, FFFFFFFC(rel)
?_194:  leave                                           ; 3C28 _ C9
        ret                                             ; 3C29 _ C3
; task_switch End of function

task_sleep:; Function begin
        push    ebp                                     ; 3C2A _ 55
        mov     ebp, esp                                ; 3C2B _ 89. E5
        sub     esp, 40                                 ; 3C2D _ 83. EC, 28
        mov     dword [ebp-0CH], 0                      ; 3C30 _ C7. 45, F4, 00000000
        mov     dword [ebp-10H], 0                      ; 3C37 _ C7. 45, F0, 00000000
        mov     eax, dword [ebp+8H]                     ; 3C3E _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 3C41 _ 8B. 40, 04
        cmp     eax, 2                                  ; 3C44 _ 83. F8, 02
        jnz     ?_195                                   ; 3C47 _ 75, 51
        call    task_now                                ; 3C49 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3C4E _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 3C51 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3C54 _ 89. 04 24
        call    task_remove                             ; 3C57 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], 1                      ; 3C5C _ C7. 45, F0, 00000001
        mov     eax, dword [ebp+8H]                     ; 3C63 _ 8B. 45, 08
        cmp     eax, dword [ebp-0CH]                    ; 3C66 _ 3B. 45, F4
        jnz     ?_195                                   ; 3C69 _ 75, 2F
        call    task_switch_sub                         ; 3C6B _ E8, FFFFFFFC(rel)
        call    task_now                                ; 3C70 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 3C75 _ 89. 45, F4
        mov     dword [ebp-10H], 2                      ; 3C78 _ C7. 45, F0, 00000002
        cmp     dword [ebp-0CH], 0                      ; 3C7F _ 83. 7D, F4, 00
        jz      ?_195                                   ; 3C83 _ 74, 15
        mov     eax, dword [ebp-0CH]                    ; 3C85 _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 3C88 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 3C8A _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 3C8E _ C7. 04 24, 00000000
        call    farjmp                                  ; 3C95 _ E8, FFFFFFFC(rel)
?_195:  mov     eax, dword [ebp-10H]                    ; 3C9A _ 8B. 45, F0
        leave                                           ; 3C9D _ C9
        ret                                             ; 3C9E _ C3
; task_sleep End of function

task_now:; Function begin
        push    ebp                                     ; 3C9F _ 55
        mov     ebp, esp                                ; 3CA0 _ 89. E5
        sub     esp, 16                                 ; 3CA2 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 3CA5 _ 8B. 0D, 00002308(d)
        mov     eax, dword [task_control]               ; 3CAB _ A1, 00002308(d)
        mov     edx, dword [eax]                        ; 3CB0 _ 8B. 10
        mov     eax, edx                                ; 3CB2 _ 89. D0
        shl     eax, 2                                  ; 3CB4 _ C1. E0, 02
        add     eax, edx                                ; 3CB7 _ 01. D0
        shl     eax, 2                                  ; 3CB9 _ C1. E0, 02
        add     eax, ecx                                ; 3CBC _ 01. C8
        add     eax, 8                                  ; 3CBE _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 3CC1 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3CC4 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 3CC7 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 3CCA _ 8B. 45, FC
        mov     eax, dword [eax+edx*4+8H]               ; 3CCD _ 8B. 44 90, 08
        leave                                           ; 3CD1 _ C9
        ret                                             ; 3CD2 _ C3
; task_now End of function

task_add:; Function begin
        push    ebp                                     ; 3CD3 _ 55
        mov     ebp, esp                                ; 3CD4 _ 89. E5
        sub     esp, 16                                 ; 3CD6 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 3CD9 _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp+8H]                     ; 3CDF _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 3CE2 _ 8B. 50, 0C
        mov     eax, edx                                ; 3CE5 _ 89. D0
        shl     eax, 2                                  ; 3CE7 _ C1. E0, 02
        add     eax, edx                                ; 3CEA _ 01. D0
        shl     eax, 2                                  ; 3CEC _ C1. E0, 02
        add     eax, ecx                                ; 3CEF _ 01. C8
        add     eax, 8                                  ; 3CF1 _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 3CF4 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3CF7 _ 8B. 45, FC
        mov     edx, dword [eax]                        ; 3CFA _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 3CFC _ 8B. 45, FC
        mov     ecx, dword [ebp+8H]                     ; 3CFF _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 3D02 _ 89. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 3D06 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 3D09 _ 8B. 00
        lea     edx, [eax+1H]                           ; 3D0B _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 3D0E _ 8B. 45, FC
        mov     dword [eax], edx                        ; 3D11 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3D13 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 3D16 _ C7. 40, 04, 00000002
        leave                                           ; 3D1D _ C9
        ret                                             ; 3D1E _ C3
; task_add End of function

task_remove:; Function begin
        push    ebp                                     ; 3D1F _ 55
        mov     ebp, esp                                ; 3D20 _ 89. E5
        sub     esp, 16                                 ; 3D22 _ 83. EC, 10
        mov     ecx, dword [task_control]               ; 3D25 _ 8B. 0D, 00002308(d)
        mov     eax, dword [ebp+8H]                     ; 3D2B _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 3D2E _ 8B. 50, 0C
        mov     eax, edx                                ; 3D31 _ 89. D0
        shl     eax, 2                                  ; 3D33 _ C1. E0, 02
        add     eax, edx                                ; 3D36 _ 01. D0
        shl     eax, 2                                  ; 3D38 _ C1. E0, 02
        add     eax, ecx                                ; 3D3B _ 01. C8
        add     eax, 8                                  ; 3D3D _ 83. C0, 08
        mov     dword [ebp-4H], eax                     ; 3D40 _ 89. 45, FC
        mov     dword [ebp-8H], 0                       ; 3D43 _ C7. 45, F8, 00000000
        jmp     ?_198                                   ; 3D4A _ EB, 23

?_196:  mov     eax, dword [ebp-4H]                     ; 3D4C _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 3D4F _ 8B. 55, F8
        mov     eax, dword [eax+edx*4+8H]               ; 3D52 _ 8B. 44 90, 08
        cmp     eax, dword [ebp+8H]                     ; 3D56 _ 3B. 45, 08
        jnz     ?_197                                   ; 3D59 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 3D5B _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 3D5E _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], 0                 ; 3D61 _ C7. 44 90, 08, 00000000
        jmp     ?_199                                   ; 3D69 _ EB, 0E

?_197:  add     dword [ebp-8H], 1                       ; 3D6B _ 83. 45, F8, 01
?_198:  mov     eax, dword [ebp-4H]                     ; 3D6F _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 3D72 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3D74 _ 3B. 45, F8
        jg      ?_196                                   ; 3D77 _ 7F, D3
?_199:  mov     eax, dword [ebp-4H]                     ; 3D79 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 3D7C _ 8B. 00
        lea     edx, [eax-1H]                           ; 3D7E _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 3D81 _ 8B. 45, FC
        mov     dword [eax], edx                        ; 3D84 _ 89. 10
        mov     eax, dword [ebp-4H]                     ; 3D86 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 3D89 _ 8B. 40, 04
        cmp     eax, dword [ebp-8H]                     ; 3D8C _ 3B. 45, F8
        jle     ?_200                                   ; 3D8F _ 7E, 0F
        mov     eax, dword [ebp-4H]                     ; 3D91 _ 8B. 45, FC
        mov     eax, dword [eax+4H]                     ; 3D94 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 3D97 _ 8D. 50, FF
        mov     eax, dword [ebp-4H]                     ; 3D9A _ 8B. 45, FC
        mov     dword [eax+4H], edx                     ; 3D9D _ 89. 50, 04
?_200:  mov     eax, dword [ebp-4H]                     ; 3DA0 _ 8B. 45, FC
        mov     edx, dword [eax+4H]                     ; 3DA3 _ 8B. 50, 04
        mov     eax, dword [ebp-4H]                     ; 3DA6 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 3DA9 _ 8B. 00
        cmp     edx, eax                                ; 3DAB _ 39. C2
        jl      ?_201                                   ; 3DAD _ 7C, 0A
        mov     eax, dword [ebp-4H]                     ; 3DAF _ 8B. 45, FC
        mov     dword [eax+4H], 0                       ; 3DB2 _ C7. 40, 04, 00000000
?_201:  mov     eax, dword [ebp+8H]                     ; 3DB9 _ 8B. 45, 08
        mov     dword [eax+4H], 1                       ; 3DBC _ C7. 40, 04, 00000001
        jmp     ?_203                                   ; 3DC3 _ EB, 1B

?_202:  mov     eax, dword [ebp-8H]                     ; 3DC5 _ 8B. 45, F8
        lea     edx, [eax+1H]                           ; 3DC8 _ 8D. 50, 01
        mov     eax, dword [ebp-4H]                     ; 3DCB _ 8B. 45, FC
        mov     ecx, dword [eax+edx*4+8H]               ; 3DCE _ 8B. 4C 90, 08
        mov     eax, dword [ebp-4H]                     ; 3DD2 _ 8B. 45, FC
        mov     edx, dword [ebp-8H]                     ; 3DD5 _ 8B. 55, F8
        mov     dword [eax+edx*4+8H], ecx               ; 3DD8 _ 89. 4C 90, 08
        add     dword [ebp-8H], 1                       ; 3DDC _ 83. 45, F8, 01
?_203:  mov     eax, dword [ebp-4H]                     ; 3DE0 _ 8B. 45, FC
        mov     eax, dword [eax]                        ; 3DE3 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 3DE5 _ 3B. 45, F8
        jg      ?_202                                   ; 3DE8 _ 7F, DB
        leave                                           ; 3DEA _ C9
        ret                                             ; 3DEB _ C3
; task_remove End of function

task_switch_sub:; Function begin
        push    ebp                                     ; 3DEC _ 55
        mov     ebp, esp                                ; 3DED _ 89. E5
        sub     esp, 16                                 ; 3DEF _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 3DF2 _ C7. 45, FC, 00000000
        jmp     ?_206                                   ; 3DF9 _ EB, 24

?_204:  mov     ecx, dword [task_control]               ; 3DFB _ 8B. 0D, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 3E01 _ 8B. 55, FC
        mov     eax, edx                                ; 3E04 _ 89. D0
        shl     eax, 2                                  ; 3E06 _ C1. E0, 02
        add     eax, edx                                ; 3E09 _ 01. D0
        shl     eax, 2                                  ; 3E0B _ C1. E0, 02
        add     eax, ecx                                ; 3E0E _ 01. C8
        add     eax, 8                                  ; 3E10 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 3E13 _ 8B. 00
        test    eax, eax                                ; 3E15 _ 85. C0
        jle     ?_205                                   ; 3E17 _ 7E, 02
        jmp     ?_207                                   ; 3E19 _ EB, 0A

?_205:  add     dword [ebp-4H], 1                       ; 3E1B _ 83. 45, FC, 01
?_206:  cmp     dword [ebp-4H], 2                       ; 3E1F _ 83. 7D, FC, 02
        jle     ?_204                                   ; 3E23 _ 7E, D6
?_207:  mov     eax, dword [task_control]               ; 3E25 _ A1, 00002308(d)
        mov     edx, dword [ebp-4H]                     ; 3E2A _ 8B. 55, FC
        mov     dword [eax], edx                        ; 3E2D _ 89. 10
        mov     eax, dword [task_control]               ; 3E2F _ A1, 00002308(d)
        mov     dword [eax+4H], 0                       ; 3E34 _ C7. 40, 04, 00000000
        leave                                           ; 3E3B _ C9
        ret                                             ; 3E3C _ C3
; task_switch_sub End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_208:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_209:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0007 _ console.

?_210:                                                  ; byte
        db 41H, 00H                                     ; 000F _ A.

?_211:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 0011 _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0019 _ sk b.

?_212:                                                  ; byte
        db 42H, 00H                                     ; 001E _ B.

?_213:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0020 _ page is:
        db 20H, 00H                                     ; 0028 _  .

?_214:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 002A _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0032 _ L: .

?_215:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0036 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 003E _ H: .

?_216:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0042 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 004A _ w: .

?_217:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 004E _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0056 _ gh: .

?_218:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 005B _ type: .

?_219:                                                  ; byte
        db 63H, 6FH, 6EH, 73H, 6FH, 6CH, 65H, 00H       ; 0062 _ console.


SECTION .data   align=32 noexecute                      ; section number 3, data

memman:                                                 ; dword
        dd 00100000H, 00000000H                         ; 0000 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0008 _ 0 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 

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

table_rgb.1737:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0080 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0088 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0090 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0098 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 00A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 00A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

cursor.1805:                                            ; byte
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

closebtn.1892:                                          ; byte
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

?_220:  db 00H                                          ; 02A2 _ .

?_221:  db 00H, 00H                                     ; 02A3 _ ..


SECTION .bss    align=32 noexecute                      ; section number 4, bss

sheet_control:                                          ; dword
        resd    1                                       ; 0000

back_sheet:                                             ; dword
        resd    1                                       ; 0004

mouse_sheet:                                            ; dword
        resd    1                                       ; 0008

timerinfo1.1739:                                        ; byte
        resb    28                                      ; 000C

timerbuf1.1742:                                         ; qword
        resq    1                                       ; 0028

timerinfo2.1740:                                        ; byte
        resb    28                                      ; 0030

timerbuf2.1743:                                         ; qword
        resq    1                                       ; 004C

timerinfo3.1741:                                        ; byte
        resb    28                                      ; 0054

timerbuf3.1744:                                         ; qword
        resq    1                                       ; 0070

task_a.1752:                                            ; dword
        resd    2                                       ; 0078

tss_b.1751:                                             ; byte
        resb    128                                     ; 0080

tss_a.1750:                                             ; byte
        resb    128                                     ; 0100

screen_info:                                            ; qword
        resb    4                                       ; 0180

?_222:  resw    1                                       ; 0184

?_223:  resw    13                                      ; 0186

mouse_cursor_buf:                                       ; byte
        resb    256                                     ; 01A0

back_buf: resd  1                                       ; 02A0

sheet_win:                                              ; dword
        resd    1                                       ; 02A4

mouse_x: resd   1                                       ; 02A8

mouse_y: resd   1                                       ; 02AC

mouse_send_info:                                        ; oword
        resb    16                                      ; 02B0

keyinfo:                                                ; byte
        resb    32                                      ; 02C0

keybuf:                                                 ; yword
        resb    32                                      ; 02E0

mouseinfo:                                              ; byte
        resb    32                                      ; 0300

mousebuf:                                               ; byte
        resb    128                                     ; 0320

str.1386:                                               ; byte
        resb    1                                       ; 03A0

?_224:  resb    9                                       ; 03A1

?_225:  resb    22                                      ; 03AA

timer_control:                                          ; byte
        resd    2001                                    ; 03C0

task_timer:                                             ; dword
        resd    1                                       ; 2304

task_control:                                           ; dword
        resd    1                                       ; 2308


