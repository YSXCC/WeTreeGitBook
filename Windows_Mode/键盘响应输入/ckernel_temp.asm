; Disassembly of file: ckernel.o
; Thu Feb 20 09:51:40 2020
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
extern keytable                                         ; byte
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
        mov     dword [ebp-44H], eax                    ; 0018 _ 89. 45, BC
        movzx   eax, word [screen_info+4H]              ; 001B _ 0F B7. 05, 00000004(d)
        cwde                                            ; 0022 _ 98
        mov     dword [ebp-40H], eax                    ; 0023 _ 89. 45, C0
        movzx   eax, word [screen_info+6H]              ; 0026 _ 0F B7. 05, 00000006(d)
        cwde                                            ; 002D _ 98
        mov     dword [ebp-3CH], eax                    ; 002E _ 89. 45, C4
        mov     eax, dword [memman]                     ; 0031 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0036 _ 89. 04 24
        call    memman_init                             ; 0039 _ E8, FFFFFFFC(rel)
        mov     eax, dword [memman]                     ; 003E _ A1, 00000000(d)
        mov     dword [esp+8H], 1072594944              ; 0043 _ C7. 44 24, 08, 3FEE8000
        mov     dword [esp+4H], 17301504                ; 004B _ C7. 44 24, 04, 01080000
        mov     dword [esp], eax                        ; 0053 _ 89. 04 24
        call    memman_free                             ; 0056 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], 0                      ; 005B _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 0062 _ C7. 45, CC, 00000000
        mov     eax, dword [memman]                     ; 0069 _ A1, 00000000(d)
        mov     edx, dword [ebp-3CH]                    ; 006E _ 8B. 55, C4
        mov     dword [esp+0CH], edx                    ; 0071 _ 89. 54 24, 0C
        mov     edx, dword [ebp-40H]                    ; 0075 _ 8B. 55, C0
        mov     dword [esp+8H], edx                     ; 0078 _ 89. 54 24, 08
        mov     edx, dword [ebp-44H]                    ; 007C _ 8B. 55, BC
        mov     dword [esp+4H], edx                     ; 007F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0083 _ 89. 04 24
        call    sheet_control_init                      ; 0086 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 008B _ 89. 45, D0
        mov     eax, dword [ebp-30H]                    ; 008E _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0091 _ 89. 04 24
        call    sheet_alloc                             ; 0094 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], eax                    ; 0099 _ 89. 45, C8
        mov     eax, dword [ebp-30H]                    ; 009C _ 8B. 45, D0
        mov     dword [esp], eax                        ; 009F _ 89. 04 24
        call    sheet_alloc                             ; 00A2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 00A7 _ 89. 45, CC
        mov     eax, dword [ebp-40H]                    ; 00AA _ 8B. 45, C0
        imul    eax, dword [ebp-3CH]                    ; 00AD _ 0F AF. 45, C4
        mov     edx, eax                                ; 00B1 _ 89. C2
        mov     eax, dword [memman]                     ; 00B3 _ A1, 00000000(d)
        mov     dword [esp+4H], edx                     ; 00B8 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 00BC _ 89. 04 24
        call    memman_alloc_4k                         ; 00BF _ E8, FFFFFFFC(rel)
        mov     dword [back_buf], eax                   ; 00C4 _ A3, 00000000(d)
        mov     eax, dword [back_buf]                   ; 00C9 _ A1, 00000000(d)
        mov     dword [esp+10H], 99                     ; 00CE _ C7. 44 24, 10, 00000063
        mov     edx, dword [ebp-3CH]                    ; 00D6 _ 8B. 55, C4
        mov     dword [esp+0CH], edx                    ; 00D9 _ 89. 54 24, 0C
        mov     edx, dword [ebp-40H]                    ; 00DD _ 8B. 55, C0
        mov     dword [esp+8H], edx                     ; 00E0 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 00E4 _ 89. 44 24, 04
        mov     eax, dword [ebp-38H]                    ; 00E8 _ 8B. 45, C8
        mov     dword [esp], eax                        ; 00EB _ 89. 04 24
        call    sheet_setbuf                            ; 00EE _ E8, FFFFFFFC(rel)
        mov     dword [esp+10H], 99                     ; 00F3 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 16                     ; 00FB _ C7. 44 24, 0C, 00000010
        mov     dword [esp+8H], 16                      ; 0103 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], mouse_cursor_buf        ; 010B _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-34H]                    ; 0113 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0116 _ 89. 04 24
        call    sheet_setbuf                            ; 0119 _ E8, FFFFFFFC(rel)
        call    init_mouse_position                     ; 011E _ E8, FFFFFFFC(rel)
        call    init_palette                            ; 0123 _ E8, FFFFFFFC(rel)
        call    init_fifo_buf                           ; 0128 _ E8, FFFFFFFC(rel)
        call    init_keyboard                           ; 012D _ E8, FFFFFFFC(rel)
        call    get_timer_control                       ; 0132 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 0137 _ 89. 45, D4
        call    init_time_port                          ; 013A _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf1.1646          ; 013F _ C7. 44 24, 08, 00000018(d)
        mov     dword [esp+4H], 8                       ; 0147 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1643            ; 014F _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0156 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 015B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 0160 _ 89. 45, D8
        mov     dword [esp+8H], 1                       ; 0163 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1643         ; 016B _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-28H]                    ; 0173 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0176 _ 89. 04 24
        call    timer_init                              ; 0179 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 500                     ; 017E _ C7. 44 24, 04, 000001F4
        mov     eax, dword [ebp-28H]                    ; 0186 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0189 _ 89. 04 24
        call    timer_settime                           ; 018C _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf2.1647          ; 0191 _ C7. 44 24, 08, 00000038(d)
        mov     dword [esp+4H], 8                       ; 0199 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1644            ; 01A1 _ C7. 04 24, 00000020(d)
        call    fifo8_init                              ; 01A8 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01AD _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 01B2 _ 89. 45, DC
        mov     dword [esp+8H], 1                       ; 01B5 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1644         ; 01BD _ C7. 44 24, 04, 00000020(d)
        mov     eax, dword [ebp-24H]                    ; 01C5 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 01C8 _ 89. 04 24
        call    timer_init                              ; 01CB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01D0 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-24H]                    ; 01D8 _ 8B. 45, DC
        mov     dword [esp], eax                        ; 01DB _ 89. 04 24
        call    timer_settime                           ; 01DE _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf3.1648          ; 01E3 _ C7. 44 24, 08, 00000058(d)
        mov     dword [esp+4H], 8                       ; 01EB _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1645            ; 01F3 _ C7. 04 24, 00000040(d)
        call    fifo8_init                              ; 01FA _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01FF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0204 _ 89. 45, E0
        mov     dword [esp+8H], 1                       ; 0207 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1645         ; 020F _ C7. 44 24, 04, 00000040(d)
        mov     eax, dword [ebp-20H]                    ; 0217 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 021A _ 89. 04 24
        call    timer_init                              ; 021D _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 0222 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-20H]                    ; 022A _ 8B. 45, E0
        mov     dword [esp], eax                        ; 022D _ 89. 04 24
        call    timer_settime                           ; 0230 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 0235 _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 023A _ A1, 00000000(d)
        mov     edx, dword [ebp-3CH]                    ; 023F _ 8B. 55, C4
        mov     dword [esp+8H], edx                     ; 0242 _ 89. 54 24, 08
        mov     edx, dword [ebp-40H]                    ; 0246 _ 8B. 55, C0
        mov     dword [esp+4H], edx                     ; 0249 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 024D _ 89. 04 24
        call    init_desktop                            ; 0250 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 99                      ; 0255 _ C7. 44 24, 04, 00000063
        mov     dword [esp], mouse_cursor_buf           ; 025D _ C7. 04 24, 00000000(d)
        call    init_mouse_cursor                       ; 0264 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 0                      ; 0269 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0271 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-38H]                    ; 0279 _ 8B. 45, C8
        mov     dword [esp+4H], eax                     ; 027C _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 0280 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0283 _ 89. 04 24
        call    sheet_slide                             ; 0286 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 028B _ 8B. 15, 00000000(d)
        mov     eax, dword [mouse_x]                    ; 0291 _ A1, 00000000(d)
        mov     dword [esp+0CH], edx                    ; 0296 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 029A _ 89. 44 24, 08
        mov     eax, dword [ebp-34H]                    ; 029E _ 8B. 45, CC
        mov     dword [esp+4H], eax                     ; 02A1 _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 02A5 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 02A8 _ 89. 04 24
        call    sheet_slide                             ; 02AB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], ?_158                   ; 02B0 _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-30H]                    ; 02B8 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 02BB _ 89. 04 24
        call    message_box                             ; 02BE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 02C3 _ 89. 45, E4
        mov     dword [esp+8H], 0                       ; 02C6 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-38H]                    ; 02CE _ 8B. 45, C8
        mov     dword [esp+4H], eax                     ; 02D1 _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 02D5 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 02D8 _ 89. 04 24
        call    sheet_updown                            ; 02DB _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 100                     ; 02E0 _ C7. 44 24, 08, 00000064
        mov     eax, dword [ebp-34H]                    ; 02E8 _ 8B. 45, CC
        mov     dword [esp+4H], eax                     ; 02EB _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 02EF _ 8B. 45, D0
        mov     dword [esp], eax                        ; 02F2 _ 89. 04 24
        call    sheet_updown                            ; 02F5 _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 02FA _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], 0                      ; 02FF _ C7. 45, E8, 00000000
        mov     dword [ebp-14H], 0                      ; 0306 _ C7. 45, EC, 00000000
        mov     dword [ebp-10H], 0                      ; 030D _ C7. 45, F0, 00000000
?_001:  call    io_cli                                  ; 0314 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0319 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0320 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 0325 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 0327 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 032E _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0333 _ 01. C3
        mov     dword [esp], timerinfo1.1643            ; 0335 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 033C _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0341 _ 01. C3
        mov     dword [esp], timerinfo2.1644            ; 0343 _ C7. 04 24, 00000020(d)
        call    fifo8_status                            ; 034A _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 034F _ 01. C3
        mov     dword [esp], timerinfo3.1645            ; 0351 _ C7. 04 24, 00000040(d)
        call    fifo8_status                            ; 0358 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 035D _ 01. D8
        test    eax, eax                                ; 035F _ 85. C0
        jnz     ?_002                                   ; 0361 _ 75, 0A
        call    io_sti                                  ; 0363 _ E8, FFFFFFFC(rel)
        jmp     ?_009                                   ; 0368 _ E9, 0000028F

?_002:  mov     dword [esp], keyinfo                    ; 036D _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0374 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0379 _ 85. C0
        jz      ?_003                                   ; 037B _ 74, 79
        call    io_sti                                  ; 037D _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0382 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0389 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 038E _ 89. 45, E8
        cmp     dword [ebp-18H], 28                     ; 0391 _ 83. 7D, E8, 1C
        je      ?_009                                   ; 0395 _ 0F 84, 00000261
        mov     eax, dword [ebp-18H]                    ; 039B _ 8B. 45, E8
        add     eax, keytable                           ; 039E _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 03A3 _ 0F B6. 00
        test    al, al                                  ; 03A6 _ 84. C0
        je      ?_009                                   ; 03A8 _ 0F 84, 0000024E
        mov     eax, dword [ebp-18H]                    ; 03AE _ 8B. 45, E8
        add     eax, keytable                           ; 03B1 _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 03B6 _ 0F B6. 00
        mov     byte [ebp-46H], al                      ; 03B9 _ 88. 45, BA
        mov     byte [ebp-45H], 0                       ; 03BC _ C6. 45, BB, 00
        mov     dword [esp+14H], 0                      ; 03C0 _ C7. 44 24, 14, 00000000
        lea     eax, [ebp-46H]                          ; 03C8 _ 8D. 45, BA
        mov     dword [esp+10H], eax                    ; 03CB _ 89. 44 24, 10
        mov     dword [esp+0CH], 28                     ; 03CF _ C7. 44 24, 0C, 0000001C
        mov     dword [esp+8H], 40                      ; 03D7 _ C7. 44 24, 08, 00000028
        mov     eax, dword [ebp-1CH]                    ; 03DF _ 8B. 45, E4
        mov     dword [esp+4H], eax                     ; 03E2 _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 03E6 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 03E9 _ 89. 04 24
        call    paint_string                            ; 03EC _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 03F1 _ E9, FFFFFF1E

?_003:  mov     dword [esp], mouseinfo                  ; 03F6 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 03FD _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0402 _ 85. C0
        jz      ?_004                                   ; 0404 _ 74, 1E
        mov     eax, dword [ebp-34H]                    ; 0406 _ 8B. 45, CC
        mov     dword [esp+8H], eax                     ; 0409 _ 89. 44 24, 08
        mov     eax, dword [ebp-38H]                    ; 040D _ 8B. 45, C8
        mov     dword [esp+4H], eax                     ; 0410 _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 0414 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0417 _ 89. 04 24
        call    show_mouse_info                         ; 041A _ E8, FFFFFFFC(rel)
        jmp     ?_009                                   ; 041F _ E9, 000001D8

?_004:  mov     dword [esp], timerinfo1.1643            ; 0424 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 042B _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0430 _ 85. C0
        jz      ?_005                                   ; 0432 _ 74, 48
        call    io_sti                                  ; 0434 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1643            ; 0439 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0440 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 0445 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_159                  ; 044D _ C7. 44 24, 10, 00000007(d)
        mov     dword [esp+0CH], 0                      ; 0455 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 045D _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-38H]                    ; 0465 _ 8B. 45, C8
        mov     dword [esp+4H], eax                     ; 0468 _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 046C _ 8B. 45, D0
        mov     dword [esp], eax                        ; 046F _ 89. 04 24
        call    paint_string                            ; 0472 _ E8, FFFFFFFC(rel)
        jmp     ?_009                                   ; 0477 _ E9, 00000180

?_005:  mov     dword [esp], timerinfo2.1644            ; 047C _ C7. 04 24, 00000020(d)
        call    fifo8_status                            ; 0483 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0488 _ 85. C0
        jz      ?_006                                   ; 048A _ 74, 48
        call    io_sti                                  ; 048C _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1644            ; 0491 _ C7. 04 24, 00000020(d)
        call    fifo8_get                               ; 0498 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 049D _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_160                  ; 04A5 _ C7. 44 24, 10, 0000000F(d)
        mov     dword [esp+0CH], 32                     ; 04AD _ C7. 44 24, 0C, 00000020
        mov     dword [esp+8H], 0                       ; 04B5 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-38H]                    ; 04BD _ 8B. 45, C8
        mov     dword [esp+4H], eax                     ; 04C0 _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 04C4 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 04C7 _ 89. 04 24
        call    paint_string                            ; 04CA _ E8, FFFFFFFC(rel)
        jmp     ?_009                                   ; 04CF _ E9, 00000128

?_006:  mov     dword [esp], timerinfo3.1645            ; 04D4 _ C7. 04 24, 00000040(d)
        call    fifo8_status                            ; 04DB _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 04E0 _ 85. C0
        je      ?_009                                   ; 04E2 _ 0F 84, 00000114
        mov     dword [esp], timerinfo3.1645            ; 04E8 _ C7. 04 24, 00000040(d)
        call    fifo8_get                               ; 04EF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 04F4 _ 89. 45, F4
        call    io_sti                                  ; 04F7 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 04FC _ 83. 7D, F4, 00
        jz      ?_007                                   ; 0500 _ 74, 59
        mov     dword [esp+8H], 0                       ; 0502 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1645         ; 050A _ C7. 44 24, 04, 00000040(d)
        mov     eax, dword [ebp-20H]                    ; 0512 _ 8B. 45, E0
        mov     dword [esp], eax                        ; 0515 _ 89. 04 24
        call    timer_init                              ; 0518 _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 051D _ A1, 00000000(d)
        mov     dword [esp+18H], 111                    ; 0522 _ C7. 44 24, 18, 0000006F
        mov     dword [esp+14H], 15                     ; 052A _ C7. 44 24, 14, 0000000F
        mov     dword [esp+10H], 95                     ; 0532 _ C7. 44 24, 10, 0000005F
        mov     dword [esp+0CH], 8                      ; 053A _ C7. 44 24, 0C, 00000008
        mov     dword [esp+8H], 7                       ; 0542 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-40H]                    ; 054A _ 8B. 55, C0
        mov     dword [esp+4H], edx                     ; 054D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0551 _ 89. 04 24
        call    paint_rectangle                         ; 0554 _ E8, FFFFFFFC(rel)
        jmp     ?_008                                   ; 0559 _ EB, 57

?_007:  mov     dword [esp+8H], 1                       ; 055B _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1645         ; 0563 _ C7. 44 24, 04, 00000040(d)
        mov     eax, dword [ebp-20H]                    ; 056B _ 8B. 45, E0
        mov     dword [esp], eax                        ; 056E _ 89. 04 24
        call    timer_init                              ; 0571 _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 0576 _ A1, 00000000(d)
        mov     dword [esp+18H], 111                    ; 057B _ C7. 44 24, 18, 0000006F
        mov     dword [esp+14H], 15                     ; 0583 _ C7. 44 24, 14, 0000000F
        mov     dword [esp+10H], 95                     ; 058B _ C7. 44 24, 10, 0000005F
        mov     dword [esp+0CH], 8                      ; 0593 _ C7. 44 24, 0C, 00000008
        mov     dword [esp+8H], 2                       ; 059B _ C7. 44 24, 08, 00000002
        mov     edx, dword [ebp-40H]                    ; 05A3 _ 8B. 55, C0
        mov     dword [esp+4H], edx                     ; 05A6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05AA _ 89. 04 24
        call    paint_rectangle                         ; 05AD _ E8, FFFFFFFC(rel)
?_008:  mov     dword [esp+4H], 50                      ; 05B2 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-20H]                    ; 05BA _ 8B. 45, E0
        mov     dword [esp], eax                        ; 05BD _ 89. 04 24
        call    timer_settime                           ; 05C0 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 112                    ; 05C5 _ C7. 44 24, 14, 00000070
        mov     dword [esp+10H], 16                     ; 05CD _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 96                     ; 05D5 _ C7. 44 24, 0C, 00000060
        mov     dword [esp+8H], 8                       ; 05DD _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp-38H]                    ; 05E5 _ 8B. 45, C8
        mov     dword [esp+4H], eax                     ; 05E8 _ 89. 44 24, 04
        mov     eax, dword [ebp-30H]                    ; 05EC _ 8B. 45, D0
        mov     dword [esp], eax                        ; 05EF _ 89. 04 24
        call    sheet_refresh                           ; 05F2 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 05F7 _ E9, FFFFFD18

?_009:  jmp     ?_001                                   ; 05FC _ E9, FFFFFD13
; CMain End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 0601 _ 55
        mov     ebp, esp                                ; 0602 _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 0604 _ A1, 00000000(d)
        mov     edx, eax                                ; 0609 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 060B _ 8B. 45, 08
        mov     dword [eax], edx                        ; 060E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 0610 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 0613 _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0619 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 061C _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 0622 _ 5D
        ret                                             ; 0623 _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 0624 _ 55
        mov     ebp, esp                                ; 0625 _ 89. E5
        sub     esp, 24                                 ; 0627 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1616          ; 062A _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 15                      ; 0632 _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 063A _ C7. 04 24, 00000000
        call    set_palette                             ; 0641 _ E8, FFFFFFFC(rel)
        nop                                             ; 0646 _ 90
        leave                                           ; 0647 _ C9
        ret                                             ; 0648 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0649 _ 55
        mov     ebp, esp                                ; 064A _ 89. E5
        sub     esp, 40                                 ; 064C _ 83. EC, 28
        call    io_load_eflags                          ; 064F _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 0654 _ 89. 45, F4
        call    io_cli                                  ; 0657 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 065C _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 065F _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 0663 _ C7. 04 24, 000003C8
        call    io_out8                                 ; 066A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 066F _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 0672 _ 89. 45, F0
        jmp     ?_011                                   ; 0675 _ EB, 62

?_010:  mov     eax, dword [ebp+10H]                    ; 0677 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 067A _ 0F B6. 00
        shr     al, 2                                   ; 067D _ C0. E8, 02
        movzx   eax, al                                 ; 0680 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 0683 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 0687 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 068E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0693 _ 8B. 45, 10
        add     eax, 1                                  ; 0696 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 0699 _ 0F B6. 00
        shr     al, 2                                   ; 069C _ C0. E8, 02
        movzx   eax, al                                 ; 069F _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 06A2 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 06A6 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 06AD _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 06B2 _ 8B. 45, 10
        add     eax, 2                                  ; 06B5 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 06B8 _ 0F B6. 00
        shr     al, 2                                   ; 06BB _ C0. E8, 02
        movzx   eax, al                                 ; 06BE _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 06C1 _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 06C5 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 06CC _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 06D1 _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 06D5 _ 83. 45, F0, 01
?_011:  mov     eax, dword [ebp-10H]                    ; 06D9 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 06DC _ 3B. 45, 0C
        jle     ?_010                                   ; 06DF _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 06E1 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 06E4 _ 89. 04 24
        call    io_store_eflags                         ; 06E7 _ E8, FFFFFFFC(rel)
        nop                                             ; 06EC _ 90
        leave                                           ; 06ED _ C9
        ret                                             ; 06EE _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 06EF _ 55
        mov     ebp, esp                                ; 06F0 _ 89. E5
        sub     esp, 20                                 ; 06F2 _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 06F5 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 06F8 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 06FB _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 06FE _ 89. 45, FC
        jmp     ?_015                                   ; 0701 _ EB, 33

?_012:  mov     eax, dword [ebp+14H]                    ; 0703 _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0706 _ 89. 45, F8
        jmp     ?_014                                   ; 0709 _ EB, 1F

?_013:  mov     eax, dword [ebp-4H]                     ; 070B _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 070E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0712 _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0714 _ 8B. 45, F8
        add     eax, edx                                ; 0717 _ 01. D0
        mov     edx, eax                                ; 0719 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 071B _ 8B. 45, 08
        add     edx, eax                                ; 071E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0720 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0724 _ 88. 02
        add     dword [ebp-8H], 1                       ; 0726 _ 83. 45, F8, 01
?_014:  mov     eax, dword [ebp-8H]                     ; 072A _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 072D _ 3B. 45, 1C
        jle     ?_013                                   ; 0730 _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0732 _ 83. 45, FC, 01
?_015:  mov     eax, dword [ebp-4H]                     ; 0736 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0739 _ 3B. 45, 20
        jle     ?_012                                   ; 073C _ 7E, C5
        leave                                           ; 073E _ C9
        ret                                             ; 073F _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0740 _ 55
        mov     ebp, esp                                ; 0741 _ 89. E5
        push    ebx                                     ; 0743 _ 53
        sub     esp, 28                                 ; 0744 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 0747 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 074A _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 074D _ 8B. 45, 0C
        sub     eax, 1                                  ; 0750 _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0753 _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0757 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 075B _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0763 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 076B _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0773 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0776 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 077A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 077D _ 89. 04 24
        call    paint_rectangle                         ; 0780 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0785 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0788 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 078B _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 078E _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0791 _ 8B. 45, 10
        sub     eax, 28                                 ; 0794 _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 0797 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 079B _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 079F _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 07A3 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 07AB _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 07B3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 07B6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 07BA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 07BD _ 89. 04 24
        call    paint_rectangle                         ; 07C0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 07C5 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 07C8 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 07CB _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 07CE _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 07D1 _ 8B. 45, 10
        sub     eax, 27                                 ; 07D4 _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 07D7 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 07DB _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 07DF _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 07E3 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 07EB _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 07F3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 07F6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 07FA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 07FD _ 89. 04 24
        call    paint_rectangle                         ; 0800 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0805 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0808 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 080B _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 080E _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0811 _ 8B. 45, 10
        sub     eax, 26                                 ; 0814 _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0817 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 081B _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 081F _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0823 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 082B _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0833 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0836 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 083A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 083D _ 89. 04 24
        call    paint_rectangle                         ; 0840 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0845 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0848 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 084B _ 8B. 45, 10
        sub     eax, 24                                 ; 084E _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0851 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0855 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 085D _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0861 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0869 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0871 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0874 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0878 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 087B _ 89. 04 24
        call    paint_rectangle                         ; 087E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0883 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0886 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0889 _ 8B. 45, 10
        sub     eax, 24                                 ; 088C _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 088F _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0893 _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 089B _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 089F _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 08A7 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 08AF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 08B2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 08B6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 08B9 _ 89. 04 24
        call    paint_rectangle                         ; 08BC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 08C1 _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 08C4 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 08C7 _ 8B. 45, 10
        sub     eax, 4                                  ; 08CA _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 08CD _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 08D1 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 08D9 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 08DD _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 08E5 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 08ED _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 08F0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 08F4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 08F7 _ 89. 04 24
        call    paint_rectangle                         ; 08FA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 08FF _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0902 _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0905 _ 8B. 45, 10
        sub     eax, 23                                 ; 0908 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 090B _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 090F _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0917 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 091B _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0923 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 092B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 092E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0932 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0935 _ 89. 04 24
        call    paint_rectangle                         ; 0938 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 093D _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0940 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0943 _ 8B. 45, 10
        sub     eax, 3                                  ; 0946 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0949 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 094D _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0955 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0959 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0961 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0969 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 096C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0970 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0973 _ 89. 04 24
        call    paint_rectangle                         ; 0976 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 097B _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 097E _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0981 _ 8B. 45, 10
        sub     eax, 24                                 ; 0984 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0987 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 098B _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0993 _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 0997 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 099F _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 09A7 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 09AA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 09AE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 09B1 _ 89. 04 24
        call    paint_rectangle                         ; 09B4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 09B9 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 09BC _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 09BF _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 09C2 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 09C5 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 09C8 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 09CB _ 8B. 45, 0C
        sub     eax, 47                                 ; 09CE _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 09D1 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 09D5 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 09D9 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 09DD _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 09E1 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 09E9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 09EC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 09F0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 09F3 _ 89. 04 24
        call    paint_rectangle                         ; 09F6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 09FB _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 09FE _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0A01 _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0A04 _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0A07 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0A0A _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0A0D _ 8B. 45, 0C
        sub     eax, 47                                 ; 0A10 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0A13 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0A17 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0A1B _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0A1F _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0A23 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0A2B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A2E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A32 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A35 _ 89. 04 24
        call    paint_rectangle                         ; 0A38 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0A3D _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0A40 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0A43 _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0A46 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0A49 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0A4C _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0A4F _ 8B. 45, 0C
        sub     eax, 47                                 ; 0A52 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0A55 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0A59 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0A5D _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0A61 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0A65 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0A6D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A70 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A74 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A77 _ 89. 04 24
        call    paint_rectangle                         ; 0A7A _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0A7F _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0A82 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0A85 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0A88 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0A8B _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0A8E _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0A91 _ 8B. 45, 0C
        sub     eax, 3                                  ; 0A94 _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 0A97 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0A9B _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0A9F _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0AA3 _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0AA7 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0AAF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0AB2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0AB6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0AB9 _ 89. 04 24
        call    paint_rectangle                         ; 0ABC _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0AC1 _ 83. C4, 1C
        pop     ebx                                     ; 0AC4 _ 5B
        pop     ebp                                     ; 0AC5 _ 5D
        ret                                             ; 0AC6 _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 0AC7 _ 55
        mov     ebp, esp                                ; 0AC8 _ 89. E5
        sub     esp, 16                                 ; 0ACA _ 83. EC, 10
        movzx   eax, word [?_170]                       ; 0ACD _ 0F B7. 05, 00000064(d)
        cwde                                            ; 0AD4 _ 98
        mov     dword [ebp-8H], eax                     ; 0AD5 _ 89. 45, F8
        movzx   eax, word [?_171]                       ; 0AD8 _ 0F B7. 05, 00000066(d)
        cwde                                            ; 0ADF _ 98
        mov     dword [ebp-4H], eax                     ; 0AE0 _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 0AE3 _ 8B. 45, F8
        sub     eax, 16                                 ; 0AE6 _ 83. E8, 10
        mov     edx, eax                                ; 0AE9 _ 89. C2
        shr     edx, 31                                 ; 0AEB _ C1. EA, 1F
        add     eax, edx                                ; 0AEE _ 01. D0
        sar     eax, 1                                  ; 0AF0 _ D1. F8
        mov     dword [mouse_x], eax                    ; 0AF2 _ A3, 00000184(d)
        mov     eax, dword [ebp-4H]                     ; 0AF7 _ 8B. 45, FC
        sub     eax, 44                                 ; 0AFA _ 83. E8, 2C
        mov     edx, eax                                ; 0AFD _ 89. C2
        shr     edx, 31                                 ; 0AFF _ C1. EA, 1F
        add     eax, edx                                ; 0B02 _ 01. D0
        sar     eax, 1                                  ; 0B04 _ D1. F8
        mov     dword [mouse_y], eax                    ; 0B06 _ A3, 00000188(d)
        leave                                           ; 0B0B _ C9
        ret                                             ; 0B0C _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0B0D _ 55
        mov     ebp, esp                                ; 0B0E _ 89. E5
        sub     esp, 20                                 ; 0B10 _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 0B13 _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 0B16 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0B19 _ C7. 45, FC, 00000000
        jmp     ?_025                                   ; 0B20 _ E9, 0000016E

?_016:  mov     edx, dword [ebp-4H]                     ; 0B25 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 0B28 _ 8B. 45, 18
        add     eax, edx                                ; 0B2B _ 01. D0
        movzx   eax, byte [eax]                         ; 0B2D _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0B30 _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0B33 _ 0F B6. 45, FB
        test    al, al                                  ; 0B37 _ 84. C0
        jns     ?_017                                   ; 0B39 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0B3B _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0B3E _ 8B. 55, 14
        add     eax, edx                                ; 0B41 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0B43 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B47 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0B49 _ 8B. 45, 10
        add     eax, edx                                ; 0B4C _ 01. D0
        mov     edx, eax                                ; 0B4E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0B50 _ 8B. 45, 08
        add     edx, eax                                ; 0B53 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0B55 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0B59 _ 88. 02
?_017:  movzx   eax, byte [ebp-5H]                      ; 0B5B _ 0F B6. 45, FB
        and     eax, 40H                                ; 0B5F _ 83. E0, 40
        test    eax, eax                                ; 0B62 _ 85. C0
        jz      ?_018                                   ; 0B64 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0B66 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0B69 _ 8B. 55, 14
        add     eax, edx                                ; 0B6C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0B6E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B72 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0B74 _ 8B. 45, 10
        add     eax, edx                                ; 0B77 _ 01. D0
        lea     edx, [eax+1H]                           ; 0B79 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0B7C _ 8B. 45, 08
        add     edx, eax                                ; 0B7F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0B81 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0B85 _ 88. 02
?_018:  movzx   eax, byte [ebp-5H]                      ; 0B87 _ 0F B6. 45, FB
        and     eax, 20H                                ; 0B8B _ 83. E0, 20
        test    eax, eax                                ; 0B8E _ 85. C0
        jz      ?_019                                   ; 0B90 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0B92 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0B95 _ 8B. 55, 14
        add     eax, edx                                ; 0B98 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0B9A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0B9E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0BA0 _ 8B. 45, 10
        add     eax, edx                                ; 0BA3 _ 01. D0
        lea     edx, [eax+2H]                           ; 0BA5 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0BA8 _ 8B. 45, 08
        add     edx, eax                                ; 0BAB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0BAD _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0BB1 _ 88. 02
?_019:  movzx   eax, byte [ebp-5H]                      ; 0BB3 _ 0F B6. 45, FB
        and     eax, 10H                                ; 0BB7 _ 83. E0, 10
        test    eax, eax                                ; 0BBA _ 85. C0
        jz      ?_020                                   ; 0BBC _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0BBE _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0BC1 _ 8B. 55, 14
        add     eax, edx                                ; 0BC4 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0BC6 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0BCA _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0BCC _ 8B. 45, 10
        add     eax, edx                                ; 0BCF _ 01. D0
        lea     edx, [eax+3H]                           ; 0BD1 _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0BD4 _ 8B. 45, 08
        add     edx, eax                                ; 0BD7 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0BD9 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0BDD _ 88. 02
?_020:  movzx   eax, byte [ebp-5H]                      ; 0BDF _ 0F B6. 45, FB
        and     eax, 08H                                ; 0BE3 _ 83. E0, 08
        test    eax, eax                                ; 0BE6 _ 85. C0
        jz      ?_021                                   ; 0BE8 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0BEA _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0BED _ 8B. 55, 14
        add     eax, edx                                ; 0BF0 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0BF2 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0BF6 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0BF8 _ 8B. 45, 10
        add     eax, edx                                ; 0BFB _ 01. D0
        lea     edx, [eax+4H]                           ; 0BFD _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0C00 _ 8B. 45, 08
        add     edx, eax                                ; 0C03 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0C05 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0C09 _ 88. 02
?_021:  movzx   eax, byte [ebp-5H]                      ; 0C0B _ 0F B6. 45, FB
        and     eax, 04H                                ; 0C0F _ 83. E0, 04
        test    eax, eax                                ; 0C12 _ 85. C0
        jz      ?_022                                   ; 0C14 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0C16 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0C19 _ 8B. 55, 14
        add     eax, edx                                ; 0C1C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0C1E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0C22 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0C24 _ 8B. 45, 10
        add     eax, edx                                ; 0C27 _ 01. D0
        lea     edx, [eax+5H]                           ; 0C29 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0C2C _ 8B. 45, 08
        add     edx, eax                                ; 0C2F _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0C31 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0C35 _ 88. 02
?_022:  movzx   eax, byte [ebp-5H]                      ; 0C37 _ 0F B6. 45, FB
        and     eax, 02H                                ; 0C3B _ 83. E0, 02
        test    eax, eax                                ; 0C3E _ 85. C0
        jz      ?_023                                   ; 0C40 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0C42 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0C45 _ 8B. 55, 14
        add     eax, edx                                ; 0C48 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0C4A _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0C4E _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0C50 _ 8B. 45, 10
        add     eax, edx                                ; 0C53 _ 01. D0
        lea     edx, [eax+6H]                           ; 0C55 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0C58 _ 8B. 45, 08
        add     edx, eax                                ; 0C5B _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0C5D _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0C61 _ 88. 02
?_023:  movzx   eax, byte [ebp-5H]                      ; 0C63 _ 0F B6. 45, FB
        and     eax, 01H                                ; 0C67 _ 83. E0, 01
        test    eax, eax                                ; 0C6A _ 85. C0
        jz      ?_024                                   ; 0C6C _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0C6E _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0C71 _ 8B. 55, 14
        add     eax, edx                                ; 0C74 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0C76 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0C7A _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0C7C _ 8B. 45, 10
        add     eax, edx                                ; 0C7F _ 01. D0
        lea     edx, [eax+7H]                           ; 0C81 _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0C84 _ 8B. 45, 08
        add     edx, eax                                ; 0C87 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0C89 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0C8D _ 88. 02
?_024:  add     dword [ebp-4H], 1                       ; 0C8F _ 83. 45, FC, 01
?_025:  cmp     dword [ebp-4H], 15                      ; 0C93 _ 83. 7D, FC, 0F
        jle     ?_016                                   ; 0C97 _ 0F 8E, FFFFFE88
        leave                                           ; 0C9D _ C9
        ret                                             ; 0C9E _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 0C9F _ 55
        mov     ebp, esp                                ; 0CA0 _ 89. E5
        push    ebx                                     ; 0CA2 _ 53
        sub     esp, 52                                 ; 0CA3 _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 0CA6 _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 0CA9 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 0CAC _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0CAF _ 89. 45, F4
        jmp     ?_027                                   ; 0CB2 _ EB, 4B

?_026:  movsx   ecx, byte [ebp-1CH]                     ; 0CB4 _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 0CB8 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 0CBB _ 0F B6. 00
        movsx   eax, al                                 ; 0CBE _ 0F BE. C0
        shl     eax, 4                                  ; 0CC1 _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0CC4 _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 0CCA _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 0CCD _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0CD0 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0CD3 _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 0CD5 _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 0CD9 _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 0CDD _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 0CE0 _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 0CE4 _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 0CE7 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0CEB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0CEF _ 89. 04 24
        call    paint_font                              ; 0CF2 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 0CF7 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 0CFB _ 83. 45, 18, 01
?_027:  mov     eax, dword [ebp+18H]                    ; 0CFF _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 0D02 _ 0F B6. 00
        test    al, al                                  ; 0D05 _ 84. C0
        jnz     ?_026                                   ; 0D07 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 0D09 _ 8B. 45, 14
        add     eax, 16                                 ; 0D0C _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 0D0F _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 0D13 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 0D16 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 0D1A _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 0D1D _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 0D21 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 0D24 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0D28 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D2B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D2F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D32 _ 89. 04 24
        call    sheet_refresh                           ; 0D35 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 0D3A _ 83. C4, 34
        pop     ebx                                     ; 0D3D _ 5B
        pop     ebp                                     ; 0D3E _ 5D
        ret                                             ; 0D3F _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 0D40 _ 55
        mov     ebp, esp                                ; 0D41 _ 89. E5
        sub     esp, 20                                 ; 0D43 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 0D46 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 0D49 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 0D4C _ C7. 45, F8, 00000000
        jmp     ?_034                                   ; 0D53 _ E9, 0000009C

?_028:  mov     dword [ebp-4H], 0                       ; 0D58 _ C7. 45, FC, 00000000
        jmp     ?_033                                   ; 0D5F _ E9, 00000082

?_029:  mov     eax, dword [ebp-8H]                     ; 0D64 _ 8B. 45, F8
        shl     eax, 4                                  ; 0D67 _ C1. E0, 04
        mov     edx, eax                                ; 0D6A _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0D6C _ 8B. 45, FC
        add     eax, edx                                ; 0D6F _ 01. D0
        add     eax, cursor.1684                        ; 0D71 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 0D76 _ 0F B6. 00
        cmp     al, 42                                  ; 0D79 _ 3C, 2A
        jnz     ?_030                                   ; 0D7B _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0D7D _ 8B. 45, F8
        shl     eax, 4                                  ; 0D80 _ C1. E0, 04
        mov     edx, eax                                ; 0D83 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0D85 _ 8B. 45, FC
        add     eax, edx                                ; 0D88 _ 01. D0
        mov     edx, eax                                ; 0D8A _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0D8C _ 8B. 45, 08
        add     eax, edx                                ; 0D8F _ 01. D0
        mov     byte [eax], 0                           ; 0D91 _ C6. 00, 00
        jmp     ?_032                                   ; 0D94 _ EB, 4C

?_030:  mov     eax, dword [ebp-8H]                     ; 0D96 _ 8B. 45, F8
        shl     eax, 4                                  ; 0D99 _ C1. E0, 04
        mov     edx, eax                                ; 0D9C _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0D9E _ 8B. 45, FC
        add     eax, edx                                ; 0DA1 _ 01. D0
        add     eax, cursor.1684                        ; 0DA3 _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 0DA8 _ 0F B6. 00
        cmp     al, 79                                  ; 0DAB _ 3C, 4F
        jnz     ?_031                                   ; 0DAD _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 0DAF _ 8B. 45, F8
        shl     eax, 4                                  ; 0DB2 _ C1. E0, 04
        mov     edx, eax                                ; 0DB5 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0DB7 _ 8B. 45, FC
        add     eax, edx                                ; 0DBA _ 01. D0
        mov     edx, eax                                ; 0DBC _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DBE _ 8B. 45, 08
        add     eax, edx                                ; 0DC1 _ 01. D0
        mov     byte [eax], 7                           ; 0DC3 _ C6. 00, 07
        jmp     ?_032                                   ; 0DC6 _ EB, 1A

?_031:  mov     eax, dword [ebp-8H]                     ; 0DC8 _ 8B. 45, F8
        shl     eax, 4                                  ; 0DCB _ C1. E0, 04
        mov     edx, eax                                ; 0DCE _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 0DD0 _ 8B. 45, FC
        add     eax, edx                                ; 0DD3 _ 01. D0
        mov     edx, eax                                ; 0DD5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0DD7 _ 8B. 45, 08
        add     edx, eax                                ; 0DDA _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0DDC _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0DE0 _ 88. 02
?_032:  add     dword [ebp-4H], 1                       ; 0DE2 _ 83. 45, FC, 01
?_033:  cmp     dword [ebp-4H], 15                      ; 0DE6 _ 83. 7D, FC, 0F
        jle     ?_029                                   ; 0DEA _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 0DF0 _ 83. 45, F8, 01
?_034:  cmp     dword [ebp-8H], 15                      ; 0DF4 _ 83. 7D, F8, 0F
        jle     ?_028                                   ; 0DF8 _ 0F 8E, FFFFFF5A
        leave                                           ; 0DFE _ C9
        ret                                             ; 0DFF _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 0E00 _ 55
        mov     ebp, esp                                ; 0E01 _ 89. E5
        sub     esp, 16                                 ; 0E03 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 0E06 _ C7. 45, F8, 00000000
        jmp     ?_038                                   ; 0E0D _ EB, 50

?_035:  mov     dword [ebp-4H], 0                       ; 0E0F _ C7. 45, FC, 00000000
        jmp     ?_037                                   ; 0E16 _ EB, 3B

?_036:  mov     eax, dword [ebp-8H]                     ; 0E18 _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 0E1B _ 8B. 55, 14
        add     eax, edx                                ; 0E1E _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0E20 _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 0E24 _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 0E27 _ 8B. 4D, 10
        add     edx, ecx                                ; 0E2A _ 01. CA
        add     eax, edx                                ; 0E2C _ 01. D0
        mov     edx, eax                                ; 0E2E _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E30 _ 8B. 45, 08
        add     edx, eax                                ; 0E33 _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 0E35 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 0E38 _ 0F AF. 45, 18
        mov     ecx, eax                                ; 0E3C _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 0E3E _ 8B. 45, FC
        add     eax, ecx                                ; 0E41 _ 01. C8
        mov     ecx, eax                                ; 0E43 _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 0E45 _ 8B. 45, 20
        add     eax, ecx                                ; 0E48 _ 01. C8
        movzx   eax, byte [eax]                         ; 0E4A _ 0F B6. 00
        mov     byte [edx], al                          ; 0E4D _ 88. 02
        add     dword [ebp-4H], 1                       ; 0E4F _ 83. 45, FC, 01
?_037:  mov     eax, dword [ebp-4H]                     ; 0E53 _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 0E56 _ 3B. 45, 18
        jl      ?_036                                   ; 0E59 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 0E5B _ 83. 45, F8, 01
?_038:  mov     eax, dword [ebp-8H]                     ; 0E5F _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0E62 _ 3B. 45, 1C
        jl      ?_035                                   ; 0E65 _ 7C, A8
        leave                                           ; 0E67 _ C9
        ret                                             ; 0E68 _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 0E69 _ 55
        mov     ebp, esp                                ; 0E6A _ 89. E5
        sub     esp, 24                                 ; 0E6C _ 83. EC, 18
        mov     dword [esp+8H], mousebuf                ; 0E6F _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 0E77 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 0E7F _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0E86 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], keybuf                  ; 0E8B _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 0E93 _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 0E9B _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 0EA2 _ E8, FFFFFFFC(rel)
        leave                                           ; 0EA7 _ C9
        ret                                             ; 0EA8 _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 0EA9 _ 55
        mov     ebp, esp                                ; 0EAA _ 89. E5
        sub     esp, 40                                 ; 0EAC _ 83. EC, 28
        mov     eax, dword [ebp+10H]                    ; 0EAF _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 0EB2 _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 0EB5 _ A1, 00000184(d)
        add     eax, edx                                ; 0EBA _ 01. D0
        mov     dword [mouse_x], eax                    ; 0EBC _ A3, 00000184(d)
        mov     eax, dword [ebp+10H]                    ; 0EC1 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 0EC4 _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 0EC7 _ A1, 00000188(d)
        add     eax, edx                                ; 0ECC _ 01. D0
        mov     dword [mouse_y], eax                    ; 0ECE _ A3, 00000188(d)
        mov     eax, dword [mouse_x]                    ; 0ED3 _ A1, 00000184(d)
        test    eax, eax                                ; 0ED8 _ 85. C0
        jns     ?_039                                   ; 0EDA _ 79, 0A
        mov     dword [mouse_x], 0                      ; 0EDC _ C7. 05, 00000184(d), 00000000
?_039:  mov     eax, dword [mouse_y]                    ; 0EE6 _ A1, 00000188(d)
        test    eax, eax                                ; 0EEB _ 85. C0
        jns     ?_040                                   ; 0EED _ 79, 0A
        mov     dword [mouse_y], 0                      ; 0EEF _ C7. 05, 00000188(d), 00000000
?_040:  movzx   eax, word [?_170]                       ; 0EF9 _ 0F B7. 05, 00000064(d)
        cwde                                            ; 0F00 _ 98
        lea     edx, [eax-10H]                          ; 0F01 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 0F04 _ A1, 00000184(d)
        cmp     edx, eax                                ; 0F09 _ 39. C2
        jge     ?_041                                   ; 0F0B _ 7D, 10
        movzx   eax, word [?_170]                       ; 0F0D _ 0F B7. 05, 00000064(d)
        cwde                                            ; 0F14 _ 98
        sub     eax, 16                                 ; 0F15 _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 0F18 _ A3, 00000184(d)
?_041:  movzx   eax, word [?_170]                       ; 0F1D _ 0F B7. 05, 00000064(d)
        cwde                                            ; 0F24 _ 98
        lea     edx, [eax-10H]                          ; 0F25 _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 0F28 _ A1, 00000188(d)
        cmp     edx, eax                                ; 0F2D _ 39. C2
        jge     ?_042                                   ; 0F2F _ 7D, 10
        movzx   eax, word [?_170]                       ; 0F31 _ 0F B7. 05, 00000064(d)
        cwde                                            ; 0F38 _ 98
        sub     eax, 16                                 ; 0F39 _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 0F3C _ A3, 00000188(d)
?_042:  mov     dword [esp+14H], 7                      ; 0F41 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_161                  ; 0F49 _ C7. 44 24, 10, 00000017(d)
        mov     dword [esp+0CH], 0                      ; 0F51 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 0F59 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0F61 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0F64 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0F68 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0F6B _ 89. 04 24
        call    paint_string                            ; 0F6E _ E8, FFFFFFFC(rel)
        leave                                           ; 0F73 _ C9
        ret                                             ; 0F74 _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 0F75 _ 55
        mov     ebp, esp                                ; 0F76 _ 89. E5
        sub     esp, 40                                 ; 0F78 _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 0F7B _ C6. 45, F7, 00
        call    io_sti                                  ; 0F7F _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 0F84 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 0F8B _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 0F90 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 0F93 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 0F97 _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 0F9B _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 0FA2 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0FA7 _ 85. C0
        jz      ?_043                                   ; 0FA9 _ 74, 3F
        mov     dword [esp+8H], mouse_send_info         ; 0FAB _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 0FB3 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0FB6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0FBA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0FBD _ 89. 04 24
        call    compute_mouse_position                  ; 0FC0 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 0FC5 _ 8B. 15, 00000188(d)
        mov     eax, dword [mouse_x]                    ; 0FCB _ A1, 00000184(d)
        mov     dword [esp+0CH], edx                    ; 0FD0 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 0FD4 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 0FD8 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 0FDB _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0FDF _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0FE2 _ 89. 04 24
        call    sheet_slide                             ; 0FE5 _ E8, FFFFFFFC(rel)
?_043:  leave                                           ; 0FEA _ C9
        ret                                             ; 0FEB _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 0FEC _ 55
        mov     ebp, esp                                ; 0FED _ 89. E5
        sub     esp, 88                                 ; 0FEF _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 0FF2 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 0FF9 _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 1000 _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 1007 _ A1, 00000060(d)
        mov     dword [ebp-2CH], eax                    ; 100C _ 89. 45, D4
        movzx   eax, word [?_170]                       ; 100F _ 0F B7. 05, 00000064(d)
        cwde                                            ; 1016 _ 98
        mov     dword [ebp-28H], eax                    ; 1017 _ 89. 45, D8
        movzx   eax, word [?_171]                       ; 101A _ 0F B7. 05, 00000066(d)
        cwde                                            ; 1021 _ 98
        mov     dword [ebp-24H], eax                    ; 1022 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 1025 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1028 _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 102A _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 102D _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 1031 _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 1034 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1038 _ 89. 04 24
        call    init_desktop                            ; 103B _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1040 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_162                  ; 1048 _ C7. 44 24, 10, 0000002E(d)
        mov     eax, dword [ebp-34H]                    ; 1050 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1053 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1057 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 105A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 105E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1061 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1065 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1068 _ 89. 04 24
        call    paint_string                            ; 106B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 1070 _ 8B. 45, 14
        mov     dword [esp], eax                        ; 1073 _ 89. 04 24
        call    intToHexStr                             ; 1076 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 107B _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 107E _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 1086 _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 1089 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 108D _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1090 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1094 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1097 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 109B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 109E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 10A2 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 10A5 _ 89. 04 24
        call    paint_string                            ; 10A8 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 10AD _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 10B1 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_163                  ; 10B9 _ C7. 44 24, 10, 00000038(d)
        mov     eax, dword [ebp-34H]                    ; 10C1 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 10C4 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 10C8 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 10CB _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 10CF _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 10D2 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 10D6 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 10D9 _ 89. 04 24
        call    paint_string                            ; 10DC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 10E1 _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 10E4 _ 8B. 00
        mov     dword [esp], eax                        ; 10E6 _ 89. 04 24
        call    intToHexStr                             ; 10E9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 10EE _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 10F1 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 10F9 _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 10FC _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1100 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1103 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1107 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 110A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 110E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1111 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1115 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1118 _ 89. 04 24
        call    paint_string                            ; 111B _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1120 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1124 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_164                  ; 112C _ C7. 44 24, 10, 00000044(d)
        mov     eax, dword [ebp-34H]                    ; 1134 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1137 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 113B _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 113E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1142 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1145 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1149 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 114C _ 89. 04 24
        call    paint_string                            ; 114F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1154 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 1157 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 115A _ 89. 04 24
        call    intToHexStr                             ; 115D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1162 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 1165 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 116D _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 1170 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1174 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1177 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 117B _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 117E _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1182 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1185 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1189 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 118C _ 89. 04 24
        call    paint_string                            ; 118F _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1194 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1198 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_165                  ; 11A0 _ C7. 44 24, 10, 00000050(d)
        mov     eax, dword [ebp-34H]                    ; 11A8 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 11AB _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 11AF _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 11B2 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 11B6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 11B9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 11BD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 11C0 _ 89. 04 24
        call    paint_string                            ; 11C3 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 11C8 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 11CB _ 8B. 40, 08
        mov     dword [esp], eax                        ; 11CE _ 89. 04 24
        call    intToHexStr                             ; 11D1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 11D6 _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 11D9 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 11E1 _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 11E4 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 11E8 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 11EB _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 11EF _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 11F2 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 11F6 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 11F9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 11FD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1200 _ 89. 04 24
        call    paint_string                            ; 1203 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1208 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 120C _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_166                  ; 1214 _ C7. 44 24, 10, 0000005C(d)
        mov     eax, dword [ebp-34H]                    ; 121C _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 121F _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1223 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1226 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 122A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 122D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1231 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1234 _ 89. 04 24
        call    paint_string                            ; 1237 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 123C _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 123F _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 1242 _ 89. 04 24
        call    intToHexStr                             ; 1245 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 124A _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 124D _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 1255 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 1258 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 125C _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 125F _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1263 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1266 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 126A _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 126D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1271 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1274 _ 89. 04 24
        call    paint_string                            ; 1277 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 127C _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1280 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_167                  ; 1288 _ C7. 44 24, 10, 00000069(d)
        mov     eax, dword [ebp-34H]                    ; 1290 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1293 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1297 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 129A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 129E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 12A1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 12A5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 12A8 _ 89. 04 24
        call    paint_string                            ; 12AB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 12B0 _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 12B3 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 12B6 _ 89. 04 24
        call    intToHexStr                             ; 12B9 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 12BE _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 12C1 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 12C9 _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 12CC _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 12D0 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 12D3 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 12D7 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 12DA _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 12DE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 12E1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 12E5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 12E8 _ 89. 04 24
        call    paint_string                            ; 12EB _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 12F0 _ 83. 45, CC, 10
        leave                                           ; 12F4 _ C9
        ret                                             ; 12F5 _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 12F6 _ 55
        mov     ebp, esp                                ; 12F7 _ 89. E5
        sub     esp, 56                                 ; 12F9 _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 12FC _ 8B. 45, 08
        mov     dword [esp], eax                        ; 12FF _ 89. 04 24
        call    sheet_alloc                             ; 1302 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1307 _ 89. 45, F0
        mov     eax, dword [memman]                     ; 130A _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 130F _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 1317 _ 89. 04 24
        call    memman_alloc_4k                         ; 131A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 131F _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 1322 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 132A _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 1332 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 133A _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 133D _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 1341 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1344 _ 89. 04 24
        call    sheet_setbuf                            ; 1347 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 134C _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 134F _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 1353 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1356 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 135A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 135D _ 89. 04 24
        call    make_windows                            ; 1360 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 72                     ; 1365 _ C7. 44 24, 0C, 00000048
        mov     dword [esp+8H], 80                      ; 136D _ C7. 44 24, 08, 00000050
        mov     eax, dword [ebp-10H]                    ; 1375 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1378 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 137C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 137F _ 89. 04 24
        call    sheet_slide                             ; 1382 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 1387 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 138F _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1392 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1396 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1399 _ 89. 04 24
        call    sheet_updown                            ; 139C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 13A1 _ 8B. 45, F0
        leave                                           ; 13A4 _ C9
        ret                                             ; 13A5 _ C3
; message_box End of function

make_windows:; Function begin
        push    ebp                                     ; 13A6 _ 55
        mov     ebp, esp                                ; 13A7 _ 89. E5
        push    ebx                                     ; 13A9 _ 53
        sub     esp, 68                                 ; 13AA _ 83. EC, 44
        mov     eax, dword [ebp+0CH]                    ; 13AD _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 13B0 _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 13B3 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 13B6 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 13B9 _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 13BC _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 13BF _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 13C2 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 13C5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 13C8 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 13CA _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 13D2 _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 13D6 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 13DE _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 13E6 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 13EE _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 13F1 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 13F5 _ 89. 04 24
        call    paint_rectangle                         ; 13F8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 13FD _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1400 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1403 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1406 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 1408 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 1410 _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 1414 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 141C _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1424 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 142C _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 142F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1433 _ 89. 04 24
        call    paint_rectangle                         ; 1436 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 143B _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 143E _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1441 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1444 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1446 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 144A _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 1452 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 145A _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1462 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 146A _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 146D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1471 _ 89. 04 24
        call    paint_rectangle                         ; 1474 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1479 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 147C _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 147F _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1482 _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1484 _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 1488 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 1490 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1498 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 14A0 _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 14A8 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 14AB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 14AF _ 89. 04 24
        call    paint_rectangle                         ; 14B2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 14B7 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 14BA _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 14BD _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 14C0 _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 14C3 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 14C6 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 14C9 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 14CC _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 14CE _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 14D2 _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 14D6 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 14DE _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 14E2 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 14EA _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 14ED _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 14F1 _ 89. 04 24
        call    paint_rectangle                         ; 14F4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 14F9 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 14FC _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 14FF _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1502 _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1505 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1508 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 150B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 150E _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1510 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1514 _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 1518 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 1520 _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 1524 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 152C _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 152F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1533 _ 89. 04 24
        call    paint_rectangle                         ; 1536 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 153B _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 153E _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1541 _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1544 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1547 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 154A _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 154C _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1550 _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 1554 _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 155C _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 1564 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 156C _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 156F _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1573 _ 89. 04 24
        call    paint_rectangle                         ; 1576 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 157B _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 157E _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1581 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1584 _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1586 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 158E _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 1592 _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 159A _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 15A2 _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 15AA _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 15AD _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 15B1 _ 89. 04 24
        call    paint_rectangle                         ; 15B4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 15B9 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 15BC _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 15BF _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 15C2 _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 15C5 _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 15C8 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 15CB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 15CE _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 15D0 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 15D4 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 15D8 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 15DC _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 15E4 _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 15EC _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 15EF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 15F3 _ 89. 04 24
        call    paint_rectangle                         ; 15F6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 15FB _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 15FE _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1601 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1604 _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1607 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 160A _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 160D _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1610 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1612 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1616 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 161A _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 161E _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 1626 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 162E _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1631 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1635 _ 89. 04 24
        call    paint_rectangle                         ; 1638 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 163D _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp+10H]                    ; 1645 _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1648 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 164C _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 1654 _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 165C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 165F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1663 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1666 _ 89. 04 24
        call    paint_string                            ; 1669 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 166E _ C7. 45, EC, 00000000
        jmp     ?_051                                   ; 1675 _ E9, 00000083

?_044:  mov     dword [ebp-18H], 0                      ; 167A _ C7. 45, E8, 00000000
        jmp     ?_050                                   ; 1681 _ EB, 70

?_045:  mov     eax, dword [ebp-14H]                    ; 1683 _ 8B. 45, EC
        shl     eax, 4                                  ; 1686 _ C1. E0, 04
        mov     edx, eax                                ; 1689 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 168B _ 8B. 45, E8
        add     eax, edx                                ; 168E _ 01. D0
        add     eax, closebtn.1752                      ; 1690 _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 1695 _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 1698 _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 169B _ 80. 7D, E7, 40
        jnz     ?_046                                   ; 169F _ 75, 06
        mov     byte [ebp-19H], 0                       ; 16A1 _ C6. 45, E7, 00
        jmp     ?_049                                   ; 16A5 _ EB, 1C

?_046:  cmp     byte [ebp-19H], 36                      ; 16A7 _ 80. 7D, E7, 24
        jnz     ?_047                                   ; 16AB _ 75, 06
        mov     byte [ebp-19H], 15                      ; 16AD _ C6. 45, E7, 0F
        jmp     ?_049                                   ; 16B1 _ EB, 10

?_047:  cmp     byte [ebp-19H], 81                      ; 16B3 _ 80. 7D, E7, 51
        jnz     ?_048                                   ; 16B7 _ 75, 06
        mov     byte [ebp-19H], 8                       ; 16B9 _ C6. 45, E7, 08
        jmp     ?_049                                   ; 16BD _ EB, 04

?_048:  mov     byte [ebp-19H], 7                       ; 16BF _ C6. 45, E7, 07
?_049:  mov     eax, dword [ebp+0CH]                    ; 16C3 _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 16C6 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 16C8 _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 16CB _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 16CE _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 16D1 _ 8B. 40, 04
        imul    ecx, eax                                ; 16D4 _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 16D7 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 16DA _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 16DD _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 16E0 _ 8B. 45, E8
        add     eax, ebx                                ; 16E3 _ 01. D8
        add     eax, ecx                                ; 16E5 _ 01. C8
        add     edx, eax                                ; 16E7 _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 16E9 _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 16ED _ 88. 02
        add     dword [ebp-18H], 1                      ; 16EF _ 83. 45, E8, 01
?_050:  cmp     dword [ebp-18H], 15                     ; 16F3 _ 83. 7D, E8, 0F
        jle     ?_045                                   ; 16F7 _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 16F9 _ 83. 45, EC, 01
?_051:  cmp     dword [ebp-14H], 13                     ; 16FD _ 83. 7D, EC, 0D
        jle     ?_044                                   ; 1701 _ 0F 8E, FFFFFF73
        add     esp, 68                                 ; 1707 _ 83. C4, 44
        pop     ebx                                     ; 170A _ 5B
        pop     ebp                                     ; 170B _ 5D
        ret                                             ; 170C _ C3
; make_windows End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 170D _ 55
        mov     ebp, esp                                ; 170E _ 89. E5
        sub     esp, 24                                 ; 1710 _ 83. EC, 18
?_052:  mov     dword [esp], 100                        ; 1713 _ C7. 04 24, 00000064
        call    io_in8                                  ; 171A _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 171F _ 83. E0, 02
        test    eax, eax                                ; 1722 _ 85. C0
        jnz     ?_053                                   ; 1724 _ 75, 02
        jmp     ?_054                                   ; 1726 _ EB, 02

?_053:  jmp     ?_052                                   ; 1728 _ EB, E9

?_054:  leave                                           ; 172A _ C9
        ret                                             ; 172B _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 172C _ 55
        mov     ebp, esp                                ; 172D _ 89. E5
        sub     esp, 24                                 ; 172F _ 83. EC, 18
        call    wait_KBC_sendready                      ; 1732 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 1737 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 173F _ C7. 04 24, 00000064
        call    io_out8                                 ; 1746 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 174B _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 1750 _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 1758 _ C7. 04 24, 00000060
        call    io_out8                                 ; 175F _ E8, FFFFFFFC(rel)
        leave                                           ; 1764 _ C9
        ret                                             ; 1765 _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 1766 _ 55
        mov     ebp, esp                                ; 1767 _ 89. E5
        sub     esp, 24                                 ; 1769 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 176C _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 1771 _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 1779 _ C7. 04 24, 00000064
        call    io_out8                                 ; 1780 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 1785 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 178A _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 1792 _ C7. 04 24, 00000060
        call    io_out8                                 ; 1799 _ E8, FFFFFFFC(rel)
        leave                                           ; 179E _ C9
        ret                                             ; 179F _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 17A0 _ 55
        mov     ebp, esp                                ; 17A1 _ 89. E5
        sub     esp, 4                                  ; 17A3 _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 17A6 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 17A9 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 17AC _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 17AF _ 0F B6. 40, 03
        test    al, al                                  ; 17B3 _ 84. C0
        jnz     ?_056                                   ; 17B5 _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 17B7 _ 80. 7D, FC, FA
        jnz     ?_055                                   ; 17BB _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 17BD _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 17C0 _ C6. 40, 03, 01
?_055:  mov     eax, 0                                  ; 17C4 _ B8, 00000000
        jmp     ?_063                                   ; 17C9 _ E9, 0000010F

?_056:  mov     eax, dword [ebp+8H]                     ; 17CE _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 17D1 _ 0F B6. 40, 03
        cmp     al, 1                                   ; 17D5 _ 3C, 01
        jnz     ?_058                                   ; 17D7 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 17D9 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 17DD _ 25, 000000C8
        cmp     eax, 8                                  ; 17E2 _ 83. F8, 08
        jnz     ?_057                                   ; 17E5 _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 17E7 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 17EA _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 17EE _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 17F0 _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 17F3 _ C6. 40, 03, 02
?_057:  mov     eax, 0                                  ; 17F7 _ B8, 00000000
        jmp     ?_063                                   ; 17FC _ E9, 000000DC

?_058:  mov     eax, dword [ebp+8H]                     ; 1801 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1804 _ 0F B6. 40, 03
        cmp     al, 2                                   ; 1808 _ 3C, 02
        jnz     ?_059                                   ; 180A _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 180C _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 180F _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 1813 _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1816 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 1819 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 181D _ B8, 00000000
        jmp     ?_063                                   ; 1822 _ E9, 000000B6

?_059:  mov     eax, dword [ebp+8H]                     ; 1827 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 182A _ 0F B6. 40, 03
        cmp     al, 3                                   ; 182E _ 3C, 03
        jne     ?_062                                   ; 1830 _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 1836 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1839 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 183D _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1840 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1843 _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 1847 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 184A _ 0F B6. 00
        movzx   eax, al                                 ; 184D _ 0F B6. C0
        and     eax, 07H                                ; 1850 _ 83. E0, 07
        mov     edx, eax                                ; 1853 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1855 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1858 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 185B _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 185E _ 0F B6. 40, 01
        movzx   edx, al                                 ; 1862 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1865 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1868 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 186B _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 186E _ 0F B6. 40, 02
        movzx   edx, al                                 ; 1872 _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1875 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1878 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 187B _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 187E _ 0F B6. 00
        movzx   eax, al                                 ; 1881 _ 0F B6. C0
        and     eax, 10H                                ; 1884 _ 83. E0, 10
        test    eax, eax                                ; 1887 _ 85. C0
        jz      ?_060                                   ; 1889 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 188B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 188E _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 1891 _ 0D, FFFFFF00
        mov     edx, eax                                ; 1896 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1898 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 189B _ 89. 50, 04
?_060:  mov     eax, dword [ebp+8H]                     ; 189E _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 18A1 _ 0F B6. 00
        movzx   eax, al                                 ; 18A4 _ 0F B6. C0
        and     eax, 20H                                ; 18A7 _ 83. E0, 20
        test    eax, eax                                ; 18AA _ 85. C0
        jz      ?_061                                   ; 18AC _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 18AE _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 18B1 _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 18B4 _ 0D, FFFFFF00
        mov     edx, eax                                ; 18B9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 18BB _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 18BE _ 89. 50, 08
?_061:  mov     eax, dword [ebp+8H]                     ; 18C1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 18C4 _ 8B. 40, 08
        neg     eax                                     ; 18C7 _ F7. D8
        mov     edx, eax                                ; 18C9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 18CB _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 18CE _ 89. 50, 08
        mov     eax, 1                                  ; 18D1 _ B8, 00000001
        jmp     ?_063                                   ; 18D6 _ EB, 05

?_062:  mov     eax, 4294967295                         ; 18D8 _ B8, FFFFFFFF
?_063:  leave                                           ; 18DD _ C9
        ret                                             ; 18DE _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 18DF _ 55
        mov     ebp, esp                                ; 18E0 _ 89. E5
        sub     esp, 40                                 ; 18E2 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 18E5 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 18ED _ C7. 04 24, 00000020
        call    io_out8                                 ; 18F4 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 18F9 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 1901 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 1908 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 190D _ C7. 04 24, 00000060
        call    io_in8                                  ; 1914 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 1919 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 191C _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1920 _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 1924 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 192B _ E8, FFFFFFFC(rel)
        leave                                           ; 1930 _ C9
        ret                                             ; 1931 _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 1932 _ 55
        mov     ebp, esp                                ; 1933 _ 89. E5
        sub     esp, 40                                 ; 1935 _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 1938 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 1940 _ C7. 04 24, 00000020
        call    io_out8                                 ; 1947 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 194C _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 1954 _ C7. 04 24, 000000A0
        call    io_out8                                 ; 195B _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 1960 _ C7. 04 24, 00000060
        call    io_in8                                  ; 1967 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 196C _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 196F _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1973 _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 1977 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 197E _ E8, FFFFFFFC(rel)
        leave                                           ; 1983 _ C9
        ret                                             ; 1984 _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 1985 _ 55
        mov     ebp, esp                                ; 1986 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1988 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 198B _ 8B. 55, 10
        mov     dword [eax], edx                        ; 198E _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1990 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1993 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 199A _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 199D _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 19A4 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 19A7 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 19AA _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 19AD _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 19B0 _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 19B3 _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 19B6 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 19B9 _ C7. 40, 14, 00000000
        pop     ebp                                     ; 19C0 _ 5D
        ret                                             ; 19C1 _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 19C2 _ 55
        mov     ebp, esp                                ; 19C3 _ 89. E5
        sub     esp, 20                                 ; 19C5 _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 19C8 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 19CB _ 88. 45, EC
        mov     eax, dword [ebp+8H]                     ; 19CE _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 19D1 _ 8B. 40, 10
        test    eax, eax                                ; 19D4 _ 85. C0
        jnz     ?_064                                   ; 19D6 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 19D8 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 19DB _ 8B. 40, 14
        or      eax, 01H                                ; 19DE _ 83. C8, 01
        mov     edx, eax                                ; 19E1 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 19E3 _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 19E6 _ 89. 50, 14
        mov     eax, 4294967295                         ; 19E9 _ B8, FFFFFFFF
        jmp     ?_066                                   ; 19EE _ EB, 56

?_064:  mov     eax, dword [ebp+8H]                     ; 19F0 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 19F3 _ 8B. 40, 04
        mov     dword [ebp-4H], eax                     ; 19F6 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 19F9 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 19FC _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 19FE _ 8B. 45, FC
        add     edx, eax                                ; 1A01 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1A03 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1A07 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 1A09 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1A0C _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 1A0F _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1A12 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1A15 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A18 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1A1B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1A1E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1A21 _ 8B. 40, 0C
        cmp     edx, eax                                ; 1A24 _ 39. C2
        jnz     ?_065                                   ; 1A26 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 1A28 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1A2B _ C7. 40, 04, 00000000
?_065:  mov     eax, dword [ebp+8H]                     ; 1A32 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1A35 _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 1A38 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1A3B _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1A3E _ 89. 50, 10
        mov     eax, 0                                  ; 1A41 _ B8, 00000000
?_066:  leave                                           ; 1A46 _ C9
        ret                                             ; 1A47 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 1A48 _ 55
        mov     ebp, esp                                ; 1A49 _ 89. E5
        sub     esp, 16                                 ; 1A4B _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 1A4E _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 1A51 _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 1A54 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1A57 _ 8B. 40, 0C
        cmp     edx, eax                                ; 1A5A _ 39. C2
        jnz     ?_067                                   ; 1A5C _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 1A5E _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 1A61 _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 1A68 _ B8, FFFFFFFF
        jmp     ?_069                                   ; 1A6D _ EB, 57

?_067:  mov     eax, dword [ebp+8H]                     ; 1A6F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1A72 _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 1A75 _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 1A78 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1A7B _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 1A7D _ 8B. 45, F8
        add     eax, edx                                ; 1A80 _ 01. D0
        movzx   eax, byte [eax]                         ; 1A82 _ 0F B6. 00
        movzx   eax, al                                 ; 1A85 _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 1A88 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1A8B _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1A8E _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 1A91 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1A94 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1A97 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1A9A _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 1A9D _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1AA0 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1AA3 _ 8B. 40, 0C
        cmp     edx, eax                                ; 1AA6 _ 39. C2
        jnz     ?_068                                   ; 1AA8 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 1AAA _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1AAD _ C7. 40, 08, 00000000
?_068:  mov     eax, dword [ebp+8H]                     ; 1AB4 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1AB7 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 1ABA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1ABD _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 1AC0 _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 1AC3 _ 8B. 45, FC
?_069:  leave                                           ; 1AC6 _ C9
        ret                                             ; 1AC7 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 1AC8 _ 55
        mov     ebp, esp                                ; 1AC9 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1ACB _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 1ACE _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1AD1 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1AD4 _ 8B. 40, 10
        sub     edx, eax                                ; 1AD7 _ 29. C2
        mov     eax, edx                                ; 1AD9 _ 89. D0
        pop     ebp                                     ; 1ADB _ 5D
        ret                                             ; 1ADC _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 1ADD _ 55
        mov     ebp, esp                                ; 1ADE _ 89. E5
        sub     esp, 4                                  ; 1AE0 _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 1AE3 _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 1AE6 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 1AE9 _ 80. 7D, FC, 09
        jle     ?_070                                   ; 1AED _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 1AEF _ 0F B6. 45, FC
        add     eax, 55                                 ; 1AF3 _ 83. C0, 37
        jmp     ?_071                                   ; 1AF6 _ EB, 07

?_070:  movzx   eax, byte [ebp-4H]                      ; 1AF8 _ 0F B6. 45, FC
        add     eax, 48                                 ; 1AFC _ 83. C0, 30
?_071:  leave                                           ; 1AFF _ C9
        ret                                             ; 1B00 _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 1B01 _ 55
        mov     ebp, esp                                ; 1B02 _ 89. E5
        sub     esp, 24                                 ; 1B04 _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 1B07 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 1B0A _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 1B0D _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 1B14 _ 0F B6. 45, EC
        and     eax, 0FH                                ; 1B18 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 1B1B _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 1B1E _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 1B22 _ 89. 04 24
        call    charToHexVal                            ; 1B25 _ E8, FFFFFFFC(rel)
        mov     byte [?_169], al                        ; 1B2A _ A2, 000002A3(d)
        movzx   eax, byte [ebp-14H]                     ; 1B2F _ 0F B6. 45, EC
        shr     al, 4                                   ; 1B33 _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 1B36 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 1B39 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 1B3D _ 0F BE. C0
        mov     dword [esp], eax                        ; 1B40 _ 89. 04 24
        call    charToHexVal                            ; 1B43 _ E8, FFFFFFFC(rel)
        mov     byte [?_168], al                        ; 1B48 _ A2, 000002A2(d)
        mov     eax, keyval                             ; 1B4D _ B8, 000002A0(d)
        leave                                           ; 1B52 _ C9
        ret                                             ; 1B53 _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 1B54 _ 55
        mov     ebp, esp                                ; 1B55 _ 89. E5
        sub     esp, 16                                 ; 1B57 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 1B5A _ C6. 05, 00000280(d), 30
        mov     byte [?_172], 88                        ; 1B61 _ C6. 05, 00000281(d), 58
        mov     byte [?_173], 0                         ; 1B68 _ C6. 05, 0000028A(d), 00
        mov     dword [ebp-0CH], 2                      ; 1B6F _ C7. 45, F4, 00000002
        jmp     ?_073                                   ; 1B76 _ EB, 0F

?_072:  mov     eax, dword [ebp-0CH]                    ; 1B78 _ 8B. 45, F4
        add     eax, str.1386                           ; 1B7B _ 05, 00000280(d)
        mov     byte [eax], 48                          ; 1B80 _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 1B83 _ 83. 45, F4, 01
?_073:  cmp     dword [ebp-0CH], 9                      ; 1B87 _ 83. 7D, F4, 09
        jle     ?_072                                   ; 1B8B _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 1B8D _ C7. 45, F8, 00000009
        jmp     ?_077                                   ; 1B94 _ EB, 40

?_074:  mov     eax, dword [ebp+8H]                     ; 1B96 _ 8B. 45, 08
        and     eax, 0FH                                ; 1B99 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 1B9C _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1B9F _ 8B. 45, 08
        shr     eax, 4                                  ; 1BA2 _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 1BA5 _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 1BA8 _ 83. 7D, FC, 09
        jle     ?_075                                   ; 1BAC _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 1BAE _ 8B. 45, FC
        add     eax, 55                                 ; 1BB1 _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 1BB4 _ 8B. 55, F8
        add     edx, str.1386                           ; 1BB7 _ 81. C2, 00000280(d)
        mov     byte [edx], al                          ; 1BBD _ 88. 02
        jmp     ?_076                                   ; 1BBF _ EB, 11

?_075:  mov     eax, dword [ebp-4H]                     ; 1BC1 _ 8B. 45, FC
        add     eax, 48                                 ; 1BC4 _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 1BC7 _ 8B. 55, F8
        add     edx, str.1386                           ; 1BCA _ 81. C2, 00000280(d)
        mov     byte [edx], al                          ; 1BD0 _ 88. 02
?_076:  sub     dword [ebp-8H], 1                       ; 1BD2 _ 83. 6D, F8, 01
?_077:  cmp     dword [ebp-8H], 1                       ; 1BD6 _ 83. 7D, F8, 01
        jle     ?_078                                   ; 1BDA _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 1BDC _ 83. 7D, 08, 00
        jnz     ?_074                                   ; 1BE0 _ 75, B4
?_078:  mov     eax, str.1386                           ; 1BE2 _ B8, 00000280(d)
        leave                                           ; 1BE7 _ C9
        ret                                             ; 1BE8 _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 1BE9 _ 55
        mov     ebp, esp                                ; 1BEA _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1BEC _ 8B. 45, 08
        mov     dword [eax], 0                          ; 1BEF _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 1BF5 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1BF8 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1BFF _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1C02 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1C09 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 1C0C _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 1C13 _ 5D
        ret                                             ; 1C14 _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 1C15 _ 55
        mov     ebp, esp                                ; 1C16 _ 89. E5
        sub     esp, 16                                 ; 1C18 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 1C1B _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 1C22 _ C7. 45, F8, 00000000
        jmp     ?_080                                   ; 1C29 _ EB, 14

?_079:  mov     eax, dword [ebp+8H]                     ; 1C2B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C2E _ 8B. 55, F8
        add     edx, 2                                  ; 1C31 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1C34 _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 1C38 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 1C3B _ 83. 45, F8, 01
?_080:  mov     eax, dword [ebp+8H]                     ; 1C3F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1C42 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 1C44 _ 3B. 45, F8
        ja      ?_079                                   ; 1C47 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 1C49 _ 8B. 45, FC
        leave                                           ; 1C4C _ C9
        ret                                             ; 1C4D _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 1C4E _ 55
        mov     ebp, esp                                ; 1C4F _ 89. E5
        sub     esp, 16                                 ; 1C51 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1C54 _ C7. 45, F8, 00000000
        jmp     ?_084                                   ; 1C5B _ E9, 00000085

?_081:  mov     eax, dword [ebp+8H]                     ; 1C60 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C63 _ 8B. 55, F8
        add     edx, 2                                  ; 1C66 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1C69 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 1C6D _ 3B. 45, 0C
        jc      ?_083                                   ; 1C70 _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 1C72 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C75 _ 8B. 55, F8
        add     edx, 2                                  ; 1C78 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1C7B _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 1C7E _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1C81 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C84 _ 8B. 55, F8
        add     edx, 2                                  ; 1C87 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1C8A _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 1C8D _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 1C90 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1C93 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1C96 _ 8B. 55, F8
        add     edx, 2                                  ; 1C99 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 1C9C _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 1C9F _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1CA2 _ 8B. 55, F8
        add     edx, 2                                  ; 1CA5 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1CA8 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 1CAC _ 2B. 45, 0C
        mov     edx, eax                                ; 1CAF _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1CB1 _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 1CB4 _ 8B. 4D, F8
        add     ecx, 2                                  ; 1CB7 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 1CBA _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 1CBE _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 1CC1 _ 8B. 55, F8
        add     edx, 2                                  ; 1CC4 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 1CC7 _ 8B. 44 D0, 04
        test    eax, eax                                ; 1CCB _ 85. C0
        jnz     ?_082                                   ; 1CCD _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 1CCF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1CD2 _ 8B. 00
        lea     edx, [eax-1H]                           ; 1CD4 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1CD7 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1CDA _ 89. 10
?_082:  mov     eax, dword [ebp-4H]                     ; 1CDC _ 8B. 45, FC
        jmp     ?_085                                   ; 1CDF _ EB, 17

?_083:  add     dword [ebp-8H], 1                       ; 1CE1 _ 83. 45, F8, 01
?_084:  mov     eax, dword [ebp+8H]                     ; 1CE5 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1CE8 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 1CEA _ 3B. 45, F8
        ja      ?_081                                   ; 1CED _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 1CF3 _ B8, 00000000
?_085:  leave                                           ; 1CF8 _ C9
        ret                                             ; 1CF9 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 1CFA _ 55
        mov     ebp, esp                                ; 1CFB _ 89. E5
        push    ebx                                     ; 1CFD _ 53
        sub     esp, 16                                 ; 1CFE _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 1D01 _ C7. 45, F4, 00000000
        jmp     ?_088                                   ; 1D08 _ EB, 17

?_086:  mov     eax, dword [ebp+8H]                     ; 1D0A _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1D0D _ 8B. 55, F4
        add     edx, 2                                  ; 1D10 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1D13 _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 1D16 _ 3B. 45, 0C
        jbe     ?_087                                   ; 1D19 _ 76, 02
        jmp     ?_089                                   ; 1D1B _ EB, 0E

?_087:  add     dword [ebp-0CH], 1                      ; 1D1D _ 83. 45, F4, 01
?_088:  mov     eax, dword [ebp+8H]                     ; 1D21 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D24 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1D26 _ 3B. 45, F4
        jg      ?_086                                   ; 1D29 _ 7F, DF
?_089:  cmp     dword [ebp-0CH], 0                      ; 1D2B _ 83. 7D, F4, 00
        jle     ?_091                                   ; 1D2F _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 1D35 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1D38 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1D3B _ 8B. 45, 08
        add     edx, 2                                  ; 1D3E _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 1D41 _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 1D44 _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 1D47 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 1D4A _ 8B. 45, 08
        add     ecx, 2                                  ; 1D4D _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1D50 _ 8B. 44 C8, 04
        add     eax, edx                                ; 1D54 _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 1D56 _ 3B. 45, 0C
        jne     ?_091                                   ; 1D59 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 1D5F _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1D62 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1D65 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1D68 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1D6B _ 8B. 45, 08
        add     edx, 2                                  ; 1D6E _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1D71 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1D75 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1D78 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1D7B _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1D7E _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1D81 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1D85 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1D88 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1D8A _ 3B. 45, F4
        jle     ?_090                                   ; 1D8D _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 1D8F _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 1D92 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 1D95 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1D98 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1D9B _ 8B. 55, F4
        add     edx, 2                                  ; 1D9E _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1DA1 _ 8B. 04 D0
        cmp     ecx, eax                                ; 1DA4 _ 39. C1
        jnz     ?_090                                   ; 1DA6 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 1DA8 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1DAB _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 1DAE _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1DB1 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1DB4 _ 8B. 45, 08
        add     edx, 2                                  ; 1DB7 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1DBA _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 1DBE _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 1DC1 _ 8B. 4D, F4
        add     ecx, 2                                  ; 1DC4 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 1DC7 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 1DCB _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1DCE _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 1DD1 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1DD4 _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 1DD8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1DDB _ 8B. 00
        lea     edx, [eax-1H]                           ; 1DDD _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 1DE0 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1DE3 _ 89. 10
?_090:  mov     eax, 0                                  ; 1DE5 _ B8, 00000000
        jmp     ?_097                                   ; 1DEA _ E9, 0000011C

?_091:  mov     eax, dword [ebp+8H]                     ; 1DEF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1DF2 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 1DF4 _ 3B. 45, F4
        jle     ?_092                                   ; 1DF7 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 1DF9 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 1DFC _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 1DFF _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E02 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1E05 _ 8B. 55, F4
        add     edx, 2                                  ; 1E08 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 1E0B _ 8B. 04 D0
        cmp     ecx, eax                                ; 1E0E _ 39. C1
        jnz     ?_092                                   ; 1E10 _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 1E12 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1E15 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1E18 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1E1B _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1E1E _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1E21 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1E24 _ 8B. 55, F4
        add     edx, 2                                  ; 1E27 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 1E2A _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 1E2E _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 1E31 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 1E34 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1E37 _ 8B. 55, F4
        add     edx, 2                                  ; 1E3A _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 1E3D _ 89. 4C D0, 04
        mov     eax, 0                                  ; 1E41 _ B8, 00000000
        jmp     ?_097                                   ; 1E46 _ E9, 000000C0

?_092:  mov     eax, dword [ebp+8H]                     ; 1E4B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E4E _ 8B. 00
        cmp     eax, 4095                               ; 1E50 _ 3D, 00000FFF
        jg      ?_096                                   ; 1E55 _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 1E5B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E5E _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 1E60 _ 89. 45, F8
        jmp     ?_094                                   ; 1E63 _ EB, 28

?_093:  mov     eax, dword [ebp-8H]                     ; 1E65 _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 1E68 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 1E6B _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 1E6E _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 1E71 _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 1E74 _ 8B. 45, 08
        add     edx, 2                                  ; 1E77 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 1E7A _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 1E7D _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 1E7F _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 1E82 _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 1E85 _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 1E89 _ 83. 6D, F8, 01
?_094:  mov     eax, dword [ebp-8H]                     ; 1E8D _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 1E90 _ 3B. 45, F4
        jg      ?_093                                   ; 1E93 _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 1E95 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1E98 _ 8B. 00
        lea     edx, [eax+1H]                           ; 1E9A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1E9D _ 8B. 45, 08
        mov     dword [eax], edx                        ; 1EA0 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1EA2 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1EA5 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1EA8 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1EAB _ 8B. 00
        cmp     edx, eax                                ; 1EAD _ 39. C2
        jge     ?_095                                   ; 1EAF _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 1EB1 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1EB4 _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 1EB6 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1EB9 _ 89. 50, 04
?_095:  mov     eax, dword [ebp+8H]                     ; 1EBC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1EBF _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1EC2 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 1EC5 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 1EC8 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 1ECB _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 1ECE _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 1ED1 _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 1ED4 _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 1ED7 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 1EDB _ B8, 00000000
        jmp     ?_097                                   ; 1EE0 _ EB, 29

?_096:  mov     eax, dword [ebp+8H]                     ; 1EE2 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 1EE5 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 1EE8 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1EEB _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1EEE _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1EF1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1EF4 _ 8B. 40, 08
        mov     edx, eax                                ; 1EF7 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 1EF9 _ 8B. 45, 10
        add     eax, edx                                ; 1EFC _ 01. D0
        mov     edx, eax                                ; 1EFE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1F00 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1F03 _ 89. 50, 08
        mov     eax, 4294967295                         ; 1F06 _ B8, FFFFFFFF
?_097:  add     esp, 16                                 ; 1F0B _ 83. C4, 10
        pop     ebx                                     ; 1F0E _ 5B
        pop     ebp                                     ; 1F0F _ 5D
        ret                                             ; 1F10 _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 1F11 _ 55
        mov     ebp, esp                                ; 1F12 _ 89. E5
        sub     esp, 24                                 ; 1F14 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 1F17 _ 8B. 45, 0C
        add     eax, 4095                               ; 1F1A _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1F1F _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 1F24 _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 1F27 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1F2A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1F2E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1F31 _ 89. 04 24
        call    memman_alloc                            ; 1F34 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 1F39 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1F3C _ 8B. 45, FC
        leave                                           ; 1F3F _ C9
        ret                                             ; 1F40 _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 1F41 _ 55
        mov     ebp, esp                                ; 1F42 _ 89. E5
        sub     esp, 28                                 ; 1F44 _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 1F47 _ 8B. 45, 10
        add     eax, 4095                               ; 1F4A _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 1F4F _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 1F54 _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 1F57 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 1F5A _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1F5E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1F61 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1F65 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1F68 _ 89. 04 24
        call    memman_free                             ; 1F6B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 1F70 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 1F73 _ 8B. 45, FC
        leave                                           ; 1F76 _ C9
        ret                                             ; 1F77 _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 1F78 _ 55
        mov     ebp, esp                                ; 1F79 _ 89. E5
        sub     esp, 40                                 ; 1F7B _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 1F7E _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 1F86 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1F89 _ 89. 04 24
        call    memman_alloc_4k                         ; 1F8C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 1F91 _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 1F94 _ 83. 7D, F4, 00
        jnz     ?_098                                   ; 1F98 _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 1F9A _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 1F9D _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 1FA5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1FA9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1FAC _ 89. 04 24
        call    memman_free_4k                          ; 1FAF _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 1FB4 _ B8, 00000000
        jmp     ?_102                                   ; 1FB9 _ E9, 0000009D

?_098:  mov     eax, dword [ebp-0CH]                    ; 1FBE _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 1FC1 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 1FC4 _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 1FC6 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 1FC9 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 1FCC _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 1FCF _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 1FD2 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 1FD5 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 1FD8 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 1FDB _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 1FE2 _ C7. 45, F0, 00000000
        jmp     ?_100                                   ; 1FE9 _ EB, 1B

?_099:  mov     eax, dword [ebp-0CH]                    ; 1FEB _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 1FEE _ 8B. 55, F0
        add     edx, 33                                 ; 1FF1 _ 83. C2, 21
        shl     edx, 5                                  ; 1FF4 _ C1. E2, 05
        add     eax, edx                                ; 1FF7 _ 01. D0
        add     eax, 16                                 ; 1FF9 _ 83. C0, 10
        mov     dword [eax], 0                          ; 1FFC _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 2002 _ 83. 45, F0, 01
?_100:  cmp     dword [ebp-10H], 255                    ; 2006 _ 81. 7D, F0, 000000FF
        jle     ?_099                                   ; 200D _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 200F _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 2012 _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 2016 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 201A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 201D _ 89. 04 24
        call    memman_alloc_4k                         ; 2020 _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 2025 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2027 _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 202A _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 202D _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 2030 _ 8B. 40, 10
        test    eax, eax                                ; 2033 _ 85. C0
        jnz     ?_101                                   ; 2035 _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 2037 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 203A _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 2042 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2046 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2049 _ 89. 04 24
        call    memman_free_4k                          ; 204C _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 2051 _ B8, 00000000
        jmp     ?_102                                   ; 2056 _ EB, 03

?_101:  mov     eax, dword [ebp-0CH]                    ; 2058 _ 8B. 45, F4
?_102:  leave                                           ; 205B _ C9
        ret                                             ; 205C _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 205D _ 55
        mov     ebp, esp                                ; 205E _ 89. E5
        sub     esp, 16                                 ; 2060 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 2063 _ C7. 45, F8, 00000000
        jmp     ?_105                                   ; 206A _ EB, 5B

?_103:  mov     eax, dword [ebp+8H]                     ; 206C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 206F _ 8B. 55, F8
        add     edx, 33                                 ; 2072 _ 83. C2, 21
        shl     edx, 5                                  ; 2075 _ C1. E2, 05
        add     eax, edx                                ; 2078 _ 01. D0
        add     eax, 16                                 ; 207A _ 83. C0, 10
        mov     eax, dword [eax]                        ; 207D _ 8B. 00
        test    eax, eax                                ; 207F _ 85. C0
        jnz     ?_104                                   ; 2081 _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 2083 _ 8B. 45, F8
        shl     eax, 5                                  ; 2086 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 2089 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 208F _ 8B. 45, 08
        add     eax, edx                                ; 2092 _ 01. D0
        add     eax, 4                                  ; 2094 _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 2097 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 209A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 209D _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 20A0 _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 20A3 _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 20A6 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 20AA _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 20AD _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 20B4 _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 20B7 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 20BE _ 8B. 45, FC
        jmp     ?_106                                   ; 20C1 _ EB, 12

?_104:  add     dword [ebp-8H], 1                       ; 20C3 _ 83. 45, F8, 01
?_105:  cmp     dword [ebp-8H], 255                     ; 20C7 _ 81. 7D, F8, 000000FF
        jle     ?_103                                   ; 20CE _ 7E, 9C
        mov     eax, 0                                  ; 20D0 _ B8, 00000000
?_106:  leave                                           ; 20D5 _ C9
        ret                                             ; 20D6 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 20D7 _ 55
        mov     ebp, esp                                ; 20D8 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 20DA _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 20DD _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 20E0 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 20E2 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 20E5 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 20E8 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 20EB _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 20EE _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 20F1 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 20F4 _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 20F7 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 20FA _ 89. 50, 14
        pop     ebp                                     ; 20FD _ 5D
        ret                                             ; 20FE _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 20FF _ 55
        mov     ebp, esp                                ; 2100 _ 89. E5
        push    esi                                     ; 2102 _ 56
        push    ebx                                     ; 2103 _ 53
        sub     esp, 48                                 ; 2104 _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 2107 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 210A _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 210D _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 2110 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2113 _ 8B. 40, 0C
        add     eax, 1                                  ; 2116 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 2119 _ 3B. 45, 10
        jge     ?_107                                   ; 211C _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 211E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2121 _ 8B. 40, 0C
        add     eax, 1                                  ; 2124 _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 2127 _ 89. 45, 10
?_107:  cmp     dword [ebp+10H], -1                     ; 212A _ 83. 7D, 10, FF
        jge     ?_108                                   ; 212E _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 2130 _ C7. 45, 10, FFFFFFFF
?_108:  mov     eax, dword [ebp+0CH]                    ; 2137 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 213A _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 213D _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 2140 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2143 _ 3B. 45, 10
        jle     ?_115                                   ; 2146 _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 214C _ 83. 7D, 10, 00
        js      ?_111                                   ; 2150 _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 2156 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2159 _ 89. 45, F0
        jmp     ?_110                                   ; 215C _ EB, 34

?_109:  mov     eax, dword [ebp-10H]                    ; 215E _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 2161 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2164 _ 8B. 45, 08
        add     edx, 4                                  ; 2167 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 216A _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 216E _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2171 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2174 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2177 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 217B _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 217E _ 8B. 55, F0
        add     edx, 4                                  ; 2181 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2184 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2188 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 218B _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 218E _ 83. 6D, F0, 01
?_110:  mov     eax, dword [ebp-10H]                    ; 2192 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2195 _ 3B. 45, 10
        jg      ?_109                                   ; 2198 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 219A _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 219D _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 21A0 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 21A3 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 21A6 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 21AA _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 21AD _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 21B0 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 21B3 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 21B6 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 21B9 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 21BC _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 21BF _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 21C2 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 21C5 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 21C8 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 21CB _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 21CE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 21D1 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 21D4 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 21D7 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 21DA _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 21DE _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 21E2 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 21E6 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 21EA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 21EE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 21F1 _ 89. 04 24
        call    sheet_refresh_map                       ; 21F4 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 21F9 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 21FC _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 21FF _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2202 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2205 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2208 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 220B _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 220E _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2211 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2214 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2217 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 221A _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 221D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2220 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2223 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2226 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 2229 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 222D _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2231 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2235 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2239 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 223D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2240 _ 89. 04 24
        call    sheet_refresh_local                     ; 2243 _ E8, FFFFFFFC(rel)
        jmp     ?_122                                   ; 2248 _ E9, 0000026C

?_111:  mov     eax, dword [ebp+8H]                     ; 224D _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2250 _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 2253 _ 3B. 45, F4
        jle     ?_114                                   ; 2256 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 2258 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 225B _ 89. 45, F0
        jmp     ?_113                                   ; 225E _ EB, 34

?_112:  mov     eax, dword [ebp-10H]                    ; 2260 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2263 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2266 _ 8B. 45, 08
        add     edx, 4                                  ; 2269 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 226C _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2270 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2273 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2276 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2279 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 227D _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2280 _ 8B. 55, F0
        add     edx, 4                                  ; 2283 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2286 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 228A _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 228D _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2290 _ 83. 45, F0, 01
?_113:  mov     eax, dword [ebp+8H]                     ; 2294 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2297 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 229A _ 3B. 45, F0
        jg      ?_112                                   ; 229D _ 7F, C1
?_114:  mov     eax, dword [ebp+8H]                     ; 229F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 22A2 _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 22A5 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 22A8 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 22AB _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 22AE _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 22B1 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 22B4 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 22B7 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 22BA _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 22BD _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 22C0 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 22C3 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 22C6 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 22C9 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 22CC _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 22CF _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 22D2 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 22D5 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 22D8 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 22E0 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 22E4 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 22E8 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 22EC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 22F0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 22F3 _ 89. 04 24
        call    sheet_refresh_map                       ; 22F6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 22FB _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 22FE _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2301 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2304 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 2307 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 230A _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 230D _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2310 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2313 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2316 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2319 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 231C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 231F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2322 _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 2325 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 232D _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 2331 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 2335 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2339 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 233D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2340 _ 89. 04 24
        call    sheet_refresh_local                     ; 2343 _ E8, FFFFFFFC(rel)
        jmp     ?_122                                   ; 2348 _ E9, 0000016C

?_115:  mov     eax, dword [ebp-0CH]                    ; 234D _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 2350 _ 3B. 45, 10
        jge     ?_122                                   ; 2353 _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 2359 _ 83. 7D, F4, 00
        js      ?_118                                   ; 235D _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 235F _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2362 _ 89. 45, F0
        jmp     ?_117                                   ; 2365 _ EB, 34

?_116:  mov     eax, dword [ebp-10H]                    ; 2367 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 236A _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 236D _ 8B. 45, 08
        add     edx, 4                                  ; 2370 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2373 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2377 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 237A _ 8B. 4D, F0
        add     ecx, 4                                  ; 237D _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2380 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2384 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2387 _ 8B. 55, F0
        add     edx, 4                                  ; 238A _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 238D _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2391 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2394 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2397 _ 83. 45, F0, 01
?_117:  mov     eax, dword [ebp-10H]                    ; 239B _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 239E _ 3B. 45, 10
        jl      ?_116                                   ; 23A1 _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 23A3 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 23A6 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 23A9 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 23AC _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 23AF _ 89. 54 88, 04
        jmp     ?_121                                   ; 23B3 _ EB, 6C

?_118:  mov     eax, dword [ebp+8H]                     ; 23B5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 23B8 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 23BB _ 89. 45, F0
        jmp     ?_120                                   ; 23BE _ EB, 3A

?_119:  mov     eax, dword [ebp-10H]                    ; 23C0 _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 23C3 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 23C6 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 23C9 _ 8B. 55, F0
        add     edx, 4                                  ; 23CC _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 23CF _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 23D3 _ 8B. 45, 08
        add     ecx, 4                                  ; 23D6 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 23D9 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 23DD _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 23E0 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 23E3 _ 8B. 45, 08
        add     edx, 4                                  ; 23E6 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 23E9 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 23ED _ 8B. 55, F0
        add     edx, 1                                  ; 23F0 _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 23F3 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 23F6 _ 83. 6D, F0, 01
?_120:  mov     eax, dword [ebp-10H]                    ; 23FA _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 23FD _ 3B. 45, 10
        jge     ?_119                                   ; 2400 _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 2402 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2405 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2408 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 240B _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 240E _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2412 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2415 _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 2418 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 241B _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 241E _ 89. 50, 0C
?_121:  mov     eax, dword [ebp+0CH]                    ; 2421 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2424 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2427 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 242A _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 242D _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2430 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2433 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2436 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2439 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 243C _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 243F _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2442 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2445 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2448 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 244B _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 244E _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 2452 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2456 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 245A _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 245E _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2462 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2465 _ 89. 04 24
        call    sheet_refresh_map                       ; 2468 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 246D _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2470 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2473 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2476 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 2479 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 247C _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 247F _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2482 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2485 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2488 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 248B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 248E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2491 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2494 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 2497 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 249A _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 249E _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 24A2 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 24A6 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 24AA _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 24AE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 24B1 _ 89. 04 24
        call    sheet_refresh_local                     ; 24B4 _ E8, FFFFFFFC(rel)
?_122:  add     esp, 48                                 ; 24B9 _ 83. C4, 30
        pop     ebx                                     ; 24BC _ 5B
        pop     esi                                     ; 24BD _ 5E
        pop     ebp                                     ; 24BE _ 5D
        ret                                             ; 24BF _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 24C0 _ 55
        mov     ebp, esp                                ; 24C1 _ 89. E5
        push    edi                                     ; 24C3 _ 57
        push    esi                                     ; 24C4 _ 56
        push    ebx                                     ; 24C5 _ 53
        sub     esp, 44                                 ; 24C6 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 24C9 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 24CC _ 8B. 40, 18
        test    eax, eax                                ; 24CF _ 85. C0
        js      ?_123                                   ; 24D1 _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 24D3 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 24D6 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 24D9 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 24DC _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 24DF _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 24E2 _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 24E5 _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 24E8 _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 24EB _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 24EE _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 24F1 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 24F4 _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 24F7 _ 8B. 55, 14
        add     ecx, edx                                ; 24FA _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 24FC _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 24FF _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 2502 _ 8B. 55, 10
        add     edx, edi                                ; 2505 _ 01. FA
        mov     dword [esp+14H], eax                    ; 2507 _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 250B _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 250F _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2513 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2517 _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 251B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 251E _ 89. 04 24
        call    sheet_refresh_local                     ; 2521 _ E8, FFFFFFFC(rel)
?_123:  mov     eax, 0                                  ; 2526 _ B8, 00000000
        add     esp, 44                                 ; 252B _ 83. C4, 2C
        pop     ebx                                     ; 252E _ 5B
        pop     esi                                     ; 252F _ 5E
        pop     edi                                     ; 2530 _ 5F
        pop     ebp                                     ; 2531 _ 5D
        ret                                             ; 2532 _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 2533 _ 55
        mov     ebp, esp                                ; 2534 _ 89. E5
        push    ebx                                     ; 2536 _ 53
        sub     esp, 52                                 ; 2537 _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 253A _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 253D _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2540 _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2543 _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 2546 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 2549 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 254C _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 254F _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2552 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2555 _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2558 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 255B _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 255E _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2561 _ 8B. 40, 18
        test    eax, eax                                ; 2564 _ 85. C0
        js      ?_124                                   ; 2566 _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 256C _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 256F _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2572 _ 8B. 45, F4
        add     edx, eax                                ; 2575 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2577 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 257A _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 257D _ 8B. 45, F0
        add     eax, ecx                                ; 2580 _ 01. C8
        mov     dword [esp+14H], 0                      ; 2582 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 258A _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 258E _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2592 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2595 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 2599 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 259C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 25A0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 25A3 _ 89. 04 24
        call    sheet_refresh_map                       ; 25A6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 25AB _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 25AE _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 25B1 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 25B4 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 25B7 _ 8B. 55, 14
        add     ecx, edx                                ; 25BA _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 25BC _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 25BF _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 25C2 _ 8B. 55, 10
        add     edx, ebx                                ; 25C5 _ 01. DA
        mov     dword [esp+14H], eax                    ; 25C7 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 25CB _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 25CF _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 25D3 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 25D6 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 25DA _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 25DD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 25E1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 25E4 _ 89. 04 24
        call    sheet_refresh_map                       ; 25E7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 25EC _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 25EF _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 25F2 _ 8B. 45, F4
        add     edx, eax                                ; 25F5 _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 25F7 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 25FA _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 25FD _ 8B. 45, F0
        add     eax, ecx                                ; 2600 _ 01. C8
        mov     dword [esp+14H], 0                      ; 2602 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 260A _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 260E _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2612 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2615 _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 2619 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 261C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2620 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2623 _ 89. 04 24
        call    sheet_refresh_local                     ; 2626 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 262B _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 262E _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2631 _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2634 _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2637 _ 8B. 55, 14
        add     ecx, edx                                ; 263A _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 263C _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 263F _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2642 _ 8B. 55, 10
        add     edx, ebx                                ; 2645 _ 01. DA
        mov     dword [esp+14H], eax                    ; 2647 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 264B _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 264F _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 2653 _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 2656 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 265A _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 265D _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2661 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2664 _ 89. 04 24
        call    sheet_refresh_local                     ; 2667 _ E8, FFFFFFFC(rel)
?_124:  add     esp, 52                                 ; 266C _ 83. C4, 34
        pop     ebx                                     ; 266F _ 5B
        pop     ebp                                     ; 2670 _ 5D
        ret                                             ; 2671 _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 2672 _ 55
        mov     ebp, esp                                ; 2673 _ 89. E5
        sub     esp, 48                                 ; 2675 _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 2678 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 267B _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 267D _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2680 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2683 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 2686 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2689 _ 83. 7D, 0C, 00
        jns     ?_125                                   ; 268D _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 268F _ C7. 45, 0C, 00000000
?_125:  cmp     dword [ebp+10H], 0                      ; 2696 _ 83. 7D, 10, 00
        jns     ?_126                                   ; 269A _ 79, 07
        mov     dword [ebp+10H], 0                      ; 269C _ C7. 45, 10, 00000000
?_126:  mov     eax, dword [ebp+8H]                     ; 26A3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 26A6 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 26A9 _ 3B. 45, 14
        jge     ?_127                                   ; 26AC _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 26AE _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 26B1 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 26B4 _ 89. 45, 14
?_127:  mov     eax, dword [ebp+8H]                     ; 26B7 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 26BA _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 26BD _ 3B. 45, 18
        jge     ?_128                                   ; 26C0 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 26C2 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 26C5 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 26C8 _ 89. 45, 18
?_128:  mov     eax, dword [ebp+1CH]                    ; 26CB _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 26CE _ 89. 45, DC
        jmp     ?_135                                   ; 26D1 _ E9, 00000119

?_129:  mov     eax, dword [ebp+8H]                     ; 26D6 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 26D9 _ 8B. 55, DC
        add     edx, 4                                  ; 26DC _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 26DF _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 26E3 _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 26E6 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 26E9 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 26EB _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 26EE _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 26F1 _ 8B. 45, 08
        add     eax, 1044                               ; 26F4 _ 05, 00000414
        sub     edx, eax                                ; 26F9 _ 29. C2
        mov     eax, edx                                ; 26FB _ 89. D0
        sar     eax, 5                                  ; 26FD _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 2700 _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 2703 _ C7. 45, E4, 00000000
        jmp     ?_134                                   ; 270A _ E9, 000000CD

?_130:  mov     eax, dword [ebp-10H]                    ; 270F _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 2712 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 2715 _ 8B. 45, E4
        add     eax, edx                                ; 2718 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 271A _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 271D _ C7. 45, E0, 00000000
        jmp     ?_133                                   ; 2724 _ E9, 000000A0

?_131:  mov     eax, dword [ebp-10H]                    ; 2729 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 272C _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 272F _ 8B. 45, E0
        add     eax, edx                                ; 2732 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 2734 _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 2737 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 273A _ 3B. 45, FC
        jg      ?_132                                   ; 273D _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 2743 _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 2746 _ 3B. 45, 14
        jge     ?_132                                   ; 2749 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 274B _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 274E _ 3B. 45, F8
        jg      ?_132                                   ; 2751 _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 2753 _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 2756 _ 3B. 45, 18
        jge     ?_132                                   ; 2759 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 275B _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 275E _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 2761 _ 0F AF. 45, E4
        mov     edx, eax                                ; 2765 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2767 _ 8B. 45, E0
        add     eax, edx                                ; 276A _ 01. D0
        mov     edx, eax                                ; 276C _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 276E _ 8B. 45, F4
        add     eax, edx                                ; 2771 _ 01. D0
        movzx   eax, byte [eax]                         ; 2773 _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 2776 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 2779 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 277D _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 2780 _ 8B. 40, 14
        cmp     edx, eax                                ; 2783 _ 39. C2
        jz      ?_132                                   ; 2785 _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 2787 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 278A _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 278D _ 0F AF. 45, F8
        mov     edx, eax                                ; 2791 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2793 _ 8B. 45, FC
        add     eax, edx                                ; 2796 _ 01. D0
        mov     edx, eax                                ; 2798 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 279A _ 8B. 45, EC
        add     eax, edx                                ; 279D _ 01. D0
        movzx   eax, byte [eax]                         ; 279F _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 27A2 _ 3A. 45, DA
        jnz     ?_132                                   ; 27A5 _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 27A7 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 27AA _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 27AD _ 0F AF. 45, F8
        mov     edx, eax                                ; 27B1 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 27B3 _ 8B. 45, FC
        add     eax, edx                                ; 27B6 _ 01. D0
        mov     edx, eax                                ; 27B8 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 27BA _ 8B. 45, E8
        add     edx, eax                                ; 27BD _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 27BF _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 27C3 _ 88. 02
?_132:  add     dword [ebp-20H], 1                      ; 27C5 _ 83. 45, E0, 01
?_133:  mov     eax, dword [ebp-10H]                    ; 27C9 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 27CC _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 27CF _ 3B. 45, E0
        jg      ?_131                                   ; 27D2 _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 27D8 _ 83. 45, E4, 01
?_134:  mov     eax, dword [ebp-10H]                    ; 27DC _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 27DF _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 27E2 _ 3B. 45, E4
        jg      ?_130                                   ; 27E5 _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 27EB _ 83. 45, DC, 01
?_135:  mov     eax, dword [ebp+8H]                     ; 27EF _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 27F2 _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 27F5 _ 3B. 45, DC
        jge     ?_129                                   ; 27F8 _ 0F 8D, FFFFFED8
        leave                                           ; 27FE _ C9
        ret                                             ; 27FF _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 2800 _ 55
        mov     ebp, esp                                ; 2801 _ 89. E5
        sub     esp, 64                                 ; 2803 _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 2806 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2809 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 280B _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 280E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2811 _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 2814 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2817 _ 83. 7D, 0C, 00
        jns     ?_136                                   ; 281B _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 281D _ C7. 45, 0C, 00000000
?_136:  cmp     dword [ebp+10H], 0                      ; 2824 _ 83. 7D, 10, 00
        jns     ?_137                                   ; 2828 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 282A _ C7. 45, 10, 00000000
?_137:  mov     eax, dword [ebp+8H]                     ; 2831 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2834 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 2837 _ 3B. 45, 14
        jge     ?_138                                   ; 283A _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 283C _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 283F _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 2842 _ 89. 45, 14
?_138:  mov     eax, dword [ebp+8H]                     ; 2845 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2848 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 284B _ 3B. 45, 18
        jge     ?_139                                   ; 284E _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2850 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2853 _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 2856 _ 89. 45, 18
?_139:  mov     eax, dword [ebp+1CH]                    ; 2859 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 285C _ 89. 45, CC
        jmp     ?_150                                   ; 285F _ E9, 00000141

?_140:  mov     eax, dword [ebp+8H]                     ; 2864 _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 2867 _ 8B. 55, CC
        add     edx, 4                                  ; 286A _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 286D _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2871 _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 2874 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 2877 _ 8B. 45, 08
        add     eax, 1044                               ; 287A _ 05, 00000414
        sub     edx, eax                                ; 287F _ 29. C2
        mov     eax, edx                                ; 2881 _ 89. D0
        sar     eax, 5                                  ; 2883 _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 2886 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 2889 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 288C _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 288E _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2891 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 2894 _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 2897 _ 8B. 55, 0C
        sub     edx, eax                                ; 289A _ 29. C2
        mov     eax, edx                                ; 289C _ 89. D0
        mov     dword [ebp-30H], eax                    ; 289E _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 28A1 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 28A4 _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 28A7 _ 8B. 55, 10
        sub     edx, eax                                ; 28AA _ 29. C2
        mov     eax, edx                                ; 28AC _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 28AE _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 28B1 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 28B4 _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 28B7 _ 8B. 55, 14
        sub     edx, eax                                ; 28BA _ 29. C2
        mov     eax, edx                                ; 28BC _ 89. D0
        mov     dword [ebp-28H], eax                    ; 28BE _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 28C1 _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 28C4 _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 28C7 _ 8B. 55, 18
        sub     edx, eax                                ; 28CA _ 29. C2
        mov     eax, edx                                ; 28CC _ 89. D0
        mov     dword [ebp-24H], eax                    ; 28CE _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 28D1 _ 83. 7D, D0, 00
        jns     ?_141                                   ; 28D5 _ 79, 07
        mov     dword [ebp-30H], 0                      ; 28D7 _ C7. 45, D0, 00000000
?_141:  cmp     dword [ebp-2CH], 0                      ; 28DE _ 83. 7D, D4, 00
        jns     ?_142                                   ; 28E2 _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 28E4 _ C7. 45, D4, 00000000
?_142:  mov     eax, dword [ebp-10H]                    ; 28EB _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 28EE _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 28F1 _ 3B. 45, D8
        jge     ?_143                                   ; 28F4 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 28F6 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 28F9 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 28FC _ 89. 45, D8
?_143:  mov     eax, dword [ebp-10H]                    ; 28FF _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2902 _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 2905 _ 3B. 45, DC
        jge     ?_144                                   ; 2908 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 290A _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 290D _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 2910 _ 89. 45, DC
?_144:  mov     eax, dword [ebp-2CH]                    ; 2913 _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 2916 _ 89. 45, E4
        jmp     ?_149                                   ; 2919 _ EB, 7A

?_145:  mov     eax, dword [ebp-10H]                    ; 291B _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 291E _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 2921 _ 8B. 45, E4
        add     eax, edx                                ; 2924 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 2926 _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 2929 _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 292C _ 89. 45, E0
        jmp     ?_148                                   ; 292F _ EB, 58

?_146:  mov     eax, dword [ebp-10H]                    ; 2931 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 2934 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 2937 _ 8B. 45, E0
        add     eax, edx                                ; 293A _ 01. D0
        mov     dword [ebp-4H], eax                     ; 293C _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 293F _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2942 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 2945 _ 0F AF. 45, E4
        mov     edx, eax                                ; 2949 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 294B _ 8B. 45, E0
        add     eax, edx                                ; 294E _ 01. D0
        mov     edx, eax                                ; 2950 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2952 _ 8B. 45, F4
        add     eax, edx                                ; 2955 _ 01. D0
        movzx   eax, byte [eax]                         ; 2957 _ 0F B6. 00
        movzx   edx, al                                 ; 295A _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 295D _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 2960 _ 8B. 40, 14
        cmp     edx, eax                                ; 2963 _ 39. C2
        jz      ?_147                                   ; 2965 _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 2967 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 296A _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 296D _ 0F AF. 45, F8
        mov     edx, eax                                ; 2971 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2973 _ 8B. 45, FC
        add     eax, edx                                ; 2976 _ 01. D0
        mov     edx, eax                                ; 2978 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 297A _ 8B. 45, EC
        add     edx, eax                                ; 297D _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 297F _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 2983 _ 88. 02
?_147:  add     dword [ebp-20H], 1                      ; 2985 _ 83. 45, E0, 01
?_148:  mov     eax, dword [ebp-20H]                    ; 2989 _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 298C _ 3B. 45, D8
        jl      ?_146                                   ; 298F _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 2991 _ 83. 45, E4, 01
?_149:  mov     eax, dword [ebp-1CH]                    ; 2995 _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 2998 _ 3B. 45, DC
        jl      ?_145                                   ; 299B _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 29A1 _ 83. 45, CC, 01
?_150:  mov     eax, dword [ebp+8H]                     ; 29A5 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 29A8 _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 29AB _ 3B. 45, CC
        jge     ?_140                                   ; 29AE _ 0F 8D, FFFFFEB0
        leave                                           ; 29B4 _ C9
        ret                                             ; 29B5 _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 29B6 _ 55
        mov     ebp, esp                                ; 29B7 _ 89. E5
        sub     esp, 24                                 ; 29B9 _ 83. EC, 18
        mov     dword [esp+4H], 52                      ; 29BC _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 29C4 _ C7. 04 24, 00000043
        call    io_out8                                 ; 29CB _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 29D0 _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 29D8 _ C7. 04 24, 00000040
        call    io_out8                                 ; 29DF _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 29E4 _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 29EC _ C7. 04 24, 00000040
        call    io_out8                                 ; 29F3 _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 29F8 _ C7. 05, 000002A0(d), 00000000
        leave                                           ; 2A02 _ C9
        ret                                             ; 2A03 _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 2A04 _ 55
        mov     ebp, esp                                ; 2A05 _ 89. E5
        mov     eax, timer_control                      ; 2A07 _ B8, 000002A0(d)
        pop     ebp                                     ; 2A0C _ 5D
        ret                                             ; 2A0D _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 2A0E _ 55
        mov     ebp, esp                                ; 2A0F _ 89. E5
        sub     esp, 16                                 ; 2A11 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2A14 _ C7. 45, FC, 00000000
        jmp     ?_153                                   ; 2A1B _ EB, 26

?_151:  mov     eax, dword [ebp-4H]                     ; 2A1D _ 8B. 45, FC
        shl     eax, 4                                  ; 2A20 _ C1. E0, 04
        add     eax, timer_control                      ; 2A23 _ 05, 000002A0(d)
        mov     eax, dword [eax+8H]                     ; 2A28 _ 8B. 40, 08
        test    eax, eax                                ; 2A2B _ 85. C0
        jnz     ?_152                                   ; 2A2D _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 2A2F _ 8B. 45, FC
        shl     eax, 4                                  ; 2A32 _ C1. E0, 04
        add     eax, timer_control                      ; 2A35 _ 05, 000002A0(d)
        add     eax, 4                                  ; 2A3A _ 83. C0, 04
        jmp     ?_154                                   ; 2A3D _ EB, 0D

?_152:  add     dword [ebp-4H], 1                       ; 2A3F _ 83. 45, FC, 01
?_153:  cmp     dword [ebp-4H], 499                     ; 2A43 _ 81. 7D, FC, 000001F3
        jle     ?_151                                   ; 2A4A _ 7E, D1
?_154:  leave                                           ; 2A4C _ C9
        ret                                             ; 2A4D _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 2A4E _ 55
        mov     ebp, esp                                ; 2A4F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2A51 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2A54 _ C7. 40, 04, 00000000
        pop     ebp                                     ; 2A5B _ 5D
        ret                                             ; 2A5C _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 2A5D _ 55
        mov     ebp, esp                                ; 2A5E _ 89. E5
        sub     esp, 4                                  ; 2A60 _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 2A63 _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 2A66 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2A69 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2A6C _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 2A6F _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2A72 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 2A75 _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 2A79 _ 88. 50, 0C
        leave                                           ; 2A7C _ C9
        ret                                             ; 2A7D _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 2A7E _ 55
        mov     ebp, esp                                ; 2A7F _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 2A81 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 2A84 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 2A87 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 2A89 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 2A8C _ C7. 40, 04, 00000002
        pop     ebp                                     ; 2A93 _ 5D
        ret                                             ; 2A94 _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 2A95 _ 55
        mov     ebp, esp                                ; 2A96 _ 89. E5
        sub     esp, 40                                 ; 2A98 _ 83. EC, 28
        mov     dword [esp+4H], 96                      ; 2A9B _ C7. 44 24, 04, 00000060
        mov     dword [esp], 32                         ; 2AA3 _ C7. 04 24, 00000020
        call    io_out8                                 ; 2AAA _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 2AAF _ A1, 000002A0(d)
        add     eax, 1                                  ; 2AB4 _ 83. C0, 01
        mov     dword [timer_control], eax              ; 2AB7 _ A3, 000002A0(d)
        mov     dword [ebp-0CH], 0                      ; 2ABC _ C7. 45, F4, 00000000
        jmp     ?_157                                   ; 2AC3 _ E9, 00000086

?_155:  mov     eax, dword [ebp-0CH]                    ; 2AC8 _ 8B. 45, F4
        shl     eax, 4                                  ; 2ACB _ C1. E0, 04
        add     eax, timer_control                      ; 2ACE _ 05, 000002A0(d)
        mov     eax, dword [eax+8H]                     ; 2AD3 _ 8B. 40, 08
        cmp     eax, 2                                  ; 2AD6 _ 83. F8, 02
        jnz     ?_156                                   ; 2AD9 _ 75, 6F
        mov     eax, dword [ebp-0CH]                    ; 2ADB _ 8B. 45, F4
        shl     eax, 4                                  ; 2ADE _ C1. E0, 04
        add     eax, timer_control                      ; 2AE1 _ 05, 000002A0(d)
        mov     eax, dword [eax+4H]                     ; 2AE6 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 2AE9 _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 2AEC _ 8B. 45, F4
        shl     eax, 4                                  ; 2AEF _ C1. E0, 04
        add     eax, timer_control                      ; 2AF2 _ 05, 000002A0(d)
        mov     dword [eax+4H], edx                     ; 2AF7 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 2AFA _ 8B. 45, F4
        shl     eax, 4                                  ; 2AFD _ C1. E0, 04
        add     eax, timer_control                      ; 2B00 _ 05, 000002A0(d)
        mov     eax, dword [eax+4H]                     ; 2B05 _ 8B. 40, 04
        test    eax, eax                                ; 2B08 _ 85. C0
        jnz     ?_156                                   ; 2B0A _ 75, 3E
        mov     eax, dword [ebp-0CH]                    ; 2B0C _ 8B. 45, F4
        shl     eax, 4                                  ; 2B0F _ C1. E0, 04
        add     eax, timer_control                      ; 2B12 _ 05, 000002A0(d)
        mov     dword [eax+8H], 1                       ; 2B17 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 2B1E _ 8B. 45, F4
        shl     eax, 4                                  ; 2B21 _ C1. E0, 04
        add     eax, timer_control                      ; 2B24 _ 05, 000002A0(d)
        movzx   eax, byte [eax+10H]                     ; 2B29 _ 0F B6. 40, 10
        movzx   edx, al                                 ; 2B2D _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 2B30 _ 8B. 45, F4
        shl     eax, 4                                  ; 2B33 _ C1. E0, 04
        add     eax, timer_control                      ; 2B36 _ 05, 000002A0(d)
        mov     eax, dword [eax+0CH]                    ; 2B3B _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 2B3E _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 2B42 _ 89. 04 24
        call    fifo8_put                               ; 2B45 _ E8, FFFFFFFC(rel)
?_156:  add     dword [ebp-0CH], 1                      ; 2B4A _ 83. 45, F4, 01
?_157:  cmp     dword [ebp-0CH], 499                    ; 2B4E _ 81. 7D, F4, 000001F3
        jle     ?_155                                   ; 2B55 _ 0F 8E, FFFFFF6D
        leave                                           ; 2B5B _ C9
        ret                                             ; 2B5C _ C3
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

table_rgb.1616:                                         ; byte
        db 00H, 00H, 00H, 0FFH, 00H, 00H, 44H, 8CH      ; 0080 _ ......D.
        db 0BBH, 0FFH, 0FFH, 00H, 00H, 00H, 0FFH, 0FFH  ; 0088 _ ........
        db 00H, 0FFH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0090 _ ........
        db 0C6H, 0C6H, 0C6H, 84H, 00H, 00H, 00H, 84H    ; 0098 _ ........
        db 00H, 84H, 84H, 00H, 00H, 00H, 84H, 84H       ; 00A0 _ ........
        db 00H, 84H, 00H, 84H, 84H, 84H, 84H, 84H       ; 00A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

cursor.1684:                                            ; byte
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

closebtn.1752:                                          ; byte
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

?_168:  db 00H                                          ; 02A2 _ .

?_169:  db 00H, 00H                                     ; 02A3 _ ..


SECTION .bss    align=32 noexecute                      ; section number 4, bss

timerinfo1.1643:                                        ; byte
        resb    24                                      ; 0000

timerbuf1.1646:                                         ; qword
        resq    1                                       ; 0018

timerinfo2.1644:                                        ; byte
        resb    24                                      ; 0020

timerbuf2.1647:                                         ; qword
        resq    1                                       ; 0038

timerinfo3.1645:                                        ; byte
        resb    24                                      ; 0040

timerbuf3.1648:                                         ; qword
        resq    1                                       ; 0058

screen_info:                                            ; qword
        resb    4                                       ; 0060

?_170:  resw    1                                       ; 0064

?_171:  resw    13                                      ; 0066

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

?_172:  resb    9                                       ; 0281

?_173:  resb    22                                      ; 028A

timer_control:                                          ; byte
        resd    2001                                    ; 02A0


