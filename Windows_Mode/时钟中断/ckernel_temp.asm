; Disassembly of file: ckernel.o
; Wed Feb 19 12:13:33 2020
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global CMain: function
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
global make_windows: function
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

extern mouse_y                                          ; dword
extern keyinfo                                          ; byte
extern memman                                           ; dword
extern back_buf                                         ; dword
extern io_out8                                          ; near
extern mouse_send_info                                  ; byte
extern io_sti                                           ; near
extern keybuf                                           ; byte
extern io_store_eflags                                  ; near
extern mouse_cursor_buf                                 ; byte
extern io_cli                                           ; near
extern screen_info                                      ; dword
extern io_in8                                           ; near
extern VRAM_ADDRESS                                     ; dword
extern mouseinfo                                        ; byte
extern systemFont                                       ; byte
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
        mov     dword [ebp-4CH], eax                    ; 0018 _ 89. 45, B4
        movzx   eax, word [screen_info+4H]              ; 001B _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0022 _ 98
        mov     dword [ebp-48H], eax                    ; 0023 _ 89. 45, B8
        movzx   eax, word [screen_info+6H]              ; 0026 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 002D _ 98
        mov     dword [ebp-44H], eax                    ; 002E _ 89. 45, BC
        mov     eax, dword [memman]                     ; 0031 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0036 _ 89. 04 24
        call    memman_init                             ; 0039 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 003E _ A1, 00000000(d)
        mov     dword [esp+8H], 1072594944              ; 0043 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 17301504                ; 004B _ C7. 44 24, 04, 01080000
        mov     dword [esp], eax                        ; 0053 _ 89. 04 24
        call    memman_free                             ; 0056 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-40H], 0                      ; 005B _ C7. 45, C0, 00000000
        mov     dword [ebp-3CH], 0                      ; 0062 _ C7. 45, C4, 00000000
        mov     eax, dword [memman]                     ; 0069 _ A1, 00000000(d)
        mov     edx, dword [ebp-44H]                    ; 006E _ 8B. 55, BC
        mov     dword [esp+0CH], edx                    ; 0071 _ 89. 54 24, 0C
        mov     edx, dword [ebp-48H]                    ; 0075 _ 8B. 55, B8
        mov     dword [esp+8H], edx                     ; 0078 _ 89. 54 24, 08
        mov     edx, dword [ebp-4CH]                    ; 007C _ 8B. 55, B4
        mov     dword [esp+4H], edx                     ; 007F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0083 _ 89. 04 24
        call    sheet_control_init                      ; 0086 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 008B _ 89. 45, C8
        mov     eax, dword [ebp-38H]                    ; 008E _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0091 _ 89. 04 24
        call    sheet_alloc                             ; 0094 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-40H], eax                    ; 0099 _ 89. 45, C0
        mov     eax, dword [ebp-38H]                    ; 009C _ 8B. 45, C8
        mov     dword [esp], eax                        ; 009F _ 89. 04 24
        call    sheet_alloc                             ; 00A2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-3CH], eax                    ; 00A7 _ 89. 45, C4
        mov     eax, dword [ebp-48H]                    ; 00AA _ 8B. 45, B8
        imul    eax, dword [ebp-44H]                    ; 00AD _ 0F AF. 45, BC
        mov     edx, eax                                ; 00B1 _ 89. C2
        mov     eax, dword [memman]                     ; 00B3 _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 00B8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00BC _ 89. 04 24
        call    memman_alloc_4k                         ; 00BF _ E8, FFFFFFFC(rel)
        mov     dword [back_buf], eax                   ; 00C4 _ A3, 00000000(d)
        mov     eax, dword [back_buf]                   ; 00C9 _ A1, 00000000(d)
        mov     dword [esp+10H], 99                     ; 00CE _ C7. 44 24, 10, 00000063
        mov     edx, dword [ebp-44H]                    ; 00D6 _ 8B. 55, BC
        mov     dword [esp+0CH], edx                    ; 00D9 _ 89. 54 24, 0C
        mov     edx, dword [ebp-48H]                    ; 00DD _ 8B. 55, B8
        mov     dword [esp+8H], edx                     ; 00E0 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 00E4 _ 89. 44 24, 04
        mov     eax, dword [ebp-40H]                    ; 00E8 _ 8B. 45, C0
        mov     dword [esp], eax                        ; 00EB _ 89. 04 24
        call    sheet_setbuf                            ; 00EE _ E8, FFFFFFFC(rel)
        mov     dword [esp+10H], 99                     ; 00F3 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 16                     ; 00FB _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 16                      ; 0103 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], mouse_cursor_buf        ; 010B _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-3CH]                    ; 0113 _ 8B. 45, C4
        mov     dword [esp], eax                        ; 0116 _ 89. 04 24
        call    sheet_setbuf                            ; 0119 _ E8, FFFFFFFC(rel)
        call    init_mouse_position                     ; 011E _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 0123 _ E8, FFFFFFFC(rel)
        call    init_fifo_buf                           ; 0128 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 012D _ E8, FFFFFFFC(rel)
        call    get_timer_control                       ; 0132 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 0137 _ 89. 45, CC
        call    init_time_port                          ; 013A _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf1.1645          ; 013F _ C7. 44 24, 08, 00000018(d)
        mov     dword [esp+4H], 8                       ; 0147 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1642            ; 014F _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0156 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 015B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0160 _ 89. 45, D0
        mov     dword [esp+8H], 1                       ; 0163 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1642         ; 016B _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-30H]                    ; 0173 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0176 _ 89. 04 24
        call    timer_init                              ; 0179 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 500                     ; 017E _ C7. 44 24, 04, 000001F4
        mov     eax, dword [ebp-30H]                    ; 0186 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0189 _ 89. 04 24
        call    timer_settime                           ; 018C _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf2.1646          ; 0191 _ C7. 44 24, 08, 00000038(d)
        mov     dword [esp+4H], 8                       ; 0199 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1643            ; 01A1 _ C7. 04 24, 00000020(d)
        call    fifo8_init                              ; 01A8 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01AD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 01B2 _ 89. 45, D4
        mov     dword [esp+8H], 1                       ; 01B5 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1643         ; 01BD _ C7. 44 24, 04, 00000020(d)
        mov     eax, dword [ebp-2CH]                    ; 01C5 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 01C8 _ 89. 04 24
        call    timer_init                              ; 01CB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01D0 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-2CH]                    ; 01D8 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 01DB _ 89. 04 24
        call    timer_settime                           ; 01DE _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf3.1647          ; 01E3 _ C7. 44 24, 08, 00000058(d)
        mov     dword [esp+4H], 8                       ; 01EB _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1644            ; 01F3 _ C7. 04 24, 00000040(d)
        call    fifo8_init                              ; 01FA _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01FF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 0204 _ 89. 45, D8
        mov     dword [esp+8H], 1                       ; 0207 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1644         ; 020F _ C7. 44 24, 04, 00000040(d)
        mov     eax, dword [ebp-28H]                    ; 0217 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 021A _ 89. 04 24
        call    timer_init                              ; 021D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 0222 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 022A _ 8B. 45, D8
        mov     dword [esp], eax                        ; 022D _ 89. 04 24
        call    timer_settime                           ; 0230 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 0235 _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 023A _ A1, 00000000(d)
        mov     edx, dword [ebp-44H]                    ; 023F _ 8B. 55, BC
        mov     dword [esp+8H], edx                     ; 0242 _ 89. 54 24, 08
        mov     edx, dword [ebp-48H]                    ; 0246 _ 8B. 55, B8
        mov     dword [esp+4H], edx                     ; 0249 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 024D _ 89. 04 24
        call    init_desktop                            ; 0250 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 99                      ; 0255 _ C7. 44 24, 04, 00000063
        mov     dword [esp], mouse_cursor_buf           ; 025D _ C7. 04 24, 00000000(d)
        call    init_mouse_cursor                       ; 0264 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0269 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0271 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-40H]                    ; 0279 _ 8B. 45, C0
        mov     dword [esp+4H], eax                     ; 027C _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 0280 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0283 _ 89. 04 24
        call    sheet_slide                             ; 0286 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 028B _ 8B. 15, 00000000(d)
        mov     eax, dword [mouse_x]                    ; 0291 _ A1, 00000000(d)
        mov     dword [esp+0CH], edx                    ; 0296 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 029A _ 89. 44 24, 08
        mov     eax, dword [ebp-3CH]                    ; 029E _ 8B. 45, C4
        mov     dword [esp+4H], eax                     ; 02A1 _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 02A5 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 02A8 _ 89. 04 24
        call    sheet_slide                             ; 02AB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], ?_158                   ; 02B0 _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-38H]                    ; 02B8 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 02BB _ 89. 04 24
        call    message_box                             ; 02BE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 02C3 _ 89. 45, DC
        mov     dword [esp+8H], 0                       ; 02C6 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-40H]                    ; 02CE _ 8B. 45, C0
        mov     dword [esp+4H], eax                     ; 02D1 _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 02D5 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 02D8 _ 89. 04 24
        call    sheet_updown                            ; 02DB _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 100                     ; 02E0 _ C7. 44 24, 08, 00000064
        mov     eax, dword [ebp-3CH]                    ; 02E8 _ 8B. 45, C4
        mov     dword [esp+4H], eax                     ; 02EB _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 02EF _ 8B. 45, C8
        mov     dword [esp], eax                        ; 02F2 _ 89. 04 24
        call    sheet_updown                            ; 02F5 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 02FA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], 0                      ; 02FF _ C7. 45, E0, 00000000
        mov     dword [ebp-1CH], 0                      ; 0306 _ C7. 45, E4, 00000000
        mov     dword [ebp-18H], 0                      ; 030D _ C7. 45, E8, 00000000
?_001:  mov     eax, dword [ebp-30H]                    ; 0314 _ 8B. 45, D0
        mov     eax, dword [eax+4H]                     ; 0317 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 031A _ 89. 04 24
        call    intToHexStr                             ; 031D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 0322 _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 0325 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 032D _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 0330 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0334 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 70                      ; 033C _ C7. 44 24, 08, 00000046
        mov     eax, dword [ebp-40H]                    ; 0344 _ 8B. 45, C0
        mov     dword [esp+4H], eax                     ; 0347 _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 034B _ 8B. 45, C8
        mov     dword [esp], eax                        ; 034E _ 89. 04 24
        call    paint_string                            ; 0351 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-30H]                    ; 0356 _ 8B. 45, D0
        mov     eax, dword [eax]                        ; 0359 _ 8B. 00
        mov     dword [esp], eax                        ; 035B _ 89. 04 24
        call    intToHexStr                             ; 035E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0363 _ 89. 45, F0
        mov     eax, dword [ebp-24H]                    ; 0366 _ 8B. 45, DC
        mov     edx, dword [eax+4H]                     ; 0369 _ 8B. 50, 04
        mov     eax, dword [ebp-24H]                    ; 036C _ 8B. 45, DC
        mov     eax, dword [eax]                        ; 036F _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0371 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], 119                    ; 0379 _ C7. 44 24, 14, 00000077
        mov     dword [esp+10H], 28                     ; 0381 _ C7. 44 24, 10, 0000001C
        mov     dword [esp+0CH], 40                     ; 0389 _ C7. 44 24, 0C, 00000028
        mov     dword [esp+8H], 8                       ; 0391 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 0399 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 039D _ 89. 04 24
        call    paint_rectangle                         ; 03A0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 03A5 _ C7. 44 24, 14, 00000000
        mov     eax, dword [ebp-10H]                    ; 03AD _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 03B0 _ 89. 44 24, 10
        mov     dword [esp+0CH], 28                     ; 03B4 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 40                      ; 03BC _ C7. 44 24, 08, 00000028
        mov     eax, dword [ebp-24H]                    ; 03C4 _ 8B. 45, DC
        mov     dword [esp+4H], eax                     ; 03C7 _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 03CB _ 8B. 45, C8
        mov     dword [esp], eax                        ; 03CE _ 89. 04 24
        call    paint_string                            ; 03D1 _ E8, FFFFFFFC(rel)
        call    io_cli                                  ; 03D6 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 03DB _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 03E2 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 03E7 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 03E9 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 03F0 _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03F5 _ 01. C3
        mov     dword [esp], timerinfo1.1642            ; 03F7 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 03FE _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0403 _ 01. C3
        mov     dword [esp], timerinfo2.1643            ; 0405 _ C7. 04 24, 00000020(d)
        call    fifo8_status                            ; 040C _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0411 _ 01. C3
        mov     dword [esp], timerinfo3.1644            ; 0413 _ C7. 04 24, 00000040(d)
        call    fifo8_status                            ; 041A _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 041F _ 01. D8
        test    eax, eax                                ; 0421 _ 85. C0
        jnz     ?_002                                   ; 0423 _ 75, 0A
        call    io_sti                                  ; 0425 _ E8, FFFFFFFC(rel)
        jmp     ?_009                                   ; 042A _ E9, 0000022F

?_002:  mov     dword [esp], keyinfo                    ; 042F _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0436 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 043B _ 85. C0
        jz      ?_003                                   ; 043D _ 74, 19
        call    io_sti                                  ; 043F _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0444 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 044B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0450 _ 89. 45, E0
        jmp     ?_009                                   ; 0453 _ E9, 00000206

?_003:  mov     dword [esp], mouseinfo                  ; 0458 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 045F _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0464 _ 85. C0
        jz      ?_004                                   ; 0466 _ 74, 1E
        mov     eax, dword [ebp-3CH]                    ; 0468 _ 8B. 45, C4
        mov     dword [esp+8H], eax                     ; 046B _ 89. 44 24, 08
        mov     eax, dword [ebp-40H]                    ; 046F _ 8B. 45, C0
        mov     dword [esp+4H], eax                     ; 0472 _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 0476 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0479 _ 89. 04 24
        call    show_mouse_info                         ; 047C _ E8, FFFFFFFC(rel)
        jmp     ?_009                                   ; 0481 _ E9, 000001D8

?_004:  mov     dword [esp], timerinfo1.1642            ; 0486 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 048D _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0492 _ 85. C0
        jz      ?_005                                   ; 0494 _ 74, 48
        call    io_sti                                  ; 0496 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1642            ; 049B _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 04A2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 04A7 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_159                  ; 04AF _ C7. 44 24, 10, 00000007(d)
        mov     dword [esp+0CH], 0                      ; 04B7 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 04BF _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-40H]                    ; 04C7 _ 8B. 45, C0
        mov     dword [esp+4H], eax                     ; 04CA _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 04CE _ 8B. 45, C8
        mov     dword [esp], eax                        ; 04D1 _ 89. 04 24
        call    paint_string                            ; 04D4 _ E8, FFFFFFFC(rel)
        jmp     ?_009                                   ; 04D9 _ E9, 00000180

?_005:  mov     dword [esp], timerinfo2.1643            ; 04DE _ C7. 04 24, 00000020(d)
        call    fifo8_status                            ; 04E5 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 04EA _ 85. C0
        jz      ?_006                                   ; 04EC _ 74, 48
        call    io_sti                                  ; 04EE _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1643            ; 04F3 _ C7. 04 24, 00000020(d)
        call    fifo8_get                               ; 04FA _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 04FF _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_160                  ; 0507 _ C7. 44 24, 10, 0000000F(d)
        mov     dword [esp+0CH], 32                     ; 050F _ C7. 44 24, 0C, 00000020
        mov     dword [esp+8H], 0                       ; 0517 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-40H]                    ; 051F _ 8B. 45, C0
        mov     dword [esp+4H], eax                     ; 0522 _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 0526 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0529 _ 89. 04 24
        call    paint_string                            ; 052C _ E8, FFFFFFFC(rel)
        jmp     ?_009                                   ; 0531 _ E9, 00000128

?_006:  mov     dword [esp], timerinfo3.1644            ; 0536 _ C7. 04 24, 00000040(d)
        call    fifo8_status                            ; 053D _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0542 _ 85. C0
        je      ?_009                                   ; 0544 _ 0F 84, 00000114
        mov     dword [esp], timerinfo3.1644            ; 054A _ C7. 04 24, 00000040(d)
        call    fifo8_get                               ; 0551 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0556 _ 89. 45, F4
        call    io_sti                                  ; 0559 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 055E _ 83. 7D, F4, 00
        jz      ?_007                                   ; 0562 _ 74, 59
        mov     dword [esp+8H], 0                       ; 0564 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1644         ; 056C _ C7. 44 24, 04, 00000040(d)
        mov     eax, dword [ebp-28H]                    ; 0574 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0577 _ 89. 04 24
        call    timer_init                              ; 057A _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 057F _ A1, 00000000(d)
        mov     dword [esp+18H], 111                    ; 0584 _ C7. 44 24, 18, 0000006F
        mov     dword [esp+14H], 15                     ; 058C _ C7. 44 24, 14, 0000000F
        mov     dword [esp+10H], 95                     ; 0594 _ C7. 44 24, 10, 0000005F
        mov     dword [esp+0CH], 8                      ; 059C _ C7. 44 24, 0C, 00000008
        mov     dword [esp+8H], 7                       ; 05A4 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-48H]                    ; 05AC _ 8B. 55, B8
        mov     dword [esp+4H], edx                     ; 05AF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05B3 _ 89. 04 24
        call    paint_rectangle                         ; 05B6 _ E8, FFFFFFFC(rel)
        jmp     ?_008                                   ; 05BB _ EB, 57

?_007:  mov     dword [esp+8H], 1                       ; 05BD _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1644         ; 05C5 _ C7. 44 24, 04, 00000040(d)
        mov     eax, dword [ebp-28H]                    ; 05CD _ 8B. 45, D8
        mov     dword [esp], eax                        ; 05D0 _ 89. 04 24
        call    timer_init                              ; 05D3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 05D8 _ A1, 00000000(d)
        mov     dword [esp+18H], 111                    ; 05DD _ C7. 44 24, 18, 0000006F
        mov     dword [esp+14H], 15                     ; 05E5 _ C7. 44 24, 14, 0000000F
        mov     dword [esp+10H], 95                     ; 05ED _ C7. 44 24, 10, 0000005F
        mov     dword [esp+0CH], 8                      ; 05F5 _ C7. 44 24, 0C, 00000008
        mov     dword [esp+8H], 2                       ; 05FD _ C7. 44 24, 08, 00000002
        mov     edx, dword [ebp-48H]                    ; 0605 _ 8B. 55, B8
        mov     dword [esp+4H], edx                     ; 0608 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 060C _ 89. 04 24
        call    paint_rectangle                         ; 060F _ E8, FFFFFFFC(rel)
?_008:  mov     dword [esp+4H], 50                      ; 0614 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 061C _ 8B. 45, D8
        mov     dword [esp], eax                        ; 061F _ 89. 04 24
        call    timer_settime                           ; 0622 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 112                    ; 0627 _ C7. 44 24, 14, 00000070
        mov     dword [esp+10H], 16                     ; 062F _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 96                     ; 0637 _ C7. 44 24, 0C, 00000060
        mov     dword [esp+8H], 8                       ; 063F _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp-40H]                    ; 0647 _ 8B. 45, C0
        mov     dword [esp+4H], eax                     ; 064A _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 064E _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0651 _ 89. 04 24
        call    sheet_refresh                           ; 0654 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0659 _ E9, FFFFFCB6

?_009:  jmp     ?_001                                   ; 065E _ E9, FFFFFCB1
; CMain End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0663 _ 55
        mov     ebp, esp                                ; 0664 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0666 _ A1, 00000000(d)
        mov     edx, eax                                ; 066B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 066D _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0670 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0672 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 320                      ; 0675 _ 66: C7. 40, 04, 0140
        mov     eax, dword [ebp+8H]                     ; 067B _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 200                      ; 067E _ 66: C7. 40, 06, 00C8
        pop     ebp                                     ; 0684 _ 5D
        ret                                             ; 0685 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0686 _ 55
        mov     ebp, esp                                ; 0687 _ 89. E5
        sub     esp, 24                                 ; 0689 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1615          ; 068C _ C7. 44 24, 08, 00000020(d)
        mov     dword [esp+4H], 15                      ; 0694 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 069C _ C7. 04 24, 00000000
        call    set_palette                             ; 06A3 _ E8, FFFFFFFC(rel)
        nop                                             ; 06A8 _ 90
        leave                                           ; 06A9 _ C9
        ret                                             ; 06AA _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 06AB _ 55
        mov     ebp, esp                                ; 06AC _ 89. E5
        sub     esp, 40                                 ; 06AE _ 83. EC, 28
        call    io_load_eflags                          ; 06B1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 06B6 _ 89. 45, F4
        call    io_cli                                  ; 06B9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 06BE _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 06C1 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 06C5 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 06CC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 06D1 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 06D4 _ 89. 45, F0
        jmp     ?_011                                   ; 06D7 _ EB, 62

?_010:  mov     eax, dword [ebp+10H]                    ; 06D9 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 06DC _ 0F B6. 00
        shr     al, 2                                   ; 06DF _ C0. E8, 02
        movzx   eax, al                                 ; 06E2 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 06E5 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 06E9 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 06F0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 06F5 _ 8B. 45, 10
        add     eax, 1                                  ; 06F8 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 06FB _ 0F B6. 00
        shr     al, 2                                   ; 06FE _ C0. E8, 02
        movzx   eax, al                                 ; 0701 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0704 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0708 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 070F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0714 _ 8B. 45, 10
        add     eax, 2                                  ; 0717 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 071A _ 0F B6. 00
        shr     al, 2                                   ; 071D _ C0. E8, 02
        movzx   eax, al                                 ; 0720 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0723 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0727 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 072E _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 0733 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 0737 _ 83. 45, F0, 01
?_011:  mov     eax, dword [ebp-10H]                    ; 073B _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 073E _ 3B. 45, 0C
        jle     ?_010                                   ; 0741 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0743 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0746 _ 89. 04 24
        call    io_store_eflags                         ; 0749 _ E8, FFFFFFFC(rel)
        nop                                             ; 074E _ 90
        leave                                           ; 074F _ C9
        ret                                             ; 0750 _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0751 _ 55
        mov     ebp, esp                                ; 0752 _ 89. E5
        sub     esp, 20                                 ; 0754 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0757 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 075A _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 075D _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0760 _ 89. 45, FC
        jmp     ?_015                                   ; 0763 _ EB, 33

?_012:  mov     eax, dword [ebp+14H]                    ; 0765 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0768 _ 89. 45, F8
        jmp     ?_014                                   ; 076B _ EB, 1F

?_013:  mov     eax, dword [ebp-4H]                     ; 076D _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0770 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0774 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0776 _ 8B. 45, F8
        add     eax, edx                                ; 0779 _ 01. D0
        mov     edx, eax                                ; 077B _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 077D _ 8B. 45, 08
        add     edx, eax                                ; 0780 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0782 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0786 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0788 _ 83. 45, F8, 01
?_014:  mov     eax, dword [ebp-8H]                     ; 078C _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 078F _ 3B. 45, 1C
        jle     ?_013                                   ; 0792 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0794 _ 83. 45, FC, 01
?_015:  mov     eax, dword [ebp-4H]                     ; 0798 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 079B _ 3B. 45, 20
        jle     ?_012                                   ; 079E _ 7E, C5
        leave                                           ; 07A0 _ C9
        ret                                             ; 07A1 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 07A2 _ 55
        mov     ebp, esp                                ; 07A3 _ 89. E5
        push    ebx                                     ; 07A5 _ 53
        sub     esp, 28                                 ; 07A6 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 07A9 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 07AC _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 07AF _ 8B. 45, 0C
        sub     eax, 1                                  ; 07B2 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 07B5 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 07B9 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 07BD _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 07C5 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 07CD _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 07D5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 07D8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 07DC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 07DF _ 89. 04 24
        call    paint_rectangle                         ; 07E2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 07E7 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 07EA _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 07ED _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 07F0 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 07F3 _ 8B. 45, 10
        sub     eax, 28                                 ; 07F6 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 07F9 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 07FD _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0801 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0805 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 080D _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0815 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0818 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 081C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 081F _ 89. 04 24
        call    paint_rectangle                         ; 0822 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0827 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 082A _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 082D _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0830 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0833 _ 8B. 45, 10
        sub     eax, 27                                 ; 0836 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0839 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 083D _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0841 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0845 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 084D _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0855 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0858 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 085C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 085F _ 89. 04 24
        call    paint_rectangle                         ; 0862 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0867 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 086A _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 086D _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0870 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0873 _ 8B. 45, 10
        sub     eax, 26                                 ; 0876 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0879 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 087D _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0881 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0885 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 088D _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0895 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0898 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 089C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 089F _ 89. 04 24
        call    paint_rectangle                         ; 08A2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 08A7 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 08AA _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 08AD _ 8B. 45, 10
        sub     eax, 24                                 ; 08B0 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 08B3 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 08B7 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 08BF _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 08C3 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 08CB _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 08D3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 08D6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 08DA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 08DD _ 89. 04 24
        call    paint_rectangle                         ; 08E0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 08E5 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 08E8 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 08EB _ 8B. 45, 10
        sub     eax, 24                                 ; 08EE _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 08F1 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 08F5 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 08FD _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0901 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 0909 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0911 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0914 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0918 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 091B _ 89. 04 24
        call    paint_rectangle                         ; 091E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0923 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0926 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0929 _ 8B. 45, 10
        sub     eax, 4                                  ; 092C _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 092F _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0933 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 093B _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 093F _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0947 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 094F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0952 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0956 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0959 _ 89. 04 24
        call    paint_rectangle                         ; 095C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0961 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0964 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0967 _ 8B. 45, 10
        sub     eax, 23                                 ; 096A _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 096D _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0971 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0979 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 097D _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0985 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 098D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0990 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0994 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0997 _ 89. 04 24
        call    paint_rectangle                         ; 099A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 099F _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 09A2 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 09A5 _ 8B. 45, 10
        sub     eax, 3                                  ; 09A8 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 09AB _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 09AF _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 09B7 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 09BB _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 09C3 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 09CB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 09CE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 09D2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 09D5 _ 89. 04 24
        call    paint_rectangle                         ; 09D8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 09DD _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 09E0 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 09E3 _ 8B. 45, 10
        sub     eax, 24                                 ; 09E6 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 09E9 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 09ED _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 09F5 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 09F9 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0A01 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0A09 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A0C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A10 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A13 _ 89. 04 24
        call    paint_rectangle                         ; 0A16 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0A1B _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0A1E _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0A21 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0A24 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0A27 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0A2A _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0A2D _ 8B. 45, 0C
        sub     eax, 47                                 ; 0A30 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0A33 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0A37 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0A3B _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0A3F _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0A43 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0A4B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A4E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A52 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A55 _ 89. 04 24
        call    paint_rectangle                         ; 0A58 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0A5D _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0A60 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0A63 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0A66 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0A69 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0A6C _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0A6F _ 8B. 45, 0C
        sub     eax, 47                                 ; 0A72 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0A75 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0A79 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0A7D _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0A81 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0A85 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0A8D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A90 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A94 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A97 _ 89. 04 24
        call    paint_rectangle                         ; 0A9A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0A9F _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0AA2 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0AA5 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0AA8 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0AAB _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0AAE _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0AB1 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0AB4 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0AB7 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0ABB _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0ABF _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0AC3 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0AC7 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0ACF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0AD2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0AD6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0AD9 _ 89. 04 24
        call    paint_rectangle                         ; 0ADC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0AE1 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0AE4 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0AE7 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0AEA _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0AED _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0AF0 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0AF3 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0AF6 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 0AF9 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0AFD _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0B01 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0B05 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0B09 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0B11 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0B14 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0B18 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0B1B _ 89. 04 24
        call    paint_rectangle                         ; 0B1E _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0B23 _ 83. C4, 1C
        pop     ebx                                     ; 0B26 _ 5B
        pop     ebp                                     ; 0B27 _ 5D
        ret                                             ; 0B28 _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 0B29 _ 55
        mov     ebp, esp                                ; 0B2A _ 89. E5
        sub     esp, 16                                 ; 0B2C _ 83. EC, 10
        movzx   eax, word [?_172]                       ; 0B2F _ 0F B7. 05, 00000064(d)
        cwde                                            ; 0B36 _ 98
        mov     dword [ebp-8H], eax                     ; 0B37 _ 89. 45, F8
        movzx   eax, word [?_173]                       ; 0B3A _ 0F B7. 05, 00000066(d)
        cwde                                            ; 0B41 _ 98
        mov     dword [ebp-4H], eax                     ; 0B42 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 0B45 _ 8B. 45, F8
        sub     eax, 16                                 ; 0B48 _ 83. E8, 10
        mov     edx, eax                                ; 0B4B _ 89. C2
        shr     edx, 31                                 ; 0B4D _ C1. EA, 1F
        add     eax, edx                                ; 0B50 _ 01. D0
        sar     eax, 1                                  ; 0B52 _ D1. F8
        mov     dword [mouse_x], eax                    ; 0B54 _ A3, 00000184(d)
        mov     eax, dword [ebp-4H]                     ; 0B59 _ 8B. 45, FC
        sub     eax, 44                                 ; 0B5C _ 83. E8, 2C
        mov     edx, eax                                ; 0B5F _ 89. C2
        shr     edx, 31                                 ; 0B61 _ C1. EA, 1F
        add     eax, edx                                ; 0B64 _ 01. D0
        sar     eax, 1                                  ; 0B66 _ D1. F8
        mov     dword [mouse_y], eax                    ; 0B68 _ A3, 00000188(d)
        leave                                           ; 0B6D _ C9
        ret                                             ; 0B6E _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0B6F _ 55
        mov     ebp, esp                                ; 0B70 _ 89. E5
        sub     esp, 20                                 ; 0B72 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 0B75 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 0B78 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0B7B _ C7. 45, FC, 00000000
        jmp     ?_025                                   ; 0B82 _ E9, 0000016E

?_016:  mov     edx, dword [ebp-4H]                     ; 0B87 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 0B8A _ 8B. 45, 18
        add     eax, edx                                ; 0B8D _ 01. D0
        movzx   eax, byte [eax]                         ; 0B8F _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0B92 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0B95 _ 0F B6. 45, FB
        test    al, al                                  ; 0B99 _ 84. C0
        jns     ?_017                                   ; 0B9B _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0B9D _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0BA0 _ 8B. 55, 14
        add     eax, edx                                ; 0BA3 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0BA5 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0BA9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0BAB _ 8B. 45, 10
        add     eax, edx                                ; 0BAE _ 01. D0
        mov     edx, eax                                ; 0BB0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0BB2 _ 8B. 45, 08
        add     edx, eax                                ; 0BB5 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0BB7 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0BBB _ 88. 02
?_017:  movzx   eax, byte [ebp-5H]                      ; 0BBD _ 0F B6. 45, FB
        and     eax, 40H                                ; 0BC1 _ 83. E0, 40
        test    eax, eax                                ; 0BC4 _ 85. C0
        jz      ?_018                                   ; 0BC6 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0BC8 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0BCB _ 8B. 55, 14
        add     eax, edx                                ; 0BCE _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0BD0 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0BD4 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0BD6 _ 8B. 45, 10
        add     eax, edx                                ; 0BD9 _ 01. D0
        lea     edx, [eax+1H]                           ; 0BDB _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0BDE _ 8B. 45, 08
        add     edx, eax                                ; 0BE1 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0BE3 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0BE7 _ 88. 02
?_018:  movzx   eax, byte [ebp-5H]                      ; 0BE9 _ 0F B6. 45, FB
        and     eax, 20H                                ; 0BED _ 83. E0, 20
        test    eax, eax                                ; 0BF0 _ 85. C0
        jz      ?_019                                   ; 0BF2 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0BF4 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0BF7 _ 8B. 55, 14
        add     eax, edx                                ; 0BFA _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0BFC _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0C00 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0C02 _ 8B. 45, 10
        add     eax, edx                                ; 0C05 _ 01. D0
        lea     edx, [eax+2H]                           ; 0C07 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0C0A _ 8B. 45, 08
        add     edx, eax                                ; 0C0D _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0C0F _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0C13 _ 88. 02
?_019:  movzx   eax, byte [ebp-5H]                      ; 0C15 _ 0F B6. 45, FB
        and     eax, 10H                                ; 0C19 _ 83. E0, 10
        test    eax, eax                                ; 0C1C _ 85. C0
        jz      ?_020                                   ; 0C1E _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0C20 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0C23 _ 8B. 55, 14
        add     eax, edx                                ; 0C26 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0C28 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0C2C _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0C2E _ 8B. 45, 10
        add     eax, edx                                ; 0C31 _ 01. D0
        lea     edx, [eax+3H]                           ; 0C33 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0C36 _ 8B. 45, 08
        add     edx, eax                                ; 0C39 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0C3B _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0C3F _ 88. 02
?_020:  movzx   eax, byte [ebp-5H]                      ; 0C41 _ 0F B6. 45, FB
        and     eax, 08H                                ; 0C45 _ 83. E0, 08
        test    eax, eax                                ; 0C48 _ 85. C0
        jz      ?_021                                   ; 0C4A _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0C4C _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0C4F _ 8B. 55, 14
        add     eax, edx                                ; 0C52 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0C54 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0C58 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0C5A _ 8B. 45, 10
        add     eax, edx                                ; 0C5D _ 01. D0
        lea     edx, [eax+4H]                           ; 0C5F _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0C62 _ 8B. 45, 08
        add     edx, eax                                ; 0C65 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0C67 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0C6B _ 88. 02
?_021:  movzx   eax, byte [ebp-5H]                      ; 0C6D _ 0F B6. 45, FB
        and     eax, 04H                                ; 0C71 _ 83. E0, 04
        test    eax, eax                                ; 0C74 _ 85. C0
        jz      ?_022                                   ; 0C76 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0C78 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0C7B _ 8B. 55, 14
        add     eax, edx                                ; 0C7E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0C80 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0C84 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0C86 _ 8B. 45, 10
        add     eax, edx                                ; 0C89 _ 01. D0
        lea     edx, [eax+5H]                           ; 0C8B _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0C8E _ 8B. 45, 08
        add     edx, eax                                ; 0C91 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0C93 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0C97 _ 88. 02
?_022:  movzx   eax, byte [ebp-5H]                      ; 0C99 _ 0F B6. 45, FB
        and     eax, 02H                                ; 0C9D _ 83. E0, 02
        test    eax, eax                                ; 0CA0 _ 85. C0
        jz      ?_023                                   ; 0CA2 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0CA4 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0CA7 _ 8B. 55, 14
        add     eax, edx                                ; 0CAA _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0CAC _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0CB0 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0CB2 _ 8B. 45, 10
        add     eax, edx                                ; 0CB5 _ 01. D0
        lea     edx, [eax+6H]                           ; 0CB7 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0CBA _ 8B. 45, 08
        add     edx, eax                                ; 0CBD _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0CBF _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0CC3 _ 88. 02
?_023:  movzx   eax, byte [ebp-5H]                      ; 0CC5 _ 0F B6. 45, FB
        and     eax, 01H                                ; 0CC9 _ 83. E0, 01
        test    eax, eax                                ; 0CCC _ 85. C0
        jz      ?_024                                   ; 0CCE _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0CD0 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0CD3 _ 8B. 55, 14
        add     eax, edx                                ; 0CD6 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0CD8 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0CDC _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0CDE _ 8B. 45, 10
        add     eax, edx                                ; 0CE1 _ 01. D0
        lea     edx, [eax+7H]                           ; 0CE3 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0CE6 _ 8B. 45, 08
        add     edx, eax                                ; 0CE9 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0CEB _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0CEF _ 88. 02
?_024:  add     dword [ebp-4H], 1                       ; 0CF1 _ 83. 45, FC, 01
?_025:  cmp     dword [ebp-4H], 15                      ; 0CF5 _ 83. 7D, FC, 0F
        jle     ?_016                                   ; 0CF9 _ 0F 8E, FFFFFE88
        leave                                           ; 0CFF _ C9
        ret                                             ; 0D00 _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 0D01 _ 55
        mov     ebp, esp                                ; 0D02 _ 89. E5
        push    ebx                                     ; 0D04 _ 53
        sub     esp, 52                                 ; 0D05 _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 0D08 _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 0D0B _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 0D0E _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0D11 _ 89. 45, F4
        jmp     ?_027                                   ; 0D14 _ EB, 4B

?_026:  movsx   ecx, byte [ebp-1CH]                     ; 0D16 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 0D1A _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 0D1D _ 0F B6. 00
        movsx   eax, al                                 ; 0D20 _ 0F BE. C0
        shl     eax, 4                                  ; 0D23 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0D26 _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 0D2C _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 0D2F _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0D32 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0D35 _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 0D37 _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 0D3B _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 0D3F _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 0D42 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 0D46 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 0D49 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0D4D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0D51 _ 89. 04 24
        call    paint_font                              ; 0D54 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 0D59 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 0D5D _ 83. 45, 18, 01
?_027:  mov     eax, dword [ebp+18H]                    ; 0D61 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 0D64 _ 0F B6. 00
        test    al, al                                  ; 0D67 _ 84. C0
        jnz     ?_026                                   ; 0D69 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 0D6B _ 8B. 45, 14
        add     eax, 16                                 ; 0D6E _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 0D71 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 0D75 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 0D78 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 0D7C _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 0D7F _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 0D83 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 0D86 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0D8A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D8D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D91 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D94 _ 89. 04 24
        call    sheet_refresh                           ; 0D97 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 0D9C _ 83. C4, 34
        pop     ebx                                     ; 0D9F _ 5B
        pop     ebp                                     ; 0DA0 _ 5D
        ret                                             ; 0DA1 _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0DA2 _ 55
        mov     ebp, esp                                ; 0DA3 _ 89. E5
        sub     esp, 20                                 ; 0DA5 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0DA8 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0DAB _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 0DAE _ C7. 45, F8, 00000000
        jmp     ?_034                                   ; 0DB5 _ E9, 0000009C

?_028:  mov     dword [ebp-4H], 0                       ; 0DBA _ C7. 45, FC, 00000000
        jmp     ?_033                                   ; 0DC1 _ E9, 00000082

?_029:  mov     eax, dword [ebp-8H]                     ; 0DC6 _ 8B. 45, F8
        shl     eax, 4                                  ; 0DC9 _ C1. E0, 04
        mov     edx, eax                                ; 0DCC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0DCE _ 8B. 45, FC
        add     eax, edx                                ; 0DD1 _ 01. D0
        add     eax, cursor.1683                        ; 0DD3 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0DD8 _ 0F B6. 00
        cmp     al, 42                                  ; 0DDB _ 3C, 2A
        jnz     ?_030                                   ; 0DDD _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0DDF _ 8B. 45, F8
        shl     eax, 4                                  ; 0DE2 _ C1. E0, 04
        mov     edx, eax                                ; 0DE5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0DE7 _ 8B. 45, FC
        add     eax, edx                                ; 0DEA _ 01. D0
        mov     edx, eax                                ; 0DEC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DEE _ 8B. 45, 08
        add     eax, edx                                ; 0DF1 _ 01. D0
        mov     byte [eax], 0                           ; 0DF3 _ C6. 00, 00
        jmp     ?_032                                   ; 0DF6 _ EB, 4C

?_030:  mov     eax, dword [ebp-8H]                     ; 0DF8 _ 8B. 45, F8
        shl     eax, 4                                  ; 0DFB _ C1. E0, 04
        mov     edx, eax                                ; 0DFE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0E00 _ 8B. 45, FC
        add     eax, edx                                ; 0E03 _ 01. D0
        add     eax, cursor.1683                        ; 0E05 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0E0A _ 0F B6. 00
        cmp     al, 79                                  ; 0E0D _ 3C, 4F
        jnz     ?_031                                   ; 0E0F _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0E11 _ 8B. 45, F8
        shl     eax, 4                                  ; 0E14 _ C1. E0, 04
        mov     edx, eax                                ; 0E17 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0E19 _ 8B. 45, FC
        add     eax, edx                                ; 0E1C _ 01. D0
        mov     edx, eax                                ; 0E1E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E20 _ 8B. 45, 08
        add     eax, edx                                ; 0E23 _ 01. D0
        mov     byte [eax], 7                           ; 0E25 _ C6. 00, 07
        jmp     ?_032                                   ; 0E28 _ EB, 1A

?_031:  mov     eax, dword [ebp-8H]                     ; 0E2A _ 8B. 45, F8
        shl     eax, 4                                  ; 0E2D _ C1. E0, 04
        mov     edx, eax                                ; 0E30 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0E32 _ 8B. 45, FC
        add     eax, edx                                ; 0E35 _ 01. D0
        mov     edx, eax                                ; 0E37 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E39 _ 8B. 45, 08
        add     edx, eax                                ; 0E3C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0E3E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0E42 _ 88. 02
?_032:  add     dword [ebp-4H], 1                       ; 0E44 _ 83. 45, FC, 01
?_033:  cmp     dword [ebp-4H], 15                      ; 0E48 _ 83. 7D, FC, 0F
        jle     ?_029                                   ; 0E4C _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 0E52 _ 83. 45, F8, 01
?_034:  cmp     dword [ebp-8H], 15                      ; 0E56 _ 83. 7D, F8, 0F
        jle     ?_028                                   ; 0E5A _ 0F 8E, FFFFFF5A
        leave                                           ; 0E60 _ C9
        ret                                             ; 0E61 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 0E62 _ 55
        mov     ebp, esp                                ; 0E63 _ 89. E5
        sub     esp, 16                                 ; 0E65 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0E68 _ C7. 45, F8, 00000000
        jmp     ?_038                                   ; 0E6F _ EB, 50

?_035:  mov     dword [ebp-4H], 0                       ; 0E71 _ C7. 45, FC, 00000000
        jmp     ?_037                                   ; 0E78 _ EB, 3B

?_036:  mov     eax, dword [ebp-8H]                     ; 0E7A _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 0E7D _ 8B. 55, 14
        add     eax, edx                                ; 0E80 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0E82 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 0E86 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 0E89 _ 8B. 4D, 10
        add     edx, ecx                                ; 0E8C _ 01. CA
        add     eax, edx                                ; 0E8E _ 01. D0
        mov     edx, eax                                ; 0E90 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E92 _ 8B. 45, 08
        add     edx, eax                                ; 0E95 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 0E97 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 0E9A _ 0F AF. 45, 18
        mov     ecx, eax                                ; 0E9E _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 0EA0 _ 8B. 45, FC
        add     eax, ecx                                ; 0EA3 _ 01. C8
        mov     ecx, eax                                ; 0EA5 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 0EA7 _ 8B. 45, 20
        add     eax, ecx                                ; 0EAA _ 01. C8
        movzx   eax, byte [eax]                         ; 0EAC _ 0F B6. 00
        mov     byte [edx], al                          ; 0EAF _ 88. 02
        add     dword [ebp-4H], 1                       ; 0EB1 _ 83. 45, FC, 01
?_037:  mov     eax, dword [ebp-4H]                     ; 0EB5 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 0EB8 _ 3B. 45, 18
        jl      ?_036                                   ; 0EBB _ 7C, BD
        add     dword [ebp-8H], 1                       ; 0EBD _ 83. 45, F8, 01
?_038:  mov     eax, dword [ebp-8H]                     ; 0EC1 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0EC4 _ 3B. 45, 1C
        jl      ?_035                                   ; 0EC7 _ 7C, A8
        leave                                           ; 0EC9 _ C9
        ret                                             ; 0ECA _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 0ECB _ 55
        mov     ebp, esp                                ; 0ECC _ 89. E5
        sub     esp, 24                                 ; 0ECE _ 83. EC, 18
        mov     dword [esp+8H], mousebuf                ; 0ED1 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 0ED9 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 0EE1 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0EE8 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], keybuf                  ; 0EED _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 0EF5 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 0EFD _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0F04 _ E8, FFFFFFFC(rel)
        leave                                           ; 0F09 _ C9
        ret                                             ; 0F0A _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 0F0B _ 55
        mov     ebp, esp                                ; 0F0C _ 89. E5
        sub     esp, 40                                 ; 0F0E _ 83. EC, 28
        mov     eax, dword [ebp+10H]                    ; 0F11 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 0F14 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 0F17 _ A1, 00000184(d)
        add     eax, edx                                ; 0F1C _ 01. D0
        mov     dword [mouse_x], eax                    ; 0F1E _ A3, 00000184(d)
        mov     eax, dword [ebp+10H]                    ; 0F23 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 0F26 _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 0F29 _ A1, 00000188(d)
        add     eax, edx                                ; 0F2E _ 01. D0
        mov     dword [mouse_y], eax                    ; 0F30 _ A3, 00000188(d)
        mov     eax, dword [mouse_x]                    ; 0F35 _ A1, 00000184(d)
        test    eax, eax                                ; 0F3A _ 85. C0
        jns     ?_039                                   ; 0F3C _ 79, 0A
        mov     dword [mouse_x], 0                      ; 0F3E _ C7. 05, 00000184(d), 00000000
?_039:  mov     eax, dword [mouse_y]                    ; 0F48 _ A1, 00000188(d)
        test    eax, eax                                ; 0F4D _ 85. C0
        jns     ?_040                                   ; 0F4F _ 79, 0A
        mov     dword [mouse_y], 0                      ; 0F51 _ C7. 05, 00000188(d), 00000000
?_040:  movzx   eax, word [?_172]                       ; 0F5B _ 0F B7. 05, 00000064(d)
        cwde                                            ; 0F62 _ 98
        lea     edx, [eax-10H]                          ; 0F63 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 0F66 _ A1, 00000184(d)
        cmp     edx, eax                                ; 0F6B _ 39. C2
        jge     ?_041                                   ; 0F6D _ 7D, 10
        movzx   eax, word [?_172]                       ; 0F6F _ 0F B7. 05, 00000064(d)
        cwde                                            ; 0F76 _ 98
        sub     eax, 16                                 ; 0F77 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 0F7A _ A3, 00000184(d)
?_041:  movzx   eax, word [?_172]                       ; 0F7F _ 0F B7. 05, 00000064(d)
        cwde                                            ; 0F86 _ 98
        lea     edx, [eax-10H]                          ; 0F87 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 0F8A _ A1, 00000188(d)
        cmp     edx, eax                                ; 0F8F _ 39. C2
        jge     ?_042                                   ; 0F91 _ 7D, 10
        movzx   eax, word [?_172]                       ; 0F93 _ 0F B7. 05, 00000064(d)
        cwde                                            ; 0F9A _ 98
        sub     eax, 16                                 ; 0F9B _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 0F9E _ A3, 00000188(d)
?_042:  mov     dword [esp+14H], 7                      ; 0FA3 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_161                  ; 0FAB _ C7. 44 24, 10, 00000017(d)
        mov     dword [esp+0CH], 0                      ; 0FB3 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0FBB _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0FC3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0FC6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0FCA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0FCD _ 89. 04 24
        call    paint_string                            ; 0FD0 _ E8, FFFFFFFC(rel)
        leave                                           ; 0FD5 _ C9
        ret                                             ; 0FD6 _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0FD7 _ 55
        mov     ebp, esp                                ; 0FD8 _ 89. E5
        sub     esp, 40                                 ; 0FDA _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 0FDD _ C6. 45, F7, 00
        call    io_sti                                  ; 0FE1 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 0FE6 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0FED _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0FF2 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0FF5 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0FF9 _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 0FFD _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 1004 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 1009 _ 85. C0
        jz      ?_043                                   ; 100B _ 74, 3F
        mov     dword [esp+8H], mouse_send_info         ; 100D _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 1015 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1018 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 101C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 101F _ 89. 04 24
        call    compute_mouse_position                  ; 1022 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 1027 _ 8B. 15, 00000188(d)
        mov     eax, dword [mouse_x]                    ; 102D _ A1, 00000184(d)
        mov     dword [esp+0CH], edx                    ; 1032 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 1036 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 103A _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 103D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1041 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1044 _ 89. 04 24
        call    sheet_slide                             ; 1047 _ E8, FFFFFFFC(rel)
?_043:  leave                                           ; 104C _ C9
        ret                                             ; 104D _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 104E _ 55
        mov     ebp, esp                                ; 104F _ 89. E5
        sub     esp, 88                                 ; 1051 _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 1054 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 105B _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 1062 _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 1069 _ A1, 00000060(d)
        mov     dword [ebp-2CH], eax                    ; 106E _ 89. 45, D4
        movzx   eax, word [?_172]                       ; 1071 _ 0F B7. 05, 00000064(d)
        cwde                                            ; 1078 _ 98
        mov     dword [ebp-28H], eax                    ; 1079 _ 89. 45, D8
        movzx   eax, word [?_173]                       ; 107C _ 0F B7. 05, 00000066(d)
        cwde                                            ; 1083 _ 98
        mov     dword [ebp-24H], eax                    ; 1084 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 1087 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 108A _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 108C _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 108F _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 1093 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 1096 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 109A _ 89. 04 24
        call    init_desktop                            ; 109D _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 10A2 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_162                  ; 10AA _ C7. 44 24, 10, 0000002E(d)
        mov     eax, dword [ebp-34H]                    ; 10B2 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 10B5 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 10B9 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 10BC _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 10C0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 10C3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 10C7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 10CA _ 89. 04 24
        call    paint_string                            ; 10CD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 10D2 _ 8B. 45, 14
        mov     dword [esp], eax                        ; 10D5 _ 89. 04 24
        call    intToHexStr                             ; 10D8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 10DD _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 10E0 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 10E8 _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 10EB _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 10EF _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 10F2 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 10F6 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 10F9 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 10FD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1100 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1104 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1107 _ 89. 04 24
        call    paint_string                            ; 110A _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 110F _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1113 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_163                  ; 111B _ C7. 44 24, 10, 00000038(d)
        mov     eax, dword [ebp-34H]                    ; 1123 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1126 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 112A _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 112D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1131 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1134 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1138 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 113B _ 89. 04 24
        call    paint_string                            ; 113E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1143 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1146 _ 8B. 00
        mov     dword [esp], eax                        ; 1148 _ 89. 04 24
        call    intToHexStr                             ; 114B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 1150 _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 1153 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 115B _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 115E _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1162 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1165 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1169 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 116C _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1170 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1173 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1177 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 117A _ 89. 04 24
        call    paint_string                            ; 117D _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1182 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1186 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_164                  ; 118E _ C7. 44 24, 10, 00000044(d)
        mov     eax, dword [ebp-34H]                    ; 1196 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1199 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 119D _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 11A0 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 11A4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 11A7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 11AB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 11AE _ 89. 04 24
        call    paint_string                            ; 11B1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 11B6 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 11B9 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 11BC _ 89. 04 24
        call    intToHexStr                             ; 11BF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 11C4 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 11C7 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 11CF _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 11D2 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 11D6 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 11D9 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 11DD _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 11E0 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 11E4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 11E7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 11EB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 11EE _ 89. 04 24
        call    paint_string                            ; 11F1 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 11F6 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 11FA _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_165                  ; 1202 _ C7. 44 24, 10, 00000050(d)
        mov     eax, dword [ebp-34H]                    ; 120A _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 120D _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1211 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1214 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1218 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 121B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 121F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1222 _ 89. 04 24
        call    paint_string                            ; 1225 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 122A _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 122D _ 8B. 40, 08
        mov     dword [esp], eax                        ; 1230 _ 89. 04 24
        call    intToHexStr                             ; 1233 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1238 _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 123B _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 1243 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 1246 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 124A _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 124D _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1251 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1254 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1258 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 125B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 125F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1262 _ 89. 04 24
        call    paint_string                            ; 1265 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 126A _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 126E _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_166                  ; 1276 _ C7. 44 24, 10, 0000005C(d)
        mov     eax, dword [ebp-34H]                    ; 127E _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1281 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1285 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1288 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 128C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 128F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1293 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1296 _ 89. 04 24
        call    paint_string                            ; 1299 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 129E _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 12A1 _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 12A4 _ 89. 04 24
        call    intToHexStr                             ; 12A7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 12AC _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 12AF _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 12B7 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 12BA _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 12BE _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 12C1 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 12C5 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 12C8 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 12CC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 12CF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 12D3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 12D6 _ 89. 04 24
        call    paint_string                            ; 12D9 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 12DE _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 12E2 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_167                  ; 12EA _ C7. 44 24, 10, 00000069(d)
        mov     eax, dword [ebp-34H]                    ; 12F2 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 12F5 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 12F9 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 12FC _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1300 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1303 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1307 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 130A _ 89. 04 24
        call    paint_string                            ; 130D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1312 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 1315 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 1318 _ 89. 04 24
        call    intToHexStr                             ; 131B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1320 _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 1323 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 132B _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 132E _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1332 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1335 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1339 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 133C _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1340 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1343 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1347 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 134A _ 89. 04 24
        call    paint_string                            ; 134D _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1352 _ 83. 45, CC, 10
        leave                                           ; 1356 _ C9
        ret                                             ; 1357 _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 1358 _ 55
        mov     ebp, esp                                ; 1359 _ 89. E5
        sub     esp, 56                                 ; 135B _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 135E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1361 _ 89. 04 24
        call    sheet_alloc                             ; 1364 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1369 _ 89. 45, F0
        mov     eax, dword [memman]                     ; 136C _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 1371 _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 1379 _ 89. 04 24
        call    memman_alloc_4k                         ; 137C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1381 _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 1384 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 138C _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 1394 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 139C _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 139F _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 13A3 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 13A6 _ 89. 04 24
        call    sheet_setbuf                            ; 13A9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 13AE _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 13B1 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 13B5 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 13B8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13BC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13BF _ 89. 04 24
        call    make_windows                            ; 13C2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 13C7 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ?_168                  ; 13CF _ C7. 44 24, 10, 00000070(d)
        mov     dword [esp+0CH], 28                     ; 13D7 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 24                      ; 13DF _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp-10H]                    ; 13E7 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 13EA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13EE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13F1 _ 89. 04 24
        call    paint_string                            ; 13F4 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 13F9 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ?_169                  ; 1401 _ C7. 44 24, 10, 0000007B(d)
        mov     dword [esp+0CH], 44                     ; 1409 _ C7. 44 24, 0C, 0000002C
        mov     dword [esp+8H], 24                      ; 1411 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp-10H]                    ; 1419 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 141C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1420 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1423 _ 89. 04 24
        call    paint_string                            ; 1426 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 72                     ; 142B _ C7. 44 24, 0C, 00000048
        mov     dword [esp+8H], 80                      ; 1433 _ C7. 44 24, 08, 00000050
        mov     eax, dword [ebp-10H]                    ; 143B _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 143E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1442 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1445 _ 89. 04 24
        call    sheet_slide                             ; 1448 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 144D _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 1455 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1458 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 145C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 145F _ 89. 04 24
        call    sheet_updown                            ; 1462 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1467 _ 8B. 45, F0
        leave                                           ; 146A _ C9
        ret                                             ; 146B _ C3
; message_box End of function

make_windows:; Function begin
        push    ebp                                     ; 146C _ 55
        mov     ebp, esp                                ; 146D _ 89. E5
        push    ebx                                     ; 146F _ 53
        sub     esp, 68                                 ; 1470 _ 83. EC, 44
        mov     eax, dword [ebp+0CH]                    ; 1473 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1476 _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 1479 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 147C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 147F _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 1482 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 1485 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1488 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 148B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 148E _ 8B. 00
        mov     dword [esp+18H], 0                      ; 1490 _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 1498 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 149C _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 14A4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 14AC _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 14B4 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 14B7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 14BB _ 89. 04 24
        call    paint_rectangle                         ; 14BE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 14C3 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 14C6 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 14C9 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 14CC _ 8B. 00
        mov     dword [esp+18H], 1                      ; 14CE _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 14D6 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 14DA _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 14E2 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 14EA _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 14F2 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 14F5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 14F9 _ 89. 04 24
        call    paint_rectangle                         ; 14FC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1501 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1504 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1507 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 150A _ 8B. 00
        mov     dword [esp+18H], edx                    ; 150C _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 1510 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 1518 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1520 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1528 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1530 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1533 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1537 _ 89. 04 24
        call    paint_rectangle                         ; 153A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 153F _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1542 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1545 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1548 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 154A _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 154E _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 1556 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 155E _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1566 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 156E _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1571 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1575 _ 89. 04 24
        call    paint_rectangle                         ; 1578 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 157D _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1580 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1583 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1586 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1589 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 158C _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 158F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1592 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1594 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1598 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 159C _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 15A4 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 15A8 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 15B0 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 15B3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 15B7 _ 89. 04 24
        call    paint_rectangle                         ; 15BA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 15BF _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 15C2 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 15C5 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 15C8 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 15CB _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 15CE _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 15D1 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 15D4 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 15D6 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 15DA _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 15DE _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 15E6 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 15EA _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 15F2 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 15F5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 15F9 _ 89. 04 24
        call    paint_rectangle                         ; 15FC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1601 _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1604 _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1607 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 160A _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 160D _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1610 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1612 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1616 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 161A _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 1622 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 162A _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1632 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1635 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1639 _ 89. 04 24
        call    paint_rectangle                         ; 163C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1641 _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1644 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1647 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 164A _ 8B. 00
        mov     dword [esp+18H], 20                     ; 164C _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1654 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 1658 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1660 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 1668 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 1670 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1673 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1677 _ 89. 04 24
        call    paint_rectangle                         ; 167A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 167F _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1682 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1685 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1688 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 168B _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 168E _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1691 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1694 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1696 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 169A _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 169E _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 16A2 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 16AA _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 16B2 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 16B5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 16B9 _ 89. 04 24
        call    paint_rectangle                         ; 16BC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 16C1 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 16C4 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 16C7 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 16CA _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 16CD _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 16D0 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 16D3 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 16D6 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 16D8 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 16DC _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 16E0 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 16E4 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 16EC _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 16F4 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 16F7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 16FB _ 89. 04 24
        call    paint_rectangle                         ; 16FE _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1703 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp+10H]                    ; 170B _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 170E _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 1712 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 171A _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 1722 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1725 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1729 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 172C _ 89. 04 24
        call    paint_string                            ; 172F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 1734 _ C7. 45, EC, 00000000
        jmp     ?_051                                   ; 173B _ E9, 00000083

?_044:  mov     dword [ebp-18H], 0                      ; 1740 _ C7. 45, E8, 00000000
        jmp     ?_050                                   ; 1747 _ EB, 70

?_045:  mov     eax, dword [ebp-14H]                    ; 1749 _ 8B. 45, EC
        shl     eax, 4                                  ; 174C _ C1. E0, 04
        mov     edx, eax                                ; 174F _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 1751 _ 8B. 45, E8
        add     eax, edx                                ; 1754 _ 01. D0
        add     eax, closebtn.1751                      ; 1756 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 175B _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 175E _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 1761 _ 80. 7D, E7, 40
        jnz     ?_046                                   ; 1765 _ 75, 06
        mov     byte [ebp-19H], 0                       ; 1767 _ C6. 45, E7, 00
        jmp     ?_049                                   ; 176B _ EB, 1C

?_046:  cmp     byte [ebp-19H], 36                      ; 176D _ 80. 7D, E7, 24
        jnz     ?_047                                   ; 1771 _ 75, 06
        mov     byte [ebp-19H], 15                      ; 1773 _ C6. 45, E7, 0F
        jmp     ?_049                                   ; 1777 _ EB, 10

?_047:  cmp     byte [ebp-19H], 81                      ; 1779 _ 80. 7D, E7, 51
        jnz     ?_048                                   ; 177D _ 75, 06
        mov     byte [ebp-19H], 8                       ; 177F _ C6. 45, E7, 08
        jmp     ?_049                                   ; 1783 _ EB, 04

?_048:  mov     byte [ebp-19H], 7                       ; 1785 _ C6. 45, E7, 07
?_049:  mov     eax, dword [ebp+0CH]                    ; 1789 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 178C _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 178E _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 1791 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1794 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1797 _ 8B. 40, 04
        imul    ecx, eax                                ; 179A _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 179D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 17A0 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 17A3 _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 17A6 _ 8B. 45, E8
        add     eax, ebx                                ; 17A9 _ 01. D8
        add     eax, ecx                                ; 17AB _ 01. C8
        add     edx, eax                                ; 17AD _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 17AF _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 17B3 _ 88. 02
        add     dword [ebp-18H], 1                      ; 17B5 _ 83. 45, E8, 01
?_050:  cmp     dword [ebp-18H], 15                     ; 17B9 _ 83. 7D, E8, 0F
        jle     ?_045                                   ; 17BD _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 17BF _ 83. 45, EC, 01
?_051:  cmp     dword [ebp-14H], 13                     ; 17C3 _ 83. 7D, EC, 0D
        jle     ?_044                                   ; 17C7 _ 0F 8E, FFFFFF73
        add     esp, 68                                 ; 17CD _ 83. C4, 44
        pop     ebx                                     ; 17D0 _ 5B
        pop     ebp                                     ; 17D1 _ 5D
        ret                                             ; 17D2 _ C3
; make_windows End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 17D3 _ 55
        mov     ebp, esp                                ; 17D4 _ 89. E5
        sub     esp, 24                                 ; 17D6 _ 83. EC, 18
?_052:  mov     dword [esp], 100                        ; 17D9 _ C7. 04 24, 00000064
        call    io_in8                                  ; 17E0 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 17E5 _ 83. E0, 02
        test    eax, eax                                ; 17E8 _ 85. C0
        jnz     ?_053                                   ; 17EA _ 75, 02
        jmp     ?_054                                   ; 17EC _ EB, 02

?_053:  jmp     ?_052                                   ; 17EE _ EB, E9

?_054:  leave                                           ; 17F0 _ C9
        ret                                             ; 17F1 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 17F2 _ 55
        mov     ebp, esp                                ; 17F3 _ 89. E5
        sub     esp, 24                                 ; 17F5 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 17F8 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 17FD _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 1805 _ C7. 04 24, 00000064
        call    io_out8                                 ; 180C _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 1811 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 1816 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 181E _ C7. 04 24, 00000060
        call    io_out8                                 ; 1825 _ E8, FFFFFFFC(rel)
        leave                                           ; 182A _ C9
        ret                                             ; 182B _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 182C _ 55
        mov     ebp, esp                                ; 182D _ 89. E5
        sub     esp, 24                                 ; 182F _ 83. EC, 18
        call    wait_KBC_sendready                      ; 1832 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 1837 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 183F _ C7. 04 24, 00000064
        call    io_out8                                 ; 1846 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 184B _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 1850 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 1858 _ C7. 04 24, 00000060
        call    io_out8                                 ; 185F _ E8, FFFFFFFC(rel)
        leave                                           ; 1864 _ C9
        ret                                             ; 1865 _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 1866 _ 55
        mov     ebp, esp                                ; 1867 _ 89. E5
        sub     esp, 4                                  ; 1869 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 186C _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 186F _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1872 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1875 _ 0F B6. 40, 03
        test    al, al                                  ; 1879 _ 84. C0
        jnz     ?_056                                   ; 187B _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 187D _ 80. 7D, FC, FA
        jnz     ?_055                                   ; 1881 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 1883 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1886 _ C6. 40, 03, 01
?_055:  mov     eax, 0                                  ; 188A _ B8, 00000000
        jmp     ?_063                                   ; 188F _ E9, 0000010F

?_056:  mov     eax, dword [ebp+8H]                     ; 1894 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1897 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 189B _ 3C, 01
        jnz     ?_058                                   ; 189D _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 189F _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 18A3 _ 25, 000000C8
        cmp     eax, 8                                  ; 18A8 _ 83. F8, 08
        jnz     ?_057                                   ; 18AB _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 18AD _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 18B0 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 18B4 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 18B6 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 18B9 _ C6. 40, 03, 02
?_057:  mov     eax, 0                                  ; 18BD _ B8, 00000000
        jmp     ?_063                                   ; 18C2 _ E9, 000000DC

?_058:  mov     eax, dword [ebp+8H]                     ; 18C7 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 18CA _ 0F B6. 40, 03
        cmp     al, 2                                   ; 18CE _ 3C, 02
        jnz     ?_059                                   ; 18D0 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 18D2 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 18D5 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 18D9 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 18DC _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 18DF _ C6. 40, 03, 03
        mov     eax, 0                                  ; 18E3 _ B8, 00000000
        jmp     ?_063                                   ; 18E8 _ E9, 000000B6

?_059:  mov     eax, dword [ebp+8H]                     ; 18ED _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 18F0 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 18F4 _ 3C, 03
        jne     ?_062                                   ; 18F6 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 18FC _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 18FF _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 1903 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1906 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1909 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 190D _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1910 _ 0F B6. 00
        movzx   eax, al                                 ; 1913 _ 0F B6. C0
        and     eax, 07H                                ; 1916 _ 83. E0, 07
        mov     edx, eax                                ; 1919 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 191B _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 191E _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1921 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 1924 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 1928 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 192B _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 192E _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1931 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 1934 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 1938 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 193B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 193E _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1941 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1944 _ 0F B6. 00
        movzx   eax, al                                 ; 1947 _ 0F B6. C0
        and     eax, 10H                                ; 194A _ 83. E0, 10
        test    eax, eax                                ; 194D _ 85. C0
        jz      ?_060                                   ; 194F _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1951 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1954 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 1957 _ 0D, FFFFFF00
        mov     edx, eax                                ; 195C _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 195E _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1961 _ 89. 50, 04
?_060:  mov     eax, dword [ebp+8H]                     ; 1964 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1967 _ 0F B6. 00
        movzx   eax, al                                 ; 196A _ 0F B6. C0
        and     eax, 20H                                ; 196D _ 83. E0, 20
        test    eax, eax                                ; 1970 _ 85. C0
        jz      ?_061                                   ; 1972 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1974 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1977 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 197A _ 0D, FFFFFF00
        mov     edx, eax                                ; 197F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1981 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1984 _ 89. 50, 08
?_061:  mov     eax, dword [ebp+8H]                     ; 1987 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 198A _ 8B. 40, 08
        neg     eax                                     ; 198D _ F7. D8
        mov     edx, eax                                ; 198F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1991 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1994 _ 89. 50, 08
        mov     eax, 1                                  ; 1997 _ B8, 00000001
        jmp     ?_063                                   ; 199C _ EB, 05

?_062:  mov     eax, 4294967295                         ; 199E _ B8, FFFFFFFF
?_063:  leave                                           ; 19A3 _ C9
        ret                                             ; 19A4 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 19A5 _ 55
        mov     ebp, esp                                ; 19A6 _ 89. E5
        sub     esp, 40                                 ; 19A8 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 19AB _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 19B3 _ C7. 04 24, 00000020
        call    io_out8                                 ; 19BA _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 19BF _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 19C7 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 19CE _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 19D3 _ C7. 04 24, 00000060
        call    io_in8                                  ; 19DA _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 19DF _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 19E2 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 19E6 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 19EA _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 19F1 _ E8, FFFFFFFC(rel)
        leave                                           ; 19F6 _ C9
        ret                                             ; 19F7 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 19F8 _ 55
        mov     ebp, esp                                ; 19F9 _ 89. E5
        sub     esp, 40                                 ; 19FB _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 19FE _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 1A06 _ C7. 04 24, 00000020
        call    io_out8                                 ; 1A0D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 1A12 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 1A1A _ C7. 04 24, 000000A0
        call    io_out8                                 ; 1A21 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 1A26 _ C7. 04 24, 00000060
        call    io_in8                                  ; 1A2D _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 1A32 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 1A35 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1A39 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 1A3D _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 1A44 _ E8, FFFFFFFC(rel)
        leave                                           ; 1A49 _ C9
        ret                                             ; 1A4A _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 1A4B _ 55
        mov     ebp, esp                                ; 1A4C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1A4E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1A51 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 1A54 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1A56 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1A59 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1A60 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1A63 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1A6A _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1A6D _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 1A70 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1A73 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1A76 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 1A79 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 1A7C _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 1A7F _ C7. 40, 14, 00000000
        pop     ebp                                     ; 1A86 _ 5D
        ret                                             ; 1A87 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 1A88 _ 55
        mov     ebp, esp                                ; 1A89 _ 89. E5
        sub     esp, 20                                 ; 1A8B _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1A8E _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 1A91 _ 88. 45, EC
        mov     eax, dword [ebp+8H]                     ; 1A94 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1A97 _ 8B. 40, 10
        test    eax, eax                                ; 1A9A _ 85. C0
        jnz     ?_064                                   ; 1A9C _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 1A9E _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 1AA1 _ 8B. 40, 14
        or      eax, 01H                                ; 1AA4 _ 83. C8, 01
        mov     edx, eax                                ; 1AA7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1AA9 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 1AAC _ 89. 50, 14
        mov     eax, 4294967295                         ; 1AAF _ B8, FFFFFFFF
        jmp     ?_066                                   ; 1AB4 _ EB, 56

?_064:  mov     eax, dword [ebp+8H]                     ; 1AB6 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1AB9 _ 8B. 40, 04
        mov     dword [ebp-4H], eax                     ; 1ABC _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1ABF _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1AC2 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 1AC4 _ 8B. 45, FC
        add     edx, eax                                ; 1AC7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1AC9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1ACD _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 1ACF _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1AD2 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 1AD5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1AD8 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1ADB _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1ADE _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1AE1 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1AE4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1AE7 _ 8B. 40, 0C
        cmp     edx, eax                                ; 1AEA _ 39. C2
        jnz     ?_065                                   ; 1AEC _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 1AEE _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1AF1 _ C7. 40, 04, 00000000
?_065:  mov     eax, dword [ebp+8H]                     ; 1AF8 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1AFB _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 1AFE _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1B01 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1B04 _ 89. 50, 10
        mov     eax, 0                                  ; 1B07 _ B8, 00000000
?_066:  leave                                           ; 1B0C _ C9
        ret                                             ; 1B0D _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 1B0E _ 55
        mov     ebp, esp                                ; 1B0F _ 89. E5
        sub     esp, 16                                 ; 1B11 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 1B14 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 1B17 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 1B1A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1B1D _ 8B. 40, 0C
        cmp     edx, eax                                ; 1B20 _ 39. C2
        jnz     ?_067                                   ; 1B22 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 1B24 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 1B27 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 1B2E _ B8, FFFFFFFF
        jmp     ?_069                                   ; 1B33 _ EB, 57

?_067:  mov     eax, dword [ebp+8H]                     ; 1B35 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1B38 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 1B3B _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 1B3E _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1B41 _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 1B43 _ 8B. 45, F8
        add     eax, edx                                ; 1B46 _ 01. D0
        movzx   eax, byte [eax]                         ; 1B48 _ 0F B6. 00
        movzx   eax, al                                 ; 1B4B _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 1B4E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1B51 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1B54 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 1B57 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1B5A _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1B5D _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1B60 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 1B63 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1B66 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1B69 _ 8B. 40, 0C
        cmp     edx, eax                                ; 1B6C _ 39. C2
        jnz     ?_068                                   ; 1B6E _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 1B70 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1B73 _ C7. 40, 08, 00000000
?_068:  mov     eax, dword [ebp+8H]                     ; 1B7A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1B7D _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 1B80 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1B83 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1B86 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 1B89 _ 8B. 45, FC
?_069:  leave                                           ; 1B8C _ C9
        ret                                             ; 1B8D _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 1B8E _ 55
        mov     ebp, esp                                ; 1B8F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1B91 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 1B94 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1B97 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1B9A _ 8B. 40, 10
        sub     edx, eax                                ; 1B9D _ 29. C2
        mov     eax, edx                                ; 1B9F _ 89. D0
        pop     ebp                                     ; 1BA1 _ 5D
        ret                                             ; 1BA2 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 1BA3 _ 55
        mov     ebp, esp                                ; 1BA4 _ 89. E5
        sub     esp, 4                                  ; 1BA6 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 1BA9 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 1BAC _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 1BAF _ 80. 7D, FC, 09
        jle     ?_070                                   ; 1BB3 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 1BB5 _ 0F B6. 45, FC
        add     eax, 55                                 ; 1BB9 _ 83. C0, 37
        jmp     ?_071                                   ; 1BBC _ EB, 07

?_070:  movzx   eax, byte [ebp-4H]                      ; 1BBE _ 0F B6. 45, FC
        add     eax, 48                                 ; 1BC2 _ 83. C0, 30
?_071:  leave                                           ; 1BC5 _ C9
        ret                                             ; 1BC6 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 1BC7 _ 55
        mov     ebp, esp                                ; 1BC8 _ 89. E5
        sub     esp, 24                                 ; 1BCA _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 1BCD _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 1BD0 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 1BD3 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 1BDA _ 0F B6. 45, EC
        and     eax, 0FH                                ; 1BDE _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 1BE1 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 1BE4 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 1BE8 _ 89. 04 24
        call    charToHexVal                            ; 1BEB _ E8, FFFFFFFC(rel)
        mov     byte [?_171], al                        ; 1BF0 _ A2, 00000243(d)
        movzx   eax, byte [ebp-14H]                     ; 1BF5 _ 0F B6. 45, EC
        shr     al, 4                                   ; 1BF9 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 1BFC _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 1BFF _ 0F B6. 45, EC
        movsx   eax, al                                 ; 1C03 _ 0F BE. C0
        mov     dword [esp], eax                        ; 1C06 _ 89. 04 24
        call    charToHexVal                            ; 1C09 _ E8, FFFFFFFC(rel)
        mov     byte [?_170], al                        ; 1C0E _ A2, 00000242(d)
        mov     eax, keyval                             ; 1C13 _ B8, 00000240(d)
        leave                                           ; 1C18 _ C9
        ret                                             ; 1C19 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 1C1A _ 55
        mov     ebp, esp                                ; 1C1B _ 89. E5
        sub     esp, 16                                 ; 1C1D _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 1C20 _ C6. 05, 00000280(d), 30
        mov     byte [?_174], 88                        ; 1C27 _ C6. 05, 00000281(d), 58
        mov     byte [?_175], 0                         ; 1C2E _ C6. 05, 0000028A(d), 00
        mov     dword [ebp-0CH], 2                      ; 1C35 _ C7. 45, F4, 00000002
        jmp     ?_073                                   ; 1C3C _ EB, 0F

?_072:  mov     eax, dword [ebp-0CH]                    ; 1C3E _ 8B. 45, F4
        add     eax, str.1386                           ; 1C41 _ 05, 00000280(d)
        mov     byte [eax], 48                          ; 1C46 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 1C49 _ 83. 45, F4, 01
?_073:  cmp     dword [ebp-0CH], 9                      ; 1C4D _ 83. 7D, F4, 09
        jle     ?_072                                   ; 1C51 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 1C53 _ C7. 45, F8, 00000009
        jmp     ?_077                                   ; 1C5A _ EB, 40

?_074:  mov     eax, dword [ebp+8H]                     ; 1C5C _ 8B. 45, 08
        and     eax, 0FH                                ; 1C5F _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 1C62 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1C65 _ 8B. 45, 08
        shr     eax, 4                                  ; 1C68 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 1C6B _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 1C6E _ 83. 7D, FC, 09
        jle     ?_075                                   ; 1C72 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 1C74 _ 8B. 45, FC
        add     eax, 55                                 ; 1C77 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 1C7A _ 8B. 55, F8
        add     edx, str.1386                           ; 1C7D _ 81. C2, 00000280(d)
        mov     byte [edx], al                          ; 1C83 _ 88. 02
        jmp     ?_076                                   ; 1C85 _ EB, 11

?_075:  mov     eax, dword [ebp-4H]                     ; 1C87 _ 8B. 45, FC
        add     eax, 48                                 ; 1C8A _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 1C8D _ 8B. 55, F8
        add     edx, str.1386                           ; 1C90 _ 81. C2, 00000280(d)
        mov     byte [edx], al                          ; 1C96 _ 88. 02
?_076:  sub     dword [ebp-8H], 1                       ; 1C98 _ 83. 6D, F8, 01
?_077:  cmp     dword [ebp-8H], 1                       ; 1C9C _ 83. 7D, F8, 01
        jle     ?_078                                   ; 1CA0 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 1CA2 _ 83. 7D, 08, 00
        jnz     ?_074                                   ; 1CA6 _ 75, B4
?_078:  mov     eax, str.1386                           ; 1CA8 _ B8, 00000280(d)
        leave                                           ; 1CAD _ C9
        ret                                             ; 1CAE _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 1CAF _ 55
        mov     ebp, esp                                ; 1CB0 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1CB2 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1CB5 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1CBB _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1CBE _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1CC5 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1CC8 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1CCF _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1CD2 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 1CD9 _ 5D
        ret                                             ; 1CDA _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1CDB _ 55
        mov     ebp, esp                                ; 1CDC _ 89. E5
        sub     esp, 16                                 ; 1CDE _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1CE1 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 1CE8 _ C7. 45, F8, 00000000
        jmp     ?_080                                   ; 1CEF _ EB, 14

?_079:  mov     eax, dword [ebp+8H]                     ; 1CF1 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1CF4 _ 8B. 55, F8
        add     edx, 2                                  ; 1CF7 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1CFA _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 1CFE _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 1D01 _ 83. 45, F8, 01
?_080:  mov     eax, dword [ebp+8H]                     ; 1D05 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D08 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 1D0A _ 3B. 45, F8
        ja      ?_079                                   ; 1D0D _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 1D0F _ 8B. 45, FC
        leave                                           ; 1D12 _ C9
        ret                                             ; 1D13 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1D14 _ 55
        mov     ebp, esp                                ; 1D15 _ 89. E5
        sub     esp, 16                                 ; 1D17 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1D1A _ C7. 45, F8, 00000000
        jmp     ?_084                                   ; 1D21 _ E9, 00000085

?_081:  mov     eax, dword [ebp+8H]                     ; 1D26 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D29 _ 8B. 55, F8
        add     edx, 2                                  ; 1D2C _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1D2F _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 1D33 _ 3B. 45, 0C
        jc      ?_083                                   ; 1D36 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 1D38 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D3B _ 8B. 55, F8
        add     edx, 2                                  ; 1D3E _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1D41 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 1D44 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1D47 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D4A _ 8B. 55, F8
        add     edx, 2                                  ; 1D4D _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1D50 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1D53 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 1D56 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1D59 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D5C _ 8B. 55, F8
        add     edx, 2                                  ; 1D5F _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1D62 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1D65 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D68 _ 8B. 55, F8
        add     edx, 2                                  ; 1D6B _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1D6E _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1D72 _ 2B. 45, 0C
        mov     edx, eax                                ; 1D75 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1D77 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1D7A _ 8B. 4D, F8
        add     ecx, 2                                  ; 1D7D _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1D80 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 1D84 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D87 _ 8B. 55, F8
        add     edx, 2                                  ; 1D8A _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1D8D _ 8B. 44 D0, 04
        test    eax, eax                                ; 1D91 _ 85. C0
        jnz     ?_082                                   ; 1D93 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 1D95 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D98 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1D9A _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1D9D _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1DA0 _ 89. 10
?_082:  mov     eax, dword [ebp-4H]                     ; 1DA2 _ 8B. 45, FC
        jmp     ?_085                                   ; 1DA5 _ EB, 17

?_083:  add     dword [ebp-8H], 1                       ; 1DA7 _ 83. 45, F8, 01
?_084:  mov     eax, dword [ebp+8H]                     ; 1DAB _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1DAE _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 1DB0 _ 3B. 45, F8
        ja      ?_081                                   ; 1DB3 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 1DB9 _ B8, 00000000
?_085:  leave                                           ; 1DBE _ C9
        ret                                             ; 1DBF _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1DC0 _ 55
        mov     ebp, esp                                ; 1DC1 _ 89. E5
        push    ebx                                     ; 1DC3 _ 53
        sub     esp, 16                                 ; 1DC4 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 1DC7 _ C7. 45, F4, 00000000
        jmp     ?_088                                   ; 1DCE _ EB, 17

?_086:  mov     eax, dword [ebp+8H]                     ; 1DD0 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1DD3 _ 8B. 55, F4
        add     edx, 2                                  ; 1DD6 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1DD9 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 1DDC _ 3B. 45, 0C
        jbe     ?_087                                   ; 1DDF _ 76, 02
        jmp     ?_089                                   ; 1DE1 _ EB, 0E

?_087:  add     dword [ebp-0CH], 1                      ; 1DE3 _ 83. 45, F4, 01
?_088:  mov     eax, dword [ebp+8H]                     ; 1DE7 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1DEA _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1DEC _ 3B. 45, F4
        jg      ?_086                                   ; 1DEF _ 7F, DF
?_089:  cmp     dword [ebp-0CH], 0                      ; 1DF1 _ 83. 7D, F4, 00
        jle     ?_091                                   ; 1DF5 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 1DFB _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1DFE _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1E01 _ 8B. 45, 08
        add     edx, 2                                  ; 1E04 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1E07 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 1E0A _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1E0D _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1E10 _ 8B. 45, 08
        add     ecx, 2                                  ; 1E13 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1E16 _ 8B. 44 C8, 04
        add     eax, edx                                ; 1E1A _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 1E1C _ 3B. 45, 0C
        jne     ?_091                                   ; 1E1F _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 1E25 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1E28 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1E2B _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1E2E _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1E31 _ 8B. 45, 08
        add     edx, 2                                  ; 1E34 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1E37 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1E3B _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1E3E _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E41 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1E44 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1E47 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1E4B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E4E _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1E50 _ 3B. 45, F4
        jle     ?_090                                   ; 1E53 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 1E55 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 1E58 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 1E5B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E5E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1E61 _ 8B. 55, F4
        add     edx, 2                                  ; 1E64 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1E67 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1E6A _ 39. C1
        jnz     ?_090                                   ; 1E6C _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 1E6E _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1E71 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1E74 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1E77 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1E7A _ 8B. 45, 08
        add     edx, 2                                  ; 1E7D _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1E80 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1E84 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1E87 _ 8B. 4D, F4
        add     ecx, 2                                  ; 1E8A _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1E8D _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 1E91 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E94 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1E97 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1E9A _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1E9E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1EA1 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1EA3 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1EA6 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1EA9 _ 89. 10
?_090:  mov     eax, 0                                  ; 1EAB _ B8, 00000000
        jmp     ?_097                                   ; 1EB0 _ E9, 0000011C

?_091:  mov     eax, dword [ebp+8H]                     ; 1EB5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1EB8 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1EBA _ 3B. 45, F4
        jle     ?_092                                   ; 1EBD _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 1EBF _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 1EC2 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 1EC5 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1EC8 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1ECB _ 8B. 55, F4
        add     edx, 2                                  ; 1ECE _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1ED1 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1ED4 _ 39. C1
        jnz     ?_092                                   ; 1ED6 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1ED8 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1EDB _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1EDE _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1EE1 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1EE4 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1EE7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1EEA _ 8B. 55, F4
        add     edx, 2                                  ; 1EED _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1EF0 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1EF4 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1EF7 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1EFA _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1EFD _ 8B. 55, F4
        add     edx, 2                                  ; 1F00 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1F03 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 1F07 _ B8, 00000000
        jmp     ?_097                                   ; 1F0C _ E9, 000000C0

?_092:  mov     eax, dword [ebp+8H]                     ; 1F11 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F14 _ 8B. 00
        cmp     eax, 4095                               ; 1F16 _ 3D, 00000FFF
        jg      ?_096                                   ; 1F1B _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 1F21 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F24 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 1F26 _ 89. 45, F8
        jmp     ?_094                                   ; 1F29 _ EB, 28

?_093:  mov     eax, dword [ebp-8H]                     ; 1F2B _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1F2E _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1F31 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 1F34 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 1F37 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1F3A _ 8B. 45, 08
        add     edx, 2                                  ; 1F3D _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1F40 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1F43 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1F45 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1F48 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1F4B _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 1F4F _ 83. 6D, F8, 01
?_094:  mov     eax, dword [ebp-8H]                     ; 1F53 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 1F56 _ 3B. 45, F4
        jg      ?_093                                   ; 1F59 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 1F5B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F5E _ 8B. 00
        lea     edx, [eax+1H]                           ; 1F60 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1F63 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1F66 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1F68 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1F6B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1F6E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F71 _ 8B. 00
        cmp     edx, eax                                ; 1F73 _ 39. C2
        jge     ?_095                                   ; 1F75 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 1F77 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1F7A _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1F7C _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1F7F _ 89. 50, 04
?_095:  mov     eax, dword [ebp+8H]                     ; 1F82 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1F85 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1F88 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1F8B _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1F8E _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1F91 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1F94 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1F97 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1F9A _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1F9D _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1FA1 _ B8, 00000000
        jmp     ?_097                                   ; 1FA6 _ EB, 29

?_096:  mov     eax, dword [ebp+8H]                     ; 1FA8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1FAB _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1FAE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1FB1 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1FB4 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1FB7 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1FBA _ 8B. 40, 08
        mov     edx, eax                                ; 1FBD _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1FBF _ 8B. 45, 10
        add     eax, edx                                ; 1FC2 _ 01. D0
        mov     edx, eax                                ; 1FC4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1FC6 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1FC9 _ 89. 50, 08
        mov     eax, 4294967295                         ; 1FCC _ B8, FFFFFFFF
?_097:  add     esp, 16                                 ; 1FD1 _ 83. C4, 10
        pop     ebx                                     ; 1FD4 _ 5B
        pop     ebp                                     ; 1FD5 _ 5D
        ret                                             ; 1FD6 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1FD7 _ 55
        mov     ebp, esp                                ; 1FD8 _ 89. E5
        sub     esp, 24                                 ; 1FDA _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 1FDD _ 8B. 45, 0C
        add     eax, 4095                               ; 1FE0 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1FE5 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1FEA _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 1FED _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1FF0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1FF4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1FF7 _ 89. 04 24
        call    memman_alloc                            ; 1FFA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 1FFF _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2002 _ 8B. 45, FC
        leave                                           ; 2005 _ C9
        ret                                             ; 2006 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 2007 _ 55
        mov     ebp, esp                                ; 2008 _ 89. E5
        sub     esp, 28                                 ; 200A _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 200D _ 8B. 45, 10
        add     eax, 4095                               ; 2010 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2015 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 201A _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 201D _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 2020 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2024 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2027 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 202B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 202E _ 89. 04 24
        call    memman_free                             ; 2031 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 2036 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2039 _ 8B. 45, FC
        leave                                           ; 203C _ C9
        ret                                             ; 203D _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 203E _ 55
        mov     ebp, esp                                ; 203F _ 89. E5
        sub     esp, 40                                 ; 2041 _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 2044 _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 204C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 204F _ 89. 04 24
        call    memman_alloc_4k                         ; 2052 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2057 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 205A _ 83. 7D, F4, 00
        jnz     ?_098                                   ; 205E _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 2060 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 2063 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 206B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 206F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2072 _ 89. 04 24
        call    memman_free_4k                          ; 2075 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 207A _ B8, 00000000
        jmp     ?_102                                   ; 207F _ E9, 0000009D

?_098:  mov     eax, dword [ebp-0CH]                    ; 2084 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 2087 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 208A _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 208C _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 208F _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 2092 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 2095 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 2098 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 209B _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 209E _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 20A1 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 20A8 _ C7. 45, F0, 00000000
        jmp     ?_100                                   ; 20AF _ EB, 1B

?_099:  mov     eax, dword [ebp-0CH]                    ; 20B1 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 20B4 _ 8B. 55, F0
        add     edx, 33                                 ; 20B7 _ 83. C2, 21
        shl     edx, 5                                  ; 20BA _ C1. E2, 05
        add     eax, edx                                ; 20BD _ 01. D0
        add     eax, 16                                 ; 20BF _ 83. C0, 10
        mov     dword [eax], 0                          ; 20C2 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 20C8 _ 83. 45, F0, 01
?_100:  cmp     dword [ebp-10H], 255                    ; 20CC _ 81. 7D, F0, 000000FF
        jle     ?_099                                   ; 20D3 _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 20D5 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 20D8 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 20DC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 20E0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 20E3 _ 89. 04 24
        call    memman_alloc_4k                         ; 20E6 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 20EB _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 20ED _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 20F0 _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 20F3 _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 20F6 _ 8B. 40, 10
        test    eax, eax                                ; 20F9 _ 85. C0
        jnz     ?_101                                   ; 20FB _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 20FD _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 2100 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 2108 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 210C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 210F _ 89. 04 24
        call    memman_free_4k                          ; 2112 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 2117 _ B8, 00000000
        jmp     ?_102                                   ; 211C _ EB, 03

?_101:  mov     eax, dword [ebp-0CH]                    ; 211E _ 8B. 45, F4
?_102:  leave                                           ; 2121 _ C9
        ret                                             ; 2122 _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 2123 _ 55
        mov     ebp, esp                                ; 2124 _ 89. E5
        sub     esp, 16                                 ; 2126 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2129 _ C7. 45, F8, 00000000
        jmp     ?_105                                   ; 2130 _ EB, 5B

?_103:  mov     eax, dword [ebp+8H]                     ; 2132 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2135 _ 8B. 55, F8
        add     edx, 33                                 ; 2138 _ 83. C2, 21
        shl     edx, 5                                  ; 213B _ C1. E2, 05
        add     eax, edx                                ; 213E _ 01. D0
        add     eax, 16                                 ; 2140 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 2143 _ 8B. 00
        test    eax, eax                                ; 2145 _ 85. C0
        jnz     ?_104                                   ; 2147 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 2149 _ 8B. 45, F8
        shl     eax, 5                                  ; 214C _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 214F _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 2155 _ 8B. 45, 08
        add     eax, edx                                ; 2158 _ 01. D0
        add     eax, 4                                  ; 215A _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 215D _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2160 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2163 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 2166 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 2169 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 216C _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 2170 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 2173 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 217A _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 217D _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 2184 _ 8B. 45, FC
        jmp     ?_106                                   ; 2187 _ EB, 12

?_104:  add     dword [ebp-8H], 1                       ; 2189 _ 83. 45, F8, 01
?_105:  cmp     dword [ebp-8H], 255                     ; 218D _ 81. 7D, F8, 000000FF
        jle     ?_103                                   ; 2194 _ 7E, 9C
        mov     eax, 0                                  ; 2196 _ B8, 00000000
?_106:  leave                                           ; 219B _ C9
        ret                                             ; 219C _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 219D _ 55
        mov     ebp, esp                                ; 219E _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 21A0 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 21A3 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 21A6 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 21A8 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 21AB _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 21AE _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 21B1 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 21B4 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 21B7 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 21BA _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 21BD _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 21C0 _ 89. 50, 14
        pop     ebp                                     ; 21C3 _ 5D
        ret                                             ; 21C4 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 21C5 _ 55
        mov     ebp, esp                                ; 21C6 _ 89. E5
        push    esi                                     ; 21C8 _ 56
        push    ebx                                     ; 21C9 _ 53
        sub     esp, 48                                 ; 21CA _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 21CD _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 21D0 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 21D3 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 21D6 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 21D9 _ 8B. 40, 0C
        add     eax, 1                                  ; 21DC _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 21DF _ 3B. 45, 10
        jge     ?_107                                   ; 21E2 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 21E4 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 21E7 _ 8B. 40, 0C
        add     eax, 1                                  ; 21EA _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 21ED _ 89. 45, 10
?_107:  cmp     dword [ebp+10H], -1                     ; 21F0 _ 83. 7D, 10, FF
        jge     ?_108                                   ; 21F4 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 21F6 _ C7. 45, 10, FFFFFFFF
?_108:  mov     eax, dword [ebp+0CH]                    ; 21FD _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2200 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 2203 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 2206 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2209 _ 3B. 45, 10
        jle     ?_115                                   ; 220C _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 2212 _ 83. 7D, 10, 00
        js      ?_111                                   ; 2216 _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 221C _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 221F _ 89. 45, F0
        jmp     ?_110                                   ; 2222 _ EB, 34

?_109:  mov     eax, dword [ebp-10H]                    ; 2224 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 2227 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 222A _ 8B. 45, 08
        add     edx, 4                                  ; 222D _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2230 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2234 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2237 _ 8B. 4D, F0
        add     ecx, 4                                  ; 223A _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 223D _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2241 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2244 _ 8B. 55, F0
        add     edx, 4                                  ; 2247 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 224A _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 224E _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2251 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2254 _ 83. 6D, F0, 01
?_110:  mov     eax, dword [ebp-10H]                    ; 2258 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 225B _ 3B. 45, 10
        jg      ?_109                                   ; 225E _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 2260 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2263 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2266 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2269 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 226C _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 2270 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2273 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2276 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2279 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 227C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 227F _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2282 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2285 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2288 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 228B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 228E _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2291 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2294 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2297 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 229A _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 229D _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 22A0 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 22A4 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 22A8 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 22AC _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 22B0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 22B4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 22B7 _ 89. 04 24
        call    sheet_refresh_map                       ; 22BA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 22BF _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 22C2 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 22C5 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 22C8 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 22CB _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 22CE _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 22D1 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 22D4 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 22D7 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 22DA _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 22DD _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 22E0 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 22E3 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 22E6 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 22E9 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 22EC _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 22EF _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 22F3 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 22F7 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 22FB _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 22FF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2303 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2306 _ 89. 04 24
        call    sheet_refresh_local                     ; 2309 _ E8, FFFFFFFC(rel)
        jmp     ?_122                                   ; 230E _ E9, 0000026C

?_111:  mov     eax, dword [ebp+8H]                     ; 2313 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2316 _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 2319 _ 3B. 45, F4
        jle     ?_114                                   ; 231C _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 231E _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2321 _ 89. 45, F0
        jmp     ?_113                                   ; 2324 _ EB, 34

?_112:  mov     eax, dword [ebp-10H]                    ; 2326 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2329 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 232C _ 8B. 45, 08
        add     edx, 4                                  ; 232F _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2332 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2336 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2339 _ 8B. 4D, F0
        add     ecx, 4                                  ; 233C _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 233F _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2343 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2346 _ 8B. 55, F0
        add     edx, 4                                  ; 2349 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 234C _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2350 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2353 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2356 _ 83. 45, F0, 01
?_113:  mov     eax, dword [ebp+8H]                     ; 235A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 235D _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 2360 _ 3B. 45, F0
        jg      ?_112                                   ; 2363 _ 7F, C1
?_114:  mov     eax, dword [ebp+8H]                     ; 2365 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2368 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 236B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 236E _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2371 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2374 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2377 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 237A _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 237D _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2380 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2383 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2386 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2389 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 238C _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 238F _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2392 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2395 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2398 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 239B _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 239E _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 23A6 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 23AA _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 23AE _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 23B2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 23B6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 23B9 _ 89. 04 24
        call    sheet_refresh_map                       ; 23BC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 23C1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 23C4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 23C7 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 23CA _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 23CD _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 23D0 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 23D3 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 23D6 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 23D9 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 23DC _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 23DF _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 23E2 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 23E5 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 23E8 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 23EB _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 23F3 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 23F7 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 23FB _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 23FF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2403 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2406 _ 89. 04 24
        call    sheet_refresh_local                     ; 2409 _ E8, FFFFFFFC(rel)
        jmp     ?_122                                   ; 240E _ E9, 0000016C

?_115:  mov     eax, dword [ebp-0CH]                    ; 2413 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2416 _ 3B. 45, 10
        jge     ?_122                                   ; 2419 _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 241F _ 83. 7D, F4, 00
        js      ?_118                                   ; 2423 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 2425 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2428 _ 89. 45, F0
        jmp     ?_117                                   ; 242B _ EB, 34

?_116:  mov     eax, dword [ebp-10H]                    ; 242D _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2430 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2433 _ 8B. 45, 08
        add     edx, 4                                  ; 2436 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2439 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 243D _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2440 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2443 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2446 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 244A _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 244D _ 8B. 55, F0
        add     edx, 4                                  ; 2450 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2453 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2457 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 245A _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 245D _ 83. 45, F0, 01
?_117:  mov     eax, dword [ebp-10H]                    ; 2461 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2464 _ 3B. 45, 10
        jl      ?_116                                   ; 2467 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 2469 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 246C _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 246F _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2472 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2475 _ 89. 54 88, 04
        jmp     ?_121                                   ; 2479 _ EB, 6C

?_118:  mov     eax, dword [ebp+8H]                     ; 247B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 247E _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2481 _ 89. 45, F0
        jmp     ?_120                                   ; 2484 _ EB, 3A

?_119:  mov     eax, dword [ebp-10H]                    ; 2486 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 2489 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 248C _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 248F _ 8B. 55, F0
        add     edx, 4                                  ; 2492 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2495 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2499 _ 8B. 45, 08
        add     ecx, 4                                  ; 249C _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 249F _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 24A3 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 24A6 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 24A9 _ 8B. 45, 08
        add     edx, 4                                  ; 24AC _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 24AF _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 24B3 _ 8B. 55, F0
        add     edx, 1                                  ; 24B6 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 24B9 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 24BC _ 83. 6D, F0, 01
?_120:  mov     eax, dword [ebp-10H]                    ; 24C0 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 24C3 _ 3B. 45, 10
        jge     ?_119                                   ; 24C6 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 24C8 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 24CB _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 24CE _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 24D1 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 24D4 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 24D8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 24DB _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 24DE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 24E1 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 24E4 _ 89. 50, 0C
?_121:  mov     eax, dword [ebp+0CH]                    ; 24E7 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 24EA _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 24ED _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 24F0 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 24F3 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 24F6 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 24F9 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 24FC _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 24FF _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2502 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2505 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2508 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 250B _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 250E _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 2511 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 2514 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 2518 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 251C _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 2520 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2524 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2528 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 252B _ 89. 04 24
        call    sheet_refresh_map                       ; 252E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2533 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2536 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2539 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 253C _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 253F _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2542 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2545 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2548 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 254B _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 254E _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2551 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2554 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2557 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 255A _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 255D _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 2560 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 2564 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2568 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 256C _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2570 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2574 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2577 _ 89. 04 24
        call    sheet_refresh_local                     ; 257A _ E8, FFFFFFFC(rel)
?_122:  add     esp, 48                                 ; 257F _ 83. C4, 30
        pop     ebx                                     ; 2582 _ 5B
        pop     esi                                     ; 2583 _ 5E
        pop     ebp                                     ; 2584 _ 5D
        ret                                             ; 2585 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 2586 _ 55
        mov     ebp, esp                                ; 2587 _ 89. E5
        push    edi                                     ; 2589 _ 57
        push    esi                                     ; 258A _ 56
        push    ebx                                     ; 258B _ 53
        sub     esp, 44                                 ; 258C _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 258F _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2592 _ 8B. 40, 18
        test    eax, eax                                ; 2595 _ 85. C0
        js      ?_123                                   ; 2597 _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 2599 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 259C _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 259F _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 25A2 _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 25A5 _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 25A8 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 25AB _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 25AE _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 25B1 _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 25B4 _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 25B7 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 25BA _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 25BD _ 8B. 55, 14
        add     ecx, edx                                ; 25C0 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 25C2 _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 25C5 _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 25C8 _ 8B. 55, 10
        add     edx, edi                                ; 25CB _ 01. FA
        mov     dword [esp+14H], eax                    ; 25CD _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 25D1 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 25D5 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 25D9 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 25DD _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 25E1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 25E4 _ 89. 04 24
        call    sheet_refresh_local                     ; 25E7 _ E8, FFFFFFFC(rel)
?_123:  mov     eax, 0                                  ; 25EC _ B8, 00000000
        add     esp, 44                                 ; 25F1 _ 83. C4, 2C
        pop     ebx                                     ; 25F4 _ 5B
        pop     esi                                     ; 25F5 _ 5E
        pop     edi                                     ; 25F6 _ 5F
        pop     ebp                                     ; 25F7 _ 5D
        ret                                             ; 25F8 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 25F9 _ 55
        mov     ebp, esp                                ; 25FA _ 89. E5
        push    ebx                                     ; 25FC _ 53
        sub     esp, 52                                 ; 25FD _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 2600 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2603 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2606 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2609 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 260C _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 260F _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 2612 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2615 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2618 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 261B _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 261E _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 2621 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2624 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2627 _ 8B. 40, 18
        test    eax, eax                                ; 262A _ 85. C0
        js      ?_124                                   ; 262C _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 2632 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2635 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2638 _ 8B. 45, F4
        add     edx, eax                                ; 263B _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 263D _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2640 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2643 _ 8B. 45, F0
        add     eax, ecx                                ; 2646 _ 01. C8
        mov     dword [esp+14H], 0                      ; 2648 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 2650 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2654 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2658 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 265B _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 265F _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2662 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2666 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2669 _ 89. 04 24
        call    sheet_refresh_map                       ; 266C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2671 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2674 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2677 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 267A _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 267D _ 8B. 55, 14
        add     ecx, edx                                ; 2680 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2682 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2685 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2688 _ 8B. 55, 10
        add     edx, ebx                                ; 268B _ 01. DA
        mov     dword [esp+14H], eax                    ; 268D _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 2691 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 2695 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 2699 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 269C _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 26A0 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 26A3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 26A7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 26AA _ 89. 04 24
        call    sheet_refresh_map                       ; 26AD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 26B2 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 26B5 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 26B8 _ 8B. 45, F4
        add     edx, eax                                ; 26BB _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 26BD _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 26C0 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 26C3 _ 8B. 45, F0
        add     eax, ecx                                ; 26C6 _ 01. C8
        mov     dword [esp+14H], 0                      ; 26C8 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 26D0 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 26D4 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 26D8 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 26DB _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 26DF _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 26E2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 26E6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 26E9 _ 89. 04 24
        call    sheet_refresh_local                     ; 26EC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 26F1 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 26F4 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 26F7 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 26FA _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 26FD _ 8B. 55, 14
        add     ecx, edx                                ; 2700 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2702 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2705 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2708 _ 8B. 55, 10
        add     edx, ebx                                ; 270B _ 01. DA
        mov     dword [esp+14H], eax                    ; 270D _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 2711 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 2715 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 2719 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 271C _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2720 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2723 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2727 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 272A _ 89. 04 24
        call    sheet_refresh_local                     ; 272D _ E8, FFFFFFFC(rel)
?_124:  add     esp, 52                                 ; 2732 _ 83. C4, 34
        pop     ebx                                     ; 2735 _ 5B
        pop     ebp                                     ; 2736 _ 5D
        ret                                             ; 2737 _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 2738 _ 55
        mov     ebp, esp                                ; 2739 _ 89. E5
        sub     esp, 48                                 ; 273B _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 273E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2741 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 2743 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2746 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2749 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 274C _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 274F _ 83. 7D, 0C, 00
        jns     ?_125                                   ; 2753 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2755 _ C7. 45, 0C, 00000000
?_125:  cmp     dword [ebp+10H], 0                      ; 275C _ 83. 7D, 10, 00
        jns     ?_126                                   ; 2760 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2762 _ C7. 45, 10, 00000000
?_126:  mov     eax, dword [ebp+8H]                     ; 2769 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 276C _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 276F _ 3B. 45, 14
        jge     ?_127                                   ; 2772 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2774 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2777 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 277A _ 89. 45, 14
?_127:  mov     eax, dword [ebp+8H]                     ; 277D _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2780 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 2783 _ 3B. 45, 18
        jge     ?_128                                   ; 2786 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2788 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 278B _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 278E _ 89. 45, 18
?_128:  mov     eax, dword [ebp+1CH]                    ; 2791 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 2794 _ 89. 45, DC
        jmp     ?_135                                   ; 2797 _ E9, 00000119

?_129:  mov     eax, dword [ebp+8H]                     ; 279C _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 279F _ 8B. 55, DC
        add     edx, 4                                  ; 27A2 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 27A5 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 27A9 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 27AC _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 27AF _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 27B1 _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 27B4 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 27B7 _ 8B. 45, 08
        add     eax, 1044                               ; 27BA _ 05, 00000414
        sub     edx, eax                                ; 27BF _ 29. C2
        mov     eax, edx                                ; 27C1 _ 89. D0
        sar     eax, 5                                  ; 27C3 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 27C6 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 27C9 _ C7. 45, E4, 00000000
        jmp     ?_134                                   ; 27D0 _ E9, 000000CD

?_130:  mov     eax, dword [ebp-10H]                    ; 27D5 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 27D8 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 27DB _ 8B. 45, E4
        add     eax, edx                                ; 27DE _ 01. D0
        mov     dword [ebp-8H], eax                     ; 27E0 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 27E3 _ C7. 45, E0, 00000000
        jmp     ?_133                                   ; 27EA _ E9, 000000A0

?_131:  mov     eax, dword [ebp-10H]                    ; 27EF _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 27F2 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 27F5 _ 8B. 45, E0
        add     eax, edx                                ; 27F8 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 27FA _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 27FD _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 2800 _ 3B. 45, FC
        jg      ?_132                                   ; 2803 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 2809 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 280C _ 3B. 45, 14
        jge     ?_132                                   ; 280F _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 2811 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 2814 _ 3B. 45, F8
        jg      ?_132                                   ; 2817 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 2819 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 281C _ 3B. 45, 18
        jge     ?_132                                   ; 281F _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 2821 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2824 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 2827 _ 0F AF. 45, E4
        mov     edx, eax                                ; 282B _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 282D _ 8B. 45, E0
        add     eax, edx                                ; 2830 _ 01. D0
        mov     edx, eax                                ; 2832 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2834 _ 8B. 45, F4
        add     eax, edx                                ; 2837 _ 01. D0
        movzx   eax, byte [eax]                         ; 2839 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 283C _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 283F _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 2843 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 2846 _ 8B. 40, 14
        cmp     edx, eax                                ; 2849 _ 39. C2
        jz      ?_132                                   ; 284B _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 284D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2850 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 2853 _ 0F AF. 45, F8
        mov     edx, eax                                ; 2857 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2859 _ 8B. 45, FC
        add     eax, edx                                ; 285C _ 01. D0
        mov     edx, eax                                ; 285E _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2860 _ 8B. 45, EC
        add     eax, edx                                ; 2863 _ 01. D0
        movzx   eax, byte [eax]                         ; 2865 _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 2868 _ 3A. 45, DA
        jnz     ?_132                                   ; 286B _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 286D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2870 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 2873 _ 0F AF. 45, F8
        mov     edx, eax                                ; 2877 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2879 _ 8B. 45, FC
        add     eax, edx                                ; 287C _ 01. D0
        mov     edx, eax                                ; 287E _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 2880 _ 8B. 45, E8
        add     edx, eax                                ; 2883 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 2885 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 2889 _ 88. 02
?_132:  add     dword [ebp-20H], 1                      ; 288B _ 83. 45, E0, 01
?_133:  mov     eax, dword [ebp-10H]                    ; 288F _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2892 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 2895 _ 3B. 45, E0
        jg      ?_131                                   ; 2898 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 289E _ 83. 45, E4, 01
?_134:  mov     eax, dword [ebp-10H]                    ; 28A2 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 28A5 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 28A8 _ 3B. 45, E4
        jg      ?_130                                   ; 28AB _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 28B1 _ 83. 45, DC, 01
?_135:  mov     eax, dword [ebp+8H]                     ; 28B5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 28B8 _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 28BB _ 3B. 45, DC
        jge     ?_129                                   ; 28BE _ 0F 8D, FFFFFED8
        leave                                           ; 28C4 _ C9
        ret                                             ; 28C5 _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 28C6 _ 55
        mov     ebp, esp                                ; 28C7 _ 89. E5
        sub     esp, 64                                 ; 28C9 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 28CC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 28CF _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 28D1 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 28D4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 28D7 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 28DA _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 28DD _ 83. 7D, 0C, 00
        jns     ?_136                                   ; 28E1 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 28E3 _ C7. 45, 0C, 00000000
?_136:  cmp     dword [ebp+10H], 0                      ; 28EA _ 83. 7D, 10, 00
        jns     ?_137                                   ; 28EE _ 79, 07
        mov     dword [ebp+10H], 0                      ; 28F0 _ C7. 45, 10, 00000000
?_137:  mov     eax, dword [ebp+8H]                     ; 28F7 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 28FA _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 28FD _ 3B. 45, 14
        jge     ?_138                                   ; 2900 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2902 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2905 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 2908 _ 89. 45, 14
?_138:  mov     eax, dword [ebp+8H]                     ; 290B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 290E _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 2911 _ 3B. 45, 18
        jge     ?_139                                   ; 2914 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2916 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2919 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 291C _ 89. 45, 18
?_139:  mov     eax, dword [ebp+1CH]                    ; 291F _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 2922 _ 89. 45, CC
        jmp     ?_150                                   ; 2925 _ E9, 00000141

?_140:  mov     eax, dword [ebp+8H]                     ; 292A _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 292D _ 8B. 55, CC
        add     edx, 4                                  ; 2930 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2933 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2937 _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 293A _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 293D _ 8B. 45, 08
        add     eax, 1044                               ; 2940 _ 05, 00000414
        sub     edx, eax                                ; 2945 _ 29. C2
        mov     eax, edx                                ; 2947 _ 89. D0
        sar     eax, 5                                  ; 2949 _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 294C _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 294F _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2952 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2954 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2957 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 295A _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 295D _ 8B. 55, 0C
        sub     edx, eax                                ; 2960 _ 29. C2
        mov     eax, edx                                ; 2962 _ 89. D0
        mov     dword [ebp-30H], eax                    ; 2964 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 2967 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 296A _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 296D _ 8B. 55, 10
        sub     edx, eax                                ; 2970 _ 29. C2
        mov     eax, edx                                ; 2972 _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 2974 _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 2977 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 297A _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 297D _ 8B. 55, 14
        sub     edx, eax                                ; 2980 _ 29. C2
        mov     eax, edx                                ; 2982 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 2984 _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 2987 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 298A _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 298D _ 8B. 55, 18
        sub     edx, eax                                ; 2990 _ 29. C2
        mov     eax, edx                                ; 2992 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 2994 _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 2997 _ 83. 7D, D0, 00
        jns     ?_141                                   ; 299B _ 79, 07
        mov     dword [ebp-30H], 0                      ; 299D _ C7. 45, D0, 00000000
?_141:  cmp     dword [ebp-2CH], 0                      ; 29A4 _ 83. 7D, D4, 00
        jns     ?_142                                   ; 29A8 _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 29AA _ C7. 45, D4, 00000000
?_142:  mov     eax, dword [ebp-10H]                    ; 29B1 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 29B4 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 29B7 _ 3B. 45, D8
        jge     ?_143                                   ; 29BA _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 29BC _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 29BF _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 29C2 _ 89. 45, D8
?_143:  mov     eax, dword [ebp-10H]                    ; 29C5 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 29C8 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 29CB _ 3B. 45, DC
        jge     ?_144                                   ; 29CE _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 29D0 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 29D3 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 29D6 _ 89. 45, DC
?_144:  mov     eax, dword [ebp-2CH]                    ; 29D9 _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 29DC _ 89. 45, E4
        jmp     ?_149                                   ; 29DF _ EB, 7A

?_145:  mov     eax, dword [ebp-10H]                    ; 29E1 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 29E4 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 29E7 _ 8B. 45, E4
        add     eax, edx                                ; 29EA _ 01. D0
        mov     dword [ebp-8H], eax                     ; 29EC _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 29EF _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 29F2 _ 89. 45, E0
        jmp     ?_148                                   ; 29F5 _ EB, 58

?_146:  mov     eax, dword [ebp-10H]                    ; 29F7 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 29FA _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 29FD _ 8B. 45, E0
        add     eax, edx                                ; 2A00 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 2A02 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 2A05 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2A08 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 2A0B _ 0F AF. 45, E4
        mov     edx, eax                                ; 2A0F _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2A11 _ 8B. 45, E0
        add     eax, edx                                ; 2A14 _ 01. D0
        mov     edx, eax                                ; 2A16 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2A18 _ 8B. 45, F4
        add     eax, edx                                ; 2A1B _ 01. D0
        movzx   eax, byte [eax]                         ; 2A1D _ 0F B6. 00
        movzx   edx, al                                 ; 2A20 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 2A23 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 2A26 _ 8B. 40, 14
        cmp     edx, eax                                ; 2A29 _ 39. C2
        jz      ?_147                                   ; 2A2B _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 2A2D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2A30 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 2A33 _ 0F AF. 45, F8
        mov     edx, eax                                ; 2A37 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2A39 _ 8B. 45, FC
        add     eax, edx                                ; 2A3C _ 01. D0
        mov     edx, eax                                ; 2A3E _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2A40 _ 8B. 45, EC
        add     edx, eax                                ; 2A43 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 2A45 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 2A49 _ 88. 02
?_147:  add     dword [ebp-20H], 1                      ; 2A4B _ 83. 45, E0, 01
?_148:  mov     eax, dword [ebp-20H]                    ; 2A4F _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 2A52 _ 3B. 45, D8
        jl      ?_146                                   ; 2A55 _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 2A57 _ 83. 45, E4, 01
?_149:  mov     eax, dword [ebp-1CH]                    ; 2A5B _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 2A5E _ 3B. 45, DC
        jl      ?_145                                   ; 2A61 _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 2A67 _ 83. 45, CC, 01
?_150:  mov     eax, dword [ebp+8H]                     ; 2A6B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2A6E _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 2A71 _ 3B. 45, CC
        jge     ?_140                                   ; 2A74 _ 0F 8D, FFFFFEB0
        leave                                           ; 2A7A _ C9
        ret                                             ; 2A7B _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 2A7C _ 55
        mov     ebp, esp                                ; 2A7D _ 89. E5
        sub     esp, 24                                 ; 2A7F _ 83. EC, 18
        mov     dword [esp+4H], 52                      ; 2A82 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 2A8A _ C7. 04 24, 00000043
        call    io_out8                                 ; 2A91 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 2A96 _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 2A9E _ C7. 04 24, 00000040
        call    io_out8                                 ; 2AA5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 2AAA _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 2AB2 _ C7. 04 24, 00000040
        call    io_out8                                 ; 2AB9 _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 2ABE _ C7. 05, 000002A0(d), 00000000
        leave                                           ; 2AC8 _ C9
        ret                                             ; 2AC9 _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 2ACA _ 55
        mov     ebp, esp                                ; 2ACB _ 89. E5
        mov     eax, timer_control                      ; 2ACD _ B8, 000002A0(d)
        pop     ebp                                     ; 2AD2 _ 5D
        ret                                             ; 2AD3 _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 2AD4 _ 55
        mov     ebp, esp                                ; 2AD5 _ 89. E5
        sub     esp, 16                                 ; 2AD7 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2ADA _ C7. 45, FC, 00000000
        jmp     ?_153                                   ; 2AE1 _ EB, 26

?_151:  mov     eax, dword [ebp-4H]                     ; 2AE3 _ 8B. 45, FC
        shl     eax, 4                                  ; 2AE6 _ C1. E0, 04
        add     eax, timer_control                      ; 2AE9 _ 05, 000002A0(d)
        mov     eax, dword [eax+8H]                     ; 2AEE _ 8B. 40, 08
        test    eax, eax                                ; 2AF1 _ 85. C0
        jnz     ?_152                                   ; 2AF3 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 2AF5 _ 8B. 45, FC
        shl     eax, 4                                  ; 2AF8 _ C1. E0, 04
        add     eax, timer_control                      ; 2AFB _ 05, 000002A0(d)
        add     eax, 4                                  ; 2B00 _ 83. C0, 04
        jmp     ?_154                                   ; 2B03 _ EB, 0D

?_152:  add     dword [ebp-4H], 1                       ; 2B05 _ 83. 45, FC, 01
?_153:  cmp     dword [ebp-4H], 499                     ; 2B09 _ 81. 7D, FC, 000001F3
        jle     ?_151                                   ; 2B10 _ 7E, D1
?_154:  leave                                           ; 2B12 _ C9
        ret                                             ; 2B13 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 2B14 _ 55
        mov     ebp, esp                                ; 2B15 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2B17 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2B1A _ C7. 40, 04, 00000000
        pop     ebp                                     ; 2B21 _ 5D
        ret                                             ; 2B22 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 2B23 _ 55
        mov     ebp, esp                                ; 2B24 _ 89. E5
        sub     esp, 4                                  ; 2B26 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 2B29 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 2B2C _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2B2F _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2B32 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 2B35 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2B38 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2B3B _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 2B3F _ 88. 50, 0C
        leave                                           ; 2B42 _ C9
        ret                                             ; 2B43 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 2B44 _ 55
        mov     ebp, esp                                ; 2B45 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2B47 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2B4A _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2B4D _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2B4F _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 2B52 _ C7. 40, 04, 00000002
        pop     ebp                                     ; 2B59 _ 5D
        ret                                             ; 2B5A _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 2B5B _ 55
        mov     ebp, esp                                ; 2B5C _ 89. E5
        sub     esp, 40                                 ; 2B5E _ 83. EC, 28
        mov     dword [esp+4H], 96                      ; 2B61 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 32                         ; 2B69 _ C7. 04 24, 00000020
        call    io_out8                                 ; 2B70 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 2B75 _ A1, 000002A0(d)
        add     eax, 1                                  ; 2B7A _ 83. C0, 01
        mov     dword [timer_control], eax              ; 2B7D _ A3, 000002A0(d)
        mov     dword [ebp-0CH], 0                      ; 2B82 _ C7. 45, F4, 00000000
        jmp     ?_157                                   ; 2B89 _ E9, 00000086

?_155:  mov     eax, dword [ebp-0CH]                    ; 2B8E _ 8B. 45, F4
        shl     eax, 4                                  ; 2B91 _ C1. E0, 04
        add     eax, timer_control                      ; 2B94 _ 05, 000002A0(d)
        mov     eax, dword [eax+8H]                     ; 2B99 _ 8B. 40, 08
        cmp     eax, 2                                  ; 2B9C _ 83. F8, 02
        jnz     ?_156                                   ; 2B9F _ 75, 6F
        mov     eax, dword [ebp-0CH]                    ; 2BA1 _ 8B. 45, F4
        shl     eax, 4                                  ; 2BA4 _ C1. E0, 04
        add     eax, timer_control                      ; 2BA7 _ 05, 000002A0(d)
        mov     eax, dword [eax+4H]                     ; 2BAC _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 2BAF _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 2BB2 _ 8B. 45, F4
        shl     eax, 4                                  ; 2BB5 _ C1. E0, 04
        add     eax, timer_control                      ; 2BB8 _ 05, 000002A0(d)
        mov     dword [eax+4H], edx                     ; 2BBD _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 2BC0 _ 8B. 45, F4
        shl     eax, 4                                  ; 2BC3 _ C1. E0, 04
        add     eax, timer_control                      ; 2BC6 _ 05, 000002A0(d)
        mov     eax, dword [eax+4H]                     ; 2BCB _ 8B. 40, 04
        test    eax, eax                                ; 2BCE _ 85. C0
        jnz     ?_156                                   ; 2BD0 _ 75, 3E
        mov     eax, dword [ebp-0CH]                    ; 2BD2 _ 8B. 45, F4
        shl     eax, 4                                  ; 2BD5 _ C1. E0, 04
        add     eax, timer_control                      ; 2BD8 _ 05, 000002A0(d)
        mov     dword [eax+8H], 1                       ; 2BDD _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 2BE4 _ 8B. 45, F4
        shl     eax, 4                                  ; 2BE7 _ C1. E0, 04
        add     eax, timer_control                      ; 2BEA _ 05, 000002A0(d)
        movzx   eax, byte [eax+10H]                     ; 2BEF _ 0F B6. 40, 10
        movzx   edx, al                                 ; 2BF3 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 2BF6 _ 8B. 45, F4
        shl     eax, 4                                  ; 2BF9 _ C1. E0, 04
        add     eax, timer_control                      ; 2BFC _ 05, 000002A0(d)
        mov     eax, dword [eax+0CH]                    ; 2C01 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 2C04 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2C08 _ 89. 04 24
        call    fifo8_put                               ; 2C0B _ E8, FFFFFFFC(rel)
?_156:  add     dword [ebp-0CH], 1                      ; 2C10 _ 83. 45, F4, 01
?_157:  cmp     dword [ebp-0CH], 499                    ; 2C14 _ 81. 7D, F4, 000001F3
        jle     ?_155                                   ; 2C1B _ 0F 8E, FFFFFF6D
        leave                                           ; 2C21 _ C9
        ret                                             ; 2C22 _ C3
; intHandlerTimer End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_158:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_159:                                                  ; byte
        db 5BH, 35H, 20H, 73H, 65H, 63H, 5DH, 00H       ; 0007 _ [5 sec].

?_160:                                                  ; byte
        db 5BH, 33H, 20H, 73H, 65H, 63H, 5DH, 00H       ; 000F _ [3 sec].

?_161:                                                  ; byte
        db 69H, 6DH, 70H, 72H, 6FH, 76H, 65H, 20H       ; 0017 _ improve 
        db 73H, 74H, 72H, 69H, 6EH, 67H, 20H, 73H       ; 001F _ string s
        db 68H, 6FH, 77H, 69H, 6EH, 67H, 00H            ; 0027 _ howing.

?_162:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 002E _ page is:
        db 20H, 00H                                     ; 0036 _  .

?_163:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0038 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0040 _ L: .

?_164:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0044 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 004C _ H: .

?_165:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0050 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0058 _ w: .

?_166:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 005C _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0064 _ gh: .

?_167:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0069 _ type: .

?_168:                                                  ; byte
        db 57H, 65H, 6CH, 63H, 6FH, 6DH, 65H, 20H       ; 0070 _ Welcome 
        db 74H, 6FH, 00H                                ; 0078 _ to.

?_169:                                                  ; byte
        db 57H, 65H, 54H, 72H, 65H, 65H, 4FH, 53H       ; 007B _ WeTreeOS
        db 00H                                          ; 0083 _ .


SECTION .data   align=32 noexecute                      ; section number 3, data

memman:                                                 ; dword
        dd 00100000H, 00000000H                         ; 0000 _ 1048576 0 
        dd 00000000H, 00000000H                         ; 0008 _ 0 0 
        dd 00000000H, 00000000H                         ; 0010 _ 0 0 
        dd 00000000H, 00000000H                         ; 0018 _ 0 0 

table_rgb.1615:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0020 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0028 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0030 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0038 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 0040 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

cursor.1683:                                            ; byte
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0060 _ *.......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0068 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0070 _ **......
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0078 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0080 _ *O*.....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0088 _ ........
        db 2AH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH, 2EH       ; 0090 _ *OO*....
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0098 _ ........
        db 2AH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH, 2EH       ; 00A0 _ *OOO*...
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00A8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH, 2EH       ; 00B0 _ *OOOO*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00B8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH, 2EH       ; 00C0 _ *OOOOO*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00C8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 2AH       ; 00D0 _ *OOOOOO*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00D8 _ ........
        db 2AH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 00E0 _ *OOOOOOO
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00E8 _ *.......
        db 2AH, 4FH, 4FH, 4FH, 4FH, 2AH, 2AH, 2AH       ; 00F0 _ *OOOO***
        db 2AH, 2AH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 00F8 _ **......
        db 2AH, 4FH, 4FH, 2AH, 4FH, 2AH, 2EH, 2EH       ; 0100 _ *OO*O*..
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0108 _ ........
        db 2AH, 4FH, 2AH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 0110 _ *O*.*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0118 _ ........
        db 2AH, 2AH, 2EH, 2EH, 2AH, 4FH, 2AH, 2EH       ; 0120 _ **..*O*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0128 _ ........
        db 2AH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0130 _ *....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0138 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 4FH, 2AH       ; 0140 _ .....*O*
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0148 _ ........
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2AH, 2EH       ; 0150 _ ......*.
        db 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH, 2EH       ; 0158 _ ........

closebtn.1751:                                          ; byte
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH       ; 0160 _ OOOOOOOO
        db 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 4FH, 40H       ; 0168 _ OOOOOOO@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0170 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0178 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0180 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0188 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 0190 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 0198 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 01A0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 01A8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 01B0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01B8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 40H       ; 01C0 _ OQQQQQQ@
        db 40H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01C8 _ @QQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 40H, 40H       ; 01D0 _ OQQQQQ@@
        db 40H, 40H, 51H, 51H, 51H, 51H, 24H, 40H       ; 01D8 _ @@QQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 40H, 40H, 51H       ; 01E0 _ OQQQQ@@Q
        db 51H, 40H, 40H, 51H, 51H, 51H, 24H, 40H       ; 01E8 _ Q@@QQQ$@
        db 4FH, 51H, 51H, 51H, 40H, 40H, 51H, 51H       ; 01F0 _ OQQQ@@QQ
        db 51H, 51H, 40H, 40H, 51H, 51H, 24H, 40H       ; 01F8 _ QQ@@QQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0200 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0208 _ QQQQQQ$@
        db 4FH, 51H, 51H, 51H, 51H, 51H, 51H, 51H       ; 0210 _ OQQQQQQQ
        db 51H, 51H, 51H, 51H, 51H, 51H, 24H, 40H       ; 0218 _ QQQQQQ$@
        db 4FH, 24H, 24H, 24H, 24H, 24H, 24H, 24H       ; 0220 _ O$$$$$$$
        db 24H, 24H, 24H, 24H, 24H, 24H, 24H, 40H       ; 0228 _ $$$$$$$@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0230 _ @@@@@@@@
        db 40H, 40H, 40H, 40H, 40H, 40H, 40H, 40H       ; 0238 _ @@@@@@@@

keyval:                                                 ; byte
        db 30H, 58H                                     ; 0240 _ 0X

?_170:  db 00H                                          ; 0242 _ .

?_171:  db 00H, 00H                                     ; 0243 _ ..


SECTION .bss    align=32 noexecute                      ; section number 4, bss

timerinfo1.1642:                                        ; byte
        resb    24                                      ; 0000

timerbuf1.1645:                                         ; qword
        resq    1                                       ; 0018

timerinfo2.1643:                                        ; byte
        resb    24                                      ; 0020

timerbuf2.1646:                                         ; qword
        resq    1                                       ; 0038

timerinfo3.1644:                                        ; byte
        resb    24                                      ; 0040

timerbuf3.1647:                                         ; qword
        resq    1                                       ; 0058

screen_info:                                            ; qword
        resb    4                                       ; 0060

?_172:  resw    1                                       ; 0064

?_173:  resw    13                                      ; 0066

mouse_cursor_buf:                                       ; byte
        resb    256                                     ; 0080

back_buf: resd  1                                       ; 0180

mouse_x: resd   1                                       ; 0184

mouse_y: resd   1                                       ; 0188

mouse_send_info:                                        ; oword
        resb    20                                      ; 018C

keyinfo:                                                ; byte
        resb    32                                      ; 01A0

keybuf:                                                 ; yword
        resb    32                                      ; 01C0

mouseinfo:                                              ; byte
        resb    32                                      ; 01E0

mousebuf:                                               ; byte
        resb    128                                     ; 0200

str.1386:                                               ; byte
        resb    1                                       ; 0280

?_174:  resb    9                                       ; 0281

?_175:  resb    22                                      ; 028A

timer_control:                                          ; byte
        resd    2001                                    ; 02A0


