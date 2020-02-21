; Disassembly of file: ckernel.o
; Fri Feb 21 12:01:13 2020
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
global task_init: function
global task_alloc: function
global task_run: function
global task_switch: function

extern task_timer                                       ; dword
extern mouse_y                                          ; dword
extern keyinfo                                          ; byte
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
        mov     dword [esp+8H], timerbuf1.1712          ; 0140 _ C7. 44 24, 08, 00000024(d)
        mov     dword [esp+4H], 8                       ; 0148 _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo1.1709            ; 0150 _ C7. 04 24, 0000000C(d)
        call    fifo8_init                              ; 0157 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 015C _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 0161 _ 89. 45, D0
        mov     dword [esp+8H], 1                       ; 0164 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo1.1709         ; 016C _ C7. 44 24, 04, 0000000C(d)
        mov     eax, dword [ebp-30H]                    ; 0174 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 0177 _ 89. 04 24
        call    timer_init                              ; 017A _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 017F _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-30H]                    ; 0187 _ 8B. 45, D0
        mov     dword [esp], eax                        ; 018A _ 89. 04 24
        call    timer_settime                           ; 018D _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf2.1713          ; 0192 _ C7. 44 24, 08, 00000044(d)
        mov     dword [esp+4H], 8                       ; 019A _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo2.1710            ; 01A2 _ C7. 04 24, 0000002C(d)
        call    fifo8_init                              ; 01A9 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 01AE _ E8, FFFFFFFC(rel)
        mov     dword [ebp-2CH], eax                    ; 01B3 _ 89. 45, D4
        mov     dword [esp+8H], 1                       ; 01B6 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo2.1710         ; 01BE _ C7. 44 24, 04, 0000002C(d)
        mov     eax, dword [ebp-2CH]                    ; 01C6 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 01C9 _ 89. 04 24
        call    timer_init                              ; 01CC _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 300                     ; 01D1 _ C7. 44 24, 04, 0000012C
        mov     eax, dword [ebp-2CH]                    ; 01D9 _ 8B. 45, D4
        mov     dword [esp], eax                        ; 01DC _ 89. 04 24
        call    timer_settime                           ; 01DF _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], timerbuf3.1714          ; 01E4 _ C7. 44 24, 08, 00000064(d)
        mov     dword [esp+4H], 8                       ; 01EC _ C7. 44 24, 04, 00000008
        mov     dword [esp], timerinfo3.1711            ; 01F4 _ C7. 04 24, 0000004C(d)
        call    fifo8_init                              ; 01FB _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0200 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-28H], eax                    ; 0205 _ 89. 45, D8
        mov     dword [esp+8H], 1                       ; 0208 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1711         ; 0210 _ C7. 44 24, 04, 0000004C(d)
        mov     eax, dword [ebp-28H]                    ; 0218 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 021B _ 89. 04 24
        call    timer_init                              ; 021E _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 50                      ; 0223 _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 022B _ 8B. 45, D8
        mov     dword [esp], eax                        ; 022E _ 89. 04 24
        call    timer_settime                           ; 0231 _ E8, FFFFFFFC(rel)
        call    io_sti                                  ; 0236 _ E8, FFFFFFFC(rel)
        mov     eax, dword [back_buf]                   ; 023B _ A1, 00000000(d)
        mov     edx, dword [ebp-38H]                    ; 0240 _ 8B. 55, C8
        mov     dword [esp+8H], edx                     ; 0243 _ 89. 54 24, 08
        mov     edx, dword [ebp-3CH]                    ; 0247 _ 8B. 55, C4
        mov     dword [esp+4H], edx                     ; 024A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 024E _ 89. 04 24
        call    init_desktop                            ; 0251 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 99                      ; 0256 _ C7. 44 24, 04, 00000063
        mov     dword [esp], mouse_cursor_buf           ; 025E _ C7. 04 24, 00000000(d)
        call    init_mouse_cursor                       ; 0265 _ E8, FFFFFFFC(rel)
        mov     edx, dword [back_sheet]                 ; 026A _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 0270 _ A1, 00000000(d)
        mov     dword [esp+0CH], 0                      ; 0275 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 027D _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0285 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0289 _ 89. 04 24
        call    sheet_slide                             ; 028C _ E8, FFFFFFFC(rel)
        mov     ebx, dword [mouse_y]                    ; 0291 _ 8B. 1D, 00000000(d)
        mov     ecx, dword [mouse_x]                    ; 0297 _ 8B. 0D, 00000000(d)
        mov     edx, dword [mouse_sheet]                ; 029D _ 8B. 15, 00000008(d)
        mov     eax, dword [sheet_control]              ; 02A3 _ A1, 00000000(d)
        mov     dword [esp+0CH], ebx                    ; 02A8 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 02AC _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 02B0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 02B4 _ 89. 04 24
        call    sheet_slide                             ; 02B7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [sheet_control]              ; 02BC _ A1, 00000000(d)
        mov     dword [esp+4H], ?_172                   ; 02C1 _ C7. 44 24, 04, 00000000(d)
        mov     dword [esp], eax                        ; 02C9 _ 89. 04 24
        call    message_box                             ; 02CC _ E8, FFFFFFFC(rel)
        mov     dword [sheet_win], eax                  ; 02D1 _ A3, 00000000(d)
        mov     edx, dword [back_sheet]                 ; 02D6 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 02DC _ A1, 00000000(d)
        mov     dword [esp+8H], 0                       ; 02E1 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 02E9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 02ED _ 89. 04 24
        call    sheet_updown                            ; 02F0 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_sheet]                ; 02F5 _ 8B. 15, 00000008(d)
        mov     eax, dword [sheet_control]              ; 02FB _ A1, 00000000(d)
        mov     dword [esp+8H], 100                     ; 0300 _ C7. 44 24, 08, 00000064
        mov     dword [esp+4H], edx                     ; 0308 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 030C _ 89. 04 24
        call    sheet_updown                            ; 030F _ E8, FFFFFFFC(rel)
        call    enable_mouse                            ; 0314 _ E8, FFFFFFFC(rel)
        call    get_code32_addr                         ; 0319 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-24H], eax                    ; 031E _ 89. 45, DC
        call    get_addr_gdt                            ; 0321 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 0326 _ 89. 45, E0
        mov     eax, dword [memman]                     ; 0329 _ A1, 00000000(d)
        mov     dword [esp+4H], 103                     ; 032E _ C7. 44 24, 04, 00000067
        mov     dword [esp], eax                        ; 0336 _ 89. 04 24
        call    memman_alloc_4k                         ; 0339 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 033E _ 89. 45, E4
        mov     eax, dword [memman]                     ; 0341 _ A1, 00000000(d)
        mov     dword [esp], eax                        ; 0346 _ 89. 04 24
        call    task_init                               ; 0349 _ E8, FFFFFFFC(rel)
        mov     dword [task_a.1719], eax                ; 034E _ A3, 0000006C(d)
        call    task_alloc                              ; 0353 _ E8, FFFFFFFC(rel)
        mov     dword [task_b.1720], eax                ; 0358 _ A3, 00000070(d)
        mov     eax, dword [task_b.1720]                ; 035D _ A1, 00000070(d)
        mov     dword [eax+68H], 0                      ; 0362 _ C7. 40, 68, 00000000
        mov     eax, dword [task_b.1720]                ; 0369 _ A1, 00000070(d)
        mov     dword [eax+6CH], 1073741824             ; 036E _ C7. 40, 6C, 40000000
        mov     eax, dword [task_b.1720]                ; 0375 _ A1, 00000070(d)
        mov     edx, task_b_main                        ; 037A _ BA, 00000000(d)
        sub     edx, dword [ebp-24H]                    ; 037F _ 2B. 55, DC
        mov     dword [eax+28H], edx                    ; 0382 _ 89. 50, 28
        mov     eax, dword [task_b.1720]                ; 0385 _ A1, 00000070(d)
        mov     dword [eax+50H], 0                      ; 038A _ C7. 40, 50, 00000000
        mov     eax, dword [task_b.1720]                ; 0391 _ A1, 00000070(d)
        mov     dword [eax+54H], 8                      ; 0396 _ C7. 40, 54, 00000008
        mov     eax, dword [task_b.1720]                ; 039D _ A1, 00000070(d)
        mov     dword [eax+58H], 48                     ; 03A2 _ C7. 40, 58, 00000030
        mov     eax, dword [task_b.1720]                ; 03A9 _ A1, 00000070(d)
        mov     dword [eax+5CH], 32                     ; 03AE _ C7. 40, 5C, 00000020
        mov     eax, dword [task_b.1720]                ; 03B5 _ A1, 00000070(d)
        mov     dword [eax+60H], 0                      ; 03BA _ C7. 40, 60, 00000000
        mov     eax, dword [task_b.1720]                ; 03C1 _ A1, 00000070(d)
        mov     dword [eax+64H], 16                     ; 03C6 _ C7. 40, 64, 00000010
        mov     eax, dword [task_b.1720]                ; 03CD _ A1, 00000070(d)
        mov     dword [esp], eax                        ; 03D2 _ 89. 04 24
        call    task_run                                ; 03D5 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], 0                      ; 03DA _ C7. 45, E8, 00000000
        mov     dword [ebp-14H], 0                      ; 03E1 _ C7. 45, EC, 00000000
        mov     dword [ebp-10H], 0                      ; 03E8 _ C7. 45, F0, 00000000
        mov     dword [ebp-4CH], 8                      ; 03EF _ C7. 45, B4, 00000008
        mov     dword [ebp-48H], 7                      ; 03F6 _ C7. 45, B8, 00000007
        mov     dword [ebp-44H], 0                      ; 03FD _ C7. 45, BC, 00000000
?_001:  call    io_cli                                  ; 0404 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0409 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0410 _ E8, FFFFFFFC(rel)
        mov     ebx, eax                                ; 0415 _ 89. C3
        mov     dword [esp], mouseinfo                  ; 0417 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 041E _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0423 _ 01. C3
        mov     dword [esp], timerinfo1.1709            ; 0425 _ C7. 04 24, 0000000C(d)
        call    fifo8_status                            ; 042C _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 0431 _ 01. C3
        mov     dword [esp], timerinfo2.1710            ; 0433 _ C7. 04 24, 0000002C(d)
        call    fifo8_status                            ; 043A _ E8, FFFFFFFC(rel)
        add     ebx, eax                                ; 043F _ 01. C3
        mov     dword [esp], timerinfo3.1711            ; 0441 _ C7. 04 24, 0000004C(d)
        call    fifo8_status                            ; 0448 _ E8, FFFFFFFC(rel)
        add     eax, ebx                                ; 044D _ 01. D8
        test    eax, eax                                ; 044F _ 85. C0
        jnz     ?_002                                   ; 0451 _ 75, 0A
        call    io_sti                                  ; 0453 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0458 _ E9, 00000383

?_002:  mov     dword [esp], keyinfo                    ; 045D _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 0464 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0469 _ 85. C0
        je      ?_004                                   ; 046B _ 0F 84, 00000196
        call    io_sti                                  ; 0471 _ E8, FFFFFFFC(rel)
        mov     dword [esp], keyinfo                    ; 0476 _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 047D _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 0482 _ 89. 45, E8
        cmp     dword [ebp-18H], 128                    ; 0485 _ 81. 7D, E8, 00000080
        jle     ?_003                                   ; 048C _ 7E, 05
        jmp     ?_010                                   ; 048E _ E9, 0000034D

?_003:  cmp     dword [ebp-18H], 28                     ; 0493 _ 83. 7D, E8, 1C
        je      ?_010                                   ; 0497 _ 0F 84, 00000343
        mov     eax, dword [ebp-18H]                    ; 049D _ 8B. 45, E8
        add     eax, keytable                           ; 04A0 _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 04A5 _ 0F B6. 00
        test    al, al                                  ; 04A8 _ 84. C0
        je      ?_010                                   ; 04AA _ 0F 84, 00000330
        cmp     dword [ebp-4CH], 143                    ; 04B0 _ 81. 7D, B4, 0000008F
        jg      ?_010                                   ; 04B7 _ 0F 8F, 00000323
        mov     eax, dword [ebp-4CH]                    ; 04BD _ 8B. 45, B4
        lea     ecx, [eax+7H]                           ; 04C0 _ 8D. 48, 07
        mov     eax, dword [sheet_win]                  ; 04C3 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 04C8 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 04CB _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 04D0 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 04D2 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ecx                    ; 04DA _ 89. 4C 24, 14
        mov     dword [esp+10H], 28                     ; 04DE _ C7. 44 24, 10, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 04E6 _ 8B. 4D, B4
        mov     dword [esp+0CH], ecx                    ; 04E9 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 04ED _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 04F5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 04F9 _ 89. 04 24
        call    paint_rectangle                         ; 04FC _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-4CH]                    ; 0501 _ 8B. 45, B4
        lea     ecx, [eax+8H]                           ; 0504 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 0507 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 050D _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 0512 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 051A _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 051E _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 0526 _ 8B. 4D, B4
        mov     dword [esp+8H], ecx                     ; 0529 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 052D _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0531 _ 89. 04 24
        call    sheet_refresh                           ; 0534 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-18H]                    ; 0539 _ 8B. 45, E8
        add     eax, keytable                           ; 053C _ 05, 00000000(d)
        movzx   eax, byte [eax]                         ; 0541 _ 0F B6. 00
        mov     byte [ebp-4EH], al                      ; 0544 _ 88. 45, B2
        mov     byte [ebp-4DH], 0                       ; 0547 _ C6. 45, B3, 00
        mov     edx, dword [sheet_win]                  ; 054B _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 0551 _ A1, 00000000(d)
        mov     dword [esp+14H], 0                      ; 0556 _ C7. 44 24, 14, 00000000
        lea     ecx, [ebp-4EH]                          ; 055E _ 8D. 4D, B2
        mov     dword [esp+10H], ecx                    ; 0561 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 0565 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 056D _ 8B. 4D, B4
        mov     dword [esp+8H], ecx                     ; 0570 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0574 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0578 _ 89. 04 24
        call    paint_string                            ; 057B _ E8, FFFFFFFC(rel)
        add     dword [ebp-4CH], 8                      ; 0580 _ 83. 45, B4, 08
        mov     eax, dword [ebp-4CH]                    ; 0584 _ 8B. 45, B4
        lea     ebx, [eax+7H]                           ; 0587 _ 8D. 58, 07
        mov     eax, dword [ebp-48H]                    ; 058A _ 8B. 45, B8
        movzx   ecx, al                                 ; 058D _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 0590 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 0595 _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 0598 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 059D _ 8B. 00
        mov     dword [esp+18H], 43                     ; 059F _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 05A7 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 05AB _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-4CH]                    ; 05B3 _ 8B. 5D, B4
        mov     dword [esp+0CH], ebx                    ; 05B6 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 05BA _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 05BE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05C2 _ 89. 04 24
        call    paint_rectangle                         ; 05C5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-4CH]                    ; 05CA _ 8B. 45, B4
        lea     ecx, [eax+8H]                           ; 05CD _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 05D0 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 05D6 _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 05DB _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 05E3 _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 05E7 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 05EF _ 8B. 4D, B4
        mov     dword [esp+8H], ecx                     ; 05F2 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 05F6 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 05FA _ 89. 04 24
        call    sheet_refresh                           ; 05FD _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 0602 _ E9, FFFFFDFD

?_004:  mov     dword [esp], mouseinfo                  ; 0607 _ C7. 04 24, 00000000(d)
        call    fifo8_status                            ; 060E _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0613 _ 85. C0
        jz      ?_005                                   ; 0615 _ 74, 26
        mov     ecx, dword [mouse_sheet]                ; 0617 _ 8B. 0D, 00000008(d)
        mov     edx, dword [back_sheet]                 ; 061D _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 0623 _ A1, 00000000(d)
        mov     dword [esp+8H], ecx                     ; 0628 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 062C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0630 _ 89. 04 24
        call    show_mouse_info                         ; 0633 _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 0638 _ E9, 000001A3

?_005:  mov     dword [esp], timerinfo1.1709            ; 063D _ C7. 04 24, 0000000C(d)
        call    fifo8_status                            ; 0644 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 0649 _ 85. C0
        jz      ?_006                                   ; 064B _ 74, 63
        call    io_sti                                  ; 064D _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo1.1709            ; 0652 _ C7. 04 24, 0000000C(d)
        call    fifo8_get                               ; 0659 _ E8, FFFFFFFC(rel)
        mov     edx, dword [back_sheet]                 ; 065E _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 0664 _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0669 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_173                  ; 0671 _ C7. 44 24, 10, 00000007(d)
        mov     dword [esp+0CH], 144                    ; 0679 _ C7. 44 24, 0C, 00000090
        mov     ecx, dword [ebp-44H]                    ; 0681 _ 8B. 4D, BC
        mov     dword [esp+8H], ecx                     ; 0684 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0688 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 068C _ 89. 04 24
        call    paint_string                            ; 068F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0694 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-30H]                    ; 069C _ 8B. 45, D0
        mov     dword [esp], eax                        ; 069F _ 89. 04 24
        call    timer_settime                           ; 06A2 _ E8, FFFFFFFC(rel)
        add     dword [ebp-44H], 8                      ; 06A7 _ 83. 45, BC, 08
        jmp     ?_010                                   ; 06AB _ E9, 00000130

?_006:  mov     dword [esp], timerinfo2.1710            ; 06B0 _ C7. 04 24, 0000002C(d)
        call    fifo8_status                            ; 06B7 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 06BC _ 85. C0
        jz      ?_007                                   ; 06BE _ 74, 16
        call    io_sti                                  ; 06C0 _ E8, FFFFFFFC(rel)
        mov     dword [esp], timerinfo2.1710            ; 06C5 _ C7. 04 24, 0000002C(d)
        call    fifo8_get                               ; 06CC _ E8, FFFFFFFC(rel)
        jmp     ?_010                                   ; 06D1 _ E9, 0000010A

?_007:  mov     dword [esp], timerinfo3.1711            ; 06D6 _ C7. 04 24, 0000004C(d)
        call    fifo8_status                            ; 06DD _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 06E2 _ 85. C0
        je      ?_010                                   ; 06E4 _ 0F 84, 000000F6
        mov     dword [esp], timerinfo3.1711            ; 06EA _ C7. 04 24, 0000004C(d)
        call    fifo8_get                               ; 06F1 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 06F6 _ 89. 45, F4
        call    io_sti                                  ; 06F9 _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-0CH], 0                      ; 06FE _ 83. 7D, F4, 00
        jz      ?_008                                   ; 0702 _ 74, 24
        mov     dword [esp+8H], 0                       ; 0704 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], timerinfo3.1711         ; 070C _ C7. 44 24, 04, 0000004C(d)
        mov     eax, dword [ebp-28H]                    ; 0714 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0717 _ 89. 04 24
        call    timer_init                              ; 071A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-48H], 0                      ; 071F _ C7. 45, B8, 00000000
        jmp     ?_009                                   ; 0726 _ EB, 22

?_008:  mov     dword [esp+8H], 1                       ; 0728 _ C7. 44 24, 08, 00000001
        mov     dword [esp+4H], timerinfo3.1711         ; 0730 _ C7. 44 24, 04, 0000004C(d)
        mov     eax, dword [ebp-28H]                    ; 0738 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 073B _ 89. 04 24
        call    timer_init                              ; 073E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-48H], 7                      ; 0743 _ C7. 45, B8, 00000007
?_009:  mov     dword [esp+4H], 50                      ; 074A _ C7. 44 24, 04, 00000032
        mov     eax, dword [ebp-28H]                    ; 0752 _ 8B. 45, D8
        mov     dword [esp], eax                        ; 0755 _ 89. 04 24
        call    timer_settime                           ; 0758 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-4CH]                    ; 075D _ 8B. 45, B4
        lea     ebx, [eax+7H]                           ; 0760 _ 8D. 58, 07
        mov     eax, dword [ebp-48H]                    ; 0763 _ 8B. 45, B8
        movzx   ecx, al                                 ; 0766 _ 0F B6. C8
        mov     eax, dword [sheet_win]                  ; 0769 _ A1, 00000000(d)
        mov     edx, dword [eax+4H]                     ; 076E _ 8B. 50, 04
        mov     eax, dword [sheet_win]                  ; 0771 _ A1, 00000000(d)
        mov     eax, dword [eax]                        ; 0776 _ 8B. 00
        mov     dword [esp+18H], 43                     ; 0778 _ C7. 44 24, 18, 0000002B
        mov     dword [esp+14H], ebx                    ; 0780 _ 89. 5C 24, 14
        mov     dword [esp+10H], 28                     ; 0784 _ C7. 44 24, 10, 0000001C
        mov     ebx, dword [ebp-4CH]                    ; 078C _ 8B. 5D, B4
        mov     dword [esp+0CH], ebx                    ; 078F _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 0793 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 0797 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 079B _ 89. 04 24
        call    paint_rectangle                         ; 079E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-4CH]                    ; 07A3 _ 8B. 45, B4
        lea     ecx, [eax+8H]                           ; 07A6 _ 8D. 48, 08
        mov     edx, dword [sheet_win]                  ; 07A9 _ 8B. 15, 00000000(d)
        mov     eax, dword [sheet_control]              ; 07AF _ A1, 00000000(d)
        mov     dword [esp+14H], 44                     ; 07B4 _ C7. 44 24, 14, 0000002C
        mov     dword [esp+10H], ecx                    ; 07BC _ 89. 4C 24, 10
        mov     dword [esp+0CH], 28                     ; 07C0 _ C7. 44 24, 0C, 0000001C
        mov     ecx, dword [ebp-4CH]                    ; 07C8 _ 8B. 4D, B4
        mov     dword [esp+8H], ecx                     ; 07CB _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 07CF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 07D3 _ 89. 04 24
        call    sheet_refresh                           ; 07D6 _ E8, FFFFFFFC(rel)
        jmp     ?_001                                   ; 07DB _ E9, FFFFFC24

?_010:  jmp     ?_001                                   ; 07E0 _ E9, FFFFFC1F
; CMain End of function

task_b_main:; Function begin
        push    ebp                                     ; 07E5 _ 55
        mov     ebp, esp                                ; 07E6 _ 89. E5
        sub     esp, 88                                 ; 07E8 _ 83. EC, 58
; Note: Absolute memory address without relocation
        mov     eax, dword [gs:14H]                     ; 07EB _ 65: A1, 00000014
        mov     dword [ebp-0CH], eax                    ; 07F1 _ 89. 45, F4
        xor     eax, eax                                ; 07F4 _ 31. C0
        mov     edx, dword [back_sheet]                 ; 07F6 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 07FC _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 0801 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_174                  ; 0809 _ C7. 44 24, 10, 00000009(d)
        mov     dword [esp+0CH], 160                    ; 0811 _ C7. 44 24, 0C, 000000A0
        mov     dword [esp+8H], 0                       ; 0819 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 0821 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0825 _ 89. 04 24
        call    paint_string                            ; 0828 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], 0                      ; 082D _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 0                      ; 0834 _ C7. 45, D0, 00000000
        lea     eax, [ebp-14H]                          ; 083B _ 8D. 45, EC
        mov     dword [esp+8H], eax                     ; 083E _ 89. 44 24, 08
        mov     dword [esp+4H], 8                       ; 0842 _ C7. 44 24, 04, 00000008
        lea     eax, [ebp-2CH]                          ; 084A _ 8D. 45, D4
        mov     dword [esp], eax                        ; 084D _ 89. 04 24
        call    fifo8_init                              ; 0850 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 0855 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-34H], eax                    ; 085A _ 89. 45, CC
        mov     dword [esp+8H], 123                     ; 085D _ C7. 44 24, 08, 0000007B
        lea     eax, [ebp-2CH]                          ; 0865 _ 8D. 45, D4
        mov     dword [esp+4H], eax                     ; 0868 _ 89. 44 24, 04
        mov     eax, dword [ebp-34H]                    ; 086C _ 8B. 45, CC
        mov     dword [esp], eax                        ; 086F _ 89. 04 24
        call    timer_init                              ; 0872 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 0877 _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-34H]                    ; 087F _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0882 _ 89. 04 24
        call    timer_settime                           ; 0885 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-38H], 0                      ; 088A _ C7. 45, C8, 00000000
?_011:  call    io_cli                                  ; 0891 _ E8, FFFFFFFC(rel)
        lea     eax, [ebp-2CH]                          ; 0896 _ 8D. 45, D4
        mov     dword [esp], eax                        ; 0899 _ 89. 04 24
        call    fifo8_status                            ; 089C _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 08A1 _ 85. C0
        jnz     ?_012                                   ; 08A3 _ 75, 07
        call    io_sti                                  ; 08A5 _ E8, FFFFFFFC(rel)
        jmp     ?_013                                   ; 08AA _ EB, 6B

?_012:  lea     eax, [ebp-2CH]                          ; 08AC _ 8D. 45, D4
        mov     dword [esp], eax                        ; 08AF _ 89. 04 24
        call    fifo8_get                               ; 08B2 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-30H], eax                    ; 08B7 _ 89. 45, D0
        call    io_sti                                  ; 08BA _ E8, FFFFFFFC(rel)
        cmp     dword [ebp-30H], 123                    ; 08BF _ 83. 7D, D0, 7B
        jnz     ?_013                                   ; 08C3 _ 75, 52
        mov     edx, dword [back_sheet]                 ; 08C5 _ 8B. 15, 00000004(d)
        mov     eax, dword [sheet_control]              ; 08CB _ A1, 00000000(d)
        mov     dword [esp+14H], 7                      ; 08D0 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_175                  ; 08D8 _ C7. 44 24, 10, 00000016(d)
        mov     dword [esp+0CH], 176                    ; 08E0 _ C7. 44 24, 0C, 000000B0
        mov     ecx, dword [ebp-38H]                    ; 08E8 _ 8B. 4D, C8
        mov     dword [esp+8H], ecx                     ; 08EB _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 08EF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 08F3 _ 89. 04 24
        call    paint_string                            ; 08F6 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 100                     ; 08FB _ C7. 44 24, 04, 00000064
        mov     eax, dword [ebp-34H]                    ; 0903 _ 8B. 45, CC
        mov     dword [esp], eax                        ; 0906 _ 89. 04 24
        call    timer_settime                           ; 0909 _ E8, FFFFFFFC(rel)
        add     dword [ebp-38H], 8                      ; 090E _ 83. 45, C8, 08
        jmp     ?_011                                   ; 0912 _ E9, FFFFFF7A

?_013:  jmp     ?_011                                   ; 0917 _ E9, FFFFFF75
; task_b_main End of function

init_screeninfo:; Function begin
        push    ebp                                     ; 091C _ 55
        mov     ebp, esp                                ; 091D _ 89. E5
        mov     eax, dword [VRAM_ADDRESS]               ; 091F _ A1, 00000000(d)
        mov     edx, eax                                ; 0924 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0926 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 0929 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 092B _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+4H], 640                      ; 092E _ 66: C7. 40, 04, 0280
        mov     eax, dword [ebp+8H]                     ; 0934 _ 8B. 45, 08
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [eax+6H], 480                      ; 0937 _ 66: C7. 40, 06, 01E0
        pop     ebp                                     ; 093D _ 5D
        ret                                             ; 093E _ C3
; init_screeninfo End of function

init_palette:; Function begin
        push    ebp                                     ; 093F _ 55
        mov     ebp, esp                                ; 0940 _ 89. E5
        sub     esp, 24                                 ; 0942 _ 83. EC, 18
        mov     dword [esp+8H], table_rgb.1622          ; 0945 _ C7. 44 24, 08, 00000080(d)
        mov     dword [esp+4H], 15                      ; 094D _ C7. 44 24, 04, 0000000F
        mov     dword [esp], 0                          ; 0955 _ C7. 04 24, 00000000
        call    set_palette                             ; 095C _ E8, FFFFFFFC(rel)
        nop                                             ; 0961 _ 90
        leave                                           ; 0962 _ C9
        ret                                             ; 0963 _ C3
; init_palette End of function

set_palette:; Function begin
        push    ebp                                     ; 0964 _ 55
        mov     ebp, esp                                ; 0965 _ 89. E5
        sub     esp, 40                                 ; 0967 _ 83. EC, 28
        call    io_load_eflags                          ; 096A _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 096F _ 89. 45, F4
        call    io_cli                                  ; 0972 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 0977 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 097A _ 89. 44 24, 04
        mov     dword [esp], 968                        ; 097E _ C7. 04 24, 000003C8
        call    io_out8                                 ; 0985 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+8H]                     ; 098A _ 8B. 45, 08
        mov     dword [ebp-10H], eax                    ; 098D _ 89. 45, F0
        jmp     ?_015                                   ; 0990 _ EB, 62

?_014:  mov     eax, dword [ebp+10H]                    ; 0992 _ 8B. 45, 10
        movzx   eax, byte [eax]                         ; 0995 _ 0F B6. 00
        shr     al, 2                                   ; 0998 _ C0. E8, 02
        movzx   eax, al                                 ; 099B _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 099E _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 09A2 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 09A9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 09AE _ 8B. 45, 10
        add     eax, 1                                  ; 09B1 _ 83. C0, 01
        movzx   eax, byte [eax]                         ; 09B4 _ 0F B6. 00
        shr     al, 2                                   ; 09B7 _ C0. E8, 02
        movzx   eax, al                                 ; 09BA _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 09BD _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 09C1 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 09C8 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 09CD _ 8B. 45, 10
        add     eax, 2                                  ; 09D0 _ 83. C0, 02
        movzx   eax, byte [eax]                         ; 09D3 _ 0F B6. 00
        shr     al, 2                                   ; 09D6 _ C0. E8, 02
        movzx   eax, al                                 ; 09D9 _ 0F B6. C0
        mov     dword [esp+4H], eax                     ; 09DC _ 89. 44 24, 04
        mov     dword [esp], 969                        ; 09E0 _ C7. 04 24, 000003C9
        call    io_out8                                 ; 09E7 _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 3                      ; 09EC _ 83. 45, 10, 03
        add     dword [ebp-10H], 1                      ; 09F0 _ 83. 45, F0, 01
?_015:  mov     eax, dword [ebp-10H]                    ; 09F4 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 09F7 _ 3B. 45, 0C
        jle     ?_014                                   ; 09FA _ 7E, 96
        mov     eax, dword [ebp-0CH]                    ; 09FC _ 8B. 45, F4
        mov     dword [esp], eax                        ; 09FF _ 89. 04 24
        call    io_store_eflags                         ; 0A02 _ E8, FFFFFFFC(rel)
        nop                                             ; 0A07 _ 90
        leave                                           ; 0A08 _ C9
        ret                                             ; 0A09 _ C3
; set_palette End of function

paint_rectangle:; Function begin
        push    ebp                                     ; 0A0A _ 55
        mov     ebp, esp                                ; 0A0B _ 89. E5
        sub     esp, 20                                 ; 0A0D _ 83. EC, 14
        mov     eax, dword [ebp+10H]                    ; 0A10 _ 8B. 45, 10
        mov     byte [ebp-14H], al                      ; 0A13 _ 88. 45, EC
        mov     eax, dword [ebp+18H]                    ; 0A16 _ 8B. 45, 18
        mov     dword [ebp-4H], eax                     ; 0A19 _ 89. 45, FC
        jmp     ?_019                                   ; 0A1C _ EB, 33

?_016:  mov     eax, dword [ebp+14H]                    ; 0A1E _ 8B. 45, 14
        mov     dword [ebp-8H], eax                     ; 0A21 _ 89. 45, F8
        jmp     ?_018                                   ; 0A24 _ EB, 1F

?_017:  mov     eax, dword [ebp-4H]                     ; 0A26 _ 8B. 45, FC
        imul    eax, dword [ebp+0CH]                    ; 0A29 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0A2D _ 89. C2
        mov     eax, dword [ebp-8H]                     ; 0A2F _ 8B. 45, F8
        add     eax, edx                                ; 0A32 _ 01. D0
        mov     edx, eax                                ; 0A34 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0A36 _ 8B. 45, 08
        add     edx, eax                                ; 0A39 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0A3B _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0A3F _ 88. 02
        add     dword [ebp-8H], 1                       ; 0A41 _ 83. 45, F8, 01
?_018:  mov     eax, dword [ebp-8H]                     ; 0A45 _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 0A48 _ 3B. 45, 1C
        jle     ?_017                                   ; 0A4B _ 7E, D9
        add     dword [ebp-4H], 1                       ; 0A4D _ 83. 45, FC, 01
?_019:  mov     eax, dword [ebp-4H]                     ; 0A51 _ 8B. 45, FC
        cmp     eax, dword [ebp+20H]                    ; 0A54 _ 3B. 45, 20
        jle     ?_016                                   ; 0A57 _ 7E, C5
        leave                                           ; 0A59 _ C9
        ret                                             ; 0A5A _ C3
; paint_rectangle End of function

init_desktop:; Function begin
        push    ebp                                     ; 0A5B _ 55
        mov     ebp, esp                                ; 0A5C _ 89. E5
        push    ebx                                     ; 0A5E _ 53
        sub     esp, 28                                 ; 0A5F _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 0A62 _ 8B. 45, 10
        lea     edx, [eax-1DH]                          ; 0A65 _ 8D. 50, E3
        mov     eax, dword [ebp+0CH]                    ; 0A68 _ 8B. 45, 0C
        sub     eax, 1                                  ; 0A6B _ 83. E8, 01
        mov     dword [esp+18H], edx                    ; 0A6E _ 89. 54 24, 18
        mov     dword [esp+14H], eax                    ; 0A72 _ 89. 44 24, 14
        mov     dword [esp+10H], 0                      ; 0A76 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 0A7E _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 2                       ; 0A86 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0A8E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A91 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A95 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A98 _ 89. 04 24
        call    paint_rectangle                         ; 0A9B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0AA0 _ 8B. 45, 10
        lea     ecx, [eax-1CH]                          ; 0AA3 _ 8D. 48, E4
        mov     eax, dword [ebp+0CH]                    ; 0AA6 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0AA9 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0AAC _ 8B. 45, 10
        sub     eax, 28                                 ; 0AAF _ 83. E8, 1C
        mov     dword [esp+18H], ecx                    ; 0AB2 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0AB6 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0ABA _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0ABE _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0AC6 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0ACE _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0AD1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0AD5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0AD8 _ 89. 04 24
        call    paint_rectangle                         ; 0ADB _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0AE0 _ 8B. 45, 10
        lea     ecx, [eax-1BH]                          ; 0AE3 _ 8D. 48, E5
        mov     eax, dword [ebp+0CH]                    ; 0AE6 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0AE9 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0AEC _ 8B. 45, 10
        sub     eax, 27                                 ; 0AEF _ 83. E8, 1B
        mov     dword [esp+18H], ecx                    ; 0AF2 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0AF6 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0AFA _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0AFE _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 7                       ; 0B06 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0B0E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0B11 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0B15 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0B18 _ 89. 04 24
        call    paint_rectangle                         ; 0B1B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B20 _ 8B. 45, 10
        lea     ecx, [eax-1H]                           ; 0B23 _ 8D. 48, FF
        mov     eax, dword [ebp+0CH]                    ; 0B26 _ 8B. 45, 0C
        lea     edx, [eax-1H]                           ; 0B29 _ 8D. 50, FF
        mov     eax, dword [ebp+10H]                    ; 0B2C _ 8B. 45, 10
        sub     eax, 26                                 ; 0B2F _ 83. E8, 1A
        mov     dword [esp+18H], ecx                    ; 0B32 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 0B36 _ 89. 54 24, 14
        mov     dword [esp+10H], eax                    ; 0B3A _ 89. 44 24, 10
        mov     dword [esp+0CH], 0                      ; 0B3E _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 0B46 _ C7. 44 24, 08, 00000008
        mov     eax, dword [ebp+0CH]                    ; 0B4E _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0B51 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0B55 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0B58 _ 89. 04 24
        call    paint_rectangle                         ; 0B5B _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B60 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0B63 _ 8D. 50, E8
        mov     eax, dword [ebp+10H]                    ; 0B66 _ 8B. 45, 10
        sub     eax, 24                                 ; 0B69 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0B6C _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0B70 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0B78 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0B7C _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 7                       ; 0B84 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0B8C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0B8F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0B93 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0B96 _ 89. 04 24
        call    paint_rectangle                         ; 0B99 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0B9E _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0BA1 _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0BA4 _ 8B. 45, 10
        sub     eax, 24                                 ; 0BA7 _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0BAA _ 89. 54 24, 18
        mov     dword [esp+14H], 2                      ; 0BAE _ C7. 44 24, 14, 00000002
        mov     dword [esp+10H], eax                    ; 0BB6 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0BBA _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 7                       ; 0BC2 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0BCA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0BCD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0BD1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0BD4 _ 89. 04 24
        call    paint_rectangle                         ; 0BD7 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0BDC _ 8B. 45, 10
        lea     edx, [eax-4H]                           ; 0BDF _ 8D. 50, FC
        mov     eax, dword [ebp+10H]                    ; 0BE2 _ 8B. 45, 10
        sub     eax, 4                                  ; 0BE5 _ 83. E8, 04
        mov     dword [esp+18H], edx                    ; 0BE8 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0BEC _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0BF4 _ 89. 44 24, 10
        mov     dword [esp+0CH], 3                      ; 0BF8 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 2                       ; 0C00 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0C08 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C0B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C0F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C12 _ 89. 04 24
        call    paint_rectangle                         ; 0C15 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C1A _ 8B. 45, 10
        lea     edx, [eax-5H]                           ; 0C1D _ 8D. 50, FB
        mov     eax, dword [ebp+10H]                    ; 0C20 _ 8B. 45, 10
        sub     eax, 23                                 ; 0C23 _ 83. E8, 17
        mov     dword [esp+18H], edx                    ; 0C26 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0C2A _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0C32 _ 89. 44 24, 10
        mov     dword [esp+0CH], 59                     ; 0C36 _ C7. 44 24, 0C, 0000003B
        mov     dword [esp+8H], 2                       ; 0C3E _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0C46 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C49 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C4D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C50 _ 89. 04 24
        call    paint_rectangle                         ; 0C53 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C58 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0C5B _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0C5E _ 8B. 45, 10
        sub     eax, 3                                  ; 0C61 _ 83. E8, 03
        mov     dword [esp+18H], edx                    ; 0C64 _ 89. 54 24, 18
        mov     dword [esp+14H], 59                     ; 0C68 _ C7. 44 24, 14, 0000003B
        mov     dword [esp+10H], eax                    ; 0C70 _ 89. 44 24, 10
        mov     dword [esp+0CH], 2                      ; 0C74 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 0                       ; 0C7C _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0C84 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0C87 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0C8B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0C8E _ 89. 04 24
        call    paint_rectangle                         ; 0C91 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0C96 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0C99 _ 8D. 50, FD
        mov     eax, dword [ebp+10H]                    ; 0C9C _ 8B. 45, 10
        sub     eax, 24                                 ; 0C9F _ 83. E8, 18
        mov     dword [esp+18H], edx                    ; 0CA2 _ 89. 54 24, 18
        mov     dword [esp+14H], 60                     ; 0CA6 _ C7. 44 24, 14, 0000003C
        mov     dword [esp+10H], eax                    ; 0CAE _ 89. 44 24, 10
        mov     dword [esp+0CH], 60                     ; 0CB2 _ C7. 44 24, 0C, 0000003C
        mov     dword [esp+8H], 0                       ; 0CBA _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp+0CH]                    ; 0CC2 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0CC5 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0CC9 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0CCC _ 89. 04 24
        call    paint_rectangle                         ; 0CCF _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0CD4 _ 8B. 45, 10
        lea     ebx, [eax-18H]                          ; 0CD7 _ 8D. 58, E8
        mov     eax, dword [ebp+0CH]                    ; 0CDA _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0CDD _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0CE0 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0CE3 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0CE6 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0CE9 _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0CEC _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0CF0 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0CF4 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0CF8 _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0CFC _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0D04 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D07 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D0B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D0E _ 89. 04 24
        call    paint_rectangle                         ; 0D11 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D16 _ 8B. 45, 10
        lea     ebx, [eax-4H]                           ; 0D19 _ 8D. 58, FC
        mov     eax, dword [ebp+0CH]                    ; 0D1C _ 8B. 45, 0C
        lea     ecx, [eax-2FH]                          ; 0D1F _ 8D. 48, D1
        mov     eax, dword [ebp+10H]                    ; 0D22 _ 8B. 45, 10
        lea     edx, [eax-17H]                          ; 0D25 _ 8D. 50, E9
        mov     eax, dword [ebp+0CH]                    ; 0D28 _ 8B. 45, 0C
        sub     eax, 47                                 ; 0D2B _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0D2E _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0D32 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0D36 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0D3A _ 89. 44 24, 0C
        mov     dword [esp+8H], 2                       ; 0D3E _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp+0CH]                    ; 0D46 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D49 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D4D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D50 _ 89. 04 24
        call    paint_rectangle                         ; 0D53 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D58 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0D5B _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0D5E _ 8B. 45, 0C
        lea     ecx, [eax-4H]                           ; 0D61 _ 8D. 48, FC
        mov     eax, dword [ebp+10H]                    ; 0D64 _ 8B. 45, 10
        lea     edx, [eax-3H]                           ; 0D67 _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 0D6A _ 8B. 45, 0C
        sub     eax, 47                                 ; 0D6D _ 83. E8, 2F
        mov     dword [esp+18H], ebx                    ; 0D70 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0D74 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0D78 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0D7C _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0D80 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0D88 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0D8B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0D8F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0D92 _ 89. 04 24
        call    paint_rectangle                         ; 0D95 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 0D9A _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 0D9D _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 0DA0 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 0DA3 _ 8D. 48, FD
        mov     eax, dword [ebp+10H]                    ; 0DA6 _ 8B. 45, 10
        lea     edx, [eax-18H]                          ; 0DA9 _ 8D. 50, E8
        mov     eax, dword [ebp+0CH]                    ; 0DAC _ 8B. 45, 0C
        sub     eax, 3                                  ; 0DAF _ 83. E8, 03
        mov     dword [esp+18H], ebx                    ; 0DB2 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 0DB6 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 0DBA _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 0DBE _ 89. 44 24, 0C
        mov     dword [esp+8H], 7                       ; 0DC2 _ C7. 44 24, 08, 00000007
        mov     eax, dword [ebp+0CH]                    ; 0DCA _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0DCD _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0DD1 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0DD4 _ 89. 04 24
        call    paint_rectangle                         ; 0DD7 _ E8, FFFFFFFC(rel)
        add     esp, 28                                 ; 0DDC _ 83. C4, 1C
        pop     ebx                                     ; 0DDF _ 5B
        pop     ebp                                     ; 0DE0 _ 5D
        ret                                             ; 0DE1 _ C3
; init_desktop End of function

init_mouse_position:; Function begin
        push    ebp                                     ; 0DE2 _ 55
        mov     ebp, esp                                ; 0DE3 _ 89. E5
        sub     esp, 16                                 ; 0DE5 _ 83. EC, 10
        movzx   eax, word [?_184]                       ; 0DE8 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 0DEF _ 98
        mov     dword [ebp-8H], eax                     ; 0DF0 _ 89. 45, F8
        movzx   eax, word [?_185]                       ; 0DF3 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 0DFA _ 98
        mov     dword [ebp-4H], eax                     ; 0DFB _ 89. 45, FC
        mov     eax, dword [ebp-8H]                     ; 0DFE _ 8B. 45, F8
        sub     eax, 16                                 ; 0E01 _ 83. E8, 10
        mov     edx, eax                                ; 0E04 _ 89. C2
        shr     edx, 31                                 ; 0E06 _ C1. EA, 1F
        add     eax, edx                                ; 0E09 _ 01. D0
        sar     eax, 1                                  ; 0E0B _ D1. F8
        mov     dword [mouse_x], eax                    ; 0E0D _ A3, 00000228(d)
        mov     eax, dword [ebp-4H]                     ; 0E12 _ 8B. 45, FC
        sub     eax, 44                                 ; 0E15 _ 83. E8, 2C
        mov     edx, eax                                ; 0E18 _ 89. C2
        shr     edx, 31                                 ; 0E1A _ C1. EA, 1F
        add     eax, edx                                ; 0E1D _ 01. D0
        sar     eax, 1                                  ; 0E1F _ D1. F8
        mov     dword [mouse_y], eax                    ; 0E21 _ A3, 0000022C(d)
        leave                                           ; 0E26 _ C9
        ret                                             ; 0E27 _ C3
; init_mouse_position End of function

paint_font:; Function begin
        push    ebp                                     ; 0E28 _ 55
        mov     ebp, esp                                ; 0E29 _ 89. E5
        sub     esp, 20                                 ; 0E2B _ 83. EC, 14
        mov     eax, dword [ebp+1CH]                    ; 0E2E _ 8B. 45, 1C
        mov     byte [ebp-14H], al                      ; 0E31 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 0E34 _ C7. 45, FC, 00000000
        jmp     ?_029                                   ; 0E3B _ E9, 0000016E

?_020:  mov     edx, dword [ebp-4H]                     ; 0E40 _ 8B. 55, FC
        mov     eax, dword [ebp+18H]                    ; 0E43 _ 8B. 45, 18
        add     eax, edx                                ; 0E46 _ 01. D0
        movzx   eax, byte [eax]                         ; 0E48 _ 0F B6. 00
        mov     byte [ebp-5H], al                       ; 0E4B _ 88. 45, FB
        movzx   eax, byte [ebp-5H]                      ; 0E4E _ 0F B6. 45, FB
        test    al, al                                  ; 0E52 _ 84. C0
        jns     ?_021                                   ; 0E54 _ 79, 20
        mov     eax, dword [ebp-4H]                     ; 0E56 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0E59 _ 8B. 55, 14
        add     eax, edx                                ; 0E5C _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0E5E _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0E62 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0E64 _ 8B. 45, 10
        add     eax, edx                                ; 0E67 _ 01. D0
        mov     edx, eax                                ; 0E69 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 0E6B _ 8B. 45, 08
        add     edx, eax                                ; 0E6E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0E70 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0E74 _ 88. 02
?_021:  movzx   eax, byte [ebp-5H]                      ; 0E76 _ 0F B6. 45, FB
        and     eax, 40H                                ; 0E7A _ 83. E0, 40
        test    eax, eax                                ; 0E7D _ 85. C0
        jz      ?_022                                   ; 0E7F _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0E81 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0E84 _ 8B. 55, 14
        add     eax, edx                                ; 0E87 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0E89 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0E8D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0E8F _ 8B. 45, 10
        add     eax, edx                                ; 0E92 _ 01. D0
        lea     edx, [eax+1H]                           ; 0E94 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 0E97 _ 8B. 45, 08
        add     edx, eax                                ; 0E9A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0E9C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0EA0 _ 88. 02
?_022:  movzx   eax, byte [ebp-5H]                      ; 0EA2 _ 0F B6. 45, FB
        and     eax, 20H                                ; 0EA6 _ 83. E0, 20
        test    eax, eax                                ; 0EA9 _ 85. C0
        jz      ?_023                                   ; 0EAB _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0EAD _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0EB0 _ 8B. 55, 14
        add     eax, edx                                ; 0EB3 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0EB5 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0EB9 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0EBB _ 8B. 45, 10
        add     eax, edx                                ; 0EBE _ 01. D0
        lea     edx, [eax+2H]                           ; 0EC0 _ 8D. 50, 02
        mov     eax, dword [ebp+8H]                     ; 0EC3 _ 8B. 45, 08
        add     edx, eax                                ; 0EC6 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0EC8 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0ECC _ 88. 02
?_023:  movzx   eax, byte [ebp-5H]                      ; 0ECE _ 0F B6. 45, FB
        and     eax, 10H                                ; 0ED2 _ 83. E0, 10
        test    eax, eax                                ; 0ED5 _ 85. C0
        jz      ?_024                                   ; 0ED7 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0ED9 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0EDC _ 8B. 55, 14
        add     eax, edx                                ; 0EDF _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0EE1 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0EE5 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0EE7 _ 8B. 45, 10
        add     eax, edx                                ; 0EEA _ 01. D0
        lea     edx, [eax+3H]                           ; 0EEC _ 8D. 50, 03
        mov     eax, dword [ebp+8H]                     ; 0EEF _ 8B. 45, 08
        add     edx, eax                                ; 0EF2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0EF4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0EF8 _ 88. 02
?_024:  movzx   eax, byte [ebp-5H]                      ; 0EFA _ 0F B6. 45, FB
        and     eax, 08H                                ; 0EFE _ 83. E0, 08
        test    eax, eax                                ; 0F01 _ 85. C0
        jz      ?_025                                   ; 0F03 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0F05 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0F08 _ 8B. 55, 14
        add     eax, edx                                ; 0F0B _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0F0D _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0F11 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0F13 _ 8B. 45, 10
        add     eax, edx                                ; 0F16 _ 01. D0
        lea     edx, [eax+4H]                           ; 0F18 _ 8D. 50, 04
        mov     eax, dword [ebp+8H]                     ; 0F1B _ 8B. 45, 08
        add     edx, eax                                ; 0F1E _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0F20 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0F24 _ 88. 02
?_025:  movzx   eax, byte [ebp-5H]                      ; 0F26 _ 0F B6. 45, FB
        and     eax, 04H                                ; 0F2A _ 83. E0, 04
        test    eax, eax                                ; 0F2D _ 85. C0
        jz      ?_026                                   ; 0F2F _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0F31 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0F34 _ 8B. 55, 14
        add     eax, edx                                ; 0F37 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0F39 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0F3D _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0F3F _ 8B. 45, 10
        add     eax, edx                                ; 0F42 _ 01. D0
        lea     edx, [eax+5H]                           ; 0F44 _ 8D. 50, 05
        mov     eax, dword [ebp+8H]                     ; 0F47 _ 8B. 45, 08
        add     edx, eax                                ; 0F4A _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0F4C _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0F50 _ 88. 02
?_026:  movzx   eax, byte [ebp-5H]                      ; 0F52 _ 0F B6. 45, FB
        and     eax, 02H                                ; 0F56 _ 83. E0, 02
        test    eax, eax                                ; 0F59 _ 85. C0
        jz      ?_027                                   ; 0F5B _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0F5D _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0F60 _ 8B. 55, 14
        add     eax, edx                                ; 0F63 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0F65 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0F69 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0F6B _ 8B. 45, 10
        add     eax, edx                                ; 0F6E _ 01. D0
        lea     edx, [eax+6H]                           ; 0F70 _ 8D. 50, 06
        mov     eax, dword [ebp+8H]                     ; 0F73 _ 8B. 45, 08
        add     edx, eax                                ; 0F76 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0F78 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0F7C _ 88. 02
?_027:  movzx   eax, byte [ebp-5H]                      ; 0F7E _ 0F B6. 45, FB
        and     eax, 01H                                ; 0F82 _ 83. E0, 01
        test    eax, eax                                ; 0F85 _ 85. C0
        jz      ?_028                                   ; 0F87 _ 74, 21
        mov     eax, dword [ebp-4H]                     ; 0F89 _ 8B. 45, FC
        mov     edx, dword [ebp+14H]                    ; 0F8C _ 8B. 55, 14
        add     eax, edx                                ; 0F8F _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 0F91 _ 0F AF. 45, 0C
        mov     edx, eax                                ; 0F95 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 0F97 _ 8B. 45, 10
        add     eax, edx                                ; 0F9A _ 01. D0
        lea     edx, [eax+7H]                           ; 0F9C _ 8D. 50, 07
        mov     eax, dword [ebp+8H]                     ; 0F9F _ 8B. 45, 08
        add     edx, eax                                ; 0FA2 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 0FA4 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 0FA8 _ 88. 02
?_028:  add     dword [ebp-4H], 1                       ; 0FAA _ 83. 45, FC, 01
?_029:  cmp     dword [ebp-4H], 15                      ; 0FAE _ 83. 7D, FC, 0F
        jle     ?_020                                   ; 0FB2 _ 0F 8E, FFFFFE88
        leave                                           ; 0FB8 _ C9
        ret                                             ; 0FB9 _ C3
; paint_font End of function

paint_string:; Function begin
        push    ebp                                     ; 0FBA _ 55
        mov     ebp, esp                                ; 0FBB _ 89. E5
        push    ebx                                     ; 0FBD _ 53
        sub     esp, 52                                 ; 0FBE _ 83. EC, 34
        mov     eax, dword [ebp+1CH]                    ; 0FC1 _ 8B. 45, 1C
        mov     byte [ebp-1CH], al                      ; 0FC4 _ 88. 45, E4
        mov     eax, dword [ebp+10H]                    ; 0FC7 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0FCA _ 89. 45, F4
        jmp     ?_031                                   ; 0FCD _ EB, 4B

?_030:  movsx   ecx, byte [ebp-1CH]                     ; 0FCF _ 0F BE. 4D, E4
        mov     eax, dword [ebp+18H]                    ; 0FD3 _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 0FD6 _ 0F B6. 00
        movsx   eax, al                                 ; 0FD9 _ 0F BE. C0
        shl     eax, 4                                  ; 0FDC _ C1. E0, 04
        lea     ebx, [systemFont+eax]                   ; 0FDF _ 8D. 98, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 0FE5 _ 8B. 45, 0C
        mov     edx, dword [eax+4H]                     ; 0FE8 _ 8B. 50, 04
        mov     eax, dword [ebp+0CH]                    ; 0FEB _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 0FEE _ 8B. 00
        mov     dword [esp+14H], ecx                    ; 0FF0 _ 89. 4C 24, 14
        mov     dword [esp+10H], ebx                    ; 0FF4 _ 89. 5C 24, 10
        mov     ecx, dword [ebp+14H]                    ; 0FF8 _ 8B. 4D, 14
        mov     dword [esp+0CH], ecx                    ; 0FFB _ 89. 4C 24, 0C
        mov     ecx, dword [ebp+10H]                    ; 0FFF _ 8B. 4D, 10
        mov     dword [esp+8H], ecx                     ; 1002 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 1006 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 100A _ 89. 04 24
        call    paint_font                              ; 100D _ E8, FFFFFFFC(rel)
        add     dword [ebp+10H], 8                      ; 1012 _ 83. 45, 10, 08
        add     dword [ebp+18H], 1                      ; 1016 _ 83. 45, 18, 01
?_031:  mov     eax, dword [ebp+18H]                    ; 101A _ 8B. 45, 18
        movzx   eax, byte [eax]                         ; 101D _ 0F B6. 00
        test    al, al                                  ; 1020 _ 84. C0
        jnz     ?_030                                   ; 1022 _ 75, AB
        mov     eax, dword [ebp+14H]                    ; 1024 _ 8B. 45, 14
        add     eax, 16                                 ; 1027 _ 83. C0, 10
        mov     dword [esp+14H], eax                    ; 102A _ 89. 44 24, 14
        mov     eax, dword [ebp+10H]                    ; 102E _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1031 _ 89. 44 24, 10
        mov     eax, dword [ebp+14H]                    ; 1035 _ 8B. 45, 14
        mov     dword [esp+0CH], eax                    ; 1038 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 103C _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 103F _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1043 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1046 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 104A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 104D _ 89. 04 24
        call    sheet_refresh                           ; 1050 _ E8, FFFFFFFC(rel)
        add     esp, 52                                 ; 1055 _ 83. C4, 34
        pop     ebx                                     ; 1058 _ 5B
        pop     ebp                                     ; 1059 _ 5D
        ret                                             ; 105A _ C3
; paint_string End of function

init_mouse_cursor:; Function begin
        push    ebp                                     ; 105B _ 55
        mov     ebp, esp                                ; 105C _ 89. E5
        sub     esp, 20                                 ; 105E _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1061 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 1064 _ 88. 45, EC
        mov     dword [ebp-8H], 0                       ; 1067 _ C7. 45, F8, 00000000
        jmp     ?_038                                   ; 106E _ E9, 0000009C

?_032:  mov     dword [ebp-4H], 0                       ; 1073 _ C7. 45, FC, 00000000
        jmp     ?_037                                   ; 107A _ E9, 00000082

?_033:  mov     eax, dword [ebp-8H]                     ; 107F _ 8B. 45, F8
        shl     eax, 4                                  ; 1082 _ C1. E0, 04
        mov     edx, eax                                ; 1085 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 1087 _ 8B. 45, FC
        add     eax, edx                                ; 108A _ 01. D0
        add     eax, cursor.1690                        ; 108C _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 1091 _ 0F B6. 00
        cmp     al, 42                                  ; 1094 _ 3C, 2A
        jnz     ?_034                                   ; 1096 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 1098 _ 8B. 45, F8
        shl     eax, 4                                  ; 109B _ C1. E0, 04
        mov     edx, eax                                ; 109E _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 10A0 _ 8B. 45, FC
        add     eax, edx                                ; 10A3 _ 01. D0
        mov     edx, eax                                ; 10A5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 10A7 _ 8B. 45, 08
        add     eax, edx                                ; 10AA _ 01. D0
        mov     byte [eax], 0                           ; 10AC _ C6. 00, 00
        jmp     ?_036                                   ; 10AF _ EB, 4C

?_034:  mov     eax, dword [ebp-8H]                     ; 10B1 _ 8B. 45, F8
        shl     eax, 4                                  ; 10B4 _ C1. E0, 04
        mov     edx, eax                                ; 10B7 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 10B9 _ 8B. 45, FC
        add     eax, edx                                ; 10BC _ 01. D0
        add     eax, cursor.1690                        ; 10BE _ 05, 000000C0(d)
        movzx   eax, byte [eax]                         ; 10C3 _ 0F B6. 00
        cmp     al, 79                                  ; 10C6 _ 3C, 4F
        jnz     ?_035                                   ; 10C8 _ 75, 19
        mov     eax, dword [ebp-8H]                     ; 10CA _ 8B. 45, F8
        shl     eax, 4                                  ; 10CD _ C1. E0, 04
        mov     edx, eax                                ; 10D0 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 10D2 _ 8B. 45, FC
        add     eax, edx                                ; 10D5 _ 01. D0
        mov     edx, eax                                ; 10D7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 10D9 _ 8B. 45, 08
        add     eax, edx                                ; 10DC _ 01. D0
        mov     byte [eax], 7                           ; 10DE _ C6. 00, 07
        jmp     ?_036                                   ; 10E1 _ EB, 1A

?_035:  mov     eax, dword [ebp-8H]                     ; 10E3 _ 8B. 45, F8
        shl     eax, 4                                  ; 10E6 _ C1. E0, 04
        mov     edx, eax                                ; 10E9 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 10EB _ 8B. 45, FC
        add     eax, edx                                ; 10EE _ 01. D0
        mov     edx, eax                                ; 10F0 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 10F2 _ 8B. 45, 08
        add     edx, eax                                ; 10F5 _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 10F7 _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 10FB _ 88. 02
?_036:  add     dword [ebp-4H], 1                       ; 10FD _ 83. 45, FC, 01
?_037:  cmp     dword [ebp-4H], 15                      ; 1101 _ 83. 7D, FC, 0F
        jle     ?_033                                   ; 1105 _ 0F 8E, FFFFFF74
        add     dword [ebp-8H], 1                       ; 110B _ 83. 45, F8, 01
?_038:  cmp     dword [ebp-8H], 15                      ; 110F _ 83. 7D, F8, 0F
        jle     ?_032                                   ; 1113 _ 0F 8E, FFFFFF5A
        leave                                           ; 1119 _ C9
        ret                                             ; 111A _ C3
; init_mouse_cursor End of function

paint_block:; Function begin
        push    ebp                                     ; 111B _ 55
        mov     ebp, esp                                ; 111C _ 89. E5
        sub     esp, 16                                 ; 111E _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 1121 _ C7. 45, F8, 00000000
        jmp     ?_042                                   ; 1128 _ EB, 50

?_039:  mov     dword [ebp-4H], 0                       ; 112A _ C7. 45, FC, 00000000
        jmp     ?_041                                   ; 1131 _ EB, 3B

?_040:  mov     eax, dword [ebp-8H]                     ; 1133 _ 8B. 45, F8
        mov     edx, dword [ebp+14H]                    ; 1136 _ 8B. 55, 14
        add     eax, edx                                ; 1139 _ 01. D0
        imul    eax, dword [ebp+0CH]                    ; 113B _ 0F AF. 45, 0C
        mov     edx, dword [ebp-4H]                     ; 113F _ 8B. 55, FC
        mov     ecx, dword [ebp+10H]                    ; 1142 _ 8B. 4D, 10
        add     edx, ecx                                ; 1145 _ 01. CA
        add     eax, edx                                ; 1147 _ 01. D0
        mov     edx, eax                                ; 1149 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 114B _ 8B. 45, 08
        add     edx, eax                                ; 114E _ 01. C2
        mov     eax, dword [ebp-8H]                     ; 1150 _ 8B. 45, F8
        imul    eax, dword [ebp+18H]                    ; 1153 _ 0F AF. 45, 18
        mov     ecx, eax                                ; 1157 _ 89. C1
        mov     eax, dword [ebp-4H]                     ; 1159 _ 8B. 45, FC
        add     eax, ecx                                ; 115C _ 01. C8
        mov     ecx, eax                                ; 115E _ 89. C1
        mov     eax, dword [ebp+20H]                    ; 1160 _ 8B. 45, 20
        add     eax, ecx                                ; 1163 _ 01. C8
        movzx   eax, byte [eax]                         ; 1165 _ 0F B6. 00
        mov     byte [edx], al                          ; 1168 _ 88. 02
        add     dword [ebp-4H], 1                       ; 116A _ 83. 45, FC, 01
?_041:  mov     eax, dword [ebp-4H]                     ; 116E _ 8B. 45, FC
        cmp     eax, dword [ebp+18H]                    ; 1171 _ 3B. 45, 18
        jl      ?_040                                   ; 1174 _ 7C, BD
        add     dword [ebp-8H], 1                       ; 1176 _ 83. 45, F8, 01
?_042:  mov     eax, dword [ebp-8H]                     ; 117A _ 8B. 45, F8
        cmp     eax, dword [ebp+1CH]                    ; 117D _ 3B. 45, 1C
        jl      ?_039                                   ; 1180 _ 7C, A8
        leave                                           ; 1182 _ C9
        ret                                             ; 1183 _ C3
; paint_block End of function

init_fifo_buf:; Function begin
        push    ebp                                     ; 1184 _ 55
        mov     ebp, esp                                ; 1185 _ 89. E5
        sub     esp, 24                                 ; 1187 _ 83. EC, 18
        mov     dword [esp+8H], mousebuf                ; 118A _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 128                     ; 1192 _ C7. 44 24, 04, 00000080
        mov     dword [esp], mouseinfo                  ; 119A _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 11A1 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], keybuf                  ; 11A6 _ C7. 44 24, 08, 00000000(d)
        mov     dword [esp+4H], 32                      ; 11AE _ C7. 44 24, 04, 00000020
        mov     dword [esp], keyinfo                    ; 11B6 _ C7. 04 24, 00000000(d)
        call    fifo8_init                              ; 11BD _ E8, FFFFFFFC(rel)
        leave                                           ; 11C2 _ C9
        ret                                             ; 11C3 _ C3
; init_fifo_buf End of function

compute_mouse_position:; Function begin
        push    ebp                                     ; 11C4 _ 55
        mov     ebp, esp                                ; 11C5 _ 89. E5
        mov     eax, dword [ebp+10H]                    ; 11C7 _ 8B. 45, 10
        mov     edx, dword [eax+4H]                     ; 11CA _ 8B. 50, 04
        mov     eax, dword [mouse_x]                    ; 11CD _ A1, 00000228(d)
        add     eax, edx                                ; 11D2 _ 01. D0
        mov     dword [mouse_x], eax                    ; 11D4 _ A3, 00000228(d)
        mov     eax, dword [ebp+10H]                    ; 11D9 _ 8B. 45, 10
        mov     edx, dword [eax+8H]                     ; 11DC _ 8B. 50, 08
        mov     eax, dword [mouse_y]                    ; 11DF _ A1, 0000022C(d)
        add     eax, edx                                ; 11E4 _ 01. D0
        mov     dword [mouse_y], eax                    ; 11E6 _ A3, 0000022C(d)
        mov     eax, dword [mouse_x]                    ; 11EB _ A1, 00000228(d)
        test    eax, eax                                ; 11F0 _ 85. C0
        jns     ?_043                                   ; 11F2 _ 79, 0A
        mov     dword [mouse_x], 0                      ; 11F4 _ C7. 05, 00000228(d), 00000000
?_043:  mov     eax, dword [mouse_y]                    ; 11FE _ A1, 0000022C(d)
        test    eax, eax                                ; 1203 _ 85. C0
        jns     ?_044                                   ; 1205 _ 79, 0A
        mov     dword [mouse_y], 0                      ; 1207 _ C7. 05, 0000022C(d), 00000000
?_044:  movzx   eax, word [?_184]                       ; 1211 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 1218 _ 98
        lea     edx, [eax-10H]                          ; 1219 _ 8D. 50, F0
        mov     eax, dword [mouse_x]                    ; 121C _ A1, 00000228(d)
        cmp     edx, eax                                ; 1221 _ 39. C2
        jge     ?_045                                   ; 1223 _ 7D, 10
        movzx   eax, word [?_184]                       ; 1225 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 122C _ 98
        sub     eax, 16                                 ; 122D _ 83. E8, 10
        mov     dword [mouse_x], eax                    ; 1230 _ A3, 00000228(d)
?_045:  movzx   eax, word [?_184]                       ; 1235 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 123C _ 98
        lea     edx, [eax-10H]                          ; 123D _ 8D. 50, F0
        mov     eax, dword [mouse_y]                    ; 1240 _ A1, 0000022C(d)
        cmp     edx, eax                                ; 1245 _ 39. C2
        jge     ?_046                                   ; 1247 _ 7D, 10
        movzx   eax, word [?_184]                       ; 1249 _ 0F B7. 05, 00000104(d)
        cwde                                            ; 1250 _ 98
        sub     eax, 16                                 ; 1251 _ 83. E8, 10
        mov     dword [mouse_y], eax                    ; 1254 _ A3, 0000022C(d)
?_046:  pop     ebp                                     ; 1259 _ 5D
        ret                                             ; 125A _ C3
; compute_mouse_position End of function

show_mouse_info:; Function begin
        push    ebp                                     ; 125B _ 55
        mov     ebp, esp                                ; 125C _ 89. E5
        sub     esp, 40                                 ; 125E _ 83. EC, 28
        mov     byte [ebp-9H], 0                        ; 1261 _ C6. 45, F7, 00
        call    io_sti                                  ; 1265 _ E8, FFFFFFFC(rel)
        mov     dword [esp], mouseinfo                  ; 126A _ C7. 04 24, 00000000(d)
        call    fifo8_get                               ; 1271 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 1276 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 1279 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 127D _ 89. 44 24, 04
        mov     dword [esp], mouse_send_info            ; 1281 _ C7. 04 24, 00000000(d)
        call    mouse_decode                            ; 1288 _ E8, FFFFFFFC(rel)
        test    eax, eax                                ; 128D _ 85. C0
        jz      ?_047                                   ; 128F _ 74, 77
        mov     dword [esp+8H], mouse_send_info         ; 1291 _ C7. 44 24, 08, 00000000(d)
        mov     eax, dword [ebp+0CH]                    ; 1299 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 129C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 12A0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 12A3 _ 89. 04 24
        call    compute_mouse_position                  ; 12A6 _ E8, FFFFFFFC(rel)
        mov     edx, dword [mouse_y]                    ; 12AB _ 8B. 15, 0000022C(d)
        mov     eax, dword [mouse_x]                    ; 12B1 _ A1, 00000228(d)
        mov     dword [esp+0CH], edx                    ; 12B6 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 12BA _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 12BE _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 12C1 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 12C5 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 12C8 _ 89. 04 24
        call    sheet_slide                             ; 12CB _ E8, FFFFFFFC(rel)
        mov     eax, dword [mouse_send_info+0CH]        ; 12D0 _ A1, 0000000C(d)
        and     eax, 01H                                ; 12D5 _ 83. E0, 01
        test    eax, eax                                ; 12D8 _ 85. C0
        jz      ?_047                                   ; 12DA _ 74, 2C
        mov     eax, dword [mouse_y]                    ; 12DC _ A1, 0000022C(d)
        lea     ecx, [eax-8H]                           ; 12E1 _ 8D. 48, F8
        mov     eax, dword [mouse_x]                    ; 12E4 _ A1, 00000228(d)
        lea     edx, [eax-50H]                          ; 12E9 _ 8D. 50, B0
        mov     eax, dword [sheet_win]                  ; 12EC _ A1, 00000224(d)
        mov     dword [esp+0CH], ecx                    ; 12F1 _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 12F5 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 12F9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 12FD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1300 _ 89. 04 24
        call    sheet_slide                             ; 1303 _ E8, FFFFFFFC(rel)
?_047:  leave                                           ; 1308 _ C9
        ret                                             ; 1309 _ C3
; show_mouse_info End of function

show_memory_info:; Function begin
        push    ebp                                     ; 130A _ 55
        mov     ebp, esp                                ; 130B _ 89. E5
        sub     esp, 88                                 ; 130D _ 83. EC, 58
        mov     dword [ebp-38H], 0                      ; 1310 _ C7. 45, C8, 00000000
        mov     dword [ebp-34H], 0                      ; 1317 _ C7. 45, CC, 00000000
        mov     dword [ebp-30H], 104                    ; 131E _ C7. 45, D0, 00000068
        mov     eax, dword [screen_info]                ; 1325 _ A1, 00000100(d)
        mov     dword [ebp-2CH], eax                    ; 132A _ 89. 45, D4
        movzx   eax, word [?_184]                       ; 132D _ 0F B7. 05, 00000104(d)
        cwde                                            ; 1334 _ 98
        mov     dword [ebp-28H], eax                    ; 1335 _ 89. 45, D8
        movzx   eax, word [?_185]                       ; 1338 _ 0F B7. 05, 00000106(d)
        cwde                                            ; 133F _ 98
        mov     dword [ebp-24H], eax                    ; 1340 _ 89. 45, DC
        mov     eax, dword [ebp+0CH]                    ; 1343 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1346 _ 8B. 00
        mov     edx, dword [ebp-24H]                    ; 1348 _ 8B. 55, DC
        mov     dword [esp+8H], edx                     ; 134B _ 89. 54 24, 08
        mov     edx, dword [ebp-28H]                    ; 134F _ 8B. 55, D8
        mov     dword [esp+4H], edx                     ; 1352 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1356 _ 89. 04 24
        call    init_desktop                            ; 1359 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 135E _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_176                  ; 1366 _ C7. 44 24, 10, 00000018(d)
        mov     eax, dword [ebp-34H]                    ; 136E _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1371 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1375 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1378 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 137C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 137F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1383 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1386 _ 89. 04 24
        call    paint_string                            ; 1389 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+14H]                    ; 138E _ 8B. 45, 14
        mov     dword [esp], eax                        ; 1391 _ 89. 04 24
        call    intToHexStr                             ; 1394 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-20H], eax                    ; 1399 _ 89. 45, E0
        mov     dword [esp+14H], 7                      ; 139C _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-20H]                    ; 13A4 _ 8B. 45, E0
        mov     dword [esp+10H], eax                    ; 13A7 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 13AB _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 13AE _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 13B2 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 13B5 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 13B9 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 13BC _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13C0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13C3 _ 89. 04 24
        call    paint_string                            ; 13C6 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 13CB _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 13CF _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_177                  ; 13D7 _ C7. 44 24, 10, 00000022(d)
        mov     eax, dword [ebp-34H]                    ; 13DF _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 13E2 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 13E6 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 13E9 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 13ED _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 13F0 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 13F4 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 13F7 _ 89. 04 24
        call    paint_string                            ; 13FA _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 13FF _ 8B. 45, 10
        mov     eax, dword [eax]                        ; 1402 _ 8B. 00
        mov     dword [esp], eax                        ; 1404 _ 89. 04 24
        call    intToHexStr                             ; 1407 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-1CH], eax                    ; 140C _ 89. 45, E4
        mov     dword [esp+14H], 7                      ; 140F _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-1CH]                    ; 1417 _ 8B. 45, E4
        mov     dword [esp+10H], eax                    ; 141A _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 141E _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1421 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1425 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1428 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 142C _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 142F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1433 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1436 _ 89. 04 24
        call    paint_string                            ; 1439 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 143E _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 1442 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_178                  ; 144A _ C7. 44 24, 10, 0000002E(d)
        mov     eax, dword [ebp-34H]                    ; 1452 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1455 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1459 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 145C _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1460 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1463 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1467 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 146A _ 89. 04 24
        call    paint_string                            ; 146D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1472 _ 8B. 45, 10
        mov     eax, dword [eax+4H]                     ; 1475 _ 8B. 40, 04
        mov     dword [esp], eax                        ; 1478 _ 89. 04 24
        call    intToHexStr                             ; 147B _ E8, FFFFFFFC(rel)
        mov     dword [ebp-18H], eax                    ; 1480 _ 89. 45, E8
        mov     dword [esp+14H], 7                      ; 1483 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-18H]                    ; 148B _ 8B. 45, E8
        mov     dword [esp+10H], eax                    ; 148E _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1492 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1495 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1499 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 149C _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14A0 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14A3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14A7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14AA _ 89. 04 24
        call    paint_string                            ; 14AD _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 14B2 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 14B6 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_179                  ; 14BE _ C7. 44 24, 10, 0000003A(d)
        mov     eax, dword [ebp-34H]                    ; 14C6 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 14C9 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 14CD _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 14D0 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 14D4 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 14D7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 14DB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 14DE _ 89. 04 24
        call    paint_string                            ; 14E1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 14E6 _ 8B. 45, 10
        mov     eax, dword [eax+8H]                     ; 14E9 _ 8B. 40, 08
        mov     dword [esp], eax                        ; 14EC _ 89. 04 24
        call    intToHexStr                             ; 14EF _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], eax                    ; 14F4 _ 89. 45, EC
        mov     dword [esp+14H], 7                      ; 14F7 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-14H]                    ; 14FF _ 8B. 45, EC
        mov     dword [esp+10H], eax                    ; 1502 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 1506 _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 1509 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 150D _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1510 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1514 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1517 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 151B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 151E _ 89. 04 24
        call    paint_string                            ; 1521 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 1526 _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 152A _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_180                  ; 1532 _ C7. 44 24, 10, 00000046(d)
        mov     eax, dword [ebp-34H]                    ; 153A _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 153D _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 1541 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 1544 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1548 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 154B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 154F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1552 _ 89. 04 24
        call    paint_string                            ; 1555 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 155A _ 8B. 45, 10
        mov     eax, dword [eax+0CH]                    ; 155D _ 8B. 40, 0C
        mov     dword [esp], eax                        ; 1560 _ 89. 04 24
        call    intToHexStr                             ; 1563 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1568 _ 89. 45, F0
        mov     dword [esp+14H], 7                      ; 156B _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-10H]                    ; 1573 _ 8B. 45, F0
        mov     dword [esp+10H], eax                    ; 1576 _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 157A _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 157D _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 1581 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 1584 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 1588 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 158B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 158F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1592 _ 89. 04 24
        call    paint_string                            ; 1595 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 159A _ 83. 45, CC, 10
        mov     dword [esp+14H], 7                      ; 159E _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], ?_181                  ; 15A6 _ C7. 44 24, 10, 00000053(d)
        mov     eax, dword [ebp-34H]                    ; 15AE _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 15B1 _ 89. 44 24, 0C
        mov     eax, dword [ebp-38H]                    ; 15B5 _ 8B. 45, C8
        mov     dword [esp+8H], eax                     ; 15B8 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15BC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 15BF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 15C3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 15C6 _ 89. 04 24
        call    paint_string                            ; 15C9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 15CE _ 8B. 45, 10
        mov     eax, dword [eax+10H]                    ; 15D1 _ 8B. 40, 10
        mov     dword [esp], eax                        ; 15D4 _ 89. 04 24
        call    intToHexStr                             ; 15D7 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 15DC _ 89. 45, F4
        mov     dword [esp+14H], 7                      ; 15DF _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp-0CH]                    ; 15E7 _ 8B. 45, F4
        mov     dword [esp+10H], eax                    ; 15EA _ 89. 44 24, 10
        mov     eax, dword [ebp-34H]                    ; 15EE _ 8B. 45, CC
        mov     dword [esp+0CH], eax                    ; 15F1 _ 89. 44 24, 0C
        mov     eax, dword [ebp-30H]                    ; 15F5 _ 8B. 45, D0
        mov     dword [esp+8H], eax                     ; 15F8 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 15FC _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 15FF _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1603 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1606 _ 89. 04 24
        call    paint_string                            ; 1609 _ E8, FFFFFFFC(rel)
        add     dword [ebp-34H], 16                     ; 160E _ 83. 45, CC, 10
        leave                                           ; 1612 _ C9
        ret                                             ; 1613 _ C3
; show_memory_info End of function

message_box:; Function begin
        push    ebp                                     ; 1614 _ 55
        mov     ebp, esp                                ; 1615 _ 89. E5
        sub     esp, 56                                 ; 1617 _ 83. EC, 38
        mov     eax, dword [ebp+8H]                     ; 161A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 161D _ 89. 04 24
        call    sheet_alloc                             ; 1620 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 1625 _ 89. 45, F0
        mov     eax, dword [memman]                     ; 1628 _ A1, 00000000(d)
        mov     dword [esp+4H], 10880                   ; 162D _ C7. 44 24, 04, 00002A80
        mov     dword [esp], eax                        ; 1635 _ 89. 04 24
        call    memman_alloc_4k                         ; 1638 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 163D _ 89. 45, F4
        mov     dword [esp+10H], 99                     ; 1640 _ C7. 44 24, 10, 00000063
        mov     dword [esp+0CH], 68                     ; 1648 _ C7. 44 24, 0C, 00000044
        mov     dword [esp+8H], 160                     ; 1650 _ C7. 44 24, 08, 000000A0
        mov     eax, dword [ebp-0CH]                    ; 1658 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 165B _ 89. 44 24, 04
        mov     eax, dword [ebp-10H]                    ; 165F _ 8B. 45, F0
        mov     dword [esp], eax                        ; 1662 _ 89. 04 24
        call    sheet_setbuf                            ; 1665 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 166A _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 166D _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 1671 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 1674 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1678 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 167B _ 89. 04 24
        call    make_windows                            ; 167E _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1683 _ C7. 44 24, 14, 00000007
        mov     dword [esp+10H], 16                     ; 168B _ C7. 44 24, 10, 00000010
        mov     dword [esp+0CH], 144                    ; 1693 _ C7. 44 24, 0C, 00000090
        mov     dword [esp+8H], 28                      ; 169B _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 8                       ; 16A3 _ C7. 44 24, 04, 00000008
        mov     eax, dword [ebp-10H]                    ; 16AB _ 8B. 45, F0
        mov     dword [esp], eax                        ; 16AE _ 89. 04 24
        call    make_textbox                            ; 16B1 _ E8, FFFFFFFC(rel)
        mov     dword [esp+0CH], 72                     ; 16B6 _ C7. 44 24, 0C, 00000048
        mov     dword [esp+8H], 80                      ; 16BE _ C7. 44 24, 08, 00000050
        mov     eax, dword [ebp-10H]                    ; 16C6 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 16C9 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16CD _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16D0 _ 89. 04 24
        call    sheet_slide                             ; 16D3 _ E8, FFFFFFFC(rel)
        mov     dword [esp+8H], 2                       ; 16D8 _ C7. 44 24, 08, 00000002
        mov     eax, dword [ebp-10H]                    ; 16E0 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 16E3 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 16E7 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 16EA _ 89. 04 24
        call    sheet_updown                            ; 16ED _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 16F2 _ 8B. 45, F0
        leave                                           ; 16F5 _ C9
        ret                                             ; 16F6 _ C3
; message_box End of function

make_textbox:; Function begin
        push    ebp                                     ; 16F7 _ 55
        mov     ebp, esp                                ; 16F8 _ 89. E5
        push    edi                                     ; 16FA _ 57
        push    esi                                     ; 16FB _ 56
        push    ebx                                     ; 16FC _ 53
        sub     esp, 44                                 ; 16FD _ 83. EC, 2C
        mov     eax, dword [ebp+14H]                    ; 1700 _ 8B. 45, 14
        mov     edx, dword [ebp+0CH]                    ; 1703 _ 8B. 55, 0C
        add     eax, edx                                ; 1706 _ 01. D0
        mov     dword [ebp-14H], eax                    ; 1708 _ 89. 45, EC
        mov     eax, dword [ebp+18H]                    ; 170B _ 8B. 45, 18
        mov     edx, dword [ebp+10H]                    ; 170E _ 8B. 55, 10
        add     eax, edx                                ; 1711 _ 01. D0
        mov     dword [ebp-10H], eax                    ; 1713 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 1716 _ 8B. 45, 10
        lea     edi, [eax-3H]                           ; 1719 _ 8D. 78, FD
        mov     eax, dword [ebp-14H]                    ; 171C _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 171F _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 1722 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 1725 _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 1728 _ 8B. 45, 0C
        lea     ecx, [eax-2H]                           ; 172B _ 8D. 48, FE
        mov     eax, dword [ebp+8H]                     ; 172E _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1731 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1734 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1737 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1739 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 173D _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1741 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 1745 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 1749 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 1751 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1755 _ 89. 04 24
        call    paint_rectangle                         ; 1758 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 175D _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1760 _ 8D. 78, 01
        mov     eax, dword [ebp+0CH]                    ; 1763 _ 8B. 45, 0C
        lea     esi, [eax-3H]                           ; 1766 _ 8D. 70, FD
        mov     eax, dword [ebp+10H]                    ; 1769 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 176C _ 8D. 58, FD
        mov     eax, dword [ebp+0CH]                    ; 176F _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 1772 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 1775 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1778 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 177B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 177E _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1780 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1784 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1788 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 178C _ 89. 4C 24, 0C
        mov     dword [esp+8H], 15                      ; 1790 _ C7. 44 24, 08, 0000000F
        mov     dword [esp+4H], edx                     ; 1798 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 179C _ 89. 04 24
        call    paint_rectangle                         ; 179F _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 17A4 _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 17A7 _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 17AA _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 17AD _ 8D. 70, 01
        mov     eax, dword [ebp-10H]                    ; 17B0 _ 8B. 45, F0
        lea     ebx, [eax+2H]                           ; 17B3 _ 8D. 58, 02
        mov     eax, dword [ebp+0CH]                    ; 17B6 _ 8B. 45, 0C
        lea     ecx, [eax-3H]                           ; 17B9 _ 8D. 48, FD
        mov     eax, dword [ebp+8H]                     ; 17BC _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 17BF _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 17C2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 17C5 _ 8B. 00
        mov     dword [esp+18H], edi                    ; 17C7 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 17CB _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 17CF _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 17D3 _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 17D7 _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 17DF _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 17E3 _ 89. 04 24
        call    paint_rectangle                         ; 17E6 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 17EB _ 8B. 45, F0
        lea     edi, [eax+2H]                           ; 17EE _ 8D. 78, 02
        mov     eax, dword [ebp-14H]                    ; 17F1 _ 8B. 45, EC
        lea     esi, [eax+2H]                           ; 17F4 _ 8D. 70, 02
        mov     eax, dword [ebp+10H]                    ; 17F7 _ 8B. 45, 10
        lea     ebx, [eax-3H]                           ; 17FA _ 8D. 58, FD
        mov     eax, dword [ebp-14H]                    ; 17FD _ 8B. 45, EC
        lea     ecx, [eax+2H]                           ; 1800 _ 8D. 48, 02
        mov     eax, dword [ebp+8H]                     ; 1803 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1806 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1809 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 180C _ 8B. 00
        mov     dword [esp+18H], edi                    ; 180E _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1812 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1816 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 181A _ 89. 4C 24, 0C
        mov     dword [esp+8H], 7                       ; 181E _ C7. 44 24, 08, 00000007
        mov     dword [esp+4H], edx                     ; 1826 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 182A _ 89. 04 24
        call    paint_rectangle                         ; 182D _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1832 _ 8B. 45, 10
        lea     ecx, [eax-2H]                           ; 1835 _ 8D. 48, FE
        mov     eax, dword [ebp+10H]                    ; 1838 _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 183B _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 183E _ 8B. 45, 0C
        lea     ebx, [eax-1H]                           ; 1841 _ 8D. 58, FF
        mov     eax, dword [ebp+8H]                     ; 1844 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1847 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 184A _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 184D _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 184F _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 1853 _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 1856 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 185A _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 185E _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 1862 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 186A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 186E _ 89. 04 24
        call    paint_rectangle                         ; 1871 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 1876 _ 8B. 45, 0C
        lea     edi, [eax-2H]                           ; 1879 _ 8D. 78, FE
        mov     eax, dword [ebp+10H]                    ; 187C _ 8B. 45, 10
        lea     esi, [eax-2H]                           ; 187F _ 8D. 70, FE
        mov     eax, dword [ebp+0CH]                    ; 1882 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 1885 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 1888 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 188B _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 188E _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1891 _ 8B. 00
        mov     ecx, dword [ebp-10H]                    ; 1893 _ 8B. 4D, F0
        mov     dword [esp+18H], ecx                    ; 1896 _ 89. 4C 24, 18
        mov     dword [esp+14H], edi                    ; 189A _ 89. 7C 24, 14
        mov     dword [esp+10H], esi                    ; 189E _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 18A2 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 0                       ; 18A6 _ C7. 44 24, 08, 00000000
        mov     dword [esp+4H], edx                     ; 18AE _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18B2 _ 89. 04 24
        call    paint_rectangle                         ; 18B5 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 18BA _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 18BD _ 8D. 48, 01
        mov     eax, dword [ebp-10H]                    ; 18C0 _ 8B. 45, F0
        lea     esi, [eax+1H]                           ; 18C3 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 18C6 _ 8B. 45, 0C
        lea     ebx, [eax-2H]                           ; 18C9 _ 8D. 58, FE
        mov     eax, dword [ebp+8H]                     ; 18CC _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 18CF _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 18D2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 18D5 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 18D7 _ 89. 4C 24, 18
        mov     ecx, dword [ebp-14H]                    ; 18DB _ 8B. 4D, EC
        mov     dword [esp+14H], ecx                    ; 18DE _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 18E2 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 18E6 _ 89. 5C 24, 0C
        mov     dword [esp+8H], 8                       ; 18EA _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 18F2 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 18F6 _ 89. 04 24
        call    paint_rectangle                         ; 18F9 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 18FE _ 8B. 45, F0
        lea     edi, [eax+1H]                           ; 1901 _ 8D. 78, 01
        mov     eax, dword [ebp-14H]                    ; 1904 _ 8B. 45, EC
        lea     esi, [eax+1H]                           ; 1907 _ 8D. 70, 01
        mov     eax, dword [ebp+10H]                    ; 190A _ 8B. 45, 10
        lea     ebx, [eax-2H]                           ; 190D _ 8D. 58, FE
        mov     eax, dword [ebp-14H]                    ; 1910 _ 8B. 45, EC
        lea     ecx, [eax+1H]                           ; 1913 _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 1916 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 1919 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 191C _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 191F _ 8B. 00
        mov     dword [esp+18H], edi                    ; 1921 _ 89. 7C 24, 18
        mov     dword [esp+14H], esi                    ; 1925 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 1929 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 192D _ 89. 4C 24, 0C
        mov     dword [esp+8H], 8                       ; 1931 _ C7. 44 24, 08, 00000008
        mov     dword [esp+4H], edx                     ; 1939 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 193D _ 89. 04 24
        call    paint_rectangle                         ; 1940 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 1945 _ 8B. 45, 10
        lea     edi, [eax-1H]                           ; 1948 _ 8D. 78, FF
        mov     eax, dword [ebp+0CH]                    ; 194B _ 8B. 45, 0C
        lea     esi, [eax-1H]                           ; 194E _ 8D. 70, FF
        mov     eax, dword [ebp+1CH]                    ; 1951 _ 8B. 45, 1C
        movzx   ecx, al                                 ; 1954 _ 0F B6. C8
        mov     eax, dword [ebp+8H]                     ; 1957 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 195A _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 195D _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 1960 _ 8B. 00
        mov     ebx, dword [ebp-10H]                    ; 1962 _ 8B. 5D, F0
        mov     dword [esp+18H], ebx                    ; 1965 _ 89. 5C 24, 18
        mov     ebx, dword [ebp-14H]                    ; 1969 _ 8B. 5D, EC
        mov     dword [esp+14H], ebx                    ; 196C _ 89. 5C 24, 14
        mov     dword [esp+10H], edi                    ; 1970 _ 89. 7C 24, 10
        mov     dword [esp+0CH], esi                    ; 1974 _ 89. 74 24, 0C
        mov     dword [esp+8H], ecx                     ; 1978 _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 197C _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1980 _ 89. 04 24
        call    paint_rectangle                         ; 1983 _ E8, FFFFFFFC(rel)
        add     esp, 44                                 ; 1988 _ 83. C4, 2C
        pop     ebx                                     ; 198B _ 5B
        pop     esi                                     ; 198C _ 5E
        pop     edi                                     ; 198D _ 5F
        pop     ebp                                     ; 198E _ 5D
        ret                                             ; 198F _ C3
; make_textbox End of function

make_windows:; Function begin
        push    ebp                                     ; 1990 _ 55
        mov     ebp, esp                                ; 1991 _ 89. E5
        push    ebx                                     ; 1993 _ 53
        sub     esp, 68                                 ; 1994 _ 83. EC, 44
        mov     eax, dword [ebp+0CH]                    ; 1997 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 199A _ 8B. 40, 04
        mov     dword [ebp-10H], eax                    ; 199D _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 19A0 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 19A3 _ 8B. 40, 08
        mov     dword [ebp-0CH], eax                    ; 19A6 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 19A9 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 19AC _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 19AF _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 19B2 _ 8B. 00
        mov     dword [esp+18H], 0                      ; 19B4 _ C7. 44 24, 18, 00000000
        mov     dword [esp+14H], edx                    ; 19BC _ 89. 54 24, 14
        mov     dword [esp+10H], 0                      ; 19C0 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 19C8 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 19D0 _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 19D8 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 19DB _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 19DF _ 89. 04 24
        call    paint_rectangle                         ; 19E2 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 19E7 _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 19EA _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 19ED _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 19F0 _ 8B. 00
        mov     dword [esp+18H], 1                      ; 19F2 _ C7. 44 24, 18, 00000001
        mov     dword [esp+14H], edx                    ; 19FA _ 89. 54 24, 14
        mov     dword [esp+10H], 1                      ; 19FE _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1A06 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1A0E _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1A16 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1A19 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A1D _ 89. 04 24
        call    paint_rectangle                         ; 1A20 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1A25 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1A28 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1A2B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A2E _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1A30 _ 89. 54 24, 18
        mov     dword [esp+14H], 0                      ; 1A34 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], 0                      ; 1A3C _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], 0                      ; 1A44 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 8                       ; 1A4C _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1A54 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1A57 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A5B _ 89. 04 24
        call    paint_rectangle                         ; 1A5E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1A63 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1A66 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1A69 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1A6C _ 8B. 00
        mov     dword [esp+18H], edx                    ; 1A6E _ 89. 54 24, 18
        mov     dword [esp+14H], 1                      ; 1A72 _ C7. 44 24, 14, 00000001
        mov     dword [esp+10H], 1                      ; 1A7A _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], 1                      ; 1A82 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 7                       ; 1A8A _ C7. 44 24, 08, 00000007
        mov     edx, dword [ebp-10H]                    ; 1A92 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1A95 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1A99 _ 89. 04 24
        call    paint_rectangle                         ; 1A9C _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1AA1 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1AA4 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1AA7 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1AAA _ 8D. 48, FE
        mov     eax, dword [ebp-10H]                    ; 1AAD _ 8B. 45, F0
        lea     edx, [eax-2H]                           ; 1AB0 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1AB3 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1AB6 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1AB8 _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1ABC _ 89. 4C 24, 14
        mov     dword [esp+10H], 1                      ; 1AC0 _ C7. 44 24, 10, 00000001
        mov     dword [esp+0CH], edx                    ; 1AC8 _ 89. 54 24, 0C
        mov     dword [esp+8H], 15                      ; 1ACC _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1AD4 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1AD7 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1ADB _ 89. 04 24
        call    paint_rectangle                         ; 1ADE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1AE3 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1AE6 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1AE9 _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1AEC _ 8D. 48, FF
        mov     eax, dword [ebp-10H]                    ; 1AEF _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 1AF2 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1AF5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1AF8 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1AFA _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1AFE _ 89. 4C 24, 14
        mov     dword [esp+10H], 0                      ; 1B02 _ C7. 44 24, 10, 00000000
        mov     dword [esp+0CH], edx                    ; 1B0A _ 89. 54 24, 0C
        mov     dword [esp+8H], 0                       ; 1B0E _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1B16 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B19 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B1D _ 89. 04 24
        call    paint_rectangle                         ; 1B20 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1B25 _ 8B. 45, F4
        lea     ecx, [eax-3H]                           ; 1B28 _ 8D. 48, FD
        mov     eax, dword [ebp-10H]                    ; 1B2B _ 8B. 45, F0
        lea     edx, [eax-3H]                           ; 1B2E _ 8D. 50, FD
        mov     eax, dword [ebp+0CH]                    ; 1B31 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B34 _ 8B. 00
        mov     dword [esp+18H], ecx                    ; 1B36 _ 89. 4C 24, 18
        mov     dword [esp+14H], edx                    ; 1B3A _ 89. 54 24, 14
        mov     dword [esp+10H], 2                      ; 1B3E _ C7. 44 24, 10, 00000002
        mov     dword [esp+0CH], 2                      ; 1B46 _ C7. 44 24, 0C, 00000002
        mov     dword [esp+8H], 8                       ; 1B4E _ C7. 44 24, 08, 00000008
        mov     edx, dword [ebp-10H]                    ; 1B56 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B59 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B5D _ 89. 04 24
        call    paint_rectangle                         ; 1B60 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-10H]                    ; 1B65 _ 8B. 45, F0
        lea     edx, [eax-4H]                           ; 1B68 _ 8D. 50, FC
        mov     eax, dword [ebp+0CH]                    ; 1B6B _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1B6E _ 8B. 00
        mov     dword [esp+18H], 20                     ; 1B70 _ C7. 44 24, 18, 00000014
        mov     dword [esp+14H], edx                    ; 1B78 _ 89. 54 24, 14
        mov     dword [esp+10H], 3                      ; 1B7C _ C7. 44 24, 10, 00000003
        mov     dword [esp+0CH], 3                      ; 1B84 _ C7. 44 24, 0C, 00000003
        mov     dword [esp+8H], 12                      ; 1B8C _ C7. 44 24, 08, 0000000C
        mov     edx, dword [ebp-10H]                    ; 1B94 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1B97 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1B9B _ 89. 04 24
        call    paint_rectangle                         ; 1B9E _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1BA3 _ 8B. 45, F4
        lea     ebx, [eax-2H]                           ; 1BA6 _ 8D. 58, FE
        mov     eax, dword [ebp-10H]                    ; 1BA9 _ 8B. 45, F0
        lea     ecx, [eax-2H]                           ; 1BAC _ 8D. 48, FE
        mov     eax, dword [ebp-0CH]                    ; 1BAF _ 8B. 45, F4
        lea     edx, [eax-2H]                           ; 1BB2 _ 8D. 50, FE
        mov     eax, dword [ebp+0CH]                    ; 1BB5 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BB8 _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1BBA _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1BBE _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1BC2 _ 89. 54 24, 10
        mov     dword [esp+0CH], 1                      ; 1BC6 _ C7. 44 24, 0C, 00000001
        mov     dword [esp+8H], 15                      ; 1BCE _ C7. 44 24, 08, 0000000F
        mov     edx, dword [ebp-10H]                    ; 1BD6 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1BD9 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1BDD _ 89. 04 24
        call    paint_rectangle                         ; 1BE0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 1BE5 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 1BE8 _ 8D. 58, FF
        mov     eax, dword [ebp-10H]                    ; 1BEB _ 8B. 45, F0
        lea     ecx, [eax-1H]                           ; 1BEE _ 8D. 48, FF
        mov     eax, dword [ebp-0CH]                    ; 1BF1 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 1BF4 _ 8D. 50, FF
        mov     eax, dword [ebp+0CH]                    ; 1BF7 _ 8B. 45, 0C
        mov     eax, dword [eax]                        ; 1BFA _ 8B. 00
        mov     dword [esp+18H], ebx                    ; 1BFC _ 89. 5C 24, 18
        mov     dword [esp+14H], ecx                    ; 1C00 _ 89. 4C 24, 14
        mov     dword [esp+10H], edx                    ; 1C04 _ 89. 54 24, 10
        mov     dword [esp+0CH], 0                      ; 1C08 _ C7. 44 24, 0C, 00000000
        mov     dword [esp+8H], 0                       ; 1C10 _ C7. 44 24, 08, 00000000
        mov     edx, dword [ebp-10H]                    ; 1C18 _ 8B. 55, F0
        mov     dword [esp+4H], edx                     ; 1C1B _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 1C1F _ 89. 04 24
        call    paint_rectangle                         ; 1C22 _ E8, FFFFFFFC(rel)
        mov     dword [esp+14H], 7                      ; 1C27 _ C7. 44 24, 14, 00000007
        mov     eax, dword [ebp+10H]                    ; 1C2F _ 8B. 45, 10
        mov     dword [esp+10H], eax                    ; 1C32 _ 89. 44 24, 10
        mov     dword [esp+0CH], 4                      ; 1C36 _ C7. 44 24, 0C, 00000004
        mov     dword [esp+8H], 24                      ; 1C3E _ C7. 44 24, 08, 00000018
        mov     eax, dword [ebp+0CH]                    ; 1C46 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 1C49 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 1C4D _ 8B. 45, 08
        mov     dword [esp], eax                        ; 1C50 _ 89. 04 24
        call    paint_string                            ; 1C53 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-14H], 0                      ; 1C58 _ C7. 45, EC, 00000000
        jmp     ?_055                                   ; 1C5F _ E9, 00000083

?_048:  mov     dword [ebp-18H], 0                      ; 1C64 _ C7. 45, E8, 00000000
        jmp     ?_054                                   ; 1C6B _ EB, 70

?_049:  mov     eax, dword [ebp-14H]                    ; 1C6D _ 8B. 45, EC
        shl     eax, 4                                  ; 1C70 _ C1. E0, 04
        mov     edx, eax                                ; 1C73 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 1C75 _ 8B. 45, E8
        add     eax, edx                                ; 1C78 _ 01. D0
        add     eax, closebtn.1768                      ; 1C7A _ 05, 000001C0(d)
        movzx   eax, byte [eax]                         ; 1C7F _ 0F B6. 00
        mov     byte [ebp-19H], al                      ; 1C82 _ 88. 45, E7
        cmp     byte [ebp-19H], 64                      ; 1C85 _ 80. 7D, E7, 40
        jnz     ?_050                                   ; 1C89 _ 75, 06
        mov     byte [ebp-19H], 0                       ; 1C8B _ C6. 45, E7, 00
        jmp     ?_053                                   ; 1C8F _ EB, 1C

?_050:  cmp     byte [ebp-19H], 36                      ; 1C91 _ 80. 7D, E7, 24
        jnz     ?_051                                   ; 1C95 _ 75, 06
        mov     byte [ebp-19H], 15                      ; 1C97 _ C6. 45, E7, 0F
        jmp     ?_053                                   ; 1C9B _ EB, 10

?_051:  cmp     byte [ebp-19H], 81                      ; 1C9D _ 80. 7D, E7, 51
        jnz     ?_052                                   ; 1CA1 _ 75, 06
        mov     byte [ebp-19H], 8                       ; 1CA3 _ C6. 45, E7, 08
        jmp     ?_053                                   ; 1CA7 _ EB, 04

?_052:  mov     byte [ebp-19H], 7                       ; 1CA9 _ C6. 45, E7, 07
?_053:  mov     eax, dword [ebp+0CH]                    ; 1CAD _ 8B. 45, 0C
        mov     edx, dword [eax]                        ; 1CB0 _ 8B. 10
        mov     eax, dword [ebp-14H]                    ; 1CB2 _ 8B. 45, EC
        lea     ecx, [eax+5H]                           ; 1CB5 _ 8D. 48, 05
        mov     eax, dword [ebp+0CH]                    ; 1CB8 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1CBB _ 8B. 40, 04
        imul    ecx, eax                                ; 1CBE _ 0F AF. C8
        mov     eax, dword [ebp+0CH]                    ; 1CC1 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 1CC4 _ 8B. 40, 04
        lea     ebx, [eax-15H]                          ; 1CC7 _ 8D. 58, EB
        mov     eax, dword [ebp-18H]                    ; 1CCA _ 8B. 45, E8
        add     eax, ebx                                ; 1CCD _ 01. D8
        add     eax, ecx                                ; 1CCF _ 01. C8
        add     edx, eax                                ; 1CD1 _ 01. C2
        movzx   eax, byte [ebp-19H]                     ; 1CD3 _ 0F B6. 45, E7
        mov     byte [edx], al                          ; 1CD7 _ 88. 02
        add     dword [ebp-18H], 1                      ; 1CD9 _ 83. 45, E8, 01
?_054:  cmp     dword [ebp-18H], 15                     ; 1CDD _ 83. 7D, E8, 0F
        jle     ?_049                                   ; 1CE1 _ 7E, 8A
        add     dword [ebp-14H], 1                      ; 1CE3 _ 83. 45, EC, 01
?_055:  cmp     dword [ebp-14H], 13                     ; 1CE7 _ 83. 7D, EC, 0D
        jle     ?_048                                   ; 1CEB _ 0F 8E, FFFFFF73
        add     esp, 68                                 ; 1CF1 _ 83. C4, 44
        pop     ebx                                     ; 1CF4 _ 5B
        pop     ebp                                     ; 1CF5 _ 5D
        ret                                             ; 1CF6 _ C3
; make_windows End of function

wait_KBC_sendready:; Function begin
        push    ebp                                     ; 1CF7 _ 55
        mov     ebp, esp                                ; 1CF8 _ 89. E5
        sub     esp, 24                                 ; 1CFA _ 83. EC, 18
?_056:  mov     dword [esp], 100                        ; 1CFD _ C7. 04 24, 00000064
        call    io_in8                                  ; 1D04 _ E8, FFFFFFFC(rel)
        and     eax, 02H                                ; 1D09 _ 83. E0, 02
        test    eax, eax                                ; 1D0C _ 85. C0
        jnz     ?_057                                   ; 1D0E _ 75, 02
        jmp     ?_058                                   ; 1D10 _ EB, 02

?_057:  jmp     ?_056                                   ; 1D12 _ EB, E9

?_058:  leave                                           ; 1D14 _ C9
        ret                                             ; 1D15 _ C3
; wait_KBC_sendready End of function

init_keyboard:; Function begin
        push    ebp                                     ; 1D16 _ 55
        mov     ebp, esp                                ; 1D17 _ 89. E5
        sub     esp, 24                                 ; 1D19 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 1D1C _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 96                      ; 1D21 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 100                        ; 1D29 _ C7. 04 24, 00000064
        call    io_out8                                 ; 1D30 _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 1D35 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 71                      ; 1D3A _ C7. 44 24, 04, 00000047
        mov     dword [esp], 96                         ; 1D42 _ C7. 04 24, 00000060
        call    io_out8                                 ; 1D49 _ E8, FFFFFFFC(rel)
        leave                                           ; 1D4E _ C9
        ret                                             ; 1D4F _ C3
; init_keyboard End of function

enable_mouse:; Function begin
        push    ebp                                     ; 1D50 _ 55
        mov     ebp, esp                                ; 1D51 _ 89. E5
        sub     esp, 24                                 ; 1D53 _ 83. EC, 18
        call    wait_KBC_sendready                      ; 1D56 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 212                     ; 1D5B _ C7. 44 24, 04, 000000D4
        mov     dword [esp], 100                        ; 1D63 _ C7. 04 24, 00000064
        call    io_out8                                 ; 1D6A _ E8, FFFFFFFC(rel)
        call    wait_KBC_sendready                      ; 1D6F _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 244                     ; 1D74 _ C7. 44 24, 04, 000000F4
        mov     dword [esp], 96                         ; 1D7C _ C7. 04 24, 00000060
        call    io_out8                                 ; 1D83 _ E8, FFFFFFFC(rel)
        leave                                           ; 1D88 _ C9
        ret                                             ; 1D89 _ C3
; enable_mouse End of function

mouse_decode:; Function begin
        push    ebp                                     ; 1D8A _ 55
        mov     ebp, esp                                ; 1D8B _ 89. E5
        sub     esp, 4                                  ; 1D8D _ 83. EC, 04
        mov     eax, dword [ebp+0CH]                    ; 1D90 _ 8B. 45, 0C
        mov     byte [ebp-4H], al                       ; 1D93 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1D96 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1D99 _ 0F B6. 40, 03
        test    al, al                                  ; 1D9D _ 84. C0
        jnz     ?_060                                   ; 1D9F _ 75, 17
        cmp     byte [ebp-4H], -6                       ; 1DA1 _ 80. 7D, FC, FA
        jnz     ?_059                                   ; 1DA5 _ 75, 07
        mov     eax, dword [ebp+8H]                     ; 1DA7 _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1DAA _ C6. 40, 03, 01
?_059:  mov     eax, 0                                  ; 1DAE _ B8, 00000000
        jmp     ?_067                                   ; 1DB3 _ E9, 0000010F

?_060:  mov     eax, dword [ebp+8H]                     ; 1DB8 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1DBB _ 0F B6. 40, 03
        cmp     al, 1                                   ; 1DBF _ 3C, 01
        jnz     ?_062                                   ; 1DC1 _ 75, 28
        movzx   eax, byte [ebp-4H]                      ; 1DC3 _ 0F B6. 45, FC
        and     eax, 0C8H                               ; 1DC7 _ 25, 000000C8
        cmp     eax, 8                                  ; 1DCC _ 83. F8, 08
        jnz     ?_061                                   ; 1DCF _ 75, 10
        mov     eax, dword [ebp+8H]                     ; 1DD1 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1DD4 _ 0F B6. 55, FC
        mov     byte [eax], dl                          ; 1DD8 _ 88. 10
        mov     eax, dword [ebp+8H]                     ; 1DDA _ 8B. 45, 08
        mov     byte [eax+3H], 2                        ; 1DDD _ C6. 40, 03, 02
?_061:  mov     eax, 0                                  ; 1DE1 _ B8, 00000000
        jmp     ?_067                                   ; 1DE6 _ E9, 000000DC

?_062:  mov     eax, dword [ebp+8H]                     ; 1DEB _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1DEE _ 0F B6. 40, 03
        cmp     al, 2                                   ; 1DF2 _ 3C, 02
        jnz     ?_063                                   ; 1DF4 _ 75, 1B
        mov     eax, dword [ebp+8H]                     ; 1DF6 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1DF9 _ 0F B6. 55, FC
        mov     byte [eax+1H], dl                       ; 1DFD _ 88. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1E00 _ 8B. 45, 08
        mov     byte [eax+3H], 3                        ; 1E03 _ C6. 40, 03, 03
        mov     eax, 0                                  ; 1E07 _ B8, 00000000
        jmp     ?_067                                   ; 1E0C _ E9, 000000B6

?_063:  mov     eax, dword [ebp+8H]                     ; 1E11 _ 8B. 45, 08
        movzx   eax, byte [eax+3H]                      ; 1E14 _ 0F B6. 40, 03
        cmp     al, 3                                   ; 1E18 _ 3C, 03
        jne     ?_066                                   ; 1E1A _ 0F 85, 000000A2
        mov     eax, dword [ebp+8H]                     ; 1E20 _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 1E23 _ 0F B6. 55, FC
        mov     byte [eax+2H], dl                       ; 1E27 _ 88. 50, 02
        mov     eax, dword [ebp+8H]                     ; 1E2A _ 8B. 45, 08
        mov     byte [eax+3H], 1                        ; 1E2D _ C6. 40, 03, 01
        mov     eax, dword [ebp+8H]                     ; 1E31 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1E34 _ 0F B6. 00
        movzx   eax, al                                 ; 1E37 _ 0F B6. C0
        and     eax, 07H                                ; 1E3A _ 83. E0, 07
        mov     edx, eax                                ; 1E3D _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1E3F _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 1E42 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1E45 _ 8B. 45, 08
        movzx   eax, byte [eax+1H]                      ; 1E48 _ 0F B6. 40, 01
        movzx   edx, al                                 ; 1E4C _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1E4F _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1E52 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 1E55 _ 8B. 45, 08
        movzx   eax, byte [eax+2H]                      ; 1E58 _ 0F B6. 40, 02
        movzx   edx, al                                 ; 1E5C _ 0F B6. D0
        mov     eax, dword [ebp+8H]                     ; 1E5F _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1E62 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 1E65 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1E68 _ 0F B6. 00
        movzx   eax, al                                 ; 1E6B _ 0F B6. C0
        and     eax, 10H                                ; 1E6E _ 83. E0, 10
        test    eax, eax                                ; 1E71 _ 85. C0
        jz      ?_064                                   ; 1E73 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1E75 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1E78 _ 8B. 40, 04
        or      eax, 0FFFFFF00H                         ; 1E7B _ 0D, FFFFFF00
        mov     edx, eax                                ; 1E80 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1E82 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1E85 _ 89. 50, 04
?_064:  mov     eax, dword [ebp+8H]                     ; 1E88 _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 1E8B _ 0F B6. 00
        movzx   eax, al                                 ; 1E8E _ 0F B6. C0
        and     eax, 20H                                ; 1E91 _ 83. E0, 20
        test    eax, eax                                ; 1E94 _ 85. C0
        jz      ?_065                                   ; 1E96 _ 74, 13
        mov     eax, dword [ebp+8H]                     ; 1E98 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1E9B _ 8B. 40, 08
        or      eax, 0FFFFFF00H                         ; 1E9E _ 0D, FFFFFF00
        mov     edx, eax                                ; 1EA3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1EA5 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1EA8 _ 89. 50, 08
?_065:  mov     eax, dword [ebp+8H]                     ; 1EAB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 1EAE _ 8B. 40, 08
        neg     eax                                     ; 1EB1 _ F7. D8
        mov     edx, eax                                ; 1EB3 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1EB5 _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 1EB8 _ 89. 50, 08
        mov     eax, 1                                  ; 1EBB _ B8, 00000001
        jmp     ?_067                                   ; 1EC0 _ EB, 05

?_066:  mov     eax, 4294967295                         ; 1EC2 _ B8, FFFFFFFF
?_067:  leave                                           ; 1EC7 _ C9
        ret                                             ; 1EC8 _ C3
; mouse_decode End of function

intHandlerKeyboard:; Function begin
        push    ebp                                     ; 1EC9 _ 55
        mov     ebp, esp                                ; 1ECA _ 89. E5
        sub     esp, 40                                 ; 1ECC _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 1ECF _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 1ED7 _ C7. 04 24, 00000020
        call    io_out8                                 ; 1EDE _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 1EE3 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 1EEB _ C7. 04 24, 000000A0
        call    io_out8                                 ; 1EF2 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 1EF7 _ C7. 04 24, 00000060
        call    io_in8                                  ; 1EFE _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 1F03 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 1F06 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1F0A _ 89. 44 24, 04
        mov     dword [esp], keyinfo                    ; 1F0E _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 1F15 _ E8, FFFFFFFC(rel)
        leave                                           ; 1F1A _ C9
        ret                                             ; 1F1B _ C3
; intHandlerKeyboard End of function

intHandlerMouse:; Function begin
        push    ebp                                     ; 1F1C _ 55
        mov     ebp, esp                                ; 1F1D _ 89. E5
        sub     esp, 40                                 ; 1F1F _ 83. EC, 28
        mov     dword [esp+4H], 32                      ; 1F22 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 32                         ; 1F2A _ C7. 04 24, 00000020
        call    io_out8                                 ; 1F31 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 32                      ; 1F36 _ C7. 44 24, 04, 00000020
        mov     dword [esp], 160                        ; 1F3E _ C7. 04 24, 000000A0
        call    io_out8                                 ; 1F45 _ E8, FFFFFFFC(rel)
        mov     dword [esp], 96                         ; 1F4A _ C7. 04 24, 00000060
        call    io_in8                                  ; 1F51 _ E8, FFFFFFFC(rel)
        mov     byte [ebp-9H], al                       ; 1F56 _ 88. 45, F7
        movzx   eax, byte [ebp-9H]                      ; 1F59 _ 0F B6. 45, F7
        mov     dword [esp+4H], eax                     ; 1F5D _ 89. 44 24, 04
        mov     dword [esp], mouseinfo                  ; 1F61 _ C7. 04 24, 00000000(d)
        call    fifo8_put                               ; 1F68 _ E8, FFFFFFFC(rel)
        leave                                           ; 1F6D _ C9
        ret                                             ; 1F6E _ C3
; intHandlerMouse End of function

fifo8_init:; Function begin
        push    ebp                                     ; 1F6F _ 55
        mov     ebp, esp                                ; 1F70 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 1F72 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 1F75 _ 8B. 55, 10
        mov     dword [eax], edx                        ; 1F78 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 1F7A _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 1F7D _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 1F84 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 1F87 _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 1F8E _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1F91 _ 8B. 55, 0C
        mov     dword [eax+0CH], edx                    ; 1F94 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 1F97 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 1F9A _ 8B. 55, 0C
        mov     dword [eax+10H], edx                    ; 1F9D _ 89. 50, 10
        mov     eax, dword [ebp+8H]                     ; 1FA0 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 1FA3 _ C7. 40, 14, 00000000
        pop     ebp                                     ; 1FAA _ 5D
        ret                                             ; 1FAB _ C3
; fifo8_init End of function

fifo8_put:; Function begin
        push    ebp                                     ; 1FAC _ 55
        mov     ebp, esp                                ; 1FAD _ 89. E5
        sub     esp, 20                                 ; 1FAF _ 83. EC, 14
        mov     eax, dword [ebp+0CH]                    ; 1FB2 _ 8B. 45, 0C
        mov     byte [ebp-14H], al                      ; 1FB5 _ 88. 45, EC
        mov     eax, dword [ebp+8H]                     ; 1FB8 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 1FBB _ 8B. 40, 10
        test    eax, eax                                ; 1FBE _ 85. C0
        jnz     ?_068                                   ; 1FC0 _ 75, 18
        mov     eax, dword [ebp+8H]                     ; 1FC2 _ 8B. 45, 08
        mov     eax, dword [eax+14H]                    ; 1FC5 _ 8B. 40, 14
        or      eax, 01H                                ; 1FC8 _ 83. C8, 01
        mov     edx, eax                                ; 1FCB _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 1FCD _ 8B. 45, 08
        mov     dword [eax+14H], edx                    ; 1FD0 _ 89. 50, 14
        mov     eax, 4294967295                         ; 1FD3 _ B8, FFFFFFFF
        jmp     ?_070                                   ; 1FD8 _ EB, 56

?_068:  mov     eax, dword [ebp+8H]                     ; 1FDA _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1FDD _ 8B. 40, 04
        mov     dword [ebp-4H], eax                     ; 1FE0 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 1FE3 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 1FE6 _ 8B. 10
        mov     eax, dword [ebp-4H]                     ; 1FE8 _ 8B. 45, FC
        add     edx, eax                                ; 1FEB _ 01. C2
        movzx   eax, byte [ebp-14H]                     ; 1FED _ 0F B6. 45, EC
        mov     byte [edx], al                          ; 1FF1 _ 88. 02
        mov     eax, dword [ebp+8H]                     ; 1FF3 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 1FF6 _ 8B. 40, 04
        lea     edx, [eax+1H]                           ; 1FF9 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 1FFC _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 1FFF _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2002 _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 2005 _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2008 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 200B _ 8B. 40, 0C
        cmp     edx, eax                                ; 200E _ 39. C2
        jnz     ?_069                                   ; 2010 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2012 _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 2015 _ C7. 40, 04, 00000000
?_069:  mov     eax, dword [ebp+8H]                     ; 201C _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 201F _ 8B. 40, 10
        lea     edx, [eax-1H]                           ; 2022 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2025 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 2028 _ 89. 50, 10
        mov     eax, 0                                  ; 202B _ B8, 00000000
?_070:  leave                                           ; 2030 _ C9
        ret                                             ; 2031 _ C3
; fifo8_put End of function

fifo8_get:; Function begin
        push    ebp                                     ; 2032 _ 55
        mov     ebp, esp                                ; 2033 _ 89. E5
        sub     esp, 16                                 ; 2035 _ 83. EC, 10
        mov     eax, dword [ebp+8H]                     ; 2038 _ 8B. 45, 08
        mov     edx, dword [eax+10H]                    ; 203B _ 8B. 50, 10
        mov     eax, dword [ebp+8H]                     ; 203E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2041 _ 8B. 40, 0C
        cmp     edx, eax                                ; 2044 _ 39. C2
        jnz     ?_071                                   ; 2046 _ 75, 11
        mov     eax, dword [ebp+8H]                     ; 2048 _ 8B. 45, 08
        mov     dword [eax+14H], 0                      ; 204B _ C7. 40, 14, 00000000
        mov     eax, 4294967295                         ; 2052 _ B8, FFFFFFFF
        jmp     ?_073                                   ; 2057 _ EB, 57

?_071:  mov     eax, dword [ebp+8H]                     ; 2059 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 205C _ 8B. 40, 08
        mov     dword [ebp-8H], eax                     ; 205F _ 89. 45, F8
        mov     eax, dword [ebp+8H]                     ; 2062 _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 2065 _ 8B. 10
        mov     eax, dword [ebp-8H]                     ; 2067 _ 8B. 45, F8
        add     eax, edx                                ; 206A _ 01. D0
        movzx   eax, byte [eax]                         ; 206C _ 0F B6. 00
        movzx   eax, al                                 ; 206F _ 0F B6. C0
        mov     dword [ebp-4H], eax                     ; 2072 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2075 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2078 _ 8B. 40, 08
        lea     edx, [eax+1H]                           ; 207B _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 207E _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 2081 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 2084 _ 8B. 45, 08
        mov     edx, dword [eax+8H]                     ; 2087 _ 8B. 50, 08
        mov     eax, dword [ebp+8H]                     ; 208A _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 208D _ 8B. 40, 0C
        cmp     edx, eax                                ; 2090 _ 39. C2
        jnz     ?_072                                   ; 2092 _ 75, 0A
        mov     eax, dword [ebp+8H]                     ; 2094 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 2097 _ C7. 40, 08, 00000000
?_072:  mov     eax, dword [ebp+8H]                     ; 209E _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 20A1 _ 8B. 40, 10
        lea     edx, [eax+1H]                           ; 20A4 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 20A7 _ 8B. 45, 08
        mov     dword [eax+10H], edx                    ; 20AA _ 89. 50, 10
        mov     eax, dword [ebp-4H]                     ; 20AD _ 8B. 45, FC
?_073:  leave                                           ; 20B0 _ C9
        ret                                             ; 20B1 _ C3
; fifo8_get End of function

fifo8_status:; Function begin
        push    ebp                                     ; 20B2 _ 55
        mov     ebp, esp                                ; 20B3 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 20B5 _ 8B. 45, 08
        mov     edx, dword [eax+0CH]                    ; 20B8 _ 8B. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 20BB _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 20BE _ 8B. 40, 10
        sub     edx, eax                                ; 20C1 _ 29. C2
        mov     eax, edx                                ; 20C3 _ 89. D0
        pop     ebp                                     ; 20C5 _ 5D
        ret                                             ; 20C6 _ C3
; fifo8_status End of function

charToHexVal:; Function begin
        push    ebp                                     ; 20C7 _ 55
        mov     ebp, esp                                ; 20C8 _ 89. E5
        sub     esp, 4                                  ; 20CA _ 83. EC, 04
        mov     eax, dword [ebp+8H]                     ; 20CD _ 8B. 45, 08
        mov     byte [ebp-4H], al                       ; 20D0 _ 88. 45, FC
        cmp     byte [ebp-4H], 9                        ; 20D3 _ 80. 7D, FC, 09
        jle     ?_074                                   ; 20D7 _ 7E, 09
        movzx   eax, byte [ebp-4H]                      ; 20D9 _ 0F B6. 45, FC
        add     eax, 55                                 ; 20DD _ 83. C0, 37
        jmp     ?_075                                   ; 20E0 _ EB, 07

?_074:  movzx   eax, byte [ebp-4H]                      ; 20E2 _ 0F B6. 45, FC
        add     eax, 48                                 ; 20E6 _ 83. C0, 30
?_075:  leave                                           ; 20E9 _ C9
        ret                                             ; 20EA _ C3
; charToHexVal End of function

charToHexStr:; Function begin
        push    ebp                                     ; 20EB _ 55
        mov     ebp, esp                                ; 20EC _ 89. E5
        sub     esp, 24                                 ; 20EE _ 83. EC, 18
        mov     eax, dword [ebp+8H]                     ; 20F1 _ 8B. 45, 08
        mov     byte [ebp-14H], al                      ; 20F4 _ 88. 45, EC
        mov     dword [ebp-4H], 0                       ; 20F7 _ C7. 45, FC, 00000000
        movzx   eax, byte [ebp-14H]                     ; 20FE _ 0F B6. 45, EC
        and     eax, 0FH                                ; 2102 _ 83. E0, 0F
        mov     byte [ebp-5H], al                       ; 2105 _ 88. 45, FB
        movsx   eax, byte [ebp-5H]                      ; 2108 _ 0F BE. 45, FB
        mov     dword [esp], eax                        ; 210C _ 89. 04 24
        call    charToHexVal                            ; 210F _ E8, FFFFFFFC(rel)
        mov     byte [?_183], al                        ; 2114 _ A2, 000002A3(d)
        movzx   eax, byte [ebp-14H]                     ; 2119 _ 0F B6. 45, EC
        shr     al, 4                                   ; 211D _ C0. E8, 04
        mov     byte [ebp-14H], al                      ; 2120 _ 88. 45, EC
        movzx   eax, byte [ebp-14H]                     ; 2123 _ 0F B6. 45, EC
        movsx   eax, al                                 ; 2127 _ 0F BE. C0
        mov     dword [esp], eax                        ; 212A _ 89. 04 24
        call    charToHexVal                            ; 212D _ E8, FFFFFFFC(rel)
        mov     byte [?_182], al                        ; 2132 _ A2, 000002A2(d)
        mov     eax, keyval                             ; 2137 _ B8, 000002A0(d)
        leave                                           ; 213C _ C9
        ret                                             ; 213D _ C3
; charToHexStr End of function

intToHexStr:; Function begin
        push    ebp                                     ; 213E _ 55
        mov     ebp, esp                                ; 213F _ 89. E5
        sub     esp, 16                                 ; 2141 _ 83. EC, 10
        mov     byte [str.1386], 48                     ; 2144 _ C6. 05, 00000320(d), 30
        mov     byte [?_186], 88                        ; 214B _ C6. 05, 00000321(d), 58
        mov     byte [?_187], 0                         ; 2152 _ C6. 05, 0000032A(d), 00
        mov     dword [ebp-0CH], 2                      ; 2159 _ C7. 45, F4, 00000002
        jmp     ?_077                                   ; 2160 _ EB, 0F

?_076:  mov     eax, dword [ebp-0CH]                    ; 2162 _ 8B. 45, F4
        add     eax, str.1386                           ; 2165 _ 05, 00000320(d)
        mov     byte [eax], 48                          ; 216A _ C6. 00, 30
        add     dword [ebp-0CH], 1                      ; 216D _ 83. 45, F4, 01
?_077:  cmp     dword [ebp-0CH], 9                      ; 2171 _ 83. 7D, F4, 09
        jle     ?_076                                   ; 2175 _ 7E, EB
        mov     dword [ebp-8H], 9                       ; 2177 _ C7. 45, F8, 00000009
        jmp     ?_081                                   ; 217E _ EB, 40

?_078:  mov     eax, dword [ebp+8H]                     ; 2180 _ 8B. 45, 08
        and     eax, 0FH                                ; 2183 _ 83. E0, 0F
        mov     dword [ebp-4H], eax                     ; 2186 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2189 _ 8B. 45, 08
        shr     eax, 4                                  ; 218C _ C1. E8, 04
        mov     dword [ebp+8H], eax                     ; 218F _ 89. 45, 08
        cmp     dword [ebp-4H], 9                       ; 2192 _ 83. 7D, FC, 09
        jle     ?_079                                   ; 2196 _ 7E, 13
        mov     eax, dword [ebp-4H]                     ; 2198 _ 8B. 45, FC
        add     eax, 55                                 ; 219B _ 83. C0, 37
        mov     edx, dword [ebp-8H]                     ; 219E _ 8B. 55, F8
        add     edx, str.1386                           ; 21A1 _ 81. C2, 00000320(d)
        mov     byte [edx], al                          ; 21A7 _ 88. 02
        jmp     ?_080                                   ; 21A9 _ EB, 11

?_079:  mov     eax, dword [ebp-4H]                     ; 21AB _ 8B. 45, FC
        add     eax, 48                                 ; 21AE _ 83. C0, 30
        mov     edx, dword [ebp-8H]                     ; 21B1 _ 8B. 55, F8
        add     edx, str.1386                           ; 21B4 _ 81. C2, 00000320(d)
        mov     byte [edx], al                          ; 21BA _ 88. 02
?_080:  sub     dword [ebp-8H], 1                       ; 21BC _ 83. 6D, F8, 01
?_081:  cmp     dword [ebp-8H], 1                       ; 21C0 _ 83. 7D, F8, 01
        jle     ?_082                                   ; 21C4 _ 7E, 06
        cmp     dword [ebp+8H], 0                       ; 21C6 _ 83. 7D, 08, 00
        jnz     ?_078                                   ; 21CA _ 75, B4
?_082:  mov     eax, str.1386                           ; 21CC _ B8, 00000320(d)
        leave                                           ; 21D1 _ C9
        ret                                             ; 21D2 _ C3
; intToHexStr End of function

memman_init:; Function begin
        push    ebp                                     ; 21D3 _ 55
        mov     ebp, esp                                ; 21D4 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 21D6 _ 8B. 45, 08
        mov     dword [eax], 0                          ; 21D9 _ C7. 00, 00000000
        mov     eax, dword [ebp+8H]                     ; 21DF _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 21E2 _ C7. 40, 04, 00000000
        mov     eax, dword [ebp+8H]                     ; 21E9 _ 8B. 45, 08
        mov     dword [eax+8H], 0                       ; 21EC _ C7. 40, 08, 00000000
        mov     eax, dword [ebp+8H]                     ; 21F3 _ 8B. 45, 08
        mov     dword [eax+0CH], 0                      ; 21F6 _ C7. 40, 0C, 00000000
        pop     ebp                                     ; 21FD _ 5D
        ret                                             ; 21FE _ C3
; memman_init End of function

memman_total:; Function begin
        push    ebp                                     ; 21FF _ 55
        mov     ebp, esp                                ; 2200 _ 89. E5
        sub     esp, 16                                 ; 2202 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2205 _ C7. 45, FC, 00000000
        mov     dword [ebp-8H], 0                       ; 220C _ C7. 45, F8, 00000000
        jmp     ?_084                                   ; 2213 _ EB, 14

?_083:  mov     eax, dword [ebp+8H]                     ; 2215 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2218 _ 8B. 55, F8
        add     edx, 2                                  ; 221B _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 221E _ 8B. 44 D0, 04
        add     dword [ebp-4H], eax                     ; 2222 _ 01. 45, FC
        add     dword [ebp-8H], 1                       ; 2225 _ 83. 45, F8, 01
?_084:  mov     eax, dword [ebp+8H]                     ; 2229 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 222C _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 222E _ 3B. 45, F8
        ja      ?_083                                   ; 2231 _ 77, E2
        mov     eax, dword [ebp-4H]                     ; 2233 _ 8B. 45, FC
        leave                                           ; 2236 _ C9
        ret                                             ; 2237 _ C3
; memman_total End of function

memman_alloc:; Function begin
        push    ebp                                     ; 2238 _ 55
        mov     ebp, esp                                ; 2239 _ 89. E5
        sub     esp, 16                                 ; 223B _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 223E _ C7. 45, F8, 00000000
        jmp     ?_088                                   ; 2245 _ E9, 00000085

?_085:  mov     eax, dword [ebp+8H]                     ; 224A _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 224D _ 8B. 55, F8
        add     edx, 2                                  ; 2250 _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2253 _ 8B. 44 D0, 04
        cmp     eax, dword [ebp+0CH]                    ; 2257 _ 3B. 45, 0C
        jc      ?_087                                   ; 225A _ 72, 6F
        mov     eax, dword [ebp+8H]                     ; 225C _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 225F _ 8B. 55, F8
        add     edx, 2                                  ; 2262 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 2265 _ 8B. 04 D0
        mov     dword [ebp-4H], eax                     ; 2268 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 226B _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 226E _ 8B. 55, F8
        add     edx, 2                                  ; 2271 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 2274 _ 8B. 14 D0
        mov     eax, dword [ebp+0CH]                    ; 2277 _ 8B. 45, 0C
        lea     ecx, [edx+eax]                          ; 227A _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 227D _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2280 _ 8B. 55, F8
        add     edx, 2                                  ; 2283 _ 83. C2, 02
        mov     dword [eax+edx*8], ecx                  ; 2286 _ 89. 0C D0
        mov     eax, dword [ebp+8H]                     ; 2289 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 228C _ 8B. 55, F8
        add     edx, 2                                  ; 228F _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 2292 _ 8B. 44 D0, 04
        sub     eax, dword [ebp+0CH]                    ; 2296 _ 2B. 45, 0C
        mov     edx, eax                                ; 2299 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 229B _ 8B. 45, 08
        mov     ecx, dword [ebp-8H]                     ; 229E _ 8B. 4D, F8
        add     ecx, 2                                  ; 22A1 _ 83. C1, 02
        mov     dword [eax+ecx*8+4H], edx               ; 22A4 _ 89. 54 C8, 04
        mov     eax, dword [ebp+8H]                     ; 22A8 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 22AB _ 8B. 55, F8
        add     edx, 2                                  ; 22AE _ 83. C2, 02
        mov     eax, dword [eax+edx*8+4H]               ; 22B1 _ 8B. 44 D0, 04
        test    eax, eax                                ; 22B5 _ 85. C0
        jnz     ?_086                                   ; 22B7 _ 75, 0D
        mov     eax, dword [ebp+8H]                     ; 22B9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 22BC _ 8B. 00
        lea     edx, [eax-1H]                           ; 22BE _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 22C1 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 22C4 _ 89. 10
?_086:  mov     eax, dword [ebp-4H]                     ; 22C6 _ 8B. 45, FC
        jmp     ?_089                                   ; 22C9 _ EB, 17

?_087:  add     dword [ebp-8H], 1                       ; 22CB _ 83. 45, F8, 01
?_088:  mov     eax, dword [ebp+8H]                     ; 22CF _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 22D2 _ 8B. 00
        cmp     eax, dword [ebp-8H]                     ; 22D4 _ 3B. 45, F8
        ja      ?_085                                   ; 22D7 _ 0F 87, FFFFFF6D
        mov     eax, 0                                  ; 22DD _ B8, 00000000
?_089:  leave                                           ; 22E2 _ C9
        ret                                             ; 22E3 _ C3
; memman_alloc End of function

memman_free:; Function begin
        push    ebp                                     ; 22E4 _ 55
        mov     ebp, esp                                ; 22E5 _ 89. E5
        push    ebx                                     ; 22E7 _ 53
        sub     esp, 16                                 ; 22E8 _ 83. EC, 10
        mov     dword [ebp-0CH], 0                      ; 22EB _ C7. 45, F4, 00000000
        jmp     ?_092                                   ; 22F2 _ EB, 17

?_090:  mov     eax, dword [ebp+8H]                     ; 22F4 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 22F7 _ 8B. 55, F4
        add     edx, 2                                  ; 22FA _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 22FD _ 8B. 04 D0
        cmp     eax, dword [ebp+0CH]                    ; 2300 _ 3B. 45, 0C
        jbe     ?_091                                   ; 2303 _ 76, 02
        jmp     ?_093                                   ; 2305 _ EB, 0E

?_091:  add     dword [ebp-0CH], 1                      ; 2307 _ 83. 45, F4, 01
?_092:  mov     eax, dword [ebp+8H]                     ; 230B _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 230E _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2310 _ 3B. 45, F4
        jg      ?_090                                   ; 2313 _ 7F, DF
?_093:  cmp     dword [ebp-0CH], 0                      ; 2315 _ 83. 7D, F4, 00
        jle     ?_095                                   ; 2319 _ 0F 8E, 000000BA
        mov     eax, dword [ebp-0CH]                    ; 231F _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2322 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2325 _ 8B. 45, 08
        add     edx, 2                                  ; 2328 _ 83. C2, 02
        mov     edx, dword [eax+edx*8]                  ; 232B _ 8B. 14 D0
        mov     eax, dword [ebp-0CH]                    ; 232E _ 8B. 45, F4
        lea     ecx, [eax-1H]                           ; 2331 _ 8D. 48, FF
        mov     eax, dword [ebp+8H]                     ; 2334 _ 8B. 45, 08
        add     ecx, 2                                  ; 2337 _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 233A _ 8B. 44 C8, 04
        add     eax, edx                                ; 233E _ 01. D0
        cmp     eax, dword [ebp+0CH]                    ; 2340 _ 3B. 45, 0C
        jne     ?_095                                   ; 2343 _ 0F 85, 00000090
        mov     eax, dword [ebp-0CH]                    ; 2349 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 234C _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 234F _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 2352 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2355 _ 8B. 45, 08
        add     edx, 2                                  ; 2358 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 235B _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 235F _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 2362 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2365 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 2368 _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 236B _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 236F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2372 _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 2374 _ 3B. 45, F4
        jle     ?_094                                   ; 2377 _ 7E, 56
        mov     eax, dword [ebp+10H]                    ; 2379 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 237C _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 237F _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 2382 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2385 _ 8B. 55, F4
        add     edx, 2                                  ; 2388 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 238B _ 8B. 04 D0
        cmp     ecx, eax                                ; 238E _ 39. C1
        jnz     ?_094                                   ; 2390 _ 75, 3D
        mov     eax, dword [ebp-0CH]                    ; 2392 _ 8B. 45, F4
        lea     ebx, [eax-1H]                           ; 2395 _ 8D. 58, FF
        mov     eax, dword [ebp-0CH]                    ; 2398 _ 8B. 45, F4
        lea     edx, [eax-1H]                           ; 239B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 239E _ 8B. 45, 08
        add     edx, 2                                  ; 23A1 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 23A4 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+8H]                     ; 23A8 _ 8B. 45, 08
        mov     ecx, dword [ebp-0CH]                    ; 23AB _ 8B. 4D, F4
        add     ecx, 2                                  ; 23AE _ 83. C1, 02
        mov     eax, dword [eax+ecx*8+4H]               ; 23B1 _ 8B. 44 C8, 04
        lea     ecx, [edx+eax]                          ; 23B5 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 23B8 _ 8B. 45, 08
        lea     edx, [ebx+2H]                           ; 23BB _ 8D. 53, 02
        mov     dword [eax+edx*8+4H], ecx               ; 23BE _ 89. 4C D0, 04
        mov     eax, dword [ebp+8H]                     ; 23C2 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 23C5 _ 8B. 00
        lea     edx, [eax-1H]                           ; 23C7 _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 23CA _ 8B. 45, 08
        mov     dword [eax], edx                        ; 23CD _ 89. 10
?_094:  mov     eax, 0                                  ; 23CF _ B8, 00000000
        jmp     ?_101                                   ; 23D4 _ E9, 0000011C

?_095:  mov     eax, dword [ebp+8H]                     ; 23D9 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 23DC _ 8B. 00
        cmp     eax, dword [ebp-0CH]                    ; 23DE _ 3B. 45, F4
        jle     ?_096                                   ; 23E1 _ 7E, 52
        mov     eax, dword [ebp+10H]                    ; 23E3 _ 8B. 45, 10
        mov     edx, dword [ebp+0CH]                    ; 23E6 _ 8B. 55, 0C
        lea     ecx, [edx+eax]                          ; 23E9 _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 23EC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 23EF _ 8B. 55, F4
        add     edx, 2                                  ; 23F2 _ 83. C2, 02
        mov     eax, dword [eax+edx*8]                  ; 23F5 _ 8B. 04 D0
        cmp     ecx, eax                                ; 23F8 _ 39. C1
        jnz     ?_096                                   ; 23FA _ 75, 39
        mov     eax, dword [ebp+8H]                     ; 23FC _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 23FF _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 2402 _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 2405 _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 2408 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 240B _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 240E _ 8B. 55, F4
        add     edx, 2                                  ; 2411 _ 83. C2, 02
        mov     edx, dword [eax+edx*8+4H]               ; 2414 _ 8B. 54 D0, 04
        mov     eax, dword [ebp+10H]                    ; 2418 _ 8B. 45, 10
        lea     ecx, [edx+eax]                          ; 241B _ 8D. 0C 02
        mov     eax, dword [ebp+8H]                     ; 241E _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 2421 _ 8B. 55, F4
        add     edx, 2                                  ; 2424 _ 83. C2, 02
        mov     dword [eax+edx*8+4H], ecx               ; 2427 _ 89. 4C D0, 04
        mov     eax, 0                                  ; 242B _ B8, 00000000
        jmp     ?_101                                   ; 2430 _ E9, 000000C0

?_096:  mov     eax, dword [ebp+8H]                     ; 2435 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2438 _ 8B. 00
        cmp     eax, 4095                               ; 243A _ 3D, 00000FFF
        jg      ?_100                                   ; 243F _ 0F 8F, 00000087
        mov     eax, dword [ebp+8H]                     ; 2445 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2448 _ 8B. 00
        mov     dword [ebp-8H], eax                     ; 244A _ 89. 45, F8
        jmp     ?_098                                   ; 244D _ EB, 28

?_097:  mov     eax, dword [ebp-8H]                     ; 244F _ 8B. 45, F8
        lea     edx, [eax-1H]                           ; 2452 _ 8D. 50, FF
        mov     ecx, dword [ebp+8H]                     ; 2455 _ 8B. 4D, 08
        mov     eax, dword [ebp-8H]                     ; 2458 _ 8B. 45, F8
        lea     ebx, [eax+2H]                           ; 245B _ 8D. 58, 02
        mov     eax, dword [ebp+8H]                     ; 245E _ 8B. 45, 08
        add     edx, 2                                  ; 2461 _ 83. C2, 02
        lea     edx, [eax+edx*8]                        ; 2464 _ 8D. 14 D0
        mov     eax, dword [edx]                        ; 2467 _ 8B. 02
        mov     edx, dword [edx+4H]                     ; 2469 _ 8B. 52, 04
        mov     dword [ecx+ebx*8], eax                  ; 246C _ 89. 04 D9
        mov     dword [ecx+ebx*8+4H], edx               ; 246F _ 89. 54 D9, 04
        sub     dword [ebp-8H], 1                       ; 2473 _ 83. 6D, F8, 01
?_098:  mov     eax, dword [ebp-8H]                     ; 2477 _ 8B. 45, F8
        cmp     eax, dword [ebp-0CH]                    ; 247A _ 3B. 45, F4
        jg      ?_097                                   ; 247D _ 7F, D0
        mov     eax, dword [ebp+8H]                     ; 247F _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2482 _ 8B. 00
        lea     edx, [eax+1H]                           ; 2484 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2487 _ 8B. 45, 08
        mov     dword [eax], edx                        ; 248A _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 248C _ 8B. 45, 08
        mov     edx, dword [eax+4H]                     ; 248F _ 8B. 50, 04
        mov     eax, dword [ebp+8H]                     ; 2492 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2495 _ 8B. 00
        cmp     edx, eax                                ; 2497 _ 39. C2
        jge     ?_099                                   ; 2499 _ 7D, 0B
        mov     eax, dword [ebp+8H]                     ; 249B _ 8B. 45, 08
        mov     edx, dword [eax]                        ; 249E _ 8B. 10
        mov     eax, dword [ebp+8H]                     ; 24A0 _ 8B. 45, 08
        mov     dword [eax+4H], edx                     ; 24A3 _ 89. 50, 04
?_099:  mov     eax, dword [ebp+8H]                     ; 24A6 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 24A9 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 24AC _ 8D. 4A, 02
        mov     edx, dword [ebp+0CH]                    ; 24AF _ 8B. 55, 0C
        mov     dword [eax+ecx*8], edx                  ; 24B2 _ 89. 14 C8
        mov     eax, dword [ebp+8H]                     ; 24B5 _ 8B. 45, 08
        mov     edx, dword [ebp-0CH]                    ; 24B8 _ 8B. 55, F4
        lea     ecx, [edx+2H]                           ; 24BB _ 8D. 4A, 02
        mov     edx, dword [ebp+10H]                    ; 24BE _ 8B. 55, 10
        mov     dword [eax+ecx*8+4H], edx               ; 24C1 _ 89. 54 C8, 04
        mov     eax, 0                                  ; 24C5 _ B8, 00000000
        jmp     ?_101                                   ; 24CA _ EB, 29

?_100:  mov     eax, dword [ebp+8H]                     ; 24CC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 24CF _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 24D2 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 24D5 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 24D8 _ 89. 50, 0C
        mov     eax, dword [ebp+8H]                     ; 24DB _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 24DE _ 8B. 40, 08
        mov     edx, eax                                ; 24E1 _ 89. C2
        mov     eax, dword [ebp+10H]                    ; 24E3 _ 8B. 45, 10
        add     eax, edx                                ; 24E6 _ 01. D0
        mov     edx, eax                                ; 24E8 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 24EA _ 8B. 45, 08
        mov     dword [eax+8H], edx                     ; 24ED _ 89. 50, 08
        mov     eax, 4294967295                         ; 24F0 _ B8, FFFFFFFF
?_101:  add     esp, 16                                 ; 24F5 _ 83. C4, 10
        pop     ebx                                     ; 24F8 _ 5B
        pop     ebp                                     ; 24F9 _ 5D
        ret                                             ; 24FA _ C3
; memman_free End of function

memman_alloc_4k:; Function begin
        push    ebp                                     ; 24FB _ 55
        mov     ebp, esp                                ; 24FC _ 89. E5
        sub     esp, 24                                 ; 24FE _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 2501 _ 8B. 45, 0C
        add     eax, 4095                               ; 2504 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2509 _ 25, FFFFF000
        mov     dword [ebp+0CH], eax                    ; 250E _ 89. 45, 0C
        mov     eax, dword [ebp+0CH]                    ; 2511 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 2514 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2518 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 251B _ 89. 04 24
        call    memman_alloc                            ; 251E _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 2523 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 2526 _ 8B. 45, FC
        leave                                           ; 2529 _ C9
        ret                                             ; 252A _ C3
; memman_alloc_4k End of function

memman_free_4k:; Function begin
        push    ebp                                     ; 252B _ 55
        mov     ebp, esp                                ; 252C _ 89. E5
        sub     esp, 28                                 ; 252E _ 83. EC, 1C
        mov     eax, dword [ebp+10H]                    ; 2531 _ 8B. 45, 10
        add     eax, 4095                               ; 2534 _ 05, 00000FFF
        and     eax, 0FFFFF000H                         ; 2539 _ 25, FFFFF000
        mov     dword [ebp+10H], eax                    ; 253E _ 89. 45, 10
        mov     eax, dword [ebp+10H]                    ; 2541 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 2544 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 2548 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 254B _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 254F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2552 _ 89. 04 24
        call    memman_free                             ; 2555 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-4H], eax                     ; 255A _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 255D _ 8B. 45, FC
        leave                                           ; 2560 _ C9
        ret                                             ; 2561 _ C3
; memman_free_4k End of function

sheet_control_init:; Function begin
        push    ebp                                     ; 2562 _ 55
        mov     ebp, esp                                ; 2563 _ 89. E5
        sub     esp, 40                                 ; 2565 _ 83. EC, 28
        mov     dword [esp+4H], 9236                    ; 2568 _ C7. 44 24, 04, 00002414
        mov     eax, dword [ebp+8H]                     ; 2570 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2573 _ 89. 04 24
        call    memman_alloc_4k                         ; 2576 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 257B _ 89. 45, F4
        cmp     dword [ebp-0CH], 0                      ; 257E _ 83. 7D, F4, 00
        jnz     ?_102                                   ; 2582 _ 75, 24
        mov     eax, dword [ebp-0CH]                    ; 2584 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 2587 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 258F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2593 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2596 _ 89. 04 24
        call    memman_free_4k                          ; 2599 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 259E _ B8, 00000000
        jmp     ?_106                                   ; 25A3 _ E9, 0000009D

?_102:  mov     eax, dword [ebp-0CH]                    ; 25A8 _ 8B. 45, F4
        mov     edx, dword [ebp+0CH]                    ; 25AB _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 25AE _ 89. 10
        mov     eax, dword [ebp-0CH]                    ; 25B0 _ 8B. 45, F4
        mov     edx, dword [ebp+10H]                    ; 25B3 _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 25B6 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 25B9 _ 8B. 45, F4
        mov     edx, dword [ebp+14H]                    ; 25BC _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 25BF _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 25C2 _ 8B. 45, F4
        mov     dword [eax+0CH], -1                     ; 25C5 _ C7. 40, 0C, FFFFFFFF
        mov     dword [ebp-10H], 0                      ; 25CC _ C7. 45, F0, 00000000
        jmp     ?_104                                   ; 25D3 _ EB, 1B

?_103:  mov     eax, dword [ebp-0CH]                    ; 25D5 _ 8B. 45, F4
        mov     edx, dword [ebp-10H]                    ; 25D8 _ 8B. 55, F0
        add     edx, 33                                 ; 25DB _ 83. C2, 21
        shl     edx, 5                                  ; 25DE _ C1. E2, 05
        add     eax, edx                                ; 25E1 _ 01. D0
        add     eax, 16                                 ; 25E3 _ 83. C0, 10
        mov     dword [eax], 0                          ; 25E6 _ C7. 00, 00000000
        add     dword [ebp-10H], 1                      ; 25EC _ 83. 45, F0, 01
?_104:  cmp     dword [ebp-10H], 255                    ; 25F0 _ 81. 7D, F0, 000000FF
        jle     ?_103                                   ; 25F7 _ 7E, DC
        mov     eax, dword [ebp+10H]                    ; 25F9 _ 8B. 45, 10
        imul    eax, dword [ebp+14H]                    ; 25FC _ 0F AF. 45, 14
        mov     dword [esp+4H], eax                     ; 2600 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2604 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2607 _ 89. 04 24
        call    memman_alloc_4k                         ; 260A _ E8, FFFFFFFC(rel)
        mov     edx, eax                                ; 260F _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2611 _ 8B. 45, F4
        mov     dword [eax+10H], edx                    ; 2614 _ 89. 50, 10
        mov     eax, dword [ebp-0CH]                    ; 2617 _ 8B. 45, F4
        mov     eax, dword [eax+10H]                    ; 261A _ 8B. 40, 10
        test    eax, eax                                ; 261D _ 85. C0
        jnz     ?_105                                   ; 261F _ 75, 21
        mov     eax, dword [ebp-0CH]                    ; 2621 _ 8B. 45, F4
        mov     dword [esp+8H], 9236                    ; 2624 _ C7. 44 24, 08, 00002414
        mov     dword [esp+4H], eax                     ; 262C _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2630 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2633 _ 89. 04 24
        call    memman_free_4k                          ; 2636 _ E8, FFFFFFFC(rel)
        mov     eax, 0                                  ; 263B _ B8, 00000000
        jmp     ?_106                                   ; 2640 _ EB, 03

?_105:  mov     eax, dword [ebp-0CH]                    ; 2642 _ 8B. 45, F4
?_106:  leave                                           ; 2645 _ C9
        ret                                             ; 2646 _ C3
; sheet_control_init End of function

sheet_alloc:; Function begin
        push    ebp                                     ; 2647 _ 55
        mov     ebp, esp                                ; 2648 _ 89. E5
        sub     esp, 16                                 ; 264A _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 264D _ C7. 45, F8, 00000000
        jmp     ?_109                                   ; 2654 _ EB, 5B

?_107:  mov     eax, dword [ebp+8H]                     ; 2656 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2659 _ 8B. 55, F8
        add     edx, 33                                 ; 265C _ 83. C2, 21
        shl     edx, 5                                  ; 265F _ C1. E2, 05
        add     eax, edx                                ; 2662 _ 01. D0
        add     eax, 16                                 ; 2664 _ 83. C0, 10
        mov     eax, dword [eax]                        ; 2667 _ 8B. 00
        test    eax, eax                                ; 2669 _ 85. C0
        jnz     ?_108                                   ; 266B _ 75, 40
        mov     eax, dword [ebp-8H]                     ; 266D _ 8B. 45, F8
        shl     eax, 5                                  ; 2670 _ C1. E0, 05
        lea     edx, [eax+410H]                         ; 2673 _ 8D. 90, 00000410
        mov     eax, dword [ebp+8H]                     ; 2679 _ 8B. 45, 08
        add     eax, edx                                ; 267C _ 01. D0
        add     eax, 4                                  ; 267E _ 83. C0, 04
        mov     dword [ebp-4H], eax                     ; 2681 _ 89. 45, FC
        mov     eax, dword [ebp+8H]                     ; 2684 _ 8B. 45, 08
        mov     edx, dword [ebp-8H]                     ; 2687 _ 8B. 55, F8
        lea     ecx, [edx+4H]                           ; 268A _ 8D. 4A, 04
        mov     edx, dword [ebp-4H]                     ; 268D _ 8B. 55, FC
        mov     dword [eax+ecx*4+4H], edx               ; 2690 _ 89. 54 88, 04
        mov     eax, dword [ebp-4H]                     ; 2694 _ 8B. 45, FC
        mov     dword [eax+1CH], 1                      ; 2697 _ C7. 40, 1C, 00000001
        mov     eax, dword [ebp-4H]                     ; 269E _ 8B. 45, FC
        mov     dword [eax+18H], -1                     ; 26A1 _ C7. 40, 18, FFFFFFFF
        mov     eax, dword [ebp-4H]                     ; 26A8 _ 8B. 45, FC
        jmp     ?_110                                   ; 26AB _ EB, 12

?_108:  add     dword [ebp-8H], 1                       ; 26AD _ 83. 45, F8, 01
?_109:  cmp     dword [ebp-8H], 255                     ; 26B1 _ 81. 7D, F8, 000000FF
        jle     ?_107                                   ; 26B8 _ 7E, 9C
        mov     eax, 0                                  ; 26BA _ B8, 00000000
?_110:  leave                                           ; 26BF _ C9
        ret                                             ; 26C0 _ C3
; sheet_alloc End of function

sheet_setbuf:; Function begin
        push    ebp                                     ; 26C1 _ 55
        mov     ebp, esp                                ; 26C2 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 26C4 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 26C7 _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 26CA _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 26CC _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 26CF _ 8B. 55, 10
        mov     dword [eax+4H], edx                     ; 26D2 _ 89. 50, 04
        mov     eax, dword [ebp+8H]                     ; 26D5 _ 8B. 45, 08
        mov     edx, dword [ebp+14H]                    ; 26D8 _ 8B. 55, 14
        mov     dword [eax+8H], edx                     ; 26DB _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 26DE _ 8B. 45, 08
        mov     edx, dword [ebp+18H]                    ; 26E1 _ 8B. 55, 18
        mov     dword [eax+14H], edx                    ; 26E4 _ 89. 50, 14
        pop     ebp                                     ; 26E7 _ 5D
        ret                                             ; 26E8 _ C3
; sheet_setbuf End of function

sheet_updown:; Function begin
        push    ebp                                     ; 26E9 _ 55
        mov     ebp, esp                                ; 26EA _ 89. E5
        push    esi                                     ; 26EC _ 56
        push    ebx                                     ; 26ED _ 53
        sub     esp, 48                                 ; 26EE _ 83. EC, 30
        mov     eax, dword [ebp+0CH]                    ; 26F1 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 26F4 _ 8B. 40, 18
        mov     dword [ebp-0CH], eax                    ; 26F7 _ 89. 45, F4
        mov     eax, dword [ebp+8H]                     ; 26FA _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 26FD _ 8B. 40, 0C
        add     eax, 1                                  ; 2700 _ 83. C0, 01
        cmp     eax, dword [ebp+10H]                    ; 2703 _ 3B. 45, 10
        jge     ?_111                                   ; 2706 _ 7D, 0C
        mov     eax, dword [ebp+8H]                     ; 2708 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 270B _ 8B. 40, 0C
        add     eax, 1                                  ; 270E _ 83. C0, 01
        mov     dword [ebp+10H], eax                    ; 2711 _ 89. 45, 10
?_111:  cmp     dword [ebp+10H], -1                     ; 2714 _ 83. 7D, 10, FF
        jge     ?_112                                   ; 2718 _ 7D, 07
        mov     dword [ebp+10H], -1                     ; 271A _ C7. 45, 10, FFFFFFFF
?_112:  mov     eax, dword [ebp+0CH]                    ; 2721 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2724 _ 8B. 55, 10
        mov     dword [eax+18H], edx                    ; 2727 _ 89. 50, 18
        mov     eax, dword [ebp-0CH]                    ; 272A _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 272D _ 3B. 45, 10
        jle     ?_119                                   ; 2730 _ 0F 8E, 00000201
        cmp     dword [ebp+10H], 0                      ; 2736 _ 83. 7D, 10, 00
        js      ?_115                                   ; 273A _ 0F 88, 000000F7
        mov     eax, dword [ebp-0CH]                    ; 2740 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2743 _ 89. 45, F0
        jmp     ?_114                                   ; 2746 _ EB, 34

?_113:  mov     eax, dword [ebp-10H]                    ; 2748 _ 8B. 45, F0
        lea     edx, [eax-1H]                           ; 274B _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 274E _ 8B. 45, 08
        add     edx, 4                                  ; 2751 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2754 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2758 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 275B _ 8B. 4D, F0
        add     ecx, 4                                  ; 275E _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2761 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2765 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2768 _ 8B. 55, F0
        add     edx, 4                                  ; 276B _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 276E _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2772 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2775 _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 2778 _ 83. 6D, F0, 01
?_114:  mov     eax, dword [ebp-10H]                    ; 277C _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 277F _ 3B. 45, 10
        jg      ?_113                                   ; 2782 _ 7F, C4
        mov     eax, dword [ebp+8H]                     ; 2784 _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2787 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 278A _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 278D _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2790 _ 89. 54 88, 04
        mov     eax, dword [ebp+10H]                    ; 2794 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 2797 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 279A _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 279D _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 27A0 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 27A3 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 27A6 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 27A9 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 27AC _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 27AF _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 27B2 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 27B5 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 27B8 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 27BB _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 27BE _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 27C1 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 27C4 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 27C8 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 27CC _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 27D0 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 27D4 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 27D8 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 27DB _ 89. 04 24
        call    sheet_refresh_map                       ; 27DE _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+10H]                    ; 27E3 _ 8B. 45, 10
        lea     esi, [eax+1H]                           ; 27E6 _ 8D. 70, 01
        mov     eax, dword [ebp+0CH]                    ; 27E9 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 27EC _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 27EF _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 27F2 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 27F5 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 27F8 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 27FB _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 27FE _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2801 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2804 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2807 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 280A _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 280D _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2810 _ 8B. 40, 0C
        mov     dword [esp+14H], esi                    ; 2813 _ 89. 74 24, 14
        mov     dword [esp+10H], ebx                    ; 2817 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 281B _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 281F _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2823 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2827 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 282A _ 89. 04 24
        call    sheet_refresh_local                     ; 282D _ E8, FFFFFFFC(rel)
        jmp     ?_126                                   ; 2832 _ E9, 0000026C

?_115:  mov     eax, dword [ebp+8H]                     ; 2837 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 283A _ 8B. 40, 0C
        cmp     eax, dword [ebp-0CH]                    ; 283D _ 3B. 45, F4
        jle     ?_118                                   ; 2840 _ 7E, 47
        mov     eax, dword [ebp-0CH]                    ; 2842 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 2845 _ 89. 45, F0
        jmp     ?_117                                   ; 2848 _ EB, 34

?_116:  mov     eax, dword [ebp-10H]                    ; 284A _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 284D _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2850 _ 8B. 45, 08
        add     edx, 4                                  ; 2853 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 2856 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 285A _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 285D _ 8B. 4D, F0
        add     ecx, 4                                  ; 2860 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 2863 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 2867 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 286A _ 8B. 55, F0
        add     edx, 4                                  ; 286D _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2870 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 2874 _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 2877 _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 287A _ 83. 45, F0, 01
?_117:  mov     eax, dword [ebp+8H]                     ; 287E _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2881 _ 8B. 40, 0C
        cmp     eax, dword [ebp-10H]                    ; 2884 _ 3B. 45, F0
        jg      ?_116                                   ; 2887 _ 7F, C1
?_118:  mov     eax, dword [ebp+8H]                     ; 2889 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 288C _ 8B. 40, 0C
        lea     edx, [eax-1H]                           ; 288F _ 8D. 50, FF
        mov     eax, dword [ebp+8H]                     ; 2892 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2895 _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2898 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 289B _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 289E _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 28A1 _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 28A4 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 28A7 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 28AA _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 28AD _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 28B0 _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 28B3 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 28B6 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 28B9 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 28BC _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 28BF _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 28C2 _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 28CA _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 28CE _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 28D2 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 28D6 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 28DA _ 8B. 45, 08
        mov     dword [esp], eax                        ; 28DD _ 89. 04 24
        call    sheet_refresh_map                       ; 28E0 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 28E5 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 28E8 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 28EB _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 28EE _ 8B. 40, 08
        lea     ebx, [edx+eax]                          ; 28F1 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 28F4 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 28F7 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 28FA _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 28FD _ 8B. 40, 04
        lea     ecx, [edx+eax]                          ; 2900 _ 8D. 0C 02
        mov     eax, dword [ebp+0CH]                    ; 2903 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2906 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2909 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 290C _ 8B. 40, 0C
        mov     dword [esp+14H], 0                      ; 290F _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], ebx                    ; 2917 _ 89. 5C 24, 10
        mov     dword [esp+0CH], ecx                    ; 291B _ 89. 4C 24, 0C
        mov     dword [esp+8H], edx                     ; 291F _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2923 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2927 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 292A _ 89. 04 24
        call    sheet_refresh_local                     ; 292D _ E8, FFFFFFFC(rel)
        jmp     ?_126                                   ; 2932 _ E9, 0000016C

?_119:  mov     eax, dword [ebp-0CH]                    ; 2937 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 293A _ 3B. 45, 10
        jge     ?_126                                   ; 293D _ 0F 8D, 00000160
        cmp     dword [ebp-0CH], 0                      ; 2943 _ 83. 7D, F4, 00
        js      ?_122                                   ; 2947 _ 78, 56
        mov     eax, dword [ebp-0CH]                    ; 2949 _ 8B. 45, F4
        mov     dword [ebp-10H], eax                    ; 294C _ 89. 45, F0
        jmp     ?_121                                   ; 294F _ EB, 34

?_120:  mov     eax, dword [ebp-10H]                    ; 2951 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 2954 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2957 _ 8B. 45, 08
        add     edx, 4                                  ; 295A _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 295D _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 2961 _ 8B. 45, 08
        mov     ecx, dword [ebp-10H]                    ; 2964 _ 8B. 4D, F0
        add     ecx, 4                                  ; 2967 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 296A _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 296E _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 2971 _ 8B. 55, F0
        add     edx, 4                                  ; 2974 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2977 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 297B _ 8B. 55, F0
        mov     dword [eax+18H], edx                    ; 297E _ 89. 50, 18
        add     dword [ebp-10H], 1                      ; 2981 _ 83. 45, F0, 01
?_121:  mov     eax, dword [ebp-10H]                    ; 2985 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 2988 _ 3B. 45, 10
        jl      ?_120                                   ; 298B _ 7C, C4
        mov     eax, dword [ebp+8H]                     ; 298D _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 2990 _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 2993 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 2996 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 2999 _ 89. 54 88, 04
        jmp     ?_125                                   ; 299D _ EB, 6C

?_122:  mov     eax, dword [ebp+8H]                     ; 299F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 29A2 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 29A5 _ 89. 45, F0
        jmp     ?_124                                   ; 29A8 _ EB, 3A

?_123:  mov     eax, dword [ebp-10H]                    ; 29AA _ 8B. 45, F0
        lea     ecx, [eax+1H]                           ; 29AD _ 8D. 48, 01
        mov     eax, dword [ebp+8H]                     ; 29B0 _ 8B. 45, 08
        mov     edx, dword [ebp-10H]                    ; 29B3 _ 8B. 55, F0
        add     edx, 4                                  ; 29B6 _ 83. C2, 04
        mov     edx, dword [eax+edx*4+4H]               ; 29B9 _ 8B. 54 90, 04
        mov     eax, dword [ebp+8H]                     ; 29BD _ 8B. 45, 08
        add     ecx, 4                                  ; 29C0 _ 83. C1, 04
        mov     dword [eax+ecx*4+4H], edx               ; 29C3 _ 89. 54 88, 04
        mov     eax, dword [ebp-10H]                    ; 29C7 _ 8B. 45, F0
        lea     edx, [eax+1H]                           ; 29CA _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 29CD _ 8B. 45, 08
        add     edx, 4                                  ; 29D0 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 29D3 _ 8B. 44 90, 04
        mov     edx, dword [ebp-10H]                    ; 29D7 _ 8B. 55, F0
        add     edx, 1                                  ; 29DA _ 83. C2, 01
        mov     dword [eax+18H], edx                    ; 29DD _ 89. 50, 18
        sub     dword [ebp-10H], 1                      ; 29E0 _ 83. 6D, F0, 01
?_124:  mov     eax, dword [ebp-10H]                    ; 29E4 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 29E7 _ 3B. 45, 10
        jge     ?_123                                   ; 29EA _ 7D, BE
        mov     eax, dword [ebp+8H]                     ; 29EC _ 8B. 45, 08
        mov     edx, dword [ebp+10H]                    ; 29EF _ 8B. 55, 10
        lea     ecx, [edx+4H]                           ; 29F2 _ 8D. 4A, 04
        mov     edx, dword [ebp+0CH]                    ; 29F5 _ 8B. 55, 0C
        mov     dword [eax+ecx*4+4H], edx               ; 29F8 _ 89. 54 88, 04
        mov     eax, dword [ebp+8H]                     ; 29FC _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 29FF _ 8B. 40, 0C
        lea     edx, [eax+1H]                           ; 2A02 _ 8D. 50, 01
        mov     eax, dword [ebp+8H]                     ; 2A05 _ 8B. 45, 08
        mov     dword [eax+0CH], edx                    ; 2A08 _ 89. 50, 0C
?_125:  mov     eax, dword [ebp+0CH]                    ; 2A0B _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2A0E _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2A11 _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2A14 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 2A17 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2A1A _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2A1D _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2A20 _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2A23 _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2A26 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2A29 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2A2C _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2A2F _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2A32 _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 2A35 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 2A38 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 2A3C _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2A40 _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 2A44 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2A48 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2A4C _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2A4F _ 89. 04 24
        call    sheet_refresh_map                       ; 2A52 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2A57 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2A5A _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2A5D _ 8B. 45, 0C
        mov     eax, dword [eax+8H]                     ; 2A60 _ 8B. 40, 08
        lea     esi, [edx+eax]                          ; 2A63 _ 8D. 34 02
        mov     eax, dword [ebp+0CH]                    ; 2A66 _ 8B. 45, 0C
        mov     edx, dword [eax+0CH]                    ; 2A69 _ 8B. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2A6C _ 8B. 45, 0C
        mov     eax, dword [eax+4H]                     ; 2A6F _ 8B. 40, 04
        lea     ebx, [edx+eax]                          ; 2A72 _ 8D. 1C 02
        mov     eax, dword [ebp+0CH]                    ; 2A75 _ 8B. 45, 0C
        mov     edx, dword [eax+10H]                    ; 2A78 _ 8B. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2A7B _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2A7E _ 8B. 40, 0C
        mov     ecx, dword [ebp+10H]                    ; 2A81 _ 8B. 4D, 10
        mov     dword [esp+14H], ecx                    ; 2A84 _ 89. 4C 24, 14
        mov     dword [esp+10H], esi                    ; 2A88 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2A8C _ 89. 5C 24, 0C
        mov     dword [esp+8H], edx                     ; 2A90 _ 89. 54 24, 08
        mov     dword [esp+4H], eax                     ; 2A94 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2A98 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2A9B _ 89. 04 24
        call    sheet_refresh_local                     ; 2A9E _ E8, FFFFFFFC(rel)
?_126:  add     esp, 48                                 ; 2AA3 _ 83. C4, 30
        pop     ebx                                     ; 2AA6 _ 5B
        pop     esi                                     ; 2AA7 _ 5E
        pop     ebp                                     ; 2AA8 _ 5D
        ret                                             ; 2AA9 _ C3
; sheet_updown End of function

sheet_refresh:; Function begin
        push    ebp                                     ; 2AAA _ 55
        mov     ebp, esp                                ; 2AAB _ 89. E5
        push    edi                                     ; 2AAD _ 57
        push    esi                                     ; 2AAE _ 56
        push    ebx                                     ; 2AAF _ 53
        sub     esp, 44                                 ; 2AB0 _ 83. EC, 2C
        mov     eax, dword [ebp+0CH]                    ; 2AB3 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2AB6 _ 8B. 40, 18
        test    eax, eax                                ; 2AB9 _ 85. C0
        js      ?_127                                   ; 2ABB _ 78, 53
        mov     eax, dword [ebp+0CH]                    ; 2ABD _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2AC0 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2AC3 _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2AC6 _ 8B. 4A, 10
        mov     edx, dword [ebp+1CH]                    ; 2AC9 _ 8B. 55, 1C
        lea     esi, [ecx+edx]                          ; 2ACC _ 8D. 34 11
        mov     edx, dword [ebp+0CH]                    ; 2ACF _ 8B. 55, 0C
        mov     ecx, dword [edx+0CH]                    ; 2AD2 _ 8B. 4A, 0C
        mov     edx, dword [ebp+18H]                    ; 2AD5 _ 8B. 55, 18
        lea     ebx, [ecx+edx]                          ; 2AD8 _ 8D. 1C 11
        mov     edx, dword [ebp+0CH]                    ; 2ADB _ 8B. 55, 0C
        mov     ecx, dword [edx+10H]                    ; 2ADE _ 8B. 4A, 10
        mov     edx, dword [ebp+14H]                    ; 2AE1 _ 8B. 55, 14
        add     ecx, edx                                ; 2AE4 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2AE6 _ 8B. 55, 0C
        mov     edi, dword [edx+0CH]                    ; 2AE9 _ 8B. 7A, 0C
        mov     edx, dword [ebp+10H]                    ; 2AEC _ 8B. 55, 10
        add     edx, edi                                ; 2AEF _ 01. FA
        mov     dword [esp+14H], eax                    ; 2AF1 _ 89. 44 24, 14
        mov     dword [esp+10H], esi                    ; 2AF5 _ 89. 74 24, 10
        mov     dword [esp+0CH], ebx                    ; 2AF9 _ 89. 5C 24, 0C
        mov     dword [esp+8H], ecx                     ; 2AFD _ 89. 4C 24, 08
        mov     dword [esp+4H], edx                     ; 2B01 _ 89. 54 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B05 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B08 _ 89. 04 24
        call    sheet_refresh_local                     ; 2B0B _ E8, FFFFFFFC(rel)
?_127:  mov     eax, 0                                  ; 2B10 _ B8, 00000000
        add     esp, 44                                 ; 2B15 _ 83. C4, 2C
        pop     ebx                                     ; 2B18 _ 5B
        pop     esi                                     ; 2B19 _ 5E
        pop     edi                                     ; 2B1A _ 5F
        pop     ebp                                     ; 2B1B _ 5D
        ret                                             ; 2B1C _ C3
; sheet_refresh End of function

sheet_slide:; Function begin
        push    ebp                                     ; 2B1D _ 55
        mov     ebp, esp                                ; 2B1E _ 89. E5
        push    ebx                                     ; 2B20 _ 53
        sub     esp, 52                                 ; 2B21 _ 83. EC, 34
        mov     eax, dword [ebp+0CH]                    ; 2B24 _ 8B. 45, 0C
        mov     eax, dword [eax+0CH]                    ; 2B27 _ 8B. 40, 0C
        mov     dword [ebp-10H], eax                    ; 2B2A _ 89. 45, F0
        mov     eax, dword [ebp+0CH]                    ; 2B2D _ 8B. 45, 0C
        mov     eax, dword [eax+10H]                    ; 2B30 _ 8B. 40, 10
        mov     dword [ebp-0CH], eax                    ; 2B33 _ 89. 45, F4
        mov     eax, dword [ebp+0CH]                    ; 2B36 _ 8B. 45, 0C
        mov     edx, dword [ebp+10H]                    ; 2B39 _ 8B. 55, 10
        mov     dword [eax+0CH], edx                    ; 2B3C _ 89. 50, 0C
        mov     eax, dword [ebp+0CH]                    ; 2B3F _ 8B. 45, 0C
        mov     edx, dword [ebp+14H]                    ; 2B42 _ 8B. 55, 14
        mov     dword [eax+10H], edx                    ; 2B45 _ 89. 50, 10
        mov     eax, dword [ebp+0CH]                    ; 2B48 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2B4B _ 8B. 40, 18
        test    eax, eax                                ; 2B4E _ 85. C0
        js      ?_128                                   ; 2B50 _ 0F 88, 00000100
        mov     eax, dword [ebp+0CH]                    ; 2B56 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2B59 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2B5C _ 8B. 45, F4
        add     edx, eax                                ; 2B5F _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2B61 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2B64 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2B67 _ 8B. 45, F0
        add     eax, ecx                                ; 2B6A _ 01. C8
        mov     dword [esp+14H], 0                      ; 2B6C _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 2B74 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2B78 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2B7C _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2B7F _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 2B83 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2B86 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2B8A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2B8D _ 89. 04 24
        call    sheet_refresh_map                       ; 2B90 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2B95 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2B98 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2B9B _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2B9E _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2BA1 _ 8B. 55, 14
        add     ecx, edx                                ; 2BA4 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2BA6 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2BA9 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2BAC _ 8B. 55, 10
        add     edx, ebx                                ; 2BAF _ 01. DA
        mov     dword [esp+14H], eax                    ; 2BB1 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 2BB5 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 2BB9 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 2BBD _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 2BC0 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2BC4 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2BC7 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2BCB _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2BCE _ 89. 04 24
        call    sheet_refresh_map                       ; 2BD1 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2BD6 _ 8B. 45, 0C
        mov     edx, dword [eax+8H]                     ; 2BD9 _ 8B. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 2BDC _ 8B. 45, F4
        add     edx, eax                                ; 2BDF _ 01. C2
        mov     eax, dword [ebp+0CH]                    ; 2BE1 _ 8B. 45, 0C
        mov     ecx, dword [eax+4H]                     ; 2BE4 _ 8B. 48, 04
        mov     eax, dword [ebp-10H]                    ; 2BE7 _ 8B. 45, F0
        add     eax, ecx                                ; 2BEA _ 01. C8
        mov     dword [esp+14H], 0                      ; 2BEC _ C7. 44 24, 14, 00000000
        mov     dword [esp+10H], edx                    ; 2BF4 _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 2BF8 _ 89. 44 24, 0C
        mov     eax, dword [ebp-0CH]                    ; 2BFC _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 2BFF _ 89. 44 24, 08
        mov     eax, dword [ebp-10H]                    ; 2C03 _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 2C06 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2C0A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C0D _ 89. 04 24
        call    sheet_refresh_local                     ; 2C10 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp+0CH]                    ; 2C15 _ 8B. 45, 0C
        mov     eax, dword [eax+18H]                    ; 2C18 _ 8B. 40, 18
        mov     edx, dword [ebp+0CH]                    ; 2C1B _ 8B. 55, 0C
        mov     ecx, dword [edx+8H]                     ; 2C1E _ 8B. 4A, 08
        mov     edx, dword [ebp+14H]                    ; 2C21 _ 8B. 55, 14
        add     ecx, edx                                ; 2C24 _ 01. D1
        mov     edx, dword [ebp+0CH]                    ; 2C26 _ 8B. 55, 0C
        mov     ebx, dword [edx+4H]                     ; 2C29 _ 8B. 5A, 04
        mov     edx, dword [ebp+10H]                    ; 2C2C _ 8B. 55, 10
        add     edx, ebx                                ; 2C2F _ 01. DA
        mov     dword [esp+14H], eax                    ; 2C31 _ 89. 44 24, 14
        mov     dword [esp+10H], ecx                    ; 2C35 _ 89. 4C 24, 10
        mov     dword [esp+0CH], edx                    ; 2C39 _ 89. 54 24, 0C
        mov     eax, dword [ebp+14H]                    ; 2C3D _ 8B. 45, 14
        mov     dword [esp+8H], eax                     ; 2C40 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 2C44 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 2C47 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 2C4B _ 8B. 45, 08
        mov     dword [esp], eax                        ; 2C4E _ 89. 04 24
        call    sheet_refresh_local                     ; 2C51 _ E8, FFFFFFFC(rel)
?_128:  add     esp, 52                                 ; 2C56 _ 83. C4, 34
        pop     ebx                                     ; 2C59 _ 5B
        pop     ebp                                     ; 2C5A _ 5D
        ret                                             ; 2C5B _ C3
; sheet_slide End of function

sheet_refresh_local:; Function begin
        push    ebp                                     ; 2C5C _ 55
        mov     ebp, esp                                ; 2C5D _ 89. E5
        sub     esp, 48                                 ; 2C5F _ 83. EC, 30
        mov     eax, dword [ebp+8H]                     ; 2C62 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2C65 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 2C67 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2C6A _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2C6D _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 2C70 _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2C73 _ 83. 7D, 0C, 00
        jns     ?_129                                   ; 2C77 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2C79 _ C7. 45, 0C, 00000000
?_129:  cmp     dword [ebp+10H], 0                      ; 2C80 _ 83. 7D, 10, 00
        jns     ?_130                                   ; 2C84 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2C86 _ C7. 45, 10, 00000000
?_130:  mov     eax, dword [ebp+8H]                     ; 2C8D _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2C90 _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 2C93 _ 3B. 45, 14
        jge     ?_131                                   ; 2C96 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2C98 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2C9B _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 2C9E _ 89. 45, 14
?_131:  mov     eax, dword [ebp+8H]                     ; 2CA1 _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2CA4 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 2CA7 _ 3B. 45, 18
        jge     ?_132                                   ; 2CAA _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2CAC _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2CAF _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 2CB2 _ 89. 45, 18
?_132:  mov     eax, dword [ebp+1CH]                    ; 2CB5 _ 8B. 45, 1C
        mov     dword [ebp-24H], eax                    ; 2CB8 _ 89. 45, DC
        jmp     ?_139                                   ; 2CBB _ E9, 00000119

?_133:  mov     eax, dword [ebp+8H]                     ; 2CC0 _ 8B. 45, 08
        mov     edx, dword [ebp-24H]                    ; 2CC3 _ 8B. 55, DC
        add     edx, 4                                  ; 2CC6 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2CC9 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2CCD _ 89. 45, F0
        mov     eax, dword [ebp-10H]                    ; 2CD0 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2CD3 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2CD5 _ 89. 45, F4
        mov     edx, dword [ebp-10H]                    ; 2CD8 _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 2CDB _ 8B. 45, 08
        add     eax, 1044                               ; 2CDE _ 05, 00000414
        sub     edx, eax                                ; 2CE3 _ 29. C2
        mov     eax, edx                                ; 2CE5 _ 89. D0
        sar     eax, 5                                  ; 2CE7 _ C1. F8, 05
        mov     byte [ebp-26H], al                      ; 2CEA _ 88. 45, DA
        mov     dword [ebp-1CH], 0                      ; 2CED _ C7. 45, E4, 00000000
        jmp     ?_138                                   ; 2CF4 _ E9, 000000CD

?_134:  mov     eax, dword [ebp-10H]                    ; 2CF9 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 2CFC _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 2CFF _ 8B. 45, E4
        add     eax, edx                                ; 2D02 _ 01. D0
        mov     dword [ebp-8H], eax                     ; 2D04 _ 89. 45, F8
        mov     dword [ebp-20H], 0                      ; 2D07 _ C7. 45, E0, 00000000
        jmp     ?_137                                   ; 2D0E _ E9, 000000A0

?_135:  mov     eax, dword [ebp-10H]                    ; 2D13 _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 2D16 _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 2D19 _ 8B. 45, E0
        add     eax, edx                                ; 2D1C _ 01. D0
        mov     dword [ebp-4H], eax                     ; 2D1E _ 89. 45, FC
        mov     eax, dword [ebp+0CH]                    ; 2D21 _ 8B. 45, 0C
        cmp     eax, dword [ebp-4H]                     ; 2D24 _ 3B. 45, FC
        jg      ?_136                                   ; 2D27 _ 0F 8F, 00000082
        mov     eax, dword [ebp-4H]                     ; 2D2D _ 8B. 45, FC
        cmp     eax, dword [ebp+14H]                    ; 2D30 _ 3B. 45, 14
        jge     ?_136                                   ; 2D33 _ 7D, 7A
        mov     eax, dword [ebp+10H]                    ; 2D35 _ 8B. 45, 10
        cmp     eax, dword [ebp-8H]                     ; 2D38 _ 3B. 45, F8
        jg      ?_136                                   ; 2D3B _ 7F, 72
        mov     eax, dword [ebp-8H]                     ; 2D3D _ 8B. 45, F8
        cmp     eax, dword [ebp+18H]                    ; 2D40 _ 3B. 45, 18
        jge     ?_136                                   ; 2D43 _ 7D, 6A
        mov     eax, dword [ebp-10H]                    ; 2D45 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2D48 _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 2D4B _ 0F AF. 45, E4
        mov     edx, eax                                ; 2D4F _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2D51 _ 8B. 45, E0
        add     eax, edx                                ; 2D54 _ 01. D0
        mov     edx, eax                                ; 2D56 _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2D58 _ 8B. 45, F4
        add     eax, edx                                ; 2D5B _ 01. D0
        movzx   eax, byte [eax]                         ; 2D5D _ 0F B6. 00
        mov     byte [ebp-25H], al                      ; 2D60 _ 88. 45, DB
        movzx   edx, byte [ebp-25H]                     ; 2D63 _ 0F B6. 55, DB
        mov     eax, dword [ebp-10H]                    ; 2D67 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 2D6A _ 8B. 40, 14
        cmp     edx, eax                                ; 2D6D _ 39. C2
        jz      ?_136                                   ; 2D6F _ 74, 3E
        mov     eax, dword [ebp+8H]                     ; 2D71 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2D74 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 2D77 _ 0F AF. 45, F8
        mov     edx, eax                                ; 2D7B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2D7D _ 8B. 45, FC
        add     eax, edx                                ; 2D80 _ 01. D0
        mov     edx, eax                                ; 2D82 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2D84 _ 8B. 45, EC
        add     eax, edx                                ; 2D87 _ 01. D0
        movzx   eax, byte [eax]                         ; 2D89 _ 0F B6. 00
        cmp     al, byte [ebp-26H]                      ; 2D8C _ 3A. 45, DA
        jnz     ?_136                                   ; 2D8F _ 75, 1E
        mov     eax, dword [ebp+8H]                     ; 2D91 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2D94 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 2D97 _ 0F AF. 45, F8
        mov     edx, eax                                ; 2D9B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2D9D _ 8B. 45, FC
        add     eax, edx                                ; 2DA0 _ 01. D0
        mov     edx, eax                                ; 2DA2 _ 89. C2
        mov     eax, dword [ebp-18H]                    ; 2DA4 _ 8B. 45, E8
        add     edx, eax                                ; 2DA7 _ 01. C2
        movzx   eax, byte [ebp-25H]                     ; 2DA9 _ 0F B6. 45, DB
        mov     byte [edx], al                          ; 2DAD _ 88. 02
?_136:  add     dword [ebp-20H], 1                      ; 2DAF _ 83. 45, E0, 01
?_137:  mov     eax, dword [ebp-10H]                    ; 2DB3 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2DB6 _ 8B. 40, 04
        cmp     eax, dword [ebp-20H]                    ; 2DB9 _ 3B. 45, E0
        jg      ?_135                                   ; 2DBC _ 0F 8F, FFFFFF51
        add     dword [ebp-1CH], 1                      ; 2DC2 _ 83. 45, E4, 01
?_138:  mov     eax, dword [ebp-10H]                    ; 2DC6 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2DC9 _ 8B. 40, 08
        cmp     eax, dword [ebp-1CH]                    ; 2DCC _ 3B. 45, E4
        jg      ?_134                                   ; 2DCF _ 0F 8F, FFFFFF24
        add     dword [ebp-24H], 1                      ; 2DD5 _ 83. 45, DC, 01
?_139:  mov     eax, dword [ebp+8H]                     ; 2DD9 _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2DDC _ 8B. 40, 0C
        cmp     eax, dword [ebp-24H]                    ; 2DDF _ 3B. 45, DC
        jge     ?_133                                   ; 2DE2 _ 0F 8D, FFFFFED8
        leave                                           ; 2DE8 _ C9
        ret                                             ; 2DE9 _ C3
; sheet_refresh_local End of function

sheet_refresh_map:; Function begin
        push    ebp                                     ; 2DEA _ 55
        mov     ebp, esp                                ; 2DEB _ 89. E5
        sub     esp, 64                                 ; 2DED _ 83. EC, 40
        mov     eax, dword [ebp+8H]                     ; 2DF0 _ 8B. 45, 08
        mov     eax, dword [eax]                        ; 2DF3 _ 8B. 00
        mov     dword [ebp-18H], eax                    ; 2DF5 _ 89. 45, E8
        mov     eax, dword [ebp+8H]                     ; 2DF8 _ 8B. 45, 08
        mov     eax, dword [eax+10H]                    ; 2DFB _ 8B. 40, 10
        mov     dword [ebp-14H], eax                    ; 2DFE _ 89. 45, EC
        cmp     dword [ebp+0CH], 0                      ; 2E01 _ 83. 7D, 0C, 00
        jns     ?_140                                   ; 2E05 _ 79, 07
        mov     dword [ebp+0CH], 0                      ; 2E07 _ C7. 45, 0C, 00000000
?_140:  cmp     dword [ebp+10H], 0                      ; 2E0E _ 83. 7D, 10, 00
        jns     ?_141                                   ; 2E12 _ 79, 07
        mov     dword [ebp+10H], 0                      ; 2E14 _ C7. 45, 10, 00000000
?_141:  mov     eax, dword [ebp+8H]                     ; 2E1B _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2E1E _ 8B. 40, 04
        cmp     eax, dword [ebp+14H]                    ; 2E21 _ 3B. 45, 14
        jge     ?_142                                   ; 2E24 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2E26 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2E29 _ 8B. 40, 04
        mov     dword [ebp+14H], eax                    ; 2E2C _ 89. 45, 14
?_142:  mov     eax, dword [ebp+8H]                     ; 2E2F _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2E32 _ 8B. 40, 08
        cmp     eax, dword [ebp+18H]                    ; 2E35 _ 3B. 45, 18
        jge     ?_143                                   ; 2E38 _ 7D, 09
        mov     eax, dword [ebp+8H]                     ; 2E3A _ 8B. 45, 08
        mov     eax, dword [eax+8H]                     ; 2E3D _ 8B. 40, 08
        mov     dword [ebp+18H], eax                    ; 2E40 _ 89. 45, 18
?_143:  mov     eax, dword [ebp+1CH]                    ; 2E43 _ 8B. 45, 1C
        mov     dword [ebp-34H], eax                    ; 2E46 _ 89. 45, CC
        jmp     ?_154                                   ; 2E49 _ E9, 00000141

?_144:  mov     eax, dword [ebp+8H]                     ; 2E4E _ 8B. 45, 08
        mov     edx, dword [ebp-34H]                    ; 2E51 _ 8B. 55, CC
        add     edx, 4                                  ; 2E54 _ 83. C2, 04
        mov     eax, dword [eax+edx*4+4H]               ; 2E57 _ 8B. 44 90, 04
        mov     dword [ebp-10H], eax                    ; 2E5B _ 89. 45, F0
        mov     edx, dword [ebp-10H]                    ; 2E5E _ 8B. 55, F0
        mov     eax, dword [ebp+8H]                     ; 2E61 _ 8B. 45, 08
        add     eax, 1044                               ; 2E64 _ 05, 00000414
        sub     edx, eax                                ; 2E69 _ 29. C2
        mov     eax, edx                                ; 2E6B _ 89. D0
        sar     eax, 5                                  ; 2E6D _ C1. F8, 05
        mov     byte [ebp-35H], al                      ; 2E70 _ 88. 45, CB
        mov     eax, dword [ebp-10H]                    ; 2E73 _ 8B. 45, F0
        mov     eax, dword [eax]                        ; 2E76 _ 8B. 00
        mov     dword [ebp-0CH], eax                    ; 2E78 _ 89. 45, F4
        mov     eax, dword [ebp-10H]                    ; 2E7B _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 2E7E _ 8B. 40, 0C
        mov     edx, dword [ebp+0CH]                    ; 2E81 _ 8B. 55, 0C
        sub     edx, eax                                ; 2E84 _ 29. C2
        mov     eax, edx                                ; 2E86 _ 89. D0
        mov     dword [ebp-30H], eax                    ; 2E88 _ 89. 45, D0
        mov     eax, dword [ebp-10H]                    ; 2E8B _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 2E8E _ 8B. 40, 10
        mov     edx, dword [ebp+10H]                    ; 2E91 _ 8B. 55, 10
        sub     edx, eax                                ; 2E94 _ 29. C2
        mov     eax, edx                                ; 2E96 _ 89. D0
        mov     dword [ebp-2CH], eax                    ; 2E98 _ 89. 45, D4
        mov     eax, dword [ebp-10H]                    ; 2E9B _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 2E9E _ 8B. 40, 0C
        mov     edx, dword [ebp+14H]                    ; 2EA1 _ 8B. 55, 14
        sub     edx, eax                                ; 2EA4 _ 29. C2
        mov     eax, edx                                ; 2EA6 _ 89. D0
        mov     dword [ebp-28H], eax                    ; 2EA8 _ 89. 45, D8
        mov     eax, dword [ebp-10H]                    ; 2EAB _ 8B. 45, F0
        mov     eax, dword [eax+10H]                    ; 2EAE _ 8B. 40, 10
        mov     edx, dword [ebp+18H]                    ; 2EB1 _ 8B. 55, 18
        sub     edx, eax                                ; 2EB4 _ 29. C2
        mov     eax, edx                                ; 2EB6 _ 89. D0
        mov     dword [ebp-24H], eax                    ; 2EB8 _ 89. 45, DC
        cmp     dword [ebp-30H], 0                      ; 2EBB _ 83. 7D, D0, 00
        jns     ?_145                                   ; 2EBF _ 79, 07
        mov     dword [ebp-30H], 0                      ; 2EC1 _ C7. 45, D0, 00000000
?_145:  cmp     dword [ebp-2CH], 0                      ; 2EC8 _ 83. 7D, D4, 00
        jns     ?_146                                   ; 2ECC _ 79, 07
        mov     dword [ebp-2CH], 0                      ; 2ECE _ C7. 45, D4, 00000000
?_146:  mov     eax, dword [ebp-10H]                    ; 2ED5 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2ED8 _ 8B. 40, 04
        cmp     eax, dword [ebp-28H]                    ; 2EDB _ 3B. 45, D8
        jge     ?_147                                   ; 2EDE _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 2EE0 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2EE3 _ 8B. 40, 04
        mov     dword [ebp-28H], eax                    ; 2EE6 _ 89. 45, D8
?_147:  mov     eax, dword [ebp-10H]                    ; 2EE9 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2EEC _ 8B. 40, 08
        cmp     eax, dword [ebp-24H]                    ; 2EEF _ 3B. 45, DC
        jge     ?_148                                   ; 2EF2 _ 7D, 09
        mov     eax, dword [ebp-10H]                    ; 2EF4 _ 8B. 45, F0
        mov     eax, dword [eax+8H]                     ; 2EF7 _ 8B. 40, 08
        mov     dword [ebp-24H], eax                    ; 2EFA _ 89. 45, DC
?_148:  mov     eax, dword [ebp-2CH]                    ; 2EFD _ 8B. 45, D4
        mov     dword [ebp-1CH], eax                    ; 2F00 _ 89. 45, E4
        jmp     ?_153                                   ; 2F03 _ EB, 7A

?_149:  mov     eax, dword [ebp-10H]                    ; 2F05 _ 8B. 45, F0
        mov     edx, dword [eax+10H]                    ; 2F08 _ 8B. 50, 10
        mov     eax, dword [ebp-1CH]                    ; 2F0B _ 8B. 45, E4
        add     eax, edx                                ; 2F0E _ 01. D0
        mov     dword [ebp-8H], eax                     ; 2F10 _ 89. 45, F8
        mov     eax, dword [ebp-30H]                    ; 2F13 _ 8B. 45, D0
        mov     dword [ebp-20H], eax                    ; 2F16 _ 89. 45, E0
        jmp     ?_152                                   ; 2F19 _ EB, 58

?_150:  mov     eax, dword [ebp-10H]                    ; 2F1B _ 8B. 45, F0
        mov     edx, dword [eax+0CH]                    ; 2F1E _ 8B. 50, 0C
        mov     eax, dword [ebp-20H]                    ; 2F21 _ 8B. 45, E0
        add     eax, edx                                ; 2F24 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 2F26 _ 89. 45, FC
        mov     eax, dword [ebp-10H]                    ; 2F29 _ 8B. 45, F0
        mov     eax, dword [eax+4H]                     ; 2F2C _ 8B. 40, 04
        imul    eax, dword [ebp-1CH]                    ; 2F2F _ 0F AF. 45, E4
        mov     edx, eax                                ; 2F33 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 2F35 _ 8B. 45, E0
        add     eax, edx                                ; 2F38 _ 01. D0
        mov     edx, eax                                ; 2F3A _ 89. C2
        mov     eax, dword [ebp-0CH]                    ; 2F3C _ 8B. 45, F4
        add     eax, edx                                ; 2F3F _ 01. D0
        movzx   eax, byte [eax]                         ; 2F41 _ 0F B6. 00
        movzx   edx, al                                 ; 2F44 _ 0F B6. D0
        mov     eax, dword [ebp-10H]                    ; 2F47 _ 8B. 45, F0
        mov     eax, dword [eax+14H]                    ; 2F4A _ 8B. 40, 14
        cmp     edx, eax                                ; 2F4D _ 39. C2
        jz      ?_151                                   ; 2F4F _ 74, 1E
        mov     eax, dword [ebp+8H]                     ; 2F51 _ 8B. 45, 08
        mov     eax, dword [eax+4H]                     ; 2F54 _ 8B. 40, 04
        imul    eax, dword [ebp-8H]                     ; 2F57 _ 0F AF. 45, F8
        mov     edx, eax                                ; 2F5B _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 2F5D _ 8B. 45, FC
        add     eax, edx                                ; 2F60 _ 01. D0
        mov     edx, eax                                ; 2F62 _ 89. C2
        mov     eax, dword [ebp-14H]                    ; 2F64 _ 8B. 45, EC
        add     edx, eax                                ; 2F67 _ 01. C2
        movzx   eax, byte [ebp-35H]                     ; 2F69 _ 0F B6. 45, CB
        mov     byte [edx], al                          ; 2F6D _ 88. 02
?_151:  add     dword [ebp-20H], 1                      ; 2F6F _ 83. 45, E0, 01
?_152:  mov     eax, dword [ebp-20H]                    ; 2F73 _ 8B. 45, E0
        cmp     eax, dword [ebp-28H]                    ; 2F76 _ 3B. 45, D8
        jl      ?_150                                   ; 2F79 _ 7C, A0
        add     dword [ebp-1CH], 1                      ; 2F7B _ 83. 45, E4, 01
?_153:  mov     eax, dword [ebp-1CH]                    ; 2F7F _ 8B. 45, E4
        cmp     eax, dword [ebp-24H]                    ; 2F82 _ 3B. 45, DC
        jl      ?_149                                   ; 2F85 _ 0F 8C, FFFFFF7A
        add     dword [ebp-34H], 1                      ; 2F8B _ 83. 45, CC, 01
?_154:  mov     eax, dword [ebp+8H]                     ; 2F8F _ 8B. 45, 08
        mov     eax, dword [eax+0CH]                    ; 2F92 _ 8B. 40, 0C
        cmp     eax, dword [ebp-34H]                    ; 2F95 _ 3B. 45, CC
        jge     ?_144                                   ; 2F98 _ 0F 8D, FFFFFEB0
        leave                                           ; 2F9E _ C9
        ret                                             ; 2F9F _ C3
; sheet_refresh_map End of function

init_time_port:; Function begin
        push    ebp                                     ; 2FA0 _ 55
        mov     ebp, esp                                ; 2FA1 _ 89. E5
        sub     esp, 24                                 ; 2FA3 _ 83. EC, 18
        mov     dword [esp+4H], 52                      ; 2FA6 _ C7. 44 24, 04, 00000034
        mov     dword [esp], 67                         ; 2FAE _ C7. 04 24, 00000043
        call    io_out8                                 ; 2FB5 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 156                     ; 2FBA _ C7. 44 24, 04, 0000009C
        mov     dword [esp], 64                         ; 2FC2 _ C7. 04 24, 00000040
        call    io_out8                                 ; 2FC9 _ E8, FFFFFFFC(rel)
        mov     dword [esp+4H], 46                      ; 2FCE _ C7. 44 24, 04, 0000002E
        mov     dword [esp], 64                         ; 2FD6 _ C7. 04 24, 00000040
        call    io_out8                                 ; 2FDD _ E8, FFFFFFFC(rel)
        mov     dword [timer_control], 0                ; 2FE2 _ C7. 05, 00000340(d), 00000000
        leave                                           ; 2FEC _ C9
        ret                                             ; 2FED _ C3
; init_time_port End of function

get_timer_control:; Function begin
        push    ebp                                     ; 2FEE _ 55
        mov     ebp, esp                                ; 2FEF _ 89. E5
        mov     eax, timer_control                      ; 2FF1 _ B8, 00000340(d)
        pop     ebp                                     ; 2FF6 _ 5D
        ret                                             ; 2FF7 _ C3
; get_timer_control End of function

timer_alloc:; Function begin
        push    ebp                                     ; 2FF8 _ 55
        mov     ebp, esp                                ; 2FF9 _ 89. E5
        sub     esp, 16                                 ; 2FFB _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 2FFE _ C7. 45, FC, 00000000
        jmp     ?_157                                   ; 3005 _ EB, 26

?_155:  mov     eax, dword [ebp-4H]                     ; 3007 _ 8B. 45, FC
        shl     eax, 4                                  ; 300A _ C1. E0, 04
        add     eax, timer_control                      ; 300D _ 05, 00000340(d)
        mov     eax, dword [eax+8H]                     ; 3012 _ 8B. 40, 08
        test    eax, eax                                ; 3015 _ 85. C0
        jnz     ?_156                                   ; 3017 _ 75, 10
        mov     eax, dword [ebp-4H]                     ; 3019 _ 8B. 45, FC
        shl     eax, 4                                  ; 301C _ C1. E0, 04
        add     eax, timer_control                      ; 301F _ 05, 00000340(d)
        add     eax, 4                                  ; 3024 _ 83. C0, 04
        jmp     ?_158                                   ; 3027 _ EB, 0D

?_156:  add     dword [ebp-4H], 1                       ; 3029 _ 83. 45, FC, 01
?_157:  cmp     dword [ebp-4H], 499                     ; 302D _ 81. 7D, FC, 000001F3
        jle     ?_155                                   ; 3034 _ 7E, D1
?_158:  leave                                           ; 3036 _ C9
        ret                                             ; 3037 _ C3
; timer_alloc End of function

timer_free:; Function begin
        push    ebp                                     ; 3038 _ 55
        mov     ebp, esp                                ; 3039 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 303B _ 8B. 45, 08
        mov     dword [eax+4H], 0                       ; 303E _ C7. 40, 04, 00000000
        pop     ebp                                     ; 3045 _ 5D
        ret                                             ; 3046 _ C3
; timer_free End of function

timer_init:; Function begin
        push    ebp                                     ; 3047 _ 55
        mov     ebp, esp                                ; 3048 _ 89. E5
        sub     esp, 4                                  ; 304A _ 83. EC, 04
        mov     eax, dword [ebp+10H]                    ; 304D _ 8B. 45, 10
        mov     byte [ebp-4H], al                       ; 3050 _ 88. 45, FC
        mov     eax, dword [ebp+8H]                     ; 3053 _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 3056 _ 8B. 55, 0C
        mov     dword [eax+8H], edx                     ; 3059 _ 89. 50, 08
        mov     eax, dword [ebp+8H]                     ; 305C _ 8B. 45, 08
        movzx   edx, byte [ebp-4H]                      ; 305F _ 0F B6. 55, FC
        mov     byte [eax+0CH], dl                      ; 3063 _ 88. 50, 0C
        leave                                           ; 3066 _ C9
        ret                                             ; 3067 _ C3
; timer_init End of function

timer_settime:; Function begin
        push    ebp                                     ; 3068 _ 55
        mov     ebp, esp                                ; 3069 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 306B _ 8B. 45, 08
        mov     edx, dword [ebp+0CH]                    ; 306E _ 8B. 55, 0C
        mov     dword [eax], edx                        ; 3071 _ 89. 10
        mov     eax, dword [ebp+8H]                     ; 3073 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 3076 _ C7. 40, 04, 00000002
        pop     ebp                                     ; 307D _ 5D
        ret                                             ; 307E _ C3
; timer_settime End of function

intHandlerTimer:; Function begin
        push    ebp                                     ; 307F _ 55
        mov     ebp, esp                                ; 3080 _ 89. E5
        sub     esp, 40                                 ; 3082 _ 83. EC, 28
        mov     dword [esp+4H], 96                      ; 3085 _ C7. 44 24, 04, 00000060
        mov     dword [esp], 32                         ; 308D _ C7. 04 24, 00000020
        call    io_out8                                 ; 3094 _ E8, FFFFFFFC(rel)
        mov     eax, dword [timer_control]              ; 3099 _ A1, 00000340(d)
        add     eax, 1                                  ; 309E _ 83. C0, 01
        mov     dword [timer_control], eax              ; 30A1 _ A3, 00000340(d)
        mov     byte [ebp-0DH], 0                       ; 30A6 _ C6. 45, F3, 00
        mov     dword [ebp-0CH], 0                      ; 30AA _ C7. 45, F4, 00000000
        jmp     ?_162                                   ; 30B1 _ E9, 000000B0

?_159:  mov     eax, dword [ebp-0CH]                    ; 30B6 _ 8B. 45, F4
        shl     eax, 4                                  ; 30B9 _ C1. E0, 04
        add     eax, timer_control                      ; 30BC _ 05, 00000340(d)
        mov     eax, dword [eax+8H]                     ; 30C1 _ 8B. 40, 08
        cmp     eax, 2                                  ; 30C4 _ 83. F8, 02
        jne     ?_160                                   ; 30C7 _ 0F 85, 0000008A
        mov     eax, dword [ebp-0CH]                    ; 30CD _ 8B. 45, F4
        shl     eax, 4                                  ; 30D0 _ C1. E0, 04
        add     eax, timer_control                      ; 30D3 _ 05, 00000340(d)
        mov     eax, dword [eax+4H]                     ; 30D8 _ 8B. 40, 04
        lea     edx, [eax-1H]                           ; 30DB _ 8D. 50, FF
        mov     eax, dword [ebp-0CH]                    ; 30DE _ 8B. 45, F4
        shl     eax, 4                                  ; 30E1 _ C1. E0, 04
        add     eax, timer_control                      ; 30E4 _ 05, 00000340(d)
        mov     dword [eax+4H], edx                     ; 30E9 _ 89. 50, 04
        mov     eax, dword [ebp-0CH]                    ; 30EC _ 8B. 45, F4
        shl     eax, 4                                  ; 30EF _ C1. E0, 04
        add     eax, timer_control                      ; 30F2 _ 05, 00000340(d)
        mov     eax, dword [eax+4H]                     ; 30F7 _ 8B. 40, 04
        test    eax, eax                                ; 30FA _ 85. C0
        jnz     ?_160                                   ; 30FC _ 75, 59
        mov     eax, dword [ebp-0CH]                    ; 30FE _ 8B. 45, F4
        shl     eax, 4                                  ; 3101 _ C1. E0, 04
        add     eax, timer_control                      ; 3104 _ 05, 00000340(d)
        mov     dword [eax+8H], 1                       ; 3109 _ C7. 40, 08, 00000001
        mov     eax, dword [ebp-0CH]                    ; 3110 _ 8B. 45, F4
        shl     eax, 4                                  ; 3113 _ C1. E0, 04
        add     eax, timer_control                      ; 3116 _ 05, 00000340(d)
        movzx   eax, byte [eax+10H]                     ; 311B _ 0F B6. 40, 10
        movzx   edx, al                                 ; 311F _ 0F B6. D0
        mov     eax, dword [ebp-0CH]                    ; 3122 _ 8B. 45, F4
        shl     eax, 4                                  ; 3125 _ C1. E0, 04
        add     eax, timer_control                      ; 3128 _ 05, 00000340(d)
        mov     eax, dword [eax+0CH]                    ; 312D _ 8B. 40, 0C
        mov     dword [esp+4H], edx                     ; 3130 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 3134 _ 89. 04 24
        call    fifo8_put                               ; 3137 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 313C _ 8B. 45, F4
        shl     eax, 4                                  ; 313F _ C1. E0, 04
        add     eax, timer_control                      ; 3142 _ 05, 00000340(d)
        lea     edx, [eax+4H]                           ; 3147 _ 8D. 50, 04
        mov     eax, dword [task_timer]                 ; 314A _ A1, 00000000(d)
        cmp     edx, eax                                ; 314F _ 39. C2
        jnz     ?_160                                   ; 3151 _ 75, 04
        mov     byte [ebp-0DH], 1                       ; 3153 _ C6. 45, F3, 01
?_160:  cmp     byte [ebp-0DH], 0                       ; 3157 _ 80. 7D, F3, 00
        jz      ?_161                                   ; 315B _ 74, 05
        call    task_switch                             ; 315D _ E8, FFFFFFFC(rel)
?_161:  add     dword [ebp-0CH], 1                      ; 3162 _ 83. 45, F4, 01
?_162:  cmp     dword [ebp-0CH], 499                    ; 3166 _ 81. 7D, F4, 000001F3
        jle     ?_159                                   ; 316D _ 0F 8E, FFFFFF43
        leave                                           ; 3173 _ C9
        ret                                             ; 3174 _ C3
; intHandlerTimer End of function

segment_descriptor:; Function begin
        push    ebp                                     ; 3175 _ 55
        mov     ebp, esp                                ; 3176 _ 89. E5
        cmp     dword [ebp+0CH], 1048575                ; 3178 _ 81. 7D, 0C, 000FFFFF
        jbe     ?_163                                   ; 317F _ 76, 10
        or      dword [ebp+14H], 8000H                  ; 3181 _ 81. 4D, 14, 00008000
        mov     eax, dword [ebp+0CH]                    ; 3188 _ 8B. 45, 0C
        shr     eax, 12                                 ; 318B _ C1. E8, 0C
        mov     dword [ebp+0CH], eax                    ; 318E _ 89. 45, 0C
?_163:  mov     eax, dword [ebp+0CH]                    ; 3191 _ 8B. 45, 0C
        mov     edx, eax                                ; 3194 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 3196 _ 8B. 45, 08
        mov     word [eax], dx                          ; 3199 _ 66: 89. 10
        mov     eax, dword [ebp+10H]                    ; 319C _ 8B. 45, 10
        mov     edx, eax                                ; 319F _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 31A1 _ 8B. 45, 08
        mov     word [eax+2H], dx                       ; 31A4 _ 66: 89. 50, 02
        mov     eax, dword [ebp+10H]                    ; 31A8 _ 8B. 45, 10
        sar     eax, 16                                 ; 31AB _ C1. F8, 10
        mov     edx, eax                                ; 31AE _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 31B0 _ 8B. 45, 08
        mov     byte [eax+4H], dl                       ; 31B3 _ 88. 50, 04
        mov     eax, dword [ebp+14H]                    ; 31B6 _ 8B. 45, 14
        mov     edx, eax                                ; 31B9 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 31BB _ 8B. 45, 08
        mov     byte [eax+5H], dl                       ; 31BE _ 88. 50, 05
        mov     eax, dword [ebp+0CH]                    ; 31C1 _ 8B. 45, 0C
        shr     eax, 16                                 ; 31C4 _ C1. E8, 10
        and     eax, 0FH                                ; 31C7 _ 83. E0, 0F
        mov     edx, eax                                ; 31CA _ 89. C2
        mov     eax, dword [ebp+14H]                    ; 31CC _ 8B. 45, 14
        sar     eax, 8                                  ; 31CF _ C1. F8, 08
        and     eax, 0FFFFFFF0H                         ; 31D2 _ 83. E0, F0
        or      eax, edx                                ; 31D5 _ 09. D0
        mov     edx, eax                                ; 31D7 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 31D9 _ 8B. 45, 08
        mov     byte [eax+6H], dl                       ; 31DC _ 88. 50, 06
        mov     eax, dword [ebp+10H]                    ; 31DF _ 8B. 45, 10
        shr     eax, 24                                 ; 31E2 _ C1. E8, 18
        mov     edx, eax                                ; 31E5 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 31E7 _ 8B. 45, 08
        mov     byte [eax+7H], dl                       ; 31EA _ 88. 50, 07
        pop     ebp                                     ; 31ED _ 5D
        ret                                             ; 31EE _ C3
; segment_descriptor End of function

task_init:; Function begin
        push    ebp                                     ; 31EF _ 55
        mov     ebp, esp                                ; 31F0 _ 89. E5
        push    ebx                                     ; 31F2 _ 53
        sub     esp, 36                                 ; 31F3 _ 83. EC, 24
        call    get_addr_gdt                            ; 31F6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-10H], eax                    ; 31FB _ 89. 45, F0
        mov     dword [esp+4H], 1168                    ; 31FE _ C7. 44 24, 04, 00000490
        mov     eax, dword [ebp+8H]                     ; 3206 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 3209 _ 89. 04 24
        call    memman_alloc_4k                         ; 320C _ E8, FFFFFFFC(rel)
        mov     dword [task_control], eax               ; 3211 _ A3, 00002288(d)
        mov     dword [ebp-14H], 0                      ; 3216 _ C7. 45, EC, 00000000
        jmp     ?_165                                   ; 321D _ E9, 0000009A

?_164:  mov     ecx, dword [task_control]               ; 3222 _ 8B. 0D, 00002288(d)
        mov     eax, dword [ebp-14H]                    ; 3228 _ 8B. 45, EC
        shl     eax, 4                                  ; 322B _ C1. E0, 04
        lea     edx, [eax*8]                            ; 322E _ 8D. 14 C5, 00000000
        sub     edx, eax                                ; 3235 _ 29. C2
        lea     eax, [ecx+edx]                          ; 3237 _ 8D. 04 11
        add     eax, 20                                 ; 323A _ 83. C0, 14
        mov     dword [eax], 0                          ; 323D _ C7. 00, 00000000
        mov     ebx, dword [task_control]               ; 3243 _ 8B. 1D, 00002288(d)
        mov     eax, dword [ebp-14H]                    ; 3249 _ 8B. 45, EC
        add     eax, 8                                  ; 324C _ 83. C0, 08
        lea     ecx, [eax*8]                            ; 324F _ 8D. 0C C5, 00000000
        mov     eax, dword [ebp-14H]                    ; 3256 _ 8B. 45, EC
        shl     eax, 4                                  ; 3259 _ C1. E0, 04
        lea     edx, [eax*8]                            ; 325C _ 8D. 14 C5, 00000000
        sub     edx, eax                                ; 3263 _ 29. C2
        lea     eax, [ebx+edx]                          ; 3265 _ 8D. 04 13
        add     eax, 16                                 ; 3268 _ 83. C0, 10
        mov     dword [eax], ecx                        ; 326B _ 89. 08
        mov     ecx, dword [task_control]               ; 326D _ 8B. 0D, 00002288(d)
        mov     eax, dword [ebp-14H]                    ; 3273 _ 8B. 45, EC
        shl     eax, 4                                  ; 3276 _ C1. E0, 04
        lea     edx, [eax*8]                            ; 3279 _ 8D. 14 C5, 00000000
        sub     edx, eax                                ; 3280 _ 29. C2
        lea     eax, [edx+10H]                          ; 3282 _ 8D. 42, 10
        add     eax, ecx                                ; 3285 _ 01. C8
        add     eax, 8                                  ; 3287 _ 83. C0, 08
        mov     edx, dword [ebp-14H]                    ; 328A _ 8B. 55, EC
        add     edx, 8                                  ; 328D _ 83. C2, 08
        lea     ecx, [edx*8]                            ; 3290 _ 8D. 0C D5, 00000000
        mov     edx, dword [ebp-10H]                    ; 3297 _ 8B. 55, F0
        add     edx, ecx                                ; 329A _ 01. CA
        mov     dword [esp+0CH], 137                    ; 329C _ C7. 44 24, 0C, 00000089
        mov     dword [esp+8H], eax                     ; 32A4 _ 89. 44 24, 08
        mov     dword [esp+4H], 103                     ; 32A8 _ C7. 44 24, 04, 00000067
        mov     dword [esp], edx                        ; 32B0 _ 89. 14 24
        call    segment_descriptor                      ; 32B3 _ E8, FFFFFFFC(rel)
        add     dword [ebp-14H], 1                      ; 32B8 _ 83. 45, EC, 01
?_165:  cmp     dword [ebp-14H], 1                      ; 32BC _ 83. 7D, EC, 01
        jle     ?_164                                   ; 32C0 _ 0F 8E, FFFFFF5C
        call    task_alloc                              ; 32C6 _ E8, FFFFFFFC(rel)
        mov     dword [ebp-0CH], eax                    ; 32CB _ 89. 45, F4
        mov     eax, dword [ebp-0CH]                    ; 32CE _ 8B. 45, F4
        mov     dword [eax+4H], 2                       ; 32D1 _ C7. 40, 04, 00000002
        mov     eax, dword [task_control]               ; 32D8 _ A1, 00002288(d)
        mov     dword [eax], 1                          ; 32DD _ C7. 00, 00000001
        mov     eax, dword [task_control]               ; 32E3 _ A1, 00002288(d)
        mov     dword [eax+4H], 0                       ; 32E8 _ C7. 40, 04, 00000000
        mov     eax, dword [task_control]               ; 32EF _ A1, 00002288(d)
        mov     edx, dword [ebp-0CH]                    ; 32F4 _ 8B. 55, F4
        mov     dword [eax+8H], edx                     ; 32F7 _ 89. 50, 08
        mov     eax, dword [ebp-0CH]                    ; 32FA _ 8B. 45, F4
        mov     eax, dword [eax]                        ; 32FD _ 8B. 00
        mov     dword [esp], eax                        ; 32FF _ 89. 04 24
        call    load_tr                                 ; 3302 _ E8, FFFFFFFC(rel)
        call    timer_alloc                             ; 3307 _ E8, FFFFFFFC(rel)
        mov     dword [task_timer], eax                 ; 330C _ A3, 00002284(d)
        mov     eax, dword [task_timer]                 ; 3311 _ A1, 00002284(d)
        mov     dword [esp+4H], 100                     ; 3316 _ C7. 44 24, 04, 00000064
        mov     dword [esp], eax                        ; 331E _ 89. 04 24
        call    timer_settime                           ; 3321 _ E8, FFFFFFFC(rel)
        mov     eax, dword [ebp-0CH]                    ; 3326 _ 8B. 45, F4
        add     esp, 36                                 ; 3329 _ 83. C4, 24
        pop     ebx                                     ; 332C _ 5B
        pop     ebp                                     ; 332D _ 5D
        ret                                             ; 332E _ C3
; task_init End of function

task_alloc:; Function begin
        push    ebp                                     ; 332F _ 55
        mov     ebp, esp                                ; 3330 _ 89. E5
        sub     esp, 16                                 ; 3332 _ 83. EC, 10
        mov     dword [ebp-8H], 0                       ; 3335 _ C7. 45, F8, 00000000
        jmp     ?_168                                   ; 333C _ E9, 000000F2

?_166:  mov     ecx, dword [task_control]               ; 3341 _ 8B. 0D, 00002288(d)
        mov     eax, dword [ebp-8H]                     ; 3347 _ 8B. 45, F8
        shl     eax, 4                                  ; 334A _ C1. E0, 04
        lea     edx, [eax*8]                            ; 334D _ 8D. 14 C5, 00000000
        sub     edx, eax                                ; 3354 _ 29. C2
        lea     eax, [ecx+edx]                          ; 3356 _ 8D. 04 11
        add     eax, 20                                 ; 3359 _ 83. C0, 14
        mov     eax, dword [eax]                        ; 335C _ 8B. 00
        test    eax, eax                                ; 335E _ 85. C0
        jne     ?_167                                   ; 3360 _ 0F 85, 000000C9
        mov     ecx, dword [task_control]               ; 3366 _ 8B. 0D, 00002288(d)
        mov     eax, dword [ebp-8H]                     ; 336C _ 8B. 45, F8
        shl     eax, 4                                  ; 336F _ C1. E0, 04
        lea     edx, [eax*8]                            ; 3372 _ 8D. 14 C5, 00000000
        sub     edx, eax                                ; 3379 _ 29. C2
        lea     eax, [edx+10H]                          ; 337B _ 8D. 42, 10
        add     eax, ecx                                ; 337E _ 01. C8
        mov     dword [ebp-4H], eax                     ; 3380 _ 89. 45, FC
        mov     eax, dword [ebp-4H]                     ; 3383 _ 8B. 45, FC
        mov     dword [eax+4H], 1                       ; 3386 _ C7. 40, 04, 00000001
        mov     eax, dword [ebp-4H]                     ; 338D _ 8B. 45, FC
        mov     dword [eax+2CH], 514                    ; 3390 _ C7. 40, 2C, 00000202
        mov     eax, dword [ebp-4H]                     ; 3397 _ 8B. 45, FC
        mov     dword [eax+30H], 0                      ; 339A _ C7. 40, 30, 00000000
        mov     eax, dword [ebp-4H]                     ; 33A1 _ 8B. 45, FC
        mov     dword [eax+34H], 0                      ; 33A4 _ C7. 40, 34, 00000000
        mov     eax, dword [ebp-4H]                     ; 33AB _ 8B. 45, FC
        mov     dword [eax+38H], 0                      ; 33AE _ C7. 40, 38, 00000000
        mov     eax, dword [ebp-4H]                     ; 33B5 _ 8B. 45, FC
        mov     dword [eax+3CH], 0                      ; 33B8 _ C7. 40, 3C, 00000000
        mov     eax, dword [ebp-8H]                     ; 33BF _ 8B. 45, F8
        add     eax, 1                                  ; 33C2 _ 83. C0, 01
        shl     eax, 9                                  ; 33C5 _ C1. E0, 09
        mov     edx, eax                                ; 33C8 _ 89. C2
        mov     eax, dword [ebp-4H]                     ; 33CA _ 8B. 45, FC
        mov     dword [eax+40H], edx                    ; 33CD _ 89. 50, 40
        mov     eax, dword [ebp-4H]                     ; 33D0 _ 8B. 45, FC
        mov     dword [eax+44H], 0                      ; 33D3 _ C7. 40, 44, 00000000
        mov     eax, dword [ebp-4H]                     ; 33DA _ 8B. 45, FC
        mov     dword [eax+48H], 0                      ; 33DD _ C7. 40, 48, 00000000
        mov     eax, dword [ebp-4H]                     ; 33E4 _ 8B. 45, FC
        mov     dword [eax+4CH], 0                      ; 33E7 _ C7. 40, 4C, 00000000
        mov     eax, dword [ebp-4H]                     ; 33EE _ 8B. 45, FC
        mov     dword [eax+50H], 0                      ; 33F1 _ C7. 40, 50, 00000000
        mov     eax, dword [ebp-4H]                     ; 33F8 _ 8B. 45, FC
        mov     dword [eax+5CH], 0                      ; 33FB _ C7. 40, 5C, 00000000
        mov     eax, dword [ebp-4H]                     ; 3402 _ 8B. 45, FC
        mov     dword [eax+60H], 0                      ; 3405 _ C7. 40, 60, 00000000
        mov     eax, dword [ebp-4H]                     ; 340C _ 8B. 45, FC
        mov     dword [eax+64H], 0                      ; 340F _ C7. 40, 64, 00000000
        mov     eax, dword [ebp-4H]                     ; 3416 _ 8B. 45, FC
        mov     dword [eax+68H], 0                      ; 3419 _ C7. 40, 68, 00000000
        mov     eax, dword [ebp-4H]                     ; 3420 _ 8B. 45, FC
        mov     dword [eax+6CH], 1073741824             ; 3423 _ C7. 40, 6C, 40000000
        mov     eax, dword [ebp-4H]                     ; 342A _ 8B. 45, FC
        jmp     ?_169                                   ; 342D _ EB, 13

?_167:  add     dword [ebp-8H], 1                       ; 342F _ 83. 45, F8, 01
?_168:  cmp     dword [ebp-8H], 1                       ; 3433 _ 83. 7D, F8, 01
        jle     ?_166                                   ; 3437 _ 0F 8E, FFFFFF04
        mov     eax, 0                                  ; 343D _ B8, 00000000
?_169:  leave                                           ; 3442 _ C9
        ret                                             ; 3443 _ C3
; task_alloc End of function

task_run:; Function begin
        push    ebp                                     ; 3444 _ 55
        mov     ebp, esp                                ; 3445 _ 89. E5
        mov     eax, dword [ebp+8H]                     ; 3447 _ 8B. 45, 08
        mov     dword [eax+4H], 2                       ; 344A _ C7. 40, 04, 00000002
        mov     eax, dword [task_control]               ; 3451 _ A1, 00002288(d)
        mov     edx, dword [task_control]               ; 3456 _ 8B. 15, 00002288(d)
        mov     edx, dword [edx]                        ; 345C _ 8B. 12
        mov     ecx, dword [ebp+8H]                     ; 345E _ 8B. 4D, 08
        mov     dword [eax+edx*4+8H], ecx               ; 3461 _ 89. 4C 90, 08
        mov     eax, dword [task_control]               ; 3465 _ A1, 00002288(d)
        mov     edx, dword [eax]                        ; 346A _ 8B. 10
        add     edx, 1                                  ; 346C _ 83. C2, 01
        mov     dword [eax], edx                        ; 346F _ 89. 10
        pop     ebp                                     ; 3471 _ 5D
        ret                                             ; 3472 _ C3
; task_run End of function

task_switch:; Function begin
        push    ebp                                     ; 3473 _ 55
        mov     ebp, esp                                ; 3474 _ 89. E5
        sub     esp, 24                                 ; 3476 _ 83. EC, 18
        mov     eax, dword [task_timer]                 ; 3479 _ A1, 00002284(d)
        mov     dword [esp+4H], 100                     ; 347E _ C7. 44 24, 04, 00000064
        mov     dword [esp], eax                        ; 3486 _ 89. 04 24
        call    timer_settime                           ; 3489 _ E8, FFFFFFFC(rel)
        mov     eax, dword [task_control]               ; 348E _ A1, 00002288(d)
        mov     eax, dword [eax]                        ; 3493 _ 8B. 00
        cmp     eax, 1                                  ; 3495 _ 83. F8, 01
        jle     ?_171                                   ; 3498 _ 7E, 51
        mov     eax, dword [task_control]               ; 349A _ A1, 00002288(d)
        mov     edx, dword [eax+4H]                     ; 349F _ 8B. 50, 04
        add     edx, 1                                  ; 34A2 _ 83. C2, 01
        mov     dword [eax+4H], edx                     ; 34A5 _ 89. 50, 04
        mov     eax, dword [task_control]               ; 34A8 _ A1, 00002288(d)
        mov     edx, dword [eax+4H]                     ; 34AD _ 8B. 50, 04
        mov     eax, dword [task_control]               ; 34B0 _ A1, 00002288(d)
        mov     eax, dword [eax]                        ; 34B5 _ 8B. 00
        cmp     edx, eax                                ; 34B7 _ 39. C2
        jnz     ?_170                                   ; 34B9 _ 75, 0C
        mov     eax, dword [task_control]               ; 34BB _ A1, 00002288(d)
        mov     dword [eax+4H], 0                       ; 34C0 _ C7. 40, 04, 00000000
?_170:  mov     eax, dword [task_control]               ; 34C7 _ A1, 00002288(d)
        mov     edx, dword [task_control]               ; 34CC _ 8B. 15, 00002288(d)
        mov     edx, dword [edx+4H]                     ; 34D2 _ 8B. 52, 04
        mov     eax, dword [eax+edx*4+8H]               ; 34D5 _ 8B. 44 90, 08
        mov     eax, dword [eax]                        ; 34D9 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 34DB _ 89. 44 24, 04
        mov     dword [esp], 0                          ; 34DF _ C7. 04 24, 00000000
        call    farjmp                                  ; 34E6 _ E8, FFFFFFFC(rel)
?_171:  leave                                           ; 34EB _ C9
        ret                                             ; 34EC _ C3
; task_switch End of function


SECTION .rodata align=1 noexecute                       ; section number 2, const

?_172:                                                  ; byte
        db 77H, 69H, 6EH, 64H, 6FH, 77H, 00H            ; 0000 _ window.

?_173:                                                  ; byte
        db 41H, 00H                                     ; 0007 _ A.

?_174:                                                  ; byte
        db 65H, 6EH, 74H, 65H, 72H, 20H, 74H, 61H       ; 0009 _ enter ta
        db 73H, 6BH, 20H, 62H, 00H                      ; 0011 _ sk b.

?_175:                                                  ; byte
        db 42H, 00H                                     ; 0016 _ B.

?_176:                                                  ; byte
        db 70H, 61H, 67H, 65H, 20H, 69H, 73H, 3AH       ; 0018 _ page is:
        db 20H, 00H                                     ; 0020 _  .

?_177:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 0022 _ BaseAddr
        db 4CH, 3AH, 20H, 00H                           ; 002A _ L: .

?_178:                                                  ; byte
        db 42H, 61H, 73H, 65H, 41H, 64H, 64H, 72H       ; 002E _ BaseAddr
        db 48H, 3AH, 20H, 00H                           ; 0036 _ H: .

?_179:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 4CH, 6FH       ; 003A _ lengthLo
        db 77H, 3AH, 20H, 00H                           ; 0042 _ w: .

?_180:                                                  ; byte
        db 6CH, 65H, 6EH, 67H, 74H, 68H, 48H, 69H       ; 0046 _ lengthHi
        db 67H, 68H, 3AH, 20H, 00H                      ; 004E _ gh: .

?_181:                                                  ; byte
        db 74H, 79H, 70H, 65H, 3AH, 20H, 00H            ; 0053 _ type: .


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

?_182:  db 00H                                          ; 02A2 _ .

?_183:  db 00H, 00H                                     ; 02A3 _ ..


SECTION .bss    align=32 noexecute                      ; section number 4, bss

sheet_control:                                          ; dword
        resd    1                                       ; 0000

back_sheet:                                             ; dword
        resd    1                                       ; 0004

mouse_sheet:                                            ; dword
        resd    1                                       ; 0008

timerinfo1.1709:                                        ; byte
        resb    24                                      ; 000C

timerbuf1.1712:                                         ; qword
        resq    1                                       ; 0024

timerinfo2.1710:                                        ; byte
        resb    24                                      ; 002C

timerbuf2.1713:                                         ; qword
        resq    1                                       ; 0044

timerinfo3.1711:                                        ; byte
        resb    24                                      ; 004C

timerbuf3.1714:                                         ; qword
        resq    1                                       ; 0064

task_a.1719:                                            ; dword
        resd    1                                       ; 006C

task_b.1720:                                            ; dword
        resd    4                                       ; 0070

tss_a.1718:                                             ; byte
        resb    128                                     ; 0080

screen_info:                                            ; qword
        resb    4                                       ; 0100

?_184:  resw    1                                       ; 0104

?_185:  resw    13                                      ; 0106

mouse_cursor_buf:                                       ; byte
        resb    256                                     ; 0120

back_buf: resd  1                                       ; 0220

sheet_win:                                              ; dword
        resd    1                                       ; 0224

mouse_x: resd   1                                       ; 0228

mouse_y: resd   1                                       ; 022C

mouse_send_info:                                        ; oword
        resb    16                                      ; 0230

keyinfo:                                                ; byte
        resb    32                                      ; 0240

keybuf:                                                 ; yword
        resb    32                                      ; 0260

mouseinfo:                                              ; byte
        resb    32                                      ; 0280

mousebuf:                                               ; byte
        resb    128                                     ; 02A0

str.1386:                                               ; byte
        resb    1                                       ; 0320

?_186:  resb    9                                       ; 0321

?_187:  resb    22                                      ; 032A

timer_control:                                          ; byte
        resd    2001                                    ; 0340

task_timer:                                             ; dword
        resd    1                                       ; 2284

task_control:                                           ; dword
        resd    1                                       ; 2288


