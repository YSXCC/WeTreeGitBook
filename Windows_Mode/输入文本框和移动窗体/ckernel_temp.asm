; Disassembly of file: ckernel.o
; Thu Feb 20 11:32:21 2020
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
global make_textbox: function
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
extern mouse_send_info                                  ; dword
extern io_sti                                           ; near
extern keybuf                                           ; byte
extern keytable                                         ; byte
extern io_store_eflags                                  ; near
extern mouse_cursor_buf                                 ; byte
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
        mov     eax, dword [memman]                     ; 0031 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0036 _ 89. 04 24
        call    memman_init                             ; 0039 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 003E _ A1, 00000000(d)
        mov     dword [esp+8H], 1072594944              ; 0043 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 17301504                ; 004B _ C7. 44 24, 04, 01080000
        mov     dword [esp], eax                        ; 0053 _ 89. 04 24
        call    memman_free                             ; 0056 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], 0                      ; 005B _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 0                      ; 0062 _ C7. 45, D0, 00000000
        mov     eax, dword [memman]                     ; 0069 _ A1, 00000000(d)
        mov     edx, dword [ebp-38H]                    ; 006E _ 8B. 55, C8
        mov     dword [esp+0CH], edx                    ; 0071 _ 89. 54 24, 0C
        mov     edx, dword [ebp-3CH]                    ; 0075 _ 8B. 55, C4
        mov     dword [esp+8H], edx                     ; 0078 _ 89. 54 24, 08
        mov     edx, dword [ebp-40H]                    ; 007C _ 8B. 55, C0
        mov     dword [esp+4H], edx                     ; 007F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0083 _ 89. 04 24
        call    sheet_control_init                      ; 0086 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 008B _ 89. 45, D4
        mov     eax, dword [ebp-2CH]                    ; 008E _ 8B. 45, D4
        mov     dword [esp], eax                        ; 0091 _ 89. 04 24
        call    sheet_alloc                             ; 0094 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 0099 _ 89. 45, CC
        mov     eax, dword [ebp-2CH]                    ; 009C _ 8B. 45, D4
        mov     dword [esp], eax                        ; 009F _ 89. 04 24
        call    sheet_alloc                             ; 00A2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 00A7 _ 89. 45, D0
        mov     eax, dword [ebp-3CH]                    ; 00AA _ 8B. 45, C4
        imul    eax, dword [ebp-38H]                    ; 00AD _ 0F AF. 45, C8
        mov     edx, eax                                ; 00B1 _ 89. C2
        mov     eax, dword [memman]                     ; 00B3 _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 00B8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00BC _ 89. 04 24
        call    memman_alloc_4k                         ; 00BF _ E8, FFFFFFFC(rel)
        mov     dword [back_buf], eax                   ; 00C4 _ A3, 00000000(d)
        mov     eax, dword [back_buf]                   ; 00C9 _ A1, 00000000(d)
        mov     dword [esp+10H], 99                     ; 00CE _ C7. 44 24, 10, 00000063
        mov     edx, dword [ebp-38H]                    ; 00D6 _ 8B. 55, C8
        mov     dword [esp+0CH], edx                    ; 00D9 _ 89. 54 24, 0C
        mov     edx, dword [ebp-3CH]                    ; 00DD _ 8B. 55, C4
        mov     dword [esp+8H], edx                     ; 00E0 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 00E4 _ 89. 44 24, 04
        mov     eax, dword [ebp-34H]                    ; 00E8 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 00EB _ 89. 04 24
        call    sheet_setbuf                            ; 00EE _ E8, FFFFFFFC(rel)
        mov     dword [esp+10H], 99                     ; 00F3 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 16                     ; 00FB _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 16                      ; 0103 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], mouse_cursor_buf        ; 010B _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-30H]                    ; 0113 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0116 _ 89. 04 24
        call    sheet_setbuf                            ; 0119 _ E8, FFFFFFFC(rel)
        call    init_mouse_position                     ; 011E _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 0123 _ E8, FFFFFFFC(rel)
        call    init_fifo_buf                           ; 0128 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 012D _ E8, FFFFFFFC(rel)
        call    get_timer_control                       ; 0132 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 0137 _ 89. 45, D8
        call    init_time_port                          ; 013A _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf1.1652          ; 013F _ C7. 44 24, 08, 00000018(d)
        mov     dword [esp+4H], 8                       ; 0147 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1649            ; 014F _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0156 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 015B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 0160 _ 89. 45, DC
        mov     dword [esp+8H], 1                       ; 0163 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1649         ; 016B _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-24H]                    ; 0173 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0176 _ 89. 04 24
        call    timer_init                              ; 0179 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 500                     ; 017E _ C7. 44 24, 04, 000001F4
        mov     eax, dword [ebp-24H]                    ; 0186 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 0189 _ 89. 04 24
        call    timer_settime                           ; 018C _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf2.1653          ; 0191 _ C7. 44 24, 08, 00000038(d)
        mov     dword [esp+4H], 8                       ; 0199 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1650            ; 01A1 _ C7. 04 24, 00000020(d)
        call    fifo8_init                              ; 01A8 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01AD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 01B2 _ 89. 45, E0
        mov     dword [esp+8H], 1                       ; 01B5 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1650         ; 01BD _ C7. 44 24, 04, 00000020(d)
        mov     eax, dword [ebp-20H]                    ; 01C5 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 01C8 _ 89. 04 24
        call    timer_init                              ; 01CB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01D0 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-20H]                    ; 01D8 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 01DB _ 89. 04 24
        call    timer_settime                           ; 01DE _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf3.1654          ; 01E3 _ C7. 44 24, 08, 00000058(d)
        mov     dword [esp+4H], 8                       ; 01EB _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1651            ; 01F3 _ C7. 04 24, 00000040(d)
        call    fifo8_init                              ; 01FA _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01FF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 0204 _ 89. 45, E4
        mov     dword [esp+8H], 1                       ; 0207 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1651         ; 020F _ C7. 44 24, 04, 00000040(d)
        mov     eax, dword [ebp-1CH]                    ; 0217 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 021A _ 89. 04 24
        call    timer_init                              ; 021D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 0222 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-1CH]                    ; 022A _ 8B. 45, E4
        mov     dword [esp], eax                        ; 022D _ 89. 04 24
        call    timer_settime                           ; 0230 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 0235 _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 023A _ A1, 00000000(d)
        mov     edx, dword [ebp-38H]                    ; 023F _ 8B. 55, C8
        mov     dword [esp+8H], edx                     ; 0242 _ 89. 54 24, 08
        mov     edx, dword [ebp-3CH]                    ; 0246 _ 8B. 55, C4
        mov     dword [esp+4H], edx                     ; 0249 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 024D _ 89. 04 24
        call    init_desktop                            ; 0250 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 99                      ; 0255 _ C7. 44 24, 04, 00000063
        mov     dword [esp], mouse_cursor_buf           ; 025D _ C7. 04 24, 00000000(d)
        call    init_mouse_cursor                       ; 0264 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0269 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0271 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-34H]                    ; 0279 _ 8B. 45, CC
        mov     dword [esp+4H], eax                     ; 027C _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 0280 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 0283 _ 89. 04 24
        call    sheet_slide                             ; 0286 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 028B _ 8B. 15, 00000000(d)
        mov     eax, dword [mouse_x]                    ; 0291 _ A1, 00000000(d)
        mov     dword [esp+0CH], edx                    ; 0296 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 029A _ 89. 44 24, 08
        mov     eax, dword [ebp-30H]                    ; 029E _ 8B. 45, D0
        mov     dword [esp+4H], eax                     ; 02A1 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 02A5 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 02A8 _ 89. 04 24
        call    sheet_slide                             ; 02AB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], ?_159                   ; 02B0 _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-2CH]                    ; 02B8 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 02BB _ 89. 04 24
        call    message_box                             ; 02BE _ E8, FFFFFFFC(rel)
        mov     dword [sheet_win], eax                  ; 02C3 _ A3, 00000000(d)
        mov     dword [esp+8H], 0                       ; 02C8 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-34H]                    ; 02D0 _ 8B. 45, CC
        mov     dword [esp+4H], eax                     ; 02D3 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 02D7 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 02DA _ 89. 04 24
        call    sheet_updown                            ; 02DD _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 100                     ; 02E2 _ C7. 44 24, 08, 00000064
        mov     eax, dword [ebp-30H]                    ; 02EA _ 8B. 45, D0
        mov     dword [esp+4H], eax                     ; 02ED _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 02F1 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 02F4 _ 89. 04 24
        call    sheet_updown                            ; 02F7 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 02FC _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], 0                      ; 0301 _ C7. 45, E8, 00000000
        mov     dword [ebp-14H], 0                      ; 0308 _ C7. 45, EC, 00000000
        mov     dword [ebp-10H], 0                      ; 030F _ C7. 45, F0, 00000000
        mov     dword [ebp-48H], 8                      ; 0316 _ C7. 45, B8, 00000008
        mov     dword [ebp-44H], 7                      ; 031D _ C7. 45, BC, 00000007
?_001:  call    io_cli                                  ; 0324 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0329 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0330 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 0335 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 0337 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 033E _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0343 _ 01. C3
        mov     dword [esp], timerinfo1.1649            ; 0345 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 034C _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0351 _ 01. C3
        mov     dword [esp], timerinfo2.1650            ; 0353 _ C7. 04 24, 00000020(d)
        call    fifo8_status                            ; 035A _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 035F _ 01. C3
        mov     dword [esp], timerinfo3.1651            ; 0361 _ C7. 04 24, 00000040(d)
        call    fifo8_status                            ; 0368 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 036D _ 01. D8
        test    eax, eax                                ; 036F _ 85. C0
        jnz     ?_002                                   ; 0371 _ 75, 0A
        call    io_sti                                  ; 0373 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0378 _ E9, 00000386

?_002:  mov     dword [esp], keyinfo                    ; 037D _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0384 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0389 _ 85. C0
        je      ?_004                                   ; 038B _ 0F 84, 0000018D
        call    io_sti                                  ; 0391 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0396 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 039D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 03A2 _ 89. 45, E8
        cmp     dword [ebp-18H], 128                    ; 03A5 _ 81. 7D, E8, 00000080
        jle     ?_003                                   ; 03AC _ 7E, 05
        jmp     ?_010                                   ; 03AE _ E9, 00000350

?_003:  cmp     dword [ebp-18H], 28                     ; 03B3 _ 83. 7D, E8, 1C
        je      ?_010                                   ; 03B7 _ 0F 84, 00000346
        mov     eax, dword [ebp-18H]                    ; 03BD _ 8B. 45, E8
        add     eax, keytable                           ; 03C0 _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 03C5 _ 0F B6. 00
        test    al, al                                  ; 03C8 _ 84. C0
        je      ?_010                                   ; 03CA _ 0F 84, 00000333
        cmp     dword [ebp-48H], 143                    ; 03D0 _ 81. 7D, B8, 0000008F
        jg      ?_010                                   ; 03D7 _ 0F 8F, 00000326
        mov     eax, dword [ebp-48H]                    ; 03DD _ 8B. 45, B8
        lea     ecx, [eax+7H]                           ; 03E0 _ 8D. 48, 07
        mov     eax, dword [sheet_win]                  ; 03E3 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 03E8 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 03EB _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 03F0 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 03F2 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 03FA _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 03FE _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-48H]                    ; 0406 _ 8B. 4D, B8
        mov     dword [esp+0CH], ecx                    ; 0409 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 040D _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 0415 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0419 _ 89. 04 24
        call    paint_rectangle                         ; 041C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-48H]                    ; 0421 _ 8B. 45, B8
        lea     edx, [eax+8H]                           ; 0424 _ 8D. 50, 08
        mov     eax, dword [sheet_win]                  ; 0427 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 042C _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], edx                    ; 0434 _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 0438 _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-48H]                    ; 0440 _ 8B. 55, B8
        mov     dword [esp+8H], edx                     ; 0443 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 0447 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 044B _ 8B. 45, D4
        mov     dword [esp], eax                        ; 044E _ 89. 04 24
        call    sheet_refresh                           ; 0451 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 0456 _ 8B. 45, E8
        add     eax, keytable                           ; 0459 _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 045E _ 0F B6. 00
        mov     byte [ebp-4AH], al                      ; 0461 _ 88. 45, B6
        mov     byte [ebp-49H], 0                       ; 0464 _ C6. 45, B7, 00
        mov     eax, dword [sheet_win]                  ; 0468 _ A1, 00000000(d)
        mov     dword [esp+14H], 0                      ; 046D _ C7. 44 24, 14, 00000000
        lea     edx, [ebp-4AH]                          ; 0475 _ 8D. 55, B6
        mov     dword [esp+10H], edx                    ; 0478 _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 047C _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-48H]                    ; 0484 _ 8B. 55, B8
        mov     dword [esp+8H], edx                     ; 0487 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 048B _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 048F _ 8B. 45, D4
        mov     dword [esp], eax                        ; 0492 _ 89. 04 24
        call    paint_string                            ; 0495 _ E8, FFFFFFFC(rel)
        add     dword [ebp-48H], 8                      ; 049A _ 83. 45, B8, 08
        mov     eax, dword [ebp-48H]                    ; 049E _ 8B. 45, B8
        lea     ebx, [eax+7H]                           ; 04A1 _ 8D. 58, 07
        mov     eax, dword [ebp-44H]                    ; 04A4 _ 8B. 45, BC
        movzx   ecx, al                                 ; 04A7 _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 04AA _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 04AF _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 04B2 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 04B7 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 04B9 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 04C1 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 04C5 _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-48H]                    ; 04CD _ 8B. 5D, B8
        mov     dword [esp+0CH], ebx                    ; 04D0 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 04D4 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 04D8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04DC _ 89. 04 24
        call    paint_rectangle                         ; 04DF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-48H]                    ; 04E4 _ 8B. 45, B8
        lea     edx, [eax+8H]                           ; 04E7 _ 8D. 50, 08
        mov     eax, dword [sheet_win]                  ; 04EA _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 04EF _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], edx                    ; 04F7 _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 04FB _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-48H]                    ; 0503 _ 8B. 55, B8
        mov     dword [esp+8H], edx                     ; 0506 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 050A _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 050E _ 8B. 45, D4
        mov     dword [esp], eax                        ; 0511 _ 89. 04 24
        call    sheet_refresh                           ; 0514 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0519 _ E9, FFFFFE06

?_004:  mov     dword [esp], mouseinfo                  ; 051E _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0525 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 052A _ 85. C0
        jz      ?_005                                   ; 052C _ 74, 1E
        mov     eax, dword [ebp-30H]                    ; 052E _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 0531 _ 89. 44 24, 08
        mov     eax, dword [ebp-34H]                    ; 0535 _ 8B. 45, CC
        mov     dword [esp+4H], eax                     ; 0538 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 053C _ 8B. 45, D4
        mov     dword [esp], eax                        ; 053F _ 89. 04 24
        call    show_mouse_info                         ; 0542 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0547 _ E9, 000001B7

?_005:  mov     dword [esp], timerinfo1.1649            ; 054C _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0553 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0558 _ 85. C0
        jz      ?_006                                   ; 055A _ 74, 48
        call    io_sti                                  ; 055C _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1649            ; 0561 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0568 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 056D _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_160                  ; 0575 _ C7. 44 24, 10, 00000007(d)
        mov     dword [esp+0CH], 0                      ; 057D _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0585 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-34H]                    ; 058D _ 8B. 45, CC
        mov     dword [esp+4H], eax                     ; 0590 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 0594 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 0597 _ 89. 04 24
        call    paint_string                            ; 059A _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 059F _ E9, 0000015F

?_006:  mov     dword [esp], timerinfo2.1650            ; 05A4 _ C7. 04 24, 00000020(d)
        call    fifo8_status                            ; 05AB _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 05B0 _ 85. C0
        jz      ?_007                                   ; 05B2 _ 74, 48
        call    io_sti                                  ; 05B4 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1650            ; 05B9 _ C7. 04 24, 00000020(d)
        call    fifo8_get                               ; 05C0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 05C5 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_161                  ; 05CD _ C7. 44 24, 10, 0000000F(d)
        mov     dword [esp+0CH], 32                     ; 05D5 _ C7. 44 24, 0C, 00000020
        mov     dword [esp+8H], 0                       ; 05DD _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-34H]                    ; 05E5 _ 8B. 45, CC
        mov     dword [esp+4H], eax                     ; 05E8 _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 05EC _ 8B. 45, D4
        mov     dword [esp], eax                        ; 05EF _ 89. 04 24
        call    paint_string                            ; 05F2 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 05F7 _ E9, 00000107

?_007:  mov     dword [esp], timerinfo3.1651            ; 05FC _ C7. 04 24, 00000040(d)
        call    fifo8_status                            ; 0603 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0608 _ 85. C0
        je      ?_010                                   ; 060A _ 0F 84, 000000F3
        mov     dword [esp], timerinfo3.1651            ; 0610 _ C7. 04 24, 00000040(d)
        call    fifo8_get                               ; 0617 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 061C _ 89. 45, F4
        call    io_sti                                  ; 061F _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 0624 _ 83. 7D, F4, 00
        jz      ?_008                                   ; 0628 _ 74, 24
        mov     dword [esp+8H], 0                       ; 062A _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1651         ; 0632 _ C7. 44 24, 04, 00000040(d)
        mov     eax, dword [ebp-1CH]                    ; 063A _ 8B. 45, E4
        mov     dword [esp], eax                        ; 063D _ 89. 04 24
        call    timer_init                              ; 0640 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-44H], 0                      ; 0645 _ C7. 45, BC, 00000000
        jmp     ?_009                                   ; 064C _ EB, 22

?_008:  mov     dword [esp+8H], 1                       ; 064E _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1651         ; 0656 _ C7. 44 24, 04, 00000040(d)
        mov     eax, dword [ebp-1CH]                    ; 065E _ 8B. 45, E4
        mov     dword [esp], eax                        ; 0661 _ 89. 04 24
        call    timer_init                              ; 0664 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-44H], 7                      ; 0669 _ C7. 45, BC, 00000007
?_009:  mov     dword [esp+4H], 50                      ; 0670 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-1CH]                    ; 0678 _ 8B. 45, E4
        mov     dword [esp], eax                        ; 067B _ 89. 04 24
        call    timer_settime                           ; 067E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-48H]                    ; 0683 _ 8B. 45, B8
        lea     ebx, [eax+7H]                           ; 0686 _ 8D. 58, 07
        mov     eax, dword [ebp-44H]                    ; 0689 _ 8B. 45, BC
        movzx   ecx, al                                 ; 068C _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 068F _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 0694 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 0697 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 069C _ 8B. 00
        mov     dword [esp+18H], 43                     ; 069E _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 06A6 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 06AA _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-48H]                    ; 06B2 _ 8B. 5D, B8
        mov     dword [esp+0CH], ebx                    ; 06B5 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 06B9 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 06BD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 06C1 _ 89. 04 24
        call    paint_rectangle                         ; 06C4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-48H]                    ; 06C9 _ 8B. 45, B8
        lea     edx, [eax+8H]                           ; 06CC _ 8D. 50, 08
        mov     eax, dword [sheet_win]                  ; 06CF _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 06D4 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], edx                    ; 06DC _ 89. 54 24, 10
        mov     dword [esp+0CH], 28                     ; 06E0 _ C7. 44 24, 0C, 0000001C
        mov     edx, dword [ebp-48H]                    ; 06E8 _ 8B. 55, B8
        mov     dword [esp+8H], edx                     ; 06EB _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 06EF _ 89. 44 24, 04
        mov     eax, dword [ebp-2CH]                    ; 06F3 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 06F6 _ 89. 04 24
        call    sheet_refresh                           ; 06F9 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 06FE _ E9, FFFFFC21

?_010:  jmp     ?_001                                   ; 0703 _ E9, FFFFFC1C
; CMain End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0708 _ 55
        mov     ebp, esp                                ; 0709 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 070B _ A1, 00000000(d)
        mov     edx, eax                                ; 0710 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0712 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0715 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0717 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 071A _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0720 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 0723 _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 0729 _ 5D
        ret                                             ; 072A _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 072B _ 55
        mov     ebp, esp                                ; 072C _ 89. E5
        sub     esp, 24                                 ; 072E _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1622          ; 0731 _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 15                      ; 0739 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 0741 _ C7. 04 24, 00000000
        call    set_palette                             ; 0748 _ E8, FFFFFFFC(rel)
        nop                                             ; 074D _ 90
        leave                                           ; 074E _ C9
        ret                                             ; 074F _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0750 _ 55
        mov     ebp, esp                                ; 0751 _ 89. E5
        sub     esp, 40                                 ; 0753 _ 83. EC, 28
        call    io_load_eflags                          ; 0756 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 075B _ 89. 45, F4
        call    io_cli                                  ; 075E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0763 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 0766 _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 076A _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0771 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0776 _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0779 _ 89. 45, F0
        jmp     ?_012                                   ; 077C _ EB, 62

?_011:  mov     eax, dword [ebp+10H]                    ; 077E _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0781 _ 0F B6. 00
        shr     al, 2                                   ; 0784 _ C0. E8, 02
        movzx   eax, al                                 ; 0787 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 078A _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 078E _ C7. 04 24, 000003C9
        call    io_out8                                 ; 0795 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 079A _ 8B. 45, 10
        add     eax, 1                                  ; 079D _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 07A0 _ 0F B6. 00
        shr     al, 2                                   ; 07A3 _ C0. E8, 02
        movzx   eax, al                                 ; 07A6 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 07A9 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 07AD _ C7. 04 24, 000003C9
        call    io_out8                                 ; 07B4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 07B9 _ 8B. 45, 10
        add     eax, 2                                  ; 07BC _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 07BF _ 0F B6. 00
        shr     al, 2                                   ; 07C2 _ C0. E8, 02
        movzx   eax, al                                 ; 07C5 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 07C8 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 07CC _ C7. 04 24, 000003C9
        call    io_out8                                 ; 07D3 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 07D8 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 07DC _ 83. 45, F0, 01
?_012:  mov     eax, dword [ebp-10H]                    ; 07E0 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 07E3 _ 3B. 45, 0C
        jle     ?_011                                   ; 07E6 _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 07E8 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 07EB _ 89. 04 24
        call    io_store_eflags                         ; 07EE _ E8, FFFFFFFC(rel)
        nop                                             ; 07F3 _ 90
        leave                                           ; 07F4 _ C9
        ret                                             ; 07F5 _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 07F6 _ 55
        mov     ebp, esp                                ; 07F7 _ 89. E5
        sub     esp, 20                                 ; 07F9 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 07FC _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 07FF _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0802 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0805 _ 89. 45, FC
        jmp     ?_016                                   ; 0808 _ EB, 33

?_013:  mov     eax, dword [ebp+14H]                    ; 080A _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 080D _ 89. 45, F8
        jmp     ?_015                                   ; 0810 _ EB, 1F

?_014:  mov     eax, dword [ebp-4H]                     ; 0812 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0815 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0819 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 081B _ 8B. 45, F8
        add     eax, edx                                ; 081E _ 01. D0
        mov     edx, eax                                ; 0820 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0822 _ 8B. 45, 08
        add     edx, eax                                ; 0825 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0827 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 082B _ 88. 02
        add     dword [ebp-8H], 1                       ; 082D _ 83. 45, F8, 01
?_015:  mov     eax, dword [ebp-8H]                     ; 0831 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0834 _ 3B. 45, 1C
        jle     ?_014                                   ; 0837 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0839 _ 83. 45, FC, 01
?_016:  mov     eax, dword [ebp-4H]                     ; 083D _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0840 _ 3B. 45, 20
        jle     ?_013                                   ; 0843 _ 7E, C5
        leave                                           ; 0845 _ C9
        ret                                             ; 0846 _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0847 _ 55
        mov     ebp, esp                                ; 0848 _ 89. E5
        push    ebx                                     ; 084A _ 53
        sub     esp, 28                                 ; 084B _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 084E _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0851 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0854 _ 8B. 45, 0C
        sub     eax, 1                                  ; 0857 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 085A _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 085E _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0862 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 086A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0872 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 087A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 087D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0881 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0884 _ 89. 04 24
        call    paint_rectangle                         ; 0887 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 088C _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 088F _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0892 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0895 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0898 _ 8B. 45, 10
        sub     eax, 28                                 ; 089B _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 089E _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 08A2 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 08A6 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 08AA _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 08B2 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 08BA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 08BD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 08C1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 08C4 _ 89. 04 24
        call    paint_rectangle                         ; 08C7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 08CC _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 08CF _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 08D2 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 08D5 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 08D8 _ 8B. 45, 10
        sub     eax, 27                                 ; 08DB _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 08DE _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 08E2 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 08E6 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 08EA _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 08F2 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 08FA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 08FD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0901 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0904 _ 89. 04 24
        call    paint_rectangle                         ; 0907 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 090C _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 090F _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0912 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0915 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0918 _ 8B. 45, 10
        sub     eax, 26                                 ; 091B _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 091E _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0922 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0926 _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 092A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0932 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 093A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 093D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0941 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0944 _ 89. 04 24
        call    paint_rectangle                         ; 0947 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 094C _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 094F _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0952 _ 8B. 45, 10
        sub     eax, 24                                 ; 0955 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0958 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 095C _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0964 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0968 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0970 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0978 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 097B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 097F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0982 _ 89. 04 24
        call    paint_rectangle                         ; 0985 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 098A _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 098D _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0990 _ 8B. 45, 10
        sub     eax, 24                                 ; 0993 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0996 _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 099A _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 09A2 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 09A6 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 09AE _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 09B6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 09B9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 09BD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 09C0 _ 89. 04 24
        call    paint_rectangle                         ; 09C3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 09C8 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 09CB _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 09CE _ 8B. 45, 10
        sub     eax, 4                                  ; 09D1 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 09D4 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 09D8 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 09E0 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 09E4 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 09EC _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 09F4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 09F7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 09FB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 09FE _ 89. 04 24
        call    paint_rectangle                         ; 0A01 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0A06 _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0A09 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0A0C _ 8B. 45, 10
        sub     eax, 23                                 ; 0A0F _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0A12 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0A16 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0A1E _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0A22 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0A2A _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0A32 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A35 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A39 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A3C _ 89. 04 24
        call    paint_rectangle                         ; 0A3F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0A44 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0A47 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0A4A _ 8B. 45, 10
        sub     eax, 3                                  ; 0A4D _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0A50 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0A54 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0A5C _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0A60 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0A68 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0A70 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A73 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A77 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A7A _ 89. 04 24
        call    paint_rectangle                         ; 0A7D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0A82 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0A85 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0A88 _ 8B. 45, 10
        sub     eax, 24                                 ; 0A8B _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0A8E _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 0A92 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0A9A _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 0A9E _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0AA6 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0AAE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0AB1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0AB5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0AB8 _ 89. 04 24
        call    paint_rectangle                         ; 0ABB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0AC0 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0AC3 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0AC6 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0AC9 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0ACC _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0ACF _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0AD2 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0AD5 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0AD8 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0ADC _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0AE0 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0AE4 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0AE8 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0AF0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0AF3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0AF7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0AFA _ 89. 04 24
        call    paint_rectangle                         ; 0AFD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B02 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0B05 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0B08 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0B0B _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0B0E _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0B11 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0B14 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0B17 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0B1A _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0B1E _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0B22 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0B26 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0B2A _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0B32 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0B35 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0B39 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0B3C _ 89. 04 24
        call    paint_rectangle                         ; 0B3F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B44 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0B47 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0B4A _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0B4D _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0B50 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0B53 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0B56 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0B59 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0B5C _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0B60 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0B64 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0B68 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0B6C _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0B74 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0B77 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0B7B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0B7E _ 89. 04 24
        call    paint_rectangle                         ; 0B81 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B86 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0B89 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0B8C _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0B8F _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0B92 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0B95 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0B98 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0B9B _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 0B9E _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0BA2 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0BA6 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0BAA _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0BAE _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0BB6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0BB9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0BBD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0BC0 _ 89. 04 24
        call    paint_rectangle                         ; 0BC3 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0BC8 _ 83. C4, 1C
        pop     ebx                                     ; 0BCB _ 5B
        pop     ebp                                     ; 0BCC _ 5D
        ret                                             ; 0BCD _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 0BCE _ 55
        mov     ebp, esp                                ; 0BCF _ 89. E5
        sub     esp, 16                                 ; 0BD1 _ 83. EC, 10
        movzx   eax, word [?_171]                       ; 0BD4 _ 0F B7. 05, 00000064(d)
        cwde                                            ; 0BDB _ 98
        mov     dword [ebp-8H], eax                     ; 0BDC _ 89. 45, F8
        movzx   eax, word [?_172]                       ; 0BDF _ 0F B7. 05, 00000066(d)
        cwde                                            ; 0BE6 _ 98
        mov     dword [ebp-4H], eax                     ; 0BE7 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 0BEA _ 8B. 45, F8
        sub     eax, 16                                 ; 0BED _ 83. E8, 10
        mov     edx, eax                                ; 0BF0 _ 89. C2
        shr     edx, 31                                 ; 0BF2 _ C1. EA, 1F
        add     eax, edx                                ; 0BF5 _ 01. D0
        sar     eax, 1                                  ; 0BF7 _ D1. F8
        mov     dword [mouse_x], eax                    ; 0BF9 _ A3, 00000188(d)
        mov     eax, dword [ebp-4H]                     ; 0BFE _ 8B. 45, FC
        sub     eax, 44                                 ; 0C01 _ 83. E8, 2C
        mov     edx, eax                                ; 0C04 _ 89. C2
        shr     edx, 31                                 ; 0C06 _ C1. EA, 1F
        add     eax, edx                                ; 0C09 _ 01. D0
        sar     eax, 1                                  ; 0C0B _ D1. F8
        mov     dword [mouse_y], eax                    ; 0C0D _ A3, 0000018C(d)
        leave                                           ; 0C12 _ C9
        ret                                             ; 0C13 _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0C14 _ 55
        mov     ebp, esp                                ; 0C15 _ 89. E5
        sub     esp, 20                                 ; 0C17 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 0C1A _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 0C1D _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0C20 _ C7. 45, FC, 00000000
        jmp     ?_026                                   ; 0C27 _ E9, 0000016E

?_017:  mov     edx, dword [ebp-4H]                     ; 0C2C _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 0C2F _ 8B. 45, 18
        add     eax, edx                                ; 0C32 _ 01. D0
        movzx   eax, byte [eax]                         ; 0C34 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0C37 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0C3A _ 0F B6. 45, FB
        test    al, al                                  ; 0C3E _ 84. C0
        jns     ?_018                                   ; 0C40 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0C42 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0C45 _ 8B. 55, 14
        add     eax, edx                                ; 0C48 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0C4A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0C4E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0C50 _ 8B. 45, 10
        add     eax, edx                                ; 0C53 _ 01. D0
        mov     edx, eax                                ; 0C55 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0C57 _ 8B. 45, 08
        add     edx, eax                                ; 0C5A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0C5C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0C60 _ 88. 02
?_018:  movzx   eax, byte [ebp-5H]                      ; 0C62 _ 0F B6. 45, FB
        and     eax, 40H                                ; 0C66 _ 83. E0, 40
        test    eax, eax                                ; 0C69 _ 85. C0
        jz      ?_019                                   ; 0C6B _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0C6D _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0C70 _ 8B. 55, 14
        add     eax, edx                                ; 0C73 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0C75 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0C79 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0C7B _ 8B. 45, 10
        add     eax, edx                                ; 0C7E _ 01. D0
        lea     edx, [eax+1H]                           ; 0C80 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0C83 _ 8B. 45, 08
        add     edx, eax                                ; 0C86 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0C88 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0C8C _ 88. 02
?_019:  movzx   eax, byte [ebp-5H]                      ; 0C8E _ 0F B6. 45, FB
        and     eax, 20H                                ; 0C92 _ 83. E0, 20
        test    eax, eax                                ; 0C95 _ 85. C0
        jz      ?_020                                   ; 0C97 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0C99 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0C9C _ 8B. 55, 14
        add     eax, edx                                ; 0C9F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0CA1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0CA5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0CA7 _ 8B. 45, 10
        add     eax, edx                                ; 0CAA _ 01. D0
        lea     edx, [eax+2H]                           ; 0CAC _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0CAF _ 8B. 45, 08
        add     edx, eax                                ; 0CB2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0CB4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0CB8 _ 88. 02
?_020:  movzx   eax, byte [ebp-5H]                      ; 0CBA _ 0F B6. 45, FB
        and     eax, 10H                                ; 0CBE _ 83. E0, 10
        test    eax, eax                                ; 0CC1 _ 85. C0
        jz      ?_021                                   ; 0CC3 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0CC5 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0CC8 _ 8B. 55, 14
        add     eax, edx                                ; 0CCB _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0CCD _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0CD1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0CD3 _ 8B. 45, 10
        add     eax, edx                                ; 0CD6 _ 01. D0
        lea     edx, [eax+3H]                           ; 0CD8 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0CDB _ 8B. 45, 08
        add     edx, eax                                ; 0CDE _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0CE0 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0CE4 _ 88. 02
?_021:  movzx   eax, byte [ebp-5H]                      ; 0CE6 _ 0F B6. 45, FB
        and     eax, 08H                                ; 0CEA _ 83. E0, 08
        test    eax, eax                                ; 0CED _ 85. C0
        jz      ?_022                                   ; 0CEF _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0CF1 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0CF4 _ 8B. 55, 14
        add     eax, edx                                ; 0CF7 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0CF9 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0CFD _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0CFF _ 8B. 45, 10
        add     eax, edx                                ; 0D02 _ 01. D0
        lea     edx, [eax+4H]                           ; 0D04 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0D07 _ 8B. 45, 08
        add     edx, eax                                ; 0D0A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0D0C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0D10 _ 88. 02
?_022:  movzx   eax, byte [ebp-5H]                      ; 0D12 _ 0F B6. 45, FB
        and     eax, 04H                                ; 0D16 _ 83. E0, 04
        test    eax, eax                                ; 0D19 _ 85. C0
        jz      ?_023                                   ; 0D1B _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0D1D _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0D20 _ 8B. 55, 14
        add     eax, edx                                ; 0D23 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0D25 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0D29 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0D2B _ 8B. 45, 10
        add     eax, edx                                ; 0D2E _ 01. D0
        lea     edx, [eax+5H]                           ; 0D30 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0D33 _ 8B. 45, 08
        add     edx, eax                                ; 0D36 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0D38 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0D3C _ 88. 02
?_023:  movzx   eax, byte [ebp-5H]                      ; 0D3E _ 0F B6. 45, FB
        and     eax, 02H                                ; 0D42 _ 83. E0, 02
        test    eax, eax                                ; 0D45 _ 85. C0
        jz      ?_024                                   ; 0D47 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0D49 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0D4C _ 8B. 55, 14
        add     eax, edx                                ; 0D4F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0D51 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0D55 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0D57 _ 8B. 45, 10
        add     eax, edx                                ; 0D5A _ 01. D0
        lea     edx, [eax+6H]                           ; 0D5C _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0D5F _ 8B. 45, 08
        add     edx, eax                                ; 0D62 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0D64 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0D68 _ 88. 02
?_024:  movzx   eax, byte [ebp-5H]                      ; 0D6A _ 0F B6. 45, FB
        and     eax, 01H                                ; 0D6E _ 83. E0, 01
        test    eax, eax                                ; 0D71 _ 85. C0
        jz      ?_025                                   ; 0D73 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0D75 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0D78 _ 8B. 55, 14
        add     eax, edx                                ; 0D7B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0D7D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0D81 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0D83 _ 8B. 45, 10
        add     eax, edx                                ; 0D86 _ 01. D0
        lea     edx, [eax+7H]                           ; 0D88 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0D8B _ 8B. 45, 08
        add     edx, eax                                ; 0D8E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0D90 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0D94 _ 88. 02
?_025:  add     dword [ebp-4H], 1                       ; 0D96 _ 83. 45, FC, 01
?_026:  cmp     dword [ebp-4H], 15                      ; 0D9A _ 83. 7D, FC, 0F
        jle     ?_017                                   ; 0D9E _ 0F 8E, FFFFFE88
        leave                                           ; 0DA4 _ C9
        ret                                             ; 0DA5 _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 0DA6 _ 55
        mov     ebp, esp                                ; 0DA7 _ 89. E5
        push    ebx                                     ; 0DA9 _ 53
        sub     esp, 52                                 ; 0DAA _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 0DAD _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 0DB0 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 0DB3 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0DB6 _ 89. 45, F4
        jmp     ?_028                                   ; 0DB9 _ EB, 4B

?_027:  movsx   ecx, byte [ebp-1CH]                     ; 0DBB _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 0DBF _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 0DC2 _ 0F B6. 00
        movsx   eax, al                                 ; 0DC5 _ 0F BE. C0
        shl     eax, 4                                  ; 0DC8 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0DCB _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 0DD1 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 0DD4 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0DD7 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0DDA _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 0DDC _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 0DE0 _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 0DE4 _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 0DE7 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 0DEB _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 0DEE _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0DF2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0DF6 _ 89. 04 24
        call    paint_font                              ; 0DF9 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 0DFE _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 0E02 _ 83. 45, 18, 01
?_028:  mov     eax, dword [ebp+18H]                    ; 0E06 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 0E09 _ 0F B6. 00
        test    al, al                                  ; 0E0C _ 84. C0
        jnz     ?_027                                   ; 0E0E _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 0E10 _ 8B. 45, 14
        add     eax, 16                                 ; 0E13 _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 0E16 _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 0E1A _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 0E1D _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 0E21 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 0E24 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 0E28 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 0E2B _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0E2F _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0E32 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0E36 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0E39 _ 89. 04 24
        call    sheet_refresh                           ; 0E3C _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 0E41 _ 83. C4, 34
        pop     ebx                                     ; 0E44 _ 5B
        pop     ebp                                     ; 0E45 _ 5D
        ret                                             ; 0E46 _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0E47 _ 55
        mov     ebp, esp                                ; 0E48 _ 89. E5
        sub     esp, 20                                 ; 0E4A _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0E4D _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0E50 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 0E53 _ C7. 45, F8, 00000000
        jmp     ?_035                                   ; 0E5A _ E9, 0000009C

?_029:  mov     dword [ebp-4H], 0                       ; 0E5F _ C7. 45, FC, 00000000
        jmp     ?_034                                   ; 0E66 _ E9, 00000082

?_030:  mov     eax, dword [ebp-8H]                     ; 0E6B _ 8B. 45, F8
        shl     eax, 4                                  ; 0E6E _ C1. E0, 04
        mov     edx, eax                                ; 0E71 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0E73 _ 8B. 45, FC
        add     eax, edx                                ; 0E76 _ 01. D0
        add     eax, cursor.1690                        ; 0E78 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 0E7D _ 0F B6. 00
        cmp     al, 42                                  ; 0E80 _ 3C, 2A
        jnz     ?_031                                   ; 0E82 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0E84 _ 8B. 45, F8
        shl     eax, 4                                  ; 0E87 _ C1. E0, 04
        mov     edx, eax                                ; 0E8A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0E8C _ 8B. 45, FC
        add     eax, edx                                ; 0E8F _ 01. D0
        mov     edx, eax                                ; 0E91 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E93 _ 8B. 45, 08
        add     eax, edx                                ; 0E96 _ 01. D0
        mov     byte [eax], 0                           ; 0E98 _ C6. 00, 00
        jmp     ?_033                                   ; 0E9B _ EB, 4C

?_031:  mov     eax, dword [ebp-8H]                     ; 0E9D _ 8B. 45, F8
        shl     eax, 4                                  ; 0EA0 _ C1. E0, 04
        mov     edx, eax                                ; 0EA3 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0EA5 _ 8B. 45, FC
        add     eax, edx                                ; 0EA8 _ 01. D0
        add     eax, cursor.1690                        ; 0EAA _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 0EAF _ 0F B6. 00
        cmp     al, 79                                  ; 0EB2 _ 3C, 4F
        jnz     ?_032                                   ; 0EB4 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0EB6 _ 8B. 45, F8
        shl     eax, 4                                  ; 0EB9 _ C1. E0, 04
        mov     edx, eax                                ; 0EBC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0EBE _ 8B. 45, FC
        add     eax, edx                                ; 0EC1 _ 01. D0
        mov     edx, eax                                ; 0EC3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0EC5 _ 8B. 45, 08
        add     eax, edx                                ; 0EC8 _ 01. D0
        mov     byte [eax], 7                           ; 0ECA _ C6. 00, 07
        jmp     ?_033                                   ; 0ECD _ EB, 1A

?_032:  mov     eax, dword [ebp-8H]                     ; 0ECF _ 8B. 45, F8
        shl     eax, 4                                  ; 0ED2 _ C1. E0, 04
        mov     edx, eax                                ; 0ED5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0ED7 _ 8B. 45, FC
        add     eax, edx                                ; 0EDA _ 01. D0
        mov     edx, eax                                ; 0EDC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0EDE _ 8B. 45, 08
        add     edx, eax                                ; 0EE1 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0EE3 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0EE7 _ 88. 02
?_033:  add     dword [ebp-4H], 1                       ; 0EE9 _ 83. 45, FC, 01
?_034:  cmp     dword [ebp-4H], 15                      ; 0EED _ 83. 7D, FC, 0F
        jle     ?_030                                   ; 0EF1 _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 0EF7 _ 83. 45, F8, 01
?_035:  cmp     dword [ebp-8H], 15                      ; 0EFB _ 83. 7D, F8, 0F
        jle     ?_029                                   ; 0EFF _ 0F 8E, FFFFFF5A
        leave                                           ; 0F05 _ C9
        ret                                             ; 0F06 _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 0F07 _ 55
        mov     ebp, esp                                ; 0F08 _ 89. E5
        sub     esp, 16                                 ; 0F0A _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0F0D _ C7. 45, F8, 00000000
        jmp     ?_039                                   ; 0F14 _ EB, 50

?_036:  mov     dword [ebp-4H], 0                       ; 0F16 _ C7. 45, FC, 00000000
        jmp     ?_038                                   ; 0F1D _ EB, 3B

?_037:  mov     eax, dword [ebp-8H]                     ; 0F1F _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 0F22 _ 8B. 55, 14
        add     eax, edx                                ; 0F25 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0F27 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 0F2B _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 0F2E _ 8B. 4D, 10
        add     edx, ecx                                ; 0F31 _ 01. CA
        add     eax, edx                                ; 0F33 _ 01. D0
        mov     edx, eax                                ; 0F35 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0F37 _ 8B. 45, 08
        add     edx, eax                                ; 0F3A _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 0F3C _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 0F3F _ 0F AF. 45, 18
        mov     ecx, eax                                ; 0F43 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 0F45 _ 8B. 45, FC
        add     eax, ecx                                ; 0F48 _ 01. C8
        mov     ecx, eax                                ; 0F4A _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 0F4C _ 8B. 45, 20
        add     eax, ecx                                ; 0F4F _ 01. C8
        movzx   eax, byte [eax]                         ; 0F51 _ 0F B6. 00
        mov     byte [edx], al                          ; 0F54 _ 88. 02
        add     dword [ebp-4H], 1                       ; 0F56 _ 83. 45, FC, 01
?_038:  mov     eax, dword [ebp-4H]                     ; 0F5A _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 0F5D _ 3B. 45, 18
        jl      ?_037                                   ; 0F60 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 0F62 _ 83. 45, F8, 01
?_039:  mov     eax, dword [ebp-8H]                     ; 0F66 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0F69 _ 3B. 45, 1C
        jl      ?_036                                   ; 0F6C _ 7C, A8
        leave                                           ; 0F6E _ C9
        ret                                             ; 0F6F _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 0F70 _ 55
        mov     ebp, esp                                ; 0F71 _ 89. E5
        sub     esp, 24                                 ; 0F73 _ 83. EC, 18
        mov     dword [esp+8H], mousebuf                ; 0F76 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 0F7E _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 0F86 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0F8D _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], keybuf                  ; 0F92 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 0F9A _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 0FA2 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0FA9 _ E8, FFFFFFFC(rel)
        leave                                           ; 0FAE _ C9
        ret                                             ; 0FAF _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 0FB0 _ 55
        mov     ebp, esp                                ; 0FB1 _ 89. E5
        sub     esp, 40                                 ; 0FB3 _ 83. EC, 28
        mov     eax, dword [ebp+10H]                    ; 0FB6 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 0FB9 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 0FBC _ A1, 00000188(d)
        add     eax, edx                                ; 0FC1 _ 01. D0
        mov     dword [mouse_x], eax                    ; 0FC3 _ A3, 00000188(d)
        mov     eax, dword [ebp+10H]                    ; 0FC8 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 0FCB _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 0FCE _ A1, 0000018C(d)
        add     eax, edx                                ; 0FD3 _ 01. D0
        mov     dword [mouse_y], eax                    ; 0FD5 _ A3, 0000018C(d)
        mov     eax, dword [mouse_x]                    ; 0FDA _ A1, 00000188(d)
        test    eax, eax                                ; 0FDF _ 85. C0
        jns     ?_040                                   ; 0FE1 _ 79, 0A
        mov     dword [mouse_x], 0                      ; 0FE3 _ C7. 05, 00000188(d), 00000000
?_040:  mov     eax, dword [mouse_y]                    ; 0FED _ A1, 0000018C(d)
        test    eax, eax                                ; 0FF2 _ 85. C0
        jns     ?_041                                   ; 0FF4 _ 79, 0A
        mov     dword [mouse_y], 0                      ; 0FF6 _ C7. 05, 0000018C(d), 00000000
?_041:  movzx   eax, word [?_171]                       ; 1000 _ 0F B7. 05, 00000064(d)
        cwde                                            ; 1007 _ 98
        lea     edx, [eax-10H]                          ; 1008 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 100B _ A1, 00000188(d)
        cmp     edx, eax                                ; 1010 _ 39. C2
        jge     ?_042                                   ; 1012 _ 7D, 10
        movzx   eax, word [?_171]                       ; 1014 _ 0F B7. 05, 00000064(d)
        cwde                                            ; 101B _ 98
        sub     eax, 16                                 ; 101C _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 101F _ A3, 00000188(d)
?_042:  movzx   eax, word [?_171]                       ; 1024 _ 0F B7. 05, 00000064(d)
        cwde                                            ; 102B _ 98
        lea     edx, [eax-10H]                          ; 102C _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 102F _ A1, 0000018C(d)
        cmp     edx, eax                                ; 1034 _ 39. C2
        jge     ?_043                                   ; 1036 _ 7D, 10
        movzx   eax, word [?_171]                       ; 1038 _ 0F B7. 05, 00000064(d)
        cwde                                            ; 103F _ 98
        sub     eax, 16                                 ; 1040 _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 1043 _ A3, 0000018C(d)
?_043:  mov     dword [esp+14H], 7                      ; 1048 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_162                  ; 1050 _ C7. 44 24, 10, 00000017(d)
        mov     dword [esp+0CH], 0                      ; 1058 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 1060 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 1068 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 106B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 106F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1072 _ 89. 04 24
        call    paint_string                            ; 1075 _ E8, FFFFFFFC(rel)
        leave                                           ; 107A _ C9
        ret                                             ; 107B _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 107C _ 55
        mov     ebp, esp                                ; 107D _ 89. E5
        sub     esp, 40                                 ; 107F _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 1082 _ C6. 45, F7, 00
        call    io_sti                                  ; 1086 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 108B _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 1092 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 1097 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 109A _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 109E _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 10A2 _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 10A9 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 10AE _ 85. C0
        jz      ?_044                                   ; 10B0 _ 74, 77
        mov     dword [esp+8H], mouse_send_info         ; 10B2 _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 10BA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 10BD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 10C1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 10C4 _ 89. 04 24
        call    compute_mouse_position                  ; 10C7 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 10CC _ 8B. 15, 0000018C(d)
        mov     eax, dword [mouse_x]                    ; 10D2 _ A1, 00000188(d)
        mov     dword [esp+0CH], edx                    ; 10D7 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 10DB _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 10DF _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 10E2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 10E6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 10E9 _ 89. 04 24
        call    sheet_slide                             ; 10EC _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_send_info+0CH]        ; 10F1 _ A1, 0000000C(d)
        and     eax, 01H                                ; 10F6 _ 83. E0, 01
        test    eax, eax                                ; 10F9 _ 85. C0
        jz      ?_044                                   ; 10FB _ 74, 2C
        mov     eax, dword [mouse_y]                    ; 10FD _ A1, 0000018C(d)
        lea     ecx, [eax-8H]                           ; 1102 _ 8D. 48, F8
        mov     eax, dword [mouse_x]                    ; 1105 _ A1, 00000188(d)
        lea     edx, [eax-50H]                          ; 110A _ 8D. 50, B0
        mov     eax, dword [sheet_win]                  ; 110D _ A1, 00000184(d)
        mov     dword [esp+0CH], ecx                    ; 1112 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 1116 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 111A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 111E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1121 _ 89. 04 24
        call    sheet_slide                             ; 1124 _ E8, FFFFFFFC(rel)
?_044:  leave                                           ; 1129 _ C9
        ret                                             ; 112A _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 112B _ 55
        mov     ebp, esp                                ; 112C _ 89. E5
        sub     esp, 88                                 ; 112E _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 1131 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 1138 _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 113F _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 1146 _ A1, 00000060(d)
        mov     dword [ebp-2CH], eax                    ; 114B _ 89. 45, D4
        movzx   eax, word [?_171]                       ; 114E _ 0F B7. 05, 00000064(d)
        cwde                                            ; 1155 _ 98
        mov     dword [ebp-28H], eax                    ; 1156 _ 89. 45, D8
        movzx   eax, word [?_172]                       ; 1159 _ 0F B7. 05, 00000066(d)
        cwde                                            ; 1160 _ 98
        mov     dword [ebp-24H], eax                    ; 1161 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 1164 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1167 _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 1169 _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 116C _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 1170 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 1173 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1177 _ 89. 04 24
        call    init_desktop                            ; 117A _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 117F _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_163                  ; 1187 _ C7. 44 24, 10, 0000002E(d)
        mov     eax, dword [ebp-34H]                    ; 118F _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1192 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1196 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1199 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 119D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 11A0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 11A4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 11A7 _ 89. 04 24
        call    paint_string                            ; 11AA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 11AF _ 8B. 45, 14
        mov     dword [esp], eax                        ; 11B2 _ 89. 04 24
        call    intToHexStr                             ; 11B5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 11BA _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 11BD _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 11C5 _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 11C8 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 11CC _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 11CF _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 11D3 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 11D6 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 11DA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 11DD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 11E1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 11E4 _ 89. 04 24
        call    paint_string                            ; 11E7 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 11EC _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 11F0 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_164                  ; 11F8 _ C7. 44 24, 10, 00000038(d)
        mov     eax, dword [ebp-34H]                    ; 1200 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1203 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1207 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 120A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 120E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1211 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1215 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1218 _ 89. 04 24
        call    paint_string                            ; 121B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1220 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1223 _ 8B. 00
        mov     dword [esp], eax                        ; 1225 _ 89. 04 24
        call    intToHexStr                             ; 1228 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 122D _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 1230 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 1238 _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 123B _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 123F _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1242 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1246 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1249 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 124D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1250 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1254 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1257 _ 89. 04 24
        call    paint_string                            ; 125A _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 125F _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1263 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_165                  ; 126B _ C7. 44 24, 10, 00000044(d)
        mov     eax, dword [ebp-34H]                    ; 1273 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1276 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 127A _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 127D _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1281 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1284 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1288 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 128B _ 89. 04 24
        call    paint_string                            ; 128E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1293 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 1296 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 1299 _ 89. 04 24
        call    intToHexStr                             ; 129C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 12A1 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 12A4 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 12AC _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 12AF _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 12B3 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 12B6 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 12BA _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 12BD _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 12C1 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 12C4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 12C8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 12CB _ 89. 04 24
        call    paint_string                            ; 12CE _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 12D3 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 12D7 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_166                  ; 12DF _ C7. 44 24, 10, 00000050(d)
        mov     eax, dword [ebp-34H]                    ; 12E7 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 12EA _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 12EE _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 12F1 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 12F5 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 12F8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 12FC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 12FF _ 89. 04 24
        call    paint_string                            ; 1302 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1307 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 130A _ 8B. 40, 08
        mov     dword [esp], eax                        ; 130D _ 89. 04 24
        call    intToHexStr                             ; 1310 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 1315 _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 1318 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 1320 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 1323 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1327 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 132A _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 132E _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1331 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1335 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1338 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 133C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 133F _ 89. 04 24
        call    paint_string                            ; 1342 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1347 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 134B _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_167                  ; 1353 _ C7. 44 24, 10, 0000005C(d)
        mov     eax, dword [ebp-34H]                    ; 135B _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 135E _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1362 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1365 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1369 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 136C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1370 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1373 _ 89. 04 24
        call    paint_string                            ; 1376 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 137B _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 137E _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 1381 _ 89. 04 24
        call    intToHexStr                             ; 1384 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1389 _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 138C _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 1394 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 1397 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 139B _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 139E _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 13A2 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 13A5 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 13A9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 13AC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13B0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13B3 _ 89. 04 24
        call    paint_string                            ; 13B6 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 13BB _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 13BF _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_168                  ; 13C7 _ C7. 44 24, 10, 00000069(d)
        mov     eax, dword [ebp-34H]                    ; 13CF _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 13D2 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 13D6 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 13D9 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 13DD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 13E0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13E4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13E7 _ 89. 04 24
        call    paint_string                            ; 13EA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 13EF _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 13F2 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 13F5 _ 89. 04 24
        call    intToHexStr                             ; 13F8 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 13FD _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 1400 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 1408 _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 140B _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 140F _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1412 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1416 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1419 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 141D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1420 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1424 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1427 _ 89. 04 24
        call    paint_string                            ; 142A _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 142F _ 83. 45, CC, 10
        leave                                           ; 1433 _ C9
        ret                                             ; 1434 _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 1435 _ 55
        mov     ebp, esp                                ; 1436 _ 89. E5
        sub     esp, 56                                 ; 1438 _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 143B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 143E _ 89. 04 24
        call    sheet_alloc                             ; 1441 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1446 _ 89. 45, F0
        mov     eax, dword [memman]                     ; 1449 _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 144E _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 1456 _ 89. 04 24
        call    memman_alloc_4k                         ; 1459 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 145E _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 1461 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 1469 _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 1471 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 1479 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 147C _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 1480 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1483 _ 89. 04 24
        call    sheet_setbuf                            ; 1486 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 148B _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 148E _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 1492 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1495 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1499 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 149C _ 89. 04 24
        call    make_windows                            ; 149F _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 14A4 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 14AC _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 14B4 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 14BC _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 14C4 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-10H]                    ; 14CC _ 8B. 45, F0
        mov     dword [esp], eax                        ; 14CF _ 89. 04 24
        call    make_textbox                            ; 14D2 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 72                     ; 14D7 _ C7. 44 24, 0C, 00000048
        mov     dword [esp+8H], 80                      ; 14DF _ C7. 44 24, 08, 00000050
        mov     eax, dword [ebp-10H]                    ; 14E7 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 14EA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14EE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14F1 _ 89. 04 24
        call    sheet_slide                             ; 14F4 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 14F9 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 1501 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1504 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1508 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 150B _ 89. 04 24
        call    sheet_updown                            ; 150E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1513 _ 8B. 45, F0
        leave                                           ; 1516 _ C9
        ret                                             ; 1517 _ C3
; message_box End of function

make_textbox:; Function begin
        push    ebp                                     ; 1518 _ 55
        mov     ebp, esp                                ; 1519 _ 89. E5
        push    edi                                     ; 151B _ 57
        push    esi                                     ; 151C _ 56
        push    ebx                                     ; 151D _ 53
        sub     esp, 44                                 ; 151E _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 1521 _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 1524 _ 8B. 55, 0C
        add     eax, edx                                ; 1527 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1529 _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 152C _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 152F _ 8B. 55, 10
        add     eax, edx                                ; 1532 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1534 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1537 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 153A _ 8D. 78, FD
        mov     eax, dword [ebp-14H]                    ; 153D _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1540 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1543 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1546 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1549 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 154C _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 154F _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1552 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1555 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1558 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 155A _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 155E _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1562 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1566 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 156A _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 1572 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1576 _ 89. 04 24
        call    paint_rectangle                         ; 1579 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 157E _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1581 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 1584 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 1587 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 158A _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 158D _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1590 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1593 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1596 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1599 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 159C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 159F _ 8B. 00
        mov     dword [esp+18H], edi                    ; 15A1 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 15A5 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 15A9 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 15AD _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 15B1 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 15B9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 15BD _ 89. 04 24
        call    paint_rectangle                         ; 15C0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 15C5 _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 15C8 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 15CB _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 15CE _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 15D1 _ 8B. 45, F0
        lea     ebx, [eax+2H]                           ; 15D4 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 15D7 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 15DA _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 15DD _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 15E0 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 15E3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 15E6 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 15E8 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 15EC _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 15F0 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 15F4 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 15F8 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 1600 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1604 _ 89. 04 24
        call    paint_rectangle                         ; 1607 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 160C _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 160F _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 1612 _ 8B. 45, EC
        lea     esi, [eax+2H]                           ; 1615 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 1618 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 161B _ 8D. 58, FD
        mov     eax, dword [ebp-14H]                    ; 161E _ 8B. 45, EC
        lea     ecx, [eax+2H]                           ; 1621 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1624 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1627 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 162A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 162D _ 8B. 00
        mov     dword [esp+18H], edi                    ; 162F _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1633 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1637 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 163B _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 163F _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 1647 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 164B _ 89. 04 24
        call    paint_rectangle                         ; 164E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1653 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 1656 _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 1659 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 165C _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 165F _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1662 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 1665 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1668 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 166B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 166E _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1670 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 1674 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 1677 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 167B _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 167F _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 1683 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 168B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 168F _ 89. 04 24
        call    paint_rectangle                         ; 1692 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 1697 _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 169A _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 169D _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 16A0 _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 16A3 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 16A6 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 16A9 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 16AC _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 16AF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16B2 _ 8B. 00
        mov     ecx, dword [ebp-10H]                    ; 16B4 _ 8B. 4D, F0
        mov     dword [esp+18H], ecx                    ; 16B7 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 16BB _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 16BF _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 16C3 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 16C7 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 16CF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 16D3 _ 89. 04 24
        call    paint_rectangle                         ; 16D6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 16DB _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 16DE _ 8D. 48, 01
        mov     eax, dword [ebp-10H]                    ; 16E1 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 16E4 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 16E7 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 16EA _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 16ED _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 16F0 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 16F3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 16F6 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 16F8 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 16FC _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 16FF _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 1703 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 1707 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 170B _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1713 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1717 _ 89. 04 24
        call    paint_rectangle                         ; 171A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 171F _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1722 _ 8D. 78, 01
        mov     eax, dword [ebp-14H]                    ; 1725 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1728 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 172B _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 172E _ 8D. 58, FE
        mov     eax, dword [ebp-14H]                    ; 1731 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 1734 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1737 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 173A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 173D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1740 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1742 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1746 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 174A _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 174E _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 1752 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 175A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 175E _ 89. 04 24
        call    paint_rectangle                         ; 1761 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1766 _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 1769 _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 176C _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 176F _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 1772 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1775 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1778 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 177B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 177E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1781 _ 8B. 00
        mov     ebx, dword [ebp-10H]                    ; 1783 _ 8B. 5D, F0
        mov     dword [esp+18H], ebx                    ; 1786 _ 89. 5C 24, 18
        mov     ebx, dword [ebp-14H]                    ; 178A _ 8B. 5D, EC
        mov     dword [esp+14H], ebx                    ; 178D _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 1791 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 1795 _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 1799 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 179D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 17A1 _ 89. 04 24
        call    paint_rectangle                         ; 17A4 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 17A9 _ 83. C4, 2C
        pop     ebx                                     ; 17AC _ 5B
        pop     esi                                     ; 17AD _ 5E
        pop     edi                                     ; 17AE _ 5F
        pop     ebp                                     ; 17AF _ 5D
        ret                                             ; 17B0 _ C3
; make_textbox End of function

make_windows:; Function begin
        push    ebp                                     ; 17B1 _ 55
        mov     ebp, esp                                ; 17B2 _ 89. E5
        push    ebx                                     ; 17B4 _ 53
        sub     esp, 68                                 ; 17B5 _ 83. EC, 44
        mov     eax, dword [ebp+0CH]                    ; 17B8 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 17BB _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 17BE _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 17C1 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 17C4 _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 17C7 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 17CA _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 17CD _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 17D0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 17D3 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 17D5 _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 17DD _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 17E1 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 17E9 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 17F1 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 17F9 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 17FC _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1800 _ 89. 04 24
        call    paint_rectangle                         ; 1803 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1808 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 180B _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 180E _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1811 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 1813 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 181B _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 181F _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1827 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 182F _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1837 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 183A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 183E _ 89. 04 24
        call    paint_rectangle                         ; 1841 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1846 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1849 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 184C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 184F _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1851 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 1855 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 185D _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1865 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 186D _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1875 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1878 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 187C _ 89. 04 24
        call    paint_rectangle                         ; 187F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1884 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1887 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 188A _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 188D _ 8B. 00
        mov     dword [esp+18H], edx                    ; 188F _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 1893 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 189B _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 18A3 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 18AB _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 18B3 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 18B6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18BA _ 89. 04 24
        call    paint_rectangle                         ; 18BD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 18C2 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 18C5 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 18C8 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 18CB _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 18CE _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 18D1 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 18D4 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 18D7 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 18D9 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 18DD _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 18E1 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 18E9 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 18ED _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 18F5 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 18F8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18FC _ 89. 04 24
        call    paint_rectangle                         ; 18FF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1904 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1907 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 190A _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 190D _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1910 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1913 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1916 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1919 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 191B _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 191F _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 1923 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 192B _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 192F _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1937 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 193A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 193E _ 89. 04 24
        call    paint_rectangle                         ; 1941 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1946 _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1949 _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 194C _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 194F _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1952 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1955 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1957 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 195B _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 195F _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 1967 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 196F _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1977 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 197A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 197E _ 89. 04 24
        call    paint_rectangle                         ; 1981 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1986 _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1989 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 198C _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 198F _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1991 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1999 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 199D _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 19A5 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 19AD _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 19B5 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 19B8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19BC _ 89. 04 24
        call    paint_rectangle                         ; 19BF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 19C4 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 19C7 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 19CA _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 19CD _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 19D0 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 19D3 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 19D6 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 19D9 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 19DB _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 19DF _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 19E3 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 19E7 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 19EF _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 19F7 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 19FA _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19FE _ 89. 04 24
        call    paint_rectangle                         ; 1A01 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1A06 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1A09 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1A0C _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1A0F _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1A12 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1A15 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1A18 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A1B _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1A1D _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1A21 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1A25 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 1A29 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 1A31 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1A39 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1A3C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A40 _ 89. 04 24
        call    paint_rectangle                         ; 1A43 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1A48 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp+10H]                    ; 1A50 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1A53 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 1A57 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 1A5F _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 1A67 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1A6A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1A6E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1A71 _ 89. 04 24
        call    paint_string                            ; 1A74 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 1A79 _ C7. 45, EC, 00000000
        jmp     ?_052                                   ; 1A80 _ E9, 00000083

?_045:  mov     dword [ebp-18H], 0                      ; 1A85 _ C7. 45, E8, 00000000
        jmp     ?_051                                   ; 1A8C _ EB, 70

?_046:  mov     eax, dword [ebp-14H]                    ; 1A8E _ 8B. 45, EC
        shl     eax, 4                                  ; 1A91 _ C1. E0, 04
        mov     edx, eax                                ; 1A94 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 1A96 _ 8B. 45, E8
        add     eax, edx                                ; 1A99 _ 01. D0
        add     eax, closebtn.1768                      ; 1A9B _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 1AA0 _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 1AA3 _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 1AA6 _ 80. 7D, E7, 40
        jnz     ?_047                                   ; 1AAA _ 75, 06
        mov     byte [ebp-19H], 0                       ; 1AAC _ C6. 45, E7, 00
        jmp     ?_050                                   ; 1AB0 _ EB, 1C

?_047:  cmp     byte [ebp-19H], 36                      ; 1AB2 _ 80. 7D, E7, 24
        jnz     ?_048                                   ; 1AB6 _ 75, 06
        mov     byte [ebp-19H], 15                      ; 1AB8 _ C6. 45, E7, 0F
        jmp     ?_050                                   ; 1ABC _ EB, 10

?_048:  cmp     byte [ebp-19H], 81                      ; 1ABE _ 80. 7D, E7, 51
        jnz     ?_049                                   ; 1AC2 _ 75, 06
        mov     byte [ebp-19H], 8                       ; 1AC4 _ C6. 45, E7, 08
        jmp     ?_050                                   ; 1AC8 _ EB, 04

?_049:  mov     byte [ebp-19H], 7                       ; 1ACA _ C6. 45, E7, 07
?_050:  mov     eax, dword [ebp+0CH]                    ; 1ACE _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1AD1 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 1AD3 _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 1AD6 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1AD9 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1ADC _ 8B. 40, 04
        imul    ecx, eax                                ; 1ADF _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1AE2 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1AE5 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1AE8 _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 1AEB _ 8B. 45, E8
        add     eax, ebx                                ; 1AEE _ 01. D8
        add     eax, ecx                                ; 1AF0 _ 01. C8
        add     edx, eax                                ; 1AF2 _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 1AF4 _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 1AF8 _ 88. 02
        add     dword [ebp-18H], 1                      ; 1AFA _ 83. 45, E8, 01
?_051:  cmp     dword [ebp-18H], 15                     ; 1AFE _ 83. 7D, E8, 0F
        jle     ?_046                                   ; 1B02 _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 1B04 _ 83. 45, EC, 01
?_052:  cmp     dword [ebp-14H], 13                     ; 1B08 _ 83. 7D, EC, 0D
        jle     ?_045                                   ; 1B0C _ 0F 8E, FFFFFF73
        add     esp, 68                                 ; 1B12 _ 83. C4, 44
        pop     ebx                                     ; 1B15 _ 5B
        pop     ebp                                     ; 1B16 _ 5D
        ret                                             ; 1B17 _ C3
; make_windows End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 1B18 _ 55
        mov     ebp, esp                                ; 1B19 _ 89. E5
        sub     esp, 24                                 ; 1B1B _ 83. EC, 18
?_053:  mov     dword [esp], 100                        ; 1B1E _ C7. 04 24, 00000064
        call    io_in8                                  ; 1B25 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 1B2A _ 83. E0, 02
        test    eax, eax                                ; 1B2D _ 85. C0
        jnz     ?_054                                   ; 1B2F _ 75, 02
        jmp     ?_055                                   ; 1B31 _ EB, 02

?_054:  jmp     ?_053                                   ; 1B33 _ EB, E9

?_055:  leave                                           ; 1B35 _ C9
        ret                                             ; 1B36 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 1B37 _ 55
        mov     ebp, esp                                ; 1B38 _ 89. E5
        sub     esp, 24                                 ; 1B3A _ 83. EC, 18
        call    wait_KBC_sendready                      ; 1B3D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 1B42 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 1B4A _ C7. 04 24, 00000064
        call    io_out8                                 ; 1B51 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 1B56 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 1B5B _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 1B63 _ C7. 04 24, 00000060
        call    io_out8                                 ; 1B6A _ E8, FFFFFFFC(rel)
        leave                                           ; 1B6F _ C9
        ret                                             ; 1B70 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 1B71 _ 55
        mov     ebp, esp                                ; 1B72 _ 89. E5
        sub     esp, 24                                 ; 1B74 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 1B77 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 1B7C _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 1B84 _ C7. 04 24, 00000064
        call    io_out8                                 ; 1B8B _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 1B90 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 1B95 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 1B9D _ C7. 04 24, 00000060
        call    io_out8                                 ; 1BA4 _ E8, FFFFFFFC(rel)
        leave                                           ; 1BA9 _ C9
        ret                                             ; 1BAA _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 1BAB _ 55
        mov     ebp, esp                                ; 1BAC _ 89. E5
        sub     esp, 4                                  ; 1BAE _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 1BB1 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 1BB4 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1BB7 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1BBA _ 0F B6. 40, 03
        test    al, al                                  ; 1BBE _ 84. C0
        jnz     ?_057                                   ; 1BC0 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 1BC2 _ 80. 7D, FC, FA
        jnz     ?_056                                   ; 1BC6 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 1BC8 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1BCB _ C6. 40, 03, 01
?_056:  mov     eax, 0                                  ; 1BCF _ B8, 00000000
        jmp     ?_064                                   ; 1BD4 _ E9, 0000010F

?_057:  mov     eax, dword [ebp+8H]                     ; 1BD9 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1BDC _ 0F B6. 40, 03
        cmp     al, 1                                   ; 1BE0 _ 3C, 01
        jnz     ?_059                                   ; 1BE2 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 1BE4 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 1BE8 _ 25, 000000C8
        cmp     eax, 8                                  ; 1BED _ 83. F8, 08
        jnz     ?_058                                   ; 1BF0 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 1BF2 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1BF5 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 1BF9 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 1BFB _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 1BFE _ C6. 40, 03, 02
?_058:  mov     eax, 0                                  ; 1C02 _ B8, 00000000
        jmp     ?_064                                   ; 1C07 _ E9, 000000DC

?_059:  mov     eax, dword [ebp+8H]                     ; 1C0C _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1C0F _ 0F B6. 40, 03
        cmp     al, 2                                   ; 1C13 _ 3C, 02
        jnz     ?_060                                   ; 1C15 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 1C17 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1C1A _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 1C1E _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1C21 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 1C24 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 1C28 _ B8, 00000000
        jmp     ?_064                                   ; 1C2D _ E9, 000000B6

?_060:  mov     eax, dword [ebp+8H]                     ; 1C32 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1C35 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 1C39 _ 3C, 03
        jne     ?_063                                   ; 1C3B _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 1C41 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1C44 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 1C48 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1C4B _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1C4E _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 1C52 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1C55 _ 0F B6. 00
        movzx   eax, al                                 ; 1C58 _ 0F B6. C0
        and     eax, 07H                                ; 1C5B _ 83. E0, 07
        mov     edx, eax                                ; 1C5E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1C60 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1C63 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1C66 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 1C69 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 1C6D _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1C70 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1C73 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1C76 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 1C79 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 1C7D _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1C80 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1C83 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1C86 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1C89 _ 0F B6. 00
        movzx   eax, al                                 ; 1C8C _ 0F B6. C0
        and     eax, 10H                                ; 1C8F _ 83. E0, 10
        test    eax, eax                                ; 1C92 _ 85. C0
        jz      ?_061                                   ; 1C94 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1C96 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1C99 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 1C9C _ 0D, FFFFFF00
        mov     edx, eax                                ; 1CA1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1CA3 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1CA6 _ 89. 50, 04
?_061:  mov     eax, dword [ebp+8H]                     ; 1CA9 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1CAC _ 0F B6. 00
        movzx   eax, al                                 ; 1CAF _ 0F B6. C0
        and     eax, 20H                                ; 1CB2 _ 83. E0, 20
        test    eax, eax                                ; 1CB5 _ 85. C0
        jz      ?_062                                   ; 1CB7 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1CB9 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1CBC _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 1CBF _ 0D, FFFFFF00
        mov     edx, eax                                ; 1CC4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1CC6 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1CC9 _ 89. 50, 08
?_062:  mov     eax, dword [ebp+8H]                     ; 1CCC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1CCF _ 8B. 40, 08
        neg     eax                                     ; 1CD2 _ F7. D8
        mov     edx, eax                                ; 1CD4 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1CD6 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1CD9 _ 89. 50, 08
        mov     eax, 1                                  ; 1CDC _ B8, 00000001
        jmp     ?_064                                   ; 1CE1 _ EB, 05

?_063:  mov     eax, 4294967295                         ; 1CE3 _ B8, FFFFFFFF
?_064:  leave                                           ; 1CE8 _ C9
        ret                                             ; 1CE9 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 1CEA _ 55
        mov     ebp, esp                                ; 1CEB _ 89. E5
        sub     esp, 40                                 ; 1CED _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 1CF0 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 1CF8 _ C7. 04 24, 00000020
        call    io_out8                                 ; 1CFF _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 1D04 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 1D0C _ C7. 04 24, 000000A0
        call    io_out8                                 ; 1D13 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 1D18 _ C7. 04 24, 00000060
        call    io_in8                                  ; 1D1F _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 1D24 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 1D27 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1D2B _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 1D2F _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 1D36 _ E8, FFFFFFFC(rel)
        leave                                           ; 1D3B _ C9
        ret                                             ; 1D3C _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 1D3D _ 55
        mov     ebp, esp                                ; 1D3E _ 89. E5
        sub     esp, 40                                 ; 1D40 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 1D43 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 1D4B _ C7. 04 24, 00000020
        call    io_out8                                 ; 1D52 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 1D57 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 1D5F _ C7. 04 24, 000000A0
        call    io_out8                                 ; 1D66 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 1D6B _ C7. 04 24, 00000060
        call    io_in8                                  ; 1D72 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 1D77 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 1D7A _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1D7E _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 1D82 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 1D89 _ E8, FFFFFFFC(rel)
        leave                                           ; 1D8E _ C9
        ret                                             ; 1D8F _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 1D90 _ 55
        mov     ebp, esp                                ; 1D91 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1D93 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1D96 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 1D99 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1D9B _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1D9E _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1DA5 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1DA8 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1DAF _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1DB2 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 1DB5 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1DB8 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1DBB _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 1DBE _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 1DC1 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 1DC4 _ C7. 40, 14, 00000000
        pop     ebp                                     ; 1DCB _ 5D
        ret                                             ; 1DCC _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 1DCD _ 55
        mov     ebp, esp                                ; 1DCE _ 89. E5
        sub     esp, 20                                 ; 1DD0 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1DD3 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 1DD6 _ 88. 45, EC
        mov     eax, dword [ebp+8H]                     ; 1DD9 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1DDC _ 8B. 40, 10
        test    eax, eax                                ; 1DDF _ 85. C0
        jnz     ?_065                                   ; 1DE1 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 1DE3 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 1DE6 _ 8B. 40, 14
        or      eax, 01H                                ; 1DE9 _ 83. C8, 01
        mov     edx, eax                                ; 1DEC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1DEE _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 1DF1 _ 89. 50, 14
        mov     eax, 4294967295                         ; 1DF4 _ B8, FFFFFFFF
        jmp     ?_067                                   ; 1DF9 _ EB, 56

?_065:  mov     eax, dword [ebp+8H]                     ; 1DFB _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1DFE _ 8B. 40, 04
        mov     dword [ebp-4H], eax                     ; 1E01 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1E04 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1E07 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 1E09 _ 8B. 45, FC
        add     edx, eax                                ; 1E0C _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1E0E _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1E12 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 1E14 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1E17 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 1E1A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1E1D _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1E20 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1E23 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1E26 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1E29 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1E2C _ 8B. 40, 0C
        cmp     edx, eax                                ; 1E2F _ 39. C2
        jnz     ?_066                                   ; 1E31 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 1E33 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1E36 _ C7. 40, 04, 00000000
?_066:  mov     eax, dword [ebp+8H]                     ; 1E3D _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1E40 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 1E43 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1E46 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1E49 _ 89. 50, 10
        mov     eax, 0                                  ; 1E4C _ B8, 00000000
?_067:  leave                                           ; 1E51 _ C9
        ret                                             ; 1E52 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 1E53 _ 55
        mov     ebp, esp                                ; 1E54 _ 89. E5
        sub     esp, 16                                 ; 1E56 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 1E59 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 1E5C _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 1E5F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1E62 _ 8B. 40, 0C
        cmp     edx, eax                                ; 1E65 _ 39. C2
        jnz     ?_068                                   ; 1E67 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 1E69 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 1E6C _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 1E73 _ B8, FFFFFFFF
        jmp     ?_070                                   ; 1E78 _ EB, 57

?_068:  mov     eax, dword [ebp+8H]                     ; 1E7A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1E7D _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 1E80 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 1E83 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1E86 _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 1E88 _ 8B. 45, F8
        add     eax, edx                                ; 1E8B _ 01. D0
        movzx   eax, byte [eax]                         ; 1E8D _ 0F B6. 00
        movzx   eax, al                                 ; 1E90 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 1E93 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1E96 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1E99 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 1E9C _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1E9F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1EA2 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1EA5 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 1EA8 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1EAB _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1EAE _ 8B. 40, 0C
        cmp     edx, eax                                ; 1EB1 _ 39. C2
        jnz     ?_069                                   ; 1EB3 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 1EB5 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1EB8 _ C7. 40, 08, 00000000
?_069:  mov     eax, dword [ebp+8H]                     ; 1EBF _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1EC2 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 1EC5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1EC8 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1ECB _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 1ECE _ 8B. 45, FC
?_070:  leave                                           ; 1ED1 _ C9
        ret                                             ; 1ED2 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 1ED3 _ 55
        mov     ebp, esp                                ; 1ED4 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1ED6 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 1ED9 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1EDC _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1EDF _ 8B. 40, 10
        sub     edx, eax                                ; 1EE2 _ 29. C2
        mov     eax, edx                                ; 1EE4 _ 89. D0
        pop     ebp                                     ; 1EE6 _ 5D
        ret                                             ; 1EE7 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 1EE8 _ 55
        mov     ebp, esp                                ; 1EE9 _ 89. E5
        sub     esp, 4                                  ; 1EEB _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 1EEE _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 1EF1 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 1EF4 _ 80. 7D, FC, 09
        jle     ?_071                                   ; 1EF8 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 1EFA _ 0F B6. 45, FC
        add     eax, 55                                 ; 1EFE _ 83. C0, 37
        jmp     ?_072                                   ; 1F01 _ EB, 07

?_071:  movzx   eax, byte [ebp-4H]                      ; 1F03 _ 0F B6. 45, FC
        add     eax, 48                                 ; 1F07 _ 83. C0, 30
?_072:  leave                                           ; 1F0A _ C9
        ret                                             ; 1F0B _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 1F0C _ 55
        mov     ebp, esp                                ; 1F0D _ 89. E5
        sub     esp, 24                                 ; 1F0F _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 1F12 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 1F15 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 1F18 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 1F1F _ 0F B6. 45, EC
        and     eax, 0FH                                ; 1F23 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 1F26 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 1F29 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 1F2D _ 89. 04 24
        call    charToHexVal                            ; 1F30 _ E8, FFFFFFFC(rel)
        mov     byte [?_170], al                        ; 1F35 _ A2, 000002A3(d)
        movzx   eax, byte [ebp-14H]                     ; 1F3A _ 0F B6. 45, EC
        shr     al, 4                                   ; 1F3E _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 1F41 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 1F44 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 1F48 _ 0F BE. C0
        mov     dword [esp], eax                        ; 1F4B _ 89. 04 24
        call    charToHexVal                            ; 1F4E _ E8, FFFFFFFC(rel)
        mov     byte [?_169], al                        ; 1F53 _ A2, 000002A2(d)
        mov     eax, keyval                             ; 1F58 _ B8, 000002A0(d)
        leave                                           ; 1F5D _ C9
        ret                                             ; 1F5E _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 1F5F _ 55
        mov     ebp, esp                                ; 1F60 _ 89. E5
        sub     esp, 16                                 ; 1F62 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 1F65 _ C6. 05, 00000280(d), 30
        mov     byte [?_173], 88                        ; 1F6C _ C6. 05, 00000281(d), 58
        mov     byte [?_174], 0                         ; 1F73 _ C6. 05, 0000028A(d), 00
        mov     dword [ebp-0CH], 2                      ; 1F7A _ C7. 45, F4, 00000002
        jmp     ?_074                                   ; 1F81 _ EB, 0F

?_073:  mov     eax, dword [ebp-0CH]                    ; 1F83 _ 8B. 45, F4
        add     eax, str.1386                           ; 1F86 _ 05, 00000280(d)
        mov     byte [eax], 48                          ; 1F8B _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 1F8E _ 83. 45, F4, 01
?_074:  cmp     dword [ebp-0CH], 9                      ; 1F92 _ 83. 7D, F4, 09
        jle     ?_073                                   ; 1F96 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 1F98 _ C7. 45, F8, 00000009
        jmp     ?_078                                   ; 1F9F _ EB, 40

?_075:  mov     eax, dword [ebp+8H]                     ; 1FA1 _ 8B. 45, 08
        and     eax, 0FH                                ; 1FA4 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 1FA7 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1FAA _ 8B. 45, 08
        shr     eax, 4                                  ; 1FAD _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 1FB0 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 1FB3 _ 83. 7D, FC, 09
        jle     ?_076                                   ; 1FB7 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 1FB9 _ 8B. 45, FC
        add     eax, 55                                 ; 1FBC _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 1FBF _ 8B. 55, F8
        add     edx, str.1386                           ; 1FC2 _ 81. C2, 00000280(d)
        mov     byte [edx], al                          ; 1FC8 _ 88. 02
        jmp     ?_077                                   ; 1FCA _ EB, 11

?_076:  mov     eax, dword [ebp-4H]                     ; 1FCC _ 8B. 45, FC
        add     eax, 48                                 ; 1FCF _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 1FD2 _ 8B. 55, F8
        add     edx, str.1386                           ; 1FD5 _ 81. C2, 00000280(d)
        mov     byte [edx], al                          ; 1FDB _ 88. 02
?_077:  sub     dword [ebp-8H], 1                       ; 1FDD _ 83. 6D, F8, 01
?_078:  cmp     dword [ebp-8H], 1                       ; 1FE1 _ 83. 7D, F8, 01
        jle     ?_079                                   ; 1FE5 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 1FE7 _ 83. 7D, 08, 00
        jnz     ?_075                                   ; 1FEB _ 75, B4
?_079:  mov     eax, str.1386                           ; 1FED _ B8, 00000280(d)
        leave                                           ; 1FF2 _ C9
        ret                                             ; 1FF3 _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 1FF4 _ 55
        mov     ebp, esp                                ; 1FF5 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1FF7 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1FFA _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 2000 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2003 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 200A _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 200D _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 2014 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 2017 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 201E _ 5D
        ret                                             ; 201F _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 2020 _ 55
        mov     ebp, esp                                ; 2021 _ 89. E5
        sub     esp, 16                                 ; 2023 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2026 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 202D _ C7. 45, F8, 00000000
        jmp     ?_081                                   ; 2034 _ EB, 14

?_080:  mov     eax, dword [ebp+8H]                     ; 2036 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2039 _ 8B. 55, F8
        add     edx, 2                                  ; 203C _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 203F _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 2043 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 2046 _ 83. 45, F8, 01
?_081:  mov     eax, dword [ebp+8H]                     ; 204A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 204D _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 204F _ 3B. 45, F8
        ja      ?_080                                   ; 2052 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 2054 _ 8B. 45, FC
        leave                                           ; 2057 _ C9
        ret                                             ; 2058 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 2059 _ 55
        mov     ebp, esp                                ; 205A _ 89. E5
        sub     esp, 16                                 ; 205C _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 205F _ C7. 45, F8, 00000000
        jmp     ?_085                                   ; 2066 _ E9, 00000085

?_082:  mov     eax, dword [ebp+8H]                     ; 206B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 206E _ 8B. 55, F8
        add     edx, 2                                  ; 2071 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2074 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 2078 _ 3B. 45, 0C
        jc      ?_084                                   ; 207B _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 207D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2080 _ 8B. 55, F8
        add     edx, 2                                  ; 2083 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2086 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 2089 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 208C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 208F _ 8B. 55, F8
        add     edx, 2                                  ; 2092 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2095 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 2098 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 209B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 209E _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 20A1 _ 8B. 55, F8
        add     edx, 2                                  ; 20A4 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 20A7 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 20AA _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 20AD _ 8B. 55, F8
        add     edx, 2                                  ; 20B0 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 20B3 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 20B7 _ 2B. 45, 0C
        mov     edx, eax                                ; 20BA _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 20BC _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 20BF _ 8B. 4D, F8
        add     ecx, 2                                  ; 20C2 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 20C5 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 20C9 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 20CC _ 8B. 55, F8
        add     edx, 2                                  ; 20CF _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 20D2 _ 8B. 44 D0, 04
        test    eax, eax                                ; 20D6 _ 85. C0
        jnz     ?_083                                   ; 20D8 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 20DA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 20DD _ 8B. 00
        lea     edx, [eax-1H]                           ; 20DF _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 20E2 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 20E5 _ 89. 10
?_083:  mov     eax, dword [ebp-4H]                     ; 20E7 _ 8B. 45, FC
        jmp     ?_086                                   ; 20EA _ EB, 17

?_084:  add     dword [ebp-8H], 1                       ; 20EC _ 83. 45, F8, 01
?_085:  mov     eax, dword [ebp+8H]                     ; 20F0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 20F3 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 20F5 _ 3B. 45, F8
        ja      ?_082                                   ; 20F8 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 20FE _ B8, 00000000
?_086:  leave                                           ; 2103 _ C9
        ret                                             ; 2104 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 2105 _ 55
        mov     ebp, esp                                ; 2106 _ 89. E5
        push    ebx                                     ; 2108 _ 53
        sub     esp, 16                                 ; 2109 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 210C _ C7. 45, F4, 00000000
        jmp     ?_089                                   ; 2113 _ EB, 17

?_087:  mov     eax, dword [ebp+8H]                     ; 2115 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2118 _ 8B. 55, F4
        add     edx, 2                                  ; 211B _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 211E _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 2121 _ 3B. 45, 0C
        jbe     ?_088                                   ; 2124 _ 76, 02
        jmp     ?_090                                   ; 2126 _ EB, 0E

?_088:  add     dword [ebp-0CH], 1                      ; 2128 _ 83. 45, F4, 01
?_089:  mov     eax, dword [ebp+8H]                     ; 212C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 212F _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2131 _ 3B. 45, F4
        jg      ?_087                                   ; 2134 _ 7F, DF
?_090:  cmp     dword [ebp-0CH], 0                      ; 2136 _ 83. 7D, F4, 00
        jle     ?_092                                   ; 213A _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 2140 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2143 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2146 _ 8B. 45, 08
        add     edx, 2                                  ; 2149 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 214C _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 214F _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 2152 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 2155 _ 8B. 45, 08
        add     ecx, 2                                  ; 2158 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 215B _ 8B. 44 C8, 04
        add     eax, edx                                ; 215F _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 2161 _ 3B. 45, 0C
        jne     ?_092                                   ; 2164 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 216A _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 216D _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2170 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2173 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2176 _ 8B. 45, 08
        add     edx, 2                                  ; 2179 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 217C _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2180 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2183 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2186 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 2189 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 218C _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 2190 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2193 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2195 _ 3B. 45, F4
        jle     ?_091                                   ; 2198 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 219A _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 219D _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 21A0 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 21A3 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 21A6 _ 8B. 55, F4
        add     edx, 2                                  ; 21A9 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 21AC _ 8B. 04 D0
        cmp     ecx, eax                                ; 21AF _ 39. C1
        jnz     ?_091                                   ; 21B1 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 21B3 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 21B6 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 21B9 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 21BC _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 21BF _ 8B. 45, 08
        add     edx, 2                                  ; 21C2 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 21C5 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 21C9 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 21CC _ 8B. 4D, F4
        add     ecx, 2                                  ; 21CF _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 21D2 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 21D6 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 21D9 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 21DC _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 21DF _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 21E3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 21E6 _ 8B. 00
        lea     edx, [eax-1H]                           ; 21E8 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 21EB _ 8B. 45, 08
        mov     dword [eax], edx                        ; 21EE _ 89. 10
?_091:  mov     eax, 0                                  ; 21F0 _ B8, 00000000
        jmp     ?_098                                   ; 21F5 _ E9, 0000011C

?_092:  mov     eax, dword [ebp+8H]                     ; 21FA _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 21FD _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 21FF _ 3B. 45, F4
        jle     ?_093                                   ; 2202 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 2204 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 2207 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 220A _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 220D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2210 _ 8B. 55, F4
        add     edx, 2                                  ; 2213 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2216 _ 8B. 04 D0
        cmp     ecx, eax                                ; 2219 _ 39. C1
        jnz     ?_093                                   ; 221B _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 221D _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2220 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2223 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2226 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2229 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 222C _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 222F _ 8B. 55, F4
        add     edx, 2                                  ; 2232 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2235 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2239 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 223C _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 223F _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2242 _ 8B. 55, F4
        add     edx, 2                                  ; 2245 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2248 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 224C _ B8, 00000000
        jmp     ?_098                                   ; 2251 _ E9, 000000C0

?_093:  mov     eax, dword [ebp+8H]                     ; 2256 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2259 _ 8B. 00
        cmp     eax, 4095                               ; 225B _ 3D, 00000FFF
        jg      ?_097                                   ; 2260 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 2266 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2269 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 226B _ 89. 45, F8
        jmp     ?_095                                   ; 226E _ EB, 28

?_094:  mov     eax, dword [ebp-8H]                     ; 2270 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 2273 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 2276 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 2279 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 227C _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 227F _ 8B. 45, 08
        add     edx, 2                                  ; 2282 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 2285 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 2288 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 228A _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 228D _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 2290 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 2294 _ 83. 6D, F8, 01
?_095:  mov     eax, dword [ebp-8H]                     ; 2298 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 229B _ 3B. 45, F4
        jg      ?_094                                   ; 229E _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 22A0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 22A3 _ 8B. 00
        lea     edx, [eax+1H]                           ; 22A5 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 22A8 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 22AB _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 22AD _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 22B0 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 22B3 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 22B6 _ 8B. 00
        cmp     edx, eax                                ; 22B8 _ 39. C2
        jge     ?_096                                   ; 22BA _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 22BC _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 22BF _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 22C1 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 22C4 _ 89. 50, 04
?_096:  mov     eax, dword [ebp+8H]                     ; 22C7 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 22CA _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 22CD _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 22D0 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 22D3 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 22D6 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 22D9 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 22DC _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 22DF _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 22E2 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 22E6 _ B8, 00000000
        jmp     ?_098                                   ; 22EB _ EB, 29

?_097:  mov     eax, dword [ebp+8H]                     ; 22ED _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 22F0 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 22F3 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 22F6 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 22F9 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 22FC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 22FF _ 8B. 40, 08
        mov     edx, eax                                ; 2302 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 2304 _ 8B. 45, 10
        add     eax, edx                                ; 2307 _ 01. D0
        mov     edx, eax                                ; 2309 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 230B _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 230E _ 89. 50, 08
        mov     eax, 4294967295                         ; 2311 _ B8, FFFFFFFF
?_098:  add     esp, 16                                 ; 2316 _ 83. C4, 10
        pop     ebx                                     ; 2319 _ 5B
        pop     ebp                                     ; 231A _ 5D
        ret                                             ; 231B _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 231C _ 55
        mov     ebp, esp                                ; 231D _ 89. E5
        sub     esp, 24                                 ; 231F _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 2322 _ 8B. 45, 0C
        add     eax, 4095                               ; 2325 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 232A _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 232F _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 2332 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2335 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2339 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 233C _ 89. 04 24
        call    memman_alloc                            ; 233F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 2344 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2347 _ 8B. 45, FC
        leave                                           ; 234A _ C9
        ret                                             ; 234B _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 234C _ 55
        mov     ebp, esp                                ; 234D _ 89. E5
        sub     esp, 28                                 ; 234F _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 2352 _ 8B. 45, 10
        add     eax, 4095                               ; 2355 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 235A _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 235F _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 2362 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 2365 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2369 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 236C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2370 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2373 _ 89. 04 24
        call    memman_free                             ; 2376 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 237B _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 237E _ 8B. 45, FC
        leave                                           ; 2381 _ C9
        ret                                             ; 2382 _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 2383 _ 55
        mov     ebp, esp                                ; 2384 _ 89. E5
        sub     esp, 40                                 ; 2386 _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 2389 _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 2391 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2394 _ 89. 04 24
        call    memman_alloc_4k                         ; 2397 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 239C _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 239F _ 83. 7D, F4, 00
        jnz     ?_099                                   ; 23A3 _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 23A5 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 23A8 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 23B0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 23B4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 23B7 _ 89. 04 24
        call    memman_free_4k                          ; 23BA _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 23BF _ B8, 00000000
        jmp     ?_103                                   ; 23C4 _ E9, 0000009D

?_099:  mov     eax, dword [ebp-0CH]                    ; 23C9 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 23CC _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 23CF _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 23D1 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 23D4 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 23D7 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 23DA _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 23DD _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 23E0 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 23E3 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 23E6 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 23ED _ C7. 45, F0, 00000000
        jmp     ?_101                                   ; 23F4 _ EB, 1B

?_100:  mov     eax, dword [ebp-0CH]                    ; 23F6 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 23F9 _ 8B. 55, F0
        add     edx, 33                                 ; 23FC _ 83. C2, 21
        shl     edx, 5                                  ; 23FF _ C1. E2, 05
        add     eax, edx                                ; 2402 _ 01. D0
        add     eax, 16                                 ; 2404 _ 83. C0, 10
        mov     dword [eax], 0                          ; 2407 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 240D _ 83. 45, F0, 01
?_101:  cmp     dword [ebp-10H], 255                    ; 2411 _ 81. 7D, F0, 000000FF
        jle     ?_100                                   ; 2418 _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 241A _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 241D _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 2421 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2425 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2428 _ 89. 04 24
        call    memman_alloc_4k                         ; 242B _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 2430 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2432 _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 2435 _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 2438 _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 243B _ 8B. 40, 10
        test    eax, eax                                ; 243E _ 85. C0
        jnz     ?_102                                   ; 2440 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 2442 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 2445 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 244D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2451 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2454 _ 89. 04 24
        call    memman_free_4k                          ; 2457 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 245C _ B8, 00000000
        jmp     ?_103                                   ; 2461 _ EB, 03

?_102:  mov     eax, dword [ebp-0CH]                    ; 2463 _ 8B. 45, F4
?_103:  leave                                           ; 2466 _ C9
        ret                                             ; 2467 _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 2468 _ 55
        mov     ebp, esp                                ; 2469 _ 89. E5
        sub     esp, 16                                 ; 246B _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 246E _ C7. 45, F8, 00000000
        jmp     ?_106                                   ; 2475 _ EB, 5B

?_104:  mov     eax, dword [ebp+8H]                     ; 2477 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 247A _ 8B. 55, F8
        add     edx, 33                                 ; 247D _ 83. C2, 21
        shl     edx, 5                                  ; 2480 _ C1. E2, 05
        add     eax, edx                                ; 2483 _ 01. D0
        add     eax, 16                                 ; 2485 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 2488 _ 8B. 00
        test    eax, eax                                ; 248A _ 85. C0
        jnz     ?_105                                   ; 248C _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 248E _ 8B. 45, F8
        shl     eax, 5                                  ; 2491 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 2494 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 249A _ 8B. 45, 08
        add     eax, edx                                ; 249D _ 01. D0
        add     eax, 4                                  ; 249F _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 24A2 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 24A5 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 24A8 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 24AB _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 24AE _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 24B1 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 24B5 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 24B8 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 24BF _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 24C2 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 24C9 _ 8B. 45, FC
        jmp     ?_107                                   ; 24CC _ EB, 12

?_105:  add     dword [ebp-8H], 1                       ; 24CE _ 83. 45, F8, 01
?_106:  cmp     dword [ebp-8H], 255                     ; 24D2 _ 81. 7D, F8, 000000FF
        jle     ?_104                                   ; 24D9 _ 7E, 9C
        mov     eax, 0                                  ; 24DB _ B8, 00000000
?_107:  leave                                           ; 24E0 _ C9
        ret                                             ; 24E1 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 24E2 _ 55
        mov     ebp, esp                                ; 24E3 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 24E5 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 24E8 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 24EB _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 24ED _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 24F0 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 24F3 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 24F6 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 24F9 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 24FC _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 24FF _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 2502 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 2505 _ 89. 50, 14
        pop     ebp                                     ; 2508 _ 5D
        ret                                             ; 2509 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 250A _ 55
        mov     ebp, esp                                ; 250B _ 89. E5
        push    esi                                     ; 250D _ 56
        push    ebx                                     ; 250E _ 53
        sub     esp, 48                                 ; 250F _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 2512 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2515 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 2518 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 251B _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 251E _ 8B. 40, 0C
        add     eax, 1                                  ; 2521 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 2524 _ 3B. 45, 10
        jge     ?_108                                   ; 2527 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 2529 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 252C _ 8B. 40, 0C
        add     eax, 1                                  ; 252F _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 2532 _ 89. 45, 10
?_108:  cmp     dword [ebp+10H], -1                     ; 2535 _ 83. 7D, 10, FF
        jge     ?_109                                   ; 2539 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 253B _ C7. 45, 10, FFFFFFFF
?_109:  mov     eax, dword [ebp+0CH]                    ; 2542 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2545 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 2548 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 254B _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 254E _ 3B. 45, 10
        jle     ?_116                                   ; 2551 _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 2557 _ 83. 7D, 10, 00
        js      ?_112                                   ; 255B _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 2561 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2564 _ 89. 45, F0
        jmp     ?_111                                   ; 2567 _ EB, 34

?_110:  mov     eax, dword [ebp-10H]                    ; 2569 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 256C _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 256F _ 8B. 45, 08
        add     edx, 4                                  ; 2572 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2575 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2579 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 257C _ 8B. 4D, F0
        add     ecx, 4                                  ; 257F _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2582 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2586 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2589 _ 8B. 55, F0
        add     edx, 4                                  ; 258C _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 258F _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2593 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2596 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2599 _ 83. 6D, F0, 01
?_111:  mov     eax, dword [ebp-10H]                    ; 259D _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 25A0 _ 3B. 45, 10
        jg      ?_110                                   ; 25A3 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 25A5 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 25A8 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 25AB _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 25AE _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 25B1 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 25B5 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 25B8 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 25BB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 25BE _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 25C1 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 25C4 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 25C7 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 25CA _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 25CD _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 25D0 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 25D3 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 25D6 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 25D9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 25DC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 25DF _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 25E2 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 25E5 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 25E9 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 25ED _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 25F1 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 25F5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 25F9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 25FC _ 89. 04 24
        call    sheet_refresh_map                       ; 25FF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 2604 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2607 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 260A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 260D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2610 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2613 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2616 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2619 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 261C _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 261F _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2622 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2625 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2628 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 262B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 262E _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2631 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 2634 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 2638 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 263C _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2640 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2644 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2648 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 264B _ 89. 04 24
        call    sheet_refresh_local                     ; 264E _ E8, FFFFFFFC(rel)
        jmp     ?_123                                   ; 2653 _ E9, 0000026C

?_112:  mov     eax, dword [ebp+8H]                     ; 2658 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 265B _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 265E _ 3B. 45, F4
        jle     ?_115                                   ; 2661 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 2663 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2666 _ 89. 45, F0
        jmp     ?_114                                   ; 2669 _ EB, 34

?_113:  mov     eax, dword [ebp-10H]                    ; 266B _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 266E _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2671 _ 8B. 45, 08
        add     edx, 4                                  ; 2674 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2677 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 267B _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 267E _ 8B. 4D, F0
        add     ecx, 4                                  ; 2681 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2684 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2688 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 268B _ 8B. 55, F0
        add     edx, 4                                  ; 268E _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2691 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2695 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2698 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 269B _ 83. 45, F0, 01
?_114:  mov     eax, dword [ebp+8H]                     ; 269F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 26A2 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 26A5 _ 3B. 45, F0
        jg      ?_113                                   ; 26A8 _ 7F, C1
?_115:  mov     eax, dword [ebp+8H]                     ; 26AA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 26AD _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 26B0 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 26B3 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 26B6 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 26B9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 26BC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 26BF _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 26C2 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 26C5 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 26C8 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 26CB _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 26CE _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 26D1 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 26D4 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 26D7 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 26DA _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 26DD _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 26E0 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 26E3 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 26EB _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 26EF _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 26F3 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 26F7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 26FB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 26FE _ 89. 04 24
        call    sheet_refresh_map                       ; 2701 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2706 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2709 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 270C _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 270F _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2712 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2715 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2718 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 271B _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 271E _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2721 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2724 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2727 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 272A _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 272D _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 2730 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 2738 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 273C _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2740 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2744 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2748 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 274B _ 89. 04 24
        call    sheet_refresh_local                     ; 274E _ E8, FFFFFFFC(rel)
        jmp     ?_123                                   ; 2753 _ E9, 0000016C

?_116:  mov     eax, dword [ebp-0CH]                    ; 2758 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 275B _ 3B. 45, 10
        jge     ?_123                                   ; 275E _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 2764 _ 83. 7D, F4, 00
        js      ?_119                                   ; 2768 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 276A _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 276D _ 89. 45, F0
        jmp     ?_118                                   ; 2770 _ EB, 34

?_117:  mov     eax, dword [ebp-10H]                    ; 2772 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2775 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2778 _ 8B. 45, 08
        add     edx, 4                                  ; 277B _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 277E _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2782 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2785 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2788 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 278B _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 278F _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2792 _ 8B. 55, F0
        add     edx, 4                                  ; 2795 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2798 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 279C _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 279F _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 27A2 _ 83. 45, F0, 01
?_118:  mov     eax, dword [ebp-10H]                    ; 27A6 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 27A9 _ 3B. 45, 10
        jl      ?_117                                   ; 27AC _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 27AE _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 27B1 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 27B4 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 27B7 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 27BA _ 89. 54 88, 04
        jmp     ?_122                                   ; 27BE _ EB, 6C

?_119:  mov     eax, dword [ebp+8H]                     ; 27C0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 27C3 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 27C6 _ 89. 45, F0
        jmp     ?_121                                   ; 27C9 _ EB, 3A

?_120:  mov     eax, dword [ebp-10H]                    ; 27CB _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 27CE _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 27D1 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 27D4 _ 8B. 55, F0
        add     edx, 4                                  ; 27D7 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 27DA _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 27DE _ 8B. 45, 08
        add     ecx, 4                                  ; 27E1 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 27E4 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 27E8 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 27EB _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 27EE _ 8B. 45, 08
        add     edx, 4                                  ; 27F1 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 27F4 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 27F8 _ 8B. 55, F0
        add     edx, 1                                  ; 27FB _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 27FE _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2801 _ 83. 6D, F0, 01
?_121:  mov     eax, dword [ebp-10H]                    ; 2805 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2808 _ 3B. 45, 10
        jge     ?_120                                   ; 280B _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 280D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2810 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2813 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2816 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2819 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 281D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2820 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 2823 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2826 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2829 _ 89. 50, 0C
?_122:  mov     eax, dword [ebp+0CH]                    ; 282C _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 282F _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2832 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2835 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 2838 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 283B _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 283E _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2841 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2844 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2847 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 284A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 284D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2850 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2853 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 2856 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 2859 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 285D _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2861 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 2865 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2869 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 286D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2870 _ 89. 04 24
        call    sheet_refresh_map                       ; 2873 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2878 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 287B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 287E _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2881 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 2884 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2887 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 288A _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 288D _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2890 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2893 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2896 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2899 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 289C _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 289F _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 28A2 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 28A5 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 28A9 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 28AD _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 28B1 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 28B5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 28B9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 28BC _ 89. 04 24
        call    sheet_refresh_local                     ; 28BF _ E8, FFFFFFFC(rel)
?_123:  add     esp, 48                                 ; 28C4 _ 83. C4, 30
        pop     ebx                                     ; 28C7 _ 5B
        pop     esi                                     ; 28C8 _ 5E
        pop     ebp                                     ; 28C9 _ 5D
        ret                                             ; 28CA _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 28CB _ 55
        mov     ebp, esp                                ; 28CC _ 89. E5
        push    edi                                     ; 28CE _ 57
        push    esi                                     ; 28CF _ 56
        push    ebx                                     ; 28D0 _ 53
        sub     esp, 44                                 ; 28D1 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 28D4 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 28D7 _ 8B. 40, 18
        test    eax, eax                                ; 28DA _ 85. C0
        js      ?_124                                   ; 28DC _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 28DE _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 28E1 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 28E4 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 28E7 _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 28EA _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 28ED _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 28F0 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 28F3 _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 28F6 _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 28F9 _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 28FC _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 28FF _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 2902 _ 8B. 55, 14
        add     ecx, edx                                ; 2905 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2907 _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 290A _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 290D _ 8B. 55, 10
        add     edx, edi                                ; 2910 _ 01. FA
        mov     dword [esp+14H], eax                    ; 2912 _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 2916 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 291A _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 291E _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2922 _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 2926 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2929 _ 89. 04 24
        call    sheet_refresh_local                     ; 292C _ E8, FFFFFFFC(rel)
?_124:  mov     eax, 0                                  ; 2931 _ B8, 00000000
        add     esp, 44                                 ; 2936 _ 83. C4, 2C
        pop     ebx                                     ; 2939 _ 5B
        pop     esi                                     ; 293A _ 5E
        pop     edi                                     ; 293B _ 5F
        pop     ebp                                     ; 293C _ 5D
        ret                                             ; 293D _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 293E _ 55
        mov     ebp, esp                                ; 293F _ 89. E5
        push    ebx                                     ; 2941 _ 53
        sub     esp, 52                                 ; 2942 _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 2945 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2948 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 294B _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 294E _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 2951 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 2954 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 2957 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 295A _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 295D _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2960 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2963 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 2966 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2969 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 296C _ 8B. 40, 18
        test    eax, eax                                ; 296F _ 85. C0
        js      ?_125                                   ; 2971 _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 2977 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 297A _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 297D _ 8B. 45, F4
        add     edx, eax                                ; 2980 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2982 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2985 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2988 _ 8B. 45, F0
        add     eax, ecx                                ; 298B _ 01. C8
        mov     dword [esp+14H], 0                      ; 298D _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 2995 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2999 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 299D _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 29A0 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 29A4 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 29A7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 29AB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 29AE _ 89. 04 24
        call    sheet_refresh_map                       ; 29B1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 29B6 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 29B9 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 29BC _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 29BF _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 29C2 _ 8B. 55, 14
        add     ecx, edx                                ; 29C5 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 29C7 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 29CA _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 29CD _ 8B. 55, 10
        add     edx, ebx                                ; 29D0 _ 01. DA
        mov     dword [esp+14H], eax                    ; 29D2 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 29D6 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 29DA _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 29DE _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 29E1 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 29E5 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 29E8 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 29EC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 29EF _ 89. 04 24
        call    sheet_refresh_map                       ; 29F2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 29F7 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 29FA _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 29FD _ 8B. 45, F4
        add     edx, eax                                ; 2A00 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2A02 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2A05 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2A08 _ 8B. 45, F0
        add     eax, ecx                                ; 2A0B _ 01. C8
        mov     dword [esp+14H], 0                      ; 2A0D _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 2A15 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2A19 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2A1D _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2A20 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 2A24 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2A27 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2A2B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2A2E _ 89. 04 24
        call    sheet_refresh_local                     ; 2A31 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2A36 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2A39 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2A3C _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2A3F _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2A42 _ 8B. 55, 14
        add     ecx, edx                                ; 2A45 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2A47 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2A4A _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2A4D _ 8B. 55, 10
        add     edx, ebx                                ; 2A50 _ 01. DA
        mov     dword [esp+14H], eax                    ; 2A52 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 2A56 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 2A5A _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 2A5E _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 2A61 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2A65 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2A68 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2A6C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2A6F _ 89. 04 24
        call    sheet_refresh_local                     ; 2A72 _ E8, FFFFFFFC(rel)
?_125:  add     esp, 52                                 ; 2A77 _ 83. C4, 34
        pop     ebx                                     ; 2A7A _ 5B
        pop     ebp                                     ; 2A7B _ 5D
        ret                                             ; 2A7C _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 2A7D _ 55
        mov     ebp, esp                                ; 2A7E _ 89. E5
        sub     esp, 48                                 ; 2A80 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 2A83 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2A86 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 2A88 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2A8B _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2A8E _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 2A91 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2A94 _ 83. 7D, 0C, 00
        jns     ?_126                                   ; 2A98 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2A9A _ C7. 45, 0C, 00000000
?_126:  cmp     dword [ebp+10H], 0                      ; 2AA1 _ 83. 7D, 10, 00
        jns     ?_127                                   ; 2AA5 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2AA7 _ C7. 45, 10, 00000000
?_127:  mov     eax, dword [ebp+8H]                     ; 2AAE _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2AB1 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 2AB4 _ 3B. 45, 14
        jge     ?_128                                   ; 2AB7 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2AB9 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2ABC _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 2ABF _ 89. 45, 14
?_128:  mov     eax, dword [ebp+8H]                     ; 2AC2 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2AC5 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 2AC8 _ 3B. 45, 18
        jge     ?_129                                   ; 2ACB _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2ACD _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2AD0 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 2AD3 _ 89. 45, 18
?_129:  mov     eax, dword [ebp+1CH]                    ; 2AD6 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 2AD9 _ 89. 45, DC
        jmp     ?_136                                   ; 2ADC _ E9, 00000119

?_130:  mov     eax, dword [ebp+8H]                     ; 2AE1 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 2AE4 _ 8B. 55, DC
        add     edx, 4                                  ; 2AE7 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2AEA _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2AEE _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 2AF1 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2AF4 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2AF6 _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 2AF9 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 2AFC _ 8B. 45, 08
        add     eax, 1044                               ; 2AFF _ 05, 00000414
        sub     edx, eax                                ; 2B04 _ 29. C2
        mov     eax, edx                                ; 2B06 _ 89. D0
        sar     eax, 5                                  ; 2B08 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 2B0B _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 2B0E _ C7. 45, E4, 00000000
        jmp     ?_135                                   ; 2B15 _ E9, 000000CD

?_131:  mov     eax, dword [ebp-10H]                    ; 2B1A _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 2B1D _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 2B20 _ 8B. 45, E4
        add     eax, edx                                ; 2B23 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 2B25 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 2B28 _ C7. 45, E0, 00000000
        jmp     ?_134                                   ; 2B2F _ E9, 000000A0

?_132:  mov     eax, dword [ebp-10H]                    ; 2B34 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 2B37 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 2B3A _ 8B. 45, E0
        add     eax, edx                                ; 2B3D _ 01. D0
        mov     dword [ebp-4H], eax                     ; 2B3F _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 2B42 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 2B45 _ 3B. 45, FC
        jg      ?_133                                   ; 2B48 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 2B4E _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 2B51 _ 3B. 45, 14
        jge     ?_133                                   ; 2B54 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 2B56 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 2B59 _ 3B. 45, F8
        jg      ?_133                                   ; 2B5C _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 2B5E _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 2B61 _ 3B. 45, 18
        jge     ?_133                                   ; 2B64 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 2B66 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2B69 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 2B6C _ 0F AF. 45, E4
        mov     edx, eax                                ; 2B70 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2B72 _ 8B. 45, E0
        add     eax, edx                                ; 2B75 _ 01. D0
        mov     edx, eax                                ; 2B77 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2B79 _ 8B. 45, F4
        add     eax, edx                                ; 2B7C _ 01. D0
        movzx   eax, byte [eax]                         ; 2B7E _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 2B81 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 2B84 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 2B88 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 2B8B _ 8B. 40, 14
        cmp     edx, eax                                ; 2B8E _ 39. C2
        jz      ?_133                                   ; 2B90 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 2B92 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2B95 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 2B98 _ 0F AF. 45, F8
        mov     edx, eax                                ; 2B9C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2B9E _ 8B. 45, FC
        add     eax, edx                                ; 2BA1 _ 01. D0
        mov     edx, eax                                ; 2BA3 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2BA5 _ 8B. 45, EC
        add     eax, edx                                ; 2BA8 _ 01. D0
        movzx   eax, byte [eax]                         ; 2BAA _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 2BAD _ 3A. 45, DA
        jnz     ?_133                                   ; 2BB0 _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 2BB2 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2BB5 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 2BB8 _ 0F AF. 45, F8
        mov     edx, eax                                ; 2BBC _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2BBE _ 8B. 45, FC
        add     eax, edx                                ; 2BC1 _ 01. D0
        mov     edx, eax                                ; 2BC3 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 2BC5 _ 8B. 45, E8
        add     edx, eax                                ; 2BC8 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 2BCA _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 2BCE _ 88. 02
?_133:  add     dword [ebp-20H], 1                      ; 2BD0 _ 83. 45, E0, 01
?_134:  mov     eax, dword [ebp-10H]                    ; 2BD4 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2BD7 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 2BDA _ 3B. 45, E0
        jg      ?_132                                   ; 2BDD _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 2BE3 _ 83. 45, E4, 01
?_135:  mov     eax, dword [ebp-10H]                    ; 2BE7 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2BEA _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 2BED _ 3B. 45, E4
        jg      ?_131                                   ; 2BF0 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 2BF6 _ 83. 45, DC, 01
?_136:  mov     eax, dword [ebp+8H]                     ; 2BFA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2BFD _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 2C00 _ 3B. 45, DC
        jge     ?_130                                   ; 2C03 _ 0F 8D, FFFFFED8
        leave                                           ; 2C09 _ C9
        ret                                             ; 2C0A _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 2C0B _ 55
        mov     ebp, esp                                ; 2C0C _ 89. E5
        sub     esp, 64                                 ; 2C0E _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 2C11 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2C14 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 2C16 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2C19 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2C1C _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 2C1F _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2C22 _ 83. 7D, 0C, 00
        jns     ?_137                                   ; 2C26 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2C28 _ C7. 45, 0C, 00000000
?_137:  cmp     dword [ebp+10H], 0                      ; 2C2F _ 83. 7D, 10, 00
        jns     ?_138                                   ; 2C33 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2C35 _ C7. 45, 10, 00000000
?_138:  mov     eax, dword [ebp+8H]                     ; 2C3C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2C3F _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 2C42 _ 3B. 45, 14
        jge     ?_139                                   ; 2C45 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2C47 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2C4A _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 2C4D _ 89. 45, 14
?_139:  mov     eax, dword [ebp+8H]                     ; 2C50 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2C53 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 2C56 _ 3B. 45, 18
        jge     ?_140                                   ; 2C59 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2C5B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2C5E _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 2C61 _ 89. 45, 18
?_140:  mov     eax, dword [ebp+1CH]                    ; 2C64 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 2C67 _ 89. 45, CC
        jmp     ?_151                                   ; 2C6A _ E9, 00000141

?_141:  mov     eax, dword [ebp+8H]                     ; 2C6F _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 2C72 _ 8B. 55, CC
        add     edx, 4                                  ; 2C75 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2C78 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2C7C _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 2C7F _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 2C82 _ 8B. 45, 08
        add     eax, 1044                               ; 2C85 _ 05, 00000414
        sub     edx, eax                                ; 2C8A _ 29. C2
        mov     eax, edx                                ; 2C8C _ 89. D0
        sar     eax, 5                                  ; 2C8E _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 2C91 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 2C94 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2C97 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2C99 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2C9C _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 2C9F _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 2CA2 _ 8B. 55, 0C
        sub     edx, eax                                ; 2CA5 _ 29. C2
        mov     eax, edx                                ; 2CA7 _ 89. D0
        mov     dword [ebp-30H], eax                    ; 2CA9 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 2CAC _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 2CAF _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 2CB2 _ 8B. 55, 10
        sub     edx, eax                                ; 2CB5 _ 29. C2
        mov     eax, edx                                ; 2CB7 _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 2CB9 _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 2CBC _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 2CBF _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 2CC2 _ 8B. 55, 14
        sub     edx, eax                                ; 2CC5 _ 29. C2
        mov     eax, edx                                ; 2CC7 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 2CC9 _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 2CCC _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 2CCF _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 2CD2 _ 8B. 55, 18
        sub     edx, eax                                ; 2CD5 _ 29. C2
        mov     eax, edx                                ; 2CD7 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 2CD9 _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 2CDC _ 83. 7D, D0, 00
        jns     ?_142                                   ; 2CE0 _ 79, 07
        mov     dword [ebp-30H], 0                      ; 2CE2 _ C7. 45, D0, 00000000
?_142:  cmp     dword [ebp-2CH], 0                      ; 2CE9 _ 83. 7D, D4, 00
        jns     ?_143                                   ; 2CED _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 2CEF _ C7. 45, D4, 00000000
?_143:  mov     eax, dword [ebp-10H]                    ; 2CF6 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2CF9 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 2CFC _ 3B. 45, D8
        jge     ?_144                                   ; 2CFF _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 2D01 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2D04 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 2D07 _ 89. 45, D8
?_144:  mov     eax, dword [ebp-10H]                    ; 2D0A _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2D0D _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 2D10 _ 3B. 45, DC
        jge     ?_145                                   ; 2D13 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 2D15 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2D18 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 2D1B _ 89. 45, DC
?_145:  mov     eax, dword [ebp-2CH]                    ; 2D1E _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 2D21 _ 89. 45, E4
        jmp     ?_150                                   ; 2D24 _ EB, 7A

?_146:  mov     eax, dword [ebp-10H]                    ; 2D26 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 2D29 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 2D2C _ 8B. 45, E4
        add     eax, edx                                ; 2D2F _ 01. D0
        mov     dword [ebp-8H], eax                     ; 2D31 _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 2D34 _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 2D37 _ 89. 45, E0
        jmp     ?_149                                   ; 2D3A _ EB, 58

?_147:  mov     eax, dword [ebp-10H]                    ; 2D3C _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 2D3F _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 2D42 _ 8B. 45, E0
        add     eax, edx                                ; 2D45 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 2D47 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 2D4A _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2D4D _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 2D50 _ 0F AF. 45, E4
        mov     edx, eax                                ; 2D54 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2D56 _ 8B. 45, E0
        add     eax, edx                                ; 2D59 _ 01. D0
        mov     edx, eax                                ; 2D5B _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2D5D _ 8B. 45, F4
        add     eax, edx                                ; 2D60 _ 01. D0
        movzx   eax, byte [eax]                         ; 2D62 _ 0F B6. 00
        movzx   edx, al                                 ; 2D65 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 2D68 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 2D6B _ 8B. 40, 14
        cmp     edx, eax                                ; 2D6E _ 39. C2
        jz      ?_148                                   ; 2D70 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 2D72 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2D75 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 2D78 _ 0F AF. 45, F8
        mov     edx, eax                                ; 2D7C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2D7E _ 8B. 45, FC
        add     eax, edx                                ; 2D81 _ 01. D0
        mov     edx, eax                                ; 2D83 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2D85 _ 8B. 45, EC
        add     edx, eax                                ; 2D88 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 2D8A _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 2D8E _ 88. 02
?_148:  add     dword [ebp-20H], 1                      ; 2D90 _ 83. 45, E0, 01
?_149:  mov     eax, dword [ebp-20H]                    ; 2D94 _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 2D97 _ 3B. 45, D8
        jl      ?_147                                   ; 2D9A _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 2D9C _ 83. 45, E4, 01
?_150:  mov     eax, dword [ebp-1CH]                    ; 2DA0 _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 2DA3 _ 3B. 45, DC
        jl      ?_146                                   ; 2DA6 _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 2DAC _ 83. 45, CC, 01
?_151:  mov     eax, dword [ebp+8H]                     ; 2DB0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2DB3 _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 2DB6 _ 3B. 45, CC
        jge     ?_141                                   ; 2DB9 _ 0F 8D, FFFFFEB0
        leave                                           ; 2DBF _ C9
        ret                                             ; 2DC0 _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 2DC1 _ 55
        mov     ebp, esp                                ; 2DC2 _ 89. E5
        sub     esp, 24                                 ; 2DC4 _ 83. EC, 18
        mov     dword [esp+4H], 52                      ; 2DC7 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 2DCF _ C7. 04 24, 00000043
        call    io_out8                                 ; 2DD6 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 2DDB _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 2DE3 _ C7. 04 24, 00000040
        call    io_out8                                 ; 2DEA _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 2DEF _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 2DF7 _ C7. 04 24, 00000040
        call    io_out8                                 ; 2DFE _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 2E03 _ C7. 05, 000002A0(d), 00000000
        leave                                           ; 2E0D _ C9
        ret                                             ; 2E0E _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 2E0F _ 55
        mov     ebp, esp                                ; 2E10 _ 89. E5
        mov     eax, timer_control                      ; 2E12 _ B8, 000002A0(d)
        pop     ebp                                     ; 2E17 _ 5D
        ret                                             ; 2E18 _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 2E19 _ 55
        mov     ebp, esp                                ; 2E1A _ 89. E5
        sub     esp, 16                                 ; 2E1C _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2E1F _ C7. 45, FC, 00000000
        jmp     ?_154                                   ; 2E26 _ EB, 26

?_152:  mov     eax, dword [ebp-4H]                     ; 2E28 _ 8B. 45, FC
        shl     eax, 4                                  ; 2E2B _ C1. E0, 04
        add     eax, timer_control                      ; 2E2E _ 05, 000002A0(d)
        mov     eax, dword [eax+8H]                     ; 2E33 _ 8B. 40, 08
        test    eax, eax                                ; 2E36 _ 85. C0
        jnz     ?_153                                   ; 2E38 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 2E3A _ 8B. 45, FC
        shl     eax, 4                                  ; 2E3D _ C1. E0, 04
        add     eax, timer_control                      ; 2E40 _ 05, 000002A0(d)
        add     eax, 4                                  ; 2E45 _ 83. C0, 04
        jmp     ?_155                                   ; 2E48 _ EB, 0D

?_153:  add     dword [ebp-4H], 1                       ; 2E4A _ 83. 45, FC, 01
?_154:  cmp     dword [ebp-4H], 499                     ; 2E4E _ 81. 7D, FC, 000001F3
        jle     ?_152                                   ; 2E55 _ 7E, D1
?_155:  leave                                           ; 2E57 _ C9
        ret                                             ; 2E58 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 2E59 _ 55
        mov     ebp, esp                                ; 2E5A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2E5C _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2E5F _ C7. 40, 04, 00000000
        pop     ebp                                     ; 2E66 _ 5D
        ret                                             ; 2E67 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 2E68 _ 55
        mov     ebp, esp                                ; 2E69 _ 89. E5
        sub     esp, 4                                  ; 2E6B _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 2E6E _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 2E71 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2E74 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2E77 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 2E7A _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2E7D _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2E80 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 2E84 _ 88. 50, 0C
        leave                                           ; 2E87 _ C9
        ret                                             ; 2E88 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 2E89 _ 55
        mov     ebp, esp                                ; 2E8A _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2E8C _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2E8F _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2E92 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2E94 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 2E97 _ C7. 40, 04, 00000002
        pop     ebp                                     ; 2E9E _ 5D
        ret                                             ; 2E9F _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 2EA0 _ 55
        mov     ebp, esp                                ; 2EA1 _ 89. E5
        sub     esp, 40                                 ; 2EA3 _ 83. EC, 28
        mov     dword [esp+4H], 96                      ; 2EA6 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 32                         ; 2EAE _ C7. 04 24, 00000020
        call    io_out8                                 ; 2EB5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 2EBA _ A1, 000002A0(d)
        add     eax, 1                                  ; 2EBF _ 83. C0, 01
        mov     dword [timer_control], eax              ; 2EC2 _ A3, 000002A0(d)
        mov     dword [ebp-0CH], 0                      ; 2EC7 _ C7. 45, F4, 00000000
        jmp     ?_158                                   ; 2ECE _ E9, 00000086

?_156:  mov     eax, dword [ebp-0CH]                    ; 2ED3 _ 8B. 45, F4
        shl     eax, 4                                  ; 2ED6 _ C1. E0, 04
        add     eax, timer_control                      ; 2ED9 _ 05, 000002A0(d)
        mov     eax, dword [eax+8H]                     ; 2EDE _ 8B. 40, 08
        cmp     eax, 2                                  ; 2EE1 _ 83. F8, 02
        jnz     ?_157                                   ; 2EE4 _ 75, 6F
        mov     eax, dword [ebp-0CH]                    ; 2EE6 _ 8B. 45, F4
        shl     eax, 4                                  ; 2EE9 _ C1. E0, 04
        add     eax, timer_control                      ; 2EEC _ 05, 000002A0(d)
        mov     eax, dword [eax+4H]                     ; 2EF1 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 2EF4 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 2EF7 _ 8B. 45, F4
        shl     eax, 4                                  ; 2EFA _ C1. E0, 04
        add     eax, timer_control                      ; 2EFD _ 05, 000002A0(d)
        mov     dword [eax+4H], edx                     ; 2F02 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 2F05 _ 8B. 45, F4
        shl     eax, 4                                  ; 2F08 _ C1. E0, 04
        add     eax, timer_control                      ; 2F0B _ 05, 000002A0(d)
        mov     eax, dword [eax+4H]                     ; 2F10 _ 8B. 40, 04
        test    eax, eax                                ; 2F13 _ 85. C0
        jnz     ?_157                                   ; 2F15 _ 75, 3E
        mov     eax, dword [ebp-0CH]                    ; 2F17 _ 8B. 45, F4
        shl     eax, 4                                  ; 2F1A _ C1. E0, 04
        add     eax, timer_control                      ; 2F1D _ 05, 000002A0(d)
        mov     dword [eax+8H], 1                       ; 2F22 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 2F29 _ 8B. 45, F4
        shl     eax, 4                                  ; 2F2C _ C1. E0, 04
        add     eax, timer_control                      ; 2F2F _ 05, 000002A0(d)
        movzx   eax, byte [eax+10H]                     ; 2F34 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 2F38 _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 2F3B _ 8B. 45, F4
        shl     eax, 4                                  ; 2F3E _ C1. E0, 04
        add     eax, timer_control                      ; 2F41 _ 05, 000002A0(d)
        mov     eax, dword [eax+0CH]                    ; 2F46 _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 2F49 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2F4D _ 89. 04 24
        call    fifo8_put                               ; 2F50 _ E8, FFFFFFFC(rel)
?_157:  add     dword [ebp-0CH], 1                      ; 2F55 _ 83. 45, F4, 01
?_158:  cmp     dword [ebp-0CH], 499                    ; 2F59 _ 81. 7D, F4, 000001F3
        jle     ?_156                                   ; 2F60 _ 0F 8E, FFFFFF6D
        leave                                           ; 2F66 _ C9
        ret                                             ; 2F67 _ C3
; intHandlerTimer End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_159:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_160:                                                  ; byte
        db 5BH, 35H, 20H, 73H, 65H, 63H, 5DH, 00H       ; 0007 _ [5 sec].

?_161:                                                  ; byte
        db 5BH, 33H, 20H, 73H, 65H, 63H, 5DH, 00H       ; 000F _ [3 sec].

?_162:                                                  ; byte
        db 69H, 6DH, 70H, 72H, 6FH, 76H, 65H, 20H       ; 0017 _ improve 
        db 73H, 74H, 72H, 69H, 6EH, 67H, 20H, 73H       ; 001F _ string s
        db 68H, 6FH, 77H, 69H, 6EH, 67H, 00H            ; 0027 _ howing.

?_163:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 002E _ page is:
        db 20H, 00H                                     ; 0036 _  .

?_164:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0038 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 0040 _ L: .

?_165:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0044 _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 004C _ H: .

?_166:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 0050 _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0058 _ w: .

?_167:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 005C _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 0064 _ gh: .

?_168:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0069 _ type: .


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

table_rgb.1622:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0080 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0088 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0090 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0098 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 00A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 00A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

cursor.1690:                                            ; byte
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

closebtn.1768:                                          ; byte
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

?_169:  db 00H                                          ; 02A2 _ .

?_170:  db 00H, 00H                                     ; 02A3 _ ..


SECTION .bss    align=32 noexecute                      ; section number 4, bss

timerinfo1.1649:                                        ; byte
        resb    24                                      ; 0000

timerbuf1.1652:                                         ; qword
        resq    1                                       ; 0018

timerinfo2.1650:                                        ; byte
        resb    24                                      ; 0020

timerbuf2.1653:                                         ; qword
        resq    1                                       ; 0038

timerinfo3.1651:                                        ; byte
        resb    24                                      ; 0040

timerbuf3.1654:                                         ; qword
        resq    1                                       ; 0058

screen_info:                                            ; qword
        resb    4                                       ; 0060

?_171:  resw    1                                       ; 0064

?_172:  resw    13                                      ; 0066

mouse_cursor_buf:                                       ; byte
        resb    256                                     ; 0080

back_buf: resd  1                                       ; 0180

sheet_win:                                              ; dword
        resd    1                                       ; 0184

mouse_x: resd   1                                       ; 0188

mouse_y: resd   1                                       ; 018C

mouse_send_info:                                        ; oword
        resb    16                                      ; 0190

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

?_173:  resb    9                                       ; 0281

?_174:  resb    22                                      ; 028A

timer_control:                                          ; byte
        resd    2001                                    ; 02A0


