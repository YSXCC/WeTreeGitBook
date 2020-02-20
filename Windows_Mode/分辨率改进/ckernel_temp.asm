; Disassembly of file: ckernel.o
; Thu Feb 20 09:35:02 2020
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
        sub     esp, 100                                ; 0004 _ 83. EC, 64
        mov     dword [esp], screen_info                ; 0007 _ C7. 04 24, 00000000(d)
        call    init_screeninfo                         ; 000E _ E8, FFFFFFFC(rel)
        mov     eax, dword [screen_info]                ; 0013 _ A1, 00000000(d)
        mov     dword [ebp-48H], eax                    ; 0018 _ 89. 45, B8
        movzx   eax, word [screen_info+4H]              ; 001B _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0022 _ 98
        mov     dword [ebp-44H], eax                    ; 0023 _ 89. 45, BC
        movzx   eax, word [screen_info+6H]              ; 0026 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 002D _ 98
        mov     dword [ebp-40H], eax                    ; 002E _ 89. 45, C0
        mov     eax, dword [memman]                     ; 0031 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0036 _ 89. 04 24
        call    memman_init                             ; 0039 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 003E _ A1, 00000000(d)
        mov     dword [esp+8H], 1072594944              ; 0043 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 17301504                ; 004B _ C7. 44 24, 04, 01080000
        mov     dword [esp], eax                        ; 0053 _ 89. 04 24
        call    memman_free                             ; 0056 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-3CH], 0                      ; 005B _ C7. 45, C4, 00000000
        mov     dword [ebp-38H], 0                      ; 0062 _ C7. 45, C8, 00000000
        mov     eax, dword [memman]                     ; 0069 _ A1, 00000000(d)
        mov     edx, dword [ebp-40H]                    ; 006E _ 8B. 55, C0
        mov     dword [esp+0CH], edx                    ; 0071 _ 89. 54 24, 0C
        mov     edx, dword [ebp-44H]                    ; 0075 _ 8B. 55, BC
        mov     dword [esp+8H], edx                     ; 0078 _ 89. 54 24, 08
        mov     edx, dword [ebp-48H]                    ; 007C _ 8B. 55, B8
        mov     dword [esp+4H], edx                     ; 007F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0083 _ 89. 04 24
        call    sheet_control_init                      ; 0086 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 008B _ 89. 45, CC
        mov     eax, dword [ebp-34H]                    ; 008E _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0091 _ 89. 04 24
        call    sheet_alloc                             ; 0094 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-3CH], eax                    ; 0099 _ 89. 45, C4
        mov     eax, dword [ebp-34H]                    ; 009C _ 8B. 45, CC
        mov     dword [esp], eax                        ; 009F _ 89. 04 24
        call    sheet_alloc                             ; 00A2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 00A7 _ 89. 45, C8
        mov     eax, dword [ebp-44H]                    ; 00AA _ 8B. 45, BC
        imul    eax, dword [ebp-40H]                    ; 00AD _ 0F AF. 45, C0
        mov     edx, eax                                ; 00B1 _ 89. C2
        mov     eax, dword [memman]                     ; 00B3 _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 00B8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00BC _ 89. 04 24
        call    memman_alloc_4k                         ; 00BF _ E8, FFFFFFFC(rel)
        mov     dword [back_buf], eax                   ; 00C4 _ A3, 00000000(d)
        mov     eax, dword [back_buf]                   ; 00C9 _ A1, 00000000(d)
        mov     dword [esp+10H], 99                     ; 00CE _ C7. 44 24, 10, 00000063
        mov     edx, dword [ebp-40H]                    ; 00D6 _ 8B. 55, C0
        mov     dword [esp+0CH], edx                    ; 00D9 _ 89. 54 24, 0C
        mov     edx, dword [ebp-44H]                    ; 00DD _ 8B. 55, BC
        mov     dword [esp+8H], edx                     ; 00E0 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 00E4 _ 89. 44 24, 04
        mov     eax, dword [ebp-3CH]                    ; 00E8 _ 8B. 45, C4
        mov     dword [esp], eax                        ; 00EB _ 89. 04 24
        call    sheet_setbuf                            ; 00EE _ E8, FFFFFFFC(rel)
        mov     dword [esp+10H], 99                     ; 00F3 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 16                     ; 00FB _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 16                      ; 0103 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], mouse_cursor_buf        ; 010B _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-38H]                    ; 0113 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 0116 _ 89. 04 24
        call    sheet_setbuf                            ; 0119 _ E8, FFFFFFFC(rel)
        call    init_mouse_position                     ; 011E _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 0123 _ E8, FFFFFFFC(rel)
        call    init_fifo_buf                           ; 0128 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 012D _ E8, FFFFFFFC(rel)
        call    get_timer_control                       ; 0132 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0137 _ 89. 45, D0
        call    init_time_port                          ; 013A _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf1.1645          ; 013F _ C7. 44 24, 08, 00000018(d)
        mov     dword [esp+4H], 8                       ; 0147 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1642            ; 014F _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0156 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 015B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 0160 _ 89. 45, D4
        mov     dword [esp+8H], 1                       ; 0163 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1642         ; 016B _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-2CH]                    ; 0173 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 0176 _ 89. 04 24
        call    timer_init                              ; 0179 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 500                     ; 017E _ C7. 44 24, 04, 000001F4
        mov     eax, dword [ebp-2CH]                    ; 0186 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 0189 _ 89. 04 24
        call    timer_settime                           ; 018C _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf2.1646          ; 0191 _ C7. 44 24, 08, 00000038(d)
        mov     dword [esp+4H], 8                       ; 0199 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1643            ; 01A1 _ C7. 04 24, 00000020(d)
        call    fifo8_init                              ; 01A8 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01AD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 01B2 _ 89. 45, D8
        mov     dword [esp+8H], 1                       ; 01B5 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1643         ; 01BD _ C7. 44 24, 04, 00000020(d)
        mov     eax, dword [ebp-28H]                    ; 01C5 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 01C8 _ 89. 04 24
        call    timer_init                              ; 01CB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01D0 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-28H]                    ; 01D8 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 01DB _ 89. 04 24
        call    timer_settime                           ; 01DE _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf3.1647          ; 01E3 _ C7. 44 24, 08, 00000058(d)
        mov     dword [esp+4H], 8                       ; 01EB _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1644            ; 01F3 _ C7. 04 24, 00000040(d)
        call    fifo8_init                              ; 01FA _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01FF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 0204 _ 89. 45, DC
        mov     dword [esp+8H], 1                       ; 0207 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1644         ; 020F _ C7. 44 24, 04, 00000040(d)
        mov     eax, dword [ebp-24H]                    ; 0217 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 021A _ 89. 04 24
        call    timer_init                              ; 021D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 0222 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 022A _ 8B. 45, DC
        mov     dword [esp], eax                        ; 022D _ 89. 04 24
        call    timer_settime                           ; 0230 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 0235 _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 023A _ A1, 00000000(d)
        mov     edx, dword [ebp-40H]                    ; 023F _ 8B. 55, C0
        mov     dword [esp+8H], edx                     ; 0242 _ 89. 54 24, 08
        mov     edx, dword [ebp-44H]                    ; 0246 _ 8B. 55, BC
        mov     dword [esp+4H], edx                     ; 0249 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 024D _ 89. 04 24
        call    init_desktop                            ; 0250 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 99                      ; 0255 _ C7. 44 24, 04, 00000063
        mov     dword [esp], mouse_cursor_buf           ; 025D _ C7. 04 24, 00000000(d)
        call    init_mouse_cursor                       ; 0264 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0269 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0271 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-3CH]                    ; 0279 _ 8B. 45, C4
        mov     dword [esp+4H], eax                     ; 027C _ 89. 44 24, 04
        mov     eax, dword [ebp-34H]                    ; 0280 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0283 _ 89. 04 24
        call    sheet_slide                             ; 0286 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 028B _ 8B. 15, 00000000(d)
        mov     eax, dword [mouse_x]                    ; 0291 _ A1, 00000000(d)
        mov     dword [esp+0CH], edx                    ; 0296 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 029A _ 89. 44 24, 08
        mov     eax, dword [ebp-38H]                    ; 029E _ 8B. 45, C8
        mov     dword [esp+4H], eax                     ; 02A1 _ 89. 44 24, 04
        mov     eax, dword [ebp-34H]                    ; 02A5 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 02A8 _ 89. 04 24
        call    sheet_slide                             ; 02AB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], ?_158                   ; 02B0 _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-34H]                    ; 02B8 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 02BB _ 89. 04 24
        call    message_box                             ; 02BE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 02C3 _ 89. 45, E0
        mov     dword [esp+8H], 0                       ; 02C6 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-3CH]                    ; 02CE _ 8B. 45, C4
        mov     dword [esp+4H], eax                     ; 02D1 _ 89. 44 24, 04
        mov     eax, dword [ebp-34H]                    ; 02D5 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 02D8 _ 89. 04 24
        call    sheet_updown                            ; 02DB _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 100                     ; 02E0 _ C7. 44 24, 08, 00000064
        mov     eax, dword [ebp-38H]                    ; 02E8 _ 8B. 45, C8
        mov     dword [esp+4H], eax                     ; 02EB _ 89. 44 24, 04
        mov     eax, dword [ebp-34H]                    ; 02EF _ 8B. 45, CC
        mov     dword [esp], eax                        ; 02F2 _ 89. 04 24
        call    sheet_updown                            ; 02F5 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 02FA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], 0                      ; 02FF _ C7. 45, E4, 00000000
        mov     dword [ebp-18H], 0                      ; 0306 _ C7. 45, E8, 00000000
        mov     dword [ebp-14H], 0                      ; 030D _ C7. 45, EC, 00000000
?_001:  mov     eax, dword [ebp-2CH]                    ; 0314 _ 8B. 45, D4
        mov     eax, dword [eax]                        ; 0317 _ 8B. 00
        mov     dword [esp], eax                        ; 0319 _ 89. 04 24
        call    intToHexStr                             ; 031C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 0321 _ 89. 45, F0
        mov     eax, dword [ebp-20H]                    ; 0324 _ 8B. 45, E0
        mov     edx, dword [eax+4H]                     ; 0327 _ 8B. 50, 04
        mov     eax, dword [ebp-20H]                    ; 032A _ 8B. 45, E0
        mov     eax, dword [eax]                        ; 032D _ 8B. 00
        mov     dword [esp+18H], 43                     ; 032F _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], 119                    ; 0337 _ C7. 44 24, 14, 00000077
        mov     dword [esp+10H], 28                     ; 033F _ C7. 44 24, 10, 0000001C
        mov     dword [esp+0CH], 40                     ; 0347 _ C7. 44 24, 0C, 00000028
        mov     dword [esp+8H], 8                       ; 034F _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 0357 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 035B _ 89. 04 24
        call    paint_rectangle                         ; 035E _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 0363 _ C7. 44 24, 14, 00000000
        mov     eax, dword [ebp-10H]                    ; 036B _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 036E _ 89. 44 24, 10
        mov     dword [esp+0CH], 28                     ; 0372 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 40                      ; 037A _ C7. 44 24, 08, 00000028
        mov     eax, dword [ebp-20H]                    ; 0382 _ 8B. 45, E0
        mov     dword [esp+4H], eax                     ; 0385 _ 89. 44 24, 04
        mov     eax, dword [ebp-34H]                    ; 0389 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 038C _ 89. 04 24
        call    paint_string                            ; 038F _ E8, FFFFFFFC(rel)
        call    io_cli                                  ; 0394 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0399 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 03A0 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 03A5 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 03A7 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 03AE _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03B3 _ 01. C3
        mov     dword [esp], timerinfo1.1642            ; 03B5 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 03BC _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03C1 _ 01. C3
        mov     dword [esp], timerinfo2.1643            ; 03C3 _ C7. 04 24, 00000020(d)
        call    fifo8_status                            ; 03CA _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 03CF _ 01. C3
        mov     dword [esp], timerinfo3.1644            ; 03D1 _ C7. 04 24, 00000040(d)
        call    fifo8_status                            ; 03D8 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 03DD _ 01. D8
        test    eax, eax                                ; 03DF _ 85. C0
        jnz     ?_002                                   ; 03E1 _ 75, 0A
        call    io_sti                                  ; 03E3 _ E8, FFFFFFFC(rel)
        jmp     ?_009                                   ; 03E8 _ E9, 0000022F

?_002:  mov     dword [esp], keyinfo                    ; 03ED _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 03F4 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 03F9 _ 85. C0
        jz      ?_003                                   ; 03FB _ 74, 19
        call    io_sti                                  ; 03FD _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0402 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0409 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 040E _ 89. 45, E4
        jmp     ?_009                                   ; 0411 _ E9, 00000206

?_003:  mov     dword [esp], mouseinfo                  ; 0416 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 041D _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0422 _ 85. C0
        jz      ?_004                                   ; 0424 _ 74, 1E
        mov     eax, dword [ebp-38H]                    ; 0426 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 0429 _ 89. 44 24, 08
        mov     eax, dword [ebp-3CH]                    ; 042D _ 8B. 45, C4
        mov     dword [esp+4H], eax                     ; 0430 _ 89. 44 24, 04
        mov     eax, dword [ebp-34H]                    ; 0434 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0437 _ 89. 04 24
        call    show_mouse_info                         ; 043A _ E8, FFFFFFFC(rel)
        jmp     ?_009                                   ; 043F _ E9, 000001D8

?_004:  mov     dword [esp], timerinfo1.1642            ; 0444 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 044B _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0450 _ 85. C0
        jz      ?_005                                   ; 0452 _ 74, 48
        call    io_sti                                  ; 0454 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1642            ; 0459 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0460 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 0465 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_159                  ; 046D _ C7. 44 24, 10, 00000007(d)
        mov     dword [esp+0CH], 0                      ; 0475 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 047D _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-3CH]                    ; 0485 _ 8B. 45, C4
        mov     dword [esp+4H], eax                     ; 0488 _ 89. 44 24, 04
        mov     eax, dword [ebp-34H]                    ; 048C _ 8B. 45, CC
        mov     dword [esp], eax                        ; 048F _ 89. 04 24
        call    paint_string                            ; 0492 _ E8, FFFFFFFC(rel)
        jmp     ?_009                                   ; 0497 _ E9, 00000180

?_005:  mov     dword [esp], timerinfo2.1643            ; 049C _ C7. 04 24, 00000020(d)
        call    fifo8_status                            ; 04A3 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 04A8 _ 85. C0
        jz      ?_006                                   ; 04AA _ 74, 48
        call    io_sti                                  ; 04AC _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1643            ; 04B1 _ C7. 04 24, 00000020(d)
        call    fifo8_get                               ; 04B8 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 04BD _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_160                  ; 04C5 _ C7. 44 24, 10, 0000000F(d)
        mov     dword [esp+0CH], 32                     ; 04CD _ C7. 44 24, 0C, 00000020
        mov     dword [esp+8H], 0                       ; 04D5 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-3CH]                    ; 04DD _ 8B. 45, C4
        mov     dword [esp+4H], eax                     ; 04E0 _ 89. 44 24, 04
        mov     eax, dword [ebp-34H]                    ; 04E4 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 04E7 _ 89. 04 24
        call    paint_string                            ; 04EA _ E8, FFFFFFFC(rel)
        jmp     ?_009                                   ; 04EF _ E9, 00000128

?_006:  mov     dword [esp], timerinfo3.1644            ; 04F4 _ C7. 04 24, 00000040(d)
        call    fifo8_status                            ; 04FB _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0500 _ 85. C0
        je      ?_009                                   ; 0502 _ 0F 84, 00000114
        mov     dword [esp], timerinfo3.1644            ; 0508 _ C7. 04 24, 00000040(d)
        call    fifo8_get                               ; 050F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0514 _ 89. 45, F4
        call    io_sti                                  ; 0517 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 051C _ 83. 7D, F4, 00
        jz      ?_007                                   ; 0520 _ 74, 59
        mov     dword [esp+8H], 0                       ; 0522 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1644         ; 052A _ C7. 44 24, 04, 00000040(d)
        mov     eax, dword [ebp-24H]                    ; 0532 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0535 _ 89. 04 24
        call    timer_init                              ; 0538 _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 053D _ A1, 00000000(d)
        mov     dword [esp+18H], 111                    ; 0542 _ C7. 44 24, 18, 0000006F
        mov     dword [esp+14H], 15                     ; 054A _ C7. 44 24, 14, 0000000F
        mov     dword [esp+10H], 95                     ; 0552 _ C7. 44 24, 10, 0000005F
        mov     dword [esp+0CH], 8                      ; 055A _ C7. 44 24, 0C, 00000008
        mov     dword [esp+8H], 7                       ; 0562 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-44H]                    ; 056A _ 8B. 55, BC
        mov     dword [esp+4H], edx                     ; 056D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0571 _ 89. 04 24
        call    paint_rectangle                         ; 0574 _ E8, FFFFFFFC(rel)
        jmp     ?_008                                   ; 0579 _ EB, 57

?_007:  mov     dword [esp+8H], 1                       ; 057B _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1644         ; 0583 _ C7. 44 24, 04, 00000040(d)
        mov     eax, dword [ebp-24H]                    ; 058B _ 8B. 45, DC
        mov     dword [esp], eax                        ; 058E _ 89. 04 24
        call    timer_init                              ; 0591 _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 0596 _ A1, 00000000(d)
        mov     dword [esp+18H], 111                    ; 059B _ C7. 44 24, 18, 0000006F
        mov     dword [esp+14H], 15                     ; 05A3 _ C7. 44 24, 14, 0000000F
        mov     dword [esp+10H], 95                     ; 05AB _ C7. 44 24, 10, 0000005F
        mov     dword [esp+0CH], 8                      ; 05B3 _ C7. 44 24, 0C, 00000008
        mov     dword [esp+8H], 2                       ; 05BB _ C7. 44 24, 08, 00000002
        mov     edx, dword [ebp-44H]                    ; 05C3 _ 8B. 55, BC
        mov     dword [esp+4H], edx                     ; 05C6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05CA _ 89. 04 24
        call    paint_rectangle                         ; 05CD _ E8, FFFFFFFC(rel)
?_008:  mov     dword [esp+4H], 50                      ; 05D2 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-24H]                    ; 05DA _ 8B. 45, DC
        mov     dword [esp], eax                        ; 05DD _ 89. 04 24
        call    timer_settime                           ; 05E0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 112                    ; 05E5 _ C7. 44 24, 14, 00000070
        mov     dword [esp+10H], 16                     ; 05ED _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 96                     ; 05F5 _ C7. 44 24, 0C, 00000060
        mov     dword [esp+8H], 8                       ; 05FD _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp-3CH]                    ; 0605 _ 8B. 45, C4
        mov     dword [esp+4H], eax                     ; 0608 _ 89. 44 24, 04
        mov     eax, dword [ebp-34H]                    ; 060C _ 8B. 45, CC
        mov     dword [esp], eax                        ; 060F _ 89. 04 24
        call    sheet_refresh                           ; 0612 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0617 _ E9, FFFFFCF8

?_009:  jmp     ?_001                                   ; 061C _ E9, FFFFFCF3
; CMain End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0621 _ 55
        mov     ebp, esp                                ; 0622 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0624 _ A1, 00000000(d)
        mov     edx, eax                                ; 0629 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 062B _ 8B. 45, 08
        mov     dword [eax], edx                        ; 062E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0630 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0633 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0639 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 063C _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 0642 _ 5D
        ret                                             ; 0643 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0644 _ 55
        mov     ebp, esp                                ; 0645 _ 89. E5
        sub     esp, 24                                 ; 0647 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1615          ; 064A _ C7. 44 24, 08, 00000020(d)
        mov     dword [esp+4H], 15                      ; 0652 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 065A _ C7. 04 24, 00000000
        call    set_palette                             ; 0661 _ E8, FFFFFFFC(rel)
        nop                                             ; 0666 _ 90
        leave                                           ; 0667 _ C9
        ret                                             ; 0668 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0669 _ 55
        mov     ebp, esp                                ; 066A _ 89. E5
        sub     esp, 40                                 ; 066C _ 83. EC, 28
        call    io_load_eflags                          ; 066F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0674 _ 89. 45, F4
        call    io_cli                                  ; 0677 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 067C _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 067F _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0683 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 068A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 068F _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0692 _ 89. 45, F0
        jmp     ?_011                                   ; 0695 _ EB, 62

?_010:  mov     eax, dword [ebp+10H]                    ; 0697 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 069A _ 0F B6. 00
        shr     al, 2                                   ; 069D _ C0. E8, 02
        movzx   eax, al                                 ; 06A0 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 06A3 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 06A7 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 06AE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 06B3 _ 8B. 45, 10
        add     eax, 1                                  ; 06B6 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 06B9 _ 0F B6. 00
        shr     al, 2                                   ; 06BC _ C0. E8, 02
        movzx   eax, al                                 ; 06BF _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 06C2 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 06C6 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 06CD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 06D2 _ 8B. 45, 10
        add     eax, 2                                  ; 06D5 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 06D8 _ 0F B6. 00
        shr     al, 2                                   ; 06DB _ C0. E8, 02
        movzx   eax, al                                 ; 06DE _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 06E1 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 06E5 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 06EC _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 06F1 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 06F5 _ 83. 45, F0, 01
?_011:  mov     eax, dword [ebp-10H]                    ; 06F9 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 06FC _ 3B. 45, 0C
        jle     ?_010                                   ; 06FF _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 0701 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 0704 _ 89. 04 24
        call    io_store_eflags                         ; 0707 _ E8, FFFFFFFC(rel)
        nop                                             ; 070C _ 90
        leave                                           ; 070D _ C9
        ret                                             ; 070E _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 070F _ 55
        mov     ebp, esp                                ; 0710 _ 89. E5
        sub     esp, 20                                 ; 0712 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0715 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0718 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 071B _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 071E _ 89. 45, FC
        jmp     ?_015                                   ; 0721 _ EB, 33

?_012:  mov     eax, dword [ebp+14H]                    ; 0723 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0726 _ 89. 45, F8
        jmp     ?_014                                   ; 0729 _ EB, 1F

?_013:  mov     eax, dword [ebp-4H]                     ; 072B _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 072E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0732 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0734 _ 8B. 45, F8
        add     eax, edx                                ; 0737 _ 01. D0
        mov     edx, eax                                ; 0739 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 073B _ 8B. 45, 08
        add     edx, eax                                ; 073E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0740 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0744 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0746 _ 83. 45, F8, 01
?_014:  mov     eax, dword [ebp-8H]                     ; 074A _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 074D _ 3B. 45, 1C
        jle     ?_013                                   ; 0750 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0752 _ 83. 45, FC, 01
?_015:  mov     eax, dword [ebp-4H]                     ; 0756 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0759 _ 3B. 45, 20
        jle     ?_012                                   ; 075C _ 7E, C5
        leave                                           ; 075E _ C9
        ret                                             ; 075F _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0760 _ 55
        mov     ebp, esp                                ; 0761 _ 89. E5
        push    ebx                                     ; 0763 _ 53
        sub     esp, 28                                 ; 0764 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 0767 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 076A _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 076D _ 8B. 45, 0C
        sub     eax, 1                                  ; 0770 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0773 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0777 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 077B _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0783 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 078B _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0793 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0796 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 079A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 079D _ 89. 04 24
        call    paint_rectangle                         ; 07A0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 07A5 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 07A8 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 07AB _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 07AE _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 07B1 _ 8B. 45, 10
        sub     eax, 28                                 ; 07B4 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 07B7 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 07BB _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 07BF _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 07C3 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 07CB _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 07D3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 07D6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 07DA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 07DD _ 89. 04 24
        call    paint_rectangle                         ; 07E0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 07E5 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 07E8 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 07EB _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 07EE _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 07F1 _ 8B. 45, 10
        sub     eax, 27                                 ; 07F4 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 07F7 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 07FB _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 07FF _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0803 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 080B _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0813 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0816 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 081A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 081D _ 89. 04 24
        call    paint_rectangle                         ; 0820 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0825 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0828 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 082B _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 082E _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0831 _ 8B. 45, 10
        sub     eax, 26                                 ; 0834 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0837 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 083B _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 083F _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0843 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 084B _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0853 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0856 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 085A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 085D _ 89. 04 24
        call    paint_rectangle                         ; 0860 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0865 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0868 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 086B _ 8B. 45, 10
        sub     eax, 24                                 ; 086E _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0871 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0875 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 087D _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0881 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0889 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0891 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0894 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0898 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 089B _ 89. 04 24
        call    paint_rectangle                         ; 089E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 08A3 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 08A6 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 08A9 _ 8B. 45, 10
        sub     eax, 24                                 ; 08AC _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 08AF _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 08B3 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 08BB _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 08BF _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 08C7 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 08CF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 08D2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 08D6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 08D9 _ 89. 04 24
        call    paint_rectangle                         ; 08DC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 08E1 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 08E4 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 08E7 _ 8B. 45, 10
        sub     eax, 4                                  ; 08EA _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 08ED _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 08F1 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 08F9 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 08FD _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0905 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 090D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0910 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0914 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0917 _ 89. 04 24
        call    paint_rectangle                         ; 091A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 091F _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0922 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0925 _ 8B. 45, 10
        sub     eax, 23                                 ; 0928 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 092B _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 092F _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0937 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 093B _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0943 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 094B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 094E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0952 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0955 _ 89. 04 24
        call    paint_rectangle                         ; 0958 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 095D _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0960 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0963 _ 8B. 45, 10
        sub     eax, 3                                  ; 0966 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0969 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 096D _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0975 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0979 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0981 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0989 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 098C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0990 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0993 _ 89. 04 24
        call    paint_rectangle                         ; 0996 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 099B _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 099E _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 09A1 _ 8B. 45, 10
        sub     eax, 24                                 ; 09A4 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 09A7 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 09AB _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 09B3 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 09B7 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 09BF _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 09C7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 09CA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 09CE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 09D1 _ 89. 04 24
        call    paint_rectangle                         ; 09D4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 09D9 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 09DC _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 09DF _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 09E2 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 09E5 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 09E8 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 09EB _ 8B. 45, 0C
        sub     eax, 47                                 ; 09EE _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 09F1 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 09F5 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 09F9 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 09FD _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0A01 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0A09 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A0C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A10 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A13 _ 89. 04 24
        call    paint_rectangle                         ; 0A16 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0A1B _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0A1E _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0A21 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0A24 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0A27 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0A2A _ 8D. 50, E9
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
        lea     ebx, [eax-3H]                           ; 0A60 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0A63 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0A66 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0A69 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0A6C _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0A6F _ 8B. 45, 0C
        sub     eax, 47                                 ; 0A72 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0A75 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0A79 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0A7D _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0A81 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0A85 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0A8D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A90 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A94 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A97 _ 89. 04 24
        call    paint_rectangle                         ; 0A9A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0A9F _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0AA2 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0AA5 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0AA8 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0AAB _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0AAE _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0AB1 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0AB4 _ 83. E8, 03
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
        add     esp, 28                                 ; 0AE1 _ 83. C4, 1C
        pop     ebx                                     ; 0AE4 _ 5B
        pop     ebp                                     ; 0AE5 _ 5D
        ret                                             ; 0AE6 _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 0AE7 _ 55
        mov     ebp, esp                                ; 0AE8 _ 89. E5
        sub     esp, 16                                 ; 0AEA _ 83. EC, 10
        movzx   eax, word [?_172]                       ; 0AED _ 0F B7. 05, 00000064(d)
        cwde                                            ; 0AF4 _ 98
        mov     dword [ebp-8H], eax                     ; 0AF5 _ 89. 45, F8
        movzx   eax, word [?_173]                       ; 0AF8 _ 0F B7. 05, 00000066(d)
        cwde                                            ; 0AFF _ 98
        mov     dword [ebp-4H], eax                     ; 0B00 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 0B03 _ 8B. 45, F8
        sub     eax, 16                                 ; 0B06 _ 83. E8, 10
        mov     edx, eax                                ; 0B09 _ 89. C2
        shr     edx, 31                                 ; 0B0B _ C1. EA, 1F
        add     eax, edx                                ; 0B0E _ 01. D0
        sar     eax, 1                                  ; 0B10 _ D1. F8
        mov     dword [mouse_x], eax                    ; 0B12 _ A3, 00000184(d)
        mov     eax, dword [ebp-4H]                     ; 0B17 _ 8B. 45, FC
        sub     eax, 44                                 ; 0B1A _ 83. E8, 2C
        mov     edx, eax                                ; 0B1D _ 89. C2
        shr     edx, 31                                 ; 0B1F _ C1. EA, 1F
        add     eax, edx                                ; 0B22 _ 01. D0
        sar     eax, 1                                  ; 0B24 _ D1. F8
        mov     dword [mouse_y], eax                    ; 0B26 _ A3, 00000188(d)
        leave                                           ; 0B2B _ C9
        ret                                             ; 0B2C _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0B2D _ 55
        mov     ebp, esp                                ; 0B2E _ 89. E5
        sub     esp, 20                                 ; 0B30 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 0B33 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 0B36 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0B39 _ C7. 45, FC, 00000000
        jmp     ?_025                                   ; 0B40 _ E9, 0000016E

?_016:  mov     edx, dword [ebp-4H]                     ; 0B45 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 0B48 _ 8B. 45, 18
        add     eax, edx                                ; 0B4B _ 01. D0
        movzx   eax, byte [eax]                         ; 0B4D _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0B50 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0B53 _ 0F B6. 45, FB
        test    al, al                                  ; 0B57 _ 84. C0
        jns     ?_017                                   ; 0B59 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0B5B _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0B5E _ 8B. 55, 14
        add     eax, edx                                ; 0B61 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0B63 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B67 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0B69 _ 8B. 45, 10
        add     eax, edx                                ; 0B6C _ 01. D0
        mov     edx, eax                                ; 0B6E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B70 _ 8B. 45, 08
        add     edx, eax                                ; 0B73 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0B75 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0B79 _ 88. 02
?_017:  movzx   eax, byte [ebp-5H]                      ; 0B7B _ 0F B6. 45, FB
        and     eax, 40H                                ; 0B7F _ 83. E0, 40
        test    eax, eax                                ; 0B82 _ 85. C0
        jz      ?_018                                   ; 0B84 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0B86 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0B89 _ 8B. 55, 14
        add     eax, edx                                ; 0B8C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0B8E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B92 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0B94 _ 8B. 45, 10
        add     eax, edx                                ; 0B97 _ 01. D0
        lea     edx, [eax+1H]                           ; 0B99 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0B9C _ 8B. 45, 08
        add     edx, eax                                ; 0B9F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0BA1 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0BA5 _ 88. 02
?_018:  movzx   eax, byte [ebp-5H]                      ; 0BA7 _ 0F B6. 45, FB
        and     eax, 20H                                ; 0BAB _ 83. E0, 20
        test    eax, eax                                ; 0BAE _ 85. C0
        jz      ?_019                                   ; 0BB0 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0BB2 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0BB5 _ 8B. 55, 14
        add     eax, edx                                ; 0BB8 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0BBA _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0BBE _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0BC0 _ 8B. 45, 10
        add     eax, edx                                ; 0BC3 _ 01. D0
        lea     edx, [eax+2H]                           ; 0BC5 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0BC8 _ 8B. 45, 08
        add     edx, eax                                ; 0BCB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0BCD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0BD1 _ 88. 02
?_019:  movzx   eax, byte [ebp-5H]                      ; 0BD3 _ 0F B6. 45, FB
        and     eax, 10H                                ; 0BD7 _ 83. E0, 10
        test    eax, eax                                ; 0BDA _ 85. C0
        jz      ?_020                                   ; 0BDC _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0BDE _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0BE1 _ 8B. 55, 14
        add     eax, edx                                ; 0BE4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0BE6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0BEA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0BEC _ 8B. 45, 10
        add     eax, edx                                ; 0BEF _ 01. D0
        lea     edx, [eax+3H]                           ; 0BF1 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0BF4 _ 8B. 45, 08
        add     edx, eax                                ; 0BF7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0BF9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0BFD _ 88. 02
?_020:  movzx   eax, byte [ebp-5H]                      ; 0BFF _ 0F B6. 45, FB
        and     eax, 08H                                ; 0C03 _ 83. E0, 08
        test    eax, eax                                ; 0C06 _ 85. C0
        jz      ?_021                                   ; 0C08 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0C0A _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0C0D _ 8B. 55, 14
        add     eax, edx                                ; 0C10 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0C12 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0C16 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0C18 _ 8B. 45, 10
        add     eax, edx                                ; 0C1B _ 01. D0
        lea     edx, [eax+4H]                           ; 0C1D _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0C20 _ 8B. 45, 08
        add     edx, eax                                ; 0C23 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0C25 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0C29 _ 88. 02
?_021:  movzx   eax, byte [ebp-5H]                      ; 0C2B _ 0F B6. 45, FB
        and     eax, 04H                                ; 0C2F _ 83. E0, 04
        test    eax, eax                                ; 0C32 _ 85. C0
        jz      ?_022                                   ; 0C34 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0C36 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0C39 _ 8B. 55, 14
        add     eax, edx                                ; 0C3C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0C3E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0C42 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0C44 _ 8B. 45, 10
        add     eax, edx                                ; 0C47 _ 01. D0
        lea     edx, [eax+5H]                           ; 0C49 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0C4C _ 8B. 45, 08
        add     edx, eax                                ; 0C4F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0C51 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0C55 _ 88. 02
?_022:  movzx   eax, byte [ebp-5H]                      ; 0C57 _ 0F B6. 45, FB
        and     eax, 02H                                ; 0C5B _ 83. E0, 02
        test    eax, eax                                ; 0C5E _ 85. C0
        jz      ?_023                                   ; 0C60 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0C62 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0C65 _ 8B. 55, 14
        add     eax, edx                                ; 0C68 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0C6A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0C6E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0C70 _ 8B. 45, 10
        add     eax, edx                                ; 0C73 _ 01. D0
        lea     edx, [eax+6H]                           ; 0C75 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0C78 _ 8B. 45, 08
        add     edx, eax                                ; 0C7B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0C7D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0C81 _ 88. 02
?_023:  movzx   eax, byte [ebp-5H]                      ; 0C83 _ 0F B6. 45, FB
        and     eax, 01H                                ; 0C87 _ 83. E0, 01
        test    eax, eax                                ; 0C8A _ 85. C0
        jz      ?_024                                   ; 0C8C _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0C8E _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0C91 _ 8B. 55, 14
        add     eax, edx                                ; 0C94 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0C96 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0C9A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0C9C _ 8B. 45, 10
        add     eax, edx                                ; 0C9F _ 01. D0
        lea     edx, [eax+7H]                           ; 0CA1 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0CA4 _ 8B. 45, 08
        add     edx, eax                                ; 0CA7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0CA9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0CAD _ 88. 02
?_024:  add     dword [ebp-4H], 1                       ; 0CAF _ 83. 45, FC, 01
?_025:  cmp     dword [ebp-4H], 15                      ; 0CB3 _ 83. 7D, FC, 0F
        jle     ?_016                                   ; 0CB7 _ 0F 8E, FFFFFE88
        leave                                           ; 0CBD _ C9
        ret                                             ; 0CBE _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 0CBF _ 55
        mov     ebp, esp                                ; 0CC0 _ 89. E5
        push    ebx                                     ; 0CC2 _ 53
        sub     esp, 52                                 ; 0CC3 _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 0CC6 _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 0CC9 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 0CCC _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0CCF _ 89. 45, F4
        jmp     ?_027                                   ; 0CD2 _ EB, 4B

?_026:  movsx   ecx, byte [ebp-1CH]                     ; 0CD4 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 0CD8 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 0CDB _ 0F B6. 00
        movsx   eax, al                                 ; 0CDE _ 0F BE. C0
        shl     eax, 4                                  ; 0CE1 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0CE4 _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 0CEA _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 0CED _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0CF0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0CF3 _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 0CF5 _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 0CF9 _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 0CFD _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 0D00 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 0D04 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 0D07 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0D0B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0D0F _ 89. 04 24
        call    paint_font                              ; 0D12 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 0D17 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 0D1B _ 83. 45, 18, 01
?_027:  mov     eax, dword [ebp+18H]                    ; 0D1F _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 0D22 _ 0F B6. 00
        test    al, al                                  ; 0D25 _ 84. C0
        jnz     ?_026                                   ; 0D27 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 0D29 _ 8B. 45, 14
        add     eax, 16                                 ; 0D2C _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 0D2F _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 0D33 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 0D36 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 0D3A _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 0D3D _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 0D41 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 0D44 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0D48 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D4B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D4F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D52 _ 89. 04 24
        call    sheet_refresh                           ; 0D55 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 0D5A _ 83. C4, 34
        pop     ebx                                     ; 0D5D _ 5B
        pop     ebp                                     ; 0D5E _ 5D
        ret                                             ; 0D5F _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0D60 _ 55
        mov     ebp, esp                                ; 0D61 _ 89. E5
        sub     esp, 20                                 ; 0D63 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0D66 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0D69 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 0D6C _ C7. 45, F8, 00000000
        jmp     ?_034                                   ; 0D73 _ E9, 0000009C

?_028:  mov     dword [ebp-4H], 0                       ; 0D78 _ C7. 45, FC, 00000000
        jmp     ?_033                                   ; 0D7F _ E9, 00000082

?_029:  mov     eax, dword [ebp-8H]                     ; 0D84 _ 8B. 45, F8
        shl     eax, 4                                  ; 0D87 _ C1. E0, 04
        mov     edx, eax                                ; 0D8A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0D8C _ 8B. 45, FC
        add     eax, edx                                ; 0D8F _ 01. D0
        add     eax, cursor.1683                        ; 0D91 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0D96 _ 0F B6. 00
        cmp     al, 42                                  ; 0D99 _ 3C, 2A
        jnz     ?_030                                   ; 0D9B _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0D9D _ 8B. 45, F8
        shl     eax, 4                                  ; 0DA0 _ C1. E0, 04
        mov     edx, eax                                ; 0DA3 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0DA5 _ 8B. 45, FC
        add     eax, edx                                ; 0DA8 _ 01. D0
        mov     edx, eax                                ; 0DAA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DAC _ 8B. 45, 08
        add     eax, edx                                ; 0DAF _ 01. D0
        mov     byte [eax], 0                           ; 0DB1 _ C6. 00, 00
        jmp     ?_032                                   ; 0DB4 _ EB, 4C

?_030:  mov     eax, dword [ebp-8H]                     ; 0DB6 _ 8B. 45, F8
        shl     eax, 4                                  ; 0DB9 _ C1. E0, 04
        mov     edx, eax                                ; 0DBC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0DBE _ 8B. 45, FC
        add     eax, edx                                ; 0DC1 _ 01. D0
        add     eax, cursor.1683                        ; 0DC3 _ 05, 00000060(d)
        movzx   eax, byte [eax]                         ; 0DC8 _ 0F B6. 00
        cmp     al, 79                                  ; 0DCB _ 3C, 4F
        jnz     ?_031                                   ; 0DCD _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0DCF _ 8B. 45, F8
        shl     eax, 4                                  ; 0DD2 _ C1. E0, 04
        mov     edx, eax                                ; 0DD5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0DD7 _ 8B. 45, FC
        add     eax, edx                                ; 0DDA _ 01. D0
        mov     edx, eax                                ; 0DDC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DDE _ 8B. 45, 08
        add     eax, edx                                ; 0DE1 _ 01. D0
        mov     byte [eax], 7                           ; 0DE3 _ C6. 00, 07
        jmp     ?_032                                   ; 0DE6 _ EB, 1A

?_031:  mov     eax, dword [ebp-8H]                     ; 0DE8 _ 8B. 45, F8
        shl     eax, 4                                  ; 0DEB _ C1. E0, 04
        mov     edx, eax                                ; 0DEE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0DF0 _ 8B. 45, FC
        add     eax, edx                                ; 0DF3 _ 01. D0
        mov     edx, eax                                ; 0DF5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DF7 _ 8B. 45, 08
        add     edx, eax                                ; 0DFA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0DFC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0E00 _ 88. 02
?_032:  add     dword [ebp-4H], 1                       ; 0E02 _ 83. 45, FC, 01
?_033:  cmp     dword [ebp-4H], 15                      ; 0E06 _ 83. 7D, FC, 0F
        jle     ?_029                                   ; 0E0A _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 0E10 _ 83. 45, F8, 01
?_034:  cmp     dword [ebp-8H], 15                      ; 0E14 _ 83. 7D, F8, 0F
        jle     ?_028                                   ; 0E18 _ 0F 8E, FFFFFF5A
        leave                                           ; 0E1E _ C9
        ret                                             ; 0E1F _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 0E20 _ 55
        mov     ebp, esp                                ; 0E21 _ 89. E5
        sub     esp, 16                                 ; 0E23 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0E26 _ C7. 45, F8, 00000000
        jmp     ?_038                                   ; 0E2D _ EB, 50

?_035:  mov     dword [ebp-4H], 0                       ; 0E2F _ C7. 45, FC, 00000000
        jmp     ?_037                                   ; 0E36 _ EB, 3B

?_036:  mov     eax, dword [ebp-8H]                     ; 0E38 _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 0E3B _ 8B. 55, 14
        add     eax, edx                                ; 0E3E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0E40 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 0E44 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 0E47 _ 8B. 4D, 10
        add     edx, ecx                                ; 0E4A _ 01. CA
        add     eax, edx                                ; 0E4C _ 01. D0
        mov     edx, eax                                ; 0E4E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E50 _ 8B. 45, 08
        add     edx, eax                                ; 0E53 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 0E55 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 0E58 _ 0F AF. 45, 18
        mov     ecx, eax                                ; 0E5C _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 0E5E _ 8B. 45, FC
        add     eax, ecx                                ; 0E61 _ 01. C8
        mov     ecx, eax                                ; 0E63 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 0E65 _ 8B. 45, 20
        add     eax, ecx                                ; 0E68 _ 01. C8
        movzx   eax, byte [eax]                         ; 0E6A _ 0F B6. 00
        mov     byte [edx], al                          ; 0E6D _ 88. 02
        add     dword [ebp-4H], 1                       ; 0E6F _ 83. 45, FC, 01
?_037:  mov     eax, dword [ebp-4H]                     ; 0E73 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 0E76 _ 3B. 45, 18
        jl      ?_036                                   ; 0E79 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 0E7B _ 83. 45, F8, 01
?_038:  mov     eax, dword [ebp-8H]                     ; 0E7F _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0E82 _ 3B. 45, 1C
        jl      ?_035                                   ; 0E85 _ 7C, A8
        leave                                           ; 0E87 _ C9
        ret                                             ; 0E88 _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 0E89 _ 55
        mov     ebp, esp                                ; 0E8A _ 89. E5
        sub     esp, 24                                 ; 0E8C _ 83. EC, 18
        mov     dword [esp+8H], mousebuf                ; 0E8F _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 0E97 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 0E9F _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0EA6 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], keybuf                  ; 0EAB _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 0EB3 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 0EBB _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0EC2 _ E8, FFFFFFFC(rel)
        leave                                           ; 0EC7 _ C9
        ret                                             ; 0EC8 _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 0EC9 _ 55
        mov     ebp, esp                                ; 0ECA _ 89. E5
        sub     esp, 40                                 ; 0ECC _ 83. EC, 28
        mov     eax, dword [ebp+10H]                    ; 0ECF _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 0ED2 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 0ED5 _ A1, 00000184(d)
        add     eax, edx                                ; 0EDA _ 01. D0
        mov     dword [mouse_x], eax                    ; 0EDC _ A3, 00000184(d)
        mov     eax, dword [ebp+10H]                    ; 0EE1 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 0EE4 _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 0EE7 _ A1, 00000188(d)
        add     eax, edx                                ; 0EEC _ 01. D0
        mov     dword [mouse_y], eax                    ; 0EEE _ A3, 00000188(d)
        mov     eax, dword [mouse_x]                    ; 0EF3 _ A1, 00000184(d)
        test    eax, eax                                ; 0EF8 _ 85. C0
        jns     ?_039                                   ; 0EFA _ 79, 0A
        mov     dword [mouse_x], 0                      ; 0EFC _ C7. 05, 00000184(d), 00000000
?_039:  mov     eax, dword [mouse_y]                    ; 0F06 _ A1, 00000188(d)
        test    eax, eax                                ; 0F0B _ 85. C0
        jns     ?_040                                   ; 0F0D _ 79, 0A
        mov     dword [mouse_y], 0                      ; 0F0F _ C7. 05, 00000188(d), 00000000
?_040:  movzx   eax, word [?_172]                       ; 0F19 _ 0F B7. 05, 00000064(d)
        cwde                                            ; 0F20 _ 98
        lea     edx, [eax-10H]                          ; 0F21 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 0F24 _ A1, 00000184(d)
        cmp     edx, eax                                ; 0F29 _ 39. C2
        jge     ?_041                                   ; 0F2B _ 7D, 10
        movzx   eax, word [?_172]                       ; 0F2D _ 0F B7. 05, 00000064(d)
        cwde                                            ; 0F34 _ 98
        sub     eax, 16                                 ; 0F35 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 0F38 _ A3, 00000184(d)
?_041:  movzx   eax, word [?_172]                       ; 0F3D _ 0F B7. 05, 00000064(d)
        cwde                                            ; 0F44 _ 98
        lea     edx, [eax-10H]                          ; 0F45 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 0F48 _ A1, 00000188(d)
        cmp     edx, eax                                ; 0F4D _ 39. C2
        jge     ?_042                                   ; 0F4F _ 7D, 10
        movzx   eax, word [?_172]                       ; 0F51 _ 0F B7. 05, 00000064(d)
        cwde                                            ; 0F58 _ 98
        sub     eax, 16                                 ; 0F59 _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 0F5C _ A3, 00000188(d)
?_042:  mov     dword [esp+14H], 7                      ; 0F61 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_161                  ; 0F69 _ C7. 44 24, 10, 00000017(d)
        mov     dword [esp+0CH], 0                      ; 0F71 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0F79 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0F81 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0F84 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F88 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F8B _ 89. 04 24
        call    paint_string                            ; 0F8E _ E8, FFFFFFFC(rel)
        leave                                           ; 0F93 _ C9
        ret                                             ; 0F94 _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0F95 _ 55
        mov     ebp, esp                                ; 0F96 _ 89. E5
        sub     esp, 40                                 ; 0F98 _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 0F9B _ C6. 45, F7, 00
        call    io_sti                                  ; 0F9F _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 0FA4 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0FAB _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0FB0 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0FB3 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0FB7 _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 0FBB _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 0FC2 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0FC7 _ 85. C0
        jz      ?_043                                   ; 0FC9 _ 74, 3F
        mov     dword [esp+8H], mouse_send_info         ; 0FCB _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 0FD3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0FD6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0FDA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0FDD _ 89. 04 24
        call    compute_mouse_position                  ; 0FE0 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 0FE5 _ 8B. 15, 00000188(d)
        mov     eax, dword [mouse_x]                    ; 0FEB _ A1, 00000184(d)
        mov     dword [esp+0CH], edx                    ; 0FF0 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 0FF4 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 0FF8 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 0FFB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0FFF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1002 _ 89. 04 24
        call    sheet_slide                             ; 1005 _ E8, FFFFFFFC(rel)
?_043:  leave                                           ; 100A _ C9
        ret                                             ; 100B _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 100C _ 55
        mov     ebp, esp                                ; 100D _ 89. E5
        sub     esp, 88                                 ; 100F _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 1012 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 1019 _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 1020 _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 1027 _ A1, 00000060(d)
        mov     dword [ebp-2CH], eax                    ; 102C _ 89. 45, D4
        movzx   eax, word [?_172]                       ; 102F _ 0F B7. 05, 00000064(d)
        cwde                                            ; 1036 _ 98
        mov     dword [ebp-28H], eax                    ; 1037 _ 89. 45, D8
        movzx   eax, word [?_173]                       ; 103A _ 0F B7. 05, 00000066(d)
        cwde                                            ; 1041 _ 98
        mov     dword [ebp-24H], eax                    ; 1042 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 1045 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1048 _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 104A _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 104D _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 1051 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 1054 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1058 _ 89. 04 24
        call    init_desktop                            ; 105B _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1060 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_162                  ; 1068 _ C7. 44 24, 10, 0000002E(d)
        mov     eax, dword [ebp-34H]                    ; 1070 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1073 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1077 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 107A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 107E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1081 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1085 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1088 _ 89. 04 24
        call    paint_string                            ; 108B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 1090 _ 8B. 45, 14
        mov     dword [esp], eax                        ; 1093 _ 89. 04 24
        call    intToHexStr                             ; 1096 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 109B _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 109E _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 10A6 _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 10A9 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 10AD _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 10B0 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 10B4 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 10B7 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 10BB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 10BE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 10C2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 10C5 _ 89. 04 24
        call    paint_string                            ; 10C8 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 10CD _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 10D1 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_163                  ; 10D9 _ C7. 44 24, 10, 00000038(d)
        mov     eax, dword [ebp-34H]                    ; 10E1 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 10E4 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 10E8 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 10EB _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 10EF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 10F2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 10F6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 10F9 _ 89. 04 24
        call    paint_string                            ; 10FC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1101 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1104 _ 8B. 00
        mov     dword [esp], eax                        ; 1106 _ 89. 04 24
        call    intToHexStr                             ; 1109 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 110E _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 1111 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 1119 _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 111C _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1120 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1123 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1127 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 112A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 112E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1131 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1135 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1138 _ 89. 04 24
        call    paint_string                            ; 113B _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1140 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1144 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_164                  ; 114C _ C7. 44 24, 10, 00000044(d)
        mov     eax, dword [ebp-34H]                    ; 1154 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1157 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 115B _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 115E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1162 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1165 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1169 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 116C _ 89. 04 24
        call    paint_string                            ; 116F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1174 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 1177 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 117A _ 89. 04 24
        call    intToHexStr                             ; 117D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1182 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 1185 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 118D _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 1190 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1194 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1197 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 119B _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 119E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 11A2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 11A5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 11A9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 11AC _ 89. 04 24
        call    paint_string                            ; 11AF _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 11B4 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 11B8 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_165                  ; 11C0 _ C7. 44 24, 10, 00000050(d)
        mov     eax, dword [ebp-34H]                    ; 11C8 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 11CB _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 11CF _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 11D2 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 11D6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 11D9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 11DD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 11E0 _ 89. 04 24
        call    paint_string                            ; 11E3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 11E8 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 11EB _ 8B. 40, 08
        mov     dword [esp], eax                        ; 11EE _ 89. 04 24
        call    intToHexStr                             ; 11F1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 11F6 _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 11F9 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 1201 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 1204 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1208 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 120B _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 120F _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1212 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1216 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1219 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 121D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1220 _ 89. 04 24
        call    paint_string                            ; 1223 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1228 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 122C _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_166                  ; 1234 _ C7. 44 24, 10, 0000005C(d)
        mov     eax, dword [ebp-34H]                    ; 123C _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 123F _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1243 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1246 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 124A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 124D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1251 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1254 _ 89. 04 24
        call    paint_string                            ; 1257 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 125C _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 125F _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 1262 _ 89. 04 24
        call    intToHexStr                             ; 1265 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 126A _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 126D _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 1275 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 1278 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 127C _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 127F _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1283 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1286 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 128A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 128D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1291 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1294 _ 89. 04 24
        call    paint_string                            ; 1297 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 129C _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 12A0 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_167                  ; 12A8 _ C7. 44 24, 10, 00000069(d)
        mov     eax, dword [ebp-34H]                    ; 12B0 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 12B3 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 12B7 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 12BA _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 12BE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 12C1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 12C5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 12C8 _ 89. 04 24
        call    paint_string                            ; 12CB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 12D0 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 12D3 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 12D6 _ 89. 04 24
        call    intToHexStr                             ; 12D9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 12DE _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 12E1 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 12E9 _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 12EC _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 12F0 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 12F3 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 12F7 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 12FA _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 12FE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1301 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1305 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1308 _ 89. 04 24
        call    paint_string                            ; 130B _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1310 _ 83. 45, CC, 10
        leave                                           ; 1314 _ C9
        ret                                             ; 1315 _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 1316 _ 55
        mov     ebp, esp                                ; 1317 _ 89. E5
        sub     esp, 56                                 ; 1319 _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 131C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 131F _ 89. 04 24
        call    sheet_alloc                             ; 1322 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1327 _ 89. 45, F0
        mov     eax, dword [memman]                     ; 132A _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 132F _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 1337 _ 89. 04 24
        call    memman_alloc_4k                         ; 133A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 133F _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 1342 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 134A _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 1352 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 135A _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 135D _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 1361 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1364 _ 89. 04 24
        call    sheet_setbuf                            ; 1367 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 136C _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 136F _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 1373 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1376 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 137A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 137D _ 89. 04 24
        call    make_windows                            ; 1380 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 1385 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ?_168                  ; 138D _ C7. 44 24, 10, 00000070(d)
        mov     dword [esp+0CH], 28                     ; 1395 _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 24                      ; 139D _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp-10H]                    ; 13A5 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 13A8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13AC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13AF _ 89. 04 24
        call    paint_string                            ; 13B2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 0                      ; 13B7 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ?_169                  ; 13BF _ C7. 44 24, 10, 0000007B(d)
        mov     dword [esp+0CH], 44                     ; 13C7 _ C7. 44 24, 0C, 0000002C
        mov     dword [esp+8H], 24                      ; 13CF _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp-10H]                    ; 13D7 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 13DA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13DE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13E1 _ 89. 04 24
        call    paint_string                            ; 13E4 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 72                     ; 13E9 _ C7. 44 24, 0C, 00000048
        mov     dword [esp+8H], 80                      ; 13F1 _ C7. 44 24, 08, 00000050
        mov     eax, dword [ebp-10H]                    ; 13F9 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 13FC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1400 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1403 _ 89. 04 24
        call    sheet_slide                             ; 1406 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 140B _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 1413 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1416 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 141A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 141D _ 89. 04 24
        call    sheet_updown                            ; 1420 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1425 _ 8B. 45, F0
        leave                                           ; 1428 _ C9
        ret                                             ; 1429 _ C3
; message_box End of function

make_windows:; Function begin
        push    ebp                                     ; 142A _ 55
        mov     ebp, esp                                ; 142B _ 89. E5
        push    ebx                                     ; 142D _ 53
        sub     esp, 68                                 ; 142E _ 83. EC, 44
        mov     eax, dword [ebp+0CH]                    ; 1431 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1434 _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 1437 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 143A _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 143D _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 1440 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 1443 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1446 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1449 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 144C _ 8B. 00
        mov     dword [esp+18H], 0                      ; 144E _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 1456 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 145A _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1462 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 146A _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1472 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1475 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1479 _ 89. 04 24
        call    paint_rectangle                         ; 147C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1481 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1484 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1487 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 148A _ 8B. 00
        mov     dword [esp+18H], 1                      ; 148C _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 1494 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 1498 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 14A0 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 14A8 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 14B0 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 14B3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 14B7 _ 89. 04 24
        call    paint_rectangle                         ; 14BA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 14BF _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 14C2 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 14C5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 14C8 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 14CA _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 14CE _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 14D6 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 14DE _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 14E6 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 14EE _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 14F1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 14F5 _ 89. 04 24
        call    paint_rectangle                         ; 14F8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 14FD _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1500 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1503 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1506 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1508 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 150C _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 1514 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 151C _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1524 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 152C _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 152F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1533 _ 89. 04 24
        call    paint_rectangle                         ; 1536 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 153B _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 153E _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1541 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1544 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1547 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 154A _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 154D _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1550 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1552 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1556 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 155A _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 1562 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 1566 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 156E _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1571 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1575 _ 89. 04 24
        call    paint_rectangle                         ; 1578 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 157D _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1580 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1583 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1586 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1589 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 158C _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 158F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1592 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1594 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1598 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 159C _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 15A4 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 15A8 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 15B0 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 15B3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 15B7 _ 89. 04 24
        call    paint_rectangle                         ; 15BA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 15BF _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 15C2 _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 15C5 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 15C8 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 15CB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 15CE _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 15D0 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 15D4 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 15D8 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 15E0 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 15E8 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 15F0 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 15F3 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 15F7 _ 89. 04 24
        call    paint_rectangle                         ; 15FA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 15FF _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1602 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1605 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1608 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 160A _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1612 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 1616 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 161E _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 1626 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 162E _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1631 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1635 _ 89. 04 24
        call    paint_rectangle                         ; 1638 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 163D _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1640 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1643 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1646 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1649 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 164C _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 164F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1652 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1654 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1658 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 165C _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 1660 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 1668 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1670 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1673 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1677 _ 89. 04 24
        call    paint_rectangle                         ; 167A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 167F _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1682 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1685 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1688 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 168B _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 168E _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1691 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1694 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1696 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 169A _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 169E _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 16A2 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 16AA _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 16B2 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 16B5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 16B9 _ 89. 04 24
        call    paint_rectangle                         ; 16BC _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 16C1 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp+10H]                    ; 16C9 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 16CC _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 16D0 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 16D8 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 16E0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 16E3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16E7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16EA _ 89. 04 24
        call    paint_string                            ; 16ED _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 16F2 _ C7. 45, EC, 00000000
        jmp     ?_051                                   ; 16F9 _ E9, 00000083

?_044:  mov     dword [ebp-18H], 0                      ; 16FE _ C7. 45, E8, 00000000
        jmp     ?_050                                   ; 1705 _ EB, 70

?_045:  mov     eax, dword [ebp-14H]                    ; 1707 _ 8B. 45, EC
        shl     eax, 4                                  ; 170A _ C1. E0, 04
        mov     edx, eax                                ; 170D _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 170F _ 8B. 45, E8
        add     eax, edx                                ; 1712 _ 01. D0
        add     eax, closebtn.1751                      ; 1714 _ 05, 00000160(d)
        movzx   eax, byte [eax]                         ; 1719 _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 171C _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 171F _ 80. 7D, E7, 40
        jnz     ?_046                                   ; 1723 _ 75, 06
        mov     byte [ebp-19H], 0                       ; 1725 _ C6. 45, E7, 00
        jmp     ?_049                                   ; 1729 _ EB, 1C

?_046:  cmp     byte [ebp-19H], 36                      ; 172B _ 80. 7D, E7, 24
        jnz     ?_047                                   ; 172F _ 75, 06
        mov     byte [ebp-19H], 15                      ; 1731 _ C6. 45, E7, 0F
        jmp     ?_049                                   ; 1735 _ EB, 10

?_047:  cmp     byte [ebp-19H], 81                      ; 1737 _ 80. 7D, E7, 51
        jnz     ?_048                                   ; 173B _ 75, 06
        mov     byte [ebp-19H], 8                       ; 173D _ C6. 45, E7, 08
        jmp     ?_049                                   ; 1741 _ EB, 04

?_048:  mov     byte [ebp-19H], 7                       ; 1743 _ C6. 45, E7, 07
?_049:  mov     eax, dword [ebp+0CH]                    ; 1747 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 174A _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 174C _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 174F _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1752 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1755 _ 8B. 40, 04
        imul    ecx, eax                                ; 1758 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 175B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 175E _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1761 _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 1764 _ 8B. 45, E8
        add     eax, ebx                                ; 1767 _ 01. D8
        add     eax, ecx                                ; 1769 _ 01. C8
        add     edx, eax                                ; 176B _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 176D _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 1771 _ 88. 02
        add     dword [ebp-18H], 1                      ; 1773 _ 83. 45, E8, 01
?_050:  cmp     dword [ebp-18H], 15                     ; 1777 _ 83. 7D, E8, 0F
        jle     ?_045                                   ; 177B _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 177D _ 83. 45, EC, 01
?_051:  cmp     dword [ebp-14H], 13                     ; 1781 _ 83. 7D, EC, 0D
        jle     ?_044                                   ; 1785 _ 0F 8E, FFFFFF73
        add     esp, 68                                 ; 178B _ 83. C4, 44
        pop     ebx                                     ; 178E _ 5B
        pop     ebp                                     ; 178F _ 5D
        ret                                             ; 1790 _ C3
; make_windows End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 1791 _ 55
        mov     ebp, esp                                ; 1792 _ 89. E5
        sub     esp, 24                                 ; 1794 _ 83. EC, 18
?_052:  mov     dword [esp], 100                        ; 1797 _ C7. 04 24, 00000064
        call    io_in8                                  ; 179E _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 17A3 _ 83. E0, 02
        test    eax, eax                                ; 17A6 _ 85. C0
        jnz     ?_053                                   ; 17A8 _ 75, 02
        jmp     ?_054                                   ; 17AA _ EB, 02

?_053:  jmp     ?_052                                   ; 17AC _ EB, E9

?_054:  leave                                           ; 17AE _ C9
        ret                                             ; 17AF _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 17B0 _ 55
        mov     ebp, esp                                ; 17B1 _ 89. E5
        sub     esp, 24                                 ; 17B3 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 17B6 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 17BB _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 17C3 _ C7. 04 24, 00000064
        call    io_out8                                 ; 17CA _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 17CF _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 17D4 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 17DC _ C7. 04 24, 00000060
        call    io_out8                                 ; 17E3 _ E8, FFFFFFFC(rel)
        leave                                           ; 17E8 _ C9
        ret                                             ; 17E9 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 17EA _ 55
        mov     ebp, esp                                ; 17EB _ 89. E5
        sub     esp, 24                                 ; 17ED _ 83. EC, 18
        call    wait_KBC_sendready                      ; 17F0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 17F5 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 17FD _ C7. 04 24, 00000064
        call    io_out8                                 ; 1804 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 1809 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 180E _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 1816 _ C7. 04 24, 00000060
        call    io_out8                                 ; 181D _ E8, FFFFFFFC(rel)
        leave                                           ; 1822 _ C9
        ret                                             ; 1823 _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 1824 _ 55
        mov     ebp, esp                                ; 1825 _ 89. E5
        sub     esp, 4                                  ; 1827 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 182A _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 182D _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1830 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1833 _ 0F B6. 40, 03
        test    al, al                                  ; 1837 _ 84. C0
        jnz     ?_056                                   ; 1839 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 183B _ 80. 7D, FC, FA
        jnz     ?_055                                   ; 183F _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 1841 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1844 _ C6. 40, 03, 01
?_055:  mov     eax, 0                                  ; 1848 _ B8, 00000000
        jmp     ?_063                                   ; 184D _ E9, 0000010F

?_056:  mov     eax, dword [ebp+8H]                     ; 1852 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1855 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 1859 _ 3C, 01
        jnz     ?_058                                   ; 185B _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 185D _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 1861 _ 25, 000000C8
        cmp     eax, 8                                  ; 1866 _ 83. F8, 08
        jnz     ?_057                                   ; 1869 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 186B _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 186E _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 1872 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 1874 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 1877 _ C6. 40, 03, 02
?_057:  mov     eax, 0                                  ; 187B _ B8, 00000000
        jmp     ?_063                                   ; 1880 _ E9, 000000DC

?_058:  mov     eax, dword [ebp+8H]                     ; 1885 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1888 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 188C _ 3C, 02
        jnz     ?_059                                   ; 188E _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 1890 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1893 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 1897 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 189A _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 189D _ C6. 40, 03, 03
        mov     eax, 0                                  ; 18A1 _ B8, 00000000
        jmp     ?_063                                   ; 18A6 _ E9, 000000B6

?_059:  mov     eax, dword [ebp+8H]                     ; 18AB _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 18AE _ 0F B6. 40, 03
        cmp     al, 3                                   ; 18B2 _ 3C, 03
        jne     ?_062                                   ; 18B4 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 18BA _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 18BD _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 18C1 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 18C4 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 18C7 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 18CB _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 18CE _ 0F B6. 00
        movzx   eax, al                                 ; 18D1 _ 0F B6. C0
        and     eax, 07H                                ; 18D4 _ 83. E0, 07
        mov     edx, eax                                ; 18D7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 18D9 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 18DC _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 18DF _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 18E2 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 18E6 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 18E9 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 18EC _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18EF _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 18F2 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 18F6 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 18F9 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 18FC _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 18FF _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1902 _ 0F B6. 00
        movzx   eax, al                                 ; 1905 _ 0F B6. C0
        and     eax, 10H                                ; 1908 _ 83. E0, 10
        test    eax, eax                                ; 190B _ 85. C0
        jz      ?_060                                   ; 190D _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 190F _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1912 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 1915 _ 0D, FFFFFF00
        mov     edx, eax                                ; 191A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 191C _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 191F _ 89. 50, 04
?_060:  mov     eax, dword [ebp+8H]                     ; 1922 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1925 _ 0F B6. 00
        movzx   eax, al                                 ; 1928 _ 0F B6. C0
        and     eax, 20H                                ; 192B _ 83. E0, 20
        test    eax, eax                                ; 192E _ 85. C0
        jz      ?_061                                   ; 1930 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1932 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1935 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 1938 _ 0D, FFFFFF00
        mov     edx, eax                                ; 193D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 193F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1942 _ 89. 50, 08
?_061:  mov     eax, dword [ebp+8H]                     ; 1945 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1948 _ 8B. 40, 08
        neg     eax                                     ; 194B _ F7. D8
        mov     edx, eax                                ; 194D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 194F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1952 _ 89. 50, 08
        mov     eax, 1                                  ; 1955 _ B8, 00000001
        jmp     ?_063                                   ; 195A _ EB, 05

?_062:  mov     eax, 4294967295                         ; 195C _ B8, FFFFFFFF
?_063:  leave                                           ; 1961 _ C9
        ret                                             ; 1962 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 1963 _ 55
        mov     ebp, esp                                ; 1964 _ 89. E5
        sub     esp, 40                                 ; 1966 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 1969 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 1971 _ C7. 04 24, 00000020
        call    io_out8                                 ; 1978 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 197D _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 1985 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 198C _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 1991 _ C7. 04 24, 00000060
        call    io_in8                                  ; 1998 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 199D _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 19A0 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 19A4 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 19A8 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 19AF _ E8, FFFFFFFC(rel)
        leave                                           ; 19B4 _ C9
        ret                                             ; 19B5 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 19B6 _ 55
        mov     ebp, esp                                ; 19B7 _ 89. E5
        sub     esp, 40                                 ; 19B9 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 19BC _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 19C4 _ C7. 04 24, 00000020
        call    io_out8                                 ; 19CB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 19D0 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 19D8 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 19DF _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 19E4 _ C7. 04 24, 00000060
        call    io_in8                                  ; 19EB _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 19F0 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 19F3 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 19F7 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 19FB _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 1A02 _ E8, FFFFFFFC(rel)
        leave                                           ; 1A07 _ C9
        ret                                             ; 1A08 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 1A09 _ 55
        mov     ebp, esp                                ; 1A0A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1A0C _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1A0F _ 8B. 55, 10
        mov     dword [eax], edx                        ; 1A12 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1A14 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1A17 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1A1E _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1A21 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1A28 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1A2B _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 1A2E _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1A31 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1A34 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 1A37 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 1A3A _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 1A3D _ C7. 40, 14, 00000000
        pop     ebp                                     ; 1A44 _ 5D
        ret                                             ; 1A45 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 1A46 _ 55
        mov     ebp, esp                                ; 1A47 _ 89. E5
        sub     esp, 20                                 ; 1A49 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1A4C _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 1A4F _ 88. 45, EC
        mov     eax, dword [ebp+8H]                     ; 1A52 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1A55 _ 8B. 40, 10
        test    eax, eax                                ; 1A58 _ 85. C0
        jnz     ?_064                                   ; 1A5A _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 1A5C _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 1A5F _ 8B. 40, 14
        or      eax, 01H                                ; 1A62 _ 83. C8, 01
        mov     edx, eax                                ; 1A65 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1A67 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 1A6A _ 89. 50, 14
        mov     eax, 4294967295                         ; 1A6D _ B8, FFFFFFFF
        jmp     ?_066                                   ; 1A72 _ EB, 56

?_064:  mov     eax, dword [ebp+8H]                     ; 1A74 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1A77 _ 8B. 40, 04
        mov     dword [ebp-4H], eax                     ; 1A7A _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1A7D _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1A80 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 1A82 _ 8B. 45, FC
        add     edx, eax                                ; 1A85 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1A87 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1A8B _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 1A8D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1A90 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 1A93 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1A96 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1A99 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A9C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A9F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1AA2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1AA5 _ 8B. 40, 0C
        cmp     edx, eax                                ; 1AA8 _ 39. C2
        jnz     ?_065                                   ; 1AAA _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 1AAC _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1AAF _ C7. 40, 04, 00000000
?_065:  mov     eax, dword [ebp+8H]                     ; 1AB6 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1AB9 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 1ABC _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1ABF _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1AC2 _ 89. 50, 10
        mov     eax, 0                                  ; 1AC5 _ B8, 00000000
?_066:  leave                                           ; 1ACA _ C9
        ret                                             ; 1ACB _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 1ACC _ 55
        mov     ebp, esp                                ; 1ACD _ 89. E5
        sub     esp, 16                                 ; 1ACF _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 1AD2 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 1AD5 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 1AD8 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1ADB _ 8B. 40, 0C
        cmp     edx, eax                                ; 1ADE _ 39. C2
        jnz     ?_067                                   ; 1AE0 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 1AE2 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 1AE5 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 1AEC _ B8, FFFFFFFF
        jmp     ?_069                                   ; 1AF1 _ EB, 57

?_067:  mov     eax, dword [ebp+8H]                     ; 1AF3 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1AF6 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 1AF9 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 1AFC _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1AFF _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 1B01 _ 8B. 45, F8
        add     eax, edx                                ; 1B04 _ 01. D0
        movzx   eax, byte [eax]                         ; 1B06 _ 0F B6. 00
        movzx   eax, al                                 ; 1B09 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 1B0C _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1B0F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1B12 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 1B15 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1B18 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1B1B _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1B1E _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 1B21 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1B24 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1B27 _ 8B. 40, 0C
        cmp     edx, eax                                ; 1B2A _ 39. C2
        jnz     ?_068                                   ; 1B2C _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 1B2E _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1B31 _ C7. 40, 08, 00000000
?_068:  mov     eax, dword [ebp+8H]                     ; 1B38 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1B3B _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 1B3E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1B41 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1B44 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 1B47 _ 8B. 45, FC
?_069:  leave                                           ; 1B4A _ C9
        ret                                             ; 1B4B _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 1B4C _ 55
        mov     ebp, esp                                ; 1B4D _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1B4F _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 1B52 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1B55 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1B58 _ 8B. 40, 10
        sub     edx, eax                                ; 1B5B _ 29. C2
        mov     eax, edx                                ; 1B5D _ 89. D0
        pop     ebp                                     ; 1B5F _ 5D
        ret                                             ; 1B60 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 1B61 _ 55
        mov     ebp, esp                                ; 1B62 _ 89. E5
        sub     esp, 4                                  ; 1B64 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 1B67 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 1B6A _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 1B6D _ 80. 7D, FC, 09
        jle     ?_070                                   ; 1B71 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 1B73 _ 0F B6. 45, FC
        add     eax, 55                                 ; 1B77 _ 83. C0, 37
        jmp     ?_071                                   ; 1B7A _ EB, 07

?_070:  movzx   eax, byte [ebp-4H]                      ; 1B7C _ 0F B6. 45, FC
        add     eax, 48                                 ; 1B80 _ 83. C0, 30
?_071:  leave                                           ; 1B83 _ C9
        ret                                             ; 1B84 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 1B85 _ 55
        mov     ebp, esp                                ; 1B86 _ 89. E5
        sub     esp, 24                                 ; 1B88 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 1B8B _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 1B8E _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 1B91 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 1B98 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 1B9C _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 1B9F _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 1BA2 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 1BA6 _ 89. 04 24
        call    charToHexVal                            ; 1BA9 _ E8, FFFFFFFC(rel)
        mov     byte [?_171], al                        ; 1BAE _ A2, 00000243(d)
        movzx   eax, byte [ebp-14H]                     ; 1BB3 _ 0F B6. 45, EC
        shr     al, 4                                   ; 1BB7 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 1BBA _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 1BBD _ 0F B6. 45, EC
        movsx   eax, al                                 ; 1BC1 _ 0F BE. C0
        mov     dword [esp], eax                        ; 1BC4 _ 89. 04 24
        call    charToHexVal                            ; 1BC7 _ E8, FFFFFFFC(rel)
        mov     byte [?_170], al                        ; 1BCC _ A2, 00000242(d)
        mov     eax, keyval                             ; 1BD1 _ B8, 00000240(d)
        leave                                           ; 1BD6 _ C9
        ret                                             ; 1BD7 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 1BD8 _ 55
        mov     ebp, esp                                ; 1BD9 _ 89. E5
        sub     esp, 16                                 ; 1BDB _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 1BDE _ C6. 05, 00000280(d), 30
        mov     byte [?_174], 88                        ; 1BE5 _ C6. 05, 00000281(d), 58
        mov     byte [?_175], 0                         ; 1BEC _ C6. 05, 0000028A(d), 00
        mov     dword [ebp-0CH], 2                      ; 1BF3 _ C7. 45, F4, 00000002
        jmp     ?_073                                   ; 1BFA _ EB, 0F

?_072:  mov     eax, dword [ebp-0CH]                    ; 1BFC _ 8B. 45, F4
        add     eax, str.1386                           ; 1BFF _ 05, 00000280(d)
        mov     byte [eax], 48                          ; 1C04 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 1C07 _ 83. 45, F4, 01
?_073:  cmp     dword [ebp-0CH], 9                      ; 1C0B _ 83. 7D, F4, 09
        jle     ?_072                                   ; 1C0F _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 1C11 _ C7. 45, F8, 00000009
        jmp     ?_077                                   ; 1C18 _ EB, 40

?_074:  mov     eax, dword [ebp+8H]                     ; 1C1A _ 8B. 45, 08
        and     eax, 0FH                                ; 1C1D _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 1C20 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1C23 _ 8B. 45, 08
        shr     eax, 4                                  ; 1C26 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 1C29 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 1C2C _ 83. 7D, FC, 09
        jle     ?_075                                   ; 1C30 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 1C32 _ 8B. 45, FC
        add     eax, 55                                 ; 1C35 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 1C38 _ 8B. 55, F8
        add     edx, str.1386                           ; 1C3B _ 81. C2, 00000280(d)
        mov     byte [edx], al                          ; 1C41 _ 88. 02
        jmp     ?_076                                   ; 1C43 _ EB, 11

?_075:  mov     eax, dword [ebp-4H]                     ; 1C45 _ 8B. 45, FC
        add     eax, 48                                 ; 1C48 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 1C4B _ 8B. 55, F8
        add     edx, str.1386                           ; 1C4E _ 81. C2, 00000280(d)
        mov     byte [edx], al                          ; 1C54 _ 88. 02
?_076:  sub     dword [ebp-8H], 1                       ; 1C56 _ 83. 6D, F8, 01
?_077:  cmp     dword [ebp-8H], 1                       ; 1C5A _ 83. 7D, F8, 01
        jle     ?_078                                   ; 1C5E _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 1C60 _ 83. 7D, 08, 00
        jnz     ?_074                                   ; 1C64 _ 75, B4
?_078:  mov     eax, str.1386                           ; 1C66 _ B8, 00000280(d)
        leave                                           ; 1C6B _ C9
        ret                                             ; 1C6C _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 1C6D _ 55
        mov     ebp, esp                                ; 1C6E _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1C70 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1C73 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1C79 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1C7C _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1C83 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1C86 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1C8D _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1C90 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 1C97 _ 5D
        ret                                             ; 1C98 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1C99 _ 55
        mov     ebp, esp                                ; 1C9A _ 89. E5
        sub     esp, 16                                 ; 1C9C _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1C9F _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 1CA6 _ C7. 45, F8, 00000000
        jmp     ?_080                                   ; 1CAD _ EB, 14

?_079:  mov     eax, dword [ebp+8H]                     ; 1CAF _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1CB2 _ 8B. 55, F8
        add     edx, 2                                  ; 1CB5 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1CB8 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 1CBC _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 1CBF _ 83. 45, F8, 01
?_080:  mov     eax, dword [ebp+8H]                     ; 1CC3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1CC6 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 1CC8 _ 3B. 45, F8
        ja      ?_079                                   ; 1CCB _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 1CCD _ 8B. 45, FC
        leave                                           ; 1CD0 _ C9
        ret                                             ; 1CD1 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1CD2 _ 55
        mov     ebp, esp                                ; 1CD3 _ 89. E5
        sub     esp, 16                                 ; 1CD5 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1CD8 _ C7. 45, F8, 00000000
        jmp     ?_084                                   ; 1CDF _ E9, 00000085

?_081:  mov     eax, dword [ebp+8H]                     ; 1CE4 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1CE7 _ 8B. 55, F8
        add     edx, 2                                  ; 1CEA _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1CED _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 1CF1 _ 3B. 45, 0C
        jc      ?_083                                   ; 1CF4 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 1CF6 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1CF9 _ 8B. 55, F8
        add     edx, 2                                  ; 1CFC _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1CFF _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 1D02 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1D05 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D08 _ 8B. 55, F8
        add     edx, 2                                  ; 1D0B _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1D0E _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1D11 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 1D14 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1D17 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D1A _ 8B. 55, F8
        add     edx, 2                                  ; 1D1D _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1D20 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1D23 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D26 _ 8B. 55, F8
        add     edx, 2                                  ; 1D29 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1D2C _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1D30 _ 2B. 45, 0C
        mov     edx, eax                                ; 1D33 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1D35 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1D38 _ 8B. 4D, F8
        add     ecx, 2                                  ; 1D3B _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1D3E _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 1D42 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1D45 _ 8B. 55, F8
        add     edx, 2                                  ; 1D48 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1D4B _ 8B. 44 D0, 04
        test    eax, eax                                ; 1D4F _ 85. C0
        jnz     ?_082                                   ; 1D51 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 1D53 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D56 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1D58 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1D5B _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1D5E _ 89. 10
?_082:  mov     eax, dword [ebp-4H]                     ; 1D60 _ 8B. 45, FC
        jmp     ?_085                                   ; 1D63 _ EB, 17

?_083:  add     dword [ebp-8H], 1                       ; 1D65 _ 83. 45, F8, 01
?_084:  mov     eax, dword [ebp+8H]                     ; 1D69 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D6C _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 1D6E _ 3B. 45, F8
        ja      ?_081                                   ; 1D71 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 1D77 _ B8, 00000000
?_085:  leave                                           ; 1D7C _ C9
        ret                                             ; 1D7D _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1D7E _ 55
        mov     ebp, esp                                ; 1D7F _ 89. E5
        push    ebx                                     ; 1D81 _ 53
        sub     esp, 16                                 ; 1D82 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 1D85 _ C7. 45, F4, 00000000
        jmp     ?_088                                   ; 1D8C _ EB, 17

?_086:  mov     eax, dword [ebp+8H]                     ; 1D8E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1D91 _ 8B. 55, F4
        add     edx, 2                                  ; 1D94 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1D97 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 1D9A _ 3B. 45, 0C
        jbe     ?_087                                   ; 1D9D _ 76, 02
        jmp     ?_089                                   ; 1D9F _ EB, 0E

?_087:  add     dword [ebp-0CH], 1                      ; 1DA1 _ 83. 45, F4, 01
?_088:  mov     eax, dword [ebp+8H]                     ; 1DA5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1DA8 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1DAA _ 3B. 45, F4
        jg      ?_086                                   ; 1DAD _ 7F, DF
?_089:  cmp     dword [ebp-0CH], 0                      ; 1DAF _ 83. 7D, F4, 00
        jle     ?_091                                   ; 1DB3 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 1DB9 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1DBC _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1DBF _ 8B. 45, 08
        add     edx, 2                                  ; 1DC2 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1DC5 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 1DC8 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1DCB _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1DCE _ 8B. 45, 08
        add     ecx, 2                                  ; 1DD1 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1DD4 _ 8B. 44 C8, 04
        add     eax, edx                                ; 1DD8 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 1DDA _ 3B. 45, 0C
        jne     ?_091                                   ; 1DDD _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 1DE3 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1DE6 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1DE9 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1DEC _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1DEF _ 8B. 45, 08
        add     edx, 2                                  ; 1DF2 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1DF5 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1DF9 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1DFC _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1DFF _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1E02 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1E05 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1E09 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E0C _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1E0E _ 3B. 45, F4
        jle     ?_090                                   ; 1E11 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 1E13 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 1E16 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 1E19 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E1C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1E1F _ 8B. 55, F4
        add     edx, 2                                  ; 1E22 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1E25 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1E28 _ 39. C1
        jnz     ?_090                                   ; 1E2A _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 1E2C _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1E2F _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1E32 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1E35 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1E38 _ 8B. 45, 08
        add     edx, 2                                  ; 1E3B _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1E3E _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1E42 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1E45 _ 8B. 4D, F4
        add     ecx, 2                                  ; 1E48 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1E4B _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 1E4F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E52 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1E55 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1E58 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1E5C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E5F _ 8B. 00
        lea     edx, [eax-1H]                           ; 1E61 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1E64 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1E67 _ 89. 10
?_090:  mov     eax, 0                                  ; 1E69 _ B8, 00000000
        jmp     ?_097                                   ; 1E6E _ E9, 0000011C

?_091:  mov     eax, dword [ebp+8H]                     ; 1E73 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E76 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1E78 _ 3B. 45, F4
        jle     ?_092                                   ; 1E7B _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 1E7D _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 1E80 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 1E83 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E86 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1E89 _ 8B. 55, F4
        add     edx, 2                                  ; 1E8C _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1E8F _ 8B. 04 D0
        cmp     ecx, eax                                ; 1E92 _ 39. C1
        jnz     ?_092                                   ; 1E94 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1E96 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1E99 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1E9C _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1E9F _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1EA2 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1EA5 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1EA8 _ 8B. 55, F4
        add     edx, 2                                  ; 1EAB _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1EAE _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1EB2 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1EB5 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1EB8 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1EBB _ 8B. 55, F4
        add     edx, 2                                  ; 1EBE _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1EC1 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 1EC5 _ B8, 00000000
        jmp     ?_097                                   ; 1ECA _ E9, 000000C0

?_092:  mov     eax, dword [ebp+8H]                     ; 1ECF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1ED2 _ 8B. 00
        cmp     eax, 4095                               ; 1ED4 _ 3D, 00000FFF
        jg      ?_096                                   ; 1ED9 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 1EDF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1EE2 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 1EE4 _ 89. 45, F8
        jmp     ?_094                                   ; 1EE7 _ EB, 28

?_093:  mov     eax, dword [ebp-8H]                     ; 1EE9 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1EEC _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1EEF _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 1EF2 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 1EF5 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1EF8 _ 8B. 45, 08
        add     edx, 2                                  ; 1EFB _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1EFE _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1F01 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1F03 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1F06 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1F09 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 1F0D _ 83. 6D, F8, 01
?_094:  mov     eax, dword [ebp-8H]                     ; 1F11 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 1F14 _ 3B. 45, F4
        jg      ?_093                                   ; 1F17 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 1F19 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F1C _ 8B. 00
        lea     edx, [eax+1H]                           ; 1F1E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1F21 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1F24 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1F26 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1F29 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1F2C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1F2F _ 8B. 00
        cmp     edx, eax                                ; 1F31 _ 39. C2
        jge     ?_095                                   ; 1F33 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 1F35 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1F38 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1F3A _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1F3D _ 89. 50, 04
?_095:  mov     eax, dword [ebp+8H]                     ; 1F40 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1F43 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1F46 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1F49 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1F4C _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1F4F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1F52 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1F55 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1F58 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1F5B _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1F5F _ B8, 00000000
        jmp     ?_097                                   ; 1F64 _ EB, 29

?_096:  mov     eax, dword [ebp+8H]                     ; 1F66 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1F69 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1F6C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1F6F _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1F72 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1F75 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1F78 _ 8B. 40, 08
        mov     edx, eax                                ; 1F7B _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1F7D _ 8B. 45, 10
        add     eax, edx                                ; 1F80 _ 01. D0
        mov     edx, eax                                ; 1F82 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1F84 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1F87 _ 89. 50, 08
        mov     eax, 4294967295                         ; 1F8A _ B8, FFFFFFFF
?_097:  add     esp, 16                                 ; 1F8F _ 83. C4, 10
        pop     ebx                                     ; 1F92 _ 5B
        pop     ebp                                     ; 1F93 _ 5D
        ret                                             ; 1F94 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1F95 _ 55
        mov     ebp, esp                                ; 1F96 _ 89. E5
        sub     esp, 24                                 ; 1F98 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 1F9B _ 8B. 45, 0C
        add     eax, 4095                               ; 1F9E _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1FA3 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1FA8 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 1FAB _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1FAE _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1FB2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1FB5 _ 89. 04 24
        call    memman_alloc                            ; 1FB8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 1FBD _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1FC0 _ 8B. 45, FC
        leave                                           ; 1FC3 _ C9
        ret                                             ; 1FC4 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1FC5 _ 55
        mov     ebp, esp                                ; 1FC6 _ 89. E5
        sub     esp, 28                                 ; 1FC8 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 1FCB _ 8B. 45, 10
        add     eax, 4095                               ; 1FCE _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1FD3 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1FD8 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 1FDB _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 1FDE _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1FE2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1FE5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1FE9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1FEC _ 89. 04 24
        call    memman_free                             ; 1FEF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 1FF4 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1FF7 _ 8B. 45, FC
        leave                                           ; 1FFA _ C9
        ret                                             ; 1FFB _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 1FFC _ 55
        mov     ebp, esp                                ; 1FFD _ 89. E5
        sub     esp, 40                                 ; 1FFF _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 2002 _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 200A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 200D _ 89. 04 24
        call    memman_alloc_4k                         ; 2010 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 2015 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 2018 _ 83. 7D, F4, 00
        jnz     ?_098                                   ; 201C _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 201E _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 2021 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 2029 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 202D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2030 _ 89. 04 24
        call    memman_free_4k                          ; 2033 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 2038 _ B8, 00000000
        jmp     ?_102                                   ; 203D _ E9, 0000009D

?_098:  mov     eax, dword [ebp-0CH]                    ; 2042 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 2045 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2048 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 204A _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 204D _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 2050 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 2053 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 2056 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 2059 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 205C _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 205F _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 2066 _ C7. 45, F0, 00000000
        jmp     ?_100                                   ; 206D _ EB, 1B

?_099:  mov     eax, dword [ebp-0CH]                    ; 206F _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 2072 _ 8B. 55, F0
        add     edx, 33                                 ; 2075 _ 83. C2, 21
        shl     edx, 5                                  ; 2078 _ C1. E2, 05
        add     eax, edx                                ; 207B _ 01. D0
        add     eax, 16                                 ; 207D _ 83. C0, 10
        mov     dword [eax], 0                          ; 2080 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 2086 _ 83. 45, F0, 01
?_100:  cmp     dword [ebp-10H], 255                    ; 208A _ 81. 7D, F0, 000000FF
        jle     ?_099                                   ; 2091 _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 2093 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 2096 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 209A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 209E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 20A1 _ 89. 04 24
        call    memman_alloc_4k                         ; 20A4 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 20A9 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 20AB _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 20AE _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 20B1 _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 20B4 _ 8B. 40, 10
        test    eax, eax                                ; 20B7 _ 85. C0
        jnz     ?_101                                   ; 20B9 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 20BB _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 20BE _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 20C6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 20CA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 20CD _ 89. 04 24
        call    memman_free_4k                          ; 20D0 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 20D5 _ B8, 00000000
        jmp     ?_102                                   ; 20DA _ EB, 03

?_101:  mov     eax, dword [ebp-0CH]                    ; 20DC _ 8B. 45, F4
?_102:  leave                                           ; 20DF _ C9
        ret                                             ; 20E0 _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 20E1 _ 55
        mov     ebp, esp                                ; 20E2 _ 89. E5
        sub     esp, 16                                 ; 20E4 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 20E7 _ C7. 45, F8, 00000000
        jmp     ?_105                                   ; 20EE _ EB, 5B

?_103:  mov     eax, dword [ebp+8H]                     ; 20F0 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 20F3 _ 8B. 55, F8
        add     edx, 33                                 ; 20F6 _ 83. C2, 21
        shl     edx, 5                                  ; 20F9 _ C1. E2, 05
        add     eax, edx                                ; 20FC _ 01. D0
        add     eax, 16                                 ; 20FE _ 83. C0, 10
        mov     eax, dword [eax]                        ; 2101 _ 8B. 00
        test    eax, eax                                ; 2103 _ 85. C0
        jnz     ?_104                                   ; 2105 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 2107 _ 8B. 45, F8
        shl     eax, 5                                  ; 210A _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 210D _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 2113 _ 8B. 45, 08
        add     eax, edx                                ; 2116 _ 01. D0
        add     eax, 4                                  ; 2118 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 211B _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 211E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2121 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 2124 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 2127 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 212A _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 212E _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 2131 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 2138 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 213B _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 2142 _ 8B. 45, FC
        jmp     ?_106                                   ; 2145 _ EB, 12

?_104:  add     dword [ebp-8H], 1                       ; 2147 _ 83. 45, F8, 01
?_105:  cmp     dword [ebp-8H], 255                     ; 214B _ 81. 7D, F8, 000000FF
        jle     ?_103                                   ; 2152 _ 7E, 9C
        mov     eax, 0                                  ; 2154 _ B8, 00000000
?_106:  leave                                           ; 2159 _ C9
        ret                                             ; 215A _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 215B _ 55
        mov     ebp, esp                                ; 215C _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 215E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2161 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2164 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2166 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2169 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 216C _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 216F _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 2172 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 2175 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2178 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 217B _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 217E _ 89. 50, 14
        pop     ebp                                     ; 2181 _ 5D
        ret                                             ; 2182 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 2183 _ 55
        mov     ebp, esp                                ; 2184 _ 89. E5
        push    esi                                     ; 2186 _ 56
        push    ebx                                     ; 2187 _ 53
        sub     esp, 48                                 ; 2188 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 218B _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 218E _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 2191 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 2194 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2197 _ 8B. 40, 0C
        add     eax, 1                                  ; 219A _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 219D _ 3B. 45, 10
        jge     ?_107                                   ; 21A0 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 21A2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 21A5 _ 8B. 40, 0C
        add     eax, 1                                  ; 21A8 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 21AB _ 89. 45, 10
?_107:  cmp     dword [ebp+10H], -1                     ; 21AE _ 83. 7D, 10, FF
        jge     ?_108                                   ; 21B2 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 21B4 _ C7. 45, 10, FFFFFFFF
?_108:  mov     eax, dword [ebp+0CH]                    ; 21BB _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 21BE _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 21C1 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 21C4 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 21C7 _ 3B. 45, 10
        jle     ?_115                                   ; 21CA _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 21D0 _ 83. 7D, 10, 00
        js      ?_111                                   ; 21D4 _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 21DA _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 21DD _ 89. 45, F0
        jmp     ?_110                                   ; 21E0 _ EB, 34

?_109:  mov     eax, dword [ebp-10H]                    ; 21E2 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 21E5 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 21E8 _ 8B. 45, 08
        add     edx, 4                                  ; 21EB _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 21EE _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 21F2 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 21F5 _ 8B. 4D, F0
        add     ecx, 4                                  ; 21F8 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 21FB _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 21FF _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2202 _ 8B. 55, F0
        add     edx, 4                                  ; 2205 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2208 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 220C _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 220F _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2212 _ 83. 6D, F0, 01
?_110:  mov     eax, dword [ebp-10H]                    ; 2216 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2219 _ 3B. 45, 10
        jg      ?_109                                   ; 221C _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 221E _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2221 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2224 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2227 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 222A _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 222E _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2231 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2234 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2237 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 223A _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 223D _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2240 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2243 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2246 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2249 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 224C _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 224F _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2252 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2255 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2258 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 225B _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 225E _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 2262 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2266 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 226A _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 226E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2272 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2275 _ 89. 04 24
        call    sheet_refresh_map                       ; 2278 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 227D _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2280 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 2283 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2286 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2289 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 228C _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 228F _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2292 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2295 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2298 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 229B _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 229E _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 22A1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 22A4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 22A7 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 22AA _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 22AD _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 22B1 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 22B5 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 22B9 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 22BD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 22C1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 22C4 _ 89. 04 24
        call    sheet_refresh_local                     ; 22C7 _ E8, FFFFFFFC(rel)
        jmp     ?_122                                   ; 22CC _ E9, 0000026C

?_111:  mov     eax, dword [ebp+8H]                     ; 22D1 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 22D4 _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 22D7 _ 3B. 45, F4
        jle     ?_114                                   ; 22DA _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 22DC _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 22DF _ 89. 45, F0
        jmp     ?_113                                   ; 22E2 _ EB, 34

?_112:  mov     eax, dword [ebp-10H]                    ; 22E4 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 22E7 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 22EA _ 8B. 45, 08
        add     edx, 4                                  ; 22ED _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 22F0 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 22F4 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 22F7 _ 8B. 4D, F0
        add     ecx, 4                                  ; 22FA _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 22FD _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2301 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2304 _ 8B. 55, F0
        add     edx, 4                                  ; 2307 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 230A _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 230E _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2311 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2314 _ 83. 45, F0, 01
?_113:  mov     eax, dword [ebp+8H]                     ; 2318 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 231B _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 231E _ 3B. 45, F0
        jg      ?_112                                   ; 2321 _ 7F, C1
?_114:  mov     eax, dword [ebp+8H]                     ; 2323 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2326 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 2329 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 232C _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 232F _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2332 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2335 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2338 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 233B _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 233E _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2341 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2344 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2347 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 234A _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 234D _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2350 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2353 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2356 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2359 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 235C _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 2364 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2368 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 236C _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2370 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2374 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2377 _ 89. 04 24
        call    sheet_refresh_map                       ; 237A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 237F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2382 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2385 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2388 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 238B _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 238E _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2391 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2394 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2397 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 239A _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 239D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 23A0 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 23A3 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 23A6 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 23A9 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 23B1 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 23B5 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 23B9 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 23BD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 23C1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 23C4 _ 89. 04 24
        call    sheet_refresh_local                     ; 23C7 _ E8, FFFFFFFC(rel)
        jmp     ?_122                                   ; 23CC _ E9, 0000016C

?_115:  mov     eax, dword [ebp-0CH]                    ; 23D1 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 23D4 _ 3B. 45, 10
        jge     ?_122                                   ; 23D7 _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 23DD _ 83. 7D, F4, 00
        js      ?_118                                   ; 23E1 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 23E3 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 23E6 _ 89. 45, F0
        jmp     ?_117                                   ; 23E9 _ EB, 34

?_116:  mov     eax, dword [ebp-10H]                    ; 23EB _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 23EE _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 23F1 _ 8B. 45, 08
        add     edx, 4                                  ; 23F4 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 23F7 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 23FB _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 23FE _ 8B. 4D, F0
        add     ecx, 4                                  ; 2401 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2404 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2408 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 240B _ 8B. 55, F0
        add     edx, 4                                  ; 240E _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2411 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2415 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2418 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 241B _ 83. 45, F0, 01
?_117:  mov     eax, dword [ebp-10H]                    ; 241F _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2422 _ 3B. 45, 10
        jl      ?_116                                   ; 2425 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 2427 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 242A _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 242D _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2430 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2433 _ 89. 54 88, 04
        jmp     ?_121                                   ; 2437 _ EB, 6C

?_118:  mov     eax, dword [ebp+8H]                     ; 2439 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 243C _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 243F _ 89. 45, F0
        jmp     ?_120                                   ; 2442 _ EB, 3A

?_119:  mov     eax, dword [ebp-10H]                    ; 2444 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 2447 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 244A _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 244D _ 8B. 55, F0
        add     edx, 4                                  ; 2450 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2453 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2457 _ 8B. 45, 08
        add     ecx, 4                                  ; 245A _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 245D _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 2461 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2464 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2467 _ 8B. 45, 08
        add     edx, 4                                  ; 246A _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 246D _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2471 _ 8B. 55, F0
        add     edx, 1                                  ; 2474 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 2477 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 247A _ 83. 6D, F0, 01
?_120:  mov     eax, dword [ebp-10H]                    ; 247E _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2481 _ 3B. 45, 10
        jge     ?_119                                   ; 2484 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 2486 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2489 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 248C _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 248F _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2492 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2496 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2499 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 249C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 249F _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 24A2 _ 89. 50, 0C
?_121:  mov     eax, dword [ebp+0CH]                    ; 24A5 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 24A8 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 24AB _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 24AE _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 24B1 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 24B4 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 24B7 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 24BA _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 24BD _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 24C0 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 24C3 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 24C6 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 24C9 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 24CC _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 24CF _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 24D2 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 24D6 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 24DA _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 24DE _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 24E2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 24E6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 24E9 _ 89. 04 24
        call    sheet_refresh_map                       ; 24EC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 24F1 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 24F4 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 24F7 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 24FA _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 24FD _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2500 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2503 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2506 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2509 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 250C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 250F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2512 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2515 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2518 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 251B _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 251E _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 2522 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2526 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 252A _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 252E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2532 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2535 _ 89. 04 24
        call    sheet_refresh_local                     ; 2538 _ E8, FFFFFFFC(rel)
?_122:  add     esp, 48                                 ; 253D _ 83. C4, 30
        pop     ebx                                     ; 2540 _ 5B
        pop     esi                                     ; 2541 _ 5E
        pop     ebp                                     ; 2542 _ 5D
        ret                                             ; 2543 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 2544 _ 55
        mov     ebp, esp                                ; 2545 _ 89. E5
        push    edi                                     ; 2547 _ 57
        push    esi                                     ; 2548 _ 56
        push    ebx                                     ; 2549 _ 53
        sub     esp, 44                                 ; 254A _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 254D _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2550 _ 8B. 40, 18
        test    eax, eax                                ; 2553 _ 85. C0
        js      ?_123                                   ; 2555 _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 2557 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 255A _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 255D _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2560 _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 2563 _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 2566 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 2569 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 256C _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 256F _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 2572 _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 2575 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2578 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 257B _ 8B. 55, 14
        add     ecx, edx                                ; 257E _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2580 _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 2583 _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 2586 _ 8B. 55, 10
        add     edx, edi                                ; 2589 _ 01. FA
        mov     dword [esp+14H], eax                    ; 258B _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 258F _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2593 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2597 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 259B _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 259F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 25A2 _ 89. 04 24
        call    sheet_refresh_local                     ; 25A5 _ E8, FFFFFFFC(rel)
?_123:  mov     eax, 0                                  ; 25AA _ B8, 00000000
        add     esp, 44                                 ; 25AF _ 83. C4, 2C
        pop     ebx                                     ; 25B2 _ 5B
        pop     esi                                     ; 25B3 _ 5E
        pop     edi                                     ; 25B4 _ 5F
        pop     ebp                                     ; 25B5 _ 5D
        ret                                             ; 25B6 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 25B7 _ 55
        mov     ebp, esp                                ; 25B8 _ 89. E5
        push    ebx                                     ; 25BA _ 53
        sub     esp, 52                                 ; 25BB _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 25BE _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 25C1 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 25C4 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 25C7 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 25CA _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 25CD _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 25D0 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 25D3 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 25D6 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 25D9 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 25DC _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 25DF _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 25E2 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 25E5 _ 8B. 40, 18
        test    eax, eax                                ; 25E8 _ 85. C0
        js      ?_124                                   ; 25EA _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 25F0 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 25F3 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 25F6 _ 8B. 45, F4
        add     edx, eax                                ; 25F9 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 25FB _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 25FE _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2601 _ 8B. 45, F0
        add     eax, ecx                                ; 2604 _ 01. C8
        mov     dword [esp+14H], 0                      ; 2606 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 260E _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2612 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2616 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2619 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 261D _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2620 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2624 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2627 _ 89. 04 24
        call    sheet_refresh_map                       ; 262A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 262F _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2632 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2635 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2638 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 263B _ 8B. 55, 14
        add     ecx, edx                                ; 263E _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2640 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2643 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2646 _ 8B. 55, 10
        add     edx, ebx                                ; 2649 _ 01. DA
        mov     dword [esp+14H], eax                    ; 264B _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 264F _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 2653 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 2657 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 265A _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 265E _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2661 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2665 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2668 _ 89. 04 24
        call    sheet_refresh_map                       ; 266B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2670 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2673 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2676 _ 8B. 45, F4
        add     edx, eax                                ; 2679 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 267B _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 267E _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2681 _ 8B. 45, F0
        add     eax, ecx                                ; 2684 _ 01. C8
        mov     dword [esp+14H], 0                      ; 2686 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 268E _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2692 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2696 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2699 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 269D _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 26A0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 26A4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 26A7 _ 89. 04 24
        call    sheet_refresh_local                     ; 26AA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 26AF _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 26B2 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 26B5 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 26B8 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 26BB _ 8B. 55, 14
        add     ecx, edx                                ; 26BE _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 26C0 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 26C3 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 26C6 _ 8B. 55, 10
        add     edx, ebx                                ; 26C9 _ 01. DA
        mov     dword [esp+14H], eax                    ; 26CB _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 26CF _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 26D3 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 26D7 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 26DA _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 26DE _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 26E1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 26E5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 26E8 _ 89. 04 24
        call    sheet_refresh_local                     ; 26EB _ E8, FFFFFFFC(rel)
?_124:  add     esp, 52                                 ; 26F0 _ 83. C4, 34
        pop     ebx                                     ; 26F3 _ 5B
        pop     ebp                                     ; 26F4 _ 5D
        ret                                             ; 26F5 _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 26F6 _ 55
        mov     ebp, esp                                ; 26F7 _ 89. E5
        sub     esp, 48                                 ; 26F9 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 26FC _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 26FF _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 2701 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2704 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2707 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 270A _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 270D _ 83. 7D, 0C, 00
        jns     ?_125                                   ; 2711 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2713 _ C7. 45, 0C, 00000000
?_125:  cmp     dword [ebp+10H], 0                      ; 271A _ 83. 7D, 10, 00
        jns     ?_126                                   ; 271E _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2720 _ C7. 45, 10, 00000000
?_126:  mov     eax, dword [ebp+8H]                     ; 2727 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 272A _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 272D _ 3B. 45, 14
        jge     ?_127                                   ; 2730 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2732 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2735 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 2738 _ 89. 45, 14
?_127:  mov     eax, dword [ebp+8H]                     ; 273B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 273E _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 2741 _ 3B. 45, 18
        jge     ?_128                                   ; 2744 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2746 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2749 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 274C _ 89. 45, 18
?_128:  mov     eax, dword [ebp+1CH]                    ; 274F _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 2752 _ 89. 45, DC
        jmp     ?_135                                   ; 2755 _ E9, 00000119

?_129:  mov     eax, dword [ebp+8H]                     ; 275A _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 275D _ 8B. 55, DC
        add     edx, 4                                  ; 2760 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2763 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2767 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 276A _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 276D _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 276F _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 2772 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 2775 _ 8B. 45, 08
        add     eax, 1044                               ; 2778 _ 05, 00000414
        sub     edx, eax                                ; 277D _ 29. C2
        mov     eax, edx                                ; 277F _ 89. D0
        sar     eax, 5                                  ; 2781 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 2784 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 2787 _ C7. 45, E4, 00000000
        jmp     ?_134                                   ; 278E _ E9, 000000CD

?_130:  mov     eax, dword [ebp-10H]                    ; 2793 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 2796 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 2799 _ 8B. 45, E4
        add     eax, edx                                ; 279C _ 01. D0
        mov     dword [ebp-8H], eax                     ; 279E _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 27A1 _ C7. 45, E0, 00000000
        jmp     ?_133                                   ; 27A8 _ E9, 000000A0

?_131:  mov     eax, dword [ebp-10H]                    ; 27AD _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 27B0 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 27B3 _ 8B. 45, E0
        add     eax, edx                                ; 27B6 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 27B8 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 27BB _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 27BE _ 3B. 45, FC
        jg      ?_132                                   ; 27C1 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 27C7 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 27CA _ 3B. 45, 14
        jge     ?_132                                   ; 27CD _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 27CF _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 27D2 _ 3B. 45, F8
        jg      ?_132                                   ; 27D5 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 27D7 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 27DA _ 3B. 45, 18
        jge     ?_132                                   ; 27DD _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 27DF _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 27E2 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 27E5 _ 0F AF. 45, E4
        mov     edx, eax                                ; 27E9 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 27EB _ 8B. 45, E0
        add     eax, edx                                ; 27EE _ 01. D0
        mov     edx, eax                                ; 27F0 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 27F2 _ 8B. 45, F4
        add     eax, edx                                ; 27F5 _ 01. D0
        movzx   eax, byte [eax]                         ; 27F7 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 27FA _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 27FD _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 2801 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 2804 _ 8B. 40, 14
        cmp     edx, eax                                ; 2807 _ 39. C2
        jz      ?_132                                   ; 2809 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 280B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 280E _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 2811 _ 0F AF. 45, F8
        mov     edx, eax                                ; 2815 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2817 _ 8B. 45, FC
        add     eax, edx                                ; 281A _ 01. D0
        mov     edx, eax                                ; 281C _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 281E _ 8B. 45, EC
        add     eax, edx                                ; 2821 _ 01. D0
        movzx   eax, byte [eax]                         ; 2823 _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 2826 _ 3A. 45, DA
        jnz     ?_132                                   ; 2829 _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 282B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 282E _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 2831 _ 0F AF. 45, F8
        mov     edx, eax                                ; 2835 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2837 _ 8B. 45, FC
        add     eax, edx                                ; 283A _ 01. D0
        mov     edx, eax                                ; 283C _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 283E _ 8B. 45, E8
        add     edx, eax                                ; 2841 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 2843 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 2847 _ 88. 02
?_132:  add     dword [ebp-20H], 1                      ; 2849 _ 83. 45, E0, 01
?_133:  mov     eax, dword [ebp-10H]                    ; 284D _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2850 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 2853 _ 3B. 45, E0
        jg      ?_131                                   ; 2856 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 285C _ 83. 45, E4, 01
?_134:  mov     eax, dword [ebp-10H]                    ; 2860 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2863 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 2866 _ 3B. 45, E4
        jg      ?_130                                   ; 2869 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 286F _ 83. 45, DC, 01
?_135:  mov     eax, dword [ebp+8H]                     ; 2873 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2876 _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 2879 _ 3B. 45, DC
        jge     ?_129                                   ; 287C _ 0F 8D, FFFFFED8
        leave                                           ; 2882 _ C9
        ret                                             ; 2883 _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 2884 _ 55
        mov     ebp, esp                                ; 2885 _ 89. E5
        sub     esp, 64                                 ; 2887 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 288A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 288D _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 288F _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2892 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2895 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 2898 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 289B _ 83. 7D, 0C, 00
        jns     ?_136                                   ; 289F _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 28A1 _ C7. 45, 0C, 00000000
?_136:  cmp     dword [ebp+10H], 0                      ; 28A8 _ 83. 7D, 10, 00
        jns     ?_137                                   ; 28AC _ 79, 07
        mov     dword [ebp+10H], 0                      ; 28AE _ C7. 45, 10, 00000000
?_137:  mov     eax, dword [ebp+8H]                     ; 28B5 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 28B8 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 28BB _ 3B. 45, 14
        jge     ?_138                                   ; 28BE _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 28C0 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 28C3 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 28C6 _ 89. 45, 14
?_138:  mov     eax, dword [ebp+8H]                     ; 28C9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 28CC _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 28CF _ 3B. 45, 18
        jge     ?_139                                   ; 28D2 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 28D4 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 28D7 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 28DA _ 89. 45, 18
?_139:  mov     eax, dword [ebp+1CH]                    ; 28DD _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 28E0 _ 89. 45, CC
        jmp     ?_150                                   ; 28E3 _ E9, 00000141

?_140:  mov     eax, dword [ebp+8H]                     ; 28E8 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 28EB _ 8B. 55, CC
        add     edx, 4                                  ; 28EE _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 28F1 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 28F5 _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 28F8 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 28FB _ 8B. 45, 08
        add     eax, 1044                               ; 28FE _ 05, 00000414
        sub     edx, eax                                ; 2903 _ 29. C2
        mov     eax, edx                                ; 2905 _ 89. D0
        sar     eax, 5                                  ; 2907 _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 290A _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 290D _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2910 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2912 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2915 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 2918 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 291B _ 8B. 55, 0C
        sub     edx, eax                                ; 291E _ 29. C2
        mov     eax, edx                                ; 2920 _ 89. D0
        mov     dword [ebp-30H], eax                    ; 2922 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 2925 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 2928 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 292B _ 8B. 55, 10
        sub     edx, eax                                ; 292E _ 29. C2
        mov     eax, edx                                ; 2930 _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 2932 _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 2935 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 2938 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 293B _ 8B. 55, 14
        sub     edx, eax                                ; 293E _ 29. C2
        mov     eax, edx                                ; 2940 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 2942 _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 2945 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 2948 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 294B _ 8B. 55, 18
        sub     edx, eax                                ; 294E _ 29. C2
        mov     eax, edx                                ; 2950 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 2952 _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 2955 _ 83. 7D, D0, 00
        jns     ?_141                                   ; 2959 _ 79, 07
        mov     dword [ebp-30H], 0                      ; 295B _ C7. 45, D0, 00000000
?_141:  cmp     dword [ebp-2CH], 0                      ; 2962 _ 83. 7D, D4, 00
        jns     ?_142                                   ; 2966 _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 2968 _ C7. 45, D4, 00000000
?_142:  mov     eax, dword [ebp-10H]                    ; 296F _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2972 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 2975 _ 3B. 45, D8
        jge     ?_143                                   ; 2978 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 297A _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 297D _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 2980 _ 89. 45, D8
?_143:  mov     eax, dword [ebp-10H]                    ; 2983 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2986 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 2989 _ 3B. 45, DC
        jge     ?_144                                   ; 298C _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 298E _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2991 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 2994 _ 89. 45, DC
?_144:  mov     eax, dword [ebp-2CH]                    ; 2997 _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 299A _ 89. 45, E4
        jmp     ?_149                                   ; 299D _ EB, 7A

?_145:  mov     eax, dword [ebp-10H]                    ; 299F _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 29A2 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 29A5 _ 8B. 45, E4
        add     eax, edx                                ; 29A8 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 29AA _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 29AD _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 29B0 _ 89. 45, E0
        jmp     ?_148                                   ; 29B3 _ EB, 58

?_146:  mov     eax, dword [ebp-10H]                    ; 29B5 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 29B8 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 29BB _ 8B. 45, E0
        add     eax, edx                                ; 29BE _ 01. D0
        mov     dword [ebp-4H], eax                     ; 29C0 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 29C3 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 29C6 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 29C9 _ 0F AF. 45, E4
        mov     edx, eax                                ; 29CD _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 29CF _ 8B. 45, E0
        add     eax, edx                                ; 29D2 _ 01. D0
        mov     edx, eax                                ; 29D4 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 29D6 _ 8B. 45, F4
        add     eax, edx                                ; 29D9 _ 01. D0
        movzx   eax, byte [eax]                         ; 29DB _ 0F B6. 00
        movzx   edx, al                                 ; 29DE _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 29E1 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 29E4 _ 8B. 40, 14
        cmp     edx, eax                                ; 29E7 _ 39. C2
        jz      ?_147                                   ; 29E9 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 29EB _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 29EE _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 29F1 _ 0F AF. 45, F8
        mov     edx, eax                                ; 29F5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 29F7 _ 8B. 45, FC
        add     eax, edx                                ; 29FA _ 01. D0
        mov     edx, eax                                ; 29FC _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 29FE _ 8B. 45, EC
        add     edx, eax                                ; 2A01 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 2A03 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 2A07 _ 88. 02
?_147:  add     dword [ebp-20H], 1                      ; 2A09 _ 83. 45, E0, 01
?_148:  mov     eax, dword [ebp-20H]                    ; 2A0D _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 2A10 _ 3B. 45, D8
        jl      ?_146                                   ; 2A13 _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 2A15 _ 83. 45, E4, 01
?_149:  mov     eax, dword [ebp-1CH]                    ; 2A19 _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 2A1C _ 3B. 45, DC
        jl      ?_145                                   ; 2A1F _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 2A25 _ 83. 45, CC, 01
?_150:  mov     eax, dword [ebp+8H]                     ; 2A29 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2A2C _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 2A2F _ 3B. 45, CC
        jge     ?_140                                   ; 2A32 _ 0F 8D, FFFFFEB0
        leave                                           ; 2A38 _ C9
        ret                                             ; 2A39 _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 2A3A _ 55
        mov     ebp, esp                                ; 2A3B _ 89. E5
        sub     esp, 24                                 ; 2A3D _ 83. EC, 18
        mov     dword [esp+4H], 52                      ; 2A40 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 2A48 _ C7. 04 24, 00000043
        call    io_out8                                 ; 2A4F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 2A54 _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 2A5C _ C7. 04 24, 00000040
        call    io_out8                                 ; 2A63 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 2A68 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 2A70 _ C7. 04 24, 00000040
        call    io_out8                                 ; 2A77 _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 2A7C _ C7. 05, 000002A0(d), 00000000
        leave                                           ; 2A86 _ C9
        ret                                             ; 2A87 _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 2A88 _ 55
        mov     ebp, esp                                ; 2A89 _ 89. E5
        mov     eax, timer_control                      ; 2A8B _ B8, 000002A0(d)
        pop     ebp                                     ; 2A90 _ 5D
        ret                                             ; 2A91 _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 2A92 _ 55
        mov     ebp, esp                                ; 2A93 _ 89. E5
        sub     esp, 16                                 ; 2A95 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2A98 _ C7. 45, FC, 00000000
        jmp     ?_153                                   ; 2A9F _ EB, 26

?_151:  mov     eax, dword [ebp-4H]                     ; 2AA1 _ 8B. 45, FC
        shl     eax, 4                                  ; 2AA4 _ C1. E0, 04
        add     eax, timer_control                      ; 2AA7 _ 05, 000002A0(d)
        mov     eax, dword [eax+8H]                     ; 2AAC _ 8B. 40, 08
        test    eax, eax                                ; 2AAF _ 85. C0
        jnz     ?_152                                   ; 2AB1 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 2AB3 _ 8B. 45, FC
        shl     eax, 4                                  ; 2AB6 _ C1. E0, 04
        add     eax, timer_control                      ; 2AB9 _ 05, 000002A0(d)
        add     eax, 4                                  ; 2ABE _ 83. C0, 04
        jmp     ?_154                                   ; 2AC1 _ EB, 0D

?_152:  add     dword [ebp-4H], 1                       ; 2AC3 _ 83. 45, FC, 01
?_153:  cmp     dword [ebp-4H], 499                     ; 2AC7 _ 81. 7D, FC, 000001F3
        jle     ?_151                                   ; 2ACE _ 7E, D1
?_154:  leave                                           ; 2AD0 _ C9
        ret                                             ; 2AD1 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 2AD2 _ 55
        mov     ebp, esp                                ; 2AD3 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2AD5 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2AD8 _ C7. 40, 04, 00000000
        pop     ebp                                     ; 2ADF _ 5D
        ret                                             ; 2AE0 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 2AE1 _ 55
        mov     ebp, esp                                ; 2AE2 _ 89. E5
        sub     esp, 4                                  ; 2AE4 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 2AE7 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 2AEA _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2AED _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2AF0 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 2AF3 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2AF6 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2AF9 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 2AFD _ 88. 50, 0C
        leave                                           ; 2B00 _ C9
        ret                                             ; 2B01 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 2B02 _ 55
        mov     ebp, esp                                ; 2B03 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2B05 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2B08 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2B0B _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2B0D _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 2B10 _ C7. 40, 04, 00000002
        pop     ebp                                     ; 2B17 _ 5D
        ret                                             ; 2B18 _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 2B19 _ 55
        mov     ebp, esp                                ; 2B1A _ 89. E5
        sub     esp, 40                                 ; 2B1C _ 83. EC, 28
        mov     dword [esp+4H], 96                      ; 2B1F _ C7. 44 24, 04, 00000060
        mov     dword [esp], 32                         ; 2B27 _ C7. 04 24, 00000020
        call    io_out8                                 ; 2B2E _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 2B33 _ A1, 000002A0(d)
        add     eax, 1                                  ; 2B38 _ 83. C0, 01
        mov     dword [timer_control], eax              ; 2B3B _ A3, 000002A0(d)
        mov     dword [ebp-0CH], 0                      ; 2B40 _ C7. 45, F4, 00000000
        jmp     ?_157                                   ; 2B47 _ E9, 00000086

?_155:  mov     eax, dword [ebp-0CH]                    ; 2B4C _ 8B. 45, F4
        shl     eax, 4                                  ; 2B4F _ C1. E0, 04
        add     eax, timer_control                      ; 2B52 _ 05, 000002A0(d)
        mov     eax, dword [eax+8H]                     ; 2B57 _ 8B. 40, 08
        cmp     eax, 2                                  ; 2B5A _ 83. F8, 02
        jnz     ?_156                                   ; 2B5D _ 75, 6F
        mov     eax, dword [ebp-0CH]                    ; 2B5F _ 8B. 45, F4
        shl     eax, 4                                  ; 2B62 _ C1. E0, 04
        add     eax, timer_control                      ; 2B65 _ 05, 000002A0(d)
        mov     eax, dword [eax+4H]                     ; 2B6A _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 2B6D _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 2B70 _ 8B. 45, F4
        shl     eax, 4                                  ; 2B73 _ C1. E0, 04
        add     eax, timer_control                      ; 2B76 _ 05, 000002A0(d)
        mov     dword [eax+4H], edx                     ; 2B7B _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 2B7E _ 8B. 45, F4
        shl     eax, 4                                  ; 2B81 _ C1. E0, 04
        add     eax, timer_control                      ; 2B84 _ 05, 000002A0(d)
        mov     eax, dword [eax+4H]                     ; 2B89 _ 8B. 40, 04
        test    eax, eax                                ; 2B8C _ 85. C0
        jnz     ?_156                                   ; 2B8E _ 75, 3E
        mov     eax, dword [ebp-0CH]                    ; 2B90 _ 8B. 45, F4
        shl     eax, 4                                  ; 2B93 _ C1. E0, 04
        add     eax, timer_control                      ; 2B96 _ 05, 000002A0(d)
        mov     dword [eax+8H], 1                       ; 2B9B _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 2BA2 _ 8B. 45, F4
        shl     eax, 4                                  ; 2BA5 _ C1. E0, 04
        add     eax, timer_control                      ; 2BA8 _ 05, 000002A0(d)
        movzx   eax, byte [eax+10H]                     ; 2BAD _ 0F B6. 40, 10
        movzx   edx, al                                 ; 2BB1 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 2BB4 _ 8B. 45, F4
        shl     eax, 4                                  ; 2BB7 _ C1. E0, 04
        add     eax, timer_control                      ; 2BBA _ 05, 000002A0(d)
        mov     eax, dword [eax+0CH]                    ; 2BBF _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 2BC2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2BC6 _ 89. 04 24
        call    fifo8_put                               ; 2BC9 _ E8, FFFFFFFC(rel)
?_156:  add     dword [ebp-0CH], 1                      ; 2BCE _ 83. 45, F4, 01
?_157:  cmp     dword [ebp-0CH], 499                    ; 2BD2 _ 81. 7D, F4, 000001F3
        jle     ?_155                                   ; 2BD9 _ 0F 8E, FFFFFF6D
        leave                                           ; 2BDF _ C9
        ret                                             ; 2BE0 _ C3
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


